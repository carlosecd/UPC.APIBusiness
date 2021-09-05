using DBContext;
using DBEntity;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Mvc;
using Newtonsoft.Json;
using NSwag.Annotations;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Net.Http;
using System.Security.Claims;
using System.Threading.Tasks;

namespace UPC.APIBusiness.API.Controllers
{   /// <summary>
    ///     
    /// </summary>
    [Produces("application/json")]
    [Route("api/login")]
    [ApiController]
    public class LoginController : Controller
    {/// <summary>
     /// 
     /// </summary>    
        protected readonly ILoginRepository _LoginRepository;
        /// <summary>
        /// 
        /// </summary>
        /// <param name="LoginRepository"></param>
        public LoginController(ILoginRepository LoginRepository)
        {
            _LoginRepository = LoginRepository;
        }
        /// <summary>
        /// 
        /// </summary>
        /// <returns></returns>
        [Produces("application/json")]
        [AllowAnonymous]
        [HttpPost]
        [Route("login")]
        public ActionResult Login(EntityLogin login)
        {
            var ret = _LoginRepository.GetLogin(login);
            if (ret == null)
                return StatusCode(401);
            return Json(ret);
        }
    }
}
