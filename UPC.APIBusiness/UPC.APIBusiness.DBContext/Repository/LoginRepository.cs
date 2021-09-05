using Dapper;
using DBEntity;
using System;
using System.Data;
using System.Linq;

namespace DBContext
    {
        
        public class LoginRepository : BaseRepository, ILoginRepository
        {
            public ResponseBase GetLogin(EntityLogin login)
            {
                var returnEntity = new ResponseBase();
                var loginResponse = new EntityLoginResponse();

            try
            {
                using (var db = GetSqlConnection())
                {
                    const string sql = @"usp_Persona_Login";
                    var a = new DynamicParameters();
                    a.Add(name: "@email", value: login.EmailLogin, DbType.String, direction: ParameterDirection.Input);
                    a.Add(name: "@contraseña", value: login.ContraseñaLogin, DbType.String, direction: ParameterDirection.Input);
                    loginResponse = db.Query<EntityLoginResponse>(sql, param: a, commandType: CommandType.StoredProcedure).FirstOrDefault();

                }

                if (loginResponse != null)
                {
                    returnEntity.issuccess = true;
                    returnEntity.errocode = "00000";
                    returnEntity.erromessage = string.Empty;
                    returnEntity.Data = loginResponse   ;
                }
                else
                {
                    returnEntity.issuccess = false; 
                    returnEntity.errocode = "00001";
                    returnEntity.erromessage = string.Empty;
                    returnEntity.Data= null;
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
        }
}
