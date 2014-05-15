<%@ Page Title="" Language="C#" MasterPageFile="~/Site.master" AutoEventWireup="true" CodeFile="Message.aspx.cs" Inherits="admin_Message" %>
<%@ Register TagPrefix="uc1" TagName="AdminToolbar" Src="~/admin/AdminToolbar.ascx" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
        <uc1:AdminToolbar runat="server" ID="AdminToolbar" />
    <h1>Site Message Edit</h1>
    Message:&nbsp;&nbsp;&nbsp;&nbsp; <asp:TextBox runat="server" id="MessageTextBox" Width="567px"></asp:TextBox>
        <br />
        <br />
        <asp:Button ID="RemoveButton" runat="server" OnClick="RemoveButton_Click" Text="Remove" />
&nbsp;&nbsp;&nbsp;
        <asp:Button ID="SaveButton" runat="server" OnClick="SaveButton_Click" Text="Save" />
</asp:Content>

