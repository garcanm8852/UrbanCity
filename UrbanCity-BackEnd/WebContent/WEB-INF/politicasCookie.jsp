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
<title>Urban City - Políticas de Cookies</title>
</head>
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
<div class="container-fluid animate__animated animate__fadeIn">
	<div class="row banner Index">
		<div class="col-md-12">
			<h3 class="text-center text-white center">Políticas de Cookies</h3>

		</div>
	</div>
</div>

<div class="container">
<div class="row mt-5 justify-content-between">
    <div class="col-md-12">
        <!--  -->
        <p class="text-justify">El sitio web www.Urban City.es utiliza cookies.
        </p>
        <p class="text-justify">En cumplimiento con lo dispuesto en el artículo 22.2 de la Ley 34/2002, de 11 de julio, de Servicios de la Sociedad de la Información y de Comercio Electrónico, esta página web le informa, en esta sección, sobre la política de recogida
            y tratamiento de cookies.
        </p>
        <!--  -->
        <h2 class="subtitulo mt-5">¿Qué son las cookies? </h2>
        <p class="text-justify">Una cookie es un fichero que se descarga en su dispositivo al acceder a determinadas páginas web. Las cookies permiten a una página web, entre otras cosas, almacenar y recuperar información sobre los hábitos de navegación de un usuario
            o de su equipo y, dependiendo de la información que contengan y de la forma en que utilice su equipo, pueden utilizarse para reconocer al usuario anónimo y su ordenador ó dispositivo y no proporcionan referencias que permitan conocer
            sus datos personales.
        </p>
        <!--  -->
        <h2 class="subtitulo mt-5">¿Qué tipos de cookies utiliza esta página web?</h2>
        <p class="text-justify">El sitio web www.Urban City.eslos siguientes tipos de cookies:
        </p>
        <p class="subtitulo mt-5">a) Según la entidad que las gestione:</p>
        <p class="text-justify">Cookies propias: Son aquellas que se envían al equipo terminal del usuario desde un equipo o dominio gestionado por el propio editor y desde el que se presta el servicio Solicitado por el usuario.
        </p>
        <p class="text-justify">Cookies de terceros: Son aquellas que se envían al equipo terminal del usuario desde un equipo o dominio que no es gestionado por el editor, sino por otra entidad que trata los datos obtenidos través de las cookies.
        </p>
        <!--  -->
        <h2 class="subtitulo mt-5">b) Según el tiempo que permanecen activas:
        </h2>
        <p class="text-justify">Cookies técnicas: Son aquellas que permiten al usuario la navegación a través de una página web, plataforma o aplicación y la utilización de las diferentes opciones o servicios que en ella existan como, por ejemplo, controlar el tráfico
            y la comunicación de datos, identificar la sesión, acceder a partes de acceso restringido, recordar los elementos que integran un pedido, realizar el proceso de compra de un pedido, realizar la solicitud de inscripción o participación
            en un evento, utilizar elementos de seguridad durante la navegación, almacenar contenidos para la difusión de videos o sonido o compartir contenidos a través de redes sociales.
        </p>
        <p class="text-justify">Cookies de personalización: Son aquellas que permiten al usuario acceder al servicio con algunas características de carácter general predefinidas en función de una serie de criterios en el terminal del usuario como por ejemplo serian el
            idioma, el tipo de navegador a través del cual accede al servicio, la configuración regional desde donde accede al servicio, etc.
        </p>
        <p class="text-justify">Cookies de análisis: Son aquellas que bien tratadas por nosotros o por terceros, nos permiten cuantificar el número de usuarios y así realizar la medición y análisis estadístico de la utilización que hacen los usuarios del servicio ofertado.
            Para ello se analiza su navegación en nuestra página web con el fin de mejorar la oferta de productos o servicios que le ofrecemos.
        </p>
        <p class="text-justify">Cookies publicitarias: Son aquellas que permiten la gestión, de la forma más eficaz posible, de los espacios publicitarios que, en su caso, el editor haya incluido en una página web, aplicación o plataforma desde la que presta el servicio
            solicitado basándonos en criterios como el contenido editado o la frecuencia en la que se muestran los anuncios.
        </p>
        <p class="text-justify">Cookies de publicidad comportamental: Son aquellas que permiten la gestión, de la forma más eficaz posible, de los espacios publicitarios que, en su caso, el editor haya incluido en una página web, aplicación o plataforma desde la que
            presta el servicio solicitado. Estas cookies almacenan información del comportamiento de los usuarios obtenida a través de la observación continuada de sus hábitos de navegación, lo que permite desarrollar un perfil específico para
            mostrar publicidad en función del mismo. Asimismo es posible que al visitar alguna página web o al abrir algún email donde se publique algún anuncio o alguna promoción sobre nuestros productos o servicios se instale en tu navegador
            alguna cookie que nos sirve para mostrarte posteriormente publicidad relacionada con la búsqueda que hayas realizado, desarrollar un control de nuestros anuncios en relación, por ejemplo, con el número de veces que son vistos, donde
            aparecen, a qué hora se ven, etc.
        </p>
        <!--  -->

        <h2 class="subtitulo mt-5">Tipos de cookies utilizadas en este sitio web
        </h2>
        <p class="text-justify">Las cookies utilizadas en nuestro sitio web son persistentes, de sesión y de terceros, y nos permiten almacenar y acceder a información relativa al idioma, el tipo de navegador utilizado, y otras características generales predefinidas
            por el usuario, así como seguir y analizar la actividad que lleva a cabo para mejorar y prestar nuestros servicios de una manera más eficiente y personalizada. Las cookies usadas tienen, en todo caso, carácter temporal, con la única
            finalidad de hacer más eficaz la navegación. En ningún caso estas cookies proporcionan por sí mismas datos de carácter personal y no se usan para la recogida de los mismos.
        </p>
        <p class="text-justify">Urban City utiliza cookies publicitarias o de publicidad comportamental.
        </p>
        <p class="text-justify">La utilización de las cookies ofrece ventajas, como por ejemplo:
        </p>
        <ul>
            <li>
                <p class="text-justify">Facilita al usuario la navegación y el acceso a los diferentes servicios que ofrece este sitio web.
                </p>
            </li>
            <li>
                <p class="text-justify">Evita al usuario tener que configurar las características generales predefinidas cada vez que accede al sitio web.
                </p>
            </li>
            <li>
                <p class="text-justify">Favorece la mejora del funcionamiento y de los servicios prestados a través de este sitio web, tras el correspondiente análisis de la información obtenida a través de las cookies instaladas.

                </p>
            </li>

        </ul>
        <p class="text-justify">Al acceder a nuestra web se le informa que si sigue navegando se le instalarán diversas cookies de terceros consintiendo así la instalación de determinadas cookies que tendrán como única finalidad la de registrar el acceso a nuestro sitio
            web para la realización de estadísticas anónimas sobre las visitas, recopilando información siempre de forma anónima. No es necesario que acepte la instalación de estas cookies, podrá navegar igualmente por toda nuestra web.
        </p>
        <p class="text-justify">En diversas secciones de nuestra web se podrán instalar cookies de terceros, en concreto las siguientes: Google, Google Analytics y Google maps.
        </p>
        <p class="text-justify"></p>

        <!--  -->

        <h2 class="subtitulo mt-5">Cookies de análisis de Google Analytics
        </h2>
        <p class="text-justify">Esta página web utiliza Google Analytics, un servicio analítico de web prestado por Google, Inc., una compañía de Delaware cuya oficina principal está en 1600 Amphitheatre Parkway, Mountain View (California), CA 94043, Estados Unidos («Google»).
        </p>
        <p class="text-justify">Google Analytics utiliza «cookies», que son archivos de texto ubicados en su ordenador, para ayudar al website a analizar el uso que hacen los usuarios del sitio web. La información que genera la cookie acerca de su uso del website (incluyendo
            su dirección IP) será directamente transmitida y archivada por Google en los servidores de Estados Unidos. Google usará esta información por cuenta nuestra con el propósito de seguir la pista de su uso del website, recopilando informes
            de la actividad del website y prestando otros servicios relacionados con la actividad del website y el uso de Internet.
        </p>
        <p class="text-justify">Google podrá transmitir dicha información a terceros cuando así se lo requiera la legislación, o cuando dichos terceros procesen la información por cuenta de Google. Google no asociará su dirección IP con ningún otro dato del que disponga
            Google.
        </p>
        <p class="text-justify">Puedes rechazar el tratamiento de los datos o la información rechazando el uso de cookies mediante la selección de la configuración apropiada de tu navegador, sin embargo, debes saber que si lo haces puede ser que no puedas usar la plena
            funcionabilidad de este website.
        </p>
        <p class="text-justify">Al utilizar este website consientes el tratamiento de información acerca de ti por Google en la forma y para los fines arriba indicados.
        </p>
        <p class="text-justify">Puedes ampliar la información sobre Google Analytics haciendo clic en el siguiente enlace: https://policies.google.com/privacy?hl=es&amp;gl=es
        </p>

        <!--  -->
        <h2 class="subtitulo mt-5">Desactivar las cookies
        </h2>
        <ol> <h3 class="subtitulo">Google Chrome</h3>
            <li>(En el Menú Herramientas): Configuración Mostrar opciones avanzadas </li>
            <li>Mostrar opciones avanzadas </li>
            <li>Privacidad (Configuración de contenido)</li>
            <li>Cookies</li>
            <li>Si necesita ayuda utilice este <a href="https://support.google.com/chrome/answer/95647?hl=es
                ">enlace</a> </li>
        </ol>
        <ol><h3 class="subtitulo">Firefox</h3>
            <li>(En el Menú Herramientas): Opciones</li>
            <li>Privacidad</li>
            <li>Cookies</li>
            <li>Si necesita ayuda utilice este <a href="https://support.mozilla.org/es/kb/Borrar%20cookies
                ">enlace</a> </li>
        </ol>
        <ol><h3 class="subtitulo">Safari, iPad y iPhone</h3>
            <li>(En el Menú Herramientas): Preferencias</li>
            <li>Privacidad</li>
            <li>Si necesita ayuda utilice este <a href="https://support.apple.com/es-es/guide/safari/privacy-sfri35610/mac
                ">enlace</a> </li>
        </ol>
        <ol><h3 class="subtitulo">Opera</h3>
            <li>(En el Menú Herramientas): Configuración</li>
            <li>Opciones</li>
            <li>Avanzado</li>
            <li>Cookies</li>
            <li>Si necesita ayuda utilice este <a href="https://help.opera.com/en/latest/security-and-privacy/
                ">enlace</a> </li>
        </ol>

        <p class="subtitulo mt-5"></p>
        <p class="text-justify">Puedes eliminar y bloquear todas las cookies de este sitio, pero parte del sitio no funcionará o la calidad de la página web puede verse afectada.
        </p>
        <p class="text-justify">Si tienes cualquier duda acerca de nuestra política de cookies, puedes contactar con esta página web a través de la dirección de correo electrónico Urban City@gmail.com
        </p>
    </div>

</div>	

</div>


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