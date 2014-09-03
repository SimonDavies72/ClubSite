using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Net.Http;
using System.Web.Http;

public class RotaController : ApiController
{
    AppService appService = new AppService();

    // GET api/<controller>
    public IEnumerable<RotaItem> Get()
    {
        return appService.GetRota();
    }

    // GET api/<controller>/5
    public IEnumerable<RotaItem> Get(int id)
    {
        return appService.GetRota(id);
    }
}
