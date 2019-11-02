using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Library.Models
{
    public class AvaliacaoProjeto
    {
        private int nota;
        private DateTime data;
        private string observacao;
        private int id_criterio;
        private int id_projeto;
        private string id_usuario;

        public int Nota { get => nota; set => nota = value; }
        public DateTime Data { get => data; set => data = value; }
        public string Observacao { get => observacao; set => observacao = value; }
        public int Id_criterio { get => id_criterio; set => id_criterio = value; }
        public int Id_projeto { get => id_projeto; set => id_projeto = value; }
        public string Id_usuario { get => id_usuario; set => id_usuario = value; }
    }
}
