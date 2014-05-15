using System;
using System.Collections.Generic;
using System.Configuration;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Site : System.Web.UI.MasterPage
{
    protected void Page_Init(object sender, EventArgs e)
    {
        var svc = new AppService();
        var message = svc.GetSiteSettings();
        if (!String.IsNullOrEmpty(message.SiteHeaderMessage))
        {
            AlertLabel.Visible = true;
            AlertLabel.Text = message.SiteHeaderMessage;
        }
    }
    protected void Page_Load(object sender, EventArgs e)
    {

    }
}
