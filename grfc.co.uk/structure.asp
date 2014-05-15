<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
   "http://www.w3.org/TR/html4/loose.dtd">

<HTML>
<HEAD>

<TITLE>Guildfordians RFC</TITLE>

<!--#include virtual="includes/standardpage.inc"-->

<!-- text box starts here //-->

<DIV CLASS="textbox">

<P>

<B><I>Guildfordians RFC >> Contacts >> Club structure</I></B></A>

</P>

<!-- <P><A CLASS="heading" NAME="image">Structure showing relationships</A></P> //-->
<!-- <P>(Click image to view)</P> //-->
<!-- <P><A HREF="popup_structuremap.html" TARGET="new"><IMG SRC="nav_images/structure_small.jpg" BORDER="0"></A></P> //-->

<P><A CLASS="heading" NAME="links">Structure showing post holders</A></P>

<P>
(Click name to email)</P>

<%
On Error Resume Next

Set db = Server.CreateObject("ADODB.RecordSet")

adoDatabase = "App_Data/grfc.mdb"

sqlStr = "select Name,Email from Contacts where AgeGroup='Committee' Order By ContactID"
conStr = "Provider=Microsoft.Jet.OLEDB.4.0;Data Source=" & Server.MapPath(adoDatabase) & ";Persist Security Info=False"
db.CursorLocation = adUseClient
db.Open sqlStr, conStr, adLockReadOnly, adCmdTable

If Err.number <> 0 then

	Response.Write("<SPAN CLASS='errormessage'>…The contact database is not currently available (the names will be missing), please try again in a few minutes...</SPAN>")
	Set db = Nothing
End if

%>

<TABLE WIDTH="100%" CELLPADDING="0" CELLSPACING="0" BORDER="0">

<TR>
<TD WIDTH="7"></TD>
<TD WIDTH="40"></TD>
<TD WIDTH="40"></TD>
<TD WIDTH="5"></TD>
<TD WIDTH="7"></TD>
<TD WIDTH="40"></TD>
<TD WIDTH="40"></TD>
<TD WIDTH="5"></TD>
<TD WIDTH="7"></TD>
<TD WIDTH="40"></TD>
<TD WIDTH="40"></TD>
<TD WIDTH="5"></TD>
<TD WIDTH="7"></TD>
<TD WIDTH="40"></TD>
<TD WIDTH="40"></TD>
<TD WIDTH="5"></TD>
<TD WIDTH="7"></TD>
<TD WIDTH="40"></TD>
<TD WIDTH="40"></TD>
<TD WIDTH="5"></TD>
<TD WIDTH="7"></TD>
<TD WIDTH="40"></TD>
<TD WIDTH="40"></TD>
<TD WIDTH="5"></TD>
<TD WIDTH="7"></TD>
<TD WIDTH="40"></TD>
<TD WIDTH="40"></TD>
<TD WIDTH="5"></TD>
<TD WIDTH="7"></TD>
<TD WIDTH="40"></TD>
<TD WIDTH="40"></TD>
<TD WIDTH="5"></TD>
<TD WIDTH="7"></TD>
<TD WIDTH="40"></TD>
<TD WIDTH="40"></TD>
<TD WIDTH="5"></TD>
<TD WIDTH="7"></TD>
<TD WIDTH="40"></TD>
<TD WIDTH="40"></TD>
<TD WIDTH="5"></TD>
</TR>

<TR>
<TD COLSPAN="17"></TD>

	<%
	title = "Club Chairman"
	emailaddr = "club.chairman"
	call WriteContactName
	%>

<TD CLASS="structurelineB"></TD>
<TD COLSPAN="20"></TD>
</TR>

<TR><TD COLSPAN="19" HEIGHT="10"></TD><TD CLASS="structurelineB" HEIGHT="10"></TD><TD CLASS="structurelineBL" HEIGHT="10"></TD><TD COLSPAN="19" HEIGHT="10"></TD></TR> <!-- spacer row //-->

<TR>
<TD COLSPAN="17"></TD>

	<%
	title = "Club Secretary"
	emailaddr = "club.secretary"
	call WriteContactName
	%>

<TD></TD>
<TD CLASS="structurelineL"></TD>

	<%
	title = "OGAC Ambassador"
	emailaddr = "n/a"
	call WriteContactName
	%>

<TD COLSPAN="17"></TD>
</TR>


<TR><TD COLSPAN="19" HEIGHT="10"></TD><TD CLASS="structurelineB" HEIGHT="10"></TD><TD CLASS="structurelineBL" HEIGHT="10"></TD><TD COLSPAN="19" HEIGHT="10"></TD></TR> <!-- spacer row //-->

<TR>
<TD COLSPAN="17"></TD>

	<%
	title = "Hon. Treasurer"
	emailaddr = "club.treasurer"
	call WriteContactName
	%>

<TD></TD>
<TD CLASS="structurelineL"></TD>

	<%
	title = "Old Boys Ambassador"
	emailaddr = "n/a"
	call WriteContactName
	%>

<TD COLSPAN="17"></TD>
</TR>

<TR><TD COLSPAN="20" HEIGHT="10"></TD><TD CLASS="structurelineL" COLSPAN="20" HEIGHT="10"></TD></TR> <!-- spacer row //-->

<TR>
<TD COLSPAN="6"></TD>
<TD CLASS="structurelineB" COLSPAN="32"></TD>
<TD COLSPAN="2"></TD>
</TR>

<TR>
<TD COLSPAN="6" HEIGHT="10"></TD>
<TD CLASS="structurelineL" COLSPAN="8"></TD>
<TD CLASS="structurelineL" COLSPAN="8"></TD>
<TD CLASS="structurelineL" COLSPAN="8"></TD>
<TD CLASS="structurelineL" COLSPAN="4"></TD>
<TD CLASS="structurelineL" COLSPAN="4"></TD>
<TD CLASS="structurelineL" COLSPAN="2"></TD>
</TR>

<TR>
<TD CLASS="structurelineB" COLSPAN="5"></TD>

	<%
	title = "Director of Rugby (Junior)"
	emailaddr = "junior.director.rugby"
	call WriteContactName
	%>

<TD CLASS="structurelineB" COLSPAN="3"></TD>
<TD COLSPAN="3"></TD>

	<%
	title = "Director of Rugby (Senior)"
	emailaddr = "senior.director.rugby"
	call WriteContactName
	%>

<TD CLASS="structurelineB" COLSPAN="3"></TD>
<TD COLSPAN="3"></TD>

	<%
	title = "Income/Marketing Manager"
	emailaddr = "marketing"
	call WriteContactName
	%>

<TD CLASS="structurelineB"></TD>
<TD COLSPAN="4"></TD>
<TD CLASS="structurelineB"></TD>
<TD COLSPAN="2" CLASS="structurecontent3">Welfare</TD>
<TD></TD>
<TD CLASS="structurelineB"></TD>

	<%
	title = "Recruitment Manager"
	emailaddr = "recruitment"
	call WriteContactName
	%>

<TD></TD>
<TD CLASS="structurelineB"></TD>
<TD COLSPAN="2" CLASS="structurecontent3">Finance</TD>
<TD></TD>
</TR>

<TR>
<TD CLASS="structurelineBL" HEIGHT="10"></TD>
<TD COLSPAN="5"></TD>
<TD CLASS="structurelineL" COLSPAN="4"></TD>
<TD CLASS="structurelineL" COLSPAN="4"></TD>
<TD CLASS="structurelineL" COLSPAN="4"></TD>
<TD CLASS="structurelineL" COLSPAN="5"></TD>
<TD CLASS="structurelineB"></TD>
<TD CLASS="structurelineBL"></TD>
<TD COLSPAN="3"></TD>
<TD CLASS="structurelineBL"></TD>
<TD COLSPAN="3"></TD>
<TD CLASS="structurelineBL"></TD>
<TD COLSPAN="3"></TD>
<TD CLASS="structurelineBL"></TD>
<TD COLSPAN="3"></TD>
</TR>

<TR>
<TD CLASS="structurelineL"></TD>
<TD COLSPAN="2" CLASS="structurecontent1"><I>Age group Head Coaches</I></TD>
<TD></TD>
<TD CLASS="structurelineB"></TD>

	<%
	title = "Chairman (Mini)"
	emailaddr = "mini.chairman"
	call WriteContactName
	%>

<TD></TD>
<TD CLASS="structurelineB"></TD>

	<%
	title = "Chairman (Youth)"
	emailaddr = "youth.chairman"
	call WriteContactName
	%>

<TD COLSPAN="2"></TD>
<TD COLSPAN="2" CLASS="structurecontent1"><I>Senior Team Captains</I></TD>
<TD></TD>
<TD CLASS="structurelineB"></TD>

	<%
	title = "Chairman (Senior)"
	emailaddr = "senior.chairman"
	call WriteContactName
	%>

<TD COLSPAN="2"></TD>


	<%
	title = "Sponsorship Manager"
	emailaddr = "sponsorship"
	call WriteContactName
	%>

<TD></TD>
<TD CLASS="structurelineL"></TD>

	<%
	title = "Membership Secretary"
	emailaddr = "membership"
	call WriteContactName
	%>

<TD></TD>
<TD CLASS="structurelineL"></TD>

	<%
	title = "First Aid Officer"
	emailaddr = "safety"
	call WriteContactName
	%>

<TD></TD>
<TD CLASS="structurelineL"></TD>

	<%
	title = "Parental Liaison Officer"
	emailaddr = "parental.liaison"
	call WriteContactName
	%>

<TD></TD>
<TD CLASS="structurelineL"></TD>

	<%
	title = "Catering Manager"
	emailaddr = "catering"
	call WriteContactName
	%>

<TD></TD>
</TR>

<TR>
<TD CLASS="structurelineBL" HEIGHT="10"></TD>
<TD COLSPAN="3"></TD>
<TD CLASS="structurelineBL"></TD>
<TD COLSPAN="3"></TD>
<TD CLASS="structurelineBL"></TD>
<TD COLSPAN="7"></TD>
<TD CLASS="structurelineBL"></TD>
<TD COLSPAN="6"></TD>
<TD CLASS="structurelineB"></TD>
<TD CLASS="structurelineBL"></TD>
<TD COLSPAN="3"></TD>
<TD CLASS="structurelineBL"></TD>
<TD COLSPAN="3"></TD>
<TD CLASS="structurelineBL"></TD>
<TD COLSPAN="3"></TD>
<TD CLASS="structurelineBL"></TD>
<TD COLSPAN="3"></TD>
</TR>

<TR>
<TD CLASS="structurelineL"></TD>

	<%
	title = "Coaching Co-ordinator"
	emailaddr = "coaching.coordinator"
	call WriteContactName
	%>

<TD></TD>
<TD CLASS="structurelineL"></TD>

	<%
	title = "Tour Manager (Mini)"
	emailaddr = "mini.tour"
	call WriteContactName
	%>

<TD COLSPAN="2"></TD>

	<%
	title = "Junior League Contact"
	emailaddr = "junior.leaguecontact"
	call WriteContactName
	%>

<TD COLSPAN="2"></TD>
<TD></TD>
<TD></TD>
<TD></TD>

<TD CLASS="structurelineL"></TD>

	<%
	title = "Tour Manager (Senior)"
	emailaddr = "senior.tour"
	call WriteContactName
	%>

<TD COLSPAN="2"></TD>

	<%
	title = "Press Officer"
	emailaddr = "pressofficer"
	call WriteContactName
	%>

<TD></TD>
<TD CLASS="structurelineL"></TD>

	<%
	title = "Social Secretary (Mini)"
	emailaddr = "junior.social"
	call WriteContactName
	%>

<TD></TD>
<TD CLASS="structurelineL"></TD>

	<%
	title = "Discipline Secretary"
	emailaddr = "discipline"
	call WriteContactName
	%>

<TD></TD>
<TD CLASS="structurelineL"></TD>

	<%
	title = "School Liaison Officer"
	emailaddr = "schools"
	call WriteContactName
	%>

<TD></TD>
<TD CLASS="structurelineL"></TD>
<TD COLSPAN="2" CLASS="structurecontent1"><B>Tuck Shop Manager</B><BR>Lorraine Dixon</TD>
<TD></TD>
</TR>

<TR>
<TD CLASS="structurelineBL" HEIGHT="10"></TD>
<TD COLSPAN="3"></TD>
<TD CLASS="structurelineBL"></TD>
<TD COLSPAN="11"></TD>
<TD CLASS="structurelineBL"></TD>
<TD COLSPAN="6"></TD>
<TD CLASS="structurelineB"></TD>
<TD CLASS="structurelineBL"></TD>
<TD COLSPAN="3"></TD>
<TD CLASS="structurelineBL"></TD>
<TD COLSPAN="3"></TD>
<TD CLASS="structurelineBL"></TD>
<TD COLSPAN="3"></TD>
<TD CLASS="structurelineBL"></TD>
<TD COLSPAN="3"></TD>
</TR>

<TR>
<TD></TD>

	<%
	title = "Referee Co-ordinator"
	emailaddr = "referee.coordinator"
	call WriteContactName
	%>

<TD></TD>
<TD CLASS="structurelineL"></TD>

	<%
	title = "Festival Co-ordinator"
	emailaddr = "festival"
	call WriteContactName
	%>

<TD COLSPAN="9"></TD>
<TD CLASS="structurelineL"></TD>

	<%
	title = "Fixtures Secretary (Senior)"
	emailaddr = "senior.fixtures"
	call WriteContactName
	%>

<TD COLSPAN="2"></TD>

	<%
	title = "Newsletter Editor"
	emailaddr = "newsletter"
	call WriteContactName
	%>

<TD COLSPAN="2"></TD>

	<%
	title = "Webmaster"
	emailaddr = "webmaster"
	call WriteContactName
	%>

<TD></TD>
<TD CLASS="structurelineL"></TD>

	<%
	title = "Welfare Officer (Senior)"
	emailaddr = "senior.welfare"
	call WriteContactName
	%>

<TD COLSPAN="2"></TD>

	<%
	title = "Volunteer Co-ordinator"
	emailaddr = "volunteers"
	call WriteContactName
	%>

<TD></TD>
<TD CLASS="structurelineL"></TD>

	<%
	title = "Shop Manager"
	emailaddr = "shop"
	call WriteContactName
	%>

<TD></TD>
</TR>

<TR>
<TD COLSPAN="4" HEIGHT="10"></TD>
<TD CLASS="structurelineBL"></TD>

<TD COLSPAN="11"></TD>
<TD CLASS="structurelineBL"></TD>
<TD COLSPAN="11"></TD>
<TD CLASS="structurelineBL"></TD>
<TD COLSPAN="7" HEIGHT="10"></TD>

<TD CLASS="structurelineBL"></TD>
<TD COLSPAN="3"></TD>
</TR>

<TR>
<TD COLSPAN="5"></TD>

	<%
	title = "Fixtures Secretary (Mini)"
	emailaddr = "mini.fixtures"
	call WriteContactName
	%>

<TD COLSPAN="10"></TD>

	<%
	title = "Social Secretary (Senior)"
	emailaddr = "senior.social"
	call WriteContactName
	%>

<TD COLSPAN="10"></TD>

	<%
	title = "Welfare Officer (Junior)"
	emailaddr = "junior.welfare"
	call WriteContactName
	%>

<TD COLSPAN="6"></TD>

	<%
	title = "Ticket Secretary"
	emailaddr = "ticketmaster"
	call WriteContactName
	%>

<TD></TD>
</TR>

<TR><TD COLSPAN="40" HEIGHT="10"></TD></TR> <!-- spacer row //-->

</TABLE>

</DIV>

<!-- end of text box //-->

<script language="JavaScript" type="text/javascript" src="includes/tooltip.js"></script>

<%

Sub WriteContactName

boxclass = "structurecontent2"
linkstring = ""
db.MoveFirst

Do
	if db("Email") = emailaddr then
		linkstring = chr(10) & "<script language=javascript type=""text/javascript"">" & chr(10) & "<!-- " & chr(10) & "var name = """ & db("Email") & """ + '@' + domain;" & chr(10) & "document.write('<a href=\""mailto:' + name + '\"">' + """ & db("Name") & """ + '</a>');" & chr(10) & "// -->" & chr(10) & "</script>" & chr(10)
		if db("name") <> "Currently vacant" then
			boxclass = "structurecontent1"
		end if
		Exit Do
	else
		db.MoveNext
	end if
Loop Until db.EOF

Response.Write("<TD COLSPAN='2' CLASS='" & boxclass & "'><B>" & title & "</B><BR>" & linkstring & "</TD>")
end sub

db.Close

%>

</BODY>
</HTML>