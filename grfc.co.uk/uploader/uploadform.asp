<%@ Language=VBScript%>
<%Option explicit%>
<%
   if Not Session("Auth") = "Y" then
      Response.Redirect "gmrfc_login.asp?nav=" & Request.ServerVariables("SCRIPT_NAME")
   end if
%>
<%
Dim strMessage, strFolder
Dim httpref, lngFileSize
Dim strExcludes, strIncludes
Dim bannerType, alert, alertMessage

	'-----------------------------------------------
	'This is the complete upload file program.
	'This is intended to upload graphics onto the web and
	'to delete them if required.
	'Set up the configurations below to define which
	'directory to use etc, then set the permissions on
	'the directory to 'Change' i.e. Read/Write
	'-----------------------------------------------

	%>
	<!-- #include file = "config.asp" -->	
	<%
	
	strMessage = Request.QueryString ("msg")
	
'--------------------------------------------
Sub main()

	%>

<HTML>
<HEAD>

<TITLE>Guildfordians Rugby - File management</TITLE>

<%
bannerType = "rugby"
%>

<!--#include virtual="includes/standardpage.inc"-->

<!-- text box starts here //-->

<DIV CLASS="textbox">

<P>
<A CLASS="Off-static-link" HREF="filestore.asp">Back to file store</A>
</P>

	<%

	if Request.Form ("AskDelete") = "Delete" then	'ask if to delete
		call askDelete(Request.Form("fileId"))
	elseif Request.Form("delete") = "" then			'display at start up
		call displayform()
		call BuildFileList(strFolder)
	elseif Request.Form ("delete") = "Yes" then		'make deletion
		call delete(Request.form("fileId"))
		call displayForm()
		call BuildFileList(strFolder)
	elseif Request.Form ("delete") = "No" then		'do not make deletion
		call displayForm()
		call BuildFileList(strFolder)
	end if

	%>

	</DIV>

	<!-- end of text box //-->

	</body>
	</html>
	<%

end sub


'--------------------------------------------
'Displays the form to allow uploading
Sub displayForm()

Dim i, tempArray

	'Results box
	if strMessage <> "" then
	%>
	<table border="1" align="center" cellspacing="0" cellpadding="2">
	<tr>
		<td class="text"><%=strMessage%></td>
	</tr>
	</table>
	<%
	end if


	%>
	<table border="0" width="100%" bgcolor="#CCCCCC" cellspacing="0" cellpadding="2">
	<tr>
		<td class="text">
		<%

		if lngFileSize > 0 then 
			Response.Write ("Maximum size of each file = ") & lngFileSize & " bytes" & "<br>"
		end if
	
		if strExcludes <> "" then
			Response.Write("File types which cannot be uploaded = ") & "<br>"
			tempArray = Split(strExcludes,";")
			For i = 0 to UBOUND(tempArray)
				Response.Write (tempArray(i)) & " "
			Next
		end if

		if strIncludes <> "" then
			Response.Write("File types which can be uploaded = ") & " "
			tempArray = Split(strIncludes,";")
			For i = 0 to UBOUND(tempArray)
				Response.Write (tempArray(i)) & " "
			Next
		end if
	
		%>	
		
		</td>
	</tr>
	</table>

	<form action="uploader/uploadfile.asp" method="post" enctype="multipart/form-data">

		<table border="0" width="100%" bgcolor="#CCCCCC" cellspacing="0" cellpadding="2">

		<tr><td colspan="2" class="text">Select the file to upload</td></tr>
		<TR><TD COLSPAN="2">&nbsp;</TD></TR>
		<tr>
			<td class="text" WIDTH="400"><b>File: </b><input type="file" name="file1"></TD>
			<TD><input type="submit" value="Upload" name="submit"></td>
		</tr>
	</table>
		
	</form>

<%
end sub


'--------------------------------------------
'Builds a list of files on the directory
'INPUT : the folder to be used
Sub BuildFileList(strFolder)

    Dim oFS, oFolder, intNoOfFiles, FileName

    Set oFS = Server.CreateObject("Scripting.FileSystemObject")
    Set oFolder = oFS.getFolder(strFolder)
    %>
    <table border="0" width="100%" bgcolor="#99CC99" cellspacing="0" cellpadding="2">

    <tr><td class="text" colspan="2">List of files in file store</td></tr>
    
    <tr><td class="text" colspan="2">&nbsp;</td></tr>

    <tr><td class="text" WIDTH="400"><b>Filename</b></td><td></td></tr>

    <%
	intNoOfFiles = 0

    For Each FileName in oFolder.Files	
		%>
		<tr>		
			<!--<form Name="frmDelete" method="post" action="requestsniffer.asp">-->
			<form Name="frmDelete" method="post" action="<%=Request.ServerVariables("PATH_INFO")%>">
				<td class="text">
					<a href="<%=httpref & "/" & mid(FileName.Path,instrrev(FileName.Path,"\")+1)%>" target="_blank"><%=mid(FileName.Path,instrrev(FileName.Path,"\")+1)%></a>
				</td>
				<td class="text">
					<input type="hidden" name="fileId" value="<%=mid(FileName.Path,instrrev(FileName.Path,"\")+1)%>">
					<input type="submit" name="AskDelete" value="Delete">
				</td>
			</form>			
		</tr>
		<%
		intNoOfFiles = intNoOfFiles + 1
    Next
    
    Set oFolder = nothing
   
	if intNoOfFiles = 0 then
		%>
		<tr align="center">
			<td colspan="2" class="text">No files available</td>
		</tr>		
		<%
	end if
  
	%>
    </table>
    <%    
   
End Sub


'--------------------------------------------
'Ask if to delete this file
'INPUT : the file name to be deleted, less the path
Sub askDelete(strFileName)

	%>
	<html>
	<head>
	<title>Delete file y/n?</title>
	<link rel="stylesheet" href="upload.css">
	</head>
	<body>
	
	<form name="frmConfirmDelete" method="post" action="<%=Request.ServerVariables("PATH_INFO")%>">
	<table border="0" align="center">
		<tr>
			<td class="text">
				Are you sure you wish to delete <b><%=strFileName%></b> ?
			</td>
		</tr>
		<tr>
			<td class="text" align="center">
				<input type="hidden" name="fileId" value="<%=strFileName%>">
				<INPUT type="submit" value="Yes" name="Delete">
				&nbsp;&nbsp;
				<INPUT type="submit" value="No" name="Delete">
			</td>
		</tr>
	</table>
	</form>

	</body>
	</html>
	<%

end sub

'--------------------------------------------
'Deletes the file given the full file name strFileName
'INPUT : the file name to be deleted, less the path
Sub delete(strFileName)

	'Response.write strFileName 
	'Response.End 

	Dim oFS, a

    Set oFS = Server.CreateObject("Scripting.FileSystemObject")
	a = oFS.DeleteFile(strFolder & "\" & strFileName)

	Set oFs = nothing
	Set a = nothing	
	
End sub


'--------------------------------------------
call main()

%>

