--
-- PostgreSQL database dump
--

\restrict T2CcDLa3VoXNCXmNmKRyWNdPlJBUHfzuTxJAT9kxB2ASr21QgzlkDBBa68G4Ljb

-- Dumped from database version 18.1
-- Dumped by pg_dump version 18.1

-- Started on 2026-03-03 22:13:45

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET transaction_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

--
-- TOC entry 4 (class 2615 OID 2200)
-- Name: public; Type: SCHEMA; Schema: -; Owner: pg_database_owner
--

CREATE SCHEMA public;


ALTER SCHEMA public OWNER TO pg_database_owner;

--
-- TOC entry 4967 (class 0 OID 0)
-- Dependencies: 4
-- Name: SCHEMA public; Type: COMMENT; Schema: -; Owner: pg_database_owner
--

COMMENT ON SCHEMA public IS 'standard public schema';


SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- TOC entry 220 (class 1259 OID 41808)
-- Name: takjil; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.takjil (
    id integer NOT NULL,
    nama_tempat character varying(100) NOT NULL,
    lokasi character varying(150) NOT NULL,
    jenis_takjil character varying(100) NOT NULL,
    makanan_berat boolean DEFAULT false NOT NULL,
    waktu_mulai time without time zone NOT NULL
);


ALTER TABLE public.takjil OWNER TO postgres;

--
-- TOC entry 219 (class 1259 OID 41807)
-- Name: takjil_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.takjil_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.takjil_id_seq OWNER TO postgres;

--
-- TOC entry 4968 (class 0 OID 0)
-- Dependencies: 219
-- Name: takjil_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.takjil_id_seq OWNED BY public.takjil.id;


--
-- TOC entry 4809 (class 2604 OID 41811)
-- Name: takjil id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.takjil ALTER COLUMN id SET DEFAULT nextval('public.takjil_id_seq'::regclass);


--
-- TOC entry 4961 (class 0 OID 41808)
-- Dependencies: 220
-- Data for Name: takjil; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.takjil (id, nama_tempat, lokasi, jenis_takjil, makanan_berat, waktu_mulai) FROM stdin;
1	Rumah Killa	Jakarta	Kolang Kaling	t	17:00:00
\.


--
-- TOC entry 4969 (class 0 OID 0)
-- Dependencies: 219
-- Name: takjil_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.takjil_id_seq', 1, true);


--
-- TOC entry 4812 (class 2606 OID 41820)
-- Name: takjil takjil_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.takjil
    ADD CONSTRAINT takjil_pkey PRIMARY KEY (id);


-- Completed on 2026-03-03 22:13:46

--
-- PostgreSQL database dump complete
--

\unrestrict T2CcDLa3VoXNCXmNmKRyWNdPlJBUHfzuTxJAT9kxB2ASr21QgzlkDBBa68G4Ljb

