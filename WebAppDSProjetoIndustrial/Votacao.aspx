<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Votacao.aspx.cs" Inherits="WebAppDSProjetoIndustrial.Votacao" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title></title>
    <script src="Scripts/jquery-3.3.1.min.js"></script>
    <script src="Scripts/bootstrap.min.js"></script>
    <script src="Scripts/bootbox.min.js"></script>
    <script src="Scripts/toastr.min.js"></script>

    <link href="Content/bootstrap.min.css" rel="stylesheet" />
    <link href="Content/toastr.min.css" rel="stylesheet" />

    <style type="text/css">
        .floatCol {
            float: left;
            padding: 3px;
        }
    </style>

    <script type="text/javascript">
        /* Quando usamos "parent" significa que queremos chamar 
           uma função contida na página pai, ou seja, funções contidas
           em ListarJogadores.aspx */

        function ChamarFecharPopUp() {
            parent.FecharPopUp();
        }

        function ChamarExibirMensagemErro(msg) {
            parent.ExibirMensagemErro(msg);
        }

        function ChamarExibirMensagemSucesso(msg) {
            parent.ExibirMensagemSucesso(msg);
            ChamarFecharPopUp();
        }

        //Exibir Mensagem de sucesso
        function ExibirMensagemSucesso(msg) {
            // make it not dissappear
            toastr.success(msg, "Informação:", {
                //"timeOut": "0",
                "extendedTImeout": "0",
                "positionClass": "toast-top-left",
                "progressBar": true
            });
        }

        //Exibir Mensagem de erro
        function ExibirMensagemErro(msg) {
            // make it not dissappear
            toastr.error(msg, "Informação:", {
                //"timeOut": "0",
                "extendedTImeout": "0",
                "positionClass": "toast-top-left",
                "progressBar": true
            });
        }

        function ExibirMensagemSucessoFecharDelay(msg) {
            // make it not dissappear
            toastr.success(msg, "Informação:", {
                //"timeOut": "0",
                "extendedTImeout": "0",
                "progressBar": true
            });            
        }

    </script>
</head>
<body>
    <form id="form1" runat="server" class="needs-validation">
        <div class="container">
            <div class="row justify-content-center mb-7">
                <div class="col-sm-12 col-md-10 col-lg-8">
                    <br />
                    <h4>30ª Feira do Industrial - Avaliação de Projetos </h4>
                    <asp:Panel ID="pnlLogin" runat="server" Visible="true">
                        <fieldset>
                            <legend>Identifique-se</legend>
                            <div class="row">
                                <div class="form-group col-sm-6">
                                    <%-- Nome Avaliador --%>
                                    <label for="txtNome">Nome</label>

                                    <%-- <input type="text" class="form-control" id="txtNome" placeholder="Ex: Maria" required>--%>
                                    <asp:TextBox ID="txtNome" CssClass="form-control" placeholder="Ex: Maria" runat="server" ToolTip="Nome"></asp:TextBox>
                                </div>
                            </div>

                            <%-- CPF Avaliador --%>
                            <div class="row">
                                <div class="form-group col-sm-6">
                                    <label for="txtCpf">CPF</label>

                                    <asp:TextBox ID="txtCpf" CssClass="form-control" placeholder="Apenas números: 12345678910" runat="server" ToolTip="CPF"></asp:TextBox>
                                </div>
                            </div>
                            <asp:Button ID="btnProsseguir" runat="server" Text="Prosseguir" CssClass="btn btn-success" OnClick="btnProsseguir_Click" />


                            <div class="row">
                                <div class="form-group col-sm-3">
                                    <asp:Label ID="lblEstatistica" runat="server" Text=""></asp:Label>
                                </div>
                            </div>
                        </fieldset>
                    </asp:Panel>

                    <br />

                    <asp:Panel ID="pnlValiacao" runat="server" Visible="False">
                        <fieldset>
                            <legend>Dados do Projeto</legend>
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
                                <div class="form-group col-sm-4">
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
                        </fieldset>

                        <fieldset>
                            <legend>Avalie o projeto</legend>


                            <%-- Organização --%>
                            <div class="row">
                                <div class="form-group col-sm-6">
                                    <label for="ddlOrganizacao">Organização</label>
                                    <asp:DropDownList ID="ddlOrganizacao" runat="server" CssClass="custom-select">
                                        <asp:ListItem Value="0" Text="---Selecione---" Selected="True"></asp:ListItem>
                                        <asp:ListItem Value="5" Text="5 (Máximo)"></asp:ListItem>
                                        <asp:ListItem Value="4" Text="4"></asp:ListItem>
                                        <asp:ListItem Value="3" Text="3"></asp:ListItem>
                                        <asp:ListItem Value="2" Text="2"></asp:ListItem>
                                        <asp:ListItem Value="1" Text="1"></asp:ListItem>
                                    </asp:DropDownList>
                                </div>
                            </div>

                            <%-- Comunicação --%>
                            <div class="row">
                                <div class="form-group col-sm-6">
                                    <label for="ddlComunicacao">Comunicação</label>

                                    <asp:DropDownList ID="ddlComunicacao" runat="server" CssClass="custom-select">
                                        <asp:ListItem Value="0" Text="---Selecione---" Selected="True"></asp:ListItem>
                                        <asp:ListItem Value="5" Text="5 (Máximo)"></asp:ListItem>
                                        <asp:ListItem Value="4" Text="4"></asp:ListItem>
                                        <asp:ListItem Value="3" Text="3"></asp:ListItem>
                                        <asp:ListItem Value="2" Text="2"></asp:ListItem>
                                        <asp:ListItem Value="1" Text="1"></asp:ListItem>
                                    </asp:DropDownList>
                                </div>
                            </div>



                            <div class="row">
                                <%-- Conhecimento Técnico --%>
                                <div class="form-group col-sm-6">
                                    <label for="dddlConhecimentoTecnicodl">Conhecimento Técnico</label>

                                    <asp:DropDownList ID="ddlConhecimentoTecnico" runat="server" CssClass="custom-select">
                                        <asp:ListItem Value="0" Text="---Selecione---" Selected="True"></asp:ListItem>
                                        <asp:ListItem Value="5" Text="5 (Máximo)"></asp:ListItem>
                                        <asp:ListItem Value="4" Text="4"></asp:ListItem>
                                        <asp:ListItem Value="3" Text="3"></asp:ListItem>
                                        <asp:ListItem Value="2" Text="2"></asp:ListItem>
                                        <asp:ListItem Value="1" Text="1"></asp:ListItem>
                                    </asp:DropDownList>
                                </div>
                            </div>

                            <!-- Botão Avaliar Projeto-->
                            <asp:HiddenField ID="hdnProjetoId" runat="server" />
                            <asp:Button ID="btnAvaliarProjeto" runat="server" Text="Avaliar" CssClass="btn btn-info" OnClick="btnAvaliarProjeto_Click" />

                        </fieldset>
                    </asp:Panel>
                    <asp:Panel ID="pnlListagemProjetos" runat="server" Visible="False">
                    </asp:Panel>

                </div>
            </div>
        </div>


    </form>
</body>
</html>
