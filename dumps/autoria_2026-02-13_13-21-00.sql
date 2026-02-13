--
-- PostgreSQL database dump
--

\restrict SYW2M2OPcP9TYzHsPdaUegDwPaIVbp66eRbKmBAJBI5DvQDKAxxcXeUa58fYkf1

-- Dumped from database version 16.12
-- Dumped by pg_dump version 17.8 (Debian 17.8-0+deb13u1)

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET transaction_timeout = 0;
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
-- Name: info_cars; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.info_cars (
    id integer NOT NULL,
    url text NOT NULL,
    title text,
    price_usd numeric,
    odometer integer,
    username text,
    phone_number bigint,
    image_url text,
    images_count integer,
    car_number text,
    car_vin text,
    datetime_found timestamp without time zone DEFAULT now()
);


--
-- Name: info_cars_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.info_cars_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: info_cars_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.info_cars_id_seq OWNED BY public.info_cars.id;


--
-- Name: info_cars id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.info_cars ALTER COLUMN id SET DEFAULT nextval('public.info_cars_id_seq'::regclass);


--
-- Data for Name: info_cars; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.info_cars (id, url, title, price_usd, odometer, username, phone_number, image_url, images_count, car_number, car_vin, datetime_found) FROM stdin;
1	https://auto.ria.com/uk/auto_ford_fusion_36103595.html	\N	\N	\N	\N	\N	\N	\N	\N	\N	2026-02-13 11:20:01.570107
2	https://auto.ria.com/uk/auto_mercedes_benz_s_class_39430253.html	\N	\N	\N	\N	\N	\N	\N	\N	\N	2026-02-13 11:20:01.570107
3	https://auto.ria.com/uk/auto_mercedes_benz_evito_39346065.html	Mercedes-Benz eVito 2021	28700	257000	Сергій Станіславович	380673140436	https://cdn4.riastatic.com/photosnew/auto/photo/mercedes-benz_evito__629749259fx.jpg	160	\N	W1V44770513893982	2026-02-13 11:20:01.570107
4	https://auto.ria.com/uk/auto_toyota_camry_39430068.html	Toyota Camry 2021	38888	18000	Авторитет Черкаси 	380671818888	https://cdn4.riastatic.com/photosnew/auto/photo/toyota_camry__629962389fx.jpg	25	AH 0065 KI	JTNB23HK203095942	2026-02-13 11:20:01.570107
5	https://auto.ria.com/uk/auto_audi_q5_39435143.html	Audi Q5 2020	31900	98000	Ім`я не вказане	380632072725	https://cdn1.riastatic.com/photosnew/auto/photo/audi_q5__630102311fx.jpg	106	\N	WA1AAAFY5M2010239	2026-02-13 11:20:01.570107
6	https://auto.ria.com/uk/auto_audi_q5_39432782.html	Audi Q5 2019	24900	79000	Ім`я не вказане	380632072725	https://cdn3.riastatic.com/photosnew/auto/photo/audi_q5__630038753fx.jpg	100	\N	WA1ANAFY9K2068873	2026-02-13 11:20:01.570107
7	https://auto.ria.com/uk/auto_audi_q5_39410912.html	Audi Q5 2020	32500	60000	Ім`я не вказане	380632072725	https://cdn2.riastatic.com/photosnew/auto/photo/audi_q5__629419007fx.jpg	62	\N	WA1AAAFY3M2038637	2026-02-13 11:20:01.570107
8	https://auto.ria.com/uk/auto_bmw_m5_38836273.html	BMW M5 2020	127000	35000	V8-MOTORS	380684020000	https://cdn1.riastatic.com/photosnew/auto/photo/bmw_m5__613771126fx.jpg	40	\N	WBS81CH080CF33102	2026-02-13 11:20:01.570107
9	https://auto.ria.com/uk/auto_mercedes_benz_sprinter_39030931.html	\N	\N	\N	\N	\N	\N	\N	\N	\N	2026-02-13 11:20:01.570107
10	https://auto.ria.com/uk/auto_bmw_x5_37241541.html	BMW X5 2016	17500	152000	Misha	380932625416	https://cdn4.riastatic.com/photosnew/auto/photo/bmw_x5__569486699fx.jpg	19	KA 8146 MB	5UXKR2C52G0R71639	2026-02-13 11:20:01.570107
11	https://auto.ria.com/uk/auto_mercedes_benz_e_class_39457950.html	Mercedes-Benz E-Class 2009	11999	362000	Михайло	380957414478	https://cdn4.riastatic.com/photosnew/auto/photo/mercedes-benz_e-class__630737124fx.jpg	34	\N	WDD2120251A069945	2026-02-13 11:20:05.071296
12	https://auto.ria.com/uk/auto_nissan_almera_39473727.html	\N	\N	\N	\N	\N	\N	\N	\N	\N	2026-02-13 11:20:05.071296
13	https://auto.ria.com/uk/auto_bmw_x5_39269125.html	BMW X5 2018	48500	125000	Віталій	\N	https://cdn1.riastatic.com/photosnew/auto/photo/bmw_x5__625501311fx.jpg	39	KA 1966 PT	5UXCR6C50KLK85585	2026-02-13 11:20:05.071296
14	https://auto.ria.com/uk/auto_kia_niro_39445932.html	Kia Niro 2020	18950	89000	Юрій	380683964126	https://cdn3.riastatic.com/photosnew/auto/photo/kia_niro__630402703fx.jpg	70	\N	KNACC81GFL5056864	2026-02-13 11:20:05.071296
15	https://auto.ria.com/uk/auto_volkswagen_tiguan_39464180.html	Volkswagen Tiguan 2016	12150	190000	Роман Степанович	380965139116	https://cdn1.riastatic.com/photosnew/auto/photo/volkswagen_tiguan__630902726fx.jpg	70	\N	WVGBV7AX3GW526267	2026-02-13 11:20:05.071296
16	https://auto.ria.com/uk/auto_bmw_3_series_39451423.html	BMW 3 Series 2021	40900	65000	Владислава	380503402147	https://cdn3.riastatic.com/photosnew/auto/photo/bmw_3-series__630555088fx.jpg	26	KA 1432 MO	WBA5P580308B61740	2026-02-13 11:20:05.071296
17	https://auto.ria.com/uk/auto_volkswagen_passat_39473558.html	Volkswagen Passat 2010	5900	335000	Andrian	380932339195	https://cdn3.riastatic.com/photosnew/auto/photo/volkswagen_passat__631169703fx.jpg	35	BC 2655 XA	WVWZZZ3CZAE203569	2026-02-13 11:20:05.071296
18	https://auto.ria.com/uk/auto_toyota_camry_39426464.html	\N	\N	\N	\N	\N	\N	\N	\N	\N	2026-02-13 11:20:05.071296
19	https://auto.ria.com/uk/auto_ford_escape_39473752.html	Ford Escape 2013	9300	135000	Власник	380969192911	https://cdn0.riastatic.com/photosnew/auto/photo/ford_escape__631176295fx.jpg	2	BI 1721 IH	1FMCU0GX4DUC61257	2026-02-13 11:20:05.071296
20	https://auto.ria.com/uk/auto_tesla_model_3_39442338.html	Tesla Model 3 2023	18500	30000	Ім`я не вказане	380632072725	https://cdn4.riastatic.com/photosnew/auto/photo/tesla_model-3__630302789fx.jpg	66	\N	5YJ3E1EA9PF646932	2026-02-13 11:20:05.071296
21	https://auto.ria.com/uk/auto_porsche_cayenne_39394676.html	Porsche Cayenne 2017	27600	120000	Valeriy	380933658067	https://cdn1.riastatic.com/photosnew/auto/photo/porsche_cayenne__630759661fx.jpg	43	\N	WP1AA2A23HKA88604	2026-02-13 11:20:07.935615
22	https://auto.ria.com/uk/auto_audi_a4_39461643.html	Audi A4 2011	10800	293000	Александр	380674061996	https://cdn0.riastatic.com/photosnew/auto/photo/audi_a4__630854280fx.jpg	24	\N	WAUZZZ8KXBA137402	2026-02-13 11:20:07.935615
23	https://auto.ria.com/uk/auto_volkswagen_tiguan_39410640.html	Volkswagen Tiguan 2014	12999	181000	Ігор Іванович	380634289994	https://cdn2.riastatic.com/photosnew/auto/photo/volkswagen_tiguan__629413292fx.jpg	88	\N	WVGBV3AX8EW109071	2026-02-13 11:20:07.935615
24	https://auto.ria.com/uk/auto_volkswagen_golf_39473568.html	Volkswagen Golf 2019	15350	230000	Ростислав	380937990098	https://cdn3.riastatic.com/photosnew/auto/photo/volkswagen_golf__631170843fx.jpg	143	\N	WVWZZZAUZJP579467	2026-02-13 11:20:07.935615
25	https://auto.ria.com/uk/auto_peugeot_4008_39325102.html	\N	\N	\N	\N	\N	\N	\N	\N	\N	2026-02-13 11:20:07.935615
26	https://auto.ria.com/uk/auto_tesla_model_3_39345220.html	Tesla Model 3 2025	30500	5000	Олександр	380960002300	https://cdn1.riastatic.com/photosnew/auto/photo/tesla_model-3__631169676fx.jpg	24	AI 0773 YC	5YJ3E1EA8SF010642	2026-02-13 11:20:07.935615
27	https://auto.ria.com/uk/auto_skoda_octavia_39473508.html	\N	\N	\N	\N	\N	\N	\N	\N	\N	2026-02-13 11:20:07.935615
28	https://auto.ria.com/uk/auto_skoda_octavia_39461192.html	Skoda Octavia 2020	21499	145000	Віктор	380981584838	https://cdn2.riastatic.com/photosnew/auto/photo/skoda_octavia__630823337fx.jpg	32	KA 1014 PE	TMBJG7NX4MY052205	2026-02-13 11:20:07.935615
29	https://auto.ria.com/uk/auto_audi_q5_39470731.html	Audi Q5 2020	28900	139000	Ім`я не вказане	380632072725	https://cdn3.riastatic.com/photosnew/auto/photo/audi_q5__631087878fx.jpg	104	\N	WA1AAAFY3M2002205	2026-02-13 11:20:07.935615
30	https://auto.ria.com/uk/auto_mercedes_benz_s_class_39172208.html	Mercedes-Benz S-Class 2016	49000	88000	Богдан Горлай	380993683291	https://cdn0.riastatic.com/photosnew/auto/photo/mercedes-benz_s-class__622797460fx.jpg	24	BC 7775 KP	WDD2221331A276431	2026-02-13 11:20:07.935615
31	https://auto.ria.com/uk/auto_chrysler_voyager_39348416.html	Chrysler Voyager 2006	4200	407000	Богдан	380988342886	https://cdn3.riastatic.com/photosnew/auto/photo/chrysler_voyager__627703148fx.jpg	12	AC 8557 CE	1A8GYB25X6Y134528	2026-02-13 11:20:11.348012
32	https://auto.ria.com/uk/auto_volkswagen_passat_39392598.html	\N	\N	\N	\N	\N	\N	\N	\N	\N	2026-02-13 11:20:11.348012
33	https://auto.ria.com/uk/auto_audi_e_tron_s_39264681.html	Audi e-tron S 2022	46580	77000	Руслан	380933228888	https://cdn2.riastatic.com/photosnew/auto/photo/audi_e-tron-s__625375902fx.jpg	96	\N	WAUZZZGEXNB045684	2026-02-13 11:20:11.348012
34	https://auto.ria.com/uk/auto_mazda_3_39414739.html	Mazda 3 2013	6500	199000	Микола	\N	https://cdn2.riastatic.com/photosnew/auto/photo/mazda_3__629536102fx.jpg	17	KE 9648 AX	JM1BL1LP6D1833364	2026-02-13 11:20:11.348012
98	https://auto.ria.com/uk/auto_mercedes_benz_e_class_39441962.html	\N	\N	\N	\N	\N	\N	\N	\N	\N	2026-02-13 11:20:29.766542
35	https://auto.ria.com/uk/auto_bmw_1_series_39399883.html	BMW 1 Series 2005	5150	222000	Олег	380996988842	https://cdn2.riastatic.com/photosnew/auto/photo/bmw_1-series__629110657fx.jpg	37	BK 3163 IT	WBAUF11040PT58985	2026-02-13 11:20:11.348012
36	https://auto.ria.com/uk/auto_tesla_model_y_39473280.html	Tesla Model Y 2021	20999	67000	Олександр Сергійович	380687882512	https://cdn1.riastatic.com/photosnew/auto/photo/tesla_model-y__631162726fx.jpg	112	BC 1506 YB	5YJYGDEE1MF263910	2026-02-13 11:20:11.348012
37	https://auto.ria.com/uk/auto_mercedes_benz_sprinter_39303882.html	Mercedes-Benz Sprinter 2019	25900	364000	Freshauto	380987081919	https://cdn1.riastatic.com/photosnew/auto/photo/mercedes-benz_sprinter__626464666fx.jpg	34	\N	W1V9076331P257245	2026-02-13 11:20:11.348012
38	https://auto.ria.com/uk/auto_audi_a6_39460611.html	Audi A6 2013	15999	308000	Ілля Сікора	380997535940	https://cdn1.riastatic.com/photosnew/auto/photo/audi_a6__630807201fx.jpg	45	BC 1162 XA	WAUZZZ4G7DN134180	2026-02-13 11:20:11.348012
39	https://auto.ria.com/uk/auto_volkswagen_id_4_39413273.html	Volkswagen ID.4 2021	22350	104000	Степан Андрійович	380966431043	https://cdn1.riastatic.com/photosnew/auto/photo/volkswagen_id-4__629490696fx.jpg	70	\N	WVGZZZE2ZMP010064	2026-02-13 11:20:11.348012
40	https://auto.ria.com/uk/auto_bmw_3_series_39463141.html	BMW 3 Series 2015	12850	159000	Роман Степанович	\N	https://cdn1.riastatic.com/photosnew/auto/photo/bmw_3-series__630873706fx.jpg	70	\N	WBA3A5C53FF607799	2026-02-13 11:20:11.348012
41	https://auto.ria.com/uk/auto_renault_trafic_39473457.html	Renault Trafic 2023	27900	110000	Богдан Валерійович Козак	380973595134	https://cdn1.riastatic.com/photosnew/auto/photo/renault_trafic__631167971fx.jpg	39	\N	VF6T8200X70418912	2026-02-13 11:20:13.923522
42	https://auto.ria.com/uk/auto_bmw_x7_39473142.html	BMW X7 2024	142000	38000	TOPCARS.KIEV	380676942858	https://cdn2.riastatic.com/photosnew/auto/photo/bmw_x7__631182872fx.jpg	87	\N	WBA21EN0509W85598	2026-02-13 11:20:13.923522
43	https://auto.ria.com/uk/auto_mercedes_benz_sprinter_39446423.html	Mercedes-Benz Sprinter 2020	26500	192000	Компанія Sprinter-Аvto 	380976535009	https://cdn4.riastatic.com/photosnew/auto/photo/mercedes-benz_sprinter__630417254fx.jpg	26	\N	W1V9071332N119582	2026-02-13 11:20:13.923522
44	https://auto.ria.com/uk/auto_porsche_macan_39418052.html	Porsche Macan 2018	26999	143000	Саша	380983601414	https://cdn2.riastatic.com/photosnew/auto/photo/porsche_macan__629630552fx.jpg	48	\N	WP1AA2A55JLB15540	2026-02-13 11:20:13.923522
45	https://auto.ria.com/uk/auto_kia_niro_39359863.html	Kia Niro 2021	21337	107000	IZI AUTO LUTSK	380970102233	https://cdn4.riastatic.com/photosnew/auto/photo/kia_niro__628025009fx.jpg	85	\N	KNACC81GFM5086938	2026-02-13 11:20:13.923522
46	https://auto.ria.com/uk/auto_audi_q7_39466291.html	Audi Q7 2016	43900	218000	Ім`я не вказане	380632072725	https://cdn0.riastatic.com/photosnew/auto/photo/audi_q7__630961840fx.jpg	148	HC 0700 EH	WAUZZZ4M9HD035264	2026-02-13 11:20:13.923522
47	https://auto.ria.com/uk/auto_jeep_cherokee_39348552.html	Jeep Cherokee 2014	12000	159000	Саша	380977501312	https://cdn4.riastatic.com/photosnew/auto/photo/jeep_cherokee__627706834fx.jpg	8	AT 2010 IB	1C4PJMBS5FW546705	2026-02-13 11:20:13.923522
48	https://auto.ria.com/uk/auto_toyota_land_cruiser_34134098.html	Toyota Land Cruiser 2011	29500	385000	Роман Леонідович Юрків	\N	https://cdn4.riastatic.com/photosnew/auto/photo/toyota_land-cruiser__629139564fx.jpg	17	КO 2552 KO	JTMHV05J704063238	2026-02-13 11:20:13.923522
49	https://auto.ria.com/uk/auto_toyota_02_8fgf30_39474096.html	Toyota 02-8FGF30 2010	15900	\N	Tehnogruz ltd	380965302042	https://cdn4.riastatic.com/photosnew/auto/photo/toyota_02-8fgf30__631186029fx.jpg	8	\N	\N	2026-02-13 11:20:13.923522
50	https://auto.ria.com/uk/auto_nissan_rogue_38323719.html	Nissan Rogue 2016	13000	135000	Роман Леонідович Юрків	380504197796	https://cdn4.riastatic.com/photosnew/auto/photo/nissan_rogue__599526819fx.jpg	17	AO 2206 HX	5N1AT2MV0GC924522	2026-02-13 11:20:13.923522
51	https://auto.ria.com/uk/auto_hyundai_avante_39471116.html	\N	\N	\N	\N	\N	\N	\N	\N	\N	2026-02-13 11:20:18.199498
52	https://auto.ria.com/uk/auto_nissan_qashqai_39474072.html	Nissan Qashqai 2013	11950	220000	Nazar	380934341449	https://cdn3.riastatic.com/photosnew/auto/photo/nissan_qashqai__631184543fx.jpg	118	\N	SJNFEAJ10U2704917	2026-02-13 11:20:18.199498
53	https://auto.ria.com/uk/auto_nissan_qashqai_2_39473974.html	Nissan Qashqai+2 2012	12450	141000	Nazar	380934341449	https://cdn2.riastatic.com/photosnew/auto/photo/nissan_qashqai-2__631180552fx.jpg	147	\N	SJNJEAJ10U7098163	2026-02-13 11:20:18.199498
54	https://auto.ria.com/uk/auto_toyota_8fd30_38155389.html	Toyota 8FD30 2020	19072	5000	GROSSLIFT	380634335752	https://cdn1.riastatic.com/photosnew/auto/photo/toyota_8fd30__594912551fx.jpg	9	\N	\N	2026-02-13 11:20:18.199498
55	https://auto.ria.com/uk/auto_toyota_7fgf18_25879086.html	Toyota 7FGF18 2007	10000	7000	GROSSLIFT	380634335752	https://cdn3.riastatic.com/photosnew/auto/photo/toyota_7fgf18__342902183fx.jpg	5	\N	\N	2026-02-13 11:20:18.199498
56	https://auto.ria.com/uk/auto_hyster_h_15863612.html	Hyster H 2001	7500	1000	GROSSLIFT	380634335752	https://cdn0.riastatic.com/photosnew/auto/photo/hyster_h__422785240fx.jpg	8	\N	\N	2026-02-13 11:20:18.199498
57	https://auto.ria.com/uk/auto_toyota_fd_37998265.html	Toyota FD 2018	25032	4000	GROSSLIFT	380634335752	https://cdn2.riastatic.com/photosnew/auto/photo/toyota_fd__597036932fx.jpg	7	\N	\N	2026-02-13 11:20:18.199498
58	https://auto.ria.com/uk/auto_toyota_8fd30_38403194.html	Toyota 8FD30 2020	21456	8000	GROSSLIFT	\N	https://cdn4.riastatic.com/photosnew/auto/photo/toyota_8fd30__626443099fx.jpg	7	\N	\N	2026-02-13 11:20:18.199498
59	https://auto.ria.com/uk/auto_toyota_8fgf18_36833110.html	Toyota 8FGF18 2010	10728	7000	GROSSLIFT	380634335752	https://cdn2.riastatic.com/photosnew/auto/photo/toyota_8fgf18__558197917fx.jpg	5	\N	\N	2026-02-13 11:20:18.199498
60	https://auto.ria.com/uk/auto_tcm_fhg_23659052.html	TCM FHG 2010	10000	9000	GROSSLIFT	380634335752	https://cdn1.riastatic.com/photosnew/auto/photo/tcm_fhg__264979006fx.jpg	3	\N	\N	2026-02-13 11:20:18.199498
61	https://auto.ria.com/uk/auto_volkswagen_touareg_39372645.html	Volkswagen Touareg 2019	48200	153000	Сергей	380671080484	https://cdn3.riastatic.com/photosnew/auto/photo/volkswagen_touareg__628353478fx.jpg	24	AE 4400 KP	WVGZZZCRZKD047253	2026-02-13 11:20:21.982211
62	https://auto.ria.com/uk/auto_toyota_02_8fgf25_37993574.html	Toyota 02-8FGF25 2013	15019	9000	GROSSLIFT	380634335752	https://cdn0.riastatic.com/photosnew/auto/photo/toyota_02-8fgf25__590365560fx.jpg	6	\N	\N	2026-02-13 11:20:21.982211
63	https://auto.ria.com/uk/auto_audi_q5_39152623.html	Audi Q5 2019	23400	144000	Андрій	380961352579	https://cdn1.riastatic.com/photosnew/auto/photo/audi_q5__622246766fx.jpg	107	\N	WA1BNAFY0K2079460	2026-02-13 11:20:21.982211
64	https://auto.ria.com/uk/auto_toyota_8fdf_25_39440783.html	Toyota 8FDF-25 2018	18476	7000	GROSSLIFT	380634335752	https://cdn2.riastatic.com/photosnew/auto/photo/toyota_8fdf-25__630266047fx.jpg	3	\N	\N	2026-02-13 11:20:21.982211
65	https://auto.ria.com/uk/auto_toyota_02_8fdf_37820892.html	Toyota 02-8FDF 2019	16092	6000	GROSSLIFT	380634335752	https://cdn3.riastatic.com/photosnew/auto/photo/toyota_02-8fdf__585507363fx.jpg	4	\N	\N	2026-02-13 11:20:21.982211
66	https://auto.ria.com/uk/auto_toyota_8fdf_25_38384276.html	Toyota 8FDF-25 2016	16926	7000	GROSSLIFT	380634335752	https://cdn3.riastatic.com/photosnew/auto/photo/toyota_8fdf-25__601201803fx.jpg	7	\N	\N	2026-02-13 11:20:21.982211
67	https://auto.ria.com/uk/auto_toyota_fbe_38664112.html	Toyota FBE 2018	18118	6000	GROSSLIFT	380634335752	https://cdn0.riastatic.com/photosnew/auto/photo/toyota_fbe__609103580fx.jpg	13	\N	\N	2026-02-13 11:20:21.982211
68	https://auto.ria.com/uk/auto_toyota_02_8fgf25_39420143.html	Toyota 02-8FGF25 2020	16092	4000	GROSSLIFT	380634335752	https://cdn1.riastatic.com/photosnew/auto/photo/toyota_02-8fgf25__629687946fx.jpg	3	\N	\N	2026-02-13 11:20:21.982211
69	https://auto.ria.com/uk/auto_toyota_02_8fgf18_36696801.html	Toyota 02-8FGF18 2015	14304	8000	GROSSLIFT	380634335752	https://cdn1.riastatic.com/photosnew/auto/photo/toyota_02-8fgf18__554431256fx.jpg	5	\N	\N	2026-02-13 11:20:21.982211
70	https://auto.ria.com/uk/auto_toyota_02_8fdjf35_39399856.html	Toyota 02-8FDJF35 2022	22648	1000	GROSSLIFT	380634335752	https://cdn0.riastatic.com/photosnew/auto/photo/toyota_02-8fdjf35__629109740fx.jpg	3	\N	\N	2026-02-13 11:20:21.982211
71	https://auto.ria.com/uk/auto_toyota_02_8fgjf35_38900914.html	Toyota 02-8FGJF35 2018	19668	6000	GROSSLIFT	380634335752	https://cdn4.riastatic.com/photosnew/auto/photo/toyota_02-8fgjf35__615482359fx.jpg	3	\N	\N	2026-02-13 11:20:24.191115
72	https://auto.ria.com/uk/auto_audi_q7_39392962.html	Audi Q7 2022	55000	36000	Kotovskiy Auto Club	380677877071	https://cdn0.riastatic.com/photosnew/auto/photo/audi_q7__628916990fx.jpg	46	HH 3923 AE	WA1VXBF71ND014341	2026-02-13 11:20:24.191115
73	https://auto.ria.com/uk/auto_bmw_x5_39155141.html	BMW X5 2019	39999	203000	Саша	380983601414	https://cdn3.riastatic.com/photosnew/auto/photo/bmw_x5__622310793fx.jpg	90	\N	5UXCR6C52KLL61078	2026-02-13 11:20:24.191115
74	https://auto.ria.com/uk/auto_mercedes_benz_sprinter_39025465.html	Mercedes-Benz Sprinter 2020	75000	94000	Freshauto	380987081919	https://cdn4.riastatic.com/photosnew/auto/photo/mercedes-benz_sprinter__630675794fx.jpg	39	\N	W1V9076571P313667	2026-02-13 11:20:24.191115
75	https://auto.ria.com/uk/auto_audi_q5_39125738.html	Audi Q5 2021	43500	141000	Freshauto	380987081919	https://cdn0.riastatic.com/photosnew/auto/photo/audi_q5__629365285fx.jpg	42	\N	WAUZZZFYXM2091283	2026-02-13 11:20:24.191115
76	https://auto.ria.com/uk/auto_hyundai_santa_fe_39473515.html	Hyundai Santa FE 2012	12450	225000	Nazar	380934341449	https://cdn1.riastatic.com/photosnew/auto/photo/hyundai_santa-fe__631168801fx.jpg	154	\N	KMHSH81UCCU850551	2026-02-13 11:20:24.191115
77	https://auto.ria.com/uk/auto_audi_q8_39096431.html	\N	\N	\N	\N	\N	\N	\N	\N	\N	2026-02-13 11:20:24.191115
78	https://auto.ria.com/uk/auto_mercedes_benz_gls_class_39440944.html	Mercedes-Benz GLS-Class 2024	127000	48000	IMPULSE autohouse	380502207788	https://cdn4.riastatic.com/photosnew/auto/photo/mercedes-benz_gls-class__630268279fx.jpg	51	\N	W1NFF3DE6RB176044	2026-02-13 11:20:24.191115
79	https://auto.ria.com/uk/auto_mercedes_benz_a_class_39013429.html	Mercedes-Benz A-Class 2013	10999	206000	Наталія Ігорівна Обидняк	380505683437	https://cdn0.riastatic.com/photosnew/auto/photo/mercedes-benz_a-class__621185240fx.jpg	31	AT 4265 HH	WDD1760001J075887	2026-02-13 11:20:25.817377
80	https://auto.ria.com/uk/auto_volkswagen_golf_39331400.html	Volkswagen Golf 2019	17280	196000	IZI AUTO LUTSK	380970102233	https://cdn1.riastatic.com/photosnew/auto/photo/volkswagen_golf__627618796fx.jpg	97	\N	WVWZZZAUZLP532850	2026-02-13 11:20:25.817377
81	https://auto.ria.com/uk/auto_toyota_corolla_39432634.html	Toyota Corolla 2012	11800	63000	Власник	380683935957	https://cdn0.riastatic.com/photosnew/auto/photo/toyota_corolla__630182910fx.jpg	25	\N	JTNBV58E10J181803	2026-02-13 11:20:25.817377
82	https://auto.ria.com/uk/auto_mercedes_benz_c_class_39472829.html	Mercedes-Benz C-Class 2015	21600	111000	Сергій	380988288187	https://cdn0.riastatic.com/photosnew/auto/photo/mercedes-benz_c-class__631151095fx.jpg	19	AI 9138 PH	WDD2050431R110067	2026-02-13 11:20:25.817377
83	https://auto.ria.com/uk/auto_bmw_x5_39472105.html	\N	\N	\N	\N	\N	\N	\N	\N	\N	2026-02-13 11:20:25.817377
84	https://auto.ria.com/uk/auto_ford_focus_39465983.html	Ford Focus 2013	8699	221000	Misha	380635548553	https://cdn1.riastatic.com/photosnew/auto/photo/ford_focus__630954161fx.jpg	88	\N	WF0LXXGCBLDK83399	2026-02-13 11:20:25.817377
85	https://auto.ria.com/uk/auto_ford_ecosport_39283899.html	Ford EcoSport 2020	12800	114000	Ім`я не вказане	380673014870	https://cdn1.riastatic.com/photosnew/auto/photo/ford_ecosport__625913186fx.jpg	23	\N	MAJ6S3GLXLC388546	2026-02-13 11:20:25.817377
86	https://auto.ria.com/uk/auto_volkswagen_tiguan_39433291.html	Volkswagen Tiguan 2019	24999	89000	Тарас	380987191615	https://cdn0.riastatic.com/photosnew/auto/photo/volkswagen_tiguan__630591565fx.jpg	190	\N	3VV4B7AX6KM126168	2026-02-13 11:20:25.817377
87	https://auto.ria.com/uk/auto_volkswagen_jetta_39455762.html	\N	\N	\N	\N	\N	\N	\N	\N	\N	2026-02-13 11:20:25.817377
88	https://auto.ria.com/uk/auto_volkswagen_tiguan_39444465.html	Volkswagen Tiguan 2016	13300	133000	Дмитрий	380633890328	https://cdn0.riastatic.com/photosnew/auto/photo/volkswagen_tiguan__630361620fx.jpg	22	\N	WVGBV7AX2HW513009	2026-02-13 11:20:25.817377
89	https://auto.ria.com/uk/auto_mercedes_benz_sprinter_38995646.html	Mercedes-Benz Sprinter 2020	24900	259000	Компанія Sprinter-Аvto 	380976535009	https://cdn0.riastatic.com/photosnew/auto/photo/mercedes-benz_sprinter__617973950fx.jpg	29	\N	W1V9071332N113186	2026-02-13 11:20:29.766542
90	https://auto.ria.com/uk/auto_volkswagen_golf_39325078.html	Volkswagen Golf 2016	10800	130000	Вадим	380509499365	https://cdn2.riastatic.com/photosnew/auto/photo/volkswagen_golf__627061882fx.jpg	14	AE 2348 XB	3VW217AU3HM034097	2026-02-13 11:20:29.766542
91	https://auto.ria.com/uk/auto_iveco_daily_35904360.html	Iveco Daily 2018	19500	294000	Компанія Sprinter-Аvto 	380976535009	https://cdn2.riastatic.com/photosnew/auto/photo/iveco_daily__621342567fx.jpg	34	\N	ZCFCC35A20D599847	2026-02-13 11:20:29.766542
92	https://auto.ria.com/uk/auto_audi_q5_39421958.html	Audi Q5 2018	24350	156000	Марко	380936406558	https://cdn3.riastatic.com/photosnew/auto/photo/audi_q5__629728358fx.jpg	129	\N	WA1BNAFY9J2191902	2026-02-13 11:20:29.766542
93	https://auto.ria.com/uk/auto_mercedes_benz_sprinter_39473528.html	Mercedes-Benz Sprinter 2011	18500	500000	Артем	\N	https://cdn4.riastatic.com/photosnew/auto/photo/mercedes-benz_sprinter__631168619fx.jpg	32	\N	\N	2026-02-13 11:20:29.766542
94	https://auto.ria.com/uk/auto_land_rover_range_rover_sport_39472826.html	\N	\N	\N	\N	\N	\N	\N	\N	\N	2026-02-13 11:20:29.766542
95	https://auto.ria.com/uk/auto_mercedes_benz_sprinter_39427198.html	Mercedes-Benz Sprinter 2015	41999	537000	Микола	380673406367	https://cdn4.riastatic.com/photosnew/auto/photo/mercedes-benz_sprinter__629879344fx.jpg	24	CE 0477 EE	WDB9066571P222410	2026-02-13 11:20:29.766542
96	https://auto.ria.com/uk/auto_harley_davidson_sportster_s_39474049.html	Harley-Davidson Sportster S 2022	16000	7000	Максим Ильницкий	380638892395	https://cdn0.riastatic.com/photosnew/auto/photo/harley-davidson_sportster-s__631184865fx.jpg	16	\N	\N	2026-02-13 11:20:29.766542
97	https://auto.ria.com/uk/auto_renault_master_38910836.html	Renault Master 2022	22900	150000	Freshauto	380987081919	https://cdn0.riastatic.com/photosnew/auto/photo/renault_master__615753135fx.jpg	30	\N	VF1MA000269202744	2026-02-13 11:20:29.766542
99	https://auto.ria.com/uk/auto_skoda_kodiaq_39319211.html	Skoda Kodiaq 2020	29899	92000	Петр	380955814098	https://cdn4.riastatic.com/photosnew/auto/photo/skoda_kodiaq__626897984fx.jpg	13	BH 0537 PM	TMBLJ6NS8LB401411	2026-02-13 11:20:31.850124
100	https://auto.ria.com/uk/auto_volkswagen_tiguan_39243519.html	Volkswagen Tiguan 2023	24900	51000	Viktor	380673437133	https://cdn0.riastatic.com/photosnew/auto/photo/volkswagen_tiguan__624773155fx.jpg	76	AT 7977 BK	3VV8B7AX0RM009682	2026-02-13 11:20:31.850124
101	https://auto.ria.com/uk/auto_mitsubishi_outlander_sport_38969032.html	Mitsubishi Outlander Sport 2013	10800	160000	Slavik	380679509607	https://cdn3.riastatic.com/photosnew/auto/photo/mitsubishi_outlander-sport__622778653fx.jpg	69	AA 1983 HK	4A4AR3AU4EE011776	2026-02-13 11:20:31.850124
102	https://auto.ria.com/uk/auto_skoda_kodiaq_39393631.html	Skoda Kodiaq 2018	28500	231000	Vlad	380997255045	https://cdn3.riastatic.com/photosnew/auto/photo/skoda_kodiaq__628933548fx.jpg	90	\N	TMBLK9NS6K8028833	2026-02-13 11:20:31.850124
103	https://auto.ria.com/uk/auto_mitsubishi_pajero_wagon_39473809.html	\N	\N	\N	\N	\N	\N	\N	\N	\N	2026-02-13 11:20:31.850124
104	https://auto.ria.com/uk/auto_porsche_macan_39294047.html	\N	\N	\N	\N	\N	\N	\N	\N	\N	2026-02-13 11:20:31.850124
105	https://auto.ria.com/uk/auto_kia_niro_39393480.html	Kia Niro 2020	18850	70000	Юрій	380683964126	https://cdn3.riastatic.com/photosnew/auto/photo/kia_niro__628930223fx.jpg	70	\N	KNACC81GFL5031120	2026-02-13 11:20:31.850124
106	https://auto.ria.com/uk/auto_mazda_cx_5_39473226.html	Mazda CX-5 2017	18750	136000	Роман Степанович	380965139116	https://cdn1.riastatic.com/photosnew/auto/photo/mazda_cx-5__631158196fx.jpg	70	\N	JM3KFBCL5H0185481	2026-02-13 11:20:31.850124
107	https://auto.ria.com/uk/auto_volkswagen_tiguan_39464127.html	\N	\N	\N	\N	\N	\N	\N	\N	\N	2026-02-13 11:20:31.850124
108	https://auto.ria.com/uk/auto_ford_edge_39463207.html	Ford Edge 2015	12550	132000	Роман Степанович	380965139116	https://cdn4.riastatic.com/photosnew/auto/photo/ford_edge__630875764fx.jpg	75	\N	2FMTK3J9XFBC16267	2026-02-13 11:20:31.850124
109	https://auto.ria.com/uk/auto_porsche_macan_39021766.html	\N	\N	\N	\N	\N	\N	\N	\N	\N	2026-02-13 11:20:35.122258
110	https://auto.ria.com/uk/auto_land_rover_discovery_38024496.html	Land Rover Discovery 2017	29999	160000	Виктор	380674310808	https://cdn3.riastatic.com/photosnew/auto/photo/land-rover_discovery__591216493fx.jpg	41	AB 7926 KT	SALRHBBK0HA038725	2026-02-13 11:20:35.122258
111	https://auto.ria.com/uk/auto_audi_q5_39013301.html	Audi Q5 2022	35600	28000	Kotovskiy Auto Club	380677877071	https://cdn1.riastatic.com/photosnew/auto/photo/audi_q5__618431691fx.jpg	30	\N	WA1EAAFY2N2106249	2026-02-13 11:20:35.122258
112	https://auto.ria.com/uk/auto_mercedes_benz_gl_class_38546905.html	Mercedes-Benz GL-Class 2012	24000	194000	Евгений	380636233764	https://cdn2.riastatic.com/photosnew/auto/photo/mercedes-benz_gl-class__614132387fx.jpg	29	KA 1862 PI	4JGDF2EE4DA142654	2026-02-13 11:20:35.122258
113	https://auto.ria.com/uk/auto_bmw_x5_39433335.html	BMW X5 2016	20500	147000	Владислав	\N	https://cdn3.riastatic.com/photosnew/auto/photo/bmw_x5__630057303fx.jpg	9	KX 2989 AB	5UXKR0C51G0S91798	2026-02-13 11:20:35.122258
114	https://auto.ria.com/uk/auto_toyota_land_cruiser_prado_39433143.html	Toyota Land Cruiser Prado 2025	67000	10000	Дмитрий Коваль	\N	https://cdn4.riastatic.com/photosnew/auto/photo/toyota_land-cruiser-prado__630042294fx.jpg	81	\N	JTEAA3AJ70K013502	2026-02-13 11:20:35.122258
115	https://auto.ria.com/uk/auto_lexus_es_39344637.html	Lexus ES 2017	26000	169000	Vitalii	380505525959	https://cdn4.riastatic.com/photosnew/auto/photo/lexus_es__627666839fx.jpg	25	\N	JTHBJ1GG002099923	2026-02-13 11:20:35.122258
116	https://auto.ria.com/uk/auto_audi_q5_39415715.html	Audi Q5 2016	15999	198000	Микола	380671847845	https://cdn4.riastatic.com/photosnew/auto/photo/audi_q5__629563599fx.jpg	43	\N	WA1L2AFP2GA121015	2026-02-13 11:20:35.122258
117	https://auto.ria.com/uk/auto_nissan_qashqai_39399973.html	Nissan Qashqai 2014	14400	192000	Ігор	380934227818	https://cdn1.riastatic.com/photosnew/auto/photo/nissan_qashqai__629111441fx.jpg	21	\N	SJNFDAJ11U1095879	2026-02-13 11:20:35.122258
118	https://auto.ria.com/uk/auto_bmw_3_series_39468179.html	BMW 3 Series 2016	13500	78000	Артур	380964359996	https://cdn1.riastatic.com/photosnew/auto/photo/bmw_3-series__631016541fx.jpg	33	AI 9157 IB	WBA8E5G53GNU21028	2026-02-13 11:20:35.122258
119	https://auto.ria.com/uk/auto_volkswagen_tiguan_39465466.html	Volkswagen Tiguan 2019	25900	152000	IZI AUTO LUTSK	380970102233	https://cdn4.riastatic.com/photosnew/auto/photo/volkswagen_tiguan__630938979fx.jpg	89	\N	WVGZZZ5NZLW819544	2026-02-13 11:20:36.669161
120	https://auto.ria.com/uk/auto_mercedes_benz_gl_class_37149483.html	Mercedes-Benz GL-Class 2014	22900	192000	Ім`я не вказане	380932722406	https://cdn4.riastatic.com/photosnew/auto/photo/mercedes-benz_gl-class__566922249fx.jpg	44	\N	4JGDF6EE8FA508724	2026-02-13 11:20:36.669161
121	https://auto.ria.com/uk/auto_mitsubishi_lancer_39429093.html	Mitsubishi Lancer 2006	1550	251000	Скргей	380937774535	https://cdn0.riastatic.com/photosnew/auto/photo/mitsubishi_lancer__629933895fx.jpg	5	KA 0817 CI	JMBSRCS9A7U000585	2026-02-13 11:20:36.669161
122	https://auto.ria.com/uk/auto_renault_duster_39448374.html	Renault Duster 2023	21800	81000	Ім`я не вказане	380680878949	https://cdn0.riastatic.com/photosnew/auto/photo/renault_duster__630471410fx.jpg	30	\N	VF1HJD40071540548	2026-02-13 11:20:36.669161
123	https://auto.ria.com/uk/auto_hyundai_santa_fe_39473756.html	Hyundai Santa FE 2014	18450	224000	Nazar	380934341449	https://cdn0.riastatic.com/photosnew/auto/photo/hyundai_santa-fe__631176305fx.jpg	138	\N	KMHSU81XDDU163587	2026-02-13 11:20:36.669161
124	https://auto.ria.com/uk/auto_nissan_juke_39340799.html	Nissan Juke 2024	14950	5000	Андрій	380961140968	https://cdn0.riastatic.com/photosnew/auto/photo/nissan_juke__628008860fx.jpg	23	CA 4980 KK	SJNFAAF16U2030179	2026-02-13 11:20:36.669161
125	https://auto.ria.com/uk/auto_mercedes_benz_sprinter_39291844.html	Mercedes-Benz Sprinter 2015	20000	400000	Міша Іванович Семенович	\N	https://cdn2.riastatic.com/photosnew/auto/photo/mercedes-benz_sprinter__626134832fx.jpg	20	CE 8889 BT	WDB9066351S980756	2026-02-13 11:20:36.669161
126	https://auto.ria.com/uk/auto_skoda_superb_39471957.html	Skoda Superb 2012	11799	285000	Dima	380737477791	https://cdn4.riastatic.com/photosnew/auto/photo/skoda_superb__631124059fx.jpg	134	\N	TMBJE93T3C9022297	2026-02-13 11:20:36.669161
127	https://auto.ria.com/uk/auto_bmw_3_series_39471609.html	BMW 3 Series 1999	8500	260000	Макс	\N	https://cdn4.riastatic.com/photosnew/auto/photo/bmw_3-series__631114459fx.jpg	18	BH 2142 TC	WBABJ31030ER19108	2026-02-13 11:20:36.669161
128	https://auto.ria.com/uk/auto_bmw_4_series_39127528.html	BMW 4 Series 2021	49999	41000	Ігор Сергійович	380930005888	https://cdn0.riastatic.com/photosnew/auto/photo/bmw_4-series__621561140fx.jpg	22	BH 1118 IB	WBA53AT0XMCH50198	2026-02-13 11:20:36.669161
129	https://auto.ria.com/uk/auto_bmw_x4_39460430.html	BMW X4 2017	29500	91000	Stanislav	\N	https://cdn0.riastatic.com/photosnew/auto/photo/bmw_x4__630803510fx.jpg	30	\N	5UXXW3C53J0Y65762	2026-02-13 11:20:41.481119
130	https://auto.ria.com/uk/auto_volvo_xc60_39355500.html	Volvo XC60 2017	20200	116000	Андрій	\N	https://cdn2.riastatic.com/photosnew/auto/photo/volvo_xc60__627899827fx.jpg	20	AE 7787 AP	YV449MRU0H2136159	2026-02-13 11:20:41.481119
131	https://auto.ria.com/uk/auto_nissan_qashqai_39426416.html	Nissan Qashqai 2012	11899	242000	Сергій	380964133388	https://cdn2.riastatic.com/photosnew/auto/photo/nissan_qashqai__629899367fx.jpg	163	\N	SJNFCAJ10U2366209	2026-02-13 11:20:41.481119
132	https://auto.ria.com/uk/auto_renault_megane_39258143.html	Renault Megane 2014	9600	208000	Петро	380672395568	https://cdn0.riastatic.com/photosnew/auto/photo/renault_megane__625192260fx.jpg	19	\N	VF1KZ140651088286	2026-02-13 11:20:41.481119
133	https://auto.ria.com/uk/auto_mercedes_benz_gl_class_39359289.html	Mercedes-Benz GL-Class 2014	22000	170000	Володимир Гуменюк	380983394083	https://cdn2.riastatic.com/photosnew/auto/photo/mercedes-benz_gl-class__628173212fx.jpg	17	AM 7007 ET	4JGDF6EE3FA522045	2026-02-13 11:20:41.481119
134	https://auto.ria.com/uk/auto_volkswagen_atlas_39109370.html	Volkswagen Atlas 2020	25000	128000	Kotovskiy Auto Club	380677877071	https://cdn0.riastatic.com/photosnew/auto/photo/volkswagen_atlas__621074850fx.jpg	34	HH 9030 AB	1V2HR2CA4MC502408	2026-02-13 11:20:41.481119
135	https://auto.ria.com/uk/auto_volkswagen_passat_39351509.html	Volkswagen Passat 2020	25900	159000	Олексій Мартинюк	380955553604	https://cdn3.riastatic.com/photosnew/auto/photo/volkswagen_passat__627792953fx.jpg	126	\N	WVWZZZ3CZLE126052	2026-02-13 11:20:41.481119
136	https://auto.ria.com/uk/auto_volvo_xc60_39433947.html	Volvo XC60 2020	29950	62000	Андрій Іванович Лис	380686240827	https://cdn4.riastatic.com/photosnew/auto/photo/volvo_xc60__630072669fx.jpg	49	BC 5112 XA	YV4102RK3M1722743	2026-02-13 11:20:41.481119
137	https://auto.ria.com/uk/auto_toyota_camry_39427770.html	Toyota Camry 2018	20500	137000	Andriy	\N	https://cdn1.riastatic.com/photosnew/auto/photo/toyota_camry__629895461fx.jpg	12	CE 0001 OA	JTNBF4HK803009138	2026-02-13 11:20:41.481119
138	https://auto.ria.com/uk/auto_volvo_xc90_37899552.html	Volvo XC90 2015	23900	225000	Юрій Вінтоняк	380661064439	https://cdn4.riastatic.com/photosnew/auto/photo/volvo_xc90__619722049fx.jpg	31	AT 9664 IC	YV4A22PKXG1035163	2026-02-13 11:20:41.481119
139	https://auto.ria.com/uk/auto_volvo_xc90_38907494.html	Volvo XC90 2019	43000	180000	Олександр	380675143063	https://cdn4.riastatic.com/photosnew/auto/photo/volvo_xc90__615656204fx.jpg	19	AX 2987 HO	YV1LCA3UCL1551677	2026-02-13 11:20:43.590529
140	https://auto.ria.com/uk/auto_ford_escape_39380448.html	Ford Escape 2018	10300	147000	TOP AUTO	380664457787	https://cdn1.riastatic.com/photosnew/auto/photo/ford_escape__628566931fx.jpg	52	\N	1FMCU0GD0JUA39171	2026-02-13 11:20:43.590529
141	https://auto.ria.com/uk/auto_porsche_cayenne_39163348.html	Porsche Cayenne 2016	28500	104000	Олег	380638451688	https://cdn1.riastatic.com/photosnew/auto/photo/porsche_cayenne__622541681fx.jpg	34	AI 7505 TE	WP1AE2A2XHLA71684	2026-02-13 11:20:43.590529
142	https://auto.ria.com/uk/auto_skoda_superb_39463343.html	Skoda Superb 2016	14900	251000	Ігор Іванович	380634289994	https://cdn4.riastatic.com/photosnew/auto/photo/skoda_superb__630874454fx.jpg	101	BC 5957 XC	TMBJH7NP9G7091038	2026-02-13 11:20:43.590529
143	https://auto.ria.com/uk/auto_bmw_3_series_39461323.html	BMW 3 Series 1985	3000	200000	Ярослав Богданович Валько	380665816552	https://cdn4.riastatic.com/photosnew/auto/photo/bmw_3-series__630827204fx.jpg	19	BH 5767 PP	WBAAA710X09602048	2026-02-13 11:20:43.590529
144	https://auto.ria.com/uk/auto_bmw_x5_35860168.html	BMW X5 2022	78999	90000	Володимир	380937039189	https://cdn0.riastatic.com/photosnew/auto/photo/bmw_x5__625556510fx.jpg	7	AB 4242 EO	WBACV610409L08071	2026-02-13 11:20:43.590529
145	https://auto.ria.com/uk/auto_tesla_model_3_39453784.html	Tesla Model 3 2018	20800	67000	Валерий	380679097766	https://cdn3.riastatic.com/photosnew/auto/photo/tesla_model-3__630619603fx.jpg	18	\N	5YJ3E1EB6JF074749	2026-02-13 11:20:43.590529
146	https://auto.ria.com/uk/auto_mercedes_benz_e_class_39110012.html	Mercedes-Benz E-Class 2023	54900	89000	Михайло	380504531735	https://cdn2.riastatic.com/photosnew/auto/photo/mercedes-benz_e-class__622790362fx.jpg	11	AE 2133 XE	W1KZF0FB0PB150645	2026-02-13 11:20:43.590529
147	https://auto.ria.com/uk/auto_opel_astra_39474280.html	\N	\N	\N	\N	\N	\N	\N	\N	\N	2026-02-13 11:20:43.590529
148	https://auto.ria.com/uk/auto_acura_tlx_39258148.html	Acura TLX 2022	29999	78000	AutoGallery official	380970771111	https://cdn2.riastatic.com/photosnew/auto/photo/acura_tlx__625193147fx.jpg	30	\N	19UUB6F56NA002338	2026-02-13 11:20:43.590529
149	https://auto.ria.com/uk/auto_bmw_x5_39264624.html	BMW X5 2019	50500	128000	Kirill Zinchenko	\N	https://cdn3.riastatic.com/photosnew/auto/photo/bmw_x5__625374388fx.jpg	22	\N	5UXCR6C50KLL08346	2026-02-13 11:20:47.071058
150	https://auto.ria.com/uk/auto_audi_q7_39448163.html	Audi Q7 2017	34750	299000	Auto	380991167777	https://cdn0.riastatic.com/photosnew/auto/photo/audi_q7__630465830fx.jpg	114	KA 4774 BC	WAUZZZ4M3JD003559	2026-02-13 11:20:47.071058
151	https://auto.ria.com/uk/auto_mercedes_benz_glb_class_39395839.html	Mercedes-Benz GLB-Class 2023	37500	50000	Kotovskiy Auto Club	\N	https://cdn2.riastatic.com/photosnew/auto/photo/mercedes-benz_glb-class__629000657fx.jpg	33	\N	W1N4M4HB6PW319437	2026-02-13 11:20:47.071058
152	https://auto.ria.com/uk/auto_hyundai_ix35_39434506.html	Hyundai ix35 2011	12700	229000	Олег	\N	https://cdn0.riastatic.com/photosnew/auto/photo/hyundai_ix35__630619535fx.jpg	28	AC 5500 BT	KMHJU81VDBU334684	2026-02-13 11:20:47.071058
153	https://auto.ria.com/uk/auto_mercedes_benz_glb_class_39323972.html	Mercedes-Benz GLB-Class 2020	25999	100000	Саша	380983601414	https://cdn4.riastatic.com/photosnew/auto/photo/mercedes-benz_glb-class__627031699fx.jpg	36	\N	W1N4M4GBXLW059748	2026-02-13 11:20:47.071058
154	https://auto.ria.com/uk/auto_mercedes_benz_sprinter_39389223.html	Mercedes-Benz Sprinter 2019	59900	164000	Freshauto	\N	https://cdn2.riastatic.com/photosnew/auto/photo/mercedes-benz_sprinter__628808782fx.jpg	44	\N	WDB9077351P115632	2026-02-13 11:20:47.071058
155	https://auto.ria.com/uk/auto_renault_master_38976033.html	Renault Master 2022	23900	165000	Roma	380673814302	https://cdn2.riastatic.com/photosnew/auto/photo/renault_master__627837107fx.jpg	32	\N	\N	2026-02-13 11:20:47.071058
156	https://auto.ria.com/uk/auto_infiniti_qx70_35665851.html	Infiniti QX70 2015	14200	230000	Николай Иваночко	380936373723	https://cdn1.riastatic.com/photosnew/auto/photo/infiniti_qx70__630264271fx.jpg	9	AT 1400 HP	JN8CS1MW8GM400570	2026-02-13 11:20:47.071058
157	https://auto.ria.com/uk/auto_audi_a4_39254424.html	Audi A4 2016	23900	170000	Freshauto	380987081919	https://cdn3.riastatic.com/photosnew/auto/photo/audi_a4__625082283fx.jpg	44	\N	WAUZZZF46HA045765	2026-02-13 11:20:47.071058
158	https://auto.ria.com/uk/auto_volkswagen_crafter_39341079.html	Volkswagen Crafter 2020	26900	271000	Omelian	380505650817	https://cdn0.riastatic.com/photosnew/auto/photo/volkswagen_crafter__627501620fx.jpg	31	\N	WV1ZZZSYZL9051869	2026-02-13 11:20:47.071058
159	https://auto.ria.com/uk/auto_jeep_grand_cherokee_39285144.html	Jeep Grand Cherokee 2018	27959	91000	Юрий	380639932863	https://cdn4.riastatic.com/photosnew/auto/photo/jeep_grand-cherokee__625953399fx.jpg	26	AI 3490 TC	1C4RJFJG1JC347484	2026-02-13 11:20:48.628775
160	https://auto.ria.com/uk/auto_bmw_x5_39411817.html	BMW X5 2015	32600	212000	Олексій Петрович	380960071045	https://cdn3.riastatic.com/photosnew/auto/photo/bmw_x5__629854808fx.jpg	151	\N	WBAKS610000J87032	2026-02-13 11:20:48.628775
161	https://auto.ria.com/uk/auto_mercedes_benz_s_class_39471064.html	Mercedes-Benz S-Class 2007	10999	279000	Костя	380509182556	https://cdn3.riastatic.com/photosnew/auto/photo/mercedes-benz_s-class__631098563fx.jpg	40	AO 3315 HK	WDD2211861A131431	2026-02-13 11:20:48.628775
162	https://auto.ria.com/uk/auto_ford_escape_39469516.html	Ford Escape 2018	11900	163000	Микола	380973556361	https://cdn3.riastatic.com/photosnew/auto/photo/ford_escape__631054383fx.jpg	56	\N	1FMCU9GD2JUC65989	2026-02-13 11:20:48.628775
163	https://auto.ria.com/uk/auto_volkswagen_taos_39469459.html	Volkswagen Taos 2022	17300	63000	Микола	380973556361	https://cdn0.riastatic.com/photosnew/auto/photo/volkswagen_taos__631052555fx.jpg	68	\N	3VVDX7B24NM059191	2026-02-13 11:20:48.628775
164	https://auto.ria.com/uk/auto_bmw_x5_39402547.html	BMW X5 2016	38300	146000	Олексій Петрович	380960071045	https://cdn4.riastatic.com/photosnew/auto/photo/bmw_x5__629185359fx.jpg	117	\N	WBAKS810300M50738	2026-02-13 11:20:48.628775
165	https://auto.ria.com/uk/auto_bmw_3_series_39284103.html	BMW 3 Series 2021	49900	66000	Лілія	380962770987	https://cdn3.riastatic.com/photosnew/auto/photo/bmw_3-series__625924073fx.jpg	26	\N	3MW5U9J02N8C35006	2026-02-13 11:20:48.628775
166	https://auto.ria.com/uk/auto_fiat_tipo_39074822.html	Fiat Tipo 2020	7100	258000	Slavik	380679509607	https://cdn0.riastatic.com/photosnew/auto/photo/fiat_tipo__620119710fx.jpg	52	KA 9564 BC	ZFA35600006S42216	2026-02-13 11:20:48.628775
167	https://auto.ria.com/uk/auto_toyota_camry_39376444.html	Toyota Camry 2018	16500	205000	Ілля	\N	https://cdn1.riastatic.com/photosnew/auto/photo/toyota_camry__630130026fx.jpg	25	KA 1040 OO	4T1B11HK5JU614954	2026-02-13 11:20:48.628775
168	https://auto.ria.com/uk/auto_porsche_cayenne_39098061.html	Porsche Cayenne 2013	23000	219000	Виталий	\N	https://cdn0.riastatic.com/photosnew/auto/photo/porsche_cayenne__620738920fx.jpg	19	KA 2622 AX	WP1ZZZ92ZELA38318	2026-02-13 11:20:48.628775
169	https://auto.ria.com/uk/auto_mercedes_benz_sprinter_39454389.html	Mercedes-Benz Sprinter 2017	31999	560000	Іван	380672081354	https://cdn4.riastatic.com/photosnew/auto/photo/mercedes-benz_sprinter__630638159fx.jpg	16	\N	WDB9066371P413112	2026-02-13 11:20:52.944601
170	https://auto.ria.com/uk/auto_hyundai_tucson_39447155.html	Hyundai Tucson 2017	18850	177000	Ім`я не вказане	380979629381	https://cdn0.riastatic.com/photosnew/auto/photo/hyundai_tucson__630436290fx.jpg	7	AE 2494 IM	TMAJ381ADHJ382880	2026-02-13 11:20:52.944601
171	https://auto.ria.com/uk/auto_renault_master_39392417.html	Renault Master 2022	25900	145000	Roma	\N	https://cdn1.riastatic.com/photosnew/auto/photo/renault_master__628900666fx.jpg	39	\N	\N	2026-02-13 11:20:52.944601
172	https://auto.ria.com/uk/auto_mazda_cx_5_39417400.html	Mazda CX-5 2018	17950	146000	Богдан	380971554718	https://cdn3.riastatic.com/photosnew/auto/photo/mazda_cx-5__630030073fx.jpg	32	\N	JM3KFBCM4J0389350	2026-02-13 11:20:52.944601
173	https://auto.ria.com/uk/auto_volkswagen_passat_39339722.html	Volkswagen Passat 2020	16200	108000	Александр	\N	https://cdn0.riastatic.com/photosnew/auto/photo/volkswagen_passat__627464530fx.jpg	13	\N	1VWSA7A32LC016658	2026-02-13 11:20:52.944601
174	https://auto.ria.com/uk/auto_bmw_x5_39417387.html	BMW X5 2020	54900	190000	Анастасія Ігорівна Біленко	\N	https://cdn4.riastatic.com/photosnew/auto/photo/bmw_x5__629609004fx.jpg	33	CE 5327 CP	WBACV610409D72081	2026-02-13 11:20:52.944601
175	https://auto.ria.com/uk/auto_tesla_model_3_39411782.html	Tesla Model 3 2018	13800	145000	Віталік	380686397951	https://cdn1.riastatic.com/photosnew/auto/photo/tesla_model-3__629446881fx.jpg	41	BC 2203 YD	5YJ3E1EA9JF164405	2026-02-13 11:20:52.944601
176	https://auto.ria.com/uk/auto_mazda_cx_5_39409811.html	Mazda CX-5 2023	22500	13000	Roman	380631080572	https://cdn1.riastatic.com/photosnew/auto/photo/mazda_cx-5__629391396fx.jpg	32	\N	JM3KFBBMXP0264900	2026-02-13 11:20:52.944601
177	https://auto.ria.com/uk/auto_porsche_cayenne_39324663.html	Porsche Cayenne 2016	38500	70000	Ігор	380668830117	https://cdn3.riastatic.com/photosnew/auto/photo/porsche_cayenne__627050343fx.jpg	17	BC 9377 OX	WP1AD2A2XHLA81408	2026-02-13 11:20:52.944601
178	https://auto.ria.com/uk/auto_bmw_x5_39394809.html	BMW X5 2022	64700	80000	Орест	380737700370	https://cdn3.riastatic.com/photosnew/auto/photo/bmw_x5__628970853fx.jpg	28	BC 3437 TP	WBATA610X09L55388	2026-02-13 11:20:52.944601
179	https://auto.ria.com/uk/auto_porsche_cayenne_38504186.html	Porsche Cayenne 2023	227625	8000	Андрей	380503250043	https://cdn4.riastatic.com/photosnew/auto/photo/porsche_cayenne__605316589fx.jpg	29	\N	WP1ZZZ9YZRDA43140	2026-02-13 11:20:58.053415
180	https://auto.ria.com/uk/auto_volkswagen_transporter_39344083.html	Volkswagen Transporter 2020	22900	203000	Omelian	380505650817	https://cdn0.riastatic.com/photosnew/auto/photo/volkswagen_transporter__627584135fx.jpg	14	\N	WV1ZZZ7HZLH064238	2026-02-13 11:20:58.053415
181	https://auto.ria.com/uk/auto_bmw_x5_39282344.html	BMW X5 2025	78000	13000	Kotovskiy Auto Club	380677877071	https://cdn3.riastatic.com/photosnew/auto/photo/bmw_x5__625871528fx.jpg	44	\N	5UX23EU09S9Z52614	2026-02-13 11:20:58.053415
182	https://auto.ria.com/uk/auto_nissan_qashqai_39399477.html	Nissan Qashqai 2018	17500	120000	Микола	380993376864	https://cdn3.riastatic.com/photosnew/auto/photo/nissan_qashqai__629097093fx.jpg	127	\N	SJNFAAJ11U2172744	2026-02-13 11:20:58.053415
183	https://auto.ria.com/uk/auto_bmw_x2_39126362.html	BMW X2 2018	20650	121000	Тарас	380964849091	https://cdn3.riastatic.com/photosnew/auto/photo/bmw_x2__628556423fx.jpg	28	\N	WBXYJ5C30JEF75518	2026-02-13 11:20:58.053415
184	https://auto.ria.com/uk/auto_ford_mustang_mach_e_39440245.html	Ford Mustang Mach-E 2024	24900	13000	Ярослав	380976402911	https://cdn4.riastatic.com/photosnew/auto/photo/ford_mustang-mach-e__630252189fx.jpg	61	AA 2339 YE	3FMTK1R41RMA27491	2026-02-13 11:20:58.053415
185	https://auto.ria.com/uk/auto_volkswagen_passat_39439319.html	Volkswagen Passat 2008	6900	295000	Тимофій	380966722681	https://cdn3.riastatic.com/photosnew/auto/photo/volkswagen_passat__630227118fx.jpg	10	BK 7091 IK	WVWZZZ3CZ9E002339	2026-02-13 11:20:58.053415
186	https://auto.ria.com/uk/auto_kia_niro_39110030.html	Kia Niro 2023	22000	60000	Віталій	380675311505	https://cdn0.riastatic.com/photosnew/auto/photo/kia_niro__630219670fx.jpg	26	AI 2809 TC	KNDCR3LE9R5136929	2026-02-13 11:20:58.053415
187	https://auto.ria.com/uk/auto_renault_duster_39428426.html	Renault Duster 2021	14800	63000	Сергій	380998988340	https://cdn3.riastatic.com/photosnew/auto/photo/renault_duster__629914333fx.jpg	22	\N	VF1HJD40268474381	2026-02-13 11:20:58.053415
188	https://auto.ria.com/uk/auto_volkswagen_tiguan_39398716.html	Volkswagen Tiguan 2018	24400	201000	Ігор	380967755264	https://cdn1.riastatic.com/photosnew/auto/photo/volkswagen_tiguan__629076521fx.jpg	29	AI 4333 IB	WVGZZZ5NZKW347624	2026-02-13 11:20:58.053415
\.


--
-- Name: info_cars_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.info_cars_id_seq', 188, true);


--
-- Name: info_cars info_cars_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.info_cars
    ADD CONSTRAINT info_cars_pkey PRIMARY KEY (id);


--
-- Name: info_cars info_cars_url_key; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.info_cars
    ADD CONSTRAINT info_cars_url_key UNIQUE (url);


--
-- PostgreSQL database dump complete
--

\unrestrict SYW2M2OPcP9TYzHsPdaUegDwPaIVbp66eRbKmBAJBI5DvQDKAxxcXeUa58fYkf1

