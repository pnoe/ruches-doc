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
    nom character varying(255) NOT NULL
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

INSERT INTO public.essaim VALUES (8, true, '', '2021-03-16', 'DK1', '2021-03-01', false, NULL, NULL, NULL);
INSERT INTO public.essaim VALUES (9, true, '', '2021-03-16', 'DK2', '2021-03-02', false, NULL, NULL, NULL);


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


--
-- Data for Name: hausse; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.hausse VALUES (12, true, '', '2021-03-16', 9, 9, '001', 1, 5000, 4);
INSERT INTO public.hausse VALUES (13, true, '', '2021-03-16', 9, 9, '002', 1, 5000, 6);
INSERT INTO public.hausse VALUES (14, true, '', '2021-03-16', 9, 9, '003', 2, 5000, 6);


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

INSERT INTO public.ruche VALUES (4, true, '', '2021-03-16', 43.53133, 5.5802755, 'AA', 15000, 8, 18, 3);
INSERT INTO public.ruche VALUES (6, true, '', '2021-03-16', 43.531395, 5.579845, 'AB', 15000, 9, 18, 3);


--
-- Data for Name: ruche_type; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.ruche_type VALUES (3, 10, 'dadant_10');


--
-- Data for Name: rucher; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.rucher VALUES (2, true, '', 100, '', true, 43.52911, 5.5687504, 'Dépôt', '', 1, NULL);
INSERT INTO public.rucher VALUES (18, true, '', 100, '', false, 43.53112, 5.580049, 'La Croix', '', 1, NULL);


--
-- Name: hibernate_sequence; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.hibernate_sequence', 20, true);


--
-- Name: essaim essaim_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.essaim
    ADD CONSTRAINT essaim_pkey PRIMARY KEY (id);


--
-- Name: evenement evenement_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.evenement
    ADD CONSTRAINT evenement_pkey PRIMARY KEY (id);


--
-- Name: hausse hausse_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.hausse
    ADD CONSTRAINT hausse_pkey PRIMARY KEY (id);


--
-- Name: personne personne_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.personne
    ADD CONSTRAINT personne_pkey PRIMARY KEY (id);


--
-- Name: recolte_hausse recolte_hausse_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.recolte_hausse
    ADD CONSTRAINT recolte_hausse_pkey PRIMARY KEY (id);


--
-- Name: recolte_hausse recolte_hausse_recolte_id_hausse_id_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.recolte_hausse
    ADD CONSTRAINT recolte_hausse_recolte_id_hausse_id_key UNIQUE (recolte_id, hausse_id);


--
-- Name: recolte recolte_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.recolte
    ADD CONSTRAINT recolte_pkey PRIMARY KEY (id);


--
-- Name: ruche ruche_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.ruche
    ADD CONSTRAINT ruche_pkey PRIMARY KEY (id);


--
-- Name: ruche_type ruche_type_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.ruche_type
    ADD CONSTRAINT ruche_type_pkey PRIMARY KEY (id);


--
-- Name: rucher rucher_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.rucher
    ADD CONSTRAINT rucher_pkey PRIMARY KEY (id);


--
-- Name: rucher uk_1jx5wslivv15iu7ciaeg6wtwr; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.rucher
    ADD CONSTRAINT uk_1jx5wslivv15iu7ciaeg6wtwr UNIQUE (nom);


--
-- Name: ruche uk_cvfi8k2gu31nuclrmdueg1pm6; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.ruche
    ADD CONSTRAINT uk_cvfi8k2gu31nuclrmdueg1pm6 UNIQUE (essaim_id);


--
-- Name: hausse uk_hrlrtt93mghrc2raruhvohrt2; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.hausse
    ADD CONSTRAINT uk_hrlrtt93mghrc2raruhvohrt2 UNIQUE (nom);


--
-- Name: ruche uk_kjqsbk0l01yxvb6dwrlvrwnq6; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.ruche
    ADD CONSTRAINT uk_kjqsbk0l01yxvb6dwrlvrwnq6 UNIQUE (nom);


--
-- Name: ruche_type uk_rj98q9fmt7t766k0xwdvp1700; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.ruche_type
    ADD CONSTRAINT uk_rj98q9fmt7t766k0xwdvp1700 UNIQUE (nom);


--
-- Name: essaim uk_s7cpei1xnay5q8enem8htkj0w; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.essaim
    ADD CONSTRAINT uk_s7cpei1xnay5q8enem8htkj0w UNIQUE (nom);


--
-- Name: hausse fk3mxijxbjpissl3ivkykdh7qyy; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.hausse
    ADD CONSTRAINT fk3mxijxbjpissl3ivkykdh7qyy FOREIGN KEY (ruche_id) REFERENCES public.ruche(id);


--
-- Name: evenement fk3vvxrb2uw6hhs03jfnv7j17id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.evenement
    ADD CONSTRAINT fk3vvxrb2uw6hhs03jfnv7j17id FOREIGN KEY (ruche_id) REFERENCES public.ruche(id);


--
-- Name: recolte_hausse fk4v5dc7edwc8vum0wkwqnd6swx; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.recolte_hausse
    ADD CONSTRAINT fk4v5dc7edwc8vum0wkwqnd6swx FOREIGN KEY (essaim_id) REFERENCES public.essaim(id);


--
-- Name: rucher fk56x4y61aow8hmqg2bapiyvmag; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.rucher
    ADD CONSTRAINT fk56x4y61aow8hmqg2bapiyvmag FOREIGN KEY (contact_id) REFERENCES public.personne(id);


--
-- Name: ruche fk89vnochw0ms8g4j10e0by0i43; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.ruche
    ADD CONSTRAINT fk89vnochw0ms8g4j10e0by0i43 FOREIGN KEY (rucher_id) REFERENCES public.rucher(id);


--
-- Name: recolte_hausse fkbj2l4wfow4ksrnvac5xy9uwo0; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.recolte_hausse
    ADD CONSTRAINT fkbj2l4wfow4ksrnvac5xy9uwo0 FOREIGN KEY (ruche_id) REFERENCES public.ruche(id);


--
-- Name: recolte_hausse fkc59g3pd6nd9ao4om9o872toms; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.recolte_hausse
    ADD CONSTRAINT fkc59g3pd6nd9ao4om9o872toms FOREIGN KEY (hausse_id) REFERENCES public.hausse(id);


--
-- Name: ruche fkg9duh1fei4sn4patf1blyhine; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.ruche
    ADD CONSTRAINT fkg9duh1fei4sn4patf1blyhine FOREIGN KEY (essaim_id) REFERENCES public.essaim(id);


--
-- Name: essaim fkjm960kisa12unpdq36hoqmb88; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.essaim
    ADD CONSTRAINT fkjm960kisa12unpdq36hoqmb88 FOREIGN KEY (souche_id) REFERENCES public.essaim(id);


--
-- Name: ruche fkm4lyusdgut6023tea6v3o31ps; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.ruche
    ADD CONSTRAINT fkm4lyusdgut6023tea6v3o31ps FOREIGN KEY (type_id) REFERENCES public.ruche_type(id);


--
-- Name: recolte_hausse fkq454nllgj2h9hcy1dqyghf6k2; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.recolte_hausse
    ADD CONSTRAINT fkq454nllgj2h9hcy1dqyghf6k2 FOREIGN KEY (rucher_id) REFERENCES public.rucher(id);


--
-- Name: evenement fkq6m67bxrqypb07tkf46ps486n; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.evenement
    ADD CONSTRAINT fkq6m67bxrqypb07tkf46ps486n FOREIGN KEY (essaim_id) REFERENCES public.essaim(id);


--
-- Name: recolte_hausse fkrqpnqqodp3qt0dg3qgaes65l5; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.recolte_hausse
    ADD CONSTRAINT fkrqpnqqodp3qt0dg3qgaes65l5 FOREIGN KEY (recolte_id) REFERENCES public.recolte(id);


--
-- Name: evenement fkstpirfwvuw611v81j463qq41g; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.evenement
    ADD CONSTRAINT fkstpirfwvuw611v81j463qq41g FOREIGN KEY (hausse_id) REFERENCES public.hausse(id);


--
-- Name: evenement fkteiiphvoy1yqx3muejh3wm3pd; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.evenement
    ADD CONSTRAINT fkteiiphvoy1yqx3muejh3wm3pd FOREIGN KEY (rucher_id) REFERENCES public.rucher(id);


--
-- PostgreSQL database dump complete
--

