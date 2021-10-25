--
-- PostgreSQL database dump
--

-- Dumped from database version 12.8 (Ubuntu 12.8-0ubuntu0.20.04.1)
-- Dumped by pg_dump version 12.8 (Ubuntu 12.8-0ubuntu0.20.04.1)

-- Started on 2021-10-23 15:27:59 MSK

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
-- TOC entry 217 (class 1259 OID 25082)
-- Name: admin; Type: TABLE; Schema: public; Owner: shopbot
--

CREATE TABLE public.admin (
    _id integer NOT NULL,
    user_id integer NOT NULL,
    type text NOT NULL,
    salt text NOT NULL,
    password text NOT NULL,
    username text,
    name text
);


ALTER TABLE public.admin OWNER TO shopbot;

--
-- TOC entry 216 (class 1259 OID 25080)
-- Name: admin__id_seq; Type: SEQUENCE; Schema: public; Owner: shopbot
--

CREATE SEQUENCE public.admin__id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.admin__id_seq OWNER TO shopbot;

--
-- TOC entry 3059 (class 0 OID 0)
-- Dependencies: 216
-- Name: admin__id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: shopbot
--

ALTER SEQUENCE public.admin__id_seq OWNED BY public.admin._id;


--
-- TOC entry 211 (class 1259 OID 24997)
-- Name: baskets; Type: TABLE; Schema: public; Owner: shopbot
--

CREATE TABLE public.baskets (
    _id integer NOT NULL,
    user_id integer NOT NULL,
    product_id integer NOT NULL,
    amount integer NOT NULL
);


ALTER TABLE public.baskets OWNER TO shopbot;

--
-- TOC entry 210 (class 1259 OID 24995)
-- Name: baskets__id_seq; Type: SEQUENCE; Schema: public; Owner: shopbot
--

CREATE SEQUENCE public.baskets__id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.baskets__id_seq OWNER TO shopbot;

--
-- TOC entry 3060 (class 0 OID 0)
-- Dependencies: 210
-- Name: baskets__id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: shopbot
--

ALTER SEQUENCE public.baskets__id_seq OWNED BY public.baskets._id;


--
-- TOC entry 213 (class 1259 OID 25005)
-- Name: categories; Type: TABLE; Schema: public; Owner: shopbot
--

CREATE TABLE public.categories (
    _id integer NOT NULL,
    title text,
    nodelete numeric DEFAULT 1 NOT NULL,
    parents_categories integer,
    CONSTRAINT categories_nodelete_check CHECK ((nodelete = ANY (ARRAY[(0)::numeric, (1)::numeric])))
);


ALTER TABLE public.categories OWNER TO shopbot;

--
-- TOC entry 212 (class 1259 OID 25003)
-- Name: categories__id_seq; Type: SEQUENCE; Schema: public; Owner: shopbot
--

CREATE SEQUENCE public.categories__id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.categories__id_seq OWNER TO shopbot;

--
-- TOC entry 3061 (class 0 OID 0)
-- Dependencies: 212
-- Name: categories__id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: shopbot
--

ALTER SEQUENCE public.categories__id_seq OWNED BY public.categories._id;


--
-- TOC entry 209 (class 1259 OID 24986)
-- Name: clients; Type: TABLE; Schema: public; Owner: shopbot
--

CREATE TABLE public.clients (
    _id integer NOT NULL,
    user_id integer,
    username text,
    fio text,
    phone text,
    city text,
    address text,
    date_registration text NOT NULL
);


ALTER TABLE public.clients OWNER TO shopbot;

--
-- TOC entry 208 (class 1259 OID 24984)
-- Name: clients__id_seq; Type: SEQUENCE; Schema: public; Owner: shopbot
--

CREATE SEQUENCE public.clients__id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.clients__id_seq OWNER TO shopbot;

--
-- TOC entry 3062 (class 0 OID 0)
-- Dependencies: 208
-- Name: clients__id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: shopbot
--

ALTER SEQUENCE public.clients__id_seq OWNED BY public.clients._id;


--
-- TOC entry 205 (class 1259 OID 24922)
-- Name: for_delete_product; Type: TABLE; Schema: public; Owner: shopbot
--

CREATE TABLE public.for_delete_product (
    _id integer NOT NULL,
    user_id integer NOT NULL,
    message_id integer NOT NULL
);


ALTER TABLE public.for_delete_product OWNER TO shopbot;

--
-- TOC entry 204 (class 1259 OID 24920)
-- Name: for_delete_product__id_seq; Type: SEQUENCE; Schema: public; Owner: shopbot
--

CREATE SEQUENCE public.for_delete_product__id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.for_delete_product__id_seq OWNER TO shopbot;

--
-- TOC entry 3063 (class 0 OID 0)
-- Dependencies: 204
-- Name: for_delete_product__id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: shopbot
--

ALTER SEQUENCE public.for_delete_product__id_seq OWNED BY public.for_delete_product._id;


--
-- TOC entry 203 (class 1259 OID 24819)
-- Name: manager_order; Type: TABLE; Schema: public; Owner: shopbot
--

CREATE TABLE public.manager_order (
    _id integer NOT NULL,
    user_id text,
    username text
);


ALTER TABLE public.manager_order OWNER TO shopbot;

--
-- TOC entry 202 (class 1259 OID 24817)
-- Name: manager_order__id_seq; Type: SEQUENCE; Schema: public; Owner: shopbot
--

CREATE SEQUENCE public.manager_order__id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.manager_order__id_seq OWNER TO shopbot;

--
-- TOC entry 3064 (class 0 OID 0)
-- Dependencies: 202
-- Name: manager_order__id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: shopbot
--

ALTER SEQUENCE public.manager_order__id_seq OWNED BY public.manager_order._id;


--
-- TOC entry 215 (class 1259 OID 25023)
-- Name: product; Type: TABLE; Schema: public; Owner: shopbot
--

CREATE TABLE public.product (
    _id integer NOT NULL,
    title text,
    about text DEFAULT ''::text,
    price integer,
    photo_src text DEFAULT 'photo/default.jpg'::text,
    id_categories integer NOT NULL,
    nodelete numeric DEFAULT 1 NOT NULL,
    CONSTRAINT product_nodelete_check CHECK ((nodelete = ANY (ARRAY[(0)::numeric, (1)::numeric])))
);


ALTER TABLE public.product OWNER TO shopbot;

--
-- TOC entry 214 (class 1259 OID 25021)
-- Name: product__id_seq; Type: SEQUENCE; Schema: public; Owner: shopbot
--

CREATE SEQUENCE public.product__id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.product__id_seq OWNER TO shopbot;

--
-- TOC entry 3065 (class 0 OID 0)
-- Dependencies: 214
-- Name: product__id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: shopbot
--

ALTER SEQUENCE public.product__id_seq OWNED BY public.product._id;


--
-- TOC entry 207 (class 1259 OID 24975)
-- Name: settings; Type: TABLE; Schema: public; Owner: shopbot
--

CREATE TABLE public.settings (
    _id integer NOT NULL,
    name text,
    value text
);


ALTER TABLE public.settings OWNER TO shopbot;

--
-- TOC entry 206 (class 1259 OID 24973)
-- Name: settings__id_seq; Type: SEQUENCE; Schema: public; Owner: shopbot
--

CREATE SEQUENCE public.settings__id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.settings__id_seq OWNER TO shopbot;

--
-- TOC entry 3066 (class 0 OID 0)
-- Dependencies: 206
-- Name: settings__id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: shopbot
--

ALTER SEQUENCE public.settings__id_seq OWNED BY public.settings._id;


--
-- TOC entry 2893 (class 2604 OID 25085)
-- Name: admin _id; Type: DEFAULT; Schema: public; Owner: shopbot
--

ALTER TABLE ONLY public.admin ALTER COLUMN _id SET DEFAULT nextval('public.admin__id_seq'::regclass);


--
-- TOC entry 2884 (class 2604 OID 25000)
-- Name: baskets _id; Type: DEFAULT; Schema: public; Owner: shopbot
--

ALTER TABLE ONLY public.baskets ALTER COLUMN _id SET DEFAULT nextval('public.baskets__id_seq'::regclass);


--
-- TOC entry 2885 (class 2604 OID 25008)
-- Name: categories _id; Type: DEFAULT; Schema: public; Owner: shopbot
--

ALTER TABLE ONLY public.categories ALTER COLUMN _id SET DEFAULT nextval('public.categories__id_seq'::regclass);


--
-- TOC entry 2883 (class 2604 OID 24989)
-- Name: clients _id; Type: DEFAULT; Schema: public; Owner: shopbot
--

ALTER TABLE ONLY public.clients ALTER COLUMN _id SET DEFAULT nextval('public.clients__id_seq'::regclass);


--
-- TOC entry 2881 (class 2604 OID 24925)
-- Name: for_delete_product _id; Type: DEFAULT; Schema: public; Owner: shopbot
--

ALTER TABLE ONLY public.for_delete_product ALTER COLUMN _id SET DEFAULT nextval('public.for_delete_product__id_seq'::regclass);


--
-- TOC entry 2880 (class 2604 OID 24822)
-- Name: manager_order _id; Type: DEFAULT; Schema: public; Owner: shopbot
--

ALTER TABLE ONLY public.manager_order ALTER COLUMN _id SET DEFAULT nextval('public.manager_order__id_seq'::regclass);


--
-- TOC entry 2888 (class 2604 OID 25026)
-- Name: product _id; Type: DEFAULT; Schema: public; Owner: shopbot
--

ALTER TABLE ONLY public.product ALTER COLUMN _id SET DEFAULT nextval('public.product__id_seq'::regclass);


--
-- TOC entry 2882 (class 2604 OID 24978)
-- Name: settings _id; Type: DEFAULT; Schema: public; Owner: shopbot
--

ALTER TABLE ONLY public.settings ALTER COLUMN _id SET DEFAULT nextval('public.settings__id_seq'::regclass);


--
-- TOC entry 3053 (class 0 OID 25082)
-- Dependencies: 217
-- Data for Name: admin; Type: TABLE DATA; Schema: public; Owner: shopbot
--

INSERT INTO public.admin (_id, user_id, type, salt, password, username, name) VALUES (1, 850731060, 'admin', 'o6670ucb2qxlc5pfptb9', '3f090271a103a6b1bfabaf663bd3f50359ae95c325ad4794d334dbea389475c1', 'ar4en', 'AR4EN  ');

--
-- TOC entry 3047 (class 0 OID 24997)
-- Dependencies: 211
-- Data for Name: baskets; Type: TABLE DATA; Schema: public; Owner: shopbot
--




--
-- TOC entry 3049 (class 0 OID 25005)
-- Dependencies: 213
-- Data for Name: categories; Type: TABLE DATA; Schema: public; Owner: shopbot
--

INSERT INTO public.categories (_id, title, nodelete, parents_categories) VALUES (1, '📁 Каталог', 1, NULL);
INSERT INTO public.categories (_id, title, nodelete, parents_categories) VALUES (2, 'HQD', 1, 1);
INSERT INTO public.categories (_id, title, nodelete, parents_categories) VALUES (3, 'Juul', 1, 1);
INSERT INTO public.categories (_id, title, nodelete, parents_categories) VALUES (4, '👣Другое', 1, 1);
INSERT INTO public.categories (_id, title, nodelete, parents_categories) VALUES (5, 'Massking', 1, 4);
INSERT INTO public.categories (_id, title, nodelete, parents_categories) VALUES (6, 'Cavie', 1, 2);
INSERT INTO public.categories (_id, title, nodelete, parents_categories) VALUES (7, 'Rosy', 1, 2);
INSERT INTO public.categories (_id, title, nodelete, parents_categories) VALUES (8, 'Девайсы', 1, 3);
INSERT INTO public.categories (_id, title, nodelete, parents_categories) VALUES (9, 'MASSKING PRO', 1, 5);


--
-- TOC entry 3045 (class 0 OID 24986)
-- Dependencies: 209
-- Data for Name: clients; Type: TABLE DATA; Schema: public; Owner: shopbot
--

--INSERT INTO public.clients (_id, user_id, username, fio, phone, city, address, date_registration) VALUES (1, 850731060, 'ar4en', 'Чичёткин Николя Посратушкин', '+79895043780', 'Ростов-на-Дону', 'Толмачёва 7', '2021/09/20 23:02:26');


--
-- TOC entry 3041 (class 0 OID 24922)
-- Dependencies: 205
-- Data for Name: for_delete_product; Type: TABLE DATA; Schema: public; Owner: shopbot
--



--
-- TOC entry 3039 (class 0 OID 24819)
-- Dependencies: 203
-- Data for Name: manager_order; Type: TABLE DATA; Schema: public; Owner: shopbot
--



--
-- TOC entry 3051 (class 0 OID 25023)
-- Dependencies: 215
-- Data for Name: product; Type: TABLE DATA; Schema: public; Owner: shopbot
--

INSERT INTO public.product (_id, title, about, price, photo_src, id_categories, nodelete) VALUES (1, '🍓Strawberry', 'На вкус и цвет.', 270, 'photo/zt&h|#!r713x<t1f>!]kb:="h1hy9n0e>c.yje1p.jpg', 6, 1);
INSERT INTO public.product (_id, title, about, price, photo_src, id_categories, nodelete) VALUES (2, '🧡Cinnamon', 'Всё, что у меня есть - это кофе и корица.', 270, 'photo/y9w6|dbu9=t|ol5a{=|u6f*.@%4xrt,.a]i9epz@.jpg', 6, 1);
INSERT INTO public.product (_id, title, about, price, photo_src, id_categories, nodelete) VALUES (3, '💙Blueberry', 'До скорой встречи.', 300, 'photo/we`6s3ju$?ty0xk>=l,>g_;*?>''"@-~)i[y5({l^.jpg', 7, 1);
INSERT INTO public.product (_id, title, about, price, photo_src, id_categories, nodelete) VALUES (4, '🍈Cantaloupe', 'Cantaloupe- это сорт картошки.', 300, 'photo/y9w6|dbu9=t|ol5a{=|u6f*.@%4xrt,.a]i9epz@.jpg', 7, 1);
INSERT INTO public.product (_id, title, about, price, photo_src, id_categories, nodelete) VALUES (5, '🤍Slate', 'В мире не осталось ни одного места, где не побывал человек.', 850, 'photo/photo_3.png', 8, 1);
INSERT INTO public.product (_id, title, about, price, photo_src, id_categories, nodelete) VALUES (6, '🔌Зарядка', 'Короче, 🔌Зарядка “ — это процесс зарядки, но только для ленивых людей.', 240, 'photo/photo_1.png', 8, 1);
INSERT INTO public.product (_id, title, about, price, photo_src, id_categories, nodelete) VALUES (7, '🔋Кейс-зарядка', 'Посмотрите прогноз погоды на ближайшие 7 дней.', 450, 'photo/default.jpg', 8, 1);
INSERT INTO public.product (_id, title, about, price, photo_src, id_categories, nodelete) VALUES (8, '🥤РОМОВЫЙ СОК', 'В нём сила.', 540, 'photo/photo_2.png', 9, 1);
INSERT INTO public.product (_id, title, about, price, photo_src, id_categories, nodelete) VALUES (9, '🧊🍌БАНАНОВЫЙ ЛЕД', 'Не имеет аналогов. а также обладает целебными свойствами.', 540, 'photo/photo_5.png', 9, 1);

--
-- TOC entry 3043 (class 0 OID 24975)
-- Dependencies: 207
-- Data for Name: settings; Type: TABLE DATA; Schema: public; Owner: shopbot
--

INSERT INTO public.settings (_id, name, value) VALUES (1, 'key_word', 'secret');
INSERT INTO public.settings (_id, name, value) VALUES (2, 'info', 'Этот бот является официальным представителем магазина *shop name*
Через него вы можете сделать заказ двумя способами:
1 - Интерактивно (нажимая на кнопки)
2 - Неинтерактивно (получить прайс лист, после чего отправить свой заказ боту)');
INSERT INTO public.settings (_id, name, value) VALUES (3, 'support', '850731060');
INSERT INTO public.settings (_id, name, value) VALUES (4, 'order', '850731060');
INSERT INTO public.settings (_id, name, value) VALUES (5, 'develop_bot', 'develop_support_bot');
INSERT INTO public.settings (_id, name, value) VALUES (6, 'develop_man', 'cha_shopbot');
INSERT INTO public.settings (_id, name, value) VALUES (7, 'bot_token', '1902431798:AAGiwqXoLtyTTv50eZfL-FxIjyJUWh1VgAw');
INSERT INTO public.settings (_id, name, value) VALUES (8, 'bot_manager_token', '1902431798:AAGiwqXoLtyTTv50eZfL-FxIjyJUWh1VgAw');


--
-- TOC entry 3067 (class 0 OID 0)
-- Dependencies: 216
-- Name: admin__id_seq; Type: SEQUENCE SET; Schema: public; Owner: shopbot
--

SELECT pg_catalog.setval('public.admin__id_seq', 3, true);


--
-- TOC entry 3068 (class 0 OID 0)
-- Dependencies: 210
-- Name: baskets__id_seq; Type: SEQUENCE SET; Schema: public; Owner: shopbot
--

SELECT pg_catalog.setval('public.baskets__id_seq', 1, false);


--
-- TOC entry 3069 (class 0 OID 0)
-- Dependencies: 212
-- Name: categories__id_seq; Type: SEQUENCE SET; Schema: public; Owner: shopbot
--

SELECT pg_catalog.setval('public.categories__id_seq', 1, false);


--
-- TOC entry 3070 (class 0 OID 0)
-- Dependencies: 208
-- Name: clients__id_seq; Type: SEQUENCE SET; Schema: public; Owner: shopbot
--

SELECT pg_catalog.setval('public.clients__id_seq', 1, false);


--
-- TOC entry 3071 (class 0 OID 0)
-- Dependencies: 204
-- Name: for_delete_product__id_seq; Type: SEQUENCE SET; Schema: public; Owner: shopbot
--

SELECT pg_catalog.setval('public.for_delete_product__id_seq', 4, true);


--
-- TOC entry 3072 (class 0 OID 0)
-- Dependencies: 202
-- Name: manager_order__id_seq; Type: SEQUENCE SET; Schema: public; Owner: shopbot
--

SELECT pg_catalog.setval('public.manager_order__id_seq', 1, false);


--
-- TOC entry 3073 (class 0 OID 0)
-- Dependencies: 214
-- Name: product__id_seq; Type: SEQUENCE SET; Schema: public; Owner: shopbot
--

SELECT pg_catalog.setval('public.product__id_seq', 1, false);


--
-- TOC entry 3074 (class 0 OID 0)
-- Dependencies: 206
-- Name: settings__id_seq; Type: SEQUENCE SET; Schema: public; Owner: shopbot
--

SELECT pg_catalog.setval('public.settings__id_seq', 1, false);


--
-- TOC entry 2907 (class 2606 OID 25090)
-- Name: admin admin_pkey; Type: CONSTRAINT; Schema: public; Owner: shopbot
--

ALTER TABLE ONLY public.admin
    ADD CONSTRAINT admin_pkey PRIMARY KEY (_id);


--
-- TOC entry 2909 (class 2606 OID 25092)
-- Name: admin admin_user_id_key; Type: CONSTRAINT; Schema: public; Owner: shopbot
--

ALTER TABLE ONLY public.admin
    ADD CONSTRAINT admin_user_id_key UNIQUE (user_id);


--
-- TOC entry 2901 (class 2606 OID 25002)
-- Name: baskets baskets_pkey; Type: CONSTRAINT; Schema: public; Owner: shopbot
--

ALTER TABLE ONLY public.baskets
    ADD CONSTRAINT baskets_pkey PRIMARY KEY (_id);


--
-- TOC entry 2903 (class 2606 OID 25015)
-- Name: categories categories_pkey; Type: CONSTRAINT; Schema: public; Owner: shopbot
--

ALTER TABLE ONLY public.categories
    ADD CONSTRAINT categories_pkey PRIMARY KEY (_id);


--
-- TOC entry 2899 (class 2606 OID 24994)
-- Name: clients clients_pkey; Type: CONSTRAINT; Schema: public; Owner: shopbot
--

ALTER TABLE ONLY public.clients
    ADD CONSTRAINT clients_pkey PRIMARY KEY (_id);


--
-- TOC entry 2895 (class 2606 OID 24927)
-- Name: for_delete_product for_delete_product_pkey; Type: CONSTRAINT; Schema: public; Owner: shopbot
--

ALTER TABLE ONLY public.for_delete_product
    ADD CONSTRAINT for_delete_product_pkey PRIMARY KEY (_id);


--
-- TOC entry 2905 (class 2606 OID 25035)
-- Name: product product_pkey; Type: CONSTRAINT; Schema: public; Owner: shopbot
--

ALTER TABLE ONLY public.product
    ADD CONSTRAINT product_pkey PRIMARY KEY (_id);


--
-- TOC entry 2897 (class 2606 OID 24983)
-- Name: settings settings_pkey; Type: CONSTRAINT; Schema: public; Owner: shopbot
--

ALTER TABLE ONLY public.settings
    ADD CONSTRAINT settings_pkey PRIMARY KEY (_id);


--
-- TOC entry 2910 (class 2606 OID 25016)
-- Name: categories categories_parents_categories_fkey; Type: FK CONSTRAINT; Schema: public; Owner: shopbot
--

ALTER TABLE ONLY public.categories
    ADD CONSTRAINT categories_parents_categories_fkey FOREIGN KEY (parents_categories) REFERENCES public.categories(_id);


--
-- TOC entry 2911 (class 2606 OID 25036)
-- Name: product product_id_categories_fkey; Type: FK CONSTRAINT; Schema: public; Owner: shopbot
--

ALTER TABLE ONLY public.product
    ADD CONSTRAINT product_id_categories_fkey FOREIGN KEY (id_categories) REFERENCES public.categories(_id);


-- Completed on 2021-10-23 15:27:59 MSK

--
-- PostgreSQL database dump complete
--

