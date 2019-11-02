using Library.Models;
using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Library.DAL
{
    public class ProjetoDAL
    {
        public List<Projeto> GetAll()
        {
            List<Projeto> listaProjetos = new List<Projeto>();
            using (SqlConnection con = new SqlConnection(ConnectionFactory.GetStringConexao()))
            {
                con.Open();

                StringBuilder sql = new StringBuilder();
                sql.AppendLine("SELECT a.id_proj, a.nm_proj, a.ds_proj, a.sala_proj, a.tur_proj");
                sql.AppendLine("FROM Projeto a ");
                sql.AppendLine("WHERE a.bl_ativo = 1 ");
                sql.AppendLine("ORDER BY a.nm_proj ");

                using (SqlCommand cmd = new SqlCommand(sql.ToString(), con))
                {
                    using (SqlDataReader dr = cmd.ExecuteReader())
                    {
                        if (dr != null)
                        {
                            while (dr.Read())
                            {
                                Projeto p = new Projeto();//Instanciando o objeto da iteração
                                //Preenchimento das propriedades a partir do que retornou no banco.
                                p.Id = Convert.ToInt32(dr["id_proj"]);
                                p.Nome = dr["nm_proj"].ToString();
                                p.Descricao = dr["ds_proj"].ToString();
                                p.Sala = dr["sala_proj"].ToString();
                                p.Turma = dr["tur_proj"].ToString();

                                listaProjetos.Add(p);//Adicionando o objeto para a lista
                            }
                        }                        
                    }
                }                
            }
            return listaProjetos;
        }


        public Projeto GetById(int id)
        {
            Projeto p = null;

            using (SqlConnection con = new SqlConnection(ConnectionFactory.GetStringConexao()))
            {
                con.Open();

                StringBuilder sql = new StringBuilder();
                sql.AppendLine("SELECT a.id_proj, a.nm_proj, a.ds_proj, a.sala_proj, a.tur_proj, a.bl_ativo");
                sql.AppendLine("FROM Projeto a ");
                sql.AppendLine("WHERE a.id_proj = @id_proj and a.bl_ativo = 1 ");
                sql.AppendLine("ORDER BY a.nm_proj ");


                using (SqlCommand cmd = new SqlCommand(sql.ToString(), con))
                {
                    cmd.Parameters.AddWithValue("@id_proj", id); //Passagem de parametro

                    using (SqlDataReader dr = cmd.ExecuteReader())
                    {
                        if (dr != null)
                        {
                            if (dr.Read())
                            {
                                p = new Projeto();//Instanciando o objeto da iteração
                                //Preenchimento das propriedades a partir do que retornou no banco.
                                p.Id = Convert.ToInt32(dr["id_proj"]);
                                p.Nome = dr["nm_proj"].ToString();
                                p.Descricao = dr["ds_proj"].ToString();
                                p.Sala = dr["sala_proj"].ToString();
                                p.Turma = dr["tur_proj"].ToString();

                            }
                        }
                        
                    }
                }
            }
            return p;
        }

    }
}
