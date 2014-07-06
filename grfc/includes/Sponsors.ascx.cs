using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class includes_Sponsors : System.Web.UI.UserControl
{
    protected List<Sponsor> Sponsors;

    protected void Page_Load(object sender, EventArgs e)
    {
        var sponsors = new List<Sponsor>(){
            new Sponsor{
                Name = "Curchods",
                ImageUrl = "ad_graphics/curchods_small.jpg",
                NavigateUrl = "http://www.curchods.com/" 
            },
            new Sponsor{
                Name = "Squire Furneaux",
                ImageUrl = "ad_graphics/squirefurneaux_small.jpg",
                NavigateUrl = "http://www.squirefurneaux.co.uk/" 
            },
            new Sponsor{
                Name = "Burns & Webber",
                ImageUrl = "ad_graphics/bandw_small.jpg",
                NavigateUrl = "http://www.burnsandwebber.com/" 
            },
            new Sponsor{
                Name = "K2",
                ImageUrl = "ad_graphics/k2_small.jpg",
                NavigateUrl = "http://www.k2moving.co.uk/" 
            },
            new Sponsor{
                Name = "Guildford Tup",
                ImageUrl = "ad_graphics/tup_small.jpg",
                NavigateUrl = "http://www.theguildfordtup.com/" 
            },
            new Sponsor{
                Name = "BMI Mount Alvernia",
                ImageUrl = "ad_graphics/bmi_small.jpg",
                NavigateUrl = "http://www.bmihealthcare.co.uk/" 
            },
        };

        var rnd = new Random();
        
        SponsorRepeater.DataSource = sponsors.OrderBy(x => rnd.Next()).ToList();
        SponsorRepeater.DataBind();
    }
}

