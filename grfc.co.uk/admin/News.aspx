<%@ Page Title="News Admin" Language="C#" MasterPageFile="~/Site.master" AutoEventWireup="true" CodeFile="News.aspx.cs" Inherits="admin_News" %>

<%@ Register Src="~/admin/AdminToolbar.ascx" TagPrefix="uc1" TagName="AdminToolbar" %>


<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <script type="text/javascript">
        function confirmDelete() {
            return confirm('Are you sure that you want to delete this item?');
        }

    </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <uc1:AdminToolbar runat="server" ID="AdminToolbar" />
    <h1>News Edit</h1>
    <a href="NewsEdit.aspx">Add a new item</a>
    <asp:GridView ID="HeadlineGridView" runat="server" AutoGenerateColumns="False" CssClass="EditGrid" DataKeyNames="id" OnRowDeleting="HeadlineGridView_RowDeleting">
        <Columns>
            <asp:HyperLinkField DataNavigateUrlFields="ID" DataNavigateUrlFormatString="NewsEdit.aspx?id={0}" Text="Edit"></asp:HyperLinkField>
            <asp:TemplateField ShowHeader="False">
                <ItemTemplate>
                    <asp:LinkButton ID="LinkButton1" runat="server" CausesValidation="False" CommandName="Delete" Text="Delete" OnClientClick="return confirmDelete();"></asp:LinkButton>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:BoundField DataField="id" HeaderText="Id" />
            <asp:BoundField DataField="headline" HeaderText="Headline" />
            <asp:BoundField DataField="datecreated" DataFormatString="{0:d}" HeaderText="Date Created" />
            <asp:BoundField DataField="datearchived" DataFormatString="{0:d}" HeaderText="Archive Date" />
        </Columns>
    </asp:GridView>
    
    <br />
    
</asp:Content>

