--
-- PostgreSQL database dump
--

-- Dumped from database version 12.4
-- Dumped by pg_dump version 12.4

-- Started on 2020-11-26 19:31:24

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

SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- TOC entry 215 (class 1259 OID 24772)
-- Name: cantidad_productos; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.cantidad_productos (
    id integer NOT NULL,
    cantidad double precision,
    id_factura integer,
    id_producto integer
);


ALTER TABLE public.cantidad_productos OWNER TO postgres;

--
-- TOC entry 214 (class 1259 OID 24770)
-- Name: cantidad_productos_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.cantidad_productos_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.cantidad_productos_id_seq OWNER TO postgres;

--
-- TOC entry 2895 (class 0 OID 0)
-- Dependencies: 214
-- Name: cantidad_productos_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.cantidad_productos_id_seq OWNED BY public.cantidad_productos.id;


--
-- TOC entry 202 (class 1259 OID 24704)
-- Name: categorias; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.categorias (
    id integer NOT NULL,
    denominacion character varying(60) NOT NULL,
    descripcion character varying(80)
);


ALTER TABLE public.categorias OWNER TO postgres;

--
-- TOC entry 203 (class 1259 OID 24707)
-- Name: categorias_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.categorias_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.categorias_id_seq OWNER TO postgres;

--
-- TOC entry 2896 (class 0 OID 0)
-- Dependencies: 203
-- Name: categorias_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.categorias_id_seq OWNED BY public.categorias.id;


--
-- TOC entry 204 (class 1259 OID 24709)
-- Name: clientes; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.clientes (
    id integer NOT NULL,
    nombre character varying(60) NOT NULL,
    cuil character varying(12) NOT NULL,
    razon_social character varying(60),
    tipo_cliente_id integer NOT NULL,
    apellido character varying(60) NOT NULL,
    fecha_nacimiento date
);


ALTER TABLE public.clientes OWNER TO postgres;

--
-- TOC entry 205 (class 1259 OID 24712)
-- Name: clientes_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.clientes_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.clientes_id_seq OWNER TO postgres;

--
-- TOC entry 2897 (class 0 OID 0)
-- Dependencies: 205
-- Name: clientes_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.clientes_id_seq OWNED BY public.clientes.id;


--
-- TOC entry 206 (class 1259 OID 24714)
-- Name: facturas; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.facturas (
    id integer NOT NULL,
    fecha date,
    observacion character varying(250),
    id_cliente integer,
    total double precision
);


ALTER TABLE public.facturas OWNER TO postgres;

--
-- TOC entry 207 (class 1259 OID 24717)
-- Name: facturas_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.facturas_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.facturas_id_seq OWNER TO postgres;

--
-- TOC entry 2898 (class 0 OID 0)
-- Dependencies: 207
-- Name: facturas_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.facturas_id_seq OWNED BY public.facturas.id;


--
-- TOC entry 208 (class 1259 OID 24719)
-- Name: forma_de_pago; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.forma_de_pago (
    id integer NOT NULL,
    contado integer,
    tarjeta integer,
    debito integer
);


ALTER TABLE public.forma_de_pago OWNER TO postgres;

--
-- TOC entry 209 (class 1259 OID 24722)
-- Name: forma_de_pago_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.forma_de_pago_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.forma_de_pago_id_seq OWNER TO postgres;

--
-- TOC entry 2899 (class 0 OID 0)
-- Dependencies: 209
-- Name: forma_de_pago_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.forma_de_pago_id_seq OWNED BY public.forma_de_pago.id;


--
-- TOC entry 210 (class 1259 OID 24724)
-- Name: productos; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.productos (
    id integer NOT NULL,
    categoria_id integer NOT NULL,
    nombre character varying(128) NOT NULL,
    stock_minimo double precision,
    stock_maximo double precision,
    precio double precision NOT NULL,
    descripcion character varying(60),
    fecha_creacion date NOT NULL
);


ALTER TABLE public.productos OWNER TO postgres;

--
-- TOC entry 211 (class 1259 OID 24727)
-- Name: productos_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.productos_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.productos_id_seq OWNER TO postgres;

--
-- TOC entry 2900 (class 0 OID 0)
-- Dependencies: 211
-- Name: productos_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.productos_id_seq OWNED BY public.productos.id;


--
-- TOC entry 212 (class 1259 OID 24729)
-- Name: tipo_cliente; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.tipo_cliente (
    id integer NOT NULL,
    nombre character varying(60) NOT NULL,
    descripcion character varying(120)
);


ALTER TABLE public.tipo_cliente OWNER TO postgres;

--
-- TOC entry 213 (class 1259 OID 24732)
-- Name: tipo_cliente_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.tipo_cliente_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.tipo_cliente_id_seq OWNER TO postgres;

--
-- TOC entry 2901 (class 0 OID 0)
-- Dependencies: 213
-- Name: tipo_cliente_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.tipo_cliente_id_seq OWNED BY public.tipo_cliente.id;


--
-- TOC entry 2729 (class 2604 OID 24775)
-- Name: cantidad_productos id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.cantidad_productos ALTER COLUMN id SET DEFAULT nextval('public.cantidad_productos_id_seq'::regclass);


--
-- TOC entry 2723 (class 2604 OID 24735)
-- Name: categorias id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.categorias ALTER COLUMN id SET DEFAULT nextval('public.categorias_id_seq'::regclass);


--
-- TOC entry 2724 (class 2604 OID 24736)
-- Name: clientes id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.clientes ALTER COLUMN id SET DEFAULT nextval('public.clientes_id_seq'::regclass);


--
-- TOC entry 2725 (class 2604 OID 24737)
-- Name: facturas id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.facturas ALTER COLUMN id SET DEFAULT nextval('public.facturas_id_seq'::regclass);


--
-- TOC entry 2726 (class 2604 OID 24738)
-- Name: forma_de_pago id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.forma_de_pago ALTER COLUMN id SET DEFAULT nextval('public.forma_de_pago_id_seq'::regclass);


--
-- TOC entry 2727 (class 2604 OID 24739)
-- Name: productos id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.productos ALTER COLUMN id SET DEFAULT nextval('public.productos_id_seq'::regclass);


--
-- TOC entry 2728 (class 2604 OID 24740)
-- Name: tipo_cliente id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.tipo_cliente ALTER COLUMN id SET DEFAULT nextval('public.tipo_cliente_id_seq'::regclass);


--
-- TOC entry 2889 (class 0 OID 24772)
-- Dependencies: 215
-- Data for Name: cantidad_productos; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.cantidad_productos (id, cantidad, id_factura, id_producto) VALUES (1, 12, 5, 10);
INSERT INTO public.cantidad_productos (id, cantidad, id_factura, id_producto) VALUES (2, 30, 6, 10);
INSERT INTO public.cantidad_productos (id, cantidad, id_factura, id_producto) VALUES (3, 30, 7, 10);
INSERT INTO public.cantidad_productos (id, cantidad, id_factura, id_producto) VALUES (4, 52, 8, 11);
INSERT INTO public.cantidad_productos (id, cantidad, id_factura, id_producto) VALUES (5, 10, 8, 12);
INSERT INTO public.cantidad_productos (id, cantidad, id_factura, id_producto) VALUES (6, 1, 9, 12);
INSERT INTO public.cantidad_productos (id, cantidad, id_factura, id_producto) VALUES (7, 1, 9, 11);
INSERT INTO public.cantidad_productos (id, cantidad, id_factura, id_producto) VALUES (8, 32, 10, 12);


--
-- TOC entry 2876 (class 0 OID 24704)
-- Dependencies: 202
-- Data for Name: categorias; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.categorias (id, denominacion, descripcion) VALUES (56, 'golosinas', 'Gomitas');
INSERT INTO public.categorias (id, denominacion, descripcion) VALUES (6, 'golosinas', 'Caramelos');
INSERT INTO public.categorias (id, denominacion, descripcion) VALUES (1, 'golosinas', 'Chupetines');
INSERT INTO public.categorias (id, denominacion, descripcion) VALUES (57, 'Gaseosas', 'Bedidas Frescas');
INSERT INTO public.categorias (id, denominacion, descripcion) VALUES (58, 'sanguches', 'de miga');
INSERT INTO public.categorias (id, denominacion, descripcion) VALUES (59, 'snacks', 'varios');
INSERT INTO public.categorias (id, denominacion, descripcion) VALUES (62, 'Cigarillos', 'Varias Marcas');


--
-- TOC entry 2878 (class 0 OID 24709)
-- Dependencies: 204
-- Data for Name: clientes; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.clientes (id, nombre, cuil, razon_social, tipo_cliente_id, apellido, fecha_nacimiento) VALUES (7, 'Christian nicolas', '23364380879', NULL, 1, 'Leiva', '1991-09-17');
INSERT INTO public.clientes (id, nombre, cuil, razon_social, tipo_cliente_id, apellido, fecha_nacimiento) VALUES (5, 'Matias Emmanuel', '23364380879', NULL, 1, 'puyo', '1991-09-17');
INSERT INTO public.clientes (id, nombre, cuil, razon_social, tipo_cliente_id, apellido, fecha_nacimiento) VALUES (8, 'Guadalupe', '27365034643', ' Consumidor Final', 1, 'Nieto Mayorga', '1992-05-17');
INSERT INTO public.clientes (id, nombre, cuil, razon_social, tipo_cliente_id, apellido, fecha_nacimiento) VALUES (10, 'Juan Pedro', '362457899', NULL, 1, 'Ruiz', '1950-12-24');


--
-- TOC entry 2880 (class 0 OID 24714)
-- Dependencies: 206
-- Data for Name: facturas; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.facturas (id, fecha, observacion, id_cliente, total) VALUES (1, '2020-11-26', 'se guardo', 7, 0);
INSERT INTO public.facturas (id, fecha, observacion, id_cliente, total) VALUES (2, '2020-11-26', 'Coca Cola ', 7, 1000);
INSERT INTO public.facturas (id, fecha, observacion, id_cliente, total) VALUES (3, '2020-11-26', 'Coca-Cola 1.5lts Bien Fria al hielo', 7, 500);
INSERT INTO public.facturas (id, fecha, observacion, id_cliente, total) VALUES (4, '2020-11-26', 'Coca-Cola 1.5lts Bien Fria al hielo', 7, 500);
INSERT INTO public.facturas (id, fecha, observacion, id_cliente, total) VALUES (5, '2020-11-26', 'adasdasdasd', 7, 600);
INSERT INTO public.facturas (id, fecha, observacion, id_cliente, total) VALUES (6, '2020-11-27', 'Gracias por su Compra', 7, 1500);
INSERT INTO public.facturas (id, fecha, observacion, id_cliente, total) VALUES (7, '2020-11-26', 'gracias por su comrpa', 7, 1500);
INSERT INTO public.facturas (id, fecha, observacion, id_cliente, total) VALUES (8, '2020-11-12', '', 7, 4710);
INSERT INTO public.facturas (id, fecha, observacion, id_cliente, total) VALUES (9, '2020-11-26', 'Gracias por su compra', 8, 135);
INSERT INTO public.facturas (id, fecha, observacion, id_cliente, total) VALUES (10, '2020-11-20', 'Tengo Hambre ', 7, 1760);


--
-- TOC entry 2882 (class 0 OID 24719)
-- Dependencies: 208
-- Data for Name: forma_de_pago; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- TOC entry 2884 (class 0 OID 24724)
-- Dependencies: 210
-- Data for Name: productos; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.productos (id, categoria_id, nombre, stock_minimo, stock_maximo, precio, descripcion, fecha_creacion) VALUES (10, 58, 'Coca - Cola', NULL, NULL, 50, '500', '2020-11-24');
INSERT INTO public.productos (id, categoria_id, nombre, stock_minimo, stock_maximo, precio, descripcion, fecha_creacion) VALUES (11, 58, 'Coca - Cola', NULL, NULL, 80, '750', '2020-11-24');
INSERT INTO public.productos (id, categoria_id, nombre, stock_minimo, stock_maximo, precio, descripcion, fecha_creacion) VALUES (12, 58, 'sanguche de miga', NULL, NULL, 55, 'jamon y queso', '2020-11-24');
INSERT INTO public.productos (id, categoria_id, nombre, stock_minimo, stock_maximo, precio, descripcion, fecha_creacion) VALUES (13, 58, 'pebetes', NULL, NULL, 60, 'salame', '2020-11-24');
INSERT INTO public.productos (id, categoria_id, nombre, stock_minimo, stock_maximo, precio, descripcion, fecha_creacion) VALUES (16, 62, 'Cigarilllo', NULL, NULL, 150, 'Cigarrillos CJ', '2020-11-26');


--
-- TOC entry 2886 (class 0 OID 24729)
-- Dependencies: 212
-- Data for Name: tipo_cliente; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.tipo_cliente (id, nombre, descripcion) VALUES (1, 'Tipo A', 'Consumidor Final');
INSERT INTO public.tipo_cliente (id, nombre, descripcion) VALUES (6, 'Tipo B', 'Factura A');
INSERT INTO public.tipo_cliente (id, nombre, descripcion) VALUES (12, 'Tipo C', 'Factura C');
INSERT INTO public.tipo_cliente (id, nombre, descripcion) VALUES (13, 'Tipo D', 'Factura C');


--
-- TOC entry 2902 (class 0 OID 0)
-- Dependencies: 214
-- Name: cantidad_productos_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.cantidad_productos_id_seq', 8, true);


--
-- TOC entry 2903 (class 0 OID 0)
-- Dependencies: 203
-- Name: categorias_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.categorias_id_seq', 62, true);


--
-- TOC entry 2904 (class 0 OID 0)
-- Dependencies: 205
-- Name: clientes_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.clientes_id_seq', 10, true);


--
-- TOC entry 2905 (class 0 OID 0)
-- Dependencies: 207
-- Name: facturas_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.facturas_id_seq', 10, true);


--
-- TOC entry 2906 (class 0 OID 0)
-- Dependencies: 209
-- Name: forma_de_pago_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.forma_de_pago_id_seq', 1, false);


--
-- TOC entry 2907 (class 0 OID 0)
-- Dependencies: 211
-- Name: productos_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.productos_id_seq', 16, true);


--
-- TOC entry 2908 (class 0 OID 0)
-- Dependencies: 213
-- Name: tipo_cliente_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.tipo_cliente_id_seq', 14, true);


--
-- TOC entry 2743 (class 2606 OID 24777)
-- Name: cantidad_productos cantidad_productos_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.cantidad_productos
    ADD CONSTRAINT cantidad_productos_pkey PRIMARY KEY (id);


--
-- TOC entry 2733 (class 2606 OID 24744)
-- Name: clientes clientes_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.clientes
    ADD CONSTRAINT clientes_pkey PRIMARY KEY (id);


--
-- TOC entry 2735 (class 2606 OID 24746)
-- Name: facturas facturas_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.facturas
    ADD CONSTRAINT facturas_pkey PRIMARY KEY (id);


--
-- TOC entry 2737 (class 2606 OID 24748)
-- Name: forma_de_pago forma_de_pago_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.forma_de_pago
    ADD CONSTRAINT forma_de_pago_pkey PRIMARY KEY (id);


--
-- TOC entry 2731 (class 2606 OID 24750)
-- Name: categorias pk_id_categorias; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.categorias
    ADD CONSTRAINT pk_id_categorias PRIMARY KEY (id);


--
-- TOC entry 2739 (class 2606 OID 24752)
-- Name: productos productos_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.productos
    ADD CONSTRAINT productos_pkey PRIMARY KEY (id);


--
-- TOC entry 2741 (class 2606 OID 24754)
-- Name: tipo_cliente tipo_cliente_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.tipo_cliente
    ADD CONSTRAINT tipo_cliente_pkey PRIMARY KEY (id);


--
-- TOC entry 2744 (class 1259 OID 24788)
-- Name: fki_fk_cantidad_idFactura; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "fki_fk_cantidad_idFactura" ON public.cantidad_productos USING btree (id_factura);


--
-- TOC entry 2749 (class 2606 OID 24783)
-- Name: cantidad_productos fk_cantidad_idFactura; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.cantidad_productos
    ADD CONSTRAINT "fk_cantidad_idFactura" FOREIGN KEY (id_factura) REFERENCES public.facturas(id) NOT VALID;


--
-- TOC entry 2748 (class 2606 OID 24778)
-- Name: cantidad_productos fk_cantidad_idProdcuto; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.cantidad_productos
    ADD CONSTRAINT "fk_cantidad_idProdcuto" FOREIGN KEY (id_producto) REFERENCES public.productos(id) NOT VALID;


--
-- TOC entry 2747 (class 2606 OID 24755)
-- Name: productos fk_categoria_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.productos
    ADD CONSTRAINT fk_categoria_id FOREIGN KEY (categoria_id) REFERENCES public.categorias(id);


--
-- TOC entry 2746 (class 2606 OID 24765)
-- Name: facturas fk_facturas_id_cliente; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.facturas
    ADD CONSTRAINT fk_facturas_id_cliente FOREIGN KEY (id_cliente) REFERENCES public.clientes(id) NOT VALID;


--
-- TOC entry 2745 (class 2606 OID 24760)
-- Name: clientes fk_tipo_cliente; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.clientes
    ADD CONSTRAINT fk_tipo_cliente FOREIGN KEY (tipo_cliente_id) REFERENCES public.tipo_cliente(id);


-- Completed on 2020-11-26 19:31:25

--
-- PostgreSQL database dump complete
--

