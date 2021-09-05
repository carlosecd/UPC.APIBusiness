using System;
using System.Collections.Generic;
using System.Text;

namespace DBEntity
{
    public class EntityInventario : EntityBase

    {
        public Int64 IdInventario { get; set; }
        public DateTime FechaMov { get; set; }
        public int IdTipoMov { get; set; }
        public string FlagMov { get; set; }
        public int idProducto { get; set; }
        public decimal Cantidad { get; set; }
        public char Condicion {get; set;}
        public string Comprobante { get; set; }
    }
}
