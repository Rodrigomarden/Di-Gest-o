<%@page import="sgr.Produto"%>
<%@page import="sgr.AlterarProdutoDao"%>
<%@page import="java.util.List"%>
<html>
<head>

    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="">
    <meta name="author" content="">

    <title>Cadastrar Produto</title>

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
		      <tr>
		        <td>Codigo:</td>
		        <td><input class="form-control" name="codigo" type="text" readonly value="<%=(Integer.parseInt(request.getAttribute("codigo").toString())+1) %>" pattern="[0-9]+$" required></td>
		      </tr>
		      <tr>
		        <td>Produto:</td>
		        <td><input class="form-control" name="nome_produto" type="text" required></td>
		      </tr>
		      <tr>
		        <td>Valor:</td>
		        <td><input class="form-control" name="valor" type="number" step="any" required></td>
		      </tr>
		      <tr>
		        <td>Quantidade Pessoas:</td>
		        <td><input class="form-control" name="quantidade_pessoas" type="number" step="any" pattern="[0-9]+$" required></td>
		      </tr>
		      <tr>
		        <td>Contem:</td>
		        <td><input class="form-control" name="contem" type="text" required></td>
		      </tr>
		      <tr>
		      	<td colspan="2">
		      		<button class="btn btn-success" name="operacao" value="cadastrar">Cadastrar</button>
		      	</td>
		      </tr>
		    </table>
		    
		   </form>
    <b>${msg}</b>
	</div>
</div>
</body>
</html>