using System;
using System.Collections.Generic;

namespace CoreInventario.Entities;

public partial class Lote
{
    public int Id { get; set; }

    public DateTime FechaCompra { get; set; }

    public int ProductoId { get; set; }

    public double Cantidad { get; set; }

    public bool Estado { get; set; }

    public DateTime FechaVencimiento { get; set; }

    public virtual Producto Producto { get; set; } = null!;
}
