using System;
using System.Collections.Generic;
using System.Linq;
using System.Runtime.Serialization;
using System.Text;

public class DiaryFixture
{
    public int DiaryId { get; set; }

    public DateTime FixtureDate { get; set; }

    public string FixtureHA { get; set; }
    public string FixtureDetail { get; set; }
    public string FixtureLink { get; set; }
    public string FixturePhotos { get; set; }
    public string FixtureReport { get; set; }
    public bool FixtureLeague { get; set; }

}
