<%@ LANGUAGE="VBScript" %>
<html>
<head>

<p><!--#include virtual='../htdocs/includes/standardpage.inc'--></p>

<DIV CLASS="textbox">

<P><A CLASS="Off-static-link" HREF="http://www.grfc.co.uk/booksys/booking.asp">Back to Booking system</A></P>

<%
Dim Error_Message
Dim RequestDateYYYYMMDD
Dim CurrentDateYYYYMMDD
Error_Message = ""


If Request.Form("txtEndTime") >= "00:00" and Request.Form("txtEndTime") <= "23:59" and 		Right(Request.Form("txtEndTime"),2) <= "59" then
   'Ok passed validtion
Else
   Error_Message =  Error_Message &  "Input Error - End Time must be in the range of 00:00 to 23:59" & "<br><br>"
End If

If Request.Form("txtStartTime") >= "00:00" and Request.Form("txtStartTime") <= "23:59" And right(Request.Form("txtStartTime"),2) <= "59" then
   'Ok passed validtion
Else
	Error_Message =  Error_Message &  "Input Error - End Time must be in the range of 00:00 to 23:59" & "<br><br>"
End If

If Request.Form("txtStartTime") >= Request.Form("txtEndTime") then
	Error_Message =  Error_Message & "Input Error - The Start Time must be before the End Time." & "<br><br>"
End If

If Request.Form("ItemToBook") = 0 then
	Error_Message =  Error_Message & "Input Error - Please select the Item to Book from the list." & "<br><br>"
End If

If Request.Form("Booker") = 0 then
	Error_Message =  Error_Message & "Input Error - Please select the Booker from the list." & "<br><br>"
End If

If IsDate(Request.Form("txtDate")) = false then
	Error_Message =  Error_Message & "Input Error - Please enter a valid date in the format dd/mm/yyyy." & "<br><br>"
Else

   RequestDateYYYYMMDD = Mid(Request.Form("txtDate"),7,4) & Mid(Request.Form("txtDate"),4,2) & Mid(Request.Form("txtDate"),1,2)
   CurrentDateYYYYMMDD = Mid(Now,7,4) & Mid(Now,4,2) & Mid(Now,1,2)
   If RequestDateYYYYMMDD < CurrentDateYYYYMMDD Then
      Error_Message =  Error_Message & "Input Error - Bookings must be for today or a future date." & "<br><br>"
   End If
End If


If Error_Message = "" then
	Dim rs

	'''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''
	'Obtain the item description and details from the database.
	'''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''
	Dim Data_ItemToBook
	Dim Data_Description
	Dim Data_ItemKey
	Dim Data_BookerKey
	Dim Data_SpecialInfo
	Dim	Data_Location
	Dim Data_Component


	Set rs = Server.CreateObject("ADODB.RecordSet")
	adoDatabase = "Booking.mdb"
	sqlStr = "SELECT * FROM Items Where ItemKey = " & Request.Form("ItemToBook")
	conStr = "Provider=Microsoft.Jet.OLEDB.4.0;Data Source=" & Server.MapPath(adoDatabase) & ";Persist Security Info=False"
	rs.CursorType = 2
	rs.LockType = 3

	rs.Open sqlStr, conStr
	Do While NOT rs.EOF
		Data_ItemKey = rs("ItemKey").Value
		Data_ItemToBook = rs("Item").Value
		Data_Description = rs("Description").Value
		Data_SpecialInfo = rs("SpecialInfo").Value
		Data_Location = rs("Location").Value
		Data_Component = rs("Component").Value
		rs.MoveNext
	Loop
	rs.Close
	Set rs = Nothing
	Set conStr = Nothing

    '''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''
    ' Convert the bookers name to the key.
    '''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''
	Set rs = Server.CreateObject("ADODB.RecordSet")
	adoDatabase = "Booking.mdb"
	sqlStr = "SELECT * FROM Bookers Where Booker = '" & Request.Form("Booker") & "'"
	conStr = "Provider=Microsoft.Jet.OLEDB.4.0;Data Source=" & Server.MapPath(adoDatabase) & ";Persist Security Info=False"
	rs.CursorType = 2
	rs.LockType = 3

	rs.Open sqlStr, conStr
	Do While NOT rs.EOF
	   Data_BookerKey = RS("BookerKey").Value
	   Exit do
	Loop

	rs.CLOSE
	Set rs = Nothing
	Set conStr = Nothing




	Data_Component = Trim(Data_Component)
	If Data_Component <> "" Then
	   Data_Component = "," & Data_Component & ","
	End If

	'''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''
	'Search for matching booking
	'''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''
	Dim SearchStringResult

	Set rs = Server.CreateObject("ADODB.RecordSet")
	adoDatabase = "Booking.mdb"
	sqlStr = "Select * FROM Bookings"' Where DateBookedFor = " & Trim(Request.Form("txtDate")) '& " And ItemKey = " &        Request.Form("ItemToBook")
	conStr = "Provider=Microsoft.Jet.OLEDB.4.0;Data Source=" & Server.MapPath(adoDatabase) & ";Persist Security Info=False"
	rs.CursorType = 2
	rs.LockType = 3

	Error_Message = "Unable find matching booking to delete."

	rs.Open sqlStr, conStr
	Do While NOT rs.EOF
	   Response.Write("<table border=0>")
	   If Trim(rs("DateBookedFor").value) = Trim(Request.Form("txtDate")) Then


	   	   If trim(rs("BookerKey"))  = trim(Request.Form("Booker")) then

			 If trim(rs("ItemKey")) = trim(Request.Form("ItemToBook")) then
				If trim(Request.Form("txtStartTime")) = rs("StartTime").value  And trim(Request.Form("txtEndTime"))  = rs("EndTime").Value Then
        			rs.Delete 'Delete entry
					Error_Message = ""
				End If
			 End If
		  End if
	   End IF
	   rs.MoveNext
	Loop

	rs.Close
	Set rs = Nothing
	Set conStr = Nothing

End If


TD_Start = "<tr><td valign=top><b>"
TD_End = "</b></td><td> : </td><td valign=top>"
TD_End2 = "</td><tr>"

If Error_Message <> "" Then
	'Error
	%>
	<P><A CLASS="heading">Booking Error</A></P>
	<DIV CLASS="textbox"><br><br>
	<%
	'Response.Write("<table border=0>")
	'Response.Write(TD_Start & "Booking Date" & TD_End &  Request.Form("txtDate") & TD_End2)
	'Response.Write(TD_Start & "Item Booked" & TD_End & Data_ItemToBook & " - " & Data_Description & TD_End2)
	'Response.Write(TD_Start & "Time" & TD_End & Request.Form("txtStartTime") & " - " & Request.Form("txtEndTime") & TD_End2)
	'Response.Write(TD_Start & "Notes" & TD_End &  Request.Form("txtNotes") & TD_End2)

	'Response.Write(TD_Start & "Debug Booker" & TD_End & "*" &  Request.Form("Booker") & "*" & TD_End2)
	'Response.Write(TD_Start & "Debug Item" & TD_End & "*" & Request.Form("ItemToBook") & "*" & TD_End2)


	Response.Write("</table>")
	Response.Write("<font size=2 color=red>" & "<br>" &  Error_Message  & "<br>" & "<br>" & "Please press the page back button in the browser, amend the details and then try to Delete the booking again." & "</font><br><br><br><br><br><br>")
	Response.Write("</DIV>")
Else
	'Ok - passed validation, entry deleted.



	%>
	<P><A CLASS="heading">Booking Successfully Deleted</A></P><DIV CLASS="textbox">
	<%
	Response.Write("<table border=0>")
	Response.Write(TD_Start & "Booking Date" & TD_End &  Request.Form("txtDate") & TD_End2)
	Response.Write(TD_Start & "Item Booked" & TD_End  & Data_ItemToBook & " - " & Data_Description & TD_End2)
	Response.Write(TD_Start & "Time" & TD_End &  Request.Form("txtStartTime") & " - " & Request.Form("txtEndTime") & TD_End2)
	Response.Write(TD_Start & "Notes" & TD_End & Request.Form("txtNotes") & TD_End2 )

	If Trim(Data_SpecialInfo ) <> "" Then
		Response.Write(TD_Start & "Special Info" & TD_End & Data_SpecialInfo & TD_End2)
	End If
	If Trim(Data_Location ) <> "" Then
		Response.Write(TD_Start & "Location" & TD_End & Data_Location & TD_End2)
	End If
	'Response.Write("<tr>" & TD_Start & "Booked by Group" & TD_End & Request.Form("Booker") & TD_End2)

	Response.Write("</table>")


End If

%>

<p><!--#include virtual='../htdocs/includes/bookingsystemftr.inc'--></p>

</DIV>
</body>
</html>
</script>