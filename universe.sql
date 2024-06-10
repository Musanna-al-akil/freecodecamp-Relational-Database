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

DROP DATABASE universe;
--
-- Name: universe; Type: DATABASE; Schema: -; Owner: freecodecamp
--

CREATE DATABASE universe WITH TEMPLATE = template0 ENCODING = 'UTF8' LC_COLLATE = 'C.UTF-8' LC_CTYPE = 'C.UTF-8';


ALTER DATABASE universe OWNER TO freecodecamp;

\connect universe

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
-- Name: galaxy; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.galaxy (
    galaxy_id integer NOT NULL,
    description text,
    name character varying(30) NOT NULL,
    age_in_millons_of_years numeric(4,1),
    galaxy_types character varying(30)
);


ALTER TABLE public.galaxy OWNER TO freecodecamp;

--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.galaxy_galaxy_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.galaxy_galaxy_id_seq OWNER TO freecodecamp;

--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.galaxy_galaxy_id_seq OWNED BY public.galaxy.galaxy_id;


--
-- Name: moon; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.moon (
    moon_id integer NOT NULL,
    description text,
    name character varying(30) NOT NULL,
    is_spherical boolean,
    planet_id integer
);


ALTER TABLE public.moon OWNER TO freecodecamp;

--
-- Name: moon_moon_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.moon_moon_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.moon_moon_id_seq OWNER TO freecodecamp;

--
-- Name: moon_moon_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.moon_moon_id_seq OWNED BY public.moon.moon_id;


--
-- Name: people; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.people (
    people_id integer NOT NULL,
    name character varying(30) NOT NULL,
    age integer
);


ALTER TABLE public.people OWNER TO freecodecamp;

--
-- Name: people_people_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.people_people_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.people_people_id_seq OWNER TO freecodecamp;

--
-- Name: people_people_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.people_people_id_seq OWNED BY public.people.people_id;


--
-- Name: planet; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.planet (
    planet_id integer NOT NULL,
    description text,
    name character varying(30) NOT NULL,
    distance_from_earth integer,
    star_id integer,
    has_life boolean
);


ALTER TABLE public.planet OWNER TO freecodecamp;

--
-- Name: planet_planet_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.planet_planet_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.planet_planet_id_seq OWNER TO freecodecamp;

--
-- Name: planet_planet_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.planet_planet_id_seq OWNED BY public.planet.planet_id;


--
-- Name: star; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.star (
    star_id integer NOT NULL,
    description text,
    name character varying(30) NOT NULL,
    distance_from_earth integer,
    galaxy_id integer
);


ALTER TABLE public.star OWNER TO freecodecamp;

--
-- Name: star_star_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.star_star_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.star_star_id_seq OWNER TO freecodecamp;

--
-- Name: star_star_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.star_star_id_seq OWNED BY public.star.star_id;


--
-- Name: galaxy galaxy_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy ALTER COLUMN galaxy_id SET DEFAULT nextval('public.galaxy_galaxy_id_seq'::regclass);


--
-- Name: moon moon_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon ALTER COLUMN moon_id SET DEFAULT nextval('public.moon_moon_id_seq'::regclass);


--
-- Name: people people_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.people ALTER COLUMN people_id SET DEFAULT nextval('public.people_people_id_seq'::regclass);


--
-- Name: planet planet_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet ALTER COLUMN planet_id SET DEFAULT nextval('public.planet_planet_id_seq'::regclass);


--
-- Name: star star_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star ALTER COLUMN star_id SET DEFAULT nextval('public.star_star_id_seq'::regclass);


--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES (1, 'A spiral galaxy with a bright central bulge', 'Milky Way', 13.6, 'Spiral');
INSERT INTO public.galaxy VALUES (2, 'A large galaxy with a prominent ring of dust', 'Andromeda', 10.1, 'Spiral');
INSERT INTO public.galaxy VALUES (3, 'An elliptical galaxy with little gas and dust', 'M87', 13.2, 'Elliptical');
INSERT INTO public.galaxy VALUES (4, 'A barred spiral galaxy with a distinct central bar', 'NGC 1300', 11.0, 'Barred Spiral');
INSERT INTO public.galaxy VALUES (5, 'An irregular galaxy with no distinct shape', 'Large Magellanic Cloud', 12.0, 'Irregular');
INSERT INTO public.galaxy VALUES (6, 'A lenticular galaxy with a large central bulge and a disk-like structure', 'NGC 5866', 10.5, 'Lenticular');


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (1, 'Earths only natural satellite', 'Moon', true, 1);
INSERT INTO public.moon VALUES (2, 'Largest moon of Saturn with a thick atmosphere', 'Titan', true, 2);
INSERT INTO public.moon VALUES (3, 'A Galilean moon of Jupiter with active volcanism', 'Io', true, 4);
INSERT INTO public.moon VALUES (4, 'A Galilean moon of Jupiter covered in ice', 'Europa', true, 4);
INSERT INTO public.moon VALUES (5, 'The largest moon in the Solar System, orbiting Jupiter', 'Ganymede', true, 4);
INSERT INTO public.moon VALUES (6, 'A Galilean moon of Jupiter with a heavily cratered surface', 'Callisto', true, 4);
INSERT INTO public.moon VALUES (7, 'The largest moon of Neptune', 'Triton', true, 3);
INSERT INTO public.moon VALUES (8, 'A large moon of Uranus with a heavily cratered surface', 'Titania', true, 5);
INSERT INTO public.moon VALUES (9, 'A moon of Uranus with a bright surface', 'Oberon', true, 5);
INSERT INTO public.moon VALUES (10, 'A moon of Uranus with a dark, cratered surface', 'Umbriel', true, 5);
INSERT INTO public.moon VALUES (11, 'A moon of Uranus with bright cliffs and deep canyons', 'Ariel', true, 5);
INSERT INTO public.moon VALUES (12, 'The innermost moon of Mars', 'Phobos', false, 3);
INSERT INTO public.moon VALUES (13, 'The outermost moon of Mars', 'Deimos', false, 3);
INSERT INTO public.moon VALUES (14, 'A small moon of Saturn with a very high albedo', 'Enceladus', true, 2);
INSERT INTO public.moon VALUES (15, 'A moon of Saturn with a very unusual two-tone coloration', 'Iapetus', true, 2);
INSERT INTO public.moon VALUES (16, 'A shepherd moon of Saturn, located within the F ring', 'Prometheus', false, 2);
INSERT INTO public.moon VALUES (17, 'A large moon of Saturn with extensive crater chains', 'Rhea', true, 2);
INSERT INTO public.moon VALUES (18, 'A moon of Pluto that is almost half its size', 'Charon', true, 4);
INSERT INTO public.moon VALUES (19, 'The second-largest moon of Neptune', 'Proteus', true, 3);
INSERT INTO public.moon VALUES (20, 'The second-largest moon of Saturn', 'Rheat', true, 2);


--
-- Data for Name: people; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.people VALUES (1, 'Alice Johnson', 28);
INSERT INTO public.people VALUES (2, 'Bob Smith', 34);
INSERT INTO public.people VALUES (3, 'Charlie Davis', 45);


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (1, 'A terrestrial planet with a dense atmosphere', 'Earth', 0, 1, true);
INSERT INTO public.planet VALUES (2, 'A gas giant with a prominent ring system', 'Saturn', 0, 1, false);
INSERT INTO public.planet VALUES (3, 'A rocky planet known for its red color', 'Mars', 0, 1, false);
INSERT INTO public.planet VALUES (4, 'A gas giant with a massive storm called the Great Red Spot', 'Jupiter', 0, 1, false);
INSERT INTO public.planet VALUES (5, 'An icy planet with a tilted orbit', 'Uranus', 0, 1, false);
INSERT INTO public.planet VALUES (6, 'A planet with extreme surface temperatures', 'Venus', 0, 1, false);
INSERT INTO public.planet VALUES (7, 'A small, rocky planet closest to the Sun', 'Mercury', 0, 1, false);
INSERT INTO public.planet VALUES (8, 'An exoplanet orbiting Proxima Centauri', 'Proxima b', 4, 2, false);
INSERT INTO public.planet VALUES (9, 'A gas giant in the Andromeda Galaxy', 'Andromeda A', 2500000, 2, false);
INSERT INTO public.planet VALUES (10, 'An icy planet in the Milky Way', 'Europa', 640, 3, false);
INSERT INTO public.planet VALUES (11, 'A rocky exoplanet orbiting Vega', 'Vega IX', 25, 6, false);
INSERT INTO public.planet VALUES (12, 'An exoplanet with potential for life', 'Kepler-22b', 600, 5, true);


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (1, 'A yellow dwarf star in the Milky Way', 'Sun', 0, 1);
INSERT INTO public.star VALUES (2, 'A red dwarf star in the Alpha Centauri system', 'Proxima Centauri', 4, 2);
INSERT INTO public.star VALUES (3, 'A red supergiant star in the Orion constellation', 'Betelgeuse', 642, 1);
INSERT INTO public.star VALUES (4, 'A white dwarf star in the constellation of Canis Minor', 'Procyon B', 11, 3);
INSERT INTO public.star VALUES (5, 'A blue supergiant star in the Large Magellanic Cloud', 'Rigel', 860, 5);
INSERT INTO public.star VALUES (6, 'A variable star in the constellation of Lyra', 'Vega', 25, 1);


--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_galaxy_id_seq', 6, true);


--
-- Name: moon_moon_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.moon_moon_id_seq', 20, true);


--
-- Name: people_people_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.people_people_id_seq', 3, true);


--
-- Name: planet_planet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_planet_id_seq', 12, true);


--
-- Name: star_star_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.star_star_id_seq', 6, true);


--
-- Name: galaxy galaxy_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_name_key UNIQUE (name);


--
-- Name: galaxy galaxy_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_pkey PRIMARY KEY (galaxy_id);


--
-- Name: moon moon_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_name_key UNIQUE (name);


--
-- Name: moon moon_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_pkey PRIMARY KEY (moon_id);


--
-- Name: people people_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.people
    ADD CONSTRAINT people_name_key UNIQUE (name);


--
-- Name: people people_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.people
    ADD CONSTRAINT people_pkey PRIMARY KEY (people_id);


--
-- Name: planet planet_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_name_key UNIQUE (name);


--
-- Name: planet planet_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_pkey PRIMARY KEY (planet_id);


--
-- Name: star star_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_name_key UNIQUE (name);


--
-- Name: star star_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_pkey PRIMARY KEY (star_id);


--
-- Name: moon moon_planet_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_planet_id_fkey FOREIGN KEY (planet_id) REFERENCES public.planet(planet_id);


--
-- Name: planet planet_star_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_star_id_fkey FOREIGN KEY (star_id) REFERENCES public.star(star_id);


--
-- Name: star star_galaxy_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_galaxy_id_fkey FOREIGN KEY (galaxy_id) REFERENCES public.galaxy(galaxy_id);


--
-- PostgreSQL database dump complete
--

