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
{
    /// <summary>
    /// 
    /// </summary>
    [Produces ("application/json")]
    [Route("api/stock")]
    [ApiController]
    public class StockController : Controller
    {
        /// <summary>
        /// 
        /// </summary>
        protected readonly IStockRepository _StockRepository;

        /// <summary>
        /// 
        /// </summary>
        /// <param name="stockRepository"></param>
        public StockController(IStockRepository stockRepository)
        {
            _StockRepository = stockRepository;
        }

        /// <summary>
        /// 
        /// </summary>
        /// <returns></returns>
        [Produces("application/json")]
        [AllowAnonymous]
        [HttpGet]
        [Route("GetStock")]
        public ActionResult GetStock()
        {
            var ret = _StockRepository.GetStock();
            if (ret == null)
                return StatusCode(401);
            return Json(ret);
        }

        /// <summary>
        /// 
        /// </summary>
        /// <param name="stockByCategory"></param>
        /// <returns></returns>
        [Produces("application/json")]
        [AllowAnonymous]
        [HttpPost]
        [Route("GetStockByCatogory")]        
        public ActionResult GetStock(EntityStockByCategory stockByCategory)
        {
            var ret = _StockRepository.GetStock(stockByCategory);
            if (ret == null)
                return StatusCode(401);
            return Json(ret);
        }

        /// <summary>
        /// 
        /// </summary>
        /// <param name="stockByProduct"></param>
        /// <returns></returns>
        [Produces("application/json")]
        [AllowAnonymous]
        [HttpPost]
        [Route("GetStockByProduct")]
        public ActionResult GetStock(EntityStockByProduct stockByProduct)
        {
            var ret = _StockRepository.GetStock(stockByProduct);
            if (ret == null)
                return StatusCode(401);
            return Json(ret);
        }

        /// <summary>
        /// 
        /// </summary>
        /// <returns></returns>
        [Produces("application/json")]
        [AllowAnonymous]
        [HttpGet]
        [Route("GetCategory")]
        public ActionResult GetCategory()
        {
            var ret = _StockRepository.GetCategoryBanner();
            if (ret == null)
                return StatusCode(401);
            return Json(ret);
        }

        /// <summary>
        /// 
        /// </summary>
        /// <returns></returns>
        [Produces("application/json")]
        [AllowAnonymous]
        [HttpGet]
        [Route("GetBanners")]
        public ActionResult GetBanners()
        {
            var ret = _StockRepository.GetProductoBanner();
            if (ret == null)
                return StatusCode(401);
            return Json(ret);
        }
    }

}
