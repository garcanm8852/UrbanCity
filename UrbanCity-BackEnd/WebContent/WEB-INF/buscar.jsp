<%@ taglib prefix="navegacion" uri="./iniciado.tld"%>
<%@ taglib prefix="producto" uri="./urbancityProductTags.tld"%>

<%@ page language='java' contentType='text/html; charset=UTF-8'
	pageEncoding='UTF-8'%>
<%@page import="Catalogo.Cproducto"%>
<%@page import="Catalogo.CCategoria"%>

<!DOCTYPE html>
<%
	Cproducto[] listaProductos;
	String NombreUsuario = (String) session.getAttribute("NombreUsuario");
	String idreferencia;
	String nombre;
	String marca;
	String precio;
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
<title>Catálogo</title>
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
				<li class="nav-item"><a class="nav-link" href="Catalogo">Catálogo</a></li>
				<%
					CCategoria[] categorias = (CCategoria[]) session.getAttribute("Categorias");
					for (int i = 0; i < categorias.length; i++) {
						out.print("<li class='nav-item '><a class='nav-link ' href='Catalogo?idcategoria="
								+ categorias[i].getIdcategoria() + "' tabindex='-1 ' aria-disabled='true '>"
								+ categorias[i].getNombre() + "</a></li>");
					}
				%>
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

	<!-- TODO AÑADIR SECCION CON TERMINO DE BUSQUEDA -->

	<!-- Breadcrumbs -->
	<section class="container mt-5">
		<section class="row">
			<div class="col-md-12">
				<nav aria-label="Page breadcrumb">
					<ol class="breadcrumb">
						<li class="breadcrumb-item" aria-current="page"><a
							class="breadcrumb-link" href="Index"> Urban City</a></li>
						<li class="breadcrumb-item active"><a class="breadcrumb-link"
							href="#">Buscar</a></li>
						<li class="breadcrumb-item active"><a class="breadcrumb-link"
							href="#"><%= request.getAttribute("termino").toString() %></a></li>
					</ol>
				</nav>
			</div>
		</section>
	</section>



	<section
		class="container mt-5 animate__animated animate__fadeIn animate__slower">
		<!-- Fila Productos -->
		<section
			class="row mt-5 animate__animated animate__fadeInUp animate__slower">


			<%
				try {
					listaProductos = (Cproducto[]) session.getAttribute("Productos");
					for (int j = 0; j < listaProductos.length; j++) {
						idreferencia = listaProductos[j].getIdreferencia();
						nombre = listaProductos[j].getNombre();
						marca = listaProductos[j].getMarca();
						precio = listaProductos[j].getPrecio().toString();
			%>
			<producto:Cabecera />
			<producto:Imagen idreferencia="<%=idreferencia%>" />
			<producto:CuerpoApertura />
			<producto:Nombre nombre="<%=nombre%>" />
			<producto:InfoApertura />
			<producto:Precio precio="<%=precio%>" />
			<producto:Boton idreferencia="<%=idreferencia%>" />
			<producto:InfoCierre />
			<producto:CuerpoCierre />
			<producto:Footer />

			<%
				}
				} catch (Exception e) {
					// Throw e;

				}
			%>
		</section>
	</section>

	<nav aria-label="Page navigation example" class="mt-5">
		<ul class="pagination   justify-content-center">
			<%
				if (request.getParameter("Pagina") != null) {
					for (int k = 0; k < (int) session.getAttribute("NumeroPaginas"); k++) {

						if (Integer.parseInt(request.getParameter("Pagina")) == k) {
							out.print(
									"<li class='page-item active'><a class='page-link page-link pr-5 pl-5' href='Buscar?termino= "
											+ request.getAttribute("termino").toString() + "&?Pagina=" + k + "'>" + (k + 1)
											+ "</a></li>");
						} else {
							out.print("<li class='page-item'><a class='page-link page-link pr-5 pl-5' href='Buscar?termino="
									+ request.getAttribute("termino").toString() + "&?Pagina=" + k + "'>" + (k + 1)
									+ "</a></li>");
						}

					}
				} else {
					for (int k = 0; k < (int) session.getAttribute("NumeroPaginas"); k++) {

						out.print("<li class='page-item'><a class='page-link page-link pr-5 pl-5' href='Buscar?Pagina=" + k
								+ "'>" + (k + 1) + "</a></li>");
					}
				}
			%>
		</ul>
	</nav>

	<!-- FOOTER -->

	<div class="container-fluid footer bg-Urban-1 mt-5 ">
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