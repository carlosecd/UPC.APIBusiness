using System;
using System.Collections.Generic;
using System.Text;

namespace UPC.APIBusiness.DBEntity.Model
{
    public class EntityCanastilla
    {
        private int idVenta;
        private int idVentaDeta;
        private DateTime fechaVenta;
        private int idProducto;
        private string nombreProducto;
        private decimal cantidad;
        private decimal costoUnitario;
        private decimal costoTotal;
        private string comprobante;
        private string estado;

        public int IdVenta { get => idVenta; set => idVenta = value; }
        public int IdVentaDeta { get => idVentaDeta; set => idVentaDeta = value; }
        public DateTime FechaVenta { get => fechaVenta; set => fechaVenta = value; }
        public int IdProducto { get => idProducto; set => idProducto = value; }
        public string NombreProducto { get => nombreProducto; set => nombreProducto = value; }
        public decimal Cantidad { get => cantidad; set => cantidad = value; }
        public decimal CostoUnitario { get => costoUnitario; set => costoUnitario = value; }
        public decimal CostoTotal { get => costoTotal; set => costoTotal = value; }
        public string Comprobante { get => comprobante; set => comprobante = value; }
        public string Estado { get => estado; set => estado = value; }
    }
}
