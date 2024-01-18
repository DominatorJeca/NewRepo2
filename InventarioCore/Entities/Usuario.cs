using System;
using System.Collections.Generic;

namespace CoreInventario.Entities;

public partial class Usuario
{
    public int Id { get; set; }

    public string Username { get; set; } = null!;

    public string Password { get; set; } = null!;

    public bool Estado { get; set; }

    public virtual ICollection<EmpleadoUsuario> EmpleadoUsuarios { get; set; } = new List<EmpleadoUsuario>();

    public virtual ICollection<PerfilUsuario> PerfilUsuarios { get; set; } = new List<PerfilUsuario>();

    public virtual ICollection<Salida> SalidaUsuarioCreaNavigations { get; set; } = new List<Salida>();

    public virtual ICollection<Salida> SalidaUsuarioRecibeNavigations { get; set; } = new List<Salida>();
}
