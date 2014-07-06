<%@ Page Title="" Language="C#" MasterPageFile="~/Site.master" AutoEventWireup="true" Inherits="admin_Contacts" Codebehind="Contacts.aspx.cs" %>
<%@ Register TagPrefix="uc1" TagName="AdminToolbar" Src="~/admin/AdminToolbar.ascx" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <uc1:AdminToolbar runat="server" ID="AdminToolbar" />
    <h1>Contacts</h1>
    <asp:GridView ID="ContactsGridView" runat="server" EnableModelValidation="True">
        <Columns>
            <asp:HyperLinkField DataNavigateUrlFields="ContactId" DataNavigateUrlFormatString="ContactEdit.aspx?id={0}" Text="Edit" />
        </Columns>
        
    </asp:GridView>

</asp:Content>

