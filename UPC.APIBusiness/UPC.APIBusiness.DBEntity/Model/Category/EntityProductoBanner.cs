using System;
using System.Collections.Generic;
using System.Text;

namespace UPC.APIBusiness.DBEntity.Model.Category
{
    public class EntityProductoBanner
    {
        private int id;
        private string nombre;
        private string image;

        public int Id { get => id; set => id = value; }
        public string Nombre { get => nombre; set => nombre = value; }
        public string Image { get => image; set => image = value; }
    }
}
