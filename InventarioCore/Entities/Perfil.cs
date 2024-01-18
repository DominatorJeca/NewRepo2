using System;
using System.Collections.Generic;

namespace CoreInventario.Entities;

public partial class Perfil
{
    public int Id { get; set; }

    public string NombrePerfil { get; set; } = null!;

    public bool Estado { get; set; }

    public virtual ICollection<PerfilUsuario> PerfilUsuarios { get; set; } = new List<PerfilUsuario>();
}
