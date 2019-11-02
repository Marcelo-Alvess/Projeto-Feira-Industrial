using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Library.Models
{
    public class CriterioAvaliacao
    {
        private int id;
        private string descricao;
        private int peso;

        public int Id { get => id; set => id = value; }
        public string Descricao { get => descricao; set => descricao = value; }
        public int Peso { get => peso; set => peso = value; }
    }
}
