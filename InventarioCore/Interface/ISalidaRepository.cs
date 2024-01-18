using CoreInventario.Entities;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace CoreInventario.Interface
{
    public interface ISalidaRepository
    {
        Task<IEnumerable<ListaSalidas>> MostrarSalida();
        Task<IEnumerable<DetalleSalida>> MostrarDetalleSalida(int Salida);
        Task<IEnumerable<ListaSalidas>> SalidaFiltrada(DateTime fechaD, DateTime fechaF, int sucursal);
        Task<IEnumerable<Sucursal>> ListaSucursales();
        Task<IEnumerable<RecibirEntity>> RecibirSalida(int Salida, int Usuario);
        Task<IEnumerable<ListaProducto>> Productos();
        Task<IEnumerable<CrearSalida>> CrearSalida(int usuario, int sucursal, string encabezado, string detalle);
        Task<IEnumerable<CrearDetalle>> CrearDetalle(int salida, int Producto, double cantidad);
    }
}
