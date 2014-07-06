<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
   "http://www.w3.org/TR/html4/loose.dtd">

<HTML>
<HEAD>

<TITLE>Guildfordians RFC - Business contact directory</TITLE>

<%
bannerType = "rugby"
%>

<!--#include virtual="includes/standardpage.inc"-->

<!-- text box starts here //-->

<DIV CLASS="textbox">

<P>

<B><I>Guildfordians RFC >> Business contact directory</I></B>

</P>

<P>
Welcome to the Guildfordians business contact directory. This is a resource for members and sponsors to enable them to advertise their services/products to other members.
</P>

<P>
<A HREF="http://www.grfc.co.uk/popup_bcdinfo.html" TARGET="new">Click here to find out how to be included in this directory</A>
</P>

<TABLE WIDTH="100%" CELLPADDING="2" CELLSPACING="0">

<TR><TD CLASS="tableheading" WIDTH="130">Business</TD><TD CLASS="tableheading">Description</TD><TD CLASS="tableheading" WIDTH="170">Contact</TD><TD CLASS="tableheading">Discounts or special offers</TD><TD CLASS="tableheading" WIDTH="130"></TD></TR>

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

ItemTemplate = "<TR CLASS='{STYLECLASS}'><TD>{BUSINESS}</TD><TD>{DESCRIPTION}</TD><TD>{CONTACT}</TD><TD>{SPECIAL}</TD><TD>{AGEGROUP}</TD></TR>"

BCDItemsCount = BCDItems.Length-1

j = -1
styletoggle = 1

For i = 0 To BCDItemsCount
	Set BCDItem = BCDItems.Item(i)

	for each child in BCDItem.childNodes
		Select case lcase(child.nodeName)
		case "bus_name"
			BCDbus = "<B>" & child.text & "</B><BR>"
		case "busdesc_s"
			BCDbus = BCDbus & child.text
		case "member_agegroup"
			BCDagegroup = "<I>age group: " & child.text & "</I><BR>"
		case "posted"
			timeoutDate = DateAdd("yyyy",1,datevalue(child.text))
			BCDagegroup = BCDagegroup & "<SPAN CLASS='date'>posted: " & child.text & "</SPAN>"
		case "busdesc_l"
			BCDbusdesc_l = child.text & "<BR>"
		case "contact_url"
			BCDbusdesc_l = BCDbusdesc_l & "<A HREF='http://" & child.text & "' TARGET='new'>" & child.text & "</A>"
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
		case "special"
			BCDspecial = child.text
		End Select
	next

	j = j+1

	if j < MaxNumberOfItems and timeoutDate > Date then 
		BCDstyleclass = "bcdcontent" & styletoggle
		ItemContent = Replace(ItemTemplate,"{STYLECLASS}",BCDstyleclass)
		ItemContent = Replace(ItemContent,"{BUSINESS}",BCDbus)
		ItemContent = Replace(ItemContent,"{DESCRIPTION}",BCDbusdesc_l)
		ItemContent = Replace(ItemContent,"{CONTACT}",BCDcontact)
		ItemContent = Replace(ItemContent,"{AGEGROUP}",BCDagegroup)
		ItemContent = Replace(ItemContent,"{SPECIAL}",BCDspecial)
		Response.Write Replace(ItemContent,"$","&#163;")
		ItemContent = ""
		if styletoggle = 1 then
			styletoggle = 0
		Else
			styletoggle = 1
		End if
	End if

Next

%>

</TABLE>

</DIV>

<!-- end of text box //-->

</BODY>
</HTML>