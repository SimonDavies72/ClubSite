﻿using System;
using System.Collections.Generic;
using System.Web.Http;

namespace grfc.Controllers
{
    public class FixtureController : ApiController
    {
        // GET api/<controller>
        public IEnumerable<string> Get()
        {
            return new string[] { "value1", "value2" };
        }

        // GET api/<controller>
        [Route("api/fixtures/{ageGroup}")]
        public IEnumerable<DiaryFixture> Get(string ageGroup)
        {
            AgeGroup ag = (AgeGroup)Enum.Parse(typeof(AgeGroup), ageGroup.ToUpper());
            var svc = new AppService();
            if (ag == AgeGroup.SENIOR)
            {
                return svc.GetAgeGroupDiaryNew(ag);
            }
            return svc.GetAgeGroupDiary(ag);
        }

        // GET api/<controller>/5
        public string Get(int id)
        {
            return "value";
        }

        // POST api/<controller>
        public void Post([FromBody]string value)
        {
        }

        // PUT api/<controller>/5
        public void Put(int id, [FromBody]string value)
        {
        }

        // DELETE api/<controller>/5
        public void Delete(int id)
        {
        }
    }
}