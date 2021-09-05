using Dapper;
using DBContext;
using DBEntity;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Text;
using UPC.APIBusiness.DBContext.Interface;
using UPC.APIBusiness.DBEntity.Model;

namespace UPC.APIBusiness.DBContext.Repository
{
    public class VentaRepository : BaseRepository, IVentaRepository
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
        public ResponseBase GetCanastillaPendientePorCliente(int idCliente)
        {
            var outResponse = new ResponseBase();           
            try
            {
                using (var db = GetSqlConnection())
                {
                    var canastilla = new List<EntityCanastilla>();
                    const string sql = "ups_CanastillaPendientePorCliente";
                    var x = new DynamicParameters();
                    x.Add(name: "@idCliente", value: idCliente, dbType: DbType.Int32, direction: ParameterDirection.Input);
                    canastilla = db.Query<EntityCanastilla>(sql, param:x, commandType: CommandType.StoredProcedure).ToList();

                    if (canastilla != null)
                    {
                        outResponse = response(true, "0000", string.Empty, canastilla);
                    }
                    else
                    {
                        outResponse = response(false, "0001", string.Empty, null);
                    }
                }
            }
            catch (Exception ex)
            {
                outResponse = response(false, "0001", ex.Message, null);
            }
            return outResponse;
        }

        public ResponseBase SetRegistroVenta(EntityRegistroVenta registroVenta)
        {
            var outResponse = new ResponseBase();
            // var registroVentaResponse = new EntityRegistroVenta();
            try
            {
                using (var db = GetSqlConnection())
                {
                    const string sql = @"usp_Venta_Insert";
                    var a = new DynamicParameters();
                    a.Add(name: "@idTipoComp", value: registroVenta.IdTipoComp, DbType.Int32, direction: ParameterDirection.Input);
                    a.Add(name: "@idCliente", value: registroVenta.IdCliente, DbType.Int32, direction: ParameterDirection.Input);
                    a.Add(name: "@idVendedor", value: registroVenta.IdVendedor, DbType.Int32, direction: ParameterDirection.Input);
                    a.Add(name: "@idDespacho", value: registroVenta.IdDepacho, DbType.Int32, direction: ParameterDirection.Input);
                    a.Add(name: "@idVenta", value: registroVenta.IdVenta, DbType.Int64, direction: ParameterDirection.Input);
                    a.Add(name: "@idProducto", value: registroVenta.IdProducto, DbType.Int32, direction: ParameterDirection.Input);
                    a.Add(name: "@cantidad", value: registroVenta.Cantidad, DbType.Decimal, direction: ParameterDirection.Input);
                    a.Add(name: "@error", value: registroVenta.error, dbType: DbType.String, direction: ParameterDirection.Output);

                    db.Query<EntityRegistroVenta>(
                        sql, param: a, commandType: CommandType.StoredProcedure)
                        .FirstOrDefault();

                    string error = a.Get<string>("@error");
                    int id = int.Parse(error.Split('|')[0].ToString());
                    if (id > 0)
                    {
                        outResponse = response(true, "0000", string.Empty, new
                        {
                            Id = id
                        });
                    }
                    else
                        outResponse = response(false, "0000", string.Empty, null);
                }
            }
            catch (Exception ex)
            {
                outResponse = response(false, "0000", ex.Message, null);
            }

            return outResponse;
        }

        public ResponseBase GetIdVentaPorCliente(int idCliente)
        {
            var outResponse = new ResponseBase();
            try
            {
                using (var db = GetSqlConnection())
                {
                    int idVenta = -1;
                    const string sql = "ups_Venta_GetIdVentaPorCliente";
                    var x = new DynamicParameters();
                    x.Add(name: "@idCliente", value: idCliente, dbType: DbType.Int32, direction: ParameterDirection.Input);
                    idVenta = db.Query<int>(sql, param: x, commandType: CommandType.StoredProcedure).FirstOrDefault();

                    if (idVenta>=0)
                    {
                        outResponse = response(true, "0000", string.Empty, new { idVenta=idVenta });
                    }
                    else
                    {
                        outResponse = response(false, "0001", string.Empty, null);
                    }
                }
            }
            catch (Exception ex)
            {
                outResponse = response(false, "0001", ex.Message, null);
            }
            return outResponse;
        }

        public ResponseBase GetCantiadPorCliente(int idCliente)
        {
            var outResponse = new ResponseBase();
            try
            {
                using (var db = GetSqlConnection())
                {
                    int cant = -1;
                    const string sql = "ups_Venta_GetCantidadPorCliente";
                    var x = new DynamicParameters();
                    x.Add(name: "@idCliente", value: idCliente, dbType: DbType.Int32, direction: ParameterDirection.Input);
                    cant = db.Query<int>(sql, param: x, commandType: CommandType.StoredProcedure).FirstOrDefault();

                    if (cant >= 0)
                    {
                        outResponse = response(true, "0000", string.Empty, new { cantida = cant });
                    }
                    else
                    {
                        outResponse = response(false, "0001", string.Empty, null);
                    }
                }
            }
            catch (Exception ex)
            {
                outResponse = response(false, "0001", ex.Message, null);
            }
            return outResponse;
        }

        public ResponseBase DeleteDetalle(int idDetalle)
        {
            var outResponse = new ResponseBase();
            try
            {
                using (var db = GetSqlConnection())
                {
                    const string sql = @"ups_Venta_DeleteDetalle";
                    var a = new DynamicParameters();
                    a.Add(name: "@idDetalle", value: idDetalle, DbType.Int32, direction: ParameterDirection.Input);

                    var ret= db.Query<int>(
                        sql, param: a, commandType: CommandType.StoredProcedure)
                        .FirstOrDefault();

                    if (ret >= 0)
                    {
                        outResponse = response(true, "0000", string.Empty, new
                        {
                            Id = a.Get<int>("@idDetalle")
                        });
                    }
                    else
                        outResponse = response(false, "0000", string.Empty, null);
                }
            }
            catch (Exception ex)
            {
                outResponse = response(false, "0000", ex.Message, null);
            }

            return outResponse;
        }

        public ResponseBase UpdateCantiadDetalle(int idDetalle, decimal cantidad)
        {
            var outResponse = new ResponseBase();
            try
            {
                using (var db = GetSqlConnection())
                {
                    const string sql = @"ups_Venta_UpdateCantidad";
                    var a = new DynamicParameters();
                    a.Add(name: "@idDetalle", value: idDetalle, DbType.Int32, direction: ParameterDirection.Input);
                    a.Add(name: "@cantidad", value: cantidad, DbType.Decimal, direction: ParameterDirection.Input);

                    var ret = db.Query<int>(
                        sql, param: a, commandType: CommandType.StoredProcedure)
                        .FirstOrDefault();

                    if (ret >= 0)
                    {
                        outResponse = response(true, "0000", string.Empty, new
                        {
                            Id = a.Get<int>("@idDetalle")
                        });
                    }
                    else
                        outResponse = response(false, "0000", string.Empty, null);
                }
            }
            catch (Exception ex)
            {
                outResponse = response(false, "0000", ex.Message, null);
            }

            return outResponse;
        }
    }
}
