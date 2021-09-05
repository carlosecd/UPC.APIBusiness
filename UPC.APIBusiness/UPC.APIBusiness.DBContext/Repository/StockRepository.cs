using Dapper;
using DBEntity;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using UPC.APIBusiness.DBEntity.Model.Category;

namespace DBContext
{
    public class StockRepository : BaseRepository, IStockRepository
    {
        private ResponseBase response(bool success, string code,
            string message, object data)
        {
            return new ResponseBase()
            {
                issuccess = success,
                errocode = code,
                erromessage = message,
                Data = data
            };
        }

        public ResponseBase GetCategoryBanner()
        {
            var outResponse = new ResponseBase();
            var categoryResponse = new List<EntityCategoryBanner>();
            try
            {
                using (var db = GetSqlConnection())
                {
                    const string sql = "usp_Categoria_Banner";
                    categoryResponse = db.Query<EntityCategoryBanner>(sql, commandType: CommandType.StoredProcedure).ToList();

                    if (categoryResponse != null)
                    {
                        outResponse = response(true, "0000", string.Empty, categoryResponse);
                    }
                    else
                    {
                        outResponse = response(false, "0000", string.Empty, null);
                    }
                }
            }
            catch (Exception ex)
            {
                outResponse = response(false, "0001", ex.Message, null);
            }
            return outResponse;
        }

        public ResponseBase GetStock()
        {
            var returnEntity = new ResponseBase();
            var stockResponse = new List<EntityStockResponse>();
            try
            {
                using (var db = GetSqlConnection())
                {
                    const string sql = @"usp_Stock";
                    stockResponse = db.Query<EntityStockResponse>(sql, commandType: CommandType.StoredProcedure).ToList();

                }
                if (stockResponse != null)
                {
                    returnEntity.issuccess = true;
                    returnEntity.errocode = "00000";
                    returnEntity.erromessage = string.Empty;
                    returnEntity.Data = stockResponse;
                }
                else
                {
                    returnEntity.issuccess = false;
                    returnEntity.errocode = "00000";
                    returnEntity.erromessage = string.Empty;
                    returnEntity.Data = null;
                }
            }
            catch (Exception ex)
            {
                returnEntity.issuccess = false;
                returnEntity.errocode = "00001";
                returnEntity.erromessage = ex.Message;
                returnEntity.Data = null;

            }
            return returnEntity;
        }

        public ResponseBase GetStock(EntityStockByCategory stockByCategory)
        {
            var returnEntity = new ResponseBase();
            var stockResponse = new List<EntityStockResponse>();
            try
            {
                using (var db = GetSqlConnection())
                {
                    const string sql = @"usp_stock_ByCategory";
                    var a = new DynamicParameters();
                    a.Add(name: "@idCategoria", value: stockByCategory.idCategoria, DbType.Int32, direction: ParameterDirection.Input);
                    stockResponse = db.Query<EntityStockResponse>(sql, param: a, commandType: CommandType.StoredProcedure).ToList();
                }
                if (stockResponse != null)
                {
                    returnEntity.issuccess = true;
                    returnEntity.errocode = "00000";
                    returnEntity.erromessage = string.Empty;
                    returnEntity.Data = stockResponse;
                }
                else
                {
                    returnEntity.issuccess = false;
                    returnEntity.errocode = "00000";
                    returnEntity.erromessage = string.Empty;
                    returnEntity.Data = null;
                }
            }
            catch (Exception ex)
            {
                // throw new Exception(ex.Message);
                returnEntity.issuccess = false;
                returnEntity.errocode = "00001";
                returnEntity.erromessage = ex.Message;
                returnEntity.Data = null;
            }
            return returnEntity;
        }
        public ResponseBase GetStock(EntityStockByProduct stockByProduct)
        {
            var returnEntity = new ResponseBase();
            var stockResponse = new List<EntityStockResponse>();
            try
            {
                using (var db = GetSqlConnection())
                {
                    const string sql = @"usp_stock_ByProduct";
                    var a = new DynamicParameters();
                    a.Add(name: "@name", value: stockByProduct.name, DbType.String, direction: ParameterDirection.Input);
                    stockResponse = db.Query<EntityStockResponse>(sql, param: a, commandType: CommandType.StoredProcedure).ToList();
                }
                if (stockResponse != null)
                {
                    returnEntity.issuccess = true;
                    returnEntity.errocode = "00000";
                    returnEntity.erromessage = string.Empty;
                    returnEntity.Data = stockResponse;
                }
                else
                {
                    returnEntity.issuccess = false;
                    returnEntity.errocode = "00000";
                    returnEntity.erromessage = string.Empty;
                    returnEntity.Data = null;
                }
            }
            catch (Exception ex)
            {
                // throw new Exception(ex.Message);
                returnEntity.issuccess = false;
                returnEntity.errocode = "00001";
                returnEntity.erromessage = ex.Message;
                returnEntity.Data = null;
            }
            return returnEntity;
        }

        public ResponseBase GetProductoBanner()
        {
            var outResponse = new ResponseBase();
            var bannerResponse = new List<EntityProductoBanner>();
            try
            {
                using (var db = GetSqlConnection())
                {
                    const string sql = "usp_Producto_Banner";
                    bannerResponse = db.Query<EntityProductoBanner>(sql, commandType: CommandType.StoredProcedure).ToList();

                    if (bannerResponse != null)
                    {
                        outResponse = response(true, "0000", string.Empty, bannerResponse);
                    }
                    else
                    {
                        outResponse = response(false, "0000", string.Empty, null);
                    }
                }
            }
            catch (Exception ex)
            {
                outResponse = response(false, "0001", ex.Message, null);
            }
            return outResponse;
        }
    }
}
