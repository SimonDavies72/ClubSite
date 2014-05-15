using System;

public class NewsItem
{
    public int ID { get; set; }
    public string Headline { get; set; }
    public string Detail { get; set; }
    public DateTime DateCreated { get; set; }
    public DateTime? DateArchived { get; set; }
}