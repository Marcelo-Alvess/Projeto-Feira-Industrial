using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Library.Models
{
    public class Criterio
    {
        private int id;
        private string criterioNome;

        public int Id { get => id; set => id = value; }
        public string CriterioNome { get => criterioNome; set => criterioNome = value; }
    }
}
