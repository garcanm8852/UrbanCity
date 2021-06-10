COPY urbancity.carrito (idcarrito, idreferencia, idcliente)
FROM
    stdin;

\.--
-- TOC entry 2243 (class 0 OID 81138)
-- Dependencies: 200
-- Data for Name: categoria; Type: TABLE DATA; Schema: urbancity; Owner: a20-mgarde
--
COPY urbancity.categoria (idcategoria, nombre)
FROM
    stdin;

1 Sudaderas 2 Camisetas 3 Jeans 4 Pantalones 5 Camisas 6 Abrigos 7 Bañadores 10 Vestidos 11 Monos 12 Tops 13 Bodies 14 Shorts 15 Faldas \.--
-- TOC entry 2241 (class 0 OID 81130)
-- Dependencies: 198
-- Data for Name: cliente; Type: TABLE DATA; Schema: urbancity; Owner: a20-mgarde
--
COPY urbancity.cliente (
    idcliente,
    nombre,
    apellido,
    email,
    contrasena,
    estado
)
FROM
    stdin;

2 Manuel García trash.mgarcan @gmail.com 1234 No Operativo 1 Manuel García a20garcanm8852 @ies - mardecadiz.com 1234 Administrador 3 Manuel Jesús García mgarquican @gmail.com 1234 Operativo 4 Pepe Juan pepejuan @gmai.com 1234 Operativo \.--
-- TOC entry 2253 (class 0 OID 81230)
-- Dependencies: 210
-- Data for Name: guiatalla; Type: TABLE DATA; Schema: urbancity; Owner: a20-mgarde
--
COPY urbancity.guiatalla (idguia, talla, pecho, cintura, cadera)
FROM
    stdin;

1 xs 70 -78 50 -58 80 -88 2 s 78 -86 58 -66 88 -96 3 m 86 -94 66 -74 96 -104 4 l 94 -102 74 -82 104 -112 5 xl 102 -110 82 -90 112 -120 \.--
-- TOC entry 2247 (class 0 OID 81168)
-- Dependencies: 204
-- Data for Name: pedido; Type: TABLE DATA; Schema: urbancity; Owner: a20-mgarde
--
COPY urbancity.pedido (
    idpedido,
    idcliente,
    fecha,
    nombre,
    calle,
    provincia,
    localidad,
    cp,
    pais,
    tel
)
FROM
    stdin;

1 3 2021 -06 -09 Manuel Paseo Rota Rota 11520 España 608444333 2 3 2021 -06 -10 Manuel Paseo Cadiz Rota 11520 España 666666666 3 4 2021 -06 -10 Juan Calle Provincia Localidad 15520 Pais 608444333 \.--
-- TOC entry 2249 (class 0 OID 81193)
-- Dependencies: 206
-- Data for Name: pedpro; Type: TABLE DATA; Schema: urbancity; Owner: a20-mgarde
--
COPY urbancity.pedpro (idpedido, idreferencia)
FROM
    stdin;

1 1 -1 -00000 1 1 -3 -00011 2 1 -1 -00000 3 1 -1 -00000 3 1 -3 -00011 \.--
-- TOC entry 2248 (class 0 OID 81179)
-- Dependencies: 205
-- Data for Name: producto; Type: TABLE DATA; Schema: urbancity; Owner: a20-mgarde
--
COPY urbancity.producto (
    idreferencia,
    nombre,
    descripcion,
    precio,
    img,
    idsubcategoria,
    talla
)
FROM
    stdin;

1 -1 -00000 Sudadera capucha básica color Sudadera básica con capucha,
cuello redondo,
de manga larga y disponible en varios colores lisos.19.99 \ N 1 s 1 -1 -00001 Sudadera básica capucha parche engomado Sudadera básica comfort fit disponible en varios tonos,
con capucha ajustable,
cordón interior reflectante,
bolsillo delantero tipo canguro,
bolsillo interior en tejido mesh y detalle de parche engomado con logo.\ n \ nJoin Life \ nAlgodón cultivado utilizando fertilizantes y pesticidas naturales.Además,
en su cultivo no se utilizan semillas modificadas genéticamente,
lo que ayuda a conservar la biodiversidad de las semillas y la fertilidad del suelo.17.99 \ N 1 xs 1 -3 -00011 Camiseta básica heavy weight Camiseta básica de manga corta en tejido heavy weight,
con detalle de logo bordado en el bajo,
cuello redondo y confeccionadas en algodón.\ nJoin Life \ nAlgodón cultivado utilizando fertilizantes y pesticidas naturales.Además,
en su cultivo no se utilizan semillas modificadas genéticamente,
lo que ayuda a conservar la biodiversidad de las semillas y la fertilidad del suelo 9.99 \ N 3 m 1 -4 -00012 Camiseta The Notorious Big Camiseta de color negro con print fotográfico de The Notorious Big y texto en contraste,
de manga corta,
con cuello redondo y confeccionada en algodón.15.99 \ N 4 m 1 -4 -00013 Camiseta oversize tejido premium Camiseta oversize en tejido premium,
de manga corta,
con cuello redondo y confeccionada en algodón.12.99 \ N 4 m 1 -4 -00014 Camiseta oversize negra print STWD Camiseta oversize de color negro con print neón STWD en contraste,
de manga corta,
con cuello redondo y confeccionada en algodón.9.99 \ N 4 m 1 -4 -00015 Camiseta negra oversize ilustración manga Camiseta oversize de la colección streetwear,
en color negro,
con ilustración de inspiración manga en contraste,
de manga corta y confeccionada en algodón.12.99 \ N 4 l 1 -5 -00016 Camiseta negra fotografía edificio Camiseta de color negro con fotografía de edificio en contraste,
de manga corta,
con cuello redondo y confeccionada en algodón.9.99 \ N 5 l 1 -5 -00017 Camiseta Tupac negra Camiseta de color negro con fotografía de Tupac en contraste,
de manga corta,
con cuello redondo y confeccionada en algodón.15.99 \ N 5 l 1 -5 -00018 Camiseta negra Botticelli Camiseta de color negro con obra de Botticelli en contraste,
de manga corta,
con cuello redondo y confeccionada en mezcla de algodón.15.99 \ N 5 l 1 -5 -00019 Camiseta Volkswagen Corrado rojo Camiseta con ilustración de Volkswagen Corrado rojo,
de manga corta,
con cuello redondo y confeccionada en algodón.15.99 \ N 5 l 1 -6 -00020 Polo print rayas verticales Polo disponible en varios tonos con print de rayas verticales en contraste,
de manga corta,
con cuello clásico y confeccionado en 100 % algodón.15.99 \ N 6 l 1 -7 -00021 Jeans tapered comfort fit Jeans tapered comfort fit con diseño de cinco bolsillos,
cintura con trabilla,
cierre de cremallera y botón y en algodón ligeramente elástico.29.99 \ N 7 l 1 -7 -00022 Jeans regular fit negro delavado Jeans regular fit en color negro delavado,
con diseño de cinco bolsillos,
cintura con trabillas,
cierre de botón y cremallera y confeccionados en algodón ligeramente elástico.19.99 \ N 7 l 1 -1 -00002 Sudadera básica regular fit Sudadera básica de corte regular fit,
con tejido doble en contraste,
detalle de logo engomado en la manga larga,
cordón reflectante en el interior,
cuello redondo y bolsillo oculto en el lateral.15.99 \ N 1 s 1 -1 -00003 Sudadera cuello redondo detalle bordado Sudara básica disponible en varios tonos,
con detalle bordado,
cuello redondo y confeccionada en algodón.17.99 \ N 1 s 1 -2 -00004 Sudadera negra ilustración Tupac Sudadera de color negro con ilustración "California Love" de Tupac,
de manga larga,
con capucha y confeccionada en mezcla de algodón.23.99 \ N 2 s 1 -2 -00005 Sudadera STWD tie - dye Sudadera en varios tonos con estampado tie - dye en contraste,
de manga larga,
con capucha,
bolsillo delantero tipo canguro y confeccionada en mezcla de algodón.19.99 \ N 2 s 1 -2 -00006 Sudadera Reinitiate comfort fit Sudadera comfort fit de la colección Streetwear,
con texto "Reinitiate" en la manga,
con capucha,
bolsillo en la parte delantera y confeccionada en algodón.25.99 \ N 2 s 1 -2 -00007 Sudadera negra print fotografía Sudadera negra con print de fotografía en el pecho,
capucha con cordón,
detalle de rib en bajos y de manga larga.20.79 \ N 2 xl 1 -3 -00008 Camiseta loose básica manga corta Camiseta loose básica de manga corta con cuello redondo y disponible en varios colores lisos.9.99 \ N 3 s 1 -3 -00009 Camiseta oversize tejido premium Camiseta oversize en tejido premium,
de manga corta,
con cuello redondo y confeccionada en algodón.12.99 \ N 3 s 1 -3 -00010 Camiseta muscle fit estructura MUSCLE FIT.Camiseta de manga corta,
con cuello redondo,
disponible en varios colores lisos y confeccionada en 100 % algodón.\ nJoin Life \ nEl uso de ciclos cerrados que permiten reutilizar el agua o de tecnologías como las máquinas de baja relación de baño o el tintado en masa nos ayudan a reducir el consumo de agua en los procesos de tintado o lavado de las prendas.7.99 \ N 3 m 1 -7 -00023 Jeans regular comfort fit grises Jeans regular comfort fit de color gris,
con diseño de cinco bolsillos,
cintura con trabillas,
cierre de botón y cremallera y confeccionados en algodón ligeramente elástico.19.99 \ N 7 l 1 -7 -00024 Jeans regular comfort azul oscuro Jeans regular comfort fit en azul oscuro con diseño de cinco bolsillos,
cintura con trabilla,
y cierre de cremallera y botón.19.99 \ N 7 l 1 -8 -00025 Jeans skinny fit premium rotos Jeans de corte skinny en tejido premium,
con detalle de rotos en la pernera,
diseño de cinco bolsillos,
cintura con trabillas,
cierre de botón y cremallera y confeccionados en algodón ligeramente elástico.29.99 \ N 8 xs 1 -8 -00026 Jeans skinny fit tejido premium rotos Jeans skinny fit en tejido premium con detalle de rotos en la pernera,
diseño de cinco bolsillos,
cintura con trabillas,
cierre de botón y cremallera y confeccionados en algodón ligeramente elástico.29.99 \ N 8 xs 1 -8 -00027 Jeans skinny fit rotos Jeans skinny fit con diseño de rotos,
cinco bolsillos,
cintura con trabilla,
y cierre de cremallera y botón.15.99 \ N 8 xl 1 -8 -00028 Jeans skinny fit básicos rotos - Contiene algodón reciclado \ n Jeans skinny fit básicos disponibles en varios lavados,
con detalle de rotos en la pernera,
diseño de cinco bolsillos,
cintura con trabillas,
cierre de botón y cremallera y confeccionados en algodón ligeramente elástico.25.99 \ N 8 xl \.--
-- TOC entry 2245 (class 0 OID 81146)
-- Dependencies: 202
-- Data for Name: subcategoria; Type: TABLE DATA; Schema: urbancity; Owner: a20-mgarde
--
COPY urbancity.subcategoria (idsubcategoria, nombre, idcategoria)
FROM
    stdin;

1 Básicas 1 2 Hoodies 1 3 Básicas 2 4 Oversize 2 5 Estampadas 2 6 Polos 2 7 Regular Fit 3 8 Skinny Fit 3 9 Rotos 3 10 Slim Fit 3 11 Joggers 4 12 Chinos 4 13 Cargo 4 14 Básicas 5 15 Estampadas 5 16 Manga Corta 5 17 Canguro 6 18 Bombers 6 19 Denim 6 21 Mini 10 22 Midi 10 23 Estampados 10 24 Monos 10 25 Básicos 11 26 Básicos 12 27 Crop Tops 12 28 Básicos 13 29 Estampados 13 30 Denim 14 31 Jogging 14 32 Mini 15 33 Denim 15 34 Oversize 1 35 Estampadas 1 36 Crop 2 37 Push Up 3 38 Wide Leg 3 39 Culotte 4 40 Campana 4 41 Leggins 4 42 Cazadoras 6 43 Sobrecamisas 6 44 Blazers 6 45 Bikinis 7 46 Bañadores 7 \.--
-- TOC entry 2265 (class 0 OID 0)
-- Dependencies: 207
-- Name: carrito_idcarrito_seq; Type: SEQUENCE SET; Schema: urbancity; Owner: a20-mgarde
--
SELECT
    pg_catalog.setval('urbancity.carrito_idcarrito_seq', 12, true);

--
-- TOC entry 2266 (class 0 OID 0)
-- Dependencies: 199
-- Name: categoria_idcategoria_seq; Type: SEQUENCE SET; Schema: urbancity; Owner: a20-mgarde
--
SELECT
    pg_catalog.setval('urbancity.categoria_idcategoria_seq', 15, true);

--
-- TOC entry 2267 (class 0 OID 0)
-- Dependencies: 197
-- Name: cliente_idcliente_seq; Type: SEQUENCE SET; Schema: urbancity; Owner: a20-mgarde
--
SELECT
    pg_catalog.setval('urbancity.cliente_idcliente_seq', 2, true);

--
-- TOC entry 2268 (class 0 OID 0)
-- Dependencies: 209
-- Name: guiatalla_idguia_seq; Type: SEQUENCE SET; Schema: urbancity; Owner: a20-mgarde
--
SELECT
    pg_catalog.setval('urbancity.guiatalla_idguia_seq', 5, true);

--
-- TOC entry 2269 (class 0 OID 0)
-- Dependencies: 203
-- Name: pedido_idpedido_seq; Type: SEQUENCE SET; Schema: urbancity; Owner: a20-mgarde
--
SELECT
    pg_catalog.setval('urbancity.pedido_idpedido_seq', 1, false);

--
-- TOC entry 2270 (class 0 OID 0)
-- Dependencies: 201
-- Name: subcategoria_idsubcategoria_seq; Type: SEQUENCE SET; Schema: urbancity; Owner: a20-mgarde
--
SELECT
    pg_catalog.setval(
        'urbancity.subcategoria_idsubcategoria_seq',
        46,
        true
    );

--
-- TOC entry 2113 (class 2606 OID 81217)
-- Name: carrito FK_IDCARRITO_CARRITO; Type: CONSTRAINT; Schema: urbancity; Owner: a20-mgarde
--