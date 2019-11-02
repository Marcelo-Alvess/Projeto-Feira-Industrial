using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Library.Models
{
    public class Usuario
    {
        private string cpf;
        private string nome;
        private bool exibeContagem;
             

        public string Cpf { get => cpf; set => cpf = value; }
        public string Nome { get => nome; set => nome = value; }
        public bool ExibeContagem { get => exibeContagem; set => exibeContagem = value; }
    }
}
