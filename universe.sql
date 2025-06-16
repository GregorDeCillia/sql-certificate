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
-- Name: astronomer; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.astronomer (
    astronomer_id integer NOT NULL,
    name character varying(30) NOT NULL,
    american boolean NOT NULL,
    description text
);


ALTER TABLE public.astronomer OWNER TO freecodecamp;

--
-- Name: astronomer_astronomer_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.astronomer_astronomer_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.astronomer_astronomer_id_seq OWNER TO freecodecamp;

--
-- Name: astronomer_astronomer_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.astronomer_astronomer_id_seq OWNED BY public.astronomer.astronomer_id;


--
-- Name: galaxy; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.galaxy (
    galaxy_id integer NOT NULL,
    name character varying(10) NOT NULL,
    distance numeric,
    magnitude numeric,
    ngc integer
);


ALTER TABLE public.galaxy OWNER TO freecodecamp;

--
-- Name: galaxy_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.galaxy_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.galaxy_id_seq OWNER TO freecodecamp;

--
-- Name: galaxy_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.galaxy_id_seq OWNED BY public.galaxy.galaxy_id;


--
-- Name: moon; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.moon (
    moon_id integer NOT NULL,
    name character varying(10) NOT NULL,
    planet_id integer NOT NULL,
    radius numeric,
    discovered integer,
    astronomer_id integer
);


ALTER TABLE public.moon OWNER TO freecodecamp;

--
-- Name: moon_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.moon_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.moon_id_seq OWNER TO freecodecamp;

--
-- Name: moon_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.moon_id_seq OWNED BY public.moon.moon_id;


--
-- Name: planet; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.planet (
    planet_id integer NOT NULL,
    name character varying(10) NOT NULL,
    star_id integer NOT NULL,
    diameter numeric,
    temperature numeric
);


ALTER TABLE public.planet OWNER TO freecodecamp;

--
-- Name: planet_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.planet_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.planet_id_seq OWNER TO freecodecamp;

--
-- Name: planet_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.planet_id_seq OWNED BY public.planet.planet_id;


--
-- Name: star; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.star (
    star_id integer NOT NULL,
    name character varying(10) NOT NULL,
    galaxy_id integer NOT NULL,
    distance numeric,
    brightness_mv numeric,
    northern_hemisphere boolean
);


ALTER TABLE public.star OWNER TO freecodecamp;

--
-- Name: star_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.star_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.star_id_seq OWNER TO freecodecamp;

--
-- Name: star_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.star_id_seq OWNED BY public.star.star_id;


--
-- Name: astronomer astronomer_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.astronomer ALTER COLUMN astronomer_id SET DEFAULT nextval('public.astronomer_astronomer_id_seq'::regclass);


--
-- Name: galaxy galaxy_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy ALTER COLUMN galaxy_id SET DEFAULT nextval('public.galaxy_id_seq'::regclass);


--
-- Name: moon moon_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon ALTER COLUMN moon_id SET DEFAULT nextval('public.moon_id_seq'::regclass);


--
-- Name: planet planet_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet ALTER COLUMN planet_id SET DEFAULT nextval('public.planet_id_seq'::regclass);


--
-- Name: star star_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star ALTER COLUMN star_id SET DEFAULT nextval('public.star_id_seq'::regclass);


--
-- Data for Name: astronomer; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.astronomer VALUES (1, 'Gallileo', false, 'Galileo di Vincenzo Bonaiuti de Galilei (15 February 1564 - 8 January 1642), commonly referred to as Galileo Galilei,  was an Italian astronomer, physicist and engineer, sometimes described as a polymath. He was born in the city of Pisa, then part of the Duchy of Florence.[8] Galileo has been called the father of observational astronomy,[9] modern-era classical physics,[10] the scientific method,[11] and modern science.');
INSERT INTO public.astronomer VALUES (2, 'Hall', true, 'Asaph Hall III (October 15, 1829 - November 22, 1907) was an American astronomer who is best known for having discovered the two moons of Mars, Deimos and Phobos, in 1877. He determined the orbits of satellites of other planets and of double stars, the rotation of Saturn, and the mass of Mars.');
INSERT INTO public.astronomer VALUES (3, 'Nicholson', true, 'Seth Barnes Nicholson (November 12, 1891 - July 2, 1963) was an American astronomer. He worked at the Lick observatory in California, and is known for discovering several moons of Jupiter in the 20th century.');


--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES (8, 'Milky Way', 0, 6.5, NULL);
INSERT INTO public.galaxy VALUES (9, 'Andromeda', 2.5, 3.4, 224);
INSERT INTO public.galaxy VALUES (10, 'Triangulum', 2.9, 5.7, 598);
INSERT INTO public.galaxy VALUES (11, 'Centaurus', 13.7, 6.84, 5128);
INSERT INTO public.galaxy VALUES (12, 'Bode', 12, 6.94, 3031);
INSERT INTO public.galaxy VALUES (13, 'SMC', 0.2, 2.7, 292);


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (1, 'Moon', 1, 1738, NULL, NULL);
INSERT INTO public.moon VALUES (8, 'Amalthea', 2, 83.5, 1892, NULL);
INSERT INTO public.moon VALUES (9, 'Himalia', 2, 69.8, 1904, NULL);
INSERT INTO public.moon VALUES (10, 'Elara', 2, 39.95, 1905, NULL);
INSERT INTO public.moon VALUES (11, 'Pasiphae', 2, 28.9, 1908, NULL);
INSERT INTO public.moon VALUES (12, 'Sinope', 2, 17.5, 1914, NULL);
INSERT INTO public.moon VALUES (15, 'Ananke', 2, 14.55, 1951, NULL);
INSERT INTO public.moon VALUES (16, 'Leda', 2, 10.75, 1974, NULL);
INSERT INTO public.moon VALUES (17, 'Thebe', 2, 49.3, 1979, NULL);
INSERT INTO public.moon VALUES (18, 'Adrastea', 2, 8.2, 1979, NULL);
INSERT INTO public.moon VALUES (19, 'Metis', 2, 21.5, 1979, NULL);
INSERT INTO public.moon VALUES (20, 'Callirrhoe', 2, 4.8, 1999, NULL);
INSERT INTO public.moon VALUES (5, 'Europa', 2, 1560.8, 1610, 1);
INSERT INTO public.moon VALUES (6, 'Ganymede', 2, 2634.1, 1610, 1);
INSERT INTO public.moon VALUES (7, 'Callisto', 2, 2410.3, 1610, 1);
INSERT INTO public.moon VALUES (4, 'Io', 2, 1821.6, 1610, 1);
INSERT INTO public.moon VALUES (13, 'Lysithea', 2, 21.1, 1938, 3);
INSERT INTO public.moon VALUES (14, 'Carme', 2, 23.3, 1938, 3);
INSERT INTO public.moon VALUES (2, 'Phobos', 4, 11.267, 1877, 2);
INSERT INTO public.moon VALUES (3, 'Deimos', 4, 6.2, 1877, 2);


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (1, 'Earth', 1, 12.756, 15);
INSERT INTO public.planet VALUES (2, 'Jupiter', 1, 142.984, -121);
INSERT INTO public.planet VALUES (3, 'Neptune', 1, 49.528, -173);
INSERT INTO public.planet VALUES (4, 'Mars', 1, 4.879, 179);
INSERT INTO public.planet VALUES (5, 'Venus', 1, 12.104, 482);
INSERT INTO public.planet VALUES (6, 'Uranus', 1, 51.118, -193);
INSERT INTO public.planet VALUES (7, 'Mercury', 1, 4.879, 179);
INSERT INTO public.planet VALUES (8, 'Saturn', 1, 120.636, -125);
INSERT INTO public.planet VALUES (9, 'KEPLER-90b', 8, 16.536, NULL);
INSERT INTO public.planet VALUES (10, 'KEPLER-90c', 8, 15.010, NULL);
INSERT INTO public.planet VALUES (11, 'KEPLER-90h', 8, 143.990, NULL);
INSERT INTO public.planet VALUES (12, 'KEPLER-90g', 8, 103.413, NULL);


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (1, 'Sun', 8, 0, -26.74, NULL);
INSERT INTO public.star VALUES (2, 'Sirius', 8, 8.6, -1.46, false);
INSERT INTO public.star VALUES (3, 'Canopus', 8, 310, -0.74, false);
INSERT INTO public.star VALUES (4, 'Arcturus', 8, 37, -0.05, true);
INSERT INTO public.star VALUES (5, 'Vega', 8, 25, 0.03, true);
INSERT INTO public.star VALUES (7, 'Capella', 8, 43, 0.08, true);
INSERT INTO public.star VALUES (8, 'Kepler-90', 8, 2790, NULL, true);


--
-- Name: astronomer_astronomer_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.astronomer_astronomer_id_seq', 3, true);


--
-- Name: galaxy_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_id_seq', 13, true);


--
-- Name: moon_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.moon_id_seq', 20, true);


--
-- Name: planet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_id_seq', 12, true);


--
-- Name: star_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.star_id_seq', 8, true);


--
-- Name: astronomer astronomer_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.astronomer
    ADD CONSTRAINT astronomer_name_key UNIQUE (name);


--
-- Name: astronomer astronomer_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.astronomer
    ADD CONSTRAINT astronomer_pkey PRIMARY KEY (astronomer_id);


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
-- Name: moon moon_astronomer_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_astronomer_id_fkey FOREIGN KEY (astronomer_id) REFERENCES public.astronomer(astronomer_id);


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


