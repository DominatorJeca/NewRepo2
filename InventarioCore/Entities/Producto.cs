using System;
using System.Collections.Generic;

namespace CoreInventario.Entities;

public partial class Producto
{
    public int Id { get; set; }

    public string NombreProducto { get; set; } = null!;

    public string Precio { get; set; } = null!;

    public string Descripcion { get; set; } = null!;

    public bool Estado { get; set; }

    public virtual ICollection<Lote> Lotes { get; set; } = new List<Lote>();

    public virtual ICollection<SalidaDetalle> SalidaDetalles { get; set; } = new List<SalidaDetalle>();
}
