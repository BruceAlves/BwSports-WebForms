using Newtonsoft.Json;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Net.Http;
using System.Text.RegularExpressions;
using System.Web;

namespace FUT_Mania.ViaCEP
{
    public class ViaCep : IviaCep
    {
        public EnderecoCEP EnderecoCep(string cep)
        {
            HttpClient client = new HttpClient();
            var respostaJason = client.GetAsync($"https://viacep.com.br/ws/{cep}/json/").Result;

            string stringJson = respostaJason.Content.ReadAsStringAsync().Result;

            EnderecoCEP resposta = JsonConvert.DeserializeObject<EnderecoCEP>(stringJson);
            return resposta;
        }

        public bool validarCEP(string cep)
        {
            var regex = new Regex(@"^\d{8}");

            return regex.IsMatch(cep);
        }

        public bool validarNumero(string numero)
        {
            var regex = new Regex(@"^[a - zA - Z] +$");

            return regex.IsMatch(numero);
        }
    }
}