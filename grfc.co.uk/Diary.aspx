<%@ Page Title="" Language="C#" MasterPageFile="~/Site.master" AutoEventWireup="true" CodeFile="Diary.aspx.cs" Inherits="Diary" %>
<%@ Import Namespace="System.Collections.Generic" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <title>Guildfordians RFC - Diary</title>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
<P>
<B><I>Guildfordians RFC >> Club diary</I></B>
</P>

<P><A CLASS="heading" NAME="clubdiary">Club diary</A></P>
<P>

<FORM>

<TABLE CELLSPACING="1">
<TR>
    <TD CLASS="tablecontent">&nbsp;Home fixture&nbsp;</TD>
    <TD CLASS="tablecontent league">&nbsp;League fixture&nbsp;</TD>
<TD CLASS="away">&nbsp;Away fixture&nbsp;</TD><TD CLASS="away"><INPUT TYPE=CHECKBOX CHECKED NAME="FixtureSH" VALUE="Y" ONCLICK="DiaryChange('Fixture')"></TD><TD CLASS="tablecontent3">&nbsp;</TD>
<TD CLASS="Social">&nbsp;Social event&nbsp;</TD><TD CLASS="Social"><INPUT TYPE=CHECKBOX CHECKED NAME="SocialSH" VALUE="Y" ONCLICK="DiaryChange('Social')"></TD><TD CLASS="tablecontent3">&nbsp;</TD>
<TD CLASS="tablecontent4">&nbsp;Other events&nbsp;</TD><TD CLASS="tablecontent4"><INPUT TYPE=CHECKBOX CHECKED NAME="CoachSH" VALUE="Y" ONCLICK="DiaryChange('Coach')"></TD><TD>&nbsp;<I>Untick boxes to hide entries</I></TD>
</TR>
</TABLE>

</FORM>

</P>

<P><TABLE id="diary" WIDTH="100%" CELLSPACING="2">

<TR><TD CLASS="tableheading" WIDTH="100" ROWSPAN="2">Date</TD><TD CLASS="tableheading" WIDTH="">Minis</TD><TD CLASS="tableheading" WIDTH="" COLSPAN="5">Youth</TD><TD CLASS="tableheading" COLSPAN="1">Girls</TD><TD CLASS="tableheading" ROWSPAN="2" WIDTH="65">Rota</TD></TR>
<TR><TD CLASS="tableheading" WIDTH="">under 7 - under 12</TD><TD CLASS="tableheading" WIDTH="">under 13</TD><TD CLASS="tableheading" WIDTH="">under 14</TD><TD CLASS="tableheading" WIDTH="">under 15</TD><TD CLASS="tableheading" WIDTH="">under 16</TD><TD CLASS="tableheading" WIDTH="">under 17</TD><TD CLASS="tableheading" WIDTH=""></TD></TR>

<%
    using (var db = GetDiaryReader())
    {
        var partStrings = new List<string>() {"FixtureMinis","FixtureU13", "FixtureU14", "FixtureU15", "FixtureU16", "FixtureU17", "FixtureGU15"};
        RenderDiary(db, partStrings);
    }
%>

</TABLE></P>

<P><A  CLASS="static-link" HREF="#top">back to top</A></P>

<script language="JavaScript" type="text/javascript" src="includes/tooltip.js"></script>

</asp:Content>

