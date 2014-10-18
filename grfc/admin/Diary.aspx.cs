using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class admin_Diary : System.Web.UI.Page
{
    AppService svc = new AppService();

    private AgeGroup AgeGroup
    {
        get { return (AgeGroup)Enum.Parse(typeof(AgeGroup), AgeGroupDropDownList.SelectedValue); }
    }

    protected void Page_Init(object sender, EventArgs e)
    {
        var items = new[]{
                new ListItem( "Minis", AgeGroup.Minis.ToString()),
                new ListItem( "U13", AgeGroup.U13.ToString()),
                new ListItem( "U14", AgeGroup.U14.ToString()),
                new ListItem( "U15", AgeGroup.U15.ToString()),
                new ListItem( "U16", AgeGroup.U16.ToString()),
                new ListItem( "U17", AgeGroup.U17.ToString()),
                new ListItem( "Girls", AgeGroup.GU15.ToString()),
            };
        AgeGroupDropDownList.Items.AddRange(items);

        if (!IsPostBack)
        {
            UpdateGridView();
        }
    }
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void DropDownList1_SelectedIndexChanged(object sender, EventArgs e)
    {
        UpdateGridView();
    }

    private void UpdateGridView()
    {
        DiaryGridView.EditIndex = -1;

        BindGrid();
    }

    private void BindGrid()
    {
        DiaryGridView.DataSource = svc.GetAgeGroupDiary(AgeGroup);
        DiaryGridView.DataBind();
    }

    protected void DiaryGridView_RowEditing(object sender, GridViewEditEventArgs e)
    {
        DiaryGridView.EditIndex = e.NewEditIndex;
        DiaryGridView.SelectedIndex = e.NewEditIndex;
        BindGrid();
    }
    protected void DiaryGridView_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
    {
        UpdateGridView();
    }
    protected void DiaryGridView_RowUpdating(object sender, GridViewUpdateEventArgs e)
    {
        int diaryId = (int) DiaryGridView.DataKeys[e.RowIndex].Value;
        var isLeague = ((CheckBox)DiaryGridView.Rows[e.RowIndex].Cells[2].Controls[0]).Checked;
        var checkBox = ((CheckBox) DiaryGridView.Rows[e.RowIndex].FindControl("CheckBox1"));
        var homeOrAway = checkBox.Checked ? "A" : "H";
        var detail = ((TextBox)DiaryGridView.Rows[e.RowIndex].Cells[4].Controls[0]).Text;
        var link = ((TextBox)DiaryGridView.Rows[e.RowIndex].Cells[5].Controls[0]).Text;
        var photos = ((TextBox)DiaryGridView.Rows[e.RowIndex].Cells[6].Controls[0]).Text;
        var report = ((TextBox)DiaryGridView.Rows[e.RowIndex].Cells[7].Controls[0]).Text;
        svc.UpdateDiaryFixture(diaryId, AgeGroup,
                               homeOrAway,
                               detail,
                               link,
                               photos,
                               report,
                               isLeague);

        UpdateGridView();
    }

    protected void AddButton_Click(object sender, EventArgs e)
    {
        if (!String.IsNullOrWhiteSpace(AddDateTextBox.Text))
        {
            DateTime newDate = DateTime.Parse(AddDateTextBox.Text);
            svc.AddDiaryDate(newDate);
        }
    
        UpdateGridView();
    }

    protected void DiaryGridView_RowDataBound(object sender, GridViewRowEventArgs e)
    {
        if (e.Row.RowType == DataControlRowType.DataRow)
	    {
		    DiaryFixture fixture = (DiaryFixture)e.Row.DataItem;
            if (fixture.IsSocial)
            {
                e.Row.Cells[4].Text = "(social)";
            }

	    }
    }
}