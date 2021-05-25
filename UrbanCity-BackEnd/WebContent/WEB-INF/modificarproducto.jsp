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
<title>Urban City - Modificar Producto</title>
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
	<!-- Banner -->
	<div class="container-fluid  animate__animated animate__fadeIn">
		<div class="row header-banner process">
			<div class="col-md-12">
				<h3 class="text-center text-white center-header-banner">Modificar Producto</h3>
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


	<form class="container animate__animated animate__fadeIn" method="post" action="CrearProducto" enctype="multipart/form-data">
		
		<section class="row">
			<div class="col-md-8">
				<div class="form-group ">
					<label for="fidreferencia">ID del Producto:</label> <input
						id="fidreferencia" class="form-control " type="text"
						name="fidreferencia" required>
				</div>
				<div class="form-group ">
					<label for="fnombre">Nombre:</label> <input id="fnombre"
						class="form-control " type="text" name="fnombre" required>
				</div>
				<div class="form-group ">
					<label for="fdescripcion">Descripción:</label>
					<textarea id="fdescripcion" class="form-control" rows="3"
						name="fdescripcion">
                </textarea>
				</div>
				<div class="form-group ">
					<label for="fprecio">Precio:</label> <input id="fprecio"
						class="form-control " type="number" name="fprecio" required>
				</div>
			</div>
			<div class="col-md-4">
				<div class="form-group">
					<label for="fsubcategoria">Subcategoría:</label> <select
						id="fsubcategoria" class="form-control" name="fsubcategoria" required>
						<%
							CCategoria[] subcategorias = (CCategoria[]) session.getAttribute("Subcategorias");
							for (int i = 0; i < subcategorias.length; i++) {

								out.print("<option value='" + subcategorias[i].getIdcategoria() + "'>" + subcategorias[i].getNombre()
										+ "</option>");

							}
						%>





					</select>
				</div>

				<div class="form-group">
					<label class="" for="file">Imagen: </label> <input type=file
						size=60 name="file" value="Examinar">
				</div>

				<div class="row mt-4 text-center justify-content-center">
					<div class="col-md-12 selector">
						<div class="container-fluid">
							<div class="row ">
								<div class="col selector">
									<div class="form-check-inline w-100 justify-content-center p-3">
										<input class="form-check-input" type="radio" name="size"
											id="sizexs" value="xs" hidden> <label
											class="form-check-label" for="sizexs"> XS </label>
									</div>
								</div>
								<div class="col selector">
									<div class="form-check-inline w-100 justify-content-center p-3">
										<input class="form-check-input" type="radio" name="size"
											id="sizes" value="s" hidden> <label
											class="form-check-label" for="sizes"> S </label>
									</div>
								</div>
								<div class="col selector">
									<div class="form-check-inline w-100 justify-content-center p-3">
										<input class="form-check-input" type="radio" name="size"
											id="sizem" value="m" checked hidden> <label
											class="form-check-label" for="sizem"> M </label>
									</div>
								</div>
								<div class="col selector">
									<div class="form-check-inline w-100 justify-content-center p-3">
										<input class="form-check-input" type="radio" name="size"
											id="sizel" value="l" hidden> <label
											class="form-check-label" for="sizel"> L </label>
									</div>
								</div>
								<div class="col selector">
									<div class="form-check-inline w-100 justify-content-center p-3">
										<input class="form-check-input" type="radio" name="size"
											id="sizexl" value="xl" hidden> <label
											class="form-check-label" for="sizexl"> XL </label>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>


			</div>
			
			</section>
			
					<section class="row">
			<section class="col-md-12">
				<div class='w-100'>
			<button class="btn bg-Urban-1 text-center text-white p-3 w-100" type="submit">Añadir Producto</button>
			</div>
			</section>
		</section>
		</form>


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