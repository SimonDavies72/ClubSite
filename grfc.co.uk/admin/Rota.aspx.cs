using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class admin_Rota : System.Web.UI.Page
{
    private AppService appService = new AppService();

    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            RebindGrid();
        }
    }

    private void RebindGrid()
    {
        RotaGridView.DataSource = appService.GetRota();
        RotaGridView.DataBind();
    }

    protected void RotaGridView_RowEditing(object sender, GridViewEditEventArgs e)
    {
        RotaGridView.EditIndex = e.NewEditIndex;
        RebindGrid();
    }

    protected void RotaGridView_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
    {
        RotaGridView.EditIndex = -1;
        RebindGrid();
    }

    protected void RotaGridView_RowUpdating(object sender, GridViewUpdateEventArgs e)
    {
        int diaryId = (int) RotaGridView.DataKeys[e.RowIndex].Value;
        var rota = ((TextBox)RotaGridView.Rows[e.RowIndex].Cells[2].Controls[0]).Text;

        appService.UpdateRota(diaryId, rota);
        RotaGridView.EditIndex = -1;
        RebindGrid();
    }
}