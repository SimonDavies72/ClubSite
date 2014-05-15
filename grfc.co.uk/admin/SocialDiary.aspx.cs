using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class admin_SocialDiary : System.Web.UI.Page
{
    AppService svc = new AppService();

    private AgeGroup AgeGroup
    {
        get { return AgeGroup.Social; }
    }

    protected void Page_Init(object sender, EventArgs e)
    {
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
        DiaryGridView.DataSource = svc.GetSocialDiary();
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
        var detail = ((TextBox)DiaryGridView.Rows[e.RowIndex].Cells[2].Controls[0]).Text;
        var link = ((TextBox)DiaryGridView.Rows[e.RowIndex].Cells[3].Controls[0]).Text;
        var photos = ((TextBox)DiaryGridView.Rows[e.RowIndex].Cells[4].Controls[0]).Text;
        svc.UpdateSocialDiaryFixture(diaryId,
                               detail,
                               link,
                               photos);

        UpdateGridView();
    }
}