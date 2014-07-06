using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class admin_NewsEdit : System.Web.UI.Page
{
    private readonly AppService _svc = new AppService();

    protected void Page_Load(object sender, EventArgs e)
    {
        if ((!IsPostBack))
        {
            if (Request["id"] != null)
            {
                int newsId = Int32.Parse(Request["id"]);
                var news = _svc.GetNewsItem(newsId);
                TitleTextBox.Text = news.Headline;
                BodyTextBox.Text = news.Detail;
                if (news.DateArchived.HasValue) ArchiveDateTextBox.Text = news.DateArchived.Value.ToShortDateString();
            }
        }
    }
    protected void SaveButton_Click(object sender, EventArgs e)
    {
        // save and return
        int newsId = 0;
        if (Request["id"] != null)
        {
            newsId = Convert.ToInt32(Request["id"]);
        }
        DateTime? archiveDate = null;
        if (!String.IsNullOrWhiteSpace(ArchiveDateTextBox.Text))
        {
            DateTime d2;
            bool success = DateTime.TryParse(ArchiveDateTextBox.Text, out d2);
            if (success)
                archiveDate = d2;
        }
        _svc.SaveNews(newsId, TitleTextBox.Text, BodyTextBox.Text, archiveDate);

        Response.Redirect("News.aspx");
    }
}