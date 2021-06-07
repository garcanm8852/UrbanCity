<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html lang="en">

<%@ taglib prefix="navegacion" uri="./iniciado.tld"%>
<%
	String NombreUsuario = (String) session.getAttribute("NombreUsuario");
%>

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
<title>Urban City - Aviso Legal</title>
</head>
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
			<button
				class="no-border-radius btn bg-Urban-2 text-center text-white w-25"
				type="submit">Buscar</button>
		</form>

	</div>
	<div class="collapse navbar-collapse" id="navbarSupportedContent">
		<ul class="navbar-nav mr-auto">
			<li class="nav-item active"><a class="nav-link" href="Index">Incio</a>
			</li>
			<li class="nav-item"><a class="nav-link" href="Catalogo">Cat�logo</a></li>

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
			<h3 class="text-center text-white center">AVISO LEGAL</h3>

		</div>
	</div>
</div>

<div class="container">
	<!-- Noticia 1 -->
	<div class="row sep-t-50 justify-content-between">
		<div class="col-md-12">
			<!--  -->
			<h2 class="subtitulo mt-5">Qui�nes somos</h2>
			<p class="text-justify">En cumplimiento del art�culo 10 de la Ley
				34/2002, de 22 de julio, de Servicios de la Sociedad de la
				Informaci�n y Comercio Electr�nico, a continuaci�n se exponen los
				datos identificativos del titular.</p>
			<p class="text-justify">
				Titular: Urban City S.L.U. (en adelante Urban City) <br>
				NIF/CIF: N12344321 <br> Domicilio: Avenida Valdecarretera,
				N�mero 6, Natar�, Barcelona 08304 <br> Correo electr�nico:
				urbancity@gmail.com <br> Tel�fono: +34 605 58 12 94
			</p>
			<!--  -->
			<h2 class="subtitulo mt-5">Identificaci�n</h2>
			<p class="text-justify">Urban City S.L.U. (en adelante Urban
				City), somos una cl�nica veterinaria.</p>
			<p class="text-justify">En cumplimiento con el deber de
				informaci�n recogido en art�culo 10 de la Ley 34/2002, de 11 de
				julio, de Servicios de la Sociedad de la Informaci�n y del Comercio
				Electr�nico, los datos aqu� consignados corresponden a la entidad
				titular del sitio web urpesvet.es</p>
			<p class="text-justify">Denominaci�n: Urban City, S.L.U.</p>
			<p class="text-justify">Domicilio: Avenida Valdecarretera, N�mero
				6, Rota, C�diz 11520</p>
			<p class="text-justify">Tel�fono: +34 605 58 12 94 Email
				urbancity@gmail.com</p>
			<p class="text-justify">CIF: N12344321 Inscripci�n registral:
				Tomo 45756; Folio 8; Hoja B 498041</p>
			<!--  -->
			<h2 class="subtitulo mt-5">Propiedad intelectual e industrial.</h2>
			<p class="text-justify">Todos los derechos de Propiedad
				Industrial e Intelectual de la totalidad de elementos contenidos en
				esta Web, incluidos los formatos, dise�os gr�ficos, textos, im�genes
				y documentos, pertenecen a Urban City y se encuentran protegidos por
				las leyes espa�olas e internacionales sobre propiedad Intelectual e
				Industrial.</p>
			<p class="text-justify">Asimismo todas las marcas y nombres
				comerciales contenidos en esta Web pertenecen a Urban City , o a la
				persona f�sica, jur�dica, organismo o entidad que ostente la
				titularidad del signo distintivo y se encuentran del mismo modo
				protegidos por las leyes espa�olas e internacionales sobre propiedad
				Intelectual e Industrial.</p>
			<p class="text-justify">Queda expresamente prohibida la
				reproducci�n total o parcial de este sitio Web y de cualquiera de
				sus contenidos sin el permiso expreso y por escrito de Urban City .
				El acceso al sitio web no implica ning�n tipo de renuncia,
				transmisi�n, licencia o cesi�n de dichos derechos por parte de Urban
				City o los titulares de los derechos sobre los signos distintivos
				que se muestran en esta p�gina web, salvo que se establezca
				expresamente lo contrario.</p>
			<!--  -->
			<h2 class="subtitulo mt-5">Condiciones de uso.</h2>
			<p class="text-justify">El acceso a este sitio Web implica la
				aceptaci�n de estas condiciones de uso sin reservas que regulan el
				acceso y la utilizaci�n del mismo con el fin de poner a disposici�n
				de los usuarios informaci�n sobre nuestros productos y servicios. Se
				proh�be expresamente la utilizaci�n de los contenidos de este sitio
				Web para su utilizaci�n con fines comerciales o para su
				distribuci�n, transformaci�n o comunicaci�n.</p>
			<p class="text-justify">Urban City , no responder� de ninguna
				consecuencia, da�o o perjuicio que pudieran derivarse de dicha
				utilizaci�n o uso de la informaci�n. Tanto el acceso a esta Web como
				el uso que pueda hacerse de la informaci�n contenida en la misma es
				de la exclusiva responsabilidad de quien lo realiza.</p>
			<p class="text-justify">El usuario se obliga a no utilizar la
				informaci�n que se publica en esta Web con fines o efectos il�citos
				o lesivos, a no da�ar o inutilizar la informaci�n y a no realizar
				cualquier otra acci�n que puedan ser contraria al contenido de este
				Aviso Legal.</p>
			<p class="text-justify">Urban City se reserva el derecho a
				modificar los contenidos de la oferta comercial de sus productos
				cuando lo estime oportuno y a mantener su contenido actualizado.</p>
			<p class="text-justify">Urban City no puede asegurar la
				inexistencia de interrupciones o errores en el acceso a este sitio
				Web, aunque pondr� sus mayores esfuerzos para evitarlos.</p>
			<!--  -->
			<h2 class="subtitulo mt-5">Enlaces a otras webs.</h2>
			<p class="text-justify">Los enlaces (links) que puede encontrar
				en esta Web son un servicio a los usuarios. Cuando los enlaces
				redirijan al usuario a p�ginas que no son gestionadas ni controladas
				por Urban City, este no se har� responsable de los contenidos que
				ofrezcan estos sitios web que, en ning�n caso, estar�n regulados por
				el presente Aviso Legal. Si accede a estas p�ginas Webs deber� tener
				en cuenta que sus pol�ticas de privacidad pueden ser diferentes a la
				nuestra. Recomendamos consultar el Aviso Legal y la Pol�tica de
				Privacidad de cada una de ellas para estar debidamente informado.</p>
			<p class="text-justify">Legislaci�n aplicable y competencia
				jurisdiccional.</p>
			<p class="text-justify">El presente Aviso Legal se rige por la
				normativa espa�ola vigente que le es de aplicaci�n. Para la
				resoluci�n de las controversias que pudieran derivarse como
				consecuencia de lo dispuesto en las presentes disposiciones y sobre
				su interpretaci�n, aplicaci�n y cumplimiento, el usuario, en virtud
				de la aceptaci�n de las condiciones recogidas en este Aviso legal,
				renuncia expresamente a cualquier otro fuero que pudiera
				corresponderle.</p>
			<p class="text-justify">En cualquier caso, dentro de la
				jurisdicci�n espa�ola, si la legislaci�n permitiese someterse a un
				fuero en concreto, el usuario renuncia expresamente al fuero que
				pudiera corresponderle y se somete voluntariamente a la jurisdicci�n
				de los Juzgados y Tribunales de C�diz.</p>
		</div>

	</div>

</div>


<div
	class="container-fluid footer bg-Urban-1 mt-5 animate__animated animate__fadeIn">
	<div class="row p-5">
		<!-- Footer - Secci�n 1 -->
		<div class="col-md-4 responsive-mt-5">
			<h1 class="text-white text-center">Cont�ctanos</h1>
			<h5 class="text-center text-white mt-5 responsive-mt-5">
				Calle Reencarnaci�n N�215 <br> Matar�, Barcelona <br>
				08304 <br> Espa�a
			</h5>
		</div>
		<!-- Footer - Secci�n 2 -->
		<div class="col-md-4 responsive-mt-5">
			<img src="../MEDIA/IMG/Assets/pinterest.svg"
				class="w-50 d-block img-center" alt="">
		</div>
		<!-- Footer - Secci�n 3 -->
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
	<h5>Urban City es una marca registrada - 2021 � - Sitio web
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