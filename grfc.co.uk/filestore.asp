<%@ Language=VBScript%>

<%
   if Not Session("Auth1") = "Y" then
      Response.Redirect "gmrfc1_login.asp?nav=" & Request.ServerVariables("SCRIPT_NAME")
   end if
%>

<!-- #include file = "uploader/config.asp" -->

<%
Dim strMessage, strFolder
Dim httpref, lngFileSize
Dim strExcludes, strIncludes
Dim bannerType
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
   "http://www.w3.org/TR/html4/loose.dtd">

<HTML>
<HEAD>

<TITLE>Guildfordians RFC - File store</TITLE>

<%
bannerType = "rugby"
%>

<!--#include virtual="/includes/standardpage.inc"-->

<!-- text box starts here //-->

<DIV CLASS="textbox">

<P>
<I><B>Guildfordians RFC >> Officials >> File store</B>
</P>
<P>

<P>
Officials page: This page is for storage and sharing of files.</I>
</P>
<HR>

<P><A CLASS="heading" NAME="files">File store</A></P>

<P><TABLE WIDTH="95%" CELLSPACING="2">

<TR><TD CLASS="tableheading">Filename</TD></TR>

<% call BuildFileList(strFolder) %>

</table></P>

<P><A  CLASS="static-link" HREF="http://www.grfc.co.uk/uploader/uploadform.asp">File upload page</A></P>

</DIV>

<!-- end of text box //-->

</BODY>
</HTML>

<%
Sub BuildFileList(strFolder)

    Dim oFS, oFolder, intNoOfFiles, FileName

    Set oFS = Server.CreateObject("Scripting.FileSystemObject")
    Set oFolder = oFS.getFolder(Server.MapPath(strFolder))
    %>

    <%
	intNoOfFiles = 0

    For Each FileName in oFolder.Files	
		%>
		<tr>		
				<TD CLASS="tablecontent" VALIGN="Top">
					<a href="<%=httpref & "/" & mid(FileName.Path,instrrev(FileName.Path,"\")+1)%>" target="_blank"><%=mid(FileName.Path,instrrev(FileName.Path,"\")+1)%></a>
				</td>
		</tr>
		<%
		intNoOfFiles = intNoOfFiles + 1
    Next
    
    Set oFolder = nothing
   
	if intNoOfFiles = 0 then
		%>
		<tr align="center">
			<TD CLASS="tablecontent" VALIGN="Top">No files available</td>
		</tr>		
		<%
	end if
  
	%>
    <%    
   
End Sub %>