using System;
using System.Collections.Generic;
using System.Text;

namespace DBEntity
{
    public class EntityLoginResponse
    {
        public int IdPersona { get; set; }
        public string DNI { get; set; }
        public string Nombres { get; set; }
        public string Apellidos { get; set; }
        public char Sexo { get; set; }
        public DateTime Nacimiento { get; set; }
        public string Email { get; set; }
        public string Celular { get; set; }
        public string idDistrito { get; set; }
        public string Direccion { get; set; }
        public string Referencia { get; set; }
        public string Contraseña { get; set; }
        public string Role { get; set; }
        public string Token { get; set; }    
    }
}
