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
<title>Urban City - Modificar Producto</title>
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
				<li class="nav-item"><a class="nav-link" href="Catalogo">Cat??logo</a></li>
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
				<li class="nav-item"><a class="nav-link" href="PoliticasCookie">Pol??ticas
						de Cookies</a></li>

			</ul>


		</div>
	</nav>
	<!-- Banner -->
	<div class="container-fluid  animate__animated animate__fadeIn">
		<div class="row header-banner process">
			<div class="col-md-12">
				<h3 class="text-center text-white center-header-banner">Modificar
					Producto</h3>
			</div>
		</div>
	</div>

	<!-- Breadcrumbs -->
	<section class="container mt-5 animate__animated animate__fadeIn">
		<section class="row">
			<div class="col-md-12">
				<nav aria-label="Page breadcrumb">
					<ol class="breadcrumb">
						<li class="breadcrumb-item" aria-current="page"><a
							class="breadcrumb-link" href="Index"> Urban City</a></li>
						<li class="breadcrumb-item" aria-current="page"><a
							class="breadcrumb-link" href="AdministrarProductos">
								AdministrarProductos</a></li>
						<li class="breadcrumb-item active"><a class="breadcrumb-link"
							href="ModificarProductos">Modificar Producto</a></li>
					</ol>
				</nav>
			</div>
		</section>
	</section>


	<form class="container animate__animated animate__fadeIn" method="post"
		action="ModificarProducto" >

		<section class="row">
			<div class="col-md-8">
				<div class="form-group ">
					<label for="fidreferencia">ID del Producto:</label> <input
						id="fidreferencia" class="form-control"
						value="<%=producto.getIdreferencia()%>" type="text"
						name="fidreferencia" readonly>
				</div>
				<div class="form-group ">
					<label for="fnombre">Nombre:</label> <input id="fnombre"
						class="form-control " type="text" name="fnombre"
						value="<%=producto.getNombre()%>" required>
				</div>
				<div class="form-group ">
					<label for="fdescripcion">Descripci??n:</label>
					<textarea id="fdescripcion" class="form-control" rows="3"
						name="fdescripcion"><%=producto.getDescripcion()%></textarea>
				</div>
				<div class="form-group ">
					<label for="fprecio">Precio:</label> <input id="fprecio"
						class="form-control " type="number" name="fprecio"
						value="<%=producto.getPrecio()%>" required>
				</div>


				<div class="form-group">
					<label for="fsubcategoria">Subcategor??a:</label> <select
						id="fsubcategoria" class="form-control" name="fsubcategoria"
						required>
						<%
							CCategoria[] subcategorias = (CCategoria[]) session.getAttribute("Subcategorias");
							for (int i = 0; i < subcategorias.length; i++) {
						%>

						<option value="<%=subcategorias[i].getIdcategoria()%>"
							<%=producto.getSubcategoria() == subcategorias[i].getIdcategoria() ? "selected" : null%>><%=subcategorias[i].getNombre()%></option>
						<%
							}
						%>





					</select>
				</div>

				<div class="form-group">
					<label for="ftalla">Talla:</label> <select id="ftalla"
						class="form-control" name="ftalla" required>
						<option value="xs">XS</option>
						<option value="s">S</option>
						<option value="m">M</option>
						<option value="l">L</option>
						<option value="xl">XL</option>
					</select>
				</div>

				<div class='w-100'>
					<button class="btn bg-Urban-1 text-center text-white p-3 w-100"
						type="submit">Modificar Producto</button>
				</div>
			</div>
			<div class="col-md-4">



				<div class="row mt-4 text-center justify-content-center">
					<div class="col-md-12 ">

						<img class="w-100"
							src="/UrbanCity/DecodificarImagen?idreferencia=<%=producto.getIdreferencia()%>">
						<a class="btn mt-5 bg-Urban-1 text-center text-white p-3 w-100"
							href="SubirImagen?idreferencia=<%=producto.getIdreferencia()%>">Cambiar
							la imagen del producto.</a>
					</div>
				</div>
			</div>


		</section>
	</form>


	<!-- FOOTER -->

	<div class="container-fluid footer bg-Urban-1 mt-5 ">
		<div class="row p-5">
			<!-- Footer - Secci??n 1 -->
			<div class="col-md-4 responsive-mt-5">
				<h1 class="text-white text-center">Cont??ctanos</h1>
				<h5 class="text-center text-white mt-5 responsive-mt-5">
					Calle Reencarnaci??n N??215 <br> Matar??, Barcelona <br>
					08304 <br> Espa??a
				</h5>
			</div>
			<!-- Footer - Secci??n 2 -->
			<div class="col-md-4 responsive-mt-5">
				<img src="../MEDIA/IMG/Assets/pinterest.svg"
					class="w-50 d-block img-center" alt="">
			</div>
			<!-- Footer - Secci??n 3 -->
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
		<h5>Urban City es una marca registrada - 2021 ?? - Sitio web
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