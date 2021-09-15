using System;
using System.Collections.Generic;
using System.Text;

namespace UPC.APIBusiness.DBEntity.Model.Category
{
    public class EntityCategoryBanner
    {
        private int idCategoria;
        private string descripcion;
        private string pathImage;
        private string detalle;

        public int IdCategoria { get => idCategoria; set => idCategoria = value; }
        public string Descripcion { get => descripcion; set => descripcion = value; }
        public string PathImage { get => pathImage; set => pathImage = value; }
        public string Detalle { get => detalle; set => detalle = value; }
    }
}
