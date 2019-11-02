<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="Resultados.aspx.cs" Inherits="WebAppDSProjetoIndustrial.Resultados" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="container">
        <div class="row justify-content-center mb-7">
            <div class="col-sm-12 col-md-10 col-lg-8">

                <asp:Panel ID="pnlLogin" runat="server" Visible="true">
                    <fieldset>
                        <legend>Identifique-se</legend>
                        <div class="row">
                            <div class="form-group col-sm-6">

                                <label for="txtLogin">Login</label>


                                <asp:TextBox ID="txtLogin" CssClass="form-control" runat="server" ToolTip="Nome"></asp:TextBox>
                            </div>
                        </div>

                        <%-- CPF Avaliador --%>
                        <div class="row">
                            <div class="form-group col-sm-6">
                                <label for="txtSenha">CPF</label>

                                <asp:TextBox ID="txtSenha" TextMode="Password" CssClass="form-control" runat="server" ToolTip="CPF"></asp:TextBox>
                            </div>
                        </div>
                        <asp:Button ID="btnProsseguir" runat="server" Text="Prosseguir" CssClass="btn btn-success" OnClick="btnProsseguir_Click" />
                    </fieldset>
                </asp:Panel>

                <asp:Panel ID="pnlResultados" runat="server" Visible="false">
                    <fieldset>
                        <legend>Estatísticas</legend>
                        <div class="row">
                            <div class="form-group col-md-12">
                                <asp:Label ID="lblEstatistica" runat="server" Text=""></asp:Label>
                            </div>                            
                        </div>
                    </fieldset>
                    <hr />

                    <br />

                    <fieldset>
                        <legend>Usuário exibido nos Top Avaliadores</legend>
                        <div class="row">
                            <div class="form-group col-md-5">
                                <label for="ddlUsuarios">Usuários</label>
                                <br />
                                <asp:DropDownList ID="ddlUsuarios" runat="server"></asp:DropDownList>
                            </div>
                            <div class="form-group col-md-3">
                                <br />
                                <asp:Button ID="btnConsultarExibicao" runat="server" Text="Consultar Exibição" CssClass="btn btn-info" OnClick="btnConsultarExibicao_Click" />
                            </div>
                            <div class="form-group col-md-3">
                                <br />
                                <asp:Button ID="btnAlterarExibicao" runat="server" Text="Alterar Exibição" CssClass="btn btn-warning" OnClick="btnAlterarExibicao_Click" />
                            </div>
                        </div>
                        <div class="row">
                            <div class="form-group col-md-12">
                                <asp:Label ID="lblMensagemExibicaoContagem" runat="server" Text=""></asp:Label>
                            </div>
                        </div>

                    </fieldset>
                    <hr />

                    <br />
                    <fieldset>
                        <legend>Filtros de Avaliação Geral e por Critérios</legend>
                        <div class="row">
                            <div class="form-group col-md-12">
                                <label for="ddlProjetos">Projeto</label>

                                <asp:DropDownList ID="ddlProjetos" runat="server"></asp:DropDownList>
                            </div>
                        </div>

                        <div class="row">
                            <div class="form-group col-md-6">
                                <label for="ddlCriterios">Critério</label>
                                <asp:DropDownList ID="ddlCriterios" runat="server"></asp:DropDownList>
                            </div>
                        </div>

                        <div class="row">
                            <div class="form-group col-md-3">
                                <label for="txtCpf">CPF</label>
                                <asp:TextBox ID="txtCpf" runat="server"></asp:TextBox>
                            </div>

                            <div class="form-group col-md-9">
                                <label for="txtOutros">Nome do Projeto / Turma / Sala / Orientador (Pesquisa por termo)</label>
                                <asp:TextBox ID="txtOutros" runat="server"></asp:TextBox>
                            </div>

                        </div>

                        <div class="row">
                            <div class="form-group col-md-2">
                            </div>
                            <div class="form-group col-md-10">
                            </div>
                        </div>

                        <div class="row">
                            <div class="form-group col-md-6">
                                <asp:Button ID="btnFiltrar" runat="server" Text="Filtrar" CssClass="btn btn-info" OnClick="btnFiltrar_Click" />

                                <asp:Button ID="btnSair" runat="server" Text="Sair" CssClass="btn btn-danger" OnClick="btnSair_Click" />
                            </div>
                        </div>
                    </fieldset>
                    <hr />

                    <br />
                    <fieldset>
                        <legend>Avaliação Geral</legend>
                        <div class="row">
                            <div class="col-md-12">
                                <div class="table-responsive">
                                    <asp:GridView ID="gvProjetos" AutoGenerateColumns="false" runat="server" CssClass="table table-bordered table-condensed">
                                        <Columns>
                                            <asp:BoundField HeaderText="Projeto" DataField="Projeto" />
                                            <asp:BoundField HeaderText="Média" DataField="Media" />
                                            <asp:BoundField HeaderText="Quantidade de Avaliadores" DataField="Avaliadores" />
                                        </Columns>
                                    </asp:GridView>
                                </div>
                            </div>
                        </div>
                    </fieldset>


                    <fieldset>
                        <legend>Avaliação Por Critérios</legend>
                        <div class="row">
                            <div class="col-md-12">
                                <div class="table-responsive">
                                    <asp:GridView ID="gvCriterios" AutoGenerateColumns="false" runat="server" CssClass="table table-bordered table-condensed">
                                        <Columns>
                                            <asp:BoundField HeaderText="Projeto" DataField="Projeto" />
                                            <asp:BoundField HeaderText="Critério" DataField="Criterio" />
                                            <asp:BoundField HeaderText="Media" DataField="Media" />
                                            <asp:BoundField HeaderText="Quantidade de Avaliadores" DataField="Avaliadores" />
                                        </Columns>
                                    </asp:GridView>
                                </div>
                            </div>
                        </div>


                    </fieldset>



                </asp:Panel>



            </div>
        </div>
    </div>
</asp:Content>
