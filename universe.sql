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
-- Name: asteroid; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.asteroid (
    asteroid_id integer NOT NULL,
    name character varying,
    belt character varying NOT NULL,
    star_id integer,
    planet_id integer,
    diameter_km numeric(5,2) NOT NULL,
    discovery text NOT NULL
);


ALTER TABLE public.asteroid OWNER TO freecodecamp;

--
-- Name: asteroid_asteroid_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.asteroid_asteroid_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.asteroid_asteroid_id_seq OWNER TO freecodecamp;

--
-- Name: asteroid_asteroid_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.asteroid_asteroid_id_seq OWNED BY public.asteroid.asteroid_id;


--
-- Name: galaxy; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.galaxy (
    galaxy_id integer NOT NULL,
    name character varying NOT NULL,
    galaxy_type character varying NOT NULL,
    distance_kly integer NOT NULL,
    stars_b integer NOT NULL,
    is_spherical boolean NOT NULL,
    have_blackhole boolean NOT NULL,
    description text,
    discovery character varying NOT NULL
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
    name character varying,
    planet_id integer,
    star_id integer,
    galaxy_id integer,
    moon_type character varying NOT NULL,
    orbit_dist_km integer NOT NULL,
    diameter_km numeric(8,2),
    features text
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
    name character varying,
    star_id integer,
    galaxy_id integer,
    planet_type character varying NOT NULL,
    distance_star numeric(7,3) NOT NULL,
    mass_em numeric(10,5) NOT NULL,
    support_life boolean NOT NULL,
    feature text
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
    name character varying,
    galaxy_id integer,
    star_type character varying NOT NULL,
    mass_sm numeric(5,2) NOT NULL,
    luminosity_rts numeric(10,4) NOT NULL,
    temprature integer NOT NULL,
    features text
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
-- Name: asteroid asteroid_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.asteroid ALTER COLUMN asteroid_id SET DEFAULT nextval('public.asteroid_asteroid_id_seq'::regclass);


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
-- Data for Name: asteroid; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.asteroid VALUES (1, 'Ceres', 'Asteroid Belt', 1, 9, 939.00, 'Giuseppe Piazzi in 1801');
INSERT INTO public.asteroid VALUES (2, 'Vesta', 'Asteroid Belt', 1, 9, 525.00, 'Heinrich Olbers in 1807');
INSERT INTO public.asteroid VALUES (3, 'Pallas', 'Asteroid Belt', 1, 9, 512.00, 'Heinrich Olbers in 1802');
INSERT INTO public.asteroid VALUES (4, 'Hygiea', 'Asteroid Belt', 1, 9, 430.00, 'Annibale de Gasparis in 1849');
INSERT INTO public.asteroid VALUES (5, 'Eros', 'Near Earth', 1, 8, 16.80, 'Gustav Witt in 1898');


--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES (1, 'Milky Way', 'barred spiral', 27, 400, false, true, 'Home Galaxy of Our Solar System', 'Since Antiquity');
INSERT INTO public.galaxy VALUES (2, 'Andromeda', 'spiral', 2500, 1000, false, true, 'Largest Galaxy close to Milky Way', 'Al Sufi in 964 AD');
INSERT INTO public.galaxy VALUES (3, 'Triangulum', 'spiral', 3000, 40, false, true, 'Small Galaxy from Local Group of Galaxies', 'Charles Messier in 1764');
INSERT INTO public.galaxy VALUES (4, 'Sombrero', 'lenticular', 28000, 100, true, true, 'Bright Central Bulge', 'Pierre Mechain');
INSERT INTO public.galaxy VALUES (5, 'Whirlpool', 'spiral', 31000, 100, false, true, 'Prominent Spiral Arms', 'Charles Messier in 1773');
INSERT INTO public.galaxy VALUES (6, 'Messier 87-M87', 'eliptical', 53000, 1000, true, true, 'Home Of Famous Black Holes', 'Charles Messier in 1781');
INSERT INTO public.galaxy VALUES (7, 'IC 1101', 'eliptical', 1040000, 100000, true, true, 'Supergiant Eliptical and Largest known Galaxy', 'William Herschel in 1790');
INSERT INTO public.galaxy VALUES (8, 'Cartwheel', 'ring', 500000, 100, false, true, 'Unique Ring Structured Galaxy', 'Fritz Zwicky in 1941');


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (1, 'Moon', 8, 1, 1, 'Natural Satt', 384400, 3474.00, 'Only Natural Satellite of Earth');
INSERT INTO public.moon VALUES (2, 'Phobos', 9, 1, 1, 'Natural Satt', 9377, 22.40, 'Closest Moon to Planet');
INSERT INTO public.moon VALUES (3, 'Deimos', 9, 1, 1, 'Natural Satt', 23460, 12.40, 'Smaller and Farther than Phobos');
INSERT INTO public.moon VALUES (4, 'Io', 10, 1, 1, 'Volcanic Moon', 421800, 3643.00, 'Most Volcanically Active');
INSERT INTO public.moon VALUES (5, 'Europa', 10, 1, 1, 'Icy Moon', 671100, 3121.00, 'Potential Subsurface Ocean');
INSERT INTO public.moon VALUES (6, 'Ganymede', 10, 1, 1, 'Icy Moon', 1070400, 5268.00, 'Largest Moon in Solar System');
INSERT INTO public.moon VALUES (7, 'Callisto', 10, 1, 1, 'Icy Moon', 1882700, 4821.00, 'Oldest and most Cratered Surface');
INSERT INTO public.moon VALUES (8, 'Titan', 11, 1, 1, 'Icy Moon', 1222000, 5150.00, 'Only Moon with Thick Atmosphere');
INSERT INTO public.moon VALUES (9, 'Enceladus', 11, 1, 1, 'Icy Moon', 238000, 504.00, 'Geysers of Water Vapors');
INSERT INTO public.moon VALUES (10, 'Mimas', 11, 1, 1, 'Icy Moon', 185520, 396.00, 'Looks like Death Star');
INSERT INTO public.moon VALUES (11, 'Triton', 13, 1, 1, 'Icy Moon', 354800, 2710.00, 'Retrograde Orbit');
INSERT INTO public.moon VALUES (12, 'Charon', 1, 1, 1, 'Icy Moon', 19640, 1212.00, 'Largest with respect to its planet');
INSERT INTO public.moon VALUES (13, 'Hydra', 1, 1, 1, 'Icy Moon', 64738, 52.00, 'Outermost Moon of Pluto');
INSERT INTO public.moon VALUES (14, 'Proxima b', 4, 5, 1, 'Hypothetical Satt', 0, 0.00, 'Could Indicate Tidal Locking');
INSERT INTO public.moon VALUES (15, 'Proxima c', 5, 5, 1, 'Hypothetical Satt', 0, 0.00, 'Could Influence Tidal Impact');
INSERT INTO public.moon VALUES (16, 'Amalthea', 10, 1, 1, 'Natural Satt', 181400, 167.00, 'Irregular Shape, mainly Rock & Ice');
INSERT INTO public.moon VALUES (17, 'Thebe', 10, 1, 1, 'Natural Satt', 222000, 100.00, 'Inner Moon of Jupiter');
INSERT INTO public.moon VALUES (18, 'Adrastea', 10, 1, 1, 'Natural Satt', 129000, 20.00, 'Orbits inside Jupiter Ring System');
INSERT INTO public.moon VALUES (19, 'Himalia', 10, 1, 1, 'Irregular Moon', 11500000, 170.00, 'Largest of Jupiter Irregular Moons');
INSERT INTO public.moon VALUES (20, 'Nix', 1, 1, 1, 'Icy Moon', 48700, 49.00, 'Water and Icy Atmosphere,Irregular Shape');


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (1, 'Pluto', 1, 1, 'Dwarf Planet', 39.500, 0.00220, false, 'Demoted from Planet Status in 2006');
INSERT INTO public.planet VALUES (2, 'Ceres', 1, 1, 'Dwarf Planet', 2.770, 0.00015, false, 'Largest Object in Asteroid Belt');
INSERT INTO public.planet VALUES (3, 'Makemake', 1, 1, 'Dwarf Planet', 45.800, 0.00066, false, 'Extremely Cold Surface Temprature');
INSERT INTO public.planet VALUES (4, 'Proxima b', 5, 1, 'Exoplanet', 0.050, 1.27000, false, 'Closest Exoplanet to Earth');
INSERT INTO public.planet VALUES (5, 'Proxima c', 5, 1, 'Exoplanet', 1.500, 7.00000, false, 'Possible Long Orbital Period');
INSERT INTO public.planet VALUES (6, 'Mercury', 1, 1, 'Terrestrial', 0.390, 0.05500, false, 'Smallest Planet,Close to Sun');
INSERT INTO public.planet VALUES (7, 'Venus', 1, 1, 'Terrestrial', 0.720, 0.81500, false, 'Hottest Planet due to Green House Effect');
INSERT INTO public.planet VALUES (8, 'Earth', 1, 1, 'Terrestrial', 1.000, 1.00000, true, 'Home Planet of Humanity');
INSERT INTO public.planet VALUES (9, 'Mars', 1, 1, 'Terrestrial', 1.520, 0.10700, false, 'Known as Red Planet');
INSERT INTO public.planet VALUES (10, 'Jupiter', 1, 1, 'Gas Giant', 5.200, 318.00000, false, 'Largest Planet,famous for Great Red Spot');
INSERT INTO public.planet VALUES (11, 'Saturn', 1, 1, 'Gas Giant', 9.580, 95.20000, false, 'Known for its Extensive Ring Systems');
INSERT INTO public.planet VALUES (12, 'Uranus', 1, 1, 'Ice Giant', 19.200, 14.50000, false, 'Rotates on its Side');
INSERT INTO public.planet VALUES (13, 'Neptune', 1, 1, 'Ice Giant', 30.100, 17.10000, false, 'Known for its Deep Blue Color and Storms');


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (1, 'Sun', 1, 'G-Type', 1.00, 1.0000, 5778, 'Supports Life on Earth');
INSERT INTO public.star VALUES (2, 'Betelgeuse', 1, 'Red Supergiant', 20.00, 100000.0000, 3500, 'Part of ORION Constellation');
INSERT INTO public.star VALUES (3, 'Sirius A', 1, 'A1V-Type', 2.02, 25.4000, 9940, 'Brightest Star in Night Sky');
INSERT INTO public.star VALUES (4, 'Rigel', 1, 'Blue Supergiant', 21.00, 120000.0000, 12000, 'Brightest Star in ORION Constellation');
INSERT INTO public.star VALUES (5, 'Proxima Centauri', 1, 'Red Dwarf', 0.12, 0.0017, 3050, 'Closest Star to Sun');
INSERT INTO public.star VALUES (6, 'Alpha Centauri A', 1, 'G-Type', 1.10, 1.5000, 5800, 'Part of Alpha Centauri System');
INSERT INTO public.star VALUES (7, 'Cygnus X-1', 1, 'Black Hole', 21.00, 0.0000, 0, 'Strong X-ray Resource');
INSERT INTO public.star VALUES (8, 'Vega', 1, 'A-Type', 2.10, 40.0000, 9600, 'Known for Fast Rotation');
INSERT INTO public.star VALUES (9, 'Deneb', 1, 'Blue Supergiant', 19.00, 196000.0000, 8525, 'Part of Summer Triangle');
INSERT INTO public.star VALUES (10, 'Antares', 1, 'Red Supergiant', 12.00, 10000.0000, 3400, 'Heart of SCORPIUS Constellation');


--
-- Name: asteroid_asteroid_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.asteroid_asteroid_id_seq', 5, true);


--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_galaxy_id_seq', 8, true);


--
-- Name: moon_moon_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.moon_moon_id_seq', 20, true);


--
-- Name: planet_planet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_planet_id_seq', 13, true);


--
-- Name: star_star_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.star_star_id_seq', 10, true);


--
-- Name: asteroid asteroid_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.asteroid
    ADD CONSTRAINT asteroid_name_key UNIQUE (name);


--
-- Name: asteroid asteroid_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.asteroid
    ADD CONSTRAINT asteroid_pkey PRIMARY KEY (asteroid_id);


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
-- Name: asteroid asteroid_planet_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.asteroid
    ADD CONSTRAINT asteroid_planet_id_fkey FOREIGN KEY (planet_id) REFERENCES public.planet(planet_id);


--
-- Name: asteroid asteroid_star_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.asteroid
    ADD CONSTRAINT asteroid_star_id_fkey FOREIGN KEY (star_id) REFERENCES public.star(star_id);


--
-- Name: moon moon_galaxy_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_galaxy_id_fkey FOREIGN KEY (galaxy_id) REFERENCES public.galaxy(galaxy_id);


--
-- Name: moon moon_planet_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_planet_id_fkey FOREIGN KEY (planet_id) REFERENCES public.planet(planet_id);


--
-- Name: moon moon_star_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_star_id_fkey FOREIGN KEY (star_id) REFERENCES public.star(star_id);


--
-- Name: planet planet_galaxy_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_galaxy_id_fkey FOREIGN KEY (galaxy_id) REFERENCES public.galaxy(galaxy_id);


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

