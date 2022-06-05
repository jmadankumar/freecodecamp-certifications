--
-- PostgreSQL database dump
--

-- Dumped from database version 12.9 (Ubuntu 12.9-2.pgdg20.04+1)
-- Dumped by pg_dump version 12.9 (Ubuntu 12.9-2.pgdg20.04+1)

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
-- Name: draft_planet; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.draft_planet (
    draft_planet_id integer NOT NULL,
    name character varying(40) NOT NULL,
    description text,
    has_life boolean,
    is_spherical boolean,
    planet_types character varying(60),
    ages_in_million_years numeric(10,2),
    distance_from_earth numeric(10,2),
    temp_in_deg numeric(10,2),
    star_id integer
);


ALTER TABLE public.draft_planet OWNER TO freecodecamp;

--
-- Name: draft_planet_draft_plant_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.draft_planet_draft_plant_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.draft_planet_draft_plant_id_seq OWNER TO freecodecamp;

--
-- Name: draft_planet_draft_plant_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.draft_planet_draft_plant_id_seq OWNED BY public.draft_planet.draft_planet_id;


--
-- Name: galaxy; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.galaxy (
    galaxy_id integer NOT NULL,
    name character varying(40) NOT NULL,
    description text,
    galaxy_types character varying(60),
    distance_from_earth numeric(10,2)
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
    name character varying(40) NOT NULL,
    description text,
    distance_from_earth numeric(10,2),
    planet_id integer,
    temp_in_deg numeric(10,2),
    ages_in_million_years numeric(10,2)
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
    planet_types character varying(60),
    ages_in_million_year integer,
    distance_from_earth numeric(10,2),
    earth_days numeric(10,2),
    star_id integer
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
-- Name: draft_planet draft_planet_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.draft_planet ALTER COLUMN draft_planet_id SET DEFAULT nextval('public.draft_planet_draft_plant_id_seq'::regclass);


--
-- Name: galaxy galaxy_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy ALTER COLUMN galaxy_id SET DEFAULT nextval('public.galaxy_galaxy_id_seq'::regclass);


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
-- Data for Name: draft_planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.draft_planet VALUES (1, 'Eris', 'Eris', false, false, 'sphere', 100.24, 0.00, 1.00, 1);
INSERT INTO public.draft_planet VALUES (2, 'Pluto', 'Pluto', false, false, 'sphere', 100.24, 0.00, 1.00, 1);
INSERT INTO public.draft_planet VALUES (3, 'Haumea', 'Haumea', false, false, 'sphere', 100.24, 0.00, 1.00, 1);
INSERT INTO public.draft_planet VALUES (4, 'MakeMake', 'MakeMake', false, false, 'sphere', 100.24, 0.00, 1.00, 1);
INSERT INTO public.draft_planet VALUES (5, 'Ceres', 'Ceres', false, false, 'sphere', 100.24, 0.00, 1.00, 1);


--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES (1, 'Milky way', 'Milky way', 'spiral', 0.00);
INSERT INTO public.galaxy VALUES (2, 'Canis Major Overdensity', 'Canis Major Overdensity', 'irregular', 30.00);
INSERT INTO public.galaxy VALUES (3, 'Sagittarius Dwarf Spheroidal Galaxy', 'Sagittarius Dwarf Spheroidal Galaxy', 'elliptical', 42.10);
INSERT INTO public.galaxy VALUES (4, 'Large Magellanic Cloud', 'Large Magellanic Cloud', 'irregular', 50.00);
INSERT INTO public.galaxy VALUES (5, 'Boötes I', 'Boötes I', 'spiral', 55.37);
INSERT INTO public.galaxy VALUES (6, 'Small Magellanic Cloud', 'Small Magellanic Cloud', 'irregular', 73.70);


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (1, 'Moon', 'Moon', 3.40, 1, 200.00, 20.00);
INSERT INTO public.moon VALUES (2, 'Metis', 'Metis', 3.40, 5, 200.00, 20.00);
INSERT INTO public.moon VALUES (3, 'Adrastea', 'Adrastea', 3.40, 5, 200.00, 20.00);
INSERT INTO public.moon VALUES (4, 'Amalthea', 'Amalthea', 3.40, 5, 200.00, 20.00);
INSERT INTO public.moon VALUES (5, 'Thebe', 'Thebe', 3.40, 5, 200.00, 20.00);
INSERT INTO public.moon VALUES (6, 'Europa', 'Europa', 3.40, 5, 200.00, 20.00);
INSERT INTO public.moon VALUES (7, 'Ganymede', 'Ganymede', 3.40, 5, 200.00, 20.00);
INSERT INTO public.moon VALUES (8, 'Callisto', 'Callisto', 3.40, 5, 200.00, 20.00);
INSERT INTO public.moon VALUES (9, 'Leda', 'Leda', 3.40, 5, 200.00, 20.00);
INSERT INTO public.moon VALUES (10, 'Ersa', 'Ersa', 3.40, 5, 200.00, 20.00);
INSERT INTO public.moon VALUES (11, 'Carpo', 'Carpo', 3.40, 5, 200.00, 20.00);
INSERT INTO public.moon VALUES (12, 'Pandia', 'Pandia', 3.40, 5, 200.00, 20.00);
INSERT INTO public.moon VALUES (13, 'Mneme', 'Mneme', 3.40, 5, 200.00, 20.00);
INSERT INTO public.moon VALUES (14, 'Orthosie', 'Orthosie', 3.40, 5, 200.00, 20.00);
INSERT INTO public.moon VALUES (15, 'Mimas', 'Mimas', 3.40, 6, 200.00, 20.00);
INSERT INTO public.moon VALUES (16, 'Enceladus', 'Enceladus', 3.40, 6, 200.00, 20.00);
INSERT INTO public.moon VALUES (17, 'Tethys', 'Tethys', 3.40, 6, 200.00, 20.00);
INSERT INTO public.moon VALUES (18, 'Dione', 'Dione', 3.40, 6, 200.00, 20.00);
INSERT INTO public.moon VALUES (19, 'Rhea', 'Rhea', 3.40, 6, 200.00, 20.00);
INSERT INTO public.moon VALUES (20, 'Titan', 'Titan', 3.40, 6, 200.00, 20.00);


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (1, 'Earth', 'Earth', true, true, 'sphere', 100, 0.00, 1.00, 1);
INSERT INTO public.planet VALUES (2, 'Mercury', 'Mercury', false, false, 'sphere', 100, 0.00, 1.00, 1);
INSERT INTO public.planet VALUES (3, 'Venus', 'Venus', false, false, 'sphere', 100, 0.00, 1.00, 1);
INSERT INTO public.planet VALUES (4, 'Mars', 'Mars', false, false, 'sphere', 100, 0.00, 1.00, 1);
INSERT INTO public.planet VALUES (5, 'Jupiter', 'Jupiter', false, false, 'sphere', 100, 0.00, 1.00, 1);
INSERT INTO public.planet VALUES (6, 'Saturn', 'Saturn', false, false, 'sphere', 100, 0.00, 1.00, 1);
INSERT INTO public.planet VALUES (7, 'Uranus', 'Uranus', false, false, 'sphere', 100, 0.00, 1.00, 1);
INSERT INTO public.planet VALUES (8, 'Neptune', 'Neptune', false, false, 'sphere', 100, 0.00, 1.00, 1);
INSERT INTO public.planet VALUES (9, 'Canis Mercury', 'Canis Mercury', false, false, 'sphere', 100, 0.00, 1.00, 2);
INSERT INTO public.planet VALUES (10, 'Canis Venus', 'Canis Venus', false, false, 'sphere', 100, 0.00, 1.00, 2);
INSERT INTO public.planet VALUES (11, 'Canis Earth', 'Canis Earth', false, false, 'sphere', 100, 0.00, 1.00, 2);
INSERT INTO public.planet VALUES (12, 'Canis Mars', 'Canis Mars', false, false, 'sphere', 100, 0.00, 1.00, 2);


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (1, 'Solar System', 'Solar System', 0, 1);
INSERT INTO public.star VALUES (2, 'Canis Solar System', 'Canis Solar System', 30, 2);
INSERT INTO public.star VALUES (3, 'Sagittarius Solar System', 'Sagittarius Solar System', 42, 3);
INSERT INTO public.star VALUES (4, 'Large Magellanic Solar System', 'Large Magellanic  Solar System', 50, 4);
INSERT INTO public.star VALUES (5, 'Boötes I Solar System', 'Boötes I Solar System', 55, 5);
INSERT INTO public.star VALUES (6, 'Small Magellanic Cloud Solar System', 'Small Magellanic Cloud Solar System', 74, 6);


--
-- Name: draft_planet_draft_plant_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.draft_planet_draft_plant_id_seq', 1, true);


--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_galaxy_id_seq', 2, true);


--
-- Name: moon_moon_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.moon_moon_id_seq', 1, true);


--
-- Name: planet_planet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_planet_id_seq', 1, true);


--
-- Name: star_star_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.star_star_id_seq', 1, true);


--
-- Name: draft_planet draft_planet_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.draft_planet
    ADD CONSTRAINT draft_planet_name_key UNIQUE (name);


--
-- Name: draft_planet draft_planet_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.draft_planet
    ADD CONSTRAINT draft_planet_pkey PRIMARY KEY (draft_planet_id);


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
-- Name: draft_planet draft_planet_star_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.draft_planet
    ADD CONSTRAINT draft_planet_star_id_fkey FOREIGN KEY (star_id) REFERENCES public.star(star_id);


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

