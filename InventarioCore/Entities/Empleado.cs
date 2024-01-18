using System;
using System.Collections.Generic;

namespace CoreInventario.Entities;

public partial class Empleado
{
    public int Id { get; set; }

    public string NumeroIdentidad { get; set; } = null!;

    public string Nombre { get; set; } = null!;

    public string Apellido { get; set; } = null!;

    public string Telefono { get; set; } = null!;

    public string Direccion { get; set; } = null!;

    public string Genero { get; set; } = null!;

    public DateTime FechaContratacion { get; set; }

    public bool Estado { get; set; }

    public virtual ICollection<EmpleadoUsuario> EmpleadoUsuarios { get; set; } = new List<EmpleadoUsuario>();
}
