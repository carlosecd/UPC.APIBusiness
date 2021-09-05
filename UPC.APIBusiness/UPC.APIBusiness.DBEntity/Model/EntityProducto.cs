using System;
using System.Collections.Generic;
using System.Text;

namespace DBEntity
{
    public class EntityProducto
    {
        public int IdProducto { get; set; }
        public string CodigoProducto { get; set; }
        public int IdCategoria { get; set; }
        public string NombreProducto { get; set; }
        public decimal PrecioBase { get; set; }
        public int StockMinimo { get; set; }
        public int IdUsuario { get; set; }
        public string ImageFile { get; set; }
    }
}
