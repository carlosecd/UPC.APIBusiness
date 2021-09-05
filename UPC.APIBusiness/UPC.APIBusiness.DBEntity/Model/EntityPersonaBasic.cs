using System;
using System.Collections.Generic;
using System.Text;

namespace UPC.APIBusiness.DBEntity.Model
{
    public class EntityPersonaBasic
    {
        private int idPersona;
        private string nombresBasic;
        private string emailBasic;
        private string contraseñaBasic;

        public int IdPersona { get => idPersona; set => idPersona = value; }
        public string NombresBasic { get => nombresBasic; set => nombresBasic = value; }
        public string EmailBasic { get => emailBasic; set => emailBasic = value; }
        public string ContraseñaBasic { get => contraseñaBasic; set => contraseñaBasic = value; }
    }
}
