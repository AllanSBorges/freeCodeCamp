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
-- Name: asteroid; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.asteroid (
    asteroid_id integer NOT NULL,
    name character varying(30) NOT NULL,
    size numeric,
    shape character varying(30),
    star_id integer NOT NULL
);


ALTER TABLE public.asteroid OWNER TO freecodecamp;

--
-- Name: galaxy; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.galaxy (
    galaxy_id integer NOT NULL,
    name character varying(30) NOT NULL,
    diametro_em_parsecs bigint,
    age_in_millions_of_years numeric,
    forma_aparente character varying(15)
);


ALTER TABLE public.galaxy OWNER TO freecodecamp;

--
-- Name: moon; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.moon (
    moon_id integer NOT NULL,
    name character varying(30) NOT NULL,
    diametro_em_km integer,
    massa_em_kg integer,
    possui_vida boolean,
    planet_id integer NOT NULL
);


ALTER TABLE public.moon OWNER TO freecodecamp;

--
-- Name: planet; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.planet (
    planet_id integer NOT NULL,
    name character varying(30) NOT NULL,
    tipo character varying(15),
    zona_habitavel boolean NOT NULL,
    massa_em_kg integer,
    diametro_em_km integer,
    star_id integer NOT NULL,
    descricao text,
    possui_vida boolean
);


ALTER TABLE public.planet OWNER TO freecodecamp;

--
-- Name: star; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.star (
    star_id integer NOT NULL,
    name character varying(30) NOT NULL,
    massa_em_kg numeric,
    diamentro_em_km numeric,
    luminosidade_em_watt integer,
    galaxy_id integer NOT NULL
);


ALTER TABLE public.star OWNER TO freecodecamp;

--
-- Data for Name: asteroid; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.asteroid VALUES (1, 'asd1', 250, 'conico', 1);
INSERT INTO public.asteroid VALUES (2, 'sdsdh', 1000, 'desconhecido', 1);
INSERT INTO public.asteroid VALUES (3, 'x512', 523, 'esferico', 1);


--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES (1, 'Via Lactea', 12000, 56000, 'Espiral');
INSERT INTO public.galaxy VALUES (2, 'Andromeda', 10000, 76000, 'Inrregular');
INSERT INTO public.galaxy VALUES (3, 'Haze 1', 100000, 70000, 'Nebulosa');
INSERT INTO public.galaxy VALUES (4, 'AA43', 6600, 19000, 'Desconhecido');
INSERT INTO public.galaxy VALUES (5, 'AH4-27', 83000, 11300, 'Espiral');
INSERT INTO public.galaxy VALUES (6, 'QWRTY', 20000, 7600, 'Inrregular');


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (1, 'Lua', 25025, 6050, false, 1);
INSERT INTO public.moon VALUES (2, 'Europa', 50025, 12050, false, 5);
INSERT INTO public.moon VALUES (3, 'Lua Generica #1', 500, 250, false, 2);
INSERT INTO public.moon VALUES (4, 'Lua Generica #2', 50025, 12050, false, 5);
INSERT INTO public.moon VALUES (5, 'Lua Generica #3', 500, 250, false, 2);
INSERT INTO public.moon VALUES (6, 'Lua Generica #4', 50025, 12050, false, 5);
INSERT INTO public.moon VALUES (7, 'Lua Generica #5', 500, 250, false, 2);
INSERT INTO public.moon VALUES (8, 'Lua Generica #6', 50025, 12050, false, 6);
INSERT INTO public.moon VALUES (9, 'Lua Generica #7', 500, 250, false, 3);
INSERT INTO public.moon VALUES (10, 'Lua Generica #8', 50025, 12050, false, 6);
INSERT INTO public.moon VALUES (11, 'Lua Generica #9', 500, 250, false, 3);
INSERT INTO public.moon VALUES (12, 'Lua Generica #10', 50025, 12050, false, 5);
INSERT INTO public.moon VALUES (13, 'Lua Generica #11', 500, 250, false, 3);
INSERT INTO public.moon VALUES (14, 'Lua Generica #12', 50025, 12050, false, 4);
INSERT INTO public.moon VALUES (15, 'Lua Generica #13', 500, 250, false, 2);
INSERT INTO public.moon VALUES (16, 'Lua Generica #15', 50025, 12050, false, 5);
INSERT INTO public.moon VALUES (17, 'Lua Generica #14', 500, 250, false, 2);
INSERT INTO public.moon VALUES (18, 'Lua Generica #16', 50025, 12050, false, 5);
INSERT INTO public.moon VALUES (19, 'Lua Generica #17', 500, 250, false, 1);
INSERT INTO public.moon VALUES (20, 'Lua Generica #19', 50025, 12050, false, 3);


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (1, 'Terr', 'Terrestre', true, 145000, 12560, 1, 'Nosso Lar', true);
INSERT INTO public.planet VALUES (2, 'Marte', 'Terrestre', false, 145000, 12560, 1, 'Nosso Lar', false);
INSERT INTO public.planet VALUES (3, 'Plutao', 'Planeta Anao', false, 14500, 1256, 1, 'Nao e mais um planeta', false);
INSERT INTO public.planet VALUES (4, 'Jupiter', 'Gigante Gasoso', false, 550500, 120056, 1, 'Maior do Sistema Solar', false);
INSERT INTO public.planet VALUES (5, 'Saturno', 'Gigante Gasoso', false, 550500, 120056, 1, 'Planeta com varios aneis', false);
INSERT INTO public.planet VALUES (6, 'Mercurio', 'Terrestre', false, 55050, 12056, 1, 'Planeta mais proximo do Sol', false);
INSERT INTO public.planet VALUES (7, 'Venus', 'Terrestre', false, 54050, 20056, 1, 'Planeta mais quente', false);
INSERT INTO public.planet VALUES (8, 'Netuno', 'Terrestre', false, 54050, 20056, 1, 'Planeta mais frio', false);
INSERT INTO public.planet VALUES (9, 'Uranus', 'Gigante Gasoso', false, 78050, 21056, 1, 'Planeta estranho', false);
INSERT INTO public.planet VALUES (10, 'U12-0', 'Terrestre', true, 75050, 20056, 1, 'Exoplaneta', false);
INSERT INTO public.planet VALUES (11, 'X11-1', 'Terrestre', true, 75050, 20056, 1, 'Exoplaneta parecido com a Terra', false);
INSERT INTO public.planet VALUES (12, 'X11-3', 'Terrestre', true, 75050, 20056, 1, 'Exoplaneta ainda mais parecido com a Terra', false);


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (1, 'Sol', 120000000, 512000, 136, 1);
INSERT INTO public.star VALUES (2, 'Alpha Centauro', 360000000, 10000000, 272, 2);
INSERT INTO public.star VALUES (3, 'D-301', 340000000, 20000000, 300, 3);
INSERT INTO public.star VALUES (4, 'DW44', 2514812476, 648451454, 1000, 6);
INSERT INTO public.star VALUES (5, 'Ana Amarela #1', 123000000, 6565000000, 1200, 3);
INSERT INTO public.star VALUES (6, 'Gigante Vermelha', 56000000, 6523000, 560, 1);


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
-- Name: asteroid asteroid_star_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.asteroid
    ADD CONSTRAINT asteroid_star_id_fkey FOREIGN KEY (star_id) REFERENCES public.star(star_id);


--
-- Name: moon moon_planeta_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_planeta_id_fkey FOREIGN KEY (planet_id) REFERENCES public.planet(planet_id);


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


