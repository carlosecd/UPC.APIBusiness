using DBContext;
using DBEntity;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Mvc;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using UPC.APIBusiness.DBContext.Interface;

namespace UPC.APIBusiness.API.Controllers
{
    /// <summary>
    /// 
    /// </summary>
    [Produces("application/json")]
    [Route("api/login")]
    [ApiController]
    public class VentaController : Controller
    {
        /// <summary>
        /// 
        /// </summary>
        protected readonly IVentaRepository _ventaRepository;

        /// <summary>
        /// 
        /// </summary>
        /// <param name="ventaRepository"></param>
        public VentaController(IVentaRepository ventaRepository)
        {
            _ventaRepository = ventaRepository;
        }

        /// <summary>
        /// 
        /// </summary>
        /// <param name="registroVenta"></param>
        /// <returns></returns>
        [Produces("application/json")]
        [AllowAnonymous]
        [HttpPost]
        [Route("RegistrarEnCanastilla")]
        public ActionResult RegistrarEnCanastilla(EntityRegistroVenta registroVenta)
        {
            var ret = _ventaRepository.SetRegistroVenta(registroVenta);
            if (ret == null)
                return StatusCode(401);
            return Json(ret);
        }

        /// <summary>
        /// 
        /// </summary>
        /// <param name="idCliente"></param>
        /// <returns></returns>
        [Produces("application/json")]
        [AllowAnonymous]
        [HttpGet]
        [Route("ListaCanastillaPorCliente")]
        public ActionResult ListaCanastillaPorCliente(int idCliente)
        {
            var ret = _ventaRepository.GetCanastillaPendientePorCliente(idCliente);
            if (ret == null)
                return StatusCode(401);

            return Json(ret);
        }

        /// <summary>
        /// 
        /// </summary>
        /// <param name="idCliente"></param>
        /// <returns></returns>
        [Produces("application/json")]
        [AllowAnonymous]
        [HttpGet]
        [Route("GetIdVentaCliente")]
        public ActionResult GetIdVentaCliente(int idCliente)
        {
            var ret = _ventaRepository.GetIdVentaPorCliente(idCliente);
            if (ret == null)
                return StatusCode(401);

            return Json(ret);
        }

        /// <summary>
        /// 
        /// </summary>
        /// <param name="idCliente"></param>
        /// <returns></returns>
        [Produces("application/json")]
        [AllowAnonymous]
        [HttpGet]
        [Route("GetCantidadPorCliente")]
        public ActionResult GetCantidadPorCliente(int idCliente)
        {
            var ret = _ventaRepository.GetCantiadPorCliente(idCliente);
            if (ret == null)
                return StatusCode(401);

            return Json(ret);
        }

        /// <summary>
        /// 
        /// </summary>
        /// <param name="idDetalle"></param>
        /// <returns></returns>
        [Produces("application/json")]
        [AllowAnonymous]
        [HttpGet]
        [Route("DeleteCanastillaDetalle")]
        public ActionResult DeleteCanastillaDetalle(int idDetalle)
        {
            var ret = _ventaRepository.DeleteDetalle(idDetalle);
            if (ret == null)
                return StatusCode(401);
            return Json(ret);
        }

        /// <summary>
        /// 
        /// </summary>
        /// <param name="idDetalle"></param>
        /// <param name="cantidad"></param>
        /// <returns></returns>
        [Produces("application/json")]
        [AllowAnonymous]
        [HttpGet]
        [Route("UpdateCanastillaDetalle")]
        public ActionResult UpdateCanastillaDetalle(int idDetalle, decimal cantidad)
        {
            var ret = _ventaRepository.UpdateCantiadDetalle(idDetalle, cantidad);
            if (ret == null)
                return StatusCode(401);
            return Json(ret);
        }
    }
}
