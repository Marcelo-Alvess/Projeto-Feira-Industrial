using Library.DAL;
using Library.Models;
using Library.Utils;
using System;
using System.Collections.Generic;
using System.Configuration;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace WebAppDSProjetoIndustrial
{
    public partial class Votacao : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack)
            {
                if (!string.IsNullOrEmpty(Request.QueryString["ProjetoId"].ToString()))
                {
                    int projetoID = Convert.ToInt32(Request.QueryString["ProjetoId"].ToString());
                    Projeto p = new ProjetoDAL().GetById(projetoID);

                    hdnProjetoId.Value = p.Id.ToString();
                    lblProjeto.Text = p.Nome;
                    lblTurma.Text = p.Turma;
                    lblSala.Text = p.Sala;
                    lblOrientadores.Text = p.Descricao;

                    int quantidadeAvaliacaoes = new RelatorioDAL().ObterQuantidadeAvaliacoes();
                    int quantidadeProjetosAvaliados = new RelatorioDAL().ObterQuantidadeProjetosAvaliados();
                    int quantidadeAvaliadores = new RelatorioDAL().ObterQuantidadeAvaliadores();
                    
                    lblEstatistica.ForeColor = System.Drawing.Color.DeepPink;
                    lblEstatistica.Text = string.Format("<br>Já foram realizadas <b>{0}</b> avaliações de <b>{1}</b> diferentes projetos, por <b>{2}</b> avaliadores. <br><br><b>Participe você também!</b>", quantidadeAvaliacaoes, quantidadeProjetosAvaliados, quantidadeAvaliadores);
                }
            }
        }

        protected void btnProsseguir_Click(object sender, EventArgs e)
        {
            try
            {
                if (string.IsNullOrEmpty(txtNome.Text))
                {
                    throw new Exception("Digite seu nome.");
                }
                if (!Validacao.ValidaCPF(txtCpf.Text))
                {
                    throw new Exception("CPF Inválido.");
                }

                Usuario u = new Usuario();
                u = new UsuarioDAL().GetById(txtCpf.Text);

                if (u != null)
                {
                    pnlLogin.Visible = false;
                    pnlValiacao.Visible = true;
                }
                else
                {
                    u = new Usuario();
                    u.Nome = txtNome.Text;
                    u.Cpf = txtCpf.Text;

                    new UsuarioDAL().Insert(u);                    
                }
                string mensagem = string.Format("Olá {0}!! Atribua avaliação para cada critério e clique em Avaliar.", u.Nome);
                string scriptMensagem = string.Format("<script>ExibirMensagemSucesso('{0}');</script>", mensagem);
                ClientScript.RegisterStartupScript(this.GetType(), "ChaveMensagem", scriptMensagem);

                pnlLogin.Visible = false;
                pnlValiacao.Visible = true;
            }
            catch (Exception ex)
            {
                string scriptMensagem = string.Format("<script>ExibirMensagemErro('{0}');</script>", ex.Message);
                ClientScript.RegisterStartupScript(this.GetType(), "ChaveMensagem", scriptMensagem);

            }
        }

        protected void btnAvaliarProjeto_Click(object sender, EventArgs e)
        {
            try
            {
                //Pega a diferença de horas no Web Config.
                int diferencaHora = Convert.ToInt32(ConfigurationManager.AppSettings["DiferencaHora"].ToString());
                DateTime horarioAtual = DateTime.Now.AddHours(diferencaHora);

                DateTime inicioVotacao = new DateTime(2019, DateTime.Now.Month, DateTime.Now.Day, 19, 0, 0);
                DateTime inicioVotacaoDia25 = new DateTime(2019, DateTime.Now.Month, 25, 16, 0, 0);
                DateTime fimVotacao = new DateTime(2019, DateTime.Now.Month, DateTime.Now.Day, 23, 0, 0);

                bool votacaoAberta = (((horarioAtual > inicioVotacao && horarioAtual < fimVotacao) && (horarioAtual.Day == 23 || horarioAtual.Day == 24))
                    || ((horarioAtual > inicioVotacaoDia25 && horarioAtual < fimVotacao) && (horarioAtual.Day == 25)));

                if (!votacaoAberta)
                {
                    throw new Exception(string.Format("A votação é permitida apenas durante o horário da feira. Consulte o Menu Banner. Hora Atual: {0:dd/MM/yyyy HH:mm}", horarioAtual));
                }

                if (ddlOrganizacao.SelectedValue == "0")
                {
                    throw new Exception("Selecione a nota para o Critério Organização");
                }
                if (ddlComunicacao.SelectedValue == "0")
                {
                    throw new Exception("Selecione a nota para o Critério Comunicação");
                }
                if (ddlConhecimentoTecnico.SelectedValue == "0")
                {
                    throw new Exception("Selecione a nota para o Conhecimento Técnico");
                }

                List<AvaliacaoProjeto> lista = new List<AvaliacaoProjeto>();

                AvaliacaoProjeto avOrganizacao = new AvaliacaoProjeto();
                avOrganizacao.Id_projeto = Convert.ToInt32(hdnProjetoId.Value);
                avOrganizacao.Id_criterio = 1;
                avOrganizacao.Id_usuario = txtCpf.Text;
                avOrganizacao.Nota = Convert.ToInt32(ddlOrganizacao.SelectedValue);
                avOrganizacao.Data = DateTime.Now.AddHours(diferencaHora);
                lista.Add(avOrganizacao);

                AvaliacaoProjeto avComunicacao = new AvaliacaoProjeto();
                avComunicacao.Id_projeto = Convert.ToInt32(hdnProjetoId.Value);
                avComunicacao.Id_criterio = 2;
                avComunicacao.Id_usuario = txtCpf.Text;
                avComunicacao.Nota = Convert.ToInt32(ddlComunicacao.SelectedValue);
                avComunicacao.Data = DateTime.Now.AddHours(diferencaHora);
                lista.Add(avComunicacao);

                AvaliacaoProjeto avConheTecnico = new AvaliacaoProjeto();
                avConheTecnico.Id_projeto = Convert.ToInt32(hdnProjetoId.Value);
                avConheTecnico.Id_criterio = 3;
                avConheTecnico.Id_usuario = txtCpf.Text;
                avConheTecnico.Nota = Convert.ToInt32(ddlComunicacao.SelectedValue);
                avConheTecnico.Data = DateTime.Now.AddHours(diferencaHora);
                lista.Add(avConheTecnico);

                foreach (AvaliacaoProjeto av in lista)
                {
                    AvaliacaoProjeto a = new AvaliacaoProjetoDAL().GetById(av.Id_usuario, av.Id_projeto, av.Id_criterio);

                    if (a != null)
                        throw new Exception("Você já avaliou este projeto");
                }

                foreach (AvaliacaoProjeto av in lista)
                {
                    new AvaliacaoProjetoDAL().Insert(av);
                }


                string mensagem = string.Format("{0}, Obrigado e continue avaliando os outros projetos!!!", txtNome.Text);
                string scriptMensagem = string.Format("<script>ChamarExibirMensagemSucesso('{0}');</script>", mensagem);
                ClientScript.RegisterStartupScript(this.GetType(), "ChaveMensagem", scriptMensagem);
             
                LimparControles();
            }
            catch (Exception ex)
            {
                string msg = ex.Message.Replace("'","");
                string scriptMensagem = string.Format("<script>ExibirMensagemErro('{0}');</script>", msg);
                ClientScript.RegisterStartupScript(this.GetType(), "ChaveMensagem", scriptMensagem);
            }
        }

        public void LimparControles()
        {
            hdnProjetoId.Value = string.Empty;
            txtCpf.Text = string.Empty;
            txtNome.Text = string.Empty;
            
            lblProjeto.Text = string.Empty; 
            lblTurma.Text = string.Empty;
            lblSala.Text = string.Empty;
            lblOrientadores.Text = string.Empty;

            ddlComunicacao.SelectedValue = "0";
            ddlOrganizacao.SelectedValue = "0";
            ddlConhecimentoTecnico.SelectedValue = "0";

            pnlValiacao.Visible = false;
            pnlValiacao.Visible = false;
        }       
    }
}