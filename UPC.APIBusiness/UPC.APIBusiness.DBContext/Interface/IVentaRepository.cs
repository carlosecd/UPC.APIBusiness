using DBEntity;
using System;
using System.Collections.Generic;
using System.Text;

namespace UPC.APIBusiness.DBContext.Interface
{
    public interface IVentaRepository
    {
        ResponseBase SetRegistroVenta(EntityRegistroVenta registroVenta);
        ResponseBase GetCanastillaPendientePorCliente(int idCliente);
        ResponseBase GetIdVentaPorCliente(int idCliente);
        ResponseBase GetCantiadPorCliente(int idCliente);
        ResponseBase DeleteDetalle(int idDetalle);
        ResponseBase UpdateCantiadDetalle(int idDetalle, decimal cantidad);
    }
}
