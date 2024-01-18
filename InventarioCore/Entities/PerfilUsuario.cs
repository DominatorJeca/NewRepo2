using System;
using System.Collections.Generic;

namespace CoreInventario.Entities;

public partial class PerfilUsuario
{
    public int Id { get; set; }

    public int PerfilId { get; set; }

    public int UsuarioId { get; set; }

    public virtual Perfil Perfil { get; set; } = null!;

    public virtual Usuario Usuario { get; set; } = null!;
}
