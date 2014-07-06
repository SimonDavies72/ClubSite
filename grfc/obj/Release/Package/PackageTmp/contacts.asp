<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
   "http://www.w3.org/TR/html4/loose.dtd">

<html>
<head>

<title>Guildfordians RFC - Contacts</title>

<%
bannerType = "rugby"
%>

<!--#include virtual="includes/standardpage.inc"-->

<!-- text box starts here //-->

<DIV CLASS="textbox">

<P>
<B><I>Guildfordians RFC >> Contacts</I></B>
</P>

<P>
<A CLASS="static-link" HREF="contacts.asp#structure">Club structure</A>
<A CLASS="static-link" HREF="contacts.asp#committee">Committee</A>
<A CLASS="static-link" HREF="contacts.asp#age">Age group contacts</A>
<A CLASS="static-link" HREF="contacts.asp#other">Other contacts</A>
</P>

<P ALIGN="Center">
<I>President</I>: <B>Dr J M Cox</B><BR>
<I>Vice President</I>: <B>Robin Hughes</B>
</P>

<P><A CLASS="heading" NAME="structure">Club structure</A></P>

<P>
(Click image to view)</P>
<P>
<A HREF="structure.asp"><IMG SRC="nav_images/structure_small.jpg" BORDER="0"></A>
</P>

<P><A CLASS="heading" NAME="committee">Committee - 2013/14 season</A></P>

<P><TABLE WIDTH="100%" CELLSPACING="2">

<TR><TD CLASS="tableheading" WIDTH="38%">Title</TD><TD CLASS="tableheading" WIDTH="19%">Name</TD><TD CLASS="tableheading" WIDTH="15%">Telephone</TD><TD CLASS="tableheading">Email</TD></TR>

<%

On Error Resume Next

Set db = Server.CreateObject("ADODB.RecordSet")

adoDatabase = "App_Data/grfc.mdb"
sqlStr = "select Title,Photo,Name,Phone,Email from Contacts where AgeGroup='Committee' Order By ContactID"
conStr = "Provider=Microsoft.Jet.OLEDB.4.0;Data Source=" & Server.MapPath(adoDatabase) & ";Persist Security Info=False"

db.CursorLocation = adUseClient
db.Open sqlStr, conStr, adLockReadOnly, adCmdTable

If Err.number <> 0 then

	Response.Write("<SPAN CLASS='errormessage'>...Sorry - the contacts database is not currently available, please try again in a few minutes...</SPAN>")
	Set db = Nothing

Else
    renderContactRows(db)

    db.Close

    Response.Write("</TABLE></P><P><A  CLASS='static-link' HREF='contacts.asp#top'>back to top</A></P><P><A CLASS='heading' NAME='age'>Age group contacts - 2013/14 season</A></P><P><TABLE WIDTH='100%' CELLSPACING='2'><TR><TD CLASS='tableheading' WIDTH='38%'>Title</TD><TD  CLASS='tableheading'WIDTH='19%'>Name</TD><TD CLASS='tableheading' WIDTH='15%'>Telephone</TD><TD CLASS='tableheading'>Email</TD></TR>")

    sqlStr = "select Title,Photo,Name,Phone,Email from Contacts where AgeGroup='Micros' or AgeGroup='Minis' or AgeGroup='Youth' or AgeGroup='Girls' or AgeGroup='Senior' Order By ContactID"

    db.Open sqlStr, conStr, adLockReadOnly, adCmdTable

    renderContactRows(db)

    db.Close

    Response.Write("</TABLE></P><P><A  CLASS='static-link' HREF='contacts.asp#top'>back to top</A></P><P><A CLASS='heading' NAME='other'>Other contacts - 2013/14 season</A></P><P><TABLE WIDTH='100%' CELLSPACING='2'><TR><TD CLASS='tableheading' WIDTH='38%'>Title</TD><TD  CLASS='tableheading'WIDTH='19%'>Name</TD><TD CLASS='tableheading' WIDTH='15%'>Telephone</TD><TD CLASS='tableheading'>Email</TD></TR>")

    sqlStr = "select Title,Photo,Name,Phone,Email from Contacts where AgeGroup='Other' Order By ContactID"

    db.Open sqlStr, conStr, adLockReadOnly, adCmdTable

    renderContactRows(db)

    Set db = Nothing

End if


    Sub RenderContactRows(db)
        While not db.EOF
            Response.Write("<TR><TD CLASS='tablecontent'>" & db("Title") & "</TD>")
            if db("Photo") <> "" then
                if db("Photo") <> "none" then
                    Response.Write("<TD CLASS='tablecontent'><A HREF='photos\officials_photos\high_res\" & db("Photo") & "' TARGET='new'><IMG SRC='photos\officials_photos\" & db("Photo") & "' BORDER='0' onmouseover='this.T_WIDTH=200; return escape(enlarge)'></A>&nbsp;" & db("Name") & "</TD>")
                else
                    Response.Write("<TD CLASS='tablecontent'><IMG SRC='photos\officials_photos\grey.jpg'>&nbsp;" & db("Name") & "</TD>")
                end if
            else
                Response.Write("<TD CLASS='tablecontent'><IMG SRC='photos\officials_photos\shy.jpg'>&nbsp;" & db("Name") & "</TD>")
            end if

            Response.Write("<TD CLASS='tablecontent'>" & db("Phone") & "</TD>")

            if db("Email") <> "" then
                Response.Write("<TD CLASS='tablecontent'>" & chr(10) & "<script language=javascript type=""text/javascript"">" & chr(10) & "<!-- " & chr(10) & "var name = """ & db("Email") & """ + '@' + domain;" & chr(10) & "document.write('<a href=\""mailto:' + name + '\"">' + name + '</a>');" & chr(10) & "// -->" & chr(10) & "</script>" & chr(10) & " </TD></TR>")
            else
                Response.Write("<TD CLASS='tablecontent'></TD></TR>")
            end if

            db.MoveNext
        Wend
    End Sub
%>

</TABLE></P>

<P><A  CLASS="static-link" HREF="contacts.asp#top">back to top</A></P>

</DIV>

<script language="JavaScript" type="text/javascript" src="includes/tooltip.js"></script>

</body>

</html>