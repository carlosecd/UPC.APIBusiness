using System;
using System.Collections.Generic;
using System.Text;

namespace DBEntity
{ 
    public class ResponseBase
    {
        public bool issuccess { get; set; }
        public string errocode { get; set; }
        public string erromessage { get; set; }
        public object Data { get; set; }
    }
}
