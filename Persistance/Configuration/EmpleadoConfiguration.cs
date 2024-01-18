using CoreInventario.Entities;
using Microsoft.EntityFrameworkCore;
using Microsoft.EntityFrameworkCore.Metadata.Builders;

namespace Persistance.Configuration
{
    public class EmpleadoConfiguration : IEntityTypeConfiguration<Empleado>
    {
        public void Configure(EntityTypeBuilder<Empleado> builder)
        {
            builder.ToTable("Empleado");

            builder.Property(e => e.Id).ValueGeneratedNever();
            builder.Property(e => e.Apellido)
                .HasMaxLength(50)
                .IsUnicode(false);
            builder.Property(e => e.Direccion)
                .HasMaxLength(50)
                .IsUnicode(false);
            builder.Property(e => e.FechaContratacion).HasColumnType("datetime");
            builder.Property(e => e.Genero)
                .HasMaxLength(1)
                .IsUnicode(false);
            builder.Property(e => e.Nombre)
                .HasMaxLength(50)
                .IsUnicode(false);
            builder.Property(e => e.NumeroIdentidad)
                .HasMaxLength(50)
                .IsUnicode(false);
            builder.Property(e => e.Telefono)
                .HasMaxLength(13)
                .IsUnicode(false);
        }
    }
}
