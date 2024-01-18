using CoreInventario.Entities;
using CoreInventario.Interface;
using Microsoft.EntityFrameworkCore;
using Persistance.Data;
using System;
using System.Collections.Generic;
using Microsoft.Data.SqlClient;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Infraestructure.Repositories
{
    public class SalidaRepository : ISalidaRepository
    {
        private readonly InventarioContext _context;

        public SalidaRepository(InventarioContext context)
        {
            _context = context;
        }

        public async Task<IEnumerable<DetalleSalida>> MostrarDetalleSalida(int Salida)
        {
            SqlParameter parameter = new SqlParameter("@SalidaId", Salida);
            List<DetalleSalida> lista = await _context.SpDetalleSalida.FromSqlRaw("exec MostrarDetallexSalida @SalidaId",parameter).ToListAsync();
            return lista;
        }

        public async Task<IEnumerable<ListaSalidas>> MostrarSalida()
        {
            List<ListaSalidas> listas = await _context.SpListaSalida.FromSqlRaw("exec MostrarSalida").ToListAsync();
            return listas;
        }

        public async Task<IEnumerable<ListaSalidas>> SalidaFiltrada(DateTime fechaD, DateTime fechaF, int sucursal)
        {
            SqlParameter sqlParameter = new SqlParameter("@FechaDesde", fechaD);
            SqlParameter parameter = new SqlParameter("@FechaHasta", fechaF);
            SqlParameter parameter2 = new SqlParameter("@Sucursal", sucursal);
            List<ListaSalidas> listas = await _context.SpSalidaFiltrada.FromSqlRaw("exec MostrarSalidaFiltrado @FechaDesde,@FechaHasta,@Sucursal",sqlParameter,parameter,parameter2).ToListAsync();
            return listas;
        }

        public async Task<IEnumerable<Sucursal>> ListaSucursales()
        {
            List<Sucursal> sucursal = await _context.SpListaSucursales.FromSqlRaw("exec Sucursales").ToListAsync();
            return sucursal;
        }

        public async Task<IEnumerable<RecibirEntity>> RecibirSalida(int Salida, int Usuario)
        {
            SqlParameter parameter = new SqlParameter("@Usuario",Usuario);
            SqlParameter parameter2 = new SqlParameter("@Salida", Salida);
            List<RecibirEntity> salida = await _context.SpRecibir.FromSqlRaw("exec RecibirSalida @Usuario, @Salida", parameter,parameter2).ToListAsync();
            return salida;
        }

        public async Task<IEnumerable<ListaProducto>> Productos()
        {
            List<ListaProducto> producto = await _context.SpListaProductos.FromSqlRaw("exec ListaProductos").ToListAsync();
            return producto;
        }
        public async Task<IEnumerable<CrearSalida>> CrearSalida(int usuario, int sucursal, string encabezado, string detalle)
        {
            SqlParameter parameter = new SqlParameter("@UsuarioCrea", usuario);
            SqlParameter parameter2 = new SqlParameter("@Sucursal", sucursal);
            SqlParameter parameter3 = new SqlParameter("@Encabezado", encabezado);
            SqlParameter parameter4 = new SqlParameter("@Detalle", detalle);
            List<CrearSalida> salida =
                await _context.SpCrearSalida.FromSqlRaw("exec CrearSalida @UsuarioCrea,@Sucursal,@Encabezado,@Detalle",
                parameter, parameter2, parameter3, parameter4).ToListAsync();
            return salida;
        }

        public async Task<IEnumerable<CrearDetalle>> CrearDetalle(int salida, int Producto, double cantidad)
        {
            SqlParameter parameter = new SqlParameter("@Salida", salida);
            SqlParameter parameter2 = new SqlParameter("@Producto", Producto);
            SqlParameter parameter3 = new SqlParameter("@Cantidad", cantidad);
            List<CrearDetalle> detalle =
                await _context.SpCrearDetalle.FromSqlRaw("exec DetalleSalida @Salida, @Producto, @Cantidad",
                parameter, parameter2, parameter3).ToListAsync();
            return detalle;
        }
    }
}
