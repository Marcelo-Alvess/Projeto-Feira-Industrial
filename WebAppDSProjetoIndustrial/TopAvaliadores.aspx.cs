﻿using Library.DAL;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace WebAppDSProjetoIndustrial
{
    public partial class TopAvaliadores : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack)
            {
                gvTopAvaliadores.DataSource = new RelatorioDAL().ObterTopAvaliadores();
                gvTopAvaliadores.DataBind();
            }
        }
    }
}