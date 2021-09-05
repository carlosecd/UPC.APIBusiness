using System;
using System.Collections.Generic;
using System.Text;

namespace DBEntity
{
    public class EntityTipoMovimiento: EntityBase
    {
        public int IdTipoMov { get; set; }
        public string Descripcion { get; set; }
    }   
}
