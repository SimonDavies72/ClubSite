<%@ Page Title="" Language="C#" MasterPageFile="~/Site.master" AutoEventWireup="true" CodeBehind="Girls.aspx.cs" Inherits="Girls" %>
<%@ Import Namespace="System.Collections.Generic" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <title>Guildfordians RFC - Girls</title>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
<P>
<B><I>Guildfordians RFC >> Girls</I></B>
</P>

<P>
<A CLASS="static-link" HREF="#diary">Girls diary</A>
<A CLASS="static-link" HREF="#about">About Guildfordians Girls</A>
<A CLASS="static-link" HREF="#contacts">Girls contacts</A>
</P>

<P><A CLASS="heading" NAME="diary">Girls diary</A></P>

<P><I>NB. to view the diary for the whole club, including Coach development, see the <A HREF="diary.aspx">club diary</A> page</I></P>

<P>
<TABLE><TR><TD CLASS="home">Home fixture</TD><TD CLASS="tablecontent league">&nbsp;League fixture&nbsp;</TD><TD CLASS="away">Away fixture</TD><TD CLASS="Social">Social event</TD></TR></TABLE>
</P>

<P><TABLE WIDTH="100%" CELLSPACING="2">

<TR><TD CLASS="tableheading" WIDTH="100" ROWSPAN="2">Date</TD><TD CLASS="tableheading" >Girls</TD><TD CLASS="tableheading" ROWSPAN="2" WIDTH="65">Rota</TD></TR>
<TR><TD CLASS="tableheading">All ages</TD></TR>
    
<%
    using (var db = GetDiaryReader())
    {
        var partStrings = new List<string> { "FixtureGU15" };
        RenderDiary(db, partStrings);
    }
%>

</TABLE></P>

<P><A  CLASS="static-link" HREF="#top">back to top</A></P>

<P><A CLASS="heading" NAME="about">About Guildfordians Girls</A></P>

<P>The under 15's girls currently have coaching sessions alongside the main under 12's team, which enables them to get more experience of playing in a bigger team.</P>

<P><A  CLASS="static-link" HREF="#top">back to top</A></P>

<P><A CLASS="heading" NAME="contacts">Girls contacts</A></P>

<P><I>NB. for a full list of contacts including photos, see the <A HREF="contacts.asp">Contacts</A> page</I></P>

<P><TABLE WIDTH="100%" CELLSPACING="2">

<TR><TD CLASS="tableheading" COLSPAN="4">Committee</TD></TR>
<TR><TD CLASS="tableheading" WIDTH="38%">Title</TD><TD CLASS="tableheading" WIDTH="19%">Name</TD><TD CLASS="tableheading" WIDTH="15%">Telephone</TD><TD CLASS="tableheading">Email</TD></TR>
    
<%
    var contacts = GetCommitteeContacts("Girls");
    WriteContacts(contacts);
    
    Response.Write("</TABLE></P><P><TABLE WIDTH='100%' CELLSPACING='2'><TR><TD CLASS='tableheading' COLSPAN='4'>Age group contacts</TD></TR><TR><TD CLASS='tableheading' WIDTH='38%'>Title</TD><TD  CLASS='tableheading'WIDTH='19%'>Name</TD><TD CLASS='tableheading' WIDTH='15%'>Telephone</TD><TD CLASS='tableheading'>Email</TD></TR>");

    var contacts2 = GetAgeGroupContacts(new List<string>() {"Girls"});
    WriteContacts(contacts2);
%>

</TABLE></P>

<P><A  CLASS="static-link" HREF="#top">back to top</A></P>

<script language="JavaScript" type="text/javascript" src="includes/tooltip.js"></script> 

</asp:Content>

