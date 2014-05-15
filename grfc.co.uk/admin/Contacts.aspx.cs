using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class admin_Contacts : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            RefreshGrid();
        }
    }

    private void RefreshGrid()
    {
        var svc = new AppService();
        var contacts = svc.GetContacts();
        ContactsGridView.DataSource = contacts;
        ContactsGridView.DataBind();
    }
}