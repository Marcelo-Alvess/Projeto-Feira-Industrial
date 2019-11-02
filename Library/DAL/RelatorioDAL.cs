using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Library.DAL
{
    public class RelatorioDAL
    {
        public struct Parametros
        {
            public int? ProjetoId;
            public int? CriterioId;            
            public string CPF;
            public string ProjetoTurmaAvaliadorAproximado;
        }

        public DataTable ObterResultadosPorCriterio(Parametros p)
        {
            DataTable dt = new DataTable();
            using (SqlConnection con = new SqlConnection(ConnectionFactory.GetStringConexao()))
            {
                con.Open();

                StringBuilder sql = new StringBuilder();

                sql.AppendLine("select ");
                sql.AppendLine("b.nm_proj Projeto, ");
                sql.AppendLine("c.ds_criterio_av Criterio, ");
                sql.AppendLine("CONVERT(decimal(18, 3), CONVERT(decimal(18, 3), sum(a.not_ava)) / CONVERT(decimal(18, 3), COUNT(a.not_ava))) Media, ");
                sql.AppendLine("COUNT(a.not_ava) Avaliadores, ");
                sql.AppendLine("a.id_proj, ");
                sql.AppendLine("a.id_criterio_av ");
                sql.AppendLine("from VotacaoProjetos.dbo.Avalaicao_Projeto a ");
                sql.AppendLine("inner join VotacaoProjetos.dbo.Projeto b on a.id_proj = b.id_proj ");
                sql.AppendLine("inner join VotacaoProjetos.dbo.Criterio_Avaliacao c on a.id_criterio_av = c.id_criterio_av ");
                sql.AppendLine("inner join VotacaoProjetos.dbo.Usuario d on a.cpf_usu = d.cpf_usu ");
                sql.AppendLine("where 1 = 1 ");

                using (SqlCommand cmd = new SqlCommand())
                {
                    if (p.ProjetoId != null)
                    {
                        sql.AppendLine("and a.id_proj = @ProjetoId ");
                        cmd.Parameters.AddWithValue("@ProjetoId", p.ProjetoId);
                    }
                    if (p.CriterioId != null)
                    {
                        sql.AppendLine("and a.id_criterio_av = @CriterioId ");
                        cmd.Parameters.AddWithValue("@CriterioId", p.CriterioId);
                    }
                    if(!string.IsNullOrEmpty(p.CPF))                        
                    {
                        sql.AppendLine("and a.cpf_usu = @CPF ");
                        cmd.Parameters.AddWithValue("@CPF", p.CPF); 
                    }
                    if (!string.IsNullOrEmpty(p.ProjetoTurmaAvaliadorAproximado))
                    {
                        sql.AppendLine("and (b.nm_proj like @Outros or b.ds_proj like @Outros or b.sala_proj like @Outros or b.tur_proj like @Outros) ");
                        cmd.Parameters.AddWithValue("@Outros", "%" + p.ProjetoTurmaAvaliadorAproximado + "%");
                    }

                    sql.AppendLine("group by c.ds_criterio_av, b.nm_proj, a.id_proj, a.id_criterio_av ");
                    sql.AppendLine("order by Media desc, COUNT(a.not_ava) desc ");

                    cmd.Connection = con;
                    cmd.CommandText = sql.ToString();

                    using (SqlDataAdapter da = new SqlDataAdapter(cmd))
                    {
                        da.Fill(dt);                        
                    }
                }
                return dt;
            }
        }

        public DataTable ObterResultadosPorProjeto(Parametros p)
        {
            DataTable dt = new DataTable();
            using (SqlConnection con = new SqlConnection(ConnectionFactory.GetStringConexao()))
            {
                con.Open();

                StringBuilder sql = new StringBuilder();

                sql.AppendLine("select ");
                sql.AppendLine("b.nm_proj Projeto, ");                
                sql.AppendLine("CONVERT(decimal(18, 3), CONVERT(decimal(18, 3), sum(a.not_ava)) / CONVERT(decimal(18, 3), COUNT(a.not_ava))) Media, ");
                sql.AppendLine("COUNT(a.not_ava) / 3 Avaliadores, ");
                sql.AppendLine("a.id_proj ");                
                sql.AppendLine("from VotacaoProjetos.dbo.Avalaicao_Projeto a ");
                sql.AppendLine("inner join VotacaoProjetos.dbo.Projeto b on a.id_proj = b.id_proj ");
                sql.AppendLine("inner join VotacaoProjetos.dbo.Criterio_Avaliacao c on a.id_criterio_av = c.id_criterio_av ");
                sql.AppendLine("inner join VotacaoProjetos.dbo.Usuario d on a.cpf_usu = d.cpf_usu ");
                sql.AppendLine("where 1 = 1 ");

                using (SqlCommand cmd = new SqlCommand())
                {
                    if (p.ProjetoId != null)
                    {
                        sql.AppendLine("and a.id_proj = @ProjetoId ");
                        cmd.Parameters.AddWithValue("@ProjetoId", p.ProjetoId);
                    }
                    if (p.CriterioId != null)
                    {
                        sql.AppendLine("and a.id_criterio_av = @CriterioId ");
                        cmd.Parameters.AddWithValue("@CriterioId", p.CriterioId);
                    }
                    if (!string.IsNullOrEmpty(p.CPF))
                    {
                        sql.AppendLine("and a.cpf_usu = @CPF ");
                        cmd.Parameters.AddWithValue("@CPF", p.CPF);
                    }
                    if (!string.IsNullOrEmpty(p.ProjetoTurmaAvaliadorAproximado))
                    {
                        sql.AppendLine("and (b.nm_proj like @Outros or b.ds_proj like @Outros or b.sala_proj like @Outros or b.tur_proj like @Outros) ");
                        cmd.Parameters.AddWithValue("@Outros", "%" + p.ProjetoTurmaAvaliadorAproximado + "%");
                    }
                    sql.AppendLine("group by b.nm_proj, a.id_proj ");
                    sql.AppendLine("order by Media desc, COUNT(a.not_ava) desc ");

                    cmd.Connection = con;
                    cmd.CommandText = sql.ToString();

                    using (SqlDataAdapter da = new SqlDataAdapter(cmd))
                    {
                        da.Fill(dt);
                    }
                }
                return dt;
            }
        }


        public int ObterQuantidadeAvaliacoes()
        {
            int quantidadeAvaliacoes = 0;

            using (SqlConnection con = new SqlConnection(ConnectionFactory.GetStringConexao()))
            {
                StringBuilder sql = new StringBuilder();

                sql.AppendLine("select COUNT(a.not_ava) / 3 Avaliacoes from VotacaoProjetos.dbo.Avalaicao_Projeto a ");

                using (SqlCommand cmd = new SqlCommand(sql.ToString(), con))
                {
                    cmd.CommandType = CommandType.Text;

                    con.Open();

                    Object o = (cmd.ExecuteScalar());
                    if (o != null)
                        quantidadeAvaliacoes = Convert.ToInt32(o);

                    con.Close();
                }                
            }
            return quantidadeAvaliacoes;
        }

        public int ObterQuantidadeProjetosAvaliados()
        {
            int quantidadeProjetosAvaliados = 0;

            using (SqlConnection con = new SqlConnection(ConnectionFactory.GetStringConexao()))
            {
                StringBuilder sql = new StringBuilder();

                sql.AppendLine("select count (distinct id_proj) Projetos ");
                sql.AppendLine("from VotacaoProjetos.dbo.Avalaicao_Projeto ");

                using (SqlCommand cmd = new SqlCommand(sql.ToString(), con))
                {
                    cmd.CommandType = CommandType.Text;

                    con.Open();

                    Object o = (cmd.ExecuteScalar());
                    if (o != null)
                        quantidadeProjetosAvaliados = Convert.ToInt32(o);

                    con.Close();
                }
            }
            return quantidadeProjetosAvaliados;
        }

        public int ObterQuantidadeAvaliadores()
        {
            int quantidadeAvaliadores = 0;

            using (SqlConnection con = new SqlConnection(ConnectionFactory.GetStringConexao()))
            {
                StringBuilder sql = new StringBuilder();

                sql.AppendLine("select count(distinct cpf_usu) Pessoas ");
                sql.AppendLine("from VotacaoProjetos.dbo.Avalaicao_Projeto  ");

                using (SqlCommand cmd = new SqlCommand(sql.ToString(), con))
                {
                    cmd.CommandType = CommandType.Text;

                    con.Open();

                    Object o = (cmd.ExecuteScalar());
                    if (o != null)
                        quantidadeAvaliadores = Convert.ToInt32(o);

                    con.Close();
                }
            }
            return quantidadeAvaliadores;
        }

        public DataTable ObterTopAvaliadores()
        {
            DataTable dt = new DataTable();
            using (SqlConnection con = new SqlConnection(ConnectionFactory.GetStringConexao()))
            {
                con.Open();

                StringBuilder sql = new StringBuilder();

                sql.AppendLine("select b.nm_usu Avaliador, COUNT(a.not_ava) / 3 Avaliacoes ");
                sql.AppendLine("from VotacaoProjetos.dbo.Avalaicao_Projeto a ");
                sql.AppendLine("inner join VotacaoProjetos.dbo.Usuario b on a.cpf_usu = b.cpf_usu ");
                sql.AppendLine("where b.fl_exibe_contagem = 1 ");
                sql.AppendLine("group by a.cpf_usu, b.nm_usu ");
                sql.AppendLine("order by COUNT(a.not_ava) / 3 desc, Avaliador ");

                using (SqlCommand cmd = new SqlCommand())
                {
                    cmd.Connection = con;
                    cmd.CommandText = sql.ToString();

                    using (SqlDataAdapter da = new SqlDataAdapter(cmd))
                    {
                        da.Fill(dt);
                    }
                }
                return dt;
            }
        }


    }
}
