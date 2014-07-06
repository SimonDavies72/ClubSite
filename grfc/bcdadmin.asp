<%@ Language=VBScript%>

<%
   if Not Session("Auth1") = "Y" then
      Response.Redirect "gmrfc1_login.asp?nav=" & Request.ServerVariables("SCRIPT_NAME")
   end if
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
   "http://www.w3.org/TR/html4/loose.dtd">

<HTML>
<HEAD>

<TITLE>Guildfordians RFC - BCD admin</TITLE>

<%
bannerType = "rugby"
%>

<!--#include virtual="includes/standardpage.inc"-->

<!-- text box starts here //-->

<DIV CLASS="textbox">

<P>
<I><B>Guildfordians RFC >> Officials >> BCD admin</B>
</P>

<P>
Officials page: This is the administration page for the Business contact directory. For the Business contact directory itself, click "BCD" on the menu above.</I>
</P>
<HR>

<P><B>EXPIRED ENTRIES:</B></P>
<P>
<TABLE WIDTH="100%" CELLPADDING="2" CELLSPACING="0">

<TR><TD CLASS="tableheading" WIDTH="130">Business</TD><TD CLASS="tableheading">Contact</TD><TD CLASS="tableheading">Member details</TD><TD CLASS="tableheading">Posted date</TD></TR>

<%

newsURL = "http://www.grfc.co.uk/rss/bcd.xml"

SetLocale(2057)

Response.Expires = -1

MaxNumberOfItems = 50

ErrorMessage = "<P STYLE='color: #666666'>Error has occurred processing file: <I>" & newsURL & "</I> - Please refresh page, or contact webmaster</P>"

Set xmlHttp = Server.CreateObject("MSXML2.XMLHTTP.6.0")
xmlHttp.Open "Get", newsURL, false
xmlHttp.Send()
BCDXML = xmlHttp.ResponseText

Set xmlDOM = Server.CreateObject("MSXML2.DomDocument.6.0")
xmlDOM.async = false
xmlDOM.LoadXml(BCDXML)

Set xmlHttp = Nothing ' clear HTTP object

Set BCDItems = xmlDOM.getElementsByTagName("item") ' collect all "items" from downloaded BCD
Set xmlDOM = Nothing ' clear XML

BCDItemsCount = BCDItems.Length-1

if BCDItemsCount > -1 then 
	Response.Write HeaderStart
Else
	Response.Write ErrorMessage
End If

Set xmlDOM = Nothing ' clear XML

ItemTemplate = "<TR CLASS='{STYLECLASS}'><TD>{BUSINESS}</TD><TD>{CONTACT}</TD><TD>{MEMBER_DETAILS}</TD><TD>{POSTED}</TD></TR>"

BCDItemsCount = BCDItems.Length-1

j = -1
styletoggle = 1

For i = 0 To BCDItemsCount
	Set BCDItem = BCDItems.Item(i)

	for each child in BCDItem.childNodes
		Select case lcase(child.nodeName)
		case "bus_name"
			BCDbus = "<B>" & child.text & "</B>"
		case "member_name"
			BCDmember_details = child.text
		case "member_agegroup"
			BCDmember_details = BCDmember_details & "<BR><I>" & child.text & "</I>"
		case "posted"
			timeoutDate = DateAdd("yyyy",1,datevalue(child.text))
			BCDposted = "<SPAN CLASS='date'>posted: " & child.text & "</SPAN>"
		case "contact_name"
			BCDcontact = "<B>" & child.text & "</B><BR>"
		case "contact_phone"
			BCDcontact = BCDcontact & child.text & "<BR>"
		case "contact_email_name" ' just set javascript name
			BCDemailName = child.text
		case "contact_email_domain" ' set javascript domain and construct text
			BCDdomain = child.text
			If BCDdomain <> "" then
				BCDcontact = BCDcontact & chr(10) & "<script language=javascript type=""text/javascript"">" & chr(10) & "<!-- " & chr(10) & "var name = """ & BCDemailName & """ + '@' + """ & BCDdomain & """;" & chr(10) & "document.write('<a href=\""mailto:' + name + '\"">' + name + '</a>');" & chr(10) & "// -->" & chr(10) & "</script>"
			End if
		End Select
	next

	j = j+1

	if j < MaxNumberOfItems then 
		If timeoutdate =< date then 'expired item
			BCDstyleclass = "bcdcontent" & styletoggle & "expired"
			ItemContent = Replace(ItemContent,"{POSTED}",BCDposted)
			ItemContent = Replace(ItemTemplate,"{STYLECLASS}",BCDstyleclass)
			ItemContent = Replace(ItemContent,"{BUSINESS}",BCDbus)
			ItemContent = Replace(ItemContent,"{CONTACT}",BCDcontact)
			ItemContent = Replace(ItemContent,"{MEMBER_DETAILS}",BCDmember_details)
			ItemContent = Replace(ItemContent,"{POSTED}",BCDposted)
			Response.Write Replace(ItemContent,"$","&#163;")
			ItemContent = ""
			if styletoggle = 1 then
				styletoggle = 0
			Else
				styletoggle = 1
			End if
		End if
	End if

Next

%>

</TABLE>
</P>
<P><B>LIVE ENTRIES:</B></P>
<P>
<TABLE WIDTH="100%" CELLPADDING="2" CELLSPACING="0">
<TR><TD CLASS="tableheading" WIDTH="130">Business</TD><TD CLASS="tableheading">Contact</TD><TD CLASS="tableheading">Member details</TD><TD CLASS="tableheading">Posted date</TD></TR>

<%

j = -1
styletoggle = 1

For i = 0 To BCDItemsCount
	Set BCDItem = BCDItems.Item(i)

	for each child in BCDItem.childNodes
		Select case lcase(child.nodeName)
		case "bus_name"
			BCDbus = "<B>" & child.text & "</B>"
		case "member_name"
			BCDmember_details = child.text
		case "member_agegroup"
			BCDmember_details = BCDmember_details & "<BR><I>" & child.text & "</I>"
		case "posted"
			timeoutDate = DateAdd("yyyy",1,datevalue(child.text))
			BCDposted = "<SPAN CLASS='date'>posted: " & child.text & "</SPAN>"
		case "contact_name"
			BCDcontact = "<B>" & child.text & "</B><BR>"
		case "contact_phone"
			BCDcontact = BCDcontact & child.text & "<BR>"
		case "contact_email_name" ' just set javascript name
			BCDemailName = child.text
		case "contact_email_domain" ' set javascript domain and construct text
			BCDdomain = child.text
			If BCDdomain <> "" then
				BCDcontact = BCDcontact & chr(10) & "<script language=javascript type=""text/javascript"">" & chr(10) & "<!-- " & chr(10) & "var name = """ & BCDemailName & """ + '@' + """ & BCDdomain & """;" & chr(10) & "document.write('<a href=\""mailto:' + name + '\"">' + name + '</a>');" & chr(10) & "// -->" & chr(10) & "</script>"
			End if
		End Select
	next

	j = j+1

	if j < MaxNumberOfItems then 
		If timeoutdate > date then 'expired item
			BCDstyleclass = "bcdcontent" & styletoggle
			ItemContent = Replace(ItemContent,"{POSTED}",BCDposted)
			ItemContent = Replace(ItemTemplate,"{STYLECLASS}",BCDstyleclass)
			ItemContent = Replace(ItemContent,"{BUSINESS}",BCDbus)
			ItemContent = Replace(ItemContent,"{CONTACT}",BCDcontact)
			ItemContent = Replace(ItemContent,"{MEMBER_DETAILS}",BCDmember_details)
			ItemContent = Replace(ItemContent,"{POSTED}",BCDposted)
			Response.Write Replace(ItemContent,"$","&#163;")
			ItemContent = ""
			if styletoggle = 1 then
				styletoggle = 0
			Else
				styletoggle = 1
			End if
		End if
	End if
Next

%>

</TABLE>

</P>

</DIV>

<!-- end of text box //-->

</BODY>
</HTML>