using Library.DAL;
using Library.Models;
using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace WebAppDSProjetoIndustrial
{
    public partial class Resultados : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack)
            {
                CarregarProjetos();
                CarregarCriterios();
                CarregarUsuarios();

                RelatorioDAL.Parametros p = new RelatorioDAL.Parametros();
                RelatorioDAL rDAL = new RelatorioDAL();

                DataTable dtCriterios = rDAL.ObterResultadosPorCriterio(p);
                DataTable dtprojetos = rDAL.ObterResultadosPorProjeto(p);

                gvProjetos.DataSource = dtprojetos;
                gvProjetos.DataBind();

                gvCriterios.DataSource = dtCriterios;
                gvCriterios.DataBind();

                int quantidadeAvaliacaoes = new RelatorioDAL().ObterQuantidadeAvaliacoes();
                int quantidadeProjetosAvaliados = new RelatorioDAL().ObterQuantidadeProjetosAvaliados();
                int quantidadeAvaliadores = new RelatorioDAL().ObterQuantidadeAvaliadores();

                lblEstatistica.ForeColor = System.Drawing.Color.Green;
                lblEstatistica.Text = 
                    string.Format("<br>Já foram realizadas <b>{0}</b> avaliações de <b>{1}</b> diferentes projetos, por <b>{2}</b> avaliadores.</b>", 
                    quantidadeAvaliacaoes, quantidadeProjetosAvaliados, quantidadeAvaliadores);
            }

        }


        public void CarregarProjetos()
        {
            ddlProjetos.DataSource = new ProjetoDAL().GetAll();
            ddlProjetos.DataTextField = "Nome";
            ddlProjetos.DataValueField = "Id";
            ddlProjetos.DataBind();
            ddlProjetos.Items.Insert(0, new ListItem("---Selecione---", "0"));
        }

        public void CarregarCriterios()
        {
            ddlCriterios.DataSource = new CriterioDAL().GetAll();
            ddlCriterios.DataTextField = "CriterioNome";
            ddlCriterios.DataValueField = "Id";
            ddlCriterios.DataBind();
            ddlCriterios.Items.Insert(0, new ListItem("---Selecione---", "0"));
        }

        public void CarregarUsuarios()
        {
            ddlUsuarios.DataSource = new UsuarioDAL().GetAll();
            ddlUsuarios.DataTextField = "Nome";
            ddlUsuarios.DataValueField = "Cpf";
            ddlUsuarios.DataBind();
            ddlUsuarios.Items.Insert(0, new ListItem("---Selecione---", "0"));
        }

        protected void btnProsseguir_Click(object sender, EventArgs e)
        {
            string login = ConfigurationManager.AppSettings["Login"].ToString();
            string senha = ConfigurationManager.AppSettings["Senha"].ToString();

            if (txtLogin.Text == login && txtSenha.Text == senha)
            {
                pnlLogin.Visible = false;
                pnlResultados.Visible = true;
            }
        }

        protected void btnSair_Click(object sender, EventArgs e)
        {
            pnlLogin.Visible = true;
            pnlResultados.Visible = false;
        }

        protected void btnFiltrar_Click(object sender, EventArgs e)
        {
            RelatorioDAL.Parametros p = new RelatorioDAL.Parametros();
            p.ProjetoId = (ddlProjetos.SelectedValue != "0") ? (int?)Convert.ToInt32(ddlProjetos.SelectedValue) : null;
            p.CriterioId = (ddlCriterios.SelectedValue != "0") ? (int?)Convert.ToInt32(ddlCriterios.SelectedValue) : null;
            p.CPF = (!string.IsNullOrEmpty(txtCpf.Text)) ? txtCpf.Text : string.Empty;
            p.ProjetoTurmaAvaliadorAproximado = (!string.IsNullOrEmpty(txtOutros.Text)) ? txtOutros.Text : string.Empty;


            RelatorioDAL rDAL = new RelatorioDAL();

            DataTable dtCriterios = rDAL.ObterResultadosPorCriterio(p);
            DataTable dtprojetos = rDAL.ObterResultadosPorProjeto(p);

            gvProjetos.DataSource = dtprojetos;
            gvProjetos.DataBind();

            gvCriterios.DataSource = dtCriterios;
            gvCriterios.DataBind();
        }

        protected void btnAlterarExibicao_Click(object sender, EventArgs e)
        {
            if (ddlUsuarios.SelectedValue != "0")
            {
                Usuario us = new UsuarioDAL().GetById(ddlUsuarios.SelectedValue);
                us.Cpf = ddlUsuarios.SelectedValue;
                us.ExibeContagem = (us.ExibeContagem) ? false : true;

                if (new UsuarioDAL().AlterarExibicaoContagem(us))
                {
                    lblMensagemExibicaoContagem.ForeColor = System.Drawing.Color.Green;
                    lblMensagemExibicaoContagem.Text = "Atualização realizada";
                }
            }
            else
            {
                lblMensagemExibicaoContagem.ForeColor = System.Drawing.Color.Red;
                lblMensagemExibicaoContagem.Text = "Selecione o Usuário";
            }

        }

        protected void btnConsultarExibicao_Click(object sender, EventArgs e)
        {
            if (ddlUsuarios.SelectedValue != "0")
            {
                Usuario us = new UsuarioDAL().GetById(ddlUsuarios.SelectedValue);                      
                lblMensagemExibicaoContagem.Text = string.Format("Usuário Exibido na Página de Top Usuários: {0}", (us.ExibeContagem) ? "Sim" : "Não");
                lblMensagemExibicaoContagem.ForeColor = (us.ExibeContagem) ? System.Drawing.Color.Blue : System.Drawing.Color.Orange;
            }
            else
            {
                lblMensagemExibicaoContagem.ForeColor = System.Drawing.Color.Red;
                lblMensagemExibicaoContagem.Text = "Selecione o Usuário";
            }
        }
    }
}