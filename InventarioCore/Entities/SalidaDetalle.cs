using System;
using System.Collections.Generic;

namespace CoreInventario.Entities;

public partial class SalidaDetalle
{
    public int Id { get; set; }

    public int SalidaId { get; set; }

    public int ProductoId { get; set; }

    public string Cantidad { get; set; } = null!;

    public virtual Producto Producto { get; set; } = null!;

    public virtual Salida Salida { get; set; } = null!;
}
