using System;
using System.Collections.Generic;
using System.Text;

namespace DBEntity
{
    public class EntityOferta: EntityBase
    {
        public Int64 IdOferta { get; set; }
        public string Descripcio { get; set; }
        public decimal CostoOferta { get; set; }
        public Boolean Vigencia { get; set; }
        public int IdUsuario { get; set; }
    }
}
