using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Mvc;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using UPC.APIBusiness.DBContext.Interface;
using UPC.APIBusiness.DBEntity.Model;

namespace UPC.APIBusiness.API.Controllers
{
    /// <summary>
    ///     
    /// </summary>
    [Produces("application/json")]
    [Route("api/people")]
    [ApiController]
    public class PersonaController : Controller
    {
        /// <summary>
        /// 
        /// </summary>
        protected readonly IPersonaRepository _personaRepository;

        /// <summary>
        /// 
        /// </summary>
        /// <param name="personaRepository"></param>
        public PersonaController(IPersonaRepository personaRepository)
        {
            _personaRepository = personaRepository;
        }

        /// <summary>
        /// 
        /// </summary>
        /// <param name="persona"></param>
        /// <returns></returns>
        [Produces("application/json")]
        [AllowAnonymous]
        [HttpPost]
        [Route("insert")]
        public ActionResult Insert(EntityPersonaBasic persona)
        {
            var ret = _personaRepository.Insert(persona);
            if (ret == null)
                return StatusCode(401);

            return Json(ret);
        }

        /// <summary>
        /// 
        /// </summary>
        /// <param name="idPersona"></param>
        /// <returns></returns>
        [Produces("application/json")]
        [AllowAnonymous]
        [HttpGet]
        [Route("GetUserById")]
        public ActionResult GetUserById(int idPersona)
        {
            var ret = _personaRepository.FindById(idPersona);
            if (ret == null)
                return StatusCode(401);
            return Json(ret);
        }

        /// <summary>
        /// 
        /// </summary>
        /// <param name="persona"></param>
        /// <returns></returns>
        [Produces("application/json")]
        [AllowAnonymous]
        [HttpPost]
        [Route("update")]
        public ActionResult Update(EntityPersonaUpdate persona)
        {
            var ret = _personaRepository.Update(persona);
            if (ret == null)
                return StatusCode(401);

            return Json(ret);
        }
    }
}
