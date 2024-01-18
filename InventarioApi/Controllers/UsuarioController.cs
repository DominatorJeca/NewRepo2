using CoreInventario.Interface;
using Microsoft.AspNetCore.Mvc;

namespace Api.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class UsuarioController:ControllerBase
    {
        private readonly IUsuarioRepository _usuarioRepository;

        public UsuarioController(IUsuarioRepository usuarioRepository)
        {
            _usuarioRepository = usuarioRepository;
        }

        [HttpGet]
        [Route("login")]
        public async Task<IActionResult> IniciarSesion(string username, string password)
        {
            var consulta = await _usuarioRepository.ValidarUsuario(username, password);
            return Ok(consulta);
        }
    }
}
