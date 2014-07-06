<br><br><br>
<b><font size=2>Guildfordians RFC Task calendar</b> - V 1.0<br><br>
Please report any problems with the system to :
<script language=javascript type="text/javascript">
<!--
var name = "club.secretary" + '@' + domain;
document.write('<a href=\"mailto:' + name + '\">' + name + '</a>');
// -->
</script>.
</font>

<%

'''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''
'Shows all Tasks.
'''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''
Sub DisplayBookings

%>
<P><A CLASS="heading">Current Tasks</A></P><DIV CLASS="textbox">
<%

Dim conStr, rs, sqlStr

Dim	Data_TaskDate
Dim	Data_TaskTitle
Dim	Data_TaskDescription
Dim	Data_TaskAssigned
Dim	Data_TaskStatus
Dim	Data_TaskProgress

Dim TD_Start
Dim TD_End
Dim ProcessingDate
Dim RowClass
Dim RowTDClass
Dim RowColumnSpan
Dim SpecialInfo_Image
SpecialInfo_Image = ""

Response.Write("<font size=-1>Click on the Task Date to edit an existing task.<br></font>")


TD_End = "</font></td>"

'Write table header
Response.Write("<table width=95% border=1 cellspacing=0 cellpadding=1 >")

Call Disp_Booking_Table_Hdr

Set rs = Server.CreateObject("ADODB.RecordSet")
adoDatabase = "TaskCal.mdb"

sqlStr = "SELECT * FROM Q_Tasks_Sorted"
conStr = "Provider=Microsoft.Jet.OLEDB.4.0;Data Source=" & Server.MapPath(adoDatabase) & ";Persist Security Info=False"
rs.CursorType = 2
rs.LockType = 3

rs.Open sqlStr, conStr
If rs.EOF Then
	Response.Write("<td colspan=6><font face=arial size=2><b>There are currently no tasks in the database.</b></font><br></td>")
Else
	Do While NOT rs.EOF
		Data_TaskDate = rs("TaskDate").Value
		Data_TaskTitle = rs("TaskTitle").Value
		Data_TaskDescription = rs("TaskDescription").Value
		Data_TaskAssigned = rs("TaskAssigned").Value
		Data_TaskStatus = trim(rs("TaskStatus").Value)
		Data_TaskProgress = rs("TaskProgress").Value
		
		If trim(Data_TaskAssigned) = "" then
			Data_TaskAssigned = "&nbsp"
		End If
		RowColumnSpan = ""
		TD_Start = "<td CLASS=" & "tablecontent" & " valign=top" & RowColumnSpan & "><font size=-1>"

		Response.Write("<tr Class=" & Chr(34) & "tableheading" & Chr(34) & " >" )
		Response.Write(TD_Start & "<b><a href=HTTP://www.grfc.co.uk/booksys/taskcal.asp?TASKNO=" & rs("TaskNo").Value & ">" & Data_TaskDate & "</a></b>" & TD_End )
		Response.Write(TD_Start & "<b>" & Data_TaskTitle & "</b>" & TD_End  )
		Response.Write(TD_Start & "<b>" & Data_TaskAssigned & "</b>" & TD_End  )

		If Data_TaskStatus = "Query" or ( (Data_TaskDate < Date ) and ( Data_TaskStatus <> "Complete" and Data_TaskStatus <> "Cancelled")) then
			TD_Start = "<td CLASS=" & "Social" & " valign=top" & RowColumnSpan & "><font size=-1>"
			Response.Write(TD_Start & Data_TaskStatus  & TD_End  )
			TD_Start = "<td CLASS=" & "tablecontent" & " valign=top" & RowColumnSpan & "><font size=-1>"
		Else
			If ( Data_TaskStatus = "Complete" or Data_TaskStatus = "Cancelled") then
				TD_Start = "<td CLASS=" & "tablecontent1" & " valign=top" & RowColumnSpan & "><font size=-1>"
				Response.Write(TD_Start & Data_TaskStatus  & TD_End  )
				TD_Start = "<td CLASS=" & "tablecontent" & " valign=top" & RowColumnSpan & "><font size=-1>"
			else
				Response.Write(TD_Start & Data_TaskStatus  & TD_End  )
			End If
		End if
		Response.Write("</tr>" )

		RowColumnSpan = " COLSPAN='4' "

		TD_Start = "<td CLASS=" & RowTDClass & " valign=top" & RowColumnSpan & "><font size=-1>"

		Response.Write("<tr>" & TD_Start & "<b>Description : </b>" & Data_TaskDescription  & TD_End & "</tr>" )


		If Trim(Data_TaskProgress) <> "" And Data_TaskProgress <> "&nbsp" Then

			'TD_Start = "<td CLASS=" & RowTDClass & " valign=top" & RowColumnSpan & "><font size=-1>"
			'Response.Write("<tr Class=" & RowClass & " >" & TD_Start & "&nbsp" & TD_End )

			TD_Start = "<td CLASS=" & RowTDClass & " valign=top" & RowColumnSpan & "><font size=-1>"
			Response.Write(TD_Start & "<b>Additional Notes : </b>"  & Data_TaskProgress & TD_End & "</tr>")

		End If
		Response.Write("<tr>" & TD_Start & "&nbsp" & TD_End & "</tr>" )

		RowColumnSpan = ""
		RS.MoveNext
	Loop
End If

Call Disp_Booking_Table_Hdr

rs.CLOSE
Set rs = Nothing
Set conStr = Nothing

Response.Write("</table></DIV>" )

End Sub

%>

<%

'''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''
Sub Disp_Booking_Table_Hdr()

Dim TH_Start
Dim TH_Start_P1
Dim TH_Start_P2
Dim TH_Start_W8
Dim TH_Start_W9
Dim TH_Start_W11
Dim TH_Start_W25
Dim TH_End

TH_Start_P1 = "<td CLASS=" & Chr(34) & "tableheading" & Chr(34) & " valign=bottom"
TH_Start_P2 = "><font size=-1><b>"
TH_Start = TH_Start_P1 & TH_Start_P2
TH_Start_W8 = TH_Start_P1 & " width=" & Chr(34) & "7%" & Chr(34) & TH_Start_P2
TH_Start_W9 = TH_Start_P1 & " width=" & Chr(34) & "50%" & Chr(34) & TH_Start_P2
TH_Start_W11 = TH_Start_P1 & " width=" & Chr(34) & "11%" & Chr(34) &  TH_Start_P2
TH_Start_W25 = TH_Start_P1 & " width=" & Chr(34) & "25%" & Chr(34) &  TH_Start_P2

TH_End = "</b></font></td>"

Response.Write("<tr>")
Response.Write(TH_Start_W8 & "Task Date" & TH_End)
Response.Write(TH_Start_W9 & "Title" & TH_End)
Response.Write(TH_Start_W25 & "Assignee" & TH_End)
Response.Write(TH_Start & "Status" & TH_End)
Response.Write("</tr>")

End Sub


%>