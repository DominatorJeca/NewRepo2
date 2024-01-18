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
    public class UsuarioRepository:IUsuarioRepository
    {
        private readonly InventarioContext _context;

        public UsuarioRepository(InventarioContext context)
        {
            _context = context;
        }

        public async Task<IEnumerable<LoginUser>> ValidarUsuario(string username, string password)
        {
            SqlParameter sqlParameter = new SqlParameter("@Username",username);
            SqlParameter parameter = new SqlParameter("@Password", password);
            List <LoginUser> mostrar = await _context.SpLoginUser.FromSqlRaw("exec LoginUser @Username, @Password", sqlParameter, parameter).ToListAsync();
            return mostrar;
        }
    }
}
