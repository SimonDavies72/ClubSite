using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace grfc
{
    public partial class Contacts : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            
        }

        protected void RenderContactRows(IEnumerable<Contact> contacts)
        {
            foreach(Contact db in contacts)
            {
                Response.Write("<TR><TD CLASS='tablecontent'>" + db.Title + "</TD>");
                if (db.Photo != "") {
                    if (db.Photo != "none")
                    {
                        Response.Write("<TD CLASS='tablecontent'><A HREF='photos/officials_photos/high_res/" );
                        Response.Write(db.Photo);
                        Response.Write ("' TARGET='new'><IMG SRC='photos/officials_photos/" + db.Photo + "' BORDER='0' onmouseover='this.T_WIDTH=200; return escape(enlarge)'></A>&nbsp;" );
                        Response.Write( db.Name);
                        Response.Write("</TD>");
                    }
                    else
                    {
                        this.Response.Write("<TD CLASS='tablecontent'><IMG SRC='photos/officials_photos/grey.jpg'>&nbsp;");
                        Response.Write(db.Name);
                        Response.Write("</TD>");
                    }
                }
                else
                {
                    Response.Write("<TD CLASS='tablecontent'><IMG SRC='photos/officials_photos/shy.jpg'>&nbsp;" + db.Name + "</TD>");
                }

            Response.Write("<TD CLASS='tablecontent'>" + db.Phone + "</TD>");

            if (db.Email != "") {
                Response.Write("<TD CLASS='tablecontent'>" + Environment.NewLine + "<script language=javascript type='text/javascript'>var name = '" + db.Email + "@' + domain;");
                Response.Write(Environment.NewLine + @"document.write('<a href=\""mailto:' + name + '"">' + name + '</a>');");
                Response.Write(Environment.NewLine + "</script></TD></TR>");
            }
            else
                Response.Write("<TD CLASS='tablecontent'></TD></TR>");
            
            }
        }
    }
}