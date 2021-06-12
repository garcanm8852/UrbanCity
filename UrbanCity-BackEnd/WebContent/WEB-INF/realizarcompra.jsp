<%@ taglib prefix="navegacion" uri="./iniciado.tld"%>

<%@ page language='java' contentType='text/html; charset=UTF-8'
	pageEncoding='UTF-8'%>
<%@page import="Catalogo.Cproducto"%>

<!DOCTYPE html>
<%
	Cproducto[] listaProductosCarrito;
	int[] listaidCarrito;
	String NombreUsuario = (String) session.getAttribute("NombreUsuario");
%>


<html lang='en'>
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
<title>Urban City - Realizar compra</title>
</head>

<body>

	<!-- 

███╗   ██╗ █████╗ ██╗   ██╗
████╗  ██║██╔══██╗██║   ██║
██╔██╗ ██║███████║██║   ██║
██║╚██╗██║██╔══██║╚██╗ ██╔╝
██║ ╚████║██║  ██║ ╚████╔╝ 
╚═╝  ╚═══╝╚═╝  ╚═╝  ╚═══╝  
 -->

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



		<a class="navbar-brand " href="#"> <img class="not-responsive"
			src="" width="30px" height="30px" class="img-center d-block" alt="">
		</a>
		<div class="w-25 not-responsive">
			<form class="form-inline w-100" method="post" action="Buscar">
				<input class="form-control w-75 no-border-radius" type="search"
					placeholder="Buscar" name="termino">
				<button
					class="no-border-radius btn bg-Urban-2 text-center text-white w-25"
					type="submit">Buscar</button>
			</form>

		</div>

		<div class="w-75 none-slider">
			<form class="form-inline w-100" method="post" action="Buscar">
				<input class="form-control w-75 no-border-radius" type="search"
					placeholder="Buscar" name="termino">
				<button
					class="no-border-radius btn bg-Urban-2 text-center text-white w-25"
					type="submit">Buscar</button>
			</form>

		</div>





		<div class="collapse navbar-collapse" id="navbarSupportedContent">
			<ul class="navbar-nav mr-auto">
				<li class="nav-item active"><a class="nav-link" href="Index">Incio</a>
				</li>
				<li class="nav-item"><a class="nav-link" href="Catalogo">Catálogo</a></li>

				<li class="nav-item"><a class="nav-link" href="Carrito">Carrito</a></li>

				<div class="dropdown-divider"></div>

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
				<div class="dropdown-divider"></div>

				<li class="nav-item"><a class="nav-link" href="AvisoLegal">Aviso
						Legal</a></li>
				<li class="nav-item"><a class="nav-link" href="PoliticasCookie">Políticas
						de Cookies</a></li>

			</ul>


		</div>
	</nav>

	<!-- Banner -->
	<div class="container-fluid  animate__animated animate__fadeIn">
		<div class="row header-banner process">
			<div class="col-md-12">
				<h3 class="text-center text-white center-header-banner">TRAMITAR
					PEDIDO</h3>
			</div>
		</div>
	</div>

	<section class='container mt-5'>

		<article class='row justify-content-between'>
			<div class="col-md-4">
				<form method="post">
					<h2>Datos de envio</h2>
					<div class="form-froup mt-3">
						<label for="fNombre">Nombre Completo:</label> <input type="text"
							class="form-control" name="fNombre" required>
					</div>
					<div class="form-froup mt-3">
						<label for="fTelefono">Número de teléfono:</label> <input
							type="tel" class="form-control" minlength="9" name="fTelefono"
							required pattern="[0-9]{9}" title="El número de telefono debe contener 9 dígitos">
					</div>
					<div class="form-froup mt-3">
						<label for="fCalle">Calle:</label> <input type="text"
							class="form-control" name="fCalle" required>
					</div>
					<div class="form-froup mt-3">
						<label for="fProvincia">Provincia:</label> <input type="text"
							class="form-control" name="fProvincia" required>
					</div>
					<div class="form-froup mt-3">
						<label for="fLocalidad">Localidad:</label> <input type="text"
							class="form-control" name="fLocalidad" required>
					</div>
					<div class="form-froup mt-3">
						<label for="fCp">Código Postal:</label> <input type="number"
							maxlength="5" minlength="5" class="form-control" name="fCp"
							required pattern="[0-9]{5}" title="El Código Postal debe contener 5 dígitos">
					</div>
					<div class="form-froup mt-3">
						<label for="fPais">País:</label> <input type="text"
							class="form-control" name="fPais" required>
					</div>
					<h2 class="mt-5">Datos del método de pago</h2>
					<div class="form-froup mt-3">
						<label for="fNombreTarjeta">Titular de la tarjeta:</label> <input
							type="text" class="form-control" name="fNombreTarjeta" required>
					</div>
					<div class="form-froup mt-3">
						<label for="fNumeroTarjeta">Número de la tarjeta:</label> <input
							type="number" minlength="16" maxlength="16" class="form-control"
							name="fNumeroTarjeta" pattern="[0-9]{16}" title="El Número de la tarjeta debe contener 16 dígitos" required>
					</div>
					<div class="form-froup mt-3">
						<label for="fMesTarjeta">Mes de vencimiento de la tarjeta:</label>
						<input type="number" max="12" min="1" class="form-control"
							name="fMesTarjeta" pattern="[1-9]{1}}|[10]{1}|[11]{1}}|[12]{1}" title="El mes de vencimiento debe estar entre 1 y 12" required>
					</div>
					<div class="form-froup mt-3">
						<label for="fAnoTarjeta">Año de vencimiento de la tarjeta:</label>
						<input type="number" max="99" min="1" class="form-control"
							name="fAnoTarjeta" required>
					</div>
					<div class="form-froup mt-3">
						<label for="fCVVTarjeta">Número secreto de la tarjeta:</label> <input
							type="number" minlength="3" maxlength="3" min="100" max="999"
							class="form-control" name="fCVVTarjeta" pattern="[0-9]{3}" title="El Número secreto de la tarjeta debe contener 3 dígitos" required>
					</div>
					<button type="submit " class="btn w-100 btn-primary mt-3 mb-5">Realizar
						compra</button>

				</form>
			</div>

			<div class='col-md-8 mt-4'>
				<div class="row">

					<%
						double precioTotal = 0;

						try {
							if ((boolean) session.getAttribute("Iniciado")) {

								listaProductosCarrito = (Cproducto[]) session.getAttribute("ProductosCarrito");
								listaidCarrito = (int[]) session.getAttribute("idCarritos");
								for (int j = 0; j < listaProductosCarrito.length; j++) {

									out.print("<div class='col-md-12 mt-5'>");
									out.print("<div class='card w-100'>");
									out.print("<div class='card-body'>");
									out.print("<div class='row'>");
									out.print("<div class='col-md-3'>");
									out.print("<img class='card-img-top' src = '/UrbanCity/DecodificarImagen?idreferencia="
											+ listaProductosCarrito[j].getIdreferencia() + "'>");
									out.print("</div>");
									out.print("<div class='col-md-3'>");
									out.print("<h5 class='card-title'>" + listaProductosCarrito[j].getNombre() + "</h5>");
									out.print("</div>");
									out.print("<div class='col-md-2'>");
									out.print("<h6 class='card-subtitle mb-2 text-muted'>" + listaProductosCarrito[j].getTalla()
											+ "</h6>");
									out.print("</div>");
									out.print("<div class='col-md-2'>");
									out.print("<p class='card-text text-center bold'>" + listaProductosCarrito[j].getPrecio()
											+ "€</p>");
									out.print("</div>");
									out.print("<div class='col-md-2'>");
									out.print("<a href='EliminarProductoCarrito?idcarrito=" + listaidCarrito[j]
											+ "' class='btn btn-primary w-100'>Eliminar</a>");
									out.print("</div>");
									out.print("</div>");
									out.print("</div>");
									out.print("</div>");
									out.print("</div>");

									precioTotal = precioTotal + listaProductosCarrito[j].getPrecio();
								}

							}
						} catch (Exception e) {

						}
					%>

				</div>
				<div class="row">
					<div class="col-md-12">
						<h3>
							El precio final de la compra es
							<%
							out.print(precioTotal);
						%>
							€
						</h3>
					</div>
				</div>
			</div>
		</article>

	</section>



	<!-- 

███████╗ ██████╗  ██████╗ ████████╗███████╗██████╗ 
██╔════╝██╔═══██╗██╔═══██╗╚══██╔══╝██╔════╝██╔══██╗
█████╗  ██║   ██║██║   ██║   ██║   █████╗  ██████╔╝
██╔══╝  ██║   ██║██║   ██║   ██║   ██╔══╝  ██╔══██╗
██║     ╚██████╔╝╚██████╔╝   ██║   ███████╗██║  ██║
╚═╝      ╚═════╝  ╚═════╝    ╚═╝   ╚══════╝╚═╝  ╚═╝
                                                    -->
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