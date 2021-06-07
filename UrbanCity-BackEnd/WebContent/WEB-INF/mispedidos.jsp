<%@ taglib prefix="navegacion" uri="./iniciado.tld"%>
<%@ taglib prefix="producto" uri="./urbancityProductTags.tld"%>

<%@ page language='java' contentType='text/html; charset=UTF-8'
	pageEncoding='UTF-8'%>
<%@page import="Catalogo.Cproducto"%>
<%@page import="Catalogo.CCategoria"%>
<%@page import="Compra.CPedido"%>


<!DOCTYPE html>
<%
	String NombreUsuario = (String) session.getAttribute("NombreUsuario");
	String idreferencia;
	String nombre;
	String marca;
	String precio;
	CPedido[] listaPedidos;
	Cproducto[] listaProductos;
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
<title>Urban City - Mis Pedidos</title>
</head>

<body>

	<!-- Nav Bar -->
	<nav class="navbar  navbar-dark bg-Urban-1 text-white">
		<span>&nbsp;</span> <a class="navbar-brand" href="#"> <img src=""
			width="30px" height="30px" class="img-center d-block" alt="">
		</a>
		<button class="navbar-toggler" type="button" data-toggle="collapse"
			data-target="#navbarSupportedContent"
			aria-controls="navbarSupportedContent" aria-expanded="false"
			aria-label="Toggle navigation">
			<span class="navbar-toggler-icon"></span>
		</button>

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
	<div class="container-fluid  animate__animated animate__fadeIn">
		<div class="row header-banner Catalogue">
			<div class="col-md-12">
				<h3 class="text-center text-white center-header-banner">Mis
					Pedidos</h3>



			</div>
		</div>
	</div>
	<!-- Breadcrumbs -->
	<section class="container mt-5">
		<section class="row">
			<div class="col-md-12">
				<nav aria-label="Page breadcrumb">
					<ol class="breadcrumb">
						<li class="breadcrumb-item" aria-current="page"><a
							class="breadcrumb-link" href="Index"> Urban City</a></li>
						<li class="breadcrumb-item active"><a class="breadcrumb-link"
							href="MisPedidos">Mis Pedidos</a></li>
					</ol>
				</nav>
			</div>
		</section>
	</section>

	<section class="container">
		<section class="row">
			<section class="col-md-12">

				<div class="accordion" id="accordionFather">

					<%
						listaPedidos = (CPedido[]) request.getAttribute("listaPedidos");

						for (int j = 0; j < 19; j++) {
					%>
					<div class="card">
						<div class="card-header" id="<%=listaPedidos[j].getIdpedido()%>">
							<h2 class="mb-0">
								<button class="btn btn-link btn-block text-left" type="button"
									data-toggle="collapse"
									data-target="#<%=listaPedidos[j].getIdpedido()%>target"
									aria-expanded="true" aria-controls="collapseOne">
									<!--FECHA DEL PEDIDO O ID DEL PEDIDO-->
									Pedido:
									<%=listaPedidos[j].getIdpedido()%>
								</button>
							</h2>
						</div>
						<div id="<%=listaPedidos[j].getIdpedido()%>target"
							class="collapse show"
							aria-labelledby="<%=listaPedidos[j].getIdpedido()%>"
							data-parent="#accordionFather">
							<div class="card-body">
								<!--PRINCIPIO BUCLE-->
								<div
									class="container  animate__animated animate__fadeIn animate__slower">
									<div
										class="row  animate__animated animate__fadeInUp animate__slower">

										<%
											listaProductos = listaPedidos[j].getListaProductosPedido();
												for (int k = 0; k < listaProductos.length; k++) {
													idreferencia = listaProductos[k].getIdreferencia();
													nombre = listaProductos[k].getNombre();
													precio = listaProductos[k].getPrecio().toString();
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
										%>
									</div>



									<!--FIN BUCLE-->

									<div class="row">
									
										<div class="col-md-12 pl-5 pr-5 mt-5 pb-5">
											<form>
												<h2>Datos de envio</h2>
												<div class="form-froup mt-3">
													<label for="fNombre">Nombre Completo:</label> <input
														type="text" class="form-control" name="fNombre" value=""
														disabled>
												</div>

												<div class="form-froup mt-3">
													<label for="fTelefono">Número de teléfono:</label> <input
														type="tel" class="form-control" minlength="9"
														name="fTelefono"
														value="<%=listaPedidos[j].getTel().toString()%>" disabled>
												</div>
												<div class="form-froup mt-3">
													<label for="fCalle">Calle:</label> <input type="text"
														class="form-control" name="fCalle"
														value="<%=listaPedidos[j].getCalle().toString()%>"
														disabled>
												</div>
												<div class="form-froup mt-3">
													<label for="fProvincia">Provincia:</label> <input
														type="text" class="form-control" name="fProvincia"
														value="<%=listaPedidos[j].getProvincia()%>" disabled>
												</div>
												<div class="form-froup mt-3">
													<label for="fLocalidad">Localidad:</label> <input
														type="text" class="form-control" name="fLocalidad"
														value="<%=listaPedidos[j].getLocalidad()%>" disabled>
												</div>
												<div class="form-froup mt-3">
													<label for="fCp">Código Postal:</label> <input
														type="number" class="form-control" name="fCp"
														value="<%=listaPedidos[j].getCp()%>" disabled>
												</div>
												<div class="form-froup mt-3">
													<label for="fPais">País:</label> <input type="text"
														class="form-control" name="fPais"
														value="<%=listaPedidos[j].getPais()%>" disabled>
												</div>

											</form>
										</div>
									</div>
								</div>
							</div>
						</div>

					</div>

					<%
						}
					%>
				</div>
			</section>
		</section>
	</section>



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
						</h5>

					</div>

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