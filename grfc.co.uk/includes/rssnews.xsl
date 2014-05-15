<?xml version="1.0" encoding="ISO-8859-1"?>

<xsl:stylesheet version="1.0"
xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

<xsl:template match="/">
  <html>
  <HEAD>
  <TITLE><xsl:value-of select="rss/channel/title" /></TITLE>
  <link href="http://www.grfc.co.uk/rss/news.xml" rel="alternate" type="application/rss+xml" title="Guildfordians Rugby News" />
  </HEAD>
  <body>
	<P><B><I>Guildfordians Rugby RSS feed</I></B></P>
	<P>This page is an "RSS feed" from Guildfordians Rugby, and enables you to keep up with the Guildfordians headlines without visiting our web pages.</P>

	<P>There are a number of ways you can use this feed, including:
	<UL>
	<LI>Web browsers</LI>
	<LI>Email programs</LI>
	<LI>News readers</LI>
	</UL>
	</P>
	<P><B>Web browsers</B></P>
	<P>The easiest way to make use of this feed is if you use the latest versions of certain web browsers (including <B>Firefox</B>, <B>IE7</B>, and <B>Safari</B>) which enable you to add special bookmarks/favourites. Generally, you will need to create a "live" bookmark or favourite in your web browser (some have an "RSS" icon: <IMG SRC="http://www.grfc.co.uk/nav_images/feed.gif" WIDTH="16" HEIGHT="16" BORDER="0" /> or <IMG SRC="http://www.grfc.co.uk/nav_images/safari_rss.jpg" WIDTH="29" HEIGHT="16" BORDER="0" />, in the address bar or toolbar).</P>

	<P><B>Email programs</B></P>

	<P>Some email programs will allow RSS news feeds to automatically send entries to your inbox.</P>

	<P><B>News readers</B></P>
	<P>You can also use an RSS news reader, or aggregator, many of which are freely available either as software, or a web based service (such as <B>Google reader</B>). With these, you will normally need to copy and paste the address of this file (see address bar above) into your newsreader or service page.</P>

	<P>For further information, see the instructions relating to your chosen method of reading newsfeeds.</P>

	<HR SIZE="3" />

	<P><B><I><xsl:value-of select="rss/channel/title" /></I></B></P>

	<xsl:for-each select="rss/channel/item">
		<P><FONT COLOR="#660000"><xsl:value-of select="title" /></FONT></P>
		<P><FONT COLOR="#006600" SIZE="-1"><xsl:value-of select="description" /></FONT></P>
	</xsl:for-each>
  </body>

  </html>
</xsl:template>

</xsl:stylesheet>