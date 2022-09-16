using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace FUT_Mania.conexao.Cliente
{
    interface ICliente
    {
        DataTable PreencherDropListCliente();
        void CadastrarCliente(int idEndereco, string nome, string email);
        DataTable BuscarTabelaClientes();
        void EditarCadastroCliente(int idCliente, int idEndereco, string nome, string email, string cep, string rua,
        string bairro, string numero, string cidade, string estado);

        void DeletarCadastroCliente(int idEndereco, int idCliente);

    }
}
