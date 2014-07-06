<%@ Page Title="" Language="C#" MasterPageFile="~/Site.master" AutoEventWireup="true" Inherits="admin_ContactEdit" Codebehind="ContactEdit.aspx.cs" %>
<%@ Register TagPrefix="uc1" TagName="AdminToolbar" Src="~/admin/AdminToolbar.ascx" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <uc1:AdminToolbar runat="server" ID="AdminToolbar" />
    <h1>Contact Edit</h1>
    <table>
        <tr>
            <td>ContactId</td>
            <td><asp:Label ID="ContactLabel" runat="server" Text="Label"></asp:Label></td>
        </tr><tr>
            <td>Age Group</td>
            <td><asp:TextBox ID="AgeGroupTextBox" runat="server"></asp:TextBox></td>
        </tr><tr>
            <td>Title</td>
            <td><asp:TextBox ID="TitleTextBox" runat="server"></asp:TextBox></td>
        </tr><tr>
            <td>Photo</td>
            <td><asp:TextBox ID="PhotoTextBox" runat="server"></asp:TextBox></td>
        </tr><tr>
            <td>Name</td>
            <td><asp:TextBox ID="NameTextBox" runat="server"></asp:TextBox></td>
        </tr><tr>
            <td>Phone</td>
            <td><asp:TextBox ID="PhoneTextBox" runat="server"></asp:TextBox></td>
        </tr> <tr>
            <td>Email</td>
            <td><asp:TextBox ID="EmailTextBox" runat="server"></asp:TextBox></td>
        </tr> 
    </table>

    <asp:Button ID="CancelButton" runat="server" Text="Cancel" OnClick="CancelButton_Click" />
&nbsp;&nbsp;&nbsp;
    <asp:Button ID="SaveButton" runat="server" Text="Save" OnClick="SaveButton_Click" />

</asp:Content>

