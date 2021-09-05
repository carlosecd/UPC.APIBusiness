using System;
using System.Collections.Generic;
using System.Text;

namespace DBEntity
{ 
     public class EntityTipoComprobante : EntityBase

    {
        public int IdTipoComp { get; set; }
        public string Descripcion { get; set; }
        public string Nomenclatura { get; set; }
    }
}
