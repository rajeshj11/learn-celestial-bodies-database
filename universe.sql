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
    name character varying(40) NOT NULL,
    description text,
    has_life boolean,
    is_spherical boolean,
    age_in_millions_of_years integer,
    galaxy_types character varying(40),
    distance_from_earth numeric(15,6)
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
-- Name: galaxy_types; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.galaxy_types (
    galaxy_types_id integer NOT NULL,
    name character varying(40) NOT NULL,
    description text
);


ALTER TABLE public.galaxy_types OWNER TO freecodecamp;

--
-- Name: galaxy_types_galaxy_types_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.galaxy_types_galaxy_types_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.galaxy_types_galaxy_types_id_seq OWNER TO freecodecamp;

--
-- Name: galaxy_types_galaxy_types_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.galaxy_types_galaxy_types_id_seq OWNED BY public.galaxy_types.galaxy_types_id;


--
-- Name: moon; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.moon (
    moon_id integer NOT NULL,
    name character varying(40) NOT NULL,
    description text,
    has_life boolean,
    is_spherical boolean,
    age_in_millions_of_years integer,
    planet_id integer NOT NULL,
    distance_from_earth numeric(15,6)
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
-- Name: planet; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.planet (
    planet_id integer NOT NULL,
    name character varying(40) NOT NULL,
    description text,
    has_life boolean,
    is_spherical boolean,
    age_in_millions_of_years integer,
    star_id integer NOT NULL,
    distance_from_earth numeric(15,6)
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
    name character varying(40) NOT NULL,
    description text,
    has_life boolean,
    is_spherical boolean,
    age_in_millions_of_years integer,
    galaxy_id integer NOT NULL,
    distance_from_earth numeric(15,6)
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
-- Name: galaxy_types galaxy_types_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy_types ALTER COLUMN galaxy_types_id SET DEFAULT nextval('public.galaxy_types_galaxy_types_id_seq'::regclass);


--
-- Name: moon moon_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon ALTER COLUMN moon_id SET DEFAULT nextval('public.moon_moon_id_seq'::regclass);


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

INSERT INTO public.galaxy VALUES (1, 'Milky Way', 'Our home galaxy', true, true, 13000, 'Spiral', 25000.123456);
INSERT INTO public.galaxy VALUES (2, 'Andromeda', 'Nearest spiral galaxy', false, true, 11000, 'Spiral', 30000.789012);
INSERT INTO public.galaxy VALUES (3, 'Triangulum', 'Third-largest galaxy in Local Group', false, true, 9000, 'Spiral', 40000.345678);
INSERT INTO public.galaxy VALUES (4, 'Messier 87', 'Virgo supercluster', false, true, 13000, 'Elliptical', 50000.678901);
INSERT INTO public.galaxy VALUES (5, 'Whirlpool', 'Interacting galaxy with M51', false, true, 12000, 'Spiral', 35000.234567);
INSERT INTO public.galaxy VALUES (6, 'Sombrero', 'Unusual galaxy with a prominent bulge', false, true, 12500, 'Spiral', 45000.567890);


--
-- Data for Name: galaxy_types; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy_types VALUES (1, 'type1', NULL);
INSERT INTO public.galaxy_types VALUES (2, 'type2', NULL);
INSERT INTO public.galaxy_types VALUES (3, 'type3', NULL);


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (1, 'Moon', 'Earth''s natural satellite', false, true, 4500, 1, 0.384000);
INSERT INTO public.moon VALUES (2, 'Phobos', 'Mars''s larger moon', false, true, 4000, 2, 9.400000);
INSERT INTO public.moon VALUES (3, 'Deimos', 'Mars''s smaller moon', false, true, 4000, 2, 23.500000);
INSERT INTO public.moon VALUES (4, 'Ganymede', 'Jupiter''s largest moon', false, true, 5000, 3, 7.200000);
INSERT INTO public.moon VALUES (5, 'Europa', 'Jupiter''s icy moon', false, true, 5000, 3, 4.800000);
INSERT INTO public.moon VALUES (6, 'Io', 'Jupiter''s volcanic moon', false, true, 5000, 3, 5.900000);
INSERT INTO public.moon VALUES (7, 'Titan', 'Saturn''s largest moon', false, true, 6000, 4, 1.200000);
INSERT INTO public.moon VALUES (8, 'Enceladus', 'Saturn''s icy moon', false, true, 6000, 4, 1.300000);
INSERT INTO public.moon VALUES (9, 'Mimas', 'Saturn''s smallest round moon', false, true, 6000, 4, 1.600000);
INSERT INTO public.moon VALUES (10, 'Miranda', 'Uranus''s small icy moon', false, true, 7000, 5, 1.200000);
INSERT INTO public.moon VALUES (11, 'Ariel', 'Uranus''s moon with ice and rock', false, true, 7000, 5, 1.900000);
INSERT INTO public.moon VALUES (12, 'Triton', 'Neptune''s largest moon', false, true, 8000, 6, 2.700000);
INSERT INTO public.moon VALUES (13, 'Proteus', 'Neptune''s second largest moon', false, true, 8000, 6, 4.700000);
INSERT INTO public.moon VALUES (14, 'Caliban', 'Neptune''s small irregular moon', false, true, 8000, 6, 7.200000);
INSERT INTO public.moon VALUES (15, 'Phoebe', 'Saturn''s irregular moon', false, true, 6000, 4, 12.900000);
INSERT INTO public.moon VALUES (16, 'Luna', 'Moon of Earth', false, true, 4500, 1, 0.384000);
INSERT INTO public.moon VALUES (17, 'Oberon', 'Moon of Uranus', false, true, 7000, 5, 5.900000);
INSERT INTO public.moon VALUES (18, 'Rhea', 'Moon of Saturn', false, true, 6000, 4, 2.400000);
INSERT INTO public.moon VALUES (19, 'Dione', 'Moon of Saturn', false, true, 6000, 4, 2.700000);
INSERT INTO public.moon VALUES (20, 'Iapetus', 'Moon of Saturn', false, true, 6000, 4, 3.600000);


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (1, 'Earth', 'Home sweet home', true, true, 4500, 1, 1.000000);
INSERT INTO public.planet VALUES (2, 'Mars', 'Red planet', false, true, 4000, 1, 1.500000);
INSERT INTO public.planet VALUES (3, 'Jupiter', 'Giant gas planet', false, false, 5000, 2, 5.200000);
INSERT INTO public.planet VALUES (4, 'Saturn', 'Ringed planet', false, true, 6000, 2, 9.500000);
INSERT INTO public.planet VALUES (5, 'Uranus', 'Ice giant', false, true, 7000, 3, 19.200000);
INSERT INTO public.planet VALUES (6, 'Neptune', 'Blue planet', false, true, 8000, 3, 30.100000);
INSERT INTO public.planet VALUES (7, 'Mercury', 'Closest planet to the Sun', false, true, 4600, 1, 0.400000);
INSERT INTO public.planet VALUES (8, 'Venus', 'Twin sister of Earth', false, true, 4700, 1, 0.700000);
INSERT INTO public.planet VALUES (9, 'Kepler-186f', 'Exoplanet in the habitable zone', true, true, 2500, 4, 490.000000);
INSERT INTO public.planet VALUES (10, 'Gliese 581g', 'Potentially habitable exoplanet', true, true, 2300, 5, 20.000000);
INSERT INTO public.planet VALUES (11, 'HD 209458 b', 'Hot Jupiter exoplanet', false, false, 1500, 6, 150.000000);
INSERT INTO public.planet VALUES (12, 'Proxima b', 'Closest exoplanet to Earth', true, true, 6200, 2, 4.240000);


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (1, 'Sun', 'Our star', false, true, 4600, 1, 0.000000);
INSERT INTO public.star VALUES (2, 'Proxima Centauri', 'Closest star to the Sun', false, false, 6200, 1, 4.240000);
INSERT INTO public.star VALUES (3, 'Alpha Centauri A', 'Binary star system', false, false, 6200, 1, 4.370000);
INSERT INTO public.star VALUES (4, 'Alpha Centauri B', 'Binary star system', false, false, 6200, 1, 4.370000);
INSERT INTO public.star VALUES (5, 'Sirius', 'Brightest star in the night sky', false, false, 9000, 2, 8.600000);
INSERT INTO public.star VALUES (6, 'Vega', 'Bright star in the northern sky', false, false, 4000, 3, 25.000000);


--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_galaxy_id_seq', 6, true);


--
-- Name: galaxy_types_galaxy_types_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_types_galaxy_types_id_seq', 3, true);


--
-- Name: moon_moon_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.moon_moon_id_seq', 20, true);


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
-- Name: galaxy_types galaxy_types_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy_types
    ADD CONSTRAINT galaxy_types_name_key UNIQUE (name);


--
-- Name: galaxy_types galaxy_types_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy_types
    ADD CONSTRAINT galaxy_types_pkey PRIMARY KEY (galaxy_types_id);


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


