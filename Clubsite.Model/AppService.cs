using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.OleDb;
using System.Linq;
using System.Text;
using Dapper;

public class AppService
{
    private string connectionString = ConfigurationManager.ConnectionStrings["grfc"].ConnectionString;

    public IEnumerable<DiaryDate> GetDiaryDates()
    {
        var calendarId = 1;
        using (OleDbConnection cn = new OleDbConnection(connectionString))
        {
            cn.Open();
            var dates = cn.Query<DiaryDate>(@"select DiaryId, [Date] as FixtureDate 
            from Diary 
            where calendarId = @CalendarId
            order by Date", new { CalendarId = calendarId });
            return dates;
        }
    }

    public DiaryFixture GetDiaryFixture(int diaryId, AgeGroup group)
    {
        using (OleDbConnection cn = new OleDbConnection(connectionString))
        {
            cn.Open();
            var sql = String.Format(@"select DiaryId, [Date] as FixtureDate,
                Fixture{0}HA as FixtureHA, 
                Fixture{0}Detail as FixtureDetail,
                Fixture{0}Link as FixtureLink, 
                Fixture{0}Photos as FixturePhotos, 
                Fixture{0}Report as FixtureReport,
                Fixture{0}League as FixtureLeague
            from Diary where DiaryId = @DiaryId", group.ToString());
            var dates = cn.Query<DiaryFixture>(sql, new { DiaryId = diaryId });
            return dates.First();
        }
    }

    public void UpdateDiaryFixture(int diaryId, AgeGroup @group, string homeOrAway, string detail, string link,
        string photos, string report, bool isLeague)
    {
        using (OleDbConnection cn = new OleDbConnection(connectionString))
        {
            cn.Open();
            var sql = String.Format(@"update Diary
                set Fixture{0}Detail = @FixtureDetail, 
                Fixture{0}HA = @FixtureHA, 
                Fixture{0}Link = @FixtureLink, 
                Fixture{0}Photos = @FixturePhotos, 
                Fixture{0}Report = @FixtureReport,
                Fixture{0}League = @FixtureLeague
                where DiaryId = {1}", group.ToString(), diaryId);

            var command = cn.CreateCommand();
            command.CommandText = sql;
            command.Parameters.AddWithValue("FixtureDetail", detail);
            command.Parameters.AddWithValue("FixtureHA", homeOrAway);
            command.Parameters.AddWithValue("FixtureLink", link);
            command.Parameters.AddWithValue("FixturePhotos", photos);
            command.Parameters.AddWithValue("FixtureReport", report);
            command.Parameters.AddWithValue("FixtureLeague", isLeague);
            command.ExecuteNonQuery();
            //            var dates = cn.Execute(sql, parameters);
        }
    }

    public IEnumerable<DiaryFixture> GetAgeGroupDiary(AgeGroup ageGroup)
    {
        var calendarId = 1;
        using (OleDbConnection cn = new OleDbConnection(connectionString))
        {
            cn.Open();
            var sql = String.Format(@"select DiaryId, [Date] as FixtureDate,
                Fixture{0}HA as FixtureHA, 
                Fixture{0}Detail as FixtureDetail,
                Fixture{0}Link as FixtureLink, 
                Fixture{0}Photos as FixturePhotos, 
                Fixture{0}Report as FixtureReport,
                Fixture{0}League as FixtureLeague,
                FixtureSocialDetail <> '' as IsSocial
            from Diary
            where CalendarId = @CalendarId
            order by [Date]", ageGroup.ToString());
            return cn.Query<DiaryFixture>(sql, new { CalendarId = calendarId });
        }
    }

    public IEnumerable<DiaryFixture> GetAgeGroupDiaryNew(AgeGroup ageGroup)
    {
        var calendarId = 1;
        using (OleDbConnection cn = new OleDbConnection(connectionString))
        {
            cn.Open();
            var sql = String.Format(@"SELECT f.FixtureID AS DiaryId, cd.CalendarDate AS FixtureDate, f.Details AS FixtureDetail, f.HA AS FixtureHA, f.Link AS FixtureLink, f.Photos AS FixturePhotos, 
                         f.Report AS FixtureReport, f.League AS FixtureLeague
                         FROM (CalendarDates cd LEFT OUTER JOIN
                                (SELECT FixtureID, CalendarDateID, AgeGroup, Details, HA, Link, Photos, Report, League
                                   FROM  Fixtures
                                  WHERE (AgeGroup = '{0}')) f ON f.CalendarDateID = cd.CalendarDateID)
                         ORDER BY cd.CalendarDate", ageGroup.ToString());
            return cn.Query<DiaryFixture>(sql, new { CalendarId = calendarId });
        }
    }

    public OleDbDataReader GetDiaryReader()
    {
        var calendarId = 1;
        OleDbConnection cn = new OleDbConnection(connectionString);
        cn.Open();
        var sql = @"select * 
                    from Diary
                    where calendarId = @CalendarId
                    order by [Date]";
        var command = cn.CreateCommand();
        command.CommandText = sql;
        command.Parameters.Add(new OleDbParameter("@CalendarId", calendarId));
        return command.ExecuteReader();
    }

    public IEnumerable<DiaryFixture> GetSocialDiary()
    {
        var calendarId = 1;
        using (OleDbConnection cn = new OleDbConnection(connectionString))
        {
            cn.Open();
            var sql = @"select DiaryId, [Date] as FixtureDate,
                FixtureSocialDetail as FixtureDetail,
                FixtureSocialLink as FixtureLink, 
                FixtureSocialPhotos as FixturePhotos
            from Diary 
            where CalendarId = @CalendarId
            and FixtureSocialDetail <> ''  order by [Date] ";
            return cn.Query<DiaryFixture>(sql, new { CalendarId = calendarId });
        }
    }
    public void UpdateSocialDiaryFixture(int diaryId, string detail, string link, string photos)
    {
        using (OleDbConnection cn = new OleDbConnection(connectionString))
        {
            cn.Open();
            var sql = String.Format(@"update Diary
                set Fixture{0}Detail = @FixtureDetail, 
                Fixture{0}Link = @FixtureLink, 
                Fixture{0}Photos = @FixturePhotos
                where DiaryId = {1}", AgeGroup.Social.ToString(), diaryId);

            var command = cn.CreateCommand();
            command.CommandText = sql;
            command.Parameters.AddWithValue("FixtureDetail", detail);
            command.Parameters.AddWithValue("FixtureLink", link);
            command.Parameters.AddWithValue("FixturePhotos", photos);
            command.ExecuteNonQuery();
        }
    }

    public IEnumerable<RotaItem> GetRota()
    {
        var calendarId = 1;
        using (OleDbConnection cn = new OleDbConnection(connectionString))
        {
            cn.Open();
            var sql = @"select DiaryId, 
                [Date],
                Rota 
                from Diary
                where calendarId = @CalendarId
                Order By Date";
            return cn.Query<RotaItem>(sql, new { CalendarId = calendarId });
        }

    }

    public IEnumerable<RotaItem> GetRota(int calendarId)
    {
        using (OleDbConnection cn = new OleDbConnection(connectionString))
        {
            cn.Open();
            var sql = @"select CalendarDateId as DiaryId, 
                [CalendarDate],
                Rota 
                from CalendarDates
                where calendarId = @CalendarId
                Order By CalendarDate";
            return cn.Query<RotaItem>(sql, new { CalendarId = calendarId });
        }
    }

    public void UpdateRota(int diaryId, string rota)
    {
        using (OleDbConnection cn = new OleDbConnection(connectionString))
        {
            cn.Open();
            var sql = String.Format(@"update Diary
                set Rota = @Rota
                where DiaryId = {0}", diaryId);

            var command = cn.CreateCommand();
            command.CommandText = sql;
            command.Parameters.AddWithValue("Rota", rota);
            command.ExecuteNonQuery();
        }
    }


    public IEnumerable<Contact> GetCommitteeContacts(string ageGroup)
    {
        using (OleDbConnection cn = new OleDbConnection(connectionString))
        {
            cn.Open();
            var sql = String.Format(@"select ContactId,Title,Name,Phone,Email,Photo from Contacts 
                    where AgeGroup='Committee' AND Title Like '%{0}%' 
                    Order By ContactID", ageGroup);
            return cn.Query<Contact>(sql, new { });
        }
    }

    public IEnumerable<Contact> GetAllCommitteeContacts()
    {
        using (OleDbConnection cn = new OleDbConnection(connectionString))
        {
            cn.Open();
            var sql = @"select ContactId,Title,Name,Phone,Email,Photo from Contacts 
                    where AgeGroup='Committee' 
                    Order By ContactID";
            return cn.Query<Contact>(sql, new { });
        }
    }

    public IEnumerable<Contact> GetOtherContacts()
    {
        using (OleDbConnection cn = new OleDbConnection(connectionString))
        {
            cn.Open();

            var sql = @"select ContactId,Title,Name,Phone,Email,Photo from Contacts 
                    where AgeGroup='Other'
                    Order By ContactID";
            return cn.Query<Contact>(sql, new { });
        }
    }

    public IEnumerable<Contact> GetAllAgeGroupContacts()
    {
        using (OleDbConnection cn = new OleDbConnection(connectionString))
        {
            cn.Open();

            var sql = @"select ContactId,Title,Name,Phone,Email,Photo from Contacts 
                    where AgeGroup='Micros' or AgeGroup='Minis' or AgeGroup='Youth' or AgeGroup='Girls' or AgeGroup='Senior'
                    Order By ContactID";
            return cn.Query<Contact>(sql, new { });
        }
    }
    public IEnumerable<Contact> GetAgeGroupContacts(List<string> ageGroups)
    {
        using (OleDbConnection cn = new OleDbConnection(connectionString))
        {
            cn.Open();
            string ageGroupSql = string.Join(", ", ageGroups.Select(a => "'" + a + "'").ToArray());
            var sql = String.Format(@"select ContactId,Title,Name,Phone,Email,Photo from Contacts 
                    where AgeGroup in ({0})
                    Order By ContactID", ageGroupSql);
            return cn.Query<Contact>(sql, new { });
        }
    }

    public IEnumerable<NewsItem> GetNewsItems()
    {
        using (OleDbConnection cn = new OleDbConnection(connectionString))
        {
            cn.Open();
            var sql = @"select * from News 
                    Order By DateCreated desc";
            return cn.Query<NewsItem>(sql, new { });
        }
    }


    public SiteSettings GetSiteSettings()
    {
        using (OleDbConnection cn = new OleDbConnection(connectionString))
        {
            cn.Open();
            var sql = @"select * from SiteSettings";
            return cn.Query<SiteSettings>(sql, new { }).FirstOrDefault();
        }
    }

    public void SaveSiteMessage(string message)
    {
        using (OleDbConnection cn = new OleDbConnection(connectionString))
        {
            cn.Open();
            var sql = String.Format(@"update SiteSettings
                set SiteHeaderMessage = @Message");

            var command = cn.CreateCommand();
            command.CommandText = sql;
            command.Parameters.AddWithValue("Messsage", message);
            command.ExecuteNonQuery();
        }
    }

    public void ClearSiteMessage()
    {
        SaveSiteMessage(String.Empty);
    }

    public IEnumerable<Contact> GetContacts()
    {
        using (OleDbConnection cn = new OleDbConnection(connectionString))
        {
            cn.Open();
            var sql = String.Format(@"select ContactId,AgeGroup,Title,Name,Phone,Email 
                    from Contacts 
                    Order By ContactID");
            return cn.Query<Contact>(sql, new { });
        }

    }

    public Contact GetContact(int contactId)
    {
        using (OleDbConnection cn = new OleDbConnection(connectionString))
        {
            cn.Open();
            var sql = String.Format(@"select ContactId,AgeGroup,Title,Name,Phone,Email 
                    from Contacts 
                    where contactid = {0}", contactId);
            return cn.Query<Contact>(sql, new { }).FirstOrDefault();
        }
    }

    public void UpdateContact(int contactId, string agegroup, string title, string photo, string name, string phone,
        string email)
    {
        using (var cn = new OleDbConnection(connectionString))
        {
            cn.Open();
            var sql = String.Format(@"update contacts
                set ageGroup = @ageGroup,
                    title = @title,
                    photo = @photo,
                    name = @name,
                    phone = @phone,
                    email = @email
                where contactId = {0}", contactId);

            var command = cn.CreateCommand();
            command.CommandText = sql;
            command.Parameters.AddWithValue("ageGroup", agegroup);
            command.Parameters.AddWithValue("title", title);
            command.Parameters.AddWithValue("photo", photo);
            command.Parameters.AddWithValue("name", name);
            command.Parameters.AddWithValue("phone", phone);
            command.Parameters.AddWithValue("email", email);
            command.ExecuteNonQuery();
        }

    }

    public IEnumerable<NewsItem> GetActiveNewsItems()
    {
        return
            GetNewsItems()
                .Where(n => !n.DateArchived.HasValue || n.DateArchived >= DateTime.Today)
                .OrderByDescending(n => n.DateCreated);
    }

    public NewsItem GetNewsItem(int newsId)
    {
        using (OleDbConnection cn = new OleDbConnection(connectionString))
        {
            cn.Open();
            var sql = String.Format(@"select id, headline, detail, datecreated, datearchived 
                    from News 
                    where id = {0}", newsId);
            return cn.Query<NewsItem>(sql, new { }).FirstOrDefault();
        }
    }

    public void SaveNews(int id, string title, string body, DateTime? archiveDate)
    {
        using (var cn = new OleDbConnection(connectionString))
        {
            cn.Open();
            if (id > 0)
            {
                var sql = @"update news
                set headline = @headline,
                    detail = @detail";
                if (archiveDate.HasValue)
                {
                    sql += " ,dateArchived = @dateArchived ";
                }
                sql += " where id = " + id;

                var command = cn.CreateCommand();
                command.CommandText = sql;
                command.Parameters.AddWithValue("headline", title);
                command.Parameters.AddWithValue("detail", body);
                if (archiveDate.HasValue)
                {
                    command.Parameters.AddWithValue("dateArchived", archiveDate);
                }
                command.ExecuteNonQuery();

            }
            else
            {
                var command = cn.CreateCommand();
                var sql =
                    @"insert into news (headline, detail, datecreated, datearchived) values (@headline, @detail,@datecreated, @dateArchived)";
                if (!archiveDate.HasValue)
                {
                    sql = @"insert into news (headline, detail,datecreated) values (@headline, @detail,@datecreated)";
                }

                command.CommandText = sql;
                command.Parameters.AddWithValue("headline", title);
                command.Parameters.AddWithValue("detail", body);
                command.Parameters.AddWithValue("datecreated", DateTime.Today.Date);
                if (archiveDate.HasValue)
                {
                    command.Parameters.AddWithValue("dateArchived", archiveDate.Value);
                }
                command.ExecuteNonQuery();
            }
        }
    }

    public void DeleteNews(int newsId)
    {
        var sql = @"delete from news where id = " + newsId;

        using (var cn = new OleDbConnection(connectionString))
        {
            cn.Open();

            var command = cn.CreateCommand();
            command.CommandText = sql;
            command.ExecuteNonQuery();
        }
    }

    public void AddDiaryDate(DateTime newDate)
    {
        using (var cn = new OleDbConnection(connectionString))
        {
            cn.Open();

            var command = cn.CreateCommand();
            var sql = @"insert into diary ([Date]) values (@newDate)";

            command.CommandText = sql;
            command.Parameters.AddWithValue("newDate", newDate);

            command.ExecuteNonQuery();
        }
    }

    public void AddSocialDiaryDate(DateTime newDate)
    {
        using (var cn = new OleDbConnection(connectionString))
        {
		        cn.Open();

                var command = cn.CreateCommand();
                var sql = @"insert into diary ([Date], FixtureSocialDetail) values (@newDate, 'new social event')";

                command.CommandText = sql;
                command.Parameters.AddWithValue("newDate", newDate);

                command.ExecuteNonQuery();
	    }
    }

    public void DeleteDiaryItem(int diaryId)
    {
        using (var cn = new OleDbConnection(connectionString))
        {
            cn.Open();

            var command = cn.CreateCommand();
            var sql = "delete from diary where DiaryId = " + diaryId;

            command.CommandText = sql;

            command.ExecuteNonQuery();
        }
    }
}