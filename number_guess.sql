--
-- PostgreSQL database dump
--

-- Dumped from database version 12.22 (Ubuntu 12.22-0ubuntu0.20.04.4)
-- Dumped by pg_dump version 12.22 (Ubuntu 12.22-0ubuntu0.20.04.4)

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

DROP DATABASE number_guess;
--
-- Name: number_guess; Type: DATABASE; Schema: -; Owner: freecodecamp
--

CREATE DATABASE number_guess WITH TEMPLATE = template0 ENCODING = 'UTF8' LC_COLLATE = 'C.UTF-8' LC_CTYPE = 'C.UTF-8';


ALTER DATABASE number_guess OWNER TO freecodecamp;

\connect number_guess

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
-- Name: user_info; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.user_info (
    user_id integer NOT NULL,
    username character varying(22) NOT NULL,
    best_game integer,
    game_played integer
);


ALTER TABLE public.user_info OWNER TO freecodecamp;

--
-- Name: user_info_user_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.user_info_user_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.user_info_user_id_seq OWNER TO freecodecamp;

--
-- Name: user_info_user_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.user_info_user_id_seq OWNED BY public.user_info.user_id;


--
-- Name: user_info user_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.user_info ALTER COLUMN user_id SET DEFAULT nextval('public.user_info_user_id_seq'::regclass);


--
-- Data for Name: user_info; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.user_info VALUES (1, 'Ruslan', 3, NULL);
INSERT INTO public.user_info VALUES (2, 'rustic', NULL, NULL);
INSERT INTO public.user_info VALUES (3, 'rus', 8, 1);
INSERT INTO public.user_info VALUES (5, 'user_1775039524671', 177, NULL);
INSERT INTO public.user_info VALUES (4, 'user_1775039524672', 107, NULL);
INSERT INTO public.user_info VALUES (7, 'user_1775039653080', 504, NULL);
INSERT INTO public.user_info VALUES (6, 'user_1775039653081', 329, NULL);
INSERT INTO public.user_info VALUES (9, 'user_1775039768055', 662, NULL);
INSERT INTO public.user_info VALUES (8, 'user_1775039768056', 3, NULL);
INSERT INTO public.user_info VALUES (11, 'user_1775039850568', 332, NULL);
INSERT INTO public.user_info VALUES (10, 'user_1775039850569', 181, NULL);
INSERT INTO public.user_info VALUES (13, 'user_1775040083572', 480, NULL);
INSERT INTO public.user_info VALUES (12, 'user_1775040083573', 269, NULL);
INSERT INTO public.user_info VALUES (15, 'user_1775040380069', 77, 2);
INSERT INTO public.user_info VALUES (14, 'user_1775040380070', 35, 5);
INSERT INTO public.user_info VALUES (17, 'user_1775040636571', 140, 2);
INSERT INTO public.user_info VALUES (16, 'user_1775040636572', 148, 5);
INSERT INTO public.user_info VALUES (19, 'user_1775040702297', 237, 2);
INSERT INTO public.user_info VALUES (18, 'user_1775040702298', 42, 5);


--
-- Name: user_info_user_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.user_info_user_id_seq', 19, true);


--
-- Name: user_info user_info_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.user_info
    ADD CONSTRAINT user_info_pkey PRIMARY KEY (user_id);


--
-- Name: user_info user_info_username_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.user_info
    ADD CONSTRAINT user_info_username_key UNIQUE (username);


--
-- PostgreSQL database dump complete
--

