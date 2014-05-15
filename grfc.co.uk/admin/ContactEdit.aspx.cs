using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class admin_ContactEdit : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            var svc = new AppService();
            int contactId = Int32.Parse(Request["id"]);
            var contact = svc.GetContact(contactId);

            ContactLabel.Text = contact.ContactId.ToString();
            AgeGroupTextBox.Text = contact.AgeGroup;
            TitleTextBox.Text = contact.Title;
            PhotoTextBox.Text = contact.Photo;
            NameTextBox.Text = contact.Name;
            PhoneTextBox.Text = contact.Phone;
            EmailTextBox.Text = contact.Email;
            
        }
    }
    protected void CancelButton_Click(object sender, EventArgs e)
    {
        Response.Redirect("Contacts.aspx");
    }
    protected void SaveButton_Click(object sender, EventArgs e)
    {
        var svc = new AppService();
        int contactId = Int32.Parse(Request["id"]);

        var agegroup = AgeGroupTextBox.Text ;
        var title = TitleTextBox.Text    ;
        var photo = PhotoTextBox.Text    ;
        var name = NameTextBox.Text     ;
        var phone = PhoneTextBox.Text;
        var email = EmailTextBox.Text;

        svc.UpdateContact(contactId, agegroup, title, photo, name, phone, email);

        Response.Redirect("Contacts.aspx");
    }
}