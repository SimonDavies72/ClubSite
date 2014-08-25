<%@ Page Title="" Language="C#" MasterPageFile="~/Site.master" AutoEventWireup="true" CodeBehind="Youth.aspx.cs" Inherits="YouthPage" %>
<%@ Import Namespace="System.Collections.Generic" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <title>Guildfordians RFC - Youth</title>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
<P>
<B><I>Guildfordians RFC >> Youth</I></B>
</P>

<P>
<A CLASS="static-link" HREF="#diary">Youth diary</A>
<A CLASS="static-link" HREF="#about">About Guildfordians Youth</A>
<A CLASS="static-link" HREF="#contacts">Youth contacts</A>
</P>

<P><A CLASS="heading" NAME="diary">Youth diary</A></P>

<P><I>NB. to view the diary for the whole club, including Coach development, see the <A HREF="diary.aspx">club diary</A> page</I></P>

<P>
<TABLE><TR><TD CLASS="home">Home fixture</TD><TD CLASS="tablecontent league">&nbsp;League fixture&nbsp;</TD><TD CLASS="away">Away fixture</TD><TD CLASS="Social">Social event</TD></TR></TABLE>
</P>

<P><TABLE WIDTH="100%" CELLSPACING="2">

<TR><TD CLASS="tableheading" WIDTH="100" ROWSPAN="2">Date</TD><TD CLASS="tableheading" COLSPAN="5">Youth</TD><TD CLASS="tableheading" ROWSPAN="2" WIDTH="65">Rota</TD></TR>
<TR><TD CLASS="tableheading">under 13</TD><TD CLASS="tableheading">under 14</TD><TD CLASS="tableheading">under 15</TD><TD CLASS="tableheading">under 16</TD><TD CLASS="tableheading">under 17</TD></TR>

<%
    using (var db = GetDiaryReader())
    {
        var partStrings = new List<string> { "FixtureU13", "FixtureU14", "FixtureU15", "FixtureU16", "FixtureU17"};
        RenderDiary(db, partStrings);
    }
%>

</TABLE></P>

<P><A  CLASS="static-link" HREF="#top">back to top</A></P>

<P><A CLASS="heading" NAME="about">About Guildfordians Youth</A></P>
<P><A HREF="photos/high_res/u14_0506.jpg" TARGET="new"><IMG SRC="photos/u14_0506_lowres.jpg" HEIGHT="120" WIDTH="200" ALT="Under 14s" BORDER="0"></A>&nbsp;<A HREF="photos/high_res/u1516_0506.jpg" TARGET="new"><IMG SRC="photos/u1516_0506_lowres.jpg" HEIGHT="120" WIDTH="254" ALT="Under 15s & under 16s" BORDER="0"></A></P>

<P>
<B>The Colts team</B><BR>
Cranfordians Colts is an amalgamation of the Guildfordians U18s plus Cranleigh's U17s & U18s. We aim to offer as much playing time as possible, especially to those who get precious little opportunity at school or college. We are entered into Surrey U18s League 3 & hope to make our presence felt against the likes of Haslemere, Mitcham & Weybridge. New players are always welcome & anyone interested should contact the Colts Coach (see below for details).
</P>

<P><A  CLASS="static-link" HREF="#top">back to top</A></P>

<P><A CLASS="heading" NAME="contacts">Contacts for Guildfordians Youth</A></P>

<P><I>NB. for a full list of contacts including photos, see the <A HREF="contacts.cshtml">Contacts</A> page</I></P>

<P><TABLE WIDTH="100%" CELLSPACING="2">

<TR><TD CLASS="tableheading" COLSPAN="4">Committee</TD></TR>
<TR><TD CLASS="tableheading" WIDTH="38%">Title</TD><TD CLASS="tableheading" WIDTH="19%">Name</TD><TD CLASS="tableheading" WIDTH="15%">Telephone</TD><TD CLASS="tableheading">Email</TD></TR>
   
<%
    var contacts = GetCommitteeContacts("Youth");
    WriteContacts(contacts);

    Response.Write("</TABLE></P><P><TABLE WIDTH='100%' CELLSPACING='2'><TR><TD CLASS='tableheading' COLSPAN='4'>Age group contacts</TD></TR><TR><TD CLASS='tableheading' WIDTH='38%'>Title</TD><TD  CLASS='tableheading'WIDTH='19%'>Name</TD><TD CLASS='tableheading' WIDTH='15%'>Telephone</TD><TD CLASS='tableheading'>Email</TD></TR>");

    var contacts2 = GetAgeGroupContacts(new List<string> {"Youth"});
    WriteContacts(contacts2);
%>

</TABLE></P>

<P><A  CLASS="static-link" HREF="#top">back to top</A></P>

<script language="JavaScript" type="text/javascript" src="includes/tooltip.js"></script> 

</asp:Content>

