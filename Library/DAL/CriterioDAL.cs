using Library.Models;
using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Library.DAL
{
    public class CriterioDAL
    {
        public List<Criterio> GetAll()
        {
            List<Criterio> listaCriterios = new List<Criterio>();
            using (SqlConnection con = new SqlConnection(ConnectionFactory.GetStringConexao()))
            {
                con.Open();

                StringBuilder sql = new StringBuilder();
                sql.AppendLine("SELECT a.id_criterio_av, ds_criterio_av ");
                sql.AppendLine("FROM Criterio_Avaliacao a ");                
                sql.AppendLine("ORDER BY a.id_criterio_av ");

                using (SqlCommand cmd = new SqlCommand(sql.ToString(), con))
                {
                    using (SqlDataReader dr = cmd.ExecuteReader())
                    {
                        if (dr != null)
                        {
                            while (dr.Read())
                            {
                                Criterio c = new Criterio();

                                c.Id = Convert.ToInt32(dr["id_criterio_av"]);
                                c.CriterioNome = dr["ds_criterio_av"].ToString();

                                listaCriterios.Add(c);
                            }
                        }
                    }
                }
            }
            return listaCriterios;
        }
    }
}
