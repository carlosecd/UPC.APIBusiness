using System;
using System.Collections.Generic;
using System.Text;

namespace DBEntity
{
    class EntityRegistroVentaResponse
    {
        public Int64 IdVenta { get; set; }
        //public DateTime FechaVenta { get; set; }
        public int IdTipoComp { get; set; }
        //public string Comprobante { get; set; }
        public int IdCliente { get; set; }
        //public decimal ImporteTotal { get; set; }
        public int IdVendedor { get; set; }
        public int IdDepacho { get; set; }
        //public int IdUsuario { get; set; }
        //public char Estado { get; set; }
        //public string CompAnterior { get; set; }
        public int IdProducto { get; set; }
        public decimal Cantidad { get; set; }
        public string error { get; set; }


    }
}
