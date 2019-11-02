<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="PaginaDadosAvaliador.aspx.cs" Inherits="WebAppDSProjetoIndustrial.PaginaDadosAvaliador" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <script src="Scripts/jquery-3.4.1.min.js"></script>
    <script src="Scripts/bootstrap.min.js"></script>
    <script src="Scripts/bootbox.min.js"></script>
    <script src="Scripts/toastr.min.js"></script>
    <link href="Content/bootstrap.min.css" rel="stylesheet" />

 


</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="container">
        <div class="row justify-content-center mb-7">
            <div class="col-sm-12 col-md-10 col-lg-8">
                
                    <asp:Panel ID="pnlLogin" runat="server" Visible="true">
                        <div class="form-row">
                            <div class="form-group col-sm-6">
                                <%-- Nome Avaliador --%>
                                <label for="txtNome">Nome</label>

                                <%-- <input type="text" class="form-control" id="txtNome" placeholder="Ex: Maria" required>--%>
                                <asp:TextBox ID="txtNome" CssClass="form-control" placeholder="Ex: Maria" required runat="server" ToolTip="Nome"></asp:TextBox>
                            </div>
                        </div>

                        <%-- CPF Avaliador --%>
                        <div class="row">
                            <div class="form-group col-sm-6">
                                <label for="txtCpf">CPF</label>

                                <asp:TextBox ID="txtCpf" CssClass="form-control" placeholder="Ex: 000.000.000-11" required runat="server" ToolTip="CPF"></asp:TextBox>
                            </div>
                        </div>
                        <asp:Button ID="btnProsseguir" runat="server" Text="Prosseguir" CssClass="btn btn-success" OnClick="btnProsseguir_Click" />
                    </asp:Panel>



                    <asp:Panel ID="pnlValiacao" runat="server" Visible="False">

                        <%-- ID Projeto --%>
                        <div class="row">
                            <div class="form-group col-sm-3">
                                <label for="txtIdProjeto">Identificador do Projeto</label>
                                <asp:TextBox ID="txtIdProjeto" Enabled="false" CssClass="form-control" placeholder="Ex: 01" runat="server" ToolTip="Identificador do Projeto"></asp:TextBox>
                            </div>
                        </div>

                        <div class="row">
                            <div class="form-group col-sm-12">
                                <label for="lblProjeto">Projeto</label>
                                <asp:Label ID="lblProjeto" runat="server" Text=""></asp:Label>
                            </div>
                        </div>

                        <div class="row">
                            <div class="form-group col-sm-6">
                                <label for="lblTurma">Turma</label>
                                <asp:Label ID="lblTurma" runat="server" Text=""></asp:Label>
                            </div>
                        </div>

                        <div class="row">
                            <div class="form-group col-sm-6">
                                <label for="lblSala">Sala</label>
                                <asp:Label ID="lblSala" runat="server" Text=""></asp:Label>
                            </div>
                        </div>

                        <div class="row">
                            <div class="form-group col-sm-6">
                                <label for="lblOrientadores">Orientadores</label>
                                <asp:Label ID="lblOrientadores" runat="server" Text=""></asp:Label>
                            </div>
                        </div>

                        <fieldset>
                            <legend>Avalie o projeto</legend>
                            

                        <%-- Organização --%>
                        <div class="row">
                            <div class="form-group col-sm-6">
                                <label for="ddl">Organização</label>

                                <select class="custom-select">
                                    <option selected>---Notas---</option>
                                    <option value="5">Muito Bom!</option>
                                    <option value="4">Bom</option>
                                    <option value="3">Regular</option>
                                    <option value="2">Ruim</option>
                                    <option value="1">Muito Ruim!</option>
                                </select>
                            </div>
                        </div>

                        <%-- Comunicação --%>
                        <div class="row">
                            <div class="form-group col-sm-6">
                                <label for="ddl">Comunicação</label>

                                <select class="custom-select">
                                    <option selected>---Notas---</option>
                                    <option value="5">Muito Bom!</option>
                                    <option value="4">Bom</option>
                                    <option value="3">Regular</option>
                                    <option value="2">Ruim</option>
                                    <option value="1">Muito Ruim!</option>
                                </select>
                            </div>
                        </div>

                        <div class="row">
                            <%-- Conhecimento Técnico --%>
                            <div class="form-group col-sm-6">
                                <label for="ddl">Conhecimento Técnico</label>

                                <select class="custom-select">
                                    <option selected>---Notas---</option>
                                    <option value="5">Muito Bom!</option>
                                    <option value="4">Bom</option>
                                    <option value="3">Regular</option>
                                    <option value="2">Ruim</option>
                                    <option value="1">Muito Ruim!</option>
                                </select>
                            </div>
                        </div>

                        <!-- Botão Avaliar Projeto-->
                        <asp:Button ID="btnAvaliarProjeto" runat="server" Text="Avaliar" CssClass="btn btn-primary" OnClick="btnAvaliarProjeto_Click" />

                            </fieldset>
                    </asp:Panel>
                
            </div>
        </div>    
    </div>
</asp:Content>
