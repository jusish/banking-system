--
-- PostgreSQL database dump
--

-- Dumped from database version 16.1 (Ubuntu 16.1-1.pgdg23.04+1)
-- Dumped by pg_dump version 16.1 (Ubuntu 16.1-1.pgdg23.04+1)

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
-- Name: users; Type: TABLE; Schema: public; Owner: jodos
--

CREATE TABLE public.users (
    id integer NOT NULL,
    username character varying(255) NOT NULL,
    email character varying(255) NOT NULL,
    password character varying(255) NOT NULL,
    banktype character varying(255) NOT NULL,
    age integer,
    amount numeric(10,2),
    CONSTRAINT check_age_greater_than_18 CHECK ((age > 18))
);


ALTER TABLE public.users OWNER TO jodos;

--
-- Name: users_id_seq; Type: SEQUENCE; Schema: public; Owner: jodos
--

CREATE SEQUENCE public.users_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.users_id_seq OWNER TO jodos;

--
-- Name: users_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: jodos
--

ALTER SEQUENCE public.users_id_seq OWNED BY public.users.id;


--
-- Name: users id; Type: DEFAULT; Schema: public; Owner: jodos
--

ALTER TABLE ONLY public.users ALTER COLUMN id SET DEFAULT nextval('public.users_id_seq'::regclass);


--
-- Data for Name: users; Type: TABLE DATA; Schema: public; Owner: jodos
--

COPY public.users (id, username, email, password, banktype, age, amount) FROM stdin;
1	jodos	jodos2006@gmail.com	1234567890	current account	35	34000.00
4	jodos	jodos20061@gmail.com	!5tKZxgiqYBAzp7	current account	23	4500.00
6	movies and  users	jodos20062@gmail.com	!5tKZxgiqYBAzp7	current account	21	34456.00
7	movies and  users	dushimimanajeanbosco181@gmail.com	!5tKZxgiqYBAzp7	saving account	67	34567.00
8	umushi	umushi@gmail.com	1234567890	saving account	44	2000000.00
\.


--
-- Name: users_id_seq; Type: SEQUENCE SET; Schema: public; Owner: jodos
--

SELECT pg_catalog.setval('public.users_id_seq', 8, true);


--
-- Name: users users_email_key; Type: CONSTRAINT; Schema: public; Owner: jodos
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key UNIQUE (email);


--
-- Name: users users_pkey; Type: CONSTRAINT; Schema: public; Owner: jodos
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_pkey PRIMARY KEY (id);


--
-- PostgreSQL database dump complete
--

