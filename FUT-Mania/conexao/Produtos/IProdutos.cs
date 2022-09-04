using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace FUT_Mania.conexao.Produtos
{
    interface IProdutos
    {
        void cadastrarProdutos(string modelo, string cor, string tamanhoP, string tamanhoM, string tamanhoG);
        DataTable BuscarProdutosEstoque();

        void EditarProduto(int id, string cor, string modelo, string tmanhoG, string tamanhoM, string tamanhoP);

        void DeletarProduto(int id);

    }
}
