using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Xml;
using System.Xml.Linq;

public partial class includes_NewsTicker : System.Web.UI.UserControl
{
    protected void Page_Load(object sender, EventArgs e)
    {
        // load and display news items from news_final.xml
        var x = XDocument.Load(Server.MapPath("/rss/news_final.xml"));

        var items = x.Element("rss")
                     .Element("channel")
                     .Elements("item")
                     .Select(i => new NewsTickerItem
                         {
                             Title = i.Element("title").Value,
                             NavigateUrl = i.Element("link").Value
                         });

        NewsRepeater.DataSource = items;
        NewsRepeater.DataBind();
    }
}

