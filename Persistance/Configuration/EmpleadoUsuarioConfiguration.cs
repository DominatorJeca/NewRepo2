using CoreInventario.Entities;
using Microsoft.EntityFrameworkCore;
using Microsoft.EntityFrameworkCore.Metadata.Builders;

namespace Persistance.Configuration
{
    public class EmpleadoUsuarioConfiguration : IEntityTypeConfiguration<EmpleadoUsuario>
    {
        public void Configure(EntityTypeBuilder<EmpleadoUsuario> builder) 
        {
            builder.ToTable("EmpleadoUsuario");

            builder.HasOne(d => d.Empleado).WithMany(p => p.EmpleadoUsuarios)
                .HasForeignKey(d => d.EmpleadoId)
                .OnDelete(DeleteBehavior.ClientSetNull)
                .HasConstraintName("FK_EmpleadoUsuario_Empleado");

            builder.HasOne(d => d.Usuario).WithMany(p => p.EmpleadoUsuarios)
                .HasForeignKey(d => d.UsuarioId)
                .OnDelete(DeleteBehavior.ClientSetNull)
                .HasConstraintName("FK_EmpleadoUsuario_Usuario");
        }
    }
}
