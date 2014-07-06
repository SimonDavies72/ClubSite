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


<P><I><B>Guildfordians RFC >> Officials >> Club Task Calendar</B></I></P>

<P><I>Officials page: This page is an interactive calendar for committee and coach tasks.</I></P>
<HR>

<%

If Request.QueryString("TASKNO") <> "" Then
	Edit_TASKNO = Request.QueryString("TASKNO")

	Set rs = Server.CreateObject("ADODB.RecordSet")
	adoDatabase = "TaskCal.mdb"
	sqlStr = "SELECT * FROM Q_Tasks_Sorted where TaskNo = " & Edit_TASKNO
	conStr = "Provider=Microsoft.Jet.OLEDB.4.0;Data Source=" & Server.MapPath(adoDatabase) & ";Persist Security Info=False"
	rs.CursorType = 2
	rs.LockType = 3

	rs.Open sqlStr, conStr
	If rs.EOF Then
		Response.Write("<td colspan=6><font face=arial size=2><b>Possible Database Error - task can not be found.</b></font><br></td>")
	Else
	'
%>
		<font size=+1>Task Calendar - Edit Entry</font>
		<FORM Method=post Action="booksys/taskcal1.asp" Name=Form >
		<INPUT TYPE="hidden" NAME="Mode" VALUE="Modify" SIZE="10"><INPUT TYPE="hidden" NAME="UPDATETASKNO" VALUE="<% =(Edit_TASKNO) %>" SIZE="10"><br>
		<INPUT TYPE="Edit" NAME="txtDate" VALUE="<% =(rs("TaskDate").Value) %>" SIZE="10">  <b>Task Date</b> (Format dd/mm/yyyy)<br>
		<INPUT TYPE="Edit" NAME="txtTitle" VALUE="<% =(rs("TaskTitle").Value) %>" SIZE="99">  <b>Title</b> (max 99 characters)<br>
		<textarea NAME="txtDescription" rows=6 cols=76><% =(rs("TaskDescription").Value) %></textarea> <b>Description</b><br>

		<INPUT TYPE="Edit" NAME="txtAssigned" VALUE="<% =(rs("TaskAssigned").Value) %>" SIZE="50">  <b>Assigned</b><br>
		<INPUT TYPE="Edit" NAME="txtNotes" VALUE=" " SIZE="99">  <b>Additional Notes \ Progress</b><br>


		<SELECT NAME="txtStatus">

		<% If trim(rs("TaskStatus").Value) = "Open" then %>
			<option value="Open" selected="selected">Open </option>
		<% else %>
			<option value="Open">Open </option>
		<% End If %>
		<% If trim(rs("TaskStatus").Value) = "Complete" then %>
			<option value="Complete" selected="selected">Complete </option>
		<% else %>
			<option value="Complete">Complete </option>
		<% End If %>
		<% If trim(rs("TaskStatus").Value) = "Cancelled" then %>
			<option value="Cancelled" selected="selected">Cancelled </option>
		<% else %>
			<option value="Cancelled">Cancelled </option>
		<% End If %>
		<% If trim(rs("TaskStatus").Value) = "Query" then %>
			<option value="Query" selected="selected">Query </option>
		<% else %>
			<option value="Query">Query </option>
		<% End If %>


        </SELECT> <b>Task Status</b>
<%
	End If

	rs.CLOSE
	Set rs = Nothing
	Set conStr = Nothing
else

%>

<font size=+1>Task Calendar - New Entry</font>
<FORM Method=post Action="booksys/taskcal1.asp" Name=Form >
<INPUT TYPE="hidden" NAME="Mode" VALUE="New Entry" SIZE="10"><br>
<INPUT TYPE="Edit" NAME="txtDate" VALUE="" SIZE="10"> <b>Task Date</b> (Format dd/mm/yyyy)<br>
<INPUT TYPE="Edit" NAME="txtTitle" VALUE="" SIZE="99"> <b>Title</b> (max 99 characters)<br>
<textarea NAME="txtDescription" rows=6 cols=76></textarea> <b>Description</b><br>
<INPUT TYPE="Edit" NAME="txtAssigned" VALUE="" SIZE="50"> <b>Assigned</b><br>
<INPUT TYPE="Edit" NAME="txtNotes" VALUE="" SIZE="99"> <b>Additional Notes \ Progress</b><br>

<SELECT NAME="txtStatus">
<option value="Open" selected="selected">Open </option>
<option value="Complete">Complete </option>
<option value="Cancelled">Cancelled </option>
<option value="Query">Query </option>
</SELECT> <b>Task Status</b>

<%
End If
%>




<br><br><INPUT TYPE="Submit" NAME="submit" VALUE="Save Task">
<br>Enter \ Modify the task details and then Press the 'Save Task' button to confirm.<br>
</form>

<%

Call DisplayBookings


%>

<p><!--#include virtual='/includes/taskcalftr.inc'--></p>
</DIV>
</body>
</html>
</script>