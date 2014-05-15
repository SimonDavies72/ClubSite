<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
   "http://www.w3.org/TR/html4/loose.dtd">
<HTML>
<HEAD>
    <link href="http://www.grfc.co.uk/rss/news.xml" rel="alternate" type="application/rss+xml" title="Guildfordians RFC News" />
    <TITLE>Guildfordians RFC - News</TITLE>
<!--#include virtual="includes/standardpage.inc"-->

<DIV CLASS="textbox">
<P>
    <B><I>Guildfordians RFC >> News</I></B>&nbsp;&nbsp;<A HREF="rss/news_final.xml"><IMG SRC="nav_images/feed.gif" WIDTH="16" HEIGHT="16" BORDER="0"></A>
</P>

<P>
<%
newsURL = "/rss/news_final.xml"

SetLocale(2057)
Response.Expires = -1

ItemTemplate = "<P><A NAME='" & "{NAME}" & "' CLASS='heading'>{TITLE}</A></P><P><SPAN CLASS='date'>- added {PUBDATE}</SPAN><SPAN CLASS='date_hide'>- archived {ARCHIVED}</SPAN></P>{DETAIL}"

Set xmlDOM = Server.CreateObject("MSXML2.DomDocument.6.0")
xmlDOM.async = false
xmlDOM.Load(Server.MapPath(newsURL))
Set RSSItems = xmlDOM.getElementsByTagName("item") ' collect all "items" from downloaded RSS
Set xmlDOM = Nothing ' clear XML

RSSItemsCount = RSSItems.Length-1

j = -1

For i = 0 To RSSItemsCount
	Set RSSItem = RSSItems.Item(i)

	RSSDetail = ""

	for each child in RSSItem.childNodes
		Select case lcase(child.nodeName)
		case "title"
			RSStitle = child.text
		case "pubdate"
			RSSpubdate = Left(child.text,Len(child.text)-13)
		case "archived"
			RSSarchived = Left(child.text,Len(child.text)-13)
		case "link"
			RSSLink = child.text
			RSSName = Right(child.text,Len(child.text)-InStr(child.text,"#"))
		case "description"
			RSSDetail = RSSDetail & "<P>" & child.text & "</P>"
		End Select
	next


		ItemContent = Replace(ItemTemplate,"{TITLE}",RSSTitle)
		ItemContent = Replace(ItemContent,"{PUBDATE}",RSSpubdate)
		ItemContent = Replace(ItemContent,"{ARCHIVED}",RSSarchived)
		ItemContent = Replace(ItemContent,"{LINK}",RSSlink)
		ItemContent = Replace(ItemContent,"{NAME}",RSSName)
		ItemContent = Replace(ItemContent,"{DETAIL}",RSSDetail)
		Response.Write Replace(ItemContent,"$","&#163;")
		ItemContent = ""
Next

%>

</P>

</DIV>

<!-- end of text box //-->

</BODY>
</HTML>