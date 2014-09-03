            <table class="newsbox" width="200">
                <tr>
                    <td align="center" class="boxheading">With thanks to our sponsors</td>
                </tr>
                <tr>
                    <td>
                        <hr width="75%" size="1">
                    </td>
                </tr>

                <%
    'array for randomized ad banners
    DIM LinkArray(6,3)

    LinkArray(0,1)="http://www.curchods.com/" 
    LinkArray(0,2)="Curchods"
    LinkArray(0,3)="ad_graphics/curchods_small.jpg"

    LinkArray(1,1)="http://www.burnsandwebber.com/" 
    LinkArray(1,2)="Burns & Webber"
    LinkArray(1,3)="ad_graphics/bandw_small.jpg"

    LinkArray(2,1)="http://www.k2moving.co.uk/" 
    LinkArray(2,2)="K2"
    LinkArray(2,3)="ad_graphics/k2_small.jpg"

    LinkArray(3,1)="http://www.theguildfordtup.com" 
    LinkArray(3,2)="Guildford Tup"
    LinkArray(3,3)="ad_graphics/tup_small.jpg"

    LinkArray(4,1)="http://www.thejadegroup.co.uk/" 
    LinkArray(4,2)="The Jade Group"
    LinkArray(4,3)="ad_graphics/jade_small.png"

    LinkArray(5,1)="http://www.dynamyx.com/" 
    LinkArray(5,2)="Dynamix"
    LinkArray(5,3)="ad_graphics/dynamyx_small.png"

    LinkArray(6,1)="http://www.optegra.com/" 
    LinkArray(6,2)="Optegra"
    LinkArray(6,3)="ad_graphics/optegra_small.jpg"

    Randomize
    NotChooseUsAgain = "#"
    FOR i=0 TO UBound(LinkArray)
      WHILE NOT OK 
        RandomVar = Int(Rnd * (Ubound(LinkArray)+1)) 
        IF InStr(NotChooseUsAgain,"#" & RandomVar & "#")=0 THEN
    		    OK = true
    		    NotChooseUsAgain = NotChooseUsAgain & RandomVar & "#"
        END IF
      WEND
                %>

                <tr>
                    <td align="Center"><a href="<%=LinkArray(RandomVar,1)%>" target="New">
                        <img src="<%=LinkArray(RandomVar,3)%>" border="0" alt="<%=LinkArray(RandomVar,2)%>"
                            align="absmiddle"></a></td>
                </tr>
                <tr>
                    <td>
                        <hr width="75%" size="1">
                    </td>
                </tr>

                <%
      OK = false
    NEXT
                %>
            </table>
