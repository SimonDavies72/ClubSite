<%@ Page Title="" Language="C#" MasterPageFile="~/Site.master" AutoEventWireup="true" CodeBehind="Contacts.aspx.cs" Inherits="grfc.Contacts" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <DIV CLASS="textbox">

<P>
<A CLASS="static-link" HREF="contacts.asp#committee">Committee</A>
<A CLASS="static-link" HREF="contacts.asp#age">Age group contacts</A>
<A CLASS="static-link" HREF="contacts.asp#other">Other contacts</A>
</P>

<P>
<I>President</I>: <B>Dr J M Cox</B><BR>
<I>Vice President</I>: <B>Robin Hughes</B>
</P>

<P><A CLASS="heading" NAME="committee">Committee - <%: ConfigurationManager.AppSettings["Season"] %> season</A></P>

<P><TABLE WIDTH="100%" CELLSPACING="2">

<TR><TD CLASS="tableheading" WIDTH="38%">Title</TD><TD CLASS="tableheading" WIDTH="19%">Name</TD><TD CLASS="tableheading" WIDTH="15%">Telephone</TD><TD CLASS="tableheading">Email</TD></TR>

<%
    
       
    var appService = new AppService();
    var committee = appService.GetAllCommitteeContacts();

    RenderContactRows(committee);

    Response.Write("</TABLE></P><P><A  CLASS='static-link' HREF='contacts.asp#top'>back to top</A></P><P><A CLASS='heading' NAME='age'>Age group contacts - ");
    Response.Write(ConfigurationManager.AppSettings["Season"]);
    Response.Write(" season</A></P><P><TABLE WIDTH='100%' CELLSPACING='2'><TR><TD CLASS='tableheading' WIDTH='38%'>Title</TD><TD  CLASS='tableheading'WIDTH='19%'>Name</TD><TD CLASS='tableheading' WIDTH='15%'>Telephone</TD><TD CLASS='tableheading'>Email</TD></TR>");

    RenderContactRows(appService.GetAllAgeGroupContacts());

    Response.Write("</TABLE></P><P><A  CLASS='static-link' HREF='contacts.asp#top'>back to top</A></P><P><A CLASS='heading' NAME='other'>Other contacts - ");
    Response.Write(ConfigurationManager.AppSettings["Season"]);
    Response.Write(" season</A></P><P><TABLE WIDTH='100%' CELLSPACING='2'><TR><TD CLASS='tableheading' WIDTH='38%'>Title</TD><TD  CLASS='tableheading'WIDTH='19%'>Name</TD><TD CLASS='tableheading' WIDTH='15%'>Telephone</TD><TD CLASS='tableheading'>Email</TD></TR>");

    RenderContactRows(appService.GetOtherContacts());

%>

</TABLE></P>

<P><A  CLASS="static-link" HREF="contacts.asp#top">back to top</A></P>

</DIV>


</asp:Content>
