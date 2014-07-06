<%@ Page Title="" Language="C#" MasterPageFile="~/Site.master" AutoEventWireup="true" CodeFile="Minis.aspx.cs" Inherits="Minis" %>
<%@ Import Namespace="System.Collections.Generic" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <title>Guildfordians RFC - Minis</title>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
<P>
<B><I>Guildfordians RFC >> Minis</I></B>
</P>

<P>
<A CLASS="static-link" HREF="#diary">Minis diary</A>
<A CLASS="static-link" HREF="#about">About Guildfordians Minis</A>
<A CLASS="static-link" HREF="#contacts">Minis contacts</A>
</P>

<P><A CLASS="heading" NAME="diary">Minis diary</A></P>

<P><I>NB. to view the diary for the whole club, including Coach development, see the <A HREF="diary.aspx">club diary</A> page</I></P>

<P>
<TABLE><TR><TD CLASS="home">Home fixture</TD><TD CLASS="tablecontent league">&nbsp;League fixture&nbsp;</TD><TD CLASS="away">Away fixture</TD><TD CLASS="Social">Social event</TD></TR></TABLE>
</P>

<P><TABLE WIDTH="100%" CELLSPACING="2">

<TR><TD CLASS="tableheading" WIDTH="100" ROWSPAN="2">Date</TD><TD CLASS="tableheading">Minis</TD><TD CLASS="tableheading" ROWSPAN="2" WIDTH="65">Rota</TD></TR>
<TR><TD CLASS="tableheading">under 7 - under 12</TD></TR>

<%
    using (var db = GetDiaryReader())
    {
        var partStrings = new List<string> { "FixtureMinis" };
        RenderDiary(db, partStrings);
    }
%>

</TABLE></P>

<P><A  CLASS="static-link" HREF="#top">back to top</A></P>

<P><A CLASS="heading" NAME="about">About Guildfordians Minis</A></P>

<P>The Minis consist of age groups Micros (Under 4s & Under 5s) to Under 12, with fixtures starting for the Under 7s. They play a version of Rugby based on the RFU Continuum, which is a well thought out programme that starts children playing New Image Rugby. U8's and below play TAG rugby, this is a fun, non-contact version of rugby that helps children develop running and catching skills and begin to understand the importance of working together as a team.</P>
<P>Gradually, as children grow and develop, more skills, contact and aspects of the game are introduced, these start when a player reaches the U9s. Over the next few seasons these elements of the game are built upon so that by the age of 12, children are playing a version of rugby that is much closer to the adult game.</P>
<P>We realise that the some children enjoy playing TAG rugby and do not want to move into the contact elements of the game, due to this we have a new age group, the TAG Group which children once they reach the U9s can join so that they can continue to enjoy rugby.</P>
<P>Click <A HREF="popup_lawguide.html" TARGET="new">here</A> for a simple guide to the rules.
</P>

<P><A  CLASS="static-link" HREF="#top">back to top</A></P>

<P><A CLASS="heading" NAME="contacts">Minis contacts</A></P>

<P><I>NB. for a full list of contacts including photos, see the <A HREF="contacts.asp">Contacts</A> page</I></P>

<TABLE WIDTH="100%" CELLSPACING="2">

<TR><TD CLASS="tableheading" COLSPAN="4">Committee</TD></TR>
<TR><TD CLASS="tableheading" WIDTH="38%">Title</TD><TD CLASS="tableheading" WIDTH="19%">Name</TD><TD CLASS="tableheading" WIDTH="15%">Telephone</TD><TD CLASS="tableheading">Email</TD></TR>

<%
    var contacts = GetCommitteeContacts("Minis");
    WriteContacts(contacts);
    
    Response.Write("</TABLE></P><P><TABLE WIDTH='100%' CELLSPACING='2'><TR><TD CLASS='tableheading' COLSPAN='4'>Age group contacts</TD></TR><TR><TD CLASS='tableheading' WIDTH='38%'>Title</TD><TD  CLASS='tableheading'WIDTH='19%'>Name</TD><TD CLASS='tableheading' WIDTH='15%'>Telephone</TD><TD CLASS='tableheading'>Email</TD></TR>");

    var contacts2 = GetAgeGroupContacts(new List<string>() {"Minis", "Micros"});
    WriteContacts(contacts2);
%>

</TABLE>
<P><A  CLASS="static-link" HREF="#top">back to top</A></P>

</asp:Content>

