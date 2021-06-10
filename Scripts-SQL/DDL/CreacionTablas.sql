SET
    default_tablespace = '';

--
-- TOC entry 208 (class 1259 OID 81212)
-- Name: carrito; Type: TABLE; Schema: urbancity; Owner: a20-mgarde
--
CREATE TABLE urbancity.carrito (
    idcarrito integer NOT NULL,
    idreferencia character varying(9) NOT NULL,
    idcliente integer NOT NULL
);

ALTER TABLE
    urbancity.carrito OWNER TO "a20-mgarde";

--
-- TOC entry 207 (class 1259 OID 81210)
-- Name: carrito_idcarrito_seq; Type: SEQUENCE; Schema: urbancity; Owner: a20-mgarde
--
CREATE SEQUENCE urbancity.carrito_idcarrito_seq START WITH 1 INCREMENT BY 1 NO MINVALUE NO MAXVALUE CACHE 1;

ALTER TABLE
    urbancity.carrito_idcarrito_seq OWNER TO "a20-mgarde";

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

ALTER TABLE
    urbancity.categoria OWNER TO "a20-mgarde";

--
-- TOC entry 199 (class 1259 OID 81136)
-- Name: categoria_idcategoria_seq; Type: SEQUENCE; Schema: urbancity; Owner: a20-mgarde
--
CREATE SEQUENCE urbancity.categoria_idcategoria_seq START WITH 1 INCREMENT BY 1 NO MINVALUE NO MAXVALUE CACHE 1;

ALTER TABLE
    urbancity.categoria_idcategoria_seq OWNER TO "a20-mgarde";

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

ALTER TABLE
    urbancity.cliente OWNER TO "a20-mgarde";

--
-- TOC entry 197 (class 1259 OID 81128)
-- Name: cliente_idcliente_seq; Type: SEQUENCE; Schema: urbancity; Owner: a20-mgarde
--
CREATE SEQUENCE urbancity.cliente_idcliente_seq START WITH 1 INCREMENT BY 1 NO MINVALUE NO MAXVALUE CACHE 1;

ALTER TABLE
    urbancity.cliente_idcliente_seq OWNER TO "a20-mgarde";

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

ALTER TABLE
    urbancity.guiatalla OWNER TO "a20-mgarde";

--
-- TOC entry 209 (class 1259 OID 81228)
-- Name: guiatalla_idguia_seq; Type: SEQUENCE; Schema: urbancity; Owner: a20-mgarde
--
CREATE SEQUENCE urbancity.guiatalla_idguia_seq START WITH 1 INCREMENT BY 1 NO MINVALUE NO MAXVALUE CACHE 1;

ALTER TABLE
    urbancity.guiatalla_idguia_seq OWNER TO "a20-mgarde";

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

ALTER TABLE
    urbancity.pedido OWNER TO "a20-mgarde";

--
-- TOC entry 203 (class 1259 OID 81166)
-- Name: pedido_idpedido_seq; Type: SEQUENCE; Schema: urbancity; Owner: a20-mgarde
--
CREATE SEQUENCE urbancity.pedido_idpedido_seq START WITH 1 INCREMENT BY 1 NO MINVALUE NO MAXVALUE CACHE 1;

ALTER TABLE
    urbancity.pedido_idpedido_seq OWNER TO "a20-mgarde";

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

ALTER TABLE
    urbancity.pedpro OWNER TO "a20-mgarde";

--
-- TOC entry 205 (class 1259 OID 81179)
-- Name: producto; Type: TABLE; Schema: urbancity; Owner: a20-mgarde
--
CREATE TABLE urbancity.producto (
    idreferencia character varying(9) NOT NULL,
    nombre character varying(60) NOT NULL,
    descripcion text NOT NULL,
    precio numeric(6, 2) NOT NULL,
    img bytea,
    idsubcategoria integer NOT NULL,
    talla character varying(2)
);

ALTER TABLE
    urbancity.producto OWNER TO "a20-mgarde";

--
-- TOC entry 202 (class 1259 OID 81146)
-- Name: subcategoria; Type: TABLE; Schema: urbancity; Owner: a20-mgarde
--
CREATE TABLE urbancity.subcategoria (
    idsubcategoria integer NOT NULL,
    nombre character varying(40) NOT NULL,
    idcategoria integer NOT NULL
);

ALTER TABLE
    urbancity.subcategoria OWNER TO "a20-mgarde";

--
-- TOC entry 201 (class 1259 OID 81144)
-- Name: subcategoria_idsubcategoria_seq; Type: SEQUENCE; Schema: urbancity; Owner: a20-mgarde
--
CREATE SEQUENCE urbancity.subcategoria_idsubcategoria_seq START WITH 1 INCREMENT BY 1 NO MINVALUE NO MAXVALUE CACHE 1;

ALTER TABLE
    urbancity.subcategoria_idsubcategoria_seq OWNER TO "a20-mgarde";

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
ALTER TABLE
    ONLY urbancity.carrito
ALTER COLUMN
    idcarrito
SET
    DEFAULT nextval('urbancity.carrito_idcarrito_seq' :: regclass);

--
-- TOC entry 2095 (class 2604 OID 81141)
-- Name: categoria idcategoria; Type: DEFAULT; Schema: urbancity; Owner: a20-mgarde
--
ALTER TABLE
    ONLY urbancity.categoria
ALTER COLUMN
    idcategoria
SET
    DEFAULT nextval(
        'urbancity.categoria_idcategoria_seq' :: regclass
    );

--
-- TOC entry 2094 (class 2604 OID 81133)
-- Name: cliente idcliente; Type: DEFAULT; Schema: urbancity; Owner: a20-mgarde
--
ALTER TABLE
    ONLY urbancity.cliente
ALTER COLUMN
    idcliente
SET
    DEFAULT nextval('urbancity.cliente_idcliente_seq' :: regclass);

--
-- TOC entry 2099 (class 2604 OID 81233)
-- Name: guiatalla idguia; Type: DEFAULT; Schema: urbancity; Owner: a20-mgarde
--
ALTER TABLE
    ONLY urbancity.guiatalla
ALTER COLUMN
    idguia
SET
    DEFAULT nextval('urbancity.guiatalla_idguia_seq' :: regclass);

--
-- TOC entry 2097 (class 2604 OID 81171)
-- Name: pedido idpedido; Type: DEFAULT; Schema: urbancity; Owner: a20-mgarde
--
ALTER TABLE
    ONLY urbancity.pedido
ALTER COLUMN
    idpedido
SET
    DEFAULT nextval('urbancity.pedido_idpedido_seq' :: regclass);

--
-- TOC entry 2096 (class 2604 OID 81149)
-- Name: subcategoria idsubcategoria; Type: DEFAULT; Schema: urbancity; Owner: a20-mgarde
--
ALTER TABLE
    ONLY urbancity.subcategoria
ALTER COLUMN
    idsubcategoria
SET
    DEFAULT nextval(
        'urbancity.subcategoria_idsubcategoria_seq' :: regclass
    );