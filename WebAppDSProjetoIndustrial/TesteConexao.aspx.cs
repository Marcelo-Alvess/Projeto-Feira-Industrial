using Library.DAL;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace WebAppDSProjetoIndustrial
{
    public partial class TesteConexao : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnTestar_Click(object sender, EventArgs e)
        {
            try
            {
                bool conexaoOK = new ConnectionFactory().TestarConexao();

                if (conexaoOK)
                    Response.Write("Conectou!!! 0/");
                else
                    Response.Write("Falhou :(");
            }
            catch (Exception ex)
            {
                Response.Write(ex.Message);
            }
        }

        protected void btnVerificarHorario_Click(object sender, EventArgs e)
        {
            Response.Write(DateTime.Now.ToString());
        }
    }
}