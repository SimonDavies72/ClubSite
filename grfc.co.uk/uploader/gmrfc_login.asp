<!--#include virtual="/includes/security.inc"-->
<% 
   Session("Auth") = "N" 

   bValidate = False

   sPassword = Trim(Request.Form("Password"))
   if sPassword <> "" then bValidate = True

   If bValidate Then
		
      ' The session count allows us (if we wish) to stop users multiple login attempts  
      Session("LoginCount") = Session("LoginCount") + 1

         If sPassword = filePassword Then           
            Session("Auth") = "Y" 
            If Request.QueryString("nav") <> "" then
               Response.Redirect Request.QueryString("nav")
            Else
	  Session("LoginCount") = 0

               Response.Redirect "default.asp" 
            End If
            Response.End
         End If
   End If 

   bannerType = "rugby"
%>  


<HTML>
<HEAD>

<TITLE>Guildfordians Rugby - Login</TITLE>

<!--#include virtual="includes/standardpage.inc"-->

<!-- text box starts here //-->

<DIV CLASS="textbox">

<P>
<A CLASS="Off-static-link" HREF="filestore.asp">Back to file store</A>
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