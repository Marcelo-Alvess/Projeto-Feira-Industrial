using Library.Models;
using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Library.DAL
{
    public class AvaliacaoProjetoDAL
    {
        public bool Insert(AvaliacaoProjeto a)
        {
            bool ok = false;
            using (SqlConnection con = new SqlConnection(ConnectionFactory.GetStringConexao()))
            {
                StringBuilder sql = new StringBuilder();
                sql.AppendLine("INSERT INTO Avalaicao_Projeto ");
                sql.AppendLine("(id_criterio_av, id_proj, cpf_usu, not_ava, dat_ava, obs_ava) ");
                sql.AppendLine("VALUES (@id_criterio_av, @id_proj, @cpf_usu, @not_ava, @dat_ava, @obs_ava) ");
                sql.AppendLine("SELECT SCOPE_IDENTITY(); ");//Linha Responsável por retornar id que foi Inserido

                using (SqlCommand cmd = new SqlCommand(sql.ToString(), con))
                {
                    cmd.CommandType = CommandType.Text;
                    cmd.Parameters.AddWithValue("@id_criterio_av", a.Id_criterio);
                    cmd.Parameters.AddWithValue("@id_proj", a.Id_projeto);
                    cmd.Parameters.AddWithValue("@cpf_usu", a.Id_usuario);
                    cmd.Parameters.AddWithValue("@not_ava", a.Nota);
                    cmd.Parameters.AddWithValue("@dat_ava", a.Data);
                    cmd.Parameters.AddWithValue("@obs_ava", DBNull.Value);

                    con.Open();
                    ok = (cmd.ExecuteNonQuery() != 0);
                    con.Close();
                }                
            }
            return ok;
        }

        public AvaliacaoProjeto GetById(string cpf, int projetoId, int criterioId)
        {
            AvaliacaoProjeto a = null;

            using (SqlConnection con = new SqlConnection(ConnectionFactory.GetStringConexao()))
            {
                con.Open();

                StringBuilder sql = new StringBuilder();
                sql.AppendLine("SELECT id_criterio_av, id_proj, cpf_usu, not_ava, dat_ava, obs_ava ");
                sql.AppendLine("FROM Avalaicao_Projeto a ");
                sql.AppendLine("WHERE a.cpf_usu = @cpf_usu ");
                sql.AppendLine("and a.id_proj = @id_proj ");
                sql.AppendLine("and id_criterio_av = @id_criterio_av ");
                
                using (SqlCommand cmd = new SqlCommand(sql.ToString(), con))
                {
                    cmd.Parameters.AddWithValue("@cpf_usu", cpf); 
                    cmd.Parameters.AddWithValue("@id_proj", projetoId);
                    cmd.Parameters.AddWithValue("@id_criterio_av", criterioId);

                    using (SqlDataReader dr = cmd.ExecuteReader())
                    {
                        if (dr != null)
                        {
                            if (dr.Read())
                            {
                                a = new AvaliacaoProjeto();//Instanciando o objeto da iteração
                                //Preenchimento das propriedades a partir do que retornou no banco.
                                a.Id_usuario = dr["cpf_usu"].ToString();
                                a.Id_projeto = Convert.ToInt32(dr["id_proj"].ToString());
                                a.Id_criterio = Convert.ToInt32(dr["id_criterio_av"].ToString());

                            }
                        }
                    }
                }
                
            }
            return a;
        }


    }
}
