using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace FUT_Mania.conexao.Produtos
{
    interface IProdutos
    {
        void cadastrarProdutos(string modelo, string cor, string tamanhoP, string tamanhoM, string tamanhoG);
    }
}
