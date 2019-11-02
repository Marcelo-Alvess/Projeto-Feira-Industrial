using Library.DAL;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace WebAppDSProjetoIndustrial
{
    public partial class ListarProjetos : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if(!Page.IsPostBack)
            {
                gvProjetos.DataSource = new ProjetoDAL().GetAll();
                gvProjetos.DataBind();
            }
        }

        protected void gvProjetos_SelectedIndexChanged(object sender, EventArgs e)
        {

        }
    }
}