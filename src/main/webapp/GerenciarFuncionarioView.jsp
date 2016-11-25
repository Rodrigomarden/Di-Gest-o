<!DOCTYPE html>
<%@page import="sgr.Funcionario"%>
<%@page import="sgr.NovoPedidoDao"%>
<%@page import="java.util.List"%>
<html lang="en">
<head>

    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="">
    <meta name="author" content="">

    <title>Gerenciar Funcionaros</title>

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
			<h3>
				<a href="gerenciar_funcionario">Funcionários</a>
			</h3>

			<hr>
			<table class="table table-bordered">
				<thead>
					<tr>
						<th>CPF</th>
						<th>Senha</th>
						<th>Tipo Funcionário</th>
						<th>Nome</th>
						<th>Sexo</th>
						<th>Data Nascimento</th>
						<th>Salário</th>
						<th>Alterar</th>
						<th>Excluir</th>
					</tr>
				</thead>
				<tbody>
					<%
					List<Funcionario> funcionarios = (List<Funcionario>) request.getAttribute("funcionarios");
    					if (funcionarios != null && !funcionarios.isEmpty()) {
    						for (Funcionario f : funcionarios) {
                   %>
					<tr style="background-color: white;">
						<td><%=f.getCpf()%></td>
						<td><%=f.getSenha() %></td>
						<td><%=f.getTipo() %></td>
						<td><%=f.getNome() %></td>
						<td><%=f.getSexo() %></td>
						<td><%=f.getDataNasc() %></td>
						<td><%=f.getSalario() %></td>
						<td>
							<a href="gerenciar_funcionario?operacao=alterar" onclick="modal_alterarFuncionario('<%=f.getCpf()%>', '<%=f.getSenha()%>', '<%=f.getTipo()%>', '<%=f.getNome()%>', '<%=f.getSexo() %>', '<%=f.getDataNasc() %>', '<%=f.getSalario() %>')">
								<i class="fa fa-undo fa-2x"></i>
							</a></td>
						<td>
							<a href="gerenciar_funcionario?operacao=excluir&cpf=<%=f.getCpf()%>&senha=<%=f.getSenha()%>">
								<i class="fa fa-trash-o fa-2x"></i>
							</a>
						</td>
					</tr>
					<%				}
              			}%>
				</tbody>		
			</table>
			<% if(request.getAttribute("msg") != null) {%>
			<script>alert("${msg}")</script>
			<%}%>
			<div>
				<a class="btn btn-danger" href="http://localhost:9090/sgr/logout">
					<i class="fa  fa-sign-out"></i>Sair
				</a>
				
				<button class="btn btn-primary" onclick="modal_cadastro_funcionario()">
					<i class="fa fa-plus"></i> Novo Funcionario
				</button>
			</div>
		</form>
	</div>
</div>
</body>
<script type="text/javascript">
</script>

</html>