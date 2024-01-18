using CoreInventario.Entities;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace CoreInventario.Interface
{
    public interface IUsuarioRepository
    {
        Task<IEnumerable<LoginUser>> ValidarUsuario(string username, string password);
    }
}
