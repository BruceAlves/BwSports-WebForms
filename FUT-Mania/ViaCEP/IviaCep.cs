using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace FUT_Mania.ViaCEP
{
    interface IviaCep
    {
        EnderecoCEP EnderecoCep(string cep);

        bool validarCEP(string cep);

        bool validarNumero(string numero);
    }
}
