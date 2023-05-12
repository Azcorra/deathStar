--
-- PostgreSQL database dump
--

-- Dumped from database version 15.2
-- Dumped by pg_dump version 15.2

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
-- Name: death-star; Type: SCHEMA; Schema: -; Owner: postgres
--

CREATE SCHEMA "death-star";


ALTER SCHEMA "death-star" OWNER TO postgres;

--
-- Name: ColorSable; Type: TYPE; Schema: death-star; Owner: postgres
--

CREATE TYPE "death-star"."ColorSable" AS ENUM (
    'AMARILLO',
    'AZUL',
    'DORADO',
    'MORADO',
    'PLATEADO',
    'ROJO',
    'VERDE'
);


ALTER TYPE "death-star"."ColorSable" OWNER TO postgres;

--
-- Name: EstiloBatalla; Type: TYPE; Schema: death-star; Owner: postgres
--

CREATE TYPE "death-star"."EstiloBatalla" AS ENUM (
    '1',
    '2',
    '3',
    '4',
    '5',
    '6',
    '7'
);


ALTER TYPE "death-star"."EstiloBatalla" OWNER TO postgres;

SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- Name: Usuarios; Type: TABLE; Schema: death-star; Owner: postgres
--

CREATE TABLE "death-star"."Usuarios" (
    "UsuarioId" integer NOT NULL,
    "Nombre" character varying(255) DEFAULT ''::character varying NOT NULL,
    "ColorSable" "death-star"."ColorSable" DEFAULT 'AZUL'::"death-star"."ColorSable" NOT NULL,
    "Aprendiz" boolean DEFAULT false NOT NULL,
    "EstiloBatalla" "death-star"."EstiloBatalla" DEFAULT '1'::"death-star"."EstiloBatalla" NOT NULL
);


ALTER TABLE "death-star"."Usuarios" OWNER TO postgres;

--
-- Name: Usuarios_UsuarioId_seq; Type: SEQUENCE; Schema: death-star; Owner: postgres
--

CREATE SEQUENCE "death-star"."Usuarios_UsuarioId_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE "death-star"."Usuarios_UsuarioId_seq" OWNER TO postgres;

--
-- Name: Usuarios_UsuarioId_seq; Type: SEQUENCE OWNED BY; Schema: death-star; Owner: postgres
--

ALTER SEQUENCE "death-star"."Usuarios_UsuarioId_seq" OWNED BY "death-star"."Usuarios"."UsuarioId";


--
-- Name: user; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."user" (
    id integer NOT NULL,
    first_name character varying(30) DEFAULT ''::character varying NOT NULL,
    last_name character varying(30) DEFAULT ''::character varying NOT NULL,
    income real DEFAULT 0 NOT NULL
);


ALTER TABLE public."user" OWNER TO postgres;

--
-- Name: user_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.user_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.user_id_seq OWNER TO postgres;

--
-- Name: user_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.user_id_seq OWNED BY public."user".id;


--
-- Name: user_payments; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.user_payments (
    id integer NOT NULL,
    user_id integer DEFAULT 0 NOT NULL,
    amount real DEFAULT 0 NOT NULL
);


ALTER TABLE public.user_payments OWNER TO postgres;

--
-- Name: user_payments_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.user_payments_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.user_payments_id_seq OWNER TO postgres;

--
-- Name: user_payments_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.user_payments_id_seq OWNED BY public.user_payments.id;


--
-- Name: Usuarios UsuarioId; Type: DEFAULT; Schema: death-star; Owner: postgres
--

ALTER TABLE ONLY "death-star"."Usuarios" ALTER COLUMN "UsuarioId" SET DEFAULT nextval('"death-star"."Usuarios_UsuarioId_seq"'::regclass);


--
-- Name: user id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."user" ALTER COLUMN id SET DEFAULT nextval('public.user_id_seq'::regclass);


--
-- Name: user_payments id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.user_payments ALTER COLUMN id SET DEFAULT nextval('public.user_payments_id_seq'::regclass);


--
-- Data for Name: Usuarios; Type: TABLE DATA; Schema: death-star; Owner: postgres
--

COPY "death-star"."Usuarios" ("UsuarioId", "Nombre", "ColorSable", "Aprendiz", "EstiloBatalla") FROM stdin;
2	Yoda	VERDE	f	1
3	Luke Skywalker	VERDE	t	2
4	Anakin Skywalker	AZUL	t	3
5	Obi-Wan Kenobi	AZUL	f	2
6	Princesa Leia Organa	VERDE	t	6
\.


--
-- Data for Name: user; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."user" (id, first_name, last_name, income) FROM stdin;
2	John	Doe	2750.5
3	Ana	Doe	1000
4	Karla	Doe	2850
5	Pepe	Doe	3900.8
6	Martin	Doe	1520
\.


--
-- Data for Name: user_payments; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.user_payments (id, user_id, amount) FROM stdin;
2	2	750.5
6	2	900
8	2	300
3	2	800
5	4	1000
7	4	1000
11	4	850
4	6	500
9	6	500
10	6	500
12	6	20
\.


--
-- Name: Usuarios_UsuarioId_seq; Type: SEQUENCE SET; Schema: death-star; Owner: postgres
--

SELECT pg_catalog.setval('"death-star"."Usuarios_UsuarioId_seq"', 6, true);


--
-- Name: user_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.user_id_seq', 6, true);


--
-- Name: user_payments_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.user_payments_id_seq', 12, true);


--
-- Name: Usuarios Usuarios_pkey; Type: CONSTRAINT; Schema: death-star; Owner: postgres
--

ALTER TABLE ONLY "death-star"."Usuarios"
    ADD CONSTRAINT "Usuarios_pkey" PRIMARY KEY ("UsuarioId");


--
-- Name: user_payments user_payments_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.user_payments
    ADD CONSTRAINT user_payments_pkey PRIMARY KEY (id);


--
-- Name: user user_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."user"
    ADD CONSTRAINT user_pkey PRIMARY KEY (id);


--
-- Name: user_payments user_payments_user_id_FK; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.user_payments
    ADD CONSTRAINT "user_payments_user_id_FK" FOREIGN KEY (user_id) REFERENCES public."user"(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- PostgreSQL database dump complete
--

