using Microsoft.EntityFrameworkCore;
//using Persistance.Configuration;
using CoreInventario.Entities;
using Persistance.Configuration;

namespace Persistance.Data;

public partial class InventarioContext : DbContext
{
    public InventarioContext()
    {
    }

    public InventarioContext(DbContextOptions<InventarioContext> options)
        : base(options)
    {
    }

    //public virtual DbSet<Empleado> Empleados { get; set; }

    //public virtual DbSet<EmpleadoUsuario> EmpleadoUsuarios { get; set; }

    //public virtual DbSet<Lote> Lotes { get; set; }

    //public virtual DbSet<Perfil> Perfils { get; set; }

    //public virtual DbSet<PerfilUsuario> PerfilUsuarios { get; set; }

    //public virtual DbSet<Producto> Productos { get; set; }

    //public virtual DbSet<Salida> Salidas { get; set; }

    //public virtual DbSet<SalidaDetalle> SalidaDetalles { get; set; }

    //public virtual DbSet<Sucursal> Sucursals { get; set; }

    //public virtual DbSet<Usuario> Usuarios { get; set; }
    public virtual DbSet<LoginUser> SpLoginUser { get; set; }
    public virtual DbSet<ListaSalidas> SpListaSalida { get; set; }
    public virtual DbSet<DetalleSalida> SpDetalleSalida { get; set; }
    public virtual DbSet<ListaSalidas> SpSalidaFiltrada { get; set; }
    public virtual DbSet<Sucursal> SpListaSucursales { get; set; }
    public virtual DbSet<RecibirEntity> SpRecibir { get; set; }
    public virtual DbSet<ListaProducto> SpListaProductos { get; set; }
    public virtual DbSet<CrearSalida> SpCrearSalida { get; set; }
    public virtual DbSet<CrearDetalle> SpCrearDetalle { get; set; }

    protected override void OnModelCreating(ModelBuilder modelBuilder)
    {

        modelBuilder.Entity<LoginUser>().ToTable(nameof(LoginUser), t=>t.ExcludeFromMigrations()).HasNoKey();
        modelBuilder.Entity<ListaSalidas>().ToTable(nameof(ListaSalidas), t => t.ExcludeFromMigrations()).HasNoKey();
        modelBuilder.Entity<DetalleSalida>().ToTable(nameof(DetalleSalida), t => t.ExcludeFromMigrations()).HasNoKey();
        modelBuilder.Entity<ListaSalidas>().ToTable(nameof(ListaSalidas), t => t.ExcludeFromMigrations()).HasNoKey();
        modelBuilder.Entity<Sucursal>().ToTable(nameof(Sucursal), t => t.ExcludeFromMigrations()).HasNoKey();
        modelBuilder.Entity<RecibirEntity>().ToTable(nameof(RecibirEntity), t => t.ExcludeFromMigrations()).HasNoKey();
        modelBuilder.Entity<ListaProducto>().ToTable(nameof(ListaProducto), t => t.ExcludeFromMigrations()).HasNoKey();
        modelBuilder.Entity<CrearSalida>().ToTable(nameof(CrearSalida), t => t.ExcludeFromMigrations()).HasNoKey();
        modelBuilder.Entity<CrearDetalle>().ToTable(nameof(CrearDetalle), t => t.ExcludeFromMigrations()).HasNoKey();

        modelBuilder.UseCollation("SQL_Latin1_General_CP1_CI_AS");
        //modelBuilder.ApplyConfiguration(new EmpleadoConfiguration());

        base.OnModelCreating(modelBuilder);
    }

}
