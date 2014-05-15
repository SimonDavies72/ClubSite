using System;
using System.Collections.Generic;
using System.Configuration;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Login : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void Logon_Click(object sender, EventArgs e)
    {
    if (
            UserPass.Text == ConfigurationManager.AppSettings["AdminPassword"])
      {
          FormsAuthentication.RedirectFromLoginPage ("admin", false);
      }
      else
      {
          Msg.Text = "Incorrect. Please try again.";
      }
    }
}