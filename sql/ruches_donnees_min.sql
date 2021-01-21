--
-- PostgreSQL database dump
--

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

INSERT INTO public.personne VALUES (1, true, 'admin', 'admin@admin.fr', 'admin', 'admin', '$2a$10$1LqLK3XoVufvBFNG5UyiveWsovMbfkp1FBViNwfxbl0UfNeHdqtlO', 'admin', 'admin', NULL, NULL, NULL);
INSERT INTO public.rucher VALUES (2, true, '', 100, '', true, 43.5383759, 5.5266428, 'Dépôt', '', 1);

SELECT pg_catalog.setval('public.hibernate_sequence', 3, false);

--
-- PostgreSQL database dump complete
--
