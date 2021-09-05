using System;
using System.Collections.Generic;
using System.Text;

namespace DBEntity
{
    public class EntityOfertaDetalle : EntityBase
    {
        public Int64 IdOfertaDeta { get; set; }
        public int IdOferta { get; set; }
        public int IdProducto { get; set; }
        public decimal Cantidad { get; set; }
        public decimal CostoUnitario { get; set; }
        public decimal CostoTotal { get; set; }

    }
}
