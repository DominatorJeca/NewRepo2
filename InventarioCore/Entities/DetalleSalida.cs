using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace CoreInventario.Entities
{
    public class DetalleSalida
    {
        public string NombreProducto { get; set; }
        public double PrecioProducto { get; set; }
        public double Cantidad { get; set; }
        public double Costo { get; set; }
    }
}
