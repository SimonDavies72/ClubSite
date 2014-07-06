<%@ Control Language="C#" AutoEventWireup="true" Inherits="includes_Sponsors" Codebehind="Sponsors.ascx.cs" %>
            <table class="newsbox" width="200">
                <tr>
                    <td align="center" class="boxheading">With thanks to our sponsors</td>
                </tr>
                <tr>
                    <td>
                        <hr width="75%" size="1">
                    </td>
                </tr>

                <asp:Repeater ID="SponsorRepeater" runat="server">
                    <ItemTemplate>
                        <tr>
                            <td align="Center"><a href='<%# Eval("NavigateUrl")%>' target="New">
                                <img src='<%# Eval("ImageUrl")%>' border="0" alt='<%# Eval("Name")%>' align="absmiddle"></a>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <hr width="75%" size="1">
                            </td>
                        </tr>
                    </ItemTemplate>
                </asp:Repeater>
            </table>
