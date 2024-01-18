using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace CoreInventario.Entities
{
    public class ListaSalidas
    {
        public int Id { get; set; }
        public DateTime FechaCreado { get; set; }
        public string UsuarioCrea { get; set; }

        public string SucursalId { get; set; }

        public string Encabezado { get; set; } = null!;

        public string Detalle { get; set; } = null!;

        public string Estado { get; set; } = null!;

        public DateTime? FechaRecibido { get; set; }

        public string? UsuarioRecibe { get; set; }
    }
}
