using Dapper;
using DBContext;
using DBEntity;
using System;
using System.Data;
using System.Linq;
using UPC.APIBusiness.DBContext.Interface;
using UPC.APIBusiness.DBEntity.Model;

namespace UPC.APIBusiness.DBContext.Repository
{
    public class PersonaRepository : BaseRepository, IPersonaRepository
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
        public ResponseBase Insert(EntityPersonaBasic entity)
        {
            var outResponse = new ResponseBase();
            try
            {
                using (var db = GetSqlConnection())
                {
                    const string sql = "usp_Persona_BasicInsert";
                    var x = new DynamicParameters();
                    x.Add(name: "@nombres", value: entity.NombresBasic, dbType: DbType.String, direction: ParameterDirection.Input);
                    x.Add(name: "@email", value: entity.EmailBasic, dbType: DbType.String, direction: ParameterDirection.Input);
                    x.Add(name: "@contraseña", value: entity.ContraseñaBasic, dbType: DbType.String, direction: ParameterDirection.Input);
                    x.Add(name: "@idPersona", dbType: DbType.Int32, direction: ParameterDirection.Output);

                    db.Query<EntityPersonaBasic>(
                        sql, param: x, commandType: CommandType.StoredProcedure)
                        .FirstOrDefault();

                    int id = x.Get<int>("@idPersona");

                    if (id > 0)
                    {
                        outResponse = response(true, "0000", string.Empty, new
                        {
                            Id = id,
                            NombreBasic = entity.NombresBasic
                        });
                    }
                    else
                        outResponse = response(false, "0000", string.Empty, null);
                }
            }
            catch (Exception ex)
            {
                outResponse = response(false, "0001", ex.Message, null);
            }

            return outResponse;
        }

        public ResponseBase Update(EntityPersonaUpdate entity)
        {
            var outResponse = new ResponseBase();
            try
            {
                using (var db = GetSqlConnection())
                {
                    var persona = new EntityPersonaUpdate();
                    const string sql = "usp_Persona_UpdateInfo";
                    var x = new DynamicParameters();
                    x.Add(name: "@idPersona", value: entity.IdPersona, dbType: DbType.Int32, direction: ParameterDirection.Input);
                    x.Add(name: "@dni", value: entity.Dni, dbType: DbType.String, direction: ParameterDirection.Input);
                    x.Add(name: "@nombres", value: entity.Nombres, dbType: DbType.String, direction: ParameterDirection.Input);
                    x.Add(name: "@apellidos", value: entity.Apellidos, dbType: DbType.String, direction: ParameterDirection.Input);
                    x.Add(name: "@sexo", value: entity.Sexo, dbType: DbType.String, direction: ParameterDirection.Input);
                    x.Add(name: "@nacimiento", value: entity.Nacimiento, dbType: DbType.Date, direction: ParameterDirection.Input);
                    x.Add(name: "@email", value: entity.Email, dbType: DbType.String, direction: ParameterDirection.Input);
                    x.Add(name: "@celular", value: entity.Celular, dbType: DbType.String, direction: ParameterDirection.Input);
                    x.Add(name: "@idDistrito", value: entity.IdDistrito, dbType: DbType.String, direction: ParameterDirection.Input);
                    x.Add(name: "@direccion", value: entity.Direccion, dbType: DbType.String, direction: ParameterDirection.Input);
                    x.Add(name: "@referencia", value: entity.Referencia, dbType: DbType.String, direction: ParameterDirection.Input);
                    x.Add(name: "@contraseña", value: entity.Contraseña, dbType: DbType.String, direction: ParameterDirection.Input);

                    persona = db.Query<EntityPersonaUpdate>(
                        sql, param: x, commandType: CommandType.StoredProcedure)
                        .FirstOrDefault();

                    int id = x.Get<int>("@idPersona");

                    if (id > 0)
                    {
                        outResponse = response(true, "0000", string.Empty, new
                        {
                            idPersona = entity.IdPersona,
                            dni = entity.Dni,
                            nombres = entity.Nombres,
                            apellidos = entity.Apellidos,
                            sexo = entity.Sexo,
                            nacimiento = entity.Nacimiento,
                            email = entity.Email,
                            celular = entity.Celular,
                            idDistrito = entity.IdDistrito,
                            direccion = entity.Direccion,
                            referencia = entity.Referencia,
                            contraseña = entity.Contraseña
                        });
                    }
                    else
                        outResponse = response(false, "0000", string.Empty, null);
                }
            }
            catch (Exception ex)
            {
                outResponse = response(false, "0001", ex.Message, null);
            }

            return outResponse;
        }

        public ResponseBase FindById(int idPersona)
        {
            var outResponse = new ResponseBase();
            var personaEntity = new EntityPersona();
            try
            {
                using (var db = GetSqlConnection())
                {
                    const string sql = "usp_Persona_BuscarPorId";
                    var x = new DynamicParameters();
                    x.Add(name: "@idPersona", value: idPersona, dbType: DbType.Int32, direction: ParameterDirection.Input);

                    personaEntity = db.Query<EntityPersona>(
                        sql, param: x, commandType: CommandType.StoredProcedure)
                        .FirstOrDefault();

                    if (personaEntity != null)
                    {
                        outResponse = response(true, "0000", string.Empty, personaEntity);
                    }
                    else
                        outResponse = response(false, "0001", string.Empty, null);
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
