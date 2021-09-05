using System;
using System.Collections.Generic;
using System.Text;

namespace DBEntity
{ 
    public class EntityStockResponse
    {
        public int IdProducto { get; set; }
        public string CodigoProducto { get; set; }
        public int IdCategoria { get; set; }
        public string NombreCategoria { get; set; }
        public string NombreProducto { get; set; }
        public string ImageFile { get; set; }
        public decimal PrecioBase { get; set; }
        public int StockMinimo { get; set; }
        public decimal Stock { get; set; }
    }
}
