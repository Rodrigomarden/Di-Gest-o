<%@page import="sgr.Funcionario"%>
<%@page import="sgr.AlterarFuncionarioDao"%>
<%@page import="java.util.List"%>
<html>
<head>

    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="">
    <meta name="author" content="">

    <title>Alterar Funcionario</title>

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
			<table class="table table-condensed">
			<%Funcionario fx = (Funcionario) request.getAttribute("alterarfuncionario"); %>
	      <tr>
	        <td>CPF:</td>
	        <td><input  class="form-control" name="cpf" type="text" readonly value="<%=fx.getCpf()%>" required></td>
	      </tr>
	      <tr>
	        <td>Senha:</td>
	        <td><input class="form-control" name="senha" type="text" value="<%=fx.getSenha()%>" required></td>
	      </tr>
	      <tr>
	        <td>Tipo:</td>
	        <td>
	        	<select name="tipo" class="form-control">
				  <option value="Administrador">Administrador</option>
				  <option value="Gerente">Gerente</option>
				  <option value="Garçom">Garçom</option>
				  <option value="Cozinha">Cozinha</option>
				</select>
			</td>
	      </tr>
	      <tr>
	        <td>Nome: </td>
	        <td><input class="form-control" name="nome" type="text"  value="<%=fx.getNome()%>" required></td>
	      </tr>
	      <tr>
	        <td>Sexo:</td>
	        <td>
	        	<select name="sexo" class="form-control">
				  <option value="M">Masculino</option>
				  <option value="F">Feminino</option>
				</select>
			</td>
	      </tr>
	      <tr>
	        <td>Data Nascimento:</td>
	        <td><input class="form-control" name="dataNasc" type="date" value="<%=fx.getDataNasc()%>" required></td>
	      </tr>
	      <tr>
	        <td>Salario:</td>
	        <td><input class="form-control" name="salario" type="number" step="any" value="<%=fx.getSalario()%>" required></td>
	      </tr>
	      <tr>
	      	<td colspan="2">
	      		<button class="btn btn-success" name="operacao" value="alterar">Alterar</button>
	      	</td>
	      </tr>
	    </table>
    </form>
    <b>${msg}</b>
    </div>
</div>
</body>
</html>