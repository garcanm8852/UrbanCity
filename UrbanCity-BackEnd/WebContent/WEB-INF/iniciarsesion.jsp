<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
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
<title>Iniciar Sesi�n</title>
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

					<%
						if ((boolean) session.getAttribute("Iniciado")) {

							out.print("<li class='nav-item active' style='color:#007bff;'> Bienvenido" + (String) session.getAttribute("NombreUsuario"));
							out.print(
									"<a class='nav-link ' href='CerrarSesion' tabindex='-1 ' aria-disabled='true '>Cerrar	Sesi�n</a>");
							out.print("</li>");

						}else{
							
							out.print("<li class='nav-item active'>");
							out.print("<a class='nav-link ' href='IniciarSesion ' tabindex='-1 ' aria-disabled='true '>Iniciar	Sesi�n</a>");
							out.print("</li>");

							out.print("<li class='nav-item  '>");
							out.print("<a class='nav-link ' href='Registro ' tabindex='-1 ' aria-disabled='true '>Registrarse</a>");
							out.print("</li>");

						}
					%>

				</ul>
			</div>
		</nav>
	</header>

	<section class="container mt-5 ">
		<article class="row mt-5 ">
			<div class="col-md-12 mt-5 ">
				<h1>Iniciar sesi�n con tu cuenta de LuftGun</h1>
			</div>
		</article>
		<article class="row mt-5 ">
			<div class="col-md-12 ">
				<form method="post">
					<div class="form-group ">
						<label for="fEmail">Correo Eletr�nico</label> <input id="fEmail"
							class="form-control " type="email" name="fEmail">
					</div>
					<div class="form-group">
						<label for="fContrasena">Contrase�a</label> <input
							id="fContrasena" class="form-control " type="password"
							name="fContrasena">
					<%
							if((boolean)session.getAttribute("Error")){
								out.print("<p>El correo o la contrase�a introducida son incorrecta. Pruebe de nuevo.</p>");
							}
							%>
					</div>
					<button type="submit " class="btn w-100 btn-primary ">Iniciar
						Sesion</button>
				</form>
			</div>
		</article>
	</section>

</body>

</html>