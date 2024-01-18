using CoreInventario.Interface;
using Microsoft.AspNetCore.Mvc;
namespace Api.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class SalidasController:ControllerBase
    {
        private readonly ISalidaRepository _salidaRepository;

        public SalidasController(ISalidaRepository salidaRepository)
        {
            _salidaRepository = salidaRepository;
        }

        [HttpGet]
        [Route("salidas")]
        public async Task<IActionResult> MostrarSalidas()
        {
            var consulta = await _salidaRepository.MostrarSalida();
            return Ok(consulta);
        }

        [HttpGet]
        [Route("detalleSalida")]
        public async Task<IActionResult> MostrarDetalleSalida(int salida)
        {
            var consulta = await _salidaRepository.MostrarDetalleSalida(salida);
            return Ok(consulta);
        }

        [HttpGet]
        [Route("salidafiltrada")]
        public async Task<IActionResult> MostrarSalidaFiltrada(DateTime fechaD, DateTime fechaF, int sucursal)
        {
            var consulta = await _salidaRepository.SalidaFiltrada(fechaD, fechaF, sucursal);
            return Ok(consulta);
        }

        [HttpGet]
        [Route("sucursales")]
        public async Task<IActionResult> MostrarSucursales()
        {
            var consulta = await _salidaRepository.ListaSucursales();
            return Ok(consulta);
        }

        [HttpGet]
        [Route("recibido")]
        public async Task<IActionResult> Recibir(int salida,int usuario)
        {
            var consulta = await _salidaRepository.RecibirSalida(salida, usuario);
            return Ok(consulta);
        }

        [HttpGet]
        [Route("productos")]
        public async Task<IActionResult> Productos()
        {
            var consulta = await _salidaRepository.Productos();
            return Ok(consulta);
        }
        [HttpGet]
        [Route("crearSalida")]
        public async Task<IActionResult> Salida(int usuario, int sucursal, string encabezado, string detalle)
        {
            var consulta = await _salidaRepository.CrearSalida(usuario, sucursal, encabezado, detalle);
            return Ok(consulta);
        }
        [HttpGet]
        [Route("crearDetalle")]
        public async Task<IActionResult> Detalle(int salida, int Producto, double cantidad)
        {
            var consulta = await _salidaRepository.CrearDetalle(salida, Producto, cantidad);
            return Ok(consulta);
        }
    }
}
