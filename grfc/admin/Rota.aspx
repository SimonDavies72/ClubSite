<%@ Page Title="" Language="C#" MasterPageFile="~/Site.master" AutoEventWireup="true" Inherits="admin_Rota" Codebehind="Rota.aspx.cs" %>

<%@ Register Src="~/admin/AdminToolbar.ascx" TagPrefix="uc1" TagName="AdminToolbar" %>


<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <uc1:AdminToolbar runat="server" ID="AdminToolbar" />
    <h1>Rota Edit</h1>
    <asp:GridView ID="RotaGridView" runat="server" EnableModelValidation="True" AutoGenerateColumns="False" CssClass="EditGrid" DataKeyNames="DiaryId" OnRowCancelingEdit="RotaGridView_RowCancelingEdit" OnRowEditing="RotaGridView_RowEditing" OnRowUpdating="RotaGridView_RowUpdating">
        <Columns>
            <asp:CommandField ShowEditButton="True"></asp:CommandField>
            <asp:BoundField DataField="Date" HeaderText="Date" ReadOnly="True"></asp:BoundField>
            <asp:BoundField DataField="Rota" HeaderText="Age Group"></asp:BoundField>
        </Columns>
    </asp:GridView>
</asp:Content>

