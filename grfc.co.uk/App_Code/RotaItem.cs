using System;
using System.Runtime.Serialization;

[DataContract]
public class RotaItem
{
    [DataMember]
    public int DiaryId { get; set; }
    [DataMember]
    public DateTime Date { get; set; }
    [DataMember]
    public string Rota { get; set; }
}