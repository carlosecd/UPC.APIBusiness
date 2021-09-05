using System;
using System.Collections.Generic;
using System.Text;

namespace DBEntity { 
    public class EntityContacto: EntityBase
    {
        public Int64 IdContacto { get; set; }
        public string Nombre { get; set; }
        public string Email { get; set; }
        public string Asunto { get; set; }
        public string Mensaje { get; set; }
    }
}
