<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="TesteConexao.aspx.cs" Inherits="WebAppDSProjetoIndustrial.TesteConexao" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
         <div class="row">
            <asp:Button ID="btnTestarConexao" runat="server" Text="Testar" OnClick="btnTestar_Click" />   
        </div>
        <div class="row">
            <asp:Button ID="btnVerificarHorario" runat="server" Text="Verificar Horário" OnClick="btnVerificarHorario_Click"  />   
        </div>
    </form>
</body>
</html>
