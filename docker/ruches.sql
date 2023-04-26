--
-- PostgreSQL database dump
--

-- Dumped from database version 13.2
-- Dumped by pg_dump version 13.2

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


CREATE DATABASE ruches;
\connect ruches

--
-- Name: dist_rucher; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.dist_rucher (
    id bigint NOT NULL,
    dist integer NOT NULL,
    temps integer NOT NULL,
    rucher_end_id bigint,
    rucher_start_id bigint
);

--
-- Name: essaim; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.essaim (
    id bigint NOT NULL,
    actif boolean NOT NULL,
    commentaire character varying(255),
    date_acquisition date,
    nom character varying(255) NOT NULL,
    reine_date_naissance date,
    reine_marquee boolean NOT NULL,
    souche_id bigint,
    agressivite integer,
    proprete integer
);


ALTER TABLE public.essaim OWNER TO postgres;

--
-- Name: evenement; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.evenement (
    id bigint NOT NULL,
    commentaire character varying(255),
    date timestamp without time zone,
    type integer,
    essaim_id bigint,
    hausse_id bigint,
    ruche_id bigint,
    rucher_id bigint,
    valeur character varying(64)
);


ALTER TABLE public.evenement OWNER TO postgres;

--
-- Name: hausse; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.hausse (
    id bigint NOT NULL,
    active boolean NOT NULL,
    commentaire character varying(255),
    date_acquisition date,
    nb_cadres integer,
    nb_cadres_max integer,
    nom character varying(255) NOT NULL,
    ordre_sur_ruche integer,
    poids_vide integer,
    ruche_id bigint
);


ALTER TABLE public.hausse OWNER TO postgres;

--
-- Name: hibernate_sequence; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.hibernate_sequence
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.hibernate_sequence OWNER TO postgres;

--
-- Name: personne; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.personne (
    id bigint NOT NULL,
    active boolean NOT NULL,
    adresse character varying(255) NOT NULL,
    email character varying(255),
    login character varying(255),
    nom character varying(255) NOT NULL,
    password character varying(255),
    prenom character varying(255) NOT NULL,
    roles character varying(255),
    tel character varying(255),
    token character varying(255),
    tokenexpiration timestamp without time zone
);


ALTER TABLE public.personne OWNER TO postgres;

--
-- Name: recolte; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.recolte (
    id bigint NOT NULL,
    commentaire character varying(255),
    date timestamp without time zone,
    poids_miel integer,
    type_miel integer
);


ALTER TABLE public.recolte OWNER TO postgres;

--
-- Name: recolte_hausse; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.recolte_hausse (
    id bigint NOT NULL,
    poids_apres integer,
    poids_avant integer,
    essaim_id bigint,
    hausse_id bigint,
    recolte_id bigint,
    ruche_id bigint,
    rucher_id bigint
);


ALTER TABLE public.recolte_hausse OWNER TO postgres;

--
-- Name: ruche; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.ruche (
    id bigint NOT NULL,
    active boolean,
    commentaire character varying(255),
    date_acquisition date,
    latitude real,
    longitude real,
    nom character varying(255) NOT NULL,
    poids_vide integer,
    essaim_id bigint,
    rucher_id bigint,
    type_id bigint
);


ALTER TABLE public.ruche OWNER TO postgres;

--
-- Name: ruche_type; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.ruche_type (
    id bigint NOT NULL,
    nb_cadres_max integer,
    nom character varying(255) NOT NULL,
    commentaire character varying(255)
);


ALTER TABLE public.ruche_type OWNER TO postgres;

--
-- Name: rucher; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.rucher (
    id bigint NOT NULL,
    actif boolean NOT NULL,
    adresse character varying(255),
    altitude integer,
    commentaire character varying(255),
    depot boolean NOT NULL,
    latitude real,
    longitude real,
    nom character varying(255) NOT NULL,
    ressource character varying(255),
    contact_id bigint,
    dessin character varying
);


ALTER TABLE public.rucher OWNER TO postgres;

--
-- Data for Name: essaim; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.essaim VALUES (23, true, '', '2021-03-16', 'DK3', '2021-03-01', false, 8, NULL, NULL);
INSERT INTO public.essaim VALUES (9, true, '', '2021-03-16', 'DK2', '2021-03-02', true, 8, NULL, NULL);
INSERT INTO public.essaim VALUES (8, true, '', '2021-03-16', 'DK1', '2020-03-03', false, NULL, NULL, NULL);


--
-- Data for Name: evenement; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.evenement VALUES (5, '', '2021-03-16 00:00:00', 0, NULL, NULL, 4, 2, NULL);
INSERT INTO public.evenement VALUES (7, '', '2021-03-16 00:00:00', 0, NULL, NULL, 6, 2, NULL);
INSERT INTO public.evenement VALUES (10, '', '2021-03-16 20:54:00', 1, 8, NULL, 4, 2, NULL);
INSERT INTO public.evenement VALUES (11, '', '2021-03-16 20:55:00', 1, 9, NULL, 6, 2, NULL);
INSERT INTO public.evenement VALUES (15, '', '2021-03-16 20:57:00', 2, 8, 12, 4, 2, '1');
INSERT INTO public.evenement VALUES (16, '', '2021-03-16 20:57:00', 2, 9, 13, 6, 2, '1');
INSERT INTO public.evenement VALUES (17, '', '2021-03-16 20:57:00', 2, 9, 14, 6, 2, '2');
INSERT INTO public.evenement VALUES (19, '', '2021-03-16 21:01:00', 0, 8, NULL, 4, 18, NULL);
INSERT INTO public.evenement VALUES (20, '', '2021-03-16 21:01:00', 0, 9, NULL, 6, 18, NULL);
INSERT INTO public.evenement VALUES (22, '', '2021-03-18 17:24:08.336884', 0, NULL, NULL, 21, 18, NULL);
INSERT INTO public.evenement VALUES (24, '', '2021-03-18 17:24:00', 1, 23, NULL, 21, 18, NULL);
INSERT INTO public.evenement VALUES (2, '', '2021-03-18 17:39:00', 2, 23, 1, 21, 18, '1');


--
-- Data for Name: hausse; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.hausse VALUES (12, true, '', '2021-03-16', 9, 9, '001', 1, 5000, 4);
INSERT INTO public.hausse VALUES (13, true, '', '2021-03-16', 9, 9, '002', 1, 5000, 6);
INSERT INTO public.hausse VALUES (14, true, '', '2021-03-16', 9, 9, '003', 2, 5000, 6);
INSERT INTO public.hausse VALUES (1, true, '', '2021-03-16', 9, 9, '004', 1, 5000, 21);


--
-- Data for Name: personne; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.personne VALUES (1, true, 'admin', 'admin@admin.fr', 'admin', 'admin', '$2a$10$1LqLK3XoVufvBFNG5UyiveWsovMbfkp1FBViNwfxbl0UfNeHdqtlO', 'admin', 'admin', NULL, NULL, NULL);


--
-- Data for Name: recolte; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- Data for Name: recolte_hausse; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- Data for Name: ruche; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.ruche VALUES (6, true, '', '2021-03-16', 43.531395, 5.579845, 'AB', 15000, 9, 18, 3);
INSERT INTO public.ruche VALUES (21, true, '', '2021-03-16', 43.53133, 5.5803156, 'AC', 15000, 23, 18, 3);
INSERT INTO public.ruche VALUES (4, true, '', '2021-03-16', 43.531433, 5.580132, 'AA', 15000, 8, 18, 3);


--
-- Data for Name: ruche_type; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.ruche_type VALUES (3, 10, 'dadant_10','Dadant 10 cadres');


--
-- Data for Name: rucher; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.rucher VALUES (2, true, '', 100, '', true, 43.52911, 5.5687504, 'Dépôt', '', 1, NULL);
INSERT INTO public.rucher VALUES (18, true, '', 100, '', false, 43.53112, 5.580049, 'La Croix', '', 1, NULL);


--
-- Name: hibernate_sequence; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.hibernate_sequence', 200, true);


--
-- PostgreSQL database dump complete
--

