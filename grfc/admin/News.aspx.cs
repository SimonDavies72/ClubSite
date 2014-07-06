using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class admin_News : System.Web.UI.Page
{
    AppService svc = new AppService();
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            BindData();
        }
    }

    private void BindData()
    {
        HeadlineGridView.DataSource = svc.GetNewsItems().OrderByDescending(n => n.DateCreated);
        HeadlineGridView.DataBind();
    }

    protected void HeadlineGridView_RowDeleting(object sender, GridViewDeleteEventArgs e)
    {
        int newsId = (int) HeadlineGridView.DataKeys[e.RowIndex].Value;
        svc.DeleteNews(newsId);
        BindData();
    }
}