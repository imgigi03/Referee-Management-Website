--
-- PostgreSQL database dump
--

-- Dumped from database version 16.4
-- Dumped by pg_dump version 16.4

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
-- Name: arbitro; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.arbitro (
    username character varying(255) NOT NULL,
    email character varying(255) NOT NULL,
    nome character varying(255) NOT NULL,
    cognome character varying(255) NOT NULL,
    password character varying(255) NOT NULL
);


ALTER TABLE public.arbitro OWNER TO postgres;

--
-- Name: giocatore; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.giocatore (
    id_giocatore integer NOT NULL,
    nome_giocatore character varying(255),
    n_maglia integer,
    nome_squadra character varying(255)
);


ALTER TABLE public.giocatore OWNER TO postgres;

--
-- Name: partecipazione_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.partecipazione_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.partecipazione_id_seq OWNER TO postgres;

--
-- Name: partecipazione; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.partecipazione (
    id_partecipazione integer DEFAULT nextval('public.partecipazione_id_seq'::regclass) NOT NULL,
    id_giocatore integer,
    id_partita integer,
    stato_giocatore character varying(255),
    minuto character varying(255)
);


ALTER TABLE public.partecipazione OWNER TO postgres;

--
-- Name: partita; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.partita (
    id_partita integer NOT NULL,
    data_partita date,
    n_giornata integer,
    nome_stadio character varying(255),
    nome_squadra1 character varying(255),
    nome_squadra2 character varying(255)
);


ALTER TABLE public.partita OWNER TO postgres;

--
-- Name: referto_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.referto_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.referto_id_seq OWNER TO postgres;

--
-- Name: referto; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.referto (
    id_referto integer DEFAULT nextval('public.referto_id_seq'::regclass) NOT NULL,
    stato_partita character varying(255),
    numero_falli integer,
    id_partita integer,
    id_arbitro character varying(255)
);


ALTER TABLE public.referto OWNER TO postgres;

--
-- Name: squadra; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.squadra (
    nome_squadra character varying(255) NOT NULL
);


ALTER TABLE public.squadra OWNER TO postgres;

--
-- Data for Name: arbitro; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.arbitro (username, email, nome, cognome, password) FROM stdin;
matt01	matteo03@gmail.com	Matteo	D'Onofrio	$2y$10$1V7PrT5z7x08U2q/oj2dQu3W5SB74ebRz1zDpz/Q7/fq5KFib4JSa
gigi02	luigi@gmail.com	Luigi	Cocco	$2y$10$VzeYOk3IS/MDPP5QUGWc1.NjDuSMGC.4namiSE6mHzzaUsMpcKa8G
contalds03	contaldo@gmail.com	Luigi	Contaldo	$2y$10$IsKFGqfsCa3K/VHdhxDzkOjMq6UFm8zOqHrhXc1hMkRQzck93n2kC
fab04	matteo@gmail.com	Fabrizio	D'Errico	$2y$10$sHhmYzSgsz2oUSGyBV4pHOpd5y.LyQ3zgwikXE.98mAnyS5LeSA7i
\.


--
-- Data for Name: giocatore; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.giocatore (id_giocatore, nome_giocatore, n_maglia, nome_squadra) FROM stdin;
1	Yann Sommer	1	Inter
2	Alessandro Bastoni	95	Inter
3	Nicolo Barella	23	Inter
4	Hakan Calhanoglu	20	Inter
5	Lautaro Martinez	10	Inter
6	Marcus Thuram	9	Inter
7	Mike Maignan	16	Milan
8	Kyle Walker	32	Milan
9	Tijani Rejinders	14	Milan
10	Joao Felix	79	Milan
11	Santiago Gimenez	7	Milan
12	Christian Pulisic	11	Milan
13	Marco Carnesecchi	29	Atalanta
14	Isak Hien	4	Atalanta
15	Charles De Ketelare	17	Atalanta
16	Ederson	13	Atalanta
17	Ademola Lookman	11	Atalanta
18	Mateo Retegui	32	Atalanta
19	Mattia Perin	1	Juventus
20	Gleison Bremer	3	Juventus
21	Weston Mckennie	16	Juventus
22	Francisco Conceicao	7	Juventus
23	Kephren Thuram	19	Juventus
24	Randal Kolo Muani	20	Juventus
25	Mile Svilar	99	Roma
26	Mats Hummels	15	Roma
27	Angelino	3	Roma
28	Alexis Saelemaekers	56	Roma
29	Paulo Dybala	21	Roma
30	Stephan El Sharawy	92	Roma
31	Ivan Provedel	94	Lazio
32	Mario Gila	34	Lazio
33	Fisayo Dele-Bashiru	7	Lazio
34	Pedro	9	Lazio
35	Gustav Isaksen	18	Lazio
36	Boulaye Dia	19	Lazio
\.


--
-- Data for Name: partecipazione; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.partecipazione (id_partecipazione, id_giocatore, id_partita, stato_giocatore, minuto) FROM stdin;
158	19	1	assente	
159	20	1	assente	
160	21	1	marcatore	2
161	22	1	assente	
162	23	1	ammonito	5
163	24	1	marcatore	10
164	7	1	assente	
165	8	1	assente	
166	9	1	espulso	5
167	10	1	marcatore	45
168	11	1	marcatore	23
169	12	1	ammonito	12
170	25	2	assente	
171	26	2	espulso	10
172	27	2	marcatore	23
173	28	2	ammonito	22
174	29	2	marcatore	15
175	30	2	assente	
176	31	2	assente	
177	32	2	ammonito	7
178	33	2	marcatore	18
179	34	2	marcatore	19
180	35	2	espulso	76
181	36	2	marcatore	90
182	13	3	presente	7
183	14	3	ammonito	10
184	15	3	marcatore	21
185	16	3	espulso	13
186	17	3	marcatore	90
187	18	3	presente	
188	31	3	presente	
189	32	3	assente	
190	33	3	marcatore	15
191	34	3	marcatore	28
192	35	3	presente	
193	36	3	presente	
194	1	5	presente	
195	2	5	presente	
196	3	5	marcatore	23
197	4	5	marcatore	29
198	5	5	ammonito	7
199	6	5	assente	
200	7	5	presente	
201	8	5	espulso	76
202	9	5	presente	
203	10	5	presente	
204	11	5	marcatore	16
205	12	5	assente	
206	19	6	presente	
207	20	6	presente	
208	21	6	ammonito	10
209	22	6	presente	
210	23	6	assente	
211	24	6	presente	
212	7	6	presente	
213	8	6	ammonito	15
214	9	6	presente	
215	10	6	espulso	39
216	11	6	presente	
217	12	6	assente	
218	7	4	presente	
219	8	4	ammonito	10
220	9	4	marcatore	18
221	10	4	marcatore	34
222	11	4	presente	
223	12	4	marcatore, marcatore	45, 67
224	25	4	presente	
225	26	4	espulso	65
226	27	4	marcatore	28
227	28	4	marcatore	76
228	29	4	marcatore	59
229	30	4	ammonito	27
\.


--
-- Data for Name: partita; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.partita (id_partita, data_partita, n_giornata, nome_stadio, nome_squadra1, nome_squadra2) FROM stdin;
1	2025-02-19	1	Allianz Stadium	Juventus	Milan
2	2025-02-25	2	Stadio Olimpico	Roma	Lazio
3	2025-02-26	3	Gewiss Stadium	Atalanta	Lazio
4	2025-03-04	3	Giuseppe Meazza	Milan	Roma
5	2025-03-10	4	Giuseppe Meazza	Inter	Milan
6	2025-03-12	5	Allianz Stadium	Juventus	Milan
7	2025-03-20	6	Stadio Olimpico	Lazio	Juventus
8	2025-03-27	6	Giuseppe Meazza	Inter	Juventus
9	2025-04-02	7	Allianz Stadium	Juventus	Roma
10	2025-04-03	7	Gewiss Stadium	Atalanta	Inter
\.


--
-- Data for Name: referto; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.referto (id_referto, stato_partita, numero_falli, id_partita, id_arbitro) FROM stdin;
18	2-2	14	1	matt01
19	2-3	16	2	matt01
20	2-2	16	3	matt01
22	2-1	18	5	gigi02
23	0-0	28	6	contalds03
21	4-3	31	4	fab04
24		0	7	matt01
25		0	8	gigi02
26		0	9	contalds03
27		0	10	fab04
\.


--
-- Data for Name: squadra; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.squadra (nome_squadra) FROM stdin;
Inter
Milan
Juventus
Atalanta
Roma
Lazio
\.


--
-- Name: partecipazione_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.partecipazione_id_seq', 229, true);


--
-- Name: referto_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.referto_id_seq', 27, true);


--
-- Name: arbitro arbitro_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.arbitro
    ADD CONSTRAINT arbitro_pkey PRIMARY KEY (username);


--
-- Name: giocatore giocatore_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.giocatore
    ADD CONSTRAINT giocatore_pkey PRIMARY KEY (id_giocatore);


--
-- Name: partecipazione partecipazione_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.partecipazione
    ADD CONSTRAINT partecipazione_pkey PRIMARY KEY (id_partecipazione);


--
-- Name: partita partita_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.partita
    ADD CONSTRAINT partita_pkey PRIMARY KEY (id_partita);


--
-- Name: referto refert0_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.referto
    ADD CONSTRAINT refert0_pkey PRIMARY KEY (id_referto);


--
-- Name: squadra squadra_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.squadra
    ADD CONSTRAINT squadra_pkey PRIMARY KEY (nome_squadra);


--
-- Name: giocatore giocatore_nome_squadra_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.giocatore
    ADD CONSTRAINT giocatore_nome_squadra_fkey FOREIGN KEY (nome_squadra) REFERENCES public.squadra(nome_squadra);


--
-- Name: partecipazione partecipazione_id_giocatore_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.partecipazione
    ADD CONSTRAINT partecipazione_id_giocatore_fkey FOREIGN KEY (id_giocatore) REFERENCES public.giocatore(id_giocatore);


--
-- Name: partecipazione partecipazione_id_partita_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.partecipazione
    ADD CONSTRAINT partecipazione_id_partita_fkey FOREIGN KEY (id_partita) REFERENCES public.partita(id_partita);


--
-- Name: partita partita_nome_squadra1_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.partita
    ADD CONSTRAINT partita_nome_squadra1_fkey FOREIGN KEY (nome_squadra1) REFERENCES public.squadra(nome_squadra);


--
-- Name: partita partita_nome_squadra2_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.partita
    ADD CONSTRAINT partita_nome_squadra2_fkey FOREIGN KEY (nome_squadra2) REFERENCES public.squadra(nome_squadra);


--
-- Name: referto refert0_id_arbitro_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.referto
    ADD CONSTRAINT refert0_id_arbitro_fkey FOREIGN KEY (id_arbitro) REFERENCES public.arbitro(username);


--
-- Name: referto refert0_id_partita_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.referto
    ADD CONSTRAINT refert0_id_partita_fkey FOREIGN KEY (id_partita) REFERENCES public.partita(id_partita);


--
-- Name: TABLE arbitro; Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON TABLE public.arbitro TO www;


--
-- Name: TABLE giocatore; Type: ACL; Schema: public; Owner: postgres
--

GRANT SELECT ON TABLE public.giocatore TO www;


--
-- Name: SEQUENCE partecipazione_id_seq; Type: ACL; Schema: public; Owner: postgres
--

GRANT SELECT,USAGE ON SEQUENCE public.partecipazione_id_seq TO www;


--
-- Name: TABLE partecipazione; Type: ACL; Schema: public; Owner: postgres
--

GRANT SELECT,INSERT,DELETE,UPDATE ON TABLE public.partecipazione TO www;


--
-- Name: TABLE partita; Type: ACL; Schema: public; Owner: postgres
--

GRANT SELECT ON TABLE public.partita TO www;


--
-- Name: SEQUENCE referto_id_seq; Type: ACL; Schema: public; Owner: postgres
--

GRANT SELECT,USAGE ON SEQUENCE public.referto_id_seq TO www;


--
-- Name: TABLE referto; Type: ACL; Schema: public; Owner: postgres
--

GRANT SELECT,INSERT,DELETE,UPDATE ON TABLE public.referto TO www;


--
-- Name: TABLE squadra; Type: ACL; Schema: public; Owner: postgres
--

GRANT SELECT ON TABLE public.squadra TO www;


--
-- PostgreSQL database dump complete
--

