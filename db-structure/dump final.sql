--
-- PostgreSQL database dump
--

-- Dumped from database version 14.5
-- Dumped by pg_dump version 14.5

-- Started on 2022-11-02 14:12:22

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
-- TOC entry 5 (class 2615 OID 25140)
-- Name: public; Type: SCHEMA; Schema: -; Owner: postgres
--

--CREATE SCHEMA public;


ALTER SCHEMA public OWNER TO postgres;

SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- TOC entry 209 (class 1259 OID 25142)
-- Name: categoriaingrediente; Type: TABLE; Schema: public; Owner: kenkougym
--

CREATE TABLE public.categoriaingrediente (
    id integer NOT NULL,
    descripcion character varying(100) NOT NULL
);


ALTER TABLE public.categoriaingrediente OWNER TO kenkougym;

--
-- TOC entry 210 (class 1259 OID 25145)
-- Name: categoriaingrediente_id_seq; Type: SEQUENCE; Schema: public; Owner: kenkougym
--

ALTER TABLE public.categoriaingrediente ALTER COLUMN id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.categoriaingrediente_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- TOC entry 211 (class 1259 OID 25146)
-- Name: ejercicio; Type: TABLE; Schema: public; Owner: kenkougym
--

CREATE TABLE public.ejercicio (
    id integer NOT NULL,
    nombre character varying NOT NULL
);


ALTER TABLE public.ejercicio OWNER TO kenkougym;

--
-- TOC entry 212 (class 1259 OID 25151)
-- Name: ejercicio_id_seq; Type: SEQUENCE; Schema: public; Owner: kenkougym
--

ALTER TABLE public.ejercicio ALTER COLUMN id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.ejercicio_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- TOC entry 213 (class 1259 OID 25152)
-- Name: ejercicio_x_musculo; Type: TABLE; Schema: public; Owner: kenkougym
--

CREATE TABLE public.ejercicio_x_musculo (
    id integer NOT NULL,
    idmusculo integer NOT NULL,
    idejercicio integer NOT NULL,
    idimagen integer NOT NULL,
    idtrutina integer NOT NULL,
    series integer,
    repeticiones integer,
    peso_recomendado character varying,
    tiempo_recomendado character varying,
    veces_xsemana character varying,
    otras_indicaciones character varying,
    dificultad character varying,
    url character varying
);


ALTER TABLE public.ejercicio_x_musculo OWNER TO kenkougym;

--
-- TOC entry 214 (class 1259 OID 25157)
-- Name: ejercicio_x_musculo_id_seq; Type: SEQUENCE; Schema: public; Owner: kenkougym
--

ALTER TABLE public.ejercicio_x_musculo ALTER COLUMN id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.ejercicio_x_musculo_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- TOC entry 215 (class 1259 OID 25158)
-- Name: ejercicio_x_rutina; Type: TABLE; Schema: public; Owner: kenkougym
--

CREATE TABLE public.ejercicio_x_rutina (
    id_rutina integer NOT NULL,
    idemusculo integer NOT NULL
);


ALTER TABLE public.ejercicio_x_rutina OWNER TO kenkougym;

--
-- TOC entry 216 (class 1259 OID 25161)
-- Name: estiloalimenticio; Type: TABLE; Schema: public; Owner: kenkougym
--

CREATE TABLE public.estiloalimenticio (
    id integer NOT NULL,
    nombre character varying
);


ALTER TABLE public.estiloalimenticio OWNER TO kenkougym;

--
-- TOC entry 217 (class 1259 OID 25166)
-- Name: estiloalimenticio_id_seq; Type: SEQUENCE; Schema: public; Owner: kenkougym
--

ALTER TABLE public.estiloalimenticio ALTER COLUMN id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.estiloalimenticio_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- TOC entry 218 (class 1259 OID 25167)
-- Name: fotografia; Type: TABLE; Schema: public; Owner: kenkougym
--

CREATE TABLE public.fotografia (
    id integer NOT NULL,
    foto character varying NOT NULL
);


ALTER TABLE public.fotografia OWNER TO kenkougym;

--
-- TOC entry 219 (class 1259 OID 25172)
-- Name: fotografia_id_seq; Type: SEQUENCE; Schema: public; Owner: kenkougym
--

ALTER TABLE public.fotografia ALTER COLUMN id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.fotografia_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- TOC entry 220 (class 1259 OID 25173)
-- Name: fotografiaxreceta; Type: TABLE; Schema: public; Owner: kenkougym
--

CREATE TABLE public.fotografiaxreceta (
    id_receta integer NOT NULL,
    id_fotografia integer NOT NULL
);


ALTER TABLE public.fotografiaxreceta OWNER TO kenkougym;

--
-- TOC entry 221 (class 1259 OID 25176)
-- Name: imagen_ejercicio; Type: TABLE; Schema: public; Owner: kenkougym
--

CREATE TABLE public.imagen_ejercicio (
    id integer NOT NULL,
    imagen character varying NOT NULL
);


ALTER TABLE public.imagen_ejercicio OWNER TO kenkougym;

--
-- TOC entry 222 (class 1259 OID 25181)
-- Name: imagen_ejercicio_id_seq; Type: SEQUENCE; Schema: public; Owner: kenkougym
--

ALTER TABLE public.imagen_ejercicio ALTER COLUMN id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.imagen_ejercicio_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- TOC entry 223 (class 1259 OID 25182)
-- Name: ingrediente; Type: TABLE; Schema: public; Owner: kenkougym
--

CREATE TABLE public.ingrediente (
    id integer NOT NULL,
    nombre_alimento character varying NOT NULL,
    calorias numeric DEFAULT 0 NOT NULL,
    proteinas numeric DEFAULT 0 NOT NULL,
    carbohidratos numeric DEFAULT 0 NOT NULL,
    fibra numeric DEFAULT 0 NOT NULL,
    grasasaturada numeric DEFAULT 0 NOT NULL,
    categoria integer DEFAULT 0 NOT NULL,
    categoria_id integer,
    vitamina_a real,
    vitamina_b1 real,
    vitamina_b12 real,
    vitamina_b2 real,
    vitamina_b9 real,
    vitamina_c real,
    vitamina_d real,
    vitamina_e real,
    vitamina_k real
);


ALTER TABLE public.ingrediente OWNER TO kenkougym;

--
-- TOC entry 224 (class 1259 OID 25193)
-- Name: ingrediente_id_seq; Type: SEQUENCE; Schema: public; Owner: kenkougym
--

ALTER TABLE public.ingrediente ALTER COLUMN id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.ingrediente_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- TOC entry 225 (class 1259 OID 25194)
-- Name: ingredientexreceta; Type: TABLE; Schema: public; Owner: kenkougym
--

CREATE TABLE public.ingredientexreceta (
    id_ingrediente integer NOT NULL,
    id_receta integer NOT NULL,
    gramos numeric NOT NULL
);


ALTER TABLE public.ingredientexreceta OWNER TO kenkougym;

--
-- TOC entry 226 (class 1259 OID 25199)
-- Name: kenkou_role; Type: TABLE; Schema: public; Owner: kenkougym
--

CREATE TABLE public.kenkou_role (
    role_code character varying(20) NOT NULL,
    role_name character varying(100) NOT NULL
);


ALTER TABLE public.kenkou_role OWNER TO kenkougym;

--
-- TOC entry 227 (class 1259 OID 25202)
-- Name: kenkou_user; Type: TABLE; Schema: public; Owner: kenkougym
--

CREATE TABLE public.kenkou_user (
    username character varying(30) NOT NULL,
    email character varying(255) NOT NULL,
    first_name character varying(255) NOT NULL,
    last_name character varying(255) NOT NULL,
    password text NOT NULL,
    enabled boolean DEFAULT true NOT NULL,
    locked boolean DEFAULT false NOT NULL,
    credentials_expiration date DEFAULT (CURRENT_DATE + '6 mons'::interval) NOT NULL,
    credentials_ex character varying(255),
    medida_altura double precision DEFAULT 0 NOT NULL,
    sexo character varying(1) DEFAULT 'F'::character varying NOT NULL
);


ALTER TABLE public.kenkou_user OWNER TO kenkougym;

--
-- TOC entry 3571 (class 0 OID 0)
-- Dependencies: 227
-- Name: COLUMN kenkou_user.medida_altura; Type: COMMENT; Schema: public; Owner: kenkougym
--

COMMENT ON COLUMN public.kenkou_user.medida_altura IS 'Medida en cm';


--
-- TOC entry 228 (class 1259 OID 25210)
-- Name: musculo; Type: TABLE; Schema: public; Owner: kenkougym
--

CREATE TABLE public.musculo (
    id integer NOT NULL,
    nombre character varying NOT NULL
);


ALTER TABLE public.musculo OWNER TO kenkougym;

--
-- TOC entry 229 (class 1259 OID 25215)
-- Name: musculo_id_seq; Type: SEQUENCE; Schema: public; Owner: kenkougym
--

ALTER TABLE public.musculo ALTER COLUMN id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.musculo_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- TOC entry 230 (class 1259 OID 25216)
-- Name: objetivo; Type: TABLE; Schema: public; Owner: kenkougym
--

CREATE TABLE public.objetivo (
    id integer NOT NULL,
    nombre character varying NOT NULL
);


ALTER TABLE public.objetivo OWNER TO kenkougym;

--
-- TOC entry 231 (class 1259 OID 25221)
-- Name: objetivo_id_seq; Type: SEQUENCE; Schema: public; Owner: kenkougym
--

ALTER TABLE public.objetivo ALTER COLUMN id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.objetivo_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- TOC entry 232 (class 1259 OID 25222)
-- Name: planalimenticio; Type: TABLE; Schema: public; Owner: kenkougym
--

CREATE TABLE public.planalimenticio (
    id integer NOT NULL,
    nombre character varying NOT NULL,
    estiloalimentacion integer NOT NULL,
    objetivo integer NOT NULL,
    estilo_alimentacion_id integer
);


ALTER TABLE public.planalimenticio OWNER TO kenkougym;

--
-- TOC entry 233 (class 1259 OID 25227)
-- Name: planalimenticio_id_seq; Type: SEQUENCE; Schema: public; Owner: kenkougym
--

ALTER TABLE public.planalimenticio ALTER COLUMN id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.planalimenticio_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- TOC entry 234 (class 1259 OID 25228)
-- Name: planalimenticio_recetas; Type: TABLE; Schema: public; Owner: kenkougym
--

CREATE TABLE public.planalimenticio_recetas (
    plan_alimenticio_id integer NOT NULL,
    recetas_id integer NOT NULL
);


ALTER TABLE public.planalimenticio_recetas OWNER TO kenkougym;

--
-- TOC entry 235 (class 1259 OID 25231)
-- Name: planxreceta; Type: TABLE; Schema: public; Owner: kenkougym
--

CREATE TABLE public.planxreceta (
    id_receta integer NOT NULL,
    id_plan integer NOT NULL
);


ALTER TABLE public.planxreceta OWNER TO kenkougym;

--
-- TOC entry 236 (class 1259 OID 25234)
-- Name: progreso; Type: TABLE; Schema: public; Owner: kenkougym
--

CREATE TABLE public.progreso (
    id_progreso integer NOT NULL,
    username character varying NOT NULL,
    peso double precision NOT NULL,
    medida_pecho double precision NOT NULL,
    medida_brazo_der double precision NOT NULL,
    medida_pierna_der double precision NOT NULL,
    diametro_cintura double precision NOT NULL,
    fecha date NOT NULL,
    porcentaje_grasa double precision DEFAULT 0 NOT NULL,
    medida_cuello double precision DEFAULT 0 NOT NULL,
    diametro_caderas double precision DEFAULT 0 NOT NULL,
    medida_brazo_izq double precision DEFAULT 0 NOT NULL,
    medida_pierna_izq double precision DEFAULT 0 NOT NULL
);


ALTER TABLE public.progreso OWNER TO kenkougym;

--
-- TOC entry 3572 (class 0 OID 0)
-- Dependencies: 236
-- Name: COLUMN progreso.peso; Type: COMMENT; Schema: public; Owner: kenkougym
--

COMMENT ON COLUMN public.progreso.peso IS 'Medida en kg';


--
-- TOC entry 3573 (class 0 OID 0)
-- Dependencies: 236
-- Name: COLUMN progreso.medida_pecho; Type: COMMENT; Schema: public; Owner: kenkougym
--

COMMENT ON COLUMN public.progreso.medida_pecho IS 'Medida en cm';


--
-- TOC entry 3574 (class 0 OID 0)
-- Dependencies: 236
-- Name: COLUMN progreso.medida_brazo_der; Type: COMMENT; Schema: public; Owner: kenkougym
--

COMMENT ON COLUMN public.progreso.medida_brazo_der IS 'Medida en cm';


--
-- TOC entry 3575 (class 0 OID 0)
-- Dependencies: 236
-- Name: COLUMN progreso.medida_pierna_der; Type: COMMENT; Schema: public; Owner: kenkougym
--

COMMENT ON COLUMN public.progreso.medida_pierna_der IS 'Medida en cm';


--
-- TOC entry 3576 (class 0 OID 0)
-- Dependencies: 236
-- Name: COLUMN progreso.diametro_cintura; Type: COMMENT; Schema: public; Owner: kenkougym
--

COMMENT ON COLUMN public.progreso.diametro_cintura IS 'Medida en cm';


--
-- TOC entry 3577 (class 0 OID 0)
-- Dependencies: 236
-- Name: COLUMN progreso.porcentaje_grasa; Type: COMMENT; Schema: public; Owner: kenkougym
--

COMMENT ON COLUMN public.progreso.porcentaje_grasa IS 'Medida en decimal';


--
-- TOC entry 3578 (class 0 OID 0)
-- Dependencies: 236
-- Name: COLUMN progreso.medida_cuello; Type: COMMENT; Schema: public; Owner: kenkougym
--

COMMENT ON COLUMN public.progreso.medida_cuello IS 'Medida en cm';


--
-- TOC entry 3579 (class 0 OID 0)
-- Dependencies: 236
-- Name: COLUMN progreso.diametro_caderas; Type: COMMENT; Schema: public; Owner: kenkougym
--

COMMENT ON COLUMN public.progreso.diametro_caderas IS 'Medida en cm';


--
-- TOC entry 237 (class 1259 OID 25239)
-- Name: progreso_id_progreso_seq; Type: SEQUENCE; Schema: public; Owner: kenkougym
--

ALTER TABLE public.progreso ALTER COLUMN id_progreso ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.progreso_id_progreso_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- TOC entry 238 (class 1259 OID 25240)
-- Name: receta; Type: TABLE; Schema: public; Owner: kenkougym
--

CREATE TABLE public.receta (
    id integer NOT NULL,
    nombre character varying NOT NULL,
    linkvideo character varying NOT NULL,
    instrucciones character varying NOT NULL,
    id_objetivo integer NOT NULL,
    tiempo_comida integer NOT NULL,
    objetivo_id integer,
    tiempo_comida_id integer,
    tablanutrionalid integer
);


ALTER TABLE public.receta OWNER TO kenkougym;

--
-- TOC entry 239 (class 1259 OID 25245)
-- Name: receta_id_seq; Type: SEQUENCE; Schema: public; Owner: kenkougym
--

ALTER TABLE public.receta ALTER COLUMN id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.receta_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- TOC entry 240 (class 1259 OID 25246)
-- Name: rutina; Type: TABLE; Schema: public; Owner: kenkougym
--

CREATE TABLE public.rutina (
    id integer NOT NULL,
    nombre character varying NOT NULL,
	imagen character varying NOT NULL,
	dificultad character varying NOT NULL,
	objetivo character varying NOT NULL,
	musculo_a_trabajar character varying NOT NULL,
	instrucciones character varying NOT NULL
);


ALTER TABLE public.rutina OWNER TO kenkougym;

--
-- TOC entry 241 (class 1259 OID 25251)
-- Name: rutina_id_seq; Type: SEQUENCE; Schema: public; Owner: kenkougym
--

ALTER TABLE public.rutina ALTER COLUMN id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.rutina_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- TOC entry 242 (class 1259 OID 25252)
-- Name: tablanutricional; Type: TABLE; Schema: public; Owner: kenkougym
--

CREATE TABLE public.tablanutricional (
    id integer NOT NULL,
    calorias numeric NOT NULL,
    proteinas numeric NOT NULL,
    carbohidratos numeric NOT NULL,
    fibra numeric NOT NULL,
    grasas numeric NOT NULL
);


ALTER TABLE public.tablanutricional OWNER TO kenkougym;

--
-- TOC entry 243 (class 1259 OID 25257)
-- Name: tablanutricional_id_seq; Type: SEQUENCE; Schema: public; Owner: kenkougym
--

ALTER TABLE public.tablanutricional ALTER COLUMN id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.tablanutricional_id_seq
    START WITH 10
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- TOC entry 244 (class 1259 OID 25258)
-- Name: tiempocomida; Type: TABLE; Schema: public; Owner: kenkougym
--

CREATE TABLE public.tiempocomida (
    id integer NOT NULL,
    nombre character varying
);


ALTER TABLE public.tiempocomida OWNER TO kenkougym;

--
-- TOC entry 245 (class 1259 OID 25263)
-- Name: tiempocomida_id_seq; Type: SEQUENCE; Schema: public; Owner: kenkougym
--

ALTER TABLE public.tiempocomida ALTER COLUMN id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.tiempocomida_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- TOC entry 246 (class 1259 OID 25264)
-- Name: tipo_rutina; Type: TABLE; Schema: public; Owner: kenkougym
--

CREATE TABLE public.tipo_rutina (
    id integer NOT NULL,
    nombre character varying NOT NULL
);


ALTER TABLE public.tipo_rutina OWNER TO kenkougym;

--
-- TOC entry 247 (class 1259 OID 25269)
-- Name: tipo_rutina_id_seq; Type: SEQUENCE; Schema: public; Owner: kenkougym
--

ALTER TABLE public.tipo_rutina ALTER COLUMN id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.tipo_rutina_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- TOC entry 248 (class 1259 OID 25270)
-- Name: user_role; Type: TABLE; Schema: public; Owner: kenkougym
--

CREATE TABLE public.user_role (
    username character varying(30) NOT NULL,
    role_code character varying(20) NOT NULL
);


ALTER TABLE public.user_role OWNER TO kenkougym;

--
-- TOC entry 249 (class 1259 OID 25273)
-- Name: userxdieta; Type: TABLE; Schema: public; Owner: kenkougym
--

CREATE TABLE public.userxdieta (
    id_planalimenticio integer NOT NULL,
    username character varying NOT NULL,
    estado boolean NOT NULL
);


ALTER TABLE public.userxdieta OWNER TO kenkougym;

--
-- TOC entry 250 (class 1259 OID 25278)
-- Name: userxrutina; Type: TABLE; Schema: public; Owner: kenkougym
--

CREATE TABLE public.userxrutina (
    id_rutina integer NOT NULL,
    username character varying NOT NULL,
    estado boolean NOT NULL
);


ALTER TABLE public.userxrutina OWNER TO kenkougym;

--
-- TOC entry 251 (class 1259 OID 25501)
-- Name: usuario_objetivo; Type: TABLE; Schema: public; Owner: kenkougym
--

CREATE TABLE public.usuario_objetivo (
    username character varying(30) NOT NULL,
    objetivo_id integer NOT NULL,
    activo boolean NOT NULL
);


ALTER TABLE public.usuario_objetivo OWNER TO kenkougym;

--
-- TOC entry 3522 (class 0 OID 25142)
-- Dependencies: 209
-- Data for Name: categoriaingrediente; Type: TABLE DATA; Schema: public; Owner: kenkougym
--

INSERT INTO public.categoriaingrediente OVERRIDING SYSTEM VALUE VALUES (1, 'VERDURAS Y HORTALIZAS');
INSERT INTO public.categoriaingrediente OVERRIDING SYSTEM VALUE VALUES (2, 'FRUTAS');
INSERT INTO public.categoriaingrediente OVERRIDING SYSTEM VALUE VALUES (3, 'FRUTOS SECOS');
INSERT INTO public.categoriaingrediente OVERRIDING SYSTEM VALUE VALUES (4, 'LACTEOS Y DERIVADOS');
INSERT INTO public.categoriaingrediente OVERRIDING SYSTEM VALUE VALUES (5, 'CARNES, CAZA Y EMBUTIDOS');
INSERT INTO public.categoriaingrediente OVERRIDING SYSTEM VALUE VALUES (6, 'PESCADOS, CRUSTÁCEOS Y MARISCOS');
INSERT INTO public.categoriaingrediente OVERRIDING SYSTEM VALUE VALUES (7, 'AZUCARES Y DULCES');
INSERT INTO public.categoriaingrediente OVERRIDING SYSTEM VALUE VALUES (8, 'CEREALES Y DERIVADOS');
INSERT INTO public.categoriaingrediente OVERRIDING SYSTEM VALUE VALUES (9, 'LEGUMBRES');
INSERT INTO public.categoriaingrediente OVERRIDING SYSTEM VALUE VALUES (10, 'HUEVOS');
INSERT INTO public.categoriaingrediente OVERRIDING SYSTEM VALUE VALUES (11, 'PASTELERÍA');
INSERT INTO public.categoriaingrediente OVERRIDING SYSTEM VALUE VALUES (12, 'BEBIDAS');
INSERT INTO public.categoriaingrediente OVERRIDING SYSTEM VALUE VALUES (13, 'ACEITES Y GRASAS');
INSERT INTO public.categoriaingrediente OVERRIDING SYSTEM VALUE VALUES (14, 'SALSAS Y CONDIMENTOS');


--
-- TOC entry 3524 (class 0 OID 25146)
-- Dependencies: 211
-- Data for Name: ejercicio; Type: TABLE DATA; Schema: public; Owner: kenkougym
--

INSERT INTO public.ejercicio OVERRIDING SYSTEM VALUE VALUES (1, 'Predicador');
INSERT INTO public.ejercicio OVERRIDING SYSTEM VALUE VALUES (2, 'Curl con barra');
INSERT INTO public.ejercicio OVERRIDING SYSTEM VALUE VALUES (3, 'Curl Supino');
INSERT INTO public.ejercicio OVERRIDING SYSTEM VALUE VALUES (4, 'Fondos en paralelas');
INSERT INTO public.ejercicio OVERRIDING SYSTEM VALUE VALUES (5, 'Rompe cráneos con mancuerna');
INSERT INTO public.ejercicio OVERRIDING SYSTEM VALUE VALUES (6, 'Copa con lazo');
INSERT INTO public.ejercicio OVERRIDING SYSTEM VALUE VALUES (7, 'Press militar con barra');
INSERT INTO public.ejercicio OVERRIDING SYSTEM VALUE VALUES (8, 'Press militar con mancuerna');
INSERT INTO public.ejercicio OVERRIDING SYSTEM VALUE VALUES (9, 'Elevaciones frontales');
INSERT INTO public.ejercicio OVERRIDING SYSTEM VALUE VALUES (10, 'Vuelos');
INSERT INTO public.ejercicio OVERRIDING SYSTEM VALUE VALUES (11, 'Face pull');
INSERT INTO public.ejercicio OVERRIDING SYSTEM VALUE VALUES (12, 'Remo barra alta');


--
-- TOC entry 3526 (class 0 OID 25152)
-- Dependencies: 213
-- Data for Name: ejercicio_x_musculo; Type: TABLE DATA; Schema: public; Owner: kenkougym
--
INSERT INTO public.ejercicio_x_musculo OVERRIDING SYSTEM VALUE VALUES (1, 1, 1, 2, 3, 3, 8, 'Máximo peso soportado', '8 minutos', '2', '', 'Difícil', 'https://www.youtube.com/watch?v=_zdaX8F0Ix0');
INSERT INTO public.ejercicio_x_musculo OVERRIDING SYSTEM VALUE VALUES (2, 1, 2, 3, 3, 3, 8, 'Máximo peso soportado', '8 minutos', '2', '', 'Difícil', 'https://www.youtube.com/watch?v=umiNqixhh-c');
INSERT INTO public.ejercicio_x_musculo OVERRIDING SYSTEM VALUE VALUES (3, 1, 3, 4, 3, 3, 8, 'Máximo peso soportado', '8 minutos', '2', '', 'Difícil', 'https://www.youtube.com/watch?v=uGqAKXqR8dg');
INSERT INTO public.ejercicio_x_musculo OVERRIDING SYSTEM VALUE VALUES (4, 2, 4, 5, 3, 3, 8, 'Máximo peso soportado', '5 minutos', '2', '', 'Difícil', 'https://www.youtube.com/watch?v=CkX5QdEz4IE');
INSERT INTO public.ejercicio_x_musculo OVERRIDING SYSTEM VALUE VALUES (5, 2, 5, 6, 3, 3, 8, 'Máximo peso soportado', '5 minutos', '2', '', 'Difícil', 'https://www.youtube.com/watch?v=KvnZJBplc54');
INSERT INTO public.ejercicio_x_musculo OVERRIDING SYSTEM VALUE VALUES (6, 2, 6, 7, 3, 3, 8, 'Máximo peso soportado', '5 minutos', '2', '', 'Difícil', 'https://www.youtube.com/watch?v=eE4BwnFBiiE');
--Hombros
INSERT INTO public.ejercicio_x_musculo OVERRIDING SYSTEM VALUE VALUES (7, 11, 7, 14, 3, 4, 8, 'Peso dominado', '6 minutos', '1', 'Realizar despues de comer', 'Media', '"https://www.youtube.com/watch?v=8_whF4Z7WTI"');
INSERT INTO public.ejercicio_x_musculo OVERRIDING SYSTEM VALUE VALUES (8, 11, 8, 15, 3, 4, 10, 'Peso dominado', '8 minutos', '1', 'Realizar despues de comer', 'Media', '"https://www.youtube.com/watch?v=o5M9RZ-vWrc"');
INSERT INTO public.ejercicio_x_musculo OVERRIDING SYSTEM VALUE VALUES (9, 12, 9, 16, 3, 4, 8, 'Peso dominado', '6 minutos', '1', 'Realizar despues de comer', 'Media', '"https://www.youtube.com/watch?v=ZLG2Ed8C87A"');
INSERT INTO public.ejercicio_x_musculo OVERRIDING SYSTEM VALUE VALUES (10, 12, 10, 17, 3, 4, 8, 'Peso dominado', '6 minutos', '1', 'Realizar despues de comer', 'Media', '"https://www.youtube.com/watch?v=xZKJAQpe2ug"');
INSERT INTO public.ejercicio_x_musculo OVERRIDING SYSTEM VALUE VALUES (11, 13, 11, 12, 3, 4, 10, 'Peso dominado', '10 minutos', '1', 'Realizar despues de comer', 'Media', '"https://www.youtube.com/watch?v=h2I7pHAKLoE"');
INSERT INTO public.ejercicio_x_musculo OVERRIDING SYSTEM VALUE VALUES (12, 13, 12, 13, 3, 4, 10, 'Peso dominado', '10 minutos', '1', 'Realizar despues de comer', 'Media', '"https://youtu.be/KsH6QzoNhxE"');



--
-- TOC entry 3528 (class 0 OID 25158)
-- Dependencies: 215
-- Data for Name: ejercicio_x_rutina; Type: TABLE DATA; Schema: public; Owner: kenkougym
--
INSERT INTO public.ejercicio_x_rutina OVERRIDING SYSTEM VALUE VALUES (1, 1);
INSERT INTO public.ejercicio_x_rutina OVERRIDING SYSTEM VALUE VALUES (1, 2);
INSERT INTO public.ejercicio_x_rutina OVERRIDING SYSTEM VALUE VALUES (1, 3);
INSERT INTO public.ejercicio_x_rutina OVERRIDING SYSTEM VALUE VALUES (1, 4);
INSERT INTO public.ejercicio_x_rutina OVERRIDING SYSTEM VALUE VALUES (1, 5);
INSERT INTO public.ejercicio_x_rutina OVERRIDING SYSTEM VALUE VALUES (1, 6);
INSERT INTO public.ejercicio_x_rutina OVERRIDING SYSTEM VALUE VALUES (2, 7);
INSERT INTO public.ejercicio_x_rutina OVERRIDING SYSTEM VALUE VALUES (2, 8);
INSERT INTO public.ejercicio_x_rutina OVERRIDING SYSTEM VALUE VALUES (2, 9);
INSERT INTO public.ejercicio_x_rutina OVERRIDING SYSTEM VALUE VALUES (2, 10);
INSERT INTO public.ejercicio_x_rutina OVERRIDING SYSTEM VALUE VALUES (2, 11);
INSERT INTO public.ejercicio_x_rutina OVERRIDING SYSTEM VALUE VALUES (2, 12);

--
-- TOC entry 3529 (class 0 OID 25161)
-- Dependencies: 216
-- Data for Name: estiloalimenticio; Type: TABLE DATA; Schema: public; Owner: kenkougym
--

INSERT INTO public.estiloalimenticio OVERRIDING SYSTEM VALUE VALUES (2, 'VEGETARIANO');
INSERT INTO public.estiloalimenticio OVERRIDING SYSTEM VALUE VALUES (3, 'VEGANO');
INSERT INTO public.estiloalimenticio OVERRIDING SYSTEM VALUE VALUES (1, 'CARNIVORO');


--
-- TOC entry 3531 (class 0 OID 25167)
-- Dependencies: 218
-- Data for Name: fotografia; Type: TABLE DATA; Schema: public; Owner: kenkougym
--

INSERT INTO public.fotografia OVERRIDING SYSTEM VALUE VALUES (1, '..\kenkougymapp\src\componentes\recipes\imagenes\tostadasfrancesas1.jpg');
INSERT INTO public.fotografia OVERRIDING SYSTEM VALUE VALUES (2, '..\kenkougymapp\src\componentes\recipes\imagenes\francesasveg.jpeg');
INSERT INTO public.fotografia OVERRIDING SYSTEM VALUE VALUES (3, '..\kenkougymapp\src\componentes\recipes\imagenes\Grilled-chicken-burgers2-500x375.jpg');
INSERT INTO public.fotografia OVERRIDING SYSTEM VALUE VALUES (4, '..\kenkougymapp\src\componentes\recipes\imagenes\ensaladas-ricas-en-proteina_bbcfc08b_900x900.jpg');
INSERT INTO public.fotografia OVERRIDING SYSTEM VALUE VALUES (5, '..\kenkougymapp\src\componentes\recipes\imagenes\espagueti_con_carne_molida_51623_orig.jpg');
INSERT INTO public.fotografia OVERRIDING SYSTEM VALUE VALUES (6, '..\kenkougymapp\src\componentes\recipes\imagenes\fettuciniconpollo.jpeg');
INSERT INTO public.fotografia OVERRIDING SYSTEM VALUE VALUES (7, '..\kenkougymapp\src\componentes\recipes\imagenes\protein-pizza-3-web.jpg');
INSERT INTO public.fotografia OVERRIDING SYSTEM VALUE VALUES (8, '..\kenkougymapp\src\componentes\recipes\imagenes\1.jpg');
INSERT INTO public.fotografia OVERRIDING SYSTEM VALUE VALUES (9, '..\kenkougymapp\src\componentes\recipes\imagenes\1.jpg');


--
-- TOC entry 3533 (class 0 OID 25173)
-- Dependencies: 220
-- Data for Name: fotografiaxreceta; Type: TABLE DATA; Schema: public; Owner: kenkougym
--

INSERT INTO public.fotografiaxreceta VALUES (1, 1);
INSERT INTO public.fotografiaxreceta VALUES (2, 2);
INSERT INTO public.fotografiaxreceta VALUES (3, 3);
INSERT INTO public.fotografiaxreceta VALUES (4, 4);
INSERT INTO public.fotografiaxreceta VALUES (5, 5);
INSERT INTO public.fotografiaxreceta VALUES (6, 6);
INSERT INTO public.fotografiaxreceta VALUES (7, 7);
INSERT INTO public.fotografiaxreceta VALUES (8, 8);
INSERT INTO public.fotografiaxreceta VALUES (9, 9);


--
-- TOC entry 3534 (class 0 OID 25176)
-- Dependencies: 221
-- Data for Name: imagen_ejercicio; Type: TABLE DATA; Schema: public; Owner: kenkougym
--


--Concentrado
INSERT INTO public.imagen_ejercicio OVERRIDING SYSTEM VALUE VALUES (1, 'https://drive.google.com/uc?export=view&id=1MNKjIARxRDGutPiPh9cm7q6Gjsmg0E0F');
-- Predicador
INSERT INTO public.imagen_ejercicio OVERRIDING SYSTEM VALUE VALUES (2, 'https://drive.google.com/uc?export=view&id=13_l7UFNr2aQvjU3_cVa-eZSVgGTQmtC5');
-- Curl barra celta
INSERT INTO public.imagen_ejercicio OVERRIDING SYSTEM VALUE VALUES (3, 'https://drive.google.com/uc?export=view&id=1aEHx49Tnt87TCXyfwIxiEvRVH0rM5I-6');
-- Curl supino 
INSERT INTO public.imagen_ejercicio OVERRIDING SYSTEM VALUE VALUES (4, 'https://drive.google.com/uc?export=view&id=1repu2txqmAz37YmN08khbuaXVzbLxg_E');
-- Tricep
INSERT INTO public.imagen_ejercicio OVERRIDING SYSTEM VALUE VALUES (5, 'https://drive.google.com/uc?export=view&id=1tP1aBWCYnrScfilp-J3JZydvkJ7EB0xB');
-- Rompecocos
INSERT INTO public.imagen_ejercicio OVERRIDING SYSTEM VALUE VALUES (6, 'https://drive.google.com/uc?export=view&id=10bbNkMiPA9vMNkVI0rkYTiWc-AcSQ-9l');
--Copa lazo
INSERT INTO public.imagen_ejercicio OVERRIDING SYSTEM VALUE VALUES (7, 'https://drive.google.com/uc?export=view&id=1ia3s_YcalNh9CacNRlaP1gEMVcZ0tnXL');
--
--Hombros
INSERT INTO public.imagen_ejercicio OVERRIDING SYSTEM VALUE VALUES (8, 'https://drive.google.com/uc?export=view&id=1HaKgO30KQNv2wfsUSZOPxcNKNQSUq-pw');
-- Espalda
INSERT INTO public.imagen_ejercicio OVERRIDING SYSTEM VALUE VALUES (9, 'https://drive.google.com/uc?export=view&id=1ah7hvtjuZ6XB-iHLIzR59HEN4BOlJTGr');
-- Pectorales
INSERT INTO public.imagen_ejercicio OVERRIDING SYSTEM VALUE VALUES (10, 'https://drive.google.com/uc?export=view&id=13XRTCnyi89dbiYyrdpxA4k3rXpJ4ZTsg');
-- Piernas
INSERT INTO public.imagen_ejercicio OVERRIDING SYSTEM VALUE VALUES (11, 'https://drive.google.com/uc?export=view&id=12fic5fNXXUPQ9GRPFr09aA5jPDudaeuz');

-- Ejercicios hombros
--Deltoides posterior
-- Face pull
INSERT INTO public.imagen_ejercicio OVERRIDING SYSTEM VALUE VALUES (12, 'https://drive.google.com/uc?export=view&id=1wwhbWPATLXFkQTpwvqUdwLfNOnzm2JMY');
--Remo barra alta
INSERT INTO public.imagen_ejercicio OVERRIDING SYSTEM VALUE VALUES (13, 'https://drive.google.com/uc?export=view&id=13dVnSh2RlsqWZwofMTlQnyN16Rvr-H5P');

-- Deltoides anterior
-- Press militar barra
INSERT INTO public.imagen_ejercicio OVERRIDING SYSTEM VALUE VALUES (14, 'https://drive.google.com/uc?export=view&id=18mZIOnqFcA0oWukafsenZbhoOC4qoLpK');
--Press militar mancuerna
INSERT INTO public.imagen_ejercicio OVERRIDING SYSTEM VALUE VALUES (15, 'https://drive.google.com/uc?export=view&id=1BZnH0JkTTIQq8XekD6sAQN6YTSM64mwA');

-- Deltoides lateral
-- Elevaciones frontal
INSERT INTO public.imagen_ejercicio OVERRIDING SYSTEM VALUE VALUES (16, 'https://drive.google.com/uc?export=view&id=1jR9yjRAatezrUhxXn7b-8jj2bPO1HWK0');
--Vuelos
INSERT INTO public.imagen_ejercicio OVERRIDING SYSTEM VALUE VALUES (17, 'https://drive.google.com/uc?export=view&id=1xd7u9rGHhslE9AsC8HBKIiphBl-LNhkX');


--
-- TOC entry 3536 (class 0 OID 25182)
-- Dependencies: 223
-- Data for Name: ingrediente; Type: TABLE DATA; Schema: public; Owner: kenkougym
--

INSERT INTO public.ingrediente OVERRIDING SYSTEM VALUE VALUES (1, 'Pan integral', 69, 2.72, 12.91, 1.9, 1.1, 8, 8, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.ingrediente OVERRIDING SYSTEM VALUE VALUES (2, 'Claras de Huevo', 141, 12, 0.75, 0, 9.7, 10, 10, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.ingrediente OVERRIDING SYSTEM VALUE VALUES (3, 'Canela', 18, 0.26, 5.43, 3.7, 0.22, 1, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.ingrediente OVERRIDING SYSTEM VALUE VALUES (4, 'Stevia', 4, 0, 1, 0, 0, 7, 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.ingrediente OVERRIDING SYSTEM VALUE VALUES (5, 'Extracto de vainilla', 12, 0, 0.53, 0, 0, 14, 14, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.ingrediente OVERRIDING SYSTEM VALUE VALUES (6, 'Fresa', 32, 0.67, 7.68, 2, 0.3, 2, 2, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.ingrediente OVERRIDING SYSTEM VALUE VALUES (7, 'Jarabe bajo en calorias', 15, 0, 1, 0, 0, 7, 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.ingrediente OVERRIDING SYSTEM VALUE VALUES (8, 'Polvo de Goma Guar', 5, 0, 1, 1, 0, 7, 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.ingrediente OVERRIDING SYSTEM VALUE VALUES (9, 'Pechuga de pollo', 975, 147.5, 0, 0, 38.6, 5, 5, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.ingrediente OVERRIDING SYSTEM VALUE VALUES (10, 'Gravy', 25, 1.7, 5, 0, 0, 14, 14, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.ingrediente OVERRIDING SYSTEM VALUE VALUES (11, 'Tomate', 18, 0.8, 3.9, 1.2, 0.2, 1, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.ingrediente OVERRIDING SYSTEM VALUE VALUES (12, 'Mayonesa', 49, 0.12, 1.2, 0, 5, 14, 14, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.ingrediente OVERRIDING SYSTEM VALUE VALUES (13, 'Carne magra de res', 135, 21.91, 0, 0, 4.62, 5, 5, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.ingrediente OVERRIDING SYSTEM VALUE VALUES (14, 'Salsa de tomate', 15, 0.26, 3.76, 0, 0.06, 14, 14, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.ingrediente OVERRIDING SYSTEM VALUE VALUES (15, 'Fideos', 210, 7.22, 40, 1.9, 3.3, 8, 8, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.ingrediente OVERRIDING SYSTEM VALUE VALUES (16, 'Brocoli', 31, 2.57, 6.0, 2.4, 0.34, 1, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.ingrediente OVERRIDING SYSTEM VALUE VALUES (17, 'Crema Light ', 30, 0.5, 1, 0, 2.6, 4, 4, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.ingrediente OVERRIDING SYSTEM VALUE VALUES (18, 'Fetuccini', 220, 8, 42.95, 2.5, 1.29, 8, 8, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.ingrediente OVERRIDING SYSTEM VALUE VALUES (19, 'Queso Bajo en calorias', 173, 24.5, 1.91, 0, 7, 4, 4, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.ingrediente OVERRIDING SYSTEM VALUE VALUES (20, 'Salsa de pizza light', 15, 0.2, 3.7, 0, 0.06, 14, 14, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.ingrediente OVERRIDING SYSTEM VALUE VALUES (21, 'Tortilla integral', 122, 3.3, 21, 2.8, 2.9, 8, 8, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.ingrediente OVERRIDING SYSTEM VALUE VALUES (22, 'Queso Cottage', 72, 12, 2.72, 0, 1, 4, 4, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.ingrediente OVERRIDING SYSTEM VALUE VALUES (23, 'Leche de almendras', 40, 1.51, 1.4, 0.8, 3.58, 4, 4, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.ingrediente OVERRIDING SYSTEM VALUE VALUES (24, 'Gelatina baja en calorias', 10, 0.82, 4.13, 0, 0, 11, 11, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);


--
-- TOC entry 3538 (class 0 OID 25194)
-- Dependencies: 225
-- Data for Name: ingredientexreceta; Type: TABLE DATA; Schema: public; Owner: kenkougym
--

INSERT INTO public.ingredientexreceta VALUES (1, 1, 50);
INSERT INTO public.ingredientexreceta VALUES (2, 1, 50);
INSERT INTO public.ingredientexreceta VALUES (3, 1, 50);
INSERT INTO public.ingredientexreceta VALUES (4, 1, 50);
INSERT INTO public.ingredientexreceta VALUES (5, 1, 50);
INSERT INTO public.ingredientexreceta VALUES (6, 1, 50);
INSERT INTO public.ingredientexreceta VALUES (7, 1, 50);
INSERT INTO public.ingredientexreceta VALUES (1, 2, 50);
INSERT INTO public.ingredientexreceta VALUES (2, 2, 50);
INSERT INTO public.ingredientexreceta VALUES (3, 2, 50);
INSERT INTO public.ingredientexreceta VALUES (4, 2, 50);
INSERT INTO public.ingredientexreceta VALUES (5, 2, 50);
INSERT INTO public.ingredientexreceta VALUES (6, 2, 50);
INSERT INTO public.ingredientexreceta VALUES (7, 2, 50);
INSERT INTO public.ingredientexreceta VALUES (8, 2, 50);
INSERT INTO public.ingredientexreceta VALUES (1, 3, 50);
INSERT INTO public.ingredientexreceta VALUES (9, 3, 50);
INSERT INTO public.ingredientexreceta VALUES (10, 3, 50);
INSERT INTO public.ingredientexreceta VALUES (13, 4, 50);
INSERT INTO public.ingredientexreceta VALUES (10, 4, 50);
INSERT INTO public.ingredientexreceta VALUES (12, 4, 50);
INSERT INTO public.ingredientexreceta VALUES (13, 5, 50);
INSERT INTO public.ingredientexreceta VALUES (14, 5, 50);
INSERT INTO public.ingredientexreceta VALUES (15, 5, 50);
INSERT INTO public.ingredientexreceta VALUES (9, 6, 50);
INSERT INTO public.ingredientexreceta VALUES (16, 6, 50);
INSERT INTO public.ingredientexreceta VALUES (17, 6, 50);
INSERT INTO public.ingredientexreceta VALUES (18, 6, 50);
INSERT INTO public.ingredientexreceta VALUES (19, 7, 50);
INSERT INTO public.ingredientexreceta VALUES (20, 7, 50);
INSERT INTO public.ingredientexreceta VALUES (21, 7, 50);
INSERT INTO public.ingredientexreceta VALUES (22, 8, 50);
INSERT INTO public.ingredientexreceta VALUES (23, 8, 50);
INSERT INTO public.ingredientexreceta VALUES (8, 8, 50);
INSERT INTO public.ingredientexreceta VALUES (22, 9, 50);
INSERT INTO public.ingredientexreceta VALUES (23, 9, 50);
INSERT INTO public.ingredientexreceta VALUES (8, 9, 50);


--
-- TOC entry 3539 (class 0 OID 25199)
-- Dependencies: 226
-- Data for Name: kenkou_role; Type: TABLE DATA; Schema: public; Owner: kenkougym
--

INSERT INTO public.kenkou_role VALUES ('ROLE_ADMIN', 'User administrator');
INSERT INTO public.kenkou_role VALUES ('ROLE_USER', 'User');


--
-- TOC entry 3540 (class 0 OID 25202)
-- Dependencies: 227
-- Data for Name: kenkou_user; Type: TABLE DATA; Schema: public; Owner: kenkougym
--

INSERT INTO public.kenkou_user VALUES ('00082318', '00082318@uca.edu.sv', 'Luis', 'Calderon', '$2a$12$psRd3h4EdFEO.b9QwYiRveTsxq4jrd1zFVTQNOkIG5Hx8i3LdPyE.', true, false, '2023-02-21', NULL, 168, 'M');


--
-- TOC entry 3541 (class 0 OID 25210)
-- Dependencies: 228
-- Data for Name: musculo; Type: TABLE DATA; Schema: public; Owner: kenkougym
--

INSERT INTO public.musculo OVERRIDING SYSTEM VALUE VALUES (1, 'Bíceps');
INSERT INTO public.musculo OVERRIDING SYSTEM VALUE VALUES (2, 'Tríceps');
INSERT INTO public.musculo OVERRIDING SYSTEM VALUE VALUES (3, 'Hombros');
INSERT INTO public.musculo OVERRIDING SYSTEM VALUE VALUES (4, 'Glúteos');
INSERT INTO public.musculo OVERRIDING SYSTEM VALUE VALUES (5, 'Abdominales');
INSERT INTO public.musculo OVERRIDING SYSTEM VALUE VALUES (6, 'Pectorales');
INSERT INTO public.musculo OVERRIDING SYSTEM VALUE VALUES (7, 'Espalda');
INSERT INTO public.musculo OVERRIDING SYSTEM VALUE VALUES (8, 'Cuadríceps');
INSERT INTO public.musculo OVERRIDING SYSTEM VALUE VALUES (9, 'Antebrazos');
INSERT INTO public.musculo OVERRIDING SYSTEM VALUE VALUES (10, 'Pantorrillas');
INSERT INTO public.musculo OVERRIDING SYSTEM VALUE VALUES (11, 'Deltoides Anterior');
INSERT INTO public.musculo OVERRIDING SYSTEM VALUE VALUES (12, 'Deltoides Lateral');
INSERT INTO public.musculo OVERRIDING SYSTEM VALUE VALUES (13, 'Deltoides Posterior');


--
-- TOC entry 3543 (class 0 OID 25216)
-- Dependencies: 230
-- Data for Name: objetivo; Type: TABLE DATA; Schema: public; Owner: kenkougym
--

INSERT INTO public.objetivo OVERRIDING SYSTEM VALUE VALUES (1, 'BAJAR DE PESO');
INSERT INTO public.objetivo OVERRIDING SYSTEM VALUE VALUES (2, 'AUMENTAR MASA MUSCULAR');
INSERT INTO public.objetivo OVERRIDING SYSTEM VALUE VALUES (3, 'TONIFICAR');


--
-- TOC entry 3545 (class 0 OID 25222)
-- Dependencies: 232
-- Data for Name: planalimenticio; Type: TABLE DATA; Schema: public; Owner: kenkougym
--

INSERT INTO public.planalimenticio OVERRIDING SYSTEM VALUE VALUES (1, 'Plan A', 1, 1, NULL);


--
-- TOC entry 3547 (class 0 OID 25228)
-- Dependencies: 234
-- Data for Name: planalimenticio_recetas; Type: TABLE DATA; Schema: public; Owner: kenkougym
--



--
-- TOC entry 3548 (class 0 OID 25231)
-- Dependencies: 235
-- Data for Name: planxreceta; Type: TABLE DATA; Schema: public; Owner: kenkougym
--

INSERT INTO public.planxreceta VALUES (4, 1);


--
-- TOC entry 3549 (class 0 OID 25234)
-- Dependencies: 236
-- Data for Name: progreso; Type: TABLE DATA; Schema: public; Owner: kenkougym
--

INSERT INTO public.progreso OVERRIDING SYSTEM VALUE VALUES (1, '00082318', 185, 30, 10, 15, 60, '2022-05-05', 0, 37, 0, 10, 15);
INSERT INTO public.progreso OVERRIDING SYSTEM VALUE VALUES (2, '00082318', 183, 31.2, 11.2, 17, 60, '2022-06-06', 0, 37, 0, 11.2, 17);
INSERT INTO public.progreso OVERRIDING SYSTEM VALUE VALUES (3, '00082318', 184, 31.7, 12, 17.2, 58, '2022-07-07', 0, 36.8, 0, 12, 17.2);
INSERT INTO public.progreso OVERRIDING SYSTEM VALUE VALUES (4, '00082318', 181, 31.7, 12.5, 17.5, 56, '2022-08-08', 0, 36.8, 0, 12.5, 17.5);
INSERT INTO public.progreso OVERRIDING SYSTEM VALUE VALUES (5, '00082318', 181, 31.7, 12.7, 17.9, 55, '2022-09-09', 0, 36.7, 0, 12.7, 17.9);


--
-- TOC entry 3551 (class 0 OID 25240)
-- Dependencies: 238
-- Data for Name: receta; Type: TABLE DATA; Schema: public; Owner: kenkougym
--

INSERT INTO public.receta OVERRIDING SYSTEM VALUE VALUES (1, 'Tostadas Francesas Anabolicas', 'https://youtu.be/06O5vtVQEOE', '
<h3>Preparación</h3>
<ol>
    <li> En un deposito agregar 2 huevos, una cucharada de canela y una cucharada de extracto de vainilla y mezclarlo bien. \n</li>
    <li> Preparar el sarten en fuego medio y aplicar aceite (de preferencia mediante spray)\n</li>
    <li> Mojar las rebanadas de pan en la mezcla y poner cada uno de ellas en el sarten, 3 a 4 minutos por lado. \n</p></li>
</ol>
<p>Ademas, se puede agregar un scoop de tu batido proteico preferido a la mezcla.</p>

<h3> Plato </h3>
<p>Servir estas tostadas en un plato con sus diferentes complementos, en este caso se agregan fresas pero puede agregarse cualquier tipo de fruta y un Jarabe de baja calorías</p>
', 1, 1, NULL, NULL, 1);
INSERT INTO public.receta OVERRIDING SYSTEM VALUE VALUES (2, 'Tostadas Francesas Vegetarianas de Fresa', 'https://youtu.be/06O5vtVQEOE', '
<h3>Preparación</h3>
<ol>
    <li> En una licuadora agregar 2 rebanadas de pan, 2 copas de claras de huevo, 1 cucharada de goma guar en polvo, endulzante, extracto de vainilla y canela. </li>
    <li> Mezclar hasta que tenga una consistencia uniforme. </li>
    <li> Es recomendable degar reposar por 2 a 3 horas la mezcla para mejorar su consistencia pero esto es opcional.</li>
    <li> Poner la sartén a una temperatura media, agregar aceite (de preferencia en spray),Y agregar la mezcla a la sarten, cocinar por 1-2 minutos. Luego agregarle las fresas partidas encima y cocinar el otro lado por uno a dos minutos. </li>
</ol>
<p>Ademas, se puede agregar un scoop de tu batido proteico preferido a la mezcla.</p>

<h3> Plato </h3>
<p>Servir estas tostadas en un plato con sus diferentes complementos, en este caso se agregan fresas pero puede agregarse cualquier tipo de fruta y un Jarabe de baja calorías</p>
', 1, 1, NULL, NULL, 2);
INSERT INTO public.receta OVERRIDING SYSTEM VALUE VALUES (3, 'Hamburguesa de pechuga de pollo', 'https://youtu.be/06O5vtVQEOE', '
<h3>Preparación</h3>

1. Si es de su preferencia se recomienda marinar la pechuga de pollo en la noche con condimientos al gusto. 
2. Poner la sarten a fuego medio y colocarle spray de aceite
3. Agregar la pechuga de pollo y cocinarla hasta que este en punto medio (Esto se puede notar cuando cada lado este dorado o llegue a la temperatura interna  de 74 grados)
4. Poner la salsa en un deposito para calentar en el microondas
5. unir los panes, con vegetales al gusto y opcionalmente mostaza y salsa de tomate ketchup

Nota: Los macros estimados son descontando la cantidad de condimentos utilizados. 

## Plato
Servir en un plato, se puede acompañar con bebida natural al gusto. 
', 1, 2, NULL, NULL, 3);
INSERT INTO public.receta OVERRIDING SYSTEM VALUE VALUES (4, 'Ensalada proteica balanceada', 'https://youtu.be/06O5vtVQEOE', '
<h3>Preparación</h3>
<ol>
<li> cortar el tomate en rebanadas</li>
<li> Preparar la sarten a calidad media colocar aceite en spray y cocinar la pechuga hasta termino medio</li>
<li> Agregar 25g de pechuga.</li>
<li> Agregar una cucharada de mayonesa light</li>
<li> Opcional se pueden agregar cebolla al gusto. </li>
</ol>


', 1, 2, NULL, NULL, 4);
INSERT INTO public.receta OVERRIDING SYSTEM VALUE VALUES (5, 'Fideos con carne magra', 'https://youtu.be/06O5vtVQEOE', '
<h3>Preparación</h3>

<ol>
<li> Calentar 4 cuartos de agua en fuego alto. Cuando el agua empiece a hervir debemos reducir el fuego a fuego bajo.ejercicio </li>
<li> Agregar un paquete de pasta por persona, utilizar las instrucciones del empaque y al terminar se debe filtrar y poner a un lado</li>
<li> En otro sarten se debe de poner a fuego medio y agregar aceite. </li>
<li> Agregar Carne magra de res y cocinarlo hasta que ambos lados se encuentren bien cocinado. </li>
<li> Calentar la salsa de tomate, para esto se puede utilizar el microondas.</li>
</ol>

<h3>Plato</h3>
<p>Servir con pasta, carne y salsa juntos. </p>


', 1, 3, NULL, NULL, 5);
INSERT INTO public.receta OVERRIDING SYSTEM VALUE VALUES (6, 'Fettuccini de pechuga de pollo', 'https://youtu.be/06O5vtVQEOE', '
<h3> Preparación</h3>

<ol>
	<li> Calentar 4 cuartos de agua en fuego alto. Cuando el agua empiece a hervir debvemos reducir el fuego a fuego bajo.ejercicio </li>
	<li> Agregar un paquete de fideos fettucini por persona, utilizar las instrucciones del empaque y al terminar se debe filtrar y poner a un lado </li>
	<li> En otro sarten se debe de poner a fuego medio y agregar aceite. </li>
	<li> Agregar pechuga en tiras y cocinarlo hasta que ambos lados se encuentren bien cocinado.</li>
	<li> Agregar chile verde al gusto para agregar sabor y color al plato. </li> 
	<li> Hervir brocoli en agua por 5 minutos. </li>
	<li> Se puede agregar una chucharada de crema baja en calorías para mehjorrar su cremosidad </li> 
</ol>

<h3> Plato </h3>

<p>Servir con Fetuccini, Agregar carne de res y chile verde. En otro plato se puenden poner los brocolis si es encesario</p> 


', 1, 3, NULL, NULL, 6);
INSERT INTO public.receta OVERRIDING SYSTEM VALUE VALUES (7, 'Pizza Proteica', 'https://youtu.be/06O5vtVQEOE', '
<h3> Preparación</h3>

<ol>
	<li> Calentar una sarten en fuego medio para poder saltear cebollas con un poco de aceite</li>
	<li> Al llegar al pundo de caramelizarlas dejarlas en un lado</li>
	<li> En el horno tostar la tortilla baja en calorías de su preferencia por 3 minutos a temperatura media. </li>
	<li> Agregar todos los ingredientes en la tortilla, agregar rebanadas finas de queso</li>
	<li> Luego hornear nuevamente la tortilla por otros tres minutos en la misma temperatura</li> 
	<li> (Opcional) se puede agregar cualquier topping preferido </li> 
</ol>

<p><u>Nota: Valores nutriciales no incluyen toppings extras agregados.</u></p>

 


', 1, 3, NULL, NULL, 7);
INSERT INTO public.receta OVERRIDING SYSTEM VALUE VALUES (8, 'Buddin proteico de queso con chocolate', 'https://youtu.be/06O5vtVQEOE', '
<h3> Preparación</h3>

<ol>
	<li>Poner 2 tazas de queso cottage, 4.5 tazas de leche de almednras, 2 cucharadas de gelatina, una cucharada de guar, Endulzante al gusto</li>
	<li> Agregar todos los ingredientes a una licuadora y licuiar por tres minutos a velocidad media-alta</li>
	<li> (Opcional)Agregar Polvo de batido de proteina basado en caseina de preferencia</li>
	<li> Colocar la mezcla en un deposito y colocarla en un regrigerador por 10 minutos </li>
	<li> Se puede agregar cualquier tipo de topping al gusto</li> 
</ol>

<p><u>Nota: Valores nutriciales no incluyen toppings extras agregados.</u></p>

 


', 1, 4, NULL, NULL, 8);
INSERT INTO public.receta OVERRIDING SYSTEM VALUE VALUES (9, 'Buddin proteico de queso con chocolate', 'https://youtu.be/06O5vtVQEOE', '
<h3> Preparación</h3>

<ol>
	<li>Poner 2 tazas de queso cottage, 4.5 tazas de leche de almednras, 2 cucharadas de gelatina, una cucharada de guar, Endulzante al gusto</li>
	<li> Agregar todos los ingredientes a una licuadora y licuiar por tres minutos a velocidad media-alta</li>
	<li> (Opcional)Agregar Polvo de batido de proteina basado en caseina de preferencia</li>
	<li> Colocar la mezcla en un deposito y colocarla en un regrigerador por 10 minutos </li>
	<li> Se puede agregar cualquier tipo de topping al gusto</li> 
</ol>

<p><u>Nota: Valores nutriciales no incluyen toppings extras agregados.</u></p>

 


', 1, 4, NULL, NULL, 9);

--
-- TOC entry 3553 (class 0 OID 25246)
-- Dependencies: 240
-- Data for Name: rutina; Type: TABLE DATA; Schema: public; Owner: kenkougym
--
INSERT INTO public.rutina OVERRIDING SYSTEM VALUE VALUES (1, 'Rutina de Brazos', 'https://drive.google.com/uc?export=view&id=1MNKjIARxRDGutPiPh9cm7q6Gjsmg0E0F', 'Difícil', 'Tonificar', 'Bíceps', '/searchRutine');
INSERT INTO public.rutina OVERRIDING SYSTEM VALUE VALUES (2, 'Rutina de Hombros', 'https://drive.google.com/uc?export=view&id=1repu2txqmAz37YmN08khbuaXVzbLxg_E', 'Media', 'Tonificar', 'Hombros', '/searchRutine2');

--
-- TOC entry 3555 (class 0 OID 25252)
-- Dependencies: 242
-- Data for Name: tablanutricional; Type: TABLE DATA; Schema: public; Owner: kenkougym
--

INSERT INTO public.tablanutricional OVERRIDING SYSTEM VALUE VALUES (1, 250, 19, 36, 2.5, 3);
INSERT INTO public.tablanutricional OVERRIDING SYSTEM VALUE VALUES (2, 310, 32, 39, 4, 3);
INSERT INTO public.tablanutricional OVERRIDING SYSTEM VALUE VALUES (3, 660, 76, 52, 12, 14);
INSERT INTO public.tablanutricional OVERRIDING SYSTEM VALUE VALUES (4, 440, 45, 38, 5, 12);
INSERT INTO public.tablanutricional OVERRIDING SYSTEM VALUE VALUES (5, 320, 24, 43, 7, 6);
INSERT INTO public.tablanutricional OVERRIDING SYSTEM VALUE VALUES (6, 260, 25, 26, 12, 5);
INSERT INTO public.tablanutricional OVERRIDING SYSTEM VALUE VALUES (7, 625, 41, 49, 10, 17);
INSERT INTO public.tablanutricional OVERRIDING SYSTEM VALUE VALUES (8, 99, 8, 14, 2, 1);
INSERT INTO public.tablanutricional OVERRIDING SYSTEM VALUE VALUES (9, 103, 7, 12, 0, 1);


--
-- TOC entry 3557 (class 0 OID 25258)
-- Dependencies: 244
-- Data for Name: tiempocomida; Type: TABLE DATA; Schema: public; Owner: kenkougym
--

INSERT INTO public.tiempocomida OVERRIDING SYSTEM VALUE VALUES (1, 'DESAYUNO');
INSERT INTO public.tiempocomida OVERRIDING SYSTEM VALUE VALUES (2, 'ALMUERZO');
INSERT INTO public.tiempocomida OVERRIDING SYSTEM VALUE VALUES (3, 'MERIENDA');
INSERT INTO public.tiempocomida OVERRIDING SYSTEM VALUE VALUES (4, 'CENA');


--
-- TOC entry 3559 (class 0 OID 25264)
-- Dependencies: 246
-- Data for Name: tipo_rutina; Type: TABLE DATA; Schema: public; Owner: kenkougym
--

INSERT INTO public.tipo_rutina OVERRIDING SYSTEM VALUE VALUES (1, 'Bajar de Peso');
INSERT INTO public.tipo_rutina OVERRIDING SYSTEM VALUE VALUES (2, 'Aumento masa muscular');
INSERT INTO public.tipo_rutina OVERRIDING SYSTEM VALUE VALUES (3, 'Tonificar');


--
-- TOC entry 3561 (class 0 OID 25270)
-- Dependencies: 248
-- Data for Name: user_role; Type: TABLE DATA; Schema: public; Owner: kenkougym
--

INSERT INTO public.user_role VALUES ('00082318', 'ROLE_ADMIN');


--
-- TOC entry 3562 (class 0 OID 25273)
-- Dependencies: 249
-- Data for Name: userxdieta; Type: TABLE DATA; Schema: public; Owner: kenkougym
--



--
-- TOC entry 3563 (class 0 OID 25278)
-- Dependencies: 250
-- Data for Name: userxrutina; Type: TABLE DATA; Schema: public; Owner: kenkougym
--



--
-- TOC entry 3564 (class 0 OID 25501)
-- Dependencies: 251
-- Data for Name: usuario_objetivo; Type: TABLE DATA; Schema: public; Owner: kenkougym
--

INSERT INTO public.usuario_objetivo VALUES ('00082318', 1, false);
INSERT INTO public.usuario_objetivo VALUES ('00082318', 2, true);
INSERT INTO public.usuario_objetivo VALUES ('00082318', 3, false);


--
-- TOC entry 3580 (class 0 OID 0)
-- Dependencies: 210
-- Name: categoriaingrediente_id_seq; Type: SEQUENCE SET; Schema: public; Owner: kenkougym
--

SELECT pg_catalog.setval('public.categoriaingrediente_id_seq', 28, true);


--
-- TOC entry 3581 (class 0 OID 0)
-- Dependencies: 212
-- Name: ejercicio_id_seq; Type: SEQUENCE SET; Schema: public; Owner: kenkougym
--

SELECT pg_catalog.setval('public.ejercicio_id_seq', 13, true);


--
-- TOC entry 3582 (class 0 OID 0)
-- Dependencies: 214
-- Name: ejercicio_x_musculo_id_seq; Type: SEQUENCE SET; Schema: public; Owner: kenkougym
--

SELECT pg_catalog.setval('public.ejercicio_x_musculo_id_seq', 1, false);


--
-- TOC entry 3583 (class 0 OID 0)
-- Dependencies: 217
-- Name: estiloalimenticio_id_seq; Type: SEQUENCE SET; Schema: public; Owner: kenkougym
--

SELECT pg_catalog.setval('public.estiloalimenticio_id_seq', 3, true);


--
-- TOC entry 3584 (class 0 OID 0)
-- Dependencies: 219
-- Name: fotografia_id_seq; Type: SEQUENCE SET; Schema: public; Owner: kenkougym
--

SELECT pg_catalog.setval('public.fotografia_id_seq', 9, true);


--
-- TOC entry 3585 (class 0 OID 0)
-- Dependencies: 222
-- Name: imagen_ejercicio_id_seq; Type: SEQUENCE SET; Schema: public; Owner: kenkougym
--

SELECT pg_catalog.setval('public.imagen_ejercicio_id_seq', 1, false);


--
-- TOC entry 3586 (class 0 OID 0)
-- Dependencies: 224
-- Name: ingrediente_id_seq; Type: SEQUENCE SET; Schema: public; Owner: kenkougym
--

SELECT pg_catalog.setval('public.ingrediente_id_seq', 24, true);


--
-- TOC entry 3587 (class 0 OID 0)
-- Dependencies: 229
-- Name: musculo_id_seq; Type: SEQUENCE SET; Schema: public; Owner: kenkougym
--

SELECT pg_catalog.setval('public.musculo_id_seq', 12, true);


--
-- TOC entry 3588 (class 0 OID 0)
-- Dependencies: 231
-- Name: objetivo_id_seq; Type: SEQUENCE SET; Schema: public; Owner: kenkougym
--

SELECT pg_catalog.setval('public.objetivo_id_seq', 3, true);


--
-- TOC entry 3589 (class 0 OID 0)
-- Dependencies: 233
-- Name: planalimenticio_id_seq; Type: SEQUENCE SET; Schema: public; Owner: kenkougym
--

SELECT pg_catalog.setval('public.planalimenticio_id_seq', 1, true);


--
-- TOC entry 3590 (class 0 OID 0)
-- Dependencies: 237
-- Name: progreso_id_progreso_seq; Type: SEQUENCE SET; Schema: public; Owner: kenkougym
--

SELECT pg_catalog.setval('public.progreso_id_progreso_seq', 6, true);


--
-- TOC entry 3591 (class 0 OID 0)
-- Dependencies: 239
-- Name: receta_id_seq; Type: SEQUENCE SET; Schema: public; Owner: kenkougym
--

SELECT pg_catalog.setval('public.receta_id_seq', 9, true);


--
-- TOC entry 3592 (class 0 OID 0)
-- Dependencies: 241
-- Name: rutina_id_seq; Type: SEQUENCE SET; Schema: public; Owner: kenkougym
--

SELECT pg_catalog.setval('public.rutina_id_seq', 1, false);


--
-- TOC entry 3593 (class 0 OID 0)
-- Dependencies: 243
-- Name: tablanutricional_id_seq; Type: SEQUENCE SET; Schema: public; Owner: kenkougym
--

SELECT pg_catalog.setval('public.tablanutricional_id_seq', 9, true);


--
-- TOC entry 3594 (class 0 OID 0)
-- Dependencies: 245
-- Name: tiempocomida_id_seq; Type: SEQUENCE SET; Schema: public; Owner: kenkougym
--

SELECT pg_catalog.setval('public.tiempocomida_id_seq', 4, true);


--
-- TOC entry 3595 (class 0 OID 0)
-- Dependencies: 247
-- Name: tipo_rutina_id_seq; Type: SEQUENCE SET; Schema: public; Owner: kenkougym
--

SELECT pg_catalog.setval('public.tipo_rutina_id_seq', 3, true);


--
-- TOC entry 3300 (class 2606 OID 25284)
-- Name: categoriaingrediente categoriaingrediente_pk; Type: CONSTRAINT; Schema: public; Owner: kenkougym
--

ALTER TABLE ONLY public.categoriaingrediente
    ADD CONSTRAINT categoriaingrediente_pk PRIMARY KEY (id);


--
-- TOC entry 3302 (class 2606 OID 25286)
-- Name: ejercicio ejercicio_pkey; Type: CONSTRAINT; Schema: public; Owner: kenkougym
--

ALTER TABLE ONLY public.ejercicio
    ADD CONSTRAINT ejercicio_pkey PRIMARY KEY (id);


--
-- TOC entry 3304 (class 2606 OID 25288)
-- Name: ejercicio_x_musculo ejercicio_x_musculo_pkey; Type: CONSTRAINT; Schema: public; Owner: kenkougym
--

ALTER TABLE ONLY public.ejercicio_x_musculo
    ADD CONSTRAINT ejercicio_x_musculo_pkey PRIMARY KEY (id);


--
-- TOC entry 3306 (class 2606 OID 25290)
-- Name: ejercicio_x_rutina ejercicio_x_rutina_pkey; Type: CONSTRAINT; Schema: public; Owner: kenkougym
--

ALTER TABLE ONLY public.ejercicio_x_rutina
    ADD CONSTRAINT ejercicio_x_rutina_pkey PRIMARY KEY (id_rutina, idemusculo);


--
-- TOC entry 3308 (class 2606 OID 25292)
-- Name: estiloalimenticio estiloalimenticio_pk; Type: CONSTRAINT; Schema: public; Owner: kenkougym
--

ALTER TABLE ONLY public.estiloalimenticio
    ADD CONSTRAINT estiloalimenticio_pk PRIMARY KEY (id);


--
-- TOC entry 3310 (class 2606 OID 25294)
-- Name: fotografia fotografia_pk; Type: CONSTRAINT; Schema: public; Owner: kenkougym
--

ALTER TABLE ONLY public.fotografia
    ADD CONSTRAINT fotografia_pk PRIMARY KEY (id);


--
-- TOC entry 3312 (class 2606 OID 25296)
-- Name: fotografiaxreceta fotografiaxreceta_pk; Type: CONSTRAINT; Schema: public; Owner: kenkougym
--

ALTER TABLE ONLY public.fotografiaxreceta
    ADD CONSTRAINT fotografiaxreceta_pk PRIMARY KEY (id_receta, id_fotografia);


--
-- TOC entry 3314 (class 2606 OID 25298)
-- Name: imagen_ejercicio imagen_ejercicio_pkey; Type: CONSTRAINT; Schema: public; Owner: kenkougym
--

ALTER TABLE ONLY public.imagen_ejercicio
    ADD CONSTRAINT imagen_ejercicio_pkey PRIMARY KEY (id);


--
-- TOC entry 3316 (class 2606 OID 25300)
-- Name: ingrediente ingrediente_pk; Type: CONSTRAINT; Schema: public; Owner: kenkougym
--

ALTER TABLE ONLY public.ingrediente
    ADD CONSTRAINT ingrediente_pk PRIMARY KEY (id);


--
-- TOC entry 3318 (class 2606 OID 25302)
-- Name: ingredientexreceta ingredientexreceta_pkey; Type: CONSTRAINT; Schema: public; Owner: kenkougym
--

ALTER TABLE ONLY public.ingredientexreceta
    ADD CONSTRAINT ingredientexreceta_pkey PRIMARY KEY (id_ingrediente, id_receta);


--
-- TOC entry 3320 (class 2606 OID 25304)
-- Name: kenkou_role kenkou_role_pkey; Type: CONSTRAINT; Schema: public; Owner: kenkougym
--

ALTER TABLE ONLY public.kenkou_role
    ADD CONSTRAINT kenkou_role_pkey PRIMARY KEY (role_code);


--
-- TOC entry 3322 (class 2606 OID 25306)
-- Name: kenkou_user kenkou_user_pkey; Type: CONSTRAINT; Schema: public; Owner: kenkougym
--

ALTER TABLE ONLY public.kenkou_user
    ADD CONSTRAINT kenkou_user_pkey PRIMARY KEY (username);


--
-- TOC entry 3324 (class 2606 OID 25308)
-- Name: musculo musculo_pkey; Type: CONSTRAINT; Schema: public; Owner: kenkougym
--

ALTER TABLE ONLY public.musculo
    ADD CONSTRAINT musculo_pkey PRIMARY KEY (id);


--
-- TOC entry 3326 (class 2606 OID 25310)
-- Name: objetivo objetivo_pk; Type: CONSTRAINT; Schema: public; Owner: kenkougym
--

ALTER TABLE ONLY public.objetivo
    ADD CONSTRAINT objetivo_pk PRIMARY KEY (id);


--
-- TOC entry 3328 (class 2606 OID 25312)
-- Name: planalimenticio planalimenticio_pk; Type: CONSTRAINT; Schema: public; Owner: kenkougym
--

ALTER TABLE ONLY public.planalimenticio
    ADD CONSTRAINT planalimenticio_pk PRIMARY KEY (id);


--
-- TOC entry 3330 (class 2606 OID 25314)
-- Name: planxreceta planxreceta_pkey; Type: CONSTRAINT; Schema: public; Owner: kenkougym
--

ALTER TABLE ONLY public.planxreceta
    ADD CONSTRAINT planxreceta_pkey PRIMARY KEY (id_receta, id_plan);


--
-- TOC entry 3332 (class 2606 OID 25531)
-- Name: progreso progreso_pk; Type: CONSTRAINT; Schema: public; Owner: kenkougym
--

ALTER TABLE ONLY public.progreso
    ADD CONSTRAINT progreso_pk PRIMARY KEY (id_progreso);


--
-- TOC entry 3334 (class 2606 OID 25316)
-- Name: receta receta_pkey; Type: CONSTRAINT; Schema: public; Owner: kenkougym
--

ALTER TABLE ONLY public.receta
    ADD CONSTRAINT receta_pkey PRIMARY KEY (id);


--
-- TOC entry 3336 (class 2606 OID 25318)
-- Name: rutina rutina_pkey; Type: CONSTRAINT; Schema: public; Owner: kenkougym
--

ALTER TABLE ONLY public.rutina
    ADD CONSTRAINT rutina_pkey PRIMARY KEY (id);


--
-- TOC entry 3338 (class 2606 OID 25320)
-- Name: tablanutricional tablanutricional_pkey; Type: CONSTRAINT; Schema: public; Owner: kenkougym
--

ALTER TABLE ONLY public.tablanutricional
    ADD CONSTRAINT tablanutricional_pkey PRIMARY KEY (id);


--
-- TOC entry 3340 (class 2606 OID 25322)
-- Name: tiempocomida tiempocomida_pkey; Type: CONSTRAINT; Schema: public; Owner: kenkougym
--

ALTER TABLE ONLY public.tiempocomida
    ADD CONSTRAINT tiempocomida_pkey PRIMARY KEY (id);


--
-- TOC entry 3342 (class 2606 OID 25324)
-- Name: tipo_rutina tipo_rutina_pkey; Type: CONSTRAINT; Schema: public; Owner: kenkougym
--

ALTER TABLE ONLY public.tipo_rutina
    ADD CONSTRAINT tipo_rutina_pkey PRIMARY KEY (id);


--
-- TOC entry 3344 (class 2606 OID 25326)
-- Name: user_role user_role_pkey; Type: CONSTRAINT; Schema: public; Owner: kenkougym
--

ALTER TABLE ONLY public.user_role
    ADD CONSTRAINT user_role_pkey PRIMARY KEY (username, role_code);


--
-- TOC entry 3346 (class 2606 OID 25515)
-- Name: usuario_objetivo usuario_objetivo_pk; Type: CONSTRAINT; Schema: public; Owner: kenkougym
--

ALTER TABLE ONLY public.usuario_objetivo
    ADD CONSTRAINT usuario_objetivo_pk PRIMARY KEY (username, objetivo_id);


--
-- TOC entry 3377 (class 2606 OID 25327)
-- Name: userxdieta dietaxusername_fkey; Type: FK CONSTRAINT; Schema: public; Owner: kenkougym
--

ALTER TABLE ONLY public.userxdieta
    ADD CONSTRAINT dietaxusername_fkey FOREIGN KEY (username) REFERENCES public.kenkou_user(username);


--
-- TOC entry 3347 (class 2606 OID 25332)
-- Name: ejercicio_x_musculo ejercicio_x_musculo_ejercicio_fkey; Type: FK CONSTRAINT; Schema: public; Owner: kenkougym
--

ALTER TABLE ONLY public.ejercicio_x_musculo
    ADD CONSTRAINT ejercicio_x_musculo_ejercicio_fkey FOREIGN KEY (idejercicio) REFERENCES public.ejercicio(id);


--
-- TOC entry 3348 (class 2606 OID 25337)
-- Name: ejercicio_x_musculo ejercicio_x_musculo_imagen_fkey; Type: FK CONSTRAINT; Schema: public; Owner: kenkougym
--

ALTER TABLE ONLY public.ejercicio_x_musculo
    ADD CONSTRAINT ejercicio_x_musculo_imagen_fkey FOREIGN KEY (idimagen) REFERENCES public.imagen_ejercicio(id);


--
-- TOC entry 3349 (class 2606 OID 25342)
-- Name: ejercicio_x_musculo ejercicio_x_musculo_musculo_fkey; Type: FK CONSTRAINT; Schema: public; Owner: kenkougym
--

ALTER TABLE ONLY public.ejercicio_x_musculo
    ADD CONSTRAINT ejercicio_x_musculo_musculo_fkey FOREIGN KEY (idmusculo) REFERENCES public.musculo(id);


--
-- TOC entry 3351 (class 2606 OID 25472)
-- Name: ejercicio_x_musculo ejercicio_x_musculo_trutina_fkey; Type: FK CONSTRAINT; Schema: public; Owner: kenkougym
--

ALTER TABLE ONLY public.ejercicio_x_musculo
    ADD CONSTRAINT ejercicio_x_musculo_trutina_fkey FOREIGN KEY (idtrutina) REFERENCES public.tipo_rutina(id);


--
-- TOC entry 3352 (class 2606 OID 25347)
-- Name: ejercicio_x_rutina ejercicio_x_rutina_emusculo_fkey; Type: FK CONSTRAINT; Schema: public; Owner: kenkougym
--

ALTER TABLE ONLY public.ejercicio_x_rutina
    ADD CONSTRAINT ejercicio_x_rutina_emusculo_fkey FOREIGN KEY (idemusculo) REFERENCES public.ejercicio_x_musculo(id);


--
-- TOC entry 3353 (class 2606 OID 25352)
-- Name: ejercicio_x_rutina ejercicio_x_rutina_rutina_fkey; Type: FK CONSTRAINT; Schema: public; Owner: kenkougym
--

ALTER TABLE ONLY public.ejercicio_x_rutina
    ADD CONSTRAINT ejercicio_x_rutina_rutina_fkey FOREIGN KEY (id_rutina) REFERENCES public.rutina(id);


--
-- TOC entry 3350 (class 2606 OID 25357)
-- Name: ejercicio_x_musculo fk1f9a0imekuinhgvib42qc7r3i; Type: FK CONSTRAINT; Schema: public; Owner: kenkougym
--

ALTER TABLE ONLY public.ejercicio_x_musculo
    ADD CONSTRAINT fk1f9a0imekuinhgvib42qc7r3i FOREIGN KEY (id) REFERENCES public.ejercicio(id);


--
-- TOC entry 3364 (class 2606 OID 25362)
-- Name: planalimenticio_recetas fk2tcy4cdoyxhsxnrn45irt5tk9; Type: FK CONSTRAINT; Schema: public; Owner: kenkougym
--

ALTER TABLE ONLY public.planalimenticio_recetas
    ADD CONSTRAINT fk2tcy4cdoyxhsxnrn45irt5tk9 FOREIGN KEY (plan_alimenticio_id) REFERENCES public.planalimenticio(id);


--
-- TOC entry 3361 (class 2606 OID 25367)
-- Name: planalimenticio fk4d5tf1d9pa1fg0da4hics1hhu; Type: FK CONSTRAINT; Schema: public; Owner: kenkougym
--

ALTER TABLE ONLY public.planalimenticio
    ADD CONSTRAINT fk4d5tf1d9pa1fg0da4hics1hhu FOREIGN KEY (estilo_alimentacion_id) REFERENCES public.estiloalimenticio(id);


--
-- TOC entry 3357 (class 2606 OID 25372)
-- Name: ingrediente fk54o8bu6etdkc299lx2pl89n3; Type: FK CONSTRAINT; Schema: public; Owner: kenkougym
--

ALTER TABLE ONLY public.ingrediente
    ADD CONSTRAINT fk54o8bu6etdkc299lx2pl89n3 FOREIGN KEY (categoria_id) REFERENCES public.categoriaingrediente(id);


--
-- TOC entry 3365 (class 2606 OID 25377)
-- Name: planalimenticio_recetas fk6ib278gui26ricdraptreqx7w; Type: FK CONSTRAINT; Schema: public; Owner: kenkougym
--

ALTER TABLE ONLY public.planalimenticio_recetas
    ADD CONSTRAINT fk6ib278gui26ricdraptreqx7w FOREIGN KEY (recetas_id) REFERENCES public.receta(id);


--
-- TOC entry 3358 (class 2606 OID 25387)
-- Name: ingrediente fk_categoria; Type: FK CONSTRAINT; Schema: public; Owner: kenkougym
--

ALTER TABLE ONLY public.ingrediente
    ADD CONSTRAINT fk_categoria FOREIGN KEY (categoria) REFERENCES public.categoriaingrediente(id);


--
-- TOC entry 3362 (class 2606 OID 25392)
-- Name: planalimenticio fk_estilo_alimenticio_to_plan_alimenticio; Type: FK CONSTRAINT; Schema: public; Owner: kenkougym
--

ALTER TABLE ONLY public.planalimenticio
    ADD CONSTRAINT fk_estilo_alimenticio_to_plan_alimenticio FOREIGN KEY (estiloalimentacion) REFERENCES public.estiloalimenticio(id);


--
-- TOC entry 3355 (class 2606 OID 25397)
-- Name: fotografiaxreceta fk_fotografia_is_receta; Type: FK CONSTRAINT; Schema: public; Owner: kenkougym
--

ALTER TABLE ONLY public.fotografiaxreceta
    ADD CONSTRAINT fk_fotografia_is_receta FOREIGN KEY (id_fotografia) REFERENCES public.fotografia(id);


--
-- TOC entry 3359 (class 2606 OID 25402)
-- Name: ingredientexreceta fk_ingrediente_is_receta; Type: FK CONSTRAINT; Schema: public; Owner: kenkougym
--

ALTER TABLE ONLY public.ingredientexreceta
    ADD CONSTRAINT fk_ingrediente_is_receta FOREIGN KEY (id_ingrediente) REFERENCES public.ingrediente(id);


--
-- TOC entry 3363 (class 2606 OID 25407)
-- Name: planalimenticio fk_objetivo_to_plan_alimenticio; Type: FK CONSTRAINT; Schema: public; Owner: kenkougym
--

ALTER TABLE ONLY public.planalimenticio
    ADD CONSTRAINT fk_objetivo_to_plan_alimenticio FOREIGN KEY (objetivo) REFERENCES public.objetivo(id);


--
-- TOC entry 3369 (class 2606 OID 25412)
-- Name: receta fk_objetivo_to_receta; Type: FK CONSTRAINT; Schema: public; Owner: kenkougym
--

ALTER TABLE ONLY public.receta
    ADD CONSTRAINT fk_objetivo_to_receta FOREIGN KEY (id_objetivo) REFERENCES public.objetivo(id);


--
-- TOC entry 3366 (class 2606 OID 25417)
-- Name: planxreceta fk_plan_receta_is_plan_alimenticio; Type: FK CONSTRAINT; Schema: public; Owner: kenkougym
--

ALTER TABLE ONLY public.planxreceta
    ADD CONSTRAINT fk_plan_receta_is_plan_alimenticio FOREIGN KEY (id_plan) REFERENCES public.planalimenticio(id);


--
-- TOC entry 3356 (class 2606 OID 25422)
-- Name: fotografiaxreceta fk_receta_is_fotografia; Type: FK CONSTRAINT; Schema: public; Owner: kenkougym
--

ALTER TABLE ONLY public.fotografiaxreceta
    ADD CONSTRAINT fk_receta_is_fotografia FOREIGN KEY (id_receta) REFERENCES public.receta(id);


--
-- TOC entry 3360 (class 2606 OID 25427)
-- Name: ingredientexreceta fk_receta_is_ingrediente; Type: FK CONSTRAINT; Schema: public; Owner: kenkougym
--

ALTER TABLE ONLY public.ingredientexreceta
    ADD CONSTRAINT fk_receta_is_ingrediente FOREIGN KEY (id_receta) REFERENCES public.receta(id);


--
-- TOC entry 3370 (class 2606 OID 25432)
-- Name: receta fk_tiempo_comida_to_receta; Type: FK CONSTRAINT; Schema: public; Owner: kenkougym
--

ALTER TABLE ONLY public.receta
    ADD CONSTRAINT fk_tiempo_comida_to_receta FOREIGN KEY (tiempo_comida) REFERENCES public.tiempocomida(id);


--
-- TOC entry 3367 (class 2606 OID 25437)
-- Name: planxreceta fkce2ytwu8vatqvl6qnqo0vw75v; Type: FK CONSTRAINT; Schema: public; Owner: kenkougym
--

ALTER TABLE ONLY public.planxreceta
    ADD CONSTRAINT fkce2ytwu8vatqvl6qnqo0vw75v FOREIGN KEY (id_receta) REFERENCES public.receta(id);


--
-- TOC entry 3375 (class 2606 OID 25442)
-- Name: user_role fkew2qns4jcn609401m7csiqo6a; Type: FK CONSTRAINT; Schema: public; Owner: kenkougym
--

ALTER TABLE ONLY public.user_role
    ADD CONSTRAINT fkew2qns4jcn609401m7csiqo6a FOREIGN KEY (role_code) REFERENCES public.kenkou_role(role_code) ON UPDATE CASCADE;


--
-- TOC entry 3376 (class 2606 OID 25447)
-- Name: user_role fkhey51w9yb0uuwffhvrofely4i; Type: FK CONSTRAINT; Schema: public; Owner: kenkougym
--

ALTER TABLE ONLY public.user_role
    ADD CONSTRAINT fkhey51w9yb0uuwffhvrofely4i FOREIGN KEY (username) REFERENCES public.kenkou_user(username) ON UPDATE CASCADE;


--
-- TOC entry 3371 (class 2606 OID 25452)
-- Name: receta fkii8xflwupkxy2k1bwe676ayjk; Type: FK CONSTRAINT; Schema: public; Owner: kenkougym
--

ALTER TABLE ONLY public.receta
    ADD CONSTRAINT fkii8xflwupkxy2k1bwe676ayjk FOREIGN KEY (tiempo_comida_id) REFERENCES public.tiempocomida(id);


--
-- TOC entry 3372 (class 2606 OID 25457)
-- Name: receta fkkafyqolfk4dv35l8mm7homds4; Type: FK CONSTRAINT; Schema: public; Owner: kenkougym
--

ALTER TABLE ONLY public.receta
    ADD CONSTRAINT fkkafyqolfk4dv35l8mm7homds4 FOREIGN KEY (objetivo_id) REFERENCES public.objetivo(id);


--
-- TOC entry 3374 (class 2606 OID 25462)
-- Name: rutina fkleqmkne6ka04mt310ue5pj22o; Type: FK CONSTRAINT; Schema: public; Owner: kenkougym
--

ALTER TABLE ONLY public.rutina
    ADD CONSTRAINT fkleqmkne6ka04mt310ue5pj22o FOREIGN KEY (id) REFERENCES public.tipo_rutina(id);


--
-- TOC entry 3368 (class 2606 OID 25467)
-- Name: progreso progreso_fk; Type: FK CONSTRAINT; Schema: public; Owner: kenkougym
--

ALTER TABLE ONLY public.progreso
    ADD CONSTRAINT progreso_fk FOREIGN KEY (username) REFERENCES public.kenkou_user(username);


--
-- TOC entry 3379 (class 2606 OID 25477)
-- Name: userxrutina rutinaxusername_fkey; Type: FK CONSTRAINT; Schema: public; Owner: kenkougym
--

ALTER TABLE ONLY public.userxrutina
    ADD CONSTRAINT rutinaxusername_fkey FOREIGN KEY (username) REFERENCES public.kenkou_user(username);


--
-- TOC entry 3373 (class 2606 OID 25482)
-- Name: receta tablafk; Type: FK CONSTRAINT; Schema: public; Owner: kenkougym
--

ALTER TABLE ONLY public.receta
    ADD CONSTRAINT tablafk FOREIGN KEY (tablanutrionalid) REFERENCES public.tablanutricional(id);


--
-- TOC entry 3378 (class 2606 OID 25487)
-- Name: userxdieta usernamexdieta_fkey; Type: FK CONSTRAINT; Schema: public; Owner: kenkougym
--

ALTER TABLE ONLY public.userxdieta
    ADD CONSTRAINT usernamexdieta_fkey FOREIGN KEY (id_planalimenticio) REFERENCES public.planalimenticio(id);


--
-- TOC entry 3380 (class 2606 OID 25492)
-- Name: userxrutina usernamexrutina_fkey; Type: FK CONSTRAINT; Schema: public; Owner: kenkougym
--

ALTER TABLE ONLY public.userxrutina
    ADD CONSTRAINT usernamexrutina_fkey FOREIGN KEY (id_rutina) REFERENCES public.rutina(id);


--
-- TOC entry 3381 (class 2606 OID 25516)
-- Name: usuario_objetivo usuario_objetivo_fk; Type: FK CONSTRAINT; Schema: public; Owner: kenkougym
--

ALTER TABLE ONLY public.usuario_objetivo
    ADD CONSTRAINT usuario_objetivo_fk FOREIGN KEY (username) REFERENCES public.kenkou_user(username);


--
-- TOC entry 3382 (class 2606 OID 25521)
-- Name: usuario_objetivo usuario_objetivo_fk_1; Type: FK CONSTRAINT; Schema: public; Owner: kenkougym
--

ALTER TABLE ONLY public.usuario_objetivo
    ADD CONSTRAINT usuario_objetivo_fk_1 FOREIGN KEY (objetivo_id) REFERENCES public.objetivo(id);


--
-- TOC entry 3570 (class 0 OID 0)
-- Dependencies: 5
-- Name: SCHEMA public; Type: ACL; Schema: -; Owner: postgres
--

GRANT ALL ON SCHEMA public TO kenkougym;


-- Completed on 2022-11-02 14:12:23

--
-- PostgreSQL database dump complete
--

