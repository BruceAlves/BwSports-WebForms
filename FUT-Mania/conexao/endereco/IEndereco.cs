using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace FUT_Mania.conexao.endereco
{
    interface IEndereco
    {
        int CadastrarEndereco(string cep, string rua, string bairro, string numero, string cidade, string estado);
    }
}
