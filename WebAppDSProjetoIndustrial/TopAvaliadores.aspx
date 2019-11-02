<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="TopAvaliadores.aspx.cs" Inherits="WebAppDSProjetoIndustrial.TopAvaliadores" %>

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
                "progressBar": true
            });
        }

        //Exibir Mensagem de erro
        function ExibirMensagemErro(msg) {
            // make it not dissappear
            toastr.error(msg, "Informação:", {
                //"timeOut": "0",
                "extendedTImeout": "0",
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
                    <h4>30ª Feira do Industrial - Top Avaliadores </h4>


                    <div class="col-md-12">
                        <div class="table-responsive">
                            <asp:GridView ID="gvTopAvaliadores" AutoGenerateColumns="false" runat="server" CssClass="table table-bordered table-condensed">
                                <Columns>
                                    <asp:BoundField HeaderText="Avaliador" DataField="Avaliador" />
                                    <asp:BoundField HeaderText="Avaliações Realizadas" DataField="Avaliacoes" />                                    
                                </Columns>
                            </asp:GridView>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </form>
</body>
</html>
