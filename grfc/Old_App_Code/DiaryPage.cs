using System;
using System.Collections.Generic;
using System.Data.OleDb;
using System.Linq;
using System.Web;
using System.Web.UI;

/// <summary>
/// Summary description for DiaryPage
/// </summary>
public class DiaryPage: Page
{
    protected AppService svc = new AppService();

    protected void WriteContacts(IEnumerable<Contact> contacts)
    {
        foreach (var contact in contacts)
        {
            Response.Write("<TR><TD CLASS='tablecontent'>" + contact.Title + "</TD>");
            Response.Write("<TD CLASS='tablecontent'>" + contact.Name + "</TD>");
            Response.Write("<TD CLASS='tablecontent'>" + contact.Phone + "</TD>");
            if (contact.Email != "")
            {
                Response.Write("<TD CLASS='tablecontent'><script><!-- ");
                Response.Write(Environment.NewLine);
                Response.Write("var name = '" + contact.Email + "' + '@' + domain;   document.write('<a href=\"mailto:' + name + '\" > ' + name + ' </a > ');");
                Response.Write(Environment.NewLine);
                Response.Write("// --><");
                Response.Write(@"/script></TD></TR>");
            }
            else
                Response.Write("<TD CLASS='tablecontent'></TD></TR>");
        }
    }

    protected void ShowDiaryPart(string partString, OleDbDataReader db)
    {
        var contentClass = db[partString + "HA"].ToString() == "H" ? "home" : "away";

        if ((bool)db[partString + "League"])
            contentClass += " league";

        var fixStr = db[partString + "Detail"];

        if (!string.IsNullOrEmpty(db[partString + "Link"].ToString()))
            fixStr = fixStr + "&nbsp;&nbsp;<A HREF='" + db[partString + "Link"] + "' TARGET='New'><IMG SRC='nav_images/info.gif' HEIGHT='16' WIDTH='16' ALIGN='absmiddle' onmouseover='this.T_WIDTH=200; return escape(moreinfo)' BORDER='0'></A>";

        if (db[partString + "Photos"].ToString() != "")
            fixStr = fixStr + "&nbsp;&nbsp;<A HREF='" + db[partString + "Photos"] + "' TARGET='New'><IMG SRC='nav_images/cam.gif' HEIGHT='11' WIDTH='15' ALIGN='absmiddle' onmouseover='this.T_WIDTH=220; return escape(photolink)' BORDER='0'></A>";

        if (db[partString + "Report"].ToString() != "")
            fixStr = fixStr + "&nbsp;&nbsp;<A HREF='" + db[partString + "Report"] + "' TARGET='New'><IMG SRC='nav_images/doc.jpg' HEIGHT='16' WIDTH='12' ALIGN='absmiddle'  onmouseover='this.T_WIDTH=200; return escape(matchreport)' BORDER='0'></A>";

        Response.Write("<TD CLASS='Fixture " + contentClass + "'>" + fixStr + "</TD>");

    }


    protected bool RenderDiaryRow(bool currDateUsed, List<string> partStrings, OleDbDataReader db)
    {
        var dateTime = (DateTime)db["Date"];
        var detailDateClass = "tablecontent";

        if (!currDateUsed && dateTime >= DateTime.Today)
        {
            detailDateClass = "tablecontent_curr";
            currDateUsed = true;
        }
        detailDateClass += " Fixture";
        Response.Write("<TR><TD CLASS='" + detailDateClass + "'>" + dateTime.ToShortDateString() + " " +
                       dateTime.DayOfWeek.ToString().Substring(0, 3) + "</TD>");

        foreach (var partString in partStrings)
        {
            ShowDiaryPart(partString, db);
        }

        Response.Write("<TD CLASS='tablecontent Fixture'>" + db["Rota"] + "</TD></TR>");
        return currDateUsed;
    }

    protected bool RenderCPDiaryRow(bool currDateUsed, OleDbDataReader db)
    {
        var dateTime = (DateTime)db["Date"];
        var cpDateClass = "tablecontent";

        if (!currDateUsed && dateTime >= DateTime.Today)
        {
            cpDateClass = "tablecontent_curr";
            currDateUsed = true;
        }

        Response.Write("<TR CLASS='Fixture'><TD CLASS='" + cpDateClass + "'>" + dateTime.ToShortDateString() + " " +
                       dateTime.DayOfWeek.ToString().Substring(0, 3) + "</TD>");

        string contentClass;
        if (db["FixtureCPHA"].ToString() == "H")
            contentClass = "home";
        else
            contentClass = "away";


        string fixStr = db["FixtureCPDetail"] + "&nbsp;<I>- starts after coaching. Contact Simon Davies for more details.</I>";


        if (db["FixtureCPPhotos"].ToString() != "")
        {
            fixStr = fixStr + "&nbsp;&nbsp;<A HREF='" + db["FixtureCPPhotos"] +
                     "' TARGET='New'><IMG SRC='nav_images/cam.gif' HEIGHT='11' WIDTH='15' ALIGN='absmiddle' onmouseover='this.T_WIDTH=220; return escape(photolink)' BORDER='0'></A>";
        }

        if (db["FixtureCPReport"].ToString() != "")
        {
            fixStr = fixStr + "&nbsp;&nbsp;<A HREF='" + db["FixtureCPReport"] +
                     "' TARGET='New'><IMG SRC='nav_images/doc.jpg' HEIGHT='16' WIDTH='12' ALIGN='absmiddle' onmouseover='this.T_WIDTH=200; return escape(matchreport)' BORDER='0'></A>";
        }

        Response.Write("<TD CLASS='" + contentClass + "' COLSPAN='9'><I>Coaches and Parents match:</I>&nbsp;v&nbsp;" +
                       fixStr + "</TD></TR>");
        return currDateUsed;
    }

    protected bool RenderSocialDiaryRow(bool currDateUsed, OleDbDataReader db, int ageGroupCount)
    {
        var dateTime = (DateTime)db["Date"];
        var dateClass = "tablecontent";
        if (!currDateUsed && dateTime >= DateTime.Today)
        {
            dateClass = "tablecontent_curr";
            currDateUsed = true;
        }
        var fixStr = "";
        if (db["FixtureSocialLink"].ToString() != "")
            fixStr = db["FixtureSocialDetail"] + "&nbsp;&nbsp;<A HREF='" + db["FixtureSocialLink"] +
                     "' TARGET='New'><IMG SRC='nav_images/info.gif' HEIGHT='16' WIDTH='16' ALIGN='absmiddle' onmouseover='this.T_WIDTH=200; return escape(moreinfo)' BORDER='0'></A>";
        else
            fixStr = db["FixtureSocialDetail"].ToString();


        if (db["FixtureSocialPhotos"].ToString() != "")
            fixStr = fixStr + "&nbsp;&nbsp;<A HREF='" + db["FixtureSocialPhotos"] +
                     "' TARGET='New'><IMG SRC='nav_images/cam.gif' HEIGHT='11' WIDTH='15' ALIGN='absmiddle' onmouseover='this.T_WIDTH=220; return escape(photolink)' BORDER='0'></A>";

        Response.Write("<TR><TD CLASS='Social'>" + dateTime.ToShortDateString() + " " +
                       dateTime.DayOfWeek.ToString().Substring(0, 3) + "</TD>");
        int colSpan = ageGroupCount + 1;
        Response.Write(String.Format("<TD CLASS='Social' COLSPAN='{1}'>{0}</TD></TR>", fixStr, colSpan));
        return currDateUsed;
    }

    protected void RenderDiary(OleDbDataReader db, List<string> partStrings)
    {
        var currDateUsed = false;
        while (db.Read())
        {
            if (db[partStrings.First() + "Detail"].ToString() != "")
            {
                currDateUsed = RenderDiaryRow(currDateUsed, partStrings, db);
            }

            if (db["FixtureCPDetail"].ToString() != "")
            {
                currDateUsed = RenderCPDiaryRow(currDateUsed, db);
            }

            if (db["FixtureSocialDetail"].ToString() != "")
            {
                currDateUsed = RenderSocialDiaryRow(currDateUsed, db, partStrings.Count);
            }
        }
    }

    protected OleDbDataReader GetDiaryReader()
    {
        return svc.GetDiaryReader();
    }

    protected IEnumerable<Contact> GetCommitteeContacts(string ageGroup)
    {
        return svc.GetCommitteeContacts(ageGroup);
    }

    protected IEnumerable<Contact> GetAgeGroupContacts(List<string> ageGroups)
    {
        return svc.GetAgeGroupContacts(ageGroups);
    }
}