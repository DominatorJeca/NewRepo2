using System;
using System.Collections.Generic;

namespace CoreInventario.Entities;

public partial class EmpleadoUsuario
{
    public int Id { get; set; }

    public int EmpleadoId { get; set; }

    public int UsuarioId { get; set; }

    public virtual Empleado Empleado { get; set; } = null!;

    public virtual Usuario Usuario { get; set; } = null!;
}
