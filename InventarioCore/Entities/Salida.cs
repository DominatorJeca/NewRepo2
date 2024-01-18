using System;
using System.Collections.Generic;

namespace CoreInventario.Entities;

public partial class Salida
{
    public int Id { get; set; }

    public DateTime FechaCreado { get; set; }

    public string UsuarioCrea { get; set; }

    public string SucursalId { get; set; }

    public string Encabezado { get; set; } = null!;

    public string Detalle { get; set; } = null!;

    public string Estado { get; set; } = null!;

    public DateTime? FechaRecibido { get; set; }

    public string UsuarioRecibe { get; set; }

    public virtual ICollection<SalidaDetalle> SalidaDetalles { get; set; } = new List<SalidaDetalle>();

    public virtual Sucursal Sucursal { get; set; } = null!;

    public virtual Usuario UsuarioCreaNavigation { get; set; } = null!;

    public virtual Usuario? UsuarioRecibeNavigation { get; set; }
}
