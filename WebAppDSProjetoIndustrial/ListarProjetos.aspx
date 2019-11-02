<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="ListarProjetos.aspx.cs" Inherits="WebAppDSProjetoIndustrial.ListarProjetos" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <script type="text/javascript">
        function ExibirVotacao(id) {
            var url = 'Votacao.aspx?ProjetoId=' + id;
            $("#frmModalUrl").attr("src", url);
            $("#frmModal").modal();
            return false;
        }

        function ExibirTopAvaliadores() {
            var url = 'TopAvaliadores.aspx';
            $("#frmModalUrl").attr("src", url);            
            $("#frmModal").modal();
            return false;
        }

        //Fechar PopUp
        function FecharPopUp() {
            $("#frmModalUrl").attr("src", "about:blank");
            $("#frmModal").modal('hide');
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


    </script>

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="container">
        <div id="frmModal" class="modal fade" role="dialog">
            <div class="modal-dialog modal-lg">
                <div class="modal-content">
                    <iframe src="javascript:" id="frmModalUrl" frameborder="0" class="frame-param" style="border: 0; width: 500px; height: 700px"
                        scrolling="auto" marginheight="0" marginwidth="0"></iframe>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-default" data-dismiss="modal">
                            Fechar</button>
                    </div>
                </div>
            </div>
        </div>

        <div class="row">
            <div class="col-md-3">
                    <button type="button" name="btnTopAvaliadores" id="btnTopAvaliadores" value="TopAvaliadores"
                    class="btn btn-primary form-control" onclick="ExibirTopAvaliadores();">
                    <i class="glyphicon glyphicon-heart-empty"></i>    Top Avaliadores    
                </button>
                    
                </div>
            </div>
        <br />
        <br />

        <div class="row">
            <div class="col-md-12">

                <div class="table-responsive">
                    <asp:GridView ID="gvProjetos" DataKeyNames="Id" AutoGenerateColumns="False" runat="server" OnSelectedIndexChanged="gvProjetos_SelectedIndexChanged" CssClass="table table-bordered table-condensed">
                        <Columns>
                            <asp:TemplateField HeaderText="Avaliar" ItemStyle-VerticalAlign="Middle" ItemStyle-HorizontalAlign="Center">
                                <ItemTemplate>
                                    <button class="btn btn-primary btn-sm" title="Votar" type="button"
                                        onclick='ExibirVotacao(<%#Eval("Id") %>); return false;'>
                                        <i class="glyphicon glyphicon-thumbs-up"></i>
                                    </button>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:BoundField HeaderText="Projeto" DataField="Nome" />
                            <asp:BoundField HeaderText="Turma" DataField="Turma" />
                            <asp:BoundField HeaderText="Sala" DataField="Sala" />
                            <asp:BoundField HeaderText="Professores Orientadores" DataField="Descricao" />

                        </Columns>
                    </asp:GridView>
                </div>

            </div>
        </div>

    </div>
</asp:Content>
