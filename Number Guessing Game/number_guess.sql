--
-- PostgreSQL database dump
--

-- Dumped from database version 12.17 (Ubuntu 12.17-1.pgdg22.04+1)
-- Dumped by pg_dump version 12.17 (Ubuntu 12.17-1.pgdg22.04+1)

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
-- Name: games; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.games (
    game_id integer NOT NULL,
    user_id integer NOT NULL,
    guesses integer NOT NULL
);


ALTER TABLE public.games OWNER TO freecodecamp;

--
-- Name: games_game_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.games_game_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.games_game_id_seq OWNER TO freecodecamp;

--
-- Name: games_game_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.games_game_id_seq OWNED BY public.games.game_id;


--
-- Name: users; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.users (
    user_id integer NOT NULL,
    username character varying(22) NOT NULL
);


ALTER TABLE public.users OWNER TO freecodecamp;

--
-- Name: users_user_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.users_user_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.users_user_id_seq OWNER TO freecodecamp;

--
-- Name: users_user_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.users_user_id_seq OWNED BY public.users.user_id;


--
-- Name: games game_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.games ALTER COLUMN game_id SET DEFAULT nextval('public.games_game_id_seq'::regclass);


--
-- Name: users user_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.users ALTER COLUMN user_id SET DEFAULT nextval('public.users_user_id_seq'::regclass);


--
-- Data for Name: games; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.games VALUES (14, 50, 824);
INSERT INTO public.games VALUES (15, 50, 674);
INSERT INTO public.games VALUES (16, 51, 223);
INSERT INTO public.games VALUES (17, 51, 13);
INSERT INTO public.games VALUES (18, 50, 338);
INSERT INTO public.games VALUES (19, 50, 537);
INSERT INTO public.games VALUES (20, 50, 378);
INSERT INTO public.games VALUES (21, 52, 11);
INSERT INTO public.games VALUES (22, 53, 33);
INSERT INTO public.games VALUES (23, 53, 190);
INSERT INTO public.games VALUES (24, 54, 90);
INSERT INTO public.games VALUES (25, 54, 438);
INSERT INTO public.games VALUES (26, 53, 821);
INSERT INTO public.games VALUES (27, 53, 832);
INSERT INTO public.games VALUES (28, 53, 815);
INSERT INTO public.games VALUES (29, 55, 577);
INSERT INTO public.games VALUES (30, 55, 813);
INSERT INTO public.games VALUES (31, 56, 342);
INSERT INTO public.games VALUES (32, 56, 607);
INSERT INTO public.games VALUES (33, 55, 593);
INSERT INTO public.games VALUES (34, 55, 920);
INSERT INTO public.games VALUES (35, 55, 344);
INSERT INTO public.games VALUES (36, 57, 858);
INSERT INTO public.games VALUES (37, 57, 415);
INSERT INTO public.games VALUES (38, 58, 597);
INSERT INTO public.games VALUES (39, 58, 720);
INSERT INTO public.games VALUES (40, 57, 1000);
INSERT INTO public.games VALUES (41, 57, 89);
INSERT INTO public.games VALUES (42, 57, 516);
INSERT INTO public.games VALUES (43, 59, 695);
INSERT INTO public.games VALUES (44, 59, 90);
INSERT INTO public.games VALUES (45, 60, 51);
INSERT INTO public.games VALUES (46, 60, 194);
INSERT INTO public.games VALUES (47, 59, 632);
INSERT INTO public.games VALUES (48, 59, 311);
INSERT INTO public.games VALUES (49, 59, 698);


--
-- Data for Name: users; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.users VALUES (50, 'user_1718909385061');
INSERT INTO public.users VALUES (51, 'user_1718909385060');
INSERT INTO public.users VALUES (52, 'musa');
INSERT INTO public.users VALUES (53, 'user_1718909462134');
INSERT INTO public.users VALUES (54, 'user_1718909462133');
INSERT INTO public.users VALUES (55, 'user_1718909489033');
INSERT INTO public.users VALUES (56, 'user_1718909489032');
INSERT INTO public.users VALUES (57, 'user_1718909565367');
INSERT INTO public.users VALUES (58, 'user_1718909565366');
INSERT INTO public.users VALUES (59, 'user_1718909574224');
INSERT INTO public.users VALUES (60, 'user_1718909574223');


--
-- Name: games_game_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.games_game_id_seq', 49, true);


--
-- Name: users_user_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.users_user_id_seq', 60, true);


--
-- Name: games games_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.games
    ADD CONSTRAINT games_pkey PRIMARY KEY (game_id);


--
-- Name: users users_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_pkey PRIMARY KEY (user_id);


--
-- Name: users users_username_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_username_key UNIQUE (username);


--
-- Name: games games_user_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.games
    ADD CONSTRAINT games_user_id_fkey FOREIGN KEY (user_id) REFERENCES public.users(user_id);


--
-- PostgreSQL database dump complete
--

