using System;
using System.Collections.Generic;
using System.Linq;
using System.Runtime.Serialization;
using System.Text;

[DataContract]
public class DiaryFixture
{
    [DataMember]
    public int DiaryId { get; set; }

    [DataMember]
    public DateTime FixtureDate { get; set; }

    [DataMember]
    public string FixtureHA { get; set; }
    [DataMember]
    public string FixtureDetail { get; set; }
    [DataMember]
    public string FixtureLink { get; set; }
    [DataMember]
    public string FixturePhotos { get; set; }
    [DataMember]
    public string FixtureReport { get; set; }
    [DataMember]
    public bool FixtureLeague { get; set; }
}
