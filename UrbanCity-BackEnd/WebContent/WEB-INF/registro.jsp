<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
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
<title>Registro</title>
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
					<li class="nav-item "><a class="nav-link "
						href="IniciarSesion " tabindex="-1 " aria-disabled="true ">Iniciar
							Sesión</a></li>
					<li class="nav-item active "><a class="nav-link "
						href="Registro " tabindex="-1 " aria-disabled="true ">Registrarse</a>
					</li>
				</ul>
			</div>
		</nav>
	</header>

	<section class="container mt-5 ">
		<article class="row mt-5 ">
			<div class="col-md-12 mt-5 ">
				<h1>Crear una cuenta en LuftGun</h1>
			</div>
		</article>
		<article class="row mt-5 ">
			<div class="col-md-12 ">
				<form method="POST">
					<div class="form-group ">
						<label for="fNombre ">Nombre</label> <input id="fNombre "
							class="form-control " type="text" name="fNombre">
					</div>
					<div class="form-group ">
						<label for="fApellido ">Apellido</label> <input id="fApellido "
							class="form-control " type="text" name="fApellido">
					</div>
					<div class="form-group ">
						<label for="fEmail ">Correo Eletrónico</label> <input id="fEmail "
							class="form-control " type="email" name="fEmail">
						<%
							if ((boolean) session.getAttribute("Correo")) {
								out.print("<p>El correo ya está en uso. Pruebe otro o inicie sesión con su cuenta.</p>");
							}
						%>
					</div>
					<div class="form-group ">
						<label for="fContrasena ">Contraseña</label> <input
							id="fContrasena " class="form-control " type="password"
							name="fContrasena">
					</div>
					<div class="form-group ">
						<label for="fContasenaRep">Repita la contraseña</label> <input
							id="fContasenaRep " class="form-control " type="password"
							name="fContasenaRep">
						<%
							if ((boolean) session.getAttribute("Contrasena")) {
								out.print("<p>Las contraseñas no coinciden, por favor intente de nuevo.</p>");
							}
						%>
					</div>
					<div class="form-group ">
						<label for="fCalle ">Calle:</label> <input id="fCalle "
							class="form-control " type="text" name="fCalle">
					</div>
					<div class="form-group ">
						<label for="fLocalidad ">Localidad</label> <input id="fLocalidad"
							class="form-control " type="text" name="fLocalidad">
					</div>
					<div class="form-group ">
						<label for="fProvincia">Provincia</label> <input id="fProvincia"
							class="form-control " type="text" name="fProvincia">
					</div>
					<div class="form-group ">
						<label for="fCp">Codigo postal</label> <input id="f "
							class="form-control " type="text" maxlength="5" name="fCp">
					</div>
					<div class="form-group ">
						<label for="fPais ">Pais:</label> <input id="fPais"
							class="form-control " type="text" name="fPais">
					</div>
					<div class="form-group ">
						<label for="fTel ">Telefono:</label> <input id="fTel"
							class="form-control " type="text" name="fTel">
					</div>

					<button type="submit" class="btn w-100 btn-primary ">Registrarse</button>
				</form>
			</div>
		</article>
	</section>

</body>

</html>