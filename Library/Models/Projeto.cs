using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Library.Models
{
    public class Projeto
    {
        private int id;
        private string nome;
        private string descricao;
        private string sala;
        private string turma;


        public int Id { get => id; set => id = value; }
        public string Nome { get => nome; set => nome = value; }
        public string Descricao { get => descricao; set => descricao = value; }
        public string Sala { get => sala; set => sala = value; }
        public string Turma { get => turma; set => turma = value; }
    }
}
