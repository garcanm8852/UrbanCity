<%@ taglib prefix="producto" uri="./urbancityProductTags.tld"%>
<%@ taglib prefix="navegacion" uri="./iniciado.tld"%>

<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="Catalogo.Cproducto"%>
<%@page import="Catalogo.CCategoria"%>

<!DOCTYPE html>


<%
	String NombreUsuario = (String) session.getAttribute("NombreUsuario");

	Cproducto producto = (Cproducto) session.getAttribute("Producto");
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
<title>Urban City - <%=producto.getNombre()%></title>
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
				<li class="nav-item dropdown"><a
					class="nav-link dropdown-toggle" href="#" id="navbarDropdown"
					role="button" data-toggle="dropdown" aria-haspopup="true"
					aria-expanded="false"> Categorias </a>
					<div
						class="dropdown-menu animate__fadeInLeft animate__animated  animate__faster"
						aria-labelledby="navbarDropdown">


						<%
							CCategoria[] categorias = (CCategoria[]) session.getAttribute("Categorias");
							for (int i = 0; i < categorias.length; i++) {

								out.print("<a class='dropdown-item' href='Catalogo?idcategoria=" + categorias[i].getIdcategoria() + "'>"
										+ categorias[i].getNombre() + "</a>");
							}
						%>
					</div></li>
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


	<!-- Breadcrumbs -->
	<section class="container mt-5">
		<section class="row">
			<div class="col-md-12">
				<nav aria-label="Page breadcrumb">
					<ol class="breadcrumb">
						<li class="breadcrumb-item" aria-current="page"><a
							class="breadcrumb-link" href="Index"> Inicio </a></li>
						<li class="breadcrumb-item "><a class="breadcrumb-link"
							href="Catalogo">Catálogo</a></li>
						<li class="breadcrumb-item "><a class="breadcrumb-link"
							href="Catalogo?idcategoria=<%=producto.getCategoria()%>"><%=producto.getNombreCategoria()%></a></li>
						<li class="breadcrumb-item "><a class="breadcrumb-link"
							href="Catalogo?idsubcategoria=<%=producto.getSubcategoria()%>"><%=producto.getNombreSubcategoria()%></a></li>
						<li class="breadcrumb-item active"><a class="breadcrumb-link"
							href="#"><%=producto.getNombre()%></a></li>

					</ol>
				</nav>
			</div>
		</section>
	</section>

	<!-- Product -->
	<section
		class="container mt-5 animate__animated animate__fadeIn animate__slower">
		<div class="row justify-content-center">
			<!-- TODO Tratar Overflow -->
			<div class="col-md-2 not-responsive"
				style="max-height: 230px; overflow: hidden;">
				<img
					src="/UrbanCity/DecodificarImagen?idreferencia=<%=producto.getIdreferencia()%>"
					alt="" class="block img-center w-50"> <img
					src="/UrbanCity/DecodificarImagen?idreferencia=<%=producto.getIdreferencia()%>"
					alt="" class="block img-center w-50"> <img
					src="/UrbanCity/DecodificarImagen?idreferencia=<%=producto.getIdreferencia()%>"
					alt="" class="block img-center w-50"> <img
					src="/UrbanCity/DecodificarImagen?idreferencia=<%=producto.getIdreferencia()%>"
					alt="" class="block img-center w-50">
			</div>
			<div class="col-md-5 responsive-mt-5">
				<img
					src="/UrbanCity/DecodificarImagen?idreferencia=<%=producto.getIdreferencia()%>"
					alt="" class="w-100 d-block img-center"
					style="max-height: 230px; width: auto !important;">
			</div>
			<div class="col-md-5 responsive-mt-5">
				<!-- Sección Info Producto -->
				<div class="container">
					<div class="row">
						<div class="col">
							<h4 class="text-center"><%=producto.getNombre()%></h4>

						</div>
					</div>
					<div class="row mt-4">
						<div class="col text-center">
							<h5>PRECIO:</h5>
						</div>
						<div class="col text-center"><%=producto.getPrecio()%>€
						</div>
					</div>
					<div class="row mt-4">
						<div class="col text-center">
							<h5>REFERENCIA:</h5>
						</div>
						<div class="col text-center"><%=producto.getIdreferencia()%></div>
					</div>
					<div class="row mt-4 text-center">
						<div class="col"><%=producto.getDescripcion()%></div>
					</div>

				  <div class="row mt-4 text-center justify-content-center">
                        <div class="col-md-12 selector">
                            <div class="container-fluid">
                                <div class="row ">
                                    <div class="col selector">
                                        <div class="form-check-inline w-100 justify-content-center p-3">
                                            <input class="form-check-input" type="radio" name="size" id="sizexs" value="xs" hidden>
                                            <label class="form-check-label" for="sizexs">
                                    XS
                                </label>
                                        </div>
                                    </div>
                                    <div class="col selector">
                                        <div class="form-check-inline w-100 justify-content-center p-3">
                                            <input class="form-check-input" type="radio" name="size" id="sizes" value="s" hidden>
                                            <label class="form-check-label" for="sizes">
                                    S
                                </label>
                                        </div>
                                    </div>
                                    <div class="col selector">
                                        <div class="form-check-inline w-100 justify-content-center p-3">
                                            <input class="form-check-input" type="radio" name="size" id="sizem" value="m" checked hidden>
                                            <label class="form-check-label" for="sizem">
                                    M
                                </label>
                                        </div>
                                    </div>
                                    <div class="col selector">
                                        <div class="form-check-inline w-100 justify-content-center p-3">
                                            <input class="form-check-input" type="radio" name="size" id="sizel" value="l" hidden>
                                            <label class="form-check-label" for="sizel">
                                    L
                                </label>
                                        </div>
                                    </div>
                                    <div class="col selector">
                                        <div class="form-check-inline w-100 justify-content-center p-3">
                                            <input class="form-check-input" type="radio" name="size" id="sizexl" value="xl" hidden>
                                            <label class="form-check-label" for="sizexl">
                                    XL
                                </label>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>

					<div class="row mt-4 ">
						<div class="col-12 no-padding">
							<a href="Carrito?idproducto=<%=producto.getIdreferencia()%>"
								class="btn bg-Urban-1 text-white text-center w-100">Añadir
								al carrito</a>
						</div>
					</div>
				</div>


			</div>
		</div>
	</section>

	<!-- Composición y cuidados | Guia de Tallas -->
	<section
		class="container mt-5 responsive-mt-5 animate__animated animate__fadeIn animate__slower">
		<section class="row">
			<div class="col-12 no-padding">
				<ul class="nav nav-pills w-100" id="pills-tab" role="tablist">
					<li class="nav-item w-50 text-center" role="presentation"><a
						class="nav-link active" id="pills-home-tab" data-toggle="pill"
						href="#pills-home" role="tab" aria-controls="pills-home"
						aria-selected="true">COMPOSICIÓN Y CUIDADOS</a></li>
					<li class="nav-item w-50 text-center" role="presentation"><a
						class="nav-link" id="pills-profile-tab" data-toggle="pill"
						href="#pills-profile" role="tab" aria-controls="pills-profile"
						aria-selected="false">GUÍA DE TALLAS</a></li>
				</ul>
				<div class="tab-content" id="pills-tabContent">
					<div class="tab-pane fade p-5 show active" id="pills-home"
						role="tabpanel" aria-labelledby="pills-home-tab">
						<%=producto.getDescripcion()%>
					</div>
					<div class="tab-pane fade p-5" id="pills-profile" role="tabpanel"
						aria-labelledby="pills-profile-tab">GUIA DE TALLAS TAG</div>
				</div>
			</div>
		</section>
	</section>

	<!-- Sección Podría Gustarte -->
	<section
		class="container responsive-mt-5 mt-5 animate__animated animate__fadeIn animate__slower">
		<!-- Título - Podría gustarte -->
		<section
			class="row  animate__animated animate__fadeInUp animate__slower">
			<div class="col-md-12">
				<h3 class="text-center">TE PODRÍA GUSTAR</h3>
			</div>
		</section>
		<!-- Fila Productos -->
		<section
			class="row mt-5  animate__animated animate__fadeInUp animate__slower">
			<!-- Producto -->

			<!-- TODO FOR CON PRODUCTOS -->
			<producto:Cabecera />
			<producto:Imagen idreferencia="<%=producto.getIdreferencia()%>" />
			<producto:CuerpoApertura />
			<producto:Nombre nombre="<%=producto.getNombre()%>" />
			<producto:InfoApertura />
			<producto:Precio precio="<%=producto.getPrecio().toString()%>" />
			<producto:Boton idreferencia="<%=producto.getIdreferencia()%>" />
			<producto:InfoCierre />
			<producto:CuerpoCierre />
			<producto:Footer />
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