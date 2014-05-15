<%@ Control Language="C#" AutoEventWireup="true" CodeFile="NewsTicker.ascx.cs" Inherits="includes_NewsTicker" %>

<table class='newsbox' width='100%' style="background-color:#CCC">
    <tr>
        <td>
            <span class="boxheading">Guildfordians headlines&nbsp;&nbsp;<a href='rss/news_final.xml'><img
                src='nav_images/feed.gif' width='16' height='16' border='0'></a></span><br>
            <marquee scrollamount='2' scrolldelay='40' hspace='5' truespeed onmouseover="this.stop()"
                onmouseout="this.start()">
                <asp:Repeater ID="NewsRepeater" runat="server">
                    <ItemTemplate>
                        <A HREF='<%# Eval("NavigateUrl") %>' CLASS='scroll-link'><%# Eval("Title") %></A>"
                    </ItemTemplate>
                </asp:Repeater>
            </marquee>
        </td>
    </tr>
</table>
