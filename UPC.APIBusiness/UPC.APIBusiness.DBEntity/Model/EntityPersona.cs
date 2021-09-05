using System;
using System.Collections.Generic;
using System.Text;

namespace UPC.APIBusiness.DBEntity.Model
{
    public class EntityPersona
    {
        private int idPersona;
        private string dni;
        private string nombres;
        private string apellidos;
        private string sexo;
        private DateTime nacimiento;
        private string email;
        private string celular;
        private string idDistrito;
        private string direccion;
        private string referencia;
        private string contraseña;
        private string role;

        public int IdPersona { get => idPersona; set => idPersona = value; }
        public string Dni { get => dni; set => dni = value; }
        public string Nombres { get => nombres; set => nombres = value; }
        public string Apellidos { get => apellidos; set => apellidos = value; }
        public string Sexo { get => sexo; set => sexo = value; }
        public DateTime Nacimiento { get => nacimiento; set => nacimiento = value; }
        public string Email { get => email; set => email = value; }
        public string Celular { get => celular; set => celular = value; }
        public string IdDistrito { get => idDistrito; set => idDistrito = value; }
        public string Direccion { get => direccion; set => direccion = value; }
        public string Referencia { get => referencia; set => referencia = value; }
        public string Contraseña { get => contraseña; set => contraseña = value; }
        public string Role { get => role; set => role = value; }
    }
}
