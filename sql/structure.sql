--
-- PostgreSQL database dump
--

-- Dumped from database version 15.8 (Debian 15.8-0+deb12u1)
-- Dumped by pg_dump version 15.8 (Debian 15.8-0+deb12u1)

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
-- Name: dist_rucher; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.dist_rucher (
    id bigint NOT NULL,
    dist integer NOT NULL,
    temps integer NOT NULL,
    rucher_end_id bigint,
    rucher_start_id bigint
);


ALTER TABLE public.dist_rucher OWNER TO postgres;

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
    proprete integer,
    comm_disp character varying(255),
    date_dispersion timestamp(6) without time zone,
    origine smallint
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
    tokenexpiration timestamp without time zone,
    version integer DEFAULT 0
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
    poids_apres integer NOT NULL,
    poids_avant integer NOT NULL,
    essaim_id bigint,
    hausse_id bigint,
    recolte_id bigint NOT NULL,
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
    type_id bigint,
    production boolean NOT NULL
);


ALTER TABLE public.ruche OWNER TO postgres;

--
-- Name: ruche_type; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.ruche_type (
    id bigint NOT NULL,
    nb_cadres_max integer,
    nom character varying(255) NOT NULL,
    commentaire character varying(255),
    version integer DEFAULT 0
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
-- Name: dist_rucher dist_rucher_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.dist_rucher
    ADD CONSTRAINT dist_rucher_pkey PRIMARY KEY (id);


--
-- Name: dist_rucher dist_rucher_rucher_start_id_rucher_end_id_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.dist_rucher
    ADD CONSTRAINT dist_rucher_rucher_start_id_rucher_end_id_key UNIQUE (rucher_start_id, rucher_end_id);


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
-- Name: evenement_essaim; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX evenement_essaim ON public.evenement USING btree (essaim_id);


--
-- Name: evenement_hausse; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX evenement_hausse ON public.evenement USING btree (hausse_id);


--
-- Name: evenement_ruche; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX evenement_ruche ON public.evenement USING btree (ruche_id);


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
-- Name: dist_rucher fke27cts3oeai9x6rh3semuh096; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.dist_rucher
    ADD CONSTRAINT fke27cts3oeai9x6rh3semuh096 FOREIGN KEY (rucher_end_id) REFERENCES public.rucher(id);


--
-- Name: dist_rucher fke57v1i0qvofhxhm14ng43yh0c; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.dist_rucher
    ADD CONSTRAINT fke57v1i0qvofhxhm14ng43yh0c FOREIGN KEY (rucher_start_id) REFERENCES public.rucher(id);


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

