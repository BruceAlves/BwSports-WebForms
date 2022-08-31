using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace FUT_Mania.conexao.Cliente
{
    interface ICliente
    {
        int CadastrarCliente(string nome, string email);
    }
}
