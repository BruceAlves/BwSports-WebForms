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
        void cadastrarProdutos(string modelo, string cor, string marca, string preco);
        void inserirEstoque(int tamanhoG, int tamanhoM, int tamanhoP);

        DataTable BuscarProdutos(); //Busca somente descrições relacionado ao  produto
        DataTable BuscarEstoque();//Busca a tabela completa 
        DataTable BuscarExtratoVendas();//Busca o extrato de todas as vendas realizadas

        void EditarProduto(int id, string cor, string modelo, string marca, string preco); // Editar somente dados do produto
        void EditarEstoque(int idEstoque, int tamanhoG, int tamanhoM, int tamanoP);// Editar somente dados de estoque
        
        void DeletarProduto(int idProduto, int idEstoque);
        void InserirVenda(string valorTotal, string dataVenda, int qtdTotal, int idProduto, int idCliente, string produto);
        void UpdateQtdEstoque(int id, int QtdTMG, int QtdTMM, int QtdTMP);

    }
}
