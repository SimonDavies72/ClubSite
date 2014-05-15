<% 
   Session("Auth1") = "N" 

   bValidate = False

   sPassword = Trim(Request.Form("Password"))
   if sPassword <> "" then bValidate = True

   If bValidate Then
		
      ' The session count allows us (if we wish) to stop users multiple login attempts  
      Session("LoginCount") = Session("LoginCount") + 1

         If sPassword = "cabiN3t" Then           
            Session("Auth1") = "Y" 
            If Request.QueryString("nav") <> "" then
               Response.Redirect Request.QueryString("nav")
            Else
	  Session("LoginCount") = 0

               Response.Redirect "default.asp" 
            End If
            Response.End
         End If
   End If 
%>  

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
   "http://www.w3.org/TR/html4/loose.dtd">
<HTML>
<HEAD>

<TITLE>Guildfordians RFC - Login</TITLE>

<%
bannerType = "rugby"
%>

<!--#include virtual="includes/standardpage.inc"-->

<!-- text box starts here //-->

<DIV CLASS="textbox">

<P>
<A CLASS="Off-static-link" HREF="http://www.grfc.co.uk/officials.asp">Back to Officials home page</A>
</P>

<form method="post" action="<%=Request.ServerVariables("SCRIPT_NAME")%>?mode=login&nav=<%=Request.QueryString("nav")%>"> 
	<P>
	<input name="formscript" type="hidden" value="register.asp">
        Password:&nbsp;<input type="password" name="Password" size="35,1" maxlength="20" value="">&nbsp;
	<input type="submit" class="text" value="Login">
	</p>
</form>

</DIV>

<!-- end of text box //-->

</body>
</html>