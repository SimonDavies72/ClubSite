<%@ LANGUAGE="VBScript" %>
<%
if Not Session("Auth1") = "Y" then
  Response.Redirect "../gmrfc1_login.asp?nav=" & Request.ServerVariables("SCRIPT_NAME")
end if

'Ensure that this page is not cached.
Response.Expires = 0

bannerType = "rugby"
%>

<html>
<head>

<p><!--#include virtual='/includes/standardpage.inc'--></p>

<DIV CLASS="textbox">

<P><I><B>Guildfordians RFC >> Officials >> Booking system</B></I></P>

<P><I>Officials page: This page is a booking system for booking equipment etc.</I></P>
<HR>

<font size=+2>SYSTEM NOW LIVE</font>
<FORM Method=post Action="booksys/Booking1.asp" Name=Form >
<INPUT TYPE="Edit" NAME="txtDate" VALUE="" SIZE="10">  <b>Booking Date</b>(Format dd/mm/yyyy)<br>
<INPUT TYPE="Edit" NAME="txtStartTime" VALUE="" SIZE="5">  <b>Booking Start Time</b>(Format HH:MM 24 hour clock )<br>
<INPUT TYPE="Edit" NAME="txtEndTime" VALUE="" SIZE="5">  <b>Booking End Time</b>(Format HH:MM 24 hour clock )<br>
<INPUT TYPE="Edit" NAME="txtNotes" VALUE="" SIZE="60">  <b>Additional Notes \ Info for booking</b><br>
<br><b>Item to Book</b><br>
<SELECT NAME="ItemToBook">

<%
''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''
'Read the Database to create the list of items to book.
''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''
Dim conStr, rs, sqlStr
Dim Data_ItemToBook
Dim Data_ItemDescription
Dim Data_ItemKey

Set rs = Server.CreateObject("ADODB.RecordSet")
adoDatabase = "Booking.mdb"
sqlStr = "SELECT * FROM Items ORDER BY Item asc"
conStr = "Provider=Microsoft.Jet.OLEDB.4.0;Data Source=" & Server.MapPath(adoDatabase) & ";Persist Security Info=False"
rs.CursorType = 2
rs.LockType = 3

Response.Write("<option value=" & "0" & ">" & "Please Select" ) 'Dummy value to force selection.

rs.Open sqlStr, conStr
If rs.EOF Then
	Response.Write("</SELECT>")
	Response.Write("<font face=arial size=2><b>There are currently no Item for Booking in the database.</b></font><br>")
Else
   Do While NOT rs.EOF
	   Data_ItemKey = rs("ItemKey").Value
	   Data_ItemToBook = rs("Item").Value
		Data_ItemDescription = rs("Description").Value
		Response.Write("<option value=" & Data_ItemKey & ">" & Data_ItemToBook & " - " & Data_ItemDescription )
		rs.MoveNext
	Loop
	Response.Write("</SELECT>")
End If

rs.Close
Set rs = Nothing
Set conStr = Nothing

''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''
'Read the Database to create the list of Groups to book items.
''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''
Response.Write("<br><br><b>Group making Booking</b><br>")
%>
<select name="Booker">
<%
Dim Data_Booker
Dim Data_BookerKey

Set rs = Server.CreateObject("ADODB.RecordSet")
adoDatabase = "Booking.mdb"
sqlStr = "SELECT * FROM Bookers ORDER BY Booker asc"
conStr = "Provider=Microsoft.Jet.OLEDB.4.0;Data Source=" & Server.MapPath(adoDatabase) & ";Persist Security Info=False"
rs.CursorType = 2
rs.LockType = 3

Response.Write("<option value=" & "0" & ">" & "Please Select"  ) 'Dummy Value to force selection

rs.Open sqlStr, conStr
If rs.EOF Then
	Response.Write("</select>")
   Response.Write("<font face=arial size=2><b>There are currently no Groups for Booking in the database.</b></font><br>")
Else
   Do While NOT rs.EOF
	  If  rs("Useable").Value  = True Then
	     'Check if the Group can book items or not.
		  Data_BookerKey = rs("BookerKey").Value
		  Data_Booker = rs("Booker").Value
		  Response.Write("<option value=" & Data_BookerKey  & ">" & Data_Booker)
	  End If
	  rs.MoveNext
   Loop
	Response.Write("</select>")
End If

rs.Close
Set rs = Nothing
Set conStr = Nothing

''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''
'End Drop Down Lists
''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''
%>
<br><br><INPUT TYPE="Submit" NAME="submit" VALUE="Make Booking" >
<br>Enter the details of the booking and then Press the 'Make Booking' button to confirm the booking.<br> 
To Cancel or Amend any bookings once made email :
<script language=javascript type="text/javascript">
<!--
var name = "kit" + '@' + domain;
document.write('<a href=\"mailto:' + name + '\">' + name + '</a>');
// -->
</script>.
</form>
<%

call DisplayBookings


'''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''
'Shows all current bookings.
'''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''
Sub DisplayBookings

%>
<P><A CLASS="heading">Current Bookings</A></P><DIV CLASS="textbox">
<%
Dim conStr, rs, sqlStr

Dim	Data_DateBookedFor
Dim	Data_StartTime
Dim	Data_EndTime
Dim	Data_BookingMade
Dim	Data_Notes
Dim	Data_BookerKey
Dim	Data_ItemKey
Dim	Data_Item
Dim	Data_ItemDescription
Dim	Data_Booker
Dim	Data_SpecialInfo
Dim	Data_Location

Dim TD_Start
Dim TD_End 
Dim ProcessingDate
Dim RowClass
Dim RowTDClass
Dim RowColumnSpan
Dim SpecialInfo_Image
SpecialInfo_Image = ""

TD_End = "</font></td>"

'Write table header
Response.Write("<table width=100% border=1 cellspacing=0 cellpadding=1 >")

Call Disp_Booking_Table_Hdr

Set rs = Server.CreateObject("ADODB.RecordSet")
adoDatabase = "Booking.mdb"
sqlStr = "SELECT * FROM Q_Bookings" ' Query already sorted by Date & Start Time
conStr = "Provider=Microsoft.Jet.OLEDB.4.0;Data Source=" & Server.MapPath(adoDatabase) & ";Persist Security Info=False"
rs.CursorType = 2
rs.LockType = 3

rs.Open sqlStr, conStr
If rs.EOF Then
	Response.Write("<td colspan=6><font face=arial size=2><b>There are currently no bookings in the database.</b></font><br></td>")
Else
	Do While NOT rs.EOF
		Data_DateBookedFor = rs("DateBookedFor").Value
		Data_StartTime = rs("StartTime").Value
		Data_EndTime = rs("EndTime").Value
		Data_BookingMade = rs("BookingMade").Value
		Data_BookerKey = rs("BookerKey").Value
		Data_Booker = rs("Booker").Value
		Data_ItemKey = rs("ItemKey").Value
		Data_ItemDescription = rs("Description").Value
		Data_SpecialInfo = rs("SpecialInfo").Value
		Data_Location = rs("Location").Value
		Data_Item = rs("Item").Value

		If ProcessingDate <> Data_DateBookedFor then
			If RowClass = "'Coach'" Then
			  RowClass = "'Fixture'"
			  RowTDClass = "'Tablecontent'"
			Else
			  RowClass = "'Coach'"
			  RowTDClass = "'Tablecontent4'"
			End If
			ProcessingDate = Data_DateBookedFor
		End If

		RowColumnSpan = ""
      TD_Start = "<td CLASS=" & RowTDClass & " valign=top" & RowColumnSpan & "><font size=-1>"

		If IsNull(rs("Notes").Value) Or Trim(rs("Notes").Value = "") Then
		   Data_Notes = "&nbsp"
		Else
		   Data_Notes = rs("Notes").Value
		End IF

		If IsNull(Data_Location) or Data_Location = "" then
		   Data_Location = "&nbsp"
		End if
		If IsNull(Data_SpecialInfo) or Data_SpecialInfo = "" then
		   Data_SpecialInfo = "&nbsp"
		End If

		If Data_SpecialInfo <>  "&nbsp" Then
		   SpecialInfo_Image = "<IMG SRC=" & Chr(34) & "nav_images/info.gif" & Chr(34) & "ALT=" & Chr(34) & Data_SpecialInfo & Chr(34) & " WIDTH=16 HEIGHT=16 ALIGN=absmiddle >"	
		Else
		   SpecialInfo_Image = ""
		End If

		Response.Write("<tr Class=" & RowClass & " >" )
		Response.Write(TD_Start & "<b>" & Data_DateBookedFor & "</b>" & TD_End )
		Response.Write(TD_Start & "<b>" & Data_StartTime & " - " & Data_EndTime & "</b>" & TD_End  )
		Response.Write(TD_Start & "<b>" & Data_Item & "</b>" & " (" &  Data_ItemDescription & ") " & SpecialInfo_Image & TD_End  )
		Response.Write(TD_Start & "<b>" & Data_Booker & "</b>" & TD_End  )
		Response.Write(TD_Start & Data_Location & TD_End  )

		Response.Write("<td CLASS=" & RowTDClass & " valign=top" & RowColumnSpan & "><font size=-2>" & Left(Data_BookingMade,10) & " " & Mid(Data_BookingMade,12,5) & TD_End  )
		Response.Write("</tr>" )

		If Trim(Data_Notes) <> "" And Data_Notes <> "&nbsp" Then
		   RowColumnSpan = ""
         TD_Start = "<td CLASS=" & RowTDClass & " valign=top" & RowColumnSpan & "><font size=-1>"
		   Response.Write("<tr Class=" & RowClass & " >" & TD_Start & "&nbsp" & TD_End )

		   RowColumnSpan = " COLSPAN='5' "
         TD_Start = "<td CLASS=" & RowTDClass & " valign=top" & RowColumnSpan & "><font size=-1>"
		   Response.Write(TD_Start & "Additional Notes : "  & Data_Notes  & TD_End & "</tr>")
		   RowColumnSpan = ""
		End If
		Response.Write("                                                                                     " )

		RS.MoveNext
	Loop
End If

Call Disp_Booking_Table_Hdr

rs.CLOSE
Set rs = Nothing
Set conStr = Nothing

Response.Write("</table></DIV>" )

End Sub

'''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''
Sub Disp_Booking_Table_Hdr()

Dim TH_Start
Dim TH_Start_P1
Dim TH_Start_P2
Dim TH_Start_W8
Dim TH_Start_W9
Dim TH_Start_W11
Dim TH_End

TH_Start_P1 = "<td CLASS=" & Chr(34) & "tableheading" & Chr(34) & " valign=bottom"
TH_Start_P2 = "><font size=-1><b>"
TH_Start = TH_Start_P1 & TH_Start_P2
TH_Start_W8 = TH_Start_P1 & " width=" & Chr(34) & "7%" & Chr(34) & TH_Start_P2
TH_Start_W9 = TH_Start_P1 & " width=" & Chr(34) & "9%" & Chr(34) & TH_Start_P2
TH_Start_W11 = TH_Start_P1 & " width=" & Chr(34) & "11%" & Chr(34) &  TH_Start_P2
TH_End = "</b></font></td>"

Response.Write("<tr>")
Response.Write(TH_Start_W8 & "Date<br>Booked" & TH_End)
Response.Write(TH_Start_W9 & "Time" & TH_End)
Response.Write(TH_Start & "Item Booked" & TH_End)
Response.Write(TH_Start_W8 & "Booked<br>By" & TH_End)
Response.Write(TH_Start & "Location<br>of Item" & TH_End)
Response.Write(TH_Start_W11 & "Booked<br>On" & TH_End)
Response.Write("</tr>")

End Sub

%>

<p><!--#include virtual='/includes/bookingsystemftr.inc'--></p>

</DIV>
</body>
</html>
</script>