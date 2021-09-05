using System;
using System.Collections.Generic;
using System.Text;

namespace DBEntity
{
    public class EntityVentaDetalle: EntityBase
    {
        public Int64 IdVentaDeta { get; set; }
        public Int64 IdVenta { get; set; }
        public int IdProducto { get; set; }
        public decimal Cantidad { get; set; }
        public decimal CostoUnitario { get; set; }
        public decimal CostoTotal { get; set; }
    }
}
