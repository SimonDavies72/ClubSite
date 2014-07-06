using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Net.Http;
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
            AgeGroup ag = (AgeGroup)Enum.Parse(typeof(AgeGroup), ageGroup);
            var svc = new AppService();
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