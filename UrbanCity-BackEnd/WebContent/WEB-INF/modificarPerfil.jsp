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
<link rel="stylesheet" href="/UrbanCity/lib/urbancity.css">
<link rel="stylesheet" href="/UrbanCity/lib/animate.min.css">
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.0/dist/css/bootstrap.min.css"
	integrity="sha384-B0vP5xmATw1+K9KRQjQERJvTumQW0nPEzvF6L/Z6nronJ3oUOFUFpCjEUQouq2+l"
	crossorigin="anonymous">
<title>Urban City - Modificar Cuenta</title>
</head>

<body>

	<!-- Nav Bar -->
	<nav class="navbar  navbar-dark bg-Urban-1 text-white">
		<div class="w-25">
			<button class="navbar-toggler" type="button" data-toggle="collapse"
				data-target="#navbarSupportedContent"
				aria-controls="navbarSupportedContent" aria-expanded="false"
				aria-label="Toggle navigation">
				<span class="navbar-toggler-icon"></span>
			</button>
		</div>



		<a class="navbar-brand" href="#"> <img src="" width="30px"
			height="30px" class="img-center d-block" alt="">
		</a>
		<div class="w-25">
			<form class="form-inline w-100" method="post" action="Buscar">
				<input class="form-control w-75 no-border-radius" type="search"
					placeholder="Buscar" name="termino">
				<button class="no-border-radius btn bg-Urban-2 text-center text-white w-25" type="submit">Buscar</button>
			</form>

		</div>

		<div class="collapse navbar-collapse" id="navbarSupportedContent">
			<ul class="navbar-nav mr-auto">
				<li class="nav-item active"><a class="nav-link" href="Index">Incio</a>
				</li>
				<%
					if ((boolean) session.getAttribute("Iniciado")) {
				%>
				<navegacion:Iniciado nombre="<%=NombreUsuario%>" />
				<%
					} else {
				%>
				<navegacion:noIniciado />

				<%
					}
				%>
			</ul>


		</div>
	</nav>
		<!-- Banner -->
	<div class="container-fluid animate__animated animate__fadeIn">
		<div class="row banner Index">
			<div class="col-md-12">
				<h3 class="text-center text-white center">Modificar Cuenta</h3>
			</div>
		</div>
	</div>

	<section class="container ">
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
					<button type="submit" class="btn w-100 btn-primary p-3">Actualizar
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


<div
		class="container-fluid footer bg-Urban-1 mt-5 animate__animated animate__fadeIn">
		<div class="row p-5">
			<!-- Footer - Sección 1 -->
			<div class="col-md-4 responsive-mt-5">
				<h1 class="text-white text-center">Contáctanos</h1>
				<h5 class="text-center text-white mt-5 responsive-mt-5">
					Calle Reencarnación Nº215 <br> Mataró, Barcelona <br>
					08304 <br> España
				</h5>
			</div>
			<!-- Footer - Sección 2 -->
			<div class="col-md-4 responsive-mt-5">
				<img src="../MEDIA/IMG/Assets/pinterest.svg"
					class="w-50 d-block img-center" alt="">
			</div>
			<!-- Footer - Sección 3 -->
			<div class="col-md-4 responsive-mt-5">
				<div class="row">
					<div class="col-md-12">
						<h1 class="text-white text-center">Redes Sociales</h1>
					</div>

				</div>
				<div class="row">
					<div class="col-12 text-center text-white mt-5">
						<h5>
							<i class="fab fa-instagram"></i> @UrbanCity
						</h5>
					</div>
				</div>
				<div class="row">
					<div class="col-12 text-center text-white mt-3">
						<h5>
							<i class="fab fa-facebook"></i> @UrbanCity
					</div>

					</h5>
				</div>
				<div class="row">
					<div class="col-12 text-center text-white mt-3">
						<h5>
							<i class="fab fa-pinterest"></i> @UrbanCity
						</h5>
					</div>
				</div>
				<div class="row">
					<div class="col-12 text-center text-white mt-3">
						<h5>
							<i class="fab fa-twitter"></i> @UrbanCity
						</h5>
					</div>
				</div>
			</div>
		</div>
	</div>
	<div class="container-fluid bg-Urban-1 text-center text-white p-3">
		<h5>Urban City es una marca registrada - 2021 © - Sitio web
			desarrollado por mgarquican</h5>
	</div>

	<script src="https://kit.fontawesome.com/6ac74042d7.js"
		crossorigin="anonymous"></script>
	<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"
		integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj"
		crossorigin="anonymous"></script>
	<script
		src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"
		integrity="sha384-9/reFTGAW83EW2RDu2S0VKaIzap3H66lZH81PoYlFhbGU+6BZp6G7niu735Sk7lN"
		crossorigin="anonymous"></script>
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.0/dist/js/bootstrap.min.js"
		integrity="sha384-+YQ4JLhjyBLPDQt//I+STsc9iw4uQqACwlvpslubQzn4u2UU2UFM80nGisd026JF"
		crossorigin="anonymous"></script>



</body>

</html>