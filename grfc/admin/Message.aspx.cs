using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class admin_Message : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            AppService svc = new AppService();
            var settings = svc.GetSiteSettings();
            if (settings != null && !String.IsNullOrEmpty(settings.SiteHeaderMessage))
            {
                MessageTextBox.Text = settings.SiteHeaderMessage;
            }
        }
    }
    protected void SaveButton_Click(object sender, EventArgs e)
    {
        AppService svc = new AppService();
        svc.SaveSiteMessage(MessageTextBox.Text);
    }
    protected void RemoveButton_Click(object sender, EventArgs e)
    {
        MessageTextBox.Text = String.Empty;
        AppService svc = new AppService();
        svc.ClearSiteMessage();
    }
}