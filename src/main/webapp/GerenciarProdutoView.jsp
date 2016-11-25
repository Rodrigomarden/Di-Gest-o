<!DOCTYPE html>
<%@page import="sgr.Produto"%>
<%@page import="sgr.NovoPedidoDao"%>
<%@page import="java.util.List"%>
<html lang="pt-BR">
<head>

    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="">
    <meta name="author" content="">

    <title>Produtos</title>

    <!-- Bootstrap Core CSS -->
    <link href="Garcom-Mesas/bower_components/bootstrap/dist/css/bootstrap.min.css" rel="stylesheet">

    <!-- MetisMenu CSS -->
    <link href="Garcom-Mesas/bower_components/metisMenu/dist/metisMenu.min.css" rel="stylesheet">

    <!-- Custom CSS -->
    <link href="Garcom-Mesas/dist/css/sb-admin-2.css" rel="stylesheet">

    <!-- Custom Fonts -->
    <link href="Garcom-Mesas/bower_components/font-awesome/css/font-awesome.min.css" rel="stylesheet" type="text/css">
    
	<script src="js/sscript.js"></script>
</head>
<body>
	
<div id="wrapper">
	<div class="container-fluid">
		<form>
			<h3>Produtos</h3>
		<table class="table"> 
			<tr>
				<td>
					<input class="form-control" type="text" name="pesquisa" placeholder="Buscar produto (nome ou código)">
					</input>
				</td>
				<td>
					<button class="btn btn-primary btn-block">Buscar</button>
				</td>
			</tr>
			<tr>
				<td colspan="2">
					<button class="btn btn-success" onclick="modal_cadastro()">
						Cadastrar Produto
					</button>	
				</td>
			</tr>
		</table>
		<table class="table table-bordered table-condensed">
			<thead>
				<tr>
					<th>Id</th>
					<th>Produto</th>
					<th>Valor</th>
					<th>Pessoas</th>
					<th>Contem</th>
					<th>Alterar</th>
					<th>Excluir</th>
				</tr>
			</thead>
			<tbody>
				<%
				List<Produto> produtos = (List<Produto>) request.getAttribute("produtos");
				boolean x = true;
   					if (produtos != null && !produtos.isEmpty()) {
   						String codbusca = (String)request.getAttribute("codbusca");
   						//Verifica se é código ou produto
   						char[] c = codbusca.toCharArray();
   						boolean d = true;
   						for (int i = 0; i < c.length; i++){
   							if( !Character.isDigit( c[ i ] ) ) {
   								d = false;
   								break;
   							}
   						}
   						if(d) {
   							//Lista todos os produtos
    						if(Integer.parseInt(codbusca)==0) {
    							x = false;
    							for (Produto p : produtos) {
                  %>
				<tr>
					<td><%=p.getCodigo()%></td>
					<td><%=p.getNome_produto() %></td>
					<td><%=p.getValor() %></td>
					<td><%=p.getQnt_pessoas() %></td>
					<td><%=p.getContem() %></td>
					<td><a href="gerenciar_produto?operacao=alterar"
						onclick="modal_alterarProduto('<%=p.getCodigo()%>', '<%=p.getNome_produto()%>', '<%=p.getValor()%>', '<%=p.getQnt_pessoas()%>', '<%=p.getContem() %>')"><i class="fa fa-undo fa-2x"></i></a></td>
					<td><a
						href="gerenciar_produto?operacao=excluir&codigo=<%=p.getCodigo()%>&nome_produto=<%=p.getNome_produto()%>"><i class="fa fa-trash-o fa-2x"></i></a></td>
				</tr>
							<%	}
              			} else {
              				for (Produto p : produtos) {
              					//Buscando por Código
              					if(Integer.parseInt(codbusca)==p.getCodigo()) {
              					%>
				<tr style="background-color: white;">
					<td><%=p.getCodigo()%></td>
					<td><%=p.getNome_produto() %></td>
					<td><%=p.getValor() %></td>
					<td><%=p.getQnt_pessoas() %></td>
					<td><%=p.getContem() %></td>
					<td><a href="gerenciar_produto?operacao=alterar"
						onclick="modal_alterarProduto('<%=p.getCodigo()%>', '<%=p.getNome_produto()%>', '<%=p.getValor()%>', '<%=p.getQnt_pessoas()%>', '<%=p.getContem() %>')"><img
							src="Mesas/icAlterarProduto.png" /></a></td>
					<td><a
						href="gerenciar_produto?operacao=excluir&codigo=<%=p.getCodigo()%>&nome_produto=<%=p.getNome_produto()%>"><img
							src="Mesas/icExcluirProduto.png" /></a></td>
				</tr>
				<%						//Busca por codigo não existe.
           						x = false;
              					} 
              				}
              			}
              		} else {
              			for (Produto p : produtos) {
              				//Buscando por produto
              				if(codbusca.equals(p.getNome_produto())) {
             	%>
				<tr style="background-color: white;">
					<td><%=p.getCodigo()%></td>
					<td><%=p.getNome_produto() %></td>
					<td><%=p.getValor() %></td>
					<td><%=p.getQnt_pessoas() %></td>
					<td><%=p.getContem() %></td>
					<td><a href="gerenciar_produto?operacao=alterar"
						onclick="modal_alterarProduto('<%=p.getCodigo()%>', '<%=p.getNome_produto()%>', '<%=p.getValor()%>', '<%=p.getQnt_pessoas()%>', '<%=p.getContem() %>')"><img
							src="Mesas/icAlterarProduto.png" /></a></td>
					<td><a
						href="gerenciar_produto?operacao=excluir&codigo=<%=p.getCodigo()%>&nome_produto=<%=p.getNome_produto()%>"><img
							src="Mesas/icExcluirProduto.png" /></a></td>
				</tr>
					<%
              				//Busca por produto não existe.
              				x = false;
              				}
              			}
              		}
					if (x) {
					%>
				<tr>
					<td colspan="7">Codigo ou Produto não cadastrado.</td>
				</tr>
				<%
     						}
     					} else if(x){
     	            %>
				<tr>
					<td colspan="7">Não há nenhum produto cadastrado.</td>
				</tr>
				<%
        				}
                   	%>
			</tbody>
		 </table>
			<% if(request.getAttribute("msg") != null) {%>
		 <script>alert("${msg}")</script>
			<%}%>
			
		<div>
			<a class="btn btn-danger" href="http://localhost:9090/sgr/gerente_mesas">
				<i class="fa fa-sign-out"></i>Sair
			</a>
		</div>
	</div>
</div>

</body>
<script type="text/javascript">
</script>
</html>