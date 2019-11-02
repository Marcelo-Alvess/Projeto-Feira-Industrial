using Library.DAL;
using Library.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace WebAppDSProjetoIndustrial
{
    public partial class PaginaDadosAvaliador : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack)
            {
                if (!string.IsNullOrEmpty(Request.QueryString["ProjetoId"].ToString()))
                {
                    int projetoID = Convert.ToInt32(Request.QueryString["ProjetoId"].ToString());
                    Projeto p = new ProjetoDAL().GetById(projetoID);

                    txtIdProjeto.Text = p.Id.ToString();
                    lblProjeto.Text = p.Nome;
                    lblTurma.Text = p.Turma;
                    lblSala.Text = p.Sala;
                    lblOrientadores.Text = p.Sala;

                    pnlValiacao.Visible = true;
                }
            }

        }

        protected void btnAvaliarProjeto_Click(object sender, EventArgs e)
        {
            Usuario u = new Usuario();
            u.Nome = txtNome.Text;
            u.Cpf = txtCpf.Text;
        }

        protected void btnProsseguir_Click(object sender, EventArgs e)
        {
            try
            {
                Usuario u = new Usuario();
                u.Nome = txtNome.Text;
                u.Cpf = txtCpf.Text;
                //integraçao com banco de dados

                pnlLogin.Visible = false;
                pnlValiacao.Visible = true;
            }
            catch (Exception)
            {

                

            }
        }
    }
}