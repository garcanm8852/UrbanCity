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