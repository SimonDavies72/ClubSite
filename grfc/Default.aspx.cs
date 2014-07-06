using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class _Default : System.Web.UI.Page
{
    AppService appService = new AppService();

    protected void Page_Load(object sender, EventArgs e)
    {

    }

    protected IEnumerable<NewsItem> GetNewsItems()
    {
        return appService.GetActiveNewsItems();
    }
}