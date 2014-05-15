<%@ Page Title="" Language="C#" MasterPageFile="~/Site.master" AutoEventWireup="true" CodeFile="Default.aspx.cs" Inherits="_Default" %>
<%@ Register Src="~/includes/NewsTicker.ascx" TagPrefix="uc1" TagName="NewsTicker" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    
        <table width="100%" cellpadding="10" cellspacing="0">
            <tr>

                <td width="220" valign="Top">
<a class="twitter-timeline" data-dnt="true" href="https://twitter.com/OldGuildfordian" data-widget-id="316303809146130432">Tweets by @OldGuildfordian</a>
<script>!function(d,s,id){var js,fjs=d.getElementsByTagName(s)[0];if(!d.getElementById(id)){js=d.createElement(s);js.id=id;js.src="//platform.twitter.com/widgets.js";fjs.parentNode.insertBefore(js,fjs);}}(document,"script","twitter-wjs");</script>

                </td>

                <td valign="Top">
                    <h1 style="border:1px white solid;margin-bottom: 0px; padding:10px;">News</h1>
                    <div style="background-color: white; padding:10px;">
                        
                        <%
                            var news = GetNewsItems();
                            foreach (var item in news)
                            {
%>
                            <h2><%=item.Headline %><SPAN CLASS='date-added'><%=item.DateCreated.ToShortDateString() %></SPAN></h2>
                            <div class="news-content"><%=item.Detail %>
                                
                            </div>
                            
                        <%  
                            }
                        %>
     </div>         
                    &nbsp;      
                    <div class="newsbox">
                        <p class="boxheading">With thanks to our sponsors:</p>
                        <div class="frame">
                            <a href="http://www.k2moving.co.uk/" target="new" border="0">
                                <img src="ad_graphics/k2_small.jpg" alt="K2" border="0"></a>
                        </div>
                        <div class="frame">
                            <a href="http://www.curchods.com/" target="new" border="0">
                                <img src="ad_graphics/curchods_small.jpg" alt="Curchods" border="0"></a>
                        </div>
                        <div class="frame">
                            <a href="http://www.theguildfordtup.webs.com" target="new" border="0">
                                <img src="ad_graphics/tup_small.jpg" alt="Guildford Tup" border="0"></a>
                        </div>
                        <div class="frame">
                            <a href="http://www.burnsandwebber.com/" target="new" border="0">
                                <img src="ad_graphics/bandw_small.jpg" alt="Burns and Webber" border="0"></a>
                        </div>
                        <div class="frame">
                            <a href="http://www.thejadegroup.co.uk/" target="new" border="0">
                                <img src="ad_graphics/jade_small.png" border="0"></a>
                        </div>
                    </div>
                 </td>  
                </tr>
            </table>   
</asp:Content>

