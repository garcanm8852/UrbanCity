<%@page import="etiqueta.producto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="Catalogo.Cproducto"%>
<%@ taglib prefix="navegacion" uri="./iniciado.tld"%>


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
<title>Urban City - Carrito</title>
</head>



<%
	Cproducto[] listaProductosCarrito;
	int listaidCarrito[];
	String NombreUsuario = (String) session.getAttribute("NombreUsuario");
%>


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
				<li class="nav-item"><a class="nav-link" href="Catalogo">Catálogo</a></li>
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
	<div class="container-fluid  animate__animated animate__fadeIn">
		<div class="row header-banner cart">
			<div class="col-md-12">
				<h3 class="text-center text-white center-header-banner">CARRITO</h3>




				
			</div>
		</div>
	</div>


	<section
		class="container-fluid  animate__animated animate__fadeIn animate__slower">
		<section class="row">
			<div class="col-4 bg-Urban-1 text-center text-white p-4">
				<h4>Producto</h4>
			</div>
			<div class="col-4 bg-Urban-1 text-center text-white p-4">
				<h4>Talla</h4>
			</div>
			<div class="col-4 bg-Urban-1 text-center text-white p-4">
				<h4>Precio</h4>
			</div>
		</section>

		<%
			double precioTotal = 0;

			try {
				if ((boolean) session.getAttribute("Iniciado")) {

					listaProductosCarrito = (Cproducto[]) session.getAttribute("ProductosCarrito");
					listaidCarrito = (int[]) session.getAttribute("idCarritos");
					for (int j = 0; j < listaProductosCarrito.length; j++) {
		%>

		<section class="row mt-5 responsive-mt-5">
			<div class="col-4 no-padding text-center">
				<h4 class=""><%=listaProductosCarrito[j].getNombre()%></h4>
				<a
					href="Producto?idreferencia=<%=listaProductosCarrito[j].getIdreferencia()%>">

					<img
					src="/UrbanCity/DecodificarImagen?idreferencia=<%=listaProductosCarrito[j].getIdreferencia()%>"
					alt="" class="w-25 block img-center mt-3 not-responsive">
				</a>
			</div>
			<div class="col-4 no-padding text-center">
				<h4>M</h4>
			</div>
			<div class="col-4 no-padding text-center">
				<h4><%=listaProductosCarrito[j].getPrecio()%>€
				</h4>
				<br>
				<div class="w-100 pr-3 pl-3">
					<a href="EliminarProductoCarrito?idcarrito=<%=listaidCarrito[j]%>"
						class="btn bg-Urban-1 text-white text-center w-100 pr-3 pl-3">Eliminar
						del carrito</a>
				</div>
			</div>
		</section>

		<%
			precioTotal = precioTotal + listaProductosCarrito[j].getPrecio();
					}
				} else {
					listaProductosCarrito = (Cproducto[]) session.getAttribute("ProductosCookie");
					for (int h = 0; h < listaProductosCarrito.length; h++) {
		%>


		<section class="row mt-5 responsive-mt-5">
			<div class="col-4 no-padding text-center">
				<h4 class=""><%=listaProductosCarrito[h].getNombre()%></h4>
				<a
					href="Producto?idreferencia=<%=listaProductosCarrito[h].getIdreferencia()%>">

					<img
					src="/UrbanCity/DecodificarImagen?idreferencia=<%=listaProductosCarrito[h].getIdreferencia()%>"
					alt="" class="w-25 block img-center mt-3 not-responsive">
				</a>
			</div>
			<div class="col-4 no-padding text-center">
				<h4>M</h4>
			</div>
			<div class="col-4 no-padding text-center">
				<h4><%=listaProductosCarrito[h].getPrecio()%>€
				</h4>
				<br>
				<div class="w-100 pr-3 pl-3">
					<a
						href="EliminarProductoCarrito?idcookie=<%=listaProductosCarrito[h].getIdreferencia()%>"
						class="btn bg-Urban-1 text-white text-center w-100 pr-3 pl-3">Eliminar
						del carrito</a>
				</div>
			</div>
		</section>


		<%
			precioTotal = precioTotal + listaProductosCarrito[h].getPrecio();
					}

				}
			} catch (Exception e) {
				// Throw e;

			}
		%>



	</section>

	<section class="row mt-5 responsive-mt-5 pr-3 pl-3">
		<div class="col-md-4"></div>
		<div class="col-md-8">
			<div class="row pt-5 border-top-separator">
				<div class="col-6 text-center">
					<h4>Subtotal</h4>
				</div>
				<div class="col-6 text-center">
					<h4><%= precioTotal %>€</h4>
				</div>
			</div>
			<div class="row mt-5 pb-5 border-bottom-separator">
				<div class="col-6 text-center">
					<h4>Envío</h4>
				</div>
				<div class="col-6 text-center">
					<h4>Grátis</h4>
				</div>
			</div>
			<div class="row mt-5">
				<div class="col-6 text-center">
					<h4>Total</h4>
				</div>
				<div class="col-6 text-center">
					<h4><%= precioTotal %>€</h4>
				</div>
			</div>
			<div class="row mt-5">
	
				<%
					if ((boolean) session.getAttribute("Iniciado")) {
						if (precioTotal > 0) {

							out.print("<div class='col-12 text-center no-padding'>");
							out.print(
									"<a href='RealizarCompra' class='btn w-100 bg-Urban-1 p-3 text-center text-white'>Tramitar Pedido</a>");
							out.print("</div>");
						}
					} else {
						out.print("<div class='col-12 text-center no-padding'>");

						out.print("<a href='IniciarSesion' class='btn btn-primary  p-3 text-light w-100'>Iniciar Sesión</a>");
						out.print(
								"<p class='text-danger text-center mt-3'>Recuerda que si deseas seguir con el pedido debes iniciar sesión.</p>");
						out.print("<p class='text-center'>O</p>");
						out.print("<a href='Registro' class='btn btn-success p-3 text-light w-100'>Registrate</a>");
						out.print("</div>");

					}
				%>

			</div>
		</div>
	</section>
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