--
-- PostgreSQL database dump
--

-- Dumped from database version 9.6.15
-- Dumped by pg_dump version 12.6

-- Started on 2021-06-10 20:59:05

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

--
-- TOC entry 6 (class 2615 OID 81127)
-- Name: urbancity; Type: SCHEMA; Schema: -; Owner: a20-mgarde
--

CREATE SCHEMA urbancity;


ALTER SCHEMA urbancity OWNER TO "a20-mgarde";

--
-- TOC entry 229 (class 1255 OID 86157)
-- Name: datosclientesesion(character varying, character varying); Type: FUNCTION; Schema: urbancity; Owner: a20-mgarde
--

CREATE FUNCTION urbancity.datosclientesesion(busquedaemail character varying, busquedacontrasena character varying) RETURNS TABLE(idcliente integer, nombre character varying, apellido character varying, email character varying, contrasena character varying, estado character varying)
    LANGUAGE sql
    AS $$
SELECT
*
FROM
	urbancity.cliente
				WHERE email = busquedaEmail AND contrasena = BusquedaContrasena;
$$;


ALTER FUNCTION urbancity.datosclientesesion(busquedaemail character varying, busquedacontrasena character varying) OWNER TO "a20-mgarde";

--
-- TOC entry 231 (class 1255 OID 86367)
-- Name: datosproductobusqueda(character varying); Type: FUNCTION; Schema: urbancity; Owner: a20-mgarde
--

CREATE FUNCTION urbancity.datosproductobusqueda(busquedareferencia character varying) RETURNS TABLE(idreferencia character varying, nombre character varying, talla character varying, descripcion character varying, precio numeric, img bytea, idsubcategoria integer, nombresubcategoria character varying, idcategoria integer, nombrecategoria character varying)
    LANGUAGE sql
    AS $$
SELECT
	idreferencia,
	producto.nombre,
talla,
descripcion,
	precio,
	img,
	producto.idsubcategoria,
		subcategoria.nombre,
			categoria.idcategoria, 
			categoria.nombre
FROM
	urbancity.producto
INNER JOIN urbancity.subcategoria 
    ON subcategoria.idsubcategoria = producto.idsubcategoria
		INNER JOIN urbancity.categoria
			ON categoria.idcategoria = subcategoria.idcategoria
				WHERE idreferencia = busquedaReferencia;
$$;


ALTER FUNCTION urbancity.datosproductobusqueda(busquedareferencia character varying) OWNER TO "a20-mgarde";

--
-- TOC entry 232 (class 1255 OID 86368)
-- Name: datosproductoscompleto(); Type: FUNCTION; Schema: urbancity; Owner: a20-mgarde
--

CREATE FUNCTION urbancity.datosproductoscompleto() RETURNS TABLE(idreferencia character varying, nombre character varying, talla character varying, descripcion character varying, precio numeric, idsubcategoria integer, nombresubcategoria character varying, idcategoria integer, nombrecategoria character varying)
    LANGUAGE sql
    AS $$
SELECT
	idreferencia,
	producto.nombre,
	talla,
	descripcion,
	precio,
	producto.idsubcategoria,
		subcategoria.nombre,
			categoria.idcategoria, 
			categoria.nombre
FROM
	urbancity.producto
INNER JOIN urbancity.subcategoria 
    ON subcategoria.idsubcategoria = producto.idsubcategoria
		INNER JOIN urbancity.categoria
			ON categoria.idcategoria = subcategoria.idcategoria
$$;


ALTER FUNCTION urbancity.datosproductoscompleto() OWNER TO "a20-mgarde";

--
-- TOC entry 233 (class 1255 OID 86369)
-- Name: datosproductoscompletobusqueda(integer); Type: FUNCTION; Schema: urbancity; Owner: a20-mgarde
--

CREATE FUNCTION urbancity.datosproductoscompletobusqueda(busquedacategoria integer) RETURNS TABLE(idreferencia character varying, nombre character varying, talla character varying, descripcion character varying, precio numeric, img bytea, idsubcategoria integer, nombresubcategoria character varying, idcategoria integer, nombrecategoria character varying)
    LANGUAGE sql
    AS $$
SELECT
	idreferencia,
	producto.nombre,
	talla,
	descripcion,
	precio,
	img,
	producto.idsubcategoria,
		subcategoria.nombre,
			categoria.idcategoria, 
			categoria.nombre
FROM
	urbancity.producto
INNER JOIN urbancity.subcategoria 
    ON subcategoria.idsubcategoria = producto.idsubcategoria
		INNER JOIN urbancity.categoria
			ON categoria.idcategoria = subcategoria.idcategoria
				WHERE categoria.idcategoria = busquedaCategoria;
$$;


ALTER FUNCTION urbancity.datosproductoscompletobusqueda(busquedacategoria integer) OWNER TO "a20-mgarde";

--
-- TOC entry 234 (class 1255 OID 86370)
-- Name: datosproductosubcategoria(integer); Type: FUNCTION; Schema: urbancity; Owner: a20-mgarde
--

CREATE FUNCTION urbancity.datosproductosubcategoria(busquedasubcategoria integer) RETURNS TABLE(idreferencia character varying, nombre character varying, talla character varying, descripcion character varying, precio numeric, img bytea, idsubcategoria integer, nombresubcategoria character varying, idcategoria integer, nombrecategoria character varying)
    LANGUAGE sql
    AS $$
SELECT
	idreferencia,
	producto.nombre,
	talla,
	descripcion,
	precio,
	img,
	producto.idsubcategoria,
		subcategoria.nombre,
			categoria.idcategoria, 
			categoria.nombre
FROM
	urbancity.producto
INNER JOIN urbancity.subcategoria 
    ON subcategoria.idsubcategoria = producto.idsubcategoria
		INNER JOIN urbancity.categoria
			ON categoria.idcategoria = subcategoria.idcategoria
				WHERE subcategoria.idsubcategoria = busquedaSubcategoria;
$$;


ALTER FUNCTION urbancity.datosproductosubcategoria(busquedasubcategoria integer) OWNER TO "a20-mgarde";

--
-- TOC entry 230 (class 1255 OID 86162)
-- Name: nombreProducto(); Type: FUNCTION; Schema: urbancity; Owner: a20-mgarde
--

CREATE FUNCTION urbancity."nombreProducto"() RETURNS TABLE(idreferencia character varying, nombre character varying)
    LANGUAGE sql
    AS $$
SELECT idreferencia, nombre 
  FROM urbancity.producto;
$$;


ALTER FUNCTION urbancity."nombreProducto"() OWNER TO "a20-mgarde";

SET default_tablespace = '';

--
-- TOC entry 208 (class 1259 OID 81212)
-- Name: carrito; Type: TABLE; Schema: urbancity; Owner: a20-mgarde
--

CREATE TABLE urbancity.carrito (
    idcarrito integer NOT NULL,
    idreferencia character varying(9) NOT NULL,
    idcliente integer NOT NULL
);


ALTER TABLE urbancity.carrito OWNER TO "a20-mgarde";

--
-- TOC entry 207 (class 1259 OID 81210)
-- Name: carrito_idcarrito_seq; Type: SEQUENCE; Schema: urbancity; Owner: a20-mgarde
--

CREATE SEQUENCE urbancity.carrito_idcarrito_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE urbancity.carrito_idcarrito_seq OWNER TO "a20-mgarde";

--
-- TOC entry 2259 (class 0 OID 0)
-- Dependencies: 207
-- Name: carrito_idcarrito_seq; Type: SEQUENCE OWNED BY; Schema: urbancity; Owner: a20-mgarde
--

ALTER SEQUENCE urbancity.carrito_idcarrito_seq OWNED BY urbancity.carrito.idcarrito;


--
-- TOC entry 200 (class 1259 OID 81138)
-- Name: categoria; Type: TABLE; Schema: urbancity; Owner: a20-mgarde
--

CREATE TABLE urbancity.categoria (
    idcategoria integer NOT NULL,
    nombre character varying(40) NOT NULL
);


ALTER TABLE urbancity.categoria OWNER TO "a20-mgarde";

--
-- TOC entry 199 (class 1259 OID 81136)
-- Name: categoria_idcategoria_seq; Type: SEQUENCE; Schema: urbancity; Owner: a20-mgarde
--

CREATE SEQUENCE urbancity.categoria_idcategoria_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE urbancity.categoria_idcategoria_seq OWNER TO "a20-mgarde";

--
-- TOC entry 2260 (class 0 OID 0)
-- Dependencies: 199
-- Name: categoria_idcategoria_seq; Type: SEQUENCE OWNED BY; Schema: urbancity; Owner: a20-mgarde
--

ALTER SEQUENCE urbancity.categoria_idcategoria_seq OWNED BY urbancity.categoria.idcategoria;


--
-- TOC entry 198 (class 1259 OID 81130)
-- Name: cliente; Type: TABLE; Schema: urbancity; Owner: a20-mgarde
--

CREATE TABLE urbancity.cliente (
    idcliente integer NOT NULL,
    nombre character varying(40) NOT NULL,
    apellido character varying(40) NOT NULL,
    email character varying(40) NOT NULL,
    contrasena character varying(24) NOT NULL,
    estado character varying(20)
);


ALTER TABLE urbancity.cliente OWNER TO "a20-mgarde";

--
-- TOC entry 197 (class 1259 OID 81128)
-- Name: cliente_idcliente_seq; Type: SEQUENCE; Schema: urbancity; Owner: a20-mgarde
--

CREATE SEQUENCE urbancity.cliente_idcliente_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE urbancity.cliente_idcliente_seq OWNER TO "a20-mgarde";

--
-- TOC entry 2261 (class 0 OID 0)
-- Dependencies: 197
-- Name: cliente_idcliente_seq; Type: SEQUENCE OWNED BY; Schema: urbancity; Owner: a20-mgarde
--

ALTER SEQUENCE urbancity.cliente_idcliente_seq OWNED BY urbancity.cliente.idcliente;


--
-- TOC entry 210 (class 1259 OID 81230)
-- Name: guiatalla; Type: TABLE; Schema: urbancity; Owner: a20-mgarde
--

CREATE TABLE urbancity.guiatalla (
    idguia integer NOT NULL,
    talla character varying(2) NOT NULL,
    pecho character varying(7),
    cintura character varying(7),
    cadera character varying(7)
);


ALTER TABLE urbancity.guiatalla OWNER TO "a20-mgarde";

--
-- TOC entry 209 (class 1259 OID 81228)
-- Name: guiatalla_idguia_seq; Type: SEQUENCE; Schema: urbancity; Owner: a20-mgarde
--

CREATE SEQUENCE urbancity.guiatalla_idguia_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE urbancity.guiatalla_idguia_seq OWNER TO "a20-mgarde";

--
-- TOC entry 2262 (class 0 OID 0)
-- Dependencies: 209
-- Name: guiatalla_idguia_seq; Type: SEQUENCE OWNED BY; Schema: urbancity; Owner: a20-mgarde
--

ALTER SEQUENCE urbancity.guiatalla_idguia_seq OWNED BY urbancity.guiatalla.idguia;


--
-- TOC entry 204 (class 1259 OID 81168)
-- Name: pedido; Type: TABLE; Schema: urbancity; Owner: a20-mgarde
--

CREATE TABLE urbancity.pedido (
    idpedido integer NOT NULL,
    idcliente integer NOT NULL,
    fecha date NOT NULL,
    nombre character varying(70) NOT NULL,
    calle character varying(60) NOT NULL,
    provincia character varying(40) NOT NULL,
    localidad character varying(60) NOT NULL,
    cp character varying(5) NOT NULL,
    pais character varying(40) NOT NULL,
    tel character varying(12) NOT NULL
);


ALTER TABLE urbancity.pedido OWNER TO "a20-mgarde";

--
-- TOC entry 203 (class 1259 OID 81166)
-- Name: pedido_idpedido_seq; Type: SEQUENCE; Schema: urbancity; Owner: a20-mgarde
--

CREATE SEQUENCE urbancity.pedido_idpedido_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE urbancity.pedido_idpedido_seq OWNER TO "a20-mgarde";

--
-- TOC entry 2263 (class 0 OID 0)
-- Dependencies: 203
-- Name: pedido_idpedido_seq; Type: SEQUENCE OWNED BY; Schema: urbancity; Owner: a20-mgarde
--

ALTER SEQUENCE urbancity.pedido_idpedido_seq OWNED BY urbancity.pedido.idpedido;


--
-- TOC entry 206 (class 1259 OID 81193)
-- Name: pedpro; Type: TABLE; Schema: urbancity; Owner: a20-mgarde
--

CREATE TABLE urbancity.pedpro (
    idpedido integer NOT NULL,
    idreferencia character varying(9) NOT NULL
);


ALTER TABLE urbancity.pedpro OWNER TO "a20-mgarde";

--
-- TOC entry 205 (class 1259 OID 81179)
-- Name: producto; Type: TABLE; Schema: urbancity; Owner: a20-mgarde
--

CREATE TABLE urbancity.producto (
    idreferencia character varying(9) NOT NULL,
    nombre character varying(60) NOT NULL,
    descripcion text NOT NULL,
    precio numeric(6,2) NOT NULL,
    img bytea,
    idsubcategoria integer NOT NULL,
    talla character varying(2)
);


ALTER TABLE urbancity.producto OWNER TO "a20-mgarde";

--
-- TOC entry 202 (class 1259 OID 81146)
-- Name: subcategoria; Type: TABLE; Schema: urbancity; Owner: a20-mgarde
--

CREATE TABLE urbancity.subcategoria (
    idsubcategoria integer NOT NULL,
    nombre character varying(40) NOT NULL,
    idcategoria integer NOT NULL
);


ALTER TABLE urbancity.subcategoria OWNER TO "a20-mgarde";

--
-- TOC entry 201 (class 1259 OID 81144)
-- Name: subcategoria_idsubcategoria_seq; Type: SEQUENCE; Schema: urbancity; Owner: a20-mgarde
--

CREATE SEQUENCE urbancity.subcategoria_idsubcategoria_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE urbancity.subcategoria_idsubcategoria_seq OWNER TO "a20-mgarde";

--
-- TOC entry 2264 (class 0 OID 0)
-- Dependencies: 201
-- Name: subcategoria_idsubcategoria_seq; Type: SEQUENCE OWNED BY; Schema: urbancity; Owner: a20-mgarde
--

ALTER SEQUENCE urbancity.subcategoria_idsubcategoria_seq OWNED BY urbancity.subcategoria.idsubcategoria;


--
-- TOC entry 2098 (class 2604 OID 81215)
-- Name: carrito idcarrito; Type: DEFAULT; Schema: urbancity; Owner: a20-mgarde
--

ALTER TABLE ONLY urbancity.carrito ALTER COLUMN idcarrito SET DEFAULT nextval('urbancity.carrito_idcarrito_seq'::regclass);


--
-- TOC entry 2095 (class 2604 OID 81141)
-- Name: categoria idcategoria; Type: DEFAULT; Schema: urbancity; Owner: a20-mgarde
--

ALTER TABLE ONLY urbancity.categoria ALTER COLUMN idcategoria SET DEFAULT nextval('urbancity.categoria_idcategoria_seq'::regclass);


--
-- TOC entry 2094 (class 2604 OID 81133)
-- Name: cliente idcliente; Type: DEFAULT; Schema: urbancity; Owner: a20-mgarde
--

ALTER TABLE ONLY urbancity.cliente ALTER COLUMN idcliente SET DEFAULT nextval('urbancity.cliente_idcliente_seq'::regclass);


--
-- TOC entry 2099 (class 2604 OID 81233)
-- Name: guiatalla idguia; Type: DEFAULT; Schema: urbancity; Owner: a20-mgarde
--

ALTER TABLE ONLY urbancity.guiatalla ALTER COLUMN idguia SET DEFAULT nextval('urbancity.guiatalla_idguia_seq'::regclass);


--
-- TOC entry 2097 (class 2604 OID 81171)
-- Name: pedido idpedido; Type: DEFAULT; Schema: urbancity; Owner: a20-mgarde
--

ALTER TABLE ONLY urbancity.pedido ALTER COLUMN idpedido SET DEFAULT nextval('urbancity.pedido_idpedido_seq'::regclass);


--
-- TOC entry 2096 (class 2604 OID 81149)
-- Name: subcategoria idsubcategoria; Type: DEFAULT; Schema: urbancity; Owner: a20-mgarde
--

ALTER TABLE ONLY urbancity.subcategoria ALTER COLUMN idsubcategoria SET DEFAULT nextval('urbancity.subcategoria_idsubcategoria_seq'::regclass);


--
-- TOC entry 2251 (class 0 OID 81212)
-- Dependencies: 208
-- Data for Name: carrito; Type: TABLE DATA; Schema: urbancity; Owner: a20-mgarde
--

COPY urbancity.carrito (idcarrito, idreferencia, idcliente) FROM stdin;
\.


--
-- TOC entry 2243 (class 0 OID 81138)
-- Dependencies: 200
-- Data for Name: categoria; Type: TABLE DATA; Schema: urbancity; Owner: a20-mgarde
--

COPY urbancity.categoria (idcategoria, nombre) FROM stdin;
1	Sudaderas
2	Camisetas
3	Jeans
4	Pantalones
5	Camisas
6	Abrigos
7	Bañadores
10	Vestidos
11	Monos
12	Tops
13	Bodies
14	Shorts
15	Faldas
\.


--
-- TOC entry 2241 (class 0 OID 81130)
-- Dependencies: 198
-- Data for Name: cliente; Type: TABLE DATA; Schema: urbancity; Owner: a20-mgarde
--

COPY urbancity.cliente (idcliente, nombre, apellido, email, contrasena, estado) FROM stdin;
2	Manuel	García	trash.mgarcan@gmail.com	1234	No Operativo
1	Manuel	García	a20garcanm8852@ies-mardecadiz.com	1234	Administrador
3	Manuel Jesús	García	mgarquican@gmail.com	1234	Operativo
4	Pepe	Juan	pepejuan@gmai.com	1234	Operativo
\.


--
-- TOC entry 2253 (class 0 OID 81230)
-- Dependencies: 210
-- Data for Name: guiatalla; Type: TABLE DATA; Schema: urbancity; Owner: a20-mgarde
--

COPY urbancity.guiatalla (idguia, talla, pecho, cintura, cadera) FROM stdin;
1	xs	70-78	50-58	80-88
2	s	78-86	58-66	88-96
3	m	86-94	66-74	96-104
4	l	94-102	74-82	104-112
5	xl	102-110	82-90	112-120
\.


--
-- TOC entry 2247 (class 0 OID 81168)
-- Dependencies: 204
-- Data for Name: pedido; Type: TABLE DATA; Schema: urbancity; Owner: a20-mgarde
--

COPY urbancity.pedido (idpedido, idcliente, fecha, nombre, calle, provincia, localidad, cp, pais, tel) FROM stdin;
1	3	2021-06-09	Manuel	Paseo	Rota	Rota	11520	España	608444333
2	3	2021-06-10	Manuel	Paseo	Cadiz	Rota	11520	España	666666666
3	4	2021-06-10	Juan	Calle	Provincia	Localidad	15520	Pais	608444333
\.


--
-- TOC entry 2249 (class 0 OID 81193)
-- Dependencies: 206
-- Data for Name: pedpro; Type: TABLE DATA; Schema: urbancity; Owner: a20-mgarde
--

COPY urbancity.pedpro (idpedido, idreferencia) FROM stdin;
1	1-1-00000
1	1-3-00011
2	1-1-00000
3	1-1-00000
3	1-3-00011
\.


--
-- TOC entry 2248 (class 0 OID 81179)
-- Dependencies: 205
-- Data for Name: producto; Type: TABLE DATA; Schema: urbancity; Owner: a20-mgarde
--

COPY urbancity.producto (idreferencia, nombre, descripcion, precio, img, idsubcategoria, talla) FROM stdin;
1-1-00000	Sudadera capucha básica color	Sudadera básica con capucha, cuello redondo, de manga larga y disponible en varios colores lisos.	19.99	\N	1	s
1-1-00001	Sudadera básica capucha parche engomado	Sudadera básica comfort fit disponible en varios tonos, con capucha ajustable, cordón interior reflectante, bolsillo delantero tipo canguro, bolsillo interior en tejido mesh y detalle de parche engomado con logo.\n\nJoin Life\nAlgodón cultivado utilizando fertilizantes y pesticidas naturales. Además, en su cultivo no se utilizan semillas modificadas genéticamente, lo que ayuda a conservar la biodiversidad de las semillas y la fertilidad del suelo.	17.99	\N	1	xs
1-3-00011	Camiseta básica heavy weight	Camiseta básica de manga corta en tejido heavy weight, con detalle de logo bordado en el bajo, cuello redondo y confeccionadas en algodón.\nJoin Life\nAlgodón cultivado utilizando fertilizantes y pesticidas naturales. Además, en su cultivo no se utilizan semillas modificadas genéticamente, lo que ayuda a conservar la biodiversidad de las semillas y la fertilidad del suelo	9.99	\N	3	m
1-4-00012	Camiseta The Notorious Big	Camiseta de color negro con print fotográfico de The Notorious Big y texto en contraste, de manga corta, con cuello redondo y confeccionada en algodón.	15.99	\N	4	m
1-4-00013	Camiseta oversize tejido premium	Camiseta oversize en tejido premium, de manga corta, con cuello redondo y confeccionada en algodón.	12.99	\N	4	m
1-4-00014	Camiseta oversize negra print STWD	Camiseta oversize de color negro con print neón STWD en contraste, de manga corta, con cuello redondo y confeccionada en algodón.	9.99	\N	4	m
1-4-00015	Camiseta negra oversize ilustración manga	Camiseta oversize de la colección streetwear, en color negro, con ilustración de inspiración manga en contraste, de manga corta y confeccionada en algodón.	12.99	\N	4	l
1-5-00016	Camiseta negra fotografía edificio	Camiseta de color negro con fotografía de edificio en contraste, de manga corta, con cuello redondo y confeccionada en algodón.	9.99	\N	5	l
1-5-00017	Camiseta Tupac negra	Camiseta de color negro con fotografía de Tupac en contraste, de manga corta, con cuello redondo y confeccionada en algodón.	15.99	\N	5	l
1-5-00018	Camiseta negra Botticelli	Camiseta de color negro con obra de Botticelli en contraste, de manga corta, con cuello redondo y confeccionada en mezcla de algodón.	15.99	\N	5	l
1-5-00019	Camiseta Volkswagen Corrado rojo	Camiseta con ilustración de Volkswagen Corrado rojo, de manga corta, con cuello redondo y confeccionada en algodón.	15.99	\N	5	l
1-6-00020	Polo print rayas verticales	Polo disponible en varios tonos con print de rayas verticales en contraste, de manga corta, con cuello clásico y confeccionado en 100% algodón.	15.99	\N	6	l
1-7-00021	Jeans tapered comfort fit	Jeans tapered comfort fit con diseño de cinco bolsillos, cintura con trabilla, cierre de cremallera y botón y en algodón ligeramente elástico.	29.99	\N	7	l
1-7-00022	Jeans regular fit negro delavado	Jeans regular fit en color negro delavado, con diseño de cinco bolsillos, cintura con trabillas, cierre de botón y cremallera y confeccionados en algodón ligeramente elástico.	19.99	\N	7	l
1-1-00002	Sudadera básica regular fit	Sudadera básica de corte regular fit, con tejido doble en contraste, detalle de logo engomado en la manga larga, cordón reflectante en el interior, cuello redondo y bolsillo oculto en el lateral.	15.99	\N	1	s
1-1-00003	Sudadera cuello redondo detalle bordado	Sudara básica disponible en varios tonos, con detalle bordado, cuello redondo y confeccionada en algodón.	17.99	\N	1	s
1-2-00004	Sudadera negra ilustración Tupac	Sudadera de color negro con ilustración "California Love" de Tupac, de manga larga, con capucha y confeccionada en mezcla de algodón.	23.99	\N	2	s
1-2-00005	Sudadera STWD tie-dye	Sudadera en varios tonos con estampado tie-dye en contraste, de manga larga, con capucha, bolsillo delantero tipo canguro y confeccionada en mezcla de algodón.	19.99	\N	2	s
1-2-00006	Sudadera Reinitiate comfort fit	Sudadera comfort fit de la colección Streetwear, con texto "Reinitiate" en la manga, con capucha, bolsillo en la parte delantera y confeccionada en algodón.	25.99	\N	2	s
1-2-00007	Sudadera negra print fotografía	Sudadera negra con print de fotografía en el pecho, capucha con cordón, detalle de rib en bajos y de manga larga.	20.79	\N	2	xl
1-3-00008	Camiseta loose básica manga corta	Camiseta loose básica de manga corta con cuello redondo y disponible en varios colores lisos.	9.99	\N	3	s
1-3-00009	Camiseta oversize tejido premium	Camiseta oversize en tejido premium, de manga corta, con cuello redondo y confeccionada en algodón.	12.99	\N	3	s
1-3-00010	Camiseta muscle fit estructura	MUSCLE FIT. Camiseta de manga corta, con cuello redondo, disponible en varios colores lisos y confeccionada en 100% algodón.\nJoin Life\nEl uso de ciclos cerrados que permiten reutilizar el agua o de tecnologías como las máquinas de baja relación de baño o el tintado en masa nos ayudan a reducir el consumo de agua en los procesos de tintado o lavado de las prendas.	7.99	\N	3	m
1-7-00023	Jeans regular comfort fit grises	Jeans regular comfort fit de color gris, con diseño de cinco bolsillos, cintura con trabillas, cierre de botón y cremallera y confeccionados en algodón ligeramente elástico.	19.99	\N	7	l
1-7-00024	Jeans regular comfort azul oscuro	Jeans regular comfort fit en azul oscuro con diseño de cinco bolsillos, cintura con trabilla, y cierre de cremallera y botón.	19.99	\N	7	l
1-8-00025	Jeans skinny fit premium rotos	Jeans de corte skinny en tejido premium, con detalle de rotos en la pernera, diseño de cinco bolsillos, cintura con trabillas, cierre de botón y cremallera y confeccionados en algodón ligeramente elástico.	29.99	\N	8	xs
1-8-00026	Jeans skinny fit tejido premium rotos	Jeans skinny fit en tejido premium con detalle de rotos en la pernera, diseño de cinco bolsillos, cintura con trabillas, cierre de botón y cremallera y confeccionados en algodón ligeramente elástico.	29.99	\N	8	xs
1-8-00027	Jeans skinny fit rotos	Jeans skinny fit con diseño de rotos, cinco bolsillos, cintura con trabilla, y cierre de cremallera y botón.	15.99	\N	8	xl
1-8-00028	Jeans skinny fit básicos rotos - Contiene algodón reciclado\n	Jeans skinny fit básicos disponibles en varios lavados, con detalle de rotos en la pernera, diseño de cinco bolsillos, cintura con trabillas, cierre de botón y cremallera y confeccionados en algodón ligeramente elástico.	25.99	\N	8	xl
\.


--
-- TOC entry 2245 (class 0 OID 81146)
-- Dependencies: 202
-- Data for Name: subcategoria; Type: TABLE DATA; Schema: urbancity; Owner: a20-mgarde
--

COPY urbancity.subcategoria (idsubcategoria, nombre, idcategoria) FROM stdin;
1	Básicas	1
2	Hoodies	1
3	Básicas	2
4	Oversize	2
5	Estampadas	2
6	Polos	2
7	Regular Fit	3
8	Skinny Fit	3
9	Rotos	3
10	Slim Fit	3
11	Joggers	4
12	Chinos	4
13	Cargo	4
14	Básicas	5
15	Estampadas	5
16	Manga Corta	5
17	Canguro	6
18	Bombers	6
19	Denim	6
21	Mini	10
22	Midi	10
23	Estampados	10
24	Monos	10
25	Básicos	11
26	Básicos	12
27	Crop Tops	12
28	Básicos	13
29	Estampados	13
30	Denim	14
31	Jogging	14
32	Mini	15
33	Denim	15
34	Oversize	1
35	Estampadas	1
36	Crop	2
37	Push Up	3
38	Wide Leg	3
39	Culotte	4
40	Campana	4
41	Leggins	4
42	Cazadoras	6
43	Sobrecamisas	6
44	Blazers	6
45	Bikinis	7
46	Bañadores	7
\.


--
-- TOC entry 2265 (class 0 OID 0)
-- Dependencies: 207
-- Name: carrito_idcarrito_seq; Type: SEQUENCE SET; Schema: urbancity; Owner: a20-mgarde
--

SELECT pg_catalog.setval('urbancity.carrito_idcarrito_seq', 12, true);


--
-- TOC entry 2266 (class 0 OID 0)
-- Dependencies: 199
-- Name: categoria_idcategoria_seq; Type: SEQUENCE SET; Schema: urbancity; Owner: a20-mgarde
--

SELECT pg_catalog.setval('urbancity.categoria_idcategoria_seq', 15, true);


--
-- TOC entry 2267 (class 0 OID 0)
-- Dependencies: 197
-- Name: cliente_idcliente_seq; Type: SEQUENCE SET; Schema: urbancity; Owner: a20-mgarde
--

SELECT pg_catalog.setval('urbancity.cliente_idcliente_seq', 2, true);


--
-- TOC entry 2268 (class 0 OID 0)
-- Dependencies: 209
-- Name: guiatalla_idguia_seq; Type: SEQUENCE SET; Schema: urbancity; Owner: a20-mgarde
--

SELECT pg_catalog.setval('urbancity.guiatalla_idguia_seq', 5, true);


--
-- TOC entry 2269 (class 0 OID 0)
-- Dependencies: 203
-- Name: pedido_idpedido_seq; Type: SEQUENCE SET; Schema: urbancity; Owner: a20-mgarde
--

SELECT pg_catalog.setval('urbancity.pedido_idpedido_seq', 1, false);


--
-- TOC entry 2270 (class 0 OID 0)
-- Dependencies: 201
-- Name: subcategoria_idsubcategoria_seq; Type: SEQUENCE SET; Schema: urbancity; Owner: a20-mgarde
--

SELECT pg_catalog.setval('urbancity.subcategoria_idsubcategoria_seq', 46, true);


--
-- TOC entry 2113 (class 2606 OID 81217)
-- Name: carrito FK_IDCARRITO_CARRITO; Type: CONSTRAINT; Schema: urbancity; Owner: a20-mgarde
--

ALTER TABLE ONLY urbancity.carrito
    ADD CONSTRAINT "FK_IDCARRITO_CARRITO" PRIMARY KEY (idcarrito);


--
-- TOC entry 2101 (class 2606 OID 81135)
-- Name: cliente PK_CLIENTE_IDCLIENTE; Type: CONSTRAINT; Schema: urbancity; Owner: a20-mgarde
--

ALTER TABLE ONLY urbancity.cliente
    ADD CONSTRAINT "PK_CLIENTE_IDCLIENTE" PRIMARY KEY (idcliente);


--
-- TOC entry 2103 (class 2606 OID 81143)
-- Name: categoria PK_IDCATEGORIA_CATEGORIA; Type: CONSTRAINT; Schema: urbancity; Owner: a20-mgarde
--

ALTER TABLE ONLY urbancity.categoria
    ADD CONSTRAINT "PK_IDCATEGORIA_CATEGORIA" PRIMARY KEY (idcategoria);


--
-- TOC entry 2111 (class 2606 OID 81197)
-- Name: pedpro PK_IDPEDIDO-IDREFERENCIA_PEDPRO; Type: CONSTRAINT; Schema: urbancity; Owner: a20-mgarde
--

ALTER TABLE ONLY urbancity.pedpro
    ADD CONSTRAINT "PK_IDPEDIDO-IDREFERENCIA_PEDPRO" PRIMARY KEY (idpedido, idreferencia);


--
-- TOC entry 2107 (class 2606 OID 81173)
-- Name: pedido PK_IDPEDIDO_PEDIDO; Type: CONSTRAINT; Schema: urbancity; Owner: a20-mgarde
--

ALTER TABLE ONLY urbancity.pedido
    ADD CONSTRAINT "PK_IDPEDIDO_PEDIDO" PRIMARY KEY (idpedido);


--
-- TOC entry 2109 (class 2606 OID 81186)
-- Name: producto PK_IDREFERENCIA_PRODUCTO; Type: CONSTRAINT; Schema: urbancity; Owner: a20-mgarde
--

ALTER TABLE ONLY urbancity.producto
    ADD CONSTRAINT "PK_IDREFERENCIA_PRODUCTO" PRIMARY KEY (idreferencia);


--
-- TOC entry 2105 (class 2606 OID 81151)
-- Name: subcategoria PK_IDSUBCATEGORIA_CATEGORIA; Type: CONSTRAINT; Schema: urbancity; Owner: a20-mgarde
--

ALTER TABLE ONLY urbancity.subcategoria
    ADD CONSTRAINT "PK_IDSUBCATEGORIA_CATEGORIA" PRIMARY KEY (idsubcategoria);


--
-- TOC entry 2115 (class 2606 OID 81235)
-- Name: guiatalla guiatalla_pkey; Type: CONSTRAINT; Schema: urbancity; Owner: a20-mgarde
--

ALTER TABLE ONLY urbancity.guiatalla
    ADD CONSTRAINT guiatalla_pkey PRIMARY KEY (idguia);


--
-- TOC entry 2116 (class 2606 OID 81153)
-- Name: subcategoria FK_CATEGORIA_SUBCATEGORIA; Type: FK CONSTRAINT; Schema: urbancity; Owner: a20-mgarde
--

ALTER TABLE ONLY urbancity.subcategoria
    ADD CONSTRAINT "FK_CATEGORIA_SUBCATEGORIA" FOREIGN KEY (idcategoria) REFERENCES urbancity.categoria(idcategoria) NOT VALID;


--
-- TOC entry 2122 (class 2606 OID 81223)
-- Name: carrito FK_IDCLIENTE_CLIENTE; Type: FK CONSTRAINT; Schema: urbancity; Owner: a20-mgarde
--

ALTER TABLE ONLY urbancity.carrito
    ADD CONSTRAINT "FK_IDCLIENTE_CLIENTE" FOREIGN KEY (idcliente) REFERENCES urbancity.cliente(idcliente);


--
-- TOC entry 2117 (class 2606 OID 81174)
-- Name: pedido FK_IDCLIENTE_PEDIDO; Type: FK CONSTRAINT; Schema: urbancity; Owner: a20-mgarde
--

ALTER TABLE ONLY urbancity.pedido
    ADD CONSTRAINT "FK_IDCLIENTE_PEDIDO" FOREIGN KEY (idcliente) REFERENCES urbancity.cliente(idcliente);


--
-- TOC entry 2119 (class 2606 OID 81198)
-- Name: pedpro FK_IDPEDIDO_PEDPRO; Type: FK CONSTRAINT; Schema: urbancity; Owner: a20-mgarde
--

ALTER TABLE ONLY urbancity.pedpro
    ADD CONSTRAINT "FK_IDPEDIDO_PEDPRO" FOREIGN KEY (idpedido) REFERENCES urbancity.pedido(idpedido);


--
-- TOC entry 2120 (class 2606 OID 81203)
-- Name: pedpro FK_IDREFERENCIA_PEDPRO; Type: FK CONSTRAINT; Schema: urbancity; Owner: a20-mgarde
--

ALTER TABLE ONLY urbancity.pedpro
    ADD CONSTRAINT "FK_IDREFERENCIA_PEDPRO" FOREIGN KEY (idreferencia) REFERENCES urbancity.producto(idreferencia);


--
-- TOC entry 2121 (class 2606 OID 81218)
-- Name: carrito FK_IDREFERENCIA_PRODUCTO; Type: FK CONSTRAINT; Schema: urbancity; Owner: a20-mgarde
--

ALTER TABLE ONLY urbancity.carrito
    ADD CONSTRAINT "FK_IDREFERENCIA_PRODUCTO" FOREIGN KEY (idreferencia) REFERENCES urbancity.producto(idreferencia);


--
-- TOC entry 2118 (class 2606 OID 81187)
-- Name: producto FK_IDSUBCATEGORIA_PRODUCTO; Type: FK CONSTRAINT; Schema: urbancity; Owner: a20-mgarde
--

ALTER TABLE ONLY urbancity.producto
    ADD CONSTRAINT "FK_IDSUBCATEGORIA_PRODUCTO" FOREIGN KEY (idsubcategoria) REFERENCES urbancity.subcategoria(idsubcategoria);


-- Completed on 2021-06-10 20:59:11

--
-- PostgreSQL database dump complete
--

