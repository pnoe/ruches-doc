--
-- PostgreSQL database dump
--

-- Dumped from database version 15.3 (Ubuntu 15.3-0ubuntu0.23.04.1)
-- Dumped by pg_dump version 15.3 (Ubuntu 15.3-0ubuntu0.23.04.1)

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
    dist integer NOT NULL,
    temps integer NOT NULL,
    id bigint NOT NULL,
    rucher_end_id bigint,
    rucher_start_id bigint
);


ALTER TABLE public.dist_rucher OWNER TO postgres;

--
-- Name: dist_rucher_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.dist_rucher_seq
    START WITH 1
    INCREMENT BY 50
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.dist_rucher_seq OWNER TO postgres;

--
-- Name: essaim; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.essaim (
    actif boolean NOT NULL,
    agressivite integer,
    date_acquisition date,
    proprete integer,
    reine_date_naissance date,
    reine_marquee boolean NOT NULL,
    id bigint NOT NULL,
    souche_id bigint,
    commentaire character varying(255),
    nom character varying(255) NOT NULL,
    comm_disp character varying(255),
    date_dispersion timestamp(6) without time zone
);


ALTER TABLE public.essaim OWNER TO postgres;

--
-- Name: essaim_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.essaim_seq
    START WITH 1
    INCREMENT BY 50
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.essaim_seq OWNER TO postgres;

--
-- Name: evenement; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.evenement (
    type smallint,
    date timestamp(6) without time zone,
    essaim_id bigint,
    hausse_id bigint,
    id bigint NOT NULL,
    ruche_id bigint,
    rucher_id bigint,
    valeur character varying(64),
    commentaire character varying(255),
    CONSTRAINT evenement_type_check CHECK (((type >= 0) AND (type <= 14)))
);


ALTER TABLE public.evenement OWNER TO postgres;

--
-- Name: evenement_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.evenement_seq
    START WITH 1
    INCREMENT BY 50
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.evenement_seq OWNER TO postgres;

--
-- Name: hausse; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.hausse (
    active boolean NOT NULL,
    date_acquisition date,
    nb_cadres integer,
    nb_cadres_max integer,
    ordre_sur_ruche integer,
    poids_vide integer,
    id bigint NOT NULL,
    ruche_id bigint,
    commentaire character varying(255),
    nom character varying(255) NOT NULL
);


ALTER TABLE public.hausse OWNER TO postgres;

--
-- Name: hausse_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.hausse_seq
    START WITH 1
    INCREMENT BY 50
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.hausse_seq OWNER TO postgres;

--
-- Name: personne; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.personne (
    active boolean NOT NULL,
    id bigint NOT NULL,
    version integer default 0,
    tokenexpiration timestamp(6) without time zone,
    adresse character varying(255) NOT NULL,
    email character varying(255),
    login character varying(255) NOT NULL,
    nom character varying(255) NOT NULL,
    password character varying(255),
    prenom character varying(255) NOT NULL,
    roles character varying(255),
    tel character varying(255),
    token character varying(255)
);


ALTER TABLE public.personne OWNER TO postgres;

--
-- Name: personne_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.personne_seq
    START WITH 1
    INCREMENT BY 50
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.personne_seq OWNER TO postgres;

--
-- Name: recolte; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.recolte (
    poids_miel integer,
    type_miel smallint,
    date timestamp(6) without time zone,
    id bigint NOT NULL,
    commentaire character varying(255),
    CONSTRAINT recolte_type_miel_check CHECK (((type_miel >= 0) AND (type_miel <= 7)))
);


ALTER TABLE public.recolte OWNER TO postgres;

--
-- Name: recolte_hausse; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.recolte_hausse (
    poids_apres integer,
    poids_avant integer,
    essaim_id bigint,
    hausse_id bigint,
    id bigint NOT NULL,
    recolte_id bigint,
    ruche_id bigint,
    rucher_id bigint
);


ALTER TABLE public.recolte_hausse OWNER TO postgres;

--
-- Name: recolte_hausse_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.recolte_hausse_seq
    START WITH 1
    INCREMENT BY 50
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.recolte_hausse_seq OWNER TO postgres;

--
-- Name: recolte_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.recolte_seq
    START WITH 1
    INCREMENT BY 50
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.recolte_seq OWNER TO postgres;

--
-- Name: ruche; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.ruche (
    active boolean NOT NULL,
    date_acquisition date,
    latitude real,
    longitude real,
    poids_vide integer,
    production boolean NOT NULL,
    essaim_id bigint,
    id bigint NOT NULL,
    rucher_id bigint,
    type_id bigint,
    commentaire character varying(255),
    nom character varying(255) NOT NULL
);


ALTER TABLE public.ruche OWNER TO postgres;

--
-- Name: ruche_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.ruche_seq
    START WITH 1
    INCREMENT BY 50
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.ruche_seq OWNER TO postgres;

--
-- Name: ruche_type; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.ruche_type (
    nb_cadres_max integer,
    id bigint NOT NULL,
    version integer default 0,
    commentaire character varying(255),
    nom character varying(255) NOT NULL
);


ALTER TABLE public.ruche_type OWNER TO postgres;

--
-- Name: ruche_type_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.ruche_type_seq
    START WITH 1
    INCREMENT BY 50
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.ruche_type_seq OWNER TO postgres;

--
-- Name: rucher; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.rucher (
    actif boolean NOT NULL,
    altitude integer,
    depot boolean NOT NULL,
    latitude real,
    longitude real,
    contact_id bigint,
    id bigint NOT NULL,
    adresse character varying(255),
    commentaire character varying(255),
    dessin character varying(255),
    nom character varying(255) NOT NULL,
    ressource character varying(255)
);


ALTER TABLE public.rucher OWNER TO postgres;

--
-- Name: rucher_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.rucher_seq
    START WITH 1
    INCREMENT BY 50
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.rucher_seq OWNER TO postgres;

--
-- Name: dist_rucher dist_rucher_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.dist_rucher
    ADD CONSTRAINT dist_rucher_pkey PRIMARY KEY (id);


--
-- Name: essaim essaim_nom_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.essaim
    ADD CONSTRAINT essaim_nom_key UNIQUE (nom);


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
-- Name: hausse hausse_nom_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.hausse
    ADD CONSTRAINT hausse_nom_key UNIQUE (nom);


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
-- Name: recolte recolte_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.recolte
    ADD CONSTRAINT recolte_pkey PRIMARY KEY (id);


--
-- Name: ruche ruche_essaim_id_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.ruche
    ADD CONSTRAINT ruche_essaim_id_key UNIQUE (essaim_id);


--
-- Name: ruche ruche_nom_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.ruche
    ADD CONSTRAINT ruche_nom_key UNIQUE (nom);


--
-- Name: ruche ruche_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.ruche
    ADD CONSTRAINT ruche_pkey PRIMARY KEY (id);


--
-- Name: ruche_type ruche_type_nom_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.ruche_type
    ADD CONSTRAINT ruche_type_nom_key UNIQUE (nom);


--
-- Name: ruche_type ruche_type_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.ruche_type
    ADD CONSTRAINT ruche_type_pkey PRIMARY KEY (id);


--
-- Name: rucher rucher_nom_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.rucher
    ADD CONSTRAINT rucher_nom_key UNIQUE (nom);


--
-- Name: rucher rucher_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.rucher
    ADD CONSTRAINT rucher_pkey PRIMARY KEY (id);


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

