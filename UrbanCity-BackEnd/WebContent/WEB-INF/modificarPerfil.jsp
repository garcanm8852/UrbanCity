<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="navegacion" uri="./iniciado.tld"%>
<%
	String NombreUsuario = (String) session.getAttribute("NombreUsuario");
	cliente clienteAModificar = (cliente) session.getAttribute("DatosCliente");
%>
<%@ page import="beans.cliente"%>
<!DOCTYPE html>
<html lang="en">

<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.0/dist/css/bootstrap.min.css"
	integrity="sha384-B0vP5xmATw1+K9KRQjQERJvTumQW0nPEzvF6L/Z6nronJ3oUOFUFpCjEUQouq2+l"
	crossorigin="anonymous">
<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"
	integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj"
	crossorigin="anonymous"></script>
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.0/dist/js/bootstrap.bundle.min.js"
	integrity="sha384-Piv4xVNRyMGpqkS2by6br4gNJ7DXjqk09RmUpJ8jgGtD7zP9yug3goQfGII0yAns"
	crossorigin="anonymous"></script>
<title>Modificar datos de la cuenta</title>
</head>

<body>

	<header>
		<nav class="navbar navbar-expand-lg navbar-light bg-light fixed-top ">
			<a class="navbar-brand ">LuftGun</a>
			<button class="navbar-toggler " data-target="#my-nav "
				data-toggle="collapse " aria-controls="my-nav "
				aria-expanded="false " aria-label="Toggle navigation ">
				<span class="navbar-toggler-icon "></span>
			</button>
			<div id="my-nav " class="collapse navbar-collapse ">
				<ul class="navbar-nav mr-auto ">
					<li class="nav-item "><a class="nav-link " href="Index ">Inicio</a>
					</li>
					<li class="nav-item "><a class="nav-link " href="Catalogo "
						tabindex="-1 " aria-disabled="true ">Catalogo</a></li>

					<navegacion:Iniciado nombre="<%=NombreUsuario%>" />

				</ul>
			</div>
		</nav>
	</header>

	<section class="container mt-5 ">
		<article class="row mt-5 ">
			<div class="col-md-12 mt-5 ">
				<h1>Modificar cuenta de usuario</h1>
			</div>
		</article>
		<article class="row mt-5 ">
			<div class="col-md-12 ">
				<form method="POST" action="ModificarCuenta">
					<div class="form-group ">
						<label for="fNombre ">Nombre</label> <input id="fNombre "
							class="form-control " type="text" name="fNombre"
							value="<%=clienteAModificar.getfNombre()%>">
					</div>
					<div class="form-group ">
						<label for="fApellido ">Apellido</label> <input id="fApellido "
							class="form-control " type="text" name="fApellido"
							value="<%=clienteAModificar.getfApellido()%>">
					</div>
					<div class="form-group ">
						<label for="fEmail ">Correo Eletrónico</label> <input id="fEmail "
							class="form-control " type="email" name="fEmail"
							value="<%=clienteAModificar.getfCorreo()%>">
					</div>
					<div class="form-group ">
						<label for="fContrasena ">Contraseña</label> <input
							id="fContrasena " class="form-control " type="password"
							name="fContrasena"
							value="<%=clienteAModificar.getfContrasena()%>">
					</div>
					<div class="form-group ">
						<label for="fCalle ">Calle</label> <input id="fCalle "
							class="form-control " type="text" name="fCalle"
							value="<%=clienteAModificar.getfCalle()%>">
					</div>
					<div class="form-group ">
						<label for="fLocalidad ">Localidad</label> <input id="fLocalidad "
							class="form-control " type="text" name="fLocalidad"
							value="<%=clienteAModificar.getfLocalidad()%>">
					</div>
					<div class="form-group ">
						<label for="fProvincia ">Provincia</label> <input id="fProvincia "
							class="form-control " type="text" name="fProvincia"
							value="<%=clienteAModificar.getfProvincia()%>">
					</div>
					<div class="form-group ">
						<label for="fCp">Codigo Postal</label> <input id="f "
							class="form-control " type="text" name="fCp"
							value="<%=clienteAModificar.getfCp()%>">
					</div>
					<div class="form-group ">
						<label for="fPais ">Pais</label> <input id="f "
							class="form-control " type="text" name="fPais"
							value="<%=clienteAModificar.getfPais()%>">
					</div>
					<div class="form-group ">
						<label for="fTel ">Telefono</label> <input id="f "
							class="form-control " type="text" name="fTel"
							value="<%=clienteAModificar.getfTel()%>">
					</div>

					<button type="submit" class="btn w-100 btn-primary">Actualizar
						Datos</button>
				</form>

			</div>
		</article>
		<article class="row">
			<div class="col-md-12">
				<a href="EliminarCuenta" class="w-100 btn btn-danger mb-5 mt-5">Eliminar
					Cuenta</a>
			</div>
		</article>
	</section>

</body>

</html>