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
    public class UsuarioDAL
    {        
        public bool Insert(Usuario u)
        {
            bool ok = false;
            using (SqlConnection con = new SqlConnection(ConnectionFactory.GetStringConexao()))
            {
                StringBuilder sql = new StringBuilder();
                sql.AppendLine("INSERT INTO usuario ");
                sql.AppendLine("(cpf_usu, nm_usu) ");
                sql.AppendLine("VALUES (@cpf_usu, @nm_usu) ");
                sql.AppendLine("SELECT SCOPE_IDENTITY(); ");//Linha Responsável por retornar id que foi Inserido

                using (SqlCommand cmd = new SqlCommand(sql.ToString(), con))
                {
                    cmd.CommandType = CommandType.Text;
                    cmd.Parameters.AddWithValue("@cpf_usu", u.Cpf);
                    cmd.Parameters.AddWithValue("@nm_usu", u.Nome);

                    con.Open();
                    ok = (cmd.ExecuteNonQuery()!=0);
                    con.Close();
                }                
            }
            return ok;
        }

        public bool AlterarExibicaoContagem(Usuario u)
        {
            bool ok = false;
            using (SqlConnection con = new SqlConnection(ConnectionFactory.GetStringConexao()))
            {
                StringBuilder sql = new StringBuilder();
                sql.AppendLine("update usuario ");
                sql.AppendLine("set fl_exibe_contagem = @fl_exibe_contagem  ");
                sql.AppendLine("where cpf_usu = @cpf_usu  ");

                using (SqlCommand cmd = new SqlCommand(sql.ToString(), con))
                {
                    cmd.CommandType = CommandType.Text;
                    cmd.Parameters.AddWithValue("@cpf_usu", u.Cpf);
                    cmd.Parameters.AddWithValue("@fl_exibe_contagem", u.ExibeContagem);

                    con.Open();
                    ok = (cmd.ExecuteNonQuery() != 0);
                    con.Close();
                }
            }
            return ok;
        }

        public List<Usuario> GetAll()
        {
            List<Usuario> listaUsuarios = new List<Usuario>();
            using (SqlConnection con = new SqlConnection(ConnectionFactory.GetStringConexao()))
            {
                con.Open();

                StringBuilder sql = new StringBuilder();
                sql.AppendLine("SELECT a.cpf_usu, a.nm_usu, a.fl_exibe_contagem ");
                sql.AppendLine("FROM Usuario a ");
                sql.AppendLine("Order by a.nm_usu ");


                using (SqlCommand cmd = new SqlCommand(sql.ToString(), con))
                {
                    using (SqlDataReader dr = cmd.ExecuteReader())
                    {
                        if (dr != null)
                        {
                            while (dr.Read())
                            {
                                Usuario u = new Usuario();
                                
                                u.Cpf = dr["cpf_usu"].ToString();
                                u.Nome = dr["nm_usu"].ToString();
                                u.ExibeContagem = Convert.ToBoolean(dr["fl_exibe_contagem"].ToString());

                                listaUsuarios.Add(u);//Adicionando o objeto para a lista
                            }
                        }
                    }
                }
            }
            return listaUsuarios;
        }

        public Usuario GetById(string cpf)
        {
            Usuario u = null;

            using (SqlConnection con = new SqlConnection(ConnectionFactory.GetStringConexao()))
            {
                con.Open();

                StringBuilder sql = new StringBuilder();
                sql.AppendLine("SELECT a.cpf_usu, nm_usu, fl_exibe_contagem ");
                sql.AppendLine("FROM Usuario a ");
                sql.AppendLine("WHERE a.cpf_usu = @cpf_usu ");

                using (SqlCommand cmd = new SqlCommand(sql.ToString(), con))
                {
                    cmd.Parameters.AddWithValue("@cpf_usu", cpf); //Passagem de parametro

                    using (SqlDataReader dr = cmd.ExecuteReader())
                    {
                        if (dr != null)
                        {
                            if (dr.Read())
                            {
                                u = new Usuario();//Instanciando o objeto da iteração
                                //Preenchimento das propriedades a partir do que retornou no banco.
                                
                                u.Cpf = dr["cpf_usu"].ToString();
                                u.Nome = dr["nm_usu"].ToString();
                                u.ExibeContagem = Convert.ToBoolean(dr["fl_exibe_contagem"].ToString());
                            }
                        }                        
                    }
                }                
            }
            return u;
        }
    }
}
