--
-- PostgreSQL database dump
--

-- Dumped from database version 13.2
-- Dumped by pg_dump version 13.2

-- Started on 2021-02-16 17:49:28

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
-- TOC entry 201 (class 1259 OID 16406)
-- Name: tbl_lesson; Type: TABLE; Schema: public; Owner: dbuser
--

CREATE TABLE public.tbl_lesson (
    id numeric NOT NULL,
    title character(250) NOT NULL,
    description character(250) NOT NULL
);


ALTER TABLE public.tbl_lesson OWNER TO dbuser;

--
-- TOC entry 200 (class 1259 OID 16401)
-- Name: tbl_user; Type: TABLE; Schema: public; Owner: dbuser
--

CREATE TABLE public.tbl_user (
    email character(50) NOT NULL,
    password character(150) NOT NULL
);


ALTER TABLE public.tbl_user OWNER TO dbuser;

--
-- TOC entry 202 (class 1259 OID 16548)
-- Name: tbl_user_lessons; Type: TABLE; Schema: public; Owner: dbuser
--

CREATE TABLE public.tbl_user_lessons (
    id_lesson numeric NOT NULL,
    email_user character(50) NOT NULL,
    status character(10)
);


ALTER TABLE public.tbl_user_lessons OWNER TO dbuser;

--
-- TOC entry 206 (class 1259 OID 16615)
-- Name: tbl_user_notes; Type: TABLE; Schema: public; Owner: dbuser
--

CREATE TABLE public.tbl_user_notes (
    id_note bigint NOT NULL,
    id_lesson numeric NOT NULL,
    email_user character(50) NOT NULL,
    note character(250)
);


ALTER TABLE public.tbl_user_notes OWNER TO dbuser;

--
-- TOC entry 205 (class 1259 OID 16613)
-- Name: tbl_user_notes_id_note_seq; Type: SEQUENCE; Schema: public; Owner: dbuser
--

CREATE SEQUENCE public.tbl_user_notes_id_note_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.tbl_user_notes_id_note_seq OWNER TO dbuser;

--
-- TOC entry 3029 (class 0 OID 0)
-- Dependencies: 205
-- Name: tbl_user_notes_id_note_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: dbuser
--

ALTER SEQUENCE public.tbl_user_notes_id_note_seq OWNED BY public.tbl_user_notes.id_note;


--
-- TOC entry 204 (class 1259 OID 16586)
-- Name: test; Type: TABLE; Schema: public; Owner: dbuser
--

CREATE TABLE public.test (
    id bigint NOT NULL,
    nombre character(19)
);


ALTER TABLE public.test OWNER TO dbuser;

--
-- TOC entry 203 (class 1259 OID 16584)
-- Name: test_id_seq; Type: SEQUENCE; Schema: public; Owner: dbuser
--

CREATE SEQUENCE public.test_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.test_id_seq OWNER TO dbuser;

--
-- TOC entry 3030 (class 0 OID 0)
-- Dependencies: 203
-- Name: test_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: dbuser
--

ALTER SEQUENCE public.test_id_seq OWNED BY public.test.id;


--
-- TOC entry 2872 (class 2604 OID 16618)
-- Name: tbl_user_notes id_note; Type: DEFAULT; Schema: public; Owner: dbuser
--

ALTER TABLE ONLY public.tbl_user_notes ALTER COLUMN id_note SET DEFAULT nextval('public.tbl_user_notes_id_note_seq'::regclass);


--
-- TOC entry 2871 (class 2604 OID 16589)
-- Name: test id; Type: DEFAULT; Schema: public; Owner: dbuser
--

ALTER TABLE ONLY public.test ALTER COLUMN id SET DEFAULT nextval('public.test_id_seq'::regclass);


--
-- TOC entry 3018 (class 0 OID 16406)
-- Dependencies: 201
-- Data for Name: tbl_lesson; Type: TABLE DATA; Schema: public; Owner: dbuser
--

INSERT INTO public.tbl_lesson VALUES (1, 'music lesson_1                                                                                                                                                                                                                                            ', 'about lesson_1                                                                                                                                                                                                                                            ');
INSERT INTO public.tbl_lesson VALUES (2, 'music lesson_2                                                                                                                                                                                                                                            ', 'about lesson_2                                                                                                                                                                                                                                            ');
INSERT INTO public.tbl_lesson VALUES (3, 'music lesson_3                                                                                                                                                                                                                                            ', 'about lesson_3                                                                                                                                                                                                                                            ');


--
-- TOC entry 3017 (class 0 OID 16401)
-- Dependencies: 200
-- Data for Name: tbl_user; Type: TABLE DATA; Schema: public; Owner: dbuser
--

INSERT INTO public.tbl_user VALUES ('user1@gmail.com                                   ', '1234                                                                                                                                                  ');
INSERT INTO public.tbl_user VALUES ('user2@gmail.com                                   ', '5678                                                                                                                                                  ');
INSERT INTO public.tbl_user VALUES ('user3@gmail.com                                   ', '98765                                                                                                                                                 ');


--
-- TOC entry 3019 (class 0 OID 16548)
-- Dependencies: 202
-- Data for Name: tbl_user_lessons; Type: TABLE DATA; Schema: public; Owner: dbuser
--

INSERT INTO public.tbl_user_lessons VALUES (2, 'user1@gmail.com                                   ', 'pending   ');
INSERT INTO public.tbl_user_lessons VALUES (1, 'user2@gmail.com                                   ', 'pending   ');
INSERT INTO public.tbl_user_lessons VALUES (1, 'user1@gmail.com                                   ', 'In review ');


--
-- TOC entry 3023 (class 0 OID 16615)
-- Dependencies: 206
-- Data for Name: tbl_user_notes; Type: TABLE DATA; Schema: public; Owner: dbuser
--



--
-- TOC entry 3021 (class 0 OID 16586)
-- Dependencies: 204
-- Data for Name: test; Type: TABLE DATA; Schema: public; Owner: dbuser
--

INSERT INTO public.test VALUES (1, 'diego              ');


--
-- TOC entry 3031 (class 0 OID 0)
-- Dependencies: 205
-- Name: tbl_user_notes_id_note_seq; Type: SEQUENCE SET; Schema: public; Owner: dbuser
--

SELECT pg_catalog.setval('public.tbl_user_notes_id_note_seq', 4, true);


--
-- TOC entry 3032 (class 0 OID 0)
-- Dependencies: 203
-- Name: test_id_seq; Type: SEQUENCE SET; Schema: public; Owner: dbuser
--

SELECT pg_catalog.setval('public.test_id_seq', 1, true);


--
-- TOC entry 2876 (class 2606 OID 16413)
-- Name: tbl_lesson tbl_lesson_pkey; Type: CONSTRAINT; Schema: public; Owner: dbuser
--

ALTER TABLE ONLY public.tbl_lesson
    ADD CONSTRAINT tbl_lesson_pkey PRIMARY KEY (id);


--
-- TOC entry 2878 (class 2606 OID 16565)
-- Name: tbl_user_lessons tbl_user_lessons_pkey; Type: CONSTRAINT; Schema: public; Owner: dbuser
--

ALTER TABLE ONLY public.tbl_user_lessons
    ADD CONSTRAINT tbl_user_lessons_pkey PRIMARY KEY (id_lesson, email_user);


--
-- TOC entry 2882 (class 2606 OID 16623)
-- Name: tbl_user_notes tbl_user_notes_pkey; Type: CONSTRAINT; Schema: public; Owner: dbuser
--

ALTER TABLE ONLY public.tbl_user_notes
    ADD CONSTRAINT tbl_user_notes_pkey PRIMARY KEY (id_note);


--
-- TOC entry 2874 (class 2606 OID 16405)
-- Name: tbl_user tbl_user_pkey; Type: CONSTRAINT; Schema: public; Owner: dbuser
--

ALTER TABLE ONLY public.tbl_user
    ADD CONSTRAINT tbl_user_pkey PRIMARY KEY (email);


--
-- TOC entry 2880 (class 2606 OID 16591)
-- Name: test test_pkey; Type: CONSTRAINT; Schema: public; Owner: dbuser
--

ALTER TABLE ONLY public.test
    ADD CONSTRAINT test_pkey PRIMARY KEY (id);


--
-- TOC entry 2884 (class 2606 OID 16559)
-- Name: tbl_user_lessons tbl_user_lessons_email_user_fkey; Type: FK CONSTRAINT; Schema: public; Owner: dbuser
--

ALTER TABLE ONLY public.tbl_user_lessons
    ADD CONSTRAINT tbl_user_lessons_email_user_fkey FOREIGN KEY (email_user) REFERENCES public.tbl_user(email);


--
-- TOC entry 2883 (class 2606 OID 16554)
-- Name: tbl_user_lessons tbl_user_lessons_id_lesson_fkey; Type: FK CONSTRAINT; Schema: public; Owner: dbuser
--

ALTER TABLE ONLY public.tbl_user_lessons
    ADD CONSTRAINT tbl_user_lessons_id_lesson_fkey FOREIGN KEY (id_lesson) REFERENCES public.tbl_lesson(id);


--
-- TOC entry 2886 (class 2606 OID 16629)
-- Name: tbl_user_notes tbl_user_notes_email_user_fkey; Type: FK CONSTRAINT; Schema: public; Owner: dbuser
--

ALTER TABLE ONLY public.tbl_user_notes
    ADD CONSTRAINT tbl_user_notes_email_user_fkey FOREIGN KEY (email_user) REFERENCES public.tbl_user(email);


--
-- TOC entry 2885 (class 2606 OID 16624)
-- Name: tbl_user_notes tbl_user_notes_id_lesson_fkey; Type: FK CONSTRAINT; Schema: public; Owner: dbuser
--

ALTER TABLE ONLY public.tbl_user_notes
    ADD CONSTRAINT tbl_user_notes_id_lesson_fkey FOREIGN KEY (id_lesson) REFERENCES public.tbl_lesson(id);


-- Completed on 2021-02-16 17:49:28

--
-- PostgreSQL database dump complete
--

