using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Net.Http;
using System.Web.Http;

namespace SystemControlAPI.Controllers
{
    public class AllPersonController : ApiController
    {
        // GET api/<controller>
        public IHttpActionResult Get()
        {
            AllPersonEntities entities = new AllPersonEntities();
            var result = entities.AllPerson().ToList();
            return Ok(result);

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