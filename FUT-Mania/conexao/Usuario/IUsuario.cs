using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace FUT_Mania.conexao.Usuario
{
    interface IUsuario
    {
        bool ValidarLogin(string email, string senha);
    }
}
