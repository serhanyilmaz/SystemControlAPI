using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Net.Http;
using System.Web.Http;

namespace SystemControlAPI.Controllers
{
    public class PersonSelectedDeviceDetailController : ApiController
    {
        // GET api/<controller>
        public IEnumerable<string> Get()
        {
            return new string[] { "value1", "value2" };
        }

        // GET api/<controller>/5
        public IHttpActionResult Get(int pid,int did)
        {
            PersonSelectedDeviceDetailEntities entities = new PersonSelectedDeviceDetailEntities();
            var result = entities.PersonSelectedDeviceDetail(pid, did).ToList();
            return Ok(result);
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