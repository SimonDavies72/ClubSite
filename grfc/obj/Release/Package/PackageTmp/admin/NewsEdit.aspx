<%@ Page Title="News Edit" Language="C#" MasterPageFile="~/Site.master" AutoEventWireup="true" Inherits="admin_NewsEdit" ValidateRequest="false" Codebehind="NewsEdit.aspx.cs" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <script type="text/javascript" src="/Content/ckeditor/ckeditor.js"></script>
    <table>
    <tr><td>
        Headline:</td> <td>
                        <asp:TextBox ID="TitleTextBox" runat="server" Width="600px"></asp:TextBox></td>
    </tr>
    <tr>
        <td>
            Detail:</td>
        <td style="margin-left: 160px"> <asp:TextBox ID="BodyTextBox" runat="server" TextMode="MultiLine" Height="400px" Width="600px" ClientIDMode="Static" ></asp:TextBox></td>
    </tr>
    <tr>
        <td>
            Archive Date:</td>
        <td style="margin-left: 80px"> 
            <asp:TextBox ID="ArchiveDateTextBox" runat="server" CssClass="date-picker"></asp:TextBox>
        </td>
    </tr>
    <tr>
        <td>
            &nbsp;</td>
        <td style="margin-left: 80px"> 
            <asp:Button ID="SaveButton" runat="server" Text="Save" OnClick="SaveButton_Click" />&nbsp;or&nbsp;<a href="News.aspx">Cancel</a> </td>
    </tr>
        </table>
    <script>
        $(function() {
            CKEDITOR.replace('BodyTextBox');
        });
    </script>
</asp:Content>

