﻿<%@ Page Title="" Language="C#" MasterPageFile="~/Site.master" AutoEventWireup="true" CodeFile="SocialDiary.aspx.cs" Inherits="admin_SocialDiary" %>

<%@ Register Src="~/admin/AdminToolbar.ascx" TagPrefix="uc1" TagName="AdminToolbar" %>


<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <uc1:AdminToolbar runat="server" ID="AdminToolbar" />
    <h1>Diary Edit</h1>
    <p>
        <asp:Label ID="Label1" runat="server" Text="Social" Font-Size="Large"></asp:Label>
    </p>

    <asp:GridView ID="DiaryGridView" runat="server" AutoGenerateColumns="False" 
        CssClass="EditGrid" 
        DataKeyNames="DiaryId" 
        OnRowCancelingEdit="DiaryGridView_RowCancelingEdit" 
        OnRowEditing="DiaryGridView_RowEditing" 
        OnRowUpdating="DiaryGridView_RowUpdating" SelectedRowStyle-CssClass="selected-row">
        <Columns>
            <asp:CommandField ShowEditButton="True" />
            <asp:BoundField DataField="FixtureDate" DataFormatString="{0:d}" 
                HeaderText="Date" />
            <asp:BoundField DataField="FixtureDetail" HeaderText="Detail" />
            <asp:BoundField DataField="FixtureLink" HeaderText="Link" />
            <asp:BoundField DataField="FixturePhotos" HeaderText="Photos" />
        </Columns>

<SelectedRowStyle CssClass="selected-row"></SelectedRowStyle>
    </asp:GridView>
<br />
<strong>Add a new date</strong> (note this adds across all age groups)<br />
Date:
<asp:TextBox ID="AddDateTextBox" runat="server" CssClass="date-picker"></asp:TextBox>
&nbsp;&nbsp;&nbsp;
<asp:Button ID="AddButton" runat="server" Text="Add" />
<br />
    <div></div>
</asp:Content>
