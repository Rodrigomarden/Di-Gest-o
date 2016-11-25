<!DOCTYPE html>
<%@page import="sgr.Pedidos"%>
<%@page import="java.util.List"%>
<html lang="en">

<head>

    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="">
    <meta name="author" content="">

    <title>Gerenciar Pedidos</title>

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
	<h2>Cozinha: </h2>
		<form>
			<table style="text-align: center" class="table table-bordered">
				<thead>
					<tr>
						<th><center>Comanda</th>
	                    <th><center>Codigo Produto</th>
	                    <th><center>Nome</th>
	                    <th><center>Quantidade</th>
	                    <th><center>Finalizar</th>
                    </tr>
				</thead>
				<tbody>
					<%List<Pedidos> pedidos = (List<Pedidos>) request.getAttribute("pedidos"); 
                    if(pedidos != null && !pedidos.isEmpty()) {
                    	for(Pedidos p : pedidos) {
                    %>
                    <tr>
                    	<td><%=p.getCodigo_comanda() %></td>
                    	<td><%=p.getCodigo_produto() %></td>
                    	<td><%=p.getNomeProduto() %></td>
                    	<td><%=p.getQuantidade() %></td>
                    	<td><a class="btn btn-success" href="cozinha_pedidos?operacao=finalizar&codigo_comanda=<%=p.getCodigo_comanda()%>&codigo_produto=<%=p.getCodigo_produto()%>"><i class="fa fa-check"></i></a></td>
                    </tr>
                    <%}} else {%>
                    <tr>
                    	<td colspan="5">Não há pedidos a serem feitos.</td>
                    </tr>
                    <%} %>
				</tbody>
			</table>
			<a class="btn btn-danger" href="http://localhost:9090/sgr/logout"><i class="fa fa-sign-out"></i>Sair</a>
		</form>
	</div>
</div>
</body>

</html>
