--
-- PostgreSQL database dump
--

\restrict 6UaIG5GHiGkFfnb0GgnYvICSrtmDfcVcEMAEygW7vBKRNjMexEdb9ltLYBrnD8o

-- Dumped from database version 18.3
-- Dumped by pg_dump version 18.3

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
-- Name: brands; Type: TABLE; Schema: public; Owner: prs
--

CREATE TABLE public.brands (
    id bigint NOT NULL,
    brand character varying(100) NOT NULL,
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone
);


ALTER TABLE public.brands OWNER TO prs;

--
-- Name: brands_id_seq; Type: SEQUENCE; Schema: public; Owner: prs
--

CREATE SEQUENCE public.brands_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.brands_id_seq OWNER TO prs;

--
-- Name: brands_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: prs
--

ALTER SEQUENCE public.brands_id_seq OWNED BY public.brands.id;


--
-- Name: cache; Type: TABLE; Schema: public; Owner: prs
--

CREATE TABLE public.cache (
    key character varying(255) NOT NULL,
    value text NOT NULL,
    expiration integer NOT NULL
);


ALTER TABLE public.cache OWNER TO prs;

--
-- Name: cache_locks; Type: TABLE; Schema: public; Owner: prs
--

CREATE TABLE public.cache_locks (
    key character varying(255) NOT NULL,
    owner character varying(255) NOT NULL,
    expiration integer NOT NULL
);


ALTER TABLE public.cache_locks OWNER TO prs;

--
-- Name: categories; Type: TABLE; Schema: public; Owner: prs
--

CREATE TABLE public.categories (
    id bigint NOT NULL,
    category character varying(255) NOT NULL,
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone
);


ALTER TABLE public.categories OWNER TO prs;

--
-- Name: categories_id_seq; Type: SEQUENCE; Schema: public; Owner: prs
--

CREATE SEQUENCE public.categories_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.categories_id_seq OWNER TO prs;

--
-- Name: categories_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: prs
--

ALTER SEQUENCE public.categories_id_seq OWNED BY public.categories.id;


--
-- Name: colors; Type: TABLE; Schema: public; Owner: prs
--

CREATE TABLE public.colors (
    id bigint NOT NULL,
    color character varying(100) NOT NULL,
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone
);


ALTER TABLE public.colors OWNER TO prs;

--
-- Name: colors_id_seq; Type: SEQUENCE; Schema: public; Owner: prs
--

CREATE SEQUENCE public.colors_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.colors_id_seq OWNER TO prs;

--
-- Name: colors_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: prs
--

ALTER SEQUENCE public.colors_id_seq OWNED BY public.colors.id;


--
-- Name: customers; Type: TABLE; Schema: public; Owner: prs
--

CREATE TABLE public.customers (
    id bigint NOT NULL,
    name character varying(50) NOT NULL,
    age integer NOT NULL,
    avatar character varying(255),
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone
);


ALTER TABLE public.customers OWNER TO prs;

--
-- Name: customers_id_seq; Type: SEQUENCE; Schema: public; Owner: prs
--

CREATE SEQUENCE public.customers_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.customers_id_seq OWNER TO prs;

--
-- Name: customers_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: prs
--

ALTER SEQUENCE public.customers_id_seq OWNED BY public.customers.id;


--
-- Name: failed_jobs; Type: TABLE; Schema: public; Owner: prs
--

CREATE TABLE public.failed_jobs (
    id bigint NOT NULL,
    uuid character varying(255) NOT NULL,
    connection text NOT NULL,
    queue text NOT NULL,
    payload text NOT NULL,
    exception text NOT NULL,
    failed_at timestamp(0) without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL
);


ALTER TABLE public.failed_jobs OWNER TO prs;

--
-- Name: failed_jobs_id_seq; Type: SEQUENCE; Schema: public; Owner: prs
--

CREATE SEQUENCE public.failed_jobs_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.failed_jobs_id_seq OWNER TO prs;

--
-- Name: failed_jobs_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: prs
--

ALTER SEQUENCE public.failed_jobs_id_seq OWNED BY public.failed_jobs.id;


--
-- Name: features; Type: TABLE; Schema: public; Owner: prs
--

CREATE TABLE public.features (
    id bigint NOT NULL,
    feature character varying(50) NOT NULL,
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone
);


ALTER TABLE public.features OWNER TO prs;

--
-- Name: features_id_seq; Type: SEQUENCE; Schema: public; Owner: prs
--

CREATE SEQUENCE public.features_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.features_id_seq OWNER TO prs;

--
-- Name: features_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: prs
--

ALTER SEQUENCE public.features_id_seq OWNED BY public.features.id;


--
-- Name: job_batches; Type: TABLE; Schema: public; Owner: prs
--

CREATE TABLE public.job_batches (
    id character varying(255) NOT NULL,
    name character varying(255) NOT NULL,
    total_jobs integer NOT NULL,
    pending_jobs integer NOT NULL,
    failed_jobs integer NOT NULL,
    failed_job_ids text NOT NULL,
    options text,
    cancelled_at integer,
    created_at integer NOT NULL,
    finished_at integer
);


ALTER TABLE public.job_batches OWNER TO prs;

--
-- Name: jobs; Type: TABLE; Schema: public; Owner: prs
--

CREATE TABLE public.jobs (
    id bigint NOT NULL,
    queue character varying(255) NOT NULL,
    payload text NOT NULL,
    attempts smallint NOT NULL,
    reserved_at integer,
    available_at integer NOT NULL,
    created_at integer NOT NULL
);


ALTER TABLE public.jobs OWNER TO prs;

--
-- Name: jobs_id_seq; Type: SEQUENCE; Schema: public; Owner: prs
--

CREATE SEQUENCE public.jobs_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.jobs_id_seq OWNER TO prs;

--
-- Name: jobs_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: prs
--

ALTER SEQUENCE public.jobs_id_seq OWNED BY public.jobs.id;


--
-- Name: migrations; Type: TABLE; Schema: public; Owner: prs
--

CREATE TABLE public.migrations (
    id integer NOT NULL,
    migration character varying(255) NOT NULL,
    batch integer NOT NULL
);


ALTER TABLE public.migrations OWNER TO prs;

--
-- Name: migrations_id_seq; Type: SEQUENCE; Schema: public; Owner: prs
--

CREATE SEQUENCE public.migrations_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.migrations_id_seq OWNER TO prs;

--
-- Name: migrations_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: prs
--

ALTER SEQUENCE public.migrations_id_seq OWNED BY public.migrations.id;


--
-- Name: password_reset_tokens; Type: TABLE; Schema: public; Owner: prs
--

CREATE TABLE public.password_reset_tokens (
    email character varying(255) NOT NULL,
    token character varying(255) NOT NULL,
    created_at timestamp(0) without time zone
);


ALTER TABLE public.password_reset_tokens OWNER TO prs;

--
-- Name: products; Type: TABLE; Schema: public; Owner: prs
--

CREATE TABLE public.products (
    id bigint NOT NULL,
    product character varying(255) NOT NULL,
    feature_id bigint NOT NULL,
    category_id bigint NOT NULL,
    color_id bigint NOT NULL,
    size_id bigint NOT NULL,
    price numeric(10,2) NOT NULL,
    brand_id bigint NOT NULL,
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone
);


ALTER TABLE public.products OWNER TO prs;

--
-- Name: products_id_seq; Type: SEQUENCE; Schema: public; Owner: prs
--

CREATE SEQUENCE public.products_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.products_id_seq OWNER TO prs;

--
-- Name: products_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: prs
--

ALTER SEQUENCE public.products_id_seq OWNED BY public.products.id;


--
-- Name: purcheases; Type: TABLE; Schema: public; Owner: prs
--

CREATE TABLE public.purcheases (
    id bigint NOT NULL,
    product_id bigint NOT NULL,
    customer_id bigint NOT NULL,
    salesperson_id bigint NOT NULL,
    dt_purchease timestamp(0) without time zone NOT NULL,
    purchease_hash character varying(50) NOT NULL,
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone
);


ALTER TABLE public.purcheases OWNER TO prs;

--
-- Name: purcheases_id_seq; Type: SEQUENCE; Schema: public; Owner: prs
--

CREATE SEQUENCE public.purcheases_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.purcheases_id_seq OWNER TO prs;

--
-- Name: purcheases_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: prs
--

ALTER SEQUENCE public.purcheases_id_seq OWNED BY public.purcheases.id;


--
-- Name: salespeople; Type: TABLE; Schema: public; Owner: prs
--

CREATE TABLE public.salespeople (
    id bigint NOT NULL,
    name character varying(50) NOT NULL,
    nickname character varying(50) NOT NULL,
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone
);


ALTER TABLE public.salespeople OWNER TO prs;

--
-- Name: salespeople_id_seq; Type: SEQUENCE; Schema: public; Owner: prs
--

CREATE SEQUENCE public.salespeople_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.salespeople_id_seq OWNER TO prs;

--
-- Name: salespeople_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: prs
--

ALTER SEQUENCE public.salespeople_id_seq OWNED BY public.salespeople.id;


--
-- Name: sessions; Type: TABLE; Schema: public; Owner: prs
--

CREATE TABLE public.sessions (
    id character varying(255) NOT NULL,
    user_id bigint,
    ip_address character varying(45),
    user_agent text,
    payload text NOT NULL,
    last_activity integer NOT NULL
);


ALTER TABLE public.sessions OWNER TO prs;

--
-- Name: sizes; Type: TABLE; Schema: public; Owner: prs
--

CREATE TABLE public.sizes (
    id bigint NOT NULL,
    size character varying(20) NOT NULL,
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone
);


ALTER TABLE public.sizes OWNER TO prs;

--
-- Name: sizes_id_seq; Type: SEQUENCE; Schema: public; Owner: prs
--

CREATE SEQUENCE public.sizes_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.sizes_id_seq OWNER TO prs;

--
-- Name: sizes_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: prs
--

ALTER SEQUENCE public.sizes_id_seq OWNED BY public.sizes.id;


--
-- Name: users; Type: TABLE; Schema: public; Owner: prs
--

CREATE TABLE public.users (
    id bigint NOT NULL,
    name character varying(255) NOT NULL,
    avatar character varying(255),
    email character varying(255) NOT NULL,
    email_verified_at timestamp(0) without time zone,
    password character varying(255) NOT NULL,
    remember_token character varying(100),
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone,
    uuid uuid NOT NULL,
    two_factor_secret text,
    two_factor_recovery_codes text,
    two_factor_confirmed_at timestamp(0) without time zone
);


ALTER TABLE public.users OWNER TO prs;

--
-- Name: users_id_seq; Type: SEQUENCE; Schema: public; Owner: prs
--

CREATE SEQUENCE public.users_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.users_id_seq OWNER TO prs;

--
-- Name: users_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: prs
--

ALTER SEQUENCE public.users_id_seq OWNED BY public.users.id;


--
-- Name: brands id; Type: DEFAULT; Schema: public; Owner: prs
--

ALTER TABLE ONLY public.brands ALTER COLUMN id SET DEFAULT nextval('public.brands_id_seq'::regclass);


--
-- Name: categories id; Type: DEFAULT; Schema: public; Owner: prs
--

ALTER TABLE ONLY public.categories ALTER COLUMN id SET DEFAULT nextval('public.categories_id_seq'::regclass);


--
-- Name: colors id; Type: DEFAULT; Schema: public; Owner: prs
--

ALTER TABLE ONLY public.colors ALTER COLUMN id SET DEFAULT nextval('public.colors_id_seq'::regclass);


--
-- Name: customers id; Type: DEFAULT; Schema: public; Owner: prs
--

ALTER TABLE ONLY public.customers ALTER COLUMN id SET DEFAULT nextval('public.customers_id_seq'::regclass);


--
-- Name: failed_jobs id; Type: DEFAULT; Schema: public; Owner: prs
--

ALTER TABLE ONLY public.failed_jobs ALTER COLUMN id SET DEFAULT nextval('public.failed_jobs_id_seq'::regclass);


--
-- Name: features id; Type: DEFAULT; Schema: public; Owner: prs
--

ALTER TABLE ONLY public.features ALTER COLUMN id SET DEFAULT nextval('public.features_id_seq'::regclass);


--
-- Name: jobs id; Type: DEFAULT; Schema: public; Owner: prs
--

ALTER TABLE ONLY public.jobs ALTER COLUMN id SET DEFAULT nextval('public.jobs_id_seq'::regclass);


--
-- Name: migrations id; Type: DEFAULT; Schema: public; Owner: prs
--

ALTER TABLE ONLY public.migrations ALTER COLUMN id SET DEFAULT nextval('public.migrations_id_seq'::regclass);


--
-- Name: products id; Type: DEFAULT; Schema: public; Owner: prs
--

ALTER TABLE ONLY public.products ALTER COLUMN id SET DEFAULT nextval('public.products_id_seq'::regclass);


--
-- Name: purcheases id; Type: DEFAULT; Schema: public; Owner: prs
--

ALTER TABLE ONLY public.purcheases ALTER COLUMN id SET DEFAULT nextval('public.purcheases_id_seq'::regclass);


--
-- Name: salespeople id; Type: DEFAULT; Schema: public; Owner: prs
--

ALTER TABLE ONLY public.salespeople ALTER COLUMN id SET DEFAULT nextval('public.salespeople_id_seq'::regclass);


--
-- Name: sizes id; Type: DEFAULT; Schema: public; Owner: prs
--

ALTER TABLE ONLY public.sizes ALTER COLUMN id SET DEFAULT nextval('public.sizes_id_seq'::regclass);


--
-- Name: users id; Type: DEFAULT; Schema: public; Owner: prs
--

ALTER TABLE ONLY public.users ALTER COLUMN id SET DEFAULT nextval('public.users_id_seq'::regclass);


--
-- Data for Name: brands; Type: TABLE DATA; Schema: public; Owner: prs
--

COPY public.brands (id, brand, created_at, updated_at) FROM stdin;
1	Adidas Kids	\N	\N
2	Akazys	\N	\N
3	Bendita Cute	\N	\N
4	Boboi	\N	\N
5	Brandille	\N	\N
6	C&A Baby	\N	\N
7	C&A Kids	\N	\N
8	Carters	\N	\N
9	Colcci Kids	\N	\N
10	Conjunto Infantil	\N	\N
11	Dafiti Kids	\N	\N
12	Disney Baby	\N	\N
13	Disney Kids	\N	\N
14	Farm Kids	\N	\N
15	Hering Kids	\N	\N
16	Ki Carinho	\N	\N
17	Kily	\N	\N
18	Lacoste Kids	\N	\N
19	Lilica Ripilica	\N	\N
20	Maria Filó Kids	\N	\N
21	Marisol	\N	\N
22	Mundo Infantil	\N	\N
23	Mundo Pet	\N	\N
24	Osklen Kids	\N	\N
25	Petit Royal	\N	\N
26	Pimpolho	\N	\N
27	Puket Kids	\N	\N
28	Renner Kids	\N	\N
29	Riachuelo Kids	\N	\N
30	Salsa Jeans Kids	\N	\N
31	Zoe Kids	\N	\N
\.


--
-- Data for Name: cache; Type: TABLE DATA; Schema: public; Owner: prs
--

COPY public.cache (key, value, expiration) FROM stdin;
\.


--
-- Data for Name: cache_locks; Type: TABLE DATA; Schema: public; Owner: prs
--

COPY public.cache_locks (key, owner, expiration) FROM stdin;
\.


--
-- Data for Name: categories; Type: TABLE DATA; Schema: public; Owner: prs
--

COPY public.categories (id, category, created_at, updated_at) FROM stdin;
1	Bermuda	\N	\N
2	Biquine	\N	\N
3	Blusa	\N	\N
4	Calçado	\N	\N
5	Calça	\N	\N
6	Calcinha	\N	\N
7	Camisa	\N	\N
8	Camiseta	\N	\N
9	Casaco	\N	\N
10	Cueca	\N	\N
11	Jaqueta	\N	\N
12	Macacão	\N	\N
13	Maiô	\N	\N
14	Meia	\N	\N
15	Pijama	\N	\N
16	Saia	\N	\N
17	Short	\N	\N
18	Sunga	\N	\N
19	Sutiã	\N	\N
20	Top	\N	\N
21	Vestido	\N	\N
\.


--
-- Data for Name: colors; Type: TABLE DATA; Schema: public; Owner: prs
--

COPY public.colors (id, color, created_at, updated_at) FROM stdin;
1	Azul	\N	\N
2	Rosa	\N	\N
3	Preto(a)	\N	\N
4	Branco(a)	\N	\N
5	Verde	\N	\N
6	Vermelho(a)	\N	\N
7	Amarelo(a)	\N	\N
8	Cinza	\N	\N
9	Azul Escuro(a)	\N	\N
10	Rosa Choque	\N	\N
11	Laranja	\N	\N
12	Roxo(a)	\N	\N
13	Marrom	\N	\N
14	Bege	\N	\N
15	Turquesa	\N	\N
16	Lilás	\N	\N
17	Dourado(a)	\N	\N
18	Prata	\N	\N
19	Vinho	\N	\N
20	Cáqui	\N	\N
\.


--
-- Data for Name: customers; Type: TABLE DATA; Schema: public; Owner: prs
--

COPY public.customers (id, name, age, avatar, created_at, updated_at) FROM stdin;
1	Simon Teles Sobrinho	23	https://api.dicebear.com/7.x/avataaars/svg?seed=RmyCHgaRFO	2026-04-25 10:25:09	2026-04-25 10:25:09
2	Srta. Laiane Soares Neto	22	https://api.dicebear.com/7.x/avataaars/svg?seed=oPtcijfJkq	2026-04-25 10:25:09	2026-04-25 10:25:09
3	Karen Valéria Garcia Jr.	33	https://api.dicebear.com/7.x/avataaars/svg?seed=bgWUCwR4TF	2026-04-25 10:25:09	2026-04-25 10:25:09
4	Sandro Velasques Galhardo Filho	32	https://api.dicebear.com/7.x/avataaars/svg?seed=baLBYDu78k	2026-04-25 10:25:09	2026-04-25 10:25:09
5	Sr. Aaron Manuel Pena Neto	42	https://api.dicebear.com/7.x/avataaars/svg?seed=IYEfN5FgLw	2026-04-25 10:25:09	2026-04-25 10:25:09
6	Sra. Hortência Heloísa Souza	31	https://api.dicebear.com/7.x/avataaars/svg?seed=k39CsXTSFI	2026-04-25 10:25:09	2026-04-25 10:25:09
7	Eric Francisco Vega	36	https://api.dicebear.com/7.x/avataaars/svg?seed=SU4XYpHxYR	2026-04-25 10:25:09	2026-04-25 10:25:09
8	Helena Fernandes da Rosa	23	https://api.dicebear.com/7.x/avataaars/svg?seed=jC4PnscEJu	2026-04-25 10:25:09	2026-04-25 10:25:09
9	Sra. Vitória Rios Filho	33	https://api.dicebear.com/7.x/avataaars/svg?seed=Af7rMeQh2C	2026-04-25 10:25:09	2026-04-25 10:25:09
10	Dr. Lia de Souza Lutero Filho	57	https://api.dicebear.com/7.x/avataaars/svg?seed=rfaF8WtOqD	2026-04-25 10:25:09	2026-04-25 10:25:09
11	Dr. Poliana Faro Zambrano	64	https://api.dicebear.com/7.x/avataaars/svg?seed=6sXsInif7U	2026-04-25 10:25:09	2026-04-25 10:25:09
12	Dr. Gabrielly Katherine Dias Jr.	62	https://api.dicebear.com/7.x/avataaars/svg?seed=oCbUcbe3Qd	2026-04-25 10:25:09	2026-04-25 10:25:09
13	Bárbara Daiana Sanches Neto	25	https://api.dicebear.com/7.x/avataaars/svg?seed=qUNz3Esg3q	2026-04-25 10:25:09	2026-04-25 10:25:09
14	Andréa Luna Ferraz Filho	63	https://api.dicebear.com/7.x/avataaars/svg?seed=QssiLfjkQK	2026-04-25 10:25:09	2026-04-25 10:25:09
15	Alonso Breno Padilha Jr.	37	https://api.dicebear.com/7.x/avataaars/svg?seed=5KYSgfyfSK	2026-04-25 10:25:09	2026-04-25 10:25:09
16	Máximo Fernando Perez	47	https://api.dicebear.com/7.x/avataaars/svg?seed=1MGE3oLo55	2026-04-25 10:25:09	2026-04-25 10:25:09
17	Jasmin Pena	22	https://api.dicebear.com/7.x/avataaars/svg?seed=RV1TbmSdNq	2026-04-25 10:25:09	2026-04-25 10:25:09
18	Gabi Carvalho Filho	48	https://api.dicebear.com/7.x/avataaars/svg?seed=LeL52LAetd	2026-04-25 10:25:09	2026-04-25 10:25:09
19	Emílio Théo Mascarenhas Neto	55	https://api.dicebear.com/7.x/avataaars/svg?seed=Xwhm4r2RdG	2026-04-25 10:25:09	2026-04-25 10:25:09
20	Victor Sérgio Jimenes	39	https://api.dicebear.com/7.x/avataaars/svg?seed=CuGKDwM5o3	2026-04-25 10:25:09	2026-04-25 10:25:09
21	Stephanie Franco	33	https://api.dicebear.com/7.x/avataaars/svg?seed=0oM4GUsxZA	2026-04-25 10:25:09	2026-04-25 10:25:09
22	Leo Maldonado Galindo	30	https://api.dicebear.com/7.x/avataaars/svg?seed=lJnVfx9JQX	2026-04-25 10:25:09	2026-04-25 10:25:09
23	Fabiana Dayana Campos	41	https://api.dicebear.com/7.x/avataaars/svg?seed=RRNUsR7I3w	2026-04-25 10:25:09	2026-04-25 10:25:09
24	Srta. Laura Mascarenhas	33	https://api.dicebear.com/7.x/avataaars/svg?seed=sdr74zIoaC	2026-04-25 10:25:09	2026-04-25 10:25:09
25	Sr. Christian Ítalo Serna	27	https://api.dicebear.com/7.x/avataaars/svg?seed=6H4qiSCxTB	2026-04-25 10:25:09	2026-04-25 10:25:09
26	Lucas Branco	19	https://api.dicebear.com/7.x/avataaars/svg?seed=CpE1HfinCg	2026-04-25 10:25:09	2026-04-25 10:25:09
27	Juliano Cristiano Benites Sobrinho	61	https://api.dicebear.com/7.x/avataaars/svg?seed=OBZ98VDjrq	2026-04-25 10:25:09	2026-04-25 10:25:09
28	Dr. Diogo Camilo Marés	18	https://api.dicebear.com/7.x/avataaars/svg?seed=CFtVjv6awF	2026-04-25 10:25:09	2026-04-25 10:25:09
29	Denis Vale Saraiva	66	https://api.dicebear.com/7.x/avataaars/svg?seed=by3KwLzo6J	2026-04-25 10:25:09	2026-04-25 10:25:09
30	Gean Danilo Branco Neto	65	https://api.dicebear.com/7.x/avataaars/svg?seed=FqVEyoESuF	2026-04-25 10:25:09	2026-04-25 10:25:09
31	Sra. Pérola Santos das Neves	67	https://api.dicebear.com/7.x/avataaars/svg?seed=VlifCt6T1X	2026-04-25 10:25:09	2026-04-25 10:25:09
32	Dr. Matheus das Neves	44	https://api.dicebear.com/7.x/avataaars/svg?seed=g6Q0kN4D7Q	2026-04-25 10:25:09	2026-04-25 10:25:09
33	Sr. Leo Bezerra da Silva	39	https://api.dicebear.com/7.x/avataaars/svg?seed=xfSD7d0bvh	2026-04-25 10:25:09	2026-04-25 10:25:09
34	Sr. Walter Chaves das Dores	52	https://api.dicebear.com/7.x/avataaars/svg?seed=p2R6qjMlRb	2026-04-25 10:25:09	2026-04-25 10:25:09
35	Alessandra Suelen Serna	20	https://api.dicebear.com/7.x/avataaars/svg?seed=O9wcYapWXi	2026-04-25 10:25:09	2026-04-25 10:25:09
36	Sr. Emílio Franco Fidalgo	60	https://api.dicebear.com/7.x/avataaars/svg?seed=kAMJk20P9q	2026-04-25 10:25:09	2026-04-25 10:25:09
37	Dr. Henrique Ramires Arruda Neto	34	https://api.dicebear.com/7.x/avataaars/svg?seed=reoonpTpHl	2026-04-25 10:25:09	2026-04-25 10:25:09
38	Verônica Valência	31	https://api.dicebear.com/7.x/avataaars/svg?seed=hBaEfKOtS1	2026-04-25 10:25:09	2026-04-25 10:25:09
39	Dr. Antônio Lozano Neto	16	https://api.dicebear.com/7.x/avataaars/svg?seed=s2bpLJKjmv	2026-04-25 10:25:09	2026-04-25 10:25:09
40	Dr. Kevin Madeira	37	https://api.dicebear.com/7.x/avataaars/svg?seed=IKlDR0ZICE	2026-04-25 10:25:09	2026-04-25 10:25:09
41	Noemi Michelle Fidalgo Filho	65	https://api.dicebear.com/7.x/avataaars/svg?seed=VL3S7o6hXo	2026-04-25 10:25:09	2026-04-25 10:25:09
42	Sra. Regina Roberta Campos Jr.	42	https://api.dicebear.com/7.x/avataaars/svg?seed=orcJMQhoOb	2026-04-25 10:25:09	2026-04-25 10:25:09
43	Gilberto Edson Lutero Filho	63	https://api.dicebear.com/7.x/avataaars/svg?seed=GBDYafGHo2	2026-04-25 10:25:09	2026-04-25 10:25:09
44	Dr. Heloise Abreu	28	https://api.dicebear.com/7.x/avataaars/svg?seed=dfiONYtFW6	2026-04-25 10:25:09	2026-04-25 10:25:09
45	Lucio Reinaldo Roque	45	https://api.dicebear.com/7.x/avataaars/svg?seed=GnDtxweOtM	2026-04-25 10:25:09	2026-04-25 10:25:09
46	Dr. Christopher Correia Sobrinho	19	https://api.dicebear.com/7.x/avataaars/svg?seed=MOT7f8Kh83	2026-04-25 10:25:09	2026-04-25 10:25:09
47	Srta. Vanessa Dayane Assunção Filho	45	https://api.dicebear.com/7.x/avataaars/svg?seed=1b1C9IfSjM	2026-04-25 10:25:09	2026-04-25 10:25:09
48	Rafael Molina Filho	55	https://api.dicebear.com/7.x/avataaars/svg?seed=Gsd9hNgXPS	2026-04-25 10:25:09	2026-04-25 10:25:09
49	Naiara Roque	23	https://api.dicebear.com/7.x/avataaars/svg?seed=YjHCPwcptv	2026-04-25 10:25:09	2026-04-25 10:25:09
50	Benjamin Sepúlveda	60	https://api.dicebear.com/7.x/avataaars/svg?seed=y88F2PgfuT	2026-04-25 10:25:09	2026-04-25 10:25:09
51	Moisés Esteves Alcantara	33	https://api.dicebear.com/7.x/avataaars/svg?seed=LA2sEaDZwc	2026-04-25 10:25:09	2026-04-25 10:25:09
52	Mário Azevedo Esteves Neto	31	https://api.dicebear.com/7.x/avataaars/svg?seed=chVsRmxqGY	2026-04-25 10:25:09	2026-04-25 10:25:09
53	Lavínia Diana Godói	16	https://api.dicebear.com/7.x/avataaars/svg?seed=8eahhB8Xo1	2026-04-25 10:25:09	2026-04-25 10:25:09
54	Tainara Arruda Verdugo Jr.	68	https://api.dicebear.com/7.x/avataaars/svg?seed=uf9b8TD8mg	2026-04-25 10:25:09	2026-04-25 10:25:09
55	Srta. Noa Tessália Salazar	51	https://api.dicebear.com/7.x/avataaars/svg?seed=k71s7G9yDv	2026-04-25 10:25:09	2026-04-25 10:25:09
56	Srta. Giovanna Fidalgo Pacheco Jr.	32	https://api.dicebear.com/7.x/avataaars/svg?seed=QAlDhvAZLP	2026-04-25 10:25:09	2026-04-25 10:25:09
57	Isabelly Furtado Galindo Filho	63	https://api.dicebear.com/7.x/avataaars/svg?seed=a2zmzyKCc9	2026-04-25 10:25:09	2026-04-25 10:25:09
58	Dr. Rogério Molina Jr.	20	https://api.dicebear.com/7.x/avataaars/svg?seed=5UsUrbluiO	2026-04-25 10:25:09	2026-04-25 10:25:09
59	Dr. Luzia Molina Colaço	17	https://api.dicebear.com/7.x/avataaars/svg?seed=epnpIhYLoQ	2026-04-25 10:25:09	2026-04-25 10:25:09
60	Mila Luiza Santana Jr.	19	https://api.dicebear.com/7.x/avataaars/svg?seed=Ey8JKPSefO	2026-04-25 10:25:09	2026-04-25 10:25:09
61	Sra. Manoela Aline Rosa Jr.	36	https://api.dicebear.com/7.x/avataaars/svg?seed=e3ozr9Imks	2026-04-25 10:25:09	2026-04-25 10:25:09
62	Christopher Jácomo Campos	26	https://api.dicebear.com/7.x/avataaars/svg?seed=pzbJ1dlVjr	2026-04-25 10:25:09	2026-04-25 10:25:09
63	Otávio Pablo Sales	48	https://api.dicebear.com/7.x/avataaars/svg?seed=jKFDxuSpmJ	2026-04-25 10:25:09	2026-04-25 10:25:09
64	Sr. Inácio Igor Delatorre	23	https://api.dicebear.com/7.x/avataaars/svg?seed=6fzuL9k1j7	2026-04-25 10:25:09	2026-04-25 10:25:09
65	Dr. Rosana Arruda	69	https://api.dicebear.com/7.x/avataaars/svg?seed=HdrFaYXZ9U	2026-04-25 10:25:09	2026-04-25 10:25:09
66	Anita Corona Jr.	45	https://api.dicebear.com/7.x/avataaars/svg?seed=HjEcE3MTsa	2026-04-25 10:25:09	2026-04-25 10:25:09
67	Sra. Sandra Paes	46	https://api.dicebear.com/7.x/avataaars/svg?seed=2dDoGN3V4K	2026-04-25 10:25:09	2026-04-25 10:25:09
68	Sr. Thiago das Neves Vieira Filho	40	https://api.dicebear.com/7.x/avataaars/svg?seed=cslyElxRau	2026-04-25 10:25:09	2026-04-25 10:25:09
69	Gael Pereira Brito	29	https://api.dicebear.com/7.x/avataaars/svg?seed=e9efDf1DDn	2026-04-25 10:25:09	2026-04-25 10:25:09
70	Dr. José Caio Vale	70	https://api.dicebear.com/7.x/avataaars/svg?seed=4nAkJUi2mk	2026-04-25 10:25:09	2026-04-25 10:25:09
71	Cristian Jácomo Meireles	30	https://api.dicebear.com/7.x/avataaars/svg?seed=Tnn4awRttX	2026-04-25 10:25:09	2026-04-25 10:25:09
72	Dr. Adriel Fidalgo Barreto	65	https://api.dicebear.com/7.x/avataaars/svg?seed=JZKKO8aM9K	2026-04-25 10:25:09	2026-04-25 10:25:09
73	Miranda Sanches	49	https://api.dicebear.com/7.x/avataaars/svg?seed=MPHbYaqgKU	2026-04-25 10:25:09	2026-04-25 10:25:09
74	Srta. Daniella Tâmara Oliveira	65	https://api.dicebear.com/7.x/avataaars/svg?seed=4EezejNTmA	2026-04-25 10:25:09	2026-04-25 10:25:09
75	Sr. Leonardo Brito Montenegro Sobrinho	16	https://api.dicebear.com/7.x/avataaars/svg?seed=wui4TyyWpC	2026-04-25 10:25:09	2026-04-25 10:25:09
76	Viviane Sônia Bezerra Jr.	25	https://api.dicebear.com/7.x/avataaars/svg?seed=Z3wqJ2WKaw	2026-04-25 10:25:09	2026-04-25 10:25:09
77	Srta. Cristina Bezerra Paz Sobrinho	63	https://api.dicebear.com/7.x/avataaars/svg?seed=U2nOGhF3GW	2026-04-25 10:25:09	2026-04-25 10:25:09
78	Adriele Elis Dias Neto	24	https://api.dicebear.com/7.x/avataaars/svg?seed=20K04gP8EV	2026-04-25 10:25:09	2026-04-25 10:25:09
79	Srta. Laiane Melina Rezende Jr.	52	https://api.dicebear.com/7.x/avataaars/svg?seed=cGnr0k3ZzF	2026-04-25 10:25:09	2026-04-25 10:25:09
80	Dr. Heitor Flores de Arruda Filho	39	https://api.dicebear.com/7.x/avataaars/svg?seed=3APSm5Ok7I	2026-04-25 10:25:09	2026-04-25 10:25:09
81	Dr. Luiza Vila Fidalgo	21	https://api.dicebear.com/7.x/avataaars/svg?seed=dxOTVrJXaI	2026-04-25 10:25:09	2026-04-25 10:25:09
82	Dr. Emiliano Saito Correia Neto	57	https://api.dicebear.com/7.x/avataaars/svg?seed=QaS6lEqihp	2026-04-25 10:25:09	2026-04-25 10:25:09
83	Nathalia Zaragoça Lutero	65	https://api.dicebear.com/7.x/avataaars/svg?seed=NUSsmrqELJ	2026-04-25 10:25:09	2026-04-25 10:25:09
84	Sra. Agustina Milena Cortês Sobrinho	25	https://api.dicebear.com/7.x/avataaars/svg?seed=KetWGDqGEj	2026-04-25 10:25:09	2026-04-25 10:25:09
85	Anderson Matias Jr.	23	https://api.dicebear.com/7.x/avataaars/svg?seed=2343dhEO52	2026-04-25 10:25:09	2026-04-25 10:25:09
86	Dr. Maicon Diego Lovato	67	https://api.dicebear.com/7.x/avataaars/svg?seed=K9ESBAGMt6	2026-04-25 10:25:09	2026-04-25 10:25:09
87	Analu Godói	49	https://api.dicebear.com/7.x/avataaars/svg?seed=2oXZHWfeqa	2026-04-25 10:25:09	2026-04-25 10:25:09
88	Analu Alves Neto	54	https://api.dicebear.com/7.x/avataaars/svg?seed=EK8Q2xMOVp	2026-04-25 10:25:09	2026-04-25 10:25:09
89	Sra. Stella Franco Urias	47	https://api.dicebear.com/7.x/avataaars/svg?seed=RQbNTBNslq	2026-04-25 10:25:09	2026-04-25 10:25:09
90	Lilian Duarte	18	https://api.dicebear.com/7.x/avataaars/svg?seed=V5RrcOru0l	2026-04-25 10:25:09	2026-04-25 10:25:09
91	Sra. Mariana Giovana Sepúlveda	63	https://api.dicebear.com/7.x/avataaars/svg?seed=fSHk7UJRP0	2026-04-25 10:25:09	2026-04-25 10:25:09
92	Srta. Karina Matias Escobar	63	https://api.dicebear.com/7.x/avataaars/svg?seed=jw6RWj4IfP	2026-04-25 10:25:09	2026-04-25 10:25:09
93	Danielle Arruda Neves	65	https://api.dicebear.com/7.x/avataaars/svg?seed=9kJQSroHYC	2026-04-25 10:25:09	2026-04-25 10:25:09
94	Dr. Antônio Gusmão de Oliveira Jr.	59	https://api.dicebear.com/7.x/avataaars/svg?seed=0zD3c7uJtx	2026-04-25 10:25:09	2026-04-25 10:25:09
95	Sra. Daniella Galhardo Marés Sobrinho	20	https://api.dicebear.com/7.x/avataaars/svg?seed=oVCie27wla	2026-04-25 10:25:09	2026-04-25 10:25:09
96	Dr. Maraisa Carvalho Filho	27	https://api.dicebear.com/7.x/avataaars/svg?seed=AI9BKaX9vM	2026-04-25 10:25:09	2026-04-25 10:25:09
97	Srta. Roberta Rosa Filho	49	https://api.dicebear.com/7.x/avataaars/svg?seed=0oUtKHrbsq	2026-04-25 10:25:09	2026-04-25 10:25:09
98	Fernanda Fidalgo Reis	20	https://api.dicebear.com/7.x/avataaars/svg?seed=AmXYRxHhff	2026-04-25 10:25:09	2026-04-25 10:25:09
99	Dr. Manuel Thales Pena Filho	46	https://api.dicebear.com/7.x/avataaars/svg?seed=NxKcR25fuY	2026-04-25 10:25:09	2026-04-25 10:25:09
100	Sr. Enzo Escobar Serna Neto	62	https://api.dicebear.com/7.x/avataaars/svg?seed=yyk2bWIhII	2026-04-25 10:25:09	2026-04-25 10:25:09
101	Sônia Faro Neto	69	https://api.dicebear.com/7.x/avataaars/svg?seed=fZDbGd4QEj	2026-04-25 10:25:09	2026-04-25 10:25:09
102	Daniel Agostinho Serna Sobrinho	51	https://api.dicebear.com/7.x/avataaars/svg?seed=UZW8QvERyW	2026-04-25 10:25:09	2026-04-25 10:25:09
103	Renata Bárbara Tamoio Neto	22	https://api.dicebear.com/7.x/avataaars/svg?seed=h0BL1sya8F	2026-04-25 10:25:09	2026-04-25 10:25:09
104	Dr. Simão Zambrano Jimenes	42	https://api.dicebear.com/7.x/avataaars/svg?seed=8dsmTjqhah	2026-04-25 10:25:09	2026-04-25 10:25:09
105	Teobaldo Faria de Souza	24	https://api.dicebear.com/7.x/avataaars/svg?seed=DLWJRQEuWU	2026-04-25 10:25:09	2026-04-25 10:25:09
106	Sr. Anderson Mendonça	41	https://api.dicebear.com/7.x/avataaars/svg?seed=VhCdLogKRa	2026-04-25 10:25:09	2026-04-25 10:25:09
107	Thalissa Sales	17	https://api.dicebear.com/7.x/avataaars/svg?seed=uZtM9NdQ9k	2026-04-25 10:25:09	2026-04-25 10:25:09
108	Allan Serra	62	https://api.dicebear.com/7.x/avataaars/svg?seed=y2O5TB98XH	2026-04-25 10:25:09	2026-04-25 10:25:09
109	Ariane Delgado Jr.	62	https://api.dicebear.com/7.x/avataaars/svg?seed=qQHsnDgbwt	2026-04-25 10:25:09	2026-04-25 10:25:09
110	Vitor Beltrão	70	https://api.dicebear.com/7.x/avataaars/svg?seed=3X9RNFTkiR	2026-04-25 10:25:09	2026-04-25 10:25:09
111	Dr. Eva Daiana Soto Jr.	30	https://api.dicebear.com/7.x/avataaars/svg?seed=X0r0ASBqjf	2026-04-25 10:25:09	2026-04-25 10:25:09
112	Alessandra Serrano Neto	38	https://api.dicebear.com/7.x/avataaars/svg?seed=idGKwXrd2z	2026-04-25 10:25:09	2026-04-25 10:25:09
113	Dr. Emanuel Salazar	61	https://api.dicebear.com/7.x/avataaars/svg?seed=WOM5xoIaNL	2026-04-25 10:25:09	2026-04-25 10:25:09
114	Dr. Eloá Beltrão	54	https://api.dicebear.com/7.x/avataaars/svg?seed=UGfD5cnUDe	2026-04-25 10:25:09	2026-04-25 10:25:09
115	Sra. Maitê Rosa Filho	34	https://api.dicebear.com/7.x/avataaars/svg?seed=wy04tOmhoK	2026-04-25 10:25:09	2026-04-25 10:25:09
116	Bia Santos Sobrinho	35	https://api.dicebear.com/7.x/avataaars/svg?seed=5RuBxsdIDc	2026-04-25 10:25:09	2026-04-25 10:25:09
117	Elizabeth Bia Torres	18	https://api.dicebear.com/7.x/avataaars/svg?seed=gRnOlM9IMD	2026-04-25 10:25:09	2026-04-25 10:25:09
118	Lilian Rosa Jr.	57	https://api.dicebear.com/7.x/avataaars/svg?seed=gaepjzrFRl	2026-04-25 10:25:09	2026-04-25 10:25:09
119	Dr. Jefferson Marinho Roque Jr.	45	https://api.dicebear.com/7.x/avataaars/svg?seed=SRBUrawMDW	2026-04-25 10:25:09	2026-04-25 10:25:09
120	Dr. Stella Tatiane Sales Neto	63	https://api.dicebear.com/7.x/avataaars/svg?seed=41DFU6Bnyp	2026-04-25 10:25:09	2026-04-25 10:25:09
\.


--
-- Data for Name: failed_jobs; Type: TABLE DATA; Schema: public; Owner: prs
--

COPY public.failed_jobs (id, uuid, connection, queue, payload, exception, failed_at) FROM stdin;
\.


--
-- Data for Name: features; Type: TABLE DATA; Schema: public; Owner: prs
--

COPY public.features (id, feature, created_at, updated_at) FROM stdin;
1	Ajustável	\N	\N
2	Algodão	\N	\N
3	Animal Print	\N	\N
4	Básico(a)	\N	\N
5	Casual	\N	\N
6	Clássico(a)	\N	\N
7	Colorido(a)	\N	\N
8	Confortável	\N	\N
9	Curto(a)	\N	\N
10	Durável	\N	\N
11	Elástico(a)	\N	\N
12	Esportivo(a)	\N	\N
13	Estampado(a)	\N	\N
14	Fit	\N	\N
15	Floral	\N	\N
16	Formal	\N	\N
17	Jeans	\N	\N
18	Labubu	\N	\N
19	Leve	\N	\N
20	Listrado	\N	\N
21	Longa	\N	\N
22	Loney Tunes	\N	\N
23	Moleton	\N	\N
24	Poliéster	\N	\N
25	Respirável	\N	\N
26	Saja	\N	\N
27	Seda	\N	\N
28	Stitch	\N	\N
29	Temático(a)	\N	\N
30	Toy Store	\N	\N
31	Turma da Mônica	\N	\N
32	Xadrez	\N	\N
\.


--
-- Data for Name: job_batches; Type: TABLE DATA; Schema: public; Owner: prs
--

COPY public.job_batches (id, name, total_jobs, pending_jobs, failed_jobs, failed_job_ids, options, cancelled_at, created_at, finished_at) FROM stdin;
\.


--
-- Data for Name: jobs; Type: TABLE DATA; Schema: public; Owner: prs
--

COPY public.jobs (id, queue, payload, attempts, reserved_at, available_at, created_at) FROM stdin;
\.


--
-- Data for Name: migrations; Type: TABLE DATA; Schema: public; Owner: prs
--

COPY public.migrations (id, migration, batch) FROM stdin;
1	0001_01_01_000000_create_users_table	1
2	0001_01_01_000001_create_cache_table	1
3	0001_01_01_000002_create_jobs_table	1
4	2025_09_28_134841_add_uuid_to_users_table	1
5	2025_10_07_022236_add_two_factor_columns_to_users_table	1
12	2026_04_20_000744_create_product	2
\.


--
-- Data for Name: password_reset_tokens; Type: TABLE DATA; Schema: public; Owner: prs
--

COPY public.password_reset_tokens (email, token, created_at) FROM stdin;
\.


--
-- Data for Name: products; Type: TABLE DATA; Schema: public; Owner: prs
--

COPY public.products (id, product, feature_id, category_id, color_id, size_id, price, brand_id, created_at, updated_at) FROM stdin;
1	Pijama Seda Turquesa (Puket Kids)	27	15	15	5	51.61	27	2026-04-25 10:25:09	2026-04-25 10:25:09
2	Macacão Fit Azul Escuro(a) (Marisol)	14	12	9	8	93.46	21	2026-04-25 10:25:09	2026-04-25 10:25:09
3	Macacão Clássico(a) Prata (Brandille)	6	12	18	17	54.66	5	2026-04-25 10:25:09	2026-04-25 10:25:09
4	Camiseta Toy Store Amarelo(a) (Carters)	30	8	7	13	27.66	8	2026-04-25 10:25:09	2026-04-25 10:25:09
5	Bermuda Casual Branco(a) (Disney Baby)	5	1	4	12	80.68	12	2026-04-25 10:25:09	2026-04-25 10:25:09
6	Biquine Fit Bege (Osklen Kids)	14	2	14	5	10.75	24	2026-04-25 10:25:09	2026-04-25 10:25:09
7	Casaco Colorido(a) Rosa (Disney Kids)	7	9	2	4	104.89	13	2026-04-25 10:25:09	2026-04-25 10:25:09
8	Calcinha Labubu Amarelo(a) (Salsa Jeans Kids)	18	6	7	10	46.52	30	2026-04-25 10:25:09	2026-04-25 10:25:09
9	Sunga Turma da Mônica Dourado(a) (Akazys)	31	18	17	4	113.91	2	2026-04-25 10:25:09	2026-04-25 10:25:09
10	Blusa Toy Store Vinho (Colcci Kids)	30	3	19	7	33.99	9	2026-04-25 10:25:09	2026-04-25 10:25:09
11	Top Toy Store Vinho (Marisol)	30	20	19	4	43.28	21	2026-04-25 10:25:09	2026-04-25 10:25:09
12	Calça Toy Store Roxo(a) (Lilica Ripilica)	30	5	12	1	86.95	19	2026-04-25 10:25:09	2026-04-25 10:25:09
13	Meia Stitch Preto(a) (C&A Kids)	28	14	3	9	25.23	7	2026-04-25 10:25:09	2026-04-25 10:25:09
14	Bermuda Leve Prata (Boboi)	19	1	18	13	81.31	4	2026-04-25 10:25:09	2026-04-25 10:25:09
15	Short Temático(a) Roxo(a) (Puket Kids)	29	17	12	13	79.80	27	2026-04-25 10:25:09	2026-04-25 10:25:09
16	Casaco Poliéster Verde (Salsa Jeans Kids)	24	9	5	13	31.82	30	2026-04-25 10:25:09	2026-04-25 10:25:09
17	Macacão Fit Rosa Choque (C&A Baby)	14	12	10	18	61.55	6	2026-04-25 10:25:09	2026-04-25 10:25:09
18	Sunga Leve Rosa (Renner Kids)	19	18	2	18	27.74	28	2026-04-25 10:25:09	2026-04-25 10:25:09
19	Meia Listrado Turquesa (Disney Baby)	20	14	15	12	24.34	12	2026-04-25 10:25:09	2026-04-25 10:25:09
20	Short Confortável Cinza (Lacoste Kids)	8	17	8	15	25.82	18	2026-04-25 10:25:09	2026-04-25 10:25:09
21	Jaqueta Clássico(a) Bege (Bendita Cute)	6	11	14	2	56.09	3	2026-04-25 10:25:09	2026-04-25 10:25:09
22	Casaco Loney Tunes Prata (Mundo Pet)	22	9	18	11	35.67	23	2026-04-25 10:25:09	2026-04-25 10:25:09
23	Short Longa Roxo(a) (Bendita Cute)	21	17	12	12	76.30	3	2026-04-25 10:25:09	2026-04-25 10:25:09
24	Maiô Longa Cáqui (Marisol)	21	13	20	2	47.06	21	2026-04-25 10:25:09	2026-04-25 10:25:09
25	Biquine Longa Marrom (Kily)	21	2	13	12	29.82	17	2026-04-25 10:25:09	2026-04-25 10:25:09
26	Meia Xadrez Rosa Choque (Puket Kids)	32	14	10	7	10.34	27	2026-04-25 10:25:09	2026-04-25 10:25:09
27	Saia Estampado(a) Roxo(a) (Dafiti Kids)	13	16	12	9	38.00	11	2026-04-25 10:25:09	2026-04-25 10:25:09
28	Calcinha Saja Verde (Colcci Kids)	26	6	5	7	97.24	9	2026-04-25 10:25:09	2026-04-25 10:25:09
29	Camiseta Esportivo(a) Rosa (Bendita Cute)	12	8	2	11	59.08	3	2026-04-25 10:25:09	2026-04-25 10:25:09
30	Saia Temático(a) Vermelho(a) (Disney Baby)	29	16	6	12	66.25	12	2026-04-25 10:25:09	2026-04-25 10:25:09
31	Maiô Ajustável Azul Escuro(a) (Lacoste Kids)	1	13	9	10	16.27	18	2026-04-25 10:25:09	2026-04-25 10:25:09
32	Macacão Moleton Prata (Riachuelo Kids)	23	12	18	1	19.67	29	2026-04-25 10:25:09	2026-04-25 10:25:09
33	Blusa Esportivo(a) Turquesa (Salsa Jeans Kids)	12	3	15	2	64.90	30	2026-04-25 10:25:09	2026-04-25 10:25:09
34	Camiseta Saja Cáqui (Salsa Jeans Kids)	26	8	20	14	82.09	30	2026-04-25 10:25:09	2026-04-25 10:25:09
35	Cueca Saja Rosa (Disney Baby)	26	10	2	16	42.95	12	2026-04-25 10:25:09	2026-04-25 10:25:09
36	Blusa Formal Cáqui (Adidas Kids)	16	3	20	11	23.70	1	2026-04-25 10:25:09	2026-04-25 10:25:09
37	Biquine Leve Lilás (Osklen Kids)	19	2	16	11	18.96	24	2026-04-25 10:25:09	2026-04-25 10:25:09
38	Vestido Saja Laranja (Puket Kids)	26	21	11	14	78.24	27	2026-04-25 10:25:09	2026-04-25 10:25:09
39	Sunga Turma da Mônica Azul (Osklen Kids)	31	18	1	18	118.10	24	2026-04-25 10:25:09	2026-04-25 10:25:09
40	Calcinha Estampado(a) Rosa (Hering Kids)	13	6	2	18	118.14	15	2026-04-25 10:25:09	2026-04-25 10:25:09
41	Camisa Esportivo(a) Cinza (Dafiti Kids)	12	7	8	4	23.60	11	2026-04-25 10:25:09	2026-04-25 10:25:09
42	Biquine Colorido(a) Lilás (Farm Kids)	7	2	16	11	11.66	14	2026-04-25 10:25:09	2026-04-25 10:25:09
43	Blusa Ajustável Turquesa (Disney Baby)	1	3	15	14	21.70	12	2026-04-25 10:25:09	2026-04-25 10:25:09
44	Calça Curto(a) Azul (Bendita Cute)	9	5	1	4	18.21	3	2026-04-25 10:25:09	2026-04-25 10:25:09
45	Sunga Básico(a) Laranja (Colcci Kids)	4	18	11	5	112.63	9	2026-04-25 10:25:09	2026-04-25 10:25:09
46	Calçado Clássico(a) Laranja (Dafiti Kids)	6	4	11	5	23.49	11	2026-04-25 10:25:09	2026-04-25 10:25:09
47	Calça Floral Azul Escuro(a) (Dafiti Kids)	15	5	9	18	24.26	11	2026-04-25 10:25:09	2026-04-25 10:25:09
48	Casaco Formal Vermelho(a) (Disney Baby)	16	9	6	8	84.21	12	2026-04-25 10:25:09	2026-04-25 10:25:09
49	Short Confortável Marrom (Zoe Kids)	8	17	13	16	78.28	31	2026-04-25 10:25:09	2026-04-25 10:25:09
50	Sutiã Longa Branco(a) (Zoe Kids)	21	19	4	19	61.12	31	2026-04-25 10:25:09	2026-04-25 10:25:09
51	Cueca Algodão Roxo(a) (Riachuelo Kids)	2	10	12	16	114.61	29	2026-04-25 10:25:09	2026-04-25 10:25:09
52	Sutiã Animal Print Roxo(a) (C&A Kids)	3	19	12	4	16.63	7	2026-04-25 10:25:09	2026-04-25 10:25:09
53	Short Moleton Vinho (Carters)	23	17	19	6	70.34	8	2026-04-25 10:25:09	2026-04-25 10:25:09
54	Sunga Xadrez Cáqui (Disney Kids)	32	18	20	12	92.87	13	2026-04-25 10:25:09	2026-04-25 10:25:09
55	Biquine Confortável Vermelho(a) (Disney Kids)	8	2	6	8	19.06	13	2026-04-25 10:25:09	2026-04-25 10:25:09
56	Calcinha Durável Lilás (Pimpolho)	10	6	16	11	28.09	26	2026-04-25 10:25:09	2026-04-25 10:25:09
57	Biquine Casual Lilás (Salsa Jeans Kids)	5	2	16	13	46.60	30	2026-04-25 10:25:09	2026-04-25 10:25:09
58	Meia Loney Tunes Prata (Renner Kids)	22	14	18	8	60.35	28	2026-04-25 10:25:09	2026-04-25 10:25:09
59	Short Ajustável Azul Escuro(a) (Hering Kids)	1	17	9	9	50.26	15	2026-04-25 10:25:09	2026-04-25 10:25:09
60	Maiô Leve Amarelo(a) (Osklen Kids)	19	13	7	17	83.76	24	2026-04-25 10:25:09	2026-04-25 10:25:09
61	Blusa Leve Vermelho(a) (Pimpolho)	19	3	6	10	11.24	26	2026-04-25 10:25:09	2026-04-25 10:25:09
62	Meia Básico(a) Laranja (Colcci Kids)	4	14	11	9	46.77	9	2026-04-25 10:25:09	2026-04-25 10:25:09
63	Vestido Respirável Cáqui (Hering Kids)	25	21	20	9	15.71	15	2026-04-25 10:25:09	2026-04-25 10:25:09
64	Bermuda Respirável Lilás (Maria Filó Kids)	25	1	16	2	114.86	20	2026-04-25 10:25:09	2026-04-25 10:25:09
65	Bermuda Casual Azul Escuro(a) (Petit Royal)	5	1	9	3	38.00	25	2026-04-25 10:25:09	2026-04-25 10:25:09
66	Calçado Respirável Lilás (Carters)	25	4	16	6	80.68	8	2026-04-25 10:25:09	2026-04-25 10:25:09
67	Calçado Turma da Mônica Verde (Lilica Ripilica)	31	4	5	4	49.43	19	2026-04-25 10:25:09	2026-04-25 10:25:09
68	Biquine Confortável Preto(a) (Akazys)	8	2	3	5	33.85	2	2026-04-25 10:25:09	2026-04-25 10:25:09
69	Jaqueta Moleton Turquesa (Mundo Pet)	23	11	15	10	36.52	23	2026-04-25 10:25:09	2026-04-25 10:25:09
70	Bermuda Confortável Rosa (Kily)	8	1	2	6	119.21	17	2026-04-25 10:25:09	2026-04-25 10:25:09
71	Calçado Curto(a) Prata (Conjunto Infantil)	9	4	18	19	40.36	10	2026-04-25 10:25:09	2026-04-25 10:25:09
72	Vestido Saja Dourado(a) (Disney Kids)	26	21	17	13	72.28	13	2026-04-25 10:25:09	2026-04-25 10:25:09
73	Cueca Formal Branco(a) (Ki Carinho)	16	10	4	1	104.51	16	2026-04-25 10:25:09	2026-04-25 10:25:09
74	Bermuda Saja Roxo(a) (Osklen Kids)	26	1	12	4	109.31	24	2026-04-25 10:25:09	2026-04-25 10:25:09
75	Camiseta Floral Branco(a) (Boboi)	15	8	4	17	111.12	4	2026-04-25 10:25:09	2026-04-25 10:25:09
76	Casaco Básico(a) Turquesa (Boboi)	4	9	15	4	68.43	4	2026-04-25 10:25:09	2026-04-25 10:25:09
77	Maiô Moleton Cinza (Colcci Kids)	23	13	8	10	59.11	9	2026-04-25 10:25:09	2026-04-25 10:25:09
78	Casaco Esportivo(a) Prata (Boboi)	12	9	18	11	108.32	4	2026-04-25 10:25:09	2026-04-25 10:25:09
79	Casaco Labubu Verde (Marisol)	18	9	5	3	92.14	21	2026-04-25 10:25:09	2026-04-25 10:25:09
80	Bermuda Colorido(a) Lilás (Disney Baby)	7	1	16	10	91.49	12	2026-04-25 10:25:09	2026-04-25 10:25:09
81	Camiseta Ajustável Cáqui (Dafiti Kids)	1	8	20	11	92.50	11	2026-04-25 10:25:09	2026-04-25 10:25:09
82	Bermuda Stitch Rosa Choque (Kily)	28	1	10	14	53.75	17	2026-04-25 10:25:09	2026-04-25 10:25:09
83	Saia Loney Tunes Amarelo(a) (Adidas Kids)	22	16	7	9	115.06	1	2026-04-25 10:25:09	2026-04-25 10:25:09
84	Camiseta Durável Roxo(a) (Hering Kids)	10	8	12	8	72.11	15	2026-04-25 10:25:09	2026-04-25 10:25:09
85	Vestido Seda Cáqui (Kily)	27	21	20	13	54.05	17	2026-04-25 10:25:09	2026-04-25 10:25:09
86	Cueca Floral Vermelho(a) (Dafiti Kids)	15	10	6	13	17.03	11	2026-04-25 10:25:09	2026-04-25 10:25:09
87	Cueca Respirável Dourado(a) (Hering Kids)	25	10	17	9	12.48	15	2026-04-25 10:25:09	2026-04-25 10:25:09
88	Camisa Stitch Azul (Hering Kids)	28	7	1	9	22.45	15	2026-04-25 10:25:09	2026-04-25 10:25:09
89	Cueca Longa Verde (Boboi)	21	10	5	19	45.40	4	2026-04-25 10:25:09	2026-04-25 10:25:09
90	Camiseta Stitch Azul Escuro(a) (Colcci Kids)	28	8	9	16	70.22	9	2026-04-25 10:25:09	2026-04-25 10:25:09
91	Short Leve Rosa (Bendita Cute)	19	17	2	14	94.54	3	2026-04-25 10:25:09	2026-04-25 10:25:09
92	Blusa Estampado(a) Cáqui (C&A Kids)	13	3	20	4	65.11	7	2026-04-25 10:25:09	2026-04-25 10:25:09
93	Macacão Durável Dourado(a) (Disney Kids)	10	12	17	15	43.87	13	2026-04-25 10:25:09	2026-04-25 10:25:09
94	Macacão Formal Preto(a) (Dafiti Kids)	16	12	3	6	43.89	11	2026-04-25 10:25:09	2026-04-25 10:25:09
95	Jaqueta Curto(a) Amarelo(a) (Petit Royal)	9	11	7	3	11.79	25	2026-04-25 10:25:09	2026-04-25 10:25:09
96	Pijama Leve Laranja (Pimpolho)	19	15	11	12	26.63	26	2026-04-25 10:25:09	2026-04-25 10:25:09
97	Saia Respirável Verde (Carters)	25	16	5	2	69.36	8	2026-04-25 10:25:09	2026-04-25 10:25:09
98	Calcinha Longa Dourado(a) (Akazys)	21	6	17	5	12.25	2	2026-04-25 10:25:09	2026-04-25 10:25:09
99	Calcinha Moleton Azul Escuro(a) (Disney Baby)	23	6	9	9	70.78	12	2026-04-25 10:25:09	2026-04-25 10:25:09
100	Top Colorido(a) Laranja (Adidas Kids)	7	20	11	19	103.49	1	2026-04-25 10:25:09	2026-04-25 10:25:09
101	Casaco Colorido(a) Vermelho(a) (Farm Kids)	7	9	6	8	43.45	14	2026-04-25 10:25:09	2026-04-25 10:25:09
102	Calçado Poliéster Cáqui (Pimpolho)	24	4	20	15	84.47	26	2026-04-25 10:25:09	2026-04-25 10:25:09
103	Bermuda Saja Prata (Mundo Pet)	26	1	18	1	93.90	23	2026-04-25 10:25:09	2026-04-25 10:25:09
104	Top Stitch Rosa (C&A Baby)	28	20	2	13	34.20	6	2026-04-25 10:25:09	2026-04-25 10:25:09
105	Vestido Ajustável Marrom (C&A Kids)	1	21	13	17	65.87	7	2026-04-25 10:25:09	2026-04-25 10:25:09
106	Calcinha Poliéster Lilás (Petit Royal)	24	6	16	18	102.56	25	2026-04-25 10:25:09	2026-04-25 10:25:09
107	Cueca Estampado(a) Prata (C&A Baby)	13	10	18	4	85.28	6	2026-04-25 10:25:09	2026-04-25 10:25:09
108	Maiô Toy Store Cáqui (Adidas Kids)	30	13	20	10	34.93	1	2026-04-25 10:25:09	2026-04-25 10:25:09
109	Camiseta Poliéster Verde (Dafiti Kids)	24	8	5	7	96.14	11	2026-04-25 10:25:09	2026-04-25 10:25:09
110	Bermuda Ajustável Cáqui (Osklen Kids)	1	1	20	12	90.44	24	2026-04-25 10:25:09	2026-04-25 10:25:09
111	Saia Leve Rosa Choque (Boboi)	19	16	10	15	60.61	4	2026-04-25 10:25:09	2026-04-25 10:25:09
112	Bermuda Animal Print Bege (Colcci Kids)	3	1	14	1	43.76	9	2026-04-25 10:25:09	2026-04-25 10:25:09
113	Biquine Colorido(a) Lilás (Boboi)	7	2	16	10	72.58	4	2026-04-25 10:25:09	2026-04-25 10:25:09
114	Sunga Stitch Cáqui (Maria Filó Kids)	28	18	20	16	32.86	20	2026-04-25 10:25:09	2026-04-25 10:25:09
115	Vestido Estampado(a) Preto(a) (Brandille)	13	21	3	18	115.93	5	2026-04-25 10:25:09	2026-04-25 10:25:09
116	Sunga Casual Verde (Marisol)	5	18	5	11	38.84	21	2026-04-25 10:25:09	2026-04-25 10:25:09
117	Top Clássico(a) Laranja (Bendita Cute)	6	20	11	11	118.74	3	2026-04-25 10:25:09	2026-04-25 10:25:09
118	Cueca Fit Rosa (Bendita Cute)	14	10	2	1	86.59	3	2026-04-25 10:25:09	2026-04-25 10:25:09
119	Sutiã Clássico(a) Verde (Disney Kids)	6	19	5	18	119.75	13	2026-04-25 10:25:09	2026-04-25 10:25:09
120	Top Algodão Cinza (Adidas Kids)	2	20	8	7	72.01	1	2026-04-25 10:25:09	2026-04-25 10:25:09
121	Calçado Elástico(a) Verde (Brandille)	11	4	5	11	79.33	5	2026-04-25 10:25:09	2026-04-25 10:25:09
122	Vestido Colorido(a) Laranja (Osklen Kids)	7	21	11	2	35.15	24	2026-04-25 10:25:09	2026-04-25 10:25:09
123	Vestido Listrado Lilás (Riachuelo Kids)	20	21	16	17	43.81	29	2026-04-25 10:25:09	2026-04-25 10:25:09
124	Top Ajustável Prata (Brandille)	1	20	18	19	18.92	5	2026-04-25 10:25:09	2026-04-25 10:25:09
125	Pijama Esportivo(a) Marrom (Disney Baby)	12	15	13	1	84.73	12	2026-04-25 10:25:09	2026-04-25 10:25:09
126	Top Confortável Marrom (Kily)	8	20	13	1	74.03	17	2026-04-25 10:25:09	2026-04-25 10:25:09
127	Cueca Toy Store Preto(a) (Riachuelo Kids)	30	10	3	10	118.75	29	2026-04-25 10:25:09	2026-04-25 10:25:09
128	Short Casual Prata (Petit Royal)	5	17	18	10	28.46	25	2026-04-25 10:25:09	2026-04-25 10:25:09
129	Top Fit Amarelo(a) (Bendita Cute)	14	20	7	5	73.49	3	2026-04-25 10:25:09	2026-04-25 10:25:09
130	Calça Jeans Lilás (Renner Kids)	17	5	16	18	68.72	28	2026-04-25 10:25:09	2026-04-25 10:25:09
131	Pijama Curto(a) Lilás (Boboi)	9	15	16	5	83.62	4	2026-04-25 10:25:09	2026-04-25 10:25:09
132	Blusa Colorido(a) Dourado(a) (Colcci Kids)	7	3	17	9	53.71	9	2026-04-25 10:25:09	2026-04-25 10:25:09
133	Sutiã Curto(a) Branco(a) (Zoe Kids)	9	19	4	17	86.72	31	2026-04-25 10:25:09	2026-04-25 10:25:09
134	Bermuda Ajustável Azul (Mundo Infantil)	1	1	1	2	21.55	22	2026-04-25 10:25:09	2026-04-25 10:25:09
135	Meia Leve Verde (Mundo Infantil)	19	14	5	1	97.30	22	2026-04-25 10:25:09	2026-04-25 10:25:09
136	Macacão Listrado Rosa (Ki Carinho)	20	12	2	14	12.09	16	2026-04-25 10:25:09	2026-04-25 10:25:09
137	Calçado Jeans Prata (Disney Baby)	17	4	18	19	21.60	12	2026-04-25 10:25:09	2026-04-25 10:25:09
138	Saia Clássico(a) Azul Escuro(a) (Disney Baby)	6	16	9	14	31.93	12	2026-04-25 10:25:09	2026-04-25 10:25:09
139	Camiseta Temático(a) Rosa (Ki Carinho)	29	8	2	18	115.62	16	2026-04-25 10:25:09	2026-04-25 10:25:09
140	Calcinha Durável Verde (Lilica Ripilica)	10	6	5	5	75.45	19	2026-04-25 10:25:09	2026-04-25 10:25:09
141	Top Loney Tunes Laranja (Petit Royal)	22	20	11	18	18.86	25	2026-04-25 10:25:09	2026-04-25 10:25:09
142	Saia Básico(a) Azul Escuro(a) (Akazys)	4	16	9	16	47.44	2	2026-04-25 10:25:09	2026-04-25 10:25:09
143	Calçado Ajustável Vermelho(a) (Farm Kids)	1	4	6	18	27.27	14	2026-04-25 10:25:09	2026-04-25 10:25:09
144	Sunga Esportivo(a) Laranja (Pimpolho)	12	18	11	7	49.90	26	2026-04-25 10:25:09	2026-04-25 10:25:09
145	Calcinha Listrado Branco(a) (Colcci Kids)	20	6	4	12	111.32	9	2026-04-25 10:25:09	2026-04-25 10:25:09
146	Calçado Animal Print Cáqui (Salsa Jeans Kids)	3	4	20	11	75.66	30	2026-04-25 10:25:09	2026-04-25 10:25:09
147	Jaqueta Confortável Vinho (Renner Kids)	8	11	19	3	103.03	28	2026-04-25 10:25:09	2026-04-25 10:25:09
148	Jaqueta Xadrez Branco(a) (Conjunto Infantil)	32	11	4	11	112.62	10	2026-04-25 10:25:09	2026-04-25 10:25:09
149	Short Ajustável Amarelo(a) (Renner Kids)	1	17	7	11	81.35	28	2026-04-25 10:25:09	2026-04-25 10:25:09
150	Sunga Durável Azul Escuro(a) (Akazys)	10	18	9	1	78.83	2	2026-04-25 10:25:09	2026-04-25 10:25:09
151	Short Stitch Rosa (Mundo Infantil)	28	17	2	3	73.64	22	2026-04-25 10:25:09	2026-04-25 10:25:09
152	Pijama Labubu Azul (Bendita Cute)	18	15	1	11	110.74	3	2026-04-25 10:25:09	2026-04-25 10:25:09
153	Short Longa Dourado(a) (Ki Carinho)	21	17	17	9	23.00	16	2026-04-25 10:25:09	2026-04-25 10:25:09
154	Calcinha Labubu Azul (Petit Royal)	18	6	1	9	113.26	25	2026-04-25 10:25:09	2026-04-25 10:25:09
155	Maiô Loney Tunes Prata (Salsa Jeans Kids)	22	13	18	17	35.24	30	2026-04-25 10:25:09	2026-04-25 10:25:09
156	Macacão Turma da Mônica Amarelo(a) (C&A Baby)	31	12	7	1	65.85	6	2026-04-25 10:25:09	2026-04-25 10:25:09
157	Sunga Poliéster Cáqui (Colcci Kids)	24	18	20	16	87.65	9	2026-04-25 10:25:09	2026-04-25 10:25:09
158	Jaqueta Turma da Mônica Turquesa (Bendita Cute)	31	11	15	8	30.02	3	2026-04-25 10:25:09	2026-04-25 10:25:09
159	Casaco Ajustável Roxo(a) (Salsa Jeans Kids)	1	9	12	11	101.14	30	2026-04-25 10:25:09	2026-04-25 10:25:09
160	Pijama Turma da Mônica Cáqui (Lilica Ripilica)	31	15	20	8	55.82	19	2026-04-25 10:25:09	2026-04-25 10:25:09
161	Casaco Formal Amarelo(a) (Mundo Infantil)	16	9	7	4	19.31	22	2026-04-25 10:25:09	2026-04-25 10:25:09
162	Jaqueta Colorido(a) Azul (Bendita Cute)	7	11	1	19	13.07	3	2026-04-25 10:25:09	2026-04-25 10:25:09
163	Cueca Básico(a) Lilás (C&A Kids)	4	10	16	15	88.24	7	2026-04-25 10:25:09	2026-04-25 10:25:09
164	Calçado Clássico(a) Turquesa (Akazys)	6	4	15	17	104.90	2	2026-04-25 10:25:09	2026-04-25 10:25:09
165	Camiseta Fit Bege (Osklen Kids)	14	8	14	14	83.59	24	2026-04-25 10:25:09	2026-04-25 10:25:09
166	Biquine Jeans Rosa Choque (Petit Royal)	17	2	10	16	35.17	25	2026-04-25 10:25:09	2026-04-25 10:25:09
167	Blusa Moleton Bege (Brandille)	23	3	14	12	63.61	5	2026-04-25 10:25:09	2026-04-25 10:25:09
168	Top Curto(a) Azul Escuro(a) (Kily)	9	20	9	11	47.61	17	2026-04-25 10:25:09	2026-04-25 10:25:09
169	Calçado Básico(a) Vinho (Boboi)	4	4	19	7	36.83	4	2026-04-25 10:25:09	2026-04-25 10:25:09
170	Saia Turma da Mônica Cáqui (C&A Baby)	31	16	20	17	36.91	6	2026-04-25 10:25:09	2026-04-25 10:25:09
171	Sutiã Jeans Bege (Dafiti Kids)	17	19	14	12	51.16	11	2026-04-25 10:25:09	2026-04-25 10:25:09
172	Sutiã Algodão Amarelo(a) (Pimpolho)	2	19	7	17	95.48	26	2026-04-25 10:25:09	2026-04-25 10:25:09
173	Macacão Elástico(a) Dourado(a) (Petit Royal)	11	12	17	12	95.72	25	2026-04-25 10:25:09	2026-04-25 10:25:09
174	Calça Longa Cinza (Disney Kids)	21	5	8	1	113.62	13	2026-04-25 10:25:09	2026-04-25 10:25:09
175	Sutiã Turma da Mônica Prata (Farm Kids)	31	19	18	14	105.90	14	2026-04-25 10:25:09	2026-04-25 10:25:09
176	Sunga Moleton Azul Escuro(a) (Dafiti Kids)	23	18	9	3	23.04	11	2026-04-25 10:25:09	2026-04-25 10:25:09
177	Meia Formal Vermelho(a) (C&A Baby)	16	14	6	19	16.82	6	2026-04-25 10:25:09	2026-04-25 10:25:09
178	Sunga Moleton Laranja (Petit Royal)	23	18	11	15	87.72	25	2026-04-25 10:25:09	2026-04-25 10:25:09
179	Sunga Longa Dourado(a) (Lacoste Kids)	21	18	17	8	93.10	18	2026-04-25 10:25:09	2026-04-25 10:25:09
180	Calcinha Poliéster Laranja (Farm Kids)	24	6	11	2	111.94	14	2026-04-25 10:25:09	2026-04-25 10:25:09
181	Sunga Estampado(a) Marrom (Dafiti Kids)	13	18	13	3	61.68	11	2026-04-25 10:25:09	2026-04-25 10:25:09
182	Meia Respirável Rosa (Disney Baby)	25	14	2	8	99.25	12	2026-04-25 10:25:09	2026-04-25 10:25:09
183	Camisa Formal Azul Escuro(a) (Marisol)	16	7	9	3	47.26	21	2026-04-25 10:25:09	2026-04-25 10:25:09
184	Macacão Respirável Laranja (Mundo Pet)	25	12	11	18	78.87	23	2026-04-25 10:25:09	2026-04-25 10:25:09
185	Vestido Saja Rosa (Lacoste Kids)	26	21	2	19	69.90	18	2026-04-25 10:25:09	2026-04-25 10:25:09
186	Pijama Fit Marrom (Mundo Infantil)	14	15	13	5	88.39	22	2026-04-25 10:25:09	2026-04-25 10:25:09
187	Sutiã Poliéster Amarelo(a) (Akazys)	24	19	7	13	56.85	2	2026-04-25 10:25:09	2026-04-25 10:25:09
188	Blusa Jeans Amarelo(a) (Maria Filó Kids)	17	3	7	3	59.76	20	2026-04-25 10:25:09	2026-04-25 10:25:09
189	Bermuda Curto(a) Verde (Dafiti Kids)	9	1	5	7	21.04	11	2026-04-25 10:25:09	2026-04-25 10:25:09
190	Short Algodão Lilás (Salsa Jeans Kids)	2	17	16	1	55.98	30	2026-04-25 10:25:09	2026-04-25 10:25:09
191	Casaco Clássico(a) Dourado(a) (Riachuelo Kids)	6	9	17	13	109.61	29	2026-04-25 10:25:09	2026-04-25 10:25:09
192	Camiseta Elástico(a) Branco(a) (Boboi)	11	8	4	11	57.76	4	2026-04-25 10:25:09	2026-04-25 10:25:09
193	Casaco Clássico(a) Lilás (Salsa Jeans Kids)	6	9	16	16	55.72	30	2026-04-25 10:25:09	2026-04-25 10:25:09
194	Meia Saja Amarelo(a) (Marisol)	26	14	7	12	48.07	21	2026-04-25 10:25:09	2026-04-25 10:25:09
195	Sunga Loney Tunes Vinho (Puket Kids)	22	18	19	5	18.13	27	2026-04-25 10:25:09	2026-04-25 10:25:09
196	Macacão Elástico(a) Amarelo(a) (Conjunto Infantil)	11	12	7	17	65.04	10	2026-04-25 10:25:09	2026-04-25 10:25:09
197	Top Stitch Amarelo(a) (C&A Kids)	28	20	7	2	94.89	7	2026-04-25 10:25:09	2026-04-25 10:25:09
198	Calçado Xadrez Vermelho(a) (Osklen Kids)	32	4	6	3	13.75	24	2026-04-25 10:25:09	2026-04-25 10:25:09
199	Sunga Fit Amarelo(a) (C&A Kids)	14	18	7	1	92.46	7	2026-04-25 10:25:09	2026-04-25 10:25:09
200	Biquine Listrado Turquesa (Mundo Pet)	20	2	15	2	113.36	23	2026-04-25 10:25:09	2026-04-25 10:25:09
201	Short Loney Tunes Cinza (Colcci Kids)	22	17	8	15	76.17	9	2026-04-25 10:25:09	2026-04-25 10:25:09
202	Calça Curto(a) Prata (Puket Kids)	9	5	18	8	80.52	27	2026-04-25 10:25:09	2026-04-25 10:25:09
203	Sutiã Jeans Rosa (Hering Kids)	17	19	2	16	82.69	15	2026-04-25 10:25:09	2026-04-25 10:25:09
204	Saia Poliéster Rosa (Puket Kids)	24	16	2	19	48.12	27	2026-04-25 10:25:09	2026-04-25 10:25:09
205	Vestido Longa Roxo(a) (Disney Baby)	21	21	12	12	25.76	12	2026-04-25 10:25:09	2026-04-25 10:25:09
206	Top Seda Amarelo(a) (Hering Kids)	27	20	7	9	89.74	15	2026-04-25 10:25:09	2026-04-25 10:25:09
207	Pijama Leve Branco(a) (Pimpolho)	19	15	4	11	54.49	26	2026-04-25 10:25:09	2026-04-25 10:25:09
208	Calça Estampado(a) Lilás (Colcci Kids)	13	5	16	1	80.46	9	2026-04-25 10:25:09	2026-04-25 10:25:09
209	Meia Ajustável Azul (Boboi)	1	14	1	17	76.69	4	2026-04-25 10:25:09	2026-04-25 10:25:09
210	Short Loney Tunes Marrom (Boboi)	22	17	13	16	100.18	4	2026-04-25 10:25:09	2026-04-25 10:25:09
211	Calcinha Leve Azul Escuro(a) (Brandille)	19	6	9	5	16.73	5	2026-04-25 10:25:09	2026-04-25 10:25:09
212	Pijama Turma da Mônica Cáqui (Zoe Kids)	31	15	20	1	43.83	31	2026-04-25 10:25:09	2026-04-25 10:25:09
213	Saia Toy Store Roxo(a) (Bendita Cute)	30	16	12	4	76.74	3	2026-04-25 10:25:09	2026-04-25 10:25:09
214	Camiseta Elástico(a) Cinza (Boboi)	11	8	8	9	23.17	4	2026-04-25 10:25:09	2026-04-25 10:25:09
215	Short Ajustável Amarelo(a) (Colcci Kids)	1	17	7	1	10.23	9	2026-04-25 10:25:09	2026-04-25 10:25:09
216	Sunga Labubu Rosa (Renner Kids)	18	18	2	11	78.56	28	2026-04-25 10:25:09	2026-04-25 10:25:09
217	Camiseta Seda Preto(a) (Lilica Ripilica)	27	8	3	2	112.51	19	2026-04-25 10:25:09	2026-04-25 10:25:09
218	Maiô Labubu Branco(a) (Carters)	18	13	4	11	53.94	8	2026-04-25 10:25:09	2026-04-25 10:25:09
219	Sunga Estampado(a) Vinho (Colcci Kids)	13	18	19	4	82.54	9	2026-04-25 10:25:09	2026-04-25 10:25:09
220	Short Clássico(a) Roxo(a) (Adidas Kids)	6	17	12	16	79.36	1	2026-04-25 10:25:09	2026-04-25 10:25:09
221	Cueca Leve Lilás (Maria Filó Kids)	19	10	16	18	86.97	20	2026-04-25 10:25:09	2026-04-25 10:25:09
222	Bermuda Algodão Vermelho(a) (C&A Kids)	2	1	6	12	83.80	7	2026-04-25 10:25:09	2026-04-25 10:25:09
223	Maiô Estampado(a) Vinho (Maria Filó Kids)	13	13	19	2	91.35	20	2026-04-25 10:25:09	2026-04-25 10:25:09
224	Camiseta Elástico(a) Cáqui (Adidas Kids)	11	8	20	19	89.73	1	2026-04-25 10:25:09	2026-04-25 10:25:09
225	Casaco Formal Bege (Kily)	16	9	14	2	57.90	17	2026-04-25 10:25:09	2026-04-25 10:25:09
226	Short Ajustável Verde (Lilica Ripilica)	1	17	5	4	107.97	19	2026-04-25 10:25:09	2026-04-25 10:25:09
227	Short Loney Tunes Azul (Maria Filó Kids)	22	17	1	8	96.24	20	2026-04-25 10:25:09	2026-04-25 10:25:09
228	Calça Leve Turquesa (Mundo Infantil)	19	5	15	7	30.78	22	2026-04-25 10:25:09	2026-04-25 10:25:09
229	Sunga Respirável Rosa (Petit Royal)	25	18	2	5	10.33	25	2026-04-25 10:25:09	2026-04-25 10:25:09
230	Macacão Fit Prata (C&A Kids)	14	12	18	12	114.24	7	2026-04-25 10:25:09	2026-04-25 10:25:09
231	Biquine Seda Verde (Boboi)	27	2	5	18	104.10	4	2026-04-25 10:25:09	2026-04-25 10:25:09
232	Calcinha Clássico(a) Verde (Carters)	6	6	5	2	36.01	8	2026-04-25 10:25:09	2026-04-25 10:25:09
233	Pijama Básico(a) Dourado(a) (Marisol)	4	15	17	12	52.63	21	2026-04-25 10:25:09	2026-04-25 10:25:09
234	Short Ajustável Cáqui (Dafiti Kids)	1	17	20	5	38.29	11	2026-04-25 10:25:09	2026-04-25 10:25:09
235	Saia Xadrez Cáqui (Marisol)	32	16	20	15	27.68	21	2026-04-25 10:25:09	2026-04-25 10:25:09
236	Top Elástico(a) Amarelo(a) (Kily)	11	20	7	17	22.01	17	2026-04-25 10:25:09	2026-04-25 10:25:09
237	Calça Turma da Mônica Azul Escuro(a) (Salsa Jeans Kids)	31	5	9	13	77.00	30	2026-04-25 10:25:09	2026-04-25 10:25:09
238	Sutiã Moleton Rosa Choque (Lilica Ripilica)	23	19	10	12	38.02	19	2026-04-25 10:25:09	2026-04-25 10:25:09
239	Camiseta Fit Azul Escuro(a) (Renner Kids)	14	8	9	3	67.70	28	2026-04-25 10:25:09	2026-04-25 10:25:09
240	Cueca Stitch Cinza (Akazys)	28	10	8	17	84.66	2	2026-04-25 10:25:09	2026-04-25 10:25:09
241	Calça Labubu Rosa Choque (Mundo Pet)	18	5	10	18	54.29	23	2026-04-25 10:25:09	2026-04-25 10:25:09
242	Jaqueta Xadrez Turquesa (Riachuelo Kids)	32	11	15	15	41.96	29	2026-04-25 10:25:09	2026-04-25 10:25:09
243	Saia Confortável Lilás (Bendita Cute)	8	16	16	11	38.68	3	2026-04-25 10:25:09	2026-04-25 10:25:09
244	Vestido Moleton Turquesa (Disney Baby)	23	21	15	12	28.59	12	2026-04-25 10:25:09	2026-04-25 10:25:09
245	Casaco Formal Dourado(a) (Lilica Ripilica)	16	9	17	7	31.06	19	2026-04-25 10:25:09	2026-04-25 10:25:09
246	Camisa Poliéster Laranja (Dafiti Kids)	24	7	11	1	108.05	11	2026-04-25 10:25:09	2026-04-25 10:25:09
247	Pijama Clássico(a) Preto(a) (Farm Kids)	6	15	3	17	15.21	14	2026-04-25 10:25:09	2026-04-25 10:25:09
248	Meia Listrado Rosa Choque (Ki Carinho)	20	14	10	2	33.61	16	2026-04-25 10:25:09	2026-04-25 10:25:09
249	Biquine Listrado Marrom (Renner Kids)	20	2	13	3	93.79	28	2026-04-25 10:25:09	2026-04-25 10:25:09
250	Biquine Floral Laranja (Zoe Kids)	15	2	11	8	75.88	31	2026-04-25 10:25:09	2026-04-25 10:25:09
251	Blusa Ajustável Lilás (Disney Kids)	1	3	16	4	68.28	13	2026-04-25 10:25:09	2026-04-25 10:25:09
252	Blusa Floral Branco(a) (Boboi)	15	3	4	10	77.13	4	2026-04-25 10:25:09	2026-04-25 10:25:09
253	Biquine Animal Print Azul (Hering Kids)	3	2	1	19	23.13	15	2026-04-25 10:25:09	2026-04-25 10:25:09
254	Sutiã Longa Bege (Farm Kids)	21	19	14	6	60.39	14	2026-04-25 10:25:09	2026-04-25 10:25:09
255	Calçado Saja Laranja (Salsa Jeans Kids)	26	4	11	11	55.06	30	2026-04-25 10:25:09	2026-04-25 10:25:09
256	Calçado Confortável Azul (Osklen Kids)	8	4	1	15	50.58	24	2026-04-25 10:25:09	2026-04-25 10:25:09
257	Cueca Stitch Vermelho(a) (Hering Kids)	28	10	6	10	33.36	15	2026-04-25 10:25:09	2026-04-25 10:25:09
258	Jaqueta Poliéster Lilás (Akazys)	24	11	16	19	35.60	2	2026-04-25 10:25:09	2026-04-25 10:25:09
259	Short Poliéster Vinho (Carters)	24	17	19	14	100.08	8	2026-04-25 10:25:09	2026-04-25 10:25:09
260	Cueca Poliéster Preto(a) (Hering Kids)	24	10	3	13	99.46	15	2026-04-25 10:25:09	2026-04-25 10:25:09
261	Calça Confortável Amarelo(a) (Brandille)	8	5	7	3	53.81	5	2026-04-25 10:25:09	2026-04-25 10:25:09
262	Saia Ajustável Marrom (Adidas Kids)	1	16	13	4	84.14	1	2026-04-25 10:25:09	2026-04-25 10:25:09
263	Meia Algodão Azul Escuro(a) (Kily)	2	14	9	12	76.79	17	2026-04-25 10:25:09	2026-04-25 10:25:09
264	Saia Labubu Cinza (Osklen Kids)	18	16	8	2	93.76	24	2026-04-25 10:25:09	2026-04-25 10:25:09
265	Camiseta Elástico(a) Turquesa (C&A Baby)	11	8	15	5	28.94	6	2026-04-25 10:25:09	2026-04-25 10:25:09
266	Macacão Xadrez Cáqui (Boboi)	32	12	20	7	38.53	4	2026-04-25 10:25:09	2026-04-25 10:25:09
267	Blusa Animal Print Turquesa (Pimpolho)	3	3	15	14	89.37	26	2026-04-25 10:25:09	2026-04-25 10:25:09
268	Calcinha Elástico(a) Lilás (Ki Carinho)	11	6	16	1	15.22	16	2026-04-25 10:25:09	2026-04-25 10:25:09
269	Calcinha Formal Verde (Zoe Kids)	16	6	5	14	35.64	31	2026-04-25 10:25:09	2026-04-25 10:25:09
270	Short Básico(a) Amarelo(a) (Disney Kids)	4	17	7	11	43.63	13	2026-04-25 10:25:09	2026-04-25 10:25:09
271	Cueca Loney Tunes Roxo(a) (Lacoste Kids)	22	10	12	10	87.41	18	2026-04-25 10:25:09	2026-04-25 10:25:09
272	Saia Floral Roxo(a) (Brandille)	15	16	12	11	88.54	5	2026-04-25 10:25:09	2026-04-25 10:25:09
273	Top Seda Lilás (Lacoste Kids)	27	20	16	2	55.29	18	2026-04-25 10:25:09	2026-04-25 10:25:09
274	Calçado Temático(a) Marrom (Akazys)	29	4	13	6	79.05	2	2026-04-25 10:25:09	2026-04-25 10:25:09
275	Casaco Respirável Vermelho(a) (Mundo Infantil)	25	9	6	5	36.51	22	2026-04-25 10:25:09	2026-04-25 10:25:09
276	Cueca Xadrez Azul Escuro(a) (Mundo Infantil)	32	10	9	12	102.43	22	2026-04-25 10:25:09	2026-04-25 10:25:09
277	Calçado Temático(a) Vinho (Riachuelo Kids)	29	4	19	4	99.17	29	2026-04-25 10:25:09	2026-04-25 10:25:09
278	Biquine Fit Preto(a) (Petit Royal)	14	2	3	16	95.51	25	2026-04-25 10:25:09	2026-04-25 10:25:09
279	Macacão Confortável Rosa (Farm Kids)	8	12	2	2	43.06	14	2026-04-25 10:25:09	2026-04-25 10:25:09
280	Camisa Listrado Branco(a) (Maria Filó Kids)	20	7	4	12	43.88	20	2026-04-25 10:25:09	2026-04-25 10:25:09
281	Sutiã Algodão Preto(a) (Conjunto Infantil)	2	19	3	5	16.98	10	2026-04-25 10:25:09	2026-04-25 10:25:09
282	Camiseta Curto(a) Prata (Colcci Kids)	9	8	18	17	108.35	9	2026-04-25 10:25:09	2026-04-25 10:25:09
283	Biquine Labubu Cinza (Mundo Pet)	18	2	8	13	75.80	23	2026-04-25 10:25:09	2026-04-25 10:25:09
284	Short Formal Lilás (Farm Kids)	16	17	16	10	41.59	14	2026-04-25 10:25:09	2026-04-25 10:25:09
285	Casaco Casual Laranja (Osklen Kids)	5	9	11	17	97.28	24	2026-04-25 10:25:09	2026-04-25 10:25:09
286	Camisa Jeans Vermelho(a) (Conjunto Infantil)	17	7	6	6	86.45	10	2026-04-25 10:25:09	2026-04-25 10:25:09
287	Blusa Leve Turquesa (Ki Carinho)	19	3	15	14	39.01	16	2026-04-25 10:25:09	2026-04-25 10:25:09
288	Sunga Turma da Mônica Turquesa (Zoe Kids)	31	18	15	1	113.63	31	2026-04-25 10:25:09	2026-04-25 10:25:09
289	Vestido Poliéster Preto(a) (Mundo Pet)	24	21	3	13	23.13	23	2026-04-25 10:25:09	2026-04-25 10:25:09
290	Top Casual Prata (Lacoste Kids)	5	20	18	5	117.54	18	2026-04-25 10:25:09	2026-04-25 10:25:09
291	Vestido Seda Dourado(a) (Osklen Kids)	27	21	17	17	80.09	24	2026-04-25 10:25:09	2026-04-25 10:25:09
292	Sunga Loney Tunes Cáqui (Dafiti Kids)	22	18	20	15	74.06	11	2026-04-25 10:25:09	2026-04-25 10:25:09
293	Calçado Esportivo(a) Cinza (Zoe Kids)	12	4	8	7	115.93	31	2026-04-25 10:25:09	2026-04-25 10:25:09
294	Cueca Listrado Turquesa (Maria Filó Kids)	20	10	15	11	102.30	20	2026-04-25 10:25:09	2026-04-25 10:25:09
295	Sunga Fit Cáqui (Maria Filó Kids)	14	18	20	15	64.91	20	2026-04-25 10:25:09	2026-04-25 10:25:09
296	Blusa Jeans Verde (Colcci Kids)	17	3	5	19	68.47	9	2026-04-25 10:25:09	2026-04-25 10:25:09
297	Sunga Turma da Mônica Cáqui (Bendita Cute)	31	18	20	3	75.61	3	2026-04-25 10:25:09	2026-04-25 10:25:09
298	Short Confortável Rosa (Boboi)	8	17	2	11	77.23	4	2026-04-25 10:25:09	2026-04-25 10:25:09
299	Camisa Longa Verde (Pimpolho)	21	7	5	16	101.89	26	2026-04-25 10:25:09	2026-04-25 10:25:09
300	Vestido Clássico(a) Roxo(a) (Dafiti Kids)	6	21	12	16	19.80	11	2026-04-25 10:25:09	2026-04-25 10:25:09
301	Pijama Labubu Bege (Farm Kids)	18	15	14	13	80.13	14	2026-04-25 10:25:09	2026-04-25 10:25:09
302	Camisa Longa Roxo(a) (Puket Kids)	21	7	12	14	51.66	27	2026-04-25 10:25:09	2026-04-25 10:25:09
303	Casaco Temático(a) Preto(a) (Maria Filó Kids)	29	9	3	4	115.08	20	2026-04-25 10:25:09	2026-04-25 10:25:09
304	Sutiã Labubu Amarelo(a) (Boboi)	18	19	7	11	15.38	4	2026-04-25 10:25:09	2026-04-25 10:25:09
305	Meia Leve Verde (Zoe Kids)	19	14	5	1	42.94	31	2026-04-25 10:25:09	2026-04-25 10:25:09
306	Jaqueta Jeans Vermelho(a) (Kily)	17	11	6	5	105.91	17	2026-04-25 10:25:09	2026-04-25 10:25:09
307	Bermuda Loney Tunes Bege (Mundo Infantil)	22	1	14	16	67.97	22	2026-04-25 10:25:09	2026-04-25 10:25:09
308	Sutiã Floral Vermelho(a) (Bendita Cute)	15	19	6	13	75.31	3	2026-04-25 10:25:09	2026-04-25 10:25:09
309	Pijama Jeans Rosa (Bendita Cute)	17	15	2	6	16.17	3	2026-04-25 10:25:09	2026-04-25 10:25:09
310	Calcinha Animal Print Laranja (Conjunto Infantil)	3	6	11	3	119.89	10	2026-04-25 10:25:09	2026-04-25 10:25:09
311	Sunga Fit Verde (Riachuelo Kids)	14	18	5	17	92.74	29	2026-04-25 10:25:09	2026-04-25 10:25:09
312	Bermuda Confortável Cinza (Lacoste Kids)	8	1	8	10	86.74	18	2026-04-25 10:25:09	2026-04-25 10:25:09
313	Saia Fit Lilás (Renner Kids)	14	16	16	3	73.65	28	2026-04-25 10:25:09	2026-04-25 10:25:09
314	Calcinha Elástico(a) Preto(a) (Osklen Kids)	11	6	3	17	53.10	24	2026-04-25 10:25:09	2026-04-25 10:25:09
315	Bermuda Esportivo(a) Lilás (Lilica Ripilica)	12	1	16	19	47.66	19	2026-04-25 10:25:09	2026-04-25 10:25:09
316	Jaqueta Colorido(a) Rosa Choque (Zoe Kids)	7	11	10	18	47.44	31	2026-04-25 10:25:09	2026-04-25 10:25:09
317	Biquine Seda Cinza (Disney Baby)	27	2	8	19	114.61	12	2026-04-25 10:25:09	2026-04-25 10:25:09
318	Camiseta Formal Azul Escuro(a) (Kily)	16	8	9	18	117.34	17	2026-04-25 10:25:09	2026-04-25 10:25:09
319	Sunga Saja Marrom (Carters)	26	18	13	4	118.39	8	2026-04-25 10:25:09	2026-04-25 10:25:09
320	Jaqueta Labubu Lilás (Maria Filó Kids)	18	11	16	11	71.68	20	2026-04-25 10:25:09	2026-04-25 10:25:09
321	Calça Curto(a) Preto(a) (Brandille)	9	5	3	2	87.98	5	2026-04-25 10:25:09	2026-04-25 10:25:09
322	Sunga Animal Print Amarelo(a) (Dafiti Kids)	3	18	7	9	73.37	11	2026-04-25 10:25:09	2026-04-25 10:25:09
323	Top Stitch Marrom (Renner Kids)	28	20	13	16	52.38	28	2026-04-25 10:25:09	2026-04-25 10:25:09
324	Calcinha Curto(a) Turquesa (Carters)	9	6	15	11	11.02	8	2026-04-25 10:25:09	2026-04-25 10:25:09
325	Meia Temático(a) Prata (Disney Kids)	29	14	18	7	114.94	13	2026-04-25 10:25:09	2026-04-25 10:25:09
326	Cueca Respirável Azul (Boboi)	25	10	1	16	28.34	4	2026-04-25 10:25:09	2026-04-25 10:25:09
327	Camisa Esportivo(a) Branco(a) (Kily)	12	7	4	11	41.51	17	2026-04-25 10:25:09	2026-04-25 10:25:09
328	Calçado Jeans Amarelo(a) (Ki Carinho)	17	4	7	15	69.92	16	2026-04-25 10:25:09	2026-04-25 10:25:09
329	Sunga Toy Store Laranja (Maria Filó Kids)	30	18	11	12	88.60	20	2026-04-25 10:25:09	2026-04-25 10:25:09
330	Casaco Confortável Lilás (C&A Kids)	8	9	16	10	13.53	7	2026-04-25 10:25:09	2026-04-25 10:25:09
331	Camiseta Stitch Roxo(a) (Salsa Jeans Kids)	28	8	12	4	77.49	30	2026-04-25 10:25:09	2026-04-25 10:25:09
332	Biquine Elástico(a) Rosa (Salsa Jeans Kids)	11	2	2	17	106.53	30	2026-04-25 10:25:09	2026-04-25 10:25:09
333	Jaqueta Seda Azul (Colcci Kids)	27	11	1	5	62.77	9	2026-04-25 10:25:09	2026-04-25 10:25:09
334	Calça Jeans Dourado(a) (Hering Kids)	17	5	17	2	21.63	15	2026-04-25 10:25:09	2026-04-25 10:25:09
335	Camiseta Animal Print Turquesa (C&A Kids)	3	8	15	9	99.94	7	2026-04-25 10:25:09	2026-04-25 10:25:09
336	Casaco Leve Marrom (Disney Baby)	19	9	13	11	87.73	12	2026-04-25 10:25:09	2026-04-25 10:25:09
337	Sunga Poliéster Vinho (Renner Kids)	24	18	19	13	107.72	28	2026-04-25 10:25:09	2026-04-25 10:25:09
338	Bermuda Longa Cinza (Dafiti Kids)	21	1	8	7	50.62	11	2026-04-25 10:25:09	2026-04-25 10:25:09
339	Jaqueta Básico(a) Verde (Mundo Pet)	4	11	5	18	73.01	23	2026-04-25 10:25:09	2026-04-25 10:25:09
340	Maiô Estampado(a) Cáqui (Kily)	13	13	20	13	15.55	17	2026-04-25 10:25:09	2026-04-25 10:25:09
341	Sunga Poliéster Dourado(a) (Renner Kids)	24	18	17	11	47.76	28	2026-04-25 10:25:09	2026-04-25 10:25:09
342	Top Clássico(a) Bege (Adidas Kids)	6	20	14	3	119.15	1	2026-04-25 10:25:09	2026-04-25 10:25:09
343	Jaqueta Animal Print Vermelho(a) (C&A Baby)	3	11	6	17	49.86	6	2026-04-25 10:25:09	2026-04-25 10:25:09
344	Bermuda Toy Store Verde (Petit Royal)	30	1	5	7	79.59	25	2026-04-25 10:25:09	2026-04-25 10:25:09
345	Bermuda Toy Store Laranja (Riachuelo Kids)	30	1	11	4	13.83	29	2026-04-25 10:25:09	2026-04-25 10:25:09
346	Camisa Básico(a) Vinho (C&A Kids)	4	7	19	11	13.31	7	2026-04-25 10:25:09	2026-04-25 10:25:09
347	Bermuda Clássico(a) Lilás (Mundo Pet)	6	1	16	7	110.14	23	2026-04-25 10:25:09	2026-04-25 10:25:09
348	Meia Saja Vinho (Boboi)	26	14	19	6	30.00	4	2026-04-25 10:25:09	2026-04-25 10:25:09
349	Cueca Fit Cinza (Puket Kids)	14	10	8	16	21.52	27	2026-04-25 10:25:09	2026-04-25 10:25:09
350	Camisa Floral Rosa (Lacoste Kids)	15	7	2	19	71.90	18	2026-04-25 10:25:09	2026-04-25 10:25:09
351	Short Respirável Cinza (Zoe Kids)	25	17	8	19	113.34	31	2026-04-25 10:25:09	2026-04-25 10:25:09
352	Macacão Curto(a) Cáqui (Hering Kids)	9	12	20	4	54.58	15	2026-04-25 10:25:09	2026-04-25 10:25:09
353	Short Jeans Lilás (Marisol)	17	17	16	11	70.15	21	2026-04-25 10:25:09	2026-04-25 10:25:09
354	Pijama Xadrez Azul (Adidas Kids)	32	15	1	15	45.90	1	2026-04-25 10:25:09	2026-04-25 10:25:09
355	Top Durável Lilás (Lilica Ripilica)	10	20	16	4	79.96	19	2026-04-25 10:25:09	2026-04-25 10:25:09
356	Camiseta Moleton Prata (Ki Carinho)	23	8	18	17	91.37	16	2026-04-25 10:25:09	2026-04-25 10:25:09
357	Camiseta Colorido(a) Cáqui (Dafiti Kids)	7	8	20	2	96.51	11	2026-04-25 10:25:09	2026-04-25 10:25:09
358	Jaqueta Básico(a) Marrom (Riachuelo Kids)	4	11	13	16	48.76	29	2026-04-25 10:25:09	2026-04-25 10:25:09
359	Jaqueta Fit Turquesa (Zoe Kids)	14	11	15	6	20.50	31	2026-04-25 10:25:09	2026-04-25 10:25:09
360	Blusa Estampado(a) Preto(a) (C&A Baby)	13	3	3	19	118.57	6	2026-04-25 10:25:09	2026-04-25 10:25:09
361	Calçado Xadrez Verde (Akazys)	32	4	5	14	99.55	2	2026-04-25 10:25:09	2026-04-25 10:25:09
362	Calcinha Clássico(a) Branco(a) (Puket Kids)	6	6	4	14	80.10	27	2026-04-25 10:25:09	2026-04-25 10:25:09
363	Jaqueta Loney Tunes Cáqui (Lilica Ripilica)	22	11	20	12	11.81	19	2026-04-25 10:25:09	2026-04-25 10:25:09
364	Short Algodão Preto(a) (Riachuelo Kids)	2	17	3	7	63.14	29	2026-04-25 10:25:09	2026-04-25 10:25:09
365	Jaqueta Clássico(a) Rosa (Boboi)	6	11	2	5	14.14	4	2026-04-25 10:25:09	2026-04-25 10:25:09
366	Pijama Temático(a) Cinza (Colcci Kids)	29	15	8	15	40.48	9	2026-04-25 10:25:09	2026-04-25 10:25:09
367	Macacão Esportivo(a) Vermelho(a) (Renner Kids)	12	12	6	15	82.97	28	2026-04-25 10:25:09	2026-04-25 10:25:09
368	Sunga Fit Azul Escuro(a) (Brandille)	14	18	9	12	90.60	5	2026-04-25 10:25:09	2026-04-25 10:25:09
369	Calçado Básico(a) Rosa Choque (Brandille)	4	4	10	2	114.80	5	2026-04-25 10:25:09	2026-04-25 10:25:09
370	Vestido Temático(a) Marrom (Dafiti Kids)	29	21	13	14	93.64	11	2026-04-25 10:25:09	2026-04-25 10:25:09
371	Pijama Saja Dourado(a) (Petit Royal)	26	15	17	12	96.37	25	2026-04-25 10:25:09	2026-04-25 10:25:09
372	Pijama Listrado Vinho (Riachuelo Kids)	20	15	19	18	21.70	29	2026-04-25 10:25:09	2026-04-25 10:25:09
373	Calça Colorido(a) Vinho (Boboi)	7	5	19	10	23.23	4	2026-04-25 10:25:09	2026-04-25 10:25:09
374	Bermuda Leve Vinho (Petit Royal)	19	1	19	18	53.26	25	2026-04-25 10:25:09	2026-04-25 10:25:09
375	Casaco Casual Laranja (Kily)	5	9	11	16	37.76	17	2026-04-25 10:25:09	2026-04-25 10:25:09
376	Jaqueta Longa Cáqui (Riachuelo Kids)	21	11	20	5	23.67	29	2026-04-25 10:25:09	2026-04-25 10:25:09
377	Calçado Moleton Branco(a) (Maria Filó Kids)	23	4	4	2	77.97	20	2026-04-25 10:25:09	2026-04-25 10:25:09
378	Jaqueta Labubu Vinho (Akazys)	18	11	19	17	89.78	2	2026-04-25 10:25:09	2026-04-25 10:25:09
379	Meia Estampado(a) Cinza (Pimpolho)	13	14	8	17	89.55	26	2026-04-25 10:25:09	2026-04-25 10:25:09
380	Bermuda Algodão Turquesa (Lilica Ripilica)	2	1	15	11	65.60	19	2026-04-25 10:25:09	2026-04-25 10:25:09
381	Maiô Seda Azul Escuro(a) (Mundo Pet)	27	13	9	13	76.78	23	2026-04-25 10:25:09	2026-04-25 10:25:09
382	Pijama Turma da Mônica Azul (Akazys)	31	15	1	8	110.38	2	2026-04-25 10:25:09	2026-04-25 10:25:09
383	Vestido Leve Azul (Ki Carinho)	19	21	1	18	99.79	16	2026-04-25 10:25:09	2026-04-25 10:25:09
384	Short Saja Rosa (Hering Kids)	26	17	2	7	118.30	15	2026-04-25 10:25:09	2026-04-25 10:25:09
385	Camisa Jeans Azul (Akazys)	17	7	1	2	88.51	2	2026-04-25 10:25:09	2026-04-25 10:25:09
386	Short Floral Cáqui (Adidas Kids)	15	17	20	14	25.69	1	2026-04-25 10:25:09	2026-04-25 10:25:09
387	Calça Fit Azul Escuro(a) (Brandille)	14	5	9	8	14.28	5	2026-04-25 10:25:09	2026-04-25 10:25:09
388	Jaqueta Loney Tunes Amarelo(a) (Salsa Jeans Kids)	22	11	7	13	88.74	30	2026-04-25 10:25:09	2026-04-25 10:25:09
389	Maiô Casual Marrom (Disney Baby)	5	13	13	10	44.52	12	2026-04-25 10:25:09	2026-04-25 10:25:09
390	Bermuda Leve Azul Escuro(a) (Renner Kids)	19	1	9	13	88.66	28	2026-04-25 10:25:09	2026-04-25 10:25:09
391	Sunga Listrado Azul Escuro(a) (Disney Baby)	20	18	9	2	57.78	12	2026-04-25 10:25:09	2026-04-25 10:25:09
392	Vestido Moleton Amarelo(a) (Mundo Pet)	23	21	7	2	51.76	23	2026-04-25 10:25:09	2026-04-25 10:25:09
393	Blusa Xadrez Rosa Choque (Maria Filó Kids)	32	3	10	8	53.46	20	2026-04-25 10:25:09	2026-04-25 10:25:09
394	Top Formal Dourado(a) (Brandille)	16	20	17	5	86.68	5	2026-04-25 10:25:09	2026-04-25 10:25:09
395	Sutiã Leve Azul Escuro(a) (Riachuelo Kids)	19	19	9	3	114.37	29	2026-04-25 10:25:09	2026-04-25 10:25:09
396	Calça Durável Cinza (Brandille)	10	5	8	17	22.26	5	2026-04-25 10:25:09	2026-04-25 10:25:09
397	Bermuda Ajustável Cáqui (Brandille)	1	1	20	11	114.50	5	2026-04-25 10:25:09	2026-04-25 10:25:09
398	Short Durável Dourado(a) (Mundo Pet)	10	17	17	6	90.11	23	2026-04-25 10:25:09	2026-04-25 10:25:09
399	Calcinha Turma da Mônica Rosa (Disney Kids)	31	6	2	12	56.18	13	2026-04-25 10:25:09	2026-04-25 10:25:09
400	Cueca Labubu Cáqui (Renner Kids)	18	10	20	7	92.05	28	2026-04-25 10:25:09	2026-04-25 10:25:09
515	Cueca Algodão Azul (Boboi)	2	10	1	5	81.81	4	2026-04-25 10:25:09	2026-04-25 10:25:09
401	Camiseta Clássico(a) Branco(a) (Akazys)	6	8	4	8	27.52	2	2026-04-25 10:25:09	2026-04-25 10:25:09
402	Sunga Estampado(a) Azul Escuro(a) (Riachuelo Kids)	13	18	9	18	59.49	29	2026-04-25 10:25:09	2026-04-25 10:25:09
403	Short Ajustável Rosa Choque (Akazys)	1	17	10	1	38.73	2	2026-04-25 10:25:09	2026-04-25 10:25:09
404	Vestido Ajustável Turquesa (C&A Kids)	1	21	15	14	27.88	7	2026-04-25 10:25:09	2026-04-25 10:25:09
405	Casaco Curto(a) Lilás (Carters)	9	9	16	9	45.74	8	2026-04-25 10:25:09	2026-04-25 10:25:09
406	Calçado Animal Print Cáqui (Disney Baby)	3	4	20	8	21.40	12	2026-04-25 10:25:09	2026-04-25 10:25:09
407	Calça Formal Roxo(a) (Adidas Kids)	16	5	12	11	38.62	1	2026-04-25 10:25:09	2026-04-25 10:25:09
408	Vestido Colorido(a) Verde (Brandille)	7	21	5	15	50.13	5	2026-04-25 10:25:09	2026-04-25 10:25:09
409	Bermuda Jeans Prata (Lacoste Kids)	17	1	18	5	94.00	18	2026-04-25 10:25:09	2026-04-25 10:25:09
410	Sutiã Esportivo(a) Vermelho(a) (Carters)	12	19	6	8	30.02	8	2026-04-25 10:25:09	2026-04-25 10:25:09
411	Biquine Jeans Vermelho(a) (Boboi)	17	2	6	15	10.98	4	2026-04-25 10:25:09	2026-04-25 10:25:09
412	Macacão Xadrez Dourado(a) (Osklen Kids)	32	12	17	10	19.84	24	2026-04-25 10:25:09	2026-04-25 10:25:09
413	Macacão Confortável Vinho (Bendita Cute)	8	12	19	4	96.46	3	2026-04-25 10:25:09	2026-04-25 10:25:09
414	Camiseta Básico(a) Roxo(a) (Hering Kids)	4	8	12	17	71.03	15	2026-04-25 10:25:09	2026-04-25 10:25:09
415	Calçado Básico(a) Azul (C&A Kids)	4	4	1	7	47.94	7	2026-04-25 10:25:09	2026-04-25 10:25:09
416	Calcinha Elástico(a) Cáqui (C&A Kids)	11	6	20	2	30.55	7	2026-04-25 10:25:09	2026-04-25 10:25:09
417	Jaqueta Loney Tunes Dourado(a) (Dafiti Kids)	22	11	17	2	110.33	11	2026-04-25 10:25:09	2026-04-25 10:25:09
418	Bermuda Saja Rosa Choque (Farm Kids)	26	1	10	5	92.08	14	2026-04-25 10:25:09	2026-04-25 10:25:09
419	Calça Temático(a) Azul (Brandille)	29	5	1	11	101.49	5	2026-04-25 10:25:09	2026-04-25 10:25:09
420	Calça Xadrez Preto(a) (Ki Carinho)	32	5	3	14	105.97	16	2026-04-25 10:25:09	2026-04-25 10:25:09
421	Sutiã Moleton Verde (Mundo Infantil)	23	19	5	17	28.20	22	2026-04-25 10:25:09	2026-04-25 10:25:09
422	Camiseta Floral Rosa (Lilica Ripilica)	15	8	2	12	37.81	19	2026-04-25 10:25:09	2026-04-25 10:25:09
423	Pijama Xadrez Vermelho(a) (Salsa Jeans Kids)	32	15	6	6	107.13	30	2026-04-25 10:25:09	2026-04-25 10:25:09
424	Vestido Elástico(a) Marrom (Puket Kids)	11	21	13	8	113.20	27	2026-04-25 10:25:09	2026-04-25 10:25:09
425	Biquine Básico(a) Laranja (Maria Filó Kids)	4	2	11	15	119.10	20	2026-04-25 10:25:09	2026-04-25 10:25:09
426	Camiseta Listrado Azul (Dafiti Kids)	20	8	1	19	12.55	11	2026-04-25 10:25:09	2026-04-25 10:25:09
427	Biquine Temático(a) Prata (Ki Carinho)	29	2	18	18	32.58	16	2026-04-25 10:25:09	2026-04-25 10:25:09
428	Pijama Labubu Rosa Choque (Kily)	18	15	10	8	38.53	17	2026-04-25 10:25:09	2026-04-25 10:25:09
429	Bermuda Labubu Azul (Disney Kids)	18	1	1	2	50.90	13	2026-04-25 10:25:09	2026-04-25 10:25:09
430	Blusa Animal Print Amarelo(a) (Dafiti Kids)	3	3	7	9	66.17	11	2026-04-25 10:25:09	2026-04-25 10:25:09
431	Biquine Durável Azul Escuro(a) (Disney Kids)	10	2	9	14	50.72	13	2026-04-25 10:25:09	2026-04-25 10:25:09
432	Casaco Animal Print Verde (Adidas Kids)	3	9	5	11	52.42	1	2026-04-25 10:25:09	2026-04-25 10:25:09
433	Short Durável Cinza (C&A Baby)	10	17	8	4	107.13	6	2026-04-25 10:25:09	2026-04-25 10:25:09
434	Calcinha Casual Azul Escuro(a) (Zoe Kids)	5	6	9	17	114.25	31	2026-04-25 10:25:09	2026-04-25 10:25:09
435	Calçado Seda Vinho (Conjunto Infantil)	27	4	19	18	56.42	10	2026-04-25 10:25:09	2026-04-25 10:25:09
436	Top Leve Laranja (Riachuelo Kids)	19	20	11	18	66.02	29	2026-04-25 10:25:09	2026-04-25 10:25:09
437	Pijama Labubu Marrom (Bendita Cute)	18	15	13	12	63.85	3	2026-04-25 10:25:09	2026-04-25 10:25:09
438	Cueca Clássico(a) Roxo(a) (Pimpolho)	6	10	12	7	65.76	26	2026-04-25 10:25:09	2026-04-25 10:25:09
439	Top Poliéster Rosa Choque (Pimpolho)	24	20	10	5	55.19	26	2026-04-25 10:25:09	2026-04-25 10:25:09
440	Top Poliéster Vinho (Conjunto Infantil)	24	20	19	6	27.48	10	2026-04-25 10:25:09	2026-04-25 10:25:09
441	Meia Turma da Mônica Cáqui (Conjunto Infantil)	31	14	20	3	47.59	10	2026-04-25 10:25:09	2026-04-25 10:25:09
442	Calça Esportivo(a) Bege (Lacoste Kids)	12	5	14	5	115.32	18	2026-04-25 10:25:09	2026-04-25 10:25:09
443	Casaco Formal Branco(a) (Marisol)	16	9	4	10	87.00	21	2026-04-25 10:25:09	2026-04-25 10:25:09
444	Jaqueta Esportivo(a) Lilás (Bendita Cute)	12	11	16	2	38.19	3	2026-04-25 10:25:09	2026-04-25 10:25:09
445	Sutiã Curto(a) Branco(a) (Zoe Kids)	9	19	4	18	54.27	31	2026-04-25 10:25:09	2026-04-25 10:25:09
446	Saia Curto(a) Azul Escuro(a) (Lilica Ripilica)	9	16	9	9	40.22	19	2026-04-25 10:25:09	2026-04-25 10:25:09
447	Macacão Básico(a) Roxo(a) (Lacoste Kids)	4	12	12	12	65.07	18	2026-04-25 10:25:09	2026-04-25 10:25:09
448	Macacão Ajustável Azul (Brandille)	1	12	1	16	60.01	5	2026-04-25 10:25:09	2026-04-25 10:25:09
449	Camisa Temático(a) Vermelho(a) (Boboi)	29	7	6	18	100.14	4	2026-04-25 10:25:09	2026-04-25 10:25:09
450	Biquine Colorido(a) Laranja (Carters)	7	2	11	14	78.08	8	2026-04-25 10:25:09	2026-04-25 10:25:09
451	Casaco Temático(a) Vinho (Colcci Kids)	29	9	19	6	61.46	9	2026-04-25 10:25:09	2026-04-25 10:25:09
452	Biquine Curto(a) Azul Escuro(a) (Zoe Kids)	9	2	9	11	41.33	31	2026-04-25 10:25:09	2026-04-25 10:25:09
453	Biquine Saja Dourado(a) (Disney Baby)	26	2	17	16	90.38	12	2026-04-25 10:25:09	2026-04-25 10:25:09
454	Cueca Esportivo(a) Vermelho(a) (Dafiti Kids)	12	10	6	4	94.56	11	2026-04-25 10:25:09	2026-04-25 10:25:09
455	Casaco Animal Print Azul (Puket Kids)	3	9	1	4	89.17	27	2026-04-25 10:25:09	2026-04-25 10:25:09
456	Jaqueta Curto(a) Roxo(a) (Puket Kids)	9	11	12	17	46.43	27	2026-04-25 10:25:09	2026-04-25 10:25:09
457	Calcinha Fit Bege (C&A Baby)	14	6	14	17	63.89	6	2026-04-25 10:25:09	2026-04-25 10:25:09
458	Blusa Básico(a) Rosa (Zoe Kids)	4	3	2	9	86.90	31	2026-04-25 10:25:09	2026-04-25 10:25:09
459	Macacão Casual Verde (Riachuelo Kids)	5	12	5	12	84.06	29	2026-04-25 10:25:09	2026-04-25 10:25:09
460	Biquine Algodão Amarelo(a) (C&A Kids)	2	2	7	10	76.78	7	2026-04-25 10:25:09	2026-04-25 10:25:09
461	Sutiã Moleton Cáqui (Boboi)	23	19	20	19	119.35	4	2026-04-25 10:25:09	2026-04-25 10:25:09
462	Calcinha Leve Dourado(a) (Petit Royal)	19	6	17	18	96.82	25	2026-04-25 10:25:09	2026-04-25 10:25:09
463	Bermuda Confortável Amarelo(a) (Salsa Jeans Kids)	8	1	7	17	31.14	30	2026-04-25 10:25:09	2026-04-25 10:25:09
464	Jaqueta Casual Rosa Choque (Disney Baby)	5	11	10	5	118.46	12	2026-04-25 10:25:09	2026-04-25 10:25:09
465	Meia Esportivo(a) Cinza (Lilica Ripilica)	12	14	8	16	83.52	19	2026-04-25 10:25:09	2026-04-25 10:25:09
466	Casaco Listrado Vinho (Lacoste Kids)	20	9	19	6	24.21	18	2026-04-25 10:25:09	2026-04-25 10:25:09
467	Top Formal Cáqui (Mundo Pet)	16	20	20	5	85.49	23	2026-04-25 10:25:09	2026-04-25 10:25:09
468	Camisa Jeans Vermelho(a) (Lilica Ripilica)	17	7	6	3	116.84	19	2026-04-25 10:25:09	2026-04-25 10:25:09
469	Saia Toy Store Laranja (C&A Kids)	30	16	11	16	91.48	7	2026-04-25 10:25:09	2026-04-25 10:25:09
470	Biquine Ajustável Azul Escuro(a) (Adidas Kids)	1	2	9	14	29.98	1	2026-04-25 10:25:09	2026-04-25 10:25:09
471	Meia Jeans Roxo(a) (Adidas Kids)	17	14	12	12	107.49	1	2026-04-25 10:25:09	2026-04-25 10:25:09
472	Casaco Temático(a) Dourado(a) (C&A Kids)	29	9	17	13	76.63	7	2026-04-25 10:25:09	2026-04-25 10:25:09
473	Sutiã Clássico(a) Rosa (Disney Baby)	6	19	2	13	110.37	12	2026-04-25 10:25:09	2026-04-25 10:25:09
474	Biquine Durável Rosa Choque (Ki Carinho)	10	2	10	19	95.49	16	2026-04-25 10:25:09	2026-04-25 10:25:09
475	Meia Elástico(a) Dourado(a) (Bendita Cute)	11	14	17	6	29.28	3	2026-04-25 10:25:09	2026-04-25 10:25:09
476	Saia Jeans Azul Escuro(a) (Maria Filó Kids)	17	16	9	16	34.40	20	2026-04-25 10:25:09	2026-04-25 10:25:09
477	Calçado Xadrez Branco(a) (Ki Carinho)	32	4	4	14	54.92	16	2026-04-25 10:25:09	2026-04-25 10:25:09
478	Blusa Floral Vinho (Dafiti Kids)	15	3	19	16	72.76	11	2026-04-25 10:25:09	2026-04-25 10:25:09
479	Calcinha Básico(a) Rosa Choque (Lacoste Kids)	4	6	10	18	92.46	18	2026-04-25 10:25:09	2026-04-25 10:25:09
480	Casaco Listrado Prata (Zoe Kids)	20	9	18	5	67.34	31	2026-04-25 10:25:09	2026-04-25 10:25:09
481	Pijama Jeans Rosa Choque (C&A Baby)	17	15	10	4	64.27	6	2026-04-25 10:25:09	2026-04-25 10:25:09
482	Top Animal Print Dourado(a) (Pimpolho)	3	20	17	19	30.66	26	2026-04-25 10:25:09	2026-04-25 10:25:09
483	Vestido Esportivo(a) Bege (Disney Kids)	12	21	14	17	53.19	13	2026-04-25 10:25:09	2026-04-25 10:25:09
484	Sutiã Clássico(a) Marrom (Riachuelo Kids)	6	19	13	1	28.18	29	2026-04-25 10:25:09	2026-04-25 10:25:09
485	Calçado Saja Amarelo(a) (Dafiti Kids)	26	4	7	17	82.59	11	2026-04-25 10:25:09	2026-04-25 10:25:09
486	Casaco Esportivo(a) Cáqui (Mundo Infantil)	12	9	20	15	96.01	22	2026-04-25 10:25:09	2026-04-25 10:25:09
487	Sutiã Animal Print Vinho (Carters)	3	19	19	18	44.67	8	2026-04-25 10:25:09	2026-04-25 10:25:09
488	Biquine Ajustável Dourado(a) (Farm Kids)	1	2	17	19	41.20	14	2026-04-25 10:25:09	2026-04-25 10:25:09
489	Macacão Listrado Prata (Lilica Ripilica)	20	12	18	19	74.71	19	2026-04-25 10:25:09	2026-04-25 10:25:09
490	Calçado Temático(a) Rosa Choque (Salsa Jeans Kids)	29	4	10	3	35.82	30	2026-04-25 10:25:09	2026-04-25 10:25:09
491	Sunga Esportivo(a) Amarelo(a) (Pimpolho)	12	18	7	12	94.64	26	2026-04-25 10:25:09	2026-04-25 10:25:09
492	Camiseta Loney Tunes Azul Escuro(a) (Conjunto Infantil)	22	8	9	10	45.53	10	2026-04-25 10:25:09	2026-04-25 10:25:09
493	Blusa Moleton Vermelho(a) (Disney Kids)	23	3	6	4	35.21	13	2026-04-25 10:25:09	2026-04-25 10:25:09
494	Camisa Toy Store Azul (Farm Kids)	30	7	1	7	111.60	14	2026-04-25 10:25:09	2026-04-25 10:25:09
495	Pijama Listrado Turquesa (Kily)	20	15	15	10	64.31	17	2026-04-25 10:25:09	2026-04-25 10:25:09
496	Maiô Temático(a) Vinho (Puket Kids)	29	13	19	9	23.41	27	2026-04-25 10:25:09	2026-04-25 10:25:09
497	Calça Respirável Laranja (Mundo Infantil)	25	5	11	16	45.48	22	2026-04-25 10:25:09	2026-04-25 10:25:09
498	Sunga Colorido(a) Rosa (Boboi)	7	18	2	15	67.90	4	2026-04-25 10:25:09	2026-04-25 10:25:09
499	Calçado Esportivo(a) Cáqui (Zoe Kids)	12	4	20	19	81.68	31	2026-04-25 10:25:09	2026-04-25 10:25:09
500	Jaqueta Longa Rosa Choque (Disney Kids)	21	11	10	3	46.57	13	2026-04-25 10:25:09	2026-04-25 10:25:09
501	Pijama Esportivo(a) Vinho (Lacoste Kids)	12	15	19	18	71.70	18	2026-04-25 10:25:09	2026-04-25 10:25:09
502	Casaco Estampado(a) Dourado(a) (C&A Kids)	13	9	17	19	107.28	7	2026-04-25 10:25:09	2026-04-25 10:25:09
503	Bermuda Fit Rosa (Zoe Kids)	14	1	2	9	68.30	31	2026-04-25 10:25:09	2026-04-25 10:25:09
504	Saia Elástico(a) Bege (Marisol)	11	16	14	10	16.12	21	2026-04-25 10:25:09	2026-04-25 10:25:09
505	Bermuda Turma da Mônica Rosa Choque (Osklen Kids)	31	1	10	18	56.26	24	2026-04-25 10:25:09	2026-04-25 10:25:09
506	Bermuda Moleton Azul (Farm Kids)	23	1	1	9	16.77	14	2026-04-25 10:25:09	2026-04-25 10:25:09
507	Cueca Durável Dourado(a) (Carters)	10	10	17	7	84.26	8	2026-04-25 10:25:09	2026-04-25 10:25:09
508	Calça Loney Tunes Cinza (Puket Kids)	22	5	8	18	108.59	27	2026-04-25 10:25:09	2026-04-25 10:25:09
509	Cueca Toy Store Azul Escuro(a) (Salsa Jeans Kids)	30	10	9	14	96.03	30	2026-04-25 10:25:09	2026-04-25 10:25:09
510	Maiô Respirável Lilás (Renner Kids)	25	13	16	7	113.19	28	2026-04-25 10:25:09	2026-04-25 10:25:09
511	Short Longa Bege (Pimpolho)	21	17	14	18	99.11	26	2026-04-25 10:25:09	2026-04-25 10:25:09
512	Saia Listrado Vermelho(a) (Disney Baby)	20	16	6	5	91.04	12	2026-04-25 10:25:09	2026-04-25 10:25:09
513	Top Esportivo(a) Bege (Maria Filó Kids)	12	20	14	13	74.44	20	2026-04-25 10:25:09	2026-04-25 10:25:09
514	Calcinha Básico(a) Branco(a) (Bendita Cute)	4	6	4	16	24.11	3	2026-04-25 10:25:09	2026-04-25 10:25:09
516	Short Formal Laranja (Disney Baby)	16	17	11	12	75.33	12	2026-04-25 10:25:09	2026-04-25 10:25:09
517	Vestido Ajustável Lilás (Mundo Pet)	1	21	16	8	94.27	23	2026-04-25 10:25:09	2026-04-25 10:25:09
518	Blusa Xadrez Azul (Colcci Kids)	32	3	1	10	19.40	9	2026-04-25 10:25:09	2026-04-25 10:25:09
519	Sutiã Stitch Rosa Choque (C&A Kids)	28	19	10	11	77.02	7	2026-04-25 10:25:09	2026-04-25 10:25:09
520	Bermuda Esportivo(a) Vermelho(a) (Farm Kids)	12	1	6	18	89.63	14	2026-04-25 10:25:09	2026-04-25 10:25:09
521	Maiô Ajustável Marrom (Akazys)	1	13	13	11	30.81	2	2026-04-25 10:25:09	2026-04-25 10:25:09
522	Calçado Toy Store Vinho (Lacoste Kids)	30	4	19	13	69.79	18	2026-04-25 10:25:09	2026-04-25 10:25:09
523	Jaqueta Saja Vinho (Zoe Kids)	26	11	19	5	116.61	31	2026-04-25 10:25:09	2026-04-25 10:25:09
524	Bermuda Ajustável Bege (Lacoste Kids)	1	1	14	15	52.78	18	2026-04-25 10:25:09	2026-04-25 10:25:09
525	Biquine Ajustável Prata (Osklen Kids)	1	2	18	12	69.89	24	2026-04-25 10:25:09	2026-04-25 10:25:09
526	Saia Longa Marrom (Zoe Kids)	21	16	13	11	107.79	31	2026-04-25 10:25:09	2026-04-25 10:25:09
527	Biquine Clássico(a) Prata (Mundo Infantil)	6	2	18	16	53.08	22	2026-04-25 10:25:09	2026-04-25 10:25:09
528	Calçado Longa Rosa Choque (C&A Baby)	21	4	10	6	25.61	6	2026-04-25 10:25:09	2026-04-25 10:25:09
529	Calça Ajustável Branco(a) (Mundo Pet)	1	5	4	7	101.18	23	2026-04-25 10:25:09	2026-04-25 10:25:09
530	Jaqueta Jeans Azul (Riachuelo Kids)	17	11	1	14	31.07	29	2026-04-25 10:25:09	2026-04-25 10:25:09
531	Sunga Elástico(a) Bege (Puket Kids)	11	18	14	8	64.33	27	2026-04-25 10:25:09	2026-04-25 10:25:09
532	Calçado Formal Vinho (Mundo Infantil)	16	4	19	11	29.45	22	2026-04-25 10:25:09	2026-04-25 10:25:09
533	Camiseta Saja Lilás (Farm Kids)	26	8	16	1	55.41	14	2026-04-25 10:25:09	2026-04-25 10:25:09
534	Camisa Animal Print Roxo(a) (Akazys)	3	7	12	11	101.04	2	2026-04-25 10:25:09	2026-04-25 10:25:09
535	Calça Loney Tunes Azul (Hering Kids)	22	5	1	14	50.80	15	2026-04-25 10:25:09	2026-04-25 10:25:09
536	Top Respirável Bege (Petit Royal)	25	20	14	18	62.96	25	2026-04-25 10:25:09	2026-04-25 10:25:09
537	Blusa Turma da Mônica Vermelho(a) (Maria Filó Kids)	31	3	6	4	55.35	20	2026-04-25 10:25:09	2026-04-25 10:25:09
538	Cueca Turma da Mônica Laranja (Disney Kids)	31	10	11	12	77.03	13	2026-04-25 10:25:09	2026-04-25 10:25:09
539	Blusa Toy Store Cinza (C&A Baby)	30	3	8	19	49.52	6	2026-04-25 10:25:09	2026-04-25 10:25:09
540	Cueca Listrado Dourado(a) (Mundo Infantil)	20	10	17	17	100.09	22	2026-04-25 10:25:09	2026-04-25 10:25:09
541	Meia Curto(a) Rosa Choque (Petit Royal)	9	14	10	4	42.12	25	2026-04-25 10:25:09	2026-04-25 10:25:09
542	Jaqueta Labubu Roxo(a) (Bendita Cute)	18	11	12	5	73.28	3	2026-04-25 10:25:09	2026-04-25 10:25:09
543	Camisa Confortável Amarelo(a) (Petit Royal)	8	7	7	13	74.72	25	2026-04-25 10:25:09	2026-04-25 10:25:09
544	Casaco Confortável Vinho (Bendita Cute)	8	9	19	7	109.61	3	2026-04-25 10:25:09	2026-04-25 10:25:09
545	Cueca Durável Cinza (Boboi)	10	10	8	7	64.27	4	2026-04-25 10:25:09	2026-04-25 10:25:09
546	Camiseta Toy Store Preto(a) (Bendita Cute)	30	8	3	9	14.90	3	2026-04-25 10:25:09	2026-04-25 10:25:09
547	Biquine Estampado(a) Marrom (C&A Kids)	13	2	13	6	28.63	7	2026-04-25 10:25:09	2026-04-25 10:25:09
548	Bermuda Estampado(a) Lilás (Mundo Infantil)	13	1	16	8	21.87	22	2026-04-25 10:25:09	2026-04-25 10:25:09
549	Camisa Temático(a) Dourado(a) (Marisol)	29	7	17	5	60.79	21	2026-04-25 10:25:09	2026-04-25 10:25:09
550	Calçado Elástico(a) Branco(a) (C&A Kids)	11	4	4	11	105.63	7	2026-04-25 10:25:09	2026-04-25 10:25:09
551	Jaqueta Clássico(a) Bege (Conjunto Infantil)	6	11	14	10	111.93	10	2026-04-25 10:25:09	2026-04-25 10:25:09
552	Calcinha Longa Verde (Akazys)	21	6	5	8	66.52	2	2026-04-25 10:25:09	2026-04-25 10:25:09
553	Calçado Respirável Preto(a) (Maria Filó Kids)	25	4	3	13	43.11	20	2026-04-25 10:25:09	2026-04-25 10:25:09
554	Jaqueta Listrado Vermelho(a) (Dafiti Kids)	20	11	6	6	103.94	11	2026-04-25 10:25:09	2026-04-25 10:25:09
555	Calça Leve Laranja (Conjunto Infantil)	19	5	11	6	74.26	10	2026-04-25 10:25:09	2026-04-25 10:25:09
556	Biquine Jeans Azul Escuro(a) (Disney Baby)	17	2	9	7	113.37	12	2026-04-25 10:25:09	2026-04-25 10:25:09
557	Camiseta Curto(a) Vinho (Renner Kids)	9	8	19	18	91.27	28	2026-04-25 10:25:09	2026-04-25 10:25:09
558	Meia Colorido(a) Azul Escuro(a) (Salsa Jeans Kids)	7	14	9	2	81.07	30	2026-04-25 10:25:09	2026-04-25 10:25:09
559	Sunga Turma da Mônica Cinza (Maria Filó Kids)	31	18	8	16	39.07	20	2026-04-25 10:25:09	2026-04-25 10:25:09
560	Macacão Toy Store Bege (Petit Royal)	30	12	14	17	105.60	25	2026-04-25 10:25:09	2026-04-25 10:25:09
561	Meia Colorido(a) Rosa (Kily)	7	14	2	11	113.33	17	2026-04-25 10:25:09	2026-04-25 10:25:09
562	Macacão Clássico(a) Vermelho(a) (Osklen Kids)	6	12	6	13	80.92	24	2026-04-25 10:25:09	2026-04-25 10:25:09
563	Sunga Stitch Vermelho(a) (Akazys)	28	18	6	13	55.10	2	2026-04-25 10:25:09	2026-04-25 10:25:09
564	Casaco Formal Vermelho(a) (Lilica Ripilica)	16	9	6	3	59.27	19	2026-04-25 10:25:09	2026-04-25 10:25:09
565	Biquine Temático(a) Verde (Lilica Ripilica)	29	2	5	10	38.39	19	2026-04-25 10:25:09	2026-04-25 10:25:09
566	Calçado Estampado(a) Turquesa (Riachuelo Kids)	13	4	15	7	39.20	29	2026-04-25 10:25:09	2026-04-25 10:25:09
567	Calçado Saja Azul (Maria Filó Kids)	26	4	1	9	54.78	20	2026-04-25 10:25:09	2026-04-25 10:25:09
568	Calcinha Básico(a) Vermelho(a) (Brandille)	4	6	6	3	86.57	5	2026-04-25 10:25:09	2026-04-25 10:25:09
569	Bermuda Básico(a) Azul Escuro(a) (Boboi)	4	1	9	16	85.36	4	2026-04-25 10:25:09	2026-04-25 10:25:09
570	Macacão Temático(a) Bege (Ki Carinho)	29	12	14	12	77.82	16	2026-04-25 10:25:09	2026-04-25 10:25:09
571	Blusa Turma da Mônica Lilás (Maria Filó Kids)	31	3	16	4	54.79	20	2026-04-25 10:25:09	2026-04-25 10:25:09
572	Casaco Respirável Preto(a) (Salsa Jeans Kids)	25	9	3	12	80.62	30	2026-04-25 10:25:09	2026-04-25 10:25:09
573	Sunga Listrado Marrom (Riachuelo Kids)	20	18	13	13	59.76	29	2026-04-25 10:25:09	2026-04-25 10:25:09
574	Top Seda Verde (Petit Royal)	27	20	5	6	98.56	25	2026-04-25 10:25:09	2026-04-25 10:25:09
575	Maiô Turma da Mônica Preto(a) (Puket Kids)	31	13	3	1	114.47	27	2026-04-25 10:25:09	2026-04-25 10:25:09
576	Camisa Jeans Bege (Conjunto Infantil)	17	7	14	5	15.85	10	2026-04-25 10:25:09	2026-04-25 10:25:09
577	Camiseta Confortável Rosa Choque (Pimpolho)	8	8	10	2	112.27	26	2026-04-25 10:25:09	2026-04-25 10:25:09
578	Saia Xadrez Azul (Puket Kids)	32	16	1	10	37.64	27	2026-04-25 10:25:09	2026-04-25 10:25:09
579	Pijama Leve Rosa (Bendita Cute)	19	15	2	18	18.37	3	2026-04-25 10:25:09	2026-04-25 10:25:09
580	Short Confortável Azul (Marisol)	8	17	1	17	80.52	21	2026-04-25 10:25:09	2026-04-25 10:25:09
581	Sutiã Ajustável Prata (Petit Royal)	1	19	18	8	104.24	25	2026-04-25 10:25:09	2026-04-25 10:25:09
582	Bermuda Toy Store Bege (Renner Kids)	30	1	14	12	19.26	28	2026-04-25 10:25:09	2026-04-25 10:25:09
583	Camisa Confortável Prata (Maria Filó Kids)	8	7	18	2	91.20	20	2026-04-25 10:25:09	2026-04-25 10:25:09
584	Meia Formal Branco(a) (Maria Filó Kids)	16	14	4	17	28.01	20	2026-04-25 10:25:09	2026-04-25 10:25:09
585	Saia Moleton Azul Escuro(a) (Disney Kids)	23	16	9	15	71.91	13	2026-04-25 10:25:09	2026-04-25 10:25:09
586	Top Loney Tunes Turquesa (Carters)	22	20	15	1	72.52	8	2026-04-25 10:25:09	2026-04-25 10:25:09
587	Meia Seda Prata (Disney Kids)	27	14	18	17	108.63	13	2026-04-25 10:25:09	2026-04-25 10:25:09
588	Camisa Formal Azul (Kily)	16	7	1	10	29.98	17	2026-04-25 10:25:09	2026-04-25 10:25:09
589	Calcinha Longa Amarelo(a) (Salsa Jeans Kids)	21	6	7	13	96.78	30	2026-04-25 10:25:09	2026-04-25 10:25:09
590	Cueca Clássico(a) Branco(a) (Zoe Kids)	6	10	4	8	43.59	31	2026-04-25 10:25:09	2026-04-25 10:25:09
591	Maiô Animal Print Roxo(a) (Akazys)	3	13	12	12	79.40	2	2026-04-25 10:25:09	2026-04-25 10:25:09
592	Saia Toy Store Turquesa (Zoe Kids)	30	16	15	17	67.02	31	2026-04-25 10:25:09	2026-04-25 10:25:09
593	Blusa Loney Tunes Azul Escuro(a) (Salsa Jeans Kids)	22	3	9	11	89.82	30	2026-04-25 10:25:09	2026-04-25 10:25:09
594	Camiseta Estampado(a) Dourado(a) (Akazys)	13	8	17	2	35.33	2	2026-04-25 10:25:09	2026-04-25 10:25:09
595	Meia Confortável Laranja (Puket Kids)	8	14	11	15	36.77	27	2026-04-25 10:25:09	2026-04-25 10:25:09
596	Pijama Formal Azul (C&A Kids)	16	15	1	19	95.98	7	2026-04-25 10:25:09	2026-04-25 10:25:09
597	Bermuda Listrado Rosa (Disney Kids)	20	1	2	9	52.71	13	2026-04-25 10:25:09	2026-04-25 10:25:09
598	Casaco Fit Rosa Choque (Marisol)	14	9	10	9	87.38	21	2026-04-25 10:25:09	2026-04-25 10:25:09
599	Camiseta Floral Prata (Maria Filó Kids)	15	8	18	8	45.59	20	2026-04-25 10:25:09	2026-04-25 10:25:09
600	Camisa Toy Store Branco(a) (Brandille)	30	7	4	5	13.35	5	2026-04-25 10:25:09	2026-04-25 10:25:09
601	Calça Temático(a) Rosa Choque (C&A Baby)	29	5	10	3	62.49	6	2026-04-25 10:25:09	2026-04-25 10:25:09
602	Vestido Casual Amarelo(a) (Lilica Ripilica)	5	21	7	8	104.82	19	2026-04-25 10:25:09	2026-04-25 10:25:09
603	Camisa Ajustável Azul Escuro(a) (Conjunto Infantil)	1	7	9	17	52.70	10	2026-04-25 10:25:09	2026-04-25 10:25:09
604	Saia Labubu Bege (Boboi)	18	16	14	7	114.56	4	2026-04-25 10:25:09	2026-04-25 10:25:09
605	Short Saja Rosa (Zoe Kids)	26	17	2	14	68.20	31	2026-04-25 10:25:09	2026-04-25 10:25:09
606	Biquine Respirável Turquesa (Akazys)	25	2	15	4	47.90	2	2026-04-25 10:25:09	2026-04-25 10:25:09
607	Cueca Elástico(a) Cinza (Boboi)	11	10	8	3	35.09	4	2026-04-25 10:25:09	2026-04-25 10:25:09
608	Macacão Ajustável Cinza (Salsa Jeans Kids)	1	12	8	14	13.61	30	2026-04-25 10:25:09	2026-04-25 10:25:09
609	Cueca Seda Roxo(a) (Conjunto Infantil)	27	10	12	9	95.92	10	2026-04-25 10:25:09	2026-04-25 10:25:09
610	Macacão Moleton Bege (Riachuelo Kids)	23	12	14	13	32.82	29	2026-04-25 10:25:09	2026-04-25 10:25:09
611	Vestido Clássico(a) Branco(a) (Osklen Kids)	6	21	4	19	11.41	24	2026-04-25 10:25:09	2026-04-25 10:25:09
612	Pijama Colorido(a) Branco(a) (Carters)	7	15	4	4	42.32	8	2026-04-25 10:25:09	2026-04-25 10:25:09
613	Top Ajustável Prata (Kily)	1	20	18	18	54.68	17	2026-04-25 10:25:09	2026-04-25 10:25:09
614	Calça Stitch Vermelho(a) (Conjunto Infantil)	28	5	6	1	85.60	10	2026-04-25 10:25:09	2026-04-25 10:25:09
615	Jaqueta Poliéster Cinza (Disney Kids)	24	11	8	15	49.37	13	2026-04-25 10:25:09	2026-04-25 10:25:09
616	Short Stitch Branco(a) (C&A Kids)	28	17	4	15	54.06	7	2026-04-25 10:25:09	2026-04-25 10:25:09
617	Blusa Stitch Bege (Farm Kids)	28	3	14	17	24.90	14	2026-04-25 10:25:09	2026-04-25 10:25:09
618	Camiseta Leve Marrom (Akazys)	19	8	13	17	54.74	2	2026-04-25 10:25:09	2026-04-25 10:25:09
619	Calça Ajustável Laranja (Pimpolho)	1	5	11	15	108.03	26	2026-04-25 10:25:09	2026-04-25 10:25:09
620	Maiô Animal Print Prata (Marisol)	3	13	18	13	110.83	21	2026-04-25 10:25:09	2026-04-25 10:25:09
621	Blusa Poliéster Azul (Farm Kids)	24	3	1	17	14.78	14	2026-04-25 10:25:09	2026-04-25 10:25:09
622	Cueca Longa Roxo(a) (Akazys)	21	10	12	8	12.44	2	2026-04-25 10:25:09	2026-04-25 10:25:09
623	Casaco Clássico(a) Lilás (Puket Kids)	6	9	16	19	18.21	27	2026-04-25 10:25:09	2026-04-25 10:25:09
624	Macacão Ajustável Verde (Mundo Pet)	1	12	5	9	115.58	23	2026-04-25 10:25:09	2026-04-25 10:25:09
625	Blusa Loney Tunes Rosa Choque (Marisol)	22	3	10	2	45.23	21	2026-04-25 10:25:09	2026-04-25 10:25:09
626	Pijama Poliéster Marrom (Maria Filó Kids)	24	15	13	10	97.03	20	2026-04-25 10:25:09	2026-04-25 10:25:09
627	Blusa Confortável Branco(a) (Marisol)	8	3	4	14	47.31	21	2026-04-25 10:25:09	2026-04-25 10:25:09
628	Blusa Confortável Turquesa (Farm Kids)	8	3	15	17	94.28	14	2026-04-25 10:25:09	2026-04-25 10:25:09
629	Jaqueta Listrado Rosa Choque (Ki Carinho)	20	11	10	18	53.75	16	2026-04-25 10:25:09	2026-04-25 10:25:09
744	Saia Xadrez Lilás (Akazys)	32	16	16	6	37.06	2	2026-04-25 10:25:09	2026-04-25 10:25:09
630	Calcinha Casual Vinho (Disney Baby)	5	6	19	9	56.26	12	2026-04-25 10:25:09	2026-04-25 10:25:09
631	Maiô Elástico(a) Roxo(a) (Brandille)	11	13	12	7	73.44	5	2026-04-25 10:25:09	2026-04-25 10:25:09
632	Macacão Colorido(a) Cinza (Boboi)	7	12	8	3	40.32	4	2026-04-25 10:25:09	2026-04-25 10:25:09
633	Meia Elástico(a) Dourado(a) (Disney Baby)	11	14	17	4	89.55	12	2026-04-25 10:25:09	2026-04-25 10:25:09
634	Blusa Saja Preto(a) (C&A Kids)	26	3	3	17	14.97	7	2026-04-25 10:25:09	2026-04-25 10:25:09
635	Camiseta Turma da Mônica Vinho (Akazys)	31	8	19	10	113.05	2	2026-04-25 10:25:09	2026-04-25 10:25:09
636	Top Labubu Laranja (Kily)	18	20	11	2	71.42	17	2026-04-25 10:25:09	2026-04-25 10:25:09
637	Bermuda Temático(a) Turquesa (Disney Baby)	29	1	15	6	88.10	12	2026-04-25 10:25:09	2026-04-25 10:25:09
638	Sutiã Respirável Bege (Adidas Kids)	25	19	14	13	85.20	1	2026-04-25 10:25:09	2026-04-25 10:25:09
639	Bermuda Seda Bege (Petit Royal)	27	1	14	14	20.50	25	2026-04-25 10:25:09	2026-04-25 10:25:09
640	Pijama Respirável Marrom (Mundo Infantil)	25	15	13	3	58.69	22	2026-04-25 10:25:09	2026-04-25 10:25:09
641	Sunga Loney Tunes Verde (C&A Baby)	22	18	5	15	60.71	6	2026-04-25 10:25:09	2026-04-25 10:25:09
642	Camisa Turma da Mônica Laranja (Pimpolho)	31	7	11	17	42.45	26	2026-04-25 10:25:09	2026-04-25 10:25:09
643	Maiô Labubu Vermelho(a) (Osklen Kids)	18	13	6	19	101.41	24	2026-04-25 10:25:09	2026-04-25 10:25:09
644	Top Poliéster Preto(a) (Lilica Ripilica)	24	20	3	3	64.47	19	2026-04-25 10:25:09	2026-04-25 10:25:09
645	Short Clássico(a) Lilás (Ki Carinho)	6	17	16	12	43.44	16	2026-04-25 10:25:09	2026-04-25 10:25:09
646	Calça Clássico(a) Branco(a) (Farm Kids)	6	5	4	9	72.18	14	2026-04-25 10:25:09	2026-04-25 10:25:09
647	Meia Toy Store Dourado(a) (Brandille)	30	14	17	14	88.01	5	2026-04-25 10:25:09	2026-04-25 10:25:09
648	Camisa Respirável Vermelho(a) (Conjunto Infantil)	25	7	6	10	57.02	10	2026-04-25 10:25:09	2026-04-25 10:25:09
649	Biquine Durável Cinza (Pimpolho)	10	2	8	18	17.53	26	2026-04-25 10:25:09	2026-04-25 10:25:09
650	Calça Turma da Mônica Branco(a) (Carters)	31	5	4	1	46.68	8	2026-04-25 10:25:09	2026-04-25 10:25:09
651	Cueca Estampado(a) Rosa Choque (Akazys)	13	10	10	5	35.35	2	2026-04-25 10:25:09	2026-04-25 10:25:09
652	Bermuda Xadrez Rosa Choque (Disney Kids)	32	1	10	16	73.76	13	2026-04-25 10:25:09	2026-04-25 10:25:09
653	Blusa Longa Cáqui (Dafiti Kids)	21	3	20	4	104.80	11	2026-04-25 10:25:09	2026-04-25 10:25:09
654	Vestido Básico(a) Preto(a) (Petit Royal)	4	21	3	18	51.80	25	2026-04-25 10:25:09	2026-04-25 10:25:09
655	Saia Curto(a) Preto(a) (Boboi)	9	16	3	1	46.31	4	2026-04-25 10:25:09	2026-04-25 10:25:09
656	Cueca Ajustável Turquesa (Salsa Jeans Kids)	1	10	15	6	118.75	30	2026-04-25 10:25:09	2026-04-25 10:25:09
657	Macacão Jeans Verde (Dafiti Kids)	17	12	5	10	114.42	11	2026-04-25 10:25:09	2026-04-25 10:25:09
658	Cueca Labubu Preto(a) (Boboi)	18	10	3	6	34.49	4	2026-04-25 10:25:09	2026-04-25 10:25:09
659	Top Floral Dourado(a) (Lacoste Kids)	15	20	17	3	105.78	18	2026-04-25 10:25:09	2026-04-25 10:25:09
660	Meia Colorido(a) Rosa (Lacoste Kids)	7	14	2	15	50.80	18	2026-04-25 10:25:09	2026-04-25 10:25:09
661	Calça Longa Laranja (Adidas Kids)	21	5	11	11	98.72	1	2026-04-25 10:25:09	2026-04-25 10:25:09
662	Macacão Respirável Verde (Bendita Cute)	25	12	5	2	74.08	3	2026-04-25 10:25:09	2026-04-25 10:25:09
663	Calça Xadrez Preto(a) (Petit Royal)	32	5	3	18	10.55	25	2026-04-25 10:25:09	2026-04-25 10:25:09
664	Meia Respirável Marrom (Kily)	25	14	13	19	55.05	17	2026-04-25 10:25:09	2026-04-25 10:25:09
665	Saia Elástico(a) Azul (Marisol)	11	16	1	15	102.69	21	2026-04-25 10:25:09	2026-04-25 10:25:09
666	Casaco Seda Laranja (Marisol)	27	9	11	14	59.49	21	2026-04-25 10:25:09	2026-04-25 10:25:09
667	Cueca Poliéster Dourado(a) (Bendita Cute)	24	10	17	18	88.49	3	2026-04-25 10:25:09	2026-04-25 10:25:09
668	Camiseta Ajustável Preto(a) (C&A Kids)	1	8	3	15	91.41	7	2026-04-25 10:25:09	2026-04-25 10:25:09
669	Calça Longa Preto(a) (Petit Royal)	21	5	3	8	87.88	25	2026-04-25 10:25:09	2026-04-25 10:25:09
670	Macacão Labubu Lilás (C&A Kids)	18	12	16	14	93.69	7	2026-04-25 10:25:09	2026-04-25 10:25:09
671	Top Esportivo(a) Bege (C&A Kids)	12	20	14	14	37.49	7	2026-04-25 10:25:09	2026-04-25 10:25:09
672	Calcinha Poliéster Dourado(a) (Renner Kids)	24	6	17	14	71.78	28	2026-04-25 10:25:09	2026-04-25 10:25:09
673	Saia Animal Print Marrom (Zoe Kids)	3	16	13	17	37.63	31	2026-04-25 10:25:09	2026-04-25 10:25:09
674	Macacão Formal Cinza (Mundo Infantil)	16	12	8	11	101.29	22	2026-04-25 10:25:09	2026-04-25 10:25:09
675	Cueca Confortável Rosa Choque (Brandille)	8	10	10	8	15.23	5	2026-04-25 10:25:09	2026-04-25 10:25:09
676	Saia Elástico(a) Prata (Hering Kids)	11	16	18	16	54.88	15	2026-04-25 10:25:09	2026-04-25 10:25:09
677	Pijama Stitch Cinza (Mundo Pet)	28	15	8	15	93.13	23	2026-04-25 10:25:09	2026-04-25 10:25:09
678	Maiô Ajustável Azul Escuro(a) (Brandille)	1	13	9	18	34.82	5	2026-04-25 10:25:09	2026-04-25 10:25:09
679	Pijama Longa Bege (Dafiti Kids)	21	15	14	8	66.57	11	2026-04-25 10:25:09	2026-04-25 10:25:09
680	Camiseta Clássico(a) Roxo(a) (Colcci Kids)	6	8	12	17	109.54	9	2026-04-25 10:25:09	2026-04-25 10:25:09
681	Calcinha Ajustável Cinza (Pimpolho)	1	6	8	8	34.83	26	2026-04-25 10:25:09	2026-04-25 10:25:09
682	Calça Listrado Laranja (Ki Carinho)	20	5	11	17	73.41	16	2026-04-25 10:25:09	2026-04-25 10:25:09
683	Blusa Xadrez Lilás (Riachuelo Kids)	32	3	16	12	65.35	29	2026-04-25 10:25:09	2026-04-25 10:25:09
684	Saia Temático(a) Dourado(a) (Dafiti Kids)	29	16	17	3	51.91	11	2026-04-25 10:25:09	2026-04-25 10:25:09
685	Top Saja Verde (Salsa Jeans Kids)	26	20	5	18	31.36	30	2026-04-25 10:25:09	2026-04-25 10:25:09
686	Sutiã Turma da Mônica Amarelo(a) (C&A Kids)	31	19	7	4	117.97	7	2026-04-25 10:25:09	2026-04-25 10:25:09
687	Vestido Esportivo(a) Cinza (Kily)	12	21	8	6	91.32	17	2026-04-25 10:25:09	2026-04-25 10:25:09
688	Jaqueta Seda Rosa Choque (Hering Kids)	27	11	10	3	42.70	15	2026-04-25 10:25:09	2026-04-25 10:25:09
689	Calça Stitch Amarelo(a) (Puket Kids)	28	5	7	12	91.11	27	2026-04-25 10:25:09	2026-04-25 10:25:09
690	Camiseta Estampado(a) Laranja (Boboi)	13	8	11	13	108.34	4	2026-04-25 10:25:09	2026-04-25 10:25:09
691	Pijama Moleton Rosa (Farm Kids)	23	15	2	6	97.20	14	2026-04-25 10:25:09	2026-04-25 10:25:09
692	Jaqueta Poliéster Lilás (Brandille)	24	11	16	19	30.89	5	2026-04-25 10:25:09	2026-04-25 10:25:09
693	Camisa Animal Print Verde (Boboi)	3	7	5	6	24.25	4	2026-04-25 10:25:09	2026-04-25 10:25:09
694	Vestido Formal Laranja (Renner Kids)	16	21	11	7	40.31	28	2026-04-25 10:25:09	2026-04-25 10:25:09
695	Calça Casual Lilás (Maria Filó Kids)	5	5	16	10	38.40	20	2026-04-25 10:25:09	2026-04-25 10:25:09
696	Calça Toy Store Dourado(a) (Maria Filó Kids)	30	5	17	13	63.64	20	2026-04-25 10:25:09	2026-04-25 10:25:09
697	Calça Xadrez Rosa Choque (Conjunto Infantil)	32	5	10	9	33.21	10	2026-04-25 10:25:09	2026-04-25 10:25:09
698	Short Formal Cinza (Brandille)	16	17	8	16	119.05	5	2026-04-25 10:25:09	2026-04-25 10:25:09
699	Calçado Estampado(a) Amarelo(a) (Pimpolho)	13	4	7	8	119.21	26	2026-04-25 10:25:09	2026-04-25 10:25:09
700	Meia Turma da Mônica Azul Escuro(a) (Boboi)	31	14	9	4	49.33	4	2026-04-25 10:25:09	2026-04-25 10:25:09
701	Macacão Toy Store Preto(a) (Zoe Kids)	30	12	3	3	100.58	31	2026-04-25 10:25:09	2026-04-25 10:25:09
702	Calçado Esportivo(a) Azul (Hering Kids)	12	4	1	9	60.82	15	2026-04-25 10:25:09	2026-04-25 10:25:09
703	Macacão Turma da Mônica Branco(a) (Hering Kids)	31	12	4	5	104.65	15	2026-04-25 10:25:09	2026-04-25 10:25:09
704	Calcinha Turma da Mônica Vermelho(a) (Boboi)	31	6	6	4	116.90	4	2026-04-25 10:25:09	2026-04-25 10:25:09
705	Cueca Ajustável Azul Escuro(a) (Disney Kids)	1	10	9	2	83.21	13	2026-04-25 10:25:09	2026-04-25 10:25:09
706	Short Xadrez Lilás (Disney Baby)	32	17	16	11	106.22	12	2026-04-25 10:25:09	2026-04-25 10:25:09
707	Jaqueta Saja Cinza (Dafiti Kids)	26	11	8	3	81.96	11	2026-04-25 10:25:09	2026-04-25 10:25:09
708	Macacão Poliéster Cinza (Dafiti Kids)	24	12	8	5	58.03	11	2026-04-25 10:25:09	2026-04-25 10:25:09
709	Vestido Xadrez Azul Escuro(a) (Brandille)	32	21	9	10	66.21	5	2026-04-25 10:25:09	2026-04-25 10:25:09
710	Blusa Turma da Mônica Amarelo(a) (C&A Kids)	31	3	7	6	94.34	7	2026-04-25 10:25:09	2026-04-25 10:25:09
711	Saia Seda Laranja (Adidas Kids)	27	16	11	3	91.98	1	2026-04-25 10:25:09	2026-04-25 10:25:09
712	Blusa Temático(a) Vinho (Adidas Kids)	29	3	19	16	74.13	1	2026-04-25 10:25:09	2026-04-25 10:25:09
713	Biquine Formal Dourado(a) (Mundo Pet)	16	2	17	19	46.84	23	2026-04-25 10:25:09	2026-04-25 10:25:09
714	Cueca Poliéster Azul Escuro(a) (Boboi)	24	10	9	16	98.59	4	2026-04-25 10:25:09	2026-04-25 10:25:09
715	Camisa Básico(a) Azul (Hering Kids)	4	7	1	13	61.01	15	2026-04-25 10:25:09	2026-04-25 10:25:09
716	Pijama Curto(a) Verde (Colcci Kids)	9	15	5	3	117.94	9	2026-04-25 10:25:09	2026-04-25 10:25:09
717	Top Labubu Dourado(a) (Renner Kids)	18	20	17	3	14.82	28	2026-04-25 10:25:09	2026-04-25 10:25:09
718	Sunga Longa Verde (Hering Kids)	21	18	5	10	15.80	15	2026-04-25 10:25:09	2026-04-25 10:25:09
719	Macacão Xadrez Turquesa (Mundo Infantil)	32	12	15	2	22.78	22	2026-04-25 10:25:09	2026-04-25 10:25:09
720	Meia Labubu Roxo(a) (Pimpolho)	18	14	12	10	87.46	26	2026-04-25 10:25:09	2026-04-25 10:25:09
721	Blusa Longa Verde (Dafiti Kids)	21	3	5	19	34.98	11	2026-04-25 10:25:09	2026-04-25 10:25:09
722	Vestido Básico(a) Vinho (Osklen Kids)	4	21	19	7	86.87	24	2026-04-25 10:25:09	2026-04-25 10:25:09
723	Sunga Saja Amarelo(a) (C&A Kids)	26	18	7	1	65.33	7	2026-04-25 10:25:09	2026-04-25 10:25:09
724	Casaco Stitch Bege (Colcci Kids)	28	9	14	16	83.30	9	2026-04-25 10:25:09	2026-04-25 10:25:09
725	Calça Loney Tunes Verde (Salsa Jeans Kids)	22	5	5	16	17.34	30	2026-04-25 10:25:09	2026-04-25 10:25:09
726	Calçado Algodão Dourado(a) (Lilica Ripilica)	2	4	17	8	75.40	19	2026-04-25 10:25:09	2026-04-25 10:25:09
727	Bermuda Moleton Preto(a) (Hering Kids)	23	1	3	16	98.77	15	2026-04-25 10:25:09	2026-04-25 10:25:09
728	Sunga Poliéster Vermelho(a) (Carters)	24	18	6	17	68.57	8	2026-04-25 10:25:09	2026-04-25 10:25:09
729	Meia Confortável Dourado(a) (Disney Kids)	8	14	17	9	37.03	13	2026-04-25 10:25:09	2026-04-25 10:25:09
730	Calçado Listrado Rosa (Akazys)	20	4	2	6	113.16	2	2026-04-25 10:25:09	2026-04-25 10:25:09
731	Maiô Saja Rosa (C&A Baby)	26	13	2	19	82.42	6	2026-04-25 10:25:09	2026-04-25 10:25:09
732	Casaco Labubu Amarelo(a) (Lilica Ripilica)	18	9	7	7	72.59	19	2026-04-25 10:25:09	2026-04-25 10:25:09
733	Biquine Seda Vinho (Mundo Infantil)	27	2	19	19	74.55	22	2026-04-25 10:25:09	2026-04-25 10:25:09
734	Pijama Durável Verde (Ki Carinho)	10	15	5	12	94.09	16	2026-04-25 10:25:09	2026-04-25 10:25:09
735	Calcinha Poliéster Azul (Brandille)	24	6	1	18	102.75	5	2026-04-25 10:25:09	2026-04-25 10:25:09
736	Calça Saja Roxo(a) (Disney Baby)	26	5	12	12	42.44	12	2026-04-25 10:25:09	2026-04-25 10:25:09
737	Calçado Poliéster Roxo(a) (Disney Kids)	24	4	12	14	113.63	13	2026-04-25 10:25:09	2026-04-25 10:25:09
738	Camiseta Turma da Mônica Verde (Mundo Infantil)	31	8	5	7	68.83	22	2026-04-25 10:25:09	2026-04-25 10:25:09
739	Macacão Toy Store Cinza (Hering Kids)	30	12	8	5	59.05	15	2026-04-25 10:25:09	2026-04-25 10:25:09
740	Calçado Algodão Vinho (Zoe Kids)	2	4	19	5	21.38	31	2026-04-25 10:25:09	2026-04-25 10:25:09
741	Macacão Formal Branco(a) (Marisol)	16	12	4	5	11.71	21	2026-04-25 10:25:09	2026-04-25 10:25:09
742	Maiô Básico(a) Marrom (Hering Kids)	4	13	13	3	23.97	15	2026-04-25 10:25:09	2026-04-25 10:25:09
743	Blusa Xadrez Azul (Disney Baby)	32	3	1	16	13.54	12	2026-04-25 10:25:09	2026-04-25 10:25:09
745	Calçado Algodão Prata (Maria Filó Kids)	2	4	18	16	60.34	20	2026-04-25 10:25:09	2026-04-25 10:25:09
746	Maiô Formal Roxo(a) (Mundo Pet)	16	13	12	7	18.52	23	2026-04-25 10:25:09	2026-04-25 10:25:09
747	Sunga Seda Laranja (Riachuelo Kids)	27	18	11	5	33.12	29	2026-04-25 10:25:09	2026-04-25 10:25:09
748	Jaqueta Durável Prata (Adidas Kids)	10	11	18	13	37.22	1	2026-04-25 10:25:09	2026-04-25 10:25:09
749	Pijama Esportivo(a) Branco(a) (Mundo Pet)	12	15	4	19	25.01	23	2026-04-25 10:25:09	2026-04-25 10:25:09
750	Sutiã Clássico(a) Prata (Ki Carinho)	6	19	18	9	64.44	16	2026-04-25 10:25:09	2026-04-25 10:25:09
751	Macacão Colorido(a) Azul (Farm Kids)	7	12	1	6	40.65	14	2026-04-25 10:25:09	2026-04-25 10:25:09
752	Cueca Leve Dourado(a) (Mundo Infantil)	19	10	17	5	111.34	22	2026-04-25 10:25:09	2026-04-25 10:25:09
753	Camisa Básico(a) Laranja (C&A Baby)	4	7	11	16	77.62	6	2026-04-25 10:25:09	2026-04-25 10:25:09
754	Jaqueta Temático(a) Laranja (Riachuelo Kids)	29	11	11	4	28.09	29	2026-04-25 10:25:09	2026-04-25 10:25:09
755	Top Temático(a) Dourado(a) (Kily)	29	20	17	14	12.71	17	2026-04-25 10:25:09	2026-04-25 10:25:09
756	Vestido Listrado Dourado(a) (Pimpolho)	20	21	17	19	42.04	26	2026-04-25 10:25:09	2026-04-25 10:25:09
757	Calçado Turma da Mônica Cáqui (Bendita Cute)	31	4	20	8	114.21	3	2026-04-25 10:25:09	2026-04-25 10:25:09
758	Cueca Básico(a) Azul Escuro(a) (Adidas Kids)	4	10	9	19	60.54	1	2026-04-25 10:25:09	2026-04-25 10:25:09
759	Meia Colorido(a) Lilás (Petit Royal)	7	14	16	2	74.03	25	2026-04-25 10:25:09	2026-04-25 10:25:09
760	Macacão Confortável Rosa Choque (Maria Filó Kids)	8	12	10	13	27.70	20	2026-04-25 10:25:09	2026-04-25 10:25:09
761	Sutiã Temático(a) Preto(a) (Lilica Ripilica)	29	19	3	18	64.03	19	2026-04-25 10:25:09	2026-04-25 10:25:09
762	Calçado Esportivo(a) Cáqui (Osklen Kids)	12	4	20	12	90.35	24	2026-04-25 10:25:09	2026-04-25 10:25:09
763	Calça Durável Cáqui (Adidas Kids)	10	5	20	16	74.91	1	2026-04-25 10:25:09	2026-04-25 10:25:09
764	Pijama Xadrez Branco(a) (Mundo Pet)	32	15	4	14	82.10	23	2026-04-25 10:25:09	2026-04-25 10:25:09
765	Top Ajustável Rosa (Ki Carinho)	1	20	2	11	59.54	16	2026-04-25 10:25:09	2026-04-25 10:25:09
766	Blusa Estampado(a) Marrom (Petit Royal)	13	3	13	1	37.84	25	2026-04-25 10:25:09	2026-04-25 10:25:09
767	Casaco Loney Tunes Amarelo(a) (Salsa Jeans Kids)	22	9	7	7	49.25	30	2026-04-25 10:25:09	2026-04-25 10:25:09
768	Jaqueta Casual Rosa Choque (Bendita Cute)	5	11	10	9	86.37	3	2026-04-25 10:25:09	2026-04-25 10:25:09
769	Short Floral Marrom (Akazys)	15	17	13	7	118.70	2	2026-04-25 10:25:09	2026-04-25 10:25:09
770	Camiseta Turma da Mônica Turquesa (Brandille)	31	8	15	15	54.37	5	2026-04-25 10:25:09	2026-04-25 10:25:09
771	Camisa Elástico(a) Branco(a) (Riachuelo Kids)	11	7	4	17	36.04	29	2026-04-25 10:25:09	2026-04-25 10:25:09
772	Macacão Floral Preto(a) (Boboi)	15	12	3	18	23.00	4	2026-04-25 10:25:09	2026-04-25 10:25:09
773	Sunga Turma da Mônica Turquesa (Pimpolho)	31	18	15	6	18.26	26	2026-04-25 10:25:09	2026-04-25 10:25:09
774	Casaco Moleton Laranja (Brandille)	23	9	11	12	55.98	5	2026-04-25 10:25:09	2026-04-25 10:25:09
775	Sunga Elástico(a) Rosa Choque (Disney Kids)	11	18	10	18	18.72	13	2026-04-25 10:25:09	2026-04-25 10:25:09
776	Maiô Loney Tunes Rosa (Conjunto Infantil)	22	13	2	13	62.61	10	2026-04-25 10:25:09	2026-04-25 10:25:09
777	Blusa Algodão Roxo(a) (Mundo Infantil)	2	3	12	11	85.96	22	2026-04-25 10:25:09	2026-04-25 10:25:09
778	Short Colorido(a) Preto(a) (Brandille)	7	17	3	7	101.62	5	2026-04-25 10:25:09	2026-04-25 10:25:09
779	Top Seda Lilás (Adidas Kids)	27	20	16	10	54.46	1	2026-04-25 10:25:09	2026-04-25 10:25:09
780	Sutiã Leve Bege (Disney Kids)	19	19	14	9	118.08	13	2026-04-25 10:25:09	2026-04-25 10:25:09
781	Pijama Curto(a) Amarelo(a) (Conjunto Infantil)	9	15	7	2	32.57	10	2026-04-25 10:25:09	2026-04-25 10:25:09
782	Blusa Fit Vinho (Mundo Pet)	14	3	19	6	90.03	23	2026-04-25 10:25:09	2026-04-25 10:25:09
783	Cueca Fit Amarelo(a) (Farm Kids)	14	10	7	13	95.51	14	2026-04-25 10:25:09	2026-04-25 10:25:09
784	Biquine Moleton Prata (Conjunto Infantil)	23	2	18	8	57.07	10	2026-04-25 10:25:09	2026-04-25 10:25:09
785	Vestido Temático(a) Lilás (Disney Baby)	29	21	16	9	30.56	12	2026-04-25 10:25:09	2026-04-25 10:25:09
786	Camiseta Saja Rosa (C&A Kids)	26	8	2	16	18.13	7	2026-04-25 10:25:09	2026-04-25 10:25:09
787	Calça Animal Print Turquesa (Kily)	3	5	15	13	107.94	17	2026-04-25 10:25:09	2026-04-25 10:25:09
788	Blusa Xadrez Preto(a) (Disney Baby)	32	3	3	6	20.00	12	2026-04-25 10:25:09	2026-04-25 10:25:09
789	Casaco Xadrez Prata (Disney Baby)	32	9	18	16	104.47	12	2026-04-25 10:25:09	2026-04-25 10:25:09
790	Pijama Poliéster Vinho (Disney Baby)	24	15	19	5	78.51	12	2026-04-25 10:25:09	2026-04-25 10:25:09
791	Calçado Formal Vermelho(a) (Marisol)	16	4	6	13	100.88	21	2026-04-25 10:25:09	2026-04-25 10:25:09
792	Saia Toy Store Turquesa (Brandille)	30	16	15	10	74.19	5	2026-04-25 10:25:09	2026-04-25 10:25:09
793	Jaqueta Turma da Mônica Laranja (Pimpolho)	31	11	11	11	70.65	26	2026-04-25 10:25:09	2026-04-25 10:25:09
794	Camisa Turma da Mônica Lilás (Kily)	31	7	16	2	91.86	17	2026-04-25 10:25:09	2026-04-25 10:25:09
795	Blusa Moleton Vermelho(a) (Colcci Kids)	23	3	6	13	29.16	9	2026-04-25 10:25:09	2026-04-25 10:25:09
796	Camiseta Respirável Dourado(a) (Lacoste Kids)	25	8	17	13	94.08	18	2026-04-25 10:25:09	2026-04-25 10:25:09
797	Short Clássico(a) Bege (Zoe Kids)	6	17	14	6	105.74	31	2026-04-25 10:25:09	2026-04-25 10:25:09
798	Pijama Curto(a) Azul (Boboi)	9	15	1	12	80.83	4	2026-04-25 10:25:09	2026-04-25 10:25:09
799	Calça Formal Branco(a) (Farm Kids)	16	5	4	6	29.84	14	2026-04-25 10:25:09	2026-04-25 10:25:09
800	Meia Estampado(a) Cinza (Lacoste Kids)	13	14	8	3	39.23	18	2026-04-25 10:25:09	2026-04-25 10:25:09
801	Biquine Floral Prata (Maria Filó Kids)	15	2	18	14	21.33	20	2026-04-25 10:25:09	2026-04-25 10:25:09
802	Saia Leve Cinza (Osklen Kids)	19	16	8	11	15.70	24	2026-04-25 10:25:09	2026-04-25 10:25:09
803	Calçado Formal Rosa (Pimpolho)	16	4	2	11	119.47	26	2026-04-25 10:25:09	2026-04-25 10:25:09
804	Pijama Animal Print Cáqui (Marisol)	3	15	20	16	81.38	21	2026-04-25 10:25:09	2026-04-25 10:25:09
805	Meia Temático(a) Branco(a) (Akazys)	29	14	4	11	10.81	2	2026-04-25 10:25:09	2026-04-25 10:25:09
806	Blusa Seda Cinza (Osklen Kids)	27	3	8	16	60.03	24	2026-04-25 10:25:09	2026-04-25 10:25:09
807	Saia Poliéster Azul (Adidas Kids)	24	16	1	2	53.03	1	2026-04-25 10:25:09	2026-04-25 10:25:09
808	Pijama Listrado Cáqui (Marisol)	20	15	20	18	80.60	21	2026-04-25 10:25:09	2026-04-25 10:25:09
809	Sunga Algodão Laranja (Renner Kids)	2	18	11	6	44.96	28	2026-04-25 10:25:09	2026-04-25 10:25:09
810	Bermuda Curto(a) Marrom (C&A Kids)	9	1	13	2	69.87	7	2026-04-25 10:25:09	2026-04-25 10:25:09
811	Camisa Esportivo(a) Azul (C&A Kids)	12	7	1	16	41.99	7	2026-04-25 10:25:09	2026-04-25 10:25:09
812	Camiseta Jeans Lilás (C&A Kids)	17	8	16	13	73.10	7	2026-04-25 10:25:09	2026-04-25 10:25:09
813	Casaco Ajustável Amarelo(a) (Dafiti Kids)	1	9	7	2	54.60	11	2026-04-25 10:25:09	2026-04-25 10:25:09
814	Sutiã Clássico(a) Amarelo(a) (Lacoste Kids)	6	19	7	2	16.69	18	2026-04-25 10:25:09	2026-04-25 10:25:09
815	Cueca Respirável Turquesa (Akazys)	25	10	15	5	32.75	2	2026-04-25 10:25:09	2026-04-25 10:25:09
816	Saia Curto(a) Branco(a) (Hering Kids)	9	16	4	5	20.96	15	2026-04-25 10:25:09	2026-04-25 10:25:09
817	Short Moleton Rosa (Pimpolho)	23	17	2	5	108.54	26	2026-04-25 10:25:09	2026-04-25 10:25:09
818	Cueca Elástico(a) Vermelho(a) (Adidas Kids)	11	10	6	5	34.33	1	2026-04-25 10:25:09	2026-04-25 10:25:09
819	Sutiã Esportivo(a) Amarelo(a) (Mundo Pet)	12	19	7	1	107.16	23	2026-04-25 10:25:09	2026-04-25 10:25:09
820	Calçado Confortável Dourado(a) (Carters)	8	4	17	3	99.40	8	2026-04-25 10:25:09	2026-04-25 10:25:09
821	Jaqueta Stitch Vermelho(a) (Bendita Cute)	28	11	6	1	46.38	3	2026-04-25 10:25:09	2026-04-25 10:25:09
822	Sutiã Confortável Vinho (Colcci Kids)	8	19	19	18	102.76	9	2026-04-25 10:25:09	2026-04-25 10:25:09
823	Casaco Animal Print Rosa Choque (Kily)	3	9	10	10	18.44	17	2026-04-25 10:25:09	2026-04-25 10:25:09
824	Saia Listrado Turquesa (Lilica Ripilica)	20	16	15	13	64.45	19	2026-04-25 10:25:09	2026-04-25 10:25:09
825	Cueca Durável Cinza (Farm Kids)	10	10	8	17	84.73	14	2026-04-25 10:25:09	2026-04-25 10:25:09
826	Pijama Confortável Rosa (Salsa Jeans Kids)	8	15	2	8	19.88	30	2026-04-25 10:25:09	2026-04-25 10:25:09
827	Camiseta Floral Prata (Boboi)	15	8	18	9	73.57	4	2026-04-25 10:25:09	2026-04-25 10:25:09
828	Sutiã Longa Marrom (Farm Kids)	21	19	13	6	71.85	14	2026-04-25 10:25:09	2026-04-25 10:25:09
829	Calça Fit Turquesa (Pimpolho)	14	5	15	13	69.57	26	2026-04-25 10:25:09	2026-04-25 10:25:09
830	Meia Estampado(a) Prata (C&A Kids)	13	14	18	1	15.79	7	2026-04-25 10:25:09	2026-04-25 10:25:09
831	Vestido Moleton Lilás (Mundo Infantil)	23	21	16	2	66.90	22	2026-04-25 10:25:09	2026-04-25 10:25:09
832	Saia Turma da Mônica Prata (Bendita Cute)	31	16	18	5	13.61	3	2026-04-25 10:25:09	2026-04-25 10:25:09
833	Camisa Floral Cáqui (Carters)	15	7	20	15	33.88	8	2026-04-25 10:25:09	2026-04-25 10:25:09
834	Camisa Labubu Marrom (Osklen Kids)	18	7	13	14	110.54	24	2026-04-25 10:25:09	2026-04-25 10:25:09
835	Cueca Loney Tunes Verde (Kily)	22	10	5	12	102.70	17	2026-04-25 10:25:09	2026-04-25 10:25:09
836	Macacão Toy Store Roxo(a) (C&A Baby)	30	12	12	3	61.35	6	2026-04-25 10:25:09	2026-04-25 10:25:09
837	Camiseta Ajustável Roxo(a) (Colcci Kids)	1	8	12	4	12.66	9	2026-04-25 10:25:09	2026-04-25 10:25:09
838	Maiô Fit Verde (Akazys)	14	13	5	8	41.48	2	2026-04-25 10:25:09	2026-04-25 10:25:09
839	Casaco Seda Verde (Mundo Infantil)	27	9	5	19	38.99	22	2026-04-25 10:25:09	2026-04-25 10:25:09
840	Top Seda Preto(a) (Brandille)	27	20	3	17	13.58	5	2026-04-25 10:25:09	2026-04-25 10:25:09
841	Top Loney Tunes Roxo(a) (Petit Royal)	22	20	12	6	74.48	25	2026-04-25 10:25:09	2026-04-25 10:25:09
842	Sunga Listrado Preto(a) (Osklen Kids)	20	18	3	14	99.20	24	2026-04-25 10:25:09	2026-04-25 10:25:09
843	Cueca Moleton Cinza (Akazys)	23	10	8	12	30.29	2	2026-04-25 10:25:09	2026-04-25 10:25:09
844	Meia Confortável Preto(a) (Bendita Cute)	8	14	3	12	72.60	3	2026-04-25 10:25:09	2026-04-25 10:25:09
845	Calcinha Xadrez Azul (Adidas Kids)	32	6	1	2	15.59	1	2026-04-25 10:25:09	2026-04-25 10:25:09
846	Casaco Loney Tunes Prata (Riachuelo Kids)	22	9	18	6	111.60	29	2026-04-25 10:25:09	2026-04-25 10:25:09
847	Sutiã Labubu Vermelho(a) (Zoe Kids)	18	19	6	16	34.75	31	2026-04-25 10:25:09	2026-04-25 10:25:09
848	Top Casual Roxo(a) (Maria Filó Kids)	5	20	12	5	60.82	20	2026-04-25 10:25:09	2026-04-25 10:25:09
849	Top Moleton Azul (Pimpolho)	23	20	1	16	24.27	26	2026-04-25 10:25:09	2026-04-25 10:25:09
850	Macacão Curto(a) Prata (Hering Kids)	9	12	18	12	100.50	15	2026-04-25 10:25:09	2026-04-25 10:25:09
851	Macacão Confortável Lilás (Maria Filó Kids)	8	12	16	12	45.37	20	2026-04-25 10:25:09	2026-04-25 10:25:09
852	Biquine Turma da Mônica Roxo(a) (C&A Kids)	31	2	12	19	45.07	7	2026-04-25 10:25:09	2026-04-25 10:25:09
853	Top Moleton Vermelho(a) (Puket Kids)	23	20	6	2	27.57	27	2026-04-25 10:25:09	2026-04-25 10:25:09
854	Blusa Elástico(a) Turquesa (Dafiti Kids)	11	3	15	14	37.22	11	2026-04-25 10:25:09	2026-04-25 10:25:09
855	Pijama Básico(a) Bege (Ki Carinho)	4	15	14	14	58.19	16	2026-04-25 10:25:09	2026-04-25 10:25:09
856	Casaco Stitch Preto(a) (Riachuelo Kids)	28	9	3	3	111.20	29	2026-04-25 10:25:09	2026-04-25 10:25:09
857	Casaco Fit Verde (Dafiti Kids)	14	9	5	10	114.86	11	2026-04-25 10:25:09	2026-04-25 10:25:09
858	Camiseta Poliéster Amarelo(a) (C&A Kids)	24	8	7	14	63.68	7	2026-04-25 10:25:09	2026-04-25 10:25:09
859	Saia Ajustável Azul Escuro(a) (Salsa Jeans Kids)	1	16	9	10	105.89	30	2026-04-25 10:25:09	2026-04-25 10:25:09
860	Pijama Formal Amarelo(a) (Maria Filó Kids)	16	15	7	15	86.72	20	2026-04-25 10:25:09	2026-04-25 10:25:09
861	Sunga Algodão Amarelo(a) (C&A Kids)	2	18	7	5	56.07	7	2026-04-25 10:25:09	2026-04-25 10:25:09
862	Jaqueta Fit Cáqui (Maria Filó Kids)	14	11	20	4	109.98	20	2026-04-25 10:25:09	2026-04-25 10:25:09
863	Top Listrado Azul Escuro(a) (Puket Kids)	20	20	9	6	104.89	27	2026-04-25 10:25:09	2026-04-25 10:25:09
864	Calcinha Clássico(a) Vermelho(a) (Adidas Kids)	6	6	6	11	111.86	1	2026-04-25 10:25:09	2026-04-25 10:25:09
865	Cueca Elástico(a) Lilás (Lilica Ripilica)	11	10	16	1	106.06	19	2026-04-25 10:25:09	2026-04-25 10:25:09
866	Vestido Temático(a) Vermelho(a) (Marisol)	29	21	6	12	63.36	21	2026-04-25 10:25:09	2026-04-25 10:25:09
867	Top Saja Azul Escuro(a) (Renner Kids)	26	20	9	7	118.41	28	2026-04-25 10:25:09	2026-04-25 10:25:09
868	Calcinha Durável Cinza (Pimpolho)	10	6	8	12	62.88	26	2026-04-25 10:25:09	2026-04-25 10:25:09
869	Top Algodão Vermelho(a) (Farm Kids)	2	20	6	8	91.66	14	2026-04-25 10:25:09	2026-04-25 10:25:09
870	Vestido Xadrez Vermelho(a) (C&A Baby)	32	21	6	7	29.14	6	2026-04-25 10:25:09	2026-04-25 10:25:09
871	Macacão Básico(a) Azul Escuro(a) (Zoe Kids)	4	12	9	5	56.41	31	2026-04-25 10:25:09	2026-04-25 10:25:09
872	Bermuda Algodão Preto(a) (Hering Kids)	2	1	3	2	82.45	15	2026-04-25 10:25:09	2026-04-25 10:25:09
873	Cueca Listrado Preto(a) (Bendita Cute)	20	10	3	11	51.11	3	2026-04-25 10:25:09	2026-04-25 10:25:09
874	Vestido Algodão Dourado(a) (Conjunto Infantil)	2	21	17	15	61.49	10	2026-04-25 10:25:09	2026-04-25 10:25:09
875	Bermuda Elástico(a) Cáqui (Maria Filó Kids)	11	1	20	17	58.10	20	2026-04-25 10:25:09	2026-04-25 10:25:09
876	Calça Confortável Vinho (Osklen Kids)	8	5	19	17	54.83	24	2026-04-25 10:25:09	2026-04-25 10:25:09
877	Cueca Loney Tunes Amarelo(a) (Conjunto Infantil)	22	10	7	13	114.72	10	2026-04-25 10:25:09	2026-04-25 10:25:09
878	Casaco Temático(a) Laranja (Conjunto Infantil)	29	9	11	5	57.57	10	2026-04-25 10:25:09	2026-04-25 10:25:09
879	Calçado Listrado Rosa (Lacoste Kids)	20	4	2	11	98.22	18	2026-04-25 10:25:09	2026-04-25 10:25:09
880	Macacão Curto(a) Bege (Disney Baby)	9	12	14	19	55.91	12	2026-04-25 10:25:09	2026-04-25 10:25:09
881	Camisa Respirável Dourado(a) (Maria Filó Kids)	25	7	17	17	13.84	20	2026-04-25 10:25:09	2026-04-25 10:25:09
882	Camiseta Moleton Dourado(a) (Salsa Jeans Kids)	23	8	17	11	89.09	30	2026-04-25 10:25:09	2026-04-25 10:25:09
883	Calcinha Durável Vinho (Petit Royal)	10	6	19	6	33.29	25	2026-04-25 10:25:09	2026-04-25 10:25:09
884	Meia Labubu Dourado(a) (Maria Filó Kids)	18	14	17	16	27.98	20	2026-04-25 10:25:09	2026-04-25 10:25:09
885	Maiô Stitch Azul (Marisol)	28	13	1	8	22.38	21	2026-04-25 10:25:09	2026-04-25 10:25:09
886	Calcinha Jeans Rosa (Lacoste Kids)	17	6	2	14	40.19	18	2026-04-25 10:25:09	2026-04-25 10:25:09
887	Maiô Floral Prata (Maria Filó Kids)	15	13	18	9	28.27	20	2026-04-25 10:25:09	2026-04-25 10:25:09
888	Sutiã Listrado Verde (C&A Baby)	20	19	5	11	98.44	6	2026-04-25 10:25:09	2026-04-25 10:25:09
889	Saia Temático(a) Preto(a) (Salsa Jeans Kids)	29	16	3	4	117.01	30	2026-04-25 10:25:09	2026-04-25 10:25:09
890	Maiô Toy Store Cinza (Renner Kids)	30	13	8	3	19.28	28	2026-04-25 10:25:09	2026-04-25 10:25:09
891	Sutiã Colorido(a) Prata (C&A Baby)	7	19	18	11	27.08	6	2026-04-25 10:25:09	2026-04-25 10:25:09
892	Camisa Jeans Marrom (Colcci Kids)	17	7	13	19	15.15	9	2026-04-25 10:25:09	2026-04-25 10:25:09
893	Short Floral Turquesa (Farm Kids)	15	17	15	11	64.56	14	2026-04-25 10:25:09	2026-04-25 10:25:09
894	Calcinha Leve Bege (Hering Kids)	19	6	14	7	74.38	15	2026-04-25 10:25:09	2026-04-25 10:25:09
895	Sutiã Loney Tunes Verde (Mundo Infantil)	22	19	5	15	77.37	22	2026-04-25 10:25:09	2026-04-25 10:25:09
896	Calçado Ajustável Laranja (Salsa Jeans Kids)	1	4	11	4	107.66	30	2026-04-25 10:25:09	2026-04-25 10:25:09
897	Blusa Toy Store Azul Escuro(a) (Puket Kids)	30	3	9	8	19.74	27	2026-04-25 10:25:09	2026-04-25 10:25:09
898	Pijama Ajustável Rosa (Maria Filó Kids)	1	15	2	2	104.82	20	2026-04-25 10:25:09	2026-04-25 10:25:09
899	Short Poliéster Branco(a) (Boboi)	24	17	4	7	75.70	4	2026-04-25 10:25:09	2026-04-25 10:25:09
900	Saia Clássico(a) Lilás (Lacoste Kids)	6	16	16	15	88.05	18	2026-04-25 10:25:09	2026-04-25 10:25:09
901	Sunga Floral Bege (Dafiti Kids)	15	18	14	8	85.07	11	2026-04-25 10:25:09	2026-04-25 10:25:09
902	Biquine Poliéster Rosa (Petit Royal)	24	2	2	14	10.45	25	2026-04-25 10:25:09	2026-04-25 10:25:09
903	Pijama Algodão Vinho (Farm Kids)	2	15	19	6	85.29	14	2026-04-25 10:25:09	2026-04-25 10:25:09
904	Camiseta Casual Roxo(a) (Lilica Ripilica)	5	8	12	15	106.38	19	2026-04-25 10:25:09	2026-04-25 10:25:09
905	Maiô Xadrez Vermelho(a) (Bendita Cute)	32	13	6	19	34.11	3	2026-04-25 10:25:09	2026-04-25 10:25:09
906	Camiseta Temático(a) Rosa Choque (Carters)	29	8	10	14	97.31	8	2026-04-25 10:25:09	2026-04-25 10:25:09
907	Pijama Estampado(a) Roxo(a) (Adidas Kids)	13	15	12	12	11.78	1	2026-04-25 10:25:09	2026-04-25 10:25:09
908	Calcinha Ajustável Preto(a) (Farm Kids)	1	6	3	2	25.38	14	2026-04-25 10:25:09	2026-04-25 10:25:09
909	Biquine Durável Dourado(a) (Lilica Ripilica)	10	2	17	16	14.75	19	2026-04-25 10:25:09	2026-04-25 10:25:09
910	Camisa Poliéster Verde (Farm Kids)	24	7	5	10	107.33	14	2026-04-25 10:25:09	2026-04-25 10:25:09
911	Maiô Clássico(a) Azul (Lilica Ripilica)	6	13	1	18	78.38	19	2026-04-25 10:25:09	2026-04-25 10:25:09
912	Casaco Listrado Cinza (Salsa Jeans Kids)	20	9	8	7	85.36	30	2026-04-25 10:25:09	2026-04-25 10:25:09
913	Calcinha Xadrez Marrom (Zoe Kids)	32	6	13	14	49.15	31	2026-04-25 10:25:09	2026-04-25 10:25:09
914	Saia Ajustável Rosa (Renner Kids)	1	16	2	13	70.14	28	2026-04-25 10:25:09	2026-04-25 10:25:09
915	Bermuda Esportivo(a) Laranja (Mundo Infantil)	12	1	11	11	71.47	22	2026-04-25 10:25:09	2026-04-25 10:25:09
916	Maiô Ajustável Prata (Renner Kids)	1	13	18	19	51.34	28	2026-04-25 10:25:09	2026-04-25 10:25:09
917	Top Floral Prata (Carters)	15	20	18	10	18.10	8	2026-04-25 10:25:09	2026-04-25 10:25:09
918	Calça Elástico(a) Branco(a) (Salsa Jeans Kids)	11	5	4	16	46.86	30	2026-04-25 10:25:09	2026-04-25 10:25:09
919	Macacão Jeans Laranja (Akazys)	17	12	11	12	35.38	2	2026-04-25 10:25:09	2026-04-25 10:25:09
920	Macacão Moleton Preto(a) (C&A Kids)	23	12	3	1	65.49	7	2026-04-25 10:25:09	2026-04-25 10:25:09
921	Calcinha Toy Store Azul Escuro(a) (Mundo Infantil)	30	6	9	12	104.35	22	2026-04-25 10:25:09	2026-04-25 10:25:09
922	Sunga Casual Marrom (Lacoste Kids)	5	18	13	11	35.70	18	2026-04-25 10:25:09	2026-04-25 10:25:09
923	Calça Animal Print Vermelho(a) (Disney Baby)	3	5	6	8	93.16	12	2026-04-25 10:25:09	2026-04-25 10:25:09
924	Saia Listrado Lilás (Conjunto Infantil)	20	16	16	19	102.59	10	2026-04-25 10:25:09	2026-04-25 10:25:09
925	Top Stitch Laranja (Renner Kids)	28	20	11	2	43.60	28	2026-04-25 10:25:09	2026-04-25 10:25:09
926	Blusa Casual Rosa Choque (Petit Royal)	5	3	10	17	90.42	25	2026-04-25 10:25:09	2026-04-25 10:25:09
927	Vestido Longa Turquesa (Farm Kids)	21	21	15	6	71.88	14	2026-04-25 10:25:09	2026-04-25 10:25:09
928	Blusa Floral Vinho (Akazys)	15	3	19	19	104.45	2	2026-04-25 10:25:09	2026-04-25 10:25:09
929	Calçado Moleton Vermelho(a) (Colcci Kids)	23	4	6	1	78.55	9	2026-04-25 10:25:09	2026-04-25 10:25:09
930	Blusa Estampado(a) Lilás (Carters)	13	3	16	8	73.73	8	2026-04-25 10:25:09	2026-04-25 10:25:09
931	Calçado Poliéster Cáqui (Dafiti Kids)	24	4	20	9	105.58	11	2026-04-25 10:25:09	2026-04-25 10:25:09
932	Vestido Labubu Laranja (C&A Kids)	18	21	11	7	106.24	7	2026-04-25 10:25:09	2026-04-25 10:25:09
933	Blusa Labubu Lilás (C&A Baby)	18	3	16	7	15.06	6	2026-04-25 10:25:09	2026-04-25 10:25:09
934	Calça Xadrez Lilás (Carters)	32	5	16	3	21.35	8	2026-04-25 10:25:09	2026-04-25 10:25:09
935	Bermuda Jeans Bege (Riachuelo Kids)	17	1	14	4	27.04	29	2026-04-25 10:25:09	2026-04-25 10:25:09
936	Camisa Turma da Mônica Laranja (Disney Baby)	31	7	11	1	96.04	12	2026-04-25 10:25:09	2026-04-25 10:25:09
937	Top Esportivo(a) Marrom (Renner Kids)	12	20	13	17	102.51	28	2026-04-25 10:25:09	2026-04-25 10:25:09
938	Saia Formal Turquesa (Disney Kids)	16	16	15	16	21.89	13	2026-04-25 10:25:09	2026-04-25 10:25:09
939	Saia Listrado Vinho (Bendita Cute)	20	16	19	2	83.32	3	2026-04-25 10:25:09	2026-04-25 10:25:09
940	Maiô Durável Lilás (Kily)	10	13	16	1	11.67	17	2026-04-25 10:25:09	2026-04-25 10:25:09
941	Bermuda Algodão Prata (Lilica Ripilica)	2	1	18	11	113.23	19	2026-04-25 10:25:09	2026-04-25 10:25:09
942	Camiseta Confortável Rosa (Brandille)	8	8	2	4	55.31	5	2026-04-25 10:25:09	2026-04-25 10:25:09
943	Calça Xadrez Bege (Boboi)	32	5	14	5	118.57	4	2026-04-25 10:25:09	2026-04-25 10:25:09
944	Jaqueta Leve Dourado(a) (Mundo Pet)	19	11	17	5	41.02	23	2026-04-25 10:25:09	2026-04-25 10:25:09
945	Saia Durável Dourado(a) (Farm Kids)	10	16	17	1	55.15	14	2026-04-25 10:25:09	2026-04-25 10:25:09
946	Jaqueta Esportivo(a) Cinza (C&A Baby)	12	11	8	1	25.57	6	2026-04-25 10:25:09	2026-04-25 10:25:09
947	Sunga Colorido(a) Turquesa (Dafiti Kids)	7	18	15	5	82.58	11	2026-04-25 10:25:09	2026-04-25 10:25:09
948	Short Leve Turquesa (Bendita Cute)	19	17	15	8	116.18	3	2026-04-25 10:25:09	2026-04-25 10:25:09
949	Saia Respirável Rosa (C&A Baby)	25	16	2	12	52.35	6	2026-04-25 10:25:09	2026-04-25 10:25:09
950	Calçado Confortável Turquesa (Carters)	8	4	15	8	62.96	8	2026-04-25 10:25:09	2026-04-25 10:25:09
951	Macacão Algodão Branco(a) (Osklen Kids)	2	12	4	9	29.16	24	2026-04-25 10:25:09	2026-04-25 10:25:09
952	Top Toy Store Branco(a) (Akazys)	30	20	4	12	43.19	2	2026-04-25 10:25:09	2026-04-25 10:25:09
953	Sutiã Poliéster Verde (Disney Baby)	24	19	5	12	38.17	12	2026-04-25 10:25:09	2026-04-25 10:25:09
954	Jaqueta Respirável Turquesa (Adidas Kids)	25	11	15	7	26.03	1	2026-04-25 10:25:09	2026-04-25 10:25:09
955	Calça Casual Azul (Farm Kids)	5	5	1	4	54.71	14	2026-04-25 10:25:09	2026-04-25 10:25:09
956	Pijama Moleton Cinza (Maria Filó Kids)	23	15	8	16	93.71	20	2026-04-25 10:25:09	2026-04-25 10:25:09
957	Cueca Curto(a) Preto(a) (Mundo Pet)	9	10	3	6	28.77	23	2026-04-25 10:25:09	2026-04-25 10:25:09
958	Bermuda Xadrez Azul (Bendita Cute)	32	1	1	5	89.50	3	2026-04-25 10:25:09	2026-04-25 10:25:09
959	Pijama Ajustável Rosa Choque (Mundo Pet)	1	15	10	19	81.34	23	2026-04-25 10:25:09	2026-04-25 10:25:09
960	Meia Respirável Dourado(a) (Brandille)	25	14	17	13	83.73	5	2026-04-25 10:25:09	2026-04-25 10:25:09
961	Blusa Casual Azul (Ki Carinho)	5	3	1	12	69.82	16	2026-04-25 10:25:09	2026-04-25 10:25:09
962	Maiô Estampado(a) Lilás (Carters)	13	13	16	8	96.66	8	2026-04-25 10:25:09	2026-04-25 10:25:09
963	Calça Esportivo(a) Cinza (Zoe Kids)	12	5	8	7	16.88	31	2026-04-25 10:25:09	2026-04-25 10:25:09
964	Top Ajustável Marrom (Salsa Jeans Kids)	1	20	13	12	28.69	30	2026-04-25 10:25:09	2026-04-25 10:25:09
965	Biquine Ajustável Rosa (Marisol)	1	2	2	6	23.68	21	2026-04-25 10:25:09	2026-04-25 10:25:09
966	Meia Stitch Turquesa (Lacoste Kids)	28	14	15	12	47.49	18	2026-04-25 10:25:09	2026-04-25 10:25:09
967	Sutiã Longa Bege (Adidas Kids)	21	19	14	5	33.81	1	2026-04-25 10:25:09	2026-04-25 10:25:09
968	Maiô Formal Bege (C&A Baby)	16	13	14	5	50.97	6	2026-04-25 10:25:09	2026-04-25 10:25:09
969	Calçado Colorido(a) Turquesa (Bendita Cute)	7	4	15	3	85.84	3	2026-04-25 10:25:09	2026-04-25 10:25:09
970	Sunga Temático(a) Vermelho(a) (Farm Kids)	29	18	6	4	89.77	14	2026-04-25 10:25:09	2026-04-25 10:25:09
971	Short Clássico(a) Dourado(a) (Renner Kids)	6	17	17	9	46.59	28	2026-04-25 10:25:09	2026-04-25 10:25:09
972	Casaco Colorido(a) Azul (Zoe Kids)	7	9	1	9	12.80	31	2026-04-25 10:25:09	2026-04-25 10:25:09
973	Maiô Saja Rosa (Disney Kids)	26	13	2	8	112.58	13	2026-04-25 10:25:09	2026-04-25 10:25:09
974	Sutiã Esportivo(a) Laranja (Dafiti Kids)	12	19	11	6	99.27	11	2026-04-25 10:25:09	2026-04-25 10:25:09
975	Jaqueta Ajustável Vinho (Bendita Cute)	1	11	19	4	85.97	3	2026-04-25 10:25:09	2026-04-25 10:25:09
976	Calçado Casual Rosa (Dafiti Kids)	5	4	2	19	34.69	11	2026-04-25 10:25:09	2026-04-25 10:25:09
977	Short Turma da Mônica Rosa (Puket Kids)	31	17	2	7	39.88	27	2026-04-25 10:25:09	2026-04-25 10:25:09
978	Jaqueta Animal Print Rosa Choque (Mundo Pet)	3	11	10	1	15.76	23	2026-04-25 10:25:09	2026-04-25 10:25:09
979	Sunga Estampado(a) Azul Escuro(a) (Boboi)	13	18	9	6	62.59	4	2026-04-25 10:25:09	2026-04-25 10:25:09
980	Camiseta Saja Cáqui (Pimpolho)	26	8	20	7	118.14	26	2026-04-25 10:25:09	2026-04-25 10:25:09
981	Calcinha Poliéster Amarelo(a) (Mundo Pet)	24	6	7	14	77.29	23	2026-04-25 10:25:09	2026-04-25 10:25:09
982	Short Clássico(a) Cinza (Kily)	6	17	8	7	61.78	17	2026-04-25 10:25:09	2026-04-25 10:25:09
983	Sunga Longa Lilás (Maria Filó Kids)	21	18	16	3	88.88	20	2026-04-25 10:25:09	2026-04-25 10:25:09
984	Top Labubu Vermelho(a) (Dafiti Kids)	18	20	6	13	93.84	11	2026-04-25 10:25:09	2026-04-25 10:25:09
985	Vestido Respirável Azul (Riachuelo Kids)	25	21	1	18	66.12	29	2026-04-25 10:25:09	2026-04-25 10:25:09
986	Cueca Fit Verde (Zoe Kids)	14	10	5	17	116.63	31	2026-04-25 10:25:09	2026-04-25 10:25:09
987	Maiô Durável Branco(a) (Riachuelo Kids)	10	13	4	11	109.00	29	2026-04-25 10:25:09	2026-04-25 10:25:09
988	Pijama Confortável Prata (Colcci Kids)	8	15	18	15	34.33	9	2026-04-25 10:25:09	2026-04-25 10:25:09
989	Jaqueta Leve Roxo(a) (C&A Kids)	19	11	12	11	75.33	7	2026-04-25 10:25:09	2026-04-25 10:25:09
990	Maiô Loney Tunes Laranja (Kily)	22	13	11	12	63.34	17	2026-04-25 10:25:09	2026-04-25 10:25:09
991	Meia Floral Vermelho(a) (Bendita Cute)	15	14	6	11	48.02	3	2026-04-25 10:25:09	2026-04-25 10:25:09
992	Calçado Poliéster Branco(a) (Petit Royal)	24	4	4	10	15.73	25	2026-04-25 10:25:09	2026-04-25 10:25:09
993	Jaqueta Formal Roxo(a) (Disney Baby)	16	11	12	13	19.00	12	2026-04-25 10:25:09	2026-04-25 10:25:09
994	Casaco Animal Print Lilás (Disney Kids)	3	9	16	15	23.38	13	2026-04-25 10:25:09	2026-04-25 10:25:09
995	Bermuda Moleton Dourado(a) (Mundo Infantil)	23	1	17	18	26.67	22	2026-04-25 10:25:09	2026-04-25 10:25:09
996	Camiseta Stitch Prata (Disney Baby)	28	8	18	3	80.73	12	2026-04-25 10:25:09	2026-04-25 10:25:09
997	Sunga Colorido(a) Verde (Mundo Infantil)	7	18	5	5	23.38	22	2026-04-25 10:25:09	2026-04-25 10:25:09
998	Blusa Fit Lilás (Boboi)	14	3	16	6	21.50	4	2026-04-25 10:25:09	2026-04-25 10:25:09
999	Saia Ajustável Laranja (C&A Kids)	1	16	11	3	26.80	7	2026-04-25 10:25:09	2026-04-25 10:25:09
1000	Saia Fit Cinza (Salsa Jeans Kids)	14	16	8	5	25.66	30	2026-04-25 10:25:09	2026-04-25 10:25:09
1001	Camisa Listrado Roxo(a) (Marisol)	20	7	12	17	115.42	21	2026-04-25 10:25:09	2026-04-25 10:25:09
1002	Bermuda Seda Dourado(a) (C&A Kids)	27	1	17	17	56.37	7	2026-04-25 10:25:09	2026-04-25 10:25:09
1003	Saia Xadrez Roxo(a) (Osklen Kids)	32	16	12	11	76.69	24	2026-04-25 10:25:09	2026-04-25 10:25:09
1004	Camisa Curto(a) Marrom (Osklen Kids)	9	7	13	2	17.37	24	2026-04-25 10:25:09	2026-04-25 10:25:09
1005	Casaco Ajustável Laranja (Dafiti Kids)	1	9	11	12	43.41	11	2026-04-25 10:25:09	2026-04-25 10:25:09
1006	Vestido Animal Print Azul (Kily)	3	21	1	6	34.53	17	2026-04-25 10:25:09	2026-04-25 10:25:09
1007	Camiseta Floral Branco(a) (Hering Kids)	15	8	4	14	116.61	15	2026-04-25 10:25:09	2026-04-25 10:25:09
1008	Sutiã Curto(a) Branco(a) (Colcci Kids)	9	19	4	16	87.67	9	2026-04-25 10:25:09	2026-04-25 10:25:09
1009	Biquine Curto(a) Preto(a) (C&A Kids)	9	2	3	7	15.06	7	2026-04-25 10:25:09	2026-04-25 10:25:09
1010	Calçado Algodão Vermelho(a) (Brandille)	2	4	6	11	108.12	5	2026-04-25 10:25:09	2026-04-25 10:25:09
1011	Cueca Durável Bege (Mundo Infantil)	10	10	14	4	61.76	22	2026-04-25 10:25:09	2026-04-25 10:25:09
1012	Sutiã Durável Azul (Bendita Cute)	10	19	1	12	119.69	3	2026-04-25 10:25:09	2026-04-25 10:25:09
1013	Vestido Respirável Marrom (Mundo Infantil)	25	21	13	18	29.40	22	2026-04-25 10:25:09	2026-04-25 10:25:09
1014	Sutiã Poliéster Vermelho(a) (Mundo Infantil)	24	19	6	9	71.93	22	2026-04-25 10:25:09	2026-04-25 10:25:09
1015	Casaco Ajustável Dourado(a) (Renner Kids)	1	9	17	7	69.33	28	2026-04-25 10:25:09	2026-04-25 10:25:09
1016	Vestido Fit Turquesa (Maria Filó Kids)	14	21	15	2	10.88	20	2026-04-25 10:25:09	2026-04-25 10:25:09
1017	Sutiã Básico(a) Cinza (Lacoste Kids)	4	19	8	9	117.45	18	2026-04-25 10:25:09	2026-04-25 10:25:09
1018	Casaco Ajustável Rosa Choque (Colcci Kids)	1	9	10	2	21.66	9	2026-04-25 10:25:09	2026-04-25 10:25:09
1019	Camisa Respirável Cáqui (Dafiti Kids)	25	7	20	12	25.32	11	2026-04-25 10:25:09	2026-04-25 10:25:09
1020	Bermuda Fit Vermelho(a) (Maria Filó Kids)	14	1	6	4	49.11	20	2026-04-25 10:25:09	2026-04-25 10:25:09
1021	Pijama Animal Print Vermelho(a) (Lacoste Kids)	3	15	6	18	96.57	18	2026-04-25 10:25:09	2026-04-25 10:25:09
1022	Jaqueta Seda Vinho (Puket Kids)	27	11	19	12	80.77	27	2026-04-25 10:25:09	2026-04-25 10:25:09
1023	Jaqueta Confortável Cáqui (Bendita Cute)	8	11	20	5	88.14	3	2026-04-25 10:25:09	2026-04-25 10:25:09
1024	Calça Turma da Mônica Cinza (Disney Kids)	31	5	8	4	62.20	13	2026-04-25 10:25:09	2026-04-25 10:25:09
1025	Jaqueta Poliéster Marrom (Ki Carinho)	24	11	13	12	92.75	16	2026-04-25 10:25:09	2026-04-25 10:25:09
1026	Calcinha Loney Tunes Preto(a) (Riachuelo Kids)	22	6	3	9	59.71	29	2026-04-25 10:25:09	2026-04-25 10:25:09
1027	Biquine Turma da Mônica Amarelo(a) (Puket Kids)	31	2	7	2	22.63	27	2026-04-25 10:25:09	2026-04-25 10:25:09
1028	Top Temático(a) Dourado(a) (Bendita Cute)	29	20	17	4	82.48	3	2026-04-25 10:25:09	2026-04-25 10:25:09
1029	Calcinha Temático(a) Roxo(a) (Akazys)	29	6	12	4	81.08	2	2026-04-25 10:25:09	2026-04-25 10:25:09
1030	Cueca Loney Tunes Vinho (Dafiti Kids)	22	10	19	16	58.26	11	2026-04-25 10:25:09	2026-04-25 10:25:09
1031	Calça Algodão Dourado(a) (Maria Filó Kids)	2	5	17	18	55.95	20	2026-04-25 10:25:09	2026-04-25 10:25:09
1032	Casaco Durável Bege (Brandille)	10	9	14	16	21.73	5	2026-04-25 10:25:09	2026-04-25 10:25:09
1033	Macacão Floral Amarelo(a) (Disney Kids)	15	12	7	16	108.81	13	2026-04-25 10:25:09	2026-04-25 10:25:09
1034	Calcinha Toy Store Marrom (Pimpolho)	30	6	13	10	107.90	26	2026-04-25 10:25:09	2026-04-25 10:25:09
1035	Saia Elástico(a) Bege (Kily)	11	16	14	18	99.92	17	2026-04-25 10:25:09	2026-04-25 10:25:09
1036	Camisa Longa Marrom (Hering Kids)	21	7	13	11	63.44	15	2026-04-25 10:25:09	2026-04-25 10:25:09
1037	Meia Curto(a) Cinza (Puket Kids)	9	14	8	16	13.93	27	2026-04-25 10:25:09	2026-04-25 10:25:09
1038	Blusa Seda Vinho (Renner Kids)	27	3	19	6	88.80	28	2026-04-25 10:25:09	2026-04-25 10:25:09
1039	Sunga Durável Amarelo(a) (C&A Kids)	10	18	7	4	31.06	7	2026-04-25 10:25:09	2026-04-25 10:25:09
1040	Sunga Listrado Azul Escuro(a) (Boboi)	20	18	9	13	88.85	4	2026-04-25 10:25:09	2026-04-25 10:25:09
1041	Maiô Ajustável Cáqui (Maria Filó Kids)	1	13	20	10	25.29	20	2026-04-25 10:25:09	2026-04-25 10:25:09
1042	Cueca Poliéster Amarelo(a) (Renner Kids)	24	10	7	6	83.81	28	2026-04-25 10:25:09	2026-04-25 10:25:09
1043	Camisa Ajustável Cinza (Lacoste Kids)	1	7	8	13	77.98	18	2026-04-25 10:25:09	2026-04-25 10:25:09
1044	Sutiã Animal Print Bege (Conjunto Infantil)	3	19	14	14	61.17	10	2026-04-25 10:25:09	2026-04-25 10:25:09
1045	Top Stitch Cinza (Renner Kids)	28	20	8	10	112.25	28	2026-04-25 10:25:09	2026-04-25 10:25:09
1046	Biquine Durável Laranja (Bendita Cute)	10	2	11	12	116.47	3	2026-04-25 10:25:09	2026-04-25 10:25:09
1047	Calcinha Jeans Cáqui (Brandille)	17	6	20	10	70.32	5	2026-04-25 10:25:09	2026-04-25 10:25:09
1048	Saia Fit Lilás (Lilica Ripilica)	14	16	16	8	119.29	19	2026-04-25 10:25:09	2026-04-25 10:25:09
1049	Calçado Toy Store Marrom (Osklen Kids)	30	4	13	7	29.93	24	2026-04-25 10:25:09	2026-04-25 10:25:09
1050	Sunga Básico(a) Cáqui (Riachuelo Kids)	4	18	20	1	111.44	29	2026-04-25 10:25:09	2026-04-25 10:25:09
1051	Pijama Toy Store Prata (Maria Filó Kids)	30	15	18	13	59.83	20	2026-04-25 10:25:09	2026-04-25 10:25:09
1052	Calcinha Xadrez Vinho (Ki Carinho)	32	6	19	8	113.97	16	2026-04-25 10:25:09	2026-04-25 10:25:09
1053	Jaqueta Ajustável Cinza (Riachuelo Kids)	1	11	8	10	14.32	29	2026-04-25 10:25:09	2026-04-25 10:25:09
1054	Maiô Confortável Azul Escuro(a) (Ki Carinho)	8	13	9	18	34.25	16	2026-04-25 10:25:09	2026-04-25 10:25:09
1055	Calcinha Confortável Vinho (Maria Filó Kids)	8	6	19	4	39.16	20	2026-04-25 10:25:09	2026-04-25 10:25:09
1056	Bermuda Esportivo(a) Roxo(a) (Marisol)	12	1	12	2	65.60	21	2026-04-25 10:25:09	2026-04-25 10:25:09
1057	Cueca Floral Azul (Colcci Kids)	15	10	1	12	15.58	9	2026-04-25 10:25:09	2026-04-25 10:25:09
1058	Short Stitch Verde (Pimpolho)	28	17	5	17	68.10	26	2026-04-25 10:25:09	2026-04-25 10:25:09
1059	Jaqueta Fit Laranja (Disney Baby)	14	11	11	7	18.09	12	2026-04-25 10:25:09	2026-04-25 10:25:09
1060	Short Confortável Lilás (Zoe Kids)	8	17	16	17	32.93	31	2026-04-25 10:25:09	2026-04-25 10:25:09
1061	Bermuda Elástico(a) Cáqui (Kily)	11	1	20	13	49.21	17	2026-04-25 10:25:09	2026-04-25 10:25:09
1062	Blusa Animal Print Cinza (Disney Kids)	3	3	8	1	32.72	13	2026-04-25 10:25:09	2026-04-25 10:25:09
1063	Blusa Jeans Marrom (Ki Carinho)	17	3	13	19	66.72	16	2026-04-25 10:25:09	2026-04-25 10:25:09
1064	Cueca Jeans Marrom (Pimpolho)	17	10	13	19	68.91	26	2026-04-25 10:25:09	2026-04-25 10:25:09
1065	Calça Casual Bege (Disney Kids)	5	5	14	15	55.81	13	2026-04-25 10:25:09	2026-04-25 10:25:09
1066	Casaco Saja Vinho (Brandille)	26	9	19	19	35.30	5	2026-04-25 10:25:09	2026-04-25 10:25:09
1067	Camisa Durável Laranja (Petit Royal)	10	7	11	8	90.55	25	2026-04-25 10:25:09	2026-04-25 10:25:09
1068	Blusa Loney Tunes Azul (Puket Kids)	22	3	1	13	42.57	27	2026-04-25 10:25:09	2026-04-25 10:25:09
1069	Biquine Ajustável Rosa (Puket Kids)	1	2	2	16	89.65	27	2026-04-25 10:25:09	2026-04-25 10:25:09
1070	Calça Xadrez Verde (Dafiti Kids)	32	5	5	7	21.28	11	2026-04-25 10:25:09	2026-04-25 10:25:09
1071	Camisa Casual Marrom (Colcci Kids)	5	7	13	10	69.78	9	2026-04-25 10:25:09	2026-04-25 10:25:09
1072	Camisa Respirável Vermelho(a) (Bendita Cute)	25	7	6	17	41.01	3	2026-04-25 10:25:09	2026-04-25 10:25:09
1073	Bermuda Animal Print Cinza (Pimpolho)	3	1	8	19	36.82	26	2026-04-25 10:25:09	2026-04-25 10:25:09
1074	Short Turma da Mônica Roxo(a) (Dafiti Kids)	31	17	12	19	12.59	11	2026-04-25 10:25:09	2026-04-25 10:25:09
1075	Sutiã Turma da Mônica Bege (Disney Kids)	31	19	14	6	46.25	13	2026-04-25 10:25:09	2026-04-25 10:25:09
1076	Calçado Respirável Dourado(a) (Pimpolho)	25	4	17	18	80.80	26	2026-04-25 10:25:09	2026-04-25 10:25:09
1077	Camisa Curto(a) Vermelho(a) (Mundo Pet)	9	7	6	3	102.72	23	2026-04-25 10:25:09	2026-04-25 10:25:09
1078	Meia Floral Rosa (Renner Kids)	15	14	2	4	13.54	28	2026-04-25 10:25:09	2026-04-25 10:25:09
1079	Cueca Toy Store Rosa (Bendita Cute)	30	10	2	14	83.59	3	2026-04-25 10:25:09	2026-04-25 10:25:09
1080	Top Temático(a) Bege (Dafiti Kids)	29	20	14	3	85.65	11	2026-04-25 10:25:09	2026-04-25 10:25:09
1081	Top Clássico(a) Vinho (Boboi)	6	20	19	7	78.23	4	2026-04-25 10:25:09	2026-04-25 10:25:09
1082	Jaqueta Ajustável Lilás (Disney Kids)	1	11	16	9	111.90	13	2026-04-25 10:25:09	2026-04-25 10:25:09
1083	Macacão Algodão Prata (C&A Baby)	2	12	18	7	27.92	6	2026-04-25 10:25:09	2026-04-25 10:25:09
1084	Bermuda Curto(a) Turquesa (Puket Kids)	9	1	15	19	116.18	27	2026-04-25 10:25:09	2026-04-25 10:25:09
1085	Pijama Floral Verde (C&A Kids)	15	15	5	11	64.20	7	2026-04-25 10:25:09	2026-04-25 10:25:09
1086	Top Moleton Branco(a) (Farm Kids)	23	20	4	18	93.35	14	2026-04-25 10:25:09	2026-04-25 10:25:09
1087	Maiô Seda Branco(a) (Riachuelo Kids)	27	13	4	10	103.90	29	2026-04-25 10:25:09	2026-04-25 10:25:09
1088	Biquine Ajustável Dourado(a) (Salsa Jeans Kids)	1	2	17	2	51.87	30	2026-04-25 10:25:09	2026-04-25 10:25:09
1089	Camiseta Loney Tunes Marrom (Ki Carinho)	22	8	13	15	94.77	16	2026-04-25 10:25:09	2026-04-25 10:25:09
1090	Saia Moleton Lilás (C&A Baby)	23	16	16	14	97.28	6	2026-04-25 10:25:09	2026-04-25 10:25:09
1091	Sunga Listrado Rosa (Disney Kids)	20	18	2	15	36.48	13	2026-04-25 10:25:09	2026-04-25 10:25:09
1092	Sutiã Básico(a) Vinho (Colcci Kids)	4	19	19	16	27.57	9	2026-04-25 10:25:09	2026-04-25 10:25:09
1093	Calcinha Moleton Bege (Farm Kids)	23	6	14	3	115.79	14	2026-04-25 10:25:09	2026-04-25 10:25:09
1094	Calcinha Clássico(a) Cinza (Osklen Kids)	6	6	8	18	26.10	24	2026-04-25 10:25:09	2026-04-25 10:25:09
1095	Biquine Saja Bege (Renner Kids)	26	2	14	18	11.54	28	2026-04-25 10:25:09	2026-04-25 10:25:09
1096	Camiseta Temático(a) Turquesa (C&A Kids)	29	8	15	18	103.14	7	2026-04-25 10:25:09	2026-04-25 10:25:09
1097	Macacão Jeans Turquesa (Marisol)	17	12	15	16	105.41	21	2026-04-25 10:25:09	2026-04-25 10:25:09
1098	Pijama Respirável Rosa Choque (Bendita Cute)	25	15	10	15	27.11	3	2026-04-25 10:25:09	2026-04-25 10:25:09
1099	Cueca Colorido(a) Turquesa (Osklen Kids)	7	10	15	1	69.41	24	2026-04-25 10:25:09	2026-04-25 10:25:09
1100	Camisa Turma da Mônica Cáqui (Osklen Kids)	31	7	20	1	83.61	24	2026-04-25 10:25:09	2026-04-25 10:25:09
1101	Camiseta Estampado(a) Dourado(a) (Mundo Infantil)	13	8	17	13	29.24	22	2026-04-25 10:25:09	2026-04-25 10:25:09
1102	Saia Algodão Branco(a) (Brandille)	2	16	4	3	76.63	5	2026-04-25 10:25:09	2026-04-25 10:25:09
1103	Saia Formal Roxo(a) (Riachuelo Kids)	16	16	12	8	59.85	29	2026-04-25 10:25:09	2026-04-25 10:25:09
1104	Vestido Floral Roxo(a) (Puket Kids)	15	21	12	5	98.89	27	2026-04-25 10:25:09	2026-04-25 10:25:09
1105	Blusa Leve Vinho (Disney Baby)	19	3	19	3	114.16	12	2026-04-25 10:25:09	2026-04-25 10:25:09
1106	Saia Jeans Rosa Choque (Lilica Ripilica)	17	16	10	12	13.59	19	2026-04-25 10:25:09	2026-04-25 10:25:09
1107	Calça Jeans Vinho (Dafiti Kids)	17	5	19	8	102.87	11	2026-04-25 10:25:09	2026-04-25 10:25:09
1108	Camiseta Listrado Cinza (Lilica Ripilica)	20	8	8	12	27.40	19	2026-04-25 10:25:09	2026-04-25 10:25:09
1109	Meia Moleton Marrom (Adidas Kids)	23	14	13	14	113.70	1	2026-04-25 10:25:09	2026-04-25 10:25:09
1110	Biquine Curto(a) Amarelo(a) (Carters)	9	2	7	13	64.70	8	2026-04-25 10:25:09	2026-04-25 10:25:09
1111	Camiseta Seda Marrom (Disney Kids)	27	8	13	7	34.40	13	2026-04-25 10:25:09	2026-04-25 10:25:09
1112	Camiseta Formal Rosa Choque (Ki Carinho)	16	8	10	12	37.15	16	2026-04-25 10:25:09	2026-04-25 10:25:09
1113	Pijama Confortável Verde (Lilica Ripilica)	8	15	5	14	65.66	19	2026-04-25 10:25:09	2026-04-25 10:25:09
1114	Biquine Confortável Preto(a) (Akazys)	8	2	3	14	115.02	2	2026-04-25 10:25:09	2026-04-25 10:25:09
1115	Pijama Toy Store Prata (Renner Kids)	30	15	18	14	15.95	28	2026-04-25 10:25:09	2026-04-25 10:25:09
1116	Top Básico(a) Vinho (Marisol)	4	20	19	6	29.61	21	2026-04-25 10:25:09	2026-04-25 10:25:09
1117	Bermuda Elástico(a) Amarelo(a) (Adidas Kids)	11	1	7	9	108.09	1	2026-04-25 10:25:09	2026-04-25 10:25:09
1118	Calça Esportivo(a) Preto(a) (C&A Kids)	12	5	3	13	92.75	7	2026-04-25 10:25:09	2026-04-25 10:25:09
1119	Short Curto(a) Lilás (C&A Baby)	9	17	16	6	87.82	6	2026-04-25 10:25:09	2026-04-25 10:25:09
1120	Cueca Elástico(a) Roxo(a) (Hering Kids)	11	10	12	19	42.72	15	2026-04-25 10:25:09	2026-04-25 10:25:09
1121	Calcinha Temático(a) Azul Escuro(a) (Disney Baby)	29	6	9	3	108.92	12	2026-04-25 10:25:09	2026-04-25 10:25:09
1122	Pijama Formal Marrom (Colcci Kids)	16	15	13	9	44.31	9	2026-04-25 10:25:09	2026-04-25 10:25:09
1123	Calça Elástico(a) Azul (Mundo Infantil)	11	5	1	9	119.29	22	2026-04-25 10:25:09	2026-04-25 10:25:09
1124	Casaco Toy Store Azul (Mundo Infantil)	30	9	1	6	82.07	22	2026-04-25 10:25:09	2026-04-25 10:25:09
1125	Jaqueta Loney Tunes Vinho (Disney Baby)	22	11	19	15	50.75	12	2026-04-25 10:25:09	2026-04-25 10:25:09
1126	Saia Elástico(a) Branco(a) (Conjunto Infantil)	11	16	4	12	58.84	10	2026-04-25 10:25:09	2026-04-25 10:25:09
1127	Meia Clássico(a) Vinho (Akazys)	6	14	19	19	78.25	2	2026-04-25 10:25:09	2026-04-25 10:25:09
1128	Pijama Estampado(a) Rosa (Colcci Kids)	13	15	2	11	41.70	9	2026-04-25 10:25:09	2026-04-25 10:25:09
1129	Biquine Xadrez Azul Escuro(a) (Marisol)	32	2	9	15	27.60	21	2026-04-25 10:25:09	2026-04-25 10:25:09
1130	Jaqueta Colorido(a) Azul (Conjunto Infantil)	7	11	1	1	101.80	10	2026-04-25 10:25:09	2026-04-25 10:25:09
1131	Camiseta Estampado(a) Bege (Maria Filó Kids)	13	8	14	8	47.07	20	2026-04-25 10:25:09	2026-04-25 10:25:09
1132	Calça Moleton Preto(a) (Bendita Cute)	23	5	3	1	48.72	3	2026-04-25 10:25:09	2026-04-25 10:25:09
1133	Pijama Confortável Azul (Lacoste Kids)	8	15	1	18	23.28	18	2026-04-25 10:25:09	2026-04-25 10:25:09
1134	Camisa Saja Rosa Choque (Riachuelo Kids)	26	7	10	14	107.77	29	2026-04-25 10:25:09	2026-04-25 10:25:09
1135	Short Colorido(a) Roxo(a) (Ki Carinho)	7	17	12	7	71.40	16	2026-04-25 10:25:09	2026-04-25 10:25:09
1136	Meia Colorido(a) Laranja (Zoe Kids)	7	14	11	3	64.64	31	2026-04-25 10:25:09	2026-04-25 10:25:09
1137	Maiô Moleton Cáqui (Kily)	23	13	20	15	12.31	17	2026-04-25 10:25:09	2026-04-25 10:25:09
1138	Short Animal Print Bege (Dafiti Kids)	3	17	14	14	113.14	11	2026-04-25 10:25:09	2026-04-25 10:25:09
1139	Camiseta Temático(a) Vermelho(a) (Mundo Infantil)	29	8	6	15	25.84	22	2026-04-25 10:25:09	2026-04-25 10:25:09
1140	Pijama Jeans Azul (Boboi)	17	15	1	5	88.31	4	2026-04-25 10:25:09	2026-04-25 10:25:09
1141	Camiseta Esportivo(a) Vinho (Puket Kids)	12	8	19	5	70.39	27	2026-04-25 10:25:09	2026-04-25 10:25:09
1142	Biquine Estampado(a) Preto(a) (Lacoste Kids)	13	2	3	15	33.35	18	2026-04-25 10:25:09	2026-04-25 10:25:09
1143	Jaqueta Durável Roxo(a) (Petit Royal)	10	11	12	9	89.99	25	2026-04-25 10:25:09	2026-04-25 10:25:09
1144	Bermuda Moleton Laranja (Renner Kids)	23	1	11	4	53.29	28	2026-04-25 10:25:09	2026-04-25 10:25:09
1145	Blusa Formal Branco(a) (C&A Kids)	16	3	4	19	107.12	7	2026-04-25 10:25:09	2026-04-25 10:25:09
1146	Sunga Jeans Turquesa (C&A Kids)	17	18	15	11	34.29	7	2026-04-25 10:25:09	2026-04-25 10:25:09
1147	Pijama Formal Vinho (Disney Kids)	16	15	19	3	109.04	13	2026-04-25 10:25:09	2026-04-25 10:25:09
1148	Biquine Saja Bege (Kily)	26	2	14	11	114.81	17	2026-04-25 10:25:09	2026-04-25 10:25:09
1149	Camiseta Estampado(a) Vinho (Renner Kids)	13	8	19	9	58.57	28	2026-04-25 10:25:09	2026-04-25 10:25:09
1150	Saia Longa Cáqui (Marisol)	21	16	20	8	87.29	21	2026-04-25 10:25:09	2026-04-25 10:25:09
1151	Pijama Básico(a) Vermelho(a) (Maria Filó Kids)	4	15	6	7	83.37	20	2026-04-25 10:25:09	2026-04-25 10:25:09
1152	Calcinha Poliéster Cinza (Salsa Jeans Kids)	24	6	8	19	67.81	30	2026-04-25 10:25:09	2026-04-25 10:25:09
1153	Saia Stitch Amarelo(a) (Bendita Cute)	28	16	7	3	23.57	3	2026-04-25 10:25:09	2026-04-25 10:25:09
1154	Meia Leve Bege (Akazys)	19	14	14	15	88.86	2	2026-04-25 10:25:09	2026-04-25 10:25:09
1155	Top Temático(a) Azul (Mundo Infantil)	29	20	1	13	79.68	22	2026-04-25 10:25:09	2026-04-25 10:25:09
1156	Short Saja Dourado(a) (Lilica Ripilica)	26	17	17	6	76.64	19	2026-04-25 10:25:09	2026-04-25 10:25:09
1157	Camiseta Algodão Dourado(a) (Disney Baby)	2	8	17	16	74.28	12	2026-04-25 10:25:09	2026-04-25 10:25:09
1158	Biquine Básico(a) Bege (Riachuelo Kids)	4	2	14	4	78.37	29	2026-04-25 10:25:09	2026-04-25 10:25:09
1159	Macacão Básico(a) Bege (Bendita Cute)	4	12	14	3	68.63	3	2026-04-25 10:25:09	2026-04-25 10:25:09
1160	Calcinha Respirável Bege (Kily)	25	6	14	11	101.04	17	2026-04-25 10:25:09	2026-04-25 10:25:09
1161	Pijama Jeans Amarelo(a) (Adidas Kids)	17	15	7	5	98.09	1	2026-04-25 10:25:09	2026-04-25 10:25:09
1162	Vestido Durável Laranja (Farm Kids)	10	21	11	8	66.46	14	2026-04-25 10:25:09	2026-04-25 10:25:09
1163	Top Loney Tunes Branco(a) (Salsa Jeans Kids)	22	20	4	13	110.19	30	2026-04-25 10:25:09	2026-04-25 10:25:09
1164	Jaqueta Toy Store Bege (Marisol)	30	11	14	12	109.02	21	2026-04-25 10:25:09	2026-04-25 10:25:09
1165	Cueca Seda Cinza (Adidas Kids)	27	10	8	15	94.33	1	2026-04-25 10:25:09	2026-04-25 10:25:09
1166	Bermuda Clássico(a) Laranja (Osklen Kids)	6	1	11	2	13.85	24	2026-04-25 10:25:09	2026-04-25 10:25:09
1167	Saia Formal Cáqui (Colcci Kids)	16	16	20	5	25.38	9	2026-04-25 10:25:09	2026-04-25 10:25:09
1168	Sunga Durável Laranja (Brandille)	10	18	11	4	110.35	5	2026-04-25 10:25:09	2026-04-25 10:25:09
1169	Vestido Temático(a) Marrom (Kily)	29	21	13	6	107.55	17	2026-04-25 10:25:09	2026-04-25 10:25:09
1170	Jaqueta Listrado Rosa (Mundo Pet)	20	11	2	8	27.57	23	2026-04-25 10:25:09	2026-04-25 10:25:09
1171	Sutiã Jeans Marrom (Disney Kids)	17	19	13	8	25.01	13	2026-04-25 10:25:09	2026-04-25 10:25:09
1172	Bermuda Moleton Azul Escuro(a) (Mundo Pet)	23	1	9	8	19.22	23	2026-04-25 10:25:09	2026-04-25 10:25:09
1173	Casaco Saja Preto(a) (Bendita Cute)	26	9	3	6	109.23	3	2026-04-25 10:25:09	2026-04-25 10:25:09
1174	Pijama Respirável Lilás (Farm Kids)	25	15	16	1	79.50	14	2026-04-25 10:25:09	2026-04-25 10:25:09
1175	Maiô Listrado Branco(a) (Bendita Cute)	20	13	4	3	75.34	3	2026-04-25 10:25:09	2026-04-25 10:25:09
1176	Calçado Confortável Prata (Ki Carinho)	8	4	18	3	87.07	16	2026-04-25 10:25:09	2026-04-25 10:25:09
1177	Pijama Leve Dourado(a) (Marisol)	19	15	17	9	36.05	21	2026-04-25 10:25:09	2026-04-25 10:25:09
1178	Camiseta Colorido(a) Verde (Adidas Kids)	7	8	5	10	63.51	1	2026-04-25 10:25:09	2026-04-25 10:25:09
1179	Sutiã Respirável Branco(a) (Kily)	25	19	4	10	98.22	17	2026-04-25 10:25:09	2026-04-25 10:25:09
1180	Bermuda Toy Store Rosa Choque (Dafiti Kids)	30	1	10	3	100.58	11	2026-04-25 10:25:09	2026-04-25 10:25:09
1181	Short Jeans Rosa (Kily)	17	17	2	10	103.13	17	2026-04-25 10:25:09	2026-04-25 10:25:09
1182	Calça Saja Branco(a) (Lacoste Kids)	26	5	4	16	40.40	18	2026-04-25 10:25:09	2026-04-25 10:25:09
1183	Pijama Turma da Mônica Roxo(a) (Osklen Kids)	31	15	12	14	27.27	24	2026-04-25 10:25:09	2026-04-25 10:25:09
1184	Sutiã Durável Cinza (Puket Kids)	10	19	8	4	42.92	27	2026-04-25 10:25:09	2026-04-25 10:25:09
1185	Casaco Confortável Lilás (Akazys)	8	9	16	11	57.68	2	2026-04-25 10:25:09	2026-04-25 10:25:09
1186	Camiseta Ajustável Amarelo(a) (Marisol)	1	8	7	14	107.15	21	2026-04-25 10:25:09	2026-04-25 10:25:09
1187	Camisa Seda Laranja (Conjunto Infantil)	27	7	11	14	24.26	10	2026-04-25 10:25:09	2026-04-25 10:25:09
1188	Casaco Moleton Cáqui (Farm Kids)	23	9	20	2	11.15	14	2026-04-25 10:25:09	2026-04-25 10:25:09
1189	Biquine Jeans Dourado(a) (Ki Carinho)	17	2	17	15	22.00	16	2026-04-25 10:25:09	2026-04-25 10:25:09
1190	Vestido Jeans Roxo(a) (Carters)	17	21	12	5	63.13	8	2026-04-25 10:25:09	2026-04-25 10:25:09
1191	Casaco Esportivo(a) Azul (Boboi)	12	9	1	15	86.95	4	2026-04-25 10:25:09	2026-04-25 10:25:09
1192	Casaco Básico(a) Verde (Petit Royal)	4	9	5	14	89.40	25	2026-04-25 10:25:09	2026-04-25 10:25:09
1193	Biquine Casual Vermelho(a) (Lilica Ripilica)	5	2	6	19	85.37	19	2026-04-25 10:25:09	2026-04-25 10:25:09
1194	Meia Durável Turquesa (Mundo Pet)	10	14	15	1	23.43	23	2026-04-25 10:25:09	2026-04-25 10:25:09
1195	Calça Casual Amarelo(a) (C&A Kids)	5	5	7	9	22.97	7	2026-04-25 10:25:09	2026-04-25 10:25:09
1196	Casaco Confortável Azul (Renner Kids)	8	9	1	2	54.69	28	2026-04-25 10:25:09	2026-04-25 10:25:09
1197	Sutiã Durável Roxo(a) (Petit Royal)	10	19	12	9	100.53	25	2026-04-25 10:25:09	2026-04-25 10:25:09
1198	Macacão Colorido(a) Vermelho(a) (Mundo Infantil)	7	12	6	18	109.23	22	2026-04-25 10:25:09	2026-04-25 10:25:09
1199	Calçado Ajustável Vermelho(a) (Akazys)	1	4	6	11	72.80	2	2026-04-25 10:25:09	2026-04-25 10:25:09
1200	Vestido Jeans Vinho (Maria Filó Kids)	17	21	19	11	50.38	20	2026-04-25 10:25:09	2026-04-25 10:25:09
1201	Top Esportivo(a) Branco(a) (Renner Kids)	12	20	4	15	62.67	28	2026-04-25 10:25:09	2026-04-25 10:25:09
1202	Calcinha Fit Bege (Mundo Pet)	14	6	14	1	89.37	23	2026-04-25 10:25:09	2026-04-25 10:25:09
1203	Vestido Esportivo(a) Cáqui (Disney Baby)	12	21	20	1	115.46	12	2026-04-25 10:25:09	2026-04-25 10:25:09
1204	Saia Algodão Azul (Pimpolho)	2	16	1	14	90.32	26	2026-04-25 10:25:09	2026-04-25 10:25:09
1205	Calça Curto(a) Marrom (Ki Carinho)	9	5	13	8	67.12	16	2026-04-25 10:25:09	2026-04-25 10:25:09
1206	Top Formal Roxo(a) (Brandille)	16	20	12	18	22.71	5	2026-04-25 10:25:09	2026-04-25 10:25:09
1207	Calcinha Ajustável Cáqui (Lilica Ripilica)	1	6	20	9	37.64	19	2026-04-25 10:25:09	2026-04-25 10:25:09
1208	Maiô Respirável Branco(a) (Carters)	25	13	4	8	42.98	8	2026-04-25 10:25:09	2026-04-25 10:25:09
1209	Meia Animal Print Verde (Mundo Pet)	3	14	5	2	112.63	23	2026-04-25 10:25:09	2026-04-25 10:25:09
1210	Maiô Seda Preto(a) (Lilica Ripilica)	27	13	3	12	78.28	19	2026-04-25 10:25:09	2026-04-25 10:25:09
1211	Short Formal Verde (Salsa Jeans Kids)	16	17	5	11	91.67	30	2026-04-25 10:25:09	2026-04-25 10:25:09
1212	Camiseta Poliéster Azul Escuro(a) (Pimpolho)	24	8	9	2	100.23	26	2026-04-25 10:25:09	2026-04-25 10:25:09
1213	Blusa Turma da Mônica Dourado(a) (Petit Royal)	31	3	17	11	65.98	25	2026-04-25 10:25:09	2026-04-25 10:25:09
1214	Sunga Leve Rosa Choque (Salsa Jeans Kids)	19	18	10	5	26.29	30	2026-04-25 10:25:09	2026-04-25 10:25:09
1215	Jaqueta Xadrez Dourado(a) (Hering Kids)	32	11	17	14	77.41	15	2026-04-25 10:25:09	2026-04-25 10:25:09
1216	Calcinha Leve Amarelo(a) (Riachuelo Kids)	19	6	7	13	53.17	29	2026-04-25 10:25:09	2026-04-25 10:25:09
1217	Meia Floral Roxo(a) (Conjunto Infantil)	15	14	12	8	14.72	10	2026-04-25 10:25:09	2026-04-25 10:25:09
1218	Macacão Leve Azul (Colcci Kids)	19	12	1	7	25.59	9	2026-04-25 10:25:09	2026-04-25 10:25:09
1219	Camiseta Labubu Vinho (Puket Kids)	18	8	19	4	108.43	27	2026-04-25 10:25:09	2026-04-25 10:25:09
1220	Camisa Leve Vermelho(a) (Kily)	19	7	6	8	53.11	17	2026-04-25 10:25:09	2026-04-25 10:25:09
1221	Short Formal Vermelho(a) (Adidas Kids)	16	17	6	17	95.20	1	2026-04-25 10:25:09	2026-04-25 10:25:09
1222	Calça Toy Store Azul (C&A Kids)	30	5	1	7	92.02	7	2026-04-25 10:25:09	2026-04-25 10:25:09
1223	Sutiã Algodão Dourado(a) (Colcci Kids)	2	19	17	15	49.75	9	2026-04-25 10:25:09	2026-04-25 10:25:09
1224	Camisa Colorido(a) Amarelo(a) (Adidas Kids)	7	7	7	14	50.99	1	2026-04-25 10:25:09	2026-04-25 10:25:09
1225	Vestido Stitch Bege (Mundo Infantil)	28	21	14	16	15.90	22	2026-04-25 10:25:09	2026-04-25 10:25:09
1226	Short Xadrez Cáqui (Disney Kids)	32	17	20	11	38.32	13	2026-04-25 10:25:09	2026-04-25 10:25:09
1227	Calça Clássico(a) Lilás (Mundo Pet)	6	5	16	6	83.57	23	2026-04-25 10:25:09	2026-04-25 10:25:09
1228	Jaqueta Leve Rosa Choque (C&A Baby)	19	11	10	15	107.93	6	2026-04-25 10:25:09	2026-04-25 10:25:09
1229	Maiô Listrado Roxo(a) (Salsa Jeans Kids)	20	13	12	13	81.99	30	2026-04-25 10:25:09	2026-04-25 10:25:09
1230	Camisa Fit Turquesa (Brandille)	14	7	15	18	115.33	5	2026-04-25 10:25:09	2026-04-25 10:25:09
1231	Camisa Algodão Branco(a) (Bendita Cute)	2	7	4	19	27.37	3	2026-04-25 10:25:09	2026-04-25 10:25:09
1232	Camisa Temático(a) Bege (Bendita Cute)	29	7	14	17	59.89	3	2026-04-25 10:25:09	2026-04-25 10:25:09
1233	Camiseta Animal Print Azul (Adidas Kids)	3	8	1	6	26.71	1	2026-04-25 10:25:09	2026-04-25 10:25:09
1234	Jaqueta Curto(a) Roxo(a) (Adidas Kids)	9	11	12	10	41.46	1	2026-04-25 10:25:09	2026-04-25 10:25:09
1235	Short Stitch Rosa Choque (Carters)	28	17	10	16	10.90	8	2026-04-25 10:25:09	2026-04-25 10:25:09
1236	Cueca Confortável Azul (C&A Baby)	8	10	1	18	78.38	6	2026-04-25 10:25:09	2026-04-25 10:25:09
1237	Camiseta Animal Print Preto(a) (Riachuelo Kids)	3	8	3	11	19.84	29	2026-04-25 10:25:09	2026-04-25 10:25:09
1238	Saia Seda Azul Escuro(a) (Bendita Cute)	27	16	9	13	91.96	3	2026-04-25 10:25:09	2026-04-25 10:25:09
1239	Calça Poliéster Verde (Akazys)	24	5	5	10	52.48	2	2026-04-25 10:25:09	2026-04-25 10:25:09
1240	Sutiã Confortável Lilás (Conjunto Infantil)	8	19	16	5	64.38	10	2026-04-25 10:25:09	2026-04-25 10:25:09
1241	Calçado Confortável Laranja (Osklen Kids)	8	4	11	14	97.77	24	2026-04-25 10:25:09	2026-04-25 10:25:09
1242	Camisa Longa Azul Escuro(a) (Renner Kids)	21	7	9	4	72.37	28	2026-04-25 10:25:09	2026-04-25 10:25:09
1243	Sutiã Estampado(a) Marrom (Osklen Kids)	13	19	13	9	96.28	24	2026-04-25 10:25:09	2026-04-25 10:25:09
1244	Pijama Turma da Mônica Vinho (Lilica Ripilica)	31	15	19	11	10.26	19	2026-04-25 10:25:09	2026-04-25 10:25:09
1245	Biquine Algodão Marrom (Ki Carinho)	2	2	13	12	60.29	16	2026-04-25 10:25:09	2026-04-25 10:25:09
1246	Sunga Algodão Verde (Boboi)	2	18	5	13	37.68	4	2026-04-25 10:25:09	2026-04-25 10:25:09
1247	Camiseta Turma da Mônica Branco(a) (C&A Kids)	31	8	4	9	111.81	7	2026-04-25 10:25:09	2026-04-25 10:25:09
1248	Vestido Longa Vermelho(a) (Renner Kids)	21	21	6	18	93.35	28	2026-04-25 10:25:09	2026-04-25 10:25:09
1249	Meia Ajustável Marrom (Ki Carinho)	1	14	13	11	39.99	16	2026-04-25 10:25:09	2026-04-25 10:25:09
1250	Casaco Fit Laranja (Maria Filó Kids)	14	9	11	6	30.08	20	2026-04-25 10:25:09	2026-04-25 10:25:09
1251	Calça Floral Azul (Salsa Jeans Kids)	15	5	1	9	15.56	30	2026-04-25 10:25:09	2026-04-25 10:25:09
1252	Jaqueta Jeans Verde (Puket Kids)	17	11	5	13	45.12	27	2026-04-25 10:25:09	2026-04-25 10:25:09
1253	Saia Poliéster Azul (Boboi)	24	16	1	7	92.56	4	2026-04-25 10:25:09	2026-04-25 10:25:09
1254	Blusa Floral Lilás (Marisol)	15	3	16	14	24.14	21	2026-04-25 10:25:09	2026-04-25 10:25:09
1255	Vestido Curto(a) Cáqui (Colcci Kids)	9	21	20	19	53.70	9	2026-04-25 10:25:09	2026-04-25 10:25:09
1256	Casaco Labubu Preto(a) (Ki Carinho)	18	9	3	12	41.01	16	2026-04-25 10:25:09	2026-04-25 10:25:09
1257	Biquine Poliéster Vinho (C&A Kids)	24	2	19	17	31.15	7	2026-04-25 10:25:09	2026-04-25 10:25:09
1258	Biquine Xadrez Preto(a) (Adidas Kids)	32	2	3	15	84.47	1	2026-04-25 10:25:09	2026-04-25 10:25:09
1259	Bermuda Curto(a) Vermelho(a) (Kily)	9	1	6	19	109.41	17	2026-04-25 10:25:09	2026-04-25 10:25:09
1260	Calçado Curto(a) Marrom (Kily)	9	4	13	17	112.17	17	2026-04-25 10:25:09	2026-04-25 10:25:09
1261	Jaqueta Stitch Azul Escuro(a) (Kily)	28	11	9	17	116.55	17	2026-04-25 10:25:09	2026-04-25 10:25:09
1262	Short Moleton Lilás (Lilica Ripilica)	23	17	16	16	25.50	19	2026-04-25 10:25:09	2026-04-25 10:25:09
1263	Camisa Clássico(a) Prata (Ki Carinho)	6	7	18	15	39.14	16	2026-04-25 10:25:09	2026-04-25 10:25:09
1264	Camisa Colorido(a) Preto(a) (Riachuelo Kids)	7	7	3	14	15.34	29	2026-04-25 10:25:09	2026-04-25 10:25:09
1265	Cueca Toy Store Lilás (Salsa Jeans Kids)	30	10	16	15	31.90	30	2026-04-25 10:25:09	2026-04-25 10:25:09
1266	Sutiã Poliéster Lilás (Brandille)	24	19	16	4	44.20	5	2026-04-25 10:25:09	2026-04-25 10:25:09
1267	Vestido Seda Amarelo(a) (C&A Baby)	27	21	7	6	35.50	6	2026-04-25 10:25:09	2026-04-25 10:25:09
1268	Meia Moleton Cinza (Maria Filó Kids)	23	14	8	4	55.61	20	2026-04-25 10:25:09	2026-04-25 10:25:09
1269	Pijama Fit Prata (Carters)	14	15	18	12	52.89	8	2026-04-25 10:25:09	2026-04-25 10:25:09
1270	Top Curto(a) Roxo(a) (Lacoste Kids)	9	20	12	9	30.88	18	2026-04-25 10:25:09	2026-04-25 10:25:09
1271	Macacão Stitch Lilás (Carters)	28	12	16	15	111.19	8	2026-04-25 10:25:09	2026-04-25 10:25:09
1272	Macacão Stitch Roxo(a) (Carters)	28	12	12	8	11.87	8	2026-04-25 10:25:09	2026-04-25 10:25:09
1273	Bermuda Listrado Laranja (Bendita Cute)	20	1	11	13	50.33	3	2026-04-25 10:25:09	2026-04-25 10:25:09
1274	Camiseta Casual Turquesa (Puket Kids)	5	8	15	16	119.67	27	2026-04-25 10:25:09	2026-04-25 10:25:09
1275	Vestido Jeans Marrom (Conjunto Infantil)	17	21	13	16	67.12	10	2026-04-25 10:25:09	2026-04-25 10:25:09
1276	Bermuda Formal Azul (Carters)	16	1	1	19	98.92	8	2026-04-25 10:25:09	2026-04-25 10:25:09
1277	Short Listrado Vinho (Osklen Kids)	20	17	19	4	56.74	24	2026-04-25 10:25:09	2026-04-25 10:25:09
1278	Blusa Stitch Azul Escuro(a) (Carters)	28	3	9	4	71.74	8	2026-04-25 10:25:09	2026-04-25 10:25:09
1279	Vestido Respirável Turquesa (Maria Filó Kids)	25	21	15	17	84.82	20	2026-04-25 10:25:09	2026-04-25 10:25:09
1280	Calça Floral Turquesa (Lilica Ripilica)	15	5	15	17	51.54	19	2026-04-25 10:25:09	2026-04-25 10:25:09
1281	Sunga Toy Store Vinho (Salsa Jeans Kids)	30	18	19	8	75.14	30	2026-04-25 10:25:09	2026-04-25 10:25:09
1282	Cueca Temático(a) Laranja (Renner Kids)	29	10	11	5	83.50	28	2026-04-25 10:25:09	2026-04-25 10:25:09
1283	Camiseta Moleton Azul (Bendita Cute)	23	8	1	7	72.50	3	2026-04-25 10:25:09	2026-04-25 10:25:09
1284	Saia Curto(a) Turquesa (Mundo Infantil)	9	16	15	9	12.77	22	2026-04-25 10:25:09	2026-04-25 10:25:09
1285	Blusa Floral Rosa (Boboi)	15	3	2	6	69.32	4	2026-04-25 10:25:09	2026-04-25 10:25:09
1286	Saia Toy Store Preto(a) (Kily)	30	16	3	19	81.24	17	2026-04-25 10:25:09	2026-04-25 10:25:09
1287	Blusa Poliéster Turquesa (Hering Kids)	24	3	15	13	117.07	15	2026-04-25 10:25:09	2026-04-25 10:25:09
1288	Calcinha Turma da Mônica Azul (Osklen Kids)	31	6	1	14	12.95	24	2026-04-25 10:25:09	2026-04-25 10:25:09
1289	Camisa Estampado(a) Marrom (Akazys)	13	7	13	4	41.29	2	2026-04-25 10:25:09	2026-04-25 10:25:09
1290	Calçado Durável Dourado(a) (Renner Kids)	10	4	17	12	110.89	28	2026-04-25 10:25:09	2026-04-25 10:25:09
1291	Calcinha Seda Verde (Hering Kids)	27	6	5	6	32.42	15	2026-04-25 10:25:09	2026-04-25 10:25:09
1292	Blusa Turma da Mônica Dourado(a) (C&A Kids)	31	3	17	18	10.42	7	2026-04-25 10:25:09	2026-04-25 10:25:09
1293	Pijama Loney Tunes Prata (C&A Baby)	22	15	18	11	108.88	6	2026-04-25 10:25:09	2026-04-25 10:25:09
1294	Maiô Colorido(a) Dourado(a) (Colcci Kids)	7	13	17	15	117.33	9	2026-04-25 10:25:09	2026-04-25 10:25:09
1295	Maiô Stitch Azul (Lilica Ripilica)	28	13	1	14	64.26	19	2026-04-25 10:25:09	2026-04-25 10:25:09
1296	Camiseta Seda Rosa Choque (Lacoste Kids)	27	8	10	9	92.04	18	2026-04-25 10:25:09	2026-04-25 10:25:09
1297	Jaqueta Poliéster Cáqui (Boboi)	24	11	20	7	32.47	4	2026-04-25 10:25:09	2026-04-25 10:25:09
1298	Macacão Clássico(a) Laranja (Disney Baby)	6	12	11	4	69.43	12	2026-04-25 10:25:09	2026-04-25 10:25:09
1299	Biquine Jeans Preto(a) (Dafiti Kids)	17	2	3	1	118.79	11	2026-04-25 10:25:09	2026-04-25 10:25:09
1300	Vestido Saja Marrom (Disney Kids)	26	21	13	19	24.29	13	2026-04-25 10:25:09	2026-04-25 10:25:09
1301	Pijama Curto(a) Branco(a) (Lilica Ripilica)	9	15	4	7	33.82	19	2026-04-25 10:25:09	2026-04-25 10:25:09
1302	Vestido Esportivo(a) Bege (Adidas Kids)	12	21	14	2	105.94	1	2026-04-25 10:25:09	2026-04-25 10:25:09
1303	Blusa Fit Prata (Petit Royal)	14	3	18	14	90.97	25	2026-04-25 10:25:09	2026-04-25 10:25:09
1304	Sutiã Turma da Mônica Azul Escuro(a) (Brandille)	31	19	9	18	32.85	5	2026-04-25 10:25:09	2026-04-25 10:25:09
1305	Sunga Saja Azul (Kily)	26	18	1	8	88.88	17	2026-04-25 10:25:09	2026-04-25 10:25:09
1306	Calçado Longa Roxo(a) (Pimpolho)	21	4	12	4	77.70	26	2026-04-25 10:25:09	2026-04-25 10:25:09
1307	Calçado Elástico(a) Prata (Kily)	11	4	18	10	106.56	17	2026-04-25 10:25:09	2026-04-25 10:25:09
1308	Meia Casual Rosa Choque (Akazys)	5	14	10	14	50.87	2	2026-04-25 10:25:09	2026-04-25 10:25:09
1309	Pijama Turma da Mônica Turquesa (Pimpolho)	31	15	15	17	118.56	26	2026-04-25 10:25:09	2026-04-25 10:25:09
1310	Vestido Floral Cáqui (Petit Royal)	15	21	20	8	20.30	25	2026-04-25 10:25:09	2026-04-25 10:25:09
1311	Saia Xadrez Prata (Akazys)	32	16	18	11	94.53	2	2026-04-25 10:25:09	2026-04-25 10:25:09
1312	Calça Animal Print Cáqui (Bendita Cute)	3	5	20	14	100.55	3	2026-04-25 10:25:09	2026-04-25 10:25:09
1313	Macacão Durável Prata (Ki Carinho)	10	12	18	15	78.28	16	2026-04-25 10:25:09	2026-04-25 10:25:09
1314	Meia Listrado Lilás (Disney Baby)	20	14	16	2	111.29	12	2026-04-25 10:25:09	2026-04-25 10:25:09
1315	Saia Labubu Dourado(a) (Carters)	18	16	17	12	30.40	8	2026-04-25 10:25:09	2026-04-25 10:25:09
1316	Sutiã Animal Print Vinho (Conjunto Infantil)	3	19	19	19	47.07	10	2026-04-25 10:25:09	2026-04-25 10:25:09
1317	Biquine Casual Preto(a) (Riachuelo Kids)	5	2	3	4	77.12	29	2026-04-25 10:25:09	2026-04-25 10:25:09
1318	Pijama Listrado Branco(a) (Renner Kids)	20	15	4	6	23.98	28	2026-04-25 10:25:09	2026-04-25 10:25:09
1319	Saia Ajustável Rosa Choque (Brandille)	1	16	10	5	46.34	5	2026-04-25 10:25:09	2026-04-25 10:25:09
1320	Sunga Colorido(a) Rosa Choque (Pimpolho)	7	18	10	12	84.27	26	2026-04-25 10:25:09	2026-04-25 10:25:09
1321	Maiô Temático(a) Dourado(a) (Mundo Pet)	29	13	17	9	66.99	23	2026-04-25 10:25:09	2026-04-25 10:25:09
1322	Saia Moleton Branco(a) (Zoe Kids)	23	16	4	3	42.51	31	2026-04-25 10:25:09	2026-04-25 10:25:09
1323	Sutiã Seda Marrom (C&A Baby)	27	19	13	10	55.87	6	2026-04-25 10:25:09	2026-04-25 10:25:09
1324	Top Clássico(a) Turquesa (Maria Filó Kids)	6	20	15	10	27.00	20	2026-04-25 10:25:09	2026-04-25 10:25:09
1325	Camiseta Saja Cinza (Dafiti Kids)	26	8	8	16	96.89	11	2026-04-25 10:25:09	2026-04-25 10:25:09
1326	Maiô Curto(a) Branco(a) (Brandille)	9	13	4	5	96.36	5	2026-04-25 10:25:09	2026-04-25 10:25:09
1327	Pijama Fit Bege (Disney Baby)	14	15	14	13	51.95	12	2026-04-25 10:25:09	2026-04-25 10:25:09
1328	Calçado Labubu Rosa Choque (Salsa Jeans Kids)	18	4	10	6	106.63	30	2026-04-25 10:25:09	2026-04-25 10:25:09
1329	Short Animal Print Rosa Choque (Renner Kids)	3	17	10	3	56.12	28	2026-04-25 10:25:09	2026-04-25 10:25:09
1330	Camisa Algodão Prata (Lilica Ripilica)	2	7	18	12	117.73	19	2026-04-25 10:25:09	2026-04-25 10:25:09
1331	Calça Casual Lilás (Salsa Jeans Kids)	5	5	16	10	43.65	30	2026-04-25 10:25:09	2026-04-25 10:25:09
1332	Maiô Formal Marrom (Bendita Cute)	16	13	13	15	100.38	3	2026-04-25 10:25:09	2026-04-25 10:25:09
1333	Jaqueta Casual Azul (Conjunto Infantil)	5	11	1	16	55.66	10	2026-04-25 10:25:09	2026-04-25 10:25:09
1334	Calcinha Elástico(a) Dourado(a) (Carters)	11	6	17	1	32.75	8	2026-04-25 10:25:09	2026-04-25 10:25:09
1335	Calçado Longa Azul Escuro(a) (Akazys)	21	4	9	18	64.59	2	2026-04-25 10:25:09	2026-04-25 10:25:09
1336	Short Moleton Dourado(a) (Mundo Pet)	23	17	17	13	113.58	23	2026-04-25 10:25:09	2026-04-25 10:25:09
1337	Camisa Moleton Preto(a) (Kily)	23	7	3	11	116.82	17	2026-04-25 10:25:09	2026-04-25 10:25:09
1338	Biquine Confortável Verde (Akazys)	8	2	5	11	87.21	2	2026-04-25 10:25:09	2026-04-25 10:25:09
1339	Macacão Seda Branco(a) (Conjunto Infantil)	27	12	4	1	59.71	10	2026-04-25 10:25:09	2026-04-25 10:25:09
1340	Macacão Básico(a) Bege (Brandille)	4	12	14	1	82.55	5	2026-04-25 10:25:09	2026-04-25 10:25:09
1341	Cueca Xadrez Rosa (Brandille)	32	10	2	1	100.56	5	2026-04-25 10:25:09	2026-04-25 10:25:09
1342	Pijama Poliéster Prata (Ki Carinho)	24	15	18	16	14.39	16	2026-04-25 10:25:09	2026-04-25 10:25:09
1343	Sunga Respirável Dourado(a) (Riachuelo Kids)	25	18	17	8	107.38	29	2026-04-25 10:25:09	2026-04-25 10:25:09
1344	Sunga Fit Vermelho(a) (Maria Filó Kids)	14	18	6	17	18.13	20	2026-04-25 10:25:09	2026-04-25 10:25:09
1345	Vestido Elástico(a) Azul (Petit Royal)	11	21	1	18	92.92	25	2026-04-25 10:25:09	2026-04-25 10:25:09
1346	Saia Loney Tunes Vermelho(a) (Carters)	22	16	6	8	31.84	8	2026-04-25 10:25:09	2026-04-25 10:25:09
1347	Blusa Confortável Cáqui (C&A Baby)	8	3	20	5	108.72	6	2026-04-25 10:25:09	2026-04-25 10:25:09
1348	Meia Clássico(a) Branco(a) (Ki Carinho)	6	14	4	3	93.08	16	2026-04-25 10:25:09	2026-04-25 10:25:09
1349	Camisa Estampado(a) Bege (Salsa Jeans Kids)	13	7	14	5	67.04	30	2026-04-25 10:25:09	2026-04-25 10:25:09
1350	Maiô Elástico(a) Dourado(a) (Farm Kids)	11	13	17	13	52.14	14	2026-04-25 10:25:09	2026-04-25 10:25:09
1351	Meia Clássico(a) Vinho (Pimpolho)	6	14	19	14	54.09	26	2026-04-25 10:25:09	2026-04-25 10:25:09
1352	Calcinha Jeans Cinza (Mundo Infantil)	17	6	8	18	115.18	22	2026-04-25 10:25:09	2026-04-25 10:25:09
1353	Casaco Saja Azul Escuro(a) (Disney Kids)	26	9	9	13	23.18	13	2026-04-25 10:25:09	2026-04-25 10:25:09
1354	Sunga Clássico(a) Vinho (Zoe Kids)	6	18	19	14	116.77	31	2026-04-25 10:25:09	2026-04-25 10:25:09
1355	Camisa Labubu Dourado(a) (Marisol)	18	7	17	17	19.26	21	2026-04-25 10:25:09	2026-04-25 10:25:09
1356	Calcinha Turma da Mônica Marrom (Farm Kids)	31	6	13	14	113.02	14	2026-04-25 10:25:09	2026-04-25 10:25:09
1357	Calça Estampado(a) Branco(a) (Brandille)	13	5	4	19	102.84	5	2026-04-25 10:25:09	2026-04-25 10:25:09
1358	Top Xadrez Vinho (Osklen Kids)	32	20	19	11	46.26	24	2026-04-25 10:25:09	2026-04-25 10:25:09
1359	Vestido Loney Tunes Vermelho(a) (Riachuelo Kids)	22	21	6	6	94.76	29	2026-04-25 10:25:09	2026-04-25 10:25:09
1360	Sutiã Longa Rosa Choque (Mundo Infantil)	21	19	10	13	12.56	22	2026-04-25 10:25:09	2026-04-25 10:25:09
1361	Saia Longa Rosa Choque (Boboi)	21	16	10	2	27.85	4	2026-04-25 10:25:09	2026-04-25 10:25:09
1362	Sutiã Turma da Mônica Dourado(a) (Zoe Kids)	31	19	17	19	60.80	31	2026-04-25 10:25:09	2026-04-25 10:25:09
1363	Pijama Animal Print Branco(a) (C&A Kids)	3	15	4	9	24.97	7	2026-04-25 10:25:09	2026-04-25 10:25:09
1364	Bermuda Durável Cinza (C&A Kids)	10	1	8	13	28.42	7	2026-04-25 10:25:09	2026-04-25 10:25:09
1365	Sunga Colorido(a) Lilás (Maria Filó Kids)	7	18	16	15	101.63	20	2026-04-25 10:25:09	2026-04-25 10:25:09
1366	Macacão Fit Azul Escuro(a) (Marisol)	14	12	9	17	49.81	21	2026-04-25 10:25:09	2026-04-25 10:25:09
1367	Top Leve Vermelho(a) (C&A Kids)	19	20	6	7	74.25	7	2026-04-25 10:25:09	2026-04-25 10:25:09
1368	Maiô Elástico(a) Rosa (Kily)	11	13	2	8	62.37	17	2026-04-25 10:25:09	2026-04-25 10:25:09
1369	Macacão Turma da Mônica Branco(a) (Disney Baby)	31	12	4	12	98.81	12	2026-04-25 10:25:09	2026-04-25 10:25:09
1370	Calcinha Xadrez Azul Escuro(a) (Dafiti Kids)	32	6	9	1	39.80	11	2026-04-25 10:25:09	2026-04-25 10:25:09
1371	Meia Turma da Mônica Rosa Choque (Lilica Ripilica)	31	14	10	8	17.02	19	2026-04-25 10:25:09	2026-04-25 10:25:09
1372	Maiô Toy Store Rosa Choque (Conjunto Infantil)	30	13	10	18	48.25	10	2026-04-25 10:25:09	2026-04-25 10:25:09
1373	Calcinha Esportivo(a) Cáqui (Marisol)	12	6	20	16	26.98	21	2026-04-25 10:25:09	2026-04-25 10:25:09
1374	Pijama Moleton Marrom (Disney Kids)	23	15	13	6	45.92	13	2026-04-25 10:25:09	2026-04-25 10:25:09
1375	Casaco Algodão Cinza (Mundo Pet)	2	9	8	17	101.96	23	2026-04-25 10:25:09	2026-04-25 10:25:09
1376	Vestido Estampado(a) Azul (Bendita Cute)	13	21	1	2	69.26	3	2026-04-25 10:25:09	2026-04-25 10:25:09
1377	Jaqueta Turma da Mônica Branco(a) (Osklen Kids)	31	11	4	8	38.33	24	2026-04-25 10:25:09	2026-04-25 10:25:09
1378	Short Estampado(a) Cáqui (Puket Kids)	13	17	20	12	54.61	27	2026-04-25 10:25:09	2026-04-25 10:25:09
1379	Blusa Formal Amarelo(a) (Conjunto Infantil)	16	3	7	9	77.41	10	2026-04-25 10:25:09	2026-04-25 10:25:09
1380	Cueca Leve Preto(a) (C&A Baby)	19	10	3	14	42.00	6	2026-04-25 10:25:09	2026-04-25 10:25:09
1381	Calcinha Estampado(a) Preto(a) (Akazys)	13	6	3	3	13.79	2	2026-04-25 10:25:09	2026-04-25 10:25:09
1382	Sunga Leve Vinho (Lacoste Kids)	19	18	19	12	36.63	18	2026-04-25 10:25:09	2026-04-25 10:25:09
1383	Meia Seda Dourado(a) (Mundo Pet)	27	14	17	13	31.63	23	2026-04-25 10:25:09	2026-04-25 10:25:09
1384	Biquine Moleton Lilás (Ki Carinho)	23	2	16	18	89.81	16	2026-04-25 10:25:09	2026-04-25 10:25:09
1385	Maiô Moleton Rosa (Disney Baby)	23	13	2	4	74.66	12	2026-04-25 10:25:09	2026-04-25 10:25:09
1386	Maiô Loney Tunes Marrom (Conjunto Infantil)	22	13	13	3	84.44	10	2026-04-25 10:25:09	2026-04-25 10:25:09
1387	Jaqueta Confortável Preto(a) (Adidas Kids)	8	11	3	18	92.59	1	2026-04-25 10:25:09	2026-04-25 10:25:09
1388	Cueca Poliéster Laranja (Mundo Pet)	24	10	11	9	89.29	23	2026-04-25 10:25:09	2026-04-25 10:25:09
1389	Meia Listrado Branco(a) (Maria Filó Kids)	20	14	4	19	37.82	20	2026-04-25 10:25:09	2026-04-25 10:25:09
1390	Sutiã Poliéster Vermelho(a) (Marisol)	24	19	6	6	82.15	21	2026-04-25 10:25:09	2026-04-25 10:25:09
1391	Casaco Longa Vermelho(a) (Pimpolho)	21	9	6	19	88.34	26	2026-04-25 10:25:09	2026-04-25 10:25:09
1392	Calcinha Leve Lilás (Disney Kids)	19	6	16	14	24.68	13	2026-04-25 10:25:09	2026-04-25 10:25:09
1393	Calçado Formal Verde (C&A Kids)	16	4	5	9	26.36	7	2026-04-25 10:25:09	2026-04-25 10:25:09
1394	Meia Loney Tunes Bege (Petit Royal)	22	14	14	4	85.76	25	2026-04-25 10:25:09	2026-04-25 10:25:09
1395	Calcinha Estampado(a) Bege (Mundo Infantil)	13	6	14	11	10.35	22	2026-04-25 10:25:09	2026-04-25 10:25:09
1396	Biquine Longa Dourado(a) (Mundo Pet)	21	2	17	10	10.89	23	2026-04-25 10:25:09	2026-04-25 10:25:09
1397	Calçado Labubu Vermelho(a) (Pimpolho)	18	4	6	2	46.14	26	2026-04-25 10:25:09	2026-04-25 10:25:09
1398	Camiseta Formal Laranja (Conjunto Infantil)	16	8	11	17	92.06	10	2026-04-25 10:25:09	2026-04-25 10:25:09
1399	Saia Floral Cinza (Riachuelo Kids)	15	16	8	6	99.44	29	2026-04-25 10:25:09	2026-04-25 10:25:09
1400	Camisa Durável Marrom (Brandille)	10	7	13	14	54.77	5	2026-04-25 10:25:09	2026-04-25 10:25:09
1401	Calçado Curto(a) Azul Escuro(a) (Salsa Jeans Kids)	9	4	9	16	96.81	30	2026-04-25 10:25:09	2026-04-25 10:25:09
1402	Macacão Temático(a) Cáqui (Salsa Jeans Kids)	29	12	20	19	47.65	30	2026-04-25 10:25:09	2026-04-25 10:25:09
1403	Sunga Jeans Dourado(a) (Riachuelo Kids)	17	18	17	7	107.19	29	2026-04-25 10:25:09	2026-04-25 10:25:09
1404	Vestido Estampado(a) Marrom (Zoe Kids)	13	21	13	12	107.22	31	2026-04-25 10:25:09	2026-04-25 10:25:09
1405	Calcinha Colorido(a) Vermelho(a) (C&A Kids)	7	6	6	12	46.42	7	2026-04-25 10:25:09	2026-04-25 10:25:09
1406	Biquine Longa Prata (Colcci Kids)	21	2	18	16	95.15	9	2026-04-25 10:25:09	2026-04-25 10:25:09
1407	Bermuda Loney Tunes Marrom (Salsa Jeans Kids)	22	1	13	4	104.35	30	2026-04-25 10:25:09	2026-04-25 10:25:09
1408	Sunga Listrado Preto(a) (Carters)	20	18	3	7	109.35	8	2026-04-25 10:25:09	2026-04-25 10:25:09
1409	Vestido Estampado(a) Azul (Colcci Kids)	13	21	1	2	26.96	9	2026-04-25 10:25:09	2026-04-25 10:25:09
1410	Camisa Turma da Mônica Verde (Ki Carinho)	31	7	5	5	95.13	16	2026-04-25 10:25:09	2026-04-25 10:25:09
1411	Pijama Seda Rosa Choque (Boboi)	27	15	10	18	105.66	4	2026-04-25 10:25:09	2026-04-25 10:25:09
1412	Maiô Curto(a) Cáqui (Bendita Cute)	9	13	20	11	16.60	3	2026-04-25 10:25:09	2026-04-25 10:25:09
1413	Sunga Clássico(a) Cáqui (Disney Baby)	6	18	20	4	73.77	12	2026-04-25 10:25:09	2026-04-25 10:25:09
1414	Pijama Labubu Lilás (Kily)	18	15	16	15	91.11	17	2026-04-25 10:25:09	2026-04-25 10:25:09
1415	Calcinha Moleton Turquesa (Brandille)	23	6	15	8	53.23	5	2026-04-25 10:25:09	2026-04-25 10:25:09
1416	Sunga Elástico(a) Vinho (Marisol)	11	18	19	1	62.40	21	2026-04-25 10:25:09	2026-04-25 10:25:09
1417	Jaqueta Xadrez Azul (Maria Filó Kids)	32	11	1	5	79.33	20	2026-04-25 10:25:09	2026-04-25 10:25:09
1418	Calça Xadrez Branco(a) (Zoe Kids)	32	5	4	15	45.10	31	2026-04-25 10:25:09	2026-04-25 10:25:09
1419	Pijama Listrado Azul Escuro(a) (Petit Royal)	20	15	9	3	94.15	25	2026-04-25 10:25:09	2026-04-25 10:25:09
1420	Blusa Formal Preto(a) (C&A Kids)	16	3	3	8	102.85	7	2026-04-25 10:25:09	2026-04-25 10:25:09
1421	Top Fit Dourado(a) (Ki Carinho)	14	20	17	18	61.91	16	2026-04-25 10:25:09	2026-04-25 10:25:09
1422	Biquine Algodão Cáqui (Hering Kids)	2	2	20	15	15.02	15	2026-04-25 10:25:09	2026-04-25 10:25:09
1423	Casaco Loney Tunes Cáqui (C&A Baby)	22	9	20	3	119.72	6	2026-04-25 10:25:09	2026-04-25 10:25:09
1424	Sunga Leve Azul (Puket Kids)	19	18	1	9	61.05	27	2026-04-25 10:25:09	2026-04-25 10:25:09
1425	Calcinha Temático(a) Turquesa (Salsa Jeans Kids)	29	6	15	8	79.35	30	2026-04-25 10:25:09	2026-04-25 10:25:09
1426	Sutiã Toy Store Vinho (Lacoste Kids)	30	19	19	13	99.38	18	2026-04-25 10:25:09	2026-04-25 10:25:09
1427	Cueca Algodão Vinho (Renner Kids)	2	10	19	9	30.45	28	2026-04-25 10:25:09	2026-04-25 10:25:09
1428	Biquine Jeans Laranja (Conjunto Infantil)	17	2	11	12	118.15	10	2026-04-25 10:25:09	2026-04-25 10:25:09
1429	Maiô Casual Cáqui (Lacoste Kids)	5	13	20	4	104.20	18	2026-04-25 10:25:09	2026-04-25 10:25:09
1430	Calça Colorido(a) Preto(a) (Lilica Ripilica)	7	5	3	7	84.60	19	2026-04-25 10:25:09	2026-04-25 10:25:09
1431	Saia Toy Store Laranja (Akazys)	30	16	11	2	56.63	2	2026-04-25 10:25:09	2026-04-25 10:25:09
1432	Casaco Turma da Mônica Rosa (Salsa Jeans Kids)	31	9	2	11	90.60	30	2026-04-25 10:25:09	2026-04-25 10:25:09
1433	Macacão Respirável Turquesa (Dafiti Kids)	25	12	15	4	41.09	11	2026-04-25 10:25:09	2026-04-25 10:25:09
1434	Pijama Labubu Prata (Hering Kids)	18	15	18	6	60.00	15	2026-04-25 10:25:09	2026-04-25 10:25:09
1435	Pijama Básico(a) Rosa (Brandille)	4	15	2	2	51.55	5	2026-04-25 10:25:09	2026-04-25 10:25:09
1436	Saia Floral Dourado(a) (Conjunto Infantil)	15	16	17	2	16.49	10	2026-04-25 10:25:09	2026-04-25 10:25:09
1437	Casaco Moleton Verde (Zoe Kids)	23	9	5	15	31.33	31	2026-04-25 10:25:09	2026-04-25 10:25:09
1438	Biquine Curto(a) Azul Escuro(a) (Boboi)	9	2	9	8	18.15	4	2026-04-25 10:25:09	2026-04-25 10:25:09
1439	Vestido Algodão Dourado(a) (C&A Kids)	2	21	17	14	71.35	7	2026-04-25 10:25:09	2026-04-25 10:25:09
1440	Macacão Casual Marrom (Bendita Cute)	5	12	13	11	19.31	3	2026-04-25 10:25:09	2026-04-25 10:25:09
1441	Calçado Jeans Marrom (Disney Baby)	17	4	13	10	119.48	12	2026-04-25 10:25:09	2026-04-25 10:25:09
1442	Calçado Jeans Laranja (Carters)	17	4	11	4	78.59	8	2026-04-25 10:25:09	2026-04-25 10:25:09
1443	Sutiã Turma da Mônica Cinza (Riachuelo Kids)	31	19	8	5	31.14	29	2026-04-25 10:25:09	2026-04-25 10:25:09
1444	Blusa Esportivo(a) Vinho (Mundo Infantil)	12	3	19	13	45.26	22	2026-04-25 10:25:09	2026-04-25 10:25:09
1445	Bermuda Clássico(a) Azul (Renner Kids)	6	1	1	9	94.50	28	2026-04-25 10:25:09	2026-04-25 10:25:09
1446	Cueca Durável Roxo(a) (Mundo Infantil)	10	10	12	3	103.44	22	2026-04-25 10:25:09	2026-04-25 10:25:09
1447	Camisa Temático(a) Verde (Lacoste Kids)	29	7	5	19	115.59	18	2026-04-25 10:25:09	2026-04-25 10:25:09
1448	Pijama Colorido(a) Turquesa (Mundo Pet)	7	15	15	19	100.80	23	2026-04-25 10:25:09	2026-04-25 10:25:09
1449	Short Estampado(a) Bege (Farm Kids)	13	17	14	6	70.69	14	2026-04-25 10:25:09	2026-04-25 10:25:09
1450	Vestido Casual Lilás (Marisol)	5	21	16	5	97.61	21	2026-04-25 10:25:09	2026-04-25 10:25:09
1451	Vestido Curto(a) Cáqui (Ki Carinho)	9	21	20	11	64.41	16	2026-04-25 10:25:09	2026-04-25 10:25:09
1452	Pijama Stitch Vinho (Marisol)	28	15	19	12	30.03	21	2026-04-25 10:25:09	2026-04-25 10:25:09
1453	Vestido Moleton Roxo(a) (C&A Baby)	23	21	12	19	16.18	6	2026-04-25 10:25:09	2026-04-25 10:25:09
1454	Cueca Algodão Marrom (Mundo Pet)	2	10	13	16	31.83	23	2026-04-25 10:25:09	2026-04-25 10:25:09
1455	Top Estampado(a) Verde (Marisol)	13	20	5	8	12.12	21	2026-04-25 10:25:09	2026-04-25 10:25:09
1456	Meia Básico(a) Lilás (Akazys)	4	14	16	19	95.71	2	2026-04-25 10:25:09	2026-04-25 10:25:09
1457	Sunga Animal Print Lilás (Akazys)	3	18	16	10	38.82	2	2026-04-25 10:25:09	2026-04-25 10:25:09
1458	Camisa Respirável Roxo(a) (Adidas Kids)	25	7	12	3	31.56	1	2026-04-25 10:25:09	2026-04-25 10:25:09
1459	Meia Algodão Azul (Puket Kids)	2	14	1	9	81.65	27	2026-04-25 10:25:09	2026-04-25 10:25:09
1460	Biquine Casual Azul Escuro(a) (Dafiti Kids)	5	2	9	2	18.33	11	2026-04-25 10:25:09	2026-04-25 10:25:09
1461	Pijama Formal Prata (Carters)	16	15	18	17	28.80	8	2026-04-25 10:25:09	2026-04-25 10:25:09
1462	Calçado Xadrez Marrom (Bendita Cute)	32	4	13	1	65.87	3	2026-04-25 10:25:09	2026-04-25 10:25:09
1463	Pijama Temático(a) Turquesa (Renner Kids)	29	15	15	1	108.37	28	2026-04-25 10:25:09	2026-04-25 10:25:09
1464	Calça Floral Vinho (Brandille)	15	5	19	6	36.22	5	2026-04-25 10:25:09	2026-04-25 10:25:09
1465	Cueca Casual Amarelo(a) (Disney Baby)	5	10	7	18	62.93	12	2026-04-25 10:25:09	2026-04-25 10:25:09
1466	Camisa Ajustável Marrom (Hering Kids)	1	7	13	13	100.05	15	2026-04-25 10:25:09	2026-04-25 10:25:09
1467	Camisa Seda Branco(a) (Maria Filó Kids)	27	7	4	2	95.28	20	2026-04-25 10:25:09	2026-04-25 10:25:09
1468	Casaco Longa Rosa (Boboi)	21	9	2	18	20.74	4	2026-04-25 10:25:09	2026-04-25 10:25:09
1469	Sunga Colorido(a) Branco(a) (Mundo Infantil)	7	18	4	9	23.97	22	2026-04-25 10:25:09	2026-04-25 10:25:09
1470	Maiô Stitch Roxo(a) (Salsa Jeans Kids)	28	13	12	7	17.58	30	2026-04-25 10:25:09	2026-04-25 10:25:09
1471	Calçado Casual Cinza (Brandille)	5	4	8	8	69.29	5	2026-04-25 10:25:09	2026-04-25 10:25:09
1472	Pijama Seda Vermelho(a) (Mundo Pet)	27	15	6	1	52.51	23	2026-04-25 10:25:09	2026-04-25 10:25:09
1473	Meia Turma da Mônica Vinho (Hering Kids)	31	14	19	11	40.90	15	2026-04-25 10:25:09	2026-04-25 10:25:09
1474	Macacão Fit Cáqui (Ki Carinho)	14	12	20	12	88.24	16	2026-04-25 10:25:09	2026-04-25 10:25:09
1475	Blusa Floral Azul Escuro(a) (Puket Kids)	15	3	9	5	43.85	27	2026-04-25 10:25:09	2026-04-25 10:25:09
1476	Camisa Saja Turquesa (Brandille)	26	7	15	19	117.17	5	2026-04-25 10:25:09	2026-04-25 10:25:09
1477	Blusa Stitch Azul Escuro(a) (Disney Baby)	28	3	9	13	10.53	12	2026-04-25 10:25:09	2026-04-25 10:25:09
1478	Macacão Durável Cáqui (Bendita Cute)	10	12	20	18	113.92	3	2026-04-25 10:25:09	2026-04-25 10:25:09
1479	Jaqueta Esportivo(a) Azul Escuro(a) (Dafiti Kids)	12	11	9	14	111.67	11	2026-04-25 10:25:09	2026-04-25 10:25:09
1480	Saia Floral Dourado(a) (Brandille)	15	16	17	10	10.64	5	2026-04-25 10:25:09	2026-04-25 10:25:09
1481	Short Labubu Prata (Puket Kids)	18	17	18	16	58.61	27	2026-04-25 10:25:09	2026-04-25 10:25:09
1482	Blusa Formal Rosa Choque (Lacoste Kids)	16	3	10	5	60.55	18	2026-04-25 10:25:09	2026-04-25 10:25:09
1483	Macacão Estampado(a) Azul (Salsa Jeans Kids)	13	12	1	11	93.02	30	2026-04-25 10:25:09	2026-04-25 10:25:09
1484	Camiseta Listrado Dourado(a) (Farm Kids)	20	8	17	4	30.02	14	2026-04-25 10:25:09	2026-04-25 10:25:09
1485	Jaqueta Básico(a) Prata (Marisol)	4	11	18	19	21.54	21	2026-04-25 10:25:09	2026-04-25 10:25:09
1486	Macacão Xadrez Dourado(a) (Puket Kids)	32	12	17	7	15.69	27	2026-04-25 10:25:09	2026-04-25 10:25:09
1487	Calça Animal Print Laranja (Bendita Cute)	3	5	11	7	115.60	3	2026-04-25 10:25:09	2026-04-25 10:25:09
1488	Camiseta Labubu Rosa (Bendita Cute)	18	8	2	14	99.93	3	2026-04-25 10:25:09	2026-04-25 10:25:09
1489	Saia Casual Rosa (Hering Kids)	5	16	2	11	47.24	15	2026-04-25 10:25:09	2026-04-25 10:25:09
1490	Calcinha Básico(a) Azul (Colcci Kids)	4	6	1	4	99.04	9	2026-04-25 10:25:09	2026-04-25 10:25:09
1491	Macacão Longa Preto(a) (Colcci Kids)	21	12	3	15	34.66	9	2026-04-25 10:25:09	2026-04-25 10:25:09
1492	Camiseta Temático(a) Cinza (C&A Kids)	29	8	8	18	111.53	7	2026-04-25 10:25:09	2026-04-25 10:25:09
1493	Biquine Esportivo(a) Vermelho(a) (Pimpolho)	12	2	6	13	42.93	26	2026-04-25 10:25:09	2026-04-25 10:25:09
1494	Vestido Durável Cáqui (Kily)	10	21	20	8	118.12	17	2026-04-25 10:25:09	2026-04-25 10:25:09
1495	Pijama Xadrez Marrom (Brandille)	32	15	13	11	94.67	5	2026-04-25 10:25:09	2026-04-25 10:25:09
1496	Sunga Estampado(a) Vermelho(a) (Dafiti Kids)	13	18	6	3	110.15	11	2026-04-25 10:25:09	2026-04-25 10:25:09
1497	Jaqueta Estampado(a) Rosa Choque (Hering Kids)	13	11	10	17	46.54	15	2026-04-25 10:25:09	2026-04-25 10:25:09
1498	Camiseta Esportivo(a) Verde (Adidas Kids)	12	8	5	6	107.38	1	2026-04-25 10:25:09	2026-04-25 10:25:09
1499	Pijama Floral Rosa Choque (Marisol)	15	15	10	1	14.79	21	2026-04-25 10:25:09	2026-04-25 10:25:09
1500	Calcinha Curto(a) Roxo(a) (Adidas Kids)	9	6	12	4	101.29	1	2026-04-25 10:25:09	2026-04-25 10:25:09
1501	Calçado Saja Azul (Conjunto Infantil)	26	4	1	9	37.67	10	2026-04-25 10:25:09	2026-04-25 10:25:09
1502	Jaqueta Confortável Rosa (Hering Kids)	8	11	2	5	112.66	15	2026-04-25 10:25:09	2026-04-25 10:25:09
1503	Calça Elástico(a) Rosa Choque (Farm Kids)	11	5	10	14	82.84	14	2026-04-25 10:25:09	2026-04-25 10:25:09
1504	Pijama Turma da Mônica Rosa Choque (Kily)	31	15	10	19	81.19	17	2026-04-25 10:25:09	2026-04-25 10:25:09
1505	Camiseta Moleton Branco(a) (Marisol)	23	8	4	9	113.80	21	2026-04-25 10:25:09	2026-04-25 10:25:09
1506	Calça Ajustável Cáqui (Lilica Ripilica)	1	5	20	9	33.96	19	2026-04-25 10:25:09	2026-04-25 10:25:09
1507	Sunga Jeans Marrom (Disney Kids)	17	18	13	12	66.45	13	2026-04-25 10:25:09	2026-04-25 10:25:09
1508	Cueca Moleton Preto(a) (Carters)	23	10	3	4	39.87	8	2026-04-25 10:25:09	2026-04-25 10:25:09
1509	Blusa Turma da Mônica Rosa (Zoe Kids)	31	3	2	10	91.23	31	2026-04-25 10:25:09	2026-04-25 10:25:09
1510	Blusa Animal Print Amarelo(a) (Adidas Kids)	3	3	7	11	85.08	1	2026-04-25 10:25:09	2026-04-25 10:25:09
1511	Casaco Seda Amarelo(a) (Hering Kids)	27	9	7	19	45.40	15	2026-04-25 10:25:09	2026-04-25 10:25:09
1512	Jaqueta Toy Store Vinho (Conjunto Infantil)	30	11	19	7	54.21	10	2026-04-25 10:25:09	2026-04-25 10:25:09
1513	Saia Leve Preto(a) (Conjunto Infantil)	19	16	3	4	23.81	10	2026-04-25 10:25:09	2026-04-25 10:25:09
1514	Blusa Estampado(a) Laranja (Adidas Kids)	13	3	11	14	103.12	1	2026-04-25 10:25:09	2026-04-25 10:25:09
1515	Top Confortável Marrom (Kily)	8	20	13	4	38.88	17	2026-04-25 10:25:09	2026-04-25 10:25:09
1516	Casaco Formal Turquesa (Akazys)	16	9	15	13	56.20	2	2026-04-25 10:25:09	2026-04-25 10:25:09
1517	Sutiã Ajustável Roxo(a) (C&A Kids)	1	19	12	9	98.41	7	2026-04-25 10:25:09	2026-04-25 10:25:09
1518	Sutiã Animal Print Vinho (Zoe Kids)	3	19	19	12	96.70	31	2026-04-25 10:25:09	2026-04-25 10:25:09
1519	Meia Floral Verde (Kily)	15	14	5	9	69.11	17	2026-04-25 10:25:09	2026-04-25 10:25:09
1520	Macacão Básico(a) Turquesa (Brandille)	4	12	15	1	55.66	5	2026-04-25 10:25:09	2026-04-25 10:25:09
1521	Camisa Labubu Vermelho(a) (Farm Kids)	18	7	6	14	96.44	14	2026-04-25 10:25:09	2026-04-25 10:25:09
1522	Biquine Longa Cáqui (Marisol)	21	2	20	1	57.12	21	2026-04-25 10:25:09	2026-04-25 10:25:09
1523	Camisa Temático(a) Azul (Marisol)	29	7	1	11	108.91	21	2026-04-25 10:25:09	2026-04-25 10:25:09
1524	Calçado Saja Verde (Disney Kids)	26	4	5	11	37.06	13	2026-04-25 10:25:09	2026-04-25 10:25:09
1525	Meia Casual Amarelo(a) (Kily)	5	14	7	17	20.89	17	2026-04-25 10:25:09	2026-04-25 10:25:09
1526	Camiseta Animal Print Bege (C&A Kids)	3	8	14	4	20.17	7	2026-04-25 10:25:09	2026-04-25 10:25:09
1527	Sunga Básico(a) Laranja (Pimpolho)	4	18	11	5	106.18	26	2026-04-25 10:25:09	2026-04-25 10:25:09
1528	Jaqueta Turma da Mônica Preto(a) (Zoe Kids)	31	11	3	2	67.55	31	2026-04-25 10:25:09	2026-04-25 10:25:09
1529	Sunga Curto(a) Vinho (Lilica Ripilica)	9	18	19	17	75.70	19	2026-04-25 10:25:09	2026-04-25 10:25:09
1530	Macacão Clássico(a) Dourado(a) (Akazys)	6	12	17	5	102.94	2	2026-04-25 10:25:09	2026-04-25 10:25:09
1531	Calça Curto(a) Bege (Colcci Kids)	9	5	14	18	19.94	9	2026-04-25 10:25:09	2026-04-25 10:25:09
1532	Calça Confortável Preto(a) (Bendita Cute)	8	5	3	9	69.15	3	2026-04-25 10:25:09	2026-04-25 10:25:09
1533	Camiseta Básico(a) Azul Escuro(a) (Akazys)	4	8	9	19	33.55	2	2026-04-25 10:25:09	2026-04-25 10:25:09
1534	Meia Básico(a) Cinza (Akazys)	4	14	8	6	20.57	2	2026-04-25 10:25:09	2026-04-25 10:25:09
1535	Camisa Confortável Lilás (Dafiti Kids)	8	7	16	19	23.30	11	2026-04-25 10:25:09	2026-04-25 10:25:09
1536	Saia Xadrez Prata (C&A Baby)	32	16	18	15	89.79	6	2026-04-25 10:25:09	2026-04-25 10:25:09
1537	Biquine Leve Branco(a) (Salsa Jeans Kids)	19	2	4	19	83.25	30	2026-04-25 10:25:09	2026-04-25 10:25:09
1538	Blusa Colorido(a) Branco(a) (Bendita Cute)	7	3	4	10	31.02	3	2026-04-25 10:25:09	2026-04-25 10:25:09
1539	Cueca Confortável Amarelo(a) (Petit Royal)	8	10	7	17	73.27	25	2026-04-25 10:25:09	2026-04-25 10:25:09
1540	Maiô Formal Vinho (Hering Kids)	16	13	19	8	34.47	15	2026-04-25 10:25:09	2026-04-25 10:25:09
1541	Short Temático(a) Branco(a) (Mundo Infantil)	29	17	4	18	36.41	22	2026-04-25 10:25:09	2026-04-25 10:25:09
1542	Sunga Básico(a) Preto(a) (Disney Kids)	4	18	3	11	62.77	13	2026-04-25 10:25:09	2026-04-25 10:25:09
1543	Sunga Casual Azul (Lilica Ripilica)	5	18	1	1	67.35	19	2026-04-25 10:25:09	2026-04-25 10:25:09
1544	Cueca Casual Marrom (Marisol)	5	10	13	3	20.14	21	2026-04-25 10:25:09	2026-04-25 10:25:09
1545	Cueca Animal Print Vinho (Mundo Pet)	3	10	19	3	20.92	23	2026-04-25 10:25:09	2026-04-25 10:25:09
1546	Saia Saja Verde (Disney Kids)	26	16	5	2	96.33	13	2026-04-25 10:25:09	2026-04-25 10:25:09
1547	Top Clássico(a) Rosa (Salsa Jeans Kids)	6	20	2	2	32.72	30	2026-04-25 10:25:09	2026-04-25 10:25:09
1548	Blusa Turma da Mônica Azul Escuro(a) (Farm Kids)	31	3	9	6	100.71	14	2026-04-25 10:25:09	2026-04-25 10:25:09
1549	Camiseta Jeans Branco(a) (Kily)	17	8	4	16	75.16	17	2026-04-25 10:25:09	2026-04-25 10:25:09
1550	Pijama Clássico(a) Vermelho(a) (Petit Royal)	6	15	6	8	49.95	25	2026-04-25 10:25:09	2026-04-25 10:25:09
1551	Calcinha Xadrez Vermelho(a) (Disney Baby)	32	6	6	17	86.51	12	2026-04-25 10:25:09	2026-04-25 10:25:09
1552	Casaco Jeans Laranja (Carters)	17	9	11	16	37.24	8	2026-04-25 10:25:09	2026-04-25 10:25:09
1553	Casaco Elástico(a) Verde (Boboi)	11	9	5	3	39.71	4	2026-04-25 10:25:09	2026-04-25 10:25:09
1554	Vestido Estampado(a) Cáqui (Ki Carinho)	13	21	20	18	71.92	16	2026-04-25 10:25:09	2026-04-25 10:25:09
1555	Casaco Toy Store Rosa Choque (Dafiti Kids)	30	9	10	1	59.54	11	2026-04-25 10:25:09	2026-04-25 10:25:09
1556	Short Temático(a) Turquesa (Boboi)	29	17	15	13	27.88	4	2026-04-25 10:25:09	2026-04-25 10:25:09
1557	Blusa Fit Bege (Mundo Pet)	14	3	14	14	77.17	23	2026-04-25 10:25:09	2026-04-25 10:25:09
1558	Pijama Animal Print Branco(a) (Boboi)	3	15	4	9	56.94	4	2026-04-25 10:25:09	2026-04-25 10:25:09
1559	Saia Listrado Lilás (C&A Baby)	20	16	16	10	13.10	6	2026-04-25 10:25:09	2026-04-25 10:25:09
1560	Saia Longa Cáqui (Colcci Kids)	21	16	20	4	35.99	9	2026-04-25 10:25:09	2026-04-25 10:25:09
1561	Blusa Formal Cinza (Disney Kids)	16	3	8	10	83.36	13	2026-04-25 10:25:09	2026-04-25 10:25:09
1562	Top Animal Print Cinza (Boboi)	3	20	8	8	64.10	4	2026-04-25 10:25:09	2026-04-25 10:25:09
1563	Vestido Leve Laranja (Akazys)	19	21	11	19	54.20	2	2026-04-25 10:25:09	2026-04-25 10:25:09
1564	Bermuda Xadrez Laranja (Marisol)	32	1	11	6	119.21	21	2026-04-25 10:25:09	2026-04-25 10:25:09
1565	Camiseta Labubu Vinho (Renner Kids)	18	8	19	19	40.18	28	2026-04-25 10:25:09	2026-04-25 10:25:09
1566	Camisa Animal Print Vinho (Farm Kids)	3	7	19	6	81.58	14	2026-04-25 10:25:09	2026-04-25 10:25:09
1567	Blusa Temático(a) Vinho (Renner Kids)	29	3	19	15	11.31	28	2026-04-25 10:25:09	2026-04-25 10:25:09
1568	Camisa Loney Tunes Lilás (C&A Kids)	22	7	16	9	111.61	7	2026-04-25 10:25:09	2026-04-25 10:25:09
1569	Pijama Respirável Branco(a) (Maria Filó Kids)	25	15	4	9	86.18	20	2026-04-25 10:25:09	2026-04-25 10:25:09
1570	Sutiã Longa Turquesa (Carters)	21	19	15	15	71.74	8	2026-04-25 10:25:09	2026-04-25 10:25:09
1571	Sutiã Seda Lilás (Mundo Infantil)	27	19	16	16	43.65	22	2026-04-25 10:25:09	2026-04-25 10:25:09
1572	Saia Elástico(a) Laranja (Farm Kids)	11	16	11	16	85.04	14	2026-04-25 10:25:09	2026-04-25 10:25:09
1573	Top Respirável Bege (Disney Kids)	25	20	14	1	55.50	13	2026-04-25 10:25:09	2026-04-25 10:25:09
1574	Meia Xadrez Azul (Colcci Kids)	32	14	1	5	117.69	9	2026-04-25 10:25:09	2026-04-25 10:25:09
1575	Calçado Algodão Laranja (Kily)	2	4	11	12	91.70	17	2026-04-25 10:25:09	2026-04-25 10:25:09
1576	Bermuda Básico(a) Cinza (Maria Filó Kids)	4	1	8	7	93.34	20	2026-04-25 10:25:09	2026-04-25 10:25:09
1577	Calcinha Saja Turquesa (Riachuelo Kids)	26	6	15	11	30.63	29	2026-04-25 10:25:09	2026-04-25 10:25:09
1578	Saia Curto(a) Vermelho(a) (Maria Filó Kids)	9	16	6	14	36.06	20	2026-04-25 10:25:09	2026-04-25 10:25:09
1579	Calçado Toy Store Cinza (Akazys)	30	4	8	15	16.35	2	2026-04-25 10:25:09	2026-04-25 10:25:09
1580	Meia Poliéster Bege (Ki Carinho)	24	14	14	6	103.80	16	2026-04-25 10:25:09	2026-04-25 10:25:09
1581	Bermuda Seda Amarelo(a) (Boboi)	27	1	7	4	43.00	4	2026-04-25 10:25:09	2026-04-25 10:25:09
1582	Sutiã Formal Branco(a) (Mundo Pet)	16	19	4	17	107.67	23	2026-04-25 10:25:09	2026-04-25 10:25:09
1583	Sunga Poliéster Preto(a) (Marisol)	24	18	3	6	53.04	21	2026-04-25 10:25:09	2026-04-25 10:25:09
1584	Sutiã Durável Rosa Choque (Salsa Jeans Kids)	10	19	10	11	109.21	30	2026-04-25 10:25:09	2026-04-25 10:25:09
1585	Jaqueta Formal Cáqui (Dafiti Kids)	16	11	20	9	13.12	11	2026-04-25 10:25:09	2026-04-25 10:25:09
1586	Macacão Moleton Bege (Petit Royal)	23	12	14	5	59.45	25	2026-04-25 10:25:09	2026-04-25 10:25:09
1587	Calcinha Casual Bege (Salsa Jeans Kids)	5	6	14	4	67.54	30	2026-04-25 10:25:09	2026-04-25 10:25:09
1588	Maiô Saja Amarelo(a) (Puket Kids)	26	13	7	12	36.98	27	2026-04-25 10:25:09	2026-04-25 10:25:09
1589	Camisa Floral Laranja (Bendita Cute)	15	7	11	12	30.54	3	2026-04-25 10:25:09	2026-04-25 10:25:09
1590	Cueca Formal Preto(a) (Lacoste Kids)	16	10	3	5	78.24	18	2026-04-25 10:25:09	2026-04-25 10:25:09
1591	Blusa Moleton Prata (Disney Baby)	23	3	18	17	72.49	12	2026-04-25 10:25:09	2026-04-25 10:25:09
1592	Saia Labubu Branco(a) (Puket Kids)	18	16	4	10	99.95	27	2026-04-25 10:25:09	2026-04-25 10:25:09
1593	Calça Respirável Verde (Dafiti Kids)	25	5	5	1	43.69	11	2026-04-25 10:25:09	2026-04-25 10:25:09
1594	Calcinha Xadrez Azul Escuro(a) (Hering Kids)	32	6	9	4	74.10	15	2026-04-25 10:25:09	2026-04-25 10:25:09
1595	Jaqueta Saja Preto(a) (Riachuelo Kids)	26	11	3	6	17.38	29	2026-04-25 10:25:09	2026-04-25 10:25:09
1596	Cueca Básico(a) Bege (Lilica Ripilica)	4	10	14	11	68.15	19	2026-04-25 10:25:09	2026-04-25 10:25:09
1597	Cueca Algodão Rosa (Lilica Ripilica)	2	10	2	7	21.43	19	2026-04-25 10:25:09	2026-04-25 10:25:09
1598	Casaco Moleton Marrom (Ki Carinho)	23	9	13	18	21.36	16	2026-04-25 10:25:09	2026-04-25 10:25:09
1599	Meia Elástico(a) Lilás (Conjunto Infantil)	11	14	16	16	32.59	10	2026-04-25 10:25:09	2026-04-25 10:25:09
1600	Casaco Algodão Branco(a) (Lilica Ripilica)	2	9	4	6	88.31	19	2026-04-25 10:25:09	2026-04-25 10:25:09
1601	Camisa Loney Tunes Vinho (Akazys)	22	7	19	18	43.21	2	2026-04-25 10:25:09	2026-04-25 10:25:09
1602	Cueca Estampado(a) Vinho (Mundo Pet)	13	10	19	14	116.22	23	2026-04-25 10:25:09	2026-04-25 10:25:09
1603	Macacão Formal Rosa Choque (Salsa Jeans Kids)	16	12	10	15	105.81	30	2026-04-25 10:25:09	2026-04-25 10:25:09
1604	Vestido Stitch Preto(a) (Renner Kids)	28	21	3	12	21.23	28	2026-04-25 10:25:09	2026-04-25 10:25:09
1605	Casaco Loney Tunes Bege (Lacoste Kids)	22	9	14	19	27.03	18	2026-04-25 10:25:09	2026-04-25 10:25:09
1606	Bermuda Leve Azul Escuro(a) (Zoe Kids)	19	1	9	6	24.58	31	2026-04-25 10:25:09	2026-04-25 10:25:09
1607	Calcinha Respirável Laranja (Adidas Kids)	25	6	11	7	118.50	1	2026-04-25 10:25:09	2026-04-25 10:25:09
1608	Saia Fit Preto(a) (Farm Kids)	14	16	3	3	56.70	14	2026-04-25 10:25:09	2026-04-25 10:25:09
1609	Calçado Seda Amarelo(a) (C&A Kids)	27	4	7	4	32.89	7	2026-04-25 10:25:09	2026-04-25 10:25:09
1610	Vestido Labubu Azul (Renner Kids)	18	21	1	10	98.35	28	2026-04-25 10:25:09	2026-04-25 10:25:09
1611	Camisa Xadrez Marrom (Disney Baby)	32	7	13	10	64.67	12	2026-04-25 10:25:09	2026-04-25 10:25:09
1612	Sutiã Seda Cáqui (Puket Kids)	27	19	20	6	107.51	27	2026-04-25 10:25:09	2026-04-25 10:25:09
1613	Macacão Curto(a) Lilás (Dafiti Kids)	9	12	16	17	112.81	11	2026-04-25 10:25:09	2026-04-25 10:25:09
1614	Meia Xadrez Lilás (Colcci Kids)	32	14	16	12	52.29	9	2026-04-25 10:25:09	2026-04-25 10:25:09
1615	Blusa Stitch Lilás (Renner Kids)	28	3	16	11	75.76	28	2026-04-25 10:25:09	2026-04-25 10:25:09
1616	Vestido Clássico(a) Cáqui (Osklen Kids)	6	21	20	16	13.43	24	2026-04-25 10:25:09	2026-04-25 10:25:09
1617	Blusa Colorido(a) Verde (Maria Filó Kids)	7	3	5	6	10.67	20	2026-04-25 10:25:09	2026-04-25 10:25:09
1618	Bermuda Labubu Azul (Pimpolho)	18	1	1	2	72.52	26	2026-04-25 10:25:09	2026-04-25 10:25:09
1619	Calçado Stitch Dourado(a) (Lilica Ripilica)	28	4	17	11	58.32	19	2026-04-25 10:25:09	2026-04-25 10:25:09
1620	Calçado Básico(a) Prata (Brandille)	4	4	18	19	19.14	5	2026-04-25 10:25:09	2026-04-25 10:25:09
1621	Meia Loney Tunes Rosa (Brandille)	22	14	2	14	119.14	5	2026-04-25 10:25:09	2026-04-25 10:25:09
1622	Calcinha Loney Tunes Dourado(a) (Pimpolho)	22	6	17	13	58.73	26	2026-04-25 10:25:09	2026-04-25 10:25:09
1623	Jaqueta Clássico(a) Turquesa (Brandille)	6	11	15	12	101.40	5	2026-04-25 10:25:09	2026-04-25 10:25:09
1624	Calça Xadrez Amarelo(a) (Petit Royal)	32	5	7	4	26.88	25	2026-04-25 10:25:09	2026-04-25 10:25:09
1625	Biquine Leve Preto(a) (Disney Baby)	19	2	3	17	90.84	12	2026-04-25 10:25:09	2026-04-25 10:25:09
1626	Casaco Poliéster Prata (Petit Royal)	24	9	18	4	59.50	25	2026-04-25 10:25:09	2026-04-25 10:25:09
1627	Saia Curto(a) Prata (Hering Kids)	9	16	18	13	47.99	15	2026-04-25 10:25:09	2026-04-25 10:25:09
1628	Calçado Stitch Dourado(a) (Maria Filó Kids)	28	4	17	13	18.42	20	2026-04-25 10:25:09	2026-04-25 10:25:09
1629	Macacão Seda Vermelho(a) (Zoe Kids)	27	12	6	8	102.03	31	2026-04-25 10:25:09	2026-04-25 10:25:09
1630	Pijama Turma da Mônica Amarelo(a) (C&A Kids)	31	15	7	9	94.80	7	2026-04-25 10:25:09	2026-04-25 10:25:09
1631	Calçado Animal Print Branco(a) (Zoe Kids)	3	4	4	12	23.83	31	2026-04-25 10:25:09	2026-04-25 10:25:09
1632	Calçado Durável Azul (Hering Kids)	10	4	1	9	108.18	15	2026-04-25 10:25:09	2026-04-25 10:25:09
1633	Camiseta Listrado Prata (C&A Kids)	20	8	18	15	101.08	7	2026-04-25 10:25:09	2026-04-25 10:25:09
1634	Saia Leve Laranja (Boboi)	19	16	11	19	42.09	4	2026-04-25 10:25:09	2026-04-25 10:25:09
1635	Meia Listrado Azul (Petit Royal)	20	14	1	8	78.18	25	2026-04-25 10:25:09	2026-04-25 10:25:09
1636	Calcinha Listrado Prata (Farm Kids)	20	6	18	3	34.23	14	2026-04-25 10:25:09	2026-04-25 10:25:09
1637	Vestido Elástico(a) Lilás (Zoe Kids)	11	21	16	4	88.20	31	2026-04-25 10:25:09	2026-04-25 10:25:09
1638	Jaqueta Esportivo(a) Amarelo(a) (Salsa Jeans Kids)	12	11	7	3	23.47	30	2026-04-25 10:25:09	2026-04-25 10:25:09
1639	Camisa Curto(a) Cáqui (Hering Kids)	9	7	20	13	62.77	15	2026-04-25 10:25:09	2026-04-25 10:25:09
1640	Maiô Turma da Mônica Bege (Kily)	31	13	14	1	30.90	17	2026-04-25 10:25:09	2026-04-25 10:25:09
1641	Vestido Leve Bege (Puket Kids)	19	21	14	19	63.62	27	2026-04-25 10:25:09	2026-04-25 10:25:09
1642	Cueca Durável Azul (Farm Kids)	10	10	1	11	83.95	14	2026-04-25 10:25:09	2026-04-25 10:25:09
1643	Meia Turma da Mônica Roxo(a) (Kily)	31	14	12	17	80.19	17	2026-04-25 10:25:09	2026-04-25 10:25:09
1644	Macacão Elástico(a) Preto(a) (Disney Baby)	11	12	3	9	46.46	12	2026-04-25 10:25:09	2026-04-25 10:25:09
1645	Meia Fit Branco(a) (Lilica Ripilica)	14	14	4	3	90.73	19	2026-04-25 10:25:09	2026-04-25 10:25:09
1646	Camiseta Respirável Azul (Kily)	25	8	1	13	49.76	17	2026-04-25 10:25:09	2026-04-25 10:25:09
1647	Camiseta Casual Cinza (Dafiti Kids)	5	8	8	4	33.94	11	2026-04-25 10:25:09	2026-04-25 10:25:09
1648	Sutiã Floral Verde (Disney Kids)	15	19	5	17	99.32	13	2026-04-25 10:25:09	2026-04-25 10:25:09
1649	Sutiã Confortável Preto(a) (Lacoste Kids)	8	19	3	4	29.75	18	2026-04-25 10:25:09	2026-04-25 10:25:09
1650	Sutiã Algodão Marrom (Brandille)	2	19	13	13	19.21	5	2026-04-25 10:25:09	2026-04-25 10:25:09
1651	Biquine Algodão Preto(a) (Colcci Kids)	2	2	3	1	13.40	9	2026-04-25 10:25:09	2026-04-25 10:25:09
1652	Jaqueta Esportivo(a) Laranja (Maria Filó Kids)	12	11	11	19	18.68	20	2026-04-25 10:25:09	2026-04-25 10:25:09
1653	Calcinha Básico(a) Cáqui (Lilica Ripilica)	4	6	20	18	68.88	19	2026-04-25 10:25:09	2026-04-25 10:25:09
1654	Calcinha Elástico(a) Preto(a) (Pimpolho)	11	6	3	2	53.80	26	2026-04-25 10:25:09	2026-04-25 10:25:09
1655	Sutiã Casual Bege (Brandille)	5	19	14	15	79.67	5	2026-04-25 10:25:09	2026-04-25 10:25:09
1656	Blusa Fit Lilás (Pimpolho)	14	3	16	3	114.04	26	2026-04-25 10:25:09	2026-04-25 10:25:09
1657	Camisa Esportivo(a) Vermelho(a) (Salsa Jeans Kids)	12	7	6	2	109.51	30	2026-04-25 10:25:09	2026-04-25 10:25:09
1658	Macacão Floral Vermelho(a) (Conjunto Infantil)	15	12	6	4	89.67	10	2026-04-25 10:25:09	2026-04-25 10:25:09
1659	Pijama Loney Tunes Dourado(a) (Salsa Jeans Kids)	22	15	17	17	99.79	30	2026-04-25 10:25:09	2026-04-25 10:25:09
1660	Blusa Colorido(a) Rosa Choque (Boboi)	7	3	10	5	32.27	4	2026-04-25 10:25:09	2026-04-25 10:25:09
1661	Calcinha Algodão Vermelho(a) (Conjunto Infantil)	2	6	6	12	106.59	10	2026-04-25 10:25:09	2026-04-25 10:25:09
1662	Calça Estampado(a) Amarelo(a) (Dafiti Kids)	13	5	7	10	26.08	11	2026-04-25 10:25:09	2026-04-25 10:25:09
1663	Calcinha Moleton Cáqui (Adidas Kids)	23	6	20	19	48.69	1	2026-04-25 10:25:09	2026-04-25 10:25:09
1664	Maiô Confortável Marrom (Puket Kids)	8	13	13	11	114.96	27	2026-04-25 10:25:09	2026-04-25 10:25:09
1665	Cueca Turma da Mônica Dourado(a) (Bendita Cute)	31	10	17	5	44.64	3	2026-04-25 10:25:09	2026-04-25 10:25:09
1666	Pijama Seda Roxo(a) (Conjunto Infantil)	27	15	12	16	103.41	10	2026-04-25 10:25:09	2026-04-25 10:25:09
1667	Blusa Esportivo(a) Vermelho(a) (Brandille)	12	3	6	19	57.68	5	2026-04-25 10:25:09	2026-04-25 10:25:09
1668	Calça Saja Cinza (Zoe Kids)	26	5	8	19	16.44	31	2026-04-25 10:25:09	2026-04-25 10:25:09
1669	Calcinha Elástico(a) Verde (Mundo Pet)	11	6	5	4	72.68	23	2026-04-25 10:25:09	2026-04-25 10:25:09
1670	Cueca Toy Store Preto(a) (Boboi)	30	10	3	15	37.20	4	2026-04-25 10:25:09	2026-04-25 10:25:09
1671	Meia Esportivo(a) Marrom (Carters)	12	14	13	17	15.11	8	2026-04-25 10:25:09	2026-04-25 10:25:09
1672	Vestido Clássico(a) Roxo(a) (Disney Baby)	6	21	12	18	29.29	12	2026-04-25 10:25:09	2026-04-25 10:25:09
1673	Calça Listrado Azul Escuro(a) (Marisol)	20	5	9	14	26.49	21	2026-04-25 10:25:09	2026-04-25 10:25:09
1674	Macacão Clássico(a) Dourado(a) (Farm Kids)	6	12	17	10	32.69	14	2026-04-25 10:25:09	2026-04-25 10:25:09
1675	Camisa Poliéster Vermelho(a) (Bendita Cute)	24	7	6	15	22.50	3	2026-04-25 10:25:09	2026-04-25 10:25:09
1676	Calça Fit Cinza (Ki Carinho)	14	5	8	13	18.65	16	2026-04-25 10:25:09	2026-04-25 10:25:09
1677	Cueca Clássico(a) Cáqui (Disney Kids)	6	10	20	2	112.67	13	2026-04-25 10:25:09	2026-04-25 10:25:09
1678	Casaco Toy Store Preto(a) (Disney Baby)	30	9	3	19	26.12	12	2026-04-25 10:25:09	2026-04-25 10:25:09
1679	Saia Clássico(a) Dourado(a) (Boboi)	6	16	17	17	50.48	4	2026-04-25 10:25:09	2026-04-25 10:25:09
1680	Short Poliéster Lilás (Kily)	24	17	16	15	33.73	17	2026-04-25 10:25:09	2026-04-25 10:25:09
1681	Camisa Colorido(a) Rosa Choque (Ki Carinho)	7	7	10	4	99.87	16	2026-04-25 10:25:09	2026-04-25 10:25:09
1682	Bermuda Colorido(a) Azul (Ki Carinho)	7	1	1	1	106.72	16	2026-04-25 10:25:09	2026-04-25 10:25:09
1683	Sutiã Estampado(a) Laranja (Petit Royal)	13	19	11	18	88.57	25	2026-04-25 10:25:09	2026-04-25 10:25:09
1684	Biquine Animal Print Azul (Colcci Kids)	3	2	1	14	71.47	9	2026-04-25 10:25:09	2026-04-25 10:25:09
1685	Macacão Saja Verde (Akazys)	26	12	5	8	102.45	2	2026-04-25 10:25:09	2026-04-25 10:25:09
1686	Calçado Ajustável Rosa Choque (Brandille)	1	4	10	19	68.36	5	2026-04-25 10:25:09	2026-04-25 10:25:09
1687	Sutiã Estampado(a) Azul Escuro(a) (Kily)	13	19	9	13	24.00	17	2026-04-25 10:25:09	2026-04-25 10:25:09
1688	Vestido Seda Branco(a) (Mundo Pet)	27	21	4	15	72.79	23	2026-04-25 10:25:09	2026-04-25 10:25:09
1689	Bermuda Algodão Cinza (Marisol)	2	1	8	11	76.41	21	2026-04-25 10:25:09	2026-04-25 10:25:09
1690	Maiô Toy Store Bege (Colcci Kids)	30	13	14	18	87.19	9	2026-04-25 10:25:09	2026-04-25 10:25:09
1691	Saia Formal Amarelo(a) (Farm Kids)	16	16	7	4	92.78	14	2026-04-25 10:25:09	2026-04-25 10:25:09
1692	Jaqueta Durável Vinho (Renner Kids)	10	11	19	16	62.31	28	2026-04-25 10:25:09	2026-04-25 10:25:09
1693	Pijama Turma da Mônica Roxo(a) (Disney Kids)	31	15	12	2	59.46	13	2026-04-25 10:25:09	2026-04-25 10:25:09
1694	Pijama Leve Laranja (Zoe Kids)	19	15	11	10	91.60	31	2026-04-25 10:25:09	2026-04-25 10:25:09
1695	Macacão Clássico(a) Amarelo(a) (Dafiti Kids)	6	12	7	6	98.75	11	2026-04-25 10:25:09	2026-04-25 10:25:09
1696	Calça Listrado Rosa Choque (Carters)	20	5	10	15	90.58	8	2026-04-25 10:25:09	2026-04-25 10:25:09
1697	Casaco Esportivo(a) Marrom (C&A Kids)	12	9	13	15	106.39	7	2026-04-25 10:25:09	2026-04-25 10:25:09
1698	Sunga Listrado Amarelo(a) (Puket Kids)	20	18	7	15	37.82	27	2026-04-25 10:25:09	2026-04-25 10:25:09
1699	Biquine Ajustável Vermelho(a) (Mundo Pet)	1	2	6	9	37.24	23	2026-04-25 10:25:09	2026-04-25 10:25:09
1700	Casaco Jeans Lilás (Kily)	17	9	16	5	19.30	17	2026-04-25 10:25:09	2026-04-25 10:25:09
1701	Meia Stitch Cáqui (Brandille)	28	14	20	9	66.98	5	2026-04-25 10:25:09	2026-04-25 10:25:09
1702	Pijama Moleton Rosa Choque (Renner Kids)	23	15	10	13	61.64	28	2026-04-25 10:25:09	2026-04-25 10:25:09
1703	Maiô Durável Prata (Lacoste Kids)	10	13	18	8	35.75	18	2026-04-25 10:25:09	2026-04-25 10:25:09
1704	Macacão Stitch Dourado(a) (Marisol)	28	12	17	1	60.20	21	2026-04-25 10:25:09	2026-04-25 10:25:09
1705	Macacão Colorido(a) Verde (Riachuelo Kids)	7	12	5	15	98.02	29	2026-04-25 10:25:09	2026-04-25 10:25:09
1706	Biquine Leve Bege (Ki Carinho)	19	2	14	17	110.87	16	2026-04-25 10:25:09	2026-04-25 10:25:09
1707	Calçado Labubu Cinza (Lilica Ripilica)	18	4	8	14	59.91	19	2026-04-25 10:25:09	2026-04-25 10:25:09
1708	Saia Xadrez Roxo(a) (Petit Royal)	32	16	12	10	77.19	25	2026-04-25 10:25:09	2026-04-25 10:25:09
1709	Saia Estampado(a) Lilás (Riachuelo Kids)	13	16	16	1	98.62	29	2026-04-25 10:25:09	2026-04-25 10:25:09
1710	Meia Temático(a) Dourado(a) (Marisol)	29	14	17	17	115.27	21	2026-04-25 10:25:09	2026-04-25 10:25:09
1711	Camisa Loney Tunes Rosa Choque (Marisol)	22	7	10	18	18.44	21	2026-04-25 10:25:09	2026-04-25 10:25:09
1712	Calçado Longa Laranja (Akazys)	21	4	11	1	109.15	2	2026-04-25 10:25:09	2026-04-25 10:25:09
1713	Blusa Moleton Marrom (Salsa Jeans Kids)	23	3	13	12	61.84	30	2026-04-25 10:25:09	2026-04-25 10:25:09
1714	Casaco Respirável Laranja (Renner Kids)	25	9	11	9	10.72	28	2026-04-25 10:25:09	2026-04-25 10:25:09
1715	Camiseta Algodão Cáqui (Farm Kids)	2	8	20	3	118.56	14	2026-04-25 10:25:09	2026-04-25 10:25:09
1716	Sutiã Longa Dourado(a) (Pimpolho)	21	19	17	6	33.97	26	2026-04-25 10:25:09	2026-04-25 10:25:09
1717	Sunga Loney Tunes Laranja (Renner Kids)	22	18	11	16	49.60	28	2026-04-25 10:25:09	2026-04-25 10:25:09
1718	Blusa Confortável Bege (Hering Kids)	8	3	14	11	82.82	15	2026-04-25 10:25:09	2026-04-25 10:25:09
1719	Sunga Respirável Preto(a) (C&A Baby)	25	18	3	17	119.85	6	2026-04-25 10:25:09	2026-04-25 10:25:09
1720	Sutiã Toy Store Verde (Pimpolho)	30	19	5	15	111.97	26	2026-04-25 10:25:09	2026-04-25 10:25:09
1721	Meia Respirável Azul Escuro(a) (Kily)	25	14	9	19	104.15	17	2026-04-25 10:25:09	2026-04-25 10:25:09
1722	Short Animal Print Preto(a) (Farm Kids)	3	17	3	18	52.83	14	2026-04-25 10:25:09	2026-04-25 10:25:09
1723	Meia Esportivo(a) Laranja (Salsa Jeans Kids)	12	14	11	18	102.90	30	2026-04-25 10:25:09	2026-04-25 10:25:09
1724	Maiô Estampado(a) Vermelho(a) (Hering Kids)	13	13	6	6	22.27	15	2026-04-25 10:25:09	2026-04-25 10:25:09
1725	Camisa Esportivo(a) Azul Escuro(a) (Puket Kids)	12	7	9	12	105.06	27	2026-04-25 10:25:09	2026-04-25 10:25:09
1726	Short Jeans Rosa Choque (Osklen Kids)	17	17	10	3	119.13	24	2026-04-25 10:25:09	2026-04-25 10:25:09
1727	Saia Esportivo(a) Prata (Conjunto Infantil)	12	16	18	5	22.68	10	2026-04-25 10:25:09	2026-04-25 10:25:09
1728	Saia Ajustável Rosa (Dafiti Kids)	1	16	2	10	87.70	11	2026-04-25 10:25:09	2026-04-25 10:25:09
1729	Cueca Stitch Amarelo(a) (Mundo Infantil)	28	10	7	1	49.63	22	2026-04-25 10:25:09	2026-04-25 10:25:09
1730	Macacão Curto(a) Prata (Pimpolho)	9	12	18	12	37.85	26	2026-04-25 10:25:09	2026-04-25 10:25:09
1731	Cueca Clássico(a) Rosa (Mundo Pet)	6	10	2	15	88.56	23	2026-04-25 10:25:09	2026-04-25 10:25:09
1732	Sunga Curto(a) Branco(a) (Disney Baby)	9	18	4	14	62.20	12	2026-04-25 10:25:09	2026-04-25 10:25:09
1733	Top Respirável Azul Escuro(a) (Boboi)	25	20	9	18	118.97	4	2026-04-25 10:25:09	2026-04-25 10:25:09
1734	Top Fit Amarelo(a) (Adidas Kids)	14	20	7	8	109.84	1	2026-04-25 10:25:09	2026-04-25 10:25:09
1735	Sutiã Confortável Turquesa (Colcci Kids)	8	19	15	14	48.83	9	2026-04-25 10:25:09	2026-04-25 10:25:09
1736	Cueca Saja Dourado(a) (Osklen Kids)	26	10	17	9	57.94	24	2026-04-25 10:25:09	2026-04-25 10:25:09
1737	Maiô Estampado(a) Cinza (Renner Kids)	13	13	8	18	82.19	28	2026-04-25 10:25:09	2026-04-25 10:25:09
1738	Pijama Elástico(a) Verde (Farm Kids)	11	15	5	16	18.30	14	2026-04-25 10:25:09	2026-04-25 10:25:09
1739	Biquine Floral Preto(a) (Akazys)	15	2	3	6	94.00	2	2026-04-25 10:25:09	2026-04-25 10:25:09
1740	Blusa Saja Laranja (Bendita Cute)	26	3	11	13	40.77	3	2026-04-25 10:25:09	2026-04-25 10:25:09
1741	Calça Esportivo(a) Dourado(a) (Dafiti Kids)	12	5	17	7	51.36	11	2026-04-25 10:25:09	2026-04-25 10:25:09
1742	Blusa Longa Preto(a) (C&A Kids)	21	3	3	6	79.04	7	2026-04-25 10:25:09	2026-04-25 10:25:09
1743	Vestido Algodão Bege (Pimpolho)	2	21	14	10	15.73	26	2026-04-25 10:25:09	2026-04-25 10:25:09
1744	Biquine Respirável Cáqui (C&A Baby)	25	2	20	19	34.10	6	2026-04-25 10:25:09	2026-04-25 10:25:09
1745	Vestido Temático(a) Verde (Farm Kids)	29	21	5	11	53.98	14	2026-04-25 10:25:09	2026-04-25 10:25:09
1746	Vestido Ajustável Cáqui (C&A Kids)	1	21	20	10	95.61	7	2026-04-25 10:25:09	2026-04-25 10:25:09
1747	Sunga Loney Tunes Verde (Conjunto Infantil)	22	18	5	8	111.94	10	2026-04-25 10:25:09	2026-04-25 10:25:09
1748	Camiseta Elástico(a) Vermelho(a) (Petit Royal)	11	8	6	5	101.82	25	2026-04-25 10:25:09	2026-04-25 10:25:09
1749	Maiô Saja Dourado(a) (Carters)	26	13	17	13	112.35	8	2026-04-25 10:25:09	2026-04-25 10:25:09
1750	Calcinha Formal Roxo(a) (Disney Kids)	16	6	12	14	102.97	13	2026-04-25 10:25:09	2026-04-25 10:25:09
1751	Sunga Toy Store Cáqui (Disney Baby)	30	18	20	14	26.55	12	2026-04-25 10:25:09	2026-04-25 10:25:09
1752	Macacão Seda Cáqui (Osklen Kids)	27	12	20	19	28.28	24	2026-04-25 10:25:09	2026-04-25 10:25:09
1753	Maiô Floral Vinho (Hering Kids)	15	13	19	17	109.06	15	2026-04-25 10:25:09	2026-04-25 10:25:09
1754	Meia Elástico(a) Amarelo(a) (Dafiti Kids)	11	14	7	6	102.01	11	2026-04-25 10:25:09	2026-04-25 10:25:09
1755	Cueca Turma da Mônica Dourado(a) (Hering Kids)	31	10	17	9	91.43	15	2026-04-25 10:25:09	2026-04-25 10:25:09
1756	Calça Fit Roxo(a) (Zoe Kids)	14	5	12	15	81.51	31	2026-04-25 10:25:09	2026-04-25 10:25:09
1757	Calcinha Temático(a) Marrom (Colcci Kids)	29	6	13	15	63.82	9	2026-04-25 10:25:09	2026-04-25 10:25:09
1758	Vestido Estampado(a) Turquesa (Boboi)	13	21	15	11	70.27	4	2026-04-25 10:25:09	2026-04-25 10:25:09
1759	Sunga Listrado Dourado(a) (Lacoste Kids)	20	18	17	15	117.23	18	2026-04-25 10:25:09	2026-04-25 10:25:09
1760	Camiseta Toy Store Rosa (Salsa Jeans Kids)	30	8	2	11	10.04	30	2026-04-25 10:25:09	2026-04-25 10:25:09
1761	Bermuda Casual Branco(a) (Brandille)	5	1	4	3	117.37	5	2026-04-25 10:25:09	2026-04-25 10:25:09
1762	Sutiã Ajustável Preto(a) (Adidas Kids)	1	19	3	6	17.29	1	2026-04-25 10:25:09	2026-04-25 10:25:09
1763	Biquine Loney Tunes Roxo(a) (C&A Kids)	22	2	12	10	102.92	7	2026-04-25 10:25:09	2026-04-25 10:25:09
1764	Blusa Jeans Vinho (Hering Kids)	17	3	19	18	82.75	15	2026-04-25 10:25:09	2026-04-25 10:25:09
1765	Vestido Saja Cinza (Colcci Kids)	26	21	8	3	75.22	9	2026-04-25 10:25:09	2026-04-25 10:25:09
1766	Sunga Ajustável Roxo(a) (Marisol)	1	18	12	7	45.73	21	2026-04-25 10:25:09	2026-04-25 10:25:09
1767	Short Loney Tunes Cinza (Hering Kids)	22	17	8	8	36.76	15	2026-04-25 10:25:09	2026-04-25 10:25:09
1768	Saia Poliéster Amarelo(a) (Lacoste Kids)	24	16	7	10	111.38	18	2026-04-25 10:25:09	2026-04-25 10:25:09
1769	Camisa Turma da Mônica Marrom (Disney Baby)	31	7	13	19	72.96	12	2026-04-25 10:25:09	2026-04-25 10:25:09
1770	Casaco Colorido(a) Rosa Choque (Adidas Kids)	7	9	10	16	15.91	1	2026-04-25 10:25:09	2026-04-25 10:25:09
1771	Cueca Leve Bege (Dafiti Kids)	19	10	14	19	116.96	11	2026-04-25 10:25:09	2026-04-25 10:25:09
1772	Maiô Labubu Azul Escuro(a) (Marisol)	18	13	9	17	29.50	21	2026-04-25 10:25:09	2026-04-25 10:25:09
1773	Jaqueta Turma da Mônica Lilás (Pimpolho)	31	11	16	10	13.41	26	2026-04-25 10:25:09	2026-04-25 10:25:09
1774	Biquine Xadrez Amarelo(a) (Riachuelo Kids)	32	2	7	18	111.35	29	2026-04-25 10:25:09	2026-04-25 10:25:09
1775	Sunga Elástico(a) Vermelho(a) (Ki Carinho)	11	18	6	4	106.11	16	2026-04-25 10:25:09	2026-04-25 10:25:09
1776	Biquine Básico(a) Cinza (Mundo Pet)	4	2	8	2	106.65	23	2026-04-25 10:25:09	2026-04-25 10:25:09
1777	Macacão Toy Store Marrom (Colcci Kids)	30	12	13	17	43.56	9	2026-04-25 10:25:09	2026-04-25 10:25:09
1778	Biquine Toy Store Dourado(a) (Hering Kids)	30	2	17	17	79.60	15	2026-04-25 10:25:09	2026-04-25 10:25:09
1779	Blusa Temático(a) Turquesa (Pimpolho)	29	3	15	15	27.36	26	2026-04-25 10:25:09	2026-04-25 10:25:09
1780	Meia Jeans Amarelo(a) (Carters)	17	14	7	7	45.46	8	2026-04-25 10:25:09	2026-04-25 10:25:09
1781	Camisa Saja Amarelo(a) (Farm Kids)	26	7	7	4	82.30	14	2026-04-25 10:25:09	2026-04-25 10:25:09
1782	Camisa Curto(a) Rosa Choque (Petit Royal)	9	7	10	9	84.36	25	2026-04-25 10:25:09	2026-04-25 10:25:09
1783	Short Stitch Verde (Marisol)	28	17	5	17	116.08	21	2026-04-25 10:25:09	2026-04-25 10:25:09
1784	Biquine Stitch Preto(a) (Renner Kids)	28	2	3	18	48.83	28	2026-04-25 10:25:09	2026-04-25 10:25:09
1785	Calcinha Temático(a) Laranja (Maria Filó Kids)	29	6	11	11	96.29	20	2026-04-25 10:25:09	2026-04-25 10:25:09
1786	Meia Algodão Roxo(a) (Maria Filó Kids)	2	14	12	9	80.86	20	2026-04-25 10:25:09	2026-04-25 10:25:09
1787	Maiô Animal Print Bege (Disney Kids)	3	13	14	7	68.07	13	2026-04-25 10:25:09	2026-04-25 10:25:09
1788	Top Animal Print Vinho (Osklen Kids)	3	20	19	13	91.82	24	2026-04-25 10:25:09	2026-04-25 10:25:09
1789	Biquine Fit Azul Escuro(a) (Conjunto Infantil)	14	2	9	9	82.15	10	2026-04-25 10:25:09	2026-04-25 10:25:09
1790	Camiseta Xadrez Rosa Choque (Hering Kids)	32	8	10	16	50.69	15	2026-04-25 10:25:09	2026-04-25 10:25:09
1791	Casaco Ajustável Bege (Farm Kids)	1	9	14	2	21.54	14	2026-04-25 10:25:09	2026-04-25 10:25:09
1792	Sutiã Estampado(a) Vinho (Brandille)	13	19	19	9	41.22	5	2026-04-25 10:25:09	2026-04-25 10:25:09
1793	Cueca Algodão Prata (Mundo Pet)	2	10	18	9	94.13	23	2026-04-25 10:25:09	2026-04-25 10:25:09
1794	Sunga Leve Dourado(a) (C&A Kids)	19	18	17	15	78.97	7	2026-04-25 10:25:09	2026-04-25 10:25:09
1795	Calçado Labubu Turquesa (Renner Kids)	18	4	15	6	13.08	28	2026-04-25 10:25:09	2026-04-25 10:25:09
1796	Pijama Temático(a) Verde (Zoe Kids)	29	15	5	4	62.28	31	2026-04-25 10:25:09	2026-04-25 10:25:09
1797	Camisa Toy Store Branco(a) (Mundo Pet)	30	7	4	2	74.38	23	2026-04-25 10:25:09	2026-04-25 10:25:09
1798	Jaqueta Seda Vermelho(a) (Adidas Kids)	27	11	6	13	24.37	1	2026-04-25 10:25:09	2026-04-25 10:25:09
1799	Bermuda Confortável Azul (Brandille)	8	1	1	12	44.53	5	2026-04-25 10:25:09	2026-04-25 10:25:09
1800	Camiseta Temático(a) Roxo(a) (Renner Kids)	29	8	12	7	75.60	28	2026-04-25 10:25:09	2026-04-25 10:25:09
1801	Camiseta Moleton Azul Escuro(a) (Colcci Kids)	23	8	9	3	77.60	9	2026-04-25 10:25:09	2026-04-25 10:25:09
1802	Jaqueta Curto(a) Bege (Mundo Pet)	9	11	14	8	107.20	23	2026-04-25 10:25:09	2026-04-25 10:25:09
1803	Top Elástico(a) Amarelo(a) (Osklen Kids)	11	20	7	6	82.98	24	2026-04-25 10:25:09	2026-04-25 10:25:09
1804	Maiô Jeans Rosa (Zoe Kids)	17	13	2	5	68.52	31	2026-04-25 10:25:09	2026-04-25 10:25:09
1805	Bermuda Poliéster Amarelo(a) (Riachuelo Kids)	24	1	7	3	68.07	29	2026-04-25 10:25:09	2026-04-25 10:25:09
1806	Cueca Xadrez Roxo(a) (Akazys)	32	10	12	15	104.97	2	2026-04-25 10:25:09	2026-04-25 10:25:09
1807	Maiô Básico(a) Marrom (Osklen Kids)	4	13	13	2	22.09	24	2026-04-25 10:25:09	2026-04-25 10:25:09
1808	Top Listrado Dourado(a) (Colcci Kids)	20	20	17	13	111.04	9	2026-04-25 10:25:09	2026-04-25 10:25:09
1809	Biquine Animal Print Cáqui (Salsa Jeans Kids)	3	2	20	5	94.40	30	2026-04-25 10:25:09	2026-04-25 10:25:09
1810	Vestido Esportivo(a) Bege (Disney Kids)	12	21	14	18	26.61	13	2026-04-25 10:25:09	2026-04-25 10:25:09
1811	Macacão Ajustável Laranja (Osklen Kids)	1	12	11	3	55.46	24	2026-04-25 10:25:09	2026-04-25 10:25:09
1812	Jaqueta Elástico(a) Roxo(a) (C&A Kids)	11	11	12	15	50.25	7	2026-04-25 10:25:09	2026-04-25 10:25:09
1813	Sutiã Clássico(a) Azul (Puket Kids)	6	19	1	17	74.35	27	2026-04-25 10:25:09	2026-04-25 10:25:09
1814	Short Toy Store Cinza (Zoe Kids)	30	17	8	13	39.35	31	2026-04-25 10:25:09	2026-04-25 10:25:09
1815	Casaco Elástico(a) Cáqui (Hering Kids)	11	9	20	2	75.14	15	2026-04-25 10:25:09	2026-04-25 10:25:09
1816	Camiseta Jeans Azul Escuro(a) (Mundo Pet)	17	8	9	7	65.72	23	2026-04-25 10:25:09	2026-04-25 10:25:09
1817	Sutiã Longa Verde (Lilica Ripilica)	21	19	5	9	19.29	19	2026-04-25 10:25:09	2026-04-25 10:25:09
1818	Vestido Labubu Amarelo(a) (Petit Royal)	18	21	7	16	64.55	25	2026-04-25 10:25:09	2026-04-25 10:25:09
1819	Short Colorido(a) Cáqui (Marisol)	7	17	20	3	25.05	21	2026-04-25 10:25:09	2026-04-25 10:25:09
1820	Calcinha Toy Store Azul Escuro(a) (Riachuelo Kids)	30	6	9	15	117.50	29	2026-04-25 10:25:09	2026-04-25 10:25:09
1821	Sutiã Jeans Verde (Colcci Kids)	17	19	5	18	52.96	9	2026-04-25 10:25:09	2026-04-25 10:25:09
1822	Meia Respirável Verde (Mundo Pet)	25	14	5	6	111.82	23	2026-04-25 10:25:09	2026-04-25 10:25:09
1823	Top Fit Vinho (C&A Kids)	14	20	19	2	48.88	7	2026-04-25 10:25:09	2026-04-25 10:25:09
1824	Calcinha Turma da Mônica Vermelho(a) (Riachuelo Kids)	31	6	6	13	97.21	29	2026-04-25 10:25:09	2026-04-25 10:25:09
1825	Maiô Loney Tunes Rosa Choque (Carters)	22	13	10	3	67.15	8	2026-04-25 10:25:09	2026-04-25 10:25:09
1826	Macacão Curto(a) Vinho (Renner Kids)	9	12	19	13	28.93	28	2026-04-25 10:25:09	2026-04-25 10:25:09
1827	Calcinha Loney Tunes Dourado(a) (Puket Kids)	22	6	17	18	49.06	27	2026-04-25 10:25:09	2026-04-25 10:25:09
1828	Biquine Elástico(a) Dourado(a) (Conjunto Infantil)	11	2	17	19	117.26	10	2026-04-25 10:25:09	2026-04-25 10:25:09
1829	Cueca Poliéster Verde (Disney Baby)	24	10	5	11	97.89	12	2026-04-25 10:25:09	2026-04-25 10:25:09
1830	Short Listrado Rosa (Riachuelo Kids)	20	17	2	15	14.67	29	2026-04-25 10:25:09	2026-04-25 10:25:09
1831	Calcinha Clássico(a) Marrom (Salsa Jeans Kids)	6	6	13	16	59.70	30	2026-04-25 10:25:09	2026-04-25 10:25:09
1832	Casaco Curto(a) Marrom (Hering Kids)	9	9	13	11	29.90	15	2026-04-25 10:25:09	2026-04-25 10:25:09
1833	Camiseta Stitch Azul Escuro(a) (Maria Filó Kids)	28	8	9	13	87.27	20	2026-04-25 10:25:09	2026-04-25 10:25:09
1834	Vestido Labubu Marrom (Bendita Cute)	18	21	13	9	85.57	3	2026-04-25 10:25:09	2026-04-25 10:25:09
1835	Camiseta Curto(a) Lilás (Akazys)	9	8	16	5	63.26	2	2026-04-25 10:25:09	2026-04-25 10:25:09
1836	Sutiã Stitch Branco(a) (Marisol)	28	19	4	6	51.74	21	2026-04-25 10:25:09	2026-04-25 10:25:09
1837	Calcinha Algodão Azul (Mundo Pet)	2	6	1	7	30.03	23	2026-04-25 10:25:09	2026-04-25 10:25:09
1838	Short Durável Marrom (Akazys)	10	17	13	2	19.58	2	2026-04-25 10:25:09	2026-04-25 10:25:09
1839	Biquine Seda Laranja (Colcci Kids)	27	2	11	1	12.39	9	2026-04-25 10:25:09	2026-04-25 10:25:09
1840	Bermuda Confortável Verde (Ki Carinho)	8	1	5	15	38.75	16	2026-04-25 10:25:09	2026-04-25 10:25:09
1841	Calçado Fit Rosa (Conjunto Infantil)	14	4	2	5	63.81	10	2026-04-25 10:25:09	2026-04-25 10:25:09
1842	Maiô Fit Vinho (Ki Carinho)	14	13	19	9	21.50	16	2026-04-25 10:25:09	2026-04-25 10:25:09
1843	Cueca Longa Prata (Maria Filó Kids)	21	10	18	17	38.87	20	2026-04-25 10:25:09	2026-04-25 10:25:09
1844	Jaqueta Colorido(a) Cinza (Riachuelo Kids)	7	11	8	19	57.98	29	2026-04-25 10:25:09	2026-04-25 10:25:09
1845	Sunga Turma da Mônica Dourado(a) (C&A Baby)	31	18	17	8	43.34	6	2026-04-25 10:25:09	2026-04-25 10:25:09
1846	Camiseta Ajustável Cáqui (Farm Kids)	1	8	20	7	77.07	14	2026-04-25 10:25:09	2026-04-25 10:25:09
1847	Meia Animal Print Vinho (Disney Baby)	3	14	19	19	107.07	12	2026-04-25 10:25:09	2026-04-25 10:25:09
1848	Maiô Respirável Turquesa (Renner Kids)	25	13	15	13	18.26	28	2026-04-25 10:25:09	2026-04-25 10:25:09
1849	Meia Labubu Lilás (Mundo Infantil)	18	14	16	4	33.47	22	2026-04-25 10:25:09	2026-04-25 10:25:09
1850	Jaqueta Floral Cinza (C&A Kids)	15	11	8	9	39.98	7	2026-04-25 10:25:09	2026-04-25 10:25:09
1851	Casaco Fit Azul Escuro(a) (Petit Royal)	14	9	9	6	34.76	25	2026-04-25 10:25:09	2026-04-25 10:25:09
1852	Calça Labubu Preto(a) (Ki Carinho)	18	5	3	18	106.58	16	2026-04-25 10:25:09	2026-04-25 10:25:09
1853	Blusa Longa Azul (Colcci Kids)	21	3	1	2	49.77	9	2026-04-25 10:25:09	2026-04-25 10:25:09
1854	Bermuda Saja Preto(a) (C&A Kids)	26	1	3	15	94.94	7	2026-04-25 10:25:09	2026-04-25 10:25:09
1855	Bermuda Labubu Cáqui (Maria Filó Kids)	18	1	20	7	113.13	20	2026-04-25 10:25:09	2026-04-25 10:25:09
1856	Camisa Temático(a) Vermelho(a) (Lilica Ripilica)	29	7	6	19	38.98	19	2026-04-25 10:25:09	2026-04-25 10:25:09
1857	Short Listrado Cinza (Akazys)	20	17	8	4	53.23	2	2026-04-25 10:25:09	2026-04-25 10:25:09
1858	Vestido Esportivo(a) Rosa Choque (Hering Kids)	12	21	10	15	93.73	15	2026-04-25 10:25:09	2026-04-25 10:25:09
1859	Vestido Longa Marrom (Mundo Pet)	21	21	13	16	50.28	23	2026-04-25 10:25:09	2026-04-25 10:25:09
1860	Casaco Loney Tunes Dourado(a) (Lacoste Kids)	22	9	17	4	60.14	18	2026-04-25 10:25:09	2026-04-25 10:25:09
1861	Short Algodão Roxo(a) (Maria Filó Kids)	2	17	12	12	111.49	20	2026-04-25 10:25:09	2026-04-25 10:25:09
1862	Bermuda Turma da Mônica Preto(a) (Petit Royal)	31	1	3	1	86.07	25	2026-04-25 10:25:09	2026-04-25 10:25:09
1863	Macacão Loney Tunes Rosa (Zoe Kids)	22	12	2	15	98.92	31	2026-04-25 10:25:09	2026-04-25 10:25:09
1864	Saia Jeans Vinho (Carters)	17	16	19	4	99.03	8	2026-04-25 10:25:09	2026-04-25 10:25:09
1865	Camisa Seda Cáqui (Ki Carinho)	27	7	20	6	37.85	16	2026-04-25 10:25:09	2026-04-25 10:25:09
1866	Pijama Algodão Verde (Disney Kids)	2	15	5	2	110.69	13	2026-04-25 10:25:09	2026-04-25 10:25:09
1867	Vestido Estampado(a) Rosa Choque (Carters)	13	21	10	3	78.96	8	2026-04-25 10:25:09	2026-04-25 10:25:09
1868	Sunga Loney Tunes Roxo(a) (C&A Kids)	22	18	12	12	58.83	7	2026-04-25 10:25:09	2026-04-25 10:25:09
1869	Sunga Esportivo(a) Cinza (Bendita Cute)	12	18	8	13	18.28	3	2026-04-25 10:25:09	2026-04-25 10:25:09
1870	Sunga Ajustável Cáqui (Osklen Kids)	1	18	20	16	97.90	24	2026-04-25 10:25:09	2026-04-25 10:25:09
1871	Meia Floral Prata (Pimpolho)	15	14	18	14	46.73	26	2026-04-25 10:25:09	2026-04-25 10:25:09
1872	Macacão Formal Marrom (Lilica Ripilica)	16	12	13	2	87.84	19	2026-04-25 10:25:09	2026-04-25 10:25:09
1873	Bermuda Esportivo(a) Branco(a) (Petit Royal)	12	1	4	9	53.76	25	2026-04-25 10:25:09	2026-04-25 10:25:09
1874	Biquine Moleton Verde (Akazys)	23	2	5	10	102.45	2	2026-04-25 10:25:09	2026-04-25 10:25:09
1875	Sunga Toy Store Verde (Maria Filó Kids)	30	18	5	5	33.94	20	2026-04-25 10:25:09	2026-04-25 10:25:09
1876	Sutiã Clássico(a) Lilás (C&A Kids)	6	19	16	11	90.91	7	2026-04-25 10:25:09	2026-04-25 10:25:09
1877	Cueca Fit Rosa (Farm Kids)	14	10	2	18	72.88	14	2026-04-25 10:25:09	2026-04-25 10:25:09
1878	Saia Básico(a) Rosa Choque (Mundo Pet)	4	16	10	6	58.35	23	2026-04-25 10:25:09	2026-04-25 10:25:09
1879	Cueca Formal Prata (Adidas Kids)	16	10	18	7	116.05	1	2026-04-25 10:25:09	2026-04-25 10:25:09
1880	Casaco Poliéster Cáqui (Riachuelo Kids)	24	9	20	15	118.74	29	2026-04-25 10:25:09	2026-04-25 10:25:09
1881	Macacão Xadrez Cinza (Lacoste Kids)	32	12	8	14	115.14	18	2026-04-25 10:25:09	2026-04-25 10:25:09
1882	Jaqueta Floral Prata (Conjunto Infantil)	15	11	18	11	31.02	10	2026-04-25 10:25:09	2026-04-25 10:25:09
1883	Camiseta Loney Tunes Laranja (Mundo Pet)	22	8	11	4	113.40	23	2026-04-25 10:25:09	2026-04-25 10:25:09
1884	Calçado Labubu Roxo(a) (Farm Kids)	18	4	12	14	75.24	14	2026-04-25 10:25:09	2026-04-25 10:25:09
1885	Bermuda Xadrez Azul (Riachuelo Kids)	32	1	1	4	70.37	29	2026-04-25 10:25:09	2026-04-25 10:25:09
1886	Calcinha Poliéster Laranja (Bendita Cute)	24	6	11	9	108.71	3	2026-04-25 10:25:09	2026-04-25 10:25:09
1887	Camisa Jeans Vermelho(a) (Mundo Pet)	17	7	6	15	36.69	23	2026-04-25 10:25:09	2026-04-25 10:25:09
1888	Calçado Leve Branco(a) (Marisol)	19	4	4	14	29.12	21	2026-04-25 10:25:09	2026-04-25 10:25:09
1889	Saia Listrado Azul (Petit Royal)	20	16	1	15	50.59	25	2026-04-25 10:25:09	2026-04-25 10:25:09
1890	Maiô Ajustável Cáqui (Puket Kids)	1	13	20	19	48.88	27	2026-04-25 10:25:09	2026-04-25 10:25:09
1891	Sutiã Fit Marrom (Puket Kids)	14	19	13	1	106.10	27	2026-04-25 10:25:09	2026-04-25 10:25:09
1892	Maiô Floral Rosa Choque (Marisol)	15	13	10	8	55.16	21	2026-04-25 10:25:09	2026-04-25 10:25:09
1893	Jaqueta Curto(a) Turquesa (Ki Carinho)	9	11	15	6	74.27	16	2026-04-25 10:25:09	2026-04-25 10:25:09
1894	Jaqueta Fit Rosa (Boboi)	14	11	2	13	96.98	4	2026-04-25 10:25:09	2026-04-25 10:25:09
1895	Macacão Elástico(a) Vinho (Bendita Cute)	11	12	19	18	43.91	3	2026-04-25 10:25:09	2026-04-25 10:25:09
1896	Saia Loney Tunes Bege (Ki Carinho)	22	16	14	19	91.18	16	2026-04-25 10:25:09	2026-04-25 10:25:09
1897	Blusa Jeans Vinho (Carters)	17	3	19	15	22.96	8	2026-04-25 10:25:09	2026-04-25 10:25:09
1898	Vestido Fit Azul (Osklen Kids)	14	21	1	9	117.09	24	2026-04-25 10:25:09	2026-04-25 10:25:09
1899	Camisa Elástico(a) Rosa Choque (Disney Baby)	11	7	10	17	102.76	12	2026-04-25 10:25:09	2026-04-25 10:25:09
1900	Bermuda Stitch Rosa (Renner Kids)	28	1	2	4	29.80	28	2026-04-25 10:25:09	2026-04-25 10:25:09
1901	Sutiã Respirável Marrom (Boboi)	25	19	13	7	31.46	4	2026-04-25 10:25:09	2026-04-25 10:25:09
1902	Meia Algodão Vinho (Pimpolho)	2	14	19	3	90.84	26	2026-04-25 10:25:09	2026-04-25 10:25:09
1903	Jaqueta Ajustável Cáqui (Adidas Kids)	1	11	20	2	101.48	1	2026-04-25 10:25:09	2026-04-25 10:25:09
1904	Maiô Básico(a) Cinza (Petit Royal)	4	13	8	17	43.70	25	2026-04-25 10:25:09	2026-04-25 10:25:09
1905	Calça Respirável Preto(a) (Lacoste Kids)	25	5	3	7	38.60	18	2026-04-25 10:25:09	2026-04-25 10:25:09
1906	Saia Animal Print Cáqui (Adidas Kids)	3	16	20	11	96.96	1	2026-04-25 10:25:09	2026-04-25 10:25:09
1907	Sunga Básico(a) Roxo(a) (Mundo Pet)	4	18	12	5	61.48	23	2026-04-25 10:25:09	2026-04-25 10:25:09
1908	Blusa Confortável Prata (Salsa Jeans Kids)	8	3	18	6	47.05	30	2026-04-25 10:25:09	2026-04-25 10:25:09
1909	Macacão Colorido(a) Rosa (Pimpolho)	7	12	2	10	88.02	26	2026-04-25 10:25:09	2026-04-25 10:25:09
1910	Cueca Casual Verde (Salsa Jeans Kids)	5	10	5	16	28.03	30	2026-04-25 10:25:09	2026-04-25 10:25:09
1911	Calçado Algodão Cinza (Renner Kids)	2	4	8	6	109.38	28	2026-04-25 10:25:09	2026-04-25 10:25:09
1912	Meia Toy Store Prata (Kily)	30	14	18	6	54.51	17	2026-04-25 10:25:09	2026-04-25 10:25:09
1913	Calça Ajustável Verde (Bendita Cute)	1	5	5	3	85.27	3	2026-04-25 10:25:09	2026-04-25 10:25:09
1914	Meia Curto(a) Dourado(a) (Pimpolho)	9	14	17	12	85.44	26	2026-04-25 10:25:09	2026-04-25 10:25:09
1915	Jaqueta Casual Rosa (Pimpolho)	5	11	2	14	51.99	26	2026-04-25 10:25:09	2026-04-25 10:25:09
1916	Short Poliéster Turquesa (Akazys)	24	17	15	2	70.14	2	2026-04-25 10:25:09	2026-04-25 10:25:09
1917	Casaco Turma da Mônica Lilás (Disney Baby)	31	9	16	3	31.21	12	2026-04-25 10:25:09	2026-04-25 10:25:09
1918	Bermuda Formal Cinza (Mundo Pet)	16	1	8	18	52.29	23	2026-04-25 10:25:09	2026-04-25 10:25:09
1919	Cueca Toy Store Branco(a) (Lilica Ripilica)	30	10	4	11	36.02	19	2026-04-25 10:25:09	2026-04-25 10:25:09
1920	Casaco Formal Verde (Hering Kids)	16	9	5	18	94.70	15	2026-04-25 10:25:09	2026-04-25 10:25:09
1921	Cueca Saja Verde (Salsa Jeans Kids)	26	10	5	13	17.92	30	2026-04-25 10:25:09	2026-04-25 10:25:09
1922	Cueca Respirável Azul Escuro(a) (Farm Kids)	25	10	9	17	104.67	14	2026-04-25 10:25:09	2026-04-25 10:25:09
1923	Casaco Toy Store Cinza (Carters)	30	9	8	5	67.85	8	2026-04-25 10:25:09	2026-04-25 10:25:09
1924	Calcinha Fit Cáqui (Disney Kids)	14	6	20	5	77.65	13	2026-04-25 10:25:09	2026-04-25 10:25:09
1925	Short Algodão Roxo(a) (Pimpolho)	2	17	12	5	31.13	26	2026-04-25 10:25:09	2026-04-25 10:25:09
1926	Bermuda Longa Rosa Choque (Disney Baby)	21	1	10	16	20.10	12	2026-04-25 10:25:09	2026-04-25 10:25:09
1927	Macacão Seda Marrom (Mundo Pet)	27	12	13	5	61.70	23	2026-04-25 10:25:09	2026-04-25 10:25:09
1928	Calçado Ajustável Verde (Renner Kids)	1	4	5	12	44.52	28	2026-04-25 10:25:09	2026-04-25 10:25:09
1929	Sunga Temático(a) Preto(a) (Boboi)	29	18	3	9	34.62	4	2026-04-25 10:25:09	2026-04-25 10:25:09
1930	Camiseta Temático(a) Verde (Renner Kids)	29	8	5	1	83.92	28	2026-04-25 10:25:09	2026-04-25 10:25:09
1931	Camiseta Stitch Cáqui (C&A Baby)	28	8	20	19	63.12	6	2026-04-25 10:25:09	2026-04-25 10:25:09
1932	Calça Loney Tunes Roxo(a) (Marisol)	22	5	12	17	24.71	21	2026-04-25 10:25:09	2026-04-25 10:25:09
1933	Blusa Colorido(a) Branco(a) (Zoe Kids)	7	3	4	1	65.30	31	2026-04-25 10:25:09	2026-04-25 10:25:09
1934	Biquine Turma da Mônica Vermelho(a) (Lacoste Kids)	31	2	6	4	69.71	18	2026-04-25 10:25:09	2026-04-25 10:25:09
1935	Calçado Curto(a) Prata (Disney Baby)	9	4	18	16	55.33	12	2026-04-25 10:25:09	2026-04-25 10:25:09
1936	Camiseta Confortável Amarelo(a) (Lacoste Kids)	8	8	7	18	48.54	18	2026-04-25 10:25:09	2026-04-25 10:25:09
1937	Vestido Formal Cáqui (Salsa Jeans Kids)	16	21	20	16	108.93	30	2026-04-25 10:25:09	2026-04-25 10:25:09
1938	Blusa Moleton Dourado(a) (Dafiti Kids)	23	3	17	1	50.80	11	2026-04-25 10:25:09	2026-04-25 10:25:09
1939	Blusa Temático(a) Verde (Conjunto Infantil)	29	3	5	17	16.36	10	2026-04-25 10:25:09	2026-04-25 10:25:09
1940	Sutiã Seda Branco(a) (Brandille)	27	19	4	17	24.27	5	2026-04-25 10:25:09	2026-04-25 10:25:09
1941	Cueca Jeans Turquesa (Akazys)	17	10	15	19	56.69	2	2026-04-25 10:25:09	2026-04-25 10:25:09
1942	Bermuda Animal Print Preto(a) (Salsa Jeans Kids)	3	1	3	6	26.94	30	2026-04-25 10:25:09	2026-04-25 10:25:09
1943	Blusa Temático(a) Cáqui (Osklen Kids)	29	3	20	14	67.76	24	2026-04-25 10:25:09	2026-04-25 10:25:09
1944	Maiô Jeans Roxo(a) (Marisol)	17	13	12	2	78.74	21	2026-04-25 10:25:09	2026-04-25 10:25:09
1945	Meia Moleton Vermelho(a) (Disney Baby)	23	14	6	7	96.63	12	2026-04-25 10:25:09	2026-04-25 10:25:09
1946	Casaco Temático(a) Prata (Mundo Pet)	29	9	18	10	78.57	23	2026-04-25 10:25:09	2026-04-25 10:25:09
1947	Vestido Temático(a) Branco(a) (Puket Kids)	29	21	4	13	84.91	27	2026-04-25 10:25:09	2026-04-25 10:25:09
1948	Cueca Algodão Azul (Pimpolho)	2	10	1	1	95.48	26	2026-04-25 10:25:09	2026-04-25 10:25:09
1949	Calcinha Casual Branco(a) (Bendita Cute)	5	6	4	4	119.89	3	2026-04-25 10:25:09	2026-04-25 10:25:09
1950	Calçado Temático(a) Laranja (Ki Carinho)	29	4	11	12	101.97	16	2026-04-25 10:25:09	2026-04-25 10:25:09
1951	Calça Algodão Roxo(a) (Adidas Kids)	2	5	12	3	16.85	1	2026-04-25 10:25:09	2026-04-25 10:25:09
1952	Camisa Turma da Mônica Cinza (Riachuelo Kids)	31	7	8	7	91.61	29	2026-04-25 10:25:09	2026-04-25 10:25:09
1953	Camiseta Básico(a) Branco(a) (Puket Kids)	4	8	4	8	78.45	27	2026-04-25 10:25:09	2026-04-25 10:25:09
1954	Maiô Esportivo(a) Dourado(a) (Lacoste Kids)	12	13	17	8	34.46	18	2026-04-25 10:25:09	2026-04-25 10:25:09
1955	Biquine Listrado Rosa (Pimpolho)	20	2	2	8	39.48	26	2026-04-25 10:25:09	2026-04-25 10:25:09
1956	Calcinha Clássico(a) Rosa Choque (Mundo Pet)	6	6	10	19	31.14	23	2026-04-25 10:25:09	2026-04-25 10:25:09
1957	Calçado Durável Rosa (Osklen Kids)	10	4	2	5	110.31	24	2026-04-25 10:25:09	2026-04-25 10:25:09
1958	Bermuda Floral Rosa Choque (Lilica Ripilica)	15	1	10	6	81.91	19	2026-04-25 10:25:09	2026-04-25 10:25:09
1959	Cueca Ajustável Vinho (Petit Royal)	1	10	19	4	41.88	25	2026-04-25 10:25:09	2026-04-25 10:25:09
1960	Maiô Temático(a) Vermelho(a) (C&A Baby)	29	13	6	8	44.50	6	2026-04-25 10:25:09	2026-04-25 10:25:09
1961	Calçado Algodão Preto(a) (Mundo Infantil)	2	4	3	4	80.28	22	2026-04-25 10:25:09	2026-04-25 10:25:09
1962	Calcinha Clássico(a) Bege (Pimpolho)	6	6	14	14	25.97	26	2026-04-25 10:25:09	2026-04-25 10:25:09
1963	Casaco Formal Marrom (Akazys)	16	9	13	17	54.69	2	2026-04-25 10:25:09	2026-04-25 10:25:09
1964	Biquine Moleton Laranja (Lilica Ripilica)	23	2	11	2	67.87	19	2026-04-25 10:25:09	2026-04-25 10:25:09
1965	Cueca Casual Azul (Akazys)	5	10	1	4	94.55	2	2026-04-25 10:25:09	2026-04-25 10:25:09
1966	Vestido Casual Preto(a) (Conjunto Infantil)	5	21	3	12	28.41	10	2026-04-25 10:25:09	2026-04-25 10:25:09
1967	Jaqueta Toy Store Verde (Mundo Pet)	30	11	5	18	89.84	23	2026-04-25 10:25:09	2026-04-25 10:25:09
1968	Jaqueta Casual Verde (Salsa Jeans Kids)	5	11	5	3	66.81	30	2026-04-25 10:25:09	2026-04-25 10:25:09
1969	Top Respirável Azul Escuro(a) (Maria Filó Kids)	25	20	9	18	37.44	20	2026-04-25 10:25:09	2026-04-25 10:25:09
1970	Calça Elástico(a) Vermelho(a) (Salsa Jeans Kids)	11	5	6	3	52.94	30	2026-04-25 10:25:09	2026-04-25 10:25:09
1971	Top Labubu Vinho (Carters)	18	20	19	8	38.04	8	2026-04-25 10:25:09	2026-04-25 10:25:09
1972	Calçado Curto(a) Azul (Lilica Ripilica)	9	4	1	7	47.55	19	2026-04-25 10:25:09	2026-04-25 10:25:09
1973	Short Longa Amarelo(a) (Conjunto Infantil)	21	17	7	16	100.15	10	2026-04-25 10:25:09	2026-04-25 10:25:09
1974	Calçado Floral Azul Escuro(a) (Lilica Ripilica)	15	4	9	15	70.62	19	2026-04-25 10:25:09	2026-04-25 10:25:09
1975	Jaqueta Fit Bege (Hering Kids)	14	11	14	13	112.23	15	2026-04-25 10:25:09	2026-04-25 10:25:09
1976	Vestido Seda Branco(a) (Colcci Kids)	27	21	4	19	34.12	9	2026-04-25 10:25:09	2026-04-25 10:25:09
1977	Blusa Clássico(a) Cinza (Colcci Kids)	6	3	8	12	60.76	9	2026-04-25 10:25:09	2026-04-25 10:25:09
1978	Jaqueta Animal Print Azul (Marisol)	3	11	1	7	94.55	21	2026-04-25 10:25:09	2026-04-25 10:25:09
1979	Biquine Colorido(a) Turquesa (Renner Kids)	7	2	15	13	56.91	28	2026-04-25 10:25:09	2026-04-25 10:25:09
1980	Blusa Listrado Azul (Boboi)	20	3	1	3	85.83	4	2026-04-25 10:25:09	2026-04-25 10:25:09
1981	Biquine Básico(a) Lilás (Renner Kids)	4	2	16	6	79.12	28	2026-04-25 10:25:09	2026-04-25 10:25:09
1982	Bermuda Stitch Cinza (C&A Kids)	28	1	8	17	99.86	7	2026-04-25 10:25:09	2026-04-25 10:25:09
1983	Calcinha Elástico(a) Laranja (Boboi)	11	6	11	18	32.62	4	2026-04-25 10:25:09	2026-04-25 10:25:09
1984	Pijama Turma da Mônica Azul (Lilica Ripilica)	31	15	1	15	38.34	19	2026-04-25 10:25:09	2026-04-25 10:25:09
1985	Sutiã Colorido(a) Prata (Lacoste Kids)	7	19	18	4	39.02	18	2026-04-25 10:25:09	2026-04-25 10:25:09
1986	Pijama Labubu Bege (Disney Kids)	18	15	14	8	94.17	13	2026-04-25 10:25:09	2026-04-25 10:25:09
1987	Macacão Formal Preto(a) (Renner Kids)	16	12	3	6	45.83	28	2026-04-25 10:25:09	2026-04-25 10:25:09
1988	Blusa Poliéster Azul Escuro(a) (Lilica Ripilica)	24	3	9	5	52.77	19	2026-04-25 10:25:09	2026-04-25 10:25:09
1989	Macacão Animal Print Laranja (Disney Baby)	3	12	11	7	34.80	12	2026-04-25 10:25:09	2026-04-25 10:25:09
1990	Camiseta Labubu Preto(a) (Marisol)	18	8	3	1	116.83	21	2026-04-25 10:25:09	2026-04-25 10:25:09
1991	Camisa Turma da Mônica Turquesa (Bendita Cute)	31	7	15	7	50.13	3	2026-04-25 10:25:09	2026-04-25 10:25:09
1992	Saia Temático(a) Rosa (Bendita Cute)	29	16	2	17	101.62	3	2026-04-25 10:25:09	2026-04-25 10:25:09
1993	Top Stitch Marrom (Adidas Kids)	28	20	13	3	91.58	1	2026-04-25 10:25:09	2026-04-25 10:25:09
1994	Calcinha Labubu Turquesa (Colcci Kids)	18	6	15	10	50.49	9	2026-04-25 10:25:09	2026-04-25 10:25:09
1995	Blusa Fit Preto(a) (Kily)	14	3	3	6	16.85	17	2026-04-25 10:25:09	2026-04-25 10:25:09
1996	Saia Loney Tunes Turquesa (Dafiti Kids)	22	16	15	14	68.80	11	2026-04-25 10:25:09	2026-04-25 10:25:09
1997	Camisa Respirável Cáqui (Riachuelo Kids)	25	7	20	12	58.47	29	2026-04-25 10:25:09	2026-04-25 10:25:09
1998	Bermuda Animal Print Preto(a) (Ki Carinho)	3	1	3	4	86.17	16	2026-04-25 10:25:09	2026-04-25 10:25:09
1999	Macacão Listrado Vinho (Mundo Infantil)	20	12	19	1	44.79	22	2026-04-25 10:25:09	2026-04-25 10:25:09
2000	Calcinha Casual Cinza (Marisol)	5	6	8	7	109.77	21	2026-04-25 10:25:09	2026-04-25 10:25:09
2001	Sunga Jeans Rosa (Hering Kids)	17	18	2	17	103.20	15	2026-04-25 10:25:09	2026-04-25 10:25:09
2002	Blusa Floral Azul (C&A Kids)	15	3	1	5	28.28	7	2026-04-25 10:25:09	2026-04-25 10:25:09
2003	Cueca Leve Branco(a) (Puket Kids)	19	10	4	11	112.22	27	2026-04-25 10:25:09	2026-04-25 10:25:09
2004	Camisa Algodão Azul Escuro(a) (Farm Kids)	2	7	9	8	93.18	14	2026-04-25 10:25:09	2026-04-25 10:25:09
2005	Jaqueta Esportivo(a) Roxo(a) (C&A Baby)	12	11	12	16	29.76	6	2026-04-25 10:25:09	2026-04-25 10:25:09
2006	Top Stitch Marrom (Brandille)	28	20	13	11	96.54	5	2026-04-25 10:25:09	2026-04-25 10:25:09
2007	Biquine Jeans Cáqui (Boboi)	17	2	20	6	34.81	4	2026-04-25 10:25:09	2026-04-25 10:25:09
2008	Top Colorido(a) Azul Escuro(a) (C&A Kids)	7	20	9	8	72.29	7	2026-04-25 10:25:09	2026-04-25 10:25:09
2009	Short Colorido(a) Lilás (Adidas Kids)	7	17	16	14	80.62	1	2026-04-25 10:25:09	2026-04-25 10:25:09
2010	Top Stitch Verde (Disney Baby)	28	20	5	11	111.90	12	2026-04-25 10:25:09	2026-04-25 10:25:09
2011	Macacão Moleton Marrom (Lilica Ripilica)	23	12	13	1	81.05	19	2026-04-25 10:25:09	2026-04-25 10:25:09
2012	Pijama Esportivo(a) Amarelo(a) (Puket Kids)	12	15	7	15	79.77	27	2026-04-25 10:25:09	2026-04-25 10:25:09
2013	Calcinha Confortável Azul Escuro(a) (Carters)	8	6	9	15	92.67	8	2026-04-25 10:25:09	2026-04-25 10:25:09
2014	Bermuda Estampado(a) Cinza (Zoe Kids)	13	1	8	16	76.09	31	2026-04-25 10:25:09	2026-04-25 10:25:09
2015	Camisa Leve Lilás (Bendita Cute)	19	7	16	8	83.63	3	2026-04-25 10:25:09	2026-04-25 10:25:09
2016	Maiô Elástico(a) Turquesa (Akazys)	11	13	15	7	86.73	2	2026-04-25 10:25:09	2026-04-25 10:25:09
2017	Sunga Seda Rosa Choque (Pimpolho)	27	18	10	12	19.39	26	2026-04-25 10:25:09	2026-04-25 10:25:09
2018	Bermuda Xadrez Prata (Disney Kids)	32	1	18	2	114.79	13	2026-04-25 10:25:09	2026-04-25 10:25:09
2019	Calcinha Ajustável Azul (C&A Baby)	1	6	1	11	52.54	6	2026-04-25 10:25:09	2026-04-25 10:25:09
2020	Meia Esportivo(a) Azul (Conjunto Infantil)	12	14	1	16	17.55	10	2026-04-25 10:25:09	2026-04-25 10:25:09
2021	Casaco Básico(a) Azul (Petit Royal)	4	9	1	17	76.20	25	2026-04-25 10:25:09	2026-04-25 10:25:09
2022	Blusa Saja Vermelho(a) (Farm Kids)	26	3	6	10	51.80	14	2026-04-25 10:25:09	2026-04-25 10:25:09
2023	Top Floral Prata (C&A Kids)	15	20	18	7	35.29	7	2026-04-25 10:25:09	2026-04-25 10:25:09
2024	Short Respirável Branco(a) (Akazys)	25	17	4	9	65.69	2	2026-04-25 10:25:09	2026-04-25 10:25:09
2025	Saia Listrado Roxo(a) (Hering Kids)	20	16	12	10	53.14	15	2026-04-25 10:25:09	2026-04-25 10:25:09
2026	Casaco Elástico(a) Cinza (Mundo Pet)	11	9	8	13	72.75	23	2026-04-25 10:25:09	2026-04-25 10:25:09
2027	Saia Básico(a) Turquesa (Dafiti Kids)	4	16	15	19	42.92	11	2026-04-25 10:25:09	2026-04-25 10:25:09
2028	Macacão Leve Laranja (Pimpolho)	19	12	11	15	13.22	26	2026-04-25 10:25:09	2026-04-25 10:25:09
2029	Bermuda Poliéster Roxo(a) (Hering Kids)	24	1	12	16	72.52	15	2026-04-25 10:25:09	2026-04-25 10:25:09
2030	Blusa Floral Turquesa (Kily)	15	3	15	1	108.94	17	2026-04-25 10:25:09	2026-04-25 10:25:09
2031	Blusa Floral Lilás (C&A Kids)	15	3	16	9	48.73	7	2026-04-25 10:25:09	2026-04-25 10:25:09
2032	Top Curto(a) Cinza (Boboi)	9	20	8	4	54.39	4	2026-04-25 10:25:09	2026-04-25 10:25:09
2033	Saia Animal Print Cáqui (Akazys)	3	16	20	19	92.84	2	2026-04-25 10:25:09	2026-04-25 10:25:09
2034	Calça Algodão Rosa Choque (Hering Kids)	2	5	10	17	49.72	15	2026-04-25 10:25:09	2026-04-25 10:25:09
2035	Macacão Leve Dourado(a) (Colcci Kids)	19	12	17	9	17.94	9	2026-04-25 10:25:09	2026-04-25 10:25:09
2036	Camisa Clássico(a) Rosa (Brandille)	6	7	2	7	61.27	5	2026-04-25 10:25:09	2026-04-25 10:25:09
2037	Macacão Jeans Rosa Choque (Renner Kids)	17	12	10	9	48.31	28	2026-04-25 10:25:09	2026-04-25 10:25:09
2038	Short Durável Prata (Brandille)	10	17	18	5	60.77	5	2026-04-25 10:25:09	2026-04-25 10:25:09
2039	Biquine Loney Tunes Rosa (Colcci Kids)	22	2	2	9	70.84	9	2026-04-25 10:25:09	2026-04-25 10:25:09
2040	Top Stitch Rosa (Dafiti Kids)	28	20	2	6	81.75	11	2026-04-25 10:25:09	2026-04-25 10:25:09
2041	Vestido Longa Dourado(a) (Adidas Kids)	21	21	17	16	65.26	1	2026-04-25 10:25:09	2026-04-25 10:25:09
2042	Meia Turma da Mônica Rosa (Mundo Pet)	31	14	2	17	16.20	23	2026-04-25 10:25:09	2026-04-25 10:25:09
2043	Maiô Confortável Cinza (Lacoste Kids)	8	13	8	16	85.03	18	2026-04-25 10:25:09	2026-04-25 10:25:09
2044	Biquine Algodão Cinza (Riachuelo Kids)	2	2	8	9	74.21	29	2026-04-25 10:25:09	2026-04-25 10:25:09
2045	Camiseta Respirável Rosa (Petit Royal)	25	8	2	14	75.08	25	2026-04-25 10:25:09	2026-04-25 10:25:09
2046	Meia Moleton Marrom (Disney Baby)	23	14	13	2	35.40	12	2026-04-25 10:25:09	2026-04-25 10:25:09
2047	Sutiã Stitch Vermelho(a) (Carters)	28	19	6	6	69.99	8	2026-04-25 10:25:09	2026-04-25 10:25:09
2048	Biquine Turma da Mônica Cinza (C&A Baby)	31	2	8	15	13.49	6	2026-04-25 10:25:09	2026-04-25 10:25:09
2049	Macacão Animal Print Cinza (Osklen Kids)	3	12	8	12	103.32	24	2026-04-25 10:25:09	2026-04-25 10:25:09
2050	Casaco Respirável Cinza (Zoe Kids)	25	9	8	12	73.20	31	2026-04-25 10:25:09	2026-04-25 10:25:09
2051	Calcinha Casual Prata (Puket Kids)	5	6	18	6	73.12	27	2026-04-25 10:25:09	2026-04-25 10:25:09
2052	Meia Clássico(a) Verde (Dafiti Kids)	6	14	5	8	110.28	11	2026-04-25 10:25:09	2026-04-25 10:25:09
2053	Meia Casual Marrom (Salsa Jeans Kids)	5	14	13	5	29.93	30	2026-04-25 10:25:09	2026-04-25 10:25:09
2054	Cueca Longa Preto(a) (Petit Royal)	21	10	3	13	17.96	25	2026-04-25 10:25:09	2026-04-25 10:25:09
2055	Camiseta Fit Rosa Choque (Mundo Infantil)	14	8	10	16	72.00	22	2026-04-25 10:25:09	2026-04-25 10:25:09
2056	Camisa Casual Cáqui (Hering Kids)	5	7	20	6	60.65	15	2026-04-25 10:25:09	2026-04-25 10:25:09
2057	Camisa Elástico(a) Cáqui (Adidas Kids)	11	7	20	18	43.23	1	2026-04-25 10:25:09	2026-04-25 10:25:09
2058	Blusa Esportivo(a) Prata (Hering Kids)	12	3	18	3	59.77	15	2026-04-25 10:25:09	2026-04-25 10:25:09
2059	Maiô Animal Print Vermelho(a) (C&A Kids)	3	13	6	12	25.75	7	2026-04-25 10:25:09	2026-04-25 10:25:09
2060	Saia Temático(a) Azul (Salsa Jeans Kids)	29	16	1	18	46.96	30	2026-04-25 10:25:09	2026-04-25 10:25:09
2061	Macacão Esportivo(a) Roxo(a) (Lacoste Kids)	12	12	12	18	78.81	18	2026-04-25 10:25:09	2026-04-25 10:25:09
2062	Calça Listrado Vinho (Carters)	20	5	19	19	28.22	8	2026-04-25 10:25:09	2026-04-25 10:25:09
2063	Pijama Poliéster Rosa Choque (Petit Royal)	24	15	10	13	89.03	25	2026-04-25 10:25:09	2026-04-25 10:25:09
2064	Camiseta Stitch Prata (Ki Carinho)	28	8	18	15	40.71	16	2026-04-25 10:25:09	2026-04-25 10:25:09
2065	Camiseta Elástico(a) Amarelo(a) (Ki Carinho)	11	8	7	1	114.13	16	2026-04-25 10:25:09	2026-04-25 10:25:09
2066	Sutiã Xadrez Marrom (Akazys)	32	19	13	9	117.22	2	2026-04-25 10:25:09	2026-04-25 10:25:09
2067	Sunga Jeans Rosa (Lacoste Kids)	17	18	2	8	69.20	18	2026-04-25 10:25:09	2026-04-25 10:25:09
2068	Casaco Moleton Amarelo(a) (Hering Kids)	23	9	7	13	84.43	15	2026-04-25 10:25:09	2026-04-25 10:25:09
2069	Calcinha Floral Cáqui (Lilica Ripilica)	15	6	20	9	78.06	19	2026-04-25 10:25:09	2026-04-25 10:25:09
2070	Maiô Poliéster Vinho (Ki Carinho)	24	13	19	6	60.74	16	2026-04-25 10:25:09	2026-04-25 10:25:09
2071	Sunga Seda Amarelo(a) (Adidas Kids)	27	18	7	11	61.31	1	2026-04-25 10:25:09	2026-04-25 10:25:09
2072	Sutiã Animal Print Amarelo(a) (Bendita Cute)	3	19	7	14	56.77	3	2026-04-25 10:25:09	2026-04-25 10:25:09
2073	Calcinha Curto(a) Azul Escuro(a) (Puket Kids)	9	6	9	7	48.98	27	2026-04-25 10:25:09	2026-04-25 10:25:09
2074	Calcinha Moleton Azul Escuro(a) (Conjunto Infantil)	23	6	9	1	23.38	10	2026-04-25 10:25:09	2026-04-25 10:25:09
2075	Camisa Poliéster Rosa (Renner Kids)	24	7	2	17	41.70	28	2026-04-25 10:25:09	2026-04-25 10:25:09
2076	Calcinha Xadrez Bege (C&A Baby)	32	6	14	4	65.36	6	2026-04-25 10:25:09	2026-04-25 10:25:09
2077	Camiseta Confortável Laranja (Salsa Jeans Kids)	8	8	11	8	54.63	30	2026-04-25 10:25:09	2026-04-25 10:25:09
2078	Macacão Poliéster Amarelo(a) (Renner Kids)	24	12	7	6	100.00	28	2026-04-25 10:25:09	2026-04-25 10:25:09
2079	Pijama Animal Print Rosa (Mundo Pet)	3	15	2	2	25.47	23	2026-04-25 10:25:09	2026-04-25 10:25:09
2080	Short Ajustável Lilás (Lilica Ripilica)	1	17	16	19	12.59	19	2026-04-25 10:25:09	2026-04-25 10:25:09
2081	Casaco Moleton Roxo(a) (Mundo Infantil)	23	9	12	12	45.18	22	2026-04-25 10:25:09	2026-04-25 10:25:09
2082	Camiseta Estampado(a) Bege (Colcci Kids)	13	8	14	4	35.01	9	2026-04-25 10:25:09	2026-04-25 10:25:09
2083	Camiseta Turma da Mônica Dourado(a) (Akazys)	31	8	17	13	64.05	2	2026-04-25 10:25:09	2026-04-25 10:25:09
2084	Pijama Stitch Rosa Choque (C&A Kids)	28	15	10	19	35.45	7	2026-04-25 10:25:09	2026-04-25 10:25:09
2085	Calça Respirável Prata (Riachuelo Kids)	25	5	18	4	55.40	29	2026-04-25 10:25:09	2026-04-25 10:25:09
2086	Saia Jeans Preto(a) (Marisol)	17	16	3	17	22.83	21	2026-04-25 10:25:09	2026-04-25 10:25:09
2087	Sutiã Curto(a) Marrom (Kily)	9	19	13	7	60.96	17	2026-04-25 10:25:09	2026-04-25 10:25:09
2088	Calça Elástico(a) Azul (Ki Carinho)	11	5	1	4	73.87	16	2026-04-25 10:25:09	2026-04-25 10:25:09
2089	Camisa Labubu Preto(a) (Boboi)	18	7	3	4	60.35	4	2026-04-25 10:25:09	2026-04-25 10:25:09
2090	Sunga Floral Cáqui (Petit Royal)	15	18	20	17	71.45	25	2026-04-25 10:25:09	2026-04-25 10:25:09
2091	Calcinha Loney Tunes Rosa Choque (Lilica Ripilica)	22	6	10	2	41.79	19	2026-04-25 10:25:09	2026-04-25 10:25:09
2092	Sunga Respirável Vermelho(a) (Renner Kids)	25	18	6	10	64.40	28	2026-04-25 10:25:09	2026-04-25 10:25:09
2093	Short Xadrez Prata (Maria Filó Kids)	32	17	18	19	82.78	20	2026-04-25 10:25:09	2026-04-25 10:25:09
2094	Vestido Algodão Rosa (Kily)	2	21	2	6	72.17	17	2026-04-25 10:25:09	2026-04-25 10:25:09
2095	Calça Elástico(a) Lilás (Salsa Jeans Kids)	11	5	16	2	31.08	30	2026-04-25 10:25:09	2026-04-25 10:25:09
2096	Maiô Animal Print Vinho (Marisol)	3	13	19	3	76.20	21	2026-04-25 10:25:09	2026-04-25 10:25:09
2097	Biquine Loney Tunes Vinho (Marisol)	22	2	19	19	113.66	21	2026-04-25 10:25:09	2026-04-25 10:25:09
2098	Biquine Elástico(a) Marrom (Salsa Jeans Kids)	11	2	13	11	87.04	30	2026-04-25 10:25:09	2026-04-25 10:25:09
2099	Sunga Moleton Prata (Salsa Jeans Kids)	23	18	18	15	56.96	30	2026-04-25 10:25:09	2026-04-25 10:25:09
2100	Sutiã Durável Prata (Disney Kids)	10	19	18	5	119.12	13	2026-04-25 10:25:09	2026-04-25 10:25:09
2101	Meia Durável Cinza (Mundo Pet)	10	14	8	1	60.53	23	2026-04-25 10:25:09	2026-04-25 10:25:09
2102	Casaco Labubu Azul Escuro(a) (Boboi)	18	9	9	18	40.08	4	2026-04-25 10:25:09	2026-04-25 10:25:09
2103	Sunga Fit Rosa Choque (Pimpolho)	14	18	10	4	96.76	26	2026-04-25 10:25:09	2026-04-25 10:25:09
2104	Saia Elástico(a) Prata (Maria Filó Kids)	11	16	18	1	49.85	20	2026-04-25 10:25:09	2026-04-25 10:25:09
2105	Calça Jeans Dourado(a) (C&A Kids)	17	5	17	7	113.91	7	2026-04-25 10:25:09	2026-04-25 10:25:09
2106	Sunga Saja Vermelho(a) (Maria Filó Kids)	26	18	6	6	72.35	20	2026-04-25 10:25:09	2026-04-25 10:25:09
2107	Top Clássico(a) Branco(a) (Boboi)	6	20	4	17	115.86	4	2026-04-25 10:25:09	2026-04-25 10:25:09
2108	Blusa Stitch Verde (Carters)	28	3	5	8	104.19	8	2026-04-25 10:25:09	2026-04-25 10:25:09
2109	Meia Labubu Laranja (Lacoste Kids)	18	14	11	5	27.07	18	2026-04-25 10:25:09	2026-04-25 10:25:09
2110	Blusa Estampado(a) Azul Escuro(a) (Kily)	13	3	9	4	79.09	17	2026-04-25 10:25:09	2026-04-25 10:25:09
2111	Pijama Clássico(a) Roxo(a) (Adidas Kids)	6	15	12	18	84.72	1	2026-04-25 10:25:09	2026-04-25 10:25:09
2112	Jaqueta Seda Azul Escuro(a) (Colcci Kids)	27	11	9	1	36.51	9	2026-04-25 10:25:09	2026-04-25 10:25:09
2113	Pijama Moleton Bege (Puket Kids)	23	15	14	2	92.68	27	2026-04-25 10:25:09	2026-04-25 10:25:09
2114	Macacão Loney Tunes Verde (Ki Carinho)	22	12	5	1	103.44	16	2026-04-25 10:25:09	2026-04-25 10:25:09
2115	Calça Elástico(a) Marrom (Maria Filó Kids)	11	5	13	16	47.61	20	2026-04-25 10:25:09	2026-04-25 10:25:09
2116	Jaqueta Casual Dourado(a) (Mundo Infantil)	5	11	17	8	115.47	22	2026-04-25 10:25:09	2026-04-25 10:25:09
2117	Casaco Listrado Vinho (Farm Kids)	20	9	19	1	69.68	14	2026-04-25 10:25:09	2026-04-25 10:25:09
2118	Sunga Stitch Turquesa (Lacoste Kids)	28	18	15	15	86.02	18	2026-04-25 10:25:09	2026-04-25 10:25:09
2119	Vestido Curto(a) Preto(a) (Pimpolho)	9	21	3	10	49.94	26	2026-04-25 10:25:09	2026-04-25 10:25:09
2120	Biquine Seda Vinho (Zoe Kids)	27	2	19	8	96.52	31	2026-04-25 10:25:09	2026-04-25 10:25:09
2121	Macacão Esportivo(a) Amarelo(a) (Lacoste Kids)	12	12	7	16	61.94	18	2026-04-25 10:25:09	2026-04-25 10:25:09
2122	Cueca Poliéster Cinza (Kily)	24	10	8	12	110.89	17	2026-04-25 10:25:09	2026-04-25 10:25:09
2123	Calçado Listrado Laranja (Ki Carinho)	20	4	11	7	114.40	16	2026-04-25 10:25:09	2026-04-25 10:25:09
2124	Short Stitch Marrom (C&A Baby)	28	17	13	12	106.45	6	2026-04-25 10:25:09	2026-04-25 10:25:09
2125	Biquine Ajustável Laranja (Riachuelo Kids)	1	2	11	7	96.52	29	2026-04-25 10:25:09	2026-04-25 10:25:09
2126	Jaqueta Básico(a) Roxo(a) (Pimpolho)	4	11	12	13	118.45	26	2026-04-25 10:25:09	2026-04-25 10:25:09
2127	Biquine Turma da Mônica Branco(a) (Mundo Infantil)	31	2	4	10	112.64	22	2026-04-25 10:25:09	2026-04-25 10:25:09
2128	Sunga Ajustável Azul Escuro(a) (Mundo Infantil)	1	18	9	11	15.97	22	2026-04-25 10:25:09	2026-04-25 10:25:09
2129	Pijama Floral Lilás (Akazys)	15	15	16	11	113.76	2	2026-04-25 10:25:09	2026-04-25 10:25:09
2130	Vestido Estampado(a) Marrom (Colcci Kids)	13	21	13	16	29.17	9	2026-04-25 10:25:09	2026-04-25 10:25:09
2131	Maiô Jeans Prata (Disney Kids)	17	13	18	18	39.17	13	2026-04-25 10:25:09	2026-04-25 10:25:09
2132	Sunga Formal Turquesa (Puket Kids)	16	18	15	17	80.43	27	2026-04-25 10:25:09	2026-04-25 10:25:09
2133	Camisa Durável Bege (Boboi)	10	7	14	9	93.63	4	2026-04-25 10:25:09	2026-04-25 10:25:09
2134	Cueca Moleton Amarelo(a) (Mundo Pet)	23	10	7	1	67.87	23	2026-04-25 10:25:09	2026-04-25 10:25:09
2135	Bermuda Curto(a) Rosa Choque (Conjunto Infantil)	9	1	10	10	77.52	10	2026-04-25 10:25:09	2026-04-25 10:25:09
2136	Meia Clássico(a) Preto(a) (Lilica Ripilica)	6	14	3	6	109.20	19	2026-04-25 10:25:09	2026-04-25 10:25:09
2137	Casaco Durável Rosa Choque (Conjunto Infantil)	10	9	10	11	12.44	10	2026-04-25 10:25:09	2026-04-25 10:25:09
2138	Blusa Colorido(a) Cáqui (Colcci Kids)	7	3	20	19	93.32	9	2026-04-25 10:25:09	2026-04-25 10:25:09
2139	Sunga Animal Print Rosa (Disney Kids)	3	18	2	11	114.95	13	2026-04-25 10:25:09	2026-04-25 10:25:09
2140	Biquine Loney Tunes Turquesa (Carters)	22	2	15	8	54.15	8	2026-04-25 10:25:09	2026-04-25 10:25:09
2141	Biquine Fit Dourado(a) (Puket Kids)	14	2	17	14	29.24	27	2026-04-25 10:25:09	2026-04-25 10:25:09
2142	Maiô Respirável Dourado(a) (Marisol)	25	13	17	5	100.59	21	2026-04-25 10:25:09	2026-04-25 10:25:09
2143	Top Temático(a) Marrom (Salsa Jeans Kids)	29	20	13	18	62.51	30	2026-04-25 10:25:09	2026-04-25 10:25:09
2144	Calça Floral Azul (Hering Kids)	15	5	1	1	87.06	15	2026-04-25 10:25:09	2026-04-25 10:25:09
2145	Camiseta Básico(a) Azul Escuro(a) (Farm Kids)	4	8	9	3	26.90	14	2026-04-25 10:25:09	2026-04-25 10:25:09
2146	Blusa Respirável Vinho (C&A Baby)	25	3	19	18	38.52	6	2026-04-25 10:25:09	2026-04-25 10:25:09
2147	Sunga Básico(a) Branco(a) (Salsa Jeans Kids)	4	18	4	11	33.69	30	2026-04-25 10:25:09	2026-04-25 10:25:09
2148	Sutiã Loney Tunes Branco(a) (Farm Kids)	22	19	4	9	85.64	14	2026-04-25 10:25:09	2026-04-25 10:25:09
2149	Blusa Respirável Cinza (Puket Kids)	25	3	8	15	117.79	27	2026-04-25 10:25:09	2026-04-25 10:25:09
2150	Calça Algodão Prata (Mundo Infantil)	2	5	18	8	28.94	22	2026-04-25 10:25:09	2026-04-25 10:25:09
2151	Casaco Confortável Prata (Mundo Infantil)	8	9	18	14	94.85	22	2026-04-25 10:25:09	2026-04-25 10:25:09
2152	Saia Confortável Prata (Farm Kids)	8	16	18	2	62.68	14	2026-04-25 10:25:09	2026-04-25 10:25:09
2153	Casaco Seda Preto(a) (Conjunto Infantil)	27	9	3	5	33.42	10	2026-04-25 10:25:09	2026-04-25 10:25:09
2154	Pijama Stitch Roxo(a) (C&A Baby)	28	15	12	2	100.35	6	2026-04-25 10:25:09	2026-04-25 10:25:09
2155	Saia Listrado Rosa Choque (Ki Carinho)	20	16	10	18	68.79	16	2026-04-25 10:25:09	2026-04-25 10:25:09
2156	Saia Respirável Cinza (Conjunto Infantil)	25	16	8	13	89.45	10	2026-04-25 10:25:09	2026-04-25 10:25:09
2157	Saia Temático(a) Azul (Puket Kids)	29	16	1	1	27.26	27	2026-04-25 10:25:09	2026-04-25 10:25:09
2158	Camisa Poliéster Roxo(a) (Disney Kids)	24	7	12	4	111.09	13	2026-04-25 10:25:09	2026-04-25 10:25:09
2159	Saia Leve Rosa Choque (Lacoste Kids)	19	16	10	9	95.49	18	2026-04-25 10:25:09	2026-04-25 10:25:09
2160	Jaqueta Curto(a) Laranja (C&A Kids)	9	11	11	18	70.88	7	2026-04-25 10:25:09	2026-04-25 10:25:09
2161	Sutiã Esportivo(a) Branco(a) (Mundo Infantil)	12	19	4	19	75.94	22	2026-04-25 10:25:09	2026-04-25 10:25:09
2162	Cueca Casual Turquesa (Akazys)	5	10	15	13	95.41	2	2026-04-25 10:25:09	2026-04-25 10:25:09
2163	Camiseta Ajustável Cáqui (Salsa Jeans Kids)	1	8	20	18	98.08	30	2026-04-25 10:25:09	2026-04-25 10:25:09
2164	Macacão Loney Tunes Roxo(a) (Adidas Kids)	22	12	12	3	53.35	1	2026-04-25 10:25:09	2026-04-25 10:25:09
2165	Pijama Algodão Verde (Lacoste Kids)	2	15	5	3	98.58	18	2026-04-25 10:25:09	2026-04-25 10:25:09
2166	Top Clássico(a) Roxo(a) (Colcci Kids)	6	20	12	7	56.04	9	2026-04-25 10:25:09	2026-04-25 10:25:09
2167	Jaqueta Curto(a) Branco(a) (C&A Baby)	9	11	4	6	41.17	6	2026-04-25 10:25:09	2026-04-25 10:25:09
2168	Saia Leve Prata (Petit Royal)	19	16	18	9	26.27	25	2026-04-25 10:25:09	2026-04-25 10:25:09
2169	Calcinha Confortável Cáqui (Mundo Pet)	8	6	20	13	118.01	23	2026-04-25 10:25:09	2026-04-25 10:25:09
2170	Camisa Durável Cinza (C&A Baby)	10	7	8	10	58.49	6	2026-04-25 10:25:09	2026-04-25 10:25:09
2171	Calcinha Loney Tunes Rosa (Renner Kids)	22	6	2	12	58.99	28	2026-04-25 10:25:09	2026-04-25 10:25:09
2172	Meia Elástico(a) Roxo(a) (Petit Royal)	11	14	12	12	24.66	25	2026-04-25 10:25:09	2026-04-25 10:25:09
2173	Pijama Saja Cáqui (Carters)	26	15	20	4	30.25	8	2026-04-25 10:25:09	2026-04-25 10:25:09
2174	Camisa Moleton Laranja (Maria Filó Kids)	23	7	11	1	70.90	20	2026-04-25 10:25:09	2026-04-25 10:25:09
2175	Jaqueta Labubu Cáqui (Bendita Cute)	18	11	20	3	35.98	3	2026-04-25 10:25:09	2026-04-25 10:25:09
2176	Maiô Longa Verde (Kily)	21	13	5	4	73.70	17	2026-04-25 10:25:09	2026-04-25 10:25:09
2177	Camisa Xadrez Rosa (Disney Baby)	32	7	2	1	65.21	12	2026-04-25 10:25:09	2026-04-25 10:25:09
2178	Calça Animal Print Azul Escuro(a) (Lacoste Kids)	3	5	9	14	109.13	18	2026-04-25 10:25:09	2026-04-25 10:25:09
2179	Camiseta Clássico(a) Rosa (Disney Kids)	6	8	2	18	113.46	13	2026-04-25 10:25:09	2026-04-25 10:25:09
2180	Casaco Colorido(a) Vinho (Disney Baby)	7	9	19	13	43.33	12	2026-04-25 10:25:09	2026-04-25 10:25:09
2181	Calça Seda Bege (Zoe Kids)	27	5	14	5	52.10	31	2026-04-25 10:25:09	2026-04-25 10:25:09
2182	Vestido Turma da Mônica Branco(a) (Petit Royal)	31	21	4	2	87.94	25	2026-04-25 10:25:09	2026-04-25 10:25:09
2183	Meia Casual Cáqui (Farm Kids)	5	14	20	11	20.96	14	2026-04-25 10:25:09	2026-04-25 10:25:09
2184	Camiseta Estampado(a) Azul Escuro(a) (Puket Kids)	13	8	9	18	60.76	27	2026-04-25 10:25:09	2026-04-25 10:25:09
2185	Meia Longa Azul Escuro(a) (Salsa Jeans Kids)	21	14	9	4	97.02	30	2026-04-25 10:25:09	2026-04-25 10:25:09
2186	Biquine Algodão Verde (Brandille)	2	2	5	9	71.29	5	2026-04-25 10:25:09	2026-04-25 10:25:09
2187	Casaco Clássico(a) Vermelho(a) (Petit Royal)	6	9	6	6	36.14	25	2026-04-25 10:25:09	2026-04-25 10:25:09
2188	Vestido Colorido(a) Dourado(a) (Hering Kids)	7	21	17	5	50.06	15	2026-04-25 10:25:09	2026-04-25 10:25:09
2189	Calcinha Estampado(a) Roxo(a) (Dafiti Kids)	13	6	12	19	90.84	11	2026-04-25 10:25:09	2026-04-25 10:25:09
2190	Calcinha Estampado(a) Dourado(a) (C&A Kids)	13	6	17	16	95.03	7	2026-04-25 10:25:09	2026-04-25 10:25:09
2191	Casaco Floral Roxo(a) (Lacoste Kids)	15	9	12	17	53.10	18	2026-04-25 10:25:09	2026-04-25 10:25:09
2192	Meia Casual Prata (Brandille)	5	14	18	19	10.48	5	2026-04-25 10:25:09	2026-04-25 10:25:09
2193	Calçado Longa Laranja (Ki Carinho)	21	4	11	14	110.53	16	2026-04-25 10:25:09	2026-04-25 10:25:09
2194	Cueca Stitch Azul (Colcci Kids)	28	10	1	13	105.55	9	2026-04-25 10:25:09	2026-04-25 10:25:09
2195	Calcinha Básico(a) Azul Escuro(a) (Mundo Infantil)	4	6	9	10	24.01	22	2026-04-25 10:25:09	2026-04-25 10:25:09
2196	Vestido Saja Vinho (Hering Kids)	26	21	19	9	117.37	15	2026-04-25 10:25:09	2026-04-25 10:25:09
2197	Camisa Casual Vinho (Dafiti Kids)	5	7	19	5	96.35	11	2026-04-25 10:25:09	2026-04-25 10:25:09
2198	Vestido Moleton Rosa Choque (Ki Carinho)	23	21	10	16	97.27	16	2026-04-25 10:25:09	2026-04-25 10:25:09
2199	Bermuda Listrado Branco(a) (Mundo Pet)	20	1	4	13	108.60	23	2026-04-25 10:25:09	2026-04-25 10:25:09
2200	Jaqueta Stitch Laranja (Colcci Kids)	28	11	11	17	63.96	9	2026-04-25 10:25:09	2026-04-25 10:25:09
2201	Vestido Animal Print Cáqui (Ki Carinho)	3	21	20	9	79.00	16	2026-04-25 10:25:09	2026-04-25 10:25:09
2202	Pijama Leve Vermelho(a) (Colcci Kids)	19	15	6	11	43.75	9	2026-04-25 10:25:09	2026-04-25 10:25:09
2203	Calça Saja Bege (C&A Baby)	26	5	14	6	109.92	6	2026-04-25 10:25:09	2026-04-25 10:25:09
2204	Calçado Xadrez Cáqui (Petit Royal)	32	4	20	15	27.83	25	2026-04-25 10:25:09	2026-04-25 10:25:09
2205	Camisa Poliéster Vinho (Pimpolho)	24	7	19	7	36.08	26	2026-04-25 10:25:09	2026-04-25 10:25:09
2206	Blusa Estampado(a) Bege (Akazys)	13	3	14	9	59.57	2	2026-04-25 10:25:09	2026-04-25 10:25:09
2207	Calcinha Seda Turquesa (Ki Carinho)	27	6	15	18	110.08	16	2026-04-25 10:25:09	2026-04-25 10:25:09
2208	Blusa Clássico(a) Cinza (Marisol)	6	3	8	10	114.15	21	2026-04-25 10:25:09	2026-04-25 10:25:09
2209	Calça Turma da Mônica Prata (Petit Royal)	31	5	18	9	13.74	25	2026-04-25 10:25:09	2026-04-25 10:25:09
2210	Calcinha Stitch Verde (Mundo Infantil)	28	6	5	17	92.68	22	2026-04-25 10:25:09	2026-04-25 10:25:09
2211	Saia Listrado Vinho (Marisol)	20	16	19	10	72.83	21	2026-04-25 10:25:09	2026-04-25 10:25:09
2212	Blusa Esportivo(a) Bege (Kily)	12	3	14	17	113.72	17	2026-04-25 10:25:09	2026-04-25 10:25:09
2213	Casaco Colorido(a) Vinho (Lacoste Kids)	7	9	19	12	75.53	18	2026-04-25 10:25:09	2026-04-25 10:25:09
2214	Bermuda Durável Azul (Lilica Ripilica)	10	1	1	17	76.85	19	2026-04-25 10:25:09	2026-04-25 10:25:09
2215	Camisa Elástico(a) Laranja (Lilica Ripilica)	11	7	11	16	106.39	19	2026-04-25 10:25:09	2026-04-25 10:25:09
2216	Calçado Animal Print Azul Escuro(a) (Ki Carinho)	3	4	9	3	51.43	16	2026-04-25 10:25:09	2026-04-25 10:25:09
2217	Blusa Casual Vermelho(a) (Renner Kids)	5	3	6	7	79.90	28	2026-04-25 10:25:09	2026-04-25 10:25:09
2218	Top Esportivo(a) Branco(a) (Renner Kids)	12	20	4	17	16.08	28	2026-04-25 10:25:09	2026-04-25 10:25:09
2219	Camiseta Formal Marrom (Ki Carinho)	16	8	13	7	75.79	16	2026-04-25 10:25:09	2026-04-25 10:25:09
2220	Cueca Leve Branco(a) (C&A Baby)	19	10	4	4	47.80	6	2026-04-25 10:25:09	2026-04-25 10:25:09
2221	Top Casual Turquesa (Osklen Kids)	5	20	15	18	56.13	24	2026-04-25 10:25:09	2026-04-25 10:25:09
2222	Sunga Básico(a) Verde (Pimpolho)	4	18	5	18	69.97	26	2026-04-25 10:25:09	2026-04-25 10:25:09
2223	Top Seda Cinza (Disney Baby)	27	20	8	10	60.68	12	2026-04-25 10:25:09	2026-04-25 10:25:09
2224	Short Poliéster Azul (Colcci Kids)	24	17	1	9	22.80	9	2026-04-25 10:25:09	2026-04-25 10:25:09
2225	Cueca Xadrez Cáqui (Farm Kids)	32	10	20	13	117.67	14	2026-04-25 10:25:09	2026-04-25 10:25:09
2226	Pijama Durável Verde (Boboi)	10	15	5	1	108.59	4	2026-04-25 10:25:09	2026-04-25 10:25:09
2227	Short Floral Azul (Zoe Kids)	15	17	1	4	52.11	31	2026-04-25 10:25:09	2026-04-25 10:25:09
2228	Top Casual Laranja (Petit Royal)	5	20	11	18	51.12	25	2026-04-25 10:25:09	2026-04-25 10:25:09
2229	Casaco Toy Store Preto(a) (Hering Kids)	30	9	3	14	68.59	15	2026-04-25 10:25:09	2026-04-25 10:25:09
2230	Biquine Curto(a) Rosa Choque (Kily)	9	2	10	19	37.56	17	2026-04-25 10:25:09	2026-04-25 10:25:09
2231	Cueca Casual Cinza (Lacoste Kids)	5	10	8	13	33.52	18	2026-04-25 10:25:09	2026-04-25 10:25:09
2232	Camiseta Esportivo(a) Lilás (Farm Kids)	12	8	16	19	16.03	14	2026-04-25 10:25:09	2026-04-25 10:25:09
2233	Vestido Seda Rosa Choque (Colcci Kids)	27	21	10	18	65.21	9	2026-04-25 10:25:09	2026-04-25 10:25:09
2234	Calça Fit Amarelo(a) (Mundo Pet)	14	5	7	19	119.21	23	2026-04-25 10:25:09	2026-04-25 10:25:09
2235	Saia Seda Rosa Choque (C&A Baby)	27	16	10	17	17.20	6	2026-04-25 10:25:09	2026-04-25 10:25:09
2236	Biquine Longa Rosa Choque (Dafiti Kids)	21	2	10	14	107.67	11	2026-04-25 10:25:09	2026-04-25 10:25:09
2237	Jaqueta Moleton Turquesa (Mundo Infantil)	23	11	15	10	39.70	22	2026-04-25 10:25:09	2026-04-25 10:25:09
2238	Meia Curto(a) Azul (Renner Kids)	9	14	1	18	66.21	28	2026-04-25 10:25:09	2026-04-25 10:25:09
2239	Vestido Algodão Azul (Mundo Pet)	2	21	1	4	86.90	23	2026-04-25 10:25:09	2026-04-25 10:25:09
2240	Meia Moleton Roxo(a) (Carters)	23	14	12	8	40.14	8	2026-04-25 10:25:09	2026-04-25 10:25:09
2241	Macacão Respirável Prata (Boboi)	25	12	18	16	47.75	4	2026-04-25 10:25:09	2026-04-25 10:25:09
2242	Cueca Formal Roxo(a) (Maria Filó Kids)	16	10	12	9	75.51	20	2026-04-25 10:25:09	2026-04-25 10:25:09
2243	Calça Clássico(a) Vermelho(a) (Mundo Pet)	6	5	6	19	29.20	23	2026-04-25 10:25:09	2026-04-25 10:25:09
2244	Bermuda Jeans Cinza (Boboi)	17	1	8	18	26.35	4	2026-04-25 10:25:09	2026-04-25 10:25:09
2245	Top Curto(a) Azul Escuro(a) (Mundo Infantil)	9	20	9	11	106.76	22	2026-04-25 10:25:09	2026-04-25 10:25:09
2246	Vestido Colorido(a) Cinza (Brandille)	7	21	8	11	116.89	5	2026-04-25 10:25:09	2026-04-25 10:25:09
2247	Calcinha Elástico(a) Cinza (Petit Royal)	11	6	8	15	46.99	25	2026-04-25 10:25:09	2026-04-25 10:25:09
2248	Calcinha Stitch Dourado(a) (Pimpolho)	28	6	17	19	29.81	26	2026-04-25 10:25:09	2026-04-25 10:25:09
2249	Calça Elástico(a) Verde (Farm Kids)	11	5	5	12	77.54	14	2026-04-25 10:25:09	2026-04-25 10:25:09
2250	Calcinha Floral Laranja (Zoe Kids)	15	6	11	3	73.45	31	2026-04-25 10:25:09	2026-04-25 10:25:09
2251	Vestido Xadrez Roxo(a) (Boboi)	32	21	12	17	33.74	4	2026-04-25 10:25:09	2026-04-25 10:25:09
2252	Saia Curto(a) Azul (Adidas Kids)	9	16	1	2	74.32	1	2026-04-25 10:25:09	2026-04-25 10:25:09
2253	Maiô Longa Rosa (Marisol)	21	13	2	14	10.38	21	2026-04-25 10:25:09	2026-04-25 10:25:09
2254	Maiô Stitch Azul Escuro(a) (Brandille)	28	13	9	5	90.75	5	2026-04-25 10:25:09	2026-04-25 10:25:09
2255	Biquine Xadrez Marrom (Maria Filó Kids)	32	2	13	16	64.25	20	2026-04-25 10:25:09	2026-04-25 10:25:09
2256	Meia Seda Vermelho(a) (Lacoste Kids)	27	14	6	15	13.61	18	2026-04-25 10:25:09	2026-04-25 10:25:09
2257	Jaqueta Formal Vinho (Kily)	16	11	19	6	107.90	17	2026-04-25 10:25:09	2026-04-25 10:25:09
2258	Meia Esportivo(a) Cáqui (Dafiti Kids)	12	14	20	4	91.91	11	2026-04-25 10:25:09	2026-04-25 10:25:09
2259	Calcinha Curto(a) Prata (Carters)	9	6	18	12	93.10	8	2026-04-25 10:25:09	2026-04-25 10:25:09
2260	Camiseta Seda Verde (Conjunto Infantil)	27	8	5	13	53.35	10	2026-04-25 10:25:09	2026-04-25 10:25:09
2261	Meia Labubu Dourado(a) (C&A Kids)	18	14	17	19	63.57	7	2026-04-25 10:25:09	2026-04-25 10:25:09
2262	Pijama Estampado(a) Lilás (Riachuelo Kids)	13	15	16	3	75.71	29	2026-04-25 10:25:09	2026-04-25 10:25:09
2263	Sutiã Curto(a) Roxo(a) (Colcci Kids)	9	19	12	16	114.96	9	2026-04-25 10:25:09	2026-04-25 10:25:09
2264	Biquine Labubu Preto(a) (Dafiti Kids)	18	2	3	15	29.01	11	2026-04-25 10:25:09	2026-04-25 10:25:09
2265	Blusa Colorido(a) Azul Escuro(a) (Colcci Kids)	7	3	9	10	107.74	9	2026-04-25 10:25:09	2026-04-25 10:25:09
2266	Saia Labubu Azul Escuro(a) (Conjunto Infantil)	18	16	9	1	50.01	10	2026-04-25 10:25:09	2026-04-25 10:25:09
2267	Sunga Listrado Cinza (Akazys)	20	18	8	3	46.37	2	2026-04-25 10:25:09	2026-04-25 10:25:09
2268	Blusa Ajustável Branco(a) (Renner Kids)	1	3	4	1	74.14	28	2026-04-25 10:25:09	2026-04-25 10:25:09
2269	Top Formal Azul (Brandille)	16	20	1	6	32.72	5	2026-04-25 10:25:09	2026-04-25 10:25:09
2270	Macacão Colorido(a) Prata (Brandille)	7	12	18	4	29.53	5	2026-04-25 10:25:09	2026-04-25 10:25:09
2271	Cueca Algodão Cinza (Lilica Ripilica)	2	10	8	16	80.74	19	2026-04-25 10:25:09	2026-04-25 10:25:09
2272	Camiseta Turma da Mônica Preto(a) (Bendita Cute)	31	8	3	12	30.64	3	2026-04-25 10:25:09	2026-04-25 10:25:09
2273	Bermuda Curto(a) Roxo(a) (Hering Kids)	9	1	12	18	107.89	15	2026-04-25 10:25:09	2026-04-25 10:25:09
2274	Maiô Básico(a) Lilás (Colcci Kids)	4	13	16	17	31.44	9	2026-04-25 10:25:09	2026-04-25 10:25:09
2275	Maiô Formal Branco(a) (Hering Kids)	16	13	4	3	60.82	15	2026-04-25 10:25:09	2026-04-25 10:25:09
2276	Calça Casual Turquesa (Carters)	5	5	15	15	14.91	8	2026-04-25 10:25:09	2026-04-25 10:25:09
2277	Calça Casual Bege (Osklen Kids)	5	5	14	18	87.55	24	2026-04-25 10:25:09	2026-04-25 10:25:09
2278	Calça Jeans Turquesa (Maria Filó Kids)	17	5	15	1	88.08	20	2026-04-25 10:25:09	2026-04-25 10:25:09
2279	Macacão Ajustável Branco(a) (Disney Kids)	1	12	4	9	39.02	13	2026-04-25 10:25:09	2026-04-25 10:25:09
2280	Casaco Básico(a) Branco(a) (C&A Baby)	4	9	4	5	111.64	6	2026-04-25 10:25:09	2026-04-25 10:25:09
2281	Bermuda Estampado(a) Prata (Dafiti Kids)	13	1	18	17	100.96	11	2026-04-25 10:25:09	2026-04-25 10:25:09
2282	Jaqueta Clássico(a) Azul Escuro(a) (Disney Kids)	6	11	9	17	76.41	13	2026-04-25 10:25:09	2026-04-25 10:25:09
2283	Cueca Colorido(a) Cáqui (Carters)	7	10	20	12	113.71	8	2026-04-25 10:25:09	2026-04-25 10:25:09
2284	Sunga Confortável Bege (Lilica Ripilica)	8	18	14	14	21.69	19	2026-04-25 10:25:09	2026-04-25 10:25:09
2285	Top Clássico(a) Laranja (Disney Baby)	6	20	11	13	30.97	12	2026-04-25 10:25:09	2026-04-25 10:25:09
2286	Casaco Curto(a) Cinza (Disney Kids)	9	9	8	10	97.22	13	2026-04-25 10:25:09	2026-04-25 10:25:09
2287	Calça Moleton Turquesa (Osklen Kids)	23	5	15	2	14.91	24	2026-04-25 10:25:09	2026-04-25 10:25:09
2288	Camiseta Xadrez Vinho (Puket Kids)	32	8	19	2	90.27	27	2026-04-25 10:25:09	2026-04-25 10:25:09
2289	Camiseta Estampado(a) Marrom (Boboi)	13	8	13	17	109.44	4	2026-04-25 10:25:09	2026-04-25 10:25:09
2290	Camisa Stitch Dourado(a) (Brandille)	28	7	17	18	42.99	5	2026-04-25 10:25:09	2026-04-25 10:25:09
2291	Blusa Animal Print Bege (Boboi)	3	3	14	8	109.90	4	2026-04-25 10:25:09	2026-04-25 10:25:09
2292	Blusa Curto(a) Lilás (Renner Kids)	9	3	16	12	112.77	28	2026-04-25 10:25:09	2026-04-25 10:25:09
2293	Maiô Casual Roxo(a) (Osklen Kids)	5	13	12	7	97.13	24	2026-04-25 10:25:09	2026-04-25 10:25:09
2294	Calça Confortável Bege (Dafiti Kids)	8	5	14	3	66.37	11	2026-04-25 10:25:09	2026-04-25 10:25:09
2295	Macacão Listrado Branco(a) (Akazys)	20	12	4	14	43.06	2	2026-04-25 10:25:09	2026-04-25 10:25:09
2296	Macacão Básico(a) Rosa (C&A Baby)	4	12	2	13	114.40	6	2026-04-25 10:25:09	2026-04-25 10:25:09
2297	Camisa Turma da Mônica Rosa Choque (Puket Kids)	31	7	10	13	45.45	27	2026-04-25 10:25:09	2026-04-25 10:25:09
2298	Sunga Durável Azul Escuro(a) (Mundo Pet)	10	18	9	19	79.86	23	2026-04-25 10:25:09	2026-04-25 10:25:09
2299	Calça Stitch Turquesa (Dafiti Kids)	28	5	15	4	23.65	11	2026-04-25 10:25:09	2026-04-25 10:25:09
2300	Calcinha Confortável Cinza (Zoe Kids)	8	6	8	14	85.98	31	2026-04-25 10:25:09	2026-04-25 10:25:09
2301	Calçado Listrado Rosa (Renner Kids)	20	4	2	17	57.59	28	2026-04-25 10:25:09	2026-04-25 10:25:09
2302	Calça Longa Roxo(a) (Dafiti Kids)	21	5	12	13	33.46	11	2026-04-25 10:25:09	2026-04-25 10:25:09
2303	Vestido Algodão Laranja (Riachuelo Kids)	2	21	11	10	84.28	29	2026-04-25 10:25:09	2026-04-25 10:25:09
2304	Sunga Temático(a) Turquesa (Colcci Kids)	29	18	15	7	108.17	9	2026-04-25 10:25:09	2026-04-25 10:25:09
2305	Vestido Esportivo(a) Lilás (C&A Kids)	12	21	16	10	98.48	7	2026-04-25 10:25:09	2026-04-25 10:25:09
2306	Top Moleton Lilás (Carters)	23	20	16	7	105.10	8	2026-04-25 10:25:09	2026-04-25 10:25:09
2307	Calcinha Moleton Prata (C&A Kids)	23	6	18	10	118.26	7	2026-04-25 10:25:09	2026-04-25 10:25:09
2308	Casaco Stitch Laranja (Disney Kids)	28	9	11	9	56.19	13	2026-04-25 10:25:09	2026-04-25 10:25:09
2309	Vestido Básico(a) Prata (Zoe Kids)	4	21	18	14	27.16	31	2026-04-25 10:25:09	2026-04-25 10:25:09
2310	Bermuda Poliéster Bege (Boboi)	24	1	14	8	44.69	4	2026-04-25 10:25:09	2026-04-25 10:25:09
2311	Calçado Confortável Turquesa (Pimpolho)	8	4	15	3	112.58	26	2026-04-25 10:25:09	2026-04-25 10:25:09
2312	Meia Estampado(a) Cáqui (Adidas Kids)	13	14	20	19	64.52	1	2026-04-25 10:25:09	2026-04-25 10:25:09
2313	Sunga Esportivo(a) Amarelo(a) (Disney Baby)	12	18	7	12	71.51	12	2026-04-25 10:25:09	2026-04-25 10:25:09
2314	Sutiã Elástico(a) Verde (Carters)	11	19	5	1	71.43	8	2026-04-25 10:25:09	2026-04-25 10:25:09
2315	Short Leve Preto(a) (Lacoste Kids)	19	17	3	5	87.16	18	2026-04-25 10:25:09	2026-04-25 10:25:09
2316	Casaco Listrado Prata (Disney Baby)	20	9	18	18	44.80	12	2026-04-25 10:25:09	2026-04-25 10:25:09
2317	Macacão Leve Turquesa (Lacoste Kids)	19	12	15	19	73.82	18	2026-04-25 10:25:09	2026-04-25 10:25:09
2318	Macacão Jeans Prata (Ki Carinho)	17	12	18	17	90.11	16	2026-04-25 10:25:09	2026-04-25 10:25:09
2319	Blusa Curto(a) Turquesa (Carters)	9	3	15	19	32.69	8	2026-04-25 10:25:09	2026-04-25 10:25:09
2320	Vestido Ajustável Turquesa (Renner Kids)	1	21	15	3	106.47	28	2026-04-25 10:25:09	2026-04-25 10:25:09
2321	Camisa Moleton Prata (Mundo Pet)	23	7	18	1	109.54	23	2026-04-25 10:25:09	2026-04-25 10:25:09
2322	Calcinha Algodão Bege (Dafiti Kids)	2	6	14	1	118.87	11	2026-04-25 10:25:09	2026-04-25 10:25:09
2323	Camiseta Ajustável Laranja (C&A Kids)	1	8	11	3	17.28	7	2026-04-25 10:25:09	2026-04-25 10:25:09
2324	Sutiã Respirável Prata (Dafiti Kids)	25	19	18	14	87.45	11	2026-04-25 10:25:09	2026-04-25 10:25:09
2325	Bermuda Xadrez Marrom (C&A Baby)	32	1	13	7	76.35	6	2026-04-25 10:25:09	2026-04-25 10:25:09
2326	Camisa Poliéster Vinho (Lilica Ripilica)	24	7	19	2	92.36	19	2026-04-25 10:25:09	2026-04-25 10:25:09
2327	Calçado Temático(a) Verde (Adidas Kids)	29	4	5	1	33.80	1	2026-04-25 10:25:09	2026-04-25 10:25:09
2328	Casaco Confortável Rosa (Renner Kids)	8	9	2	6	91.46	28	2026-04-25 10:25:09	2026-04-25 10:25:09
2329	Jaqueta Algodão Vermelho(a) (Disney Kids)	2	11	6	7	71.20	13	2026-04-25 10:25:09	2026-04-25 10:25:09
2330	Sunga Loney Tunes Bege (Pimpolho)	22	18	14	11	99.91	26	2026-04-25 10:25:09	2026-04-25 10:25:09
2331	Casaco Moleton Roxo(a) (Pimpolho)	23	9	12	6	50.32	26	2026-04-25 10:25:09	2026-04-25 10:25:09
2332	Cueca Leve Dourado(a) (Puket Kids)	19	10	17	8	20.60	27	2026-04-25 10:25:09	2026-04-25 10:25:09
2333	Casaco Stitch Branco(a) (Pimpolho)	28	9	4	5	104.11	26	2026-04-25 10:25:09	2026-04-25 10:25:09
2334	Saia Stitch Cáqui (Osklen Kids)	28	16	20	16	23.06	24	2026-04-25 10:25:09	2026-04-25 10:25:09
2335	Jaqueta Xadrez Marrom (Ki Carinho)	32	11	13	18	63.17	16	2026-04-25 10:25:09	2026-04-25 10:25:09
2336	Maiô Saja Bege (Conjunto Infantil)	26	13	14	10	20.35	10	2026-04-25 10:25:09	2026-04-25 10:25:09
2337	Saia Leve Preto(a) (Lilica Ripilica)	19	16	3	12	27.96	19	2026-04-25 10:25:09	2026-04-25 10:25:09
2338	Camisa Algodão Azul (C&A Kids)	2	7	1	19	20.96	7	2026-04-25 10:25:09	2026-04-25 10:25:09
2339	Maiô Saja Azul Escuro(a) (Lilica Ripilica)	26	13	9	13	90.03	19	2026-04-25 10:25:09	2026-04-25 10:25:09
2340	Biquine Fit Lilás (Colcci Kids)	14	2	16	17	55.77	9	2026-04-25 10:25:09	2026-04-25 10:25:09
2341	Casaco Animal Print Cáqui (Conjunto Infantil)	3	9	20	9	32.99	10	2026-04-25 10:25:09	2026-04-25 10:25:09
2342	Macacão Colorido(a) Rosa Choque (Mundo Pet)	7	12	10	2	110.73	23	2026-04-25 10:25:09	2026-04-25 10:25:09
2343	Camisa Respirável Prata (Salsa Jeans Kids)	25	7	18	8	76.37	30	2026-04-25 10:25:09	2026-04-25 10:25:09
2344	Meia Jeans Dourado(a) (Bendita Cute)	17	14	17	13	76.32	3	2026-04-25 10:25:09	2026-04-25 10:25:09
2345	Vestido Moleton Vinho (Akazys)	23	21	19	9	85.99	2	2026-04-25 10:25:09	2026-04-25 10:25:09
2346	Camisa Floral Azul (C&A Baby)	15	7	1	4	50.58	6	2026-04-25 10:25:09	2026-04-25 10:25:09
2347	Cueca Saja Preto(a) (Dafiti Kids)	26	10	3	5	111.70	11	2026-04-25 10:25:09	2026-04-25 10:25:09
2348	Short Temático(a) Prata (Brandille)	29	17	18	10	117.96	5	2026-04-25 10:25:09	2026-04-25 10:25:09
2349	Sutiã Elástico(a) Vinho (Farm Kids)	11	19	19	7	90.32	14	2026-04-25 10:25:09	2026-04-25 10:25:09
2350	Cueca Algodão Roxo(a) (Kily)	2	10	12	8	115.71	17	2026-04-25 10:25:09	2026-04-25 10:25:09
2351	Calcinha Fit Dourado(a) (C&A Baby)	14	6	17	18	115.14	6	2026-04-25 10:25:09	2026-04-25 10:25:09
2352	Maiô Seda Branco(a) (Hering Kids)	27	13	4	5	51.03	15	2026-04-25 10:25:09	2026-04-25 10:25:09
2353	Bermuda Fit Turquesa (Mundo Pet)	14	1	15	3	88.13	23	2026-04-25 10:25:09	2026-04-25 10:25:09
2354	Blusa Colorido(a) Laranja (Brandille)	7	3	11	1	13.40	5	2026-04-25 10:25:09	2026-04-25 10:25:09
2355	Biquine Moleton Amarelo(a) (Boboi)	23	2	7	10	23.56	4	2026-04-25 10:25:09	2026-04-25 10:25:09
2356	Blusa Algodão Azul (Bendita Cute)	2	3	1	3	94.92	3	2026-04-25 10:25:09	2026-04-25 10:25:09
2357	Maiô Turma da Mônica Rosa (Adidas Kids)	31	13	2	5	86.71	1	2026-04-25 10:25:09	2026-04-25 10:25:09
2358	Vestido Longa Turquesa (Petit Royal)	21	21	15	11	11.40	25	2026-04-25 10:25:09	2026-04-25 10:25:09
2359	Cueca Fit Dourado(a) (Salsa Jeans Kids)	14	10	17	6	75.55	30	2026-04-25 10:25:09	2026-04-25 10:25:09
2360	Pijama Labubu Rosa (Petit Royal)	18	15	2	8	94.04	25	2026-04-25 10:25:09	2026-04-25 10:25:09
2361	Macacão Fit Rosa (Salsa Jeans Kids)	14	12	2	3	119.14	30	2026-04-25 10:25:09	2026-04-25 10:25:09
2362	Camiseta Esportivo(a) Lilás (Salsa Jeans Kids)	12	8	16	17	112.65	30	2026-04-25 10:25:09	2026-04-25 10:25:09
2363	Camiseta Clássico(a) Azul Escuro(a) (Conjunto Infantil)	6	8	9	1	83.31	10	2026-04-25 10:25:09	2026-04-25 10:25:09
2364	Cueca Durável Amarelo(a) (Osklen Kids)	10	10	7	1	86.23	24	2026-04-25 10:25:09	2026-04-25 10:25:09
2365	Short Formal Turquesa (Farm Kids)	16	17	15	10	20.88	14	2026-04-25 10:25:09	2026-04-25 10:25:09
2366	Camiseta Esportivo(a) Dourado(a) (Bendita Cute)	12	8	17	7	23.47	3	2026-04-25 10:25:09	2026-04-25 10:25:09
2367	Calcinha Fit Preto(a) (Colcci Kids)	14	6	3	11	40.42	9	2026-04-25 10:25:09	2026-04-25 10:25:09
2368	Pijama Labubu Cinza (Adidas Kids)	18	15	8	5	111.22	1	2026-04-25 10:25:09	2026-04-25 10:25:09
2369	Blusa Esportivo(a) Preto(a) (Akazys)	12	3	3	14	10.32	2	2026-04-25 10:25:09	2026-04-25 10:25:09
2370	Top Casual Roxo(a) (Riachuelo Kids)	5	20	12	14	106.95	29	2026-04-25 10:25:09	2026-04-25 10:25:09
2371	Jaqueta Colorido(a) Branco(a) (Mundo Infantil)	7	11	4	13	16.13	22	2026-04-25 10:25:09	2026-04-25 10:25:09
2372	Blusa Confortável Azul (Pimpolho)	8	3	1	14	32.60	26	2026-04-25 10:25:09	2026-04-25 10:25:09
2373	Biquine Colorido(a) Roxo(a) (Osklen Kids)	7	2	12	7	99.56	24	2026-04-25 10:25:09	2026-04-25 10:25:09
2374	Meia Elástico(a) Amarelo(a) (Carters)	11	14	7	14	56.75	8	2026-04-25 10:25:09	2026-04-25 10:25:09
2375	Camiseta Básico(a) Turquesa (Osklen Kids)	4	8	15	2	87.30	24	2026-04-25 10:25:09	2026-04-25 10:25:09
2376	Jaqueta Colorido(a) Amarelo(a) (Lacoste Kids)	7	11	7	6	80.95	18	2026-04-25 10:25:09	2026-04-25 10:25:09
2377	Meia Loney Tunes Roxo(a) (Zoe Kids)	22	14	12	8	100.34	31	2026-04-25 10:25:09	2026-04-25 10:25:09
2378	Calcinha Estampado(a) Vermelho(a) (Boboi)	13	6	6	18	27.29	4	2026-04-25 10:25:09	2026-04-25 10:25:09
2379	Cueca Básico(a) Azul (Mundo Pet)	4	10	1	6	109.01	23	2026-04-25 10:25:09	2026-04-25 10:25:09
2380	Calça Fit Azul Escuro(a) (Disney Kids)	14	5	9	6	42.15	13	2026-04-25 10:25:09	2026-04-25 10:25:09
2381	Calçado Floral Preto(a) (Mundo Pet)	15	4	3	16	69.20	23	2026-04-25 10:25:09	2026-04-25 10:25:09
2382	Short Animal Print Dourado(a) (Mundo Pet)	3	17	17	12	65.75	23	2026-04-25 10:25:09	2026-04-25 10:25:09
2383	Sunga Animal Print Branco(a) (Conjunto Infantil)	3	18	4	4	88.55	10	2026-04-25 10:25:09	2026-04-25 10:25:09
2384	Calçado Durável Vermelho(a) (Petit Royal)	10	4	6	7	31.31	25	2026-04-25 10:25:09	2026-04-25 10:25:09
2385	Biquine Formal Laranja (Adidas Kids)	16	2	11	10	27.35	1	2026-04-25 10:25:09	2026-04-25 10:25:09
2386	Biquine Longa Lilás (Boboi)	21	2	16	14	107.80	4	2026-04-25 10:25:09	2026-04-25 10:25:09
2387	Cueca Turma da Mônica Laranja (Petit Royal)	31	10	11	2	79.16	25	2026-04-25 10:25:09	2026-04-25 10:25:09
2388	Macacão Turma da Mônica Turquesa (Brandille)	31	12	15	14	21.19	5	2026-04-25 10:25:09	2026-04-25 10:25:09
2389	Calça Clássico(a) Lilás (Adidas Kids)	6	5	16	19	40.64	1	2026-04-25 10:25:09	2026-04-25 10:25:09
2390	Maiô Casual Marrom (Disney Kids)	5	13	13	2	11.82	13	2026-04-25 10:25:09	2026-04-25 10:25:09
2391	Meia Poliéster Amarelo(a) (Renner Kids)	24	14	7	13	109.13	28	2026-04-25 10:25:09	2026-04-25 10:25:09
2392	Top Moleton Roxo(a) (Colcci Kids)	23	20	12	16	19.13	9	2026-04-25 10:25:09	2026-04-25 10:25:09
2393	Macacão Ajustável Rosa Choque (Puket Kids)	1	12	10	5	105.58	27	2026-04-25 10:25:09	2026-04-25 10:25:09
2394	Calçado Temático(a) Vinho (Akazys)	29	4	19	19	20.95	2	2026-04-25 10:25:09	2026-04-25 10:25:09
2395	Camisa Durável Preto(a) (Ki Carinho)	10	7	3	19	14.65	16	2026-04-25 10:25:09	2026-04-25 10:25:09
2396	Camiseta Respirável Cáqui (Marisol)	25	8	20	19	37.94	21	2026-04-25 10:25:09	2026-04-25 10:25:09
2397	Vestido Jeans Vinho (Disney Kids)	17	21	19	3	44.69	13	2026-04-25 10:25:09	2026-04-25 10:25:09
2398	Sunga Casual Cinza (Disney Kids)	5	18	8	8	28.86	13	2026-04-25 10:25:09	2026-04-25 10:25:09
2399	Vestido Saja Turquesa (Lilica Ripilica)	26	21	15	17	26.71	19	2026-04-25 10:25:09	2026-04-25 10:25:09
2400	Maiô Fit Azul Escuro(a) (Disney Baby)	14	13	9	10	59.51	12	2026-04-25 10:25:09	2026-04-25 10:25:09
2401	Jaqueta Colorido(a) Preto(a) (Conjunto Infantil)	7	11	3	3	14.42	10	2026-04-25 10:25:09	2026-04-25 10:25:09
2402	Sunga Casual Azul (Colcci Kids)	5	18	1	17	84.34	9	2026-04-25 10:25:09	2026-04-25 10:25:09
2403	Pijama Floral Amarelo(a) (Renner Kids)	15	15	7	6	13.68	28	2026-04-25 10:25:09	2026-04-25 10:25:09
2404	Camiseta Loney Tunes Turquesa (Akazys)	22	8	15	5	76.63	2	2026-04-25 10:25:09	2026-04-25 10:25:09
2405	Vestido Moleton Turquesa (Lacoste Kids)	23	21	15	16	108.55	18	2026-04-25 10:25:09	2026-04-25 10:25:09
2406	Macacão Listrado Rosa Choque (Lilica Ripilica)	20	12	10	8	78.92	19	2026-04-25 10:25:09	2026-04-25 10:25:09
2407	Calçado Stitch Prata (Ki Carinho)	28	4	18	7	96.93	16	2026-04-25 10:25:09	2026-04-25 10:25:09
2408	Maiô Ajustável Lilás (Brandille)	1	13	16	15	64.90	5	2026-04-25 10:25:09	2026-04-25 10:25:09
2409	Meia Formal Dourado(a) (Pimpolho)	16	14	17	7	104.98	26	2026-04-25 10:25:09	2026-04-25 10:25:09
2410	Calça Turma da Mônica Branco(a) (Hering Kids)	31	5	4	18	80.55	15	2026-04-25 10:25:09	2026-04-25 10:25:09
2411	Calcinha Xadrez Amarelo(a) (Dafiti Kids)	32	6	7	11	63.41	11	2026-04-25 10:25:09	2026-04-25 10:25:09
2412	Camisa Xadrez Azul (Puket Kids)	32	7	1	13	106.17	27	2026-04-25 10:25:09	2026-04-25 10:25:09
2413	Saia Respirável Azul Escuro(a) (Akazys)	25	16	9	16	65.89	2	2026-04-25 10:25:09	2026-04-25 10:25:09
2414	Calça Confortável Turquesa (Mundo Pet)	8	5	15	11	61.19	23	2026-04-25 10:25:09	2026-04-25 10:25:09
2415	Vestido Jeans Vinho (Dafiti Kids)	17	21	19	8	11.19	11	2026-04-25 10:25:09	2026-04-25 10:25:09
2416	Top Poliéster Laranja (Mundo Infantil)	24	20	11	19	48.89	22	2026-04-25 10:25:09	2026-04-25 10:25:09
2417	Camisa Curto(a) Roxo(a) (Colcci Kids)	9	7	12	8	112.22	9	2026-04-25 10:25:09	2026-04-25 10:25:09
2418	Cueca Seda Roxo(a) (Colcci Kids)	27	10	12	11	39.27	9	2026-04-25 10:25:09	2026-04-25 10:25:09
2419	Sunga Temático(a) Amarelo(a) (Maria Filó Kids)	29	18	7	7	75.92	20	2026-04-25 10:25:09	2026-04-25 10:25:09
2420	Sutiã Clássico(a) Roxo(a) (Pimpolho)	6	19	12	5	65.40	26	2026-04-25 10:25:09	2026-04-25 10:25:09
2421	Top Formal Marrom (Puket Kids)	16	20	13	17	20.87	27	2026-04-25 10:25:09	2026-04-25 10:25:09
2422	Blusa Confortável Lilás (Boboi)	8	3	16	12	52.91	4	2026-04-25 10:25:09	2026-04-25 10:25:09
2423	Casaco Toy Store Rosa Choque (Bendita Cute)	30	9	10	15	63.24	3	2026-04-25 10:25:09	2026-04-25 10:25:09
2424	Top Confortável Branco(a) (Bendita Cute)	8	20	4	5	110.47	3	2026-04-25 10:25:09	2026-04-25 10:25:09
2425	Meia Formal Roxo(a) (C&A Baby)	16	14	12	17	48.20	6	2026-04-25 10:25:09	2026-04-25 10:25:09
2426	Bermuda Casual Rosa (Ki Carinho)	5	1	2	3	13.15	16	2026-04-25 10:25:09	2026-04-25 10:25:09
2427	Calçado Seda Amarelo(a) (C&A Kids)	27	4	7	2	88.66	7	2026-04-25 10:25:09	2026-04-25 10:25:09
2428	Macacão Loney Tunes Vermelho(a) (C&A Baby)	22	12	6	4	47.24	6	2026-04-25 10:25:09	2026-04-25 10:25:09
2429	Short Floral Vinho (Lacoste Kids)	15	17	19	5	98.03	18	2026-04-25 10:25:09	2026-04-25 10:25:09
2430	Blusa Seda Cáqui (Lilica Ripilica)	27	3	20	7	36.99	19	2026-04-25 10:25:09	2026-04-25 10:25:09
2431	Vestido Elástico(a) Verde (Puket Kids)	11	21	5	16	29.43	27	2026-04-25 10:25:09	2026-04-25 10:25:09
2432	Camisa Listrado Rosa (Maria Filó Kids)	20	7	2	17	45.00	20	2026-04-25 10:25:09	2026-04-25 10:25:09
2433	Camisa Loney Tunes Dourado(a) (C&A Baby)	22	7	17	8	52.92	6	2026-04-25 10:25:09	2026-04-25 10:25:09
2434	Meia Algodão Marrom (Mundo Pet)	2	14	13	10	111.93	23	2026-04-25 10:25:09	2026-04-25 10:25:09
2435	Camisa Respirável Cinza (Akazys)	25	7	8	11	83.21	2	2026-04-25 10:25:09	2026-04-25 10:25:09
2436	Jaqueta Durável Verde (Conjunto Infantil)	10	11	5	15	117.70	10	2026-04-25 10:25:09	2026-04-25 10:25:09
2437	Camisa Colorido(a) Azul (Riachuelo Kids)	7	7	1	18	79.97	29	2026-04-25 10:25:09	2026-04-25 10:25:09
2438	Jaqueta Toy Store Dourado(a) (Conjunto Infantil)	30	11	17	4	43.19	10	2026-04-25 10:25:09	2026-04-25 10:25:09
2439	Vestido Ajustável Cinza (Boboi)	1	21	8	19	15.53	4	2026-04-25 10:25:09	2026-04-25 10:25:09
2440	Vestido Poliéster Marrom (Zoe Kids)	24	21	13	7	22.87	31	2026-04-25 10:25:09	2026-04-25 10:25:09
2441	Vestido Ajustável Branco(a) (Maria Filó Kids)	1	21	4	5	68.83	20	2026-04-25 10:25:09	2026-04-25 10:25:09
2442	Calçado Algodão Verde (Zoe Kids)	2	4	5	5	48.22	31	2026-04-25 10:25:09	2026-04-25 10:25:09
2443	Camiseta Respirável Verde (Zoe Kids)	25	8	5	3	60.43	31	2026-04-25 10:25:09	2026-04-25 10:25:09
2444	Calça Moleton Prata (Kily)	23	5	18	13	98.66	17	2026-04-25 10:25:09	2026-04-25 10:25:09
2445	Calçado Loney Tunes Vermelho(a) (Carters)	22	4	6	14	105.85	8	2026-04-25 10:25:09	2026-04-25 10:25:09
2446	Calçado Poliéster Preto(a) (Salsa Jeans Kids)	24	4	3	8	71.18	30	2026-04-25 10:25:09	2026-04-25 10:25:09
2447	Maiô Curto(a) Laranja (Bendita Cute)	9	13	11	3	91.38	3	2026-04-25 10:25:09	2026-04-25 10:25:09
2448	Calça Curto(a) Bege (Zoe Kids)	9	5	14	18	112.74	31	2026-04-25 10:25:09	2026-04-25 10:25:09
2449	Calçado Saja Laranja (Kily)	26	4	11	15	54.27	17	2026-04-25 10:25:09	2026-04-25 10:25:09
2450	Calcinha Floral Laranja (Dafiti Kids)	15	6	11	1	57.07	11	2026-04-25 10:25:09	2026-04-25 10:25:09
2451	Meia Floral Prata (Akazys)	15	14	18	3	21.63	2	2026-04-25 10:25:09	2026-04-25 10:25:09
2452	Sunga Confortável Vermelho(a) (Brandille)	8	18	6	17	117.80	5	2026-04-25 10:25:09	2026-04-25 10:25:09
2453	Calça Básico(a) Roxo(a) (Bendita Cute)	4	5	12	9	60.39	3	2026-04-25 10:25:09	2026-04-25 10:25:09
2454	Sunga Ajustável Prata (Maria Filó Kids)	1	18	18	9	15.49	20	2026-04-25 10:25:09	2026-04-25 10:25:09
2455	Top Algodão Lilás (Boboi)	2	20	16	6	70.03	4	2026-04-25 10:25:09	2026-04-25 10:25:09
2456	Calça Ajustável Roxo(a) (Zoe Kids)	1	5	12	4	86.45	31	2026-04-25 10:25:09	2026-04-25 10:25:09
2457	Jaqueta Saja Dourado(a) (Kily)	26	11	17	13	94.04	17	2026-04-25 10:25:09	2026-04-25 10:25:09
2458	Jaqueta Casual Laranja (Farm Kids)	5	11	11	19	70.11	14	2026-04-25 10:25:09	2026-04-25 10:25:09
2459	Camisa Stitch Cáqui (Riachuelo Kids)	28	7	20	5	98.59	29	2026-04-25 10:25:09	2026-04-25 10:25:09
2460	Cueca Algodão Laranja (Colcci Kids)	2	10	11	2	36.60	9	2026-04-25 10:25:09	2026-04-25 10:25:09
2461	Cueca Stitch Preto(a) (Brandille)	28	10	3	18	84.02	5	2026-04-25 10:25:09	2026-04-25 10:25:09
2462	Calça Esportivo(a) Cinza (Hering Kids)	12	5	8	6	72.23	15	2026-04-25 10:25:09	2026-04-25 10:25:09
2463	Casaco Longa Roxo(a) (Disney Kids)	21	9	12	19	20.06	13	2026-04-25 10:25:09	2026-04-25 10:25:09
2464	Bermuda Floral Cinza (Conjunto Infantil)	15	1	8	18	96.41	10	2026-04-25 10:25:09	2026-04-25 10:25:09
2465	Maiô Algodão Verde (Disney Baby)	2	13	5	18	38.64	12	2026-04-25 10:25:09	2026-04-25 10:25:09
2466	Sunga Labubu Cáqui (Carters)	18	18	20	1	108.52	8	2026-04-25 10:25:09	2026-04-25 10:25:09
2467	Top Moleton Preto(a) (Bendita Cute)	23	20	3	6	48.23	3	2026-04-25 10:25:09	2026-04-25 10:25:09
2468	Calçado Ajustável Prata (Kily)	1	4	18	9	61.13	17	2026-04-25 10:25:09	2026-04-25 10:25:09
2469	Meia Stitch Vermelho(a) (Dafiti Kids)	28	14	6	17	112.79	11	2026-04-25 10:25:09	2026-04-25 10:25:09
2470	Vestido Algodão Vermelho(a) (Salsa Jeans Kids)	2	21	6	12	88.57	30	2026-04-25 10:25:09	2026-04-25 10:25:09
2471	Cueca Floral Amarelo(a) (Farm Kids)	15	10	7	3	29.56	14	2026-04-25 10:25:09	2026-04-25 10:25:09
2472	Sunga Estampado(a) Rosa Choque (Riachuelo Kids)	13	18	10	1	33.03	29	2026-04-25 10:25:09	2026-04-25 10:25:09
2473	Cueca Estampado(a) Vinho (C&A Baby)	13	10	19	14	28.86	6	2026-04-25 10:25:09	2026-04-25 10:25:09
2474	Bermuda Loney Tunes Turquesa (Puket Kids)	22	1	15	4	68.57	27	2026-04-25 10:25:09	2026-04-25 10:25:09
2475	Sunga Labubu Laranja (Mundo Infantil)	18	18	11	16	74.38	22	2026-04-25 10:25:09	2026-04-25 10:25:09
2476	Saia Elástico(a) Azul Escuro(a) (Disney Baby)	11	16	9	5	113.31	12	2026-04-25 10:25:09	2026-04-25 10:25:09
2477	Short Saja Branco(a) (Brandille)	26	17	4	5	34.38	5	2026-04-25 10:25:09	2026-04-25 10:25:09
2478	Calçado Confortável Roxo(a) (Maria Filó Kids)	8	4	12	16	119.94	20	2026-04-25 10:25:09	2026-04-25 10:25:09
2479	Sunga Curto(a) Dourado(a) (Adidas Kids)	9	18	17	6	81.89	1	2026-04-25 10:25:09	2026-04-25 10:25:09
2480	Sunga Estampado(a) Vermelho(a) (C&A Kids)	13	18	6	4	80.97	7	2026-04-25 10:25:09	2026-04-25 10:25:09
2481	Maiô Algodão Cáqui (Ki Carinho)	2	13	20	5	94.69	16	2026-04-25 10:25:09	2026-04-25 10:25:09
2482	Sunga Longa Cáqui (C&A Kids)	21	18	20	3	87.53	7	2026-04-25 10:25:09	2026-04-25 10:25:09
2483	Top Estampado(a) Laranja (Pimpolho)	13	20	11	6	65.16	26	2026-04-25 10:25:09	2026-04-25 10:25:09
2484	Maiô Durável Verde (Disney Baby)	10	13	5	13	47.40	12	2026-04-25 10:25:09	2026-04-25 10:25:09
2485	Casaco Formal Cinza (Renner Kids)	16	9	8	18	34.29	28	2026-04-25 10:25:09	2026-04-25 10:25:09
2486	Blusa Confortável Lilás (Lilica Ripilica)	8	3	16	8	34.22	19	2026-04-25 10:25:09	2026-04-25 10:25:09
2487	Macacão Fit Azul Escuro(a) (Dafiti Kids)	14	12	9	8	117.99	11	2026-04-25 10:25:09	2026-04-25 10:25:09
2488	Camisa Básico(a) Cinza (Conjunto Infantil)	4	7	8	15	54.63	10	2026-04-25 10:25:09	2026-04-25 10:25:09
2489	Macacão Respirável Turquesa (Petit Royal)	25	12	15	1	71.60	25	2026-04-25 10:25:09	2026-04-25 10:25:09
2490	Cueca Xadrez Lilás (Osklen Kids)	32	10	16	12	11.00	24	2026-04-25 10:25:09	2026-04-25 10:25:09
2491	Meia Seda Turquesa (Bendita Cute)	27	14	15	4	55.37	3	2026-04-25 10:25:09	2026-04-25 10:25:09
2492	Vestido Toy Store Branco(a) (Hering Kids)	30	21	4	1	58.00	15	2026-04-25 10:25:09	2026-04-25 10:25:09
2493	Short Durável Azul Escuro(a) (C&A Baby)	10	17	9	5	74.15	6	2026-04-25 10:25:09	2026-04-25 10:25:09
2494	Pijama Esportivo(a) Lilás (Lacoste Kids)	12	15	16	19	113.66	18	2026-04-25 10:25:09	2026-04-25 10:25:09
2495	Cueca Longa Amarelo(a) (Marisol)	21	10	7	19	64.19	21	2026-04-25 10:25:09	2026-04-25 10:25:09
2496	Maiô Longa Cinza (Boboi)	21	13	8	5	117.46	4	2026-04-25 10:25:09	2026-04-25 10:25:09
2497	Camisa Elástico(a) Cáqui (Lacoste Kids)	11	7	20	5	46.08	18	2026-04-25 10:25:09	2026-04-25 10:25:09
2498	Blusa Algodão Rosa Choque (C&A Kids)	2	3	10	11	99.64	7	2026-04-25 10:25:09	2026-04-25 10:25:09
2499	Sutiã Jeans Branco(a) (Mundo Pet)	17	19	4	13	38.59	23	2026-04-25 10:25:09	2026-04-25 10:25:09
2500	Camiseta Esportivo(a) Prata (Brandille)	12	8	18	19	82.63	5	2026-04-25 10:25:09	2026-04-25 10:25:09
2501	Casaco Labubu Dourado(a) (Zoe Kids)	18	9	17	3	18.35	31	2026-04-25 10:25:09	2026-04-25 10:25:09
2502	Saia Moleton Azul (Salsa Jeans Kids)	23	16	1	10	61.07	30	2026-04-25 10:25:09	2026-04-25 10:25:09
2503	Saia Saja Vermelho(a) (Mundo Pet)	26	16	6	19	114.14	23	2026-04-25 10:25:09	2026-04-25 10:25:09
2504	Macacão Casual Cáqui (Salsa Jeans Kids)	5	12	20	10	112.36	30	2026-04-25 10:25:09	2026-04-25 10:25:09
2505	Sutiã Respirável Rosa (Osklen Kids)	25	19	2	11	14.79	24	2026-04-25 10:25:09	2026-04-25 10:25:09
2506	Jaqueta Jeans Lilás (Mundo Pet)	17	11	16	6	21.04	23	2026-04-25 10:25:09	2026-04-25 10:25:09
2507	Camiseta Turma da Mônica Azul Escuro(a) (Akazys)	31	8	9	2	46.80	2	2026-04-25 10:25:09	2026-04-25 10:25:09
2508	Cueca Ajustável Bege (C&A Kids)	1	10	14	9	79.76	7	2026-04-25 10:25:09	2026-04-25 10:25:09
2509	Maiô Stitch Vinho (Maria Filó Kids)	28	13	19	13	78.13	20	2026-04-25 10:25:09	2026-04-25 10:25:09
2510	Jaqueta Animal Print Marrom (Dafiti Kids)	3	11	13	17	116.19	11	2026-04-25 10:25:09	2026-04-25 10:25:09
2511	Macacão Jeans Branco(a) (Petit Royal)	17	12	4	8	108.44	25	2026-04-25 10:25:09	2026-04-25 10:25:09
2512	Calça Curto(a) Cinza (Lilica Ripilica)	9	5	8	17	102.18	19	2026-04-25 10:25:09	2026-04-25 10:25:09
2513	Jaqueta Temático(a) Preto(a) (Disney Kids)	29	11	3	13	52.84	13	2026-04-25 10:25:09	2026-04-25 10:25:09
2514	Top Turma da Mônica Azul Escuro(a) (Disney Baby)	31	20	9	19	43.62	12	2026-04-25 10:25:09	2026-04-25 10:25:09
2515	Vestido Longa Dourado(a) (Pimpolho)	21	21	17	9	100.77	26	2026-04-25 10:25:09	2026-04-25 10:25:09
2516	Cueca Ajustável Vermelho(a) (Mundo Infantil)	1	10	6	4	32.10	22	2026-04-25 10:25:09	2026-04-25 10:25:09
2517	Calça Colorido(a) Azul Escuro(a) (C&A Baby)	7	5	9	15	47.02	6	2026-04-25 10:25:09	2026-04-25 10:25:09
2518	Blusa Jeans Rosa (Hering Kids)	17	3	2	16	87.35	15	2026-04-25 10:25:09	2026-04-25 10:25:09
2519	Calçado Esportivo(a) Roxo(a) (Ki Carinho)	12	4	12	4	87.97	16	2026-04-25 10:25:09	2026-04-25 10:25:09
2520	Sutiã Turma da Mônica Vinho (Lilica Ripilica)	31	19	19	12	63.89	19	2026-04-25 10:25:09	2026-04-25 10:25:09
2521	Vestido Leve Laranja (Akazys)	19	21	11	6	36.48	2	2026-04-25 10:25:09	2026-04-25 10:25:09
2522	Short Ajustável Dourado(a) (Riachuelo Kids)	1	17	17	6	108.69	29	2026-04-25 10:25:09	2026-04-25 10:25:09
2523	Casaco Esportivo(a) Rosa (Lacoste Kids)	12	9	2	17	95.77	18	2026-04-25 10:25:09	2026-04-25 10:25:09
2524	Pijama Animal Print Bege (Colcci Kids)	3	15	14	4	38.79	9	2026-04-25 10:25:09	2026-04-25 10:25:09
2525	Calcinha Longa Azul Escuro(a) (Farm Kids)	21	6	9	6	81.78	14	2026-04-25 10:25:09	2026-04-25 10:25:09
2526	Pijama Xadrez Bege (Maria Filó Kids)	32	15	14	17	90.88	20	2026-04-25 10:25:09	2026-04-25 10:25:09
2527	Top Elástico(a) Verde (Dafiti Kids)	11	20	5	1	107.33	11	2026-04-25 10:25:09	2026-04-25 10:25:09
2528	Blusa Ajustável Lilás (Bendita Cute)	1	3	16	7	116.97	3	2026-04-25 10:25:09	2026-04-25 10:25:09
2529	Blusa Turma da Mônica Preto(a) (Akazys)	31	3	3	14	84.56	2	2026-04-25 10:25:09	2026-04-25 10:25:09
2530	Vestido Respirável Roxo(a) (Kily)	25	21	12	8	85.66	17	2026-04-25 10:25:09	2026-04-25 10:25:09
2531	Maiô Floral Amarelo(a) (Kily)	15	13	7	9	27.97	17	2026-04-25 10:25:09	2026-04-25 10:25:09
2532	Calcinha Algodão Bege (Disney Kids)	2	6	14	10	78.63	13	2026-04-25 10:25:09	2026-04-25 10:25:09
2533	Top Longa Rosa Choque (Kily)	21	20	10	4	68.80	17	2026-04-25 10:25:09	2026-04-25 10:25:09
2534	Calcinha Labubu Turquesa (Renner Kids)	18	6	15	6	51.37	28	2026-04-25 10:25:09	2026-04-25 10:25:09
2535	Camiseta Curto(a) Prata (Kily)	9	8	18	14	100.82	17	2026-04-25 10:25:09	2026-04-25 10:25:09
2536	Jaqueta Confortável Laranja (Carters)	8	11	11	5	35.17	8	2026-04-25 10:25:09	2026-04-25 10:25:09
2537	Cueca Estampado(a) Prata (Renner Kids)	13	10	18	2	30.23	28	2026-04-25 10:25:09	2026-04-25 10:25:09
2538	Cueca Formal Dourado(a) (Disney Kids)	16	10	17	12	30.88	13	2026-04-25 10:25:09	2026-04-25 10:25:09
2539	Sutiã Saja Azul (Disney Baby)	26	19	1	8	100.78	12	2026-04-25 10:25:09	2026-04-25 10:25:09
2540	Bermuda Temático(a) Branco(a) (Disney Baby)	29	1	4	6	113.76	12	2026-04-25 10:25:09	2026-04-25 10:25:09
2541	Saia Elástico(a) Rosa Choque (Carters)	11	16	10	16	45.40	8	2026-04-25 10:25:09	2026-04-25 10:25:09
2542	Meia Floral Vinho (Conjunto Infantil)	15	14	19	9	21.27	10	2026-04-25 10:25:09	2026-04-25 10:25:09
2543	Camisa Respirável Cáqui (Maria Filó Kids)	25	7	20	17	118.75	20	2026-04-25 10:25:09	2026-04-25 10:25:09
2544	Calcinha Durável Azul (Conjunto Infantil)	10	6	1	8	22.80	10	2026-04-25 10:25:09	2026-04-25 10:25:09
2545	Cueca Algodão Rosa Choque (Akazys)	2	10	10	17	89.25	2	2026-04-25 10:25:09	2026-04-25 10:25:09
2546	Top Jeans Verde (Riachuelo Kids)	17	20	5	17	24.20	29	2026-04-25 10:25:09	2026-04-25 10:25:09
2547	Sutiã Curto(a) Prata (Dafiti Kids)	9	19	18	16	87.90	11	2026-04-25 10:25:09	2026-04-25 10:25:09
2548	Cueca Longa Roxo(a) (Zoe Kids)	21	10	12	7	51.31	31	2026-04-25 10:25:09	2026-04-25 10:25:09
2549	Calçado Leve Marrom (Marisol)	19	4	13	12	114.42	21	2026-04-25 10:25:09	2026-04-25 10:25:09
2550	Camisa Jeans Preto(a) (Mundo Infantil)	17	7	3	12	99.76	22	2026-04-25 10:25:09	2026-04-25 10:25:09
2551	Calça Labubu Cinza (Osklen Kids)	18	5	8	15	90.02	24	2026-04-25 10:25:09	2026-04-25 10:25:09
2552	Sutiã Moleton Lilás (Colcci Kids)	23	19	16	4	23.22	9	2026-04-25 10:25:09	2026-04-25 10:25:09
2553	Cueca Loney Tunes Prata (Dafiti Kids)	22	10	18	15	76.31	11	2026-04-25 10:25:09	2026-04-25 10:25:09
2554	Macacão Ajustável Lilás (Carters)	1	12	16	2	100.59	8	2026-04-25 10:25:09	2026-04-25 10:25:09
2555	Biquine Estampado(a) Branco(a) (Zoe Kids)	13	2	4	9	87.65	31	2026-04-25 10:25:09	2026-04-25 10:25:09
2556	Maiô Seda Vinho (Carters)	27	13	19	17	89.03	8	2026-04-25 10:25:09	2026-04-25 10:25:09
2557	Camisa Turma da Mônica Cáqui (Disney Kids)	31	7	20	3	83.85	13	2026-04-25 10:25:09	2026-04-25 10:25:09
2558	Calcinha Leve Vermelho(a) (Renner Kids)	19	6	6	6	81.63	28	2026-04-25 10:25:09	2026-04-25 10:25:09
2559	Camiseta Temático(a) Prata (Petit Royal)	29	8	18	16	104.79	25	2026-04-25 10:25:09	2026-04-25 10:25:09
2560	Pijama Stitch Bege (Kily)	28	15	14	5	20.14	17	2026-04-25 10:25:09	2026-04-25 10:25:09
2561	Sunga Fit Preto(a) (Petit Royal)	14	18	3	5	27.35	25	2026-04-25 10:25:09	2026-04-25 10:25:09
2562	Camisa Básico(a) Amarelo(a) (Osklen Kids)	4	7	7	14	94.81	24	2026-04-25 10:25:09	2026-04-25 10:25:09
2563	Calcinha Poliéster Vermelho(a) (Carters)	24	6	6	12	11.11	8	2026-04-25 10:25:09	2026-04-25 10:25:09
2564	Sutiã Ajustável Azul (Boboi)	1	19	1	17	107.25	4	2026-04-25 10:25:09	2026-04-25 10:25:09
2565	Maiô Fit Branco(a) (Pimpolho)	14	13	4	11	44.37	26	2026-04-25 10:25:09	2026-04-25 10:25:09
2566	Blusa Básico(a) Cinza (Maria Filó Kids)	4	3	8	6	85.48	20	2026-04-25 10:25:09	2026-04-25 10:25:09
2567	Calcinha Longa Amarelo(a) (Dafiti Kids)	21	6	7	5	72.44	11	2026-04-25 10:25:09	2026-04-25 10:25:09
2568	Jaqueta Colorido(a) Prata (Renner Kids)	7	11	18	16	109.51	28	2026-04-25 10:25:09	2026-04-25 10:25:09
2569	Cueca Algodão Verde (Marisol)	2	10	5	18	16.06	21	2026-04-25 10:25:09	2026-04-25 10:25:09
2570	Casaco Floral Verde (Marisol)	15	9	5	2	99.93	21	2026-04-25 10:25:09	2026-04-25 10:25:09
2571	Camiseta Básico(a) Branco(a) (Marisol)	4	8	4	3	30.56	21	2026-04-25 10:25:09	2026-04-25 10:25:09
2572	Sunga Moleton Vermelho(a) (Zoe Kids)	23	18	6	10	26.26	31	2026-04-25 10:25:09	2026-04-25 10:25:09
2573	Calçado Turma da Mônica Marrom (Carters)	31	4	13	8	18.69	8	2026-04-25 10:25:09	2026-04-25 10:25:09
2574	Meia Poliéster Laranja (Lilica Ripilica)	24	14	11	10	71.72	19	2026-04-25 10:25:09	2026-04-25 10:25:09
2575	Camiseta Fit Laranja (Salsa Jeans Kids)	14	8	11	19	62.34	30	2026-04-25 10:25:09	2026-04-25 10:25:09
2576	Meia Xadrez Roxo(a) (Riachuelo Kids)	32	14	12	13	19.05	29	2026-04-25 10:25:09	2026-04-25 10:25:09
2577	Pijama Loney Tunes Rosa (Renner Kids)	22	15	2	13	75.98	28	2026-04-25 10:25:09	2026-04-25 10:25:09
2578	Vestido Algodão Marrom (Bendita Cute)	2	21	13	16	93.58	3	2026-04-25 10:25:09	2026-04-25 10:25:09
2579	Calçado Formal Azul (Osklen Kids)	16	4	1	4	10.44	24	2026-04-25 10:25:09	2026-04-25 10:25:09
2580	Jaqueta Animal Print Cinza (Marisol)	3	11	8	17	15.86	21	2026-04-25 10:25:09	2026-04-25 10:25:09
2581	Calça Toy Store Vermelho(a) (Carters)	30	5	6	1	117.02	8	2026-04-25 10:25:09	2026-04-25 10:25:09
2582	Camisa Moleton Vinho (Carters)	23	7	19	14	58.60	8	2026-04-25 10:25:09	2026-04-25 10:25:09
2583	Vestido Jeans Lilás (C&A Baby)	17	21	16	5	104.43	6	2026-04-25 10:25:09	2026-04-25 10:25:09
2584	Top Loney Tunes Turquesa (Lilica Ripilica)	22	20	15	18	69.23	19	2026-04-25 10:25:09	2026-04-25 10:25:09
2585	Camiseta Fit Verde (Petit Royal)	14	8	5	9	31.20	25	2026-04-25 10:25:09	2026-04-25 10:25:09
2586	Maiô Confortável Vinho (Ki Carinho)	8	13	19	3	116.76	16	2026-04-25 10:25:09	2026-04-25 10:25:09
2587	Bermuda Casual Rosa (Dafiti Kids)	5	1	2	19	31.20	11	2026-04-25 10:25:09	2026-04-25 10:25:09
2588	Vestido Longa Roxo(a) (Lilica Ripilica)	21	21	12	17	84.04	19	2026-04-25 10:25:09	2026-04-25 10:25:09
2589	Top Poliéster Azul (Lilica Ripilica)	24	20	1	8	38.16	19	2026-04-25 10:25:09	2026-04-25 10:25:09
2590	Bermuda Labubu Rosa (Maria Filó Kids)	18	1	2	15	49.79	20	2026-04-25 10:25:09	2026-04-25 10:25:09
2591	Camiseta Longa Prata (Farm Kids)	21	8	18	6	100.23	14	2026-04-25 10:25:09	2026-04-25 10:25:09
2592	Bermuda Leve Bege (Puket Kids)	19	1	14	17	41.29	27	2026-04-25 10:25:09	2026-04-25 10:25:09
2593	Camiseta Esportivo(a) Branco(a) (Conjunto Infantil)	12	8	4	12	60.09	10	2026-04-25 10:25:09	2026-04-25 10:25:09
2594	Meia Longa Turquesa (Salsa Jeans Kids)	21	14	15	3	55.93	30	2026-04-25 10:25:09	2026-04-25 10:25:09
2595	Meia Stitch Bege (Petit Royal)	28	14	14	11	12.22	25	2026-04-25 10:25:09	2026-04-25 10:25:09
2596	Meia Floral Dourado(a) (Lilica Ripilica)	15	14	17	10	41.87	19	2026-04-25 10:25:09	2026-04-25 10:25:09
2597	Meia Labubu Verde (Farm Kids)	18	14	5	6	15.77	14	2026-04-25 10:25:09	2026-04-25 10:25:09
2598	Calçado Confortável Cáqui (Ki Carinho)	8	4	20	6	105.96	16	2026-04-25 10:25:09	2026-04-25 10:25:09
2599	Sutiã Esportivo(a) Amarelo(a) (Farm Kids)	12	19	7	12	96.06	14	2026-04-25 10:25:09	2026-04-25 10:25:09
2600	Camisa Moleton Prata (Boboi)	23	7	18	13	99.59	4	2026-04-25 10:25:09	2026-04-25 10:25:09
2601	Sunga Animal Print Cáqui (C&A Kids)	3	18	20	12	83.95	7	2026-04-25 10:25:09	2026-04-25 10:25:09
2602	Jaqueta Listrado Lilás (Bendita Cute)	20	11	16	8	78.49	3	2026-04-25 10:25:09	2026-04-25 10:25:09
2603	Calça Elástico(a) Preto(a) (Brandille)	11	5	3	6	64.47	5	2026-04-25 10:25:09	2026-04-25 10:25:09
2604	Sutiã Listrado Preto(a) (Boboi)	20	19	3	17	29.11	4	2026-04-25 10:25:09	2026-04-25 10:25:09
2605	Vestido Animal Print Cáqui (Adidas Kids)	3	21	20	13	95.26	1	2026-04-25 10:25:09	2026-04-25 10:25:09
2606	Top Floral Rosa (Conjunto Infantil)	15	20	2	4	17.73	10	2026-04-25 10:25:09	2026-04-25 10:25:09
2607	Calçado Stitch Turquesa (Farm Kids)	28	4	15	13	48.10	14	2026-04-25 10:25:09	2026-04-25 10:25:09
2608	Top Turma da Mônica Cinza (Riachuelo Kids)	31	20	8	6	92.78	29	2026-04-25 10:25:09	2026-04-25 10:25:09
2609	Pijama Listrado Marrom (Mundo Pet)	20	15	13	5	88.38	23	2026-04-25 10:25:09	2026-04-25 10:25:09
2610	Macacão Turma da Mônica Bege (Pimpolho)	31	12	14	3	63.54	26	2026-04-25 10:25:09	2026-04-25 10:25:09
2611	Camisa Leve Dourado(a) (C&A Baby)	19	7	17	7	109.42	6	2026-04-25 10:25:09	2026-04-25 10:25:09
2612	Jaqueta Fit Turquesa (C&A Kids)	14	11	15	2	58.24	7	2026-04-25 10:25:09	2026-04-25 10:25:09
2613	Pijama Colorido(a) Bege (Akazys)	7	15	14	9	76.12	2	2026-04-25 10:25:09	2026-04-25 10:25:09
2614	Camiseta Loney Tunes Preto(a) (Ki Carinho)	22	8	3	17	81.75	16	2026-04-25 10:25:09	2026-04-25 10:25:09
2615	Short Stitch Marrom (Lacoste Kids)	28	17	13	19	69.80	18	2026-04-25 10:25:09	2026-04-25 10:25:09
2616	Calcinha Fit Dourado(a) (Disney Baby)	14	6	17	1	44.15	12	2026-04-25 10:25:09	2026-04-25 10:25:09
2617	Meia Formal Turquesa (Disney Baby)	16	14	15	5	50.73	12	2026-04-25 10:25:09	2026-04-25 10:25:09
2618	Macacão Labubu Rosa (Mundo Pet)	18	12	2	2	83.89	23	2026-04-25 10:25:09	2026-04-25 10:25:09
2619	Macacão Respirável Branco(a) (Carters)	25	12	4	7	44.21	8	2026-04-25 10:25:09	2026-04-25 10:25:09
2620	Calçado Temático(a) Vermelho(a) (Bendita Cute)	29	4	6	15	72.67	3	2026-04-25 10:25:09	2026-04-25 10:25:09
2621	Cueca Loney Tunes Verde (Pimpolho)	22	10	5	4	69.20	26	2026-04-25 10:25:09	2026-04-25 10:25:09
2622	Calcinha Ajustável Bege (Petit Royal)	1	6	14	5	26.11	25	2026-04-25 10:25:09	2026-04-25 10:25:09
2623	Sutiã Curto(a) Prata (Hering Kids)	9	19	18	16	77.18	15	2026-04-25 10:25:09	2026-04-25 10:25:09
2624	Vestido Xadrez Laranja (Disney Kids)	32	21	11	12	82.60	13	2026-04-25 10:25:09	2026-04-25 10:25:09
2625	Saia Elástico(a) Azul Escuro(a) (Carters)	11	16	9	6	114.45	8	2026-04-25 10:25:09	2026-04-25 10:25:09
2626	Camisa Respirável Verde (Osklen Kids)	25	7	5	2	37.63	24	2026-04-25 10:25:09	2026-04-25 10:25:09
2627	Biquine Animal Print Rosa Choque (C&A Kids)	3	2	10	14	45.74	7	2026-04-25 10:25:09	2026-04-25 10:25:09
2628	Maiô Algodão Verde (Bendita Cute)	2	13	5	16	30.86	3	2026-04-25 10:25:09	2026-04-25 10:25:09
2629	Macacão Casual Rosa Choque (Zoe Kids)	5	12	10	1	62.07	31	2026-04-25 10:25:09	2026-04-25 10:25:09
2630	Casaco Esportivo(a) Amarelo(a) (Akazys)	12	9	7	4	47.46	2	2026-04-25 10:25:09	2026-04-25 10:25:09
2631	Cueca Temático(a) Vermelho(a) (C&A Kids)	29	10	6	16	100.50	7	2026-04-25 10:25:09	2026-04-25 10:25:09
2632	Jaqueta Algodão Turquesa (Colcci Kids)	2	11	15	1	114.91	9	2026-04-25 10:25:09	2026-04-25 10:25:09
2633	Sunga Elástico(a) Lilás (Ki Carinho)	11	18	16	8	111.02	16	2026-04-25 10:25:09	2026-04-25 10:25:09
2634	Jaqueta Durável Vermelho(a) (Zoe Kids)	10	11	6	13	40.30	31	2026-04-25 10:25:09	2026-04-25 10:25:09
2635	Sutiã Longa Azul Escuro(a) (Kily)	21	19	9	17	100.43	17	2026-04-25 10:25:09	2026-04-25 10:25:09
2636	Biquine Animal Print Roxo(a) (Salsa Jeans Kids)	3	2	12	4	78.47	30	2026-04-25 10:25:09	2026-04-25 10:25:09
2637	Saia Curto(a) Verde (Puket Kids)	9	16	5	6	72.93	27	2026-04-25 10:25:09	2026-04-25 10:25:09
2638	Cueca Esportivo(a) Dourado(a) (Marisol)	12	10	17	19	96.41	21	2026-04-25 10:25:09	2026-04-25 10:25:09
2639	Meia Básico(a) Marrom (Marisol)	4	14	13	13	57.89	21	2026-04-25 10:25:09	2026-04-25 10:25:09
2640	Cueca Stitch Cáqui (Mundo Pet)	28	10	20	6	31.35	23	2026-04-25 10:25:09	2026-04-25 10:25:09
2641	Casaco Esportivo(a) Azul Escuro(a) (Salsa Jeans Kids)	12	9	9	10	73.75	30	2026-04-25 10:25:09	2026-04-25 10:25:09
2642	Meia Ajustável Rosa Choque (Brandille)	1	14	10	5	66.12	5	2026-04-25 10:25:09	2026-04-25 10:25:09
2643	Calça Ajustável Azul Escuro(a) (Mundo Pet)	1	5	9	1	31.32	23	2026-04-25 10:25:09	2026-04-25 10:25:09
2644	Cueca Colorido(a) Amarelo(a) (Mundo Infantil)	7	10	7	14	94.49	22	2026-04-25 10:25:09	2026-04-25 10:25:09
2645	Bermuda Curto(a) Preto(a) (Disney Kids)	9	1	3	7	24.97	13	2026-04-25 10:25:09	2026-04-25 10:25:09
2646	Blusa Curto(a) Bege (Mundo Pet)	9	3	14	10	34.95	23	2026-04-25 10:25:09	2026-04-25 10:25:09
2647	Short Confortável Cinza (Maria Filó Kids)	8	17	8	11	12.31	20	2026-04-25 10:25:09	2026-04-25 10:25:09
2648	Jaqueta Fit Preto(a) (Maria Filó Kids)	14	11	3	1	90.20	20	2026-04-25 10:25:09	2026-04-25 10:25:09
2649	Calcinha Esportivo(a) Amarelo(a) (Renner Kids)	12	6	7	13	56.26	28	2026-04-25 10:25:09	2026-04-25 10:25:09
2650	Pijama Longa Rosa Choque (C&A Kids)	21	15	10	8	35.98	7	2026-04-25 10:25:09	2026-04-25 10:25:09
2651	Calçado Jeans Laranja (Adidas Kids)	17	4	11	6	68.09	1	2026-04-25 10:25:09	2026-04-25 10:25:09
2652	Biquine Xadrez Roxo(a) (Akazys)	32	2	12	3	54.37	2	2026-04-25 10:25:09	2026-04-25 10:25:09
2653	Blusa Algodão Turquesa (Adidas Kids)	2	3	15	11	82.70	1	2026-04-25 10:25:09	2026-04-25 10:25:09
2654	Cueca Moleton Marrom (Adidas Kids)	23	10	13	2	107.74	1	2026-04-25 10:25:09	2026-04-25 10:25:09
2655	Casaco Labubu Verde (Salsa Jeans Kids)	18	9	5	8	96.50	30	2026-04-25 10:25:09	2026-04-25 10:25:09
2656	Pijama Xadrez Preto(a) (Bendita Cute)	32	15	3	19	57.15	3	2026-04-25 10:25:09	2026-04-25 10:25:09
2657	Maiô Estampado(a) Branco(a) (Riachuelo Kids)	13	13	4	11	119.86	29	2026-04-25 10:25:09	2026-04-25 10:25:09
2658	Short Casual Azul Escuro(a) (Kily)	5	17	9	5	63.39	17	2026-04-25 10:25:09	2026-04-25 10:25:09
2659	Casaco Clássico(a) Turquesa (Salsa Jeans Kids)	6	9	15	14	62.24	30	2026-04-25 10:25:09	2026-04-25 10:25:09
2660	Bermuda Esportivo(a) Bege (Osklen Kids)	12	1	14	8	82.03	24	2026-04-25 10:25:09	2026-04-25 10:25:09
2661	Top Toy Store Prata (Dafiti Kids)	30	20	18	8	34.61	11	2026-04-25 10:25:09	2026-04-25 10:25:09
2662	Bermuda Confortável Marrom (Carters)	8	1	13	4	63.97	8	2026-04-25 10:25:09	2026-04-25 10:25:09
2663	Macacão Leve Branco(a) (Osklen Kids)	19	12	4	9	61.53	24	2026-04-25 10:25:09	2026-04-25 10:25:09
2664	Calça Jeans Dourado(a) (Farm Kids)	17	5	17	13	15.08	14	2026-04-25 10:25:09	2026-04-25 10:25:09
2665	Cueca Temático(a) Vermelho(a) (Disney Baby)	29	10	6	12	40.30	12	2026-04-25 10:25:09	2026-04-25 10:25:09
2666	Meia Casual Marrom (Boboi)	5	14	13	1	87.25	4	2026-04-25 10:25:09	2026-04-25 10:25:09
2667	Saia Algodão Preto(a) (Marisol)	2	16	3	2	112.41	21	2026-04-25 10:25:09	2026-04-25 10:25:09
2668	Saia Estampado(a) Azul Escuro(a) (Bendita Cute)	13	16	9	8	54.23	3	2026-04-25 10:25:09	2026-04-25 10:25:09
2669	Pijama Jeans Rosa Choque (Kily)	17	15	10	4	113.68	17	2026-04-25 10:25:09	2026-04-25 10:25:09
2670	Bermuda Esportivo(a) Azul (Adidas Kids)	12	1	1	14	67.54	1	2026-04-25 10:25:09	2026-04-25 10:25:09
2671	Sunga Leve Bege (Conjunto Infantil)	19	18	14	13	25.25	10	2026-04-25 10:25:09	2026-04-25 10:25:09
2672	Meia Respirável Vinho (C&A Baby)	25	14	19	8	67.94	6	2026-04-25 10:25:09	2026-04-25 10:25:09
2673	Pijama Respirável Bege (Ki Carinho)	25	15	14	5	79.00	16	2026-04-25 10:25:09	2026-04-25 10:25:09
2674	Camiseta Confortável Preto(a) (Adidas Kids)	8	8	3	3	75.99	1	2026-04-25 10:25:09	2026-04-25 10:25:09
2675	Camiseta Durável Rosa Choque (Zoe Kids)	10	8	10	4	109.65	31	2026-04-25 10:25:09	2026-04-25 10:25:09
2676	Camisa Formal Azul Escuro(a) (Akazys)	16	7	9	5	114.96	2	2026-04-25 10:25:09	2026-04-25 10:25:09
2677	Top Poliéster Turquesa (C&A Baby)	24	20	15	12	61.02	6	2026-04-25 10:25:09	2026-04-25 10:25:09
2678	Blusa Formal Azul Escuro(a) (Salsa Jeans Kids)	16	3	9	1	83.66	30	2026-04-25 10:25:09	2026-04-25 10:25:09
2679	Saia Algodão Rosa (Kily)	2	16	2	1	44.88	17	2026-04-25 10:25:09	2026-04-25 10:25:09
2680	Bermuda Estampado(a) Rosa Choque (Riachuelo Kids)	13	1	10	16	84.54	29	2026-04-25 10:25:09	2026-04-25 10:25:09
2681	Maiô Respirável Rosa Choque (Bendita Cute)	25	13	10	13	99.11	3	2026-04-25 10:25:09	2026-04-25 10:25:09
2682	Pijama Stitch Marrom (Hering Kids)	28	15	13	15	23.58	15	2026-04-25 10:25:09	2026-04-25 10:25:09
2683	Calça Labubu Azul Escuro(a) (Ki Carinho)	18	5	9	5	17.74	16	2026-04-25 10:25:09	2026-04-25 10:25:09
2684	Blusa Durável Verde (Puket Kids)	10	3	5	18	59.48	27	2026-04-25 10:25:09	2026-04-25 10:25:09
2685	Sunga Poliéster Prata (C&A Kids)	24	18	18	1	57.24	7	2026-04-25 10:25:09	2026-04-25 10:25:09
2686	Maiô Toy Store Cinza (Conjunto Infantil)	30	13	8	2	34.84	10	2026-04-25 10:25:09	2026-04-25 10:25:09
2687	Casaco Jeans Marrom (Salsa Jeans Kids)	17	9	13	16	10.12	30	2026-04-25 10:25:09	2026-04-25 10:25:09
2688	Pijama Loney Tunes Lilás (Lacoste Kids)	22	15	16	19	73.44	18	2026-04-25 10:25:09	2026-04-25 10:25:09
2689	Cueca Estampado(a) Cáqui (Boboi)	13	10	20	5	62.15	4	2026-04-25 10:25:09	2026-04-25 10:25:09
2690	Pijama Formal Marrom (Dafiti Kids)	16	15	13	16	59.43	11	2026-04-25 10:25:09	2026-04-25 10:25:09
2691	Vestido Stitch Marrom (Brandille)	28	21	13	8	52.86	5	2026-04-25 10:25:09	2026-04-25 10:25:09
2692	Sutiã Toy Store Prata (Mundo Pet)	30	19	18	1	18.68	23	2026-04-25 10:25:09	2026-04-25 10:25:09
2693	Vestido Clássico(a) Vermelho(a) (Zoe Kids)	6	21	6	7	54.51	31	2026-04-25 10:25:09	2026-04-25 10:25:09
2694	Jaqueta Casual Rosa (Akazys)	5	11	2	11	40.01	2	2026-04-25 10:25:09	2026-04-25 10:25:09
2695	Blusa Durável Cinza (Petit Royal)	10	3	8	6	47.13	25	2026-04-25 10:25:09	2026-04-25 10:25:09
2696	Camiseta Básico(a) Azul (Farm Kids)	4	8	1	16	70.88	14	2026-04-25 10:25:09	2026-04-25 10:25:09
2697	Macacão Formal Cinza (Mundo Pet)	16	12	8	12	106.21	23	2026-04-25 10:25:09	2026-04-25 10:25:09
2698	Calçado Leve Rosa Choque (Akazys)	19	4	10	13	112.79	2	2026-04-25 10:25:09	2026-04-25 10:25:09
2699	Bermuda Animal Print Prata (Adidas Kids)	3	1	18	16	25.94	1	2026-04-25 10:25:09	2026-04-25 10:25:09
2700	Calçado Floral Amarelo(a) (Lilica Ripilica)	15	4	7	14	56.24	19	2026-04-25 10:25:09	2026-04-25 10:25:09
2701	Camisa Durável Amarelo(a) (Petit Royal)	10	7	7	14	111.94	25	2026-04-25 10:25:09	2026-04-25 10:25:09
2702	Casaco Confortável Marrom (Zoe Kids)	8	9	13	14	45.36	31	2026-04-25 10:25:09	2026-04-25 10:25:09
2703	Calçado Esportivo(a) Dourado(a) (Adidas Kids)	12	4	17	15	83.71	1	2026-04-25 10:25:09	2026-04-25 10:25:09
2704	Jaqueta Listrado Azul (Lilica Ripilica)	20	11	1	1	95.59	19	2026-04-25 10:25:09	2026-04-25 10:25:09
2705	Casaco Animal Print Prata (Carters)	3	9	18	7	42.00	8	2026-04-25 10:25:09	2026-04-25 10:25:09
2706	Bermuda Fit Branco(a) (Conjunto Infantil)	14	1	4	12	87.55	10	2026-04-25 10:25:09	2026-04-25 10:25:09
2707	Casaco Casual Lilás (Hering Kids)	5	9	16	10	57.99	15	2026-04-25 10:25:09	2026-04-25 10:25:09
2708	Camisa Longa Turquesa (Disney Kids)	21	7	15	7	109.69	13	2026-04-25 10:25:09	2026-04-25 10:25:09
2709	Cueca Durável Bege (Zoe Kids)	10	10	14	17	113.84	31	2026-04-25 10:25:09	2026-04-25 10:25:09
2710	Biquine Jeans Prata (Colcci Kids)	17	2	18	15	12.85	9	2026-04-25 10:25:09	2026-04-25 10:25:09
2711	Jaqueta Fit Azul Escuro(a) (Mundo Infantil)	14	11	9	17	115.78	22	2026-04-25 10:25:09	2026-04-25 10:25:09
2712	Saia Casual Turquesa (Adidas Kids)	5	16	15	7	97.23	1	2026-04-25 10:25:09	2026-04-25 10:25:09
2713	Bermuda Algodão Azul (Brandille)	2	1	1	18	114.67	5	2026-04-25 10:25:09	2026-04-25 10:25:09
2714	Jaqueta Moleton Lilás (Lacoste Kids)	23	11	16	1	52.84	18	2026-04-25 10:25:09	2026-04-25 10:25:09
2715	Jaqueta Formal Amarelo(a) (Mundo Pet)	16	11	7	6	59.11	23	2026-04-25 10:25:09	2026-04-25 10:25:09
2716	Meia Confortável Lilás (Bendita Cute)	8	14	16	15	28.04	3	2026-04-25 10:25:09	2026-04-25 10:25:09
2717	Jaqueta Seda Verde (Boboi)	27	11	5	1	78.03	4	2026-04-25 10:25:09	2026-04-25 10:25:09
2718	Blusa Estampado(a) Turquesa (Mundo Pet)	13	3	15	13	16.70	23	2026-04-25 10:25:09	2026-04-25 10:25:09
2719	Maiô Moleton Laranja (Petit Royal)	23	13	11	11	72.22	25	2026-04-25 10:25:09	2026-04-25 10:25:09
2720	Calça Básico(a) Turquesa (Disney Baby)	4	5	15	15	18.08	12	2026-04-25 10:25:09	2026-04-25 10:25:09
2721	Sunga Casual Cinza (Maria Filó Kids)	5	18	8	18	58.06	20	2026-04-25 10:25:09	2026-04-25 10:25:09
2722	Calça Esportivo(a) Verde (Disney Baby)	12	5	5	19	77.55	12	2026-04-25 10:25:09	2026-04-25 10:25:09
2723	Meia Clássico(a) Branco(a) (Riachuelo Kids)	6	14	4	8	66.22	29	2026-04-25 10:25:09	2026-04-25 10:25:09
2724	Maiô Casual Vermelho(a) (Adidas Kids)	5	13	6	19	47.92	1	2026-04-25 10:25:09	2026-04-25 10:25:09
2725	Bermuda Curto(a) Marrom (Brandille)	9	1	13	19	57.63	5	2026-04-25 10:25:09	2026-04-25 10:25:09
2726	Pijama Turma da Mônica Azul (Lacoste Kids)	31	15	1	10	56.21	18	2026-04-25 10:25:09	2026-04-25 10:25:09
2727	Vestido Leve Turquesa (Bendita Cute)	19	21	15	4	103.52	3	2026-04-25 10:25:09	2026-04-25 10:25:09
2728	Short Elástico(a) Azul Escuro(a) (Brandille)	11	17	9	2	68.83	5	2026-04-25 10:25:09	2026-04-25 10:25:09
2729	Maiô Básico(a) Preto(a) (Adidas Kids)	4	13	3	14	25.46	1	2026-04-25 10:25:09	2026-04-25 10:25:09
2730	Cueca Esportivo(a) Rosa (Pimpolho)	12	10	2	16	33.89	26	2026-04-25 10:25:09	2026-04-25 10:25:09
2731	Pijama Algodão Turquesa (Maria Filó Kids)	2	15	15	1	96.96	20	2026-04-25 10:25:09	2026-04-25 10:25:09
2732	Short Seda Branco(a) (Adidas Kids)	27	17	4	13	45.49	1	2026-04-25 10:25:09	2026-04-25 10:25:09
2733	Meia Animal Print Verde (Mundo Pet)	3	14	5	4	39.00	23	2026-04-25 10:25:09	2026-04-25 10:25:09
2734	Camisa Curto(a) Azul Escuro(a) (Lacoste Kids)	9	7	9	12	45.49	18	2026-04-25 10:25:09	2026-04-25 10:25:09
2735	Camisa Listrado Turquesa (Osklen Kids)	20	7	15	15	88.43	24	2026-04-25 10:25:09	2026-04-25 10:25:09
2736	Cueca Seda Prata (Salsa Jeans Kids)	27	10	18	14	96.92	30	2026-04-25 10:25:09	2026-04-25 10:25:09
2737	Sutiã Estampado(a) Azul Escuro(a) (Petit Royal)	13	19	9	3	59.77	25	2026-04-25 10:25:09	2026-04-25 10:25:09
2738	Cueca Elástico(a) Prata (Zoe Kids)	11	10	18	7	90.52	31	2026-04-25 10:25:09	2026-04-25 10:25:09
2739	Top Labubu Amarelo(a) (Brandille)	18	20	7	18	14.93	5	2026-04-25 10:25:09	2026-04-25 10:25:09
2740	Casaco Durável Preto(a) (Renner Kids)	10	9	3	10	52.01	28	2026-04-25 10:25:09	2026-04-25 10:25:09
2741	Short Esportivo(a) Vinho (Colcci Kids)	12	17	19	6	25.18	9	2026-04-25 10:25:09	2026-04-25 10:25:09
2742	Saia Clássico(a) Vermelho(a) (C&A Baby)	6	16	6	3	78.44	6	2026-04-25 10:25:09	2026-04-25 10:25:09
2743	Pijama Algodão Verde (C&A Kids)	2	15	5	6	77.58	7	2026-04-25 10:25:09	2026-04-25 10:25:09
2744	Cueca Casual Preto(a) (Lilica Ripilica)	5	10	3	10	112.34	19	2026-04-25 10:25:09	2026-04-25 10:25:09
2745	Calcinha Toy Store Roxo(a) (Carters)	30	6	12	9	65.37	8	2026-04-25 10:25:09	2026-04-25 10:25:09
2746	Calçado Stitch Preto(a) (Farm Kids)	28	4	3	4	63.64	14	2026-04-25 10:25:09	2026-04-25 10:25:09
2747	Maiô Jeans Marrom (Boboi)	17	13	13	16	90.66	4	2026-04-25 10:25:09	2026-04-25 10:25:09
2748	Sutiã Respirável Bege (Farm Kids)	25	19	14	14	12.68	14	2026-04-25 10:25:09	2026-04-25 10:25:09
2749	Macacão Animal Print Verde (Carters)	3	12	5	13	19.95	8	2026-04-25 10:25:09	2026-04-25 10:25:09
2750	Vestido Labubu Cáqui (Disney Kids)	18	21	20	2	92.44	13	2026-04-25 10:25:09	2026-04-25 10:25:09
2751	Bermuda Toy Store Verde (Osklen Kids)	30	1	5	4	35.81	24	2026-04-25 10:25:09	2026-04-25 10:25:09
2752	Biquine Temático(a) Turquesa (Mundo Pet)	29	2	15	12	116.05	23	2026-04-25 10:25:09	2026-04-25 10:25:09
2753	Jaqueta Formal Cáqui (Akazys)	16	11	20	19	96.37	2	2026-04-25 10:25:09	2026-04-25 10:25:09
2754	Vestido Stitch Prata (Lacoste Kids)	28	21	18	10	95.28	18	2026-04-25 10:25:09	2026-04-25 10:25:09
2755	Camisa Algodão Verde (Boboi)	2	7	5	15	103.03	4	2026-04-25 10:25:09	2026-04-25 10:25:09
2756	Short Temático(a) Rosa Choque (Carters)	29	17	10	16	55.11	8	2026-04-25 10:25:09	2026-04-25 10:25:09
2757	Camisa Saja Cinza (Renner Kids)	26	7	8	7	18.81	28	2026-04-25 10:25:09	2026-04-25 10:25:09
2758	Macacão Animal Print Branco(a) (Petit Royal)	3	12	4	9	70.98	25	2026-04-25 10:25:09	2026-04-25 10:25:09
2759	Saia Curto(a) Branco(a) (Lacoste Kids)	9	16	4	12	27.81	18	2026-04-25 10:25:09	2026-04-25 10:25:09
2760	Pijama Durável Marrom (C&A Baby)	10	15	13	14	58.50	6	2026-04-25 10:25:09	2026-04-25 10:25:09
2761	Vestido Elástico(a) Cáqui (Disney Baby)	11	21	20	19	47.23	12	2026-04-25 10:25:09	2026-04-25 10:25:09
2762	Calça Confortável Azul (Hering Kids)	8	5	1	15	118.63	15	2026-04-25 10:25:09	2026-04-25 10:25:09
2763	Maiô Seda Verde (Ki Carinho)	27	13	5	16	59.27	16	2026-04-25 10:25:09	2026-04-25 10:25:09
2764	Jaqueta Moleton Rosa (C&A Baby)	23	11	2	5	100.52	6	2026-04-25 10:25:09	2026-04-25 10:25:09
2765	Camiseta Loney Tunes Roxo(a) (Dafiti Kids)	22	8	12	5	103.21	11	2026-04-25 10:25:09	2026-04-25 10:25:09
2766	Cueca Labubu Turquesa (Mundo Pet)	18	10	15	13	95.12	23	2026-04-25 10:25:09	2026-04-25 10:25:09
2767	Casaco Saja Prata (Zoe Kids)	26	9	18	11	66.53	31	2026-04-25 10:25:09	2026-04-25 10:25:09
2768	Top Animal Print Amarelo(a) (Mundo Infantil)	3	20	7	14	17.53	22	2026-04-25 10:25:09	2026-04-25 10:25:09
2769	Saia Floral Marrom (Mundo Pet)	15	16	13	19	77.13	23	2026-04-25 10:25:09	2026-04-25 10:25:09
2770	Calcinha Leve Preto(a) (Ki Carinho)	19	6	3	8	86.23	16	2026-04-25 10:25:09	2026-04-25 10:25:09
2771	Short Leve Branco(a) (Farm Kids)	19	17	4	18	83.98	14	2026-04-25 10:25:09	2026-04-25 10:25:09
2772	Top Poliéster Prata (Lilica Ripilica)	24	20	18	8	60.53	19	2026-04-25 10:25:09	2026-04-25 10:25:09
2773	Biquine Longa Cáqui (Hering Kids)	21	2	20	18	107.91	15	2026-04-25 10:25:09	2026-04-25 10:25:09
2774	Maiô Respirável Preto(a) (Akazys)	25	13	3	1	44.98	2	2026-04-25 10:25:09	2026-04-25 10:25:09
2775	Meia Temático(a) Amarelo(a) (Petit Royal)	29	14	7	18	54.70	25	2026-04-25 10:25:09	2026-04-25 10:25:09
2776	Maiô Elástico(a) Rosa Choque (Renner Kids)	11	13	10	16	62.18	28	2026-04-25 10:25:09	2026-04-25 10:25:09
2777	Calçado Seda Cinza (Brandille)	27	4	8	2	91.63	5	2026-04-25 10:25:09	2026-04-25 10:25:09
2778	Calçado Saja Verde (Renner Kids)	26	4	5	13	83.98	28	2026-04-25 10:25:09	2026-04-25 10:25:09
2779	Sutiã Saja Branco(a) (Disney Kids)	26	19	4	14	87.15	13	2026-04-25 10:25:09	2026-04-25 10:25:09
2780	Cueca Algodão Azul Escuro(a) (Zoe Kids)	2	10	9	6	88.11	31	2026-04-25 10:25:09	2026-04-25 10:25:09
2781	Jaqueta Loney Tunes Amarelo(a) (Lacoste Kids)	22	11	7	10	36.02	18	2026-04-25 10:25:09	2026-04-25 10:25:09
2782	Sutiã Moleton Cinza (Mundo Pet)	23	19	8	3	30.01	23	2026-04-25 10:25:09	2026-04-25 10:25:09
2783	Short Toy Store Prata (Marisol)	30	17	18	9	65.21	21	2026-04-25 10:25:09	2026-04-25 10:25:09
2784	Meia Básico(a) Rosa (Pimpolho)	4	14	2	1	74.42	26	2026-04-25 10:25:09	2026-04-25 10:25:09
2785	Sunga Clássico(a) Dourado(a) (C&A Baby)	6	18	17	14	71.70	6	2026-04-25 10:25:09	2026-04-25 10:25:09
2786	Casaco Xadrez Verde (Adidas Kids)	32	9	5	4	102.80	1	2026-04-25 10:25:09	2026-04-25 10:25:09
2787	Pijama Saja Dourado(a) (Colcci Kids)	26	15	17	1	52.76	9	2026-04-25 10:25:09	2026-04-25 10:25:09
2788	Vestido Listrado Vermelho(a) (Akazys)	20	21	6	13	27.21	2	2026-04-25 10:25:09	2026-04-25 10:25:09
2789	Sunga Moleton Vinho (Boboi)	23	18	19	5	81.41	4	2026-04-25 10:25:09	2026-04-25 10:25:09
2790	Casaco Temático(a) Amarelo(a) (Pimpolho)	29	9	7	19	112.46	26	2026-04-25 10:25:09	2026-04-25 10:25:09
2791	Calça Fit Vinho (Conjunto Infantil)	14	5	19	3	20.09	10	2026-04-25 10:25:09	2026-04-25 10:25:09
2792	Casaco Temático(a) Rosa (Petit Royal)	29	9	2	5	73.08	25	2026-04-25 10:25:09	2026-04-25 10:25:09
2793	Vestido Loney Tunes Azul Escuro(a) (Mundo Pet)	22	21	9	9	95.51	23	2026-04-25 10:25:09	2026-04-25 10:25:09
2794	Biquine Leve Azul (Salsa Jeans Kids)	19	2	1	2	116.73	30	2026-04-25 10:25:09	2026-04-25 10:25:09
2795	Top Listrado Branco(a) (Maria Filó Kids)	20	20	4	12	59.99	20	2026-04-25 10:25:09	2026-04-25 10:25:09
2796	Macacão Listrado Azul Escuro(a) (Renner Kids)	20	12	9	14	63.15	28	2026-04-25 10:25:09	2026-04-25 10:25:09
2797	Biquine Esportivo(a) Amarelo(a) (Renner Kids)	12	2	7	1	110.58	28	2026-04-25 10:25:09	2026-04-25 10:25:09
2798	Biquine Loney Tunes Azul (Mundo Infantil)	22	2	1	10	92.04	22	2026-04-25 10:25:09	2026-04-25 10:25:09
2799	Sutiã Poliéster Prata (Marisol)	24	19	18	14	90.49	21	2026-04-25 10:25:09	2026-04-25 10:25:09
2800	Short Stitch Azul (Osklen Kids)	28	17	1	17	13.05	24	2026-04-25 10:25:09	2026-04-25 10:25:09
2801	Camiseta Colorido(a) Azul Escuro(a) (Disney Baby)	7	8	9	10	95.72	12	2026-04-25 10:25:09	2026-04-25 10:25:09
2802	Cueca Seda Vermelho(a) (Colcci Kids)	27	10	6	9	65.12	9	2026-04-25 10:25:09	2026-04-25 10:25:09
2803	Camisa Listrado Marrom (Puket Kids)	20	7	13	17	118.52	27	2026-04-25 10:25:09	2026-04-25 10:25:09
2804	Sutiã Colorido(a) Turquesa (Marisol)	7	19	15	12	116.01	21	2026-04-25 10:25:09	2026-04-25 10:25:09
2805	Sutiã Esportivo(a) Azul (Ki Carinho)	12	19	1	19	16.87	16	2026-04-25 10:25:09	2026-04-25 10:25:09
2806	Casaco Xadrez Preto(a) (Farm Kids)	32	9	3	4	46.76	14	2026-04-25 10:25:09	2026-04-25 10:25:09
2807	Calcinha Listrado Laranja (Boboi)	20	6	11	4	46.86	4	2026-04-25 10:25:09	2026-04-25 10:25:09
2808	Jaqueta Poliéster Branco(a) (Mundo Infantil)	24	11	4	2	22.55	22	2026-04-25 10:25:09	2026-04-25 10:25:09
2809	Bermuda Algodão Laranja (Conjunto Infantil)	2	1	11	3	14.54	10	2026-04-25 10:25:09	2026-04-25 10:25:09
2810	Vestido Leve Dourado(a) (Puket Kids)	19	21	17	6	60.60	27	2026-04-25 10:25:09	2026-04-25 10:25:09
2811	Short Casual Dourado(a) (Salsa Jeans Kids)	5	17	17	7	112.47	30	2026-04-25 10:25:09	2026-04-25 10:25:09
2812	Pijama Curto(a) Prata (Ki Carinho)	9	15	18	17	65.80	16	2026-04-25 10:25:09	2026-04-25 10:25:09
2813	Sunga Estampado(a) Laranja (Conjunto Infantil)	13	18	11	19	85.74	10	2026-04-25 10:25:09	2026-04-25 10:25:09
2814	Calçado Listrado Rosa Choque (Bendita Cute)	20	4	10	12	11.23	3	2026-04-25 10:25:09	2026-04-25 10:25:09
2815	Biquine Listrado Vermelho(a) (Zoe Kids)	20	2	6	11	10.81	31	2026-04-25 10:25:09	2026-04-25 10:25:09
2816	Macacão Casual Vermelho(a) (Lilica Ripilica)	5	12	6	13	65.71	19	2026-04-25 10:25:09	2026-04-25 10:25:09
2817	Calça Poliéster Cinza (Renner Kids)	24	5	8	11	52.12	28	2026-04-25 10:25:09	2026-04-25 10:25:09
2818	Jaqueta Xadrez Lilás (Kily)	32	11	16	2	20.99	17	2026-04-25 10:25:09	2026-04-25 10:25:09
2819	Saia Longa Prata (Zoe Kids)	21	16	18	1	19.31	31	2026-04-25 10:25:09	2026-04-25 10:25:09
2820	Camisa Básico(a) Turquesa (Riachuelo Kids)	4	7	15	4	63.63	29	2026-04-25 10:25:09	2026-04-25 10:25:09
2821	Calcinha Animal Print Turquesa (Hering Kids)	3	6	15	1	110.23	15	2026-04-25 10:25:09	2026-04-25 10:25:09
2822	Camisa Durável Amarelo(a) (Bendita Cute)	10	7	7	5	112.02	3	2026-04-25 10:25:09	2026-04-25 10:25:09
2823	Camiseta Saja Rosa (Marisol)	26	8	2	19	107.29	21	2026-04-25 10:25:09	2026-04-25 10:25:09
2824	Vestido Estampado(a) Vermelho(a) (Riachuelo Kids)	13	21	6	15	107.55	29	2026-04-25 10:25:09	2026-04-25 10:25:09
2825	Camiseta Fit Preto(a) (Carters)	14	8	3	3	106.18	8	2026-04-25 10:25:09	2026-04-25 10:25:09
2826	Sunga Respirável Azul Escuro(a) (Zoe Kids)	25	18	9	14	102.54	31	2026-04-25 10:25:09	2026-04-25 10:25:09
2827	Vestido Floral Vermelho(a) (Colcci Kids)	15	21	6	7	53.98	9	2026-04-25 10:25:09	2026-04-25 10:25:09
2828	Casaco Labubu Turquesa (C&A Baby)	18	9	15	2	64.14	6	2026-04-25 10:25:09	2026-04-25 10:25:09
2829	Casaco Fit Marrom (Maria Filó Kids)	14	9	13	10	35.25	20	2026-04-25 10:25:09	2026-04-25 10:25:09
2830	Calça Moleton Rosa (Disney Baby)	23	5	2	15	113.08	12	2026-04-25 10:25:09	2026-04-25 10:25:09
2831	Calcinha Toy Store Dourado(a) (Puket Kids)	30	6	17	15	115.77	27	2026-04-25 10:25:09	2026-04-25 10:25:09
2832	Biquine Poliéster Laranja (Bendita Cute)	24	2	11	1	82.23	3	2026-04-25 10:25:09	2026-04-25 10:25:09
2833	Vestido Fit Rosa (Colcci Kids)	14	21	2	8	113.58	9	2026-04-25 10:25:09	2026-04-25 10:25:09
2834	Maiô Leve Cinza (Colcci Kids)	19	13	8	6	30.07	9	2026-04-25 10:25:09	2026-04-25 10:25:09
2835	Top Ajustável Marrom (Boboi)	1	20	13	13	63.96	4	2026-04-25 10:25:09	2026-04-25 10:25:09
2836	Cueca Moleton Bege (Carters)	23	10	14	9	115.74	8	2026-04-25 10:25:09	2026-04-25 10:25:09
2837	Sutiã Floral Vinho (Kily)	15	19	19	9	34.45	17	2026-04-25 10:25:09	2026-04-25 10:25:09
2838	Short Clássico(a) Amarelo(a) (Brandille)	6	17	7	19	113.02	5	2026-04-25 10:25:09	2026-04-25 10:25:09
2839	Calça Temático(a) Turquesa (Lilica Ripilica)	29	5	15	15	38.39	19	2026-04-25 10:25:09	2026-04-25 10:25:09
2840	Vestido Formal Lilás (Akazys)	16	21	16	19	49.90	2	2026-04-25 10:25:09	2026-04-25 10:25:09
2841	Short Temático(a) Preto(a) (Kily)	29	17	3	1	24.59	17	2026-04-25 10:25:09	2026-04-25 10:25:09
2842	Jaqueta Saja Bege (Kily)	26	11	14	12	40.41	17	2026-04-25 10:25:09	2026-04-25 10:25:09
2843	Calça Estampado(a) Azul Escuro(a) (Zoe Kids)	13	5	9	7	85.79	31	2026-04-25 10:25:09	2026-04-25 10:25:09
2844	Maiô Estampado(a) Rosa Choque (Conjunto Infantil)	13	13	10	2	101.11	10	2026-04-25 10:25:09	2026-04-25 10:25:09
2845	Camisa Fit Bege (Hering Kids)	14	7	14	6	72.21	15	2026-04-25 10:25:09	2026-04-25 10:25:09
2846	Calcinha Básico(a) Rosa (Petit Royal)	4	6	2	6	57.03	25	2026-04-25 10:25:09	2026-04-25 10:25:09
2847	Short Esportivo(a) Preto(a) (Lacoste Kids)	12	17	3	2	100.11	18	2026-04-25 10:25:09	2026-04-25 10:25:09
2848	Sutiã Animal Print Turquesa (C&A Kids)	3	19	15	16	60.57	7	2026-04-25 10:25:09	2026-04-25 10:25:09
2849	Saia Respirável Roxo(a) (Petit Royal)	25	16	12	5	60.32	25	2026-04-25 10:25:09	2026-04-25 10:25:09
2850	Vestido Colorido(a) Azul Escuro(a) (Lilica Ripilica)	7	21	9	9	112.28	19	2026-04-25 10:25:09	2026-04-25 10:25:09
2851	Sutiã Saja Lilás (Disney Baby)	26	19	16	13	59.10	12	2026-04-25 10:25:09	2026-04-25 10:25:09
2852	Casaco Animal Print Dourado(a) (Lacoste Kids)	3	9	17	18	35.46	18	2026-04-25 10:25:09	2026-04-25 10:25:09
2853	Saia Moleton Turquesa (Adidas Kids)	23	16	15	13	60.43	1	2026-04-25 10:25:09	2026-04-25 10:25:09
2854	Sunga Toy Store Vermelho(a) (Marisol)	30	18	6	16	80.95	21	2026-04-25 10:25:09	2026-04-25 10:25:09
2855	Jaqueta Confortável Dourado(a) (Dafiti Kids)	8	11	17	15	106.24	11	2026-04-25 10:25:09	2026-04-25 10:25:09
2856	Bermuda Fit Rosa (Maria Filó Kids)	14	1	2	12	18.90	20	2026-04-25 10:25:09	2026-04-25 10:25:09
2857	Meia Poliéster Branco(a) (Petit Royal)	24	14	4	14	25.09	25	2026-04-25 10:25:09	2026-04-25 10:25:09
2858	Meia Animal Print Vermelho(a) (Riachuelo Kids)	3	14	6	11	10.77	29	2026-04-25 10:25:09	2026-04-25 10:25:09
2859	Camisa Fit Laranja (Renner Kids)	14	7	11	17	109.82	28	2026-04-25 10:25:09	2026-04-25 10:25:09
2860	Saia Curto(a) Rosa Choque (Akazys)	9	16	10	3	68.67	2	2026-04-25 10:25:09	2026-04-25 10:25:09
2861	Jaqueta Leve Rosa Choque (Lilica Ripilica)	19	11	10	1	84.45	19	2026-04-25 10:25:09	2026-04-25 10:25:09
2862	Vestido Fit Azul Escuro(a) (Lilica Ripilica)	14	21	9	19	61.64	19	2026-04-25 10:25:09	2026-04-25 10:25:09
2863	Cueca Estampado(a) Cáqui (C&A Kids)	13	10	20	12	22.02	7	2026-04-25 10:25:09	2026-04-25 10:25:09
2864	Calça Fit Marrom (Puket Kids)	14	5	13	3	35.82	27	2026-04-25 10:25:09	2026-04-25 10:25:09
2865	Camiseta Temático(a) Vermelho(a) (C&A Kids)	29	8	6	18	61.77	7	2026-04-25 10:25:09	2026-04-25 10:25:09
2866	Saia Jeans Branco(a) (Akazys)	17	16	4	5	90.73	2	2026-04-25 10:25:09	2026-04-25 10:25:09
2867	Vestido Curto(a) Dourado(a) (Petit Royal)	9	21	17	16	21.25	25	2026-04-25 10:25:09	2026-04-25 10:25:09
2868	Camisa Algodão Preto(a) (Adidas Kids)	2	7	3	7	31.36	1	2026-04-25 10:25:09	2026-04-25 10:25:09
2869	Camisa Curto(a) Branco(a) (Osklen Kids)	9	7	4	18	91.62	24	2026-04-25 10:25:09	2026-04-25 10:25:09
2870	Blusa Poliéster Vermelho(a) (Zoe Kids)	24	3	6	19	41.81	31	2026-04-25 10:25:09	2026-04-25 10:25:09
2871	Vestido Respirável Amarelo(a) (Puket Kids)	25	21	7	6	113.08	27	2026-04-25 10:25:09	2026-04-25 10:25:09
2872	Vestido Esportivo(a) Rosa (Mundo Infantil)	12	21	2	1	119.00	22	2026-04-25 10:25:09	2026-04-25 10:25:09
2873	Calcinha Loney Tunes Verde (Colcci Kids)	22	6	5	19	111.05	9	2026-04-25 10:25:09	2026-04-25 10:25:09
2874	Calcinha Animal Print Vermelho(a) (C&A Kids)	3	6	6	2	105.79	7	2026-04-25 10:25:09	2026-04-25 10:25:09
2875	Vestido Algodão Verde (Zoe Kids)	2	21	5	1	94.39	31	2026-04-25 10:25:09	2026-04-25 10:25:09
2876	Vestido Fit Rosa Choque (Carters)	14	21	10	14	19.84	8	2026-04-25 10:25:09	2026-04-25 10:25:09
2877	Macacão Animal Print Bege (Conjunto Infantil)	3	12	14	16	70.61	10	2026-04-25 10:25:09	2026-04-25 10:25:09
2878	Saia Poliéster Amarelo(a) (Petit Royal)	24	16	7	12	87.95	25	2026-04-25 10:25:09	2026-04-25 10:25:09
2879	Saia Toy Store Verde (Lilica Ripilica)	30	16	5	4	112.96	19	2026-04-25 10:25:09	2026-04-25 10:25:09
2880	Biquine Curto(a) Turquesa (Lacoste Kids)	9	2	15	5	56.84	18	2026-04-25 10:25:09	2026-04-25 10:25:09
2881	Jaqueta Seda Rosa Choque (Hering Kids)	27	11	10	8	85.81	15	2026-04-25 10:25:09	2026-04-25 10:25:09
2882	Jaqueta Labubu Lilás (Mundo Pet)	18	11	16	18	50.73	23	2026-04-25 10:25:09	2026-04-25 10:25:09
2883	Sutiã Poliéster Amarelo(a) (C&A Baby)	24	19	7	5	86.29	6	2026-04-25 10:25:09	2026-04-25 10:25:09
2884	Camisa Floral Bege (Salsa Jeans Kids)	15	7	14	7	10.54	30	2026-04-25 10:25:09	2026-04-25 10:25:09
2885	Maiô Seda Prata (Riachuelo Kids)	27	13	18	3	17.81	29	2026-04-25 10:25:09	2026-04-25 10:25:09
2886	Meia Xadrez Turquesa (Osklen Kids)	32	14	15	13	68.62	24	2026-04-25 10:25:09	2026-04-25 10:25:09
2887	Calça Saja Cinza (Carters)	26	5	8	4	109.52	8	2026-04-25 10:25:09	2026-04-25 10:25:09
2888	Calcinha Confortável Vinho (Adidas Kids)	8	6	19	5	64.66	1	2026-04-25 10:25:09	2026-04-25 10:25:09
2889	Cueca Estampado(a) Lilás (Salsa Jeans Kids)	13	10	16	18	36.74	30	2026-04-25 10:25:09	2026-04-25 10:25:09
2890	Calcinha Respirável Roxo(a) (Brandille)	25	6	12	15	67.76	5	2026-04-25 10:25:09	2026-04-25 10:25:09
2891	Meia Turma da Mônica Marrom (C&A Kids)	31	14	13	9	63.71	7	2026-04-25 10:25:09	2026-04-25 10:25:09
2892	Top Turma da Mônica Bege (Disney Baby)	31	20	14	19	27.29	12	2026-04-25 10:25:09	2026-04-25 10:25:09
2893	Camisa Labubu Laranja (Lilica Ripilica)	18	7	11	13	25.72	19	2026-04-25 10:25:09	2026-04-25 10:25:09
2894	Vestido Elástico(a) Cinza (Colcci Kids)	11	21	8	9	29.85	9	2026-04-25 10:25:09	2026-04-25 10:25:09
2895	Casaco Longa Lilás (Mundo Infantil)	21	9	16	3	38.79	22	2026-04-25 10:25:09	2026-04-25 10:25:09
2896	Pijama Formal Azul Escuro(a) (Lacoste Kids)	16	15	9	12	27.94	18	2026-04-25 10:25:09	2026-04-25 10:25:09
2897	Short Fit Rosa (Osklen Kids)	14	17	2	8	68.01	24	2026-04-25 10:25:09	2026-04-25 10:25:09
2898	Jaqueta Ajustável Rosa Choque (Conjunto Infantil)	1	11	10	15	72.80	10	2026-04-25 10:25:09	2026-04-25 10:25:09
2899	Sutiã Floral Cinza (Boboi)	15	19	8	19	56.48	4	2026-04-25 10:25:09	2026-04-25 10:25:09
2900	Camisa Stitch Cáqui (Ki Carinho)	28	7	20	2	72.60	16	2026-04-25 10:25:09	2026-04-25 10:25:09
2901	Camiseta Leve Branco(a) (Dafiti Kids)	19	8	4	14	107.99	11	2026-04-25 10:25:09	2026-04-25 10:25:09
2902	Calçado Básico(a) Verde (Petit Royal)	4	4	5	8	116.33	25	2026-04-25 10:25:09	2026-04-25 10:25:09
2903	Calcinha Ajustável Rosa (Zoe Kids)	1	6	2	9	28.59	31	2026-04-25 10:25:09	2026-04-25 10:25:09
2904	Calcinha Saja Azul Escuro(a) (Osklen Kids)	26	6	9	19	73.70	24	2026-04-25 10:25:09	2026-04-25 10:25:09
2905	Camiseta Ajustável Marrom (Riachuelo Kids)	1	8	13	13	19.82	29	2026-04-25 10:25:09	2026-04-25 10:25:09
2906	Jaqueta Jeans Amarelo(a) (Petit Royal)	17	11	7	8	55.69	25	2026-04-25 10:25:09	2026-04-25 10:25:09
2907	Biquine Respirável Azul (Bendita Cute)	25	2	1	6	110.37	3	2026-04-25 10:25:09	2026-04-25 10:25:09
2908	Vestido Curto(a) Verde (Osklen Kids)	9	21	5	1	39.40	24	2026-04-25 10:25:09	2026-04-25 10:25:09
2909	Maiô Curto(a) Bege (Mundo Pet)	9	13	14	8	34.38	23	2026-04-25 10:25:09	2026-04-25 10:25:09
2910	Camisa Fit Rosa Choque (Ki Carinho)	14	7	10	8	28.19	16	2026-04-25 10:25:09	2026-04-25 10:25:09
2911	Cueca Elástico(a) Lilás (Renner Kids)	11	10	16	16	10.57	28	2026-04-25 10:25:09	2026-04-25 10:25:09
2912	Macacão Ajustável Azul Escuro(a) (Mundo Pet)	1	12	9	2	51.13	23	2026-04-25 10:25:09	2026-04-25 10:25:09
2913	Meia Floral Rosa Choque (Maria Filó Kids)	15	14	10	11	83.28	20	2026-04-25 10:25:09	2026-04-25 10:25:09
2914	Short Turma da Mônica Marrom (Mundo Infantil)	31	17	13	13	96.06	22	2026-04-25 10:25:09	2026-04-25 10:25:09
2915	Calcinha Formal Verde (Lacoste Kids)	16	6	5	16	53.67	18	2026-04-25 10:25:09	2026-04-25 10:25:09
2916	Camiseta Stitch Prata (Renner Kids)	28	8	18	2	96.67	28	2026-04-25 10:25:09	2026-04-25 10:25:09
2917	Camiseta Formal Rosa Choque (Zoe Kids)	16	8	10	19	14.79	31	2026-04-25 10:25:09	2026-04-25 10:25:09
2918	Blusa Casual Rosa Choque (Mundo Infantil)	5	3	10	12	93.52	22	2026-04-25 10:25:09	2026-04-25 10:25:09
2919	Calcinha Saja Prata (Mundo Pet)	26	6	18	2	57.63	23	2026-04-25 10:25:09	2026-04-25 10:25:09
2920	Sutiã Algodão Azul (Carters)	2	19	1	11	45.26	8	2026-04-25 10:25:09	2026-04-25 10:25:09
2921	Camisa Ajustável Branco(a) (C&A Kids)	1	7	4	18	64.46	7	2026-04-25 10:25:09	2026-04-25 10:25:09
2922	Biquine Ajustável Amarelo(a) (Lilica Ripilica)	1	2	7	4	14.25	19	2026-04-25 10:25:09	2026-04-25 10:25:09
2923	Calçado Ajustável Turquesa (Renner Kids)	1	4	15	9	102.38	28	2026-04-25 10:25:09	2026-04-25 10:25:09
2924	Camisa Formal Bege (Farm Kids)	16	7	14	11	108.12	14	2026-04-25 10:25:09	2026-04-25 10:25:09
2925	Camisa Temático(a) Lilás (C&A Kids)	29	7	16	1	87.59	7	2026-04-25 10:25:09	2026-04-25 10:25:09
2926	Jaqueta Stitch Marrom (Conjunto Infantil)	28	11	13	4	80.65	10	2026-04-25 10:25:09	2026-04-25 10:25:09
2927	Meia Confortável Vinho (C&A Kids)	8	14	19	13	35.60	7	2026-04-25 10:25:09	2026-04-25 10:25:09
2928	Macacão Stitch Dourado(a) (Salsa Jeans Kids)	28	12	17	4	94.23	30	2026-04-25 10:25:09	2026-04-25 10:25:09
2929	Short Durável Dourado(a) (Pimpolho)	10	17	17	3	56.93	26	2026-04-25 10:25:09	2026-04-25 10:25:09
2930	Cueca Saja Rosa Choque (Kily)	26	10	10	15	63.39	17	2026-04-25 10:25:09	2026-04-25 10:25:09
2931	Maiô Saja Vermelho(a) (Dafiti Kids)	26	13	6	2	80.87	11	2026-04-25 10:25:09	2026-04-25 10:25:09
2932	Bermuda Jeans Branco(a) (Boboi)	17	1	4	19	12.48	4	2026-04-25 10:25:09	2026-04-25 10:25:09
2933	Blusa Clássico(a) Laranja (Carters)	6	3	11	19	89.98	8	2026-04-25 10:25:09	2026-04-25 10:25:09
2934	Saia Loney Tunes Branco(a) (Dafiti Kids)	22	16	4	15	108.90	11	2026-04-25 10:25:09	2026-04-25 10:25:09
2935	Camisa Stitch Prata (Riachuelo Kids)	28	7	18	14	77.46	29	2026-04-25 10:25:09	2026-04-25 10:25:09
2936	Meia Clássico(a) Cáqui (Osklen Kids)	6	14	20	10	98.90	24	2026-04-25 10:25:09	2026-04-25 10:25:09
2937	Sutiã Toy Store Azul (Colcci Kids)	30	19	1	15	57.85	9	2026-04-25 10:25:09	2026-04-25 10:25:09
2938	Camiseta Saja Marrom (Bendita Cute)	26	8	13	18	65.27	3	2026-04-25 10:25:09	2026-04-25 10:25:09
2939	Macacão Animal Print Vermelho(a) (Adidas Kids)	3	12	6	17	93.27	1	2026-04-25 10:25:09	2026-04-25 10:25:09
2940	Camisa Saja Cáqui (Marisol)	26	7	20	14	67.08	21	2026-04-25 10:25:09	2026-04-25 10:25:09
2941	Camisa Moleton Azul (Mundo Infantil)	23	7	1	9	48.66	22	2026-04-25 10:25:09	2026-04-25 10:25:09
2942	Jaqueta Clássico(a) Laranja (Adidas Kids)	6	11	11	16	115.52	1	2026-04-25 10:25:09	2026-04-25 10:25:09
2943	Meia Curto(a) Vinho (Lacoste Kids)	9	14	19	7	89.01	18	2026-04-25 10:25:09	2026-04-25 10:25:09
2944	Sunga Elástico(a) Laranja (C&A Baby)	11	18	11	2	93.03	6	2026-04-25 10:25:09	2026-04-25 10:25:09
2945	Meia Moleton Rosa Choque (Renner Kids)	23	14	10	13	51.10	28	2026-04-25 10:25:09	2026-04-25 10:25:09
2946	Jaqueta Stitch Roxo(a) (Carters)	28	11	12	14	32.69	8	2026-04-25 10:25:09	2026-04-25 10:25:09
2947	Calçado Seda Laranja (Hering Kids)	27	4	11	16	103.35	15	2026-04-25 10:25:09	2026-04-25 10:25:09
2948	Cueca Saja Rosa Choque (Lilica Ripilica)	26	10	10	16	14.38	19	2026-04-25 10:25:09	2026-04-25 10:25:09
2949	Meia Algodão Cinza (Osklen Kids)	2	14	8	2	39.56	24	2026-04-25 10:25:09	2026-04-25 10:25:09
2950	Jaqueta Fit Lilás (Hering Kids)	14	11	16	5	44.53	15	2026-04-25 10:25:09	2026-04-25 10:25:09
2951	Casaco Algodão Roxo(a) (Brandille)	2	9	12	9	12.47	5	2026-04-25 10:25:09	2026-04-25 10:25:09
2952	Meia Esportivo(a) Rosa (Mundo Infantil)	12	14	2	3	31.13	22	2026-04-25 10:25:09	2026-04-25 10:25:09
2953	Calça Labubu Vermelho(a) (Kily)	18	5	6	15	65.49	17	2026-04-25 10:25:09	2026-04-25 10:25:09
2954	Saia Animal Print Cinza (C&A Kids)	3	16	8	7	100.99	7	2026-04-25 10:25:09	2026-04-25 10:25:09
2955	Macacão Longa Azul (Renner Kids)	21	12	1	14	95.44	28	2026-04-25 10:25:09	2026-04-25 10:25:09
2956	Calça Moleton Dourado(a) (Marisol)	23	5	17	3	66.36	21	2026-04-25 10:25:09	2026-04-25 10:25:09
2957	Pijama Xadrez Marrom (C&A Baby)	32	15	13	12	56.13	6	2026-04-25 10:25:09	2026-04-25 10:25:09
2958	Vestido Curto(a) Branco(a) (Lacoste Kids)	9	21	4	1	36.82	18	2026-04-25 10:25:09	2026-04-25 10:25:09
2959	Macacão Temático(a) Verde (Carters)	29	12	5	7	33.15	8	2026-04-25 10:25:09	2026-04-25 10:25:09
2960	Cueca Jeans Marrom (C&A Kids)	17	10	13	9	118.16	7	2026-04-25 10:25:09	2026-04-25 10:25:09
2961	Biquine Curto(a) Verde (Bendita Cute)	9	2	5	16	39.67	3	2026-04-25 10:25:09	2026-04-25 10:25:09
2962	Cueca Turma da Mônica Rosa (Osklen Kids)	31	10	2	15	83.37	24	2026-04-25 10:25:09	2026-04-25 10:25:09
2963	Sutiã Labubu Vermelho(a) (Salsa Jeans Kids)	18	19	6	9	18.64	30	2026-04-25 10:25:09	2026-04-25 10:25:09
2964	Vestido Turma da Mônica Prata (Riachuelo Kids)	31	21	18	18	19.42	29	2026-04-25 10:25:09	2026-04-25 10:25:09
2965	Maiô Esportivo(a) Laranja (Farm Kids)	12	13	11	17	62.73	14	2026-04-25 10:25:09	2026-04-25 10:25:09
2966	Sunga Curto(a) Cinza (Disney Kids)	9	18	8	1	94.10	13	2026-04-25 10:25:09	2026-04-25 10:25:09
2967	Short Floral Amarelo(a) (Renner Kids)	15	17	7	8	98.04	28	2026-04-25 10:25:09	2026-04-25 10:25:09
2968	Casaco Formal Turquesa (Petit Royal)	16	9	15	3	26.96	25	2026-04-25 10:25:09	2026-04-25 10:25:09
2969	Short Labubu Marrom (Farm Kids)	18	17	13	9	13.36	14	2026-04-25 10:25:09	2026-04-25 10:25:09
2970	Pijama Ajustável Azul (Adidas Kids)	1	15	1	16	12.18	1	2026-04-25 10:25:09	2026-04-25 10:25:09
2971	Jaqueta Floral Azul (Petit Royal)	15	11	1	1	76.69	25	2026-04-25 10:25:09	2026-04-25 10:25:09
2972	Saia Listrado Verde (Farm Kids)	20	16	5	9	49.92	14	2026-04-25 10:25:09	2026-04-25 10:25:09
2973	Macacão Seda Branco(a) (Bendita Cute)	27	12	4	19	113.91	3	2026-04-25 10:25:09	2026-04-25 10:25:09
2974	Calcinha Clássico(a) Prata (Lacoste Kids)	6	6	18	1	37.37	18	2026-04-25 10:25:09	2026-04-25 10:25:09
2975	Blusa Respirável Cinza (Farm Kids)	25	3	8	7	77.81	14	2026-04-25 10:25:09	2026-04-25 10:25:09
2976	Casaco Stitch Rosa (Kily)	28	9	2	5	102.41	17	2026-04-25 10:25:09	2026-04-25 10:25:09
2977	Meia Jeans Vinho (Conjunto Infantil)	17	14	19	8	83.75	10	2026-04-25 10:25:09	2026-04-25 10:25:09
2978	Macacão Seda Cinza (Zoe Kids)	27	12	8	5	27.17	31	2026-04-25 10:25:09	2026-04-25 10:25:09
2979	Short Estampado(a) Rosa (Osklen Kids)	13	17	2	2	40.59	24	2026-04-25 10:25:09	2026-04-25 10:25:09
2980	Calça Esportivo(a) Turquesa (C&A Baby)	12	5	15	14	87.03	6	2026-04-25 10:25:09	2026-04-25 10:25:09
2981	Maiô Algodão Azul (Kily)	2	13	1	8	116.81	17	2026-04-25 10:25:09	2026-04-25 10:25:09
2982	Saia Saja Cáqui (Mundo Pet)	26	16	20	5	115.95	23	2026-04-25 10:25:09	2026-04-25 10:25:09
2983	Maiô Seda Branco(a) (Riachuelo Kids)	27	13	4	19	58.86	29	2026-04-25 10:25:09	2026-04-25 10:25:09
2984	Calcinha Toy Store Cáqui (Disney Baby)	30	6	20	12	13.56	12	2026-04-25 10:25:09	2026-04-25 10:25:09
2985	Maiô Algodão Rosa (Bendita Cute)	2	13	2	10	13.36	3	2026-04-25 10:25:09	2026-04-25 10:25:09
2986	Calça Toy Store Amarelo(a) (Zoe Kids)	30	5	7	13	64.50	31	2026-04-25 10:25:09	2026-04-25 10:25:09
2987	Pijama Labubu Bege (C&A Kids)	18	15	14	16	73.00	7	2026-04-25 10:25:09	2026-04-25 10:25:09
2988	Vestido Clássico(a) Azul (Adidas Kids)	6	21	1	1	43.65	1	2026-04-25 10:25:09	2026-04-25 10:25:09
2989	Macacão Leve Roxo(a) (Dafiti Kids)	19	12	12	1	64.92	11	2026-04-25 10:25:09	2026-04-25 10:25:09
2990	Jaqueta Algodão Preto(a) (Bendita Cute)	2	11	3	12	100.59	3	2026-04-25 10:25:09	2026-04-25 10:25:09
2991	Sunga Colorido(a) Dourado(a) (Bendita Cute)	7	18	17	19	47.32	3	2026-04-25 10:25:09	2026-04-25 10:25:09
2992	Sunga Curto(a) Marrom (Disney Baby)	9	18	13	2	86.00	12	2026-04-25 10:25:09	2026-04-25 10:25:09
2993	Pijama Elástico(a) Cinza (Lilica Ripilica)	11	15	8	19	83.00	19	2026-04-25 10:25:09	2026-04-25 10:25:09
2994	Camisa Floral Cinza (Osklen Kids)	15	7	8	14	15.13	24	2026-04-25 10:25:09	2026-04-25 10:25:09
2995	Calça Ajustável Laranja (Riachuelo Kids)	1	5	11	14	26.60	29	2026-04-25 10:25:09	2026-04-25 10:25:09
2996	Sunga Colorido(a) Rosa Choque (Marisol)	7	18	10	11	31.36	21	2026-04-25 10:25:09	2026-04-25 10:25:09
2997	Cueca Básico(a) Branco(a) (Hering Kids)	4	10	4	12	50.79	15	2026-04-25 10:25:09	2026-04-25 10:25:09
2998	Bermuda Listrado Cáqui (Akazys)	20	1	20	7	103.15	2	2026-04-25 10:25:09	2026-04-25 10:25:09
2999	Meia Saja Vinho (Riachuelo Kids)	26	14	19	4	53.02	29	2026-04-25 10:25:09	2026-04-25 10:25:09
3000	Cueca Labubu Lilás (Colcci Kids)	18	10	16	9	92.80	9	2026-04-25 10:25:09	2026-04-25 10:25:09
3001	Top Stitch Branco(a) (C&A Baby)	28	20	4	6	46.10	6	2026-04-25 10:25:09	2026-04-25 10:25:09
3002	Meia Casual Laranja (Adidas Kids)	5	14	11	16	41.25	1	2026-04-25 10:25:09	2026-04-25 10:25:09
3003	Calçado Elástico(a) Laranja (Mundo Infantil)	11	4	11	10	16.24	22	2026-04-25 10:25:09	2026-04-25 10:25:09
3004	Calcinha Elástico(a) Dourado(a) (Lacoste Kids)	11	6	17	8	113.15	18	2026-04-25 10:25:09	2026-04-25 10:25:09
3005	Calça Clássico(a) Cinza (Lacoste Kids)	6	5	8	7	49.25	18	2026-04-25 10:25:09	2026-04-25 10:25:09
3006	Sutiã Stitch Marrom (Marisol)	28	19	13	18	58.53	21	2026-04-25 10:25:09	2026-04-25 10:25:09
3007	Biquine Curto(a) Roxo(a) (Maria Filó Kids)	9	2	12	17	118.03	20	2026-04-25 10:25:09	2026-04-25 10:25:09
3008	Top Durável Prata (C&A Baby)	10	20	18	14	27.58	6	2026-04-25 10:25:09	2026-04-25 10:25:09
3009	Pijama Temático(a) Prata (Lilica Ripilica)	29	15	18	7	44.18	19	2026-04-25 10:25:09	2026-04-25 10:25:09
3010	Maiô Colorido(a) Branco(a) (C&A Baby)	7	13	4	16	32.82	6	2026-04-25 10:25:09	2026-04-25 10:25:09
3011	Maiô Jeans Vinho (Zoe Kids)	17	13	19	19	54.43	31	2026-04-25 10:25:09	2026-04-25 10:25:09
3012	Calçado Saja Laranja (Ki Carinho)	26	4	11	12	77.42	16	2026-04-25 10:25:09	2026-04-25 10:25:09
3013	Vestido Listrado Turquesa (Kily)	20	21	15	8	39.91	17	2026-04-25 10:25:09	2026-04-25 10:25:09
3014	Casaco Durável Marrom (Riachuelo Kids)	10	9	13	18	37.21	29	2026-04-25 10:25:09	2026-04-25 10:25:09
3015	Blusa Xadrez Roxo(a) (Pimpolho)	32	3	12	1	10.97	26	2026-04-25 10:25:09	2026-04-25 10:25:09
3016	Short Poliéster Azul Escuro(a) (Pimpolho)	24	17	9	15	116.84	26	2026-04-25 10:25:09	2026-04-25 10:25:09
3017	Camisa Clássico(a) Roxo(a) (Kily)	6	7	12	10	22.59	17	2026-04-25 10:25:09	2026-04-25 10:25:09
3018	Biquine Saja Verde (Renner Kids)	26	2	5	1	32.07	28	2026-04-25 10:25:09	2026-04-25 10:25:09
3019	Blusa Listrado Rosa Choque (Mundo Infantil)	20	3	10	18	88.15	22	2026-04-25 10:25:09	2026-04-25 10:25:09
3020	Vestido Durável Azul Escuro(a) (Disney Kids)	10	21	9	12	74.22	13	2026-04-25 10:25:09	2026-04-25 10:25:09
3021	Calçado Casual Roxo(a) (Hering Kids)	5	4	12	16	68.28	15	2026-04-25 10:25:09	2026-04-25 10:25:09
3022	Sutiã Formal Branco(a) (Lacoste Kids)	16	19	4	3	29.35	18	2026-04-25 10:25:09	2026-04-25 10:25:09
3023	Camisa Respirável Vermelho(a) (Riachuelo Kids)	25	7	6	18	30.99	29	2026-04-25 10:25:09	2026-04-25 10:25:09
3024	Sutiã Stitch Dourado(a) (Pimpolho)	28	19	17	8	70.89	26	2026-04-25 10:25:09	2026-04-25 10:25:09
3025	Jaqueta Esportivo(a) Branco(a) (Conjunto Infantil)	12	11	4	13	30.49	10	2026-04-25 10:25:09	2026-04-25 10:25:09
3026	Sutiã Listrado Cáqui (Riachuelo Kids)	20	19	20	19	32.40	29	2026-04-25 10:25:09	2026-04-25 10:25:09
3027	Blusa Básico(a) Amarelo(a) (C&A Baby)	4	3	7	19	14.83	6	2026-04-25 10:25:09	2026-04-25 10:25:09
3028	Casaco Durável Rosa Choque (Hering Kids)	10	9	10	9	42.42	15	2026-04-25 10:25:09	2026-04-25 10:25:09
3029	Calçado Jeans Marrom (Kily)	17	4	13	15	109.79	17	2026-04-25 10:25:09	2026-04-25 10:25:09
3030	Blusa Colorido(a) Azul Escuro(a) (C&A Baby)	7	3	9	19	72.24	6	2026-04-25 10:25:09	2026-04-25 10:25:09
3031	Biquine Labubu Rosa (Disney Kids)	18	2	2	11	119.00	13	2026-04-25 10:25:09	2026-04-25 10:25:09
3203	Maiô Jeans Azul (Boboi)	17	13	1	3	14.99	4	2026-04-25 10:25:09	2026-04-25 10:25:09
3032	Camiseta Formal Rosa Choque (Boboi)	16	8	10	19	11.50	4	2026-04-25 10:25:09	2026-04-25 10:25:09
3033	Calcinha Ajustável Rosa Choque (Lacoste Kids)	1	6	10	7	23.50	18	2026-04-25 10:25:09	2026-04-25 10:25:09
3034	Pijama Ajustável Prata (Kily)	1	15	18	9	79.16	17	2026-04-25 10:25:09	2026-04-25 10:25:09
3035	Casaco Confortável Azul Escuro(a) (Colcci Kids)	8	9	9	2	96.66	9	2026-04-25 10:25:09	2026-04-25 10:25:09
3036	Calça Curto(a) Rosa Choque (Colcci Kids)	9	5	10	19	97.06	9	2026-04-25 10:25:09	2026-04-25 10:25:09
3037	Cueca Leve Preto(a) (Dafiti Kids)	19	10	3	16	14.61	11	2026-04-25 10:25:09	2026-04-25 10:25:09
3038	Vestido Colorido(a) Vermelho(a) (Marisol)	7	21	6	7	36.65	21	2026-04-25 10:25:09	2026-04-25 10:25:09
3039	Sutiã Confortável Lilás (Riachuelo Kids)	8	19	16	1	84.61	29	2026-04-25 10:25:09	2026-04-25 10:25:09
3040	Macacão Clássico(a) Prata (Farm Kids)	6	12	18	15	38.20	14	2026-04-25 10:25:09	2026-04-25 10:25:09
3041	Calça Estampado(a) Amarelo(a) (Mundo Pet)	13	5	7	2	18.14	23	2026-04-25 10:25:09	2026-04-25 10:25:09
3042	Maiô Labubu Turquesa (Mundo Infantil)	18	13	15	1	95.87	22	2026-04-25 10:25:09	2026-04-25 10:25:09
3043	Blusa Labubu Amarelo(a) (Lacoste Kids)	18	3	7	9	11.48	18	2026-04-25 10:25:09	2026-04-25 10:25:09
3044	Blusa Poliéster Vermelho(a) (C&A Baby)	24	3	6	9	38.25	6	2026-04-25 10:25:09	2026-04-25 10:25:09
3045	Top Floral Cáqui (Osklen Kids)	15	20	20	2	12.29	24	2026-04-25 10:25:09	2026-04-25 10:25:09
3046	Macacão Turma da Mônica Laranja (Salsa Jeans Kids)	31	12	11	1	73.70	30	2026-04-25 10:25:09	2026-04-25 10:25:09
3047	Sutiã Respirável Branco(a) (C&A Kids)	25	19	4	3	107.92	7	2026-04-25 10:25:09	2026-04-25 10:25:09
3048	Calça Animal Print Marrom (Osklen Kids)	3	5	13	6	99.05	24	2026-04-25 10:25:09	2026-04-25 10:25:09
3049	Cueca Algodão Lilás (Akazys)	2	10	16	11	12.73	2	2026-04-25 10:25:09	2026-04-25 10:25:09
3050	Casaco Stitch Rosa Choque (Dafiti Kids)	28	9	10	10	103.89	11	2026-04-25 10:25:09	2026-04-25 10:25:09
3051	Saia Stitch Vinho (Kily)	28	16	19	6	11.14	17	2026-04-25 10:25:09	2026-04-25 10:25:09
3052	Sunga Seda Bege (Boboi)	27	18	14	10	64.66	4	2026-04-25 10:25:09	2026-04-25 10:25:09
3053	Calça Fit Amarelo(a) (Maria Filó Kids)	14	5	7	11	34.12	20	2026-04-25 10:25:09	2026-04-25 10:25:09
3054	Biquine Loney Tunes Marrom (Kily)	22	2	13	1	118.25	17	2026-04-25 10:25:09	2026-04-25 10:25:09
3055	Sunga Poliéster Cáqui (Pimpolho)	24	18	20	10	65.25	26	2026-04-25 10:25:09	2026-04-25 10:25:09
3056	Calcinha Leve Cáqui (Puket Kids)	19	6	20	8	80.03	27	2026-04-25 10:25:09	2026-04-25 10:25:09
3057	Casaco Leve Vermelho(a) (Bendita Cute)	19	9	6	3	84.55	3	2026-04-25 10:25:09	2026-04-25 10:25:09
3058	Biquine Loney Tunes Vermelho(a) (Zoe Kids)	22	2	6	17	59.83	31	2026-04-25 10:25:09	2026-04-25 10:25:09
3059	Pijama Leve Lilás (Renner Kids)	19	15	16	19	52.21	28	2026-04-25 10:25:09	2026-04-25 10:25:09
3060	Sutiã Floral Dourado(a) (Maria Filó Kids)	15	19	17	6	32.64	20	2026-04-25 10:25:09	2026-04-25 10:25:09
3061	Calça Formal Dourado(a) (Salsa Jeans Kids)	16	5	17	2	91.47	30	2026-04-25 10:25:09	2026-04-25 10:25:09
3062	Camisa Turma da Mônica Bege (Carters)	31	7	14	11	53.05	8	2026-04-25 10:25:09	2026-04-25 10:25:09
3063	Saia Toy Store Prata (Petit Royal)	30	16	18	7	20.90	25	2026-04-25 10:25:09	2026-04-25 10:25:09
3064	Vestido Listrado Rosa (Riachuelo Kids)	20	21	2	2	31.49	29	2026-04-25 10:25:09	2026-04-25 10:25:09
3065	Calcinha Jeans Dourado(a) (C&A Kids)	17	6	17	16	96.65	7	2026-04-25 10:25:09	2026-04-25 10:25:09
3066	Jaqueta Confortável Bege (Pimpolho)	8	11	14	5	28.12	26	2026-04-25 10:25:09	2026-04-25 10:25:09
3067	Top Toy Store Rosa Choque (Lilica Ripilica)	30	20	10	12	108.69	19	2026-04-25 10:25:09	2026-04-25 10:25:09
3068	Short Labubu Lilás (Boboi)	18	17	16	8	83.18	4	2026-04-25 10:25:09	2026-04-25 10:25:09
3069	Sutiã Animal Print Preto(a) (C&A Baby)	3	19	3	3	53.82	6	2026-04-25 10:25:09	2026-04-25 10:25:09
3070	Bermuda Respirável Laranja (Zoe Kids)	25	1	11	11	18.61	31	2026-04-25 10:25:09	2026-04-25 10:25:09
3071	Sutiã Stitch Roxo(a) (Kily)	28	19	12	12	86.57	17	2026-04-25 10:25:09	2026-04-25 10:25:09
3072	Camisa Algodão Prata (Farm Kids)	2	7	18	12	100.90	14	2026-04-25 10:25:09	2026-04-25 10:25:09
3073	Blusa Leve Bege (Renner Kids)	19	3	14	9	75.19	28	2026-04-25 10:25:09	2026-04-25 10:25:09
3074	Cueca Listrado Verde (Colcci Kids)	20	10	5	1	49.19	9	2026-04-25 10:25:09	2026-04-25 10:25:09
3075	Camisa Listrado Cinza (Puket Kids)	20	7	8	6	26.86	27	2026-04-25 10:25:09	2026-04-25 10:25:09
3076	Maiô Floral Prata (Akazys)	15	13	18	2	12.46	2	2026-04-25 10:25:09	2026-04-25 10:25:09
3077	Pijama Elástico(a) Cinza (Renner Kids)	11	15	8	18	84.24	28	2026-04-25 10:25:09	2026-04-25 10:25:09
3078	Casaco Confortável Laranja (Renner Kids)	8	9	11	16	119.04	28	2026-04-25 10:25:09	2026-04-25 10:25:09
3079	Macacão Curto(a) Roxo(a) (C&A Baby)	9	12	12	17	93.05	6	2026-04-25 10:25:09	2026-04-25 10:25:09
3080	Sunga Respirável Cinza (C&A Baby)	25	18	8	5	67.90	6	2026-04-25 10:25:09	2026-04-25 10:25:09
3081	Calcinha Labubu Bege (Lacoste Kids)	18	6	14	4	36.64	18	2026-04-25 10:25:09	2026-04-25 10:25:09
3082	Macacão Esportivo(a) Dourado(a) (Pimpolho)	12	12	17	10	83.32	26	2026-04-25 10:25:09	2026-04-25 10:25:09
3083	Calça Algodão Preto(a) (Hering Kids)	2	5	3	9	93.29	15	2026-04-25 10:25:09	2026-04-25 10:25:09
3084	Meia Toy Store Vermelho(a) (Pimpolho)	30	14	6	6	14.35	26	2026-04-25 10:25:09	2026-04-25 10:25:09
3085	Maiô Formal Cinza (Conjunto Infantil)	16	13	8	5	11.22	10	2026-04-25 10:25:09	2026-04-25 10:25:09
3086	Camisa Longa Rosa (Mundo Infantil)	21	7	2	3	57.64	22	2026-04-25 10:25:09	2026-04-25 10:25:09
3087	Short Clássico(a) Amarelo(a) (Maria Filó Kids)	6	17	7	13	93.26	20	2026-04-25 10:25:09	2026-04-25 10:25:09
3088	Bermuda Poliéster Vinho (Lacoste Kids)	24	1	19	8	85.74	18	2026-04-25 10:25:09	2026-04-25 10:25:09
3089	Cueca Turma da Mônica Marrom (Salsa Jeans Kids)	31	10	13	8	91.02	30	2026-04-25 10:25:09	2026-04-25 10:25:09
3090	Blusa Jeans Turquesa (Pimpolho)	17	3	15	19	119.40	26	2026-04-25 10:25:09	2026-04-25 10:25:09
3091	Casaco Respirável Vermelho(a) (Lacoste Kids)	25	9	6	12	89.52	18	2026-04-25 10:25:09	2026-04-25 10:25:09
3092	Maiô Moleton Vinho (Carters)	23	13	19	17	75.45	8	2026-04-25 10:25:09	2026-04-25 10:25:09
3093	Saia Saja Verde (Disney Kids)	26	16	5	17	25.71	13	2026-04-25 10:25:09	2026-04-25 10:25:09
3094	Blusa Formal Roxo(a) (Bendita Cute)	16	3	12	8	24.01	3	2026-04-25 10:25:09	2026-04-25 10:25:09
3095	Camisa Estampado(a) Lilás (Brandille)	13	7	16	4	71.95	5	2026-04-25 10:25:09	2026-04-25 10:25:09
3096	Casaco Longa Rosa Choque (Hering Kids)	21	9	10	2	22.85	15	2026-04-25 10:25:09	2026-04-25 10:25:09
3097	Bermuda Floral Marrom (Disney Baby)	15	1	13	14	110.35	12	2026-04-25 10:25:09	2026-04-25 10:25:09
3098	Calcinha Loney Tunes Verde (Osklen Kids)	22	6	5	11	27.22	24	2026-04-25 10:25:09	2026-04-25 10:25:09
3099	Camisa Animal Print Verde (Renner Kids)	3	7	5	2	52.22	28	2026-04-25 10:25:09	2026-04-25 10:25:09
3100	Vestido Respirável Rosa (Petit Royal)	25	21	2	18	39.68	25	2026-04-25 10:25:09	2026-04-25 10:25:09
3101	Camisa Respirável Rosa Choque (Zoe Kids)	25	7	10	9	68.07	31	2026-04-25 10:25:09	2026-04-25 10:25:09
3102	Sunga Saja Cáqui (Carters)	26	18	20	7	111.88	8	2026-04-25 10:25:09	2026-04-25 10:25:09
3103	Camiseta Ajustável Verde (C&A Kids)	1	8	5	1	21.42	7	2026-04-25 10:25:09	2026-04-25 10:25:09
3104	Top Xadrez Azul Escuro(a) (Carters)	32	20	9	2	93.67	8	2026-04-25 10:25:09	2026-04-25 10:25:09
3105	Maiô Longa Prata (Lacoste Kids)	21	13	18	15	86.49	18	2026-04-25 10:25:09	2026-04-25 10:25:09
3106	Cueca Temático(a) Amarelo(a) (Brandille)	29	10	7	10	67.54	5	2026-04-25 10:25:09	2026-04-25 10:25:09
3107	Macacão Labubu Dourado(a) (Farm Kids)	18	12	17	1	77.19	14	2026-04-25 10:25:09	2026-04-25 10:25:09
3108	Biquine Floral Prata (Disney Baby)	15	2	18	14	65.95	12	2026-04-25 10:25:09	2026-04-25 10:25:09
3109	Casaco Temático(a) Vermelho(a) (Mundo Pet)	29	9	6	17	96.70	23	2026-04-25 10:25:09	2026-04-25 10:25:09
3110	Camiseta Formal Laranja (Salsa Jeans Kids)	16	8	11	9	38.40	30	2026-04-25 10:25:09	2026-04-25 10:25:09
3111	Blusa Temático(a) Verde (Colcci Kids)	29	3	5	1	28.41	9	2026-04-25 10:25:09	2026-04-25 10:25:09
3112	Jaqueta Moleton Laranja (Petit Royal)	23	11	11	19	118.02	25	2026-04-25 10:25:09	2026-04-25 10:25:09
3113	Saia Moleton Marrom (Dafiti Kids)	23	16	13	6	95.30	11	2026-04-25 10:25:09	2026-04-25 10:25:09
3114	Sunga Elástico(a) Cáqui (Hering Kids)	11	18	20	4	41.34	15	2026-04-25 10:25:09	2026-04-25 10:25:09
3115	Sutiã Ajustável Dourado(a) (Carters)	1	19	17	7	26.54	8	2026-04-25 10:25:09	2026-04-25 10:25:09
3116	Calçado Xadrez Dourado(a) (Renner Kids)	32	4	17	15	103.36	28	2026-04-25 10:25:09	2026-04-25 10:25:09
3117	Saia Formal Bege (Disney Baby)	16	16	14	5	99.18	12	2026-04-25 10:25:09	2026-04-25 10:25:09
3118	Vestido Básico(a) Lilás (Brandille)	4	21	16	2	80.22	5	2026-04-25 10:25:09	2026-04-25 10:25:09
3119	Camisa Floral Dourado(a) (C&A Baby)	15	7	17	1	86.97	6	2026-04-25 10:25:09	2026-04-25 10:25:09
3120	Pijama Leve Vinho (Disney Kids)	19	15	19	14	71.60	13	2026-04-25 10:25:09	2026-04-25 10:25:09
3121	Cueca Longa Lilás (Conjunto Infantil)	21	10	16	4	61.95	10	2026-04-25 10:25:09	2026-04-25 10:25:09
3122	Saia Básico(a) Azul (Maria Filó Kids)	4	16	1	19	17.14	20	2026-04-25 10:25:09	2026-04-25 10:25:09
3123	Cueca Labubu Roxo(a) (Pimpolho)	18	10	12	7	46.40	26	2026-04-25 10:25:09	2026-04-25 10:25:09
3124	Top Elástico(a) Laranja (Disney Baby)	11	20	11	9	16.64	12	2026-04-25 10:25:09	2026-04-25 10:25:09
3125	Meia Turma da Mônica Marrom (C&A Kids)	31	14	13	11	10.24	7	2026-04-25 10:25:09	2026-04-25 10:25:09
3126	Blusa Toy Store Azul Escuro(a) (Salsa Jeans Kids)	30	3	9	3	32.67	30	2026-04-25 10:25:09	2026-04-25 10:25:09
3127	Top Listrado Turquesa (Osklen Kids)	20	20	15	15	57.75	24	2026-04-25 10:25:09	2026-04-25 10:25:09
3128	Camiseta Seda Turquesa (Petit Royal)	27	8	15	15	43.75	25	2026-04-25 10:25:09	2026-04-25 10:25:09
3129	Casaco Moleton Vermelho(a) (Adidas Kids)	23	9	6	4	31.35	1	2026-04-25 10:25:09	2026-04-25 10:25:09
3130	Vestido Moleton Verde (Lilica Ripilica)	23	21	5	11	32.04	19	2026-04-25 10:25:09	2026-04-25 10:25:09
3131	Top Algodão Dourado(a) (Marisol)	2	20	17	8	104.55	21	2026-04-25 10:25:09	2026-04-25 10:25:09
3132	Vestido Estampado(a) Lilás (Zoe Kids)	13	21	16	19	98.91	31	2026-04-25 10:25:09	2026-04-25 10:25:09
3133	Camiseta Fit Branco(a) (Farm Kids)	14	8	4	10	76.51	14	2026-04-25 10:25:09	2026-04-25 10:25:09
3134	Short Clássico(a) Azul Escuro(a) (Mundo Pet)	6	17	9	7	119.84	23	2026-04-25 10:25:09	2026-04-25 10:25:09
3135	Pijama Turma da Mônica Laranja (Disney Baby)	31	15	11	4	57.91	12	2026-04-25 10:25:09	2026-04-25 10:25:09
3136	Pijama Loney Tunes Prata (Akazys)	22	15	18	16	111.47	2	2026-04-25 10:25:09	2026-04-25 10:25:09
3137	Biquine Respirável Rosa Choque (Disney Kids)	25	2	10	10	113.33	13	2026-04-25 10:25:09	2026-04-25 10:25:09
3138	Calcinha Temático(a) Laranja (Disney Baby)	29	6	11	7	31.09	12	2026-04-25 10:25:09	2026-04-25 10:25:09
3139	Short Clássico(a) Vinho (C&A Baby)	6	17	19	19	116.46	6	2026-04-25 10:25:09	2026-04-25 10:25:09
3140	Top Elástico(a) Vinho (Marisol)	11	20	19	17	13.06	21	2026-04-25 10:25:09	2026-04-25 10:25:09
3141	Sutiã Poliéster Azul (Brandille)	24	19	1	8	10.72	5	2026-04-25 10:25:09	2026-04-25 10:25:09
3142	Casaco Formal Vinho (Bendita Cute)	16	9	19	6	68.51	3	2026-04-25 10:25:09	2026-04-25 10:25:09
3143	Vestido Algodão Cinza (Disney Kids)	2	21	8	18	79.98	13	2026-04-25 10:25:09	2026-04-25 10:25:09
3144	Biquine Longa Bege (Osklen Kids)	21	2	14	1	84.16	24	2026-04-25 10:25:09	2026-04-25 10:25:09
3145	Maiô Durável Amarelo(a) (Akazys)	10	13	7	13	24.15	2	2026-04-25 10:25:09	2026-04-25 10:25:09
3146	Sunga Esportivo(a) Turquesa (Disney Baby)	12	18	15	10	98.00	12	2026-04-25 10:25:09	2026-04-25 10:25:09
3147	Sutiã Jeans Vermelho(a) (Disney Kids)	17	19	6	16	40.02	13	2026-04-25 10:25:09	2026-04-25 10:25:09
3148	Meia Floral Prata (Lacoste Kids)	15	14	18	19	83.42	18	2026-04-25 10:25:09	2026-04-25 10:25:09
3149	Meia Longa Roxo(a) (Carters)	21	14	12	1	104.91	8	2026-04-25 10:25:09	2026-04-25 10:25:09
3150	Camisa Xadrez Roxo(a) (Ki Carinho)	32	7	12	19	98.02	16	2026-04-25 10:25:09	2026-04-25 10:25:09
3151	Calça Moleton Dourado(a) (Adidas Kids)	23	5	17	19	84.83	1	2026-04-25 10:25:09	2026-04-25 10:25:09
3152	Pijama Xadrez Vinho (Colcci Kids)	32	15	19	17	52.82	9	2026-04-25 10:25:09	2026-04-25 10:25:09
3153	Sunga Xadrez Rosa (Lilica Ripilica)	32	18	2	8	91.12	19	2026-04-25 10:25:09	2026-04-25 10:25:09
3154	Biquine Jeans Vinho (Hering Kids)	17	2	19	15	71.68	15	2026-04-25 10:25:09	2026-04-25 10:25:09
3155	Camisa Temático(a) Rosa Choque (Colcci Kids)	29	7	10	8	25.05	9	2026-04-25 10:25:09	2026-04-25 10:25:09
3156	Saia Respirável Amarelo(a) (Colcci Kids)	25	16	7	11	85.73	9	2026-04-25 10:25:09	2026-04-25 10:25:09
3157	Calcinha Confortável Cinza (Riachuelo Kids)	8	6	8	19	101.17	29	2026-04-25 10:25:09	2026-04-25 10:25:09
3158	Sutiã Loney Tunes Laranja (Lilica Ripilica)	22	19	11	7	18.34	19	2026-04-25 10:25:09	2026-04-25 10:25:09
3159	Top Seda Marrom (Farm Kids)	27	20	13	10	30.84	14	2026-04-25 10:25:09	2026-04-25 10:25:09
3160	Calça Seda Azul (Pimpolho)	27	5	1	8	100.32	26	2026-04-25 10:25:09	2026-04-25 10:25:09
3161	Macacão Confortável Azul (C&A Baby)	8	12	1	12	13.16	6	2026-04-25 10:25:09	2026-04-25 10:25:09
3162	Meia Estampado(a) Azul (Colcci Kids)	13	14	1	15	98.83	9	2026-04-25 10:25:09	2026-04-25 10:25:09
3163	Sutiã Fit Cáqui (Kily)	14	19	20	4	93.95	17	2026-04-25 10:25:09	2026-04-25 10:25:09
3164	Pijama Algodão Vinho (Riachuelo Kids)	2	15	19	19	40.18	29	2026-04-25 10:25:09	2026-04-25 10:25:09
3165	Calça Longa Cáqui (Petit Royal)	21	5	20	4	105.70	25	2026-04-25 10:25:09	2026-04-25 10:25:09
3166	Meia Durável Rosa Choque (Marisol)	10	14	10	12	32.58	21	2026-04-25 10:25:09	2026-04-25 10:25:09
3167	Casaco Curto(a) Rosa (Adidas Kids)	9	9	2	7	15.75	1	2026-04-25 10:25:09	2026-04-25 10:25:09
3168	Camiseta Básico(a) Cáqui (Boboi)	4	8	20	5	59.58	4	2026-04-25 10:25:09	2026-04-25 10:25:09
3169	Cueca Jeans Laranja (Adidas Kids)	17	10	11	11	19.75	1	2026-04-25 10:25:09	2026-04-25 10:25:09
3170	Cueca Floral Vinho (Lilica Ripilica)	15	10	19	12	32.56	19	2026-04-25 10:25:09	2026-04-25 10:25:09
3171	Vestido Labubu Vermelho(a) (Hering Kids)	18	21	6	7	82.13	15	2026-04-25 10:25:09	2026-04-25 10:25:09
3172	Meia Jeans Vermelho(a) (Lacoste Kids)	17	14	6	15	114.58	18	2026-04-25 10:25:09	2026-04-25 10:25:09
3173	Meia Longa Lilás (Kily)	21	14	16	13	36.87	17	2026-04-25 10:25:09	2026-04-25 10:25:09
3174	Vestido Estampado(a) Roxo(a) (Maria Filó Kids)	13	21	12	11	74.26	20	2026-04-25 10:25:09	2026-04-25 10:25:09
3175	Sunga Loney Tunes Marrom (Puket Kids)	22	18	13	9	87.33	27	2026-04-25 10:25:09	2026-04-25 10:25:09
3176	Top Clássico(a) Rosa Choque (Marisol)	6	20	10	6	50.39	21	2026-04-25 10:25:09	2026-04-25 10:25:09
3177	Pijama Turma da Mônica Preto(a) (Zoe Kids)	31	15	3	2	92.36	31	2026-04-25 10:25:09	2026-04-25 10:25:09
3178	Sutiã Durável Azul Escuro(a) (Ki Carinho)	10	19	9	6	55.61	16	2026-04-25 10:25:09	2026-04-25 10:25:09
3179	Casaco Respirável Marrom (Lacoste Kids)	25	9	13	5	22.39	18	2026-04-25 10:25:09	2026-04-25 10:25:09
3180	Biquine Estampado(a) Azul Escuro(a) (Marisol)	13	2	9	5	114.11	21	2026-04-25 10:25:09	2026-04-25 10:25:09
3181	Calçado Labubu Rosa Choque (Riachuelo Kids)	18	4	10	3	62.06	29	2026-04-25 10:25:09	2026-04-25 10:25:09
3182	Calça Longa Roxo(a) (Salsa Jeans Kids)	21	5	12	19	110.22	30	2026-04-25 10:25:09	2026-04-25 10:25:09
3183	Short Fit Dourado(a) (Disney Baby)	14	17	17	15	60.55	12	2026-04-25 10:25:09	2026-04-25 10:25:09
3184	Cueca Jeans Lilás (Disney Baby)	17	10	16	13	107.63	12	2026-04-25 10:25:09	2026-04-25 10:25:09
3185	Pijama Leve Laranja (Carters)	19	15	11	2	119.60	8	2026-04-25 10:25:09	2026-04-25 10:25:09
3186	Short Fit Cinza (Disney Kids)	14	17	8	12	60.09	13	2026-04-25 10:25:09	2026-04-25 10:25:09
3187	Bermuda Esportivo(a) Vermelho(a) (Salsa Jeans Kids)	12	1	6	3	53.91	30	2026-04-25 10:25:09	2026-04-25 10:25:09
3188	Top Confortável Cinza (Marisol)	8	20	8	2	119.35	21	2026-04-25 10:25:09	2026-04-25 10:25:09
3189	Camiseta Básico(a) Rosa (Farm Kids)	4	8	2	8	85.45	14	2026-04-25 10:25:09	2026-04-25 10:25:09
3190	Camiseta Loney Tunes Rosa (Adidas Kids)	22	8	2	4	54.18	1	2026-04-25 10:25:09	2026-04-25 10:25:09
3191	Saia Estampado(a) Vermelho(a) (Kily)	13	16	6	3	31.33	17	2026-04-25 10:25:09	2026-04-25 10:25:09
3192	Saia Moleton Branco(a) (Conjunto Infantil)	23	16	4	8	59.76	10	2026-04-25 10:25:09	2026-04-25 10:25:09
3193	Top Casual Marrom (Lacoste Kids)	5	20	13	14	90.65	18	2026-04-25 10:25:09	2026-04-25 10:25:09
3194	Top Listrado Rosa Choque (Akazys)	20	20	10	7	76.54	2	2026-04-25 10:25:09	2026-04-25 10:25:09
3195	Vestido Leve Turquesa (Kily)	19	21	15	1	76.01	17	2026-04-25 10:25:09	2026-04-25 10:25:09
3196	Jaqueta Clássico(a) Vermelho(a) (Disney Kids)	6	11	6	17	64.54	13	2026-04-25 10:25:09	2026-04-25 10:25:09
3197	Vestido Loney Tunes Preto(a) (C&A Kids)	22	21	3	18	86.71	7	2026-04-25 10:25:09	2026-04-25 10:25:09
3198	Jaqueta Poliéster Roxo(a) (Salsa Jeans Kids)	24	11	12	18	51.47	30	2026-04-25 10:25:09	2026-04-25 10:25:09
3199	Blusa Moleton Verde (Mundo Pet)	23	3	5	1	17.60	23	2026-04-25 10:25:09	2026-04-25 10:25:09
3200	Casaco Floral Bege (Colcci Kids)	15	9	14	3	75.37	9	2026-04-25 10:25:09	2026-04-25 10:25:09
3201	Meia Casual Roxo(a) (Salsa Jeans Kids)	5	14	12	14	70.68	30	2026-04-25 10:25:09	2026-04-25 10:25:09
3202	Sutiã Curto(a) Cáqui (Disney Baby)	9	19	20	11	41.69	12	2026-04-25 10:25:09	2026-04-25 10:25:09
3204	Bermuda Temático(a) Vermelho(a) (Conjunto Infantil)	29	1	6	11	66.12	10	2026-04-25 10:25:09	2026-04-25 10:25:09
3205	Biquine Moleton Amarelo(a) (C&A Baby)	23	2	7	11	72.02	6	2026-04-25 10:25:09	2026-04-25 10:25:09
3206	Saia Listrado Prata (Mundo Infantil)	20	16	18	19	101.35	22	2026-04-25 10:25:09	2026-04-25 10:25:09
3207	Sunga Jeans Cinza (Boboi)	17	18	8	9	20.08	4	2026-04-25 10:25:09	2026-04-25 10:25:09
3208	Calcinha Seda Verde (Hering Kids)	27	6	5	10	16.08	15	2026-04-25 10:25:09	2026-04-25 10:25:09
3209	Biquine Stitch Rosa Choque (Akazys)	28	2	10	4	39.74	2	2026-04-25 10:25:09	2026-04-25 10:25:09
3210	Macacão Colorido(a) Amarelo(a) (Bendita Cute)	7	12	7	13	38.66	3	2026-04-25 10:25:09	2026-04-25 10:25:09
3211	Top Clássico(a) Amarelo(a) (Akazys)	6	20	7	9	72.51	2	2026-04-25 10:25:09	2026-04-25 10:25:09
3212	Casaco Ajustável Preto(a) (Marisol)	1	9	3	4	34.36	21	2026-04-25 10:25:09	2026-04-25 10:25:09
3213	Blusa Básico(a) Cinza (Lilica Ripilica)	4	3	8	5	73.97	19	2026-04-25 10:25:09	2026-04-25 10:25:09
3214	Vestido Confortável Vinho (Salsa Jeans Kids)	8	21	19	9	91.25	30	2026-04-25 10:25:09	2026-04-25 10:25:09
3215	Maiô Seda Amarelo(a) (Disney Kids)	27	13	7	17	47.88	13	2026-04-25 10:25:09	2026-04-25 10:25:09
3216	Calçado Poliéster Turquesa (Dafiti Kids)	24	4	15	9	90.92	11	2026-04-25 10:25:09	2026-04-25 10:25:09
3217	Jaqueta Moleton Bege (Pimpolho)	23	11	14	3	53.42	26	2026-04-25 10:25:09	2026-04-25 10:25:09
3218	Calçado Colorido(a) Cinza (Boboi)	7	4	8	13	109.97	4	2026-04-25 10:25:09	2026-04-25 10:25:09
3219	Vestido Algodão Bege (Lilica Ripilica)	2	21	14	2	49.61	19	2026-04-25 10:25:09	2026-04-25 10:25:09
3220	Meia Esportivo(a) Azul (Puket Kids)	12	14	1	9	68.97	27	2026-04-25 10:25:09	2026-04-25 10:25:09
3221	Top Xadrez Branco(a) (Pimpolho)	32	20	4	2	71.13	26	2026-04-25 10:25:09	2026-04-25 10:25:09
3222	Bermuda Longa Amarelo(a) (Petit Royal)	21	1	7	12	60.81	25	2026-04-25 10:25:09	2026-04-25 10:25:09
3223	Calça Fit Dourado(a) (Lilica Ripilica)	14	5	17	2	45.46	19	2026-04-25 10:25:09	2026-04-25 10:25:09
3224	Top Toy Store Turquesa (Mundo Pet)	30	20	15	2	118.79	23	2026-04-25 10:25:09	2026-04-25 10:25:09
3225	Macacão Esportivo(a) Vermelho(a) (Kily)	12	12	6	8	88.23	17	2026-04-25 10:25:09	2026-04-25 10:25:09
3226	Meia Floral Amarelo(a) (Kily)	15	14	7	6	51.60	17	2026-04-25 10:25:09	2026-04-25 10:25:09
3227	Calça Loney Tunes Turquesa (Dafiti Kids)	22	5	15	3	119.85	11	2026-04-25 10:25:09	2026-04-25 10:25:09
3228	Meia Floral Vermelho(a) (Marisol)	15	14	6	4	64.62	21	2026-04-25 10:25:09	2026-04-25 10:25:09
3229	Maiô Clássico(a) Laranja (Akazys)	6	13	11	12	32.06	2	2026-04-25 10:25:09	2026-04-25 10:25:09
3230	Saia Turma da Mônica Lilás (Colcci Kids)	31	16	16	16	52.23	9	2026-04-25 10:25:09	2026-04-25 10:25:09
3231	Top Turma da Mônica Cáqui (C&A Kids)	31	20	20	6	58.56	7	2026-04-25 10:25:09	2026-04-25 10:25:09
3232	Vestido Jeans Azul (Salsa Jeans Kids)	17	21	1	14	56.36	30	2026-04-25 10:25:09	2026-04-25 10:25:09
3233	Meia Xadrez Turquesa (C&A Kids)	32	14	15	11	17.28	7	2026-04-25 10:25:09	2026-04-25 10:25:09
3234	Biquine Floral Preto(a) (Colcci Kids)	15	2	3	17	116.91	9	2026-04-25 10:25:09	2026-04-25 10:25:09
3235	Top Básico(a) Marrom (Colcci Kids)	4	20	13	14	50.30	9	2026-04-25 10:25:09	2026-04-25 10:25:09
3236	Saia Labubu Rosa (Marisol)	18	16	2	19	86.48	21	2026-04-25 10:25:09	2026-04-25 10:25:09
3237	Biquine Longa Vermelho(a) (Adidas Kids)	21	2	6	5	20.86	1	2026-04-25 10:25:09	2026-04-25 10:25:09
3238	Top Básico(a) Vinho (Pimpolho)	4	20	19	5	102.33	26	2026-04-25 10:25:09	2026-04-25 10:25:09
3239	Saia Longa Roxo(a) (Boboi)	21	16	12	7	96.63	4	2026-04-25 10:25:09	2026-04-25 10:25:09
3240	Camisa Leve Verde (Maria Filó Kids)	19	7	5	2	64.71	20	2026-04-25 10:25:09	2026-04-25 10:25:09
3241	Vestido Poliéster Rosa Choque (Bendita Cute)	24	21	10	3	78.84	3	2026-04-25 10:25:09	2026-04-25 10:25:09
3242	Saia Toy Store Rosa (Lilica Ripilica)	30	16	2	10	59.01	19	2026-04-25 10:25:09	2026-04-25 10:25:09
3243	Sunga Loney Tunes Vermelho(a) (Adidas Kids)	22	18	6	15	29.63	1	2026-04-25 10:25:09	2026-04-25 10:25:09
3244	Blusa Moleton Azul Escuro(a) (Bendita Cute)	23	3	9	6	45.55	3	2026-04-25 10:25:09	2026-04-25 10:25:09
3245	Sunga Saja Roxo(a) (Zoe Kids)	26	18	12	15	98.52	31	2026-04-25 10:25:09	2026-04-25 10:25:09
3246	Calçado Toy Store Dourado(a) (Bendita Cute)	30	4	17	4	11.27	3	2026-04-25 10:25:09	2026-04-25 10:25:09
3247	Blusa Clássico(a) Preto(a) (Osklen Kids)	6	3	3	12	79.28	24	2026-04-25 10:25:09	2026-04-25 10:25:09
3248	Maiô Esportivo(a) Vinho (Boboi)	12	13	19	15	11.02	4	2026-04-25 10:25:09	2026-04-25 10:25:09
3249	Bermuda Clássico(a) Rosa (Marisol)	6	1	2	15	99.93	21	2026-04-25 10:25:09	2026-04-25 10:25:09
3250	Maiô Poliéster Vinho (Petit Royal)	24	13	19	9	32.53	25	2026-04-25 10:25:09	2026-04-25 10:25:09
3251	Sunga Floral Preto(a) (Adidas Kids)	15	18	3	2	66.60	1	2026-04-25 10:25:09	2026-04-25 10:25:09
3252	Bermuda Animal Print Vermelho(a) (Kily)	3	1	6	16	98.89	17	2026-04-25 10:25:09	2026-04-25 10:25:09
3253	Vestido Stitch Preto(a) (Colcci Kids)	28	21	3	2	43.74	9	2026-04-25 10:25:09	2026-04-25 10:25:09
3254	Sunga Xadrez Roxo(a) (Adidas Kids)	32	18	12	6	119.06	1	2026-04-25 10:25:09	2026-04-25 10:25:09
3255	Cueca Ajustável Verde (Disney Kids)	1	10	5	7	53.94	13	2026-04-25 10:25:09	2026-04-25 10:25:09
3256	Casaco Seda Cinza (C&A Kids)	27	9	8	10	82.33	7	2026-04-25 10:25:09	2026-04-25 10:25:09
3257	Sutiã Moleton Prata (Brandille)	23	19	18	5	109.72	5	2026-04-25 10:25:09	2026-04-25 10:25:09
3258	Sunga Durável Azul (Brandille)	10	18	1	14	114.06	5	2026-04-25 10:25:09	2026-04-25 10:25:09
3259	Sutiã Curto(a) Lilás (Lacoste Kids)	9	19	16	5	44.22	18	2026-04-25 10:25:09	2026-04-25 10:25:09
3260	Calcinha Loney Tunes Marrom (Petit Royal)	22	6	13	19	64.00	25	2026-04-25 10:25:09	2026-04-25 10:25:09
3261	Blusa Turma da Mônica Turquesa (Brandille)	31	3	15	3	102.07	5	2026-04-25 10:25:09	2026-04-25 10:25:09
3262	Camiseta Poliéster Prata (Salsa Jeans Kids)	24	8	18	15	19.40	30	2026-04-25 10:25:09	2026-04-25 10:25:09
3263	Saia Stitch Vermelho(a) (Maria Filó Kids)	28	16	6	19	45.64	20	2026-04-25 10:25:09	2026-04-25 10:25:09
3264	Camisa Fit Verde (Disney Kids)	14	7	5	19	99.08	13	2026-04-25 10:25:09	2026-04-25 10:25:09
3265	Saia Esportivo(a) Azul (Zoe Kids)	12	16	1	15	90.39	31	2026-04-25 10:25:09	2026-04-25 10:25:09
3266	Maiô Clássico(a) Branco(a) (Lacoste Kids)	6	13	4	1	68.30	18	2026-04-25 10:25:09	2026-04-25 10:25:09
3267	Blusa Básico(a) Lilás (Brandille)	4	3	16	7	81.57	5	2026-04-25 10:25:09	2026-04-25 10:25:09
3268	Casaco Stitch Prata (Riachuelo Kids)	28	9	18	4	48.68	29	2026-04-25 10:25:09	2026-04-25 10:25:09
3269	Macacão Floral Branco(a) (C&A Kids)	15	12	4	17	81.40	7	2026-04-25 10:25:09	2026-04-25 10:25:09
3270	Saia Loney Tunes Vinho (Hering Kids)	22	16	19	12	19.01	15	2026-04-25 10:25:09	2026-04-25 10:25:09
3271	Blusa Stitch Marrom (Carters)	28	3	13	3	12.65	8	2026-04-25 10:25:09	2026-04-25 10:25:09
3272	Maiô Fit Roxo(a) (Maria Filó Kids)	14	13	12	18	14.88	20	2026-04-25 10:25:09	2026-04-25 10:25:09
3273	Biquine Formal Azul (Brandille)	16	2	1	13	93.38	5	2026-04-25 10:25:09	2026-04-25 10:25:09
3274	Camisa Xadrez Bege (Renner Kids)	32	7	14	16	22.58	28	2026-04-25 10:25:09	2026-04-25 10:25:09
3275	Pijama Casual Lilás (Mundo Infantil)	5	15	16	10	86.41	22	2026-04-25 10:25:09	2026-04-25 10:25:09
3276	Calcinha Confortável Dourado(a) (Mundo Pet)	8	6	17	6	114.41	23	2026-04-25 10:25:09	2026-04-25 10:25:09
3277	Biquine Floral Prata (Carters)	15	2	18	16	30.69	8	2026-04-25 10:25:09	2026-04-25 10:25:09
3278	Top Stitch Azul (Colcci Kids)	28	20	1	8	24.86	9	2026-04-25 10:25:09	2026-04-25 10:25:09
3279	Short Seda Turquesa (Mundo Infantil)	27	17	15	3	18.10	22	2026-04-25 10:25:09	2026-04-25 10:25:09
3280	Jaqueta Respirável Cinza (Marisol)	25	11	8	9	105.98	21	2026-04-25 10:25:09	2026-04-25 10:25:09
3281	Maiô Moleton Vermelho(a) (Maria Filó Kids)	23	13	6	14	37.70	20	2026-04-25 10:25:09	2026-04-25 10:25:09
3282	Camiseta Estampado(a) Verde (Riachuelo Kids)	13	8	5	19	58.32	29	2026-04-25 10:25:09	2026-04-25 10:25:09
3283	Camisa Esportivo(a) Vermelho(a) (Colcci Kids)	12	7	6	13	42.39	9	2026-04-25 10:25:09	2026-04-25 10:25:09
3284	Short Colorido(a) Turquesa (Maria Filó Kids)	7	17	15	7	38.44	20	2026-04-25 10:25:09	2026-04-25 10:25:09
3285	Sunga Floral Lilás (Marisol)	15	18	16	9	86.64	21	2026-04-25 10:25:09	2026-04-25 10:25:09
3286	Pijama Algodão Roxo(a) (Conjunto Infantil)	2	15	12	16	105.48	10	2026-04-25 10:25:09	2026-04-25 10:25:09
3287	Meia Colorido(a) Roxo(a) (Colcci Kids)	7	14	12	2	68.99	9	2026-04-25 10:25:09	2026-04-25 10:25:09
3288	Calça Jeans Branco(a) (Petit Royal)	17	5	4	16	109.02	25	2026-04-25 10:25:09	2026-04-25 10:25:09
3289	Biquine Estampado(a) Azul Escuro(a) (Akazys)	13	2	9	3	27.26	2	2026-04-25 10:25:09	2026-04-25 10:25:09
3290	Calça Xadrez Dourado(a) (Puket Kids)	32	5	17	6	98.34	27	2026-04-25 10:25:09	2026-04-25 10:25:09
3291	Macacão Curto(a) Rosa (Farm Kids)	9	12	2	1	77.25	14	2026-04-25 10:25:09	2026-04-25 10:25:09
3292	Jaqueta Xadrez Verde (Riachuelo Kids)	32	11	5	13	47.45	29	2026-04-25 10:25:09	2026-04-25 10:25:09
3293	Cueca Formal Preto(a) (C&A Baby)	16	10	3	4	51.42	6	2026-04-25 10:25:09	2026-04-25 10:25:09
3294	Camiseta Xadrez Amarelo(a) (Akazys)	32	8	7	3	59.59	2	2026-04-25 10:25:09	2026-04-25 10:25:09
3295	Sutiã Confortável Turquesa (Bendita Cute)	8	19	15	16	47.06	3	2026-04-25 10:25:09	2026-04-25 10:25:09
3296	Short Formal Lilás (C&A Baby)	16	17	16	12	101.06	6	2026-04-25 10:25:09	2026-04-25 10:25:09
3297	Calçado Temático(a) Cinza (Maria Filó Kids)	29	4	8	11	77.87	20	2026-04-25 10:25:09	2026-04-25 10:25:09
3298	Bermuda Loney Tunes Branco(a) (Mundo Infantil)	22	1	4	2	53.08	22	2026-04-25 10:25:09	2026-04-25 10:25:09
3299	Maiô Poliéster Rosa Choque (Bendita Cute)	24	13	10	5	51.95	3	2026-04-25 10:25:09	2026-04-25 10:25:09
3300	Camisa Respirável Azul (Mundo Infantil)	25	7	1	7	13.20	22	2026-04-25 10:25:09	2026-04-25 10:25:09
3301	Maiô Elástico(a) Azul (Conjunto Infantil)	11	13	1	18	79.30	10	2026-04-25 10:25:09	2026-04-25 10:25:09
3302	Meia Estampado(a) Turquesa (Maria Filó Kids)	13	14	15	4	94.19	20	2026-04-25 10:25:09	2026-04-25 10:25:09
3303	Calçado Fit Rosa (Salsa Jeans Kids)	14	4	2	17	67.36	30	2026-04-25 10:25:09	2026-04-25 10:25:09
3304	Sutiã Respirável Bege (Zoe Kids)	25	19	14	1	107.51	31	2026-04-25 10:25:09	2026-04-25 10:25:09
3305	Camiseta Fit Amarelo(a) (Osklen Kids)	14	8	7	16	73.28	24	2026-04-25 10:25:09	2026-04-25 10:25:09
3306	Biquine Durável Vinho (Salsa Jeans Kids)	10	2	19	16	48.02	30	2026-04-25 10:25:09	2026-04-25 10:25:09
3307	Biquine Xadrez Roxo(a) (Maria Filó Kids)	32	2	12	5	99.43	20	2026-04-25 10:25:09	2026-04-25 10:25:09
3308	Vestido Toy Store Cáqui (Farm Kids)	30	21	20	16	45.61	14	2026-04-25 10:25:09	2026-04-25 10:25:09
3309	Blusa Toy Store Cáqui (Zoe Kids)	30	3	20	18	84.86	31	2026-04-25 10:25:09	2026-04-25 10:25:09
3310	Calcinha Curto(a) Rosa Choque (Mundo Pet)	9	6	10	7	102.79	23	2026-04-25 10:25:09	2026-04-25 10:25:09
3311	Sunga Toy Store Cinza (Akazys)	30	18	8	15	70.55	2	2026-04-25 10:25:09	2026-04-25 10:25:09
3312	Top Estampado(a) Turquesa (Zoe Kids)	13	20	15	3	97.76	31	2026-04-25 10:25:09	2026-04-25 10:25:09
3313	Sunga Leve Roxo(a) (Mundo Pet)	19	18	12	3	15.36	23	2026-04-25 10:25:09	2026-04-25 10:25:09
3314	Pijama Elástico(a) Amarelo(a) (Lacoste Kids)	11	15	7	13	30.11	18	2026-04-25 10:25:09	2026-04-25 10:25:09
3315	Pijama Esportivo(a) Verde (Zoe Kids)	12	15	5	11	86.80	31	2026-04-25 10:25:09	2026-04-25 10:25:09
3316	Camiseta Listrado Rosa Choque (Hering Kids)	20	8	10	13	109.40	15	2026-04-25 10:25:09	2026-04-25 10:25:09
3317	Macacão Floral Prata (Mundo Infantil)	15	12	18	4	89.87	22	2026-04-25 10:25:09	2026-04-25 10:25:09
3318	Cueca Labubu Vinho (Mundo Pet)	18	10	19	7	46.08	23	2026-04-25 10:25:09	2026-04-25 10:25:09
3319	Calcinha Temático(a) Dourado(a) (Hering Kids)	29	6	17	8	56.08	15	2026-04-25 10:25:09	2026-04-25 10:25:09
3320	Cueca Formal Lilás (Ki Carinho)	16	10	16	10	53.69	16	2026-04-25 10:25:09	2026-04-25 10:25:09
3321	Cueca Longa Rosa Choque (Disney Baby)	21	10	10	10	40.88	12	2026-04-25 10:25:09	2026-04-25 10:25:09
3322	Maiô Formal Vermelho(a) (Brandille)	16	13	6	11	12.24	5	2026-04-25 10:25:09	2026-04-25 10:25:09
3323	Calcinha Casual Rosa (Petit Royal)	5	6	2	16	40.87	25	2026-04-25 10:25:09	2026-04-25 10:25:09
3324	Top Turma da Mônica Lilás (Hering Kids)	31	20	16	3	90.60	15	2026-04-25 10:25:09	2026-04-25 10:25:09
3325	Maiô Listrado Verde (Boboi)	20	13	5	11	84.45	4	2026-04-25 10:25:09	2026-04-25 10:25:09
3326	Meia Algodão Amarelo(a) (C&A Kids)	2	14	7	5	33.39	7	2026-04-25 10:25:09	2026-04-25 10:25:09
3327	Calcinha Moleton Laranja (Kily)	23	6	11	4	46.84	17	2026-04-25 10:25:09	2026-04-25 10:25:09
3328	Jaqueta Elástico(a) Vinho (Adidas Kids)	11	11	19	17	33.94	1	2026-04-25 10:25:09	2026-04-25 10:25:09
3329	Sunga Labubu Rosa (Marisol)	18	18	2	13	10.50	21	2026-04-25 10:25:09	2026-04-25 10:25:09
3330	Casaco Stitch Azul Escuro(a) (Riachuelo Kids)	28	9	9	17	17.21	29	2026-04-25 10:25:09	2026-04-25 10:25:09
3331	Saia Durável Preto(a) (Akazys)	10	16	3	3	13.30	2	2026-04-25 10:25:09	2026-04-25 10:25:09
3332	Casaco Moleton Lilás (Kily)	23	9	16	3	91.85	17	2026-04-25 10:25:09	2026-04-25 10:25:09
3333	Calcinha Moleton Cinza (Colcci Kids)	23	6	8	14	89.26	9	2026-04-25 10:25:09	2026-04-25 10:25:09
3334	Maiô Leve Prata (Riachuelo Kids)	19	13	18	10	97.72	29	2026-04-25 10:25:09	2026-04-25 10:25:09
3335	Camisa Elástico(a) Bege (Mundo Infantil)	11	7	14	8	55.07	22	2026-04-25 10:25:09	2026-04-25 10:25:09
3336	Sutiã Floral Bege (Marisol)	15	19	14	13	102.46	21	2026-04-25 10:25:09	2026-04-25 10:25:09
3337	Cueca Curto(a) Azul (Disney Baby)	9	10	1	18	36.29	12	2026-04-25 10:25:09	2026-04-25 10:25:09
3338	Jaqueta Floral Preto(a) (Lilica Ripilica)	15	11	3	11	90.13	19	2026-04-25 10:25:09	2026-04-25 10:25:09
3339	Calcinha Elástico(a) Branco(a) (Brandille)	11	6	4	6	28.70	5	2026-04-25 10:25:09	2026-04-25 10:25:09
3340	Camiseta Saja Turquesa (Lilica Ripilica)	26	8	15	15	104.73	19	2026-04-25 10:25:09	2026-04-25 10:25:09
3341	Calça Loney Tunes Cinza (Dafiti Kids)	22	5	8	12	13.03	11	2026-04-25 10:25:09	2026-04-25 10:25:09
3342	Macacão Floral Turquesa (Mundo Pet)	15	12	15	19	15.72	23	2026-04-25 10:25:09	2026-04-25 10:25:09
3343	Biquine Moleton Lilás (Renner Kids)	23	2	16	8	28.75	28	2026-04-25 10:25:09	2026-04-25 10:25:09
3344	Calça Turma da Mônica Preto(a) (Osklen Kids)	31	5	3	10	12.80	24	2026-04-25 10:25:09	2026-04-25 10:25:09
3345	Calcinha Xadrez Turquesa (Pimpolho)	32	6	15	9	57.48	26	2026-04-25 10:25:09	2026-04-25 10:25:09
3346	Biquine Casual Dourado(a) (C&A Baby)	5	2	17	15	28.05	6	2026-04-25 10:25:09	2026-04-25 10:25:09
3347	Macacão Poliéster Azul Escuro(a) (C&A Kids)	24	12	9	10	39.16	7	2026-04-25 10:25:09	2026-04-25 10:25:09
3348	Pijama Estampado(a) Rosa (Disney Baby)	13	15	2	17	34.77	12	2026-04-25 10:25:09	2026-04-25 10:25:09
3349	Calça Seda Preto(a) (Osklen Kids)	27	5	3	5	40.86	24	2026-04-25 10:25:09	2026-04-25 10:25:09
3350	Meia Poliéster Bege (Kily)	24	14	14	19	66.43	17	2026-04-25 10:25:09	2026-04-25 10:25:09
3351	Macacão Listrado Azul (Akazys)	20	12	1	8	114.46	2	2026-04-25 10:25:09	2026-04-25 10:25:09
3352	Blusa Estampado(a) Cinza (Renner Kids)	13	3	8	7	21.88	28	2026-04-25 10:25:09	2026-04-25 10:25:09
3353	Calçado Básico(a) Vinho (Kily)	4	4	19	2	44.92	17	2026-04-25 10:25:09	2026-04-25 10:25:09
3354	Sutiã Seda Rosa (Akazys)	27	19	2	12	63.05	2	2026-04-25 10:25:09	2026-04-25 10:25:09
3355	Bermuda Esportivo(a) Rosa (Lilica Ripilica)	12	1	2	19	26.14	19	2026-04-25 10:25:09	2026-04-25 10:25:09
3356	Saia Confortável Bege (Mundo Infantil)	8	16	14	6	104.27	22	2026-04-25 10:25:09	2026-04-25 10:25:09
3357	Calça Fit Preto(a) (Riachuelo Kids)	14	5	3	9	64.69	29	2026-04-25 10:25:09	2026-04-25 10:25:09
3358	Blusa Stitch Laranja (Riachuelo Kids)	28	3	11	7	77.38	29	2026-04-25 10:25:09	2026-04-25 10:25:09
3359	Cueca Esportivo(a) Azul Escuro(a) (Maria Filó Kids)	12	10	9	6	38.38	20	2026-04-25 10:25:09	2026-04-25 10:25:09
3360	Casaco Curto(a) Preto(a) (Pimpolho)	9	9	3	17	68.46	26	2026-04-25 10:25:09	2026-04-25 10:25:09
3361	Sunga Estampado(a) Cáqui (Marisol)	13	18	20	3	15.43	21	2026-04-25 10:25:09	2026-04-25 10:25:09
3362	Saia Xadrez Turquesa (Maria Filó Kids)	32	16	15	1	115.09	20	2026-04-25 10:25:09	2026-04-25 10:25:09
3363	Meia Loney Tunes Dourado(a) (Salsa Jeans Kids)	22	14	17	8	107.65	30	2026-04-25 10:25:09	2026-04-25 10:25:09
3364	Cueca Respirável Marrom (Maria Filó Kids)	25	10	13	10	17.55	20	2026-04-25 10:25:09	2026-04-25 10:25:09
3365	Maiô Toy Store Dourado(a) (Kily)	30	13	17	6	119.54	17	2026-04-25 10:25:09	2026-04-25 10:25:09
3366	Short Floral Cinza (Renner Kids)	15	17	8	4	89.45	28	2026-04-25 10:25:09	2026-04-25 10:25:09
3367	Calça Xadrez Azul (Farm Kids)	32	5	1	12	112.79	14	2026-04-25 10:25:09	2026-04-25 10:25:09
3368	Camisa Labubu Amarelo(a) (Farm Kids)	18	7	7	16	89.46	14	2026-04-25 10:25:09	2026-04-25 10:25:09
3369	Short Saja Prata (C&A Baby)	26	17	18	9	22.77	6	2026-04-25 10:25:09	2026-04-25 10:25:09
3370	Blusa Fit Rosa Choque (Kily)	14	3	10	2	51.94	17	2026-04-25 10:25:09	2026-04-25 10:25:09
3371	Blusa Turma da Mônica Marrom (Brandille)	31	3	13	5	52.79	5	2026-04-25 10:25:09	2026-04-25 10:25:09
3372	Casaco Casual Azul Escuro(a) (Salsa Jeans Kids)	5	9	9	17	16.23	30	2026-04-25 10:25:09	2026-04-25 10:25:09
3373	Macacão Poliéster Azul Escuro(a) (Carters)	24	12	9	7	44.44	8	2026-04-25 10:25:09	2026-04-25 10:25:09
3374	Blusa Estampado(a) Prata (Hering Kids)	13	3	18	16	23.99	15	2026-04-25 10:25:09	2026-04-25 10:25:09
3375	Top Poliéster Cáqui (Dafiti Kids)	24	20	20	4	43.75	11	2026-04-25 10:25:09	2026-04-25 10:25:09
3661	Cueca Labubu Laranja (Zoe Kids)	18	10	11	12	95.18	31	2026-04-25 10:25:09	2026-04-25 10:25:09
3376	Camisa Respirável Vermelho(a) (Brandille)	25	7	6	1	12.79	5	2026-04-25 10:25:09	2026-04-25 10:25:09
3377	Maiô Respirável Vermelho(a) (Lilica Ripilica)	25	13	6	2	87.95	19	2026-04-25 10:25:09	2026-04-25 10:25:09
3378	Blusa Casual Vinho (C&A Kids)	5	3	19	3	28.86	7	2026-04-25 10:25:09	2026-04-25 10:25:09
3379	Calçado Casual Verde (Riachuelo Kids)	5	4	5	6	25.85	29	2026-04-25 10:25:09	2026-04-25 10:25:09
3380	Blusa Floral Azul Escuro(a) (Bendita Cute)	15	3	9	6	111.99	3	2026-04-25 10:25:09	2026-04-25 10:25:09
3381	Macacão Clássico(a) Preto(a) (Akazys)	6	12	3	6	103.54	2	2026-04-25 10:25:09	2026-04-25 10:25:09
3382	Pijama Algodão Azul (Disney Baby)	2	15	1	9	114.49	12	2026-04-25 10:25:09	2026-04-25 10:25:09
3383	Casaco Colorido(a) Verde (Marisol)	7	9	5	10	73.98	21	2026-04-25 10:25:09	2026-04-25 10:25:09
3384	Jaqueta Durável Vinho (Farm Kids)	10	11	19	8	51.36	14	2026-04-25 10:25:09	2026-04-25 10:25:09
3385	Saia Stitch Azul Escuro(a) (Zoe Kids)	28	16	9	13	71.84	31	2026-04-25 10:25:09	2026-04-25 10:25:09
3386	Casaco Elástico(a) Azul Escuro(a) (Disney Kids)	11	9	9	19	45.75	13	2026-04-25 10:25:09	2026-04-25 10:25:09
3387	Bermuda Loney Tunes Rosa (Ki Carinho)	22	1	2	17	43.98	16	2026-04-25 10:25:09	2026-04-25 10:25:09
3388	Calça Loney Tunes Preto(a) (Boboi)	22	5	3	19	41.40	4	2026-04-25 10:25:09	2026-04-25 10:25:09
3389	Calçado Respirável Prata (Riachuelo Kids)	25	4	18	7	39.83	29	2026-04-25 10:25:09	2026-04-25 10:25:09
3390	Calcinha Confortável Bege (Adidas Kids)	8	6	14	17	85.63	1	2026-04-25 10:25:09	2026-04-25 10:25:09
3391	Saia Loney Tunes Verde (Dafiti Kids)	22	16	5	6	100.01	11	2026-04-25 10:25:09	2026-04-25 10:25:09
3392	Camisa Curto(a) Cáqui (Puket Kids)	9	7	20	1	81.07	27	2026-04-25 10:25:09	2026-04-25 10:25:09
3393	Blusa Ajustável Cáqui (Marisol)	1	3	20	15	60.72	21	2026-04-25 10:25:09	2026-04-25 10:25:09
3394	Maiô Floral Laranja (Salsa Jeans Kids)	15	13	11	1	43.20	30	2026-04-25 10:25:09	2026-04-25 10:25:09
3395	Meia Longa Amarelo(a) (Carters)	21	14	7	7	91.75	8	2026-04-25 10:25:09	2026-04-25 10:25:09
3396	Pijama Animal Print Azul Escuro(a) (Puket Kids)	3	15	9	19	41.04	27	2026-04-25 10:25:09	2026-04-25 10:25:09
3397	Vestido Seda Rosa (Ki Carinho)	27	21	2	4	60.84	16	2026-04-25 10:25:09	2026-04-25 10:25:09
3398	Casaco Estampado(a) Verde (Brandille)	13	9	5	11	92.43	5	2026-04-25 10:25:09	2026-04-25 10:25:09
3399	Casaco Stitch Marrom (Brandille)	28	9	13	4	43.74	5	2026-04-25 10:25:09	2026-04-25 10:25:09
3400	Casaco Turma da Mônica Vinho (Osklen Kids)	31	9	19	18	25.24	24	2026-04-25 10:25:09	2026-04-25 10:25:09
3401	Meia Respirável Turquesa (Adidas Kids)	25	14	15	10	78.67	1	2026-04-25 10:25:09	2026-04-25 10:25:09
3402	Cueca Colorido(a) Rosa Choque (Marisol)	7	10	10	10	51.75	21	2026-04-25 10:25:09	2026-04-25 10:25:09
3403	Sunga Casual Cáqui (Puket Kids)	5	18	20	14	116.56	27	2026-04-25 10:25:09	2026-04-25 10:25:09
3404	Camisa Estampado(a) Dourado(a) (Farm Kids)	13	7	17	8	54.43	14	2026-04-25 10:25:09	2026-04-25 10:25:09
3405	Jaqueta Esportivo(a) Azul Escuro(a) (Disney Baby)	12	11	9	4	113.59	12	2026-04-25 10:25:09	2026-04-25 10:25:09
3406	Meia Durável Azul Escuro(a) (Ki Carinho)	10	14	9	19	68.68	16	2026-04-25 10:25:09	2026-04-25 10:25:09
3407	Maiô Xadrez Azul Escuro(a) (Adidas Kids)	32	13	9	16	25.10	1	2026-04-25 10:25:09	2026-04-25 10:25:09
3408	Calça Respirável Lilás (Disney Kids)	25	5	16	2	106.28	13	2026-04-25 10:25:09	2026-04-25 10:25:09
3409	Sutiã Toy Store Verde (Pimpolho)	30	19	5	9	32.33	26	2026-04-25 10:25:09	2026-04-25 10:25:09
3410	Camisa Xadrez Laranja (Brandille)	32	7	11	3	67.83	5	2026-04-25 10:25:09	2026-04-25 10:25:09
3411	Calcinha Toy Store Verde (Renner Kids)	30	6	5	14	92.78	28	2026-04-25 10:25:09	2026-04-25 10:25:09
3412	Calça Toy Store Azul Escuro(a) (Maria Filó Kids)	30	5	9	5	63.69	20	2026-04-25 10:25:09	2026-04-25 10:25:09
3413	Meia Estampado(a) Cáqui (Adidas Kids)	13	14	20	8	109.81	1	2026-04-25 10:25:09	2026-04-25 10:25:09
3414	Sunga Stitch Cáqui (Renner Kids)	28	18	20	8	88.43	28	2026-04-25 10:25:09	2026-04-25 10:25:09
3415	Sutiã Poliéster Rosa (Akazys)	24	19	2	7	10.43	2	2026-04-25 10:25:09	2026-04-25 10:25:09
3416	Pijama Esportivo(a) Rosa Choque (Zoe Kids)	12	15	10	7	13.19	31	2026-04-25 10:25:09	2026-04-25 10:25:09
3417	Sutiã Esportivo(a) Roxo(a) (C&A Kids)	12	19	12	11	88.41	7	2026-04-25 10:25:09	2026-04-25 10:25:09
3418	Calcinha Xadrez Amarelo(a) (Boboi)	32	6	7	17	99.47	4	2026-04-25 10:25:09	2026-04-25 10:25:09
3419	Meia Elástico(a) Turquesa (Boboi)	11	14	15	13	31.19	4	2026-04-25 10:25:09	2026-04-25 10:25:09
3420	Sunga Esportivo(a) Marrom (Brandille)	12	18	13	17	36.13	5	2026-04-25 10:25:09	2026-04-25 10:25:09
3421	Saia Curto(a) Roxo(a) (Disney Kids)	9	16	12	18	87.75	13	2026-04-25 10:25:09	2026-04-25 10:25:09
3422	Macacão Confortável Amarelo(a) (Salsa Jeans Kids)	8	12	7	1	117.40	30	2026-04-25 10:25:09	2026-04-25 10:25:09
3423	Calcinha Listrado Vinho (Hering Kids)	20	6	19	14	54.98	15	2026-04-25 10:25:09	2026-04-25 10:25:09
3424	Pijama Poliéster Vermelho(a) (Kily)	24	15	6	3	13.89	17	2026-04-25 10:25:09	2026-04-25 10:25:09
3425	Blusa Confortável Dourado(a) (Conjunto Infantil)	8	3	17	1	113.96	10	2026-04-25 10:25:09	2026-04-25 10:25:09
3426	Bermuda Animal Print Rosa (C&A Kids)	3	1	2	10	54.09	7	2026-04-25 10:25:09	2026-04-25 10:25:09
3427	Sutiã Temático(a) Verde (Farm Kids)	29	19	5	18	53.74	14	2026-04-25 10:25:09	2026-04-25 10:25:09
3428	Jaqueta Toy Store Prata (Bendita Cute)	30	11	18	12	56.62	3	2026-04-25 10:25:09	2026-04-25 10:25:09
3429	Camiseta Stitch Laranja (Zoe Kids)	28	8	11	16	86.70	31	2026-04-25 10:25:09	2026-04-25 10:25:09
3430	Casaco Floral Preto(a) (C&A Kids)	15	9	3	10	40.86	7	2026-04-25 10:25:09	2026-04-25 10:25:09
3431	Biquine Colorido(a) Vermelho(a) (Pimpolho)	7	2	6	18	22.71	26	2026-04-25 10:25:09	2026-04-25 10:25:09
3432	Biquine Estampado(a) Roxo(a) (Farm Kids)	13	2	12	4	112.34	14	2026-04-25 10:25:09	2026-04-25 10:25:09
3433	Jaqueta Formal Preto(a) (Brandille)	16	11	3	9	75.15	5	2026-04-25 10:25:09	2026-04-25 10:25:09
3434	Jaqueta Listrado Azul Escuro(a) (C&A Baby)	20	11	9	11	82.93	6	2026-04-25 10:25:09	2026-04-25 10:25:09
3435	Sunga Confortável Laranja (Disney Kids)	8	18	11	13	78.85	13	2026-04-25 10:25:09	2026-04-25 10:25:09
3436	Meia Estampado(a) Azul (Conjunto Infantil)	13	14	1	15	23.99	10	2026-04-25 10:25:09	2026-04-25 10:25:09
3437	Short Estampado(a) Branco(a) (Colcci Kids)	13	17	4	14	59.45	9	2026-04-25 10:25:09	2026-04-25 10:25:09
3438	Calçado Jeans Rosa Choque (Boboi)	17	4	10	19	67.86	4	2026-04-25 10:25:09	2026-04-25 10:25:09
3439	Maiô Leve Marrom (Pimpolho)	19	13	13	1	12.70	26	2026-04-25 10:25:09	2026-04-25 10:25:09
3440	Sutiã Elástico(a) Rosa (Riachuelo Kids)	11	19	2	12	14.18	29	2026-04-25 10:25:09	2026-04-25 10:25:09
3441	Pijama Formal Roxo(a) (Conjunto Infantil)	16	15	12	4	118.91	10	2026-04-25 10:25:09	2026-04-25 10:25:09
3442	Meia Respirável Rosa Choque (C&A Kids)	25	14	10	11	113.35	7	2026-04-25 10:25:09	2026-04-25 10:25:09
3443	Calçado Casual Preto(a) (Akazys)	5	4	3	13	79.20	2	2026-04-25 10:25:09	2026-04-25 10:25:09
3444	Bermuda Clássico(a) Amarelo(a) (Osklen Kids)	6	1	7	13	24.30	24	2026-04-25 10:25:09	2026-04-25 10:25:09
3445	Cueca Stitch Verde (Osklen Kids)	28	10	5	7	34.46	24	2026-04-25 10:25:09	2026-04-25 10:25:09
3446	Camiseta Longa Branco(a) (Adidas Kids)	21	8	4	8	21.43	1	2026-04-25 10:25:09	2026-04-25 10:25:09
3447	Bermuda Estampado(a) Preto(a) (Farm Kids)	13	1	3	15	27.48	14	2026-04-25 10:25:09	2026-04-25 10:25:09
3448	Calçado Durável Roxo(a) (Dafiti Kids)	10	4	12	15	52.65	11	2026-04-25 10:25:09	2026-04-25 10:25:09
3449	Sutiã Esportivo(a) Rosa Choque (Adidas Kids)	12	19	10	16	88.02	1	2026-04-25 10:25:09	2026-04-25 10:25:09
3450	Maiô Elástico(a) Roxo(a) (Brandille)	11	13	12	6	32.98	5	2026-04-25 10:25:09	2026-04-25 10:25:09
3451	Saia Algodão Dourado(a) (Riachuelo Kids)	2	16	17	5	97.30	29	2026-04-25 10:25:09	2026-04-25 10:25:09
3452	Cueca Jeans Azul Escuro(a) (Dafiti Kids)	17	10	9	7	40.75	11	2026-04-25 10:25:09	2026-04-25 10:25:09
3453	Biquine Clássico(a) Vermelho(a) (Marisol)	6	2	6	13	36.48	21	2026-04-25 10:25:09	2026-04-25 10:25:09
3454	Biquine Turma da Mônica Rosa Choque (Pimpolho)	31	2	10	4	63.42	26	2026-04-25 10:25:09	2026-04-25 10:25:09
3455	Calçado Loney Tunes Marrom (Riachuelo Kids)	22	4	13	6	50.27	29	2026-04-25 10:25:09	2026-04-25 10:25:09
3456	Short Estampado(a) Vermelho(a) (C&A Kids)	13	17	6	18	23.48	7	2026-04-25 10:25:09	2026-04-25 10:25:09
3457	Camisa Confortável Rosa Choque (Puket Kids)	8	7	10	10	21.21	27	2026-04-25 10:25:09	2026-04-25 10:25:09
3458	Short Curto(a) Amarelo(a) (Kily)	9	17	7	3	100.15	17	2026-04-25 10:25:09	2026-04-25 10:25:09
3459	Vestido Poliéster Vinho (Hering Kids)	24	21	19	9	27.54	15	2026-04-25 10:25:09	2026-04-25 10:25:09
3460	Meia Turma da Mônica Branco(a) (Hering Kids)	31	14	4	19	41.50	15	2026-04-25 10:25:09	2026-04-25 10:25:09
3461	Sunga Formal Cinza (Disney Kids)	16	18	8	16	42.22	13	2026-04-25 10:25:09	2026-04-25 10:25:09
3462	Maiô Formal Cinza (Osklen Kids)	16	13	8	13	104.43	24	2026-04-25 10:25:09	2026-04-25 10:25:09
3463	Top Fit Roxo(a) (Adidas Kids)	14	20	12	9	18.43	1	2026-04-25 10:25:09	2026-04-25 10:25:09
3464	Camisa Respirável Rosa (Akazys)	25	7	2	2	82.73	2	2026-04-25 10:25:09	2026-04-25 10:25:09
3465	Blusa Xadrez Rosa (C&A Kids)	32	3	2	4	24.64	7	2026-04-25 10:25:09	2026-04-25 10:25:09
3466	Camiseta Labubu Laranja (Pimpolho)	18	8	11	3	49.66	26	2026-04-25 10:25:09	2026-04-25 10:25:09
3467	Jaqueta Labubu Azul Escuro(a) (Lilica Ripilica)	18	11	9	18	71.36	19	2026-04-25 10:25:09	2026-04-25 10:25:09
3468	Calcinha Confortável Turquesa (C&A Kids)	8	6	15	15	45.20	7	2026-04-25 10:25:09	2026-04-25 10:25:09
3469	Casaco Esportivo(a) Cáqui (Riachuelo Kids)	12	9	20	12	55.62	29	2026-04-25 10:25:09	2026-04-25 10:25:09
3470	Vestido Básico(a) Bege (Renner Kids)	4	21	14	9	47.17	28	2026-04-25 10:25:09	2026-04-25 10:25:09
3471	Top Colorido(a) Verde (C&A Baby)	7	20	5	16	78.67	6	2026-04-25 10:25:09	2026-04-25 10:25:09
3472	Bermuda Básico(a) Prata (Salsa Jeans Kids)	4	1	18	10	11.57	30	2026-04-25 10:25:09	2026-04-25 10:25:09
3473	Saia Listrado Roxo(a) (Renner Kids)	20	16	12	1	48.38	28	2026-04-25 10:25:09	2026-04-25 10:25:09
3474	Sunga Leve Roxo(a) (Salsa Jeans Kids)	19	18	12	16	35.02	30	2026-04-25 10:25:09	2026-04-25 10:25:09
3475	Biquine Respirável Roxo(a) (Boboi)	25	2	12	5	22.07	4	2026-04-25 10:25:09	2026-04-25 10:25:09
3476	Top Fit Branco(a) (Farm Kids)	14	20	4	7	50.43	14	2026-04-25 10:25:09	2026-04-25 10:25:09
3477	Calça Xadrez Cinza (Carters)	32	5	8	2	44.64	8	2026-04-25 10:25:09	2026-04-25 10:25:09
3478	Top Listrado Laranja (Maria Filó Kids)	20	20	11	15	65.64	20	2026-04-25 10:25:09	2026-04-25 10:25:09
3479	Top Elástico(a) Azul Escuro(a) (Conjunto Infantil)	11	20	9	15	20.27	10	2026-04-25 10:25:09	2026-04-25 10:25:09
3480	Saia Elástico(a) Dourado(a) (Carters)	11	16	17	3	112.62	8	2026-04-25 10:25:09	2026-04-25 10:25:09
3481	Biquine Turma da Mônica Preto(a) (Osklen Kids)	31	2	3	10	68.74	24	2026-04-25 10:25:09	2026-04-25 10:25:09
3482	Macacão Moleton Laranja (Lilica Ripilica)	23	12	11	10	102.28	19	2026-04-25 10:25:09	2026-04-25 10:25:09
3483	Bermuda Leve Vinho (Petit Royal)	19	1	19	2	39.53	25	2026-04-25 10:25:09	2026-04-25 10:25:09
3484	Camisa Leve Preto(a) (Disney Kids)	19	7	3	12	86.24	13	2026-04-25 10:25:09	2026-04-25 10:25:09
3485	Calçado Básico(a) Vinho (Maria Filó Kids)	4	4	19	11	15.38	20	2026-04-25 10:25:09	2026-04-25 10:25:09
3486	Sunga Formal Branco(a) (Disney Kids)	16	18	4	16	82.49	13	2026-04-25 10:25:09	2026-04-25 10:25:09
3487	Pijama Curto(a) Amarelo(a) (Ki Carinho)	9	15	7	2	24.34	16	2026-04-25 10:25:09	2026-04-25 10:25:09
3488	Vestido Seda Vinho (Salsa Jeans Kids)	27	21	19	13	75.01	30	2026-04-25 10:25:09	2026-04-25 10:25:09
3489	Blusa Moleton Cinza (Osklen Kids)	23	3	8	1	91.18	24	2026-04-25 10:25:09	2026-04-25 10:25:09
3490	Bermuda Floral Vermelho(a) (Disney Baby)	15	1	6	3	92.61	12	2026-04-25 10:25:09	2026-04-25 10:25:09
3491	Short Longa Rosa Choque (Disney Kids)	21	17	10	9	80.44	13	2026-04-25 10:25:09	2026-04-25 10:25:09
3492	Cueca Turma da Mônica Marrom (Marisol)	31	10	13	9	51.00	21	2026-04-25 10:25:09	2026-04-25 10:25:09
3493	Pijama Confortável Turquesa (Colcci Kids)	8	15	15	8	65.17	9	2026-04-25 10:25:09	2026-04-25 10:25:09
3494	Jaqueta Colorido(a) Branco(a) (Carters)	7	11	4	12	22.98	8	2026-04-25 10:25:09	2026-04-25 10:25:09
3495	Short Casual Turquesa (Colcci Kids)	5	17	15	11	56.31	9	2026-04-25 10:25:09	2026-04-25 10:25:09
3496	Maiô Listrado Lilás (Pimpolho)	20	13	16	16	76.49	26	2026-04-25 10:25:09	2026-04-25 10:25:09
3497	Bermuda Stitch Roxo(a) (Renner Kids)	28	1	12	5	117.67	28	2026-04-25 10:25:09	2026-04-25 10:25:09
3498	Short Estampado(a) Vinho (Puket Kids)	13	17	19	8	112.28	27	2026-04-25 10:25:09	2026-04-25 10:25:09
3499	Sunga Ajustável Laranja (Puket Kids)	1	18	11	9	98.75	27	2026-04-25 10:25:09	2026-04-25 10:25:09
3500	Vestido Moleton Vinho (Hering Kids)	23	21	19	3	44.55	15	2026-04-25 10:25:09	2026-04-25 10:25:09
3501	Saia Xadrez Amarelo(a) (Hering Kids)	32	16	7	7	83.45	15	2026-04-25 10:25:09	2026-04-25 10:25:09
3502	Maiô Casual Vinho (Colcci Kids)	5	13	19	17	30.22	9	2026-04-25 10:25:09	2026-04-25 10:25:09
3503	Sunga Respirável Laranja (Carters)	25	18	11	5	91.70	8	2026-04-25 10:25:09	2026-04-25 10:25:09
3504	Casaco Turma da Mônica Turquesa (Mundo Pet)	31	9	15	18	32.97	23	2026-04-25 10:25:09	2026-04-25 10:25:09
3505	Macacão Floral Vinho (C&A Baby)	15	12	19	19	25.59	6	2026-04-25 10:25:09	2026-04-25 10:25:09
3506	Jaqueta Ajustável Cáqui (Ki Carinho)	1	11	20	1	11.62	16	2026-04-25 10:25:09	2026-04-25 10:25:09
3507	Maiô Colorido(a) Vermelho(a) (Bendita Cute)	7	13	6	13	59.84	3	2026-04-25 10:25:09	2026-04-25 10:25:09
3508	Calçado Labubu Turquesa (Farm Kids)	18	4	15	3	56.20	14	2026-04-25 10:25:09	2026-04-25 10:25:09
3509	Sutiã Loney Tunes Preto(a) (Zoe Kids)	22	19	3	9	114.09	31	2026-04-25 10:25:09	2026-04-25 10:25:09
3510	Calcinha Labubu Cáqui (Adidas Kids)	18	6	20	14	116.11	1	2026-04-25 10:25:09	2026-04-25 10:25:09
3511	Cueca Clássico(a) Dourado(a) (Boboi)	6	10	17	9	91.78	4	2026-04-25 10:25:09	2026-04-25 10:25:09
3512	Casaco Floral Branco(a) (Dafiti Kids)	15	9	4	12	21.17	11	2026-04-25 10:25:09	2026-04-25 10:25:09
3513	Camiseta Leve Laranja (Conjunto Infantil)	19	8	11	11	79.12	10	2026-04-25 10:25:09	2026-04-25 10:25:09
3514	Biquine Curto(a) Branco(a) (Osklen Kids)	9	2	4	12	77.70	24	2026-04-25 10:25:09	2026-04-25 10:25:09
3515	Saia Animal Print Lilás (Bendita Cute)	3	16	16	9	109.97	3	2026-04-25 10:25:09	2026-04-25 10:25:09
3516	Biquine Básico(a) Prata (Carters)	4	2	18	10	34.69	8	2026-04-25 10:25:09	2026-04-25 10:25:09
3517	Cueca Stitch Turquesa (Mundo Pet)	28	10	15	8	54.19	23	2026-04-25 10:25:09	2026-04-25 10:25:09
3518	Macacão Listrado Lilás (Carters)	20	12	16	16	28.75	8	2026-04-25 10:25:09	2026-04-25 10:25:09
3519	Vestido Toy Store Azul Escuro(a) (Disney Baby)	30	21	9	13	56.75	12	2026-04-25 10:25:09	2026-04-25 10:25:09
3520	Meia Saja Amarelo(a) (Riachuelo Kids)	26	14	7	18	22.53	29	2026-04-25 10:25:09	2026-04-25 10:25:09
3521	Macacão Floral Cáqui (Osklen Kids)	15	12	20	6	78.06	24	2026-04-25 10:25:09	2026-04-25 10:25:09
3522	Sutiã Elástico(a) Branco(a) (Puket Kids)	11	19	4	15	75.38	27	2026-04-25 10:25:09	2026-04-25 10:25:09
3523	Short Leve Cinza (Renner Kids)	19	17	8	4	42.35	28	2026-04-25 10:25:09	2026-04-25 10:25:09
3524	Blusa Labubu Rosa (C&A Kids)	18	3	2	7	62.32	7	2026-04-25 10:25:09	2026-04-25 10:25:09
3525	Bermuda Curto(a) Turquesa (Disney Kids)	9	1	15	16	20.50	13	2026-04-25 10:25:09	2026-04-25 10:25:09
3526	Top Turma da Mônica Laranja (Mundo Pet)	31	20	11	9	105.73	23	2026-04-25 10:25:09	2026-04-25 10:25:09
3527	Camisa Ajustável Branco(a) (Lilica Ripilica)	1	7	4	6	96.53	19	2026-04-25 10:25:09	2026-04-25 10:25:09
3528	Camiseta Seda Rosa Choque (Osklen Kids)	27	8	10	17	45.60	24	2026-04-25 10:25:09	2026-04-25 10:25:09
3529	Jaqueta Stitch Cinza (Salsa Jeans Kids)	28	11	8	15	19.84	30	2026-04-25 10:25:09	2026-04-25 10:25:09
3530	Casaco Toy Store Dourado(a) (Brandille)	30	9	17	12	40.81	5	2026-04-25 10:25:09	2026-04-25 10:25:09
3531	Cueca Seda Amarelo(a) (Boboi)	27	10	7	2	21.08	4	2026-04-25 10:25:09	2026-04-25 10:25:09
3532	Sunga Casual Preto(a) (Mundo Pet)	5	18	3	8	82.88	23	2026-04-25 10:25:09	2026-04-25 10:25:09
3533	Top Ajustável Lilás (Zoe Kids)	1	20	16	10	48.38	31	2026-04-25 10:25:09	2026-04-25 10:25:09
3534	Sunga Básico(a) Bege (Conjunto Infantil)	4	18	14	5	42.78	10	2026-04-25 10:25:09	2026-04-25 10:25:09
3535	Top Saja Marrom (Colcci Kids)	26	20	13	11	82.80	9	2026-04-25 10:25:09	2026-04-25 10:25:09
3536	Maiô Longa Lilás (Kily)	21	13	16	14	25.58	17	2026-04-25 10:25:09	2026-04-25 10:25:09
3537	Maiô Labubu Laranja (Zoe Kids)	18	13	11	9	26.93	31	2026-04-25 10:25:09	2026-04-25 10:25:09
3538	Sunga Curto(a) Branco(a) (Conjunto Infantil)	9	18	4	1	76.90	10	2026-04-25 10:25:09	2026-04-25 10:25:09
3539	Calcinha Formal Cinza (Disney Baby)	16	6	8	2	89.50	12	2026-04-25 10:25:09	2026-04-25 10:25:09
3540	Jaqueta Temático(a) Vinho (Colcci Kids)	29	11	19	17	117.49	9	2026-04-25 10:25:09	2026-04-25 10:25:09
3541	Macacão Casual Prata (Lilica Ripilica)	5	12	18	3	16.97	19	2026-04-25 10:25:09	2026-04-25 10:25:09
3542	Top Animal Print Roxo(a) (Riachuelo Kids)	3	20	12	3	75.23	29	2026-04-25 10:25:09	2026-04-25 10:25:09
3543	Macacão Longa Rosa Choque (Mundo Infantil)	21	12	10	10	38.45	22	2026-04-25 10:25:09	2026-04-25 10:25:09
3544	Jaqueta Temático(a) Marrom (Ki Carinho)	29	11	13	2	16.85	16	2026-04-25 10:25:09	2026-04-25 10:25:09
3545	Calça Labubu Turquesa (Brandille)	18	5	15	13	60.73	5	2026-04-25 10:25:09	2026-04-25 10:25:09
3546	Cueca Confortável Prata (Dafiti Kids)	8	10	18	13	99.99	11	2026-04-25 10:25:09	2026-04-25 10:25:09
3547	Calçado Elástico(a) Dourado(a) (Akazys)	11	4	17	16	81.33	2	2026-04-25 10:25:09	2026-04-25 10:25:09
3548	Jaqueta Elástico(a) Vinho (Lacoste Kids)	11	11	19	10	107.11	18	2026-04-25 10:25:09	2026-04-25 10:25:09
3549	Pijama Colorido(a) Branco(a) (Salsa Jeans Kids)	7	15	4	10	109.86	30	2026-04-25 10:25:09	2026-04-25 10:25:09
3550	Bermuda Leve Rosa Choque (Puket Kids)	19	1	10	3	97.18	27	2026-04-25 10:25:09	2026-04-25 10:25:09
3551	Calçado Seda Azul (Conjunto Infantil)	27	4	1	14	107.24	10	2026-04-25 10:25:09	2026-04-25 10:25:09
3552	Casaco Clássico(a) Vinho (Brandille)	6	9	19	1	87.03	5	2026-04-25 10:25:09	2026-04-25 10:25:09
3553	Casaco Respirável Dourado(a) (Adidas Kids)	25	9	17	3	45.19	1	2026-04-25 10:25:09	2026-04-25 10:25:09
3554	Maiô Jeans Azul (C&A Kids)	17	13	1	17	17.42	7	2026-04-25 10:25:09	2026-04-25 10:25:09
3555	Calcinha Moleton Prata (Renner Kids)	23	6	18	8	109.48	28	2026-04-25 10:25:09	2026-04-25 10:25:09
3556	Camisa Elástico(a) Preto(a) (Riachuelo Kids)	11	7	3	8	40.70	29	2026-04-25 10:25:09	2026-04-25 10:25:09
3557	Sutiã Leve Vinho (Ki Carinho)	19	19	19	7	68.41	16	2026-04-25 10:25:09	2026-04-25 10:25:09
3558	Casaco Casual Vermelho(a) (Renner Kids)	5	9	6	19	19.44	28	2026-04-25 10:25:09	2026-04-25 10:25:09
3559	Meia Floral Prata (Maria Filó Kids)	15	14	18	8	115.09	20	2026-04-25 10:25:09	2026-04-25 10:25:09
3560	Calçado Stitch Rosa (Marisol)	28	4	2	14	45.43	21	2026-04-25 10:25:09	2026-04-25 10:25:09
3561	Camisa Curto(a) Azul Escuro(a) (Colcci Kids)	9	7	9	19	30.36	9	2026-04-25 10:25:09	2026-04-25 10:25:09
3562	Cueca Seda Lilás (Lilica Ripilica)	27	10	16	1	88.98	19	2026-04-25 10:25:09	2026-04-25 10:25:09
3563	Biquine Xadrez Prata (Bendita Cute)	32	2	18	15	62.68	3	2026-04-25 10:25:09	2026-04-25 10:25:09
3564	Maiô Temático(a) Vinho (Petit Royal)	29	13	19	18	59.23	25	2026-04-25 10:25:09	2026-04-25 10:25:09
3565	Saia Elástico(a) Branco(a) (Farm Kids)	11	16	4	18	85.80	14	2026-04-25 10:25:09	2026-04-25 10:25:09
3566	Camiseta Fit Vinho (Marisol)	14	8	19	18	44.08	21	2026-04-25 10:25:09	2026-04-25 10:25:09
3567	Calça Poliéster Verde (Lacoste Kids)	24	5	5	15	61.64	18	2026-04-25 10:25:09	2026-04-25 10:25:09
3568	Maiô Curto(a) Cinza (Adidas Kids)	9	13	8	4	100.61	1	2026-04-25 10:25:09	2026-04-25 10:25:09
3569	Macacão Seda Roxo(a) (Renner Kids)	27	12	12	1	46.56	28	2026-04-25 10:25:09	2026-04-25 10:25:09
3570	Meia Stitch Lilás (Mundo Pet)	28	14	16	13	101.47	23	2026-04-25 10:25:09	2026-04-25 10:25:09
3571	Macacão Seda Vermelho(a) (Marisol)	27	12	6	5	40.10	21	2026-04-25 10:25:09	2026-04-25 10:25:09
3572	Macacão Básico(a) Azul (Osklen Kids)	4	12	1	7	35.97	24	2026-04-25 10:25:09	2026-04-25 10:25:09
3573	Blusa Listrado Cáqui (Osklen Kids)	20	3	20	1	85.71	24	2026-04-25 10:25:09	2026-04-25 10:25:09
3574	Bermuda Seda Rosa (Kily)	27	1	2	19	95.16	17	2026-04-25 10:25:09	2026-04-25 10:25:09
3575	Sunga Floral Turquesa (Kily)	15	18	15	12	19.39	17	2026-04-25 10:25:09	2026-04-25 10:25:09
3576	Jaqueta Esportivo(a) Vermelho(a) (Puket Kids)	12	11	6	1	101.83	27	2026-04-25 10:25:09	2026-04-25 10:25:09
3577	Blusa Colorido(a) Azul Escuro(a) (Renner Kids)	7	3	9	18	50.84	28	2026-04-25 10:25:09	2026-04-25 10:25:09
3578	Calça Seda Dourado(a) (Osklen Kids)	27	5	17	2	24.74	24	2026-04-25 10:25:09	2026-04-25 10:25:09
3579	Calcinha Turma da Mônica Roxo(a) (Puket Kids)	31	6	12	16	33.37	27	2026-04-25 10:25:09	2026-04-25 10:25:09
3580	Short Elástico(a) Lilás (Mundo Infantil)	11	17	16	3	54.51	22	2026-04-25 10:25:09	2026-04-25 10:25:09
3581	Calça Curto(a) Azul (Maria Filó Kids)	9	5	1	5	48.55	20	2026-04-25 10:25:09	2026-04-25 10:25:09
3582	Camisa Labubu Cáqui (Ki Carinho)	18	7	20	10	56.62	16	2026-04-25 10:25:09	2026-04-25 10:25:09
3583	Top Listrado Azul Escuro(a) (Hering Kids)	20	20	9	12	71.28	15	2026-04-25 10:25:09	2026-04-25 10:25:09
3584	Camiseta Turma da Mônica Lilás (Ki Carinho)	31	8	16	5	98.55	16	2026-04-25 10:25:09	2026-04-25 10:25:09
3585	Vestido Jeans Bege (Akazys)	17	21	14	1	57.68	2	2026-04-25 10:25:09	2026-04-25 10:25:09
3586	Pijama Clássico(a) Vermelho(a) (Lacoste Kids)	6	15	6	1	81.18	18	2026-04-25 10:25:09	2026-04-25 10:25:09
3587	Top Floral Branco(a) (Farm Kids)	15	20	4	13	23.96	14	2026-04-25 10:25:09	2026-04-25 10:25:09
3588	Top Jeans Amarelo(a) (Farm Kids)	17	20	7	3	85.96	14	2026-04-25 10:25:09	2026-04-25 10:25:09
3589	Bermuda Respirável Prata (Riachuelo Kids)	25	1	18	16	44.88	29	2026-04-25 10:25:09	2026-04-25 10:25:09
3590	Bermuda Curto(a) Lilás (Conjunto Infantil)	9	1	16	11	24.52	10	2026-04-25 10:25:09	2026-04-25 10:25:09
3591	Pijama Elástico(a) Vermelho(a) (Puket Kids)	11	15	6	5	27.62	27	2026-04-25 10:25:09	2026-04-25 10:25:09
3592	Cueca Longa Vermelho(a) (Carters)	21	10	6	8	24.94	8	2026-04-25 10:25:09	2026-04-25 10:25:09
3593	Sunga Seda Branco(a) (C&A Baby)	27	18	4	6	100.35	6	2026-04-25 10:25:09	2026-04-25 10:25:09
3594	Meia Esportivo(a) Verde (Brandille)	12	14	5	18	40.70	5	2026-04-25 10:25:09	2026-04-25 10:25:09
3595	Pijama Formal Dourado(a) (C&A Baby)	16	15	17	18	113.72	6	2026-04-25 10:25:09	2026-04-25 10:25:09
3596	Sutiã Stitch Vinho (Marisol)	28	19	19	13	73.74	21	2026-04-25 10:25:09	2026-04-25 10:25:09
3597	Macacão Xadrez Amarelo(a) (Colcci Kids)	32	12	7	12	67.96	9	2026-04-25 10:25:09	2026-04-25 10:25:09
3598	Sunga Seda Preto(a) (Osklen Kids)	27	18	3	17	100.78	24	2026-04-25 10:25:09	2026-04-25 10:25:09
3599	Pijama Estampado(a) Turquesa (Hering Kids)	13	15	15	11	32.82	15	2026-04-25 10:25:09	2026-04-25 10:25:09
3600	Pijama Respirável Verde (Akazys)	25	15	5	19	86.91	2	2026-04-25 10:25:09	2026-04-25 10:25:09
3601	Cueca Algodão Cáqui (Salsa Jeans Kids)	2	10	20	7	21.92	30	2026-04-25 10:25:09	2026-04-25 10:25:09
3602	Pijama Ajustável Vinho (Boboi)	1	15	19	8	107.32	4	2026-04-25 10:25:09	2026-04-25 10:25:09
3603	Vestido Leve Turquesa (Bendita Cute)	19	21	15	6	77.20	3	2026-04-25 10:25:09	2026-04-25 10:25:09
3604	Cueca Loney Tunes Vermelho(a) (Lilica Ripilica)	22	10	6	18	30.34	19	2026-04-25 10:25:09	2026-04-25 10:25:09
3605	Bermuda Algodão Branco(a) (Lacoste Kids)	2	1	4	11	13.69	18	2026-04-25 10:25:09	2026-04-25 10:25:09
3606	Meia Durável Cinza (Disney Baby)	10	14	8	9	103.55	12	2026-04-25 10:25:09	2026-04-25 10:25:09
3607	Maiô Saja Vermelho(a) (Disney Kids)	26	13	6	18	12.39	13	2026-04-25 10:25:09	2026-04-25 10:25:09
3608	Casaco Durável Vermelho(a) (C&A Kids)	10	9	6	18	101.73	7	2026-04-25 10:25:09	2026-04-25 10:25:09
3609	Bermuda Stitch Cáqui (Marisol)	28	1	20	1	105.19	21	2026-04-25 10:25:09	2026-04-25 10:25:09
3610	Calçado Confortável Preto(a) (C&A Baby)	8	4	3	9	97.08	6	2026-04-25 10:25:09	2026-04-25 10:25:09
3611	Camisa Casual Vermelho(a) (Lilica Ripilica)	5	7	6	4	58.03	19	2026-04-25 10:25:09	2026-04-25 10:25:09
3612	Top Curto(a) Cáqui (Pimpolho)	9	20	20	9	57.11	26	2026-04-25 10:25:09	2026-04-25 10:25:09
3613	Meia Labubu Lilás (Ki Carinho)	18	14	16	8	50.35	16	2026-04-25 10:25:09	2026-04-25 10:25:09
3614	Bermuda Clássico(a) Branco(a) (Disney Kids)	6	1	4	1	33.36	13	2026-04-25 10:25:09	2026-04-25 10:25:09
3615	Macacão Moleton Prata (Marisol)	23	12	18	12	115.80	21	2026-04-25 10:25:09	2026-04-25 10:25:09
3616	Calçado Xadrez Rosa Choque (Puket Kids)	32	4	10	14	38.84	27	2026-04-25 10:25:09	2026-04-25 10:25:09
3617	Sutiã Algodão Dourado(a) (Zoe Kids)	2	19	17	6	36.63	31	2026-04-25 10:25:09	2026-04-25 10:25:09
3618	Cueca Leve Amarelo(a) (Conjunto Infantil)	19	10	7	1	19.27	10	2026-04-25 10:25:09	2026-04-25 10:25:09
3619	Calçado Temático(a) Bege (Conjunto Infantil)	29	4	14	3	109.87	10	2026-04-25 10:25:09	2026-04-25 10:25:09
3620	Sutiã Seda Verde (Colcci Kids)	27	19	5	4	70.48	9	2026-04-25 10:25:09	2026-04-25 10:25:09
3621	Cueca Labubu Lilás (Kily)	18	10	16	2	18.94	17	2026-04-25 10:25:09	2026-04-25 10:25:09
3622	Vestido Animal Print Rosa (Lacoste Kids)	3	21	2	2	43.04	18	2026-04-25 10:25:09	2026-04-25 10:25:09
3623	Top Esportivo(a) Preto(a) (Ki Carinho)	12	20	3	18	98.56	16	2026-04-25 10:25:09	2026-04-25 10:25:09
3624	Top Leve Bege (Mundo Infantil)	19	20	14	9	87.63	22	2026-04-25 10:25:09	2026-04-25 10:25:09
3625	Biquine Algodão Azul Escuro(a) (Mundo Infantil)	2	2	9	6	81.96	22	2026-04-25 10:25:09	2026-04-25 10:25:09
3626	Calçado Algodão Amarelo(a) (Hering Kids)	2	4	7	5	75.71	15	2026-04-25 10:25:09	2026-04-25 10:25:09
3627	Sutiã Longa Vermelho(a) (Mundo Infantil)	21	19	6	14	26.58	22	2026-04-25 10:25:09	2026-04-25 10:25:09
3628	Calcinha Labubu Roxo(a) (Mundo Infantil)	18	6	12	16	17.10	22	2026-04-25 10:25:09	2026-04-25 10:25:09
3629	Calça Listrado Azul (Renner Kids)	20	5	1	15	30.36	28	2026-04-25 10:25:09	2026-04-25 10:25:09
3630	Casaco Seda Azul Escuro(a) (Riachuelo Kids)	27	9	9	13	33.91	29	2026-04-25 10:25:09	2026-04-25 10:25:09
3631	Sunga Moleton Rosa (Riachuelo Kids)	23	18	2	16	104.03	29	2026-04-25 10:25:09	2026-04-25 10:25:09
3632	Short Confortável Preto(a) (Disney Baby)	8	17	3	7	26.11	12	2026-04-25 10:25:09	2026-04-25 10:25:09
3633	Pijama Loney Tunes Prata (Hering Kids)	22	15	18	19	65.53	15	2026-04-25 10:25:09	2026-04-25 10:25:09
3634	Maiô Durável Laranja (Riachuelo Kids)	10	13	11	13	86.59	29	2026-04-25 10:25:09	2026-04-25 10:25:09
3635	Calçado Respirável Rosa Choque (Zoe Kids)	25	4	10	15	58.04	31	2026-04-25 10:25:09	2026-04-25 10:25:09
3636	Blusa Longa Rosa Choque (Maria Filó Kids)	21	3	10	17	77.21	20	2026-04-25 10:25:09	2026-04-25 10:25:09
3637	Camisa Colorido(a) Verde (Maria Filó Kids)	7	7	5	2	69.76	20	2026-04-25 10:25:09	2026-04-25 10:25:09
3638	Pijama Estampado(a) Rosa (Riachuelo Kids)	13	15	2	18	34.12	29	2026-04-25 10:25:09	2026-04-25 10:25:09
3639	Saia Poliéster Cáqui (Conjunto Infantil)	24	16	20	7	90.33	10	2026-04-25 10:25:09	2026-04-25 10:25:09
3640	Camisa Clássico(a) Rosa Choque (Colcci Kids)	6	7	10	8	75.17	9	2026-04-25 10:25:09	2026-04-25 10:25:09
3641	Macacão Respirável Cáqui (Boboi)	25	12	20	19	118.88	4	2026-04-25 10:25:09	2026-04-25 10:25:09
3642	Meia Poliéster Roxo(a) (Riachuelo Kids)	24	14	12	11	19.66	29	2026-04-25 10:25:09	2026-04-25 10:25:09
3643	Calçado Labubu Laranja (Riachuelo Kids)	18	4	11	19	69.07	29	2026-04-25 10:25:09	2026-04-25 10:25:09
3644	Maiô Elástico(a) Vinho (Conjunto Infantil)	11	13	19	2	21.83	10	2026-04-25 10:25:09	2026-04-25 10:25:09
3645	Camisa Leve Amarelo(a) (Riachuelo Kids)	19	7	7	5	61.46	29	2026-04-25 10:25:09	2026-04-25 10:25:09
3646	Calcinha Confortável Cáqui (Adidas Kids)	8	6	20	8	97.64	1	2026-04-25 10:25:09	2026-04-25 10:25:09
3647	Saia Colorido(a) Azul (Dafiti Kids)	7	16	1	1	66.00	11	2026-04-25 10:25:09	2026-04-25 10:25:09
3648	Meia Estampado(a) Cáqui (Marisol)	13	14	20	9	19.64	21	2026-04-25 10:25:09	2026-04-25 10:25:09
3649	Macacão Longa Vermelho(a) (Puket Kids)	21	12	6	5	78.41	27	2026-04-25 10:25:09	2026-04-25 10:25:09
3650	Top Fit Cáqui (Riachuelo Kids)	14	20	20	19	17.55	29	2026-04-25 10:25:09	2026-04-25 10:25:09
3651	Calçado Toy Store Vermelho(a) (Osklen Kids)	30	4	6	4	31.62	24	2026-04-25 10:25:09	2026-04-25 10:25:09
3652	Cueca Moleton Cáqui (Dafiti Kids)	23	10	20	14	13.11	11	2026-04-25 10:25:09	2026-04-25 10:25:09
3653	Calçado Colorido(a) Cinza (Farm Kids)	7	4	8	4	63.43	14	2026-04-25 10:25:09	2026-04-25 10:25:09
3654	Biquine Turma da Mônica Bege (Disney Kids)	31	2	14	17	115.72	13	2026-04-25 10:25:09	2026-04-25 10:25:09
3655	Casaco Algodão Vinho (Zoe Kids)	2	9	19	8	43.40	31	2026-04-25 10:25:09	2026-04-25 10:25:09
3656	Pijama Esportivo(a) Rosa (Bendita Cute)	12	15	2	12	94.25	3	2026-04-25 10:25:09	2026-04-25 10:25:09
3657	Jaqueta Floral Roxo(a) (Boboi)	15	11	12	14	12.26	4	2026-04-25 10:25:09	2026-04-25 10:25:09
3658	Pijama Algodão Roxo(a) (Renner Kids)	2	15	12	11	43.51	28	2026-04-25 10:25:09	2026-04-25 10:25:09
3659	Calça Elástico(a) Verde (Puket Kids)	11	5	5	15	62.25	27	2026-04-25 10:25:09	2026-04-25 10:25:09
3660	Calcinha Colorido(a) Marrom (Maria Filó Kids)	7	6	13	7	10.81	20	2026-04-25 10:25:09	2026-04-25 10:25:09
3662	Calçado Curto(a) Prata (Marisol)	9	4	18	19	70.88	21	2026-04-25 10:25:09	2026-04-25 10:25:09
3663	Calça Loney Tunes Rosa (Disney Kids)	22	5	2	7	44.92	13	2026-04-25 10:25:09	2026-04-25 10:25:09
3664	Maiô Durável Rosa Choque (C&A Baby)	10	13	10	9	111.08	6	2026-04-25 10:25:09	2026-04-25 10:25:09
3665	Short Listrado Marrom (Riachuelo Kids)	20	17	13	14	75.02	29	2026-04-25 10:25:09	2026-04-25 10:25:09
3666	Casaco Elástico(a) Dourado(a) (Boboi)	11	9	17	8	60.17	4	2026-04-25 10:25:09	2026-04-25 10:25:09
3667	Cueca Seda Vinho (Brandille)	27	10	19	11	39.53	5	2026-04-25 10:25:09	2026-04-25 10:25:09
3668	Vestido Seda Roxo(a) (Bendita Cute)	27	21	12	6	67.60	3	2026-04-25 10:25:09	2026-04-25 10:25:09
3669	Calcinha Algodão Cáqui (Farm Kids)	2	6	20	12	114.04	14	2026-04-25 10:25:09	2026-04-25 10:25:09
3670	Meia Esportivo(a) Lilás (Farm Kids)	12	14	16	13	18.53	14	2026-04-25 10:25:09	2026-04-25 10:25:09
3671	Bermuda Temático(a) Turquesa (Brandille)	29	1	15	4	69.87	5	2026-04-25 10:25:09	2026-04-25 10:25:09
3672	Camiseta Esportivo(a) Vinho (Lacoste Kids)	12	8	19	17	34.94	18	2026-04-25 10:25:09	2026-04-25 10:25:09
3673	Camisa Ajustável Prata (Zoe Kids)	1	7	18	1	49.05	31	2026-04-25 10:25:09	2026-04-25 10:25:09
3674	Calça Estampado(a) Vinho (Disney Kids)	13	5	19	10	10.70	13	2026-04-25 10:25:09	2026-04-25 10:25:09
3675	Calça Jeans Prata (Petit Royal)	17	5	18	5	40.71	25	2026-04-25 10:25:09	2026-04-25 10:25:09
3676	Jaqueta Esportivo(a) Cinza (Adidas Kids)	12	11	8	15	59.79	1	2026-04-25 10:25:09	2026-04-25 10:25:09
3677	Biquine Leve Laranja (Riachuelo Kids)	19	2	11	15	58.67	29	2026-04-25 10:25:09	2026-04-25 10:25:09
3678	Blusa Clássico(a) Cinza (Lacoste Kids)	6	3	8	8	105.56	18	2026-04-25 10:25:09	2026-04-25 10:25:09
3679	Maiô Longa Vermelho(a) (Boboi)	21	13	6	1	30.00	4	2026-04-25 10:25:09	2026-04-25 10:25:09
3680	Camisa Estampado(a) Rosa (Lilica Ripilica)	13	7	2	13	115.98	19	2026-04-25 10:25:09	2026-04-25 10:25:09
3681	Calcinha Respirável Azul Escuro(a) (Pimpolho)	25	6	9	12	15.36	26	2026-04-25 10:25:09	2026-04-25 10:25:09
3682	Macacão Casual Azul Escuro(a) (Brandille)	5	12	9	17	23.99	5	2026-04-25 10:25:09	2026-04-25 10:25:09
3683	Pijama Clássico(a) Vermelho(a) (Renner Kids)	6	15	6	11	76.95	28	2026-04-25 10:25:09	2026-04-25 10:25:09
3684	Macacão Ajustável Preto(a) (Conjunto Infantil)	1	12	3	1	78.70	10	2026-04-25 10:25:09	2026-04-25 10:25:09
3685	Biquine Animal Print Dourado(a) (Renner Kids)	3	2	17	18	54.11	28	2026-04-25 10:25:09	2026-04-25 10:25:09
3686	Biquine Seda Amarelo(a) (Osklen Kids)	27	2	7	1	87.73	24	2026-04-25 10:25:09	2026-04-25 10:25:09
3687	Maiô Ajustável Marrom (Ki Carinho)	1	13	13	13	23.69	16	2026-04-25 10:25:09	2026-04-25 10:25:09
3688	Maiô Respirável Dourado(a) (Adidas Kids)	25	13	17	3	76.80	1	2026-04-25 10:25:09	2026-04-25 10:25:09
3689	Calçado Ajustável Amarelo(a) (Hering Kids)	1	4	7	8	99.85	15	2026-04-25 10:25:09	2026-04-25 10:25:09
3690	Meia Algodão Branco(a) (Salsa Jeans Kids)	2	14	4	8	37.00	30	2026-04-25 10:25:09	2026-04-25 10:25:09
3691	Blusa Animal Print Vinho (Bendita Cute)	3	3	19	3	95.82	3	2026-04-25 10:25:09	2026-04-25 10:25:09
3692	Pijama Saja Cinza (Mundo Pet)	26	15	8	19	83.93	23	2026-04-25 10:25:09	2026-04-25 10:25:09
3693	Saia Formal Preto(a) (Colcci Kids)	16	16	3	19	46.36	9	2026-04-25 10:25:09	2026-04-25 10:25:09
3694	Cueca Turma da Mônica Lilás (Farm Kids)	31	10	16	18	96.39	14	2026-04-25 10:25:09	2026-04-25 10:25:09
3695	Calçado Loney Tunes Marrom (Maria Filó Kids)	22	4	13	13	26.60	20	2026-04-25 10:25:09	2026-04-25 10:25:09
3696	Top Confortável Dourado(a) (Riachuelo Kids)	8	20	17	4	31.16	29	2026-04-25 10:25:09	2026-04-25 10:25:09
3697	Vestido Ajustável Laranja (Pimpolho)	1	21	11	15	18.93	26	2026-04-25 10:25:09	2026-04-25 10:25:09
3698	Calça Turma da Mônica Rosa Choque (Puket Kids)	31	5	10	8	31.29	27	2026-04-25 10:25:09	2026-04-25 10:25:09
3699	Saia Estampado(a) Dourado(a) (Petit Royal)	13	16	17	16	52.64	25	2026-04-25 10:25:09	2026-04-25 10:25:09
3700	Jaqueta Seda Rosa Choque (Farm Kids)	27	11	10	14	41.14	14	2026-04-25 10:25:09	2026-04-25 10:25:09
3701	Camiseta Saja Lilás (Lilica Ripilica)	26	8	16	17	30.32	19	2026-04-25 10:25:09	2026-04-25 10:25:09
3702	Top Listrado Turquesa (Lilica Ripilica)	20	20	15	17	101.20	19	2026-04-25 10:25:09	2026-04-25 10:25:09
3703	Calça Estampado(a) Azul (Zoe Kids)	13	5	1	14	96.56	31	2026-04-25 10:25:09	2026-04-25 10:25:09
3704	Maiô Stitch Vinho (Petit Royal)	28	13	19	12	38.88	25	2026-04-25 10:25:09	2026-04-25 10:25:09
3705	Biquine Casual Branco(a) (Kily)	5	2	4	19	32.22	17	2026-04-25 10:25:09	2026-04-25 10:25:09
3706	Camisa Ajustável Verde (Petit Royal)	1	7	5	11	14.85	25	2026-04-25 10:25:09	2026-04-25 10:25:09
3707	Saia Temático(a) Vinho (Hering Kids)	29	16	19	18	114.11	15	2026-04-25 10:25:09	2026-04-25 10:25:09
3708	Casaco Fit Roxo(a) (Salsa Jeans Kids)	14	9	12	15	77.67	30	2026-04-25 10:25:09	2026-04-25 10:25:09
3709	Jaqueta Casual Cinza (Hering Kids)	5	11	8	13	46.24	15	2026-04-25 10:25:09	2026-04-25 10:25:09
3710	Camiseta Poliéster Laranja (Riachuelo Kids)	24	8	11	15	24.44	29	2026-04-25 10:25:09	2026-04-25 10:25:09
3711	Vestido Durável Roxo(a) (Ki Carinho)	10	21	12	14	18.40	16	2026-04-25 10:25:09	2026-04-25 10:25:09
3712	Calcinha Esportivo(a) Bege (Colcci Kids)	12	6	14	10	63.02	9	2026-04-25 10:25:09	2026-04-25 10:25:09
3713	Top Curto(a) Vermelho(a) (Akazys)	9	20	6	7	85.22	2	2026-04-25 10:25:09	2026-04-25 10:25:09
3714	Biquine Ajustável Laranja (Lilica Ripilica)	1	2	11	4	64.78	19	2026-04-25 10:25:09	2026-04-25 10:25:09
3715	Bermuda Ajustável Verde (Lilica Ripilica)	1	1	5	1	102.09	19	2026-04-25 10:25:09	2026-04-25 10:25:09
3716	Cueca Fit Cinza (Kily)	14	10	8	7	92.86	17	2026-04-25 10:25:09	2026-04-25 10:25:09
3717	Bermuda Seda Marrom (Kily)	27	1	13	10	62.22	17	2026-04-25 10:25:09	2026-04-25 10:25:09
3718	Saia Estampado(a) Lilás (Boboi)	13	16	16	8	29.44	4	2026-04-25 10:25:09	2026-04-25 10:25:09
3719	Meia Saja Vinho (Renner Kids)	26	14	19	14	61.56	28	2026-04-25 10:25:09	2026-04-25 10:25:09
3720	Maiô Algodão Vermelho(a) (Maria Filó Kids)	2	13	6	4	106.90	20	2026-04-25 10:25:09	2026-04-25 10:25:09
3721	Vestido Durável Turquesa (Riachuelo Kids)	10	21	15	14	94.07	29	2026-04-25 10:25:09	2026-04-25 10:25:09
3722	Jaqueta Listrado Prata (Disney Baby)	20	11	18	17	12.72	12	2026-04-25 10:25:09	2026-04-25 10:25:09
3723	Blusa Turma da Mônica Bege (Marisol)	31	3	14	17	74.48	21	2026-04-25 10:25:09	2026-04-25 10:25:09
3724	Bermuda Fit Cinza (Kily)	14	1	8	9	55.94	17	2026-04-25 10:25:09	2026-04-25 10:25:09
3725	Biquine Formal Prata (Osklen Kids)	16	2	18	5	95.92	24	2026-04-25 10:25:09	2026-04-25 10:25:09
3726	Short Toy Store Bege (Osklen Kids)	30	17	14	10	116.78	24	2026-04-25 10:25:09	2026-04-25 10:25:09
3727	Maiô Loney Tunes Rosa (Disney Kids)	22	13	2	17	79.33	13	2026-04-25 10:25:09	2026-04-25 10:25:09
3728	Top Stitch Vinho (Lacoste Kids)	28	20	19	2	90.37	18	2026-04-25 10:25:09	2026-04-25 10:25:09
3729	Short Ajustável Amarelo(a) (Lilica Ripilica)	1	17	7	8	50.58	19	2026-04-25 10:25:09	2026-04-25 10:25:09
3730	Casaco Básico(a) Laranja (Lacoste Kids)	4	9	11	3	16.54	18	2026-04-25 10:25:09	2026-04-25 10:25:09
3731	Calça Leve Branco(a) (Brandille)	19	5	4	6	18.37	5	2026-04-25 10:25:09	2026-04-25 10:25:09
3732	Calça Confortável Preto(a) (Zoe Kids)	8	5	3	14	62.52	31	2026-04-25 10:25:09	2026-04-25 10:25:09
3733	Camisa Turma da Mônica Verde (C&A Baby)	31	7	5	13	59.30	6	2026-04-25 10:25:09	2026-04-25 10:25:09
3734	Short Animal Print Lilás (Disney Kids)	3	17	16	14	110.52	13	2026-04-25 10:25:09	2026-04-25 10:25:09
3735	Short Temático(a) Vinho (Bendita Cute)	29	17	19	17	41.61	3	2026-04-25 10:25:09	2026-04-25 10:25:09
3736	Camiseta Loney Tunes Preto(a) (Petit Royal)	22	8	3	1	40.04	25	2026-04-25 10:25:09	2026-04-25 10:25:09
3737	Sunga Turma da Mônica Bege (Riachuelo Kids)	31	18	14	6	21.09	29	2026-04-25 10:25:09	2026-04-25 10:25:09
3738	Jaqueta Confortável Preto(a) (Carters)	8	11	3	4	66.85	8	2026-04-25 10:25:09	2026-04-25 10:25:09
3739	Blusa Leve Lilás (Disney Kids)	19	3	16	5	46.86	13	2026-04-25 10:25:09	2026-04-25 10:25:09
3740	Jaqueta Stitch Rosa (C&A Baby)	28	11	2	15	11.88	6	2026-04-25 10:25:09	2026-04-25 10:25:09
3741	Short Algodão Marrom (C&A Baby)	2	17	13	11	51.20	6	2026-04-25 10:25:09	2026-04-25 10:25:09
3742	Maiô Casual Cáqui (Disney Baby)	5	13	20	8	100.89	12	2026-04-25 10:25:09	2026-04-25 10:25:09
3743	Saia Seda Cinza (Riachuelo Kids)	27	16	8	3	54.37	29	2026-04-25 10:25:09	2026-04-25 10:25:09
3744	Cueca Stitch Azul Escuro(a) (Riachuelo Kids)	28	10	9	19	32.99	29	2026-04-25 10:25:09	2026-04-25 10:25:09
3745	Saia Animal Print Azul Escuro(a) (Osklen Kids)	3	16	9	15	69.38	24	2026-04-25 10:25:09	2026-04-25 10:25:09
3746	Camisa Curto(a) Preto(a) (Renner Kids)	9	7	3	2	18.02	28	2026-04-25 10:25:09	2026-04-25 10:25:09
3747	Calcinha Poliéster Vermelho(a) (Farm Kids)	24	6	6	13	48.90	14	2026-04-25 10:25:09	2026-04-25 10:25:09
3748	Top Listrado Marrom (Pimpolho)	20	20	13	14	40.55	26	2026-04-25 10:25:09	2026-04-25 10:25:09
3749	Saia Xadrez Vermelho(a) (Marisol)	32	16	6	13	104.48	21	2026-04-25 10:25:09	2026-04-25 10:25:09
3750	Short Básico(a) Rosa Choque (C&A Kids)	4	17	10	4	111.75	7	2026-04-25 10:25:09	2026-04-25 10:25:09
3751	Camiseta Confortável Roxo(a) (Mundo Infantil)	8	8	12	1	30.27	22	2026-04-25 10:25:09	2026-04-25 10:25:09
3752	Calça Colorido(a) Preto(a) (C&A Kids)	7	5	3	9	86.68	7	2026-04-25 10:25:09	2026-04-25 10:25:09
3753	Top Casual Cáqui (Adidas Kids)	5	20	20	7	93.82	1	2026-04-25 10:25:09	2026-04-25 10:25:09
3754	Blusa Jeans Marrom (Boboi)	17	3	13	9	70.44	4	2026-04-25 10:25:09	2026-04-25 10:25:09
3755	Pijama Elástico(a) Cáqui (C&A Baby)	11	15	20	18	89.25	6	2026-04-25 10:25:09	2026-04-25 10:25:09
3756	Calça Leve Rosa Choque (Zoe Kids)	19	5	10	3	81.29	31	2026-04-25 10:25:09	2026-04-25 10:25:09
3757	Sutiã Floral Prata (C&A Baby)	15	19	18	17	11.88	6	2026-04-25 10:25:09	2026-04-25 10:25:09
3758	Pijama Casual Preto(a) (Lilica Ripilica)	5	15	3	7	35.91	19	2026-04-25 10:25:09	2026-04-25 10:25:09
3759	Calçado Stitch Roxo(a) (Marisol)	28	4	12	7	103.54	21	2026-04-25 10:25:09	2026-04-25 10:25:09
3760	Camiseta Algodão Turquesa (Carters)	2	8	15	6	118.76	8	2026-04-25 10:25:09	2026-04-25 10:25:09
3761	Sunga Listrado Marrom (Maria Filó Kids)	20	18	13	10	119.99	20	2026-04-25 10:25:09	2026-04-25 10:25:09
3762	Camiseta Casual Turquesa (Kily)	5	8	15	7	85.47	17	2026-04-25 10:25:09	2026-04-25 10:25:09
3763	Sutiã Temático(a) Turquesa (C&A Kids)	29	19	15	2	77.34	7	2026-04-25 10:25:09	2026-04-25 10:25:09
3764	Short Temático(a) Azul (Puket Kids)	29	17	1	14	82.82	27	2026-04-25 10:25:09	2026-04-25 10:25:09
3765	Vestido Loney Tunes Bege (Disney Kids)	22	21	14	9	29.48	13	2026-04-25 10:25:09	2026-04-25 10:25:09
3766	Top Stitch Amarelo(a) (Lilica Ripilica)	28	20	7	3	109.47	19	2026-04-25 10:25:09	2026-04-25 10:25:09
3767	Pijama Durável Vermelho(a) (Pimpolho)	10	15	6	7	62.14	26	2026-04-25 10:25:09	2026-04-25 10:25:09
3768	Blusa Curto(a) Verde (Marisol)	9	3	5	1	107.87	21	2026-04-25 10:25:09	2026-04-25 10:25:09
3769	Maiô Casual Amarelo(a) (Dafiti Kids)	5	13	7	3	108.03	11	2026-04-25 10:25:09	2026-04-25 10:25:09
3770	Saia Saja Azul Escuro(a) (Brandille)	26	16	9	2	93.68	5	2026-04-25 10:25:09	2026-04-25 10:25:09
3771	Cueca Poliéster Branco(a) (Farm Kids)	24	10	4	13	86.64	14	2026-04-25 10:25:09	2026-04-25 10:25:09
3772	Maiô Longa Marrom (Farm Kids)	21	13	13	14	41.75	14	2026-04-25 10:25:09	2026-04-25 10:25:09
3773	Jaqueta Leve Dourado(a) (Ki Carinho)	19	11	17	11	110.25	16	2026-04-25 10:25:09	2026-04-25 10:25:09
3774	Biquine Xadrez Branco(a) (Carters)	32	2	4	11	46.38	8	2026-04-25 10:25:09	2026-04-25 10:25:09
3775	Calcinha Leve Amarelo(a) (Petit Royal)	19	6	7	7	52.22	25	2026-04-25 10:25:09	2026-04-25 10:25:09
3776	Cueca Fit Preto(a) (Petit Royal)	14	10	3	19	101.31	25	2026-04-25 10:25:09	2026-04-25 10:25:09
3777	Vestido Loney Tunes Lilás (Mundo Pet)	22	21	16	7	98.86	23	2026-04-25 10:25:09	2026-04-25 10:25:09
3778	Cueca Stitch Turquesa (Akazys)	28	10	15	9	46.63	2	2026-04-25 10:25:09	2026-04-25 10:25:09
3779	Vestido Durável Azul (Marisol)	10	21	1	4	56.17	21	2026-04-25 10:25:09	2026-04-25 10:25:09
3780	Biquine Floral Vermelho(a) (Adidas Kids)	15	2	6	13	79.34	1	2026-04-25 10:25:09	2026-04-25 10:25:09
3781	Vestido Básico(a) Bege (Zoe Kids)	4	21	14	13	50.51	31	2026-04-25 10:25:09	2026-04-25 10:25:09
3782	Camiseta Temático(a) Marrom (Dafiti Kids)	29	8	13	6	96.90	11	2026-04-25 10:25:09	2026-04-25 10:25:09
3783	Blusa Moleton Cinza (C&A Baby)	23	3	8	16	89.08	6	2026-04-25 10:25:09	2026-04-25 10:25:09
3784	Camisa Formal Vinho (Lacoste Kids)	16	7	19	13	114.63	18	2026-04-25 10:25:09	2026-04-25 10:25:09
3785	Biquine Casual Amarelo(a) (Puket Kids)	5	2	7	3	65.73	27	2026-04-25 10:25:09	2026-04-25 10:25:09
3786	Maiô Floral Laranja (Conjunto Infantil)	15	13	11	2	100.95	10	2026-04-25 10:25:09	2026-04-25 10:25:09
3787	Meia Básico(a) Bege (Carters)	4	14	14	3	75.08	8	2026-04-25 10:25:09	2026-04-25 10:25:09
3788	Sunga Toy Store Cinza (Petit Royal)	30	18	8	5	116.20	25	2026-04-25 10:25:09	2026-04-25 10:25:09
3789	Jaqueta Esportivo(a) Azul (Ki Carinho)	12	11	1	16	100.84	16	2026-04-25 10:25:09	2026-04-25 10:25:09
3790	Jaqueta Animal Print Cinza (Farm Kids)	3	11	8	19	91.07	14	2026-04-25 10:25:09	2026-04-25 10:25:09
3791	Vestido Moleton Prata (Farm Kids)	23	21	18	9	21.28	14	2026-04-25 10:25:09	2026-04-25 10:25:09
3792	Jaqueta Leve Roxo(a) (Ki Carinho)	19	11	12	10	25.88	16	2026-04-25 10:25:09	2026-04-25 10:25:09
3793	Maiô Moleton Vermelho(a) (Carters)	23	13	6	15	15.98	8	2026-04-25 10:25:09	2026-04-25 10:25:09
3794	Bermuda Formal Turquesa (Disney Kids)	16	1	15	4	91.66	13	2026-04-25 10:25:09	2026-04-25 10:25:09
3795	Sutiã Listrado Branco(a) (Lilica Ripilica)	20	19	4	5	40.47	19	2026-04-25 10:25:09	2026-04-25 10:25:09
3796	Jaqueta Fit Branco(a) (Disney Kids)	14	11	4	4	28.76	13	2026-04-25 10:25:09	2026-04-25 10:25:09
3797	Calçado Colorido(a) Bege (Mundo Pet)	7	4	14	7	118.63	23	2026-04-25 10:25:09	2026-04-25 10:25:09
3798	Vestido Leve Amarelo(a) (Petit Royal)	19	21	7	17	29.06	25	2026-04-25 10:25:09	2026-04-25 10:25:09
3799	Jaqueta Colorido(a) Azul Escuro(a) (Puket Kids)	7	11	9	19	19.14	27	2026-04-25 10:25:09	2026-04-25 10:25:09
3800	Meia Casual Vinho (Conjunto Infantil)	5	14	19	16	113.77	10	2026-04-25 10:25:09	2026-04-25 10:25:09
3801	Pijama Saja Turquesa (Renner Kids)	26	15	15	19	114.51	28	2026-04-25 10:25:09	2026-04-25 10:25:09
3802	Saia Stitch Amarelo(a) (Lacoste Kids)	28	16	7	11	17.68	18	2026-04-25 10:25:09	2026-04-25 10:25:09
3803	Sutiã Floral Azul Escuro(a) (Riachuelo Kids)	15	19	9	17	97.68	29	2026-04-25 10:25:09	2026-04-25 10:25:09
3804	Saia Jeans Dourado(a) (Marisol)	17	16	17	1	115.08	21	2026-04-25 10:25:09	2026-04-25 10:25:09
3805	Top Respirável Bege (Farm Kids)	25	20	14	14	18.37	14	2026-04-25 10:25:09	2026-04-25 10:25:09
3806	Camiseta Seda Rosa (Maria Filó Kids)	27	8	2	14	100.52	20	2026-04-25 10:25:09	2026-04-25 10:25:09
3807	Short Curto(a) Roxo(a) (Mundo Infantil)	9	17	12	5	93.99	22	2026-04-25 10:25:09	2026-04-25 10:25:09
3808	Casaco Durável Rosa Choque (Osklen Kids)	10	9	10	5	23.61	24	2026-04-25 10:25:09	2026-04-25 10:25:09
3809	Biquine Saja Rosa Choque (Bendita Cute)	26	2	10	19	47.11	3	2026-04-25 10:25:09	2026-04-25 10:25:09
3810	Bermuda Durável Azul Escuro(a) (Riachuelo Kids)	10	1	9	19	108.74	29	2026-04-25 10:25:09	2026-04-25 10:25:09
3811	Camiseta Casual Branco(a) (Lilica Ripilica)	5	8	4	10	116.20	19	2026-04-25 10:25:09	2026-04-25 10:25:09
3812	Casaco Jeans Rosa Choque (Lacoste Kids)	17	9	10	8	82.07	18	2026-04-25 10:25:09	2026-04-25 10:25:09
3813	Jaqueta Algodão Verde (Riachuelo Kids)	2	11	5	12	105.32	29	2026-04-25 10:25:09	2026-04-25 10:25:09
3814	Casaco Poliéster Verde (Akazys)	24	9	5	6	76.07	2	2026-04-25 10:25:09	2026-04-25 10:25:09
3815	Maiô Formal Rosa (Maria Filó Kids)	16	13	2	12	17.78	20	2026-04-25 10:25:09	2026-04-25 10:25:09
3816	Calçado Clássico(a) Cáqui (Disney Baby)	6	4	20	16	60.12	12	2026-04-25 10:25:09	2026-04-25 10:25:09
3817	Bermuda Labubu Vermelho(a) (Puket Kids)	18	1	6	3	34.57	27	2026-04-25 10:25:09	2026-04-25 10:25:09
3818	Calcinha Elástico(a) Preto(a) (Marisol)	11	6	3	12	19.13	21	2026-04-25 10:25:09	2026-04-25 10:25:09
3819	Saia Saja Laranja (Petit Royal)	26	16	11	2	27.90	25	2026-04-25 10:25:09	2026-04-25 10:25:09
3820	Saia Animal Print Lilás (Pimpolho)	3	16	16	5	54.10	26	2026-04-25 10:25:09	2026-04-25 10:25:09
3821	Calçado Curto(a) Marrom (Marisol)	9	4	13	2	59.04	21	2026-04-25 10:25:09	2026-04-25 10:25:09
3822	Calçado Animal Print Laranja (Conjunto Infantil)	3	4	11	1	90.03	10	2026-04-25 10:25:09	2026-04-25 10:25:09
3823	Calçado Xadrez Roxo(a) (Kily)	32	4	12	17	39.35	17	2026-04-25 10:25:09	2026-04-25 10:25:09
3824	Macacão Formal Preto(a) (Adidas Kids)	16	12	3	6	91.94	1	2026-04-25 10:25:09	2026-04-25 10:25:09
3825	Camisa Floral Azul Escuro(a) (Ki Carinho)	15	7	9	18	27.93	16	2026-04-25 10:25:09	2026-04-25 10:25:09
3826	Calça Longa Dourado(a) (Colcci Kids)	21	5	17	1	101.02	9	2026-04-25 10:25:09	2026-04-25 10:25:09
3827	Short Clássico(a) Marrom (Conjunto Infantil)	6	17	13	11	119.75	10	2026-04-25 10:25:09	2026-04-25 10:25:09
3828	Pijama Fit Amarelo(a) (Carters)	14	15	7	14	49.10	8	2026-04-25 10:25:09	2026-04-25 10:25:09
3829	Blusa Respirável Dourado(a) (Colcci Kids)	25	3	17	5	85.40	9	2026-04-25 10:25:09	2026-04-25 10:25:09
3830	Sunga Algodão Roxo(a) (Conjunto Infantil)	2	18	12	9	117.15	10	2026-04-25 10:25:09	2026-04-25 10:25:09
3831	Saia Seda Prata (Petit Royal)	27	16	18	5	99.23	25	2026-04-25 10:25:09	2026-04-25 10:25:09
3832	Saia Floral Lilás (Carters)	15	16	16	2	86.16	8	2026-04-25 10:25:09	2026-04-25 10:25:09
3833	Biquine Labubu Dourado(a) (Farm Kids)	18	2	17	11	81.05	14	2026-04-25 10:25:09	2026-04-25 10:25:09
3834	Blusa Fit Prata (Adidas Kids)	14	3	18	15	12.69	1	2026-04-25 10:25:09	2026-04-25 10:25:09
3835	Cueca Algodão Rosa (Dafiti Kids)	2	10	2	11	54.44	11	2026-04-25 10:25:09	2026-04-25 10:25:09
3836	Camiseta Poliéster Cáqui (C&A Baby)	24	8	20	4	58.38	6	2026-04-25 10:25:09	2026-04-25 10:25:09
3837	Pijama Ajustável Verde (Renner Kids)	1	15	5	18	31.43	28	2026-04-25 10:25:09	2026-04-25 10:25:09
3838	Meia Seda Amarelo(a) (Carters)	27	14	7	5	23.52	8	2026-04-25 10:25:09	2026-04-25 10:25:09
3839	Sutiã Longa Marrom (C&A Kids)	21	19	13	2	34.78	7	2026-04-25 10:25:09	2026-04-25 10:25:09
3840	Calcinha Ajustável Dourado(a) (Hering Kids)	1	6	17	13	39.64	15	2026-04-25 10:25:09	2026-04-25 10:25:09
3841	Short Loney Tunes Preto(a) (Colcci Kids)	22	17	3	3	13.49	9	2026-04-25 10:25:09	2026-04-25 10:25:09
3842	Short Seda Vinho (Pimpolho)	27	17	19	6	11.87	26	2026-04-25 10:25:09	2026-04-25 10:25:09
3843	Calcinha Toy Store Rosa (Puket Kids)	30	6	2	7	50.00	27	2026-04-25 10:25:09	2026-04-25 10:25:09
3844	Cueca Leve Preto(a) (Ki Carinho)	19	10	3	7	118.06	16	2026-04-25 10:25:09	2026-04-25 10:25:09
3845	Biquine Xadrez Turquesa (Ki Carinho)	32	2	15	10	113.95	16	2026-04-25 10:25:09	2026-04-25 10:25:09
3846	Maiô Casual Cáqui (Renner Kids)	5	13	20	14	32.34	28	2026-04-25 10:25:09	2026-04-25 10:25:09
3847	Maiô Jeans Cinza (Pimpolho)	17	13	8	18	83.55	26	2026-04-25 10:25:09	2026-04-25 10:25:09
3848	Pijama Moleton Azul (Hering Kids)	23	15	1	13	36.23	15	2026-04-25 10:25:09	2026-04-25 10:25:09
3849	Camisa Elástico(a) Cinza (Maria Filó Kids)	11	7	8	1	104.92	20	2026-04-25 10:25:09	2026-04-25 10:25:09
3850	Macacão Leve Dourado(a) (Renner Kids)	19	12	17	4	98.69	28	2026-04-25 10:25:09	2026-04-25 10:25:09
3851	Short Algodão Dourado(a) (Akazys)	2	17	17	18	84.52	2	2026-04-25 10:25:09	2026-04-25 10:25:09
3852	Biquine Xadrez Cinza (Maria Filó Kids)	32	2	8	7	51.62	20	2026-04-25 10:25:09	2026-04-25 10:25:09
3853	Jaqueta Fit Rosa Choque (Conjunto Infantil)	14	11	10	4	117.54	10	2026-04-25 10:25:09	2026-04-25 10:25:09
3854	Macacão Colorido(a) Branco(a) (Disney Kids)	7	12	4	12	86.40	13	2026-04-25 10:25:09	2026-04-25 10:25:09
3855	Saia Formal Cinza (Lilica Ripilica)	16	16	8	12	43.39	19	2026-04-25 10:25:09	2026-04-25 10:25:09
3856	Macacão Temático(a) Azul Escuro(a) (Renner Kids)	29	12	9	16	40.07	28	2026-04-25 10:25:09	2026-04-25 10:25:09
3857	Maiô Moleton Cinza (Osklen Kids)	23	13	8	18	63.15	24	2026-04-25 10:25:09	2026-04-25 10:25:09
3858	Camisa Leve Vermelho(a) (Osklen Kids)	19	7	6	2	109.81	24	2026-04-25 10:25:09	2026-04-25 10:25:09
3859	Calça Moleton Dourado(a) (Hering Kids)	23	5	17	14	47.74	15	2026-04-25 10:25:09	2026-04-25 10:25:09
3860	Calça Estampado(a) Rosa Choque (Disney Kids)	13	5	10	17	28.05	13	2026-04-25 10:25:09	2026-04-25 10:25:09
3861	Camiseta Elástico(a) Cáqui (Marisol)	11	8	20	15	43.25	21	2026-04-25 10:25:09	2026-04-25 10:25:09
3862	Top Loney Tunes Rosa Choque (Kily)	22	20	10	6	99.96	17	2026-04-25 10:25:09	2026-04-25 10:25:09
3863	Calça Stitch Azul (Osklen Kids)	28	5	1	15	79.60	24	2026-04-25 10:25:09	2026-04-25 10:25:09
3864	Saia Fit Preto(a) (C&A Kids)	14	16	3	8	74.29	7	2026-04-25 10:25:09	2026-04-25 10:25:09
3865	Meia Elástico(a) Verde (Zoe Kids)	11	14	5	18	71.12	31	2026-04-25 10:25:09	2026-04-25 10:25:09
3866	Macacão Longa Verde (Petit Royal)	21	12	5	4	61.52	25	2026-04-25 10:25:09	2026-04-25 10:25:09
3867	Sunga Animal Print Turquesa (Lilica Ripilica)	3	18	15	9	76.12	19	2026-04-25 10:25:09	2026-04-25 10:25:09
3868	Top Algodão Azul (Riachuelo Kids)	2	20	1	16	106.79	29	2026-04-25 10:25:09	2026-04-25 10:25:09
3869	Bermuda Durável Vermelho(a) (Colcci Kids)	10	1	6	15	99.15	9	2026-04-25 10:25:09	2026-04-25 10:25:09
3870	Calçado Seda Amarelo(a) (Puket Kids)	27	4	7	17	114.32	27	2026-04-25 10:25:09	2026-04-25 10:25:09
3871	Meia Respirável Preto(a) (Colcci Kids)	25	14	3	17	76.37	9	2026-04-25 10:25:09	2026-04-25 10:25:09
3872	Macacão Colorido(a) Prata (Marisol)	7	12	18	7	29.57	21	2026-04-25 10:25:09	2026-04-25 10:25:09
3873	Calcinha Seda Amarelo(a) (Renner Kids)	27	6	7	16	71.46	28	2026-04-25 10:25:09	2026-04-25 10:25:09
3874	Maiô Clássico(a) Amarelo(a) (Riachuelo Kids)	6	13	7	14	84.27	29	2026-04-25 10:25:09	2026-04-25 10:25:09
3875	Cueca Poliéster Cáqui (Hering Kids)	24	10	20	13	110.10	15	2026-04-25 10:25:09	2026-04-25 10:25:09
3876	Top Básico(a) Branco(a) (Hering Kids)	4	20	4	8	101.16	15	2026-04-25 10:25:09	2026-04-25 10:25:09
3877	Macacão Seda Azul (Renner Kids)	27	12	1	15	82.56	28	2026-04-25 10:25:09	2026-04-25 10:25:09
3878	Casaco Floral Bege (Petit Royal)	15	9	14	12	106.24	25	2026-04-25 10:25:09	2026-04-25 10:25:09
3879	Bermuda Toy Store Preto(a) (Boboi)	30	1	3	19	16.26	4	2026-04-25 10:25:09	2026-04-25 10:25:09
3880	Camisa Ajustável Rosa (Salsa Jeans Kids)	1	7	2	11	107.85	30	2026-04-25 10:25:09	2026-04-25 10:25:09
3881	Pijama Fit Verde (Conjunto Infantil)	14	15	5	5	60.61	10	2026-04-25 10:25:09	2026-04-25 10:25:09
3882	Biquine Floral Dourado(a) (Boboi)	15	2	17	5	110.33	4	2026-04-25 10:25:09	2026-04-25 10:25:09
3883	Sunga Algodão Marrom (Marisol)	2	18	13	2	79.23	21	2026-04-25 10:25:09	2026-04-25 10:25:09
3884	Camisa Estampado(a) Amarelo(a) (C&A Baby)	13	7	7	5	13.15	6	2026-04-25 10:25:09	2026-04-25 10:25:09
3885	Calcinha Floral Verde (Pimpolho)	15	6	5	6	76.07	26	2026-04-25 10:25:09	2026-04-25 10:25:09
3886	Vestido Casual Rosa Choque (Riachuelo Kids)	5	21	10	8	69.22	29	2026-04-25 10:25:09	2026-04-25 10:25:09
3887	Biquine Clássico(a) Amarelo(a) (Boboi)	6	2	7	7	51.80	4	2026-04-25 10:25:09	2026-04-25 10:25:09
3888	Casaco Floral Laranja (Disney Kids)	15	9	11	4	61.01	13	2026-04-25 10:25:09	2026-04-25 10:25:09
3889	Pijama Leve Branco(a) (Marisol)	19	15	4	16	69.95	21	2026-04-25 10:25:09	2026-04-25 10:25:09
3890	Short Clássico(a) Cáqui (Hering Kids)	6	17	20	13	114.62	15	2026-04-25 10:25:09	2026-04-25 10:25:09
3891	Bermuda Stitch Turquesa (Pimpolho)	28	1	15	13	78.96	26	2026-04-25 10:25:09	2026-04-25 10:25:09
3892	Cueca Curto(a) Turquesa (Colcci Kids)	9	10	15	7	26.47	9	2026-04-25 10:25:09	2026-04-25 10:25:09
3893	Biquine Longa Preto(a) (Ki Carinho)	21	2	3	8	38.91	16	2026-04-25 10:25:09	2026-04-25 10:25:09
3894	Calçado Moleton Marrom (Bendita Cute)	23	4	13	9	67.09	3	2026-04-25 10:25:09	2026-04-25 10:25:09
3895	Jaqueta Ajustável Amarelo(a) (Carters)	1	11	7	16	79.11	8	2026-04-25 10:25:09	2026-04-25 10:25:09
3896	Calçado Durável Roxo(a) (Hering Kids)	10	4	12	11	67.49	15	2026-04-25 10:25:09	2026-04-25 10:25:09
3897	Vestido Loney Tunes Prata (Riachuelo Kids)	22	21	18	18	21.23	29	2026-04-25 10:25:09	2026-04-25 10:25:09
3898	Calçado Esportivo(a) Roxo(a) (Carters)	12	4	12	3	10.74	8	2026-04-25 10:25:09	2026-04-25 10:25:09
3899	Sutiã Algodão Azul Escuro(a) (Boboi)	2	19	9	3	53.53	4	2026-04-25 10:25:09	2026-04-25 10:25:09
3900	Top Loney Tunes Turquesa (Mundo Infantil)	22	20	15	5	95.01	22	2026-04-25 10:25:09	2026-04-25 10:25:09
3901	Calcinha Seda Vermelho(a) (Lacoste Kids)	27	6	6	16	105.43	18	2026-04-25 10:25:09	2026-04-25 10:25:09
3902	Pijama Curto(a) Prata (Riachuelo Kids)	9	15	18	18	81.32	29	2026-04-25 10:25:09	2026-04-25 10:25:09
3903	Biquine Listrado Azul (Bendita Cute)	20	2	1	18	81.10	3	2026-04-25 10:25:09	2026-04-25 10:25:09
3904	Short Animal Print Cáqui (C&A Baby)	3	17	20	16	57.21	6	2026-04-25 10:25:09	2026-04-25 10:25:09
3905	Casaco Toy Store Lilás (Boboi)	30	9	16	12	75.06	4	2026-04-25 10:25:09	2026-04-25 10:25:09
3906	Vestido Curto(a) Vermelho(a) (Colcci Kids)	9	21	6	9	103.73	9	2026-04-25 10:25:09	2026-04-25 10:25:09
3907	Sutiã Seda Roxo(a) (Akazys)	27	19	12	6	72.71	2	2026-04-25 10:25:09	2026-04-25 10:25:09
3908	Saia Loney Tunes Preto(a) (Farm Kids)	22	16	3	14	53.08	14	2026-04-25 10:25:09	2026-04-25 10:25:09
3909	Cueca Floral Turquesa (Dafiti Kids)	15	10	15	9	51.74	11	2026-04-25 10:25:09	2026-04-25 10:25:09
3910	Biquine Colorido(a) Bege (Mundo Pet)	7	2	14	13	67.43	23	2026-04-25 10:25:09	2026-04-25 10:25:09
3911	Meia Esportivo(a) Cáqui (C&A Baby)	12	14	20	3	106.28	6	2026-04-25 10:25:09	2026-04-25 10:25:09
3912	Vestido Durável Branco(a) (Disney Kids)	10	21	4	11	57.94	13	2026-04-25 10:25:09	2026-04-25 10:25:09
3913	Macacão Floral Dourado(a) (Farm Kids)	15	12	17	19	41.43	14	2026-04-25 10:25:09	2026-04-25 10:25:09
3914	Camiseta Estampado(a) Dourado(a) (Petit Royal)	13	8	17	5	63.08	25	2026-04-25 10:25:09	2026-04-25 10:25:09
3915	Sutiã Algodão Vinho (C&A Kids)	2	19	19	8	85.88	7	2026-04-25 10:25:09	2026-04-25 10:25:09
3916	Camiseta Esportivo(a) Vinho (Renner Kids)	12	8	19	8	37.39	28	2026-04-25 10:25:09	2026-04-25 10:25:09
3917	Bermuda Algodão Marrom (Boboi)	2	1	13	15	16.05	4	2026-04-25 10:25:09	2026-04-25 10:25:09
3918	Camiseta Animal Print Vermelho(a) (Ki Carinho)	3	8	6	11	26.55	16	2026-04-25 10:25:09	2026-04-25 10:25:09
3919	Calça Moleton Vermelho(a) (Salsa Jeans Kids)	23	5	6	4	104.87	30	2026-04-25 10:25:09	2026-04-25 10:25:09
3920	Maiô Seda Amarelo(a) (Maria Filó Kids)	27	13	7	10	38.36	20	2026-04-25 10:25:09	2026-04-25 10:25:09
3921	Top Moleton Azul Escuro(a) (Dafiti Kids)	23	20	9	6	34.35	11	2026-04-25 10:25:09	2026-04-25 10:25:09
3922	Camisa Elástico(a) Prata (Riachuelo Kids)	11	7	18	5	90.02	29	2026-04-25 10:25:09	2026-04-25 10:25:09
3923	Sutiã Turma da Mônica Laranja (Renner Kids)	31	19	11	17	50.92	28	2026-04-25 10:25:09	2026-04-25 10:25:09
3924	Jaqueta Saja Amarelo(a) (Disney Baby)	26	11	7	6	41.53	12	2026-04-25 10:25:09	2026-04-25 10:25:09
3925	Calça Turma da Mônica Roxo(a) (Pimpolho)	31	5	12	18	32.20	26	2026-04-25 10:25:09	2026-04-25 10:25:09
3926	Saia Listrado Lilás (Zoe Kids)	20	16	16	12	13.26	31	2026-04-25 10:25:09	2026-04-25 10:25:09
3927	Calça Temático(a) Preto(a) (Zoe Kids)	29	5	3	6	18.29	31	2026-04-25 10:25:09	2026-04-25 10:25:09
3928	Saia Colorido(a) Lilás (Bendita Cute)	7	16	16	10	107.10	3	2026-04-25 10:25:09	2026-04-25 10:25:09
3929	Camiseta Formal Azul (Petit Royal)	16	8	1	2	39.05	25	2026-04-25 10:25:09	2026-04-25 10:25:09
3930	Casaco Ajustável Cáqui (Puket Kids)	1	9	20	16	16.74	27	2026-04-25 10:25:09	2026-04-25 10:25:09
3931	Pijama Durável Preto(a) (Lacoste Kids)	10	15	3	3	65.09	18	2026-04-25 10:25:09	2026-04-25 10:25:09
3932	Biquine Temático(a) Bege (Mundo Infantil)	29	2	14	9	80.16	22	2026-04-25 10:25:09	2026-04-25 10:25:09
3933	Calça Longa Azul Escuro(a) (Osklen Kids)	21	5	9	16	10.96	24	2026-04-25 10:25:09	2026-04-25 10:25:09
3934	Macacão Esportivo(a) Vermelho(a) (Lacoste Kids)	12	12	6	12	107.04	18	2026-04-25 10:25:09	2026-04-25 10:25:09
3935	Top Seda Preto(a) (Maria Filó Kids)	27	20	3	6	56.59	20	2026-04-25 10:25:09	2026-04-25 10:25:09
3936	Top Algodão Azul Escuro(a) (Hering Kids)	2	20	9	1	10.51	15	2026-04-25 10:25:09	2026-04-25 10:25:09
3937	Blusa Algodão Marrom (Farm Kids)	2	3	13	16	118.93	14	2026-04-25 10:25:09	2026-04-25 10:25:09
3938	Biquine Elástico(a) Verde (Akazys)	11	2	5	1	46.95	2	2026-04-25 10:25:09	2026-04-25 10:25:09
3939	Maiô Ajustável Bege (Pimpolho)	1	13	14	3	12.58	26	2026-04-25 10:25:09	2026-04-25 10:25:09
3940	Pijama Moleton Verde (Puket Kids)	23	15	5	16	53.68	27	2026-04-25 10:25:09	2026-04-25 10:25:09
3941	Macacão Animal Print Laranja (Boboi)	3	12	11	1	33.86	4	2026-04-25 10:25:09	2026-04-25 10:25:09
3942	Blusa Clássico(a) Amarelo(a) (Mundo Infantil)	6	3	7	19	30.99	22	2026-04-25 10:25:09	2026-04-25 10:25:09
3943	Camisa Moleton Laranja (Disney Baby)	23	7	11	14	104.14	12	2026-04-25 10:25:09	2026-04-25 10:25:09
3944	Sunga Loney Tunes Lilás (Mundo Pet)	22	18	16	15	66.77	23	2026-04-25 10:25:09	2026-04-25 10:25:09
3945	Sutiã Xadrez Lilás (Conjunto Infantil)	32	19	16	9	31.16	10	2026-04-25 10:25:09	2026-04-25 10:25:09
3946	Pijama Moleton Laranja (Bendita Cute)	23	15	11	6	37.50	3	2026-04-25 10:25:09	2026-04-25 10:25:09
3947	Pijama Curto(a) Azul Escuro(a) (Mundo Pet)	9	15	9	17	89.83	23	2026-04-25 10:25:09	2026-04-25 10:25:09
3948	Maiô Xadrez Branco(a) (Disney Baby)	32	13	4	2	68.53	12	2026-04-25 10:25:09	2026-04-25 10:25:09
3949	Macacão Durável Rosa (Kily)	10	12	2	5	52.65	17	2026-04-25 10:25:09	2026-04-25 10:25:09
3950	Pijama Curto(a) Rosa Choque (Riachuelo Kids)	9	15	10	13	95.04	29	2026-04-25 10:25:09	2026-04-25 10:25:09
3951	Pijama Jeans Preto(a) (Mundo Pet)	17	15	3	17	92.28	23	2026-04-25 10:25:09	2026-04-25 10:25:09
3952	Calça Clássico(a) Marrom (Renner Kids)	6	5	13	6	46.60	28	2026-04-25 10:25:09	2026-04-25 10:25:09
3953	Pijama Listrado Bege (Farm Kids)	20	15	14	9	49.69	14	2026-04-25 10:25:09	2026-04-25 10:25:09
3954	Maiô Estampado(a) Bege (Zoe Kids)	13	13	14	14	76.28	31	2026-04-25 10:25:09	2026-04-25 10:25:09
3955	Top Xadrez Turquesa (Riachuelo Kids)	32	20	15	15	105.71	29	2026-04-25 10:25:09	2026-04-25 10:25:09
3956	Vestido Temático(a) Lilás (Boboi)	29	21	16	13	96.39	4	2026-04-25 10:25:09	2026-04-25 10:25:09
3957	Casaco Básico(a) Prata (Lilica Ripilica)	4	9	18	4	50.98	19	2026-04-25 10:25:09	2026-04-25 10:25:09
3958	Macacão Confortável Turquesa (Conjunto Infantil)	8	12	15	12	74.43	10	2026-04-25 10:25:09	2026-04-25 10:25:09
3959	Pijama Saja Azul Escuro(a) (Marisol)	26	15	9	19	106.23	21	2026-04-25 10:25:09	2026-04-25 10:25:09
3960	Calça Ajustável Branco(a) (Pimpolho)	1	5	4	4	106.05	26	2026-04-25 10:25:09	2026-04-25 10:25:09
3961	Maiô Loney Tunes Azul Escuro(a) (Brandille)	22	13	9	3	51.22	5	2026-04-25 10:25:09	2026-04-25 10:25:09
3962	Blusa Básico(a) Roxo(a) (Akazys)	4	3	12	16	40.84	2	2026-04-25 10:25:09	2026-04-25 10:25:09
3963	Jaqueta Básico(a) Rosa (Pimpolho)	4	11	2	12	50.66	26	2026-04-25 10:25:09	2026-04-25 10:25:09
3964	Meia Formal Cinza (Brandille)	16	14	8	4	56.22	5	2026-04-25 10:25:09	2026-04-25 10:25:09
3965	Calça Confortável Turquesa (Dafiti Kids)	8	5	15	5	65.47	11	2026-04-25 10:25:09	2026-04-25 10:25:09
3966	Pijama Stitch Prata (Lilica Ripilica)	28	15	18	18	87.12	19	2026-04-25 10:25:09	2026-04-25 10:25:09
3967	Sutiã Curto(a) Prata (Farm Kids)	9	19	18	7	106.38	14	2026-04-25 10:25:09	2026-04-25 10:25:09
3968	Calcinha Toy Store Roxo(a) (Lacoste Kids)	30	6	12	19	94.97	18	2026-04-25 10:25:09	2026-04-25 10:25:09
3969	Macacão Colorido(a) Rosa (Petit Royal)	7	12	2	17	45.47	25	2026-04-25 10:25:09	2026-04-25 10:25:09
3970	Jaqueta Turma da Mônica Dourado(a) (Pimpolho)	31	11	17	11	58.40	26	2026-04-25 10:25:09	2026-04-25 10:25:09
3971	Macacão Fit Vinho (Akazys)	14	12	19	16	34.72	2	2026-04-25 10:25:09	2026-04-25 10:25:09
3972	Calcinha Poliéster Preto(a) (Akazys)	24	6	3	13	29.85	2	2026-04-25 10:25:09	2026-04-25 10:25:09
3973	Pijama Fit Lilás (Puket Kids)	14	15	16	6	102.53	27	2026-04-25 10:25:09	2026-04-25 10:25:09
3974	Biquine Animal Print Branco(a) (Mundo Pet)	3	2	4	4	23.87	23	2026-04-25 10:25:09	2026-04-25 10:25:09
3975	Saia Toy Store Cáqui (Riachuelo Kids)	30	16	20	10	34.99	29	2026-04-25 10:25:09	2026-04-25 10:25:09
3976	Casaco Temático(a) Preto(a) (Lacoste Kids)	29	9	3	3	16.52	18	2026-04-25 10:25:09	2026-04-25 10:25:09
3977	Jaqueta Fit Azul (Colcci Kids)	14	11	1	17	108.04	9	2026-04-25 10:25:09	2026-04-25 10:25:09
3978	Macacão Curto(a) Azul Escuro(a) (Zoe Kids)	9	12	9	1	54.01	31	2026-04-25 10:25:09	2026-04-25 10:25:09
3979	Jaqueta Labubu Preto(a) (Lilica Ripilica)	18	11	3	16	48.80	19	2026-04-25 10:25:09	2026-04-25 10:25:09
3980	Pijama Algodão Vermelho(a) (Dafiti Kids)	2	15	6	19	31.63	11	2026-04-25 10:25:09	2026-04-25 10:25:09
3981	Short Casual Preto(a) (C&A Kids)	5	17	3	8	46.22	7	2026-04-25 10:25:09	2026-04-25 10:25:09
3982	Top Jeans Bege (Dafiti Kids)	17	20	14	19	113.94	11	2026-04-25 10:25:09	2026-04-25 10:25:09
3983	Sutiã Labubu Roxo(a) (Colcci Kids)	18	19	12	12	37.33	9	2026-04-25 10:25:09	2026-04-25 10:25:09
3984	Calçado Moleton Cinza (Lacoste Kids)	23	4	8	9	12.29	18	2026-04-25 10:25:09	2026-04-25 10:25:09
3985	Bermuda Leve Turquesa (Pimpolho)	19	1	15	11	59.34	26	2026-04-25 10:25:09	2026-04-25 10:25:09
3986	Bermuda Seda Branco(a) (Farm Kids)	27	1	4	11	87.40	14	2026-04-25 10:25:09	2026-04-25 10:25:09
3987	Macacão Formal Prata (Hering Kids)	16	12	18	7	36.95	15	2026-04-25 10:25:09	2026-04-25 10:25:09
3988	Calcinha Stitch Rosa Choque (Marisol)	28	6	10	15	60.22	21	2026-04-25 10:25:09	2026-04-25 10:25:09
3989	Pijama Esportivo(a) Azul Escuro(a) (Riachuelo Kids)	12	15	9	16	48.91	29	2026-04-25 10:25:09	2026-04-25 10:25:09
3990	Cueca Respirável Lilás (Brandille)	25	10	16	1	112.16	5	2026-04-25 10:25:09	2026-04-25 10:25:09
3991	Blusa Loney Tunes Verde (Puket Kids)	22	3	5	5	84.66	27	2026-04-25 10:25:09	2026-04-25 10:25:09
3992	Macacão Leve Roxo(a) (Disney Baby)	19	12	12	8	11.06	12	2026-04-25 10:25:09	2026-04-25 10:25:09
3993	Biquine Esportivo(a) Prata (Riachuelo Kids)	12	2	18	15	41.90	29	2026-04-25 10:25:09	2026-04-25 10:25:09
3994	Vestido Colorido(a) Marrom (Colcci Kids)	7	21	13	1	69.85	9	2026-04-25 10:25:09	2026-04-25 10:25:09
3995	Biquine Básico(a) Laranja (Lacoste Kids)	4	2	11	1	22.24	18	2026-04-25 10:25:09	2026-04-25 10:25:09
3996	Sutiã Longa Vinho (Maria Filó Kids)	21	19	19	19	90.85	20	2026-04-25 10:25:09	2026-04-25 10:25:09
3997	Calçado Curto(a) Verde (Conjunto Infantil)	9	4	5	9	10.82	10	2026-04-25 10:25:09	2026-04-25 10:25:09
3998	Calça Stitch Cáqui (Pimpolho)	28	5	20	11	85.79	26	2026-04-25 10:25:09	2026-04-25 10:25:09
3999	Sunga Clássico(a) Turquesa (Conjunto Infantil)	6	18	15	3	70.13	10	2026-04-25 10:25:09	2026-04-25 10:25:09
4000	Cueca Loney Tunes Azul (Pimpolho)	22	10	1	9	111.22	26	2026-04-25 10:25:09	2026-04-25 10:25:09
4001	Camisa Curto(a) Preto(a) (Ki Carinho)	9	7	3	1	52.22	16	2026-04-25 10:25:09	2026-04-25 10:25:09
4002	Sutiã Animal Print Preto(a) (Mundo Pet)	3	19	3	3	57.16	23	2026-04-25 10:25:09	2026-04-25 10:25:09
4003	Saia Ajustável Roxo(a) (Kily)	1	16	12	4	18.30	17	2026-04-25 10:25:09	2026-04-25 10:25:09
4004	Jaqueta Esportivo(a) Turquesa (Mundo Infantil)	12	11	15	14	12.13	22	2026-04-25 10:25:09	2026-04-25 10:25:09
4005	Vestido Animal Print Lilás (Riachuelo Kids)	3	21	16	12	60.08	29	2026-04-25 10:25:09	2026-04-25 10:25:09
4006	Sunga Algodão Prata (Kily)	2	18	18	14	32.16	17	2026-04-25 10:25:09	2026-04-25 10:25:09
4007	Camiseta Loney Tunes Verde (Mundo Pet)	22	8	5	16	96.92	23	2026-04-25 10:25:09	2026-04-25 10:25:09
4008	Meia Seda Bege (C&A Kids)	27	14	14	17	42.25	7	2026-04-25 10:25:09	2026-04-25 10:25:09
4009	Jaqueta Colorido(a) Vinho (Salsa Jeans Kids)	7	11	19	6	77.37	30	2026-04-25 10:25:09	2026-04-25 10:25:09
4010	Biquine Básico(a) Bege (Puket Kids)	4	2	14	4	65.44	27	2026-04-25 10:25:09	2026-04-25 10:25:09
4011	Short Turma da Mônica Amarelo(a) (Mundo Infantil)	31	17	7	10	37.67	22	2026-04-25 10:25:09	2026-04-25 10:25:09
4012	Biquine Durável Laranja (Lacoste Kids)	10	2	11	12	57.02	18	2026-04-25 10:25:09	2026-04-25 10:25:09
4013	Cueca Elástico(a) Cinza (Farm Kids)	11	10	8	4	102.86	14	2026-04-25 10:25:09	2026-04-25 10:25:09
4014	Short Saja Vinho (Renner Kids)	26	17	19	17	20.24	28	2026-04-25 10:25:09	2026-04-25 10:25:09
4015	Short Curto(a) Amarelo(a) (Mundo Pet)	9	17	7	14	20.80	23	2026-04-25 10:25:09	2026-04-25 10:25:09
4016	Blusa Stitch Dourado(a) (Farm Kids)	28	3	17	14	104.84	14	2026-04-25 10:25:09	2026-04-25 10:25:09
4017	Maiô Estampado(a) Azul Escuro(a) (Colcci Kids)	13	13	9	9	110.20	9	2026-04-25 10:25:09	2026-04-25 10:25:09
4018	Sutiã Floral Cinza (Osklen Kids)	15	19	8	4	88.42	24	2026-04-25 10:25:09	2026-04-25 10:25:09
4019	Calçado Labubu Rosa Choque (Lacoste Kids)	18	4	10	16	83.29	18	2026-04-25 10:25:09	2026-04-25 10:25:09
4020	Camisa Colorido(a) Cáqui (Riachuelo Kids)	7	7	20	7	87.93	29	2026-04-25 10:25:09	2026-04-25 10:25:09
4021	Sunga Básico(a) Amarelo(a) (C&A Kids)	4	18	7	6	36.69	7	2026-04-25 10:25:09	2026-04-25 10:25:09
4022	Casaco Leve Bege (C&A Kids)	19	9	14	15	82.30	7	2026-04-25 10:25:09	2026-04-25 10:25:09
4023	Casaco Ajustável Cáqui (Puket Kids)	1	9	20	2	114.30	27	2026-04-25 10:25:09	2026-04-25 10:25:09
4024	Biquine Respirável Azul Escuro(a) (Lacoste Kids)	25	2	9	19	42.23	18	2026-04-25 10:25:09	2026-04-25 10:25:09
4025	Jaqueta Esportivo(a) Rosa Choque (Salsa Jeans Kids)	12	11	10	17	47.91	30	2026-04-25 10:25:09	2026-04-25 10:25:09
4026	Camisa Estampado(a) Azul Escuro(a) (Puket Kids)	13	7	9	18	47.39	27	2026-04-25 10:25:09	2026-04-25 10:25:09
4027	Bermuda Formal Laranja (Riachuelo Kids)	16	1	11	3	111.99	29	2026-04-25 10:25:09	2026-04-25 10:25:09
4028	Bermuda Longa Rosa (Zoe Kids)	21	1	2	6	60.30	31	2026-04-25 10:25:09	2026-04-25 10:25:09
4029	Calçado Respirável Turquesa (Pimpolho)	25	4	15	10	16.82	26	2026-04-25 10:25:09	2026-04-25 10:25:09
4030	Sunga Labubu Roxo(a) (Renner Kids)	18	18	12	12	23.82	28	2026-04-25 10:25:09	2026-04-25 10:25:09
4031	Cueca Saja Preto(a) (Bendita Cute)	26	10	3	2	74.43	3	2026-04-25 10:25:09	2026-04-25 10:25:09
4032	Jaqueta Poliéster Turquesa (C&A Kids)	24	11	15	1	118.33	7	2026-04-25 10:25:09	2026-04-25 10:25:09
4033	Sunga Confortável Lilás (Hering Kids)	8	18	16	10	48.54	15	2026-04-25 10:25:09	2026-04-25 10:25:09
4034	Blusa Xadrez Turquesa (Akazys)	32	3	15	8	44.01	2	2026-04-25 10:25:09	2026-04-25 10:25:09
4035	Meia Estampado(a) Dourado(a) (Akazys)	13	14	17	12	65.72	2	2026-04-25 10:25:09	2026-04-25 10:25:09
4036	Top Curto(a) Bege (Carters)	9	20	14	12	83.76	8	2026-04-25 10:25:09	2026-04-25 10:25:09
4037	Saia Poliéster Rosa Choque (Carters)	24	16	10	2	27.12	8	2026-04-25 10:25:09	2026-04-25 10:25:09
4038	Casaco Leve Marrom (Salsa Jeans Kids)	19	9	13	10	110.05	30	2026-04-25 10:25:09	2026-04-25 10:25:09
4039	Sunga Animal Print Vermelho(a) (Boboi)	3	18	6	15	28.52	4	2026-04-25 10:25:09	2026-04-25 10:25:09
4040	Pijama Floral Rosa Choque (Maria Filó Kids)	15	15	10	18	37.52	20	2026-04-25 10:25:09	2026-04-25 10:25:09
4041	Top Elástico(a) Azul Escuro(a) (Disney Baby)	11	20	9	6	91.00	12	2026-04-25 10:25:09	2026-04-25 10:25:09
4042	Top Colorido(a) Verde (Adidas Kids)	7	20	5	7	72.68	1	2026-04-25 10:25:09	2026-04-25 10:25:09
4043	Sutiã Stitch Roxo(a) (Zoe Kids)	28	19	12	13	40.00	31	2026-04-25 10:25:09	2026-04-25 10:25:09
4044	Top Listrado Lilás (Colcci Kids)	20	20	16	3	92.07	9	2026-04-25 10:25:09	2026-04-25 10:25:09
4045	Vestido Moleton Marrom (Kily)	23	21	13	16	69.08	17	2026-04-25 10:25:09	2026-04-25 10:25:09
4046	Maiô Stitch Azul Escuro(a) (Mundo Infantil)	28	13	9	18	40.18	22	2026-04-25 10:25:09	2026-04-25 10:25:09
4047	Bermuda Estampado(a) Marrom (Lilica Ripilica)	13	1	13	4	42.02	19	2026-04-25 10:25:09	2026-04-25 10:25:09
4048	Camiseta Elástico(a) Branco(a) (Akazys)	11	8	4	11	104.24	2	2026-04-25 10:25:09	2026-04-25 10:25:09
4049	Saia Elástico(a) Cáqui (Adidas Kids)	11	16	20	5	12.26	1	2026-04-25 10:25:09	2026-04-25 10:25:09
4050	Calça Esportivo(a) Verde (Akazys)	12	5	5	7	12.60	2	2026-04-25 10:25:09	2026-04-25 10:25:09
4051	Camisa Durável Cinza (Renner Kids)	10	7	8	2	97.68	28	2026-04-25 10:25:09	2026-04-25 10:25:09
4052	Meia Estampado(a) Lilás (Pimpolho)	13	14	16	17	39.66	26	2026-04-25 10:25:09	2026-04-25 10:25:09
4053	Camisa Casual Amarelo(a) (Farm Kids)	5	7	7	6	37.88	14	2026-04-25 10:25:09	2026-04-25 10:25:09
4054	Calça Listrado Dourado(a) (Marisol)	20	5	17	19	47.40	21	2026-04-25 10:25:09	2026-04-25 10:25:09
4055	Calcinha Xadrez Rosa (Akazys)	32	6	2	17	27.78	2	2026-04-25 10:25:09	2026-04-25 10:25:09
4056	Camisa Saja Amarelo(a) (Bendita Cute)	26	7	7	19	75.94	3	2026-04-25 10:25:09	2026-04-25 10:25:09
4057	Meia Algodão Lilás (Conjunto Infantil)	2	14	16	3	52.18	10	2026-04-25 10:25:09	2026-04-25 10:25:09
4058	Calcinha Básico(a) Bege (Colcci Kids)	4	6	14	8	42.85	9	2026-04-25 10:25:09	2026-04-25 10:25:09
4059	Blusa Curto(a) Lilás (C&A Kids)	9	3	16	14	69.15	7	2026-04-25 10:25:09	2026-04-25 10:25:09
4060	Sutiã Floral Laranja (Ki Carinho)	15	19	11	1	19.78	16	2026-04-25 10:25:09	2026-04-25 10:25:09
4061	Meia Elástico(a) Roxo(a) (C&A Baby)	11	14	12	6	41.79	6	2026-04-25 10:25:09	2026-04-25 10:25:09
4062	Casaco Longa Dourado(a) (Lacoste Kids)	21	9	17	8	29.32	18	2026-04-25 10:25:09	2026-04-25 10:25:09
4063	Cueca Moleton Prata (Bendita Cute)	23	10	18	12	43.89	3	2026-04-25 10:25:09	2026-04-25 10:25:09
4064	Macacão Algodão Branco(a) (Pimpolho)	2	12	4	16	36.38	26	2026-04-25 10:25:09	2026-04-25 10:25:09
4065	Camisa Formal Cinza (Mundo Infantil)	16	7	8	10	43.62	22	2026-04-25 10:25:09	2026-04-25 10:25:09
4066	Blusa Curto(a) Branco(a) (Mundo Pet)	9	3	4	15	23.62	23	2026-04-25 10:25:09	2026-04-25 10:25:09
4067	Vestido Confortável Cinza (C&A Kids)	8	21	8	4	83.45	7	2026-04-25 10:25:09	2026-04-25 10:25:09
4068	Top Ajustável Lilás (Conjunto Infantil)	1	20	16	3	76.09	10	2026-04-25 10:25:09	2026-04-25 10:25:09
4069	Pijama Durável Amarelo(a) (Osklen Kids)	10	15	7	17	40.13	24	2026-04-25 10:25:09	2026-04-25 10:25:09
4070	Vestido Loney Tunes Turquesa (C&A Baby)	22	21	15	9	77.34	6	2026-04-25 10:25:09	2026-04-25 10:25:09
4071	Saia Labubu Lilás (Disney Baby)	18	16	16	8	17.46	12	2026-04-25 10:25:09	2026-04-25 10:25:09
4072	Vestido Durável Laranja (Osklen Kids)	10	21	11	17	65.78	24	2026-04-25 10:25:09	2026-04-25 10:25:09
4073	Saia Labubu Preto(a) (Farm Kids)	18	16	3	5	106.24	14	2026-04-25 10:25:09	2026-04-25 10:25:09
4074	Bermuda Listrado Branco(a) (Colcci Kids)	20	1	4	15	107.43	9	2026-04-25 10:25:09	2026-04-25 10:25:09
4075	Pijama Animal Print Prata (Maria Filó Kids)	3	15	18	6	69.46	20	2026-04-25 10:25:09	2026-04-25 10:25:09
4076	Pijama Clássico(a) Marrom (Ki Carinho)	6	15	13	2	47.22	16	2026-04-25 10:25:09	2026-04-25 10:25:09
4077	Meia Básico(a) Marrom (C&A Kids)	4	14	13	4	83.86	7	2026-04-25 10:25:09	2026-04-25 10:25:09
4078	Camiseta Saja Verde (Farm Kids)	26	8	5	8	51.90	14	2026-04-25 10:25:09	2026-04-25 10:25:09
4079	Meia Animal Print Amarelo(a) (Colcci Kids)	3	14	7	5	47.32	9	2026-04-25 10:25:09	2026-04-25 10:25:09
4080	Biquine Básico(a) Bege (Mundo Infantil)	4	2	14	18	46.87	22	2026-04-25 10:25:09	2026-04-25 10:25:09
4081	Calça Clássico(a) Amarelo(a) (Adidas Kids)	6	5	7	3	11.15	1	2026-04-25 10:25:09	2026-04-25 10:25:09
4082	Macacão Esportivo(a) Laranja (Carters)	12	12	11	14	37.38	8	2026-04-25 10:25:09	2026-04-25 10:25:09
4083	Casaco Clássico(a) Dourado(a) (Colcci Kids)	6	9	17	14	48.24	9	2026-04-25 10:25:09	2026-04-25 10:25:09
4084	Macacão Básico(a) Rosa (Petit Royal)	4	12	2	1	37.16	25	2026-04-25 10:25:09	2026-04-25 10:25:09
4085	Calcinha Poliéster Marrom (Lilica Ripilica)	24	6	13	13	13.51	19	2026-04-25 10:25:09	2026-04-25 10:25:09
4086	Pijama Elástico(a) Cinza (Carters)	11	15	8	2	10.21	8	2026-04-25 10:25:09	2026-04-25 10:25:09
4087	Blusa Loney Tunes Marrom (C&A Kids)	22	3	13	10	10.51	7	2026-04-25 10:25:09	2026-04-25 10:25:09
4088	Jaqueta Xadrez Vinho (Lacoste Kids)	32	11	19	14	27.01	18	2026-04-25 10:25:09	2026-04-25 10:25:09
4089	Calça Durável Verde (Adidas Kids)	10	5	5	13	101.48	1	2026-04-25 10:25:09	2026-04-25 10:25:09
4090	Vestido Curto(a) Verde (Akazys)	9	21	5	11	77.79	2	2026-04-25 10:25:09	2026-04-25 10:25:09
4091	Short Poliéster Azul Escuro(a) (Riachuelo Kids)	24	17	9	8	80.04	29	2026-04-25 10:25:09	2026-04-25 10:25:09
4092	Top Poliéster Branco(a) (Mundo Pet)	24	20	4	10	41.95	23	2026-04-25 10:25:09	2026-04-25 10:25:09
4093	Top Animal Print Turquesa (Maria Filó Kids)	3	20	15	9	116.96	20	2026-04-25 10:25:09	2026-04-25 10:25:09
4094	Sunga Fit Verde (Salsa Jeans Kids)	14	18	5	6	53.67	30	2026-04-25 10:25:09	2026-04-25 10:25:09
4095	Biquine Curto(a) Cáqui (Renner Kids)	9	2	20	2	99.38	28	2026-04-25 10:25:09	2026-04-25 10:25:09
4096	Cueca Elástico(a) Prata (Disney Kids)	11	10	18	2	95.65	13	2026-04-25 10:25:09	2026-04-25 10:25:09
4097	Saia Básico(a) Verde (Zoe Kids)	4	16	5	6	78.88	31	2026-04-25 10:25:09	2026-04-25 10:25:09
4098	Maiô Poliéster Verde (Boboi)	24	13	5	6	18.52	4	2026-04-25 10:25:09	2026-04-25 10:25:09
4099	Vestido Temático(a) Prata (Boboi)	29	21	18	17	11.92	4	2026-04-25 10:25:09	2026-04-25 10:25:09
4100	Calçado Turma da Mônica Roxo(a) (Brandille)	31	4	12	17	63.40	5	2026-04-25 10:25:09	2026-04-25 10:25:09
4101	Cueca Listrado Rosa (Adidas Kids)	20	10	2	10	104.94	1	2026-04-25 10:25:09	2026-04-25 10:25:09
4102	Camisa Estampado(a) Verde (Hering Kids)	13	7	5	10	104.16	15	2026-04-25 10:25:09	2026-04-25 10:25:09
4103	Bermuda Algodão Azul Escuro(a) (Petit Royal)	2	1	9	7	82.79	25	2026-04-25 10:25:09	2026-04-25 10:25:09
4104	Biquine Turma da Mônica Turquesa (Lilica Ripilica)	31	2	15	10	96.95	19	2026-04-25 10:25:09	2026-04-25 10:25:09
4105	Blusa Fit Verde (Salsa Jeans Kids)	14	3	5	8	35.21	30	2026-04-25 10:25:09	2026-04-25 10:25:09
4106	Calçado Ajustável Rosa Choque (Dafiti Kids)	1	4	10	1	18.65	11	2026-04-25 10:25:09	2026-04-25 10:25:09
4107	Short Turma da Mônica Preto(a) (Osklen Kids)	31	17	3	16	21.33	24	2026-04-25 10:25:09	2026-04-25 10:25:09
4108	Vestido Leve Laranja (Mundo Infantil)	19	21	11	5	103.86	22	2026-04-25 10:25:09	2026-04-25 10:25:09
4109	Camisa Seda Rosa Choque (Salsa Jeans Kids)	27	7	10	5	91.33	30	2026-04-25 10:25:09	2026-04-25 10:25:09
4110	Jaqueta Formal Rosa (Petit Royal)	16	11	2	11	85.65	25	2026-04-25 10:25:09	2026-04-25 10:25:09
4111	Sunga Leve Vermelho(a) (Adidas Kids)	19	18	6	7	60.14	1	2026-04-25 10:25:09	2026-04-25 10:25:09
4112	Meia Floral Rosa (Disney Baby)	15	14	2	9	117.80	12	2026-04-25 10:25:09	2026-04-25 10:25:09
4113	Sunga Curto(a) Vermelho(a) (Hering Kids)	9	18	6	15	92.86	15	2026-04-25 10:25:09	2026-04-25 10:25:09
4114	Top Seda Vermelho(a) (Conjunto Infantil)	27	20	6	2	110.87	10	2026-04-25 10:25:09	2026-04-25 10:25:09
4115	Jaqueta Labubu Vinho (Renner Kids)	18	11	19	8	15.35	28	2026-04-25 10:25:09	2026-04-25 10:25:09
4116	Cueca Básico(a) Dourado(a) (Ki Carinho)	4	10	17	13	14.16	16	2026-04-25 10:25:09	2026-04-25 10:25:09
4117	Sunga Temático(a) Cinza (Adidas Kids)	29	18	8	16	31.56	1	2026-04-25 10:25:09	2026-04-25 10:25:09
4118	Cueca Algodão Lilás (Zoe Kids)	2	10	16	2	91.49	31	2026-04-25 10:25:09	2026-04-25 10:25:09
4119	Calça Clássico(a) Amarelo(a) (Petit Royal)	6	5	7	4	39.49	25	2026-04-25 10:25:09	2026-04-25 10:25:09
4120	Biquine Confortável Amarelo(a) (Bendita Cute)	8	2	7	7	49.73	3	2026-04-25 10:25:09	2026-04-25 10:25:09
4121	Casaco Respirável Azul Escuro(a) (Brandille)	25	9	9	17	60.59	5	2026-04-25 10:25:09	2026-04-25 10:25:09
4122	Macacão Clássico(a) Verde (Marisol)	6	12	5	6	22.00	21	2026-04-25 10:25:09	2026-04-25 10:25:09
4123	Short Clássico(a) Laranja (Carters)	6	17	11	7	48.49	8	2026-04-25 10:25:09	2026-04-25 10:25:09
4124	Top Loney Tunes Dourado(a) (Maria Filó Kids)	22	20	17	17	63.85	20	2026-04-25 10:25:09	2026-04-25 10:25:09
4125	Casaco Floral Cinza (Renner Kids)	15	9	8	16	72.47	28	2026-04-25 10:25:09	2026-04-25 10:25:09
4126	Casaco Toy Store Marrom (Adidas Kids)	30	9	13	15	17.46	1	2026-04-25 10:25:09	2026-04-25 10:25:09
4127	Casaco Confortável Verde (Conjunto Infantil)	8	9	5	5	47.54	10	2026-04-25 10:25:09	2026-04-25 10:25:09
4128	Camisa Básico(a) Turquesa (Disney Kids)	4	7	15	1	113.13	13	2026-04-25 10:25:09	2026-04-25 10:25:09
4129	Blusa Floral Bege (Ki Carinho)	15	3	14	11	89.89	16	2026-04-25 10:25:09	2026-04-25 10:25:09
4130	Cueca Stitch Vinho (Salsa Jeans Kids)	28	10	19	11	68.24	30	2026-04-25 10:25:09	2026-04-25 10:25:09
4131	Calçado Formal Prata (Lacoste Kids)	16	4	18	1	78.99	18	2026-04-25 10:25:09	2026-04-25 10:25:09
4132	Camiseta Xadrez Vinho (Akazys)	32	8	19	1	79.46	2	2026-04-25 10:25:09	2026-04-25 10:25:09
4133	Bermuda Stitch Branco(a) (Mundo Infantil)	28	1	4	5	73.95	22	2026-04-25 10:25:09	2026-04-25 10:25:09
4134	Saia Loney Tunes Dourado(a) (Carters)	22	16	17	12	68.74	8	2026-04-25 10:25:09	2026-04-25 10:25:09
4135	Blusa Stitch Rosa Choque (Colcci Kids)	28	3	10	8	115.61	9	2026-04-25 10:25:09	2026-04-25 10:25:09
4136	Camiseta Labubu Rosa (Hering Kids)	18	8	2	14	15.96	15	2026-04-25 10:25:09	2026-04-25 10:25:09
4137	Saia Seda Vermelho(a) (Renner Kids)	27	16	6	12	110.49	28	2026-04-25 10:25:09	2026-04-25 10:25:09
4138	Camiseta Respirável Azul Escuro(a) (Puket Kids)	25	8	9	14	114.95	27	2026-04-25 10:25:09	2026-04-25 10:25:09
4139	Macacão Confortável Cinza (Osklen Kids)	8	12	8	9	93.06	24	2026-04-25 10:25:09	2026-04-25 10:25:09
4140	Vestido Estampado(a) Roxo(a) (Zoe Kids)	13	21	12	18	62.59	31	2026-04-25 10:25:09	2026-04-25 10:25:09
4141	Maiô Toy Store Branco(a) (Pimpolho)	30	13	4	3	35.53	26	2026-04-25 10:25:09	2026-04-25 10:25:09
4142	Top Floral Cáqui (Marisol)	15	20	20	9	105.09	21	2026-04-25 10:25:09	2026-04-25 10:25:09
4143	Camiseta Casual Verde (Renner Kids)	5	8	5	1	95.08	28	2026-04-25 10:25:09	2026-04-25 10:25:09
4144	Cueca Temático(a) Turquesa (Mundo Pet)	29	10	15	5	64.58	23	2026-04-25 10:25:09	2026-04-25 10:25:09
4145	Casaco Saja Prata (Lilica Ripilica)	26	9	18	15	66.20	19	2026-04-25 10:25:09	2026-04-25 10:25:09
4146	Calçado Formal Cáqui (Ki Carinho)	16	4	20	9	77.93	16	2026-04-25 10:25:09	2026-04-25 10:25:09
4147	Saia Estampado(a) Amarelo(a) (Riachuelo Kids)	13	16	7	8	50.08	29	2026-04-25 10:25:09	2026-04-25 10:25:09
4148	Short Seda Branco(a) (Bendita Cute)	27	17	4	18	75.05	3	2026-04-25 10:25:09	2026-04-25 10:25:09
4149	Top Formal Rosa (Conjunto Infantil)	16	20	2	16	92.18	10	2026-04-25 10:25:09	2026-04-25 10:25:09
4150	Sunga Moleton Vermelho(a) (Disney Kids)	23	18	6	12	93.66	13	2026-04-25 10:25:09	2026-04-25 10:25:09
4151	Calçado Xadrez Prata (Lacoste Kids)	32	4	18	18	96.69	18	2026-04-25 10:25:09	2026-04-25 10:25:09
4152	Maiô Colorido(a) Vinho (Lilica Ripilica)	7	13	19	2	72.58	19	2026-04-25 10:25:09	2026-04-25 10:25:09
4153	Short Listrado Lilás (Mundo Infantil)	20	17	16	15	50.37	22	2026-04-25 10:25:09	2026-04-25 10:25:09
4154	Calcinha Confortável Branco(a) (Osklen Kids)	8	6	4	18	94.72	24	2026-04-25 10:25:09	2026-04-25 10:25:09
4155	Bermuda Esportivo(a) Amarelo(a) (Salsa Jeans Kids)	12	1	7	2	11.19	30	2026-04-25 10:25:09	2026-04-25 10:25:09
4156	Macacão Labubu Azul Escuro(a) (Conjunto Infantil)	18	12	9	6	15.23	10	2026-04-25 10:25:09	2026-04-25 10:25:09
4157	Cueca Formal Azul Escuro(a) (Mundo Infantil)	16	10	9	11	43.45	22	2026-04-25 10:25:09	2026-04-25 10:25:09
4158	Macacão Clássico(a) Amarelo(a) (Carters)	6	12	7	18	97.54	8	2026-04-25 10:25:09	2026-04-25 10:25:09
4159	Sunga Confortável Bege (Pimpolho)	8	18	14	1	113.14	26	2026-04-25 10:25:09	2026-04-25 10:25:09
4160	Jaqueta Temático(a) Vinho (Brandille)	29	11	19	14	19.02	5	2026-04-25 10:25:09	2026-04-25 10:25:09
4161	Calça Loney Tunes Bege (Disney Baby)	22	5	14	18	83.08	12	2026-04-25 10:25:09	2026-04-25 10:25:09
4162	Top Labubu Turquesa (Dafiti Kids)	18	20	15	19	18.26	11	2026-04-25 10:25:09	2026-04-25 10:25:09
4163	Calçado Respirável Cinza (Disney Kids)	25	4	8	17	53.76	13	2026-04-25 10:25:09	2026-04-25 10:25:09
4164	Casaco Listrado Azul Escuro(a) (Farm Kids)	20	9	9	6	49.02	14	2026-04-25 10:25:09	2026-04-25 10:25:09
4165	Jaqueta Confortável Bege (Akazys)	8	11	14	10	47.68	2	2026-04-25 10:25:09	2026-04-25 10:25:09
4166	Pijama Formal Azul Escuro(a) (Carters)	16	15	9	16	111.38	8	2026-04-25 10:25:09	2026-04-25 10:25:09
4167	Calçado Listrado Laranja (Hering Kids)	20	4	11	11	22.48	15	2026-04-25 10:25:09	2026-04-25 10:25:09
4168	Short Animal Print Amarelo(a) (Ki Carinho)	3	17	7	10	93.71	16	2026-04-25 10:25:09	2026-04-25 10:25:09
4169	Sunga Formal Vinho (Conjunto Infantil)	16	18	19	9	107.37	10	2026-04-25 10:25:09	2026-04-25 10:25:09
4170	Camiseta Loney Tunes Verde (Mundo Pet)	22	8	5	3	10.99	23	2026-04-25 10:25:09	2026-04-25 10:25:09
4171	Calçado Respirável Vinho (Osklen Kids)	25	4	19	9	119.72	24	2026-04-25 10:25:09	2026-04-25 10:25:09
4172	Calcinha Turma da Mônica Rosa (Ki Carinho)	31	6	2	7	62.46	16	2026-04-25 10:25:09	2026-04-25 10:25:09
4173	Sunga Durável Rosa Choque (Puket Kids)	10	18	10	9	64.67	27	2026-04-25 10:25:09	2026-04-25 10:25:09
4174	Maiô Labubu Rosa Choque (Conjunto Infantil)	18	13	10	10	73.33	10	2026-04-25 10:25:09	2026-04-25 10:25:09
4175	Casaco Floral Branco(a) (Petit Royal)	15	9	4	11	49.74	25	2026-04-25 10:25:09	2026-04-25 10:25:09
4176	Sutiã Fit Amarelo(a) (Lilica Ripilica)	14	19	7	19	11.50	19	2026-04-25 10:25:09	2026-04-25 10:25:09
4177	Jaqueta Floral Lilás (Renner Kids)	15	11	16	16	57.86	28	2026-04-25 10:25:09	2026-04-25 10:25:09
4178	Sunga Jeans Turquesa (Lilica Ripilica)	17	18	15	9	45.46	19	2026-04-25 10:25:09	2026-04-25 10:25:09
4179	Biquine Saja Cáqui (Marisol)	26	2	20	5	59.52	21	2026-04-25 10:25:09	2026-04-25 10:25:09
4180	Pijama Loney Tunes Preto(a) (Marisol)	22	15	3	1	33.68	21	2026-04-25 10:25:09	2026-04-25 10:25:09
4181	Camisa Casual Branco(a) (Farm Kids)	5	7	4	8	110.69	14	2026-04-25 10:25:09	2026-04-25 10:25:09
4182	Calcinha Saja Marrom (Conjunto Infantil)	26	6	13	6	66.08	10	2026-04-25 10:25:09	2026-04-25 10:25:09
4183	Short Leve Preto(a) (Colcci Kids)	19	17	3	14	80.27	9	2026-04-25 10:25:09	2026-04-25 10:25:09
4184	Sunga Fit Cinza (Marisol)	14	18	8	1	76.80	21	2026-04-25 10:25:09	2026-04-25 10:25:09
4185	Casaco Respirável Branco(a) (Pimpolho)	25	9	4	6	80.86	26	2026-04-25 10:25:09	2026-04-25 10:25:09
4186	Calça Seda Rosa (Disney Kids)	27	5	2	4	101.98	13	2026-04-25 10:25:09	2026-04-25 10:25:09
4187	Sunga Ajustável Cáqui (Riachuelo Kids)	1	18	20	13	75.36	29	2026-04-25 10:25:09	2026-04-25 10:25:09
4188	Macacão Leve Vermelho(a) (Farm Kids)	19	12	6	8	54.93	14	2026-04-25 10:25:09	2026-04-25 10:25:09
4189	Camisa Listrado Azul (Hering Kids)	20	7	1	15	17.83	15	2026-04-25 10:25:09	2026-04-25 10:25:09
4190	Blusa Listrado Lilás (Adidas Kids)	20	3	16	18	25.91	1	2026-04-25 10:25:09	2026-04-25 10:25:09
4191	Meia Leve Prata (Riachuelo Kids)	19	14	18	8	112.93	29	2026-04-25 10:25:09	2026-04-25 10:25:09
4192	Casaco Loney Tunes Amarelo(a) (Mundo Infantil)	22	9	7	9	75.64	22	2026-04-25 10:25:09	2026-04-25 10:25:09
4193	Calça Seda Preto(a) (Lilica Ripilica)	27	5	3	18	62.15	19	2026-04-25 10:25:09	2026-04-25 10:25:09
4194	Saia Loney Tunes Laranja (Conjunto Infantil)	22	16	11	18	61.59	10	2026-04-25 10:25:09	2026-04-25 10:25:09
4195	Calçado Jeans Verde (Pimpolho)	17	4	5	19	85.59	26	2026-04-25 10:25:09	2026-04-25 10:25:09
4196	Camiseta Esportivo(a) Amarelo(a) (Maria Filó Kids)	12	8	7	18	69.88	20	2026-04-25 10:25:09	2026-04-25 10:25:09
4197	Calcinha Jeans Vinho (Mundo Infantil)	17	6	19	7	11.14	22	2026-04-25 10:25:09	2026-04-25 10:25:09
4198	Cueca Animal Print Azul Escuro(a) (Riachuelo Kids)	3	10	9	7	113.60	29	2026-04-25 10:25:09	2026-04-25 10:25:09
4199	Bermuda Listrado Azul (Disney Baby)	20	1	1	3	26.30	12	2026-04-25 10:25:09	2026-04-25 10:25:09
4200	Sunga Ajustável Rosa Choque (Brandille)	1	18	10	16	19.10	5	2026-04-25 10:25:09	2026-04-25 10:25:09
4201	Short Durável Azul (Riachuelo Kids)	10	17	1	4	102.11	29	2026-04-25 10:25:09	2026-04-25 10:25:09
4202	Calcinha Durável Lilás (C&A Baby)	10	6	16	3	85.59	6	2026-04-25 10:25:09	2026-04-25 10:25:09
4203	Calça Longa Amarelo(a) (Riachuelo Kids)	21	5	7	15	29.61	29	2026-04-25 10:25:09	2026-04-25 10:25:09
4204	Calça Longa Vinho (Maria Filó Kids)	21	5	19	18	72.46	20	2026-04-25 10:25:09	2026-04-25 10:25:09
4205	Sutiã Colorido(a) Cinza (Mundo Pet)	7	19	8	16	112.24	23	2026-04-25 10:25:09	2026-04-25 10:25:09
4206	Biquine Estampado(a) Laranja (Hering Kids)	13	2	11	15	113.64	15	2026-04-25 10:25:09	2026-04-25 10:25:09
4207	Sutiã Stitch Cáqui (Kily)	28	19	20	2	12.62	17	2026-04-25 10:25:09	2026-04-25 10:25:09
4208	Calcinha Curto(a) Cáqui (Pimpolho)	9	6	20	4	112.79	26	2026-04-25 10:25:09	2026-04-25 10:25:09
4209	Macacão Curto(a) Vinho (Colcci Kids)	9	12	19	14	25.47	9	2026-04-25 10:25:09	2026-04-25 10:25:09
4210	Jaqueta Estampado(a) Marrom (Renner Kids)	13	11	13	19	10.44	28	2026-04-25 10:25:09	2026-04-25 10:25:09
4211	Calça Floral Rosa Choque (Carters)	15	5	10	7	69.58	8	2026-04-25 10:25:09	2026-04-25 10:25:09
4212	Sutiã Formal Preto(a) (Ki Carinho)	16	19	3	4	27.88	16	2026-04-25 10:25:09	2026-04-25 10:25:09
4213	Camiseta Seda Lilás (Kily)	27	8	16	1	108.27	17	2026-04-25 10:25:09	2026-04-25 10:25:09
4214	Camisa Colorido(a) Cinza (Lacoste Kids)	7	7	8	14	63.19	18	2026-04-25 10:25:09	2026-04-25 10:25:09
4215	Biquine Listrado Bege (Zoe Kids)	20	2	14	15	49.54	31	2026-04-25 10:25:09	2026-04-25 10:25:09
4216	Pijama Leve Rosa (Salsa Jeans Kids)	19	15	2	12	105.21	30	2026-04-25 10:25:09	2026-04-25 10:25:09
4217	Maiô Confortável Amarelo(a) (Disney Kids)	8	13	7	10	25.92	13	2026-04-25 10:25:09	2026-04-25 10:25:09
4218	Camisa Fit Preto(a) (Lacoste Kids)	14	7	3	3	54.61	18	2026-04-25 10:25:09	2026-04-25 10:25:09
4219	Maiô Temático(a) Prata (Lilica Ripilica)	29	13	18	7	20.51	19	2026-04-25 10:25:09	2026-04-25 10:25:09
4220	Cueca Animal Print Azul (Riachuelo Kids)	3	10	1	4	65.35	29	2026-04-25 10:25:09	2026-04-25 10:25:09
4221	Camisa Fit Cáqui (Maria Filó Kids)	14	7	20	12	47.01	20	2026-04-25 10:25:09	2026-04-25 10:25:09
4222	Jaqueta Estampado(a) Vinho (Disney Kids)	13	11	19	13	85.02	13	2026-04-25 10:25:09	2026-04-25 10:25:09
4223	Casaco Fit Marrom (Disney Baby)	14	9	13	17	45.03	12	2026-04-25 10:25:09	2026-04-25 10:25:09
4224	Short Stitch Cinza (Zoe Kids)	28	17	8	10	72.91	31	2026-04-25 10:25:09	2026-04-25 10:25:09
4225	Camisa Básico(a) Azul Escuro(a) (Petit Royal)	4	7	9	15	27.81	25	2026-04-25 10:25:09	2026-04-25 10:25:09
4226	Biquine Longa Prata (Carters)	21	2	18	7	70.71	8	2026-04-25 10:25:09	2026-04-25 10:25:09
4227	Calça Básico(a) Dourado(a) (Riachuelo Kids)	4	5	17	18	85.06	29	2026-04-25 10:25:09	2026-04-25 10:25:09
4228	Maiô Temático(a) Bege (Boboi)	29	13	14	4	98.90	4	2026-04-25 10:25:09	2026-04-25 10:25:09
4229	Jaqueta Temático(a) Laranja (Adidas Kids)	29	11	11	12	74.04	1	2026-04-25 10:25:09	2026-04-25 10:25:09
4230	Camiseta Esportivo(a) Lilás (Farm Kids)	12	8	16	16	104.97	14	2026-04-25 10:25:09	2026-04-25 10:25:09
4231	Casaco Saja Turquesa (Disney Kids)	26	9	15	1	78.08	13	2026-04-25 10:25:09	2026-04-25 10:25:09
4232	Calcinha Colorido(a) Turquesa (C&A Baby)	7	6	15	9	43.89	6	2026-04-25 10:25:09	2026-04-25 10:25:09
4233	Calcinha Estampado(a) Cáqui (Colcci Kids)	13	6	20	18	11.84	9	2026-04-25 10:25:09	2026-04-25 10:25:09
4234	Sunga Loney Tunes Marrom (Akazys)	22	18	13	17	48.44	2	2026-04-25 10:25:09	2026-04-25 10:25:09
4235	Vestido Respirável Rosa Choque (Ki Carinho)	25	21	10	2	26.84	16	2026-04-25 10:25:09	2026-04-25 10:25:09
4236	Vestido Curto(a) Turquesa (Mundo Pet)	9	21	15	13	27.17	23	2026-04-25 10:25:09	2026-04-25 10:25:09
4237	Camiseta Floral Azul (Disney Kids)	15	8	1	15	90.21	13	2026-04-25 10:25:09	2026-04-25 10:25:09
4238	Casaco Loney Tunes Vermelho(a) (C&A Kids)	22	9	6	19	64.53	7	2026-04-25 10:25:09	2026-04-25 10:25:09
4239	Saia Poliéster Marrom (Disney Kids)	24	16	13	14	92.66	13	2026-04-25 10:25:09	2026-04-25 10:25:09
4240	Cueca Xadrez Rosa (Brandille)	32	10	2	14	31.19	5	2026-04-25 10:25:09	2026-04-25 10:25:09
4241	Blusa Temático(a) Azul Escuro(a) (Akazys)	29	3	9	1	50.19	2	2026-04-25 10:25:09	2026-04-25 10:25:09
4242	Biquine Durável Vinho (Lacoste Kids)	10	2	19	13	99.38	18	2026-04-25 10:25:09	2026-04-25 10:25:09
4243	Saia Fit Amarelo(a) (C&A Kids)	14	16	7	7	117.33	7	2026-04-25 10:25:09	2026-04-25 10:25:09
4244	Camiseta Algodão Dourado(a) (C&A Kids)	2	8	17	17	32.12	7	2026-04-25 10:25:09	2026-04-25 10:25:09
4245	Bermuda Algodão Branco(a) (C&A Kids)	2	1	4	2	78.15	7	2026-04-25 10:25:09	2026-04-25 10:25:09
4246	Biquine Colorido(a) Lilás (Conjunto Infantil)	7	2	16	9	93.38	10	2026-04-25 10:25:09	2026-04-25 10:25:09
4247	Calçado Floral Vermelho(a) (Brandille)	15	4	6	13	87.60	5	2026-04-25 10:25:09	2026-04-25 10:25:09
4248	Bermuda Seda Lilás (Kily)	27	1	16	10	59.66	17	2026-04-25 10:25:09	2026-04-25 10:25:09
4249	Top Algodão Cáqui (Puket Kids)	2	20	20	13	57.87	27	2026-04-25 10:25:09	2026-04-25 10:25:09
4250	Vestido Estampado(a) Amarelo(a) (Zoe Kids)	13	21	7	3	38.03	31	2026-04-25 10:25:09	2026-04-25 10:25:09
4251	Casaco Jeans Rosa Choque (C&A Baby)	17	9	10	15	50.74	6	2026-04-25 10:25:09	2026-04-25 10:25:09
4252	Camiseta Floral Dourado(a) (Boboi)	15	8	17	12	108.58	4	2026-04-25 10:25:09	2026-04-25 10:25:09
4253	Camisa Moleton Branco(a) (Salsa Jeans Kids)	23	7	4	3	32.41	30	2026-04-25 10:25:09	2026-04-25 10:25:09
4254	Maiô Respirável Azul (C&A Baby)	25	13	1	4	89.62	6	2026-04-25 10:25:09	2026-04-25 10:25:09
4255	Calçado Seda Rosa (Ki Carinho)	27	4	2	12	103.97	16	2026-04-25 10:25:09	2026-04-25 10:25:09
4256	Cueca Durável Laranja (Lacoste Kids)	10	10	11	3	42.07	18	2026-04-25 10:25:09	2026-04-25 10:25:09
4257	Macacão Confortável Bege (Hering Kids)	8	12	14	8	88.09	15	2026-04-25 10:25:09	2026-04-25 10:25:09
4258	Calcinha Colorido(a) Bege (Farm Kids)	7	6	14	7	115.48	14	2026-04-25 10:25:09	2026-04-25 10:25:09
4259	Jaqueta Temático(a) Dourado(a) (Bendita Cute)	29	11	17	8	112.91	3	2026-04-25 10:25:09	2026-04-25 10:25:09
4260	Blusa Xadrez Bege (Disney Kids)	32	3	14	18	70.91	13	2026-04-25 10:25:09	2026-04-25 10:25:09
4261	Casaco Poliéster Bege (Petit Royal)	24	9	14	7	92.31	25	2026-04-25 10:25:09	2026-04-25 10:25:09
4262	Calça Labubu Vermelho(a) (C&A Kids)	18	5	6	10	119.19	7	2026-04-25 10:25:09	2026-04-25 10:25:09
4263	Macacão Básico(a) Prata (Kily)	4	12	18	15	60.67	17	2026-04-25 10:25:09	2026-04-25 10:25:09
4264	Camiseta Temático(a) Azul (Hering Kids)	29	8	1	14	26.13	15	2026-04-25 10:25:09	2026-04-25 10:25:09
4265	Vestido Leve Preto(a) (C&A Baby)	19	21	3	9	59.48	6	2026-04-25 10:25:09	2026-04-25 10:25:09
4266	Camisa Formal Preto(a) (Colcci Kids)	16	7	3	10	78.46	9	2026-04-25 10:25:09	2026-04-25 10:25:09
4267	Macacão Durável Verde (Mundo Infantil)	10	12	5	16	32.10	22	2026-04-25 10:25:09	2026-04-25 10:25:09
4268	Casaco Loney Tunes Turquesa (Lacoste Kids)	22	9	15	11	52.22	18	2026-04-25 10:25:09	2026-04-25 10:25:09
4269	Cueca Durável Prata (Lilica Ripilica)	10	10	18	12	116.67	19	2026-04-25 10:25:09	2026-04-25 10:25:09
4270	Casaco Ajustável Vinho (Pimpolho)	1	9	19	8	97.69	26	2026-04-25 10:25:09	2026-04-25 10:25:09
4271	Vestido Longa Preto(a) (Lacoste Kids)	21	21	3	11	50.67	18	2026-04-25 10:25:09	2026-04-25 10:25:09
4272	Cueca Estampado(a) Prata (Conjunto Infantil)	13	10	18	2	118.77	10	2026-04-25 10:25:09	2026-04-25 10:25:09
4273	Meia Floral Azul (Boboi)	15	14	1	12	50.83	4	2026-04-25 10:25:09	2026-04-25 10:25:09
4274	Pijama Turma da Mônica Azul (Conjunto Infantil)	31	15	1	8	19.79	10	2026-04-25 10:25:09	2026-04-25 10:25:09
4275	Sunga Xadrez Marrom (Disney Kids)	32	18	13	1	73.36	13	2026-04-25 10:25:09	2026-04-25 10:25:09
4276	Camisa Confortável Azul (Brandille)	8	7	1	2	66.94	5	2026-04-25 10:25:09	2026-04-25 10:25:09
4277	Sutiã Stitch Prata (Maria Filó Kids)	28	19	18	11	24.30	20	2026-04-25 10:25:09	2026-04-25 10:25:09
4278	Short Poliéster Laranja (Puket Kids)	24	17	11	13	67.22	27	2026-04-25 10:25:09	2026-04-25 10:25:09
4279	Sunga Toy Store Cinza (Bendita Cute)	30	18	8	6	24.39	3	2026-04-25 10:25:09	2026-04-25 10:25:09
4280	Meia Algodão Laranja (Ki Carinho)	2	14	11	18	78.69	16	2026-04-25 10:25:09	2026-04-25 10:25:09
4281	Maiô Turma da Mônica Marrom (Marisol)	31	13	13	18	101.99	21	2026-04-25 10:25:09	2026-04-25 10:25:09
4282	Vestido Ajustável Prata (Petit Royal)	1	21	18	12	70.18	25	2026-04-25 10:25:09	2026-04-25 10:25:09
4283	Pijama Jeans Rosa Choque (Dafiti Kids)	17	15	10	6	70.04	11	2026-04-25 10:25:09	2026-04-25 10:25:09
4284	Pijama Confortável Preto(a) (Lacoste Kids)	8	15	3	19	92.41	18	2026-04-25 10:25:09	2026-04-25 10:25:09
4285	Blusa Animal Print Branco(a) (Farm Kids)	3	3	4	10	37.21	14	2026-04-25 10:25:09	2026-04-25 10:25:09
4286	Jaqueta Toy Store Azul Escuro(a) (Riachuelo Kids)	30	11	9	16	20.52	29	2026-04-25 10:25:09	2026-04-25 10:25:09
4287	Camiseta Básico(a) Rosa (Brandille)	4	8	2	10	108.15	5	2026-04-25 10:25:09	2026-04-25 10:25:09
4288	Vestido Confortável Branco(a) (Salsa Jeans Kids)	8	21	4	4	83.11	30	2026-04-25 10:25:09	2026-04-25 10:25:09
4289	Pijama Esportivo(a) Amarelo(a) (Renner Kids)	12	15	7	9	30.75	28	2026-04-25 10:25:09	2026-04-25 10:25:09
4290	Jaqueta Stitch Cáqui (Zoe Kids)	28	11	20	16	108.04	31	2026-04-25 10:25:09	2026-04-25 10:25:09
4291	Short Longa Rosa Choque (Zoe Kids)	21	17	10	15	43.34	31	2026-04-25 10:25:09	2026-04-25 10:25:09
4292	Sunga Temático(a) Amarelo(a) (Brandille)	29	18	7	16	117.26	5	2026-04-25 10:25:09	2026-04-25 10:25:09
4293	Camisa Leve Cinza (Mundo Infantil)	19	7	8	8	78.70	22	2026-04-25 10:25:09	2026-04-25 10:25:09
4294	Biquine Turma da Mônica Marrom (Maria Filó Kids)	31	2	13	6	113.02	20	2026-04-25 10:25:09	2026-04-25 10:25:09
4295	Calcinha Durável Azul (Carters)	10	6	1	13	32.52	8	2026-04-25 10:25:09	2026-04-25 10:25:09
4296	Jaqueta Estampado(a) Azul (Colcci Kids)	13	11	1	8	40.43	9	2026-04-25 10:25:09	2026-04-25 10:25:09
4297	Calça Elástico(a) Preto(a) (Puket Kids)	11	5	3	1	73.12	27	2026-04-25 10:25:09	2026-04-25 10:25:09
4298	Jaqueta Longa Cinza (Mundo Pet)	21	11	8	6	10.17	23	2026-04-25 10:25:09	2026-04-25 10:25:09
4299	Short Moleton Amarelo(a) (C&A Kids)	23	17	7	6	106.07	7	2026-04-25 10:25:09	2026-04-25 10:25:09
4300	Calça Listrado Bege (Farm Kids)	20	5	14	14	106.06	14	2026-04-25 10:25:09	2026-04-25 10:25:09
4301	Bermuda Xadrez Dourado(a) (Carters)	32	1	17	12	22.65	8	2026-04-25 10:25:09	2026-04-25 10:25:09
4302	Sutiã Moleton Vinho (Dafiti Kids)	23	19	19	5	67.56	11	2026-04-25 10:25:09	2026-04-25 10:25:09
4303	Camiseta Xadrez Branco(a) (Farm Kids)	32	8	4	18	103.58	14	2026-04-25 10:25:09	2026-04-25 10:25:09
4304	Calcinha Esportivo(a) Prata (Akazys)	12	6	18	1	78.38	2	2026-04-25 10:25:09	2026-04-25 10:25:09
4305	Calcinha Básico(a) Prata (Disney Kids)	4	6	18	2	81.07	13	2026-04-25 10:25:09	2026-04-25 10:25:09
4306	Casaco Stitch Vinho (Mundo Infantil)	28	9	19	19	86.49	22	2026-04-25 10:25:09	2026-04-25 10:25:09
4307	Macacão Esportivo(a) Branco(a) (Brandille)	12	12	4	11	80.50	5	2026-04-25 10:25:09	2026-04-25 10:25:09
4308	Vestido Básico(a) Rosa Choque (Disney Baby)	4	21	10	11	29.56	12	2026-04-25 10:25:09	2026-04-25 10:25:09
4309	Sutiã Xadrez Verde (Colcci Kids)	32	19	5	13	56.09	9	2026-04-25 10:25:09	2026-04-25 10:25:09
4310	Bermuda Ajustável Dourado(a) (Pimpolho)	1	1	17	8	30.75	26	2026-04-25 10:25:09	2026-04-25 10:25:09
4311	Casaco Animal Print Rosa (Dafiti Kids)	3	9	2	7	42.28	11	2026-04-25 10:25:09	2026-04-25 10:25:09
4312	Sutiã Formal Prata (Disney Baby)	16	19	18	12	34.30	12	2026-04-25 10:25:09	2026-04-25 10:25:09
4313	Saia Loney Tunes Cinza (Salsa Jeans Kids)	22	16	8	17	18.49	30	2026-04-25 10:25:09	2026-04-25 10:25:09
4314	Cueca Formal Prata (Lacoste Kids)	16	10	18	17	36.02	18	2026-04-25 10:25:09	2026-04-25 10:25:09
4315	Camisa Esportivo(a) Rosa (Akazys)	12	7	2	2	48.23	2	2026-04-25 10:25:09	2026-04-25 10:25:09
4316	Calcinha Animal Print Vermelho(a) (Renner Kids)	3	6	6	4	60.55	28	2026-04-25 10:25:09	2026-04-25 10:25:09
4317	Pijama Clássico(a) Rosa Choque (Mundo Pet)	6	15	10	15	46.32	23	2026-04-25 10:25:09	2026-04-25 10:25:09
4318	Casaco Poliéster Rosa Choque (C&A Kids)	24	9	10	13	96.84	7	2026-04-25 10:25:09	2026-04-25 10:25:09
4319	Casaco Turma da Mônica Azul (Ki Carinho)	31	9	1	14	108.23	16	2026-04-25 10:25:09	2026-04-25 10:25:09
4320	Casaco Animal Print Verde (Renner Kids)	3	9	5	13	105.58	28	2026-04-25 10:25:09	2026-04-25 10:25:09
4321	Calcinha Labubu Bege (Ki Carinho)	18	6	14	4	27.43	16	2026-04-25 10:25:09	2026-04-25 10:25:09
4322	Bermuda Longa Verde (Kily)	21	1	5	17	52.46	17	2026-04-25 10:25:09	2026-04-25 10:25:09
4323	Casaco Ajustável Verde (Brandille)	1	9	5	5	81.52	5	2026-04-25 10:25:09	2026-04-25 10:25:09
4324	Calça Temático(a) Laranja (Brandille)	29	5	11	12	81.59	5	2026-04-25 10:25:09	2026-04-25 10:25:09
4325	Camiseta Durável Preto(a) (Farm Kids)	10	8	3	17	80.65	14	2026-04-25 10:25:09	2026-04-25 10:25:09
4326	Pijama Loney Tunes Azul (Riachuelo Kids)	22	15	1	6	91.54	29	2026-04-25 10:25:09	2026-04-25 10:25:09
4327	Short Stitch Preto(a) (Kily)	28	17	3	14	14.90	17	2026-04-25 10:25:09	2026-04-25 10:25:09
4328	Sunga Formal Laranja (Adidas Kids)	16	18	11	19	96.77	1	2026-04-25 10:25:09	2026-04-25 10:25:09
4329	Calça Formal Turquesa (Adidas Kids)	16	5	15	7	103.93	1	2026-04-25 10:25:09	2026-04-25 10:25:09
4330	Cueca Básico(a) Dourado(a) (Riachuelo Kids)	4	10	17	10	90.64	29	2026-04-25 10:25:09	2026-04-25 10:25:09
4331	Jaqueta Seda Amarelo(a) (Brandille)	27	11	7	3	47.64	5	2026-04-25 10:25:09	2026-04-25 10:25:09
4332	Camiseta Ajustável Roxo(a) (Boboi)	1	8	12	10	53.90	4	2026-04-25 10:25:09	2026-04-25 10:25:09
4333	Vestido Listrado Azul Escuro(a) (Mundo Pet)	20	21	9	17	46.79	23	2026-04-25 10:25:09	2026-04-25 10:25:09
4334	Vestido Moleton Rosa Choque (Riachuelo Kids)	23	21	10	8	33.48	29	2026-04-25 10:25:09	2026-04-25 10:25:09
4335	Sunga Clássico(a) Lilás (Puket Kids)	6	18	16	14	105.77	27	2026-04-25 10:25:09	2026-04-25 10:25:09
4336	Jaqueta Labubu Azul (Marisol)	18	11	1	8	35.11	21	2026-04-25 10:25:09	2026-04-25 10:25:09
4337	Camisa Loney Tunes Roxo(a) (Lacoste Kids)	22	7	12	10	85.58	18	2026-04-25 10:25:09	2026-04-25 10:25:09
4338	Top Curto(a) Rosa (Mundo Pet)	9	20	2	19	99.97	23	2026-04-25 10:25:09	2026-04-25 10:25:09
4339	Bermuda Elástico(a) Vinho (Bendita Cute)	11	1	19	14	40.63	3	2026-04-25 10:25:09	2026-04-25 10:25:09
4340	Calçado Xadrez Preto(a) (Hering Kids)	32	4	3	4	66.12	15	2026-04-25 10:25:09	2026-04-25 10:25:09
4341	Saia Labubu Dourado(a) (Puket Kids)	18	16	17	3	87.52	27	2026-04-25 10:25:09	2026-04-25 10:25:09
4342	Blusa Listrado Laranja (Puket Kids)	20	3	11	1	77.33	27	2026-04-25 10:25:09	2026-04-25 10:25:09
4343	Bermuda Temático(a) Verde (Colcci Kids)	29	1	5	8	31.41	9	2026-04-25 10:25:09	2026-04-25 10:25:09
4344	Vestido Temático(a) Rosa (Dafiti Kids)	29	21	2	14	41.08	11	2026-04-25 10:25:09	2026-04-25 10:25:09
4345	Vestido Leve Preto(a) (Renner Kids)	19	21	3	6	82.43	28	2026-04-25 10:25:09	2026-04-25 10:25:09
4346	Calça Respirável Rosa (Brandille)	25	5	2	12	78.52	5	2026-04-25 10:25:09	2026-04-25 10:25:09
4347	Calça Ajustável Bege (Riachuelo Kids)	1	5	14	17	47.55	29	2026-04-25 10:25:09	2026-04-25 10:25:09
4348	Calcinha Toy Store Preto(a) (Renner Kids)	30	6	3	9	64.36	28	2026-04-25 10:25:09	2026-04-25 10:25:09
4349	Meia Animal Print Prata (Lilica Ripilica)	3	14	18	18	113.04	19	2026-04-25 10:25:09	2026-04-25 10:25:09
4350	Top Básico(a) Vinho (Mundo Pet)	4	20	19	14	107.89	23	2026-04-25 10:25:09	2026-04-25 10:25:09
4351	Biquine Curto(a) Cinza (Pimpolho)	9	2	8	10	62.11	26	2026-04-25 10:25:09	2026-04-25 10:25:09
4352	Sunga Moleton Prata (Conjunto Infantil)	23	18	18	18	103.14	10	2026-04-25 10:25:09	2026-04-25 10:25:09
4353	Blusa Moleton Cinza (Brandille)	23	3	8	5	52.11	5	2026-04-25 10:25:09	2026-04-25 10:25:09
4354	Bermuda Colorido(a) Roxo(a) (Marisol)	7	1	12	13	80.79	21	2026-04-25 10:25:09	2026-04-25 10:25:09
4355	Camisa Jeans Verde (Lacoste Kids)	17	7	5	10	88.82	18	2026-04-25 10:25:09	2026-04-25 10:25:09
4356	Pijama Durável Turquesa (Salsa Jeans Kids)	10	15	15	3	84.69	30	2026-04-25 10:25:09	2026-04-25 10:25:09
4357	Saia Toy Store Amarelo(a) (Mundo Pet)	30	16	7	8	78.72	23	2026-04-25 10:25:09	2026-04-25 10:25:09
4358	Blusa Jeans Rosa Choque (Marisol)	17	3	10	10	87.12	21	2026-04-25 10:25:09	2026-04-25 10:25:09
4359	Camisa Durável Roxo(a) (Maria Filó Kids)	10	7	12	2	48.96	20	2026-04-25 10:25:09	2026-04-25 10:25:09
4360	Calcinha Algodão Cáqui (Bendita Cute)	2	6	20	13	105.84	3	2026-04-25 10:25:09	2026-04-25 10:25:09
4361	Jaqueta Elástico(a) Bege (Adidas Kids)	11	11	14	18	69.22	1	2026-04-25 10:25:09	2026-04-25 10:25:09
4362	Calcinha Fit Bege (Zoe Kids)	14	6	14	12	24.33	31	2026-04-25 10:25:09	2026-04-25 10:25:09
4363	Sunga Floral Azul Escuro(a) (Osklen Kids)	15	18	9	17	85.07	24	2026-04-25 10:25:09	2026-04-25 10:25:09
4364	Blusa Stitch Dourado(a) (Adidas Kids)	28	3	17	15	58.86	1	2026-04-25 10:25:09	2026-04-25 10:25:09
4365	Casaco Longa Rosa (Farm Kids)	21	9	2	9	66.80	14	2026-04-25 10:25:09	2026-04-25 10:25:09
4366	Calçado Stitch Laranja (Farm Kids)	28	4	11	17	46.96	14	2026-04-25 10:25:09	2026-04-25 10:25:09
4367	Biquine Loney Tunes Roxo(a) (Petit Royal)	22	2	12	13	83.76	25	2026-04-25 10:25:09	2026-04-25 10:25:09
4368	Macacão Loney Tunes Amarelo(a) (Mundo Pet)	22	12	7	2	42.41	23	2026-04-25 10:25:09	2026-04-25 10:25:09
4369	Maiô Ajustável Vermelho(a) (Farm Kids)	1	13	6	8	96.32	14	2026-04-25 10:25:09	2026-04-25 10:25:09
4370	Macacão Estampado(a) Amarelo(a) (Marisol)	13	12	7	6	39.21	21	2026-04-25 10:25:09	2026-04-25 10:25:09
4371	Camisa Moleton Azul (Conjunto Infantil)	23	7	1	5	69.40	10	2026-04-25 10:25:09	2026-04-25 10:25:09
4372	Bermuda Listrado Preto(a) (Maria Filó Kids)	20	1	3	5	22.49	20	2026-04-25 10:25:09	2026-04-25 10:25:09
4373	Cueca Colorido(a) Verde (Renner Kids)	7	10	5	14	62.11	28	2026-04-25 10:25:09	2026-04-25 10:25:09
4374	Calcinha Formal Verde (Disney Kids)	16	6	5	9	73.95	13	2026-04-25 10:25:09	2026-04-25 10:25:09
4375	Saia Jeans Azul Escuro(a) (Mundo Pet)	17	16	9	1	66.79	23	2026-04-25 10:25:09	2026-04-25 10:25:09
4376	Vestido Moleton Azul Escuro(a) (Carters)	23	21	9	12	53.93	8	2026-04-25 10:25:09	2026-04-25 10:25:09
4377	Biquine Formal Branco(a) (Maria Filó Kids)	16	2	4	12	49.18	20	2026-04-25 10:25:09	2026-04-25 10:25:09
4378	Meia Durável Cinza (Mundo Pet)	10	14	8	5	41.56	23	2026-04-25 10:25:09	2026-04-25 10:25:09
4379	Casaco Jeans Prata (Bendita Cute)	17	9	18	17	57.46	3	2026-04-25 10:25:09	2026-04-25 10:25:09
4380	Biquine Moleton Rosa Choque (Puket Kids)	23	2	10	8	67.46	27	2026-04-25 10:25:09	2026-04-25 10:25:09
4381	Calçado Saja Cáqui (Lilica Ripilica)	26	4	20	16	97.52	19	2026-04-25 10:25:09	2026-04-25 10:25:09
4382	Saia Casual Roxo(a) (Akazys)	5	16	12	12	106.74	2	2026-04-25 10:25:09	2026-04-25 10:25:09
4383	Camisa Floral Azul Escuro(a) (Zoe Kids)	15	7	9	11	71.16	31	2026-04-25 10:25:09	2026-04-25 10:25:09
4384	Macacão Colorido(a) Turquesa (Zoe Kids)	7	12	15	1	42.63	31	2026-04-25 10:25:09	2026-04-25 10:25:09
4385	Blusa Formal Rosa Choque (Mundo Pet)	16	3	10	16	116.01	23	2026-04-25 10:25:09	2026-04-25 10:25:09
4386	Sutiã Poliéster Branco(a) (Lacoste Kids)	24	19	4	17	110.30	18	2026-04-25 10:25:09	2026-04-25 10:25:09
4387	Jaqueta Formal Cáqui (Pimpolho)	16	11	20	4	80.37	26	2026-04-25 10:25:09	2026-04-25 10:25:09
4388	Sunga Curto(a) Turquesa (Colcci Kids)	9	18	15	16	38.04	9	2026-04-25 10:25:09	2026-04-25 10:25:09
4389	Biquine Curto(a) Lilás (Mundo Infantil)	9	2	16	2	45.93	22	2026-04-25 10:25:09	2026-04-25 10:25:09
4390	Camiseta Básico(a) Amarelo(a) (C&A Baby)	4	8	7	2	72.39	6	2026-04-25 10:25:09	2026-04-25 10:25:09
4391	Biquine Elástico(a) Bege (Renner Kids)	11	2	14	15	26.97	28	2026-04-25 10:25:09	2026-04-25 10:25:09
4392	Biquine Confortável Azul Escuro(a) (Puket Kids)	8	2	9	18	34.84	27	2026-04-25 10:25:09	2026-04-25 10:25:09
4393	Maiô Saja Lilás (Colcci Kids)	26	13	16	4	20.25	9	2026-04-25 10:25:09	2026-04-25 10:25:09
4394	Biquine Casual Azul (Carters)	5	2	1	18	93.30	8	2026-04-25 10:25:09	2026-04-25 10:25:09
4395	Biquine Confortável Branco(a) (Mundo Infantil)	8	2	4	1	55.00	22	2026-04-25 10:25:09	2026-04-25 10:25:09
4396	Blusa Temático(a) Cáqui (Petit Royal)	29	3	20	11	44.14	25	2026-04-25 10:25:09	2026-04-25 10:25:09
4397	Casaco Saja Rosa Choque (C&A Kids)	26	9	10	11	116.54	7	2026-04-25 10:25:09	2026-04-25 10:25:09
4398	Saia Leve Lilás (Zoe Kids)	19	16	16	5	49.93	31	2026-04-25 10:25:09	2026-04-25 10:25:09
4399	Short Respirável Amarelo(a) (Petit Royal)	25	17	7	12	117.71	25	2026-04-25 10:25:09	2026-04-25 10:25:09
4400	Calçado Stitch Dourado(a) (Osklen Kids)	28	4	17	19	94.92	24	2026-04-25 10:25:09	2026-04-25 10:25:09
4401	Casaco Toy Store Cáqui (Lacoste Kids)	30	9	20	19	75.32	18	2026-04-25 10:25:09	2026-04-25 10:25:09
4402	Macacão Labubu Amarelo(a) (Renner Kids)	18	12	7	3	26.18	28	2026-04-25 10:25:09	2026-04-25 10:25:09
4403	Casaco Moleton Bege (Kily)	23	9	14	16	102.55	17	2026-04-25 10:25:09	2026-04-25 10:25:09
4404	Calçado Casual Lilás (Farm Kids)	5	4	16	1	114.22	14	2026-04-25 10:25:09	2026-04-25 10:25:09
4405	Sutiã Durável Vermelho(a) (Disney Baby)	10	19	6	7	24.45	12	2026-04-25 10:25:09	2026-04-25 10:25:09
4406	Maiô Durável Turquesa (Osklen Kids)	10	13	15	4	48.03	24	2026-04-25 10:25:09	2026-04-25 10:25:09
4407	Casaco Turma da Mônica Dourado(a) (Hering Kids)	31	9	17	7	99.28	15	2026-04-25 10:25:09	2026-04-25 10:25:09
4408	Top Animal Print Prata (Osklen Kids)	3	20	18	15	100.33	24	2026-04-25 10:25:09	2026-04-25 10:25:09
4409	Short Seda Vermelho(a) (Puket Kids)	27	17	6	5	13.91	27	2026-04-25 10:25:09	2026-04-25 10:25:09
4410	Top Estampado(a) Amarelo(a) (Farm Kids)	13	20	7	15	114.27	14	2026-04-25 10:25:09	2026-04-25 10:25:09
4411	Short Esportivo(a) Dourado(a) (C&A Baby)	12	17	17	16	48.96	6	2026-04-25 10:25:09	2026-04-25 10:25:09
4412	Camiseta Algodão Azul Escuro(a) (Zoe Kids)	2	8	9	18	114.52	31	2026-04-25 10:25:09	2026-04-25 10:25:09
4413	Pijama Listrado Vermelho(a) (Kily)	20	15	6	3	88.37	17	2026-04-25 10:25:09	2026-04-25 10:25:09
4414	Maiô Formal Azul Escuro(a) (Riachuelo Kids)	16	13	9	13	49.89	29	2026-04-25 10:25:09	2026-04-25 10:25:09
4415	Jaqueta Longa Rosa Choque (Akazys)	21	11	10	4	79.99	2	2026-04-25 10:25:09	2026-04-25 10:25:09
4416	Jaqueta Formal Laranja (Maria Filó Kids)	16	11	11	8	87.48	20	2026-04-25 10:25:09	2026-04-25 10:25:09
4417	Calçado Elástico(a) Rosa (Adidas Kids)	11	4	2	7	64.75	1	2026-04-25 10:25:09	2026-04-25 10:25:09
4418	Blusa Algodão Cáqui (Colcci Kids)	2	3	20	15	85.98	9	2026-04-25 10:25:09	2026-04-25 10:25:09
4419	Camisa Ajustável Azul (Bendita Cute)	1	7	1	11	25.84	3	2026-04-25 10:25:09	2026-04-25 10:25:09
4420	Pijama Moleton Cáqui (Salsa Jeans Kids)	23	15	20	5	42.21	30	2026-04-25 10:25:09	2026-04-25 10:25:09
4421	Macacão Labubu Rosa Choque (Riachuelo Kids)	18	12	10	6	66.36	29	2026-04-25 10:25:09	2026-04-25 10:25:09
4422	Casaco Loney Tunes Cinza (Adidas Kids)	22	9	8	10	65.30	1	2026-04-25 10:25:09	2026-04-25 10:25:09
4423	Jaqueta Respirável Azul Escuro(a) (Conjunto Infantil)	25	11	9	15	33.15	10	2026-04-25 10:25:09	2026-04-25 10:25:09
4424	Maiô Respirável Azul Escuro(a) (Lilica Ripilica)	25	13	9	8	78.16	19	2026-04-25 10:25:09	2026-04-25 10:25:09
4425	Top Respirável Roxo(a) (Hering Kids)	25	20	12	11	24.35	15	2026-04-25 10:25:09	2026-04-25 10:25:09
4426	Meia Xadrez Branco(a) (Puket Kids)	32	14	4	13	91.85	27	2026-04-25 10:25:09	2026-04-25 10:25:09
4427	Maiô Turma da Mônica Prata (Dafiti Kids)	31	13	18	14	98.31	11	2026-04-25 10:25:09	2026-04-25 10:25:09
4428	Camisa Curto(a) Vermelho(a) (Adidas Kids)	9	7	6	15	41.89	1	2026-04-25 10:25:09	2026-04-25 10:25:09
4429	Vestido Temático(a) Cáqui (Carters)	29	21	20	5	103.27	8	2026-04-25 10:25:09	2026-04-25 10:25:09
4430	Pijama Moleton Amarelo(a) (Kily)	23	15	7	16	101.99	17	2026-04-25 10:25:09	2026-04-25 10:25:09
4431	Camisa Listrado Azul (Osklen Kids)	20	7	1	16	82.17	24	2026-04-25 10:25:09	2026-04-25 10:25:09
4432	Vestido Stitch Verde (Farm Kids)	28	21	5	5	64.80	14	2026-04-25 10:25:09	2026-04-25 10:25:09
4433	Cueca Labubu Laranja (C&A Kids)	18	10	11	9	69.67	7	2026-04-25 10:25:09	2026-04-25 10:25:09
4434	Sunga Fit Lilás (Renner Kids)	14	18	16	2	81.80	28	2026-04-25 10:25:09	2026-04-25 10:25:09
4435	Macacão Jeans Bege (Riachuelo Kids)	17	12	14	16	56.58	29	2026-04-25 10:25:09	2026-04-25 10:25:09
4436	Top Algodão Verde (Disney Baby)	2	20	5	7	64.79	12	2026-04-25 10:25:09	2026-04-25 10:25:09
4437	Sunga Saja Lilás (Bendita Cute)	26	18	16	12	26.38	3	2026-04-25 10:25:09	2026-04-25 10:25:09
4438	Biquine Saja Branco(a) (Lacoste Kids)	26	2	4	16	13.13	18	2026-04-25 10:25:09	2026-04-25 10:25:09
4439	Sutiã Listrado Vermelho(a) (Petit Royal)	20	19	6	14	28.20	25	2026-04-25 10:25:09	2026-04-25 10:25:09
4440	Calcinha Seda Dourado(a) (Renner Kids)	27	6	17	4	54.94	28	2026-04-25 10:25:09	2026-04-25 10:25:09
4441	Maiô Temático(a) Roxo(a) (Colcci Kids)	29	13	12	7	16.83	9	2026-04-25 10:25:09	2026-04-25 10:25:09
4442	Vestido Seda Cinza (Petit Royal)	27	21	8	6	112.05	25	2026-04-25 10:25:09	2026-04-25 10:25:09
4443	Saia Formal Cinza (Ki Carinho)	16	16	8	15	55.26	16	2026-04-25 10:25:09	2026-04-25 10:25:09
4444	Maiô Leve Prata (Maria Filó Kids)	19	13	18	4	41.15	20	2026-04-25 10:25:09	2026-04-25 10:25:09
4445	Jaqueta Estampado(a) Lilás (Renner Kids)	13	11	16	7	62.94	28	2026-04-25 10:25:09	2026-04-25 10:25:09
4446	Casaco Stitch Amarelo(a) (Puket Kids)	28	9	7	15	54.41	27	2026-04-25 10:25:09	2026-04-25 10:25:09
4447	Calçado Respirável Bege (Zoe Kids)	25	4	14	19	22.73	31	2026-04-25 10:25:09	2026-04-25 10:25:09
4448	Maiô Casual Vermelho(a) (Disney Kids)	5	13	6	10	34.43	13	2026-04-25 10:25:09	2026-04-25 10:25:09
4449	Saia Longa Roxo(a) (Renner Kids)	21	16	12	13	80.91	28	2026-04-25 10:25:09	2026-04-25 10:25:09
4450	Calça Temático(a) Azul (Kily)	29	5	1	18	82.24	17	2026-04-25 10:25:09	2026-04-25 10:25:09
4451	Pijama Clássico(a) Vermelho(a) (Ki Carinho)	6	15	6	8	96.99	16	2026-04-25 10:25:09	2026-04-25 10:25:09
4452	Meia Colorido(a) Prata (C&A Baby)	7	14	18	15	97.00	6	2026-04-25 10:25:09	2026-04-25 10:25:09
4453	Blusa Jeans Preto(a) (Bendita Cute)	17	3	3	19	65.95	3	2026-04-25 10:25:09	2026-04-25 10:25:09
4454	Camisa Colorido(a) Turquesa (Renner Kids)	7	7	15	8	62.64	28	2026-04-25 10:25:09	2026-04-25 10:25:09
4455	Top Esportivo(a) Preto(a) (Riachuelo Kids)	12	20	3	1	78.35	29	2026-04-25 10:25:09	2026-04-25 10:25:09
4456	Meia Durável Verde (Conjunto Infantil)	10	14	5	15	28.97	10	2026-04-25 10:25:09	2026-04-25 10:25:09
4457	Camisa Xadrez Laranja (Farm Kids)	32	7	11	1	77.56	14	2026-04-25 10:25:09	2026-04-25 10:25:09
4458	Pijama Moleton Cinza (Conjunto Infantil)	23	15	8	12	49.57	10	2026-04-25 10:25:09	2026-04-25 10:25:09
4459	Vestido Leve Prata (Carters)	19	21	18	13	62.68	8	2026-04-25 10:25:09	2026-04-25 10:25:09
4460	Sutiã Poliéster Dourado(a) (Maria Filó Kids)	24	19	17	18	27.42	20	2026-04-25 10:25:09	2026-04-25 10:25:09
4461	Top Casual Marrom (Marisol)	5	20	13	18	112.15	21	2026-04-25 10:25:09	2026-04-25 10:25:09
4462	Camisa Colorido(a) Cinza (Dafiti Kids)	7	7	8	16	49.53	11	2026-04-25 10:25:09	2026-04-25 10:25:09
4463	Vestido Seda Prata (Zoe Kids)	27	21	18	13	34.54	31	2026-04-25 10:25:09	2026-04-25 10:25:09
4464	Cueca Clássico(a) Vinho (Lacoste Kids)	6	10	19	17	50.79	18	2026-04-25 10:25:09	2026-04-25 10:25:09
4465	Cueca Xadrez Rosa (Lilica Ripilica)	32	10	2	4	98.40	19	2026-04-25 10:25:09	2026-04-25 10:25:09
4466	Camisa Longa Turquesa (Bendita Cute)	21	7	15	7	69.22	3	2026-04-25 10:25:09	2026-04-25 10:25:09
4467	Short Longa Prata (Lilica Ripilica)	21	17	18	7	30.98	19	2026-04-25 10:25:09	2026-04-25 10:25:09
4468	Calça Leve Vermelho(a) (Maria Filó Kids)	19	5	6	19	111.12	20	2026-04-25 10:25:09	2026-04-25 10:25:09
4469	Saia Durável Cinza (Osklen Kids)	10	16	8	15	98.15	24	2026-04-25 10:25:09	2026-04-25 10:25:09
4470	Sutiã Confortável Azul Escuro(a) (Mundo Infantil)	8	19	9	9	85.00	22	2026-04-25 10:25:09	2026-04-25 10:25:09
4471	Sutiã Xadrez Branco(a) (Colcci Kids)	32	19	4	6	76.21	9	2026-04-25 10:25:09	2026-04-25 10:25:09
4472	Top Toy Store Roxo(a) (Carters)	30	20	12	19	27.50	8	2026-04-25 10:25:09	2026-04-25 10:25:09
4473	Saia Labubu Vinho (Pimpolho)	18	16	19	15	109.78	26	2026-04-25 10:25:09	2026-04-25 10:25:09
4474	Camisa Ajustável Amarelo(a) (Pimpolho)	1	7	7	3	87.11	26	2026-04-25 10:25:09	2026-04-25 10:25:09
4475	Maiô Animal Print Laranja (Maria Filó Kids)	3	13	11	5	17.47	20	2026-04-25 10:25:09	2026-04-25 10:25:09
4476	Calça Curto(a) Cinza (Boboi)	9	5	8	6	20.14	4	2026-04-25 10:25:09	2026-04-25 10:25:09
4477	Calçado Clássico(a) Cáqui (Colcci Kids)	6	4	20	18	101.66	9	2026-04-25 10:25:09	2026-04-25 10:25:09
4478	Camisa Poliéster Marrom (Colcci Kids)	24	7	13	11	89.80	9	2026-04-25 10:25:09	2026-04-25 10:25:09
4479	Sutiã Durável Vinho (Salsa Jeans Kids)	10	19	19	10	60.58	30	2026-04-25 10:25:09	2026-04-25 10:25:09
4480	Camiseta Temático(a) Rosa Choque (Puket Kids)	29	8	10	14	98.36	27	2026-04-25 10:25:09	2026-04-25 10:25:09
4481	Bermuda Seda Amarelo(a) (Mundo Pet)	27	1	7	17	41.52	23	2026-04-25 10:25:09	2026-04-25 10:25:09
4482	Blusa Durável Rosa (Hering Kids)	10	3	2	9	28.75	15	2026-04-25 10:25:09	2026-04-25 10:25:09
4483	Sutiã Stitch Rosa (Disney Kids)	28	19	2	12	30.33	13	2026-04-25 10:25:09	2026-04-25 10:25:09
4484	Casaco Algodão Amarelo(a) (Disney Baby)	2	9	7	9	49.48	12	2026-04-25 10:25:09	2026-04-25 10:25:09
4485	Bermuda Leve Branco(a) (Maria Filó Kids)	19	1	4	18	33.67	20	2026-04-25 10:25:09	2026-04-25 10:25:09
4486	Calçado Stitch Dourado(a) (Conjunto Infantil)	28	4	17	17	46.13	10	2026-04-25 10:25:09	2026-04-25 10:25:09
4487	Maiô Toy Store Vermelho(a) (Marisol)	30	13	6	9	51.81	21	2026-04-25 10:25:09	2026-04-25 10:25:09
4488	Pijama Stitch Prata (Lilica Ripilica)	28	15	18	11	27.05	19	2026-04-25 10:25:09	2026-04-25 10:25:09
4489	Short Xadrez Vermelho(a) (Akazys)	32	17	6	19	34.92	2	2026-04-25 10:25:09	2026-04-25 10:25:09
4490	Biquine Toy Store Azul (Carters)	30	2	1	16	20.67	8	2026-04-25 10:25:09	2026-04-25 10:25:09
4491	Top Estampado(a) Amarelo(a) (Kily)	13	20	7	3	100.37	17	2026-04-25 10:25:09	2026-04-25 10:25:09
4492	Meia Animal Print Amarelo(a) (Kily)	3	14	7	16	12.94	17	2026-04-25 10:25:09	2026-04-25 10:25:09
4493	Saia Básico(a) Vinho (Pimpolho)	4	16	19	10	32.32	26	2026-04-25 10:25:09	2026-04-25 10:25:09
4494	Calcinha Algodão Dourado(a) (Ki Carinho)	2	6	17	4	77.29	16	2026-04-25 10:25:09	2026-04-25 10:25:09
4495	Pijama Curto(a) Rosa Choque (Salsa Jeans Kids)	9	15	10	14	97.14	30	2026-04-25 10:25:09	2026-04-25 10:25:09
4496	Jaqueta Casual Vinho (Marisol)	5	11	19	16	16.96	21	2026-04-25 10:25:09	2026-04-25 10:25:09
4497	Camiseta Estampado(a) Bege (Puket Kids)	13	8	14	7	66.40	27	2026-04-25 10:25:09	2026-04-25 10:25:09
4498	Calcinha Xadrez Lilás (Disney Kids)	32	6	16	6	112.00	13	2026-04-25 10:25:09	2026-04-25 10:25:09
4499	Calcinha Formal Prata (C&A Baby)	16	6	18	10	115.82	6	2026-04-25 10:25:09	2026-04-25 10:25:09
4500	Macacão Colorido(a) Lilás (Puket Kids)	7	12	16	3	94.53	27	2026-04-25 10:25:09	2026-04-25 10:25:09
4501	Calcinha Turma da Mônica Azul (Colcci Kids)	31	6	1	13	114.49	9	2026-04-25 10:25:09	2026-04-25 10:25:09
4502	Calcinha Durável Branco(a) (Akazys)	10	6	4	11	98.56	2	2026-04-25 10:25:09	2026-04-25 10:25:09
4503	Camiseta Formal Laranja (Disney Kids)	16	8	11	17	79.38	13	2026-04-25 10:25:09	2026-04-25 10:25:09
4504	Calcinha Confortável Verde (Osklen Kids)	8	6	5	6	67.40	24	2026-04-25 10:25:09	2026-04-25 10:25:09
4505	Pijama Casual Turquesa (Kily)	5	15	15	14	67.83	17	2026-04-25 10:25:09	2026-04-25 10:25:09
4506	Sunga Toy Store Verde (Maria Filó Kids)	30	18	5	15	90.25	20	2026-04-25 10:25:09	2026-04-25 10:25:09
4507	Short Confortável Verde (C&A Baby)	8	17	5	16	101.77	6	2026-04-25 10:25:09	2026-04-25 10:25:09
4508	Bermuda Poliéster Roxo(a) (Pimpolho)	24	1	12	18	18.88	26	2026-04-25 10:25:09	2026-04-25 10:25:09
4509	Vestido Colorido(a) Bege (Adidas Kids)	7	21	14	1	25.29	1	2026-04-25 10:25:09	2026-04-25 10:25:09
4510	Short Longa Dourado(a) (Mundo Pet)	21	17	17	11	72.79	23	2026-04-25 10:25:09	2026-04-25 10:25:09
4511	Top Toy Store Laranja (Akazys)	30	20	11	13	43.09	2	2026-04-25 10:25:09	2026-04-25 10:25:09
4512	Vestido Temático(a) Laranja (Mundo Pet)	29	21	11	9	96.43	23	2026-04-25 10:25:09	2026-04-25 10:25:09
4513	Meia Animal Print Roxo(a) (Akazys)	3	14	12	4	117.69	2	2026-04-25 10:25:09	2026-04-25 10:25:09
4514	Camisa Poliéster Amarelo(a) (C&A Kids)	24	7	7	1	89.32	7	2026-04-25 10:25:09	2026-04-25 10:25:09
4515	Pijama Temático(a) Preto(a) (Brandille)	29	15	3	10	81.03	5	2026-04-25 10:25:09	2026-04-25 10:25:09
4516	Pijama Estampado(a) Prata (Zoe Kids)	13	15	18	12	57.25	31	2026-04-25 10:25:09	2026-04-25 10:25:09
4517	Saia Ajustável Preto(a) (Lilica Ripilica)	1	16	3	16	16.59	19	2026-04-25 10:25:09	2026-04-25 10:25:09
4518	Biquine Esportivo(a) Bege (Disney Kids)	12	2	14	12	99.11	13	2026-04-25 10:25:09	2026-04-25 10:25:09
4519	Vestido Colorido(a) Prata (Petit Royal)	7	21	18	15	118.32	25	2026-04-25 10:25:09	2026-04-25 10:25:09
4520	Calcinha Jeans Prata (Pimpolho)	17	6	18	11	49.42	26	2026-04-25 10:25:09	2026-04-25 10:25:09
4521	Calcinha Jeans Marrom (Dafiti Kids)	17	6	13	14	45.97	11	2026-04-25 10:25:09	2026-04-25 10:25:09
4522	Jaqueta Formal Rosa (Disney Baby)	16	11	2	3	91.08	12	2026-04-25 10:25:09	2026-04-25 10:25:09
4523	Jaqueta Loney Tunes Bege (Ki Carinho)	22	11	14	10	52.02	16	2026-04-25 10:25:09	2026-04-25 10:25:09
4524	Top Fit Azul Escuro(a) (Renner Kids)	14	20	9	16	15.54	28	2026-04-25 10:25:09	2026-04-25 10:25:09
4525	Meia Turma da Mônica Marrom (Mundo Infantil)	31	14	13	12	87.48	22	2026-04-25 10:25:09	2026-04-25 10:25:09
4526	Short Saja Cáqui (Farm Kids)	26	17	20	9	43.28	14	2026-04-25 10:25:09	2026-04-25 10:25:09
4527	Sutiã Labubu Preto(a) (Carters)	18	19	3	4	21.19	8	2026-04-25 10:25:09	2026-04-25 10:25:09
4528	Bermuda Formal Prata (C&A Baby)	16	1	18	4	37.69	6	2026-04-25 10:25:09	2026-04-25 10:25:09
4529	Top Formal Vermelho(a) (Hering Kids)	16	20	6	3	51.42	15	2026-04-25 10:25:09	2026-04-25 10:25:09
4530	Biquine Leve Lilás (Farm Kids)	19	2	16	6	21.14	14	2026-04-25 10:25:09	2026-04-25 10:25:09
4531	Calça Ajustável Vinho (Adidas Kids)	1	5	19	4	86.27	1	2026-04-25 10:25:09	2026-04-25 10:25:09
4532	Short Durável Lilás (C&A Kids)	10	17	16	14	90.33	7	2026-04-25 10:25:09	2026-04-25 10:25:09
4533	Pijama Fit Turquesa (Hering Kids)	14	15	15	3	70.62	15	2026-04-25 10:25:09	2026-04-25 10:25:09
4534	Vestido Loney Tunes Azul Escuro(a) (C&A Baby)	22	21	9	17	54.30	6	2026-04-25 10:25:09	2026-04-25 10:25:09
4535	Saia Casual Azul Escuro(a) (Farm Kids)	5	16	9	1	57.74	14	2026-04-25 10:25:09	2026-04-25 10:25:09
4536	Short Casual Roxo(a) (Puket Kids)	5	17	12	1	45.83	27	2026-04-25 10:25:09	2026-04-25 10:25:09
4537	Maiô Saja Preto(a) (Adidas Kids)	26	13	3	16	80.25	1	2026-04-25 10:25:09	2026-04-25 10:25:09
4538	Biquine Longa Laranja (Ki Carinho)	21	2	11	12	84.75	16	2026-04-25 10:25:09	2026-04-25 10:25:09
4539	Bermuda Confortável Lilás (Petit Royal)	8	1	16	3	113.01	25	2026-04-25 10:25:09	2026-04-25 10:25:09
4540	Meia Xadrez Turquesa (Renner Kids)	32	14	15	15	69.39	28	2026-04-25 10:25:09	2026-04-25 10:25:09
4541	Calcinha Colorido(a) Rosa Choque (C&A Kids)	7	6	10	10	92.02	7	2026-04-25 10:25:09	2026-04-25 10:25:09
4542	Casaco Jeans Cinza (Renner Kids)	17	9	8	9	96.69	28	2026-04-25 10:25:09	2026-04-25 10:25:09
4543	Maiô Loney Tunes Azul (Mundo Infantil)	22	13	1	2	46.04	22	2026-04-25 10:25:09	2026-04-25 10:25:09
4544	Short Floral Laranja (C&A Baby)	15	17	11	16	86.16	6	2026-04-25 10:25:09	2026-04-25 10:25:09
4545	Bermuda Poliéster Lilás (Pimpolho)	24	1	16	2	94.47	26	2026-04-25 10:25:09	2026-04-25 10:25:09
4546	Top Básico(a) Verde (C&A Baby)	4	20	5	12	52.11	6	2026-04-25 10:25:09	2026-04-25 10:25:09
4547	Macacão Estampado(a) Azul (Brandille)	13	12	1	11	85.71	5	2026-04-25 10:25:09	2026-04-25 10:25:09
4548	Jaqueta Confortável Verde (Colcci Kids)	8	11	5	3	35.68	9	2026-04-25 10:25:09	2026-04-25 10:25:09
4549	Meia Leve Verde (Riachuelo Kids)	19	14	5	11	52.20	29	2026-04-25 10:25:09	2026-04-25 10:25:09
4550	Saia Turma da Mônica Turquesa (C&A Kids)	31	16	15	19	57.05	7	2026-04-25 10:25:09	2026-04-25 10:25:09
4551	Top Fit Cinza (Mundo Infantil)	14	20	8	10	94.15	22	2026-04-25 10:25:09	2026-04-25 10:25:09
4552	Calcinha Algodão Branco(a) (Carters)	2	6	4	7	25.90	8	2026-04-25 10:25:09	2026-04-25 10:25:09
4553	Vestido Turma da Mônica Lilás (Mundo Infantil)	31	21	16	15	58.85	22	2026-04-25 10:25:09	2026-04-25 10:25:09
4554	Calça Longa Cáqui (Renner Kids)	21	5	20	17	18.54	28	2026-04-25 10:25:09	2026-04-25 10:25:09
4555	Maiô Turma da Mônica Vinho (Hering Kids)	31	13	19	18	73.13	15	2026-04-25 10:25:09	2026-04-25 10:25:09
4556	Calçado Durável Laranja (Hering Kids)	10	4	11	2	102.89	15	2026-04-25 10:25:09	2026-04-25 10:25:09
4557	Blusa Seda Preto(a) (Osklen Kids)	27	3	3	17	64.50	24	2026-04-25 10:25:09	2026-04-25 10:25:09
4558	Cueca Toy Store Rosa (Carters)	30	10	2	19	119.89	8	2026-04-25 10:25:09	2026-04-25 10:25:09
4559	Macacão Listrado Azul Escuro(a) (Lilica Ripilica)	20	12	9	17	87.64	19	2026-04-25 10:25:09	2026-04-25 10:25:09
4560	Jaqueta Clássico(a) Branco(a) (Maria Filó Kids)	6	11	4	15	93.35	20	2026-04-25 10:25:09	2026-04-25 10:25:09
4561	Casaco Listrado Azul Escuro(a) (Zoe Kids)	20	9	9	11	60.48	31	2026-04-25 10:25:09	2026-04-25 10:25:09
4562	Short Casual Laranja (Kily)	5	17	11	10	96.11	17	2026-04-25 10:25:09	2026-04-25 10:25:09
4563	Saia Fit Dourado(a) (Renner Kids)	14	16	17	12	77.04	28	2026-04-25 10:25:09	2026-04-25 10:25:09
4564	Calça Poliéster Prata (Lilica Ripilica)	24	5	18	5	59.79	19	2026-04-25 10:25:09	2026-04-25 10:25:09
4565	Sunga Casual Dourado(a) (Puket Kids)	5	18	17	13	48.60	27	2026-04-25 10:25:09	2026-04-25 10:25:09
4566	Cueca Loney Tunes Cinza (Brandille)	22	10	8	5	84.15	5	2026-04-25 10:25:09	2026-04-25 10:25:09
4567	Calçado Animal Print Prata (Ki Carinho)	3	4	18	18	48.83	16	2026-04-25 10:25:09	2026-04-25 10:25:09
4568	Biquine Seda Branco(a) (Petit Royal)	27	2	4	3	100.96	25	2026-04-25 10:25:09	2026-04-25 10:25:09
4569	Pijama Saja Turquesa (Petit Royal)	26	15	15	3	78.46	25	2026-04-25 10:25:09	2026-04-25 10:25:09
4570	Meia Estampado(a) Preto(a) (Osklen Kids)	13	14	3	5	85.36	24	2026-04-25 10:25:09	2026-04-25 10:25:09
4571	Camiseta Temático(a) Verde (Salsa Jeans Kids)	29	8	5	2	102.35	30	2026-04-25 10:25:09	2026-04-25 10:25:09
4572	Calcinha Formal Dourado(a) (Colcci Kids)	16	6	17	14	114.89	9	2026-04-25 10:25:09	2026-04-25 10:25:09
4573	Camisa Longa Azul Escuro(a) (Colcci Kids)	21	7	9	12	96.74	9	2026-04-25 10:25:09	2026-04-25 10:25:09
4574	Calçado Turma da Mônica Branco(a) (Renner Kids)	31	4	4	19	30.38	28	2026-04-25 10:25:09	2026-04-25 10:25:09
4575	Blusa Seda Verde (Renner Kids)	27	3	5	16	46.56	28	2026-04-25 10:25:09	2026-04-25 10:25:09
4576	Cueca Estampado(a) Bege (Conjunto Infantil)	13	10	14	11	86.74	10	2026-04-25 10:25:09	2026-04-25 10:25:09
4577	Calça Respirável Cinza (Dafiti Kids)	25	5	8	3	88.88	11	2026-04-25 10:25:09	2026-04-25 10:25:09
4578	Top Algodão Azul (Farm Kids)	2	20	1	4	31.88	14	2026-04-25 10:25:09	2026-04-25 10:25:09
4579	Cueca Clássico(a) Prata (Pimpolho)	6	10	18	16	115.39	26	2026-04-25 10:25:09	2026-04-25 10:25:09
4580	Pijama Confortável Laranja (Kily)	8	15	11	10	107.25	17	2026-04-25 10:25:09	2026-04-25 10:25:09
4581	Casaco Saja Dourado(a) (Conjunto Infantil)	26	9	17	14	109.98	10	2026-04-25 10:25:09	2026-04-25 10:25:09
4582	Calcinha Fit Branco(a) (Carters)	14	6	4	7	61.68	8	2026-04-25 10:25:09	2026-04-25 10:25:09
4583	Calçado Casual Roxo(a) (Colcci Kids)	5	4	12	6	67.33	9	2026-04-25 10:25:09	2026-04-25 10:25:09
4584	Jaqueta Moleton Roxo(a) (Disney Baby)	23	11	12	8	35.30	12	2026-04-25 10:25:09	2026-04-25 10:25:09
4585	Casaco Moleton Branco(a) (C&A Baby)	23	9	4	8	101.85	6	2026-04-25 10:25:09	2026-04-25 10:25:09
4586	Blusa Floral Branco(a) (Zoe Kids)	15	3	4	2	94.14	31	2026-04-25 10:25:09	2026-04-25 10:25:09
4587	Calça Temático(a) Lilás (Carters)	29	5	16	11	48.16	8	2026-04-25 10:25:09	2026-04-25 10:25:09
4588	Vestido Leve Branco(a) (C&A Kids)	19	21	4	4	55.66	7	2026-04-25 10:25:09	2026-04-25 10:25:09
4589	Camisa Listrado Prata (Colcci Kids)	20	7	18	2	96.19	9	2026-04-25 10:25:09	2026-04-25 10:25:09
4590	Camiseta Turma da Mônica Rosa (Brandille)	31	8	2	12	75.00	5	2026-04-25 10:25:09	2026-04-25 10:25:09
4591	Bermuda Jeans Cinza (Akazys)	17	1	8	17	111.95	2	2026-04-25 10:25:09	2026-04-25 10:25:09
4592	Maiô Respirável Bege (Petit Royal)	25	13	14	13	22.72	25	2026-04-25 10:25:09	2026-04-25 10:25:09
4593	Blusa Casual Amarelo(a) (Ki Carinho)	5	3	7	3	22.27	16	2026-04-25 10:25:09	2026-04-25 10:25:09
4594	Saia Algodão Branco(a) (Farm Kids)	2	16	4	16	86.90	14	2026-04-25 10:25:09	2026-04-25 10:25:09
4595	Macacão Toy Store Rosa Choque (Osklen Kids)	30	12	10	12	16.89	24	2026-04-25 10:25:09	2026-04-25 10:25:09
4596	Bermuda Clássico(a) Rosa Choque (Pimpolho)	6	1	10	9	86.51	26	2026-04-25 10:25:09	2026-04-25 10:25:09
4597	Calça Seda Azul Escuro(a) (Dafiti Kids)	27	5	9	7	26.22	11	2026-04-25 10:25:09	2026-04-25 10:25:09
4598	Calcinha Animal Print Azul (Disney Kids)	3	6	1	17	33.89	13	2026-04-25 10:25:09	2026-04-25 10:25:09
4599	Saia Leve Vinho (Lilica Ripilica)	19	16	19	6	86.95	19	2026-04-25 10:25:09	2026-04-25 10:25:09
4600	Cueca Xadrez Bege (Renner Kids)	32	10	14	18	23.75	28	2026-04-25 10:25:09	2026-04-25 10:25:09
4601	Top Ajustável Marrom (Salsa Jeans Kids)	1	20	13	15	98.74	30	2026-04-25 10:25:09	2026-04-25 10:25:09
4602	Calça Elástico(a) Prata (Zoe Kids)	11	5	18	6	91.89	31	2026-04-25 10:25:09	2026-04-25 10:25:09
4603	Maiô Labubu Vinho (Lilica Ripilica)	18	13	19	17	113.55	19	2026-04-25 10:25:09	2026-04-25 10:25:09
4604	Cueca Colorido(a) Azul (Zoe Kids)	7	10	1	1	66.98	31	2026-04-25 10:25:09	2026-04-25 10:25:09
4605	Camisa Casual Turquesa (Farm Kids)	5	7	15	3	22.01	14	2026-04-25 10:25:09	2026-04-25 10:25:09
4606	Camisa Curto(a) Amarelo(a) (Kily)	9	7	7	19	25.58	17	2026-04-25 10:25:09	2026-04-25 10:25:09
4607	Meia Turma da Mônica Prata (Disney Kids)	31	14	18	11	71.68	13	2026-04-25 10:25:09	2026-04-25 10:25:09
4608	Blusa Listrado Azul (Akazys)	20	3	1	13	117.00	2	2026-04-25 10:25:09	2026-04-25 10:25:09
4609	Cueca Labubu Lilás (Boboi)	18	10	16	13	29.01	4	2026-04-25 10:25:09	2026-04-25 10:25:09
4610	Blusa Casual Verde (Disney Baby)	5	3	5	16	98.77	12	2026-04-25 10:25:09	2026-04-25 10:25:09
4611	Vestido Básico(a) Roxo(a) (Colcci Kids)	4	21	12	6	37.49	9	2026-04-25 10:25:09	2026-04-25 10:25:09
4612	Short Estampado(a) Azul Escuro(a) (Conjunto Infantil)	13	17	9	19	102.25	10	2026-04-25 10:25:09	2026-04-25 10:25:09
4613	Cueca Loney Tunes Cáqui (C&A Baby)	22	10	20	1	98.61	6	2026-04-25 10:25:09	2026-04-25 10:25:09
4614	Maiô Turma da Mônica Cáqui (Osklen Kids)	31	13	20	19	84.41	24	2026-04-25 10:25:09	2026-04-25 10:25:09
4615	Jaqueta Moleton Vermelho(a) (Zoe Kids)	23	11	6	18	26.08	31	2026-04-25 10:25:09	2026-04-25 10:25:09
4616	Maiô Moleton Roxo(a) (Zoe Kids)	23	13	12	9	99.66	31	2026-04-25 10:25:09	2026-04-25 10:25:09
4617	Calcinha Confortável Azul (Akazys)	8	6	1	14	16.11	2	2026-04-25 10:25:09	2026-04-25 10:25:09
4618	Saia Saja Azul Escuro(a) (Maria Filó Kids)	26	16	9	13	21.28	20	2026-04-25 10:25:09	2026-04-25 10:25:09
4619	Jaqueta Poliéster Rosa Choque (Conjunto Infantil)	24	11	10	7	60.95	10	2026-04-25 10:25:09	2026-04-25 10:25:09
4620	Jaqueta Labubu Turquesa (Mundo Infantil)	18	11	15	6	27.83	22	2026-04-25 10:25:09	2026-04-25 10:25:09
4621	Bermuda Saja Amarelo(a) (Maria Filó Kids)	26	1	7	9	117.09	20	2026-04-25 10:25:09	2026-04-25 10:25:09
4622	Top Seda Cáqui (Mundo Infantil)	27	20	20	9	98.10	22	2026-04-25 10:25:09	2026-04-25 10:25:09
4623	Saia Floral Laranja (C&A Kids)	15	16	11	12	15.79	7	2026-04-25 10:25:09	2026-04-25 10:25:09
4624	Camiseta Temático(a) Azul (Petit Royal)	29	8	1	19	78.25	25	2026-04-25 10:25:09	2026-04-25 10:25:09
4625	Maiô Respirável Azul Escuro(a) (Bendita Cute)	25	13	9	2	42.77	3	2026-04-25 10:25:09	2026-04-25 10:25:09
4626	Blusa Stitch Cinza (Puket Kids)	28	3	8	10	24.18	27	2026-04-25 10:25:09	2026-04-25 10:25:09
4627	Camiseta Xadrez Prata (Farm Kids)	32	8	18	11	43.78	14	2026-04-25 10:25:09	2026-04-25 10:25:09
4628	Calçado Moleton Vermelho(a) (Puket Kids)	23	4	6	9	39.57	27	2026-04-25 10:25:09	2026-04-25 10:25:09
4629	Macacão Clássico(a) Lilás (Disney Kids)	6	12	16	2	106.77	13	2026-04-25 10:25:09	2026-04-25 10:25:09
4630	Saia Longa Laranja (Marisol)	21	16	11	2	18.01	21	2026-04-25 10:25:09	2026-04-25 10:25:09
4631	Macacão Fit Bege (Kily)	14	12	14	1	64.81	17	2026-04-25 10:25:09	2026-04-25 10:25:09
4632	Pijama Floral Lilás (Petit Royal)	15	15	16	13	32.65	25	2026-04-25 10:25:09	2026-04-25 10:25:09
4633	Pijama Jeans Cinza (Carters)	17	15	8	19	96.62	8	2026-04-25 10:25:09	2026-04-25 10:25:09
4634	Bermuda Loney Tunes Vinho (Kily)	22	1	19	18	27.00	17	2026-04-25 10:25:09	2026-04-25 10:25:09
4635	Jaqueta Durável Vermelho(a) (Farm Kids)	10	11	6	8	30.36	14	2026-04-25 10:25:09	2026-04-25 10:25:09
4636	Jaqueta Esportivo(a) Verde (Osklen Kids)	12	11	5	10	36.48	24	2026-04-25 10:25:09	2026-04-25 10:25:09
4637	Bermuda Curto(a) Vinho (Hering Kids)	9	1	19	19	48.58	15	2026-04-25 10:25:09	2026-04-25 10:25:09
4638	Calçado Formal Marrom (Kily)	16	4	13	14	91.43	17	2026-04-25 10:25:09	2026-04-25 10:25:09
4639	Camiseta Temático(a) Amarelo(a) (Petit Royal)	29	8	7	9	49.61	25	2026-04-25 10:25:09	2026-04-25 10:25:09
4640	Calça Básico(a) Preto(a) (Puket Kids)	4	5	3	12	35.72	27	2026-04-25 10:25:09	2026-04-25 10:25:09
4641	Bermuda Curto(a) Verde (Salsa Jeans Kids)	9	1	5	2	28.41	30	2026-04-25 10:25:09	2026-04-25 10:25:09
4642	Saia Algodão Lilás (Brandille)	2	16	16	10	108.67	5	2026-04-25 10:25:09	2026-04-25 10:25:09
4643	Casaco Leve Rosa Choque (Renner Kids)	19	9	10	8	53.32	28	2026-04-25 10:25:09	2026-04-25 10:25:09
4644	Calcinha Ajustável Amarelo(a) (Kily)	1	6	7	18	82.42	17	2026-04-25 10:25:09	2026-04-25 10:25:09
4645	Vestido Floral Turquesa (Riachuelo Kids)	15	21	15	14	74.50	29	2026-04-25 10:25:09	2026-04-25 10:25:09
4646	Calçado Toy Store Cáqui (Puket Kids)	30	4	20	3	30.40	27	2026-04-25 10:25:09	2026-04-25 10:25:09
4647	Calcinha Turma da Mônica Turquesa (Pimpolho)	31	6	15	4	18.61	26	2026-04-25 10:25:09	2026-04-25 10:25:09
4648	Camiseta Confortável Azul Escuro(a) (Marisol)	8	8	9	17	85.98	21	2026-04-25 10:25:09	2026-04-25 10:25:09
4649	Camisa Jeans Verde (Colcci Kids)	17	7	5	2	25.94	9	2026-04-25 10:25:09	2026-04-25 10:25:09
4650	Vestido Toy Store Turquesa (Boboi)	30	21	15	1	21.60	4	2026-04-25 10:25:09	2026-04-25 10:25:09
4651	Saia Clássico(a) Rosa Choque (Marisol)	6	16	10	6	16.33	21	2026-04-25 10:25:09	2026-04-25 10:25:09
4652	Maiô Respirável Laranja (Boboi)	25	13	11	4	115.08	4	2026-04-25 10:25:09	2026-04-25 10:25:09
4653	Saia Poliéster Branco(a) (Colcci Kids)	24	16	4	6	87.81	9	2026-04-25 10:25:09	2026-04-25 10:25:09
4654	Jaqueta Poliéster Azul (Petit Royal)	24	11	1	19	77.95	25	2026-04-25 10:25:09	2026-04-25 10:25:09
4655	Calçado Stitch Amarelo(a) (C&A Baby)	28	4	7	12	28.24	6	2026-04-25 10:25:09	2026-04-25 10:25:09
4656	Vestido Algodão Cáqui (Ki Carinho)	2	21	20	18	97.94	16	2026-04-25 10:25:09	2026-04-25 10:25:09
4657	Calcinha Durável Vermelho(a) (Mundo Pet)	10	6	6	2	37.98	23	2026-04-25 10:25:09	2026-04-25 10:25:09
4658	Calça Clássico(a) Cinza (Maria Filó Kids)	6	5	8	7	44.43	20	2026-04-25 10:25:09	2026-04-25 10:25:09
4659	Blusa Moleton Rosa Choque (Disney Kids)	23	3	10	10	84.24	13	2026-04-25 10:25:09	2026-04-25 10:25:09
4660	Saia Formal Azul (Adidas Kids)	16	16	1	2	10.86	1	2026-04-25 10:25:09	2026-04-25 10:25:09
4661	Camisa Durável Vermelho(a) (Boboi)	10	7	6	11	36.49	4	2026-04-25 10:25:09	2026-04-25 10:25:09
4662	Calçado Durável Cáqui (Lacoste Kids)	10	4	20	14	39.29	18	2026-04-25 10:25:09	2026-04-25 10:25:09
4663	Meia Loney Tunes Laranja (Marisol)	22	14	11	10	17.48	21	2026-04-25 10:25:09	2026-04-25 10:25:09
4664	Short Ajustável Turquesa (Carters)	1	17	15	4	43.33	8	2026-04-25 10:25:09	2026-04-25 10:25:09
4665	Sunga Toy Store Cáqui (Bendita Cute)	30	18	20	6	73.11	3	2026-04-25 10:25:09	2026-04-25 10:25:09
4666	Camisa Loney Tunes Prata (Disney Baby)	22	7	18	15	118.74	12	2026-04-25 10:25:09	2026-04-25 10:25:09
4667	Pijama Saja Branco(a) (Salsa Jeans Kids)	26	15	4	11	77.12	30	2026-04-25 10:25:09	2026-04-25 10:25:09
4668	Biquine Colorido(a) Rosa Choque (Kily)	7	2	10	6	93.42	17	2026-04-25 10:25:09	2026-04-25 10:25:09
4669	Maiô Ajustável Bege (Dafiti Kids)	1	13	14	15	15.99	11	2026-04-25 10:25:09	2026-04-25 10:25:09
4670	Maiô Temático(a) Vinho (Colcci Kids)	29	13	19	1	71.46	9	2026-04-25 10:25:09	2026-04-25 10:25:09
4671	Camisa Esportivo(a) Amarelo(a) (Brandille)	12	7	7	4	105.16	5	2026-04-25 10:25:09	2026-04-25 10:25:09
4672	Vestido Casual Dourado(a) (C&A Kids)	5	21	17	3	94.79	7	2026-04-25 10:25:09	2026-04-25 10:25:09
4673	Cueca Elástico(a) Rosa (Kily)	11	10	2	15	56.28	17	2026-04-25 10:25:09	2026-04-25 10:25:09
4674	Sunga Fit Cáqui (Pimpolho)	14	18	20	11	93.97	26	2026-04-25 10:25:09	2026-04-25 10:25:09
4675	Pijama Moleton Cinza (Mundo Infantil)	23	15	8	5	96.79	22	2026-04-25 10:25:09	2026-04-25 10:25:09
4676	Sunga Labubu Prata (Zoe Kids)	18	18	18	11	117.34	31	2026-04-25 10:25:09	2026-04-25 10:25:09
4677	Bermuda Algodão Laranja (Renner Kids)	2	1	11	8	67.72	28	2026-04-25 10:25:09	2026-04-25 10:25:09
4678	Sunga Jeans Rosa (Adidas Kids)	17	18	2	19	68.25	1	2026-04-25 10:25:09	2026-04-25 10:25:09
4679	Maiô Turma da Mônica Vinho (Riachuelo Kids)	31	13	19	10	110.94	29	2026-04-25 10:25:09	2026-04-25 10:25:09
4680	Sunga Poliéster Branco(a) (Dafiti Kids)	24	18	4	8	30.33	11	2026-04-25 10:25:09	2026-04-25 10:25:09
4681	Cueca Formal Cinza (Carters)	16	10	8	12	73.10	8	2026-04-25 10:25:09	2026-04-25 10:25:09
4682	Blusa Xadrez Branco(a) (Ki Carinho)	32	3	4	18	76.09	16	2026-04-25 10:25:09	2026-04-25 10:25:09
4683	Camiseta Leve Cáqui (Brandille)	19	8	20	19	40.66	5	2026-04-25 10:25:09	2026-04-25 10:25:09
4684	Calça Esportivo(a) Vermelho(a) (Marisol)	12	5	6	9	79.10	21	2026-04-25 10:25:09	2026-04-25 10:25:09
4685	Saia Moleton Preto(a) (Bendita Cute)	23	16	3	2	31.39	3	2026-04-25 10:25:09	2026-04-25 10:25:09
4686	Calçado Curto(a) Cáqui (C&A Kids)	9	4	20	8	46.37	7	2026-04-25 10:25:09	2026-04-25 10:25:09
4687	Cueca Seda Vinho (Brandille)	27	10	19	10	39.33	5	2026-04-25 10:25:09	2026-04-25 10:25:09
4688	Calcinha Floral Vermelho(a) (Riachuelo Kids)	15	6	6	15	113.30	29	2026-04-25 10:25:09	2026-04-25 10:25:09
4689	Calçado Poliéster Branco(a) (Mundo Pet)	24	4	4	18	39.98	23	2026-04-25 10:25:09	2026-04-25 10:25:09
4919	Cueca Longa Bege (C&A Kids)	21	10	14	8	94.75	7	2026-04-25 10:25:09	2026-04-25 10:25:09
4690	Camiseta Básico(a) Vermelho(a) (Bendita Cute)	4	8	6	14	54.26	3	2026-04-25 10:25:09	2026-04-25 10:25:09
4691	Blusa Saja Vinho (Marisol)	26	3	19	12	84.31	21	2026-04-25 10:25:09	2026-04-25 10:25:09
4692	Sunga Loney Tunes Azul (Mundo Infantil)	22	18	1	16	22.10	22	2026-04-25 10:25:09	2026-04-25 10:25:09
4693	Sunga Casual Bege (Farm Kids)	5	18	14	19	105.12	14	2026-04-25 10:25:09	2026-04-25 10:25:09
4694	Top Elástico(a) Cinza (Boboi)	11	20	8	7	95.69	4	2026-04-25 10:25:09	2026-04-25 10:25:09
4695	Macacão Loney Tunes Cáqui (C&A Kids)	22	12	20	1	89.52	7	2026-04-25 10:25:09	2026-04-25 10:25:09
4696	Jaqueta Ajustável Bege (Kily)	1	11	14	13	10.27	17	2026-04-25 10:25:09	2026-04-25 10:25:09
4697	Maiô Turma da Mônica Turquesa (Puket Kids)	31	13	15	13	113.40	27	2026-04-25 10:25:09	2026-04-25 10:25:09
4698	Calçado Stitch Laranja (Pimpolho)	28	4	11	7	42.02	26	2026-04-25 10:25:09	2026-04-25 10:25:09
4699	Calça Clássico(a) Vinho (Disney Kids)	6	5	19	12	17.38	13	2026-04-25 10:25:09	2026-04-25 10:25:09
4700	Jaqueta Temático(a) Preto(a) (Colcci Kids)	29	11	3	18	78.63	9	2026-04-25 10:25:09	2026-04-25 10:25:09
4701	Biquine Colorido(a) Rosa Choque (Mundo Pet)	7	2	10	2	93.71	23	2026-04-25 10:25:09	2026-04-25 10:25:09
4702	Casaco Fit Rosa Choque (Boboi)	14	9	10	7	43.82	4	2026-04-25 10:25:09	2026-04-25 10:25:09
4703	Saia Curto(a) Amarelo(a) (Ki Carinho)	9	16	7	4	75.94	16	2026-04-25 10:25:09	2026-04-25 10:25:09
4704	Bermuda Clássico(a) Azul Escuro(a) (Boboi)	6	1	9	4	72.76	4	2026-04-25 10:25:09	2026-04-25 10:25:09
4705	Maiô Loney Tunes Turquesa (Lilica Ripilica)	22	13	15	17	58.59	19	2026-04-25 10:25:09	2026-04-25 10:25:09
4706	Bermuda Algodão Vermelho(a) (Maria Filó Kids)	2	1	6	6	55.58	20	2026-04-25 10:25:09	2026-04-25 10:25:09
4707	Blusa Listrado Verde (Lilica Ripilica)	20	3	5	1	33.73	19	2026-04-25 10:25:09	2026-04-25 10:25:09
4708	Calçado Xadrez Vinho (Adidas Kids)	32	4	19	4	105.20	1	2026-04-25 10:25:09	2026-04-25 10:25:09
4709	Maiô Confortável Azul (Adidas Kids)	8	13	1	18	21.80	1	2026-04-25 10:25:09	2026-04-25 10:25:09
4710	Sunga Casual Lilás (Puket Kids)	5	18	16	18	30.01	27	2026-04-25 10:25:09	2026-04-25 10:25:09
4711	Biquine Respirável Bege (Salsa Jeans Kids)	25	2	14	15	61.43	30	2026-04-25 10:25:09	2026-04-25 10:25:09
4712	Blusa Respirável Rosa (Puket Kids)	25	3	2	6	63.13	27	2026-04-25 10:25:09	2026-04-25 10:25:09
4713	Casaco Animal Print Preto(a) (Petit Royal)	3	9	3	15	88.47	25	2026-04-25 10:25:09	2026-04-25 10:25:09
4714	Blusa Animal Print Cinza (Brandille)	3	3	8	9	59.38	5	2026-04-25 10:25:09	2026-04-25 10:25:09
4715	Pijama Leve Cinza (Lilica Ripilica)	19	15	8	16	92.44	19	2026-04-25 10:25:09	2026-04-25 10:25:09
4716	Biquine Longa Preto(a) (Marisol)	21	2	3	8	94.29	21	2026-04-25 10:25:09	2026-04-25 10:25:09
4717	Camisa Leve Amarelo(a) (Puket Kids)	19	7	7	18	18.71	27	2026-04-25 10:25:09	2026-04-25 10:25:09
4718	Bermuda Loney Tunes Dourado(a) (Lacoste Kids)	22	1	17	5	109.35	18	2026-04-25 10:25:09	2026-04-25 10:25:09
4719	Bermuda Algodão Azul (Kily)	2	1	1	10	105.05	17	2026-04-25 10:25:09	2026-04-25 10:25:09
4720	Sutiã Longa Preto(a) (C&A Baby)	21	19	3	12	56.45	6	2026-04-25 10:25:09	2026-04-25 10:25:09
4721	Bermuda Turma da Mônica Roxo(a) (Renner Kids)	31	1	12	15	53.52	28	2026-04-25 10:25:09	2026-04-25 10:25:09
4722	Meia Algodão Marrom (Brandille)	2	14	13	13	59.30	5	2026-04-25 10:25:09	2026-04-25 10:25:09
4723	Camiseta Animal Print Rosa (C&A Kids)	3	8	2	10	15.91	7	2026-04-25 10:25:09	2026-04-25 10:25:09
4724	Calcinha Respirável Amarelo(a) (Maria Filó Kids)	25	6	7	3	80.36	20	2026-04-25 10:25:09	2026-04-25 10:25:09
4725	Blusa Colorido(a) Laranja (Disney Kids)	7	3	11	13	34.85	13	2026-04-25 10:25:09	2026-04-25 10:25:09
4726	Cueca Durável Marrom (Boboi)	10	10	13	13	100.10	4	2026-04-25 10:25:09	2026-04-25 10:25:09
4727	Calça Colorido(a) Cáqui (Renner Kids)	7	5	20	17	71.21	28	2026-04-25 10:25:09	2026-04-25 10:25:09
4728	Jaqueta Stitch Turquesa (Farm Kids)	28	11	15	9	110.77	14	2026-04-25 10:25:09	2026-04-25 10:25:09
4729	Calcinha Turma da Mônica Azul (Bendita Cute)	31	6	1	5	40.26	3	2026-04-25 10:25:09	2026-04-25 10:25:09
4730	Short Moleton Vinho (Riachuelo Kids)	23	17	19	18	19.29	29	2026-04-25 10:25:09	2026-04-25 10:25:09
4731	Cueca Leve Cinza (Boboi)	19	10	8	9	102.32	4	2026-04-25 10:25:09	2026-04-25 10:25:09
4732	Pijama Seda Branco(a) (Disney Kids)	27	15	4	11	56.62	13	2026-04-25 10:25:09	2026-04-25 10:25:09
4733	Blusa Temático(a) Verde (Bendita Cute)	29	3	5	1	34.60	3	2026-04-25 10:25:09	2026-04-25 10:25:09
4734	Jaqueta Leve Verde (Conjunto Infantil)	19	11	5	3	68.68	10	2026-04-25 10:25:09	2026-04-25 10:25:09
4735	Macacão Elástico(a) Laranja (Renner Kids)	11	12	11	1	85.60	28	2026-04-25 10:25:09	2026-04-25 10:25:09
4736	Saia Turma da Mônica Cáqui (Mundo Pet)	31	16	20	15	37.52	23	2026-04-25 10:25:09	2026-04-25 10:25:09
4737	Vestido Elástico(a) Laranja (Adidas Kids)	11	21	11	19	55.01	1	2026-04-25 10:25:09	2026-04-25 10:25:09
4738	Blusa Saja Amarelo(a) (Hering Kids)	26	3	7	3	108.78	15	2026-04-25 10:25:09	2026-04-25 10:25:09
4739	Casaco Estampado(a) Marrom (Hering Kids)	13	9	13	6	83.74	15	2026-04-25 10:25:09	2026-04-25 10:25:09
4740	Camisa Floral Cinza (Mundo Infantil)	15	7	8	12	100.02	22	2026-04-25 10:25:09	2026-04-25 10:25:09
4741	Meia Estampado(a) Vinho (C&A Kids)	13	14	19	13	91.71	7	2026-04-25 10:25:09	2026-04-25 10:25:09
4742	Macacão Xadrez Branco(a) (Disney Baby)	32	12	4	3	106.60	12	2026-04-25 10:25:09	2026-04-25 10:25:09
4743	Sunga Loney Tunes Turquesa (Riachuelo Kids)	22	18	15	8	41.75	29	2026-04-25 10:25:09	2026-04-25 10:25:09
4744	Camisa Curto(a) Amarelo(a) (Disney Kids)	9	7	7	18	36.23	13	2026-04-25 10:25:09	2026-04-25 10:25:09
4745	Sutiã Algodão Verde (C&A Kids)	2	19	5	12	57.74	7	2026-04-25 10:25:09	2026-04-25 10:25:09
4746	Camiseta Xadrez Vinho (Pimpolho)	32	8	19	19	63.40	26	2026-04-25 10:25:09	2026-04-25 10:25:09
4747	Vestido Listrado Lilás (Akazys)	20	21	16	12	74.63	2	2026-04-25 10:25:09	2026-04-25 10:25:09
4748	Vestido Algodão Amarelo(a) (C&A Baby)	2	21	7	10	90.69	6	2026-04-25 10:25:09	2026-04-25 10:25:09
4749	Casaco Temático(a) Verde (Carters)	29	9	5	5	88.75	8	2026-04-25 10:25:09	2026-04-25 10:25:09
4750	Camisa Básico(a) Roxo(a) (Akazys)	4	7	12	10	72.51	2	2026-04-25 10:25:09	2026-04-25 10:25:09
4751	Biquine Respirável Vermelho(a) (Mundo Infantil)	25	2	6	5	48.93	22	2026-04-25 10:25:09	2026-04-25 10:25:09
4752	Calçado Durável Turquesa (Carters)	10	4	15	9	13.57	8	2026-04-25 10:25:09	2026-04-25 10:25:09
4753	Jaqueta Casual Vermelho(a) (Puket Kids)	5	11	6	5	32.64	27	2026-04-25 10:25:09	2026-04-25 10:25:09
4754	Casaco Temático(a) Roxo(a) (C&A Baby)	29	9	12	19	20.66	6	2026-04-25 10:25:09	2026-04-25 10:25:09
4755	Calçado Ajustável Laranja (Pimpolho)	1	4	11	7	115.30	26	2026-04-25 10:25:09	2026-04-25 10:25:09
4756	Camisa Floral Verde (Akazys)	15	7	5	2	71.94	2	2026-04-25 10:25:09	2026-04-25 10:25:09
4757	Cueca Saja Amarelo(a) (Disney Baby)	26	10	7	1	37.78	12	2026-04-25 10:25:09	2026-04-25 10:25:09
4758	Camiseta Xadrez Lilás (Lilica Ripilica)	32	8	16	16	68.29	19	2026-04-25 10:25:09	2026-04-25 10:25:09
4759	Camiseta Curto(a) Rosa Choque (Salsa Jeans Kids)	9	8	10	3	39.01	30	2026-04-25 10:25:09	2026-04-25 10:25:09
4760	Camisa Casual Cáqui (Ki Carinho)	5	7	20	18	55.91	16	2026-04-25 10:25:09	2026-04-25 10:25:09
4761	Macacão Fit Bege (Colcci Kids)	14	12	14	13	114.17	9	2026-04-25 10:25:09	2026-04-25 10:25:09
4762	Blusa Formal Laranja (Petit Royal)	16	3	11	19	40.65	25	2026-04-25 10:25:09	2026-04-25 10:25:09
4763	Top Animal Print Lilás (Conjunto Infantil)	3	20	16	5	86.60	10	2026-04-25 10:25:09	2026-04-25 10:25:09
4764	Jaqueta Moleton Vinho (Marisol)	23	11	19	1	18.82	21	2026-04-25 10:25:09	2026-04-25 10:25:09
4765	Bermuda Xadrez Dourado(a) (Mundo Infantil)	32	1	17	2	23.70	22	2026-04-25 10:25:09	2026-04-25 10:25:09
4766	Macacão Longa Bege (Maria Filó Kids)	21	12	14	4	79.66	20	2026-04-25 10:25:09	2026-04-25 10:25:09
4767	Casaco Poliéster Prata (Carters)	24	9	18	5	30.73	8	2026-04-25 10:25:09	2026-04-25 10:25:09
4768	Casaco Jeans Branco(a) (Maria Filó Kids)	17	9	4	9	112.22	20	2026-04-25 10:25:09	2026-04-25 10:25:09
4769	Calçado Jeans Bege (Lilica Ripilica)	17	4	14	4	57.46	19	2026-04-25 10:25:09	2026-04-25 10:25:09
4770	Biquine Seda Cinza (Carters)	27	2	8	18	30.83	8	2026-04-25 10:25:09	2026-04-25 10:25:09
4771	Pijama Moleton Bege (Petit Royal)	23	15	14	10	46.42	25	2026-04-25 10:25:09	2026-04-25 10:25:09
4772	Casaco Confortável Prata (Akazys)	8	9	18	18	65.73	2	2026-04-25 10:25:09	2026-04-25 10:25:09
4773	Camisa Básico(a) Dourado(a) (Zoe Kids)	4	7	17	18	36.87	31	2026-04-25 10:25:09	2026-04-25 10:25:09
4774	Bermuda Animal Print Azul (Akazys)	3	1	1	3	11.81	2	2026-04-25 10:25:09	2026-04-25 10:25:09
4775	Calça Animal Print Bege (Marisol)	3	5	14	18	44.73	21	2026-04-25 10:25:09	2026-04-25 10:25:09
4776	Vestido Listrado Cinza (Disney Kids)	20	21	8	7	11.72	13	2026-04-25 10:25:09	2026-04-25 10:25:09
4777	Camisa Seda Vinho (Mundo Infantil)	27	7	19	14	81.38	22	2026-04-25 10:25:09	2026-04-25 10:25:09
4778	Cueca Casual Verde (Adidas Kids)	5	10	5	14	108.93	1	2026-04-25 10:25:09	2026-04-25 10:25:09
4779	Bermuda Animal Print Azul (Mundo Infantil)	3	1	1	19	116.25	22	2026-04-25 10:25:09	2026-04-25 10:25:09
4780	Sutiã Seda Cáqui (Marisol)	27	19	20	8	26.14	21	2026-04-25 10:25:09	2026-04-25 10:25:09
4781	Vestido Poliéster Marrom (Hering Kids)	24	21	13	3	28.57	15	2026-04-25 10:25:09	2026-04-25 10:25:09
4782	Saia Listrado Lilás (Salsa Jeans Kids)	20	16	16	10	59.78	30	2026-04-25 10:25:09	2026-04-25 10:25:09
4783	Sunga Longa Prata (Pimpolho)	21	18	18	9	115.05	26	2026-04-25 10:25:09	2026-04-25 10:25:09
4784	Casaco Jeans Amarelo(a) (Mundo Infantil)	17	9	7	16	105.82	22	2026-04-25 10:25:09	2026-04-25 10:25:09
4785	Maiô Turma da Mônica Rosa Choque (Disney Baby)	31	13	10	12	55.01	12	2026-04-25 10:25:09	2026-04-25 10:25:09
4786	Bermuda Floral Azul (C&A Baby)	15	1	1	17	33.31	6	2026-04-25 10:25:09	2026-04-25 10:25:09
4787	Maiô Respirável Vermelho(a) (Carters)	25	13	6	17	105.68	8	2026-04-25 10:25:09	2026-04-25 10:25:09
4788	Short Stitch Verde (Puket Kids)	28	17	5	13	119.64	27	2026-04-25 10:25:09	2026-04-25 10:25:09
4789	Sunga Listrado Laranja (Kily)	20	18	11	11	75.84	17	2026-04-25 10:25:09	2026-04-25 10:25:09
4790	Meia Moleton Roxo(a) (Pimpolho)	23	14	12	11	14.92	26	2026-04-25 10:25:09	2026-04-25 10:25:09
4791	Calçado Listrado Branco(a) (Lacoste Kids)	20	4	4	7	46.35	18	2026-04-25 10:25:09	2026-04-25 10:25:09
4792	Sunga Poliéster Dourado(a) (Puket Kids)	24	18	17	8	31.92	27	2026-04-25 10:25:09	2026-04-25 10:25:09
4793	Pijama Algodão Lilás (Lacoste Kids)	2	15	16	19	31.08	18	2026-04-25 10:25:09	2026-04-25 10:25:09
4794	Camisa Saja Turquesa (Kily)	26	7	15	6	49.12	17	2026-04-25 10:25:09	2026-04-25 10:25:09
4795	Calça Esportivo(a) Dourado(a) (Renner Kids)	12	5	17	14	68.63	28	2026-04-25 10:25:09	2026-04-25 10:25:09
4796	Biquine Turma da Mônica Rosa Choque (Brandille)	31	2	10	13	74.26	5	2026-04-25 10:25:09	2026-04-25 10:25:09
4797	Camiseta Casual Lilás (Marisol)	5	8	16	19	58.95	21	2026-04-25 10:25:09	2026-04-25 10:25:09
4798	Calçado Moleton Marrom (Petit Royal)	23	4	13	13	68.76	25	2026-04-25 10:25:09	2026-04-25 10:25:09
4799	Vestido Saja Marrom (Conjunto Infantil)	26	21	13	6	42.06	10	2026-04-25 10:25:09	2026-04-25 10:25:09
4800	Sunga Algodão Turquesa (C&A Kids)	2	18	15	11	101.27	7	2026-04-25 10:25:09	2026-04-25 10:25:09
4801	Blusa Labubu Vinho (Mundo Infantil)	18	3	19	6	84.43	22	2026-04-25 10:25:09	2026-04-25 10:25:09
4802	Sutiã Curto(a) Turquesa (Pimpolho)	9	19	15	18	79.86	26	2026-04-25 10:25:09	2026-04-25 10:25:09
4803	Blusa Seda Marrom (Dafiti Kids)	27	3	13	11	101.60	11	2026-04-25 10:25:09	2026-04-25 10:25:09
4804	Camisa Casual Turquesa (Puket Kids)	5	7	15	19	66.47	27	2026-04-25 10:25:09	2026-04-25 10:25:09
4805	Calcinha Curto(a) Verde (Petit Royal)	9	6	5	16	39.07	25	2026-04-25 10:25:09	2026-04-25 10:25:09
4806	Casaco Seda Prata (Maria Filó Kids)	27	9	18	9	23.79	20	2026-04-25 10:25:09	2026-04-25 10:25:09
4807	Calça Stitch Branco(a) (Kily)	28	5	4	14	89.55	17	2026-04-25 10:25:09	2026-04-25 10:25:09
4808	Blusa Leve Lilás (Mundo Infantil)	19	3	16	8	45.30	22	2026-04-25 10:25:09	2026-04-25 10:25:09
4809	Meia Básico(a) Vinho (Mundo Pet)	4	14	19	13	22.40	23	2026-04-25 10:25:09	2026-04-25 10:25:09
4810	Meia Clássico(a) Laranja (C&A Baby)	6	14	11	12	60.26	6	2026-04-25 10:25:09	2026-04-25 10:25:09
4811	Blusa Elástico(a) Amarelo(a) (Hering Kids)	11	3	7	1	49.94	15	2026-04-25 10:25:09	2026-04-25 10:25:09
4812	Top Confortável Rosa (Farm Kids)	8	20	2	6	102.17	14	2026-04-25 10:25:09	2026-04-25 10:25:09
4813	Camisa Listrado Vermelho(a) (Ki Carinho)	20	7	6	19	31.42	16	2026-04-25 10:25:09	2026-04-25 10:25:09
4814	Biquine Casual Lilás (Brandille)	5	2	16	13	50.56	5	2026-04-25 10:25:09	2026-04-25 10:25:09
4815	Meia Longa Azul (C&A Baby)	21	14	1	16	30.76	6	2026-04-25 10:25:09	2026-04-25 10:25:09
4816	Top Colorido(a) Amarelo(a) (Zoe Kids)	7	20	7	11	17.83	31	2026-04-25 10:25:09	2026-04-25 10:25:09
4817	Sutiã Jeans Amarelo(a) (Zoe Kids)	17	19	7	7	33.17	31	2026-04-25 10:25:09	2026-04-25 10:25:09
4818	Calça Poliéster Cinza (Renner Kids)	24	5	8	4	88.32	28	2026-04-25 10:25:09	2026-04-25 10:25:09
4819	Calcinha Casual Laranja (Disney Baby)	5	6	11	18	66.94	12	2026-04-25 10:25:09	2026-04-25 10:25:09
4820	Sutiã Formal Prata (Ki Carinho)	16	19	18	15	49.27	16	2026-04-25 10:25:09	2026-04-25 10:25:09
4821	Meia Longa Azul (Riachuelo Kids)	21	14	1	5	32.72	29	2026-04-25 10:25:09	2026-04-25 10:25:09
4822	Jaqueta Leve Rosa Choque (Lacoste Kids)	19	11	10	12	117.26	18	2026-04-25 10:25:09	2026-04-25 10:25:09
4823	Camisa Básico(a) Dourado(a) (Disney Kids)	4	7	17	6	22.01	13	2026-04-25 10:25:09	2026-04-25 10:25:09
4824	Vestido Clássico(a) Vermelho(a) (Lilica Ripilica)	6	21	6	9	11.75	19	2026-04-25 10:25:09	2026-04-25 10:25:09
4825	Biquine Algodão Rosa (C&A Kids)	2	2	2	4	70.11	7	2026-04-25 10:25:09	2026-04-25 10:25:09
4826	Vestido Listrado Dourado(a) (C&A Kids)	20	21	17	13	66.55	7	2026-04-25 10:25:09	2026-04-25 10:25:09
4827	Short Stitch Vermelho(a) (Colcci Kids)	28	17	6	14	93.61	9	2026-04-25 10:25:09	2026-04-25 10:25:09
4828	Vestido Turma da Mônica Laranja (Mundo Pet)	31	21	11	6	100.39	23	2026-04-25 10:25:09	2026-04-25 10:25:09
4829	Calcinha Fit Rosa (Ki Carinho)	14	6	2	18	51.56	16	2026-04-25 10:25:09	2026-04-25 10:25:09
4830	Top Toy Store Azul Escuro(a) (Osklen Kids)	30	20	9	2	14.35	24	2026-04-25 10:25:09	2026-04-25 10:25:09
4831	Blusa Animal Print Preto(a) (Brandille)	3	3	3	16	20.50	5	2026-04-25 10:25:09	2026-04-25 10:25:09
4832	Calçado Stitch Vermelho(a) (Lacoste Kids)	28	4	6	2	33.51	18	2026-04-25 10:25:09	2026-04-25 10:25:09
4833	Blusa Algodão Roxo(a) (Boboi)	2	3	12	7	88.20	4	2026-04-25 10:25:09	2026-04-25 10:25:09
4834	Calçado Floral Bege (Petit Royal)	15	4	14	3	107.27	25	2026-04-25 10:25:09	2026-04-25 10:25:09
4835	Camiseta Moleton Cáqui (Ki Carinho)	23	8	20	10	32.49	16	2026-04-25 10:25:09	2026-04-25 10:25:09
4836	Short Stitch Dourado(a) (Bendita Cute)	28	17	17	6	29.18	3	2026-04-25 10:25:09	2026-04-25 10:25:09
4837	Camiseta Turma da Mônica Turquesa (Maria Filó Kids)	31	8	15	14	38.97	20	2026-04-25 10:25:09	2026-04-25 10:25:09
4838	Blusa Esportivo(a) Verde (Adidas Kids)	12	3	5	8	110.72	1	2026-04-25 10:25:09	2026-04-25 10:25:09
4839	Calçado Curto(a) Azul Escuro(a) (Pimpolho)	9	4	9	13	102.26	26	2026-04-25 10:25:09	2026-04-25 10:25:09
4840	Calça Poliéster Lilás (Salsa Jeans Kids)	24	5	16	12	90.41	30	2026-04-25 10:25:09	2026-04-25 10:25:09
4841	Bermuda Colorido(a) Amarelo(a) (Kily)	7	1	7	11	53.27	17	2026-04-25 10:25:09	2026-04-25 10:25:09
4842	Maiô Ajustável Amarelo(a) (Dafiti Kids)	1	13	7	7	33.33	11	2026-04-25 10:25:09	2026-04-25 10:25:09
4843	Macacão Formal Turquesa (Farm Kids)	16	12	15	4	51.29	14	2026-04-25 10:25:09	2026-04-25 10:25:09
4844	Cueca Xadrez Marrom (Carters)	32	10	13	4	66.52	8	2026-04-25 10:25:09	2026-04-25 10:25:09
4845	Calça Toy Store Turquesa (Riachuelo Kids)	30	5	15	7	12.05	29	2026-04-25 10:25:09	2026-04-25 10:25:09
4846	Camiseta Temático(a) Prata (Farm Kids)	29	8	18	17	104.99	14	2026-04-25 10:25:09	2026-04-25 10:25:09
4847	Macacão Estampado(a) Amarelo(a) (Akazys)	13	12	7	4	41.93	2	2026-04-25 10:25:09	2026-04-25 10:25:09
4848	Jaqueta Loney Tunes Verde (Puket Kids)	22	11	5	3	100.05	27	2026-04-25 10:25:09	2026-04-25 10:25:09
4849	Camiseta Estampado(a) Dourado(a) (Mundo Pet)	13	8	17	2	61.85	23	2026-04-25 10:25:09	2026-04-25 10:25:09
4850	Jaqueta Fit Turquesa (Salsa Jeans Kids)	14	11	15	17	110.26	30	2026-04-25 10:25:09	2026-04-25 10:25:09
4851	Vestido Animal Print Dourado(a) (Brandille)	3	21	17	19	51.89	5	2026-04-25 10:25:09	2026-04-25 10:25:09
4852	Biquine Animal Print Prata (Bendita Cute)	3	2	18	14	118.46	3	2026-04-25 10:25:09	2026-04-25 10:25:09
4853	Camiseta Animal Print Amarelo(a) (Zoe Kids)	3	8	7	3	112.33	31	2026-04-25 10:25:09	2026-04-25 10:25:09
4854	Cueca Jeans Vinho (Puket Kids)	17	10	19	3	22.47	27	2026-04-25 10:25:09	2026-04-25 10:25:09
4855	Short Poliéster Preto(a) (Farm Kids)	24	17	3	7	57.84	14	2026-04-25 10:25:09	2026-04-25 10:25:09
4856	Bermuda Turma da Mônica Laranja (Kily)	31	1	11	10	73.54	17	2026-04-25 10:25:09	2026-04-25 10:25:09
4857	Calcinha Colorido(a) Azul Escuro(a) (Brandille)	7	6	9	19	107.47	5	2026-04-25 10:25:09	2026-04-25 10:25:09
4858	Casaco Fit Amarelo(a) (Disney Kids)	14	9	7	10	95.53	13	2026-04-25 10:25:09	2026-04-25 10:25:09
4859	Camiseta Labubu Rosa (Zoe Kids)	18	8	2	7	75.85	31	2026-04-25 10:25:09	2026-04-25 10:25:09
4860	Blusa Clássico(a) Lilás (Ki Carinho)	6	3	16	3	96.03	16	2026-04-25 10:25:09	2026-04-25 10:25:09
4861	Camiseta Jeans Branco(a) (Osklen Kids)	17	8	4	5	49.51	24	2026-04-25 10:25:09	2026-04-25 10:25:09
4862	Bermuda Listrado Azul (Salsa Jeans Kids)	20	1	1	7	22.96	30	2026-04-25 10:25:09	2026-04-25 10:25:09
4863	Sunga Seda Rosa (Pimpolho)	27	18	2	15	66.35	26	2026-04-25 10:25:09	2026-04-25 10:25:09
4864	Pijama Longa Vermelho(a) (Colcci Kids)	21	15	6	10	54.42	9	2026-04-25 10:25:09	2026-04-25 10:25:09
4865	Jaqueta Animal Print Bege (Petit Royal)	3	11	14	19	93.26	25	2026-04-25 10:25:09	2026-04-25 10:25:09
4866	Calçado Animal Print Bege (C&A Baby)	3	4	14	17	55.13	6	2026-04-25 10:25:09	2026-04-25 10:25:09
4867	Vestido Jeans Prata (Adidas Kids)	17	21	18	2	77.05	1	2026-04-25 10:25:09	2026-04-25 10:25:09
4868	Calçado Turma da Mônica Preto(a) (Petit Royal)	31	4	3	16	63.39	25	2026-04-25 10:25:09	2026-04-25 10:25:09
4869	Macacão Labubu Prata (Adidas Kids)	18	12	18	5	64.76	1	2026-04-25 10:25:09	2026-04-25 10:25:09
4870	Jaqueta Xadrez Vinho (Hering Kids)	32	11	19	5	118.89	15	2026-04-25 10:25:09	2026-04-25 10:25:09
4871	Calçado Turma da Mônica Cinza (Brandille)	31	4	8	18	23.27	5	2026-04-25 10:25:09	2026-04-25 10:25:09
4872	Meia Poliéster Cáqui (Kily)	24	14	20	1	69.32	17	2026-04-25 10:25:09	2026-04-25 10:25:09
4873	Cueca Stitch Vermelho(a) (Akazys)	28	10	6	14	78.80	2	2026-04-25 10:25:09	2026-04-25 10:25:09
4874	Sutiã Fit Rosa (Conjunto Infantil)	14	19	2	14	114.96	10	2026-04-25 10:25:09	2026-04-25 10:25:09
4875	Calça Básico(a) Marrom (Hering Kids)	4	5	13	3	119.77	15	2026-04-25 10:25:09	2026-04-25 10:25:09
4876	Biquine Durável Bege (Marisol)	10	2	14	3	79.21	21	2026-04-25 10:25:09	2026-04-25 10:25:09
4877	Vestido Formal Laranja (Maria Filó Kids)	16	21	11	17	97.47	20	2026-04-25 10:25:09	2026-04-25 10:25:09
4878	Blusa Respirável Bege (Kily)	25	3	14	15	111.45	17	2026-04-25 10:25:09	2026-04-25 10:25:09
4879	Sutiã Turma da Mônica Vermelho(a) (Boboi)	31	19	6	2	100.28	4	2026-04-25 10:25:09	2026-04-25 10:25:09
4880	Blusa Moleton Vermelho(a) (Maria Filó Kids)	23	3	6	9	21.53	20	2026-04-25 10:25:09	2026-04-25 10:25:09
4881	Pijama Colorido(a) Bege (Maria Filó Kids)	7	15	14	7	41.39	20	2026-04-25 10:25:09	2026-04-25 10:25:09
4882	Camiseta Stitch Marrom (Salsa Jeans Kids)	28	8	13	1	111.73	30	2026-04-25 10:25:09	2026-04-25 10:25:09
4883	Saia Respirável Turquesa (C&A Kids)	25	16	15	8	61.53	7	2026-04-25 10:25:09	2026-04-25 10:25:09
4884	Maiô Temático(a) Turquesa (Riachuelo Kids)	29	13	15	17	102.54	29	2026-04-25 10:25:09	2026-04-25 10:25:09
4885	Camiseta Temático(a) Bege (C&A Kids)	29	8	14	10	39.68	7	2026-04-25 10:25:09	2026-04-25 10:25:09
4886	Maiô Respirável Lilás (C&A Kids)	25	13	16	14	44.44	7	2026-04-25 10:25:09	2026-04-25 10:25:09
4887	Blusa Colorido(a) Dourado(a) (Renner Kids)	7	3	17	15	12.97	28	2026-04-25 10:25:09	2026-04-25 10:25:09
4888	Camisa Poliéster Rosa Choque (Mundo Pet)	24	7	10	5	27.21	23	2026-04-25 10:25:09	2026-04-25 10:25:09
4889	Sutiã Confortável Roxo(a) (Colcci Kids)	8	19	12	3	98.25	9	2026-04-25 10:25:09	2026-04-25 10:25:09
4890	Meia Animal Print Roxo(a) (Osklen Kids)	3	14	12	3	44.59	24	2026-04-25 10:25:09	2026-04-25 10:25:09
4891	Calcinha Durável Rosa (Mundo Infantil)	10	6	2	2	111.18	22	2026-04-25 10:25:09	2026-04-25 10:25:09
4892	Blusa Básico(a) Laranja (Maria Filó Kids)	4	3	11	11	77.43	20	2026-04-25 10:25:09	2026-04-25 10:25:09
4893	Jaqueta Temático(a) Bege (Lacoste Kids)	29	11	14	9	16.48	18	2026-04-25 10:25:09	2026-04-25 10:25:09
4894	Macacão Longa Preto(a) (Maria Filó Kids)	21	12	3	3	57.17	20	2026-04-25 10:25:09	2026-04-25 10:25:09
4895	Sunga Xadrez Preto(a) (Mundo Infantil)	32	18	3	18	22.71	22	2026-04-25 10:25:09	2026-04-25 10:25:09
4896	Short Xadrez Rosa Choque (Conjunto Infantil)	32	17	10	1	102.49	10	2026-04-25 10:25:09	2026-04-25 10:25:09
4897	Top Leve Rosa Choque (Bendita Cute)	19	20	10	16	94.97	3	2026-04-25 10:25:09	2026-04-25 10:25:09
4898	Meia Temático(a) Rosa Choque (Ki Carinho)	29	14	10	9	11.42	16	2026-04-25 10:25:09	2026-04-25 10:25:09
4899	Camiseta Moleton Vinho (Zoe Kids)	23	8	19	19	90.19	31	2026-04-25 10:25:09	2026-04-25 10:25:09
4900	Calça Labubu Preto(a) (Conjunto Infantil)	18	5	3	3	58.07	10	2026-04-25 10:25:09	2026-04-25 10:25:09
4901	Calçado Estampado(a) Amarelo(a) (Akazys)	13	4	7	6	65.63	2	2026-04-25 10:25:09	2026-04-25 10:25:09
4902	Calçado Jeans Vinho (Riachuelo Kids)	17	4	19	2	22.29	29	2026-04-25 10:25:09	2026-04-25 10:25:09
4903	Jaqueta Seda Azul Escuro(a) (Maria Filó Kids)	27	11	9	16	92.48	20	2026-04-25 10:25:09	2026-04-25 10:25:09
4904	Top Moleton Laranja (Carters)	23	20	11	12	104.65	8	2026-04-25 10:25:09	2026-04-25 10:25:09
4905	Casaco Listrado Branco(a) (Puket Kids)	20	9	4	6	63.60	27	2026-04-25 10:25:09	2026-04-25 10:25:09
4906	Top Toy Store Azul Escuro(a) (Zoe Kids)	30	20	9	5	63.06	31	2026-04-25 10:25:09	2026-04-25 10:25:09
4907	Jaqueta Confortável Vermelho(a) (Ki Carinho)	8	11	6	16	12.12	16	2026-04-25 10:25:09	2026-04-25 10:25:09
4908	Bermuda Esportivo(a) Turquesa (Lacoste Kids)	12	1	15	3	116.82	18	2026-04-25 10:25:09	2026-04-25 10:25:09
4909	Blusa Listrado Prata (Salsa Jeans Kids)	20	3	18	4	38.69	30	2026-04-25 10:25:09	2026-04-25 10:25:09
4910	Calça Esportivo(a) Dourado(a) (Bendita Cute)	12	5	17	17	72.92	3	2026-04-25 10:25:09	2026-04-25 10:25:09
4911	Jaqueta Loney Tunes Lilás (Hering Kids)	22	11	16	7	94.27	15	2026-04-25 10:25:09	2026-04-25 10:25:09
4912	Sunga Algodão Laranja (Lilica Ripilica)	2	18	11	15	67.21	19	2026-04-25 10:25:09	2026-04-25 10:25:09
4913	Sunga Jeans Lilás (Zoe Kids)	17	18	16	4	50.73	31	2026-04-25 10:25:09	2026-04-25 10:25:09
4914	Calcinha Leve Laranja (Lilica Ripilica)	19	6	11	1	107.61	19	2026-04-25 10:25:09	2026-04-25 10:25:09
4915	Maiô Poliéster Amarelo(a) (Mundo Infantil)	24	13	7	8	117.58	22	2026-04-25 10:25:09	2026-04-25 10:25:09
4916	Pijama Poliéster Prata (Puket Kids)	24	15	18	8	37.12	27	2026-04-25 10:25:09	2026-04-25 10:25:09
4917	Top Confortável Turquesa (Dafiti Kids)	8	20	15	18	74.34	11	2026-04-25 10:25:09	2026-04-25 10:25:09
4918	Cueca Casual Laranja (Salsa Jeans Kids)	5	10	11	7	11.24	30	2026-04-25 10:25:09	2026-04-25 10:25:09
4920	Macacão Jeans Verde (Pimpolho)	17	12	5	16	75.21	26	2026-04-25 10:25:09	2026-04-25 10:25:09
4921	Sutiã Respirável Vinho (C&A Baby)	25	19	19	19	26.05	6	2026-04-25 10:25:09	2026-04-25 10:25:09
4922	Camisa Animal Print Vinho (Puket Kids)	3	7	19	3	80.49	27	2026-04-25 10:25:09	2026-04-25 10:25:09
4923	Jaqueta Loney Tunes Cinza (Brandille)	22	11	8	5	115.61	5	2026-04-25 10:25:09	2026-04-25 10:25:09
4924	Pijama Moleton Azul (Carters)	23	15	1	4	16.34	8	2026-04-25 10:25:09	2026-04-25 10:25:09
4925	Top Curto(a) Dourado(a) (Lacoste Kids)	9	20	17	8	50.81	18	2026-04-25 10:25:09	2026-04-25 10:25:09
4926	Pijama Loney Tunes Laranja (Brandille)	22	15	11	15	24.93	5	2026-04-25 10:25:09	2026-04-25 10:25:09
4927	Sunga Confortável Vinho (Mundo Pet)	8	18	19	13	46.07	23	2026-04-25 10:25:09	2026-04-25 10:25:09
4928	Cueca Toy Store Prata (Maria Filó Kids)	30	10	18	14	94.81	20	2026-04-25 10:25:09	2026-04-25 10:25:09
4929	Top Jeans Vinho (Zoe Kids)	17	20	19	4	32.49	31	2026-04-25 10:25:09	2026-04-25 10:25:09
4930	Meia Clássico(a) Lilás (Akazys)	6	14	16	1	79.64	2	2026-04-25 10:25:09	2026-04-25 10:25:09
4931	Macacão Respirável Laranja (C&A Baby)	25	12	11	17	13.75	6	2026-04-25 10:25:09	2026-04-25 10:25:09
4932	Sutiã Moleton Rosa (Renner Kids)	23	19	2	9	28.85	28	2026-04-25 10:25:09	2026-04-25 10:25:09
4933	Macacão Ajustável Amarelo(a) (Disney Kids)	1	12	7	16	11.00	13	2026-04-25 10:25:09	2026-04-25 10:25:09
4934	Sutiã Temático(a) Lilás (Lacoste Kids)	29	19	16	8	70.66	18	2026-04-25 10:25:09	2026-04-25 10:25:09
4935	Camiseta Básico(a) Verde (C&A Baby)	4	8	5	12	56.38	6	2026-04-25 10:25:09	2026-04-25 10:25:09
4936	Blusa Labubu Prata (Maria Filó Kids)	18	3	18	14	99.66	20	2026-04-25 10:25:09	2026-04-25 10:25:09
4937	Casaco Longa Cinza (Akazys)	21	9	8	1	102.40	2	2026-04-25 10:25:09	2026-04-25 10:25:09
4938	Meia Moleton Preto(a) (C&A Baby)	23	14	3	12	118.70	6	2026-04-25 10:25:09	2026-04-25 10:25:09
4939	Vestido Floral Rosa (Mundo Infantil)	15	21	2	15	87.61	22	2026-04-25 10:25:09	2026-04-25 10:25:09
4940	Pijama Curto(a) Bege (Marisol)	9	15	14	11	94.63	21	2026-04-25 10:25:09	2026-04-25 10:25:09
4941	Sunga Respirável Verde (Lacoste Kids)	25	18	5	1	86.04	18	2026-04-25 10:25:09	2026-04-25 10:25:09
4942	Calçado Respirável Azul (Farm Kids)	25	4	1	13	35.70	14	2026-04-25 10:25:09	2026-04-25 10:25:09
4943	Camiseta Longa Cáqui (Lilica Ripilica)	21	8	20	18	60.68	19	2026-04-25 10:25:09	2026-04-25 10:25:09
4944	Camiseta Algodão Amarelo(a) (Boboi)	2	8	7	3	72.92	4	2026-04-25 10:25:09	2026-04-25 10:25:09
4945	Vestido Labubu Preto(a) (Bendita Cute)	18	21	3	7	66.33	3	2026-04-25 10:25:09	2026-04-25 10:25:09
4946	Macacão Curto(a) Preto(a) (C&A Baby)	9	12	3	13	29.77	6	2026-04-25 10:25:09	2026-04-25 10:25:09
4947	Saia Listrado Azul (Akazys)	20	16	1	12	52.35	2	2026-04-25 10:25:09	2026-04-25 10:25:09
4948	Macacão Xadrez Prata (Carters)	32	12	18	2	22.45	8	2026-04-25 10:25:09	2026-04-25 10:25:09
4949	Blusa Básico(a) Verde (Renner Kids)	4	3	5	15	116.95	28	2026-04-25 10:25:09	2026-04-25 10:25:09
4950	Bermuda Animal Print Bege (Pimpolho)	3	1	14	3	59.75	26	2026-04-25 10:25:09	2026-04-25 10:25:09
4951	Meia Estampado(a) Prata (Maria Filó Kids)	13	14	18	10	83.07	20	2026-04-25 10:25:09	2026-04-25 10:25:09
4952	Casaco Algodão Preto(a) (Lilica Ripilica)	2	9	3	10	113.74	19	2026-04-25 10:25:09	2026-04-25 10:25:09
4953	Blusa Floral Cáqui (Mundo Infantil)	15	3	20	6	107.27	22	2026-04-25 10:25:09	2026-04-25 10:25:09
4954	Vestido Longa Turquesa (Disney Baby)	21	21	15	9	49.38	12	2026-04-25 10:25:09	2026-04-25 10:25:09
4955	Sunga Listrado Turquesa (Mundo Pet)	20	18	15	19	48.02	23	2026-04-25 10:25:09	2026-04-25 10:25:09
4956	Sutiã Casual Cáqui (Disney Kids)	5	19	20	13	81.46	13	2026-04-25 10:25:09	2026-04-25 10:25:09
4957	Calcinha Stitch Azul (Petit Royal)	28	6	1	8	30.03	25	2026-04-25 10:25:09	2026-04-25 10:25:09
4958	Biquine Longa Rosa (Disney Kids)	21	2	2	18	38.43	13	2026-04-25 10:25:09	2026-04-25 10:25:09
4959	Macacão Confortável Lilás (Disney Kids)	8	12	16	15	68.01	13	2026-04-25 10:25:09	2026-04-25 10:25:09
4960	Sutiã Xadrez Cinza (Dafiti Kids)	32	19	8	14	57.41	11	2026-04-25 10:25:09	2026-04-25 10:25:09
4961	Camiseta Longa Vermelho(a) (C&A Kids)	21	8	6	4	117.72	7	2026-04-25 10:25:09	2026-04-25 10:25:09
4962	Biquine Labubu Branco(a) (Farm Kids)	18	2	4	19	110.81	14	2026-04-25 10:25:09	2026-04-25 10:25:09
4963	Cueca Moleton Prata (Adidas Kids)	23	10	18	10	24.75	1	2026-04-25 10:25:09	2026-04-25 10:25:09
4964	Camisa Saja Rosa (Osklen Kids)	26	7	2	2	32.61	24	2026-04-25 10:25:09	2026-04-25 10:25:09
4965	Meia Toy Store Azul (Mundo Infantil)	30	14	1	2	87.90	22	2026-04-25 10:25:09	2026-04-25 10:25:09
4966	Camiseta Clássico(a) Cinza (Kily)	6	8	8	1	29.34	17	2026-04-25 10:25:09	2026-04-25 10:25:09
4967	Sunga Algodão Roxo(a) (Disney Kids)	2	18	12	1	29.49	13	2026-04-25 10:25:09	2026-04-25 10:25:09
4968	Vestido Moleton Marrom (Osklen Kids)	23	21	13	17	13.47	24	2026-04-25 10:25:09	2026-04-25 10:25:09
4969	Cueca Poliéster Cáqui (Adidas Kids)	24	10	20	18	66.51	1	2026-04-25 10:25:09	2026-04-25 10:25:09
4970	Calcinha Turma da Mônica Dourado(a) (Boboi)	31	6	17	17	80.86	4	2026-04-25 10:25:09	2026-04-25 10:25:09
4971	Calça Curto(a) Amarelo(a) (Petit Royal)	9	5	7	15	59.98	25	2026-04-25 10:25:09	2026-04-25 10:25:09
4972	Cueca Casual Dourado(a) (Renner Kids)	5	10	17	13	23.42	28	2026-04-25 10:25:09	2026-04-25 10:25:09
4973	Saia Xadrez Cáqui (Akazys)	32	16	20	14	67.16	2	2026-04-25 10:25:09	2026-04-25 10:25:09
4974	Sutiã Algodão Laranja (Bendita Cute)	2	19	11	7	89.65	3	2026-04-25 10:25:09	2026-04-25 10:25:09
4975	Casaco Leve Cinza (Carters)	19	9	8	6	34.67	8	2026-04-25 10:25:09	2026-04-25 10:25:09
4976	Macacão Turma da Mônica Amarelo(a) (Disney Baby)	31	12	7	14	57.48	12	2026-04-25 10:25:09	2026-04-25 10:25:09
4977	Camiseta Listrado Bege (Ki Carinho)	20	8	14	4	95.67	16	2026-04-25 10:25:09	2026-04-25 10:25:09
4978	Saia Esportivo(a) Cinza (Conjunto Infantil)	12	16	8	14	82.79	10	2026-04-25 10:25:09	2026-04-25 10:25:09
4979	Bermuda Confortável Marrom (Zoe Kids)	8	1	13	6	25.88	31	2026-04-25 10:25:09	2026-04-25 10:25:09
4980	Blusa Moleton Cáqui (Kily)	23	3	20	6	115.33	17	2026-04-25 10:25:09	2026-04-25 10:25:09
4981	Short Moleton Lilás (Disney Baby)	23	17	16	15	75.05	12	2026-04-25 10:25:09	2026-04-25 10:25:09
4982	Short Turma da Mônica Amarelo(a) (Zoe Kids)	31	17	7	3	35.40	31	2026-04-25 10:25:09	2026-04-25 10:25:09
4983	Cueca Elástico(a) Preto(a) (Salsa Jeans Kids)	11	10	3	17	16.01	30	2026-04-25 10:25:09	2026-04-25 10:25:09
4984	Calcinha Elástico(a) Vinho (Brandille)	11	6	19	17	78.75	5	2026-04-25 10:25:09	2026-04-25 10:25:09
4985	Bermuda Fit Vermelho(a) (Boboi)	14	1	6	11	48.56	4	2026-04-25 10:25:09	2026-04-25 10:25:09
4986	Vestido Labubu Branco(a) (Salsa Jeans Kids)	18	21	4	9	100.80	30	2026-04-25 10:25:09	2026-04-25 10:25:09
4987	Short Animal Print Turquesa (Bendita Cute)	3	17	15	2	50.50	3	2026-04-25 10:25:09	2026-04-25 10:25:09
4988	Bermuda Toy Store Bege (Kily)	30	1	14	8	103.44	17	2026-04-25 10:25:09	2026-04-25 10:25:09
4989	Pijama Formal Branco(a) (Carters)	16	15	4	17	78.25	8	2026-04-25 10:25:09	2026-04-25 10:25:09
4990	Cueca Elástico(a) Roxo(a) (Akazys)	11	10	12	16	55.18	2	2026-04-25 10:25:09	2026-04-25 10:25:09
4991	Vestido Elástico(a) Prata (C&A Kids)	11	21	18	12	102.21	7	2026-04-25 10:25:09	2026-04-25 10:25:09
4992	Jaqueta Esportivo(a) Verde (Marisol)	12	11	5	7	32.12	21	2026-04-25 10:25:09	2026-04-25 10:25:09
4993	Short Durável Azul (Zoe Kids)	10	17	1	15	118.35	31	2026-04-25 10:25:09	2026-04-25 10:25:09
4994	Sunga Leve Azul Escuro(a) (Lilica Ripilica)	19	18	9	17	101.33	19	2026-04-25 10:25:09	2026-04-25 10:25:09
4995	Maiô Temático(a) Rosa Choque (Hering Kids)	29	13	10	2	49.03	15	2026-04-25 10:25:09	2026-04-25 10:25:09
4996	Calçado Longa Cáqui (Mundo Infantil)	21	4	20	2	87.70	22	2026-04-25 10:25:09	2026-04-25 10:25:09
4997	Short Jeans Cáqui (C&A Baby)	17	17	20	10	16.89	6	2026-04-25 10:25:09	2026-04-25 10:25:09
4998	Camiseta Stitch Amarelo(a) (Mundo Pet)	28	8	7	8	96.71	23	2026-04-25 10:25:09	2026-04-25 10:25:09
4999	Top Estampado(a) Vinho (Maria Filó Kids)	13	20	19	5	95.98	20	2026-04-25 10:25:09	2026-04-25 10:25:09
5000	Calçado Casual Bege (Disney Baby)	5	4	14	8	97.72	12	2026-04-25 10:25:09	2026-04-25 10:25:09
\.


--
-- Data for Name: purcheases; Type: TABLE DATA; Schema: public; Owner: prs
--

COPY public.purcheases (id, product_id, customer_id, salesperson_id, dt_purchease, purchease_hash, created_at, updated_at) FROM stdin;
1	3249	48	3	2025-05-29 14:40:06	99fb61e41f70d3c32f59119f06683fe581f1172d	2026-04-25 10:25:09	2026-04-25 10:25:09
2	3311	48	3	2025-05-29 14:40:06	99fb61e41f70d3c32f59119f06683fe581f1172d	2026-04-25 10:25:09	2026-04-25 10:25:09
3	361	29	6	2025-05-01 14:02:22	c6a544cf858072dd596b4dca7c31f41538e78524	2026-04-25 10:25:09	2026-04-25 10:25:09
4	4666	29	6	2025-05-01 14:02:22	c6a544cf858072dd596b4dca7c31f41538e78524	2026-04-25 10:25:09	2026-04-25 10:25:09
5	4138	29	6	2025-05-01 14:02:22	c6a544cf858072dd596b4dca7c31f41538e78524	2026-04-25 10:25:09	2026-04-25 10:25:09
6	2746	29	6	2025-05-01 14:02:22	c6a544cf858072dd596b4dca7c31f41538e78524	2026-04-25 10:25:09	2026-04-25 10:25:09
7	1313	29	6	2025-05-01 14:02:22	c6a544cf858072dd596b4dca7c31f41538e78524	2026-04-25 10:25:09	2026-04-25 10:25:09
8	2495	29	6	2025-05-01 14:02:22	c6a544cf858072dd596b4dca7c31f41538e78524	2026-04-25 10:25:09	2026-04-25 10:25:09
9	3353	29	6	2025-05-01 14:02:22	c6a544cf858072dd596b4dca7c31f41538e78524	2026-04-25 10:25:09	2026-04-25 10:25:09
10	3494	29	6	2025-05-01 14:02:22	c6a544cf858072dd596b4dca7c31f41538e78524	2026-04-25 10:25:09	2026-04-25 10:25:09
11	1724	87	4	2026-02-13 13:56:43	4b28ebbf8fdfa87e8dfa9a3e51bee00823467179	2026-04-25 10:25:09	2026-04-25 10:25:09
12	1034	73	6	2025-08-12 16:32:01	6e30cbc5e0e6f86b286bc2dc36c527240221324d	2026-04-25 10:25:09	2026-04-25 10:25:09
13	775	73	6	2025-08-12 16:32:01	6e30cbc5e0e6f86b286bc2dc36c527240221324d	2026-04-25 10:25:09	2026-04-25 10:25:09
14	675	73	6	2025-08-12 16:32:01	6e30cbc5e0e6f86b286bc2dc36c527240221324d	2026-04-25 10:25:09	2026-04-25 10:25:09
15	682	73	6	2025-08-12 16:32:01	6e30cbc5e0e6f86b286bc2dc36c527240221324d	2026-04-25 10:25:09	2026-04-25 10:25:09
16	853	73	6	2025-08-12 16:32:01	6e30cbc5e0e6f86b286bc2dc36c527240221324d	2026-04-25 10:25:09	2026-04-25 10:25:09
17	827	73	6	2025-08-12 16:32:01	6e30cbc5e0e6f86b286bc2dc36c527240221324d	2026-04-25 10:25:09	2026-04-25 10:25:09
18	2733	73	6	2025-08-12 16:32:01	6e30cbc5e0e6f86b286bc2dc36c527240221324d	2026-04-25 10:25:09	2026-04-25 10:25:09
19	2122	73	6	2025-08-12 16:32:01	6e30cbc5e0e6f86b286bc2dc36c527240221324d	2026-04-25 10:25:09	2026-04-25 10:25:09
20	3563	38	3	2025-06-19 15:16:17	bb4d54e697ee91f3e3385b31b0d592e32a496ecb	2026-04-25 10:25:09	2026-04-25 10:25:09
21	4638	38	3	2025-06-19 15:16:17	bb4d54e697ee91f3e3385b31b0d592e32a496ecb	2026-04-25 10:25:09	2026-04-25 10:25:09
22	556	38	3	2025-06-19 15:16:17	bb4d54e697ee91f3e3385b31b0d592e32a496ecb	2026-04-25 10:25:09	2026-04-25 10:25:09
23	4313	84	10	2025-09-06 17:20:32	b72734bef2f069c4eeaabc0ab5861eb7a2429f78	2026-04-25 10:25:09	2026-04-25 10:25:09
24	911	84	10	2025-09-06 17:20:32	b72734bef2f069c4eeaabc0ab5861eb7a2429f78	2026-04-25 10:25:09	2026-04-25 10:25:09
25	3446	84	10	2025-09-06 17:20:32	b72734bef2f069c4eeaabc0ab5861eb7a2429f78	2026-04-25 10:25:09	2026-04-25 10:25:09
26	3826	84	10	2025-09-06 17:20:32	b72734bef2f069c4eeaabc0ab5861eb7a2429f78	2026-04-25 10:25:09	2026-04-25 10:25:09
27	2910	84	10	2025-09-06 17:20:32	b72734bef2f069c4eeaabc0ab5861eb7a2429f78	2026-04-25 10:25:09	2026-04-25 10:25:09
28	624	84	10	2025-09-06 17:20:32	b72734bef2f069c4eeaabc0ab5861eb7a2429f78	2026-04-25 10:25:09	2026-04-25 10:25:09
29	762	49	4	2025-11-11 09:25:28	c27c0baca66185d33000d9fcbc011c7128b9265a	2026-04-25 10:25:09	2026-04-25 10:25:09
30	3993	49	4	2025-11-11 09:25:28	c27c0baca66185d33000d9fcbc011c7128b9265a	2026-04-25 10:25:09	2026-04-25 10:25:09
31	1101	49	4	2025-11-11 09:25:28	c27c0baca66185d33000d9fcbc011c7128b9265a	2026-04-25 10:25:09	2026-04-25 10:25:09
32	587	86	9	2026-04-23 11:33:12	17069255adf35b33389418c327a49635f7fc7fee	2026-04-25 10:25:09	2026-04-25 10:25:09
33	2581	86	9	2026-04-23 11:33:12	17069255adf35b33389418c327a49635f7fc7fee	2026-04-25 10:25:09	2026-04-25 10:25:09
34	1353	93	8	2025-12-21 14:23:09	65d8bd69f4f3e445c70e31d99aafa3c7586eb144	2026-04-25 10:25:09	2026-04-25 10:25:09
35	4371	93	8	2025-12-21 14:23:09	65d8bd69f4f3e445c70e31d99aafa3c7586eb144	2026-04-25 10:25:09	2026-04-25 10:25:09
36	2121	93	8	2025-12-21 14:23:09	65d8bd69f4f3e445c70e31d99aafa3c7586eb144	2026-04-25 10:25:09	2026-04-25 10:25:09
37	2412	93	8	2025-12-21 14:23:09	65d8bd69f4f3e445c70e31d99aafa3c7586eb144	2026-04-25 10:25:09	2026-04-25 10:25:09
38	3079	93	8	2025-12-21 14:23:09	65d8bd69f4f3e445c70e31d99aafa3c7586eb144	2026-04-25 10:25:09	2026-04-25 10:25:09
39	1593	25	9	2025-06-01 09:49:07	92f96368b91f42a2f95e8f2b38216cb5fdd02e95	2026-04-25 10:25:09	2026-04-25 10:25:09
40	4140	25	9	2025-06-01 09:49:07	92f96368b91f42a2f95e8f2b38216cb5fdd02e95	2026-04-25 10:25:09	2026-04-25 10:25:09
41	4177	25	9	2025-06-01 09:49:07	92f96368b91f42a2f95e8f2b38216cb5fdd02e95	2026-04-25 10:25:09	2026-04-25 10:25:09
42	2825	75	3	2025-09-17 11:46:00	c6a41cad97269334b59f3dfe1cbbbb10cf2bb568	2026-04-25 10:25:09	2026-04-25 10:25:09
43	851	75	3	2025-09-17 11:46:00	c6a41cad97269334b59f3dfe1cbbbb10cf2bb568	2026-04-25 10:25:09	2026-04-25 10:25:09
44	85	75	3	2025-09-17 11:46:00	c6a41cad97269334b59f3dfe1cbbbb10cf2bb568	2026-04-25 10:25:09	2026-04-25 10:25:09
45	3108	75	3	2025-09-17 11:46:00	c6a41cad97269334b59f3dfe1cbbbb10cf2bb568	2026-04-25 10:25:09	2026-04-25 10:25:09
46	652	75	3	2025-09-17 11:46:00	c6a41cad97269334b59f3dfe1cbbbb10cf2bb568	2026-04-25 10:25:09	2026-04-25 10:25:09
47	3224	75	3	2025-09-17 11:46:00	c6a41cad97269334b59f3dfe1cbbbb10cf2bb568	2026-04-25 10:25:09	2026-04-25 10:25:09
48	2887	75	3	2025-09-17 11:46:00	c6a41cad97269334b59f3dfe1cbbbb10cf2bb568	2026-04-25 10:25:09	2026-04-25 10:25:09
49	2533	75	3	2025-09-17 11:46:00	c6a41cad97269334b59f3dfe1cbbbb10cf2bb568	2026-04-25 10:25:09	2026-04-25 10:25:09
50	81	14	4	2025-12-11 17:16:40	2161f5ed792b6987515fdb0b5291dfd91f16feb9	2026-04-25 10:25:09	2026-04-25 10:25:09
51	2655	14	4	2025-12-11 17:16:40	2161f5ed792b6987515fdb0b5291dfd91f16feb9	2026-04-25 10:25:09	2026-04-25 10:25:09
52	2482	14	4	2025-12-11 17:16:40	2161f5ed792b6987515fdb0b5291dfd91f16feb9	2026-04-25 10:25:09	2026-04-25 10:25:09
53	4203	14	4	2025-12-11 17:16:40	2161f5ed792b6987515fdb0b5291dfd91f16feb9	2026-04-25 10:25:09	2026-04-25 10:25:09
54	552	58	9	2025-05-09 09:20:23	9ba1700a67fb849319bcaae70e40f912fc1a5835	2026-04-25 10:25:09	2026-04-25 10:25:09
55	462	58	9	2025-05-09 09:20:23	9ba1700a67fb849319bcaae70e40f912fc1a5835	2026-04-25 10:25:09	2026-04-25 10:25:09
56	1833	58	9	2025-05-09 09:20:23	9ba1700a67fb849319bcaae70e40f912fc1a5835	2026-04-25 10:25:09	2026-04-25 10:25:09
57	951	58	9	2025-05-09 09:20:23	9ba1700a67fb849319bcaae70e40f912fc1a5835	2026-04-25 10:25:09	2026-04-25 10:25:09
58	1854	58	9	2025-05-09 09:20:23	9ba1700a67fb849319bcaae70e40f912fc1a5835	2026-04-25 10:25:09	2026-04-25 10:25:09
59	2848	76	10	2026-01-25 09:11:39	c5dc47ba4def363959b6bfce2455439156045fe3	2026-04-25 10:25:09	2026-04-25 10:25:09
60	1847	8	1	2026-02-15 13:16:50	2a58c779a576600119723d43388a661b2175a7a3	2026-04-25 10:25:09	2026-04-25 10:25:09
61	685	57	9	2025-09-22 09:45:56	e5a5e4315b1fa8f6f3633748610648ae35409b60	2026-04-25 10:25:09	2026-04-25 10:25:09
62	3111	57	9	2025-09-22 09:45:56	e5a5e4315b1fa8f6f3633748610648ae35409b60	2026-04-25 10:25:09	2026-04-25 10:25:09
63	4511	11	4	2026-03-24 17:41:32	4958db46d20690f93075636058cffdb0b4853838	2026-04-25 10:25:09	2026-04-25 10:25:09
64	969	11	4	2026-03-24 17:41:32	4958db46d20690f93075636058cffdb0b4853838	2026-04-25 10:25:09	2026-04-25 10:25:09
65	1566	11	4	2026-03-24 17:41:32	4958db46d20690f93075636058cffdb0b4853838	2026-04-25 10:25:09	2026-04-25 10:25:09
66	304	11	4	2026-03-24 17:41:32	4958db46d20690f93075636058cffdb0b4853838	2026-04-25 10:25:09	2026-04-25 10:25:09
67	2974	11	4	2026-03-24 17:41:32	4958db46d20690f93075636058cffdb0b4853838	2026-04-25 10:25:09	2026-04-25 10:25:09
68	4180	11	4	2026-03-24 17:41:32	4958db46d20690f93075636058cffdb0b4853838	2026-04-25 10:25:09	2026-04-25 10:25:09
69	3602	11	4	2026-03-24 17:41:32	4958db46d20690f93075636058cffdb0b4853838	2026-04-25 10:25:09	2026-04-25 10:25:09
70	2741	11	4	2026-03-24 17:41:32	4958db46d20690f93075636058cffdb0b4853838	2026-04-25 10:25:09	2026-04-25 10:25:09
71	2042	94	6	2025-10-04 16:35:40	f3753b0c1d7b8faef95d5a9af07d7916725c91b2	2026-04-25 10:25:09	2026-04-25 10:25:09
72	4226	94	6	2025-10-04 16:35:40	f3753b0c1d7b8faef95d5a9af07d7916725c91b2	2026-04-25 10:25:09	2026-04-25 10:25:09
73	108	70	5	2025-06-10 16:37:05	208c1d73ad54d524cb2e34e86d6a9e8fe9c06ab9	2026-04-25 10:25:09	2026-04-25 10:25:09
74	3489	70	5	2025-06-10 16:37:05	208c1d73ad54d524cb2e34e86d6a9e8fe9c06ab9	2026-04-25 10:25:09	2026-04-25 10:25:09
75	2064	70	5	2025-06-10 16:37:05	208c1d73ad54d524cb2e34e86d6a9e8fe9c06ab9	2026-04-25 10:25:09	2026-04-25 10:25:09
76	3227	70	5	2025-06-10 16:37:05	208c1d73ad54d524cb2e34e86d6a9e8fe9c06ab9	2026-04-25 10:25:09	2026-04-25 10:25:09
77	4551	70	5	2025-06-10 16:37:05	208c1d73ad54d524cb2e34e86d6a9e8fe9c06ab9	2026-04-25 10:25:09	2026-04-25 10:25:09
78	2411	70	5	2025-06-10 16:37:05	208c1d73ad54d524cb2e34e86d6a9e8fe9c06ab9	2026-04-25 10:25:09	2026-04-25 10:25:09
79	4296	70	5	2025-06-10 16:37:05	208c1d73ad54d524cb2e34e86d6a9e8fe9c06ab9	2026-04-25 10:25:09	2026-04-25 10:25:09
80	1494	70	5	2025-06-10 16:37:05	208c1d73ad54d524cb2e34e86d6a9e8fe9c06ab9	2026-04-25 10:25:09	2026-04-25 10:25:09
81	3212	10	8	2025-09-28 14:08:34	c9694aa9d0a2ed03037487b0107ac55835249bc9	2026-04-25 10:25:09	2026-04-25 10:25:09
82	3342	10	8	2025-09-28 14:08:34	c9694aa9d0a2ed03037487b0107ac55835249bc9	2026-04-25 10:25:09	2026-04-25 10:25:09
83	1060	10	8	2025-09-28 14:08:34	c9694aa9d0a2ed03037487b0107ac55835249bc9	2026-04-25 10:25:09	2026-04-25 10:25:09
84	1644	10	8	2025-09-28 14:08:34	c9694aa9d0a2ed03037487b0107ac55835249bc9	2026-04-25 10:25:09	2026-04-25 10:25:09
85	716	10	8	2025-09-28 14:08:34	c9694aa9d0a2ed03037487b0107ac55835249bc9	2026-04-25 10:25:09	2026-04-25 10:25:09
86	1092	10	8	2025-09-28 14:08:34	c9694aa9d0a2ed03037487b0107ac55835249bc9	2026-04-25 10:25:09	2026-04-25 10:25:09
87	4039	10	8	2025-09-28 14:08:34	c9694aa9d0a2ed03037487b0107ac55835249bc9	2026-04-25 10:25:09	2026-04-25 10:25:09
88	4979	10	8	2025-09-28 14:08:34	c9694aa9d0a2ed03037487b0107ac55835249bc9	2026-04-25 10:25:09	2026-04-25 10:25:09
89	4351	10	8	2025-09-28 14:08:34	c9694aa9d0a2ed03037487b0107ac55835249bc9	2026-04-25 10:25:09	2026-04-25 10:25:09
90	512	10	8	2025-09-28 14:08:34	c9694aa9d0a2ed03037487b0107ac55835249bc9	2026-04-25 10:25:09	2026-04-25 10:25:09
91	585	61	6	2026-03-30 17:18:50	9e055c3c91ff413376f61a77784185b473580b52	2026-04-25 10:25:09	2026-04-25 10:25:09
92	3568	61	6	2026-03-30 17:18:50	9e055c3c91ff413376f61a77784185b473580b52	2026-04-25 10:25:09	2026-04-25 10:25:09
93	2964	61	6	2026-03-30 17:18:50	9e055c3c91ff413376f61a77784185b473580b52	2026-04-25 10:25:09	2026-04-25 10:25:09
94	1780	61	6	2026-03-30 17:18:50	9e055c3c91ff413376f61a77784185b473580b52	2026-04-25 10:25:09	2026-04-25 10:25:09
95	236	61	6	2026-03-30 17:18:50	9e055c3c91ff413376f61a77784185b473580b52	2026-04-25 10:25:09	2026-04-25 10:25:09
96	2861	10	3	2025-09-28 11:35:18	05f946e57a82040c764b6c34f428d1024f137a68	2026-04-25 10:25:09	2026-04-25 10:25:09
97	3193	10	3	2025-09-28 11:35:18	05f946e57a82040c764b6c34f428d1024f137a68	2026-04-25 10:25:09	2026-04-25 10:25:09
98	1796	10	3	2025-09-28 11:35:18	05f946e57a82040c764b6c34f428d1024f137a68	2026-04-25 10:25:09	2026-04-25 10:25:09
99	4437	88	2	2025-12-27 09:57:50	004da8d88de2ac910b1bc4b0c397d5682f81d536	2026-04-25 10:25:09	2026-04-25 10:25:09
100	5	88	2	2025-12-27 09:57:50	004da8d88de2ac910b1bc4b0c397d5682f81d536	2026-04-25 10:25:09	2026-04-25 10:25:09
101	321	88	2	2025-12-27 09:57:50	004da8d88de2ac910b1bc4b0c397d5682f81d536	2026-04-25 10:25:09	2026-04-25 10:25:09
102	1690	88	2	2025-12-27 09:57:50	004da8d88de2ac910b1bc4b0c397d5682f81d536	2026-04-25 10:25:09	2026-04-25 10:25:09
103	2200	88	2	2025-12-27 09:57:50	004da8d88de2ac910b1bc4b0c397d5682f81d536	2026-04-25 10:25:09	2026-04-25 10:25:09
104	2904	88	2	2025-12-27 09:57:50	004da8d88de2ac910b1bc4b0c397d5682f81d536	2026-04-25 10:25:09	2026-04-25 10:25:09
105	3160	88	2	2025-12-27 09:57:50	004da8d88de2ac910b1bc4b0c397d5682f81d536	2026-04-25 10:25:09	2026-04-25 10:25:09
106	3239	88	2	2025-12-27 09:57:50	004da8d88de2ac910b1bc4b0c397d5682f81d536	2026-04-25 10:25:09	2026-04-25 10:25:09
107	2298	88	2	2025-12-27 09:57:50	004da8d88de2ac910b1bc4b0c397d5682f81d536	2026-04-25 10:25:09	2026-04-25 10:25:09
108	4715	88	2	2025-12-27 09:57:50	004da8d88de2ac910b1bc4b0c397d5682f81d536	2026-04-25 10:25:09	2026-04-25 10:25:09
109	2771	94	9	2025-07-11 09:36:19	e55583aae2c22c8888a53a0f327634a877e9eaf0	2026-04-25 10:25:09	2026-04-25 10:25:09
110	3110	94	9	2025-07-11 09:36:19	e55583aae2c22c8888a53a0f327634a877e9eaf0	2026-04-25 10:25:09	2026-04-25 10:25:09
111	1771	94	9	2025-07-11 09:36:19	e55583aae2c22c8888a53a0f327634a877e9eaf0	2026-04-25 10:25:09	2026-04-25 10:25:09
112	3313	94	9	2025-07-11 09:36:19	e55583aae2c22c8888a53a0f327634a877e9eaf0	2026-04-25 10:25:09	2026-04-25 10:25:09
113	3369	91	1	2025-12-26 11:13:12	2a9d3178d00e4a3198359913720695e0177cb5c0	2026-04-25 10:25:09	2026-04-25 10:25:09
114	3652	91	1	2025-12-26 11:13:12	2a9d3178d00e4a3198359913720695e0177cb5c0	2026-04-25 10:25:09	2026-04-25 10:25:09
115	124	91	1	2025-12-26 11:13:12	2a9d3178d00e4a3198359913720695e0177cb5c0	2026-04-25 10:25:09	2026-04-25 10:25:09
116	2882	91	1	2025-12-26 11:13:12	2a9d3178d00e4a3198359913720695e0177cb5c0	2026-04-25 10:25:09	2026-04-25 10:25:09
117	1107	38	2	2026-04-05 09:41:21	a21fd4aeb63daa45ef97a1d4269fbca7985ff16a	2026-04-25 10:25:09	2026-04-25 10:25:09
118	4021	38	2	2026-04-05 09:41:21	a21fd4aeb63daa45ef97a1d4269fbca7985ff16a	2026-04-25 10:25:09	2026-04-25 10:25:09
119	2609	38	2	2026-04-05 09:41:21	a21fd4aeb63daa45ef97a1d4269fbca7985ff16a	2026-04-25 10:25:09	2026-04-25 10:25:09
120	4847	78	9	2025-08-20 11:49:25	c5cc488fa5c67dfa8629984f871a30f64cffcd01	2026-04-25 10:25:09	2026-04-25 10:25:09
121	2094	78	9	2025-08-20 11:49:25	c5cc488fa5c67dfa8629984f871a30f64cffcd01	2026-04-25 10:25:09	2026-04-25 10:25:09
122	3423	21	4	2025-11-12 15:03:30	ab699f69bfae7b93830099c4517096a7d80f801e	2026-04-25 10:25:09	2026-04-25 10:25:09
123	4163	43	1	2026-03-30 17:48:47	9b8bd98aac90bf200f71a7f7961561c445af2f3c	2026-04-25 10:25:09	2026-04-25 10:25:09
124	1015	43	1	2026-03-30 17:48:47	9b8bd98aac90bf200f71a7f7961561c445af2f3c	2026-04-25 10:25:09	2026-04-25 10:25:09
125	887	58	7	2025-12-01 17:30:06	f60d9be693b69d53b90af012551ed96e116c87e3	2026-04-25 10:25:09	2026-04-25 10:25:09
126	3417	58	7	2025-12-01 17:30:06	f60d9be693b69d53b90af012551ed96e116c87e3	2026-04-25 10:25:09	2026-04-25 10:25:09
127	4834	58	7	2025-12-01 17:30:06	f60d9be693b69d53b90af012551ed96e116c87e3	2026-04-25 10:25:09	2026-04-25 10:25:09
128	4494	58	7	2025-12-01 17:30:06	f60d9be693b69d53b90af012551ed96e116c87e3	2026-04-25 10:25:09	2026-04-25 10:25:09
129	3287	58	7	2025-12-01 17:30:06	f60d9be693b69d53b90af012551ed96e116c87e3	2026-04-25 10:25:09	2026-04-25 10:25:09
130	4321	28	3	2026-02-19 16:23:42	2412d672e6d9f80d16b87059901758a6a50c4c09	2026-04-25 10:25:09	2026-04-25 10:25:09
131	569	28	3	2026-02-19 16:23:42	2412d672e6d9f80d16b87059901758a6a50c4c09	2026-04-25 10:25:09	2026-04-25 10:25:09
132	19	28	3	2026-02-19 16:23:42	2412d672e6d9f80d16b87059901758a6a50c4c09	2026-04-25 10:25:09	2026-04-25 10:25:09
133	3492	28	3	2026-02-19 16:23:42	2412d672e6d9f80d16b87059901758a6a50c4c09	2026-04-25 10:25:09	2026-04-25 10:25:09
134	2578	28	3	2026-02-19 16:23:42	2412d672e6d9f80d16b87059901758a6a50c4c09	2026-04-25 10:25:09	2026-04-25 10:25:09
135	3289	28	3	2026-02-19 16:23:42	2412d672e6d9f80d16b87059901758a6a50c4c09	2026-04-25 10:25:09	2026-04-25 10:25:09
136	1936	69	7	2026-03-24 09:37:13	cf81cda70388e6633b630578ce9da86a7a8ed5b3	2026-04-25 10:25:09	2026-04-25 10:25:09
137	3331	69	7	2026-03-24 09:37:13	cf81cda70388e6633b630578ce9da86a7a8ed5b3	2026-04-25 10:25:09	2026-04-25 10:25:09
138	4978	69	7	2026-03-24 09:37:13	cf81cda70388e6633b630578ce9da86a7a8ed5b3	2026-04-25 10:25:09	2026-04-25 10:25:09
139	2388	69	7	2026-03-24 09:37:13	cf81cda70388e6633b630578ce9da86a7a8ed5b3	2026-04-25 10:25:09	2026-04-25 10:25:09
140	1727	69	7	2026-03-24 09:37:13	cf81cda70388e6633b630578ce9da86a7a8ed5b3	2026-04-25 10:25:09	2026-04-25 10:25:09
141	3405	69	7	2026-03-24 09:37:13	cf81cda70388e6633b630578ce9da86a7a8ed5b3	2026-04-25 10:25:09	2026-04-25 10:25:09
142	3544	30	4	2026-03-18 15:55:11	fc8ea904a7dc666ba47005800706de4b9fd25426	2026-04-25 10:25:09	2026-04-25 10:25:09
143	3589	30	4	2026-03-18 15:55:11	fc8ea904a7dc666ba47005800706de4b9fd25426	2026-04-25 10:25:09	2026-04-25 10:25:09
144	3985	30	4	2026-03-18 15:55:11	fc8ea904a7dc666ba47005800706de4b9fd25426	2026-04-25 10:25:09	2026-04-25 10:25:09
145	2695	30	4	2026-03-18 15:55:11	fc8ea904a7dc666ba47005800706de4b9fd25426	2026-04-25 10:25:09	2026-04-25 10:25:09
146	1359	30	4	2026-03-18 15:55:11	fc8ea904a7dc666ba47005800706de4b9fd25426	2026-04-25 10:25:09	2026-04-25 10:25:09
147	2336	35	5	2025-08-03 13:51:48	7db85c3f6a6f0b52a6a9d5eef34ea9429231f9f2	2026-04-25 10:25:09	2026-04-25 10:25:09
148	797	35	5	2025-08-03 13:51:48	7db85c3f6a6f0b52a6a9d5eef34ea9429231f9f2	2026-04-25 10:25:09	2026-04-25 10:25:09
149	365	35	5	2025-08-03 13:51:48	7db85c3f6a6f0b52a6a9d5eef34ea9429231f9f2	2026-04-25 10:25:09	2026-04-25 10:25:09
150	4610	35	5	2025-08-03 13:51:48	7db85c3f6a6f0b52a6a9d5eef34ea9429231f9f2	2026-04-25 10:25:09	2026-04-25 10:25:09
151	1045	35	5	2025-08-03 13:51:48	7db85c3f6a6f0b52a6a9d5eef34ea9429231f9f2	2026-04-25 10:25:09	2026-04-25 10:25:09
152	360	18	5	2025-06-27 14:32:03	70c0663abf6b6c9b4fa96c19847b4b2b70c5ba6a	2026-04-25 10:25:09	2026-04-25 10:25:09
153	638	18	5	2025-06-27 14:32:03	70c0663abf6b6c9b4fa96c19847b4b2b70c5ba6a	2026-04-25 10:25:09	2026-04-25 10:25:09
154	464	18	5	2025-06-27 14:32:03	70c0663abf6b6c9b4fa96c19847b4b2b70c5ba6a	2026-04-25 10:25:09	2026-04-25 10:25:09
155	585	50	2	2025-07-25 12:14:43	aa4610d425474ff04585929831b25864e779cf9a	2026-04-25 10:25:09	2026-04-25 10:25:09
156	1649	3	2	2025-05-14 12:07:48	4701c589c015de5a612fb6d2b317954e45de9121	2026-04-25 10:25:09	2026-04-25 10:25:09
157	2709	76	5	2025-08-24 14:49:59	e6c1c3040e5fdb70f983d81a01fdf4b22c7c330c	2026-04-25 10:25:09	2026-04-25 10:25:09
158	4617	76	5	2025-08-24 14:49:59	e6c1c3040e5fdb70f983d81a01fdf4b22c7c330c	2026-04-25 10:25:09	2026-04-25 10:25:09
159	330	76	5	2025-08-24 14:49:59	e6c1c3040e5fdb70f983d81a01fdf4b22c7c330c	2026-04-25 10:25:09	2026-04-25 10:25:09
160	2775	76	5	2025-08-24 14:49:59	e6c1c3040e5fdb70f983d81a01fdf4b22c7c330c	2026-04-25 10:25:09	2026-04-25 10:25:09
161	1851	76	5	2025-08-24 14:49:59	e6c1c3040e5fdb70f983d81a01fdf4b22c7c330c	2026-04-25 10:25:09	2026-04-25 10:25:09
162	3478	76	5	2025-08-24 14:49:59	e6c1c3040e5fdb70f983d81a01fdf4b22c7c330c	2026-04-25 10:25:09	2026-04-25 10:25:09
163	4349	29	4	2026-04-03 11:33:44	eba9b1d1c67c5ef330ee0b88382b5bc24809250d	2026-04-25 10:25:09	2026-04-25 10:25:09
164	4665	29	4	2026-04-03 11:33:44	eba9b1d1c67c5ef330ee0b88382b5bc24809250d	2026-04-25 10:25:09	2026-04-25 10:25:09
165	492	29	4	2026-04-03 11:33:44	eba9b1d1c67c5ef330ee0b88382b5bc24809250d	2026-04-25 10:25:09	2026-04-25 10:25:09
166	2938	29	4	2026-04-03 11:33:44	eba9b1d1c67c5ef330ee0b88382b5bc24809250d	2026-04-25 10:25:09	2026-04-25 10:25:09
167	3272	29	4	2026-04-03 11:33:44	eba9b1d1c67c5ef330ee0b88382b5bc24809250d	2026-04-25 10:25:09	2026-04-25 10:25:09
168	3782	29	4	2026-04-03 11:33:44	eba9b1d1c67c5ef330ee0b88382b5bc24809250d	2026-04-25 10:25:09	2026-04-25 10:25:09
169	2908	29	4	2026-04-03 11:33:44	eba9b1d1c67c5ef330ee0b88382b5bc24809250d	2026-04-25 10:25:09	2026-04-25 10:25:09
170	2034	20	9	2025-11-17 13:03:39	8f6ed65abe1a59974611c8610f1aae20d0503732	2026-04-25 10:25:09	2026-04-25 10:25:09
171	3924	98	9	2026-04-22 14:46:16	ae33843cf6b586a5da7b7e6f3f1a9bb7b5d0235f	2026-04-25 10:25:09	2026-04-25 10:25:09
172	4049	98	9	2026-04-22 14:46:16	ae33843cf6b586a5da7b7e6f3f1a9bb7b5d0235f	2026-04-25 10:25:09	2026-04-25 10:25:09
173	1075	98	9	2026-04-22 14:46:16	ae33843cf6b586a5da7b7e6f3f1a9bb7b5d0235f	2026-04-25 10:25:09	2026-04-25 10:25:09
174	1968	98	9	2026-04-22 14:46:16	ae33843cf6b586a5da7b7e6f3f1a9bb7b5d0235f	2026-04-25 10:25:09	2026-04-25 10:25:09
175	4545	98	9	2026-04-22 14:46:16	ae33843cf6b586a5da7b7e6f3f1a9bb7b5d0235f	2026-04-25 10:25:09	2026-04-25 10:25:09
176	4716	10	1	2025-06-03 15:31:48	a67c42563488f3a00f8a194aaed9b225669bd22f	2026-04-25 10:25:09	2026-04-25 10:25:09
177	4432	10	1	2025-06-03 15:31:48	a67c42563488f3a00f8a194aaed9b225669bd22f	2026-04-25 10:25:09	2026-04-25 10:25:09
178	1945	10	1	2025-06-03 15:31:48	a67c42563488f3a00f8a194aaed9b225669bd22f	2026-04-25 10:25:09	2026-04-25 10:25:09
179	2760	10	1	2025-06-03 15:31:48	a67c42563488f3a00f8a194aaed9b225669bd22f	2026-04-25 10:25:09	2026-04-25 10:25:09
180	4501	10	1	2025-06-03 15:31:48	a67c42563488f3a00f8a194aaed9b225669bd22f	2026-04-25 10:25:09	2026-04-25 10:25:09
181	1586	10	1	2025-06-03 15:31:48	a67c42563488f3a00f8a194aaed9b225669bd22f	2026-04-25 10:25:09	2026-04-25 10:25:09
182	3280	10	1	2025-06-03 15:31:48	a67c42563488f3a00f8a194aaed9b225669bd22f	2026-04-25 10:25:09	2026-04-25 10:25:09
183	3026	10	1	2025-06-03 15:31:48	a67c42563488f3a00f8a194aaed9b225669bd22f	2026-04-25 10:25:09	2026-04-25 10:25:09
184	2932	10	1	2025-06-03 15:31:48	a67c42563488f3a00f8a194aaed9b225669bd22f	2026-04-25 10:25:09	2026-04-25 10:25:09
185	3549	13	3	2025-06-27 16:35:42	beacd1f92a331d197f3c47156821a5e29d1f8d60	2026-04-25 10:25:09	2026-04-25 10:25:09
186	4422	13	3	2025-06-27 16:35:42	beacd1f92a331d197f3c47156821a5e29d1f8d60	2026-04-25 10:25:09	2026-04-25 10:25:09
187	1056	13	3	2025-06-27 16:35:42	beacd1f92a331d197f3c47156821a5e29d1f8d60	2026-04-25 10:25:09	2026-04-25 10:25:09
188	945	13	3	2025-06-27 16:35:42	beacd1f92a331d197f3c47156821a5e29d1f8d60	2026-04-25 10:25:09	2026-04-25 10:25:09
189	933	13	3	2025-06-27 16:35:42	beacd1f92a331d197f3c47156821a5e29d1f8d60	2026-04-25 10:25:09	2026-04-25 10:25:09
190	1157	13	3	2025-06-27 16:35:42	beacd1f92a331d197f3c47156821a5e29d1f8d60	2026-04-25 10:25:09	2026-04-25 10:25:09
191	3026	76	4	2026-03-09 10:55:09	7480aca6e14d7974b5303cb63ecd76e4f92cf708	2026-04-25 10:25:09	2026-04-25 10:25:09
192	1602	76	4	2026-03-09 10:55:09	7480aca6e14d7974b5303cb63ecd76e4f92cf708	2026-04-25 10:25:09	2026-04-25 10:25:09
193	1137	76	4	2026-03-09 10:55:09	7480aca6e14d7974b5303cb63ecd76e4f92cf708	2026-04-25 10:25:09	2026-04-25 10:25:09
194	4387	94	9	2025-12-16 17:38:54	22c2539da8231cafb1fbd6e525baa18e28264c13	2026-04-25 10:25:09	2026-04-25 10:25:09
195	4481	94	9	2025-12-16 17:38:54	22c2539da8231cafb1fbd6e525baa18e28264c13	2026-04-25 10:25:09	2026-04-25 10:25:09
196	3460	94	9	2025-12-16 17:38:54	22c2539da8231cafb1fbd6e525baa18e28264c13	2026-04-25 10:25:09	2026-04-25 10:25:09
197	351	94	9	2025-12-16 17:38:54	22c2539da8231cafb1fbd6e525baa18e28264c13	2026-04-25 10:25:09	2026-04-25 10:25:09
198	2265	94	9	2025-12-16 17:38:54	22c2539da8231cafb1fbd6e525baa18e28264c13	2026-04-25 10:25:09	2026-04-25 10:25:09
199	707	94	9	2025-12-16 17:38:54	22c2539da8231cafb1fbd6e525baa18e28264c13	2026-04-25 10:25:09	2026-04-25 10:25:09
200	2853	63	4	2025-10-27 12:08:19	35abb22c8c86dc238c47cc53b9e3f7b24c4108e5	2026-04-25 10:25:09	2026-04-25 10:25:09
201	2937	63	4	2025-10-27 12:08:19	35abb22c8c86dc238c47cc53b9e3f7b24c4108e5	2026-04-25 10:25:09	2026-04-25 10:25:09
202	2954	63	4	2025-10-27 12:08:19	35abb22c8c86dc238c47cc53b9e3f7b24c4108e5	2026-04-25 10:25:09	2026-04-25 10:25:09
203	11	63	4	2025-10-27 12:08:19	35abb22c8c86dc238c47cc53b9e3f7b24c4108e5	2026-04-25 10:25:09	2026-04-25 10:25:09
204	132	25	7	2025-12-04 12:39:38	66511bdf3d13bf4f8b88c265105e45a076466f89	2026-04-25 10:25:09	2026-04-25 10:25:09
205	780	25	7	2025-12-04 12:39:38	66511bdf3d13bf4f8b88c265105e45a076466f89	2026-04-25 10:25:09	2026-04-25 10:25:09
206	3596	44	2	2025-07-17 15:06:31	a7bf135a0a5bac50849ec18eb91b76607557de57	2026-04-25 10:25:09	2026-04-25 10:25:09
207	2513	44	2	2025-07-17 15:06:31	a7bf135a0a5bac50849ec18eb91b76607557de57	2026-04-25 10:25:09	2026-04-25 10:25:09
208	1745	44	2	2025-07-17 15:06:31	a7bf135a0a5bac50849ec18eb91b76607557de57	2026-04-25 10:25:09	2026-04-25 10:25:09
209	3751	44	2	2025-07-17 15:06:31	a7bf135a0a5bac50849ec18eb91b76607557de57	2026-04-25 10:25:09	2026-04-25 10:25:09
210	1397	43	7	2026-03-30 13:52:13	fc22953e223a888635af128c5f0e961df2480b92	2026-04-25 10:25:09	2026-04-25 10:25:09
211	3036	43	7	2026-03-30 13:52:13	fc22953e223a888635af128c5f0e961df2480b92	2026-04-25 10:25:09	2026-04-25 10:25:09
212	422	43	7	2026-03-30 13:52:13	fc22953e223a888635af128c5f0e961df2480b92	2026-04-25 10:25:09	2026-04-25 10:25:09
213	4893	43	7	2026-03-30 13:52:13	fc22953e223a888635af128c5f0e961df2480b92	2026-04-25 10:25:09	2026-04-25 10:25:09
214	709	43	7	2026-03-30 13:52:13	fc22953e223a888635af128c5f0e961df2480b92	2026-04-25 10:25:09	2026-04-25 10:25:09
215	3929	43	7	2026-03-30 13:52:13	fc22953e223a888635af128c5f0e961df2480b92	2026-04-25 10:25:09	2026-04-25 10:25:09
216	3556	43	7	2026-03-30 13:52:13	fc22953e223a888635af128c5f0e961df2480b92	2026-04-25 10:25:09	2026-04-25 10:25:09
217	702	43	7	2026-03-30 13:52:13	fc22953e223a888635af128c5f0e961df2480b92	2026-04-25 10:25:09	2026-04-25 10:25:09
218	2832	43	7	2026-03-30 13:52:13	fc22953e223a888635af128c5f0e961df2480b92	2026-04-25 10:25:09	2026-04-25 10:25:09
219	1848	43	7	2026-03-30 13:52:13	fc22953e223a888635af128c5f0e961df2480b92	2026-04-25 10:25:09	2026-04-25 10:25:09
220	1221	57	9	2025-05-31 16:52:52	aa9387695a96ff5da9a3080f7768bc0c5b3a09aa	2026-04-25 10:25:09	2026-04-25 10:25:09
221	3901	57	9	2025-05-31 16:52:52	aa9387695a96ff5da9a3080f7768bc0c5b3a09aa	2026-04-25 10:25:09	2026-04-25 10:25:09
222	2796	54	5	2025-11-15 15:42:42	c4caec951290756b23cac5b86a63a8162f8091e0	2026-04-25 10:25:09	2026-04-25 10:25:09
223	3631	54	5	2025-11-15 15:42:42	c4caec951290756b23cac5b86a63a8162f8091e0	2026-04-25 10:25:09	2026-04-25 10:25:09
224	4035	54	5	2025-11-15 15:42:42	c4caec951290756b23cac5b86a63a8162f8091e0	2026-04-25 10:25:09	2026-04-25 10:25:09
225	460	6	3	2026-04-21 09:09:38	a614aa20dc4159369e069b57fe23b60e81f909db	2026-04-25 10:25:09	2026-04-25 10:25:09
226	3449	6	3	2026-04-21 09:09:38	a614aa20dc4159369e069b57fe23b60e81f909db	2026-04-25 10:25:09	2026-04-25 10:25:09
227	2079	6	3	2026-04-21 09:09:38	a614aa20dc4159369e069b57fe23b60e81f909db	2026-04-25 10:25:09	2026-04-25 10:25:09
228	2980	6	3	2026-04-21 09:09:38	a614aa20dc4159369e069b57fe23b60e81f909db	2026-04-25 10:25:09	2026-04-25 10:25:09
229	4758	6	3	2026-04-21 09:09:38	a614aa20dc4159369e069b57fe23b60e81f909db	2026-04-25 10:25:09	2026-04-25 10:25:09
230	4575	6	3	2026-04-21 09:09:38	a614aa20dc4159369e069b57fe23b60e81f909db	2026-04-25 10:25:09	2026-04-25 10:25:09
231	4918	6	3	2026-04-21 09:09:38	a614aa20dc4159369e069b57fe23b60e81f909db	2026-04-25 10:25:09	2026-04-25 10:25:09
232	1179	6	3	2026-04-21 09:09:38	a614aa20dc4159369e069b57fe23b60e81f909db	2026-04-25 10:25:09	2026-04-25 10:25:09
233	2146	6	3	2026-04-21 09:09:38	a614aa20dc4159369e069b57fe23b60e81f909db	2026-04-25 10:25:09	2026-04-25 10:25:09
234	277	6	3	2026-04-21 09:09:38	a614aa20dc4159369e069b57fe23b60e81f909db	2026-04-25 10:25:09	2026-04-25 10:25:09
235	3487	53	3	2026-03-30 16:35:18	2f237dce1755218e0d3947dc7d06e927f2fd306f	2026-04-25 10:25:09	2026-04-25 10:25:09
236	208	53	3	2026-03-30 16:35:18	2f237dce1755218e0d3947dc7d06e927f2fd306f	2026-04-25 10:25:09	2026-04-25 10:25:09
237	1776	53	3	2026-03-30 16:35:18	2f237dce1755218e0d3947dc7d06e927f2fd306f	2026-04-25 10:25:09	2026-04-25 10:25:09
238	4372	53	3	2026-03-30 16:35:18	2f237dce1755218e0d3947dc7d06e927f2fd306f	2026-04-25 10:25:09	2026-04-25 10:25:09
239	2553	53	3	2026-03-30 16:35:18	2f237dce1755218e0d3947dc7d06e927f2fd306f	2026-04-25 10:25:09	2026-04-25 10:25:09
240	4810	53	3	2026-03-30 16:35:18	2f237dce1755218e0d3947dc7d06e927f2fd306f	2026-04-25 10:25:09	2026-04-25 10:25:09
241	500	2	1	2026-03-15 13:03:47	cdcd574fd0f00b98ac861186c23e9d23f635c17b	2026-04-25 10:25:09	2026-04-25 10:25:09
242	1497	2	1	2026-03-15 13:03:47	cdcd574fd0f00b98ac861186c23e9d23f635c17b	2026-04-25 10:25:09	2026-04-25 10:25:09
243	4503	2	1	2026-03-15 13:03:47	cdcd574fd0f00b98ac861186c23e9d23f635c17b	2026-04-25 10:25:09	2026-04-25 10:25:09
244	1397	2	1	2026-03-15 13:03:47	cdcd574fd0f00b98ac861186c23e9d23f635c17b	2026-04-25 10:25:09	2026-04-25 10:25:09
245	4622	2	1	2026-03-15 13:03:47	cdcd574fd0f00b98ac861186c23e9d23f635c17b	2026-04-25 10:25:09	2026-04-25 10:25:09
246	638	2	1	2026-03-15 13:03:47	cdcd574fd0f00b98ac861186c23e9d23f635c17b	2026-04-25 10:25:09	2026-04-25 10:25:09
247	755	2	1	2026-03-15 13:03:47	cdcd574fd0f00b98ac861186c23e9d23f635c17b	2026-04-25 10:25:09	2026-04-25 10:25:09
248	1608	2	1	2026-03-15 13:03:47	cdcd574fd0f00b98ac861186c23e9d23f635c17b	2026-04-25 10:25:09	2026-04-25 10:25:09
249	2036	2	1	2026-03-15 13:03:47	cdcd574fd0f00b98ac861186c23e9d23f635c17b	2026-04-25 10:25:09	2026-04-25 10:25:09
250	1943	7	3	2025-06-23 16:37:11	71ba0a4ffc822f9e67e4267ed75d5271659cb288	2026-04-25 10:25:09	2026-04-25 10:25:09
251	4238	7	3	2025-06-23 16:37:11	71ba0a4ffc822f9e67e4267ed75d5271659cb288	2026-04-25 10:25:09	2026-04-25 10:25:09
252	3646	7	3	2025-06-23 16:37:11	71ba0a4ffc822f9e67e4267ed75d5271659cb288	2026-04-25 10:25:09	2026-04-25 10:25:09
253	1665	7	3	2025-06-23 16:37:11	71ba0a4ffc822f9e67e4267ed75d5271659cb288	2026-04-25 10:25:09	2026-04-25 10:25:09
254	3850	7	3	2025-06-23 16:37:11	71ba0a4ffc822f9e67e4267ed75d5271659cb288	2026-04-25 10:25:09	2026-04-25 10:25:09
255	3262	7	3	2025-06-23 16:37:11	71ba0a4ffc822f9e67e4267ed75d5271659cb288	2026-04-25 10:25:09	2026-04-25 10:25:09
256	2730	7	3	2025-06-23 16:37:11	71ba0a4ffc822f9e67e4267ed75d5271659cb288	2026-04-25 10:25:09	2026-04-25 10:25:09
257	3432	83	7	2025-11-16 12:19:51	5a7bb521506b5d7af9d655373dc7d6ec280bcbf9	2026-04-25 10:25:09	2026-04-25 10:25:09
258	3880	83	7	2025-11-16 12:19:51	5a7bb521506b5d7af9d655373dc7d6ec280bcbf9	2026-04-25 10:25:09	2026-04-25 10:25:09
259	2432	83	7	2025-11-16 12:19:51	5a7bb521506b5d7af9d655373dc7d6ec280bcbf9	2026-04-25 10:25:09	2026-04-25 10:25:09
260	1718	83	7	2025-11-16 12:19:51	5a7bb521506b5d7af9d655373dc7d6ec280bcbf9	2026-04-25 10:25:09	2026-04-25 10:25:09
261	2148	83	7	2025-11-16 12:19:51	5a7bb521506b5d7af9d655373dc7d6ec280bcbf9	2026-04-25 10:25:09	2026-04-25 10:25:09
262	4708	83	7	2025-11-16 12:19:51	5a7bb521506b5d7af9d655373dc7d6ec280bcbf9	2026-04-25 10:25:09	2026-04-25 10:25:09
263	72	83	7	2025-11-16 12:19:51	5a7bb521506b5d7af9d655373dc7d6ec280bcbf9	2026-04-25 10:25:09	2026-04-25 10:25:09
264	1882	2	7	2025-09-24 11:30:17	0203608add30ff5445e6c534486ffa3668beb52c	2026-04-25 10:25:09	2026-04-25 10:25:09
265	3187	2	7	2025-09-24 11:30:17	0203608add30ff5445e6c534486ffa3668beb52c	2026-04-25 10:25:09	2026-04-25 10:25:09
266	2031	2	7	2025-09-24 11:30:17	0203608add30ff5445e6c534486ffa3668beb52c	2026-04-25 10:25:09	2026-04-25 10:25:09
267	2004	2	7	2025-09-24 11:30:17	0203608add30ff5445e6c534486ffa3668beb52c	2026-04-25 10:25:09	2026-04-25 10:25:09
268	3201	2	7	2025-09-24 11:30:17	0203608add30ff5445e6c534486ffa3668beb52c	2026-04-25 10:25:09	2026-04-25 10:25:09
269	4777	2	7	2025-09-24 11:30:17	0203608add30ff5445e6c534486ffa3668beb52c	2026-04-25 10:25:09	2026-04-25 10:25:09
270	3047	2	7	2025-09-24 11:30:17	0203608add30ff5445e6c534486ffa3668beb52c	2026-04-25 10:25:09	2026-04-25 10:25:09
271	2541	2	7	2025-09-24 11:30:17	0203608add30ff5445e6c534486ffa3668beb52c	2026-04-25 10:25:09	2026-04-25 10:25:09
272	1291	2	7	2025-09-24 11:30:17	0203608add30ff5445e6c534486ffa3668beb52c	2026-04-25 10:25:09	2026-04-25 10:25:09
273	4175	2	7	2025-09-24 11:30:17	0203608add30ff5445e6c534486ffa3668beb52c	2026-04-25 10:25:09	2026-04-25 10:25:09
274	2399	38	6	2026-04-23 13:27:02	358f1ce1ab16634c1d8aa7f2f66fa464a028cfa3	2026-04-25 10:25:09	2026-04-25 10:25:09
275	3572	38	6	2026-04-23 13:27:02	358f1ce1ab16634c1d8aa7f2f66fa464a028cfa3	2026-04-25 10:25:09	2026-04-25 10:25:09
276	3960	38	6	2026-04-23 13:27:02	358f1ce1ab16634c1d8aa7f2f66fa464a028cfa3	2026-04-25 10:25:09	2026-04-25 10:25:09
277	4466	38	6	2026-04-23 13:27:02	358f1ce1ab16634c1d8aa7f2f66fa464a028cfa3	2026-04-25 10:25:09	2026-04-25 10:25:09
278	4900	38	6	2026-04-23 13:27:02	358f1ce1ab16634c1d8aa7f2f66fa464a028cfa3	2026-04-25 10:25:09	2026-04-25 10:25:09
279	4072	38	6	2026-04-23 13:27:02	358f1ce1ab16634c1d8aa7f2f66fa464a028cfa3	2026-04-25 10:25:09	2026-04-25 10:25:09
280	4328	38	6	2026-04-23 13:27:02	358f1ce1ab16634c1d8aa7f2f66fa464a028cfa3	2026-04-25 10:25:09	2026-04-25 10:25:09
281	27	38	6	2026-04-23 13:27:02	358f1ce1ab16634c1d8aa7f2f66fa464a028cfa3	2026-04-25 10:25:09	2026-04-25 10:25:09
282	4664	38	6	2026-04-23 13:27:02	358f1ce1ab16634c1d8aa7f2f66fa464a028cfa3	2026-04-25 10:25:09	2026-04-25 10:25:09
283	1519	2	5	2025-06-29 16:10:39	ac1abbed2a318804f7ebddb9eeabb08882f77c7c	2026-04-25 10:25:09	2026-04-25 10:25:09
284	1116	2	5	2025-06-29 16:10:39	ac1abbed2a318804f7ebddb9eeabb08882f77c7c	2026-04-25 10:25:09	2026-04-25 10:25:09
285	1611	2	5	2025-06-29 16:10:39	ac1abbed2a318804f7ebddb9eeabb08882f77c7c	2026-04-25 10:25:09	2026-04-25 10:25:09
286	1484	2	5	2025-06-29 16:10:39	ac1abbed2a318804f7ebddb9eeabb08882f77c7c	2026-04-25 10:25:09	2026-04-25 10:25:09
287	4794	2	5	2025-06-29 16:10:39	ac1abbed2a318804f7ebddb9eeabb08882f77c7c	2026-04-25 10:25:09	2026-04-25 10:25:09
288	2218	2	5	2025-06-29 16:10:39	ac1abbed2a318804f7ebddb9eeabb08882f77c7c	2026-04-25 10:25:09	2026-04-25 10:25:09
289	3203	2	5	2025-06-29 16:10:39	ac1abbed2a318804f7ebddb9eeabb08882f77c7c	2026-04-25 10:25:09	2026-04-25 10:25:09
290	1776	2	5	2025-06-29 16:10:39	ac1abbed2a318804f7ebddb9eeabb08882f77c7c	2026-04-25 10:25:09	2026-04-25 10:25:09
291	1770	2	5	2025-06-29 16:10:39	ac1abbed2a318804f7ebddb9eeabb08882f77c7c	2026-04-25 10:25:09	2026-04-25 10:25:09
292	1139	2	5	2025-06-29 16:10:39	ac1abbed2a318804f7ebddb9eeabb08882f77c7c	2026-04-25 10:25:09	2026-04-25 10:25:09
293	381	87	5	2026-04-19 15:02:16	43aced94677bba1c182de5244e13d06a517342cf	2026-04-25 10:25:09	2026-04-25 10:25:09
294	350	87	5	2026-04-19 15:02:16	43aced94677bba1c182de5244e13d06a517342cf	2026-04-25 10:25:09	2026-04-25 10:25:09
295	1497	87	5	2026-04-19 15:02:16	43aced94677bba1c182de5244e13d06a517342cf	2026-04-25 10:25:09	2026-04-25 10:25:09
296	3029	87	5	2026-04-19 15:02:16	43aced94677bba1c182de5244e13d06a517342cf	2026-04-25 10:25:09	2026-04-25 10:25:09
297	1785	87	5	2026-04-19 15:02:16	43aced94677bba1c182de5244e13d06a517342cf	2026-04-25 10:25:09	2026-04-25 10:25:09
298	1594	38	10	2025-06-14 15:59:02	7f2fb2b6030edc56711985e2c0ece0afb17edd7d	2026-04-25 10:25:09	2026-04-25 10:25:09
299	4063	69	2	2025-10-16 09:29:23	74a2951f7778e9c0b4f602ef7fcea43e0e89168f	2026-04-25 10:25:09	2026-04-25 10:25:09
300	2033	69	2	2025-10-16 09:29:23	74a2951f7778e9c0b4f602ef7fcea43e0e89168f	2026-04-25 10:25:09	2026-04-25 10:25:09
301	1071	69	2	2025-10-16 09:29:23	74a2951f7778e9c0b4f602ef7fcea43e0e89168f	2026-04-25 10:25:09	2026-04-25 10:25:09
302	1459	69	2	2025-10-16 09:29:23	74a2951f7778e9c0b4f602ef7fcea43e0e89168f	2026-04-25 10:25:09	2026-04-25 10:25:09
303	282	69	2	2025-10-16 09:29:23	74a2951f7778e9c0b4f602ef7fcea43e0e89168f	2026-04-25 10:25:09	2026-04-25 10:25:09
304	3831	69	2	2025-10-16 09:29:23	74a2951f7778e9c0b4f602ef7fcea43e0e89168f	2026-04-25 10:25:09	2026-04-25 10:25:09
305	2596	54	5	2025-05-29 11:21:40	96b9f144bb7603642ece56c114619a22667ca630	2026-04-25 10:25:09	2026-04-25 10:25:09
306	4422	38	7	2025-10-08 11:46:28	0c6a663ca2ced073a8257860556c3d3a6348a5fe	2026-04-25 10:25:09	2026-04-25 10:25:09
307	607	38	7	2025-10-08 11:46:28	0c6a663ca2ced073a8257860556c3d3a6348a5fe	2026-04-25 10:25:09	2026-04-25 10:25:09
308	1179	38	7	2025-10-08 11:46:28	0c6a663ca2ced073a8257860556c3d3a6348a5fe	2026-04-25 10:25:09	2026-04-25 10:25:09
309	2256	38	7	2025-10-08 11:46:28	0c6a663ca2ced073a8257860556c3d3a6348a5fe	2026-04-25 10:25:09	2026-04-25 10:25:09
310	1547	38	7	2025-10-08 11:46:28	0c6a663ca2ced073a8257860556c3d3a6348a5fe	2026-04-25 10:25:09	2026-04-25 10:25:09
311	1132	38	7	2025-10-08 11:46:28	0c6a663ca2ced073a8257860556c3d3a6348a5fe	2026-04-25 10:25:09	2026-04-25 10:25:09
312	3236	38	7	2025-10-08 11:46:28	0c6a663ca2ced073a8257860556c3d3a6348a5fe	2026-04-25 10:25:09	2026-04-25 10:25:09
313	3752	38	7	2025-10-08 11:46:28	0c6a663ca2ced073a8257860556c3d3a6348a5fe	2026-04-25 10:25:09	2026-04-25 10:25:09
314	3217	14	5	2025-08-07 14:40:14	973fc49f6885a853aaa09791dd1b9b29527271a9	2026-04-25 10:25:09	2026-04-25 10:25:09
315	3175	14	5	2025-08-07 14:40:14	973fc49f6885a853aaa09791dd1b9b29527271a9	2026-04-25 10:25:09	2026-04-25 10:25:09
316	2519	14	5	2025-08-07 14:40:14	973fc49f6885a853aaa09791dd1b9b29527271a9	2026-04-25 10:25:09	2026-04-25 10:25:09
317	3354	14	5	2025-08-07 14:40:14	973fc49f6885a853aaa09791dd1b9b29527271a9	2026-04-25 10:25:09	2026-04-25 10:25:09
318	4609	14	5	2025-08-07 14:40:14	973fc49f6885a853aaa09791dd1b9b29527271a9	2026-04-25 10:25:09	2026-04-25 10:25:09
319	534	14	5	2025-08-07 14:40:14	973fc49f6885a853aaa09791dd1b9b29527271a9	2026-04-25 10:25:09	2026-04-25 10:25:09
320	3978	14	5	2025-08-07 14:40:14	973fc49f6885a853aaa09791dd1b9b29527271a9	2026-04-25 10:25:09	2026-04-25 10:25:09
321	1621	50	1	2025-05-01 13:42:42	655a2f52f911877f6cd50da7cc898d4455495408	2026-04-25 10:25:09	2026-04-25 10:25:09
322	2018	50	1	2025-05-01 13:42:42	655a2f52f911877f6cd50da7cc898d4455495408	2026-04-25 10:25:09	2026-04-25 10:25:09
323	3115	50	1	2025-05-01 13:42:42	655a2f52f911877f6cd50da7cc898d4455495408	2026-04-25 10:25:09	2026-04-25 10:25:09
324	2487	50	1	2025-05-01 13:42:42	655a2f52f911877f6cd50da7cc898d4455495408	2026-04-25 10:25:09	2026-04-25 10:25:09
325	896	50	1	2025-05-01 13:42:42	655a2f52f911877f6cd50da7cc898d4455495408	2026-04-25 10:25:09	2026-04-25 10:25:09
326	4886	35	5	2025-10-08 09:04:44	59b5bf671c9960c43a4a1310d769e6e0be38e459	2026-04-25 10:25:09	2026-04-25 10:25:09
327	4853	35	5	2025-10-08 09:04:44	59b5bf671c9960c43a4a1310d769e6e0be38e459	2026-04-25 10:25:09	2026-04-25 10:25:09
328	4740	40	3	2025-06-09 11:28:01	bf6e27e98959be78e22fc3cbb6fa0589b48249a2	2026-04-25 10:25:09	2026-04-25 10:25:09
329	2306	40	3	2025-06-09 11:28:01	bf6e27e98959be78e22fc3cbb6fa0589b48249a2	2026-04-25 10:25:09	2026-04-25 10:25:09
330	3409	40	3	2025-06-09 11:28:01	bf6e27e98959be78e22fc3cbb6fa0589b48249a2	2026-04-25 10:25:09	2026-04-25 10:25:09
331	529	40	3	2025-06-09 11:28:01	bf6e27e98959be78e22fc3cbb6fa0589b48249a2	2026-04-25 10:25:09	2026-04-25 10:25:09
332	1198	40	3	2025-06-09 11:28:01	bf6e27e98959be78e22fc3cbb6fa0589b48249a2	2026-04-25 10:25:09	2026-04-25 10:25:09
333	2374	40	3	2025-06-09 11:28:01	bf6e27e98959be78e22fc3cbb6fa0589b48249a2	2026-04-25 10:25:09	2026-04-25 10:25:09
334	3052	42	10	2025-09-10 10:49:54	f2f48dd109821af073a371b688b3431809318b7f	2026-04-25 10:25:09	2026-04-25 10:25:09
335	2799	42	10	2025-09-10 10:49:54	f2f48dd109821af073a371b688b3431809318b7f	2026-04-25 10:25:09	2026-04-25 10:25:09
336	4173	42	10	2025-09-10 10:49:54	f2f48dd109821af073a371b688b3431809318b7f	2026-04-25 10:25:09	2026-04-25 10:25:09
337	4461	42	10	2025-09-10 10:49:54	f2f48dd109821af073a371b688b3431809318b7f	2026-04-25 10:25:09	2026-04-25 10:25:09
338	899	75	2	2025-05-23 12:56:11	a1bf465bd2fe4ebf477de1ef3051e9b6db6b84d5	2026-04-25 10:25:09	2026-04-25 10:25:09
339	3048	75	2	2025-05-23 12:56:11	a1bf465bd2fe4ebf477de1ef3051e9b6db6b84d5	2026-04-25 10:25:09	2026-04-25 10:25:09
340	4719	75	2	2025-05-23 12:56:11	a1bf465bd2fe4ebf477de1ef3051e9b6db6b84d5	2026-04-25 10:25:09	2026-04-25 10:25:09
341	3279	56	4	2025-12-02 17:23:34	aca98252f3c2304ff08ceac555ad9b81a77ac938	2026-04-25 10:25:09	2026-04-25 10:25:09
342	2434	56	4	2025-12-02 17:23:34	aca98252f3c2304ff08ceac555ad9b81a77ac938	2026-04-25 10:25:09	2026-04-25 10:25:09
343	2589	56	4	2025-12-02 17:23:34	aca98252f3c2304ff08ceac555ad9b81a77ac938	2026-04-25 10:25:09	2026-04-25 10:25:09
344	2050	56	4	2025-12-02 17:23:34	aca98252f3c2304ff08ceac555ad9b81a77ac938	2026-04-25 10:25:09	2026-04-25 10:25:09
345	3019	56	4	2025-12-02 17:23:34	aca98252f3c2304ff08ceac555ad9b81a77ac938	2026-04-25 10:25:09	2026-04-25 10:25:09
346	3434	56	4	2025-12-02 17:23:34	aca98252f3c2304ff08ceac555ad9b81a77ac938	2026-04-25 10:25:09	2026-04-25 10:25:09
347	889	79	10	2025-05-06 12:13:39	f57486b7b47212b4dcf8498e03b9afb1311ea2e2	2026-04-25 10:25:09	2026-04-25 10:25:09
348	3686	79	10	2025-05-06 12:13:39	f57486b7b47212b4dcf8498e03b9afb1311ea2e2	2026-04-25 10:25:09	2026-04-25 10:25:09
349	2775	79	10	2025-05-06 12:13:39	f57486b7b47212b4dcf8498e03b9afb1311ea2e2	2026-04-25 10:25:09	2026-04-25 10:25:09
350	4231	79	10	2025-05-06 12:13:39	f57486b7b47212b4dcf8498e03b9afb1311ea2e2	2026-04-25 10:25:09	2026-04-25 10:25:09
351	2176	79	10	2025-05-06 12:13:39	f57486b7b47212b4dcf8498e03b9afb1311ea2e2	2026-04-25 10:25:09	2026-04-25 10:25:09
352	4623	79	10	2025-05-06 12:13:39	f57486b7b47212b4dcf8498e03b9afb1311ea2e2	2026-04-25 10:25:09	2026-04-25 10:25:09
353	3883	79	10	2025-05-06 12:13:39	f57486b7b47212b4dcf8498e03b9afb1311ea2e2	2026-04-25 10:25:09	2026-04-25 10:25:09
354	3234	79	10	2025-05-06 12:13:39	f57486b7b47212b4dcf8498e03b9afb1311ea2e2	2026-04-25 10:25:09	2026-04-25 10:25:09
355	905	18	8	2025-05-30 12:05:33	c3da5aad8293a31b9e1d8d07fccd5a8624181a70	2026-04-25 10:25:09	2026-04-25 10:25:09
356	4091	18	8	2025-05-30 12:05:33	c3da5aad8293a31b9e1d8d07fccd5a8624181a70	2026-04-25 10:25:09	2026-04-25 10:25:09
357	1510	18	8	2025-05-30 12:05:33	c3da5aad8293a31b9e1d8d07fccd5a8624181a70	2026-04-25 10:25:09	2026-04-25 10:25:09
358	1945	18	8	2025-05-30 12:05:33	c3da5aad8293a31b9e1d8d07fccd5a8624181a70	2026-04-25 10:25:09	2026-04-25 10:25:09
359	4479	18	8	2025-05-30 12:05:33	c3da5aad8293a31b9e1d8d07fccd5a8624181a70	2026-04-25 10:25:09	2026-04-25 10:25:09
360	4976	18	8	2025-05-30 12:05:33	c3da5aad8293a31b9e1d8d07fccd5a8624181a70	2026-04-25 10:25:09	2026-04-25 10:25:09
361	4380	18	8	2025-05-30 12:05:33	c3da5aad8293a31b9e1d8d07fccd5a8624181a70	2026-04-25 10:25:09	2026-04-25 10:25:09
362	1535	20	1	2025-12-28 12:26:58	355142f101a46f4702f647b8da3264c1af123391	2026-04-25 10:25:09	2026-04-25 10:25:09
363	1527	20	1	2025-12-28 12:26:58	355142f101a46f4702f647b8da3264c1af123391	2026-04-25 10:25:09	2026-04-25 10:25:09
364	902	20	1	2025-12-28 12:26:58	355142f101a46f4702f647b8da3264c1af123391	2026-04-25 10:25:09	2026-04-25 10:25:09
365	4416	20	1	2025-12-28 12:26:58	355142f101a46f4702f647b8da3264c1af123391	2026-04-25 10:25:09	2026-04-25 10:25:09
366	3404	20	1	2025-12-28 12:26:58	355142f101a46f4702f647b8da3264c1af123391	2026-04-25 10:25:09	2026-04-25 10:25:09
367	1744	20	1	2025-12-28 12:26:58	355142f101a46f4702f647b8da3264c1af123391	2026-04-25 10:25:09	2026-04-25 10:25:09
368	1945	20	1	2025-12-28 12:26:58	355142f101a46f4702f647b8da3264c1af123391	2026-04-25 10:25:09	2026-04-25 10:25:09
369	2838	20	1	2025-12-28 12:26:58	355142f101a46f4702f647b8da3264c1af123391	2026-04-25 10:25:09	2026-04-25 10:25:09
370	4417	20	1	2025-12-28 12:26:58	355142f101a46f4702f647b8da3264c1af123391	2026-04-25 10:25:09	2026-04-25 10:25:09
371	1862	71	4	2026-03-29 16:19:43	c80c07e97d6cdbe5388900dd1c6ea47b63c12cea	2026-04-25 10:25:09	2026-04-25 10:25:09
372	1850	71	4	2026-03-29 16:19:43	c80c07e97d6cdbe5388900dd1c6ea47b63c12cea	2026-04-25 10:25:09	2026-04-25 10:25:09
373	4598	71	4	2026-03-29 16:19:43	c80c07e97d6cdbe5388900dd1c6ea47b63c12cea	2026-04-25 10:25:09	2026-04-25 10:25:09
374	2954	71	4	2026-03-29 16:19:43	c80c07e97d6cdbe5388900dd1c6ea47b63c12cea	2026-04-25 10:25:09	2026-04-25 10:25:09
375	1799	71	4	2026-03-29 16:19:43	c80c07e97d6cdbe5388900dd1c6ea47b63c12cea	2026-04-25 10:25:09	2026-04-25 10:25:09
376	3122	71	4	2026-03-29 16:19:43	c80c07e97d6cdbe5388900dd1c6ea47b63c12cea	2026-04-25 10:25:09	2026-04-25 10:25:09
377	4948	71	4	2026-03-29 16:19:43	c80c07e97d6cdbe5388900dd1c6ea47b63c12cea	2026-04-25 10:25:09	2026-04-25 10:25:09
378	278	71	4	2026-03-29 16:19:43	c80c07e97d6cdbe5388900dd1c6ea47b63c12cea	2026-04-25 10:25:09	2026-04-25 10:25:09
379	4378	71	4	2026-03-29 16:19:43	c80c07e97d6cdbe5388900dd1c6ea47b63c12cea	2026-04-25 10:25:09	2026-04-25 10:25:09
380	2316	71	4	2026-03-29 16:19:43	c80c07e97d6cdbe5388900dd1c6ea47b63c12cea	2026-04-25 10:25:09	2026-04-25 10:25:09
381	3981	51	10	2025-11-05 12:50:28	7b5762d22991acfd4d64d81a35fae1ec44831371	2026-04-25 10:25:09	2026-04-25 10:25:09
382	3804	51	10	2025-11-05 12:50:28	7b5762d22991acfd4d64d81a35fae1ec44831371	2026-04-25 10:25:09	2026-04-25 10:25:09
383	4174	51	10	2025-11-05 12:50:28	7b5762d22991acfd4d64d81a35fae1ec44831371	2026-04-25 10:25:09	2026-04-25 10:25:09
384	3575	51	10	2025-11-05 12:50:28	7b5762d22991acfd4d64d81a35fae1ec44831371	2026-04-25 10:25:09	2026-04-25 10:25:09
385	3769	51	10	2025-11-05 12:50:28	7b5762d22991acfd4d64d81a35fae1ec44831371	2026-04-25 10:25:09	2026-04-25 10:25:09
386	1401	33	2	2025-05-21 15:54:07	812c32fed7fbdd0c0361e4e67323093401778aa4	2026-04-25 10:25:09	2026-04-25 10:25:09
387	1268	33	2	2025-05-21 15:54:07	812c32fed7fbdd0c0361e4e67323093401778aa4	2026-04-25 10:25:09	2026-04-25 10:25:09
388	917	33	2	2025-05-21 15:54:07	812c32fed7fbdd0c0361e4e67323093401778aa4	2026-04-25 10:25:09	2026-04-25 10:25:09
389	4082	33	2	2025-05-21 15:54:07	812c32fed7fbdd0c0361e4e67323093401778aa4	2026-04-25 10:25:09	2026-04-25 10:25:09
390	1893	33	2	2025-05-21 15:54:07	812c32fed7fbdd0c0361e4e67323093401778aa4	2026-04-25 10:25:09	2026-04-25 10:25:09
391	3900	33	2	2025-05-21 15:54:07	812c32fed7fbdd0c0361e4e67323093401778aa4	2026-04-25 10:25:09	2026-04-25 10:25:09
392	1164	33	2	2025-05-21 15:54:07	812c32fed7fbdd0c0361e4e67323093401778aa4	2026-04-25 10:25:09	2026-04-25 10:25:09
393	917	33	2	2025-05-21 15:54:07	812c32fed7fbdd0c0361e4e67323093401778aa4	2026-04-25 10:25:09	2026-04-25 10:25:09
394	1867	33	2	2025-05-21 15:54:07	812c32fed7fbdd0c0361e4e67323093401778aa4	2026-04-25 10:25:09	2026-04-25 10:25:09
395	2830	23	6	2025-09-20 10:51:33	476e694bf1d43f6cc77e207bfb0b9727055e64c7	2026-04-25 10:25:09	2026-04-25 10:25:09
396	904	18	4	2025-08-30 09:44:07	fcb75216820d0ec274498bdf9558bcc9922660e5	2026-04-25 10:25:09	2026-04-25 10:25:09
397	3039	18	4	2025-08-30 09:44:07	fcb75216820d0ec274498bdf9558bcc9922660e5	2026-04-25 10:25:09	2026-04-25 10:25:09
398	382	18	4	2025-08-30 09:44:07	fcb75216820d0ec274498bdf9558bcc9922660e5	2026-04-25 10:25:09	2026-04-25 10:25:09
399	532	18	4	2025-08-30 09:44:07	fcb75216820d0ec274498bdf9558bcc9922660e5	2026-04-25 10:25:09	2026-04-25 10:25:09
400	24	18	4	2025-08-30 09:44:07	fcb75216820d0ec274498bdf9558bcc9922660e5	2026-04-25 10:25:09	2026-04-25 10:25:09
401	615	47	7	2025-10-03 10:57:35	72868b244fa9a129a1fd48bbe6f2b4c549e82fee	2026-04-25 10:25:09	2026-04-25 10:25:09
402	3292	47	7	2025-10-03 10:57:35	72868b244fa9a129a1fd48bbe6f2b4c549e82fee	2026-04-25 10:25:09	2026-04-25 10:25:09
403	3060	47	7	2025-10-03 10:57:35	72868b244fa9a129a1fd48bbe6f2b4c549e82fee	2026-04-25 10:25:09	2026-04-25 10:25:09
404	4450	47	7	2025-10-03 10:57:35	72868b244fa9a129a1fd48bbe6f2b4c549e82fee	2026-04-25 10:25:09	2026-04-25 10:25:09
405	2387	47	7	2025-10-03 10:57:35	72868b244fa9a129a1fd48bbe6f2b4c549e82fee	2026-04-25 10:25:09	2026-04-25 10:25:09
406	3559	47	7	2025-10-03 10:57:35	72868b244fa9a129a1fd48bbe6f2b4c549e82fee	2026-04-25 10:25:09	2026-04-25 10:25:09
407	3098	26	7	2025-11-09 09:02:29	335ef5a9bf2eb2a5362400ead1c676bb9f3f119a	2026-04-25 10:25:09	2026-04-25 10:25:09
408	2362	26	7	2025-11-09 09:02:29	335ef5a9bf2eb2a5362400ead1c676bb9f3f119a	2026-04-25 10:25:09	2026-04-25 10:25:09
409	1235	26	7	2025-11-09 09:02:29	335ef5a9bf2eb2a5362400ead1c676bb9f3f119a	2026-04-25 10:25:09	2026-04-25 10:25:09
410	4030	16	7	2026-04-19 12:07:24	db801830619351fe55aa8bc4194d4bcbaa53ca74	2026-04-25 10:25:09	2026-04-25 10:25:09
411	2972	99	7	2025-11-18 14:30:06	7c83a7cb8bd3b436f5ae86fbab79a3b4a0567efa	2026-04-25 10:25:09	2026-04-25 10:25:09
412	1624	99	7	2025-11-18 14:30:06	7c83a7cb8bd3b436f5ae86fbab79a3b4a0567efa	2026-04-25 10:25:09	2026-04-25 10:25:09
413	3466	99	7	2025-11-18 14:30:06	7c83a7cb8bd3b436f5ae86fbab79a3b4a0567efa	2026-04-25 10:25:09	2026-04-25 10:25:09
414	4043	99	7	2025-11-18 14:30:06	7c83a7cb8bd3b436f5ae86fbab79a3b4a0567efa	2026-04-25 10:25:09	2026-04-25 10:25:09
415	3613	99	7	2025-11-18 14:30:06	7c83a7cb8bd3b436f5ae86fbab79a3b4a0567efa	2026-04-25 10:25:09	2026-04-25 10:25:09
416	4901	38	10	2026-04-17 12:46:16	9a3483de5e7098646960c146cfb46e37d3b8e217	2026-04-25 10:25:09	2026-04-25 10:25:09
417	1343	38	10	2026-04-17 12:46:16	9a3483de5e7098646960c146cfb46e37d3b8e217	2026-04-25 10:25:09	2026-04-25 10:25:09
418	804	38	10	2026-04-17 12:46:16	9a3483de5e7098646960c146cfb46e37d3b8e217	2026-04-25 10:25:09	2026-04-25 10:25:09
419	4519	38	10	2026-04-17 12:46:16	9a3483de5e7098646960c146cfb46e37d3b8e217	2026-04-25 10:25:09	2026-04-25 10:25:09
420	3960	38	10	2026-04-17 12:46:16	9a3483de5e7098646960c146cfb46e37d3b8e217	2026-04-25 10:25:09	2026-04-25 10:25:09
421	1896	38	10	2026-04-17 12:46:16	9a3483de5e7098646960c146cfb46e37d3b8e217	2026-04-25 10:25:09	2026-04-25 10:25:09
422	3966	38	10	2026-04-17 12:46:16	9a3483de5e7098646960c146cfb46e37d3b8e217	2026-04-25 10:25:09	2026-04-25 10:25:09
423	4812	38	10	2026-04-17 12:46:16	9a3483de5e7098646960c146cfb46e37d3b8e217	2026-04-25 10:25:09	2026-04-25 10:25:09
424	4103	74	9	2026-01-09 11:51:55	57d749b1b4b12cfb1aa83cffc3f25a2aeaf47cfc	2026-04-25 10:25:09	2026-04-25 10:25:09
425	3125	74	9	2026-01-09 11:51:55	57d749b1b4b12cfb1aa83cffc3f25a2aeaf47cfc	2026-04-25 10:25:09	2026-04-25 10:25:09
426	4246	74	9	2026-01-09 11:51:55	57d749b1b4b12cfb1aa83cffc3f25a2aeaf47cfc	2026-04-25 10:25:09	2026-04-25 10:25:09
427	4780	74	9	2026-01-09 11:51:55	57d749b1b4b12cfb1aa83cffc3f25a2aeaf47cfc	2026-04-25 10:25:09	2026-04-25 10:25:09
428	3158	74	9	2026-01-09 11:51:55	57d749b1b4b12cfb1aa83cffc3f25a2aeaf47cfc	2026-04-25 10:25:09	2026-04-25 10:25:09
429	2643	74	9	2026-01-09 11:51:55	57d749b1b4b12cfb1aa83cffc3f25a2aeaf47cfc	2026-04-25 10:25:09	2026-04-25 10:25:09
430	4899	74	9	2026-01-09 11:51:55	57d749b1b4b12cfb1aa83cffc3f25a2aeaf47cfc	2026-04-25 10:25:09	2026-04-25 10:25:09
431	4875	74	9	2026-01-09 11:51:55	57d749b1b4b12cfb1aa83cffc3f25a2aeaf47cfc	2026-04-25 10:25:09	2026-04-25 10:25:09
432	2278	74	9	2026-01-09 11:51:55	57d749b1b4b12cfb1aa83cffc3f25a2aeaf47cfc	2026-04-25 10:25:09	2026-04-25 10:25:09
433	1792	74	9	2026-01-09 11:51:55	57d749b1b4b12cfb1aa83cffc3f25a2aeaf47cfc	2026-04-25 10:25:09	2026-04-25 10:25:09
434	3087	98	1	2025-08-17 11:41:50	a807369d71d3d08fe5dd64d8552fe336d34c6bc9	2026-04-25 10:25:09	2026-04-25 10:25:09
435	2662	98	1	2025-08-17 11:41:50	a807369d71d3d08fe5dd64d8552fe336d34c6bc9	2026-04-25 10:25:09	2026-04-25 10:25:09
436	551	98	1	2025-08-17 11:41:50	a807369d71d3d08fe5dd64d8552fe336d34c6bc9	2026-04-25 10:25:09	2026-04-25 10:25:09
437	2461	98	1	2025-08-17 11:41:50	a807369d71d3d08fe5dd64d8552fe336d34c6bc9	2026-04-25 10:25:09	2026-04-25 10:25:09
438	2185	98	1	2025-08-17 11:41:50	a807369d71d3d08fe5dd64d8552fe336d34c6bc9	2026-04-25 10:25:09	2026-04-25 10:25:09
439	1653	98	1	2025-08-17 11:41:50	a807369d71d3d08fe5dd64d8552fe336d34c6bc9	2026-04-25 10:25:09	2026-04-25 10:25:09
440	1382	98	1	2025-08-17 11:41:50	a807369d71d3d08fe5dd64d8552fe336d34c6bc9	2026-04-25 10:25:09	2026-04-25 10:25:09
441	647	91	1	2025-08-01 11:44:14	23fa80d92cb612da12c012a09571666a5ab507fe	2026-04-25 10:25:09	2026-04-25 10:25:09
442	4056	91	1	2025-08-01 11:44:14	23fa80d92cb612da12c012a09571666a5ab507fe	2026-04-25 10:25:09	2026-04-25 10:25:09
443	2880	91	1	2025-08-01 11:44:14	23fa80d92cb612da12c012a09571666a5ab507fe	2026-04-25 10:25:09	2026-04-25 10:25:09
444	2519	91	1	2025-08-01 11:44:14	23fa80d92cb612da12c012a09571666a5ab507fe	2026-04-25 10:25:09	2026-04-25 10:25:09
445	629	91	1	2025-08-01 11:44:14	23fa80d92cb612da12c012a09571666a5ab507fe	2026-04-25 10:25:09	2026-04-25 10:25:09
446	1556	20	8	2025-05-27 11:55:50	df029c90541118573711298fca8c59d114fedb35	2026-04-25 10:25:09	2026-04-25 10:25:09
447	2059	20	8	2025-05-27 11:55:50	df029c90541118573711298fca8c59d114fedb35	2026-04-25 10:25:09	2026-04-25 10:25:09
448	850	20	8	2025-05-27 11:55:50	df029c90541118573711298fca8c59d114fedb35	2026-04-25 10:25:09	2026-04-25 10:25:09
449	962	20	8	2025-05-27 11:55:50	df029c90541118573711298fca8c59d114fedb35	2026-04-25 10:25:09	2026-04-25 10:25:09
450	1357	20	8	2025-05-27 11:55:50	df029c90541118573711298fca8c59d114fedb35	2026-04-25 10:25:09	2026-04-25 10:25:09
451	1120	20	8	2025-05-27 11:55:50	df029c90541118573711298fca8c59d114fedb35	2026-04-25 10:25:09	2026-04-25 10:25:09
452	1440	20	8	2025-05-27 11:55:50	df029c90541118573711298fca8c59d114fedb35	2026-04-25 10:25:09	2026-04-25 10:25:09
453	3895	20	8	2025-05-27 11:55:50	df029c90541118573711298fca8c59d114fedb35	2026-04-25 10:25:09	2026-04-25 10:25:09
454	860	20	8	2025-05-27 11:55:50	df029c90541118573711298fca8c59d114fedb35	2026-04-25 10:25:09	2026-04-25 10:25:09
455	1247	69	10	2025-09-29 15:34:48	6267e2fce0afbb1179b7b89b074b30ca45ad2448	2026-04-25 10:25:09	2026-04-25 10:25:09
456	3738	69	10	2025-09-29 15:34:48	6267e2fce0afbb1179b7b89b074b30ca45ad2448	2026-04-25 10:25:09	2026-04-25 10:25:09
457	2461	69	10	2025-09-29 15:34:48	6267e2fce0afbb1179b7b89b074b30ca45ad2448	2026-04-25 10:25:09	2026-04-25 10:25:09
458	3874	69	10	2025-09-29 15:34:48	6267e2fce0afbb1179b7b89b074b30ca45ad2448	2026-04-25 10:25:09	2026-04-25 10:25:09
459	4364	69	10	2025-09-29 15:34:48	6267e2fce0afbb1179b7b89b074b30ca45ad2448	2026-04-25 10:25:09	2026-04-25 10:25:09
460	4741	69	10	2025-09-29 15:34:48	6267e2fce0afbb1179b7b89b074b30ca45ad2448	2026-04-25 10:25:09	2026-04-25 10:25:09
461	3887	69	10	2025-09-29 15:34:48	6267e2fce0afbb1179b7b89b074b30ca45ad2448	2026-04-25 10:25:09	2026-04-25 10:25:09
462	3533	69	10	2025-09-29 15:34:48	6267e2fce0afbb1179b7b89b074b30ca45ad2448	2026-04-25 10:25:09	2026-04-25 10:25:09
463	4004	69	10	2025-09-29 15:34:48	6267e2fce0afbb1179b7b89b074b30ca45ad2448	2026-04-25 10:25:09	2026-04-25 10:25:09
464	4484	69	10	2025-09-29 15:34:48	6267e2fce0afbb1179b7b89b074b30ca45ad2448	2026-04-25 10:25:09	2026-04-25 10:25:09
465	1891	75	10	2025-11-14 15:30:35	9c4e145e2f1f7cff468f85c8e4db445715b0f67f	2026-04-25 10:25:09	2026-04-25 10:25:09
466	4772	75	10	2025-11-14 15:30:35	9c4e145e2f1f7cff468f85c8e4db445715b0f67f	2026-04-25 10:25:09	2026-04-25 10:25:09
467	4812	75	10	2025-11-14 15:30:35	9c4e145e2f1f7cff468f85c8e4db445715b0f67f	2026-04-25 10:25:09	2026-04-25 10:25:09
468	2779	75	10	2025-11-14 15:30:35	9c4e145e2f1f7cff468f85c8e4db445715b0f67f	2026-04-25 10:25:09	2026-04-25 10:25:09
469	1626	26	5	2025-10-18 17:20:10	de3c3e9acac910505dfc6558fc7ff4e6753932a4	2026-04-25 10:25:09	2026-04-25 10:25:09
470	2609	26	5	2025-10-18 17:20:10	de3c3e9acac910505dfc6558fc7ff4e6753932a4	2026-04-25 10:25:09	2026-04-25 10:25:09
471	4431	26	5	2025-10-18 17:20:10	de3c3e9acac910505dfc6558fc7ff4e6753932a4	2026-04-25 10:25:09	2026-04-25 10:25:09
472	4732	26	5	2025-10-18 17:20:10	de3c3e9acac910505dfc6558fc7ff4e6753932a4	2026-04-25 10:25:09	2026-04-25 10:25:09
473	203	26	5	2025-10-18 17:20:10	de3c3e9acac910505dfc6558fc7ff4e6753932a4	2026-04-25 10:25:09	2026-04-25 10:25:09
474	4776	26	5	2025-10-18 17:20:10	de3c3e9acac910505dfc6558fc7ff4e6753932a4	2026-04-25 10:25:09	2026-04-25 10:25:09
475	373	75	1	2025-11-28 17:32:22	4c1197b9f12c9ad13c9cedb75acfc00329066870	2026-04-25 10:25:09	2026-04-25 10:25:09
476	2662	75	1	2025-11-28 17:32:22	4c1197b9f12c9ad13c9cedb75acfc00329066870	2026-04-25 10:25:09	2026-04-25 10:25:09
477	4656	75	1	2025-11-28 17:32:22	4c1197b9f12c9ad13c9cedb75acfc00329066870	2026-04-25 10:25:09	2026-04-25 10:25:09
478	1262	80	3	2025-09-25 14:29:48	b1cdd0ea9ae1295d6b93cce069a167c8828f863f	2026-04-25 10:25:09	2026-04-25 10:25:09
479	4310	80	3	2025-09-25 14:29:48	b1cdd0ea9ae1295d6b93cce069a167c8828f863f	2026-04-25 10:25:09	2026-04-25 10:25:09
480	1923	80	3	2025-09-25 14:29:48	b1cdd0ea9ae1295d6b93cce069a167c8828f863f	2026-04-25 10:25:09	2026-04-25 10:25:09
481	1373	80	3	2025-09-25 14:29:48	b1cdd0ea9ae1295d6b93cce069a167c8828f863f	2026-04-25 10:25:09	2026-04-25 10:25:09
482	4024	80	3	2025-09-25 14:29:48	b1cdd0ea9ae1295d6b93cce069a167c8828f863f	2026-04-25 10:25:09	2026-04-25 10:25:09
483	1344	80	3	2025-09-25 14:29:48	b1cdd0ea9ae1295d6b93cce069a167c8828f863f	2026-04-25 10:25:09	2026-04-25 10:25:09
484	479	80	3	2025-09-25 14:29:48	b1cdd0ea9ae1295d6b93cce069a167c8828f863f	2026-04-25 10:25:09	2026-04-25 10:25:09
485	3003	80	3	2025-09-25 14:29:48	b1cdd0ea9ae1295d6b93cce069a167c8828f863f	2026-04-25 10:25:09	2026-04-25 10:25:09
486	2729	80	3	2025-09-25 14:29:48	b1cdd0ea9ae1295d6b93cce069a167c8828f863f	2026-04-25 10:25:09	2026-04-25 10:25:09
487	2481	80	3	2025-09-25 14:29:48	b1cdd0ea9ae1295d6b93cce069a167c8828f863f	2026-04-25 10:25:09	2026-04-25 10:25:09
488	483	54	4	2026-04-17 16:31:03	18f62faf5057ab1d9fd69c9779cadde0a0f2c825	2026-04-25 10:25:09	2026-04-25 10:25:09
489	432	54	4	2026-04-17 16:31:03	18f62faf5057ab1d9fd69c9779cadde0a0f2c825	2026-04-25 10:25:09	2026-04-25 10:25:09
490	1100	54	4	2026-04-17 16:31:03	18f62faf5057ab1d9fd69c9779cadde0a0f2c825	2026-04-25 10:25:09	2026-04-25 10:25:09
491	1773	54	4	2026-04-17 16:31:03	18f62faf5057ab1d9fd69c9779cadde0a0f2c825	2026-04-25 10:25:09	2026-04-25 10:25:09
492	3887	54	4	2026-04-17 16:31:03	18f62faf5057ab1d9fd69c9779cadde0a0f2c825	2026-04-25 10:25:09	2026-04-25 10:25:09
493	2686	7	3	2025-11-28 16:48:52	ab73c54da28a6bb20dbd3bc2e74a3f5ebe61bffe	2026-04-25 10:25:09	2026-04-25 10:25:09
494	4632	7	3	2025-11-28 16:48:52	ab73c54da28a6bb20dbd3bc2e74a3f5ebe61bffe	2026-04-25 10:25:09	2026-04-25 10:25:09
495	4457	7	3	2025-11-28 16:48:52	ab73c54da28a6bb20dbd3bc2e74a3f5ebe61bffe	2026-04-25 10:25:09	2026-04-25 10:25:09
496	4498	7	3	2025-11-28 16:48:52	ab73c54da28a6bb20dbd3bc2e74a3f5ebe61bffe	2026-04-25 10:25:09	2026-04-25 10:25:09
497	973	7	3	2025-11-28 16:48:52	ab73c54da28a6bb20dbd3bc2e74a3f5ebe61bffe	2026-04-25 10:25:09	2026-04-25 10:25:09
498	343	7	3	2025-11-28 16:48:52	ab73c54da28a6bb20dbd3bc2e74a3f5ebe61bffe	2026-04-25 10:25:09	2026-04-25 10:25:09
499	1077	99	3	2025-09-28 09:54:47	84caf340043968fa3ce6b1027b8faedf095762aa	2026-04-25 10:25:09	2026-04-25 10:25:09
500	2732	99	3	2025-09-28 09:54:47	84caf340043968fa3ce6b1027b8faedf095762aa	2026-04-25 10:25:09	2026-04-25 10:25:09
501	1191	49	9	2026-03-06 16:31:08	1a3d6b5a5ed18d30e7e16517cb119350fef23c18	2026-04-25 10:25:09	2026-04-25 10:25:09
502	3706	36	9	2025-04-26 16:35:12	c65efdbce0280804fbf30ed45b8101bce09f387a	2026-04-25 10:25:09	2026-04-25 10:25:09
503	1508	36	9	2025-04-26 16:35:12	c65efdbce0280804fbf30ed45b8101bce09f387a	2026-04-25 10:25:09	2026-04-25 10:25:09
504	3923	49	9	2026-03-09 10:59:04	7148f435542fe6e7a8eb9d79b38255aed7000be9	2026-04-25 10:25:09	2026-04-25 10:25:09
505	1344	49	9	2026-03-09 10:59:04	7148f435542fe6e7a8eb9d79b38255aed7000be9	2026-04-25 10:25:09	2026-04-25 10:25:09
506	4993	49	9	2026-03-09 10:59:04	7148f435542fe6e7a8eb9d79b38255aed7000be9	2026-04-25 10:25:09	2026-04-25 10:25:09
507	2959	49	9	2026-03-09 10:59:04	7148f435542fe6e7a8eb9d79b38255aed7000be9	2026-04-25 10:25:09	2026-04-25 10:25:09
508	1952	49	9	2026-03-09 10:59:04	7148f435542fe6e7a8eb9d79b38255aed7000be9	2026-04-25 10:25:09	2026-04-25 10:25:09
509	4386	49	9	2026-03-09 10:59:04	7148f435542fe6e7a8eb9d79b38255aed7000be9	2026-04-25 10:25:09	2026-04-25 10:25:09
510	922	49	9	2026-03-09 10:59:04	7148f435542fe6e7a8eb9d79b38255aed7000be9	2026-04-25 10:25:09	2026-04-25 10:25:09
511	2895	49	9	2026-03-09 10:59:04	7148f435542fe6e7a8eb9d79b38255aed7000be9	2026-04-25 10:25:09	2026-04-25 10:25:09
512	709	74	5	2025-06-18 13:40:11	a6e6a0b8491ec39995763d075b5b1cd7f0dc1b07	2026-04-25 10:25:09	2026-04-25 10:25:09
513	972	74	5	2025-06-18 13:40:11	a6e6a0b8491ec39995763d075b5b1cd7f0dc1b07	2026-04-25 10:25:09	2026-04-25 10:25:09
514	3642	74	5	2025-06-18 13:40:11	a6e6a0b8491ec39995763d075b5b1cd7f0dc1b07	2026-04-25 10:25:09	2026-04-25 10:25:09
515	4847	74	5	2025-06-18 13:40:11	a6e6a0b8491ec39995763d075b5b1cd7f0dc1b07	2026-04-25 10:25:09	2026-04-25 10:25:09
516	1984	99	4	2025-05-11 15:12:20	1637db30fb5b0d07536196b2f1872c08058e9798	2026-04-25 10:25:09	2026-04-25 10:25:09
517	4853	33	9	2025-10-07 09:50:02	cb146a343513321fd368575c63632b0b32177a60	2026-04-25 10:25:09	2026-04-25 10:25:09
518	3524	33	9	2025-10-07 09:50:02	cb146a343513321fd368575c63632b0b32177a60	2026-04-25 10:25:09	2026-04-25 10:25:09
519	1491	33	9	2025-10-07 09:50:02	cb146a343513321fd368575c63632b0b32177a60	2026-04-25 10:25:09	2026-04-25 10:25:09
520	1401	33	9	2025-10-07 09:50:02	cb146a343513321fd368575c63632b0b32177a60	2026-04-25 10:25:09	2026-04-25 10:25:09
521	258	33	9	2025-10-07 09:50:02	cb146a343513321fd368575c63632b0b32177a60	2026-04-25 10:25:09	2026-04-25 10:25:09
522	2279	33	9	2025-10-07 09:50:02	cb146a343513321fd368575c63632b0b32177a60	2026-04-25 10:25:09	2026-04-25 10:25:09
523	2613	33	9	2025-10-07 09:50:02	cb146a343513321fd368575c63632b0b32177a60	2026-04-25 10:25:09	2026-04-25 10:25:09
524	2700	33	9	2025-10-07 09:50:02	cb146a343513321fd368575c63632b0b32177a60	2026-04-25 10:25:09	2026-04-25 10:25:09
525	1690	55	5	2026-01-30 09:03:45	0551660ed4c0b8852a335efd0e982dc17d291ba7	2026-04-25 10:25:09	2026-04-25 10:25:09
526	4333	26	9	2025-08-29 17:03:18	efe21b505ec911fea85423420022cd4a8ee5c0d0	2026-04-25 10:25:09	2026-04-25 10:25:09
527	1302	26	9	2025-08-29 17:03:18	efe21b505ec911fea85423420022cd4a8ee5c0d0	2026-04-25 10:25:09	2026-04-25 10:25:09
528	4289	26	9	2025-08-29 17:03:18	efe21b505ec911fea85423420022cd4a8ee5c0d0	2026-04-25 10:25:09	2026-04-25 10:25:09
529	4078	26	9	2025-08-29 17:03:18	efe21b505ec911fea85423420022cd4a8ee5c0d0	2026-04-25 10:25:09	2026-04-25 10:25:09
530	4816	26	9	2025-08-29 17:03:18	efe21b505ec911fea85423420022cd4a8ee5c0d0	2026-04-25 10:25:09	2026-04-25 10:25:09
531	3834	26	9	2025-08-29 17:03:18	efe21b505ec911fea85423420022cd4a8ee5c0d0	2026-04-25 10:25:09	2026-04-25 10:25:09
532	4397	80	10	2025-08-22 14:37:42	70c1d39d73e2a31da012c23dfe21898597fd4f91	2026-04-25 10:25:09	2026-04-25 10:25:09
533	508	80	10	2025-08-22 14:37:42	70c1d39d73e2a31da012c23dfe21898597fd4f91	2026-04-25 10:25:09	2026-04-25 10:25:09
534	3412	80	10	2025-08-22 14:37:42	70c1d39d73e2a31da012c23dfe21898597fd4f91	2026-04-25 10:25:09	2026-04-25 10:25:09
535	1816	80	10	2025-08-22 14:37:42	70c1d39d73e2a31da012c23dfe21898597fd4f91	2026-04-25 10:25:09	2026-04-25 10:25:09
536	4378	80	10	2025-08-22 14:37:42	70c1d39d73e2a31da012c23dfe21898597fd4f91	2026-04-25 10:25:09	2026-04-25 10:25:09
537	4165	80	10	2025-08-22 14:37:42	70c1d39d73e2a31da012c23dfe21898597fd4f91	2026-04-25 10:25:09	2026-04-25 10:25:09
538	2855	80	10	2025-08-22 14:37:42	70c1d39d73e2a31da012c23dfe21898597fd4f91	2026-04-25 10:25:09	2026-04-25 10:25:09
539	4949	97	1	2025-06-15 12:43:38	62a7d7eb3e778f1f1176956caee1a80f07ddc1aa	2026-04-25 10:25:09	2026-04-25 10:25:09
540	1555	97	1	2025-06-15 12:43:38	62a7d7eb3e778f1f1176956caee1a80f07ddc1aa	2026-04-25 10:25:09	2026-04-25 10:25:09
541	71	97	1	2025-06-15 12:43:38	62a7d7eb3e778f1f1176956caee1a80f07ddc1aa	2026-04-25 10:25:09	2026-04-25 10:25:09
542	562	97	1	2025-06-15 12:43:38	62a7d7eb3e778f1f1176956caee1a80f07ddc1aa	2026-04-25 10:25:09	2026-04-25 10:25:09
543	3855	97	1	2025-06-15 12:43:38	62a7d7eb3e778f1f1176956caee1a80f07ddc1aa	2026-04-25 10:25:09	2026-04-25 10:25:09
544	4188	97	1	2025-06-15 12:43:38	62a7d7eb3e778f1f1176956caee1a80f07ddc1aa	2026-04-25 10:25:09	2026-04-25 10:25:09
545	3188	34	8	2025-09-25 13:07:06	4ae83ae5833f7bc4575f3718487d160e72b73ecc	2026-04-25 10:25:09	2026-04-25 10:25:09
546	3430	30	4	2026-04-16 14:36:58	d82e4052715e90b54e64803fc578959bcf473f1d	2026-04-25 10:25:09	2026-04-25 10:25:09
547	13	30	4	2026-04-16 14:36:58	d82e4052715e90b54e64803fc578959bcf473f1d	2026-04-25 10:25:09	2026-04-25 10:25:09
548	504	48	5	2025-12-09 09:41:39	51336e927c185d3fc1e8808bd29aaa9770a7005a	2026-04-25 10:25:09	2026-04-25 10:25:09
549	3327	48	5	2025-12-09 09:41:39	51336e927c185d3fc1e8808bd29aaa9770a7005a	2026-04-25 10:25:09	2026-04-25 10:25:09
550	3987	48	5	2025-12-09 09:41:39	51336e927c185d3fc1e8808bd29aaa9770a7005a	2026-04-25 10:25:09	2026-04-25 10:25:09
551	3232	48	5	2025-12-09 09:41:39	51336e927c185d3fc1e8808bd29aaa9770a7005a	2026-04-25 10:25:09	2026-04-25 10:25:09
552	2789	48	5	2025-12-09 09:41:39	51336e927c185d3fc1e8808bd29aaa9770a7005a	2026-04-25 10:25:09	2026-04-25 10:25:09
553	3635	48	5	2025-12-09 09:41:39	51336e927c185d3fc1e8808bd29aaa9770a7005a	2026-04-25 10:25:09	2026-04-25 10:25:09
554	2674	48	5	2025-12-09 09:41:39	51336e927c185d3fc1e8808bd29aaa9770a7005a	2026-04-25 10:25:09	2026-04-25 10:25:09
555	2231	48	5	2025-12-09 09:41:39	51336e927c185d3fc1e8808bd29aaa9770a7005a	2026-04-25 10:25:09	2026-04-25 10:25:09
556	769	48	5	2025-12-09 09:41:39	51336e927c185d3fc1e8808bd29aaa9770a7005a	2026-04-25 10:25:09	2026-04-25 10:25:09
557	859	46	4	2025-09-05 15:09:23	cb2f784da885e214e4204d553f277396956a3c0c	2026-04-25 10:25:09	2026-04-25 10:25:09
558	915	46	4	2025-09-05 15:09:23	cb2f784da885e214e4204d553f277396956a3c0c	2026-04-25 10:25:09	2026-04-25 10:25:09
559	3942	46	4	2025-09-05 15:09:23	cb2f784da885e214e4204d553f277396956a3c0c	2026-04-25 10:25:09	2026-04-25 10:25:09
560	2300	98	3	2026-01-21 14:46:42	20e5fc729c682cba6ae648ddccf3c0278c2b39a9	2026-04-25 10:25:09	2026-04-25 10:25:09
561	1328	98	3	2026-01-21 14:46:42	20e5fc729c682cba6ae648ddccf3c0278c2b39a9	2026-04-25 10:25:09	2026-04-25 10:25:09
562	402	98	3	2026-01-21 14:46:42	20e5fc729c682cba6ae648ddccf3c0278c2b39a9	2026-04-25 10:25:09	2026-04-25 10:25:09
563	154	96	10	2025-09-12 15:00:44	3e4b8123e4b927a37b68a177d8c10c63726ed12d	2026-04-25 10:25:09	2026-04-25 10:25:09
564	4899	96	10	2025-09-12 15:00:44	3e4b8123e4b927a37b68a177d8c10c63726ed12d	2026-04-25 10:25:09	2026-04-25 10:25:09
565	4216	96	10	2025-09-12 15:00:44	3e4b8123e4b927a37b68a177d8c10c63726ed12d	2026-04-25 10:25:09	2026-04-25 10:25:09
566	3858	96	10	2025-09-12 15:00:44	3e4b8123e4b927a37b68a177d8c10c63726ed12d	2026-04-25 10:25:09	2026-04-25 10:25:09
567	1819	96	10	2025-09-12 15:00:44	3e4b8123e4b927a37b68a177d8c10c63726ed12d	2026-04-25 10:25:09	2026-04-25 10:25:09
568	3344	96	10	2025-09-12 15:00:44	3e4b8123e4b927a37b68a177d8c10c63726ed12d	2026-04-25 10:25:09	2026-04-25 10:25:09
569	2933	96	10	2025-09-12 15:00:44	3e4b8123e4b927a37b68a177d8c10c63726ed12d	2026-04-25 10:25:09	2026-04-25 10:25:09
570	4851	96	10	2025-09-12 15:00:44	3e4b8123e4b927a37b68a177d8c10c63726ed12d	2026-04-25 10:25:09	2026-04-25 10:25:09
571	1623	96	10	2025-09-12 15:00:44	3e4b8123e4b927a37b68a177d8c10c63726ed12d	2026-04-25 10:25:09	2026-04-25 10:25:09
572	215	50	6	2026-02-09 12:12:39	f9468441790698d92319ae2e0b37fb5ec2de1700	2026-04-25 10:25:09	2026-04-25 10:25:09
573	1042	50	6	2026-02-09 12:12:39	f9468441790698d92319ae2e0b37fb5ec2de1700	2026-04-25 10:25:09	2026-04-25 10:25:09
574	1328	50	6	2026-02-09 12:12:39	f9468441790698d92319ae2e0b37fb5ec2de1700	2026-04-25 10:25:09	2026-04-25 10:25:09
575	4163	50	6	2026-02-09 12:12:39	f9468441790698d92319ae2e0b37fb5ec2de1700	2026-04-25 10:25:09	2026-04-25 10:25:09
576	1871	50	6	2026-02-09 12:12:39	f9468441790698d92319ae2e0b37fb5ec2de1700	2026-04-25 10:25:09	2026-04-25 10:25:09
577	1771	50	6	2026-02-09 12:12:39	f9468441790698d92319ae2e0b37fb5ec2de1700	2026-04-25 10:25:09	2026-04-25 10:25:09
578	4308	53	8	2025-07-07 13:15:30	5bad8806f14e502d2f5159b276d1b7f4ba6cbed5	2026-04-25 10:25:09	2026-04-25 10:25:09
579	3459	53	8	2025-07-07 13:15:30	5bad8806f14e502d2f5159b276d1b7f4ba6cbed5	2026-04-25 10:25:09	2026-04-25 10:25:09
580	1695	53	8	2025-07-07 13:15:30	5bad8806f14e502d2f5159b276d1b7f4ba6cbed5	2026-04-25 10:25:09	2026-04-25 10:25:09
581	4991	53	8	2025-07-07 13:15:30	5bad8806f14e502d2f5159b276d1b7f4ba6cbed5	2026-04-25 10:25:09	2026-04-25 10:25:09
582	1772	53	8	2025-07-07 13:15:30	5bad8806f14e502d2f5159b276d1b7f4ba6cbed5	2026-04-25 10:25:09	2026-04-25 10:25:09
583	349	31	7	2025-06-08 13:46:17	99800c6170b8360dbccf770f79fef70f5d904fc5	2026-04-25 10:25:09	2026-04-25 10:25:09
584	2257	31	7	2025-06-08 13:46:17	99800c6170b8360dbccf770f79fef70f5d904fc5	2026-04-25 10:25:09	2026-04-25 10:25:09
585	547	31	7	2025-06-08 13:46:17	99800c6170b8360dbccf770f79fef70f5d904fc5	2026-04-25 10:25:09	2026-04-25 10:25:09
586	2079	47	8	2025-05-28 15:17:10	066b958a89b0dd5df1df0bf0c6b9f771fb347fc2	2026-04-25 10:25:09	2026-04-25 10:25:09
587	3468	47	8	2025-05-28 15:17:10	066b958a89b0dd5df1df0bf0c6b9f771fb347fc2	2026-04-25 10:25:09	2026-04-25 10:25:09
588	1652	47	8	2025-05-28 15:17:10	066b958a89b0dd5df1df0bf0c6b9f771fb347fc2	2026-04-25 10:25:09	2026-04-25 10:25:09
589	475	47	8	2025-05-28 15:17:10	066b958a89b0dd5df1df0bf0c6b9f771fb347fc2	2026-04-25 10:25:09	2026-04-25 10:25:09
590	2006	47	8	2025-05-28 15:17:10	066b958a89b0dd5df1df0bf0c6b9f771fb347fc2	2026-04-25 10:25:09	2026-04-25 10:25:09
591	3508	47	8	2025-05-28 15:17:10	066b958a89b0dd5df1df0bf0c6b9f771fb347fc2	2026-04-25 10:25:09	2026-04-25 10:25:09
592	885	36	8	2025-08-22 10:04:08	1e9d12a38783111f57a8b154ac27b5a9185ae765	2026-04-25 10:25:09	2026-04-25 10:25:09
593	4961	36	8	2025-08-22 10:04:08	1e9d12a38783111f57a8b154ac27b5a9185ae765	2026-04-25 10:25:09	2026-04-25 10:25:09
594	3738	36	8	2025-08-22 10:04:08	1e9d12a38783111f57a8b154ac27b5a9185ae765	2026-04-25 10:25:09	2026-04-25 10:25:09
595	1268	36	8	2025-08-22 10:04:08	1e9d12a38783111f57a8b154ac27b5a9185ae765	2026-04-25 10:25:09	2026-04-25 10:25:09
596	2180	36	8	2025-08-22 10:04:08	1e9d12a38783111f57a8b154ac27b5a9185ae765	2026-04-25 10:25:09	2026-04-25 10:25:09
597	997	36	8	2025-08-22 10:04:08	1e9d12a38783111f57a8b154ac27b5a9185ae765	2026-04-25 10:25:09	2026-04-25 10:25:09
598	1457	36	8	2025-08-22 10:04:08	1e9d12a38783111f57a8b154ac27b5a9185ae765	2026-04-25 10:25:09	2026-04-25 10:25:09
599	3757	36	8	2025-08-22 10:04:08	1e9d12a38783111f57a8b154ac27b5a9185ae765	2026-04-25 10:25:09	2026-04-25 10:25:09
600	140	36	8	2025-08-22 10:04:08	1e9d12a38783111f57a8b154ac27b5a9185ae765	2026-04-25 10:25:09	2026-04-25 10:25:09
601	1625	67	1	2026-02-28 13:08:35	b5d918b8a5e7f59454b37d57da9145d5fc7c4659	2026-04-25 10:25:09	2026-04-25 10:25:09
602	2950	67	1	2026-02-28 13:08:35	b5d918b8a5e7f59454b37d57da9145d5fc7c4659	2026-04-25 10:25:09	2026-04-25 10:25:09
603	4369	67	1	2026-02-28 13:08:35	b5d918b8a5e7f59454b37d57da9145d5fc7c4659	2026-04-25 10:25:09	2026-04-25 10:25:09
604	2242	67	1	2026-02-28 13:08:35	b5d918b8a5e7f59454b37d57da9145d5fc7c4659	2026-04-25 10:25:09	2026-04-25 10:25:09
605	1744	67	1	2026-02-28 13:08:35	b5d918b8a5e7f59454b37d57da9145d5fc7c4659	2026-04-25 10:25:09	2026-04-25 10:25:09
606	1061	67	1	2026-02-28 13:08:35	b5d918b8a5e7f59454b37d57da9145d5fc7c4659	2026-04-25 10:25:09	2026-04-25 10:25:09
607	1937	67	1	2026-02-28 13:08:35	b5d918b8a5e7f59454b37d57da9145d5fc7c4659	2026-04-25 10:25:09	2026-04-25 10:25:09
608	864	67	1	2026-02-28 13:08:35	b5d918b8a5e7f59454b37d57da9145d5fc7c4659	2026-04-25 10:25:09	2026-04-25 10:25:09
609	3685	78	3	2025-09-09 13:12:01	369a063d57dbba21a143a7f80d7af4cc5ebf06c3	2026-04-25 10:25:09	2026-04-25 10:25:09
610	2667	78	3	2025-09-09 13:12:01	369a063d57dbba21a143a7f80d7af4cc5ebf06c3	2026-04-25 10:25:09	2026-04-25 10:25:09
611	2369	78	3	2025-09-09 13:12:01	369a063d57dbba21a143a7f80d7af4cc5ebf06c3	2026-04-25 10:25:09	2026-04-25 10:25:09
612	3617	78	3	2025-09-09 13:12:01	369a063d57dbba21a143a7f80d7af4cc5ebf06c3	2026-04-25 10:25:09	2026-04-25 10:25:09
613	4613	78	3	2025-09-09 13:12:01	369a063d57dbba21a143a7f80d7af4cc5ebf06c3	2026-04-25 10:25:09	2026-04-25 10:25:09
614	108	78	3	2025-09-09 13:12:01	369a063d57dbba21a143a7f80d7af4cc5ebf06c3	2026-04-25 10:25:09	2026-04-25 10:25:09
615	1373	78	3	2025-09-09 13:12:01	369a063d57dbba21a143a7f80d7af4cc5ebf06c3	2026-04-25 10:25:09	2026-04-25 10:25:09
616	2059	11	4	2026-02-05 17:16:41	535b542956276032a4d5571a865b554f5876d432	2026-04-25 10:25:09	2026-04-25 10:25:09
617	4546	11	4	2026-02-05 17:16:41	535b542956276032a4d5571a865b554f5876d432	2026-04-25 10:25:09	2026-04-25 10:25:09
618	2842	11	4	2026-02-05 17:16:41	535b542956276032a4d5571a865b554f5876d432	2026-04-25 10:25:09	2026-04-25 10:25:09
619	980	11	4	2026-02-05 17:16:41	535b542956276032a4d5571a865b554f5876d432	2026-04-25 10:25:09	2026-04-25 10:25:09
620	1911	11	4	2026-02-05 17:16:41	535b542956276032a4d5571a865b554f5876d432	2026-04-25 10:25:09	2026-04-25 10:25:09
621	142	11	4	2026-02-05 17:16:41	535b542956276032a4d5571a865b554f5876d432	2026-04-25 10:25:09	2026-04-25 10:25:09
622	2315	32	8	2025-11-05 13:19:56	21b59b4692f7762021b936aeb935d1a88308b7ca	2026-04-25 10:25:09	2026-04-25 10:25:09
623	4208	32	8	2025-11-05 13:19:56	21b59b4692f7762021b936aeb935d1a88308b7ca	2026-04-25 10:25:09	2026-04-25 10:25:09
624	1022	32	8	2025-11-05 13:19:56	21b59b4692f7762021b936aeb935d1a88308b7ca	2026-04-25 10:25:09	2026-04-25 10:25:09
625	3141	32	8	2025-11-05 13:19:56	21b59b4692f7762021b936aeb935d1a88308b7ca	2026-04-25 10:25:09	2026-04-25 10:25:09
626	1185	32	8	2025-11-05 13:19:56	21b59b4692f7762021b936aeb935d1a88308b7ca	2026-04-25 10:25:09	2026-04-25 10:25:09
627	4067	32	8	2025-11-05 13:19:56	21b59b4692f7762021b936aeb935d1a88308b7ca	2026-04-25 10:25:09	2026-04-25 10:25:09
628	1868	3	1	2026-02-07 15:00:04	d0780f73f3b23d07699eaf9c500b08764d533082	2026-04-25 10:25:09	2026-04-25 10:25:09
629	457	3	1	2026-02-07 15:00:04	d0780f73f3b23d07699eaf9c500b08764d533082	2026-04-25 10:25:09	2026-04-25 10:25:09
630	4956	3	1	2026-02-07 15:00:04	d0780f73f3b23d07699eaf9c500b08764d533082	2026-04-25 10:25:09	2026-04-25 10:25:09
631	500	3	1	2026-02-07 15:00:04	d0780f73f3b23d07699eaf9c500b08764d533082	2026-04-25 10:25:09	2026-04-25 10:25:09
632	1065	3	1	2026-02-07 15:00:04	d0780f73f3b23d07699eaf9c500b08764d533082	2026-04-25 10:25:09	2026-04-25 10:25:09
633	305	3	1	2026-02-07 15:00:04	d0780f73f3b23d07699eaf9c500b08764d533082	2026-04-25 10:25:09	2026-04-25 10:25:09
634	787	3	1	2026-02-07 15:00:04	d0780f73f3b23d07699eaf9c500b08764d533082	2026-04-25 10:25:09	2026-04-25 10:25:09
635	424	3	1	2026-02-07 15:00:04	d0780f73f3b23d07699eaf9c500b08764d533082	2026-04-25 10:25:09	2026-04-25 10:25:09
636	2412	38	9	2025-05-06 17:32:41	ccfdad8908d642e5f300bdddc3a98eae8d2eaab1	2026-04-25 10:25:09	2026-04-25 10:25:09
637	245	38	9	2025-05-06 17:32:41	ccfdad8908d642e5f300bdddc3a98eae8d2eaab1	2026-04-25 10:25:09	2026-04-25 10:25:09
638	1753	38	9	2025-05-06 17:32:41	ccfdad8908d642e5f300bdddc3a98eae8d2eaab1	2026-04-25 10:25:09	2026-04-25 10:25:09
639	1676	79	4	2025-05-13 16:45:28	4b284dcb183379811a38731066f8ceefa86257ee	2026-04-25 10:25:09	2026-04-25 10:25:09
640	3229	79	4	2025-05-13 16:45:28	4b284dcb183379811a38731066f8ceefa86257ee	2026-04-25 10:25:09	2026-04-25 10:25:09
641	3922	79	4	2025-05-13 16:45:28	4b284dcb183379811a38731066f8ceefa86257ee	2026-04-25 10:25:09	2026-04-25 10:25:09
642	1645	79	4	2025-05-13 16:45:28	4b284dcb183379811a38731066f8ceefa86257ee	2026-04-25 10:25:09	2026-04-25 10:25:09
643	3397	79	4	2025-05-13 16:45:28	4b284dcb183379811a38731066f8ceefa86257ee	2026-04-25 10:25:09	2026-04-25 10:25:09
644	3806	79	4	2025-05-13 16:45:28	4b284dcb183379811a38731066f8ceefa86257ee	2026-04-25 10:25:09	2026-04-25 10:25:09
645	3019	79	4	2025-05-13 16:45:28	4b284dcb183379811a38731066f8ceefa86257ee	2026-04-25 10:25:09	2026-04-25 10:25:09
646	2961	79	4	2025-05-13 16:45:28	4b284dcb183379811a38731066f8ceefa86257ee	2026-04-25 10:25:09	2026-04-25 10:25:09
647	4338	79	4	2025-05-13 16:45:28	4b284dcb183379811a38731066f8ceefa86257ee	2026-04-25 10:25:09	2026-04-25 10:25:09
648	555	79	4	2025-05-13 16:45:28	4b284dcb183379811a38731066f8ceefa86257ee	2026-04-25 10:25:09	2026-04-25 10:25:09
649	980	96	10	2026-01-27 10:59:57	4a5d51eda183507b419e91d52c9b096f0f943b88	2026-04-25 10:25:09	2026-04-25 10:25:09
650	2308	96	10	2026-01-27 10:59:57	4a5d51eda183507b419e91d52c9b096f0f943b88	2026-04-25 10:25:09	2026-04-25 10:25:09
651	2352	96	10	2026-01-27 10:59:57	4a5d51eda183507b419e91d52c9b096f0f943b88	2026-04-25 10:25:09	2026-04-25 10:25:09
652	3995	96	10	2026-01-27 10:59:57	4a5d51eda183507b419e91d52c9b096f0f943b88	2026-04-25 10:25:09	2026-04-25 10:25:09
653	272	96	10	2026-01-27 10:59:57	4a5d51eda183507b419e91d52c9b096f0f943b88	2026-04-25 10:25:09	2026-04-25 10:25:09
654	4642	96	10	2026-01-27 10:59:57	4a5d51eda183507b419e91d52c9b096f0f943b88	2026-04-25 10:25:09	2026-04-25 10:25:09
655	263	96	10	2026-01-27 10:59:57	4a5d51eda183507b419e91d52c9b096f0f943b88	2026-04-25 10:25:09	2026-04-25 10:25:09
656	2267	96	10	2026-01-27 10:59:57	4a5d51eda183507b419e91d52c9b096f0f943b88	2026-04-25 10:25:09	2026-04-25 10:25:09
657	1421	96	10	2026-01-27 10:59:57	4a5d51eda183507b419e91d52c9b096f0f943b88	2026-04-25 10:25:09	2026-04-25 10:25:09
658	4778	31	3	2026-03-06 15:02:03	ebeaea114ca4d89fe434139ed283a8f6479d3491	2026-04-25 10:25:09	2026-04-25 10:25:09
659	1373	31	3	2026-03-06 15:02:03	ebeaea114ca4d89fe434139ed283a8f6479d3491	2026-04-25 10:25:09	2026-04-25 10:25:09
660	3938	61	8	2025-12-05 13:59:40	a43eb9e65522fa35dd9410cc22c9fe0d6eed0443	2026-04-25 10:25:09	2026-04-25 10:25:09
661	3411	61	8	2025-12-05 13:59:40	a43eb9e65522fa35dd9410cc22c9fe0d6eed0443	2026-04-25 10:25:09	2026-04-25 10:25:09
662	3726	61	8	2025-12-05 13:59:40	a43eb9e65522fa35dd9410cc22c9fe0d6eed0443	2026-04-25 10:25:09	2026-04-25 10:25:09
663	3634	61	8	2025-12-05 13:59:40	a43eb9e65522fa35dd9410cc22c9fe0d6eed0443	2026-04-25 10:25:09	2026-04-25 10:25:09
664	1888	61	8	2025-12-05 13:59:40	a43eb9e65522fa35dd9410cc22c9fe0d6eed0443	2026-04-25 10:25:09	2026-04-25 10:25:09
665	2213	61	8	2025-12-05 13:59:40	a43eb9e65522fa35dd9410cc22c9fe0d6eed0443	2026-04-25 10:25:09	2026-04-25 10:25:09
666	4591	61	8	2025-12-05 13:59:40	a43eb9e65522fa35dd9410cc22c9fe0d6eed0443	2026-04-25 10:25:09	2026-04-25 10:25:09
667	3789	61	8	2025-12-05 13:59:40	a43eb9e65522fa35dd9410cc22c9fe0d6eed0443	2026-04-25 10:25:09	2026-04-25 10:25:09
668	3198	61	8	2025-12-05 13:59:40	a43eb9e65522fa35dd9410cc22c9fe0d6eed0443	2026-04-25 10:25:09	2026-04-25 10:25:09
669	3053	61	9	2025-08-25 10:58:55	d1f34ada9296ddf0e5342238d8ad63590562e7ce	2026-04-25 10:25:09	2026-04-25 10:25:09
670	1569	61	9	2025-08-25 10:58:55	d1f34ada9296ddf0e5342238d8ad63590562e7ce	2026-04-25 10:25:09	2026-04-25 10:25:09
671	1979	61	9	2025-08-25 10:58:55	d1f34ada9296ddf0e5342238d8ad63590562e7ce	2026-04-25 10:25:09	2026-04-25 10:25:09
672	2219	61	9	2025-08-25 10:58:55	d1f34ada9296ddf0e5342238d8ad63590562e7ce	2026-04-25 10:25:09	2026-04-25 10:25:09
673	581	61	9	2025-08-25 10:58:55	d1f34ada9296ddf0e5342238d8ad63590562e7ce	2026-04-25 10:25:09	2026-04-25 10:25:09
674	4910	61	9	2025-08-25 10:58:55	d1f34ada9296ddf0e5342238d8ad63590562e7ce	2026-04-25 10:25:09	2026-04-25 10:25:09
675	1428	61	9	2025-08-25 10:58:55	d1f34ada9296ddf0e5342238d8ad63590562e7ce	2026-04-25 10:25:09	2026-04-25 10:25:09
676	2708	61	9	2025-08-25 10:58:55	d1f34ada9296ddf0e5342238d8ad63590562e7ce	2026-04-25 10:25:09	2026-04-25 10:25:09
677	2593	84	4	2026-04-04 09:21:41	95ef9c4bfaca4201ac2ce0049b8154e86921bf58	2026-04-25 10:25:09	2026-04-25 10:25:09
678	4176	84	4	2026-04-04 09:21:41	95ef9c4bfaca4201ac2ce0049b8154e86921bf58	2026-04-25 10:25:09	2026-04-25 10:25:09
679	4692	84	4	2026-04-04 09:21:41	95ef9c4bfaca4201ac2ce0049b8154e86921bf58	2026-04-25 10:25:09	2026-04-25 10:25:09
680	3221	84	4	2026-04-04 09:21:41	95ef9c4bfaca4201ac2ce0049b8154e86921bf58	2026-04-25 10:25:09	2026-04-25 10:25:09
681	3329	84	4	2026-04-04 09:21:41	95ef9c4bfaca4201ac2ce0049b8154e86921bf58	2026-04-25 10:25:09	2026-04-25 10:25:09
682	1466	84	4	2026-04-04 09:21:41	95ef9c4bfaca4201ac2ce0049b8154e86921bf58	2026-04-25 10:25:09	2026-04-25 10:25:09
683	2174	84	4	2026-04-04 09:21:41	95ef9c4bfaca4201ac2ce0049b8154e86921bf58	2026-04-25 10:25:09	2026-04-25 10:25:09
684	2894	84	4	2026-04-04 09:21:41	95ef9c4bfaca4201ac2ce0049b8154e86921bf58	2026-04-25 10:25:09	2026-04-25 10:25:09
685	2354	96	8	2026-04-21 12:46:33	3e99d00689f0d4bd0d9294daccb5227e56167bb2	2026-04-25 10:25:09	2026-04-25 10:25:09
686	2030	66	3	2025-05-11 15:45:42	b6e72936917fa1b5e15b6dc90dfc8dd8dbf9ca07	2026-04-25 10:25:09	2026-04-25 10:25:09
687	1108	66	3	2025-05-11 15:45:42	b6e72936917fa1b5e15b6dc90dfc8dd8dbf9ca07	2026-04-25 10:25:09	2026-04-25 10:25:09
688	2879	66	3	2025-05-11 15:45:42	b6e72936917fa1b5e15b6dc90dfc8dd8dbf9ca07	2026-04-25 10:25:09	2026-04-25 10:25:09
689	451	66	3	2025-05-11 15:45:42	b6e72936917fa1b5e15b6dc90dfc8dd8dbf9ca07	2026-04-25 10:25:09	2026-04-25 10:25:09
690	1476	66	3	2025-05-11 15:45:42	b6e72936917fa1b5e15b6dc90dfc8dd8dbf9ca07	2026-04-25 10:25:09	2026-04-25 10:25:09
691	1119	66	3	2025-05-11 15:45:42	b6e72936917fa1b5e15b6dc90dfc8dd8dbf9ca07	2026-04-25 10:25:09	2026-04-25 10:25:09
692	1475	35	3	2025-04-30 16:22:22	50c6d9d0fff4118ac74ef217327b98d80843cb61	2026-04-25 10:25:09	2026-04-25 10:25:09
693	3779	35	3	2025-04-30 16:22:22	50c6d9d0fff4118ac74ef217327b98d80843cb61	2026-04-25 10:25:09	2026-04-25 10:25:09
694	4902	35	3	2025-04-30 16:22:22	50c6d9d0fff4118ac74ef217327b98d80843cb61	2026-04-25 10:25:09	2026-04-25 10:25:09
695	2936	35	3	2025-04-30 16:22:22	50c6d9d0fff4118ac74ef217327b98d80843cb61	2026-04-25 10:25:09	2026-04-25 10:25:09
696	4301	35	3	2025-04-30 16:22:22	50c6d9d0fff4118ac74ef217327b98d80843cb61	2026-04-25 10:25:09	2026-04-25 10:25:09
697	2563	20	1	2025-05-10 11:11:17	ec699ffe9a4e555bef499f9b7803c192c2dac7d1	2026-04-25 10:25:09	2026-04-25 10:25:09
698	1718	20	1	2025-05-10 11:11:17	ec699ffe9a4e555bef499f9b7803c192c2dac7d1	2026-04-25 10:25:09	2026-04-25 10:25:09
699	767	29	8	2025-10-27 09:47:33	b49bcc6c153d6d03cc23dea70c3e5da75de14b9d	2026-04-25 10:25:09	2026-04-25 10:25:09
700	4457	29	8	2025-10-27 09:47:33	b49bcc6c153d6d03cc23dea70c3e5da75de14b9d	2026-04-25 10:25:09	2026-04-25 10:25:09
701	3397	29	8	2025-10-27 09:47:33	b49bcc6c153d6d03cc23dea70c3e5da75de14b9d	2026-04-25 10:25:09	2026-04-25 10:25:09
702	346	29	8	2025-10-27 09:47:33	b49bcc6c153d6d03cc23dea70c3e5da75de14b9d	2026-04-25 10:25:09	2026-04-25 10:25:09
703	4958	29	8	2025-10-27 09:47:33	b49bcc6c153d6d03cc23dea70c3e5da75de14b9d	2026-04-25 10:25:09	2026-04-25 10:25:09
704	384	20	7	2026-04-19 09:17:52	d5dd1a2106e96f93a2837d5b6f4fe25b02a6e6d1	2026-04-25 10:25:09	2026-04-25 10:25:09
705	1380	20	7	2026-04-19 09:17:52	d5dd1a2106e96f93a2837d5b6f4fe25b02a6e6d1	2026-04-25 10:25:09	2026-04-25 10:25:09
706	441	20	7	2026-04-19 09:17:52	d5dd1a2106e96f93a2837d5b6f4fe25b02a6e6d1	2026-04-25 10:25:09	2026-04-25 10:25:09
707	1690	20	7	2026-04-19 09:17:52	d5dd1a2106e96f93a2837d5b6f4fe25b02a6e6d1	2026-04-25 10:25:09	2026-04-25 10:25:09
708	822	6	5	2025-09-16 09:05:58	0c27be485c3b25cfded630ca1625081d1d566788	2026-04-25 10:25:09	2026-04-25 10:25:09
709	3167	6	5	2025-09-16 09:05:58	0c27be485c3b25cfded630ca1625081d1d566788	2026-04-25 10:25:09	2026-04-25 10:25:09
710	3573	6	5	2025-09-16 09:05:58	0c27be485c3b25cfded630ca1625081d1d566788	2026-04-25 10:25:09	2026-04-25 10:25:09
711	797	6	5	2025-09-16 09:05:58	0c27be485c3b25cfded630ca1625081d1d566788	2026-04-25 10:25:09	2026-04-25 10:25:09
712	2373	6	5	2025-09-16 09:05:58	0c27be485c3b25cfded630ca1625081d1d566788	2026-04-25 10:25:09	2026-04-25 10:25:09
713	4282	6	5	2025-09-16 09:05:58	0c27be485c3b25cfded630ca1625081d1d566788	2026-04-25 10:25:09	2026-04-25 10:25:09
714	3501	6	5	2025-09-16 09:05:58	0c27be485c3b25cfded630ca1625081d1d566788	2026-04-25 10:25:09	2026-04-25 10:25:09
715	1907	6	5	2025-09-16 09:05:58	0c27be485c3b25cfded630ca1625081d1d566788	2026-04-25 10:25:09	2026-04-25 10:25:09
716	2571	67	7	2025-10-24 12:06:18	0c95f8e5e8fa9023dc649a54038509c2383d7be2	2026-04-25 10:25:09	2026-04-25 10:25:09
717	100	67	7	2025-10-24 12:06:18	0c95f8e5e8fa9023dc649a54038509c2383d7be2	2026-04-25 10:25:09	2026-04-25 10:25:09
718	3724	67	7	2025-10-24 12:06:18	0c95f8e5e8fa9023dc649a54038509c2383d7be2	2026-04-25 10:25:09	2026-04-25 10:25:09
719	243	67	7	2025-10-24 12:06:18	0c95f8e5e8fa9023dc649a54038509c2383d7be2	2026-04-25 10:25:09	2026-04-25 10:25:09
720	4944	67	7	2025-10-24 12:06:18	0c95f8e5e8fa9023dc649a54038509c2383d7be2	2026-04-25 10:25:09	2026-04-25 10:25:09
721	360	67	7	2025-10-24 12:06:18	0c95f8e5e8fa9023dc649a54038509c2383d7be2	2026-04-25 10:25:09	2026-04-25 10:25:09
722	2736	67	7	2025-10-24 12:06:18	0c95f8e5e8fa9023dc649a54038509c2383d7be2	2026-04-25 10:25:09	2026-04-25 10:25:09
723	2615	67	7	2025-10-24 12:06:18	0c95f8e5e8fa9023dc649a54038509c2383d7be2	2026-04-25 10:25:09	2026-04-25 10:25:09
724	4368	67	7	2025-10-24 12:06:18	0c95f8e5e8fa9023dc649a54038509c2383d7be2	2026-04-25 10:25:09	2026-04-25 10:25:09
725	1768	10	4	2025-12-20 17:05:30	b647c69c7463d196f4177ae97d53f9ffccfa16b4	2026-04-25 10:25:09	2026-04-25 10:25:09
726	4629	10	4	2025-12-20 17:05:30	b647c69c7463d196f4177ae97d53f9ffccfa16b4	2026-04-25 10:25:09	2026-04-25 10:25:09
727	1220	10	4	2025-12-20 17:05:30	b647c69c7463d196f4177ae97d53f9ffccfa16b4	2026-04-25 10:25:09	2026-04-25 10:25:09
728	3894	10	4	2025-12-20 17:05:30	b647c69c7463d196f4177ae97d53f9ffccfa16b4	2026-04-25 10:25:09	2026-04-25 10:25:09
729	4263	10	4	2025-12-20 17:05:30	b647c69c7463d196f4177ae97d53f9ffccfa16b4	2026-04-25 10:25:09	2026-04-25 10:25:09
730	1289	10	4	2025-12-20 17:05:30	b647c69c7463d196f4177ae97d53f9ffccfa16b4	2026-04-25 10:25:09	2026-04-25 10:25:09
731	4916	10	4	2025-12-20 17:05:30	b647c69c7463d196f4177ae97d53f9ffccfa16b4	2026-04-25 10:25:09	2026-04-25 10:25:09
732	3075	10	4	2025-12-20 17:05:30	b647c69c7463d196f4177ae97d53f9ffccfa16b4	2026-04-25 10:25:09	2026-04-25 10:25:09
733	3759	5	9	2025-08-10 15:14:12	54d11cfedff032874c2ce6bb1a8cf4fff69b7e18	2026-04-25 10:25:09	2026-04-25 10:25:09
734	2706	5	9	2025-08-10 15:14:12	54d11cfedff032874c2ce6bb1a8cf4fff69b7e18	2026-04-25 10:25:09	2026-04-25 10:25:09
735	4172	5	9	2025-08-10 15:14:12	54d11cfedff032874c2ce6bb1a8cf4fff69b7e18	2026-04-25 10:25:09	2026-04-25 10:25:09
736	3312	85	9	2026-04-02 14:00:20	a09700f1f28df64cfef8095becfdb4d807d1c21a	2026-04-25 10:25:09	2026-04-25 10:25:09
737	3973	85	9	2026-04-02 14:00:20	a09700f1f28df64cfef8095becfdb4d807d1c21a	2026-04-25 10:25:09	2026-04-25 10:25:09
738	2984	85	9	2026-04-02 14:00:20	a09700f1f28df64cfef8095becfdb4d807d1c21a	2026-04-25 10:25:09	2026-04-25 10:25:09
739	3844	85	9	2026-04-02 14:00:20	a09700f1f28df64cfef8095becfdb4d807d1c21a	2026-04-25 10:25:09	2026-04-25 10:25:09
740	3267	16	4	2025-10-30 11:04:06	15d5f756c7086e4e16c4e09ee1bb7001a65589fe	2026-04-25 10:25:09	2026-04-25 10:25:09
741	3358	16	4	2025-10-30 11:04:06	15d5f756c7086e4e16c4e09ee1bb7001a65589fe	2026-04-25 10:25:09	2026-04-25 10:25:09
742	1733	16	4	2025-10-30 11:04:06	15d5f756c7086e4e16c4e09ee1bb7001a65589fe	2026-04-25 10:25:09	2026-04-25 10:25:09
743	3133	21	7	2025-10-16 13:26:22	bb78624f5922eecb5359acfbf5b331fa00018e27	2026-04-25 10:25:09	2026-04-25 10:25:09
744	3401	21	7	2025-10-16 13:26:22	bb78624f5922eecb5359acfbf5b331fa00018e27	2026-04-25 10:25:09	2026-04-25 10:25:09
745	4033	21	7	2025-10-16 13:26:22	bb78624f5922eecb5359acfbf5b331fa00018e27	2026-04-25 10:25:09	2026-04-25 10:25:09
746	2262	21	7	2025-10-16 13:26:22	bb78624f5922eecb5359acfbf5b331fa00018e27	2026-04-25 10:25:09	2026-04-25 10:25:09
747	2748	21	7	2025-10-16 13:26:22	bb78624f5922eecb5359acfbf5b331fa00018e27	2026-04-25 10:25:09	2026-04-25 10:25:09
748	4916	21	7	2025-10-16 13:26:22	bb78624f5922eecb5359acfbf5b331fa00018e27	2026-04-25 10:25:09	2026-04-25 10:25:09
749	4153	21	7	2025-10-16 13:26:22	bb78624f5922eecb5359acfbf5b331fa00018e27	2026-04-25 10:25:09	2026-04-25 10:25:09
750	1338	21	7	2025-10-16 13:26:22	bb78624f5922eecb5359acfbf5b331fa00018e27	2026-04-25 10:25:09	2026-04-25 10:25:09
751	3131	21	7	2025-10-16 13:26:22	bb78624f5922eecb5359acfbf5b331fa00018e27	2026-04-25 10:25:09	2026-04-25 10:25:09
752	3775	53	3	2026-01-08 14:44:40	58117061d693c2cb5e42513d4b09b3403647d369	2026-04-25 10:25:09	2026-04-25 10:25:09
753	1285	53	3	2026-01-08 14:44:40	58117061d693c2cb5e42513d4b09b3403647d369	2026-04-25 10:25:09	2026-04-25 10:25:09
754	3713	53	3	2026-01-08 14:44:40	58117061d693c2cb5e42513d4b09b3403647d369	2026-04-25 10:25:09	2026-04-25 10:25:09
755	3556	53	3	2026-01-08 14:44:40	58117061d693c2cb5e42513d4b09b3403647d369	2026-04-25 10:25:09	2026-04-25 10:25:09
756	2822	53	3	2026-01-08 14:44:40	58117061d693c2cb5e42513d4b09b3403647d369	2026-04-25 10:25:09	2026-04-25 10:25:09
757	1607	53	3	2026-01-08 14:44:40	58117061d693c2cb5e42513d4b09b3403647d369	2026-04-25 10:25:09	2026-04-25 10:25:09
758	416	53	3	2026-01-08 14:44:40	58117061d693c2cb5e42513d4b09b3403647d369	2026-04-25 10:25:09	2026-04-25 10:25:09
759	1654	53	3	2026-01-08 14:44:40	58117061d693c2cb5e42513d4b09b3403647d369	2026-04-25 10:25:09	2026-04-25 10:25:09
760	2187	53	3	2026-01-08 14:44:40	58117061d693c2cb5e42513d4b09b3403647d369	2026-04-25 10:25:09	2026-04-25 10:25:09
761	2	92	9	2025-11-25 15:18:45	0d6d79c4cdebfca71c034fad3130a21277d4fb53	2026-04-25 10:25:09	2026-04-25 10:25:09
762	1548	92	9	2025-11-25 15:18:45	0d6d79c4cdebfca71c034fad3130a21277d4fb53	2026-04-25 10:25:09	2026-04-25 10:25:09
763	1587	92	9	2025-11-25 15:18:45	0d6d79c4cdebfca71c034fad3130a21277d4fb53	2026-04-25 10:25:09	2026-04-25 10:25:09
764	2693	92	9	2025-11-25 15:18:45	0d6d79c4cdebfca71c034fad3130a21277d4fb53	2026-04-25 10:25:09	2026-04-25 10:25:09
765	3923	92	9	2025-11-25 15:18:45	0d6d79c4cdebfca71c034fad3130a21277d4fb53	2026-04-25 10:25:09	2026-04-25 10:25:09
766	654	92	9	2025-11-25 15:18:45	0d6d79c4cdebfca71c034fad3130a21277d4fb53	2026-04-25 10:25:09	2026-04-25 10:25:09
767	3763	92	9	2025-11-25 15:18:45	0d6d79c4cdebfca71c034fad3130a21277d4fb53	2026-04-25 10:25:09	2026-04-25 10:25:09
768	2424	92	9	2025-11-25 15:18:45	0d6d79c4cdebfca71c034fad3130a21277d4fb53	2026-04-25 10:25:09	2026-04-25 10:25:09
769	3402	92	9	2025-11-25 15:18:45	0d6d79c4cdebfca71c034fad3130a21277d4fb53	2026-04-25 10:25:09	2026-04-25 10:25:09
770	615	44	9	2025-07-17 12:12:45	c3deca527a22a8c76a0ef7cb1f51329ae56f29a5	2026-04-25 10:25:09	2026-04-25 10:25:09
771	2851	44	9	2025-07-17 12:12:45	c3deca527a22a8c76a0ef7cb1f51329ae56f29a5	2026-04-25 10:25:09	2026-04-25 10:25:09
772	3005	44	9	2025-07-17 12:12:45	c3deca527a22a8c76a0ef7cb1f51329ae56f29a5	2026-04-25 10:25:09	2026-04-25 10:25:09
773	3709	20	10	2025-12-09 17:40:27	1f3d4821fa9b699ae18610bc32f0e3293082ed11	2026-04-25 10:25:09	2026-04-25 10:25:09
774	2228	31	9	2025-09-16 15:08:32	4eeb87d9ac331fe23f4488275ae9a35f3d806692	2026-04-25 10:25:09	2026-04-25 10:25:09
775	1403	31	9	2025-09-16 15:08:32	4eeb87d9ac331fe23f4488275ae9a35f3d806692	2026-04-25 10:25:09	2026-04-25 10:25:09
776	416	31	9	2025-09-16 15:08:32	4eeb87d9ac331fe23f4488275ae9a35f3d806692	2026-04-25 10:25:09	2026-04-25 10:25:09
777	161	31	9	2025-09-16 15:08:32	4eeb87d9ac331fe23f4488275ae9a35f3d806692	2026-04-25 10:25:09	2026-04-25 10:25:09
778	1967	31	9	2025-09-16 15:08:32	4eeb87d9ac331fe23f4488275ae9a35f3d806692	2026-04-25 10:25:09	2026-04-25 10:25:09
779	649	31	9	2025-09-16 15:08:32	4eeb87d9ac331fe23f4488275ae9a35f3d806692	2026-04-25 10:25:09	2026-04-25 10:25:09
780	3033	31	9	2025-09-16 15:08:32	4eeb87d9ac331fe23f4488275ae9a35f3d806692	2026-04-25 10:25:09	2026-04-25 10:25:09
781	2311	31	9	2025-09-16 15:08:32	4eeb87d9ac331fe23f4488275ae9a35f3d806692	2026-04-25 10:25:09	2026-04-25 10:25:09
782	4967	31	9	2025-09-16 15:08:32	4eeb87d9ac331fe23f4488275ae9a35f3d806692	2026-04-25 10:25:09	2026-04-25 10:25:09
783	3027	64	1	2026-01-14 09:10:52	074017fb933b86160d752386424a8716664b303f	2026-04-25 10:25:09	2026-04-25 10:25:09
784	2570	64	1	2026-01-14 09:10:52	074017fb933b86160d752386424a8716664b303f	2026-04-25 10:25:09	2026-04-25 10:25:09
785	4003	64	1	2026-01-14 09:10:52	074017fb933b86160d752386424a8716664b303f	2026-04-25 10:25:09	2026-04-25 10:25:09
786	4044	64	1	2026-01-14 09:10:52	074017fb933b86160d752386424a8716664b303f	2026-04-25 10:25:09	2026-04-25 10:25:09
787	738	64	1	2026-01-14 09:10:52	074017fb933b86160d752386424a8716664b303f	2026-04-25 10:25:09	2026-04-25 10:25:09
788	2996	64	1	2026-01-14 09:10:52	074017fb933b86160d752386424a8716664b303f	2026-04-25 10:25:09	2026-04-25 10:25:09
789	4088	64	1	2026-01-14 09:10:52	074017fb933b86160d752386424a8716664b303f	2026-04-25 10:25:09	2026-04-25 10:25:09
790	4802	64	1	2026-01-14 09:10:52	074017fb933b86160d752386424a8716664b303f	2026-04-25 10:25:09	2026-04-25 10:25:09
791	2702	64	1	2026-01-14 09:10:52	074017fb933b86160d752386424a8716664b303f	2026-04-25 10:25:09	2026-04-25 10:25:09
792	2587	43	9	2026-04-13 11:23:19	d6388880b9ddb26d71c7a92cb247e4f74e515785	2026-04-25 10:25:09	2026-04-25 10:25:09
793	2726	43	9	2026-04-13 11:23:19	d6388880b9ddb26d71c7a92cb247e4f74e515785	2026-04-25 10:25:09	2026-04-25 10:25:09
794	3512	43	9	2026-04-13 11:23:19	d6388880b9ddb26d71c7a92cb247e4f74e515785	2026-04-25 10:25:09	2026-04-25 10:25:09
795	4161	43	9	2026-04-13 11:23:19	d6388880b9ddb26d71c7a92cb247e4f74e515785	2026-04-25 10:25:09	2026-04-25 10:25:09
796	4632	43	9	2026-04-13 11:23:19	d6388880b9ddb26d71c7a92cb247e4f74e515785	2026-04-25 10:25:09	2026-04-25 10:25:09
797	3370	43	9	2026-04-13 11:23:19	d6388880b9ddb26d71c7a92cb247e4f74e515785	2026-04-25 10:25:09	2026-04-25 10:25:09
798	89	43	9	2026-04-13 11:23:19	d6388880b9ddb26d71c7a92cb247e4f74e515785	2026-04-25 10:25:09	2026-04-25 10:25:09
799	2162	43	9	2026-04-13 11:23:19	d6388880b9ddb26d71c7a92cb247e4f74e515785	2026-04-25 10:25:09	2026-04-25 10:25:09
800	3724	43	9	2026-04-13 11:23:19	d6388880b9ddb26d71c7a92cb247e4f74e515785	2026-04-25 10:25:09	2026-04-25 10:25:09
801	2875	43	9	2026-04-13 11:23:19	d6388880b9ddb26d71c7a92cb247e4f74e515785	2026-04-25 10:25:09	2026-04-25 10:25:09
802	3942	27	3	2025-12-11 11:52:43	36f45c01b1a5d86e75aca6221adffc9dda8e13b7	2026-04-25 10:25:09	2026-04-25 10:25:09
803	2210	27	3	2025-12-11 11:52:43	36f45c01b1a5d86e75aca6221adffc9dda8e13b7	2026-04-25 10:25:09	2026-04-25 10:25:09
804	4239	27	3	2025-12-11 11:52:43	36f45c01b1a5d86e75aca6221adffc9dda8e13b7	2026-04-25 10:25:09	2026-04-25 10:25:09
805	2415	27	3	2025-12-11 11:52:43	36f45c01b1a5d86e75aca6221adffc9dda8e13b7	2026-04-25 10:25:09	2026-04-25 10:25:09
806	3280	27	3	2025-12-11 11:52:43	36f45c01b1a5d86e75aca6221adffc9dda8e13b7	2026-04-25 10:25:09	2026-04-25 10:25:09
807	3952	27	3	2025-12-11 11:52:43	36f45c01b1a5d86e75aca6221adffc9dda8e13b7	2026-04-25 10:25:09	2026-04-25 10:25:09
808	3128	27	3	2025-12-11 11:52:43	36f45c01b1a5d86e75aca6221adffc9dda8e13b7	2026-04-25 10:25:09	2026-04-25 10:25:09
809	1400	27	3	2025-12-11 11:52:43	36f45c01b1a5d86e75aca6221adffc9dda8e13b7	2026-04-25 10:25:09	2026-04-25 10:25:09
810	3499	27	3	2025-12-11 11:52:43	36f45c01b1a5d86e75aca6221adffc9dda8e13b7	2026-04-25 10:25:09	2026-04-25 10:25:09
811	991	25	4	2026-01-21 11:28:28	7934fa9901425a7eb5d960fbf26c7f66bc61de3f	2026-04-25 10:25:09	2026-04-25 10:25:09
812	1214	25	4	2026-01-21 11:28:28	7934fa9901425a7eb5d960fbf26c7f66bc61de3f	2026-04-25 10:25:09	2026-04-25 10:25:09
813	3285	25	4	2026-01-21 11:28:28	7934fa9901425a7eb5d960fbf26c7f66bc61de3f	2026-04-25 10:25:09	2026-04-25 10:25:09
814	55	57	10	2026-01-26 11:38:40	3feb3bb0119d29e4ed71f277ad54904ee2fa0db5	2026-04-25 10:25:09	2026-04-25 10:25:09
815	4815	57	10	2026-01-26 11:38:40	3feb3bb0119d29e4ed71f277ad54904ee2fa0db5	2026-04-25 10:25:09	2026-04-25 10:25:09
816	883	57	10	2026-01-26 11:38:40	3feb3bb0119d29e4ed71f277ad54904ee2fa0db5	2026-04-25 10:25:09	2026-04-25 10:25:09
817	4104	57	10	2026-01-26 11:38:40	3feb3bb0119d29e4ed71f277ad54904ee2fa0db5	2026-04-25 10:25:09	2026-04-25 10:25:09
818	771	57	10	2026-01-26 11:38:40	3feb3bb0119d29e4ed71f277ad54904ee2fa0db5	2026-04-25 10:25:09	2026-04-25 10:25:09
819	2903	95	8	2025-11-21 13:34:19	81a236d338b40f72bb47be615becdd0b79a37b69	2026-04-25 10:25:09	2026-04-25 10:25:09
820	2154	95	8	2025-11-21 13:34:19	81a236d338b40f72bb47be615becdd0b79a37b69	2026-04-25 10:25:09	2026-04-25 10:25:09
821	1251	95	8	2025-11-21 13:34:19	81a236d338b40f72bb47be615becdd0b79a37b69	2026-04-25 10:25:09	2026-04-25 10:25:09
822	2091	95	8	2025-11-21 13:34:19	81a236d338b40f72bb47be615becdd0b79a37b69	2026-04-25 10:25:09	2026-04-25 10:25:09
823	1387	95	8	2025-11-21 13:34:19	81a236d338b40f72bb47be615becdd0b79a37b69	2026-04-25 10:25:09	2026-04-25 10:25:09
824	3781	95	8	2025-11-21 13:34:19	81a236d338b40f72bb47be615becdd0b79a37b69	2026-04-25 10:25:09	2026-04-25 10:25:09
825	4964	95	8	2025-11-21 13:34:19	81a236d338b40f72bb47be615becdd0b79a37b69	2026-04-25 10:25:09	2026-04-25 10:25:09
826	1339	95	8	2025-11-21 13:34:19	81a236d338b40f72bb47be615becdd0b79a37b69	2026-04-25 10:25:09	2026-04-25 10:25:09
827	4883	95	8	2025-11-21 13:34:19	81a236d338b40f72bb47be615becdd0b79a37b69	2026-04-25 10:25:09	2026-04-25 10:25:09
828	4167	95	8	2025-11-21 13:34:19	81a236d338b40f72bb47be615becdd0b79a37b69	2026-04-25 10:25:09	2026-04-25 10:25:09
829	1445	13	10	2026-02-16 15:09:30	66faf021cb1db87d8df744f150247ceed284d53f	2026-04-25 10:25:09	2026-04-25 10:25:09
830	3398	13	10	2026-02-16 15:09:30	66faf021cb1db87d8df744f150247ceed284d53f	2026-04-25 10:25:09	2026-04-25 10:25:09
831	2346	13	10	2026-02-16 15:09:30	66faf021cb1db87d8df744f150247ceed284d53f	2026-04-25 10:25:09	2026-04-25 10:25:09
832	2212	13	10	2026-02-16 15:09:30	66faf021cb1db87d8df744f150247ceed284d53f	2026-04-25 10:25:09	2026-04-25 10:25:09
833	247	90	3	2025-08-19 09:52:32	7190b0f113ceec1e3acc2b2163c887a685669dce	2026-04-25 10:25:09	2026-04-25 10:25:09
834	2306	90	3	2025-08-19 09:52:32	7190b0f113ceec1e3acc2b2163c887a685669dce	2026-04-25 10:25:09	2026-04-25 10:25:09
835	3426	90	3	2025-08-19 09:52:32	7190b0f113ceec1e3acc2b2163c887a685669dce	2026-04-25 10:25:09	2026-04-25 10:25:09
836	1164	90	3	2025-08-19 09:52:32	7190b0f113ceec1e3acc2b2163c887a685669dce	2026-04-25 10:25:09	2026-04-25 10:25:09
837	622	90	3	2025-08-19 09:52:32	7190b0f113ceec1e3acc2b2163c887a685669dce	2026-04-25 10:25:09	2026-04-25 10:25:09
838	4421	90	3	2025-08-19 09:52:32	7190b0f113ceec1e3acc2b2163c887a685669dce	2026-04-25 10:25:09	2026-04-25 10:25:09
839	685	90	3	2025-08-19 09:52:32	7190b0f113ceec1e3acc2b2163c887a685669dce	2026-04-25 10:25:09	2026-04-25 10:25:09
840	2366	3	10	2025-11-01 12:59:03	4251200ad6b48b3b11dece5832f977e24cf8e86c	2026-04-25 10:25:09	2026-04-25 10:25:09
841	4363	3	10	2025-11-01 12:59:03	4251200ad6b48b3b11dece5832f977e24cf8e86c	2026-04-25 10:25:09	2026-04-25 10:25:09
842	3178	3	10	2025-11-01 12:59:03	4251200ad6b48b3b11dece5832f977e24cf8e86c	2026-04-25 10:25:09	2026-04-25 10:25:09
843	2770	9	8	2026-03-22 10:24:59	0472df315a7d0526a7c78cb902f3a404d83db7fe	2026-04-25 10:25:09	2026-04-25 10:25:09
844	4697	9	8	2026-03-22 10:24:59	0472df315a7d0526a7c78cb902f3a404d83db7fe	2026-04-25 10:25:09	2026-04-25 10:25:09
845	3158	9	8	2026-03-22 10:24:59	0472df315a7d0526a7c78cb902f3a404d83db7fe	2026-04-25 10:25:09	2026-04-25 10:25:09
846	1613	9	8	2026-03-22 10:24:59	0472df315a7d0526a7c78cb902f3a404d83db7fe	2026-04-25 10:25:09	2026-04-25 10:25:09
847	4523	9	8	2026-03-22 10:24:59	0472df315a7d0526a7c78cb902f3a404d83db7fe	2026-04-25 10:25:09	2026-04-25 10:25:09
848	1135	9	8	2026-03-22 10:24:59	0472df315a7d0526a7c78cb902f3a404d83db7fe	2026-04-25 10:25:09	2026-04-25 10:25:09
849	532	15	2	2026-03-18 12:11:23	07ecb385a77e45237a6af9dfa3be9e79cf15a50d	2026-04-25 10:25:09	2026-04-25 10:25:09
850	2117	15	2	2026-03-18 12:11:23	07ecb385a77e45237a6af9dfa3be9e79cf15a50d	2026-04-25 10:25:09	2026-04-25 10:25:09
851	4950	15	2	2026-03-18 12:11:23	07ecb385a77e45237a6af9dfa3be9e79cf15a50d	2026-04-25 10:25:09	2026-04-25 10:25:09
852	415	28	6	2025-07-31 14:45:37	1ce3986c6f19dbae55e6f3bb4def13697d97e29c	2026-04-25 10:25:09	2026-04-25 10:25:09
853	2626	28	6	2025-07-31 14:45:37	1ce3986c6f19dbae55e6f3bb4def13697d97e29c	2026-04-25 10:25:09	2026-04-25 10:25:09
854	2822	28	6	2025-07-31 14:45:37	1ce3986c6f19dbae55e6f3bb4def13697d97e29c	2026-04-25 10:25:09	2026-04-25 10:25:09
855	4333	28	6	2025-07-31 14:45:37	1ce3986c6f19dbae55e6f3bb4def13697d97e29c	2026-04-25 10:25:09	2026-04-25 10:25:09
856	4902	28	6	2025-07-31 14:45:37	1ce3986c6f19dbae55e6f3bb4def13697d97e29c	2026-04-25 10:25:09	2026-04-25 10:25:09
857	573	28	6	2025-07-31 14:45:37	1ce3986c6f19dbae55e6f3bb4def13697d97e29c	2026-04-25 10:25:09	2026-04-25 10:25:09
858	4182	28	6	2025-07-31 14:45:37	1ce3986c6f19dbae55e6f3bb4def13697d97e29c	2026-04-25 10:25:09	2026-04-25 10:25:09
859	3859	26	10	2025-09-30 16:25:10	12ccff70cf6aab1b764612a822225a2a312700e4	2026-04-25 10:25:09	2026-04-25 10:25:09
860	327	26	10	2025-09-30 16:25:10	12ccff70cf6aab1b764612a822225a2a312700e4	2026-04-25 10:25:09	2026-04-25 10:25:09
861	3295	26	10	2025-09-30 16:25:10	12ccff70cf6aab1b764612a822225a2a312700e4	2026-04-25 10:25:09	2026-04-25 10:25:09
862	309	26	10	2025-09-30 16:25:10	12ccff70cf6aab1b764612a822225a2a312700e4	2026-04-25 10:25:09	2026-04-25 10:25:09
863	4692	55	3	2025-10-12 17:50:52	49b7bd9462416c561f3371f81285fb26afa3d711	2026-04-25 10:25:09	2026-04-25 10:25:09
864	2296	55	3	2025-10-12 17:50:52	49b7bd9462416c561f3371f81285fb26afa3d711	2026-04-25 10:25:09	2026-04-25 10:25:09
865	2862	55	3	2025-10-12 17:50:52	49b7bd9462416c561f3371f81285fb26afa3d711	2026-04-25 10:25:09	2026-04-25 10:25:09
866	1771	55	3	2025-10-12 17:50:52	49b7bd9462416c561f3371f81285fb26afa3d711	2026-04-25 10:25:09	2026-04-25 10:25:09
867	1545	33	10	2025-11-10 17:18:57	eaa1dbd8eb462a26120b28eefe2c5e57960ed41e	2026-04-25 10:25:09	2026-04-25 10:25:09
868	2724	33	10	2025-11-10 17:18:57	eaa1dbd8eb462a26120b28eefe2c5e57960ed41e	2026-04-25 10:25:09	2026-04-25 10:25:09
869	409	33	10	2025-11-10 17:18:57	eaa1dbd8eb462a26120b28eefe2c5e57960ed41e	2026-04-25 10:25:09	2026-04-25 10:25:09
870	944	33	10	2025-11-10 17:18:57	eaa1dbd8eb462a26120b28eefe2c5e57960ed41e	2026-04-25 10:25:09	2026-04-25 10:25:09
871	103	33	10	2025-11-10 17:18:57	eaa1dbd8eb462a26120b28eefe2c5e57960ed41e	2026-04-25 10:25:09	2026-04-25 10:25:09
872	4311	33	10	2025-11-10 17:18:57	eaa1dbd8eb462a26120b28eefe2c5e57960ed41e	2026-04-25 10:25:09	2026-04-25 10:25:09
873	2219	33	10	2025-11-10 17:18:57	eaa1dbd8eb462a26120b28eefe2c5e57960ed41e	2026-04-25 10:25:09	2026-04-25 10:25:09
874	316	33	10	2025-11-10 17:18:57	eaa1dbd8eb462a26120b28eefe2c5e57960ed41e	2026-04-25 10:25:09	2026-04-25 10:25:09
875	4966	29	3	2026-03-19 16:56:37	25b78c766c1810854ad70313700f03c7819ca078	2026-04-25 10:25:09	2026-04-25 10:25:09
876	4323	29	3	2026-03-19 16:56:37	25b78c766c1810854ad70313700f03c7819ca078	2026-04-25 10:25:09	2026-04-25 10:25:09
877	3065	29	3	2026-03-19 16:56:37	25b78c766c1810854ad70313700f03c7819ca078	2026-04-25 10:25:09	2026-04-25 10:25:09
878	2230	29	3	2026-03-19 16:56:37	25b78c766c1810854ad70313700f03c7819ca078	2026-04-25 10:25:09	2026-04-25 10:25:09
879	4623	29	3	2026-03-19 16:56:37	25b78c766c1810854ad70313700f03c7819ca078	2026-04-25 10:25:09	2026-04-25 10:25:09
880	3288	29	3	2026-03-19 16:56:37	25b78c766c1810854ad70313700f03c7819ca078	2026-04-25 10:25:09	2026-04-25 10:25:09
881	1887	4	4	2025-11-06 16:35:11	d10da3ada0c2eaf7fe781e0401ebeda8a4d63bf4	2026-04-25 10:25:09	2026-04-25 10:25:09
882	2899	4	4	2025-11-06 16:35:11	d10da3ada0c2eaf7fe781e0401ebeda8a4d63bf4	2026-04-25 10:25:09	2026-04-25 10:25:09
883	4162	4	4	2025-11-06 16:35:11	d10da3ada0c2eaf7fe781e0401ebeda8a4d63bf4	2026-04-25 10:25:09	2026-04-25 10:25:09
884	136	4	4	2025-11-06 16:35:11	d10da3ada0c2eaf7fe781e0401ebeda8a4d63bf4	2026-04-25 10:25:09	2026-04-25 10:25:09
885	3900	4	4	2025-11-06 16:35:11	d10da3ada0c2eaf7fe781e0401ebeda8a4d63bf4	2026-04-25 10:25:09	2026-04-25 10:25:09
886	3051	4	4	2025-11-06 16:35:11	d10da3ada0c2eaf7fe781e0401ebeda8a4d63bf4	2026-04-25 10:25:09	2026-04-25 10:25:09
887	14	4	4	2025-11-06 16:35:11	d10da3ada0c2eaf7fe781e0401ebeda8a4d63bf4	2026-04-25 10:25:09	2026-04-25 10:25:09
888	724	4	4	2025-11-06 16:35:11	d10da3ada0c2eaf7fe781e0401ebeda8a4d63bf4	2026-04-25 10:25:09	2026-04-25 10:25:09
889	4249	4	4	2025-11-06 16:35:11	d10da3ada0c2eaf7fe781e0401ebeda8a4d63bf4	2026-04-25 10:25:09	2026-04-25 10:25:09
890	2602	86	8	2026-02-03 09:27:20	c1c9e2c740cba5f96548bfa4d75f2c899dbc140d	2026-04-25 10:25:09	2026-04-25 10:25:09
891	4787	86	8	2026-02-03 09:27:20	c1c9e2c740cba5f96548bfa4d75f2c899dbc140d	2026-04-25 10:25:09	2026-04-25 10:25:09
892	2092	86	8	2026-02-03 09:27:20	c1c9e2c740cba5f96548bfa4d75f2c899dbc140d	2026-04-25 10:25:09	2026-04-25 10:25:09
893	2107	86	8	2026-02-03 09:27:20	c1c9e2c740cba5f96548bfa4d75f2c899dbc140d	2026-04-25 10:25:09	2026-04-25 10:25:09
894	1238	86	8	2026-02-03 09:27:20	c1c9e2c740cba5f96548bfa4d75f2c899dbc140d	2026-04-25 10:25:09	2026-04-25 10:25:09
895	3654	86	8	2026-02-03 09:27:20	c1c9e2c740cba5f96548bfa4d75f2c899dbc140d	2026-04-25 10:25:09	2026-04-25 10:25:09
896	2225	86	8	2026-02-03 09:27:20	c1c9e2c740cba5f96548bfa4d75f2c899dbc140d	2026-04-25 10:25:09	2026-04-25 10:25:09
897	4923	86	8	2026-02-03 09:27:20	c1c9e2c740cba5f96548bfa4d75f2c899dbc140d	2026-04-25 10:25:09	2026-04-25 10:25:09
898	1077	86	8	2026-02-03 09:27:20	c1c9e2c740cba5f96548bfa4d75f2c899dbc140d	2026-04-25 10:25:09	2026-04-25 10:25:09
899	2927	52	9	2025-07-26 13:09:05	fa33061ae51a8e88641526d5e92f152fba8f6bc8	2026-04-25 10:25:09	2026-04-25 10:25:09
900	596	52	9	2025-07-26 13:09:05	fa33061ae51a8e88641526d5e92f152fba8f6bc8	2026-04-25 10:25:09	2026-04-25 10:25:09
901	2712	52	9	2025-07-26 13:09:05	fa33061ae51a8e88641526d5e92f152fba8f6bc8	2026-04-25 10:25:09	2026-04-25 10:25:09
902	4243	52	9	2025-07-26 13:09:05	fa33061ae51a8e88641526d5e92f152fba8f6bc8	2026-04-25 10:25:09	2026-04-25 10:25:09
903	1834	52	9	2025-07-26 13:09:05	fa33061ae51a8e88641526d5e92f152fba8f6bc8	2026-04-25 10:25:09	2026-04-25 10:25:09
904	1515	52	9	2025-07-26 13:09:05	fa33061ae51a8e88641526d5e92f152fba8f6bc8	2026-04-25 10:25:09	2026-04-25 10:25:09
905	4411	52	9	2025-07-26 13:09:05	fa33061ae51a8e88641526d5e92f152fba8f6bc8	2026-04-25 10:25:09	2026-04-25 10:25:09
906	4900	84	7	2025-07-22 11:37:11	2c973fc41c2e03dd5e8892d1debf5d030121e3e2	2026-04-25 10:25:09	2026-04-25 10:25:09
907	503	84	7	2025-07-22 11:37:11	2c973fc41c2e03dd5e8892d1debf5d030121e3e2	2026-04-25 10:25:09	2026-04-25 10:25:09
908	1805	84	7	2025-07-22 11:37:11	2c973fc41c2e03dd5e8892d1debf5d030121e3e2	2026-04-25 10:25:09	2026-04-25 10:25:09
909	1152	23	9	2025-12-03 12:35:36	e668d9e84991d47861671bfac290679bb00e8099	2026-04-25 10:25:09	2026-04-25 10:25:09
910	1838	28	9	2026-02-26 14:24:53	29c2fd41a830cd3268fa2bbacd0b04a15f276172	2026-04-25 10:25:09	2026-04-25 10:25:09
911	3167	28	9	2026-02-26 14:24:53	29c2fd41a830cd3268fa2bbacd0b04a15f276172	2026-04-25 10:25:09	2026-04-25 10:25:09
912	2838	28	9	2026-02-26 14:24:53	29c2fd41a830cd3268fa2bbacd0b04a15f276172	2026-04-25 10:25:09	2026-04-25 10:25:09
913	4694	84	6	2025-11-21 11:07:46	34430527e7c4ffa29d7782a8a2daa492c81731f1	2026-04-25 10:25:09	2026-04-25 10:25:09
914	4338	93	8	2025-09-25 13:07:30	bc386d5e36eedb0a9e3b8ec4a713df722a76960c	2026-04-25 10:25:09	2026-04-25 10:25:09
915	4162	93	8	2025-09-25 13:07:30	bc386d5e36eedb0a9e3b8ec4a713df722a76960c	2026-04-25 10:25:09	2026-04-25 10:25:09
916	1762	93	8	2025-09-25 13:07:30	bc386d5e36eedb0a9e3b8ec4a713df722a76960c	2026-04-25 10:25:09	2026-04-25 10:25:09
917	4155	93	8	2025-09-25 13:07:30	bc386d5e36eedb0a9e3b8ec4a713df722a76960c	2026-04-25 10:25:09	2026-04-25 10:25:09
918	3624	93	8	2025-09-25 13:07:30	bc386d5e36eedb0a9e3b8ec4a713df722a76960c	2026-04-25 10:25:09	2026-04-25 10:25:09
919	1333	93	8	2025-09-25 13:07:30	bc386d5e36eedb0a9e3b8ec4a713df722a76960c	2026-04-25 10:25:09	2026-04-25 10:25:09
920	1424	93	8	2025-09-25 13:07:30	bc386d5e36eedb0a9e3b8ec4a713df722a76960c	2026-04-25 10:25:09	2026-04-25 10:25:09
921	1764	51	10	2025-06-20 16:55:55	f0243a41e715b7b242f99017f01efa036dec9347	2026-04-25 10:25:09	2026-04-25 10:25:09
922	1117	51	10	2025-06-20 16:55:55	f0243a41e715b7b242f99017f01efa036dec9347	2026-04-25 10:25:09	2026-04-25 10:25:09
923	4886	13	3	2026-02-03 12:37:36	c00b0f7b846af1b0635ea5588aa9f81a83e1cb9f	2026-04-25 10:25:09	2026-04-25 10:25:09
924	1798	13	3	2026-02-03 12:37:36	c00b0f7b846af1b0635ea5588aa9f81a83e1cb9f	2026-04-25 10:25:09	2026-04-25 10:25:09
925	4955	13	3	2026-02-03 12:37:36	c00b0f7b846af1b0635ea5588aa9f81a83e1cb9f	2026-04-25 10:25:09	2026-04-25 10:25:09
926	3158	13	3	2026-02-03 12:37:36	c00b0f7b846af1b0635ea5588aa9f81a83e1cb9f	2026-04-25 10:25:09	2026-04-25 10:25:09
927	2853	13	3	2026-02-03 12:37:36	c00b0f7b846af1b0635ea5588aa9f81a83e1cb9f	2026-04-25 10:25:09	2026-04-25 10:25:09
928	312	13	3	2026-02-03 12:37:36	c00b0f7b846af1b0635ea5588aa9f81a83e1cb9f	2026-04-25 10:25:09	2026-04-25 10:25:09
929	463	13	3	2026-02-03 12:37:36	c00b0f7b846af1b0635ea5588aa9f81a83e1cb9f	2026-04-25 10:25:09	2026-04-25 10:25:09
930	2184	13	3	2026-02-03 12:37:36	c00b0f7b846af1b0635ea5588aa9f81a83e1cb9f	2026-04-25 10:25:09	2026-04-25 10:25:09
931	4724	13	3	2026-02-03 12:37:36	c00b0f7b846af1b0635ea5588aa9f81a83e1cb9f	2026-04-25 10:25:09	2026-04-25 10:25:09
932	927	13	3	2026-02-03 12:37:36	c00b0f7b846af1b0635ea5588aa9f81a83e1cb9f	2026-04-25 10:25:09	2026-04-25 10:25:09
933	4810	68	10	2025-12-10 10:11:19	586ec977c5caa3562e3973fca4a0c71df0622582	2026-04-25 10:25:09	2026-04-25 10:25:09
934	715	68	10	2025-12-10 10:11:19	586ec977c5caa3562e3973fca4a0c71df0622582	2026-04-25 10:25:09	2026-04-25 10:25:09
935	3822	68	10	2025-12-10 10:11:19	586ec977c5caa3562e3973fca4a0c71df0622582	2026-04-25 10:25:09	2026-04-25 10:25:09
936	1904	68	10	2025-12-10 10:11:19	586ec977c5caa3562e3973fca4a0c71df0622582	2026-04-25 10:25:09	2026-04-25 10:25:09
937	2683	14	9	2025-08-16 09:26:59	ba55f130241298d6605b747e340eed126931b327	2026-04-25 10:25:09	2026-04-25 10:25:09
938	242	14	9	2025-08-16 09:26:59	ba55f130241298d6605b747e340eed126931b327	2026-04-25 10:25:09	2026-04-25 10:25:09
939	2537	14	9	2025-08-16 09:26:59	ba55f130241298d6605b747e340eed126931b327	2026-04-25 10:25:09	2026-04-25 10:25:09
940	268	14	9	2025-08-16 09:26:59	ba55f130241298d6605b747e340eed126931b327	2026-04-25 10:25:09	2026-04-25 10:25:09
941	2918	14	9	2025-08-16 09:26:59	ba55f130241298d6605b747e340eed126931b327	2026-04-25 10:25:09	2026-04-25 10:25:09
942	1829	14	9	2025-08-16 09:26:59	ba55f130241298d6605b747e340eed126931b327	2026-04-25 10:25:09	2026-04-25 10:25:09
943	3161	14	9	2025-08-16 09:26:59	ba55f130241298d6605b747e340eed126931b327	2026-04-25 10:25:09	2026-04-25 10:25:09
944	613	14	9	2025-08-16 09:26:59	ba55f130241298d6605b747e340eed126931b327	2026-04-25 10:25:09	2026-04-25 10:25:09
945	1412	50	3	2025-04-30 12:16:04	6bc8e28f16685ee366dfde1c322ce92e4e8fe49b	2026-04-25 10:25:09	2026-04-25 10:25:09
946	4252	50	3	2025-04-30 12:16:04	6bc8e28f16685ee366dfde1c322ce92e4e8fe49b	2026-04-25 10:25:09	2026-04-25 10:25:09
947	2646	50	3	2025-04-30 12:16:04	6bc8e28f16685ee366dfde1c322ce92e4e8fe49b	2026-04-25 10:25:09	2026-04-25 10:25:09
948	526	50	3	2025-04-30 12:16:04	6bc8e28f16685ee366dfde1c322ce92e4e8fe49b	2026-04-25 10:25:09	2026-04-25 10:25:09
949	871	50	3	2025-04-30 12:16:04	6bc8e28f16685ee366dfde1c322ce92e4e8fe49b	2026-04-25 10:25:09	2026-04-25 10:25:09
950	4881	50	3	2025-04-30 12:16:04	6bc8e28f16685ee366dfde1c322ce92e4e8fe49b	2026-04-25 10:25:09	2026-04-25 10:25:09
951	1694	50	3	2025-04-30 12:16:04	6bc8e28f16685ee366dfde1c322ce92e4e8fe49b	2026-04-25 10:25:09	2026-04-25 10:25:09
952	3099	50	3	2025-04-30 12:16:04	6bc8e28f16685ee366dfde1c322ce92e4e8fe49b	2026-04-25 10:25:09	2026-04-25 10:25:09
953	412	50	3	2025-04-30 12:16:04	6bc8e28f16685ee366dfde1c322ce92e4e8fe49b	2026-04-25 10:25:09	2026-04-25 10:25:09
954	3594	50	3	2025-04-30 12:16:04	6bc8e28f16685ee366dfde1c322ce92e4e8fe49b	2026-04-25 10:25:09	2026-04-25 10:25:09
955	3999	99	10	2025-07-22 12:07:50	09d3f899a9ff9edd74b35cc3ce806f9550e5874e	2026-04-25 10:25:09	2026-04-25 10:25:09
956	117	99	10	2025-07-22 12:07:50	09d3f899a9ff9edd74b35cc3ce806f9550e5874e	2026-04-25 10:25:09	2026-04-25 10:25:09
957	2866	99	10	2025-07-22 12:07:50	09d3f899a9ff9edd74b35cc3ce806f9550e5874e	2026-04-25 10:25:09	2026-04-25 10:25:09
958	544	59	9	2026-01-30 16:38:41	4d440fcb78e1cf5413b6ea5831599b5b84567c1a	2026-04-25 10:25:09	2026-04-25 10:25:09
959	159	59	9	2026-01-30 16:38:41	4d440fcb78e1cf5413b6ea5831599b5b84567c1a	2026-04-25 10:25:09	2026-04-25 10:25:09
960	831	59	9	2026-01-30 16:38:41	4d440fcb78e1cf5413b6ea5831599b5b84567c1a	2026-04-25 10:25:09	2026-04-25 10:25:09
961	3432	59	9	2026-01-30 16:38:41	4d440fcb78e1cf5413b6ea5831599b5b84567c1a	2026-04-25 10:25:09	2026-04-25 10:25:09
962	2832	99	9	2025-10-18 17:59:19	1de973bd87a50fceca40e73d7782c0b75d1b8653	2026-04-25 10:25:09	2026-04-25 10:25:09
963	4680	99	9	2025-10-18 17:59:19	1de973bd87a50fceca40e73d7782c0b75d1b8653	2026-04-25 10:25:09	2026-04-25 10:25:09
964	537	99	9	2025-10-18 17:59:19	1de973bd87a50fceca40e73d7782c0b75d1b8653	2026-04-25 10:25:09	2026-04-25 10:25:09
965	3479	99	9	2025-10-18 17:59:19	1de973bd87a50fceca40e73d7782c0b75d1b8653	2026-04-25 10:25:09	2026-04-25 10:25:09
966	1168	99	9	2025-10-18 17:59:19	1de973bd87a50fceca40e73d7782c0b75d1b8653	2026-04-25 10:25:09	2026-04-25 10:25:09
967	1547	99	9	2025-10-18 17:59:19	1de973bd87a50fceca40e73d7782c0b75d1b8653	2026-04-25 10:25:09	2026-04-25 10:25:09
968	4028	42	1	2025-11-30 13:34:29	8b9abbe031d61b06164e0e502dd74aff2d6fe94d	2026-04-25 10:25:09	2026-04-25 10:25:09
969	2919	42	1	2025-11-30 13:34:29	8b9abbe031d61b06164e0e502dd74aff2d6fe94d	2026-04-25 10:25:09	2026-04-25 10:25:09
970	3806	85	2	2026-04-23 14:57:25	a7f77d4d9913f205b51f11ce9704b81ca45490b2	2026-04-25 10:25:09	2026-04-25 10:25:09
971	715	85	2	2026-04-23 14:57:25	a7f77d4d9913f205b51f11ce9704b81ca45490b2	2026-04-25 10:25:09	2026-04-25 10:25:09
972	4726	85	2	2026-04-23 14:57:25	a7f77d4d9913f205b51f11ce9704b81ca45490b2	2026-04-25 10:25:09	2026-04-25 10:25:09
973	1129	85	2	2026-04-23 14:57:25	a7f77d4d9913f205b51f11ce9704b81ca45490b2	2026-04-25 10:25:09	2026-04-25 10:25:09
974	236	85	2	2026-04-23 14:57:25	a7f77d4d9913f205b51f11ce9704b81ca45490b2	2026-04-25 10:25:09	2026-04-25 10:25:09
975	1822	85	2	2026-04-23 14:57:25	a7f77d4d9913f205b51f11ce9704b81ca45490b2	2026-04-25 10:25:09	2026-04-25 10:25:09
976	29	85	2	2026-04-23 14:57:25	a7f77d4d9913f205b51f11ce9704b81ca45490b2	2026-04-25 10:25:09	2026-04-25 10:25:09
977	3447	25	3	2026-02-16 10:04:30	bfda5b7a68f2f83c0d5203d1513ddab1d1969dfa	2026-04-25 10:25:09	2026-04-25 10:25:09
978	3972	25	3	2026-02-16 10:04:30	bfda5b7a68f2f83c0d5203d1513ddab1d1969dfa	2026-04-25 10:25:09	2026-04-25 10:25:09
979	1115	25	3	2026-02-16 10:04:30	bfda5b7a68f2f83c0d5203d1513ddab1d1969dfa	2026-04-25 10:25:09	2026-04-25 10:25:09
980	4690	25	3	2026-02-16 10:04:30	bfda5b7a68f2f83c0d5203d1513ddab1d1969dfa	2026-04-25 10:25:09	2026-04-25 10:25:09
981	2494	25	3	2026-02-16 10:04:30	bfda5b7a68f2f83c0d5203d1513ddab1d1969dfa	2026-04-25 10:25:09	2026-04-25 10:25:09
982	4708	25	3	2026-02-16 10:04:30	bfda5b7a68f2f83c0d5203d1513ddab1d1969dfa	2026-04-25 10:25:09	2026-04-25 10:25:09
983	2890	25	3	2026-02-16 10:04:30	bfda5b7a68f2f83c0d5203d1513ddab1d1969dfa	2026-04-25 10:25:09	2026-04-25 10:25:09
984	3586	48	6	2026-03-24 15:20:11	3a89f2519418e1544b43c5e25216120c8118e407	2026-04-25 10:25:09	2026-04-25 10:25:09
985	496	48	6	2026-03-24 15:20:11	3a89f2519418e1544b43c5e25216120c8118e407	2026-04-25 10:25:09	2026-04-25 10:25:09
986	3446	48	6	2026-03-24 15:20:11	3a89f2519418e1544b43c5e25216120c8118e407	2026-04-25 10:25:09	2026-04-25 10:25:09
987	4157	48	6	2026-03-24 15:20:11	3a89f2519418e1544b43c5e25216120c8118e407	2026-04-25 10:25:09	2026-04-25 10:25:09
988	959	48	6	2026-03-24 15:20:11	3a89f2519418e1544b43c5e25216120c8118e407	2026-04-25 10:25:09	2026-04-25 10:25:09
989	486	42	7	2025-06-25 13:32:03	dd3628c796f2204681b11aaf4422bd446b4ee018	2026-04-25 10:25:09	2026-04-25 10:25:09
990	342	42	7	2025-06-25 13:32:03	dd3628c796f2204681b11aaf4422bd446b4ee018	2026-04-25 10:25:09	2026-04-25 10:25:09
991	93	85	9	2025-11-22 14:04:17	4094fd038852360a42f8fc8bc8dd1439022dc561	2026-04-25 10:25:09	2026-04-25 10:25:09
992	768	85	9	2025-11-22 14:04:17	4094fd038852360a42f8fc8bc8dd1439022dc561	2026-04-25 10:25:09	2026-04-25 10:25:09
993	1666	85	9	2025-11-22 14:04:17	4094fd038852360a42f8fc8bc8dd1439022dc561	2026-04-25 10:25:09	2026-04-25 10:25:09
994	2409	85	9	2025-11-22 14:04:17	4094fd038852360a42f8fc8bc8dd1439022dc561	2026-04-25 10:25:09	2026-04-25 10:25:09
995	1547	85	9	2025-11-22 14:04:17	4094fd038852360a42f8fc8bc8dd1439022dc561	2026-04-25 10:25:09	2026-04-25 10:25:09
996	2699	85	9	2025-11-22 14:04:17	4094fd038852360a42f8fc8bc8dd1439022dc561	2026-04-25 10:25:09	2026-04-25 10:25:09
997	1550	85	9	2025-11-22 14:04:17	4094fd038852360a42f8fc8bc8dd1439022dc561	2026-04-25 10:25:09	2026-04-25 10:25:09
998	1568	85	9	2025-11-22 14:04:17	4094fd038852360a42f8fc8bc8dd1439022dc561	2026-04-25 10:25:09	2026-04-25 10:25:09
999	3048	85	6	2025-08-26 11:43:43	bd0f6df2ffb9d8a055f076744168fd13d627a808	2026-04-25 10:25:09	2026-04-25 10:25:09
1000	245	85	6	2025-08-26 11:43:43	bd0f6df2ffb9d8a055f076744168fd13d627a808	2026-04-25 10:25:09	2026-04-25 10:25:09
1001	753	85	6	2025-08-26 11:43:43	bd0f6df2ffb9d8a055f076744168fd13d627a808	2026-04-25 10:25:09	2026-04-25 10:25:09
1002	324	85	6	2025-08-26 11:43:43	bd0f6df2ffb9d8a055f076744168fd13d627a808	2026-04-25 10:25:09	2026-04-25 10:25:09
1003	68	85	6	2025-08-26 11:43:43	bd0f6df2ffb9d8a055f076744168fd13d627a808	2026-04-25 10:25:09	2026-04-25 10:25:09
1004	1063	85	6	2025-08-26 11:43:43	bd0f6df2ffb9d8a055f076744168fd13d627a808	2026-04-25 10:25:09	2026-04-25 10:25:09
1005	4182	85	6	2025-08-26 11:43:43	bd0f6df2ffb9d8a055f076744168fd13d627a808	2026-04-25 10:25:09	2026-04-25 10:25:09
1006	4015	53	5	2026-02-01 11:56:57	d08f5770cd36b3488022d93d4f51785232159781	2026-04-25 10:25:09	2026-04-25 10:25:09
1007	3745	53	5	2026-02-01 11:56:57	d08f5770cd36b3488022d93d4f51785232159781	2026-04-25 10:25:09	2026-04-25 10:25:09
1008	790	53	5	2026-02-01 11:56:57	d08f5770cd36b3488022d93d4f51785232159781	2026-04-25 10:25:09	2026-04-25 10:25:09
1009	4214	53	5	2026-02-01 11:56:57	d08f5770cd36b3488022d93d4f51785232159781	2026-04-25 10:25:09	2026-04-25 10:25:09
1010	4060	53	5	2026-02-01 11:56:57	d08f5770cd36b3488022d93d4f51785232159781	2026-04-25 10:25:09	2026-04-25 10:25:09
1011	2652	53	5	2026-02-01 11:56:57	d08f5770cd36b3488022d93d4f51785232159781	2026-04-25 10:25:09	2026-04-25 10:25:09
1012	1483	53	5	2026-02-01 11:56:57	d08f5770cd36b3488022d93d4f51785232159781	2026-04-25 10:25:09	2026-04-25 10:25:09
1013	418	53	5	2026-02-01 11:56:57	d08f5770cd36b3488022d93d4f51785232159781	2026-04-25 10:25:09	2026-04-25 10:25:09
1014	4309	53	5	2026-02-01 11:56:57	d08f5770cd36b3488022d93d4f51785232159781	2026-04-25 10:25:09	2026-04-25 10:25:09
1015	4713	53	5	2026-02-01 11:56:57	d08f5770cd36b3488022d93d4f51785232159781	2026-04-25 10:25:09	2026-04-25 10:25:09
1016	179	88	7	2025-05-11 13:09:58	e866a3ec39ec7205796fdfafbb3e0e116c6d837c	2026-04-25 10:25:09	2026-04-25 10:25:09
1017	3918	88	7	2025-05-11 13:09:58	e866a3ec39ec7205796fdfafbb3e0e116c6d837c	2026-04-25 10:25:09	2026-04-25 10:25:09
1018	3194	88	7	2025-05-11 13:09:58	e866a3ec39ec7205796fdfafbb3e0e116c6d837c	2026-04-25 10:25:09	2026-04-25 10:25:09
1019	1542	88	7	2025-05-11 13:09:58	e866a3ec39ec7205796fdfafbb3e0e116c6d837c	2026-04-25 10:25:09	2026-04-25 10:25:09
1020	4501	88	7	2025-05-11 13:09:58	e866a3ec39ec7205796fdfafbb3e0e116c6d837c	2026-04-25 10:25:09	2026-04-25 10:25:09
1021	2341	88	7	2025-05-11 13:09:58	e866a3ec39ec7205796fdfafbb3e0e116c6d837c	2026-04-25 10:25:09	2026-04-25 10:25:09
1022	3709	88	7	2025-05-11 13:09:58	e866a3ec39ec7205796fdfafbb3e0e116c6d837c	2026-04-25 10:25:09	2026-04-25 10:25:09
1023	1503	31	3	2026-01-12 17:10:18	6c72866fe04ed6e4046f0692906d693693cb15af	2026-04-25 10:25:09	2026-04-25 10:25:09
1024	4008	31	3	2026-01-12 17:10:18	6c72866fe04ed6e4046f0692906d693693cb15af	2026-04-25 10:25:09	2026-04-25 10:25:09
1025	882	31	3	2026-01-12 17:10:18	6c72866fe04ed6e4046f0692906d693693cb15af	2026-04-25 10:25:09	2026-04-25 10:25:09
1026	3591	33	8	2026-03-21 12:49:49	20388f38844a45b7b5f4647184befcd4d11d708b	2026-04-25 10:25:09	2026-04-25 10:25:09
1027	938	33	8	2026-03-21 12:49:49	20388f38844a45b7b5f4647184befcd4d11d708b	2026-04-25 10:25:09	2026-04-25 10:25:09
1028	2404	33	8	2026-03-21 12:49:49	20388f38844a45b7b5f4647184befcd4d11d708b	2026-04-25 10:25:09	2026-04-25 10:25:09
1029	2038	37	3	2025-08-19 16:33:16	205ab936a302325a0defb9a566979fb96649abc1	2026-04-25 10:25:09	2026-04-25 10:25:09
1030	2468	37	3	2025-08-19 16:33:16	205ab936a302325a0defb9a566979fb96649abc1	2026-04-25 10:25:09	2026-04-25 10:25:09
1031	3661	37	3	2025-08-19 16:33:16	205ab936a302325a0defb9a566979fb96649abc1	2026-04-25 10:25:09	2026-04-25 10:25:09
1032	3081	37	3	2025-08-19 16:33:16	205ab936a302325a0defb9a566979fb96649abc1	2026-04-25 10:25:09	2026-04-25 10:25:09
1033	2224	72	9	2025-07-17 09:22:29	7fe6bd0150726e4e20cdd857e31606df72749311	2026-04-25 10:25:09	2026-04-25 10:25:09
1034	3693	72	9	2025-07-17 09:22:29	7fe6bd0150726e4e20cdd857e31606df72749311	2026-04-25 10:25:09	2026-04-25 10:25:09
1035	3	72	9	2025-07-17 09:22:29	7fe6bd0150726e4e20cdd857e31606df72749311	2026-04-25 10:25:09	2026-04-25 10:25:09
1036	3692	41	7	2025-10-04 14:04:14	3bb08d36ffd6a5086d43502c5763872cce61c62b	2026-04-25 10:25:09	2026-04-25 10:25:09
1037	187	41	7	2025-10-04 14:04:14	3bb08d36ffd6a5086d43502c5763872cce61c62b	2026-04-25 10:25:09	2026-04-25 10:25:09
1038	4184	79	9	2025-05-03 16:47:46	24b6d7d4b4a595d9689d7573d08e838c67929a82	2026-04-25 10:25:09	2026-04-25 10:25:09
1039	702	73	2	2025-09-17 09:20:45	534831276c113847654e46660f10a5a35c484b24	2026-04-25 10:25:09	2026-04-25 10:25:09
1040	3207	31	7	2025-12-31 16:13:28	717c86f37d15baf21eea4b4c2c87d0742dc6460d	2026-04-25 10:25:09	2026-04-25 10:25:09
1041	4188	13	9	2026-04-05 17:13:35	08a07a5621e6cf4cce1ef3ebc9de8a043e5d2bc5	2026-04-25 10:25:09	2026-04-25 10:25:09
1042	1494	24	3	2026-01-18 14:46:11	74b0d5ed2d4cba162922c9d0c704fae863b324a8	2026-04-25 10:25:09	2026-04-25 10:25:09
1043	3762	24	3	2026-01-18 14:46:11	74b0d5ed2d4cba162922c9d0c704fae863b324a8	2026-04-25 10:25:09	2026-04-25 10:25:09
1044	3652	24	3	2026-01-18 14:46:11	74b0d5ed2d4cba162922c9d0c704fae863b324a8	2026-04-25 10:25:09	2026-04-25 10:25:09
1045	1102	24	3	2026-01-18 14:46:11	74b0d5ed2d4cba162922c9d0c704fae863b324a8	2026-04-25 10:25:09	2026-04-25 10:25:09
1046	2024	24	3	2026-01-18 14:46:11	74b0d5ed2d4cba162922c9d0c704fae863b324a8	2026-04-25 10:25:09	2026-04-25 10:25:09
1047	3420	90	3	2025-12-02 15:38:23	c4e5215145f7fff75ce5d239ebe60c9d625abdac	2026-04-25 10:25:09	2026-04-25 10:25:09
1048	402	90	3	2025-12-02 15:38:23	c4e5215145f7fff75ce5d239ebe60c9d625abdac	2026-04-25 10:25:09	2026-04-25 10:25:09
1049	3043	90	3	2025-12-02 15:38:23	c4e5215145f7fff75ce5d239ebe60c9d625abdac	2026-04-25 10:25:09	2026-04-25 10:25:09
1050	1048	90	3	2025-12-02 15:38:23	c4e5215145f7fff75ce5d239ebe60c9d625abdac	2026-04-25 10:25:09	2026-04-25 10:25:09
1051	574	99	7	2025-09-02 09:22:29	bc7d79b862600fe2957f79d14afd500305e2244e	2026-04-25 10:25:09	2026-04-25 10:25:09
1052	2417	99	7	2025-09-02 09:22:29	bc7d79b862600fe2957f79d14afd500305e2244e	2026-04-25 10:25:09	2026-04-25 10:25:09
1053	1163	99	7	2025-09-02 09:22:29	bc7d79b862600fe2957f79d14afd500305e2244e	2026-04-25 10:25:09	2026-04-25 10:25:09
1054	4408	99	7	2025-09-02 09:22:29	bc7d79b862600fe2957f79d14afd500305e2244e	2026-04-25 10:25:09	2026-04-25 10:25:09
1055	3877	6	3	2025-06-23 15:26:25	37a2c3e9fede8032511fb8a3b74e43d9281d21c2	2026-04-25 10:25:09	2026-04-25 10:25:09
1056	3177	6	3	2025-06-23 15:26:25	37a2c3e9fede8032511fb8a3b74e43d9281d21c2	2026-04-25 10:25:09	2026-04-25 10:25:09
1057	545	6	3	2025-06-23 15:26:25	37a2c3e9fede8032511fb8a3b74e43d9281d21c2	2026-04-25 10:25:09	2026-04-25 10:25:09
1058	1493	6	3	2025-06-23 15:26:25	37a2c3e9fede8032511fb8a3b74e43d9281d21c2	2026-04-25 10:25:09	2026-04-25 10:25:09
1059	4573	6	3	2025-06-23 15:26:25	37a2c3e9fede8032511fb8a3b74e43d9281d21c2	2026-04-25 10:25:09	2026-04-25 10:25:09
1060	4147	6	3	2025-06-23 15:26:25	37a2c3e9fede8032511fb8a3b74e43d9281d21c2	2026-04-25 10:25:09	2026-04-25 10:25:09
1061	188	6	3	2025-06-23 15:26:25	37a2c3e9fede8032511fb8a3b74e43d9281d21c2	2026-04-25 10:25:09	2026-04-25 10:25:09
1062	1056	27	10	2025-08-01 09:56:34	4c6486ec636192d6755cdf60111c01c076c47d54	2026-04-25 10:25:09	2026-04-25 10:25:09
1063	2734	37	9	2025-12-19 17:34:44	906666ed5bf6146d79981b98a931c712437186bb	2026-04-25 10:25:09	2026-04-25 10:25:09
1064	1951	37	9	2025-12-19 17:34:44	906666ed5bf6146d79981b98a931c712437186bb	2026-04-25 10:25:09	2026-04-25 10:25:09
1065	4715	37	9	2025-12-19 17:34:44	906666ed5bf6146d79981b98a931c712437186bb	2026-04-25 10:25:09	2026-04-25 10:25:09
1066	3787	37	9	2025-12-19 17:34:44	906666ed5bf6146d79981b98a931c712437186bb	2026-04-25 10:25:09	2026-04-25 10:25:09
1067	3386	37	9	2025-12-19 17:34:44	906666ed5bf6146d79981b98a931c712437186bb	2026-04-25 10:25:09	2026-04-25 10:25:09
1068	349	37	9	2025-12-19 17:34:44	906666ed5bf6146d79981b98a931c712437186bb	2026-04-25 10:25:09	2026-04-25 10:25:09
1069	830	37	9	2025-12-19 17:34:44	906666ed5bf6146d79981b98a931c712437186bb	2026-04-25 10:25:09	2026-04-25 10:25:09
1070	2698	20	5	2026-02-13 16:19:27	83e690260ec05c6e4b10fd494de8aaf755746384	2026-04-25 10:25:09	2026-04-25 10:25:09
1071	467	20	5	2026-02-13 16:19:27	83e690260ec05c6e4b10fd494de8aaf755746384	2026-04-25 10:25:09	2026-04-25 10:25:09
1072	3996	20	5	2026-02-13 16:19:27	83e690260ec05c6e4b10fd494de8aaf755746384	2026-04-25 10:25:09	2026-04-25 10:25:09
1073	2662	20	5	2026-02-13 16:19:27	83e690260ec05c6e4b10fd494de8aaf755746384	2026-04-25 10:25:09	2026-04-25 10:25:09
1074	1107	20	5	2026-02-13 16:19:27	83e690260ec05c6e4b10fd494de8aaf755746384	2026-04-25 10:25:09	2026-04-25 10:25:09
1075	2910	20	5	2026-02-13 16:19:27	83e690260ec05c6e4b10fd494de8aaf755746384	2026-04-25 10:25:09	2026-04-25 10:25:09
1076	4695	20	5	2026-02-13 16:19:27	83e690260ec05c6e4b10fd494de8aaf755746384	2026-04-25 10:25:09	2026-04-25 10:25:09
1077	2733	20	5	2026-02-13 16:19:27	83e690260ec05c6e4b10fd494de8aaf755746384	2026-04-25 10:25:09	2026-04-25 10:25:09
1078	3173	24	8	2026-03-13 11:57:22	e634fcc01bd402cf9532aaa57cf5dbd6659b35bd	2026-04-25 10:25:09	2026-04-25 10:25:09
1079	411	24	8	2026-03-13 11:57:22	e634fcc01bd402cf9532aaa57cf5dbd6659b35bd	2026-04-25 10:25:09	2026-04-25 10:25:09
1080	1766	24	8	2026-03-13 11:57:22	e634fcc01bd402cf9532aaa57cf5dbd6659b35bd	2026-04-25 10:25:09	2026-04-25 10:25:09
1081	4517	24	8	2026-03-13 11:57:22	e634fcc01bd402cf9532aaa57cf5dbd6659b35bd	2026-04-25 10:25:09	2026-04-25 10:25:09
1082	3345	24	8	2026-03-13 11:57:22	e634fcc01bd402cf9532aaa57cf5dbd6659b35bd	2026-04-25 10:25:09	2026-04-25 10:25:09
1083	4523	62	9	2025-07-04 09:00:27	7d1ee5de9b538b5bd4d1bea53bcdb5d0fb9d1fac	2026-04-25 10:25:09	2026-04-25 10:25:09
1084	2150	62	9	2025-07-04 09:00:27	7d1ee5de9b538b5bd4d1bea53bcdb5d0fb9d1fac	2026-04-25 10:25:09	2026-04-25 10:25:09
1085	4366	62	9	2025-07-04 09:00:27	7d1ee5de9b538b5bd4d1bea53bcdb5d0fb9d1fac	2026-04-25 10:25:09	2026-04-25 10:25:09
1086	4604	62	9	2025-07-04 09:00:27	7d1ee5de9b538b5bd4d1bea53bcdb5d0fb9d1fac	2026-04-25 10:25:09	2026-04-25 10:25:09
1087	4013	62	9	2025-07-04 09:00:27	7d1ee5de9b538b5bd4d1bea53bcdb5d0fb9d1fac	2026-04-25 10:25:09	2026-04-25 10:25:09
1088	1651	62	9	2025-07-04 09:00:27	7d1ee5de9b538b5bd4d1bea53bcdb5d0fb9d1fac	2026-04-25 10:25:09	2026-04-25 10:25:09
1089	4002	62	9	2025-07-04 09:00:27	7d1ee5de9b538b5bd4d1bea53bcdb5d0fb9d1fac	2026-04-25 10:25:09	2026-04-25 10:25:09
1090	229	62	9	2025-07-04 09:00:27	7d1ee5de9b538b5bd4d1bea53bcdb5d0fb9d1fac	2026-04-25 10:25:09	2026-04-25 10:25:09
1091	2358	62	9	2025-07-04 09:00:27	7d1ee5de9b538b5bd4d1bea53bcdb5d0fb9d1fac	2026-04-25 10:25:09	2026-04-25 10:25:09
1092	443	27	5	2025-09-29 12:36:39	6a5345ece9621e96d4ffc5430f90082aaabce791	2026-04-25 10:25:09	2026-04-25 10:25:09
1093	1857	27	5	2025-09-29 12:36:39	6a5345ece9621e96d4ffc5430f90082aaabce791	2026-04-25 10:25:09	2026-04-25 10:25:09
1094	78	27	5	2025-09-29 12:36:39	6a5345ece9621e96d4ffc5430f90082aaabce791	2026-04-25 10:25:09	2026-04-25 10:25:09
1095	1463	4	1	2025-04-25 16:47:38	64344db54fadf421e6351c3922240a6bb6b2ae14	2026-04-25 10:25:09	2026-04-25 10:25:09
1096	2500	4	1	2025-04-25 16:47:38	64344db54fadf421e6351c3922240a6bb6b2ae14	2026-04-25 10:25:09	2026-04-25 10:25:09
1097	3148	4	1	2025-04-25 16:47:38	64344db54fadf421e6351c3922240a6bb6b2ae14	2026-04-25 10:25:09	2026-04-25 10:25:09
1098	4958	4	1	2025-04-25 16:47:38	64344db54fadf421e6351c3922240a6bb6b2ae14	2026-04-25 10:25:09	2026-04-25 10:25:09
1099	2757	38	5	2025-11-13 17:10:11	689f4f9fb5af3e480ad0ae1a5913dad22cd2cdc0	2026-04-25 10:25:09	2026-04-25 10:25:09
1100	2293	40	7	2025-07-11 12:15:44	8bb6678a56985ca9a0210ecfa8125b0c8d2f71ed	2026-04-25 10:25:09	2026-04-25 10:25:09
1101	3818	40	7	2025-07-11 12:15:44	8bb6678a56985ca9a0210ecfa8125b0c8d2f71ed	2026-04-25 10:25:09	2026-04-25 10:25:09
1102	3922	40	7	2025-07-11 12:15:44	8bb6678a56985ca9a0210ecfa8125b0c8d2f71ed	2026-04-25 10:25:09	2026-04-25 10:25:09
1103	4054	40	7	2025-07-11 12:15:44	8bb6678a56985ca9a0210ecfa8125b0c8d2f71ed	2026-04-25 10:25:09	2026-04-25 10:25:09
1104	1274	40	7	2025-07-11 12:15:44	8bb6678a56985ca9a0210ecfa8125b0c8d2f71ed	2026-04-25 10:25:09	2026-04-25 10:25:09
1105	400	40	7	2025-07-11 12:15:44	8bb6678a56985ca9a0210ecfa8125b0c8d2f71ed	2026-04-25 10:25:09	2026-04-25 10:25:09
1106	1111	40	7	2025-07-11 12:15:44	8bb6678a56985ca9a0210ecfa8125b0c8d2f71ed	2026-04-25 10:25:09	2026-04-25 10:25:09
1107	4263	40	7	2025-07-11 12:15:44	8bb6678a56985ca9a0210ecfa8125b0c8d2f71ed	2026-04-25 10:25:09	2026-04-25 10:25:09
1108	4956	40	7	2025-07-11 12:15:44	8bb6678a56985ca9a0210ecfa8125b0c8d2f71ed	2026-04-25 10:25:09	2026-04-25 10:25:09
1109	1865	40	7	2025-04-28 15:13:27	6d18bbf87f61d0111a12a6f75530d197198648d0	2026-04-25 10:25:09	2026-04-25 10:25:09
1110	422	40	7	2025-04-28 15:13:27	6d18bbf87f61d0111a12a6f75530d197198648d0	2026-04-25 10:25:09	2026-04-25 10:25:09
1111	4944	40	7	2025-04-28 15:13:27	6d18bbf87f61d0111a12a6f75530d197198648d0	2026-04-25 10:25:09	2026-04-25 10:25:09
1112	2289	40	7	2025-04-28 15:13:27	6d18bbf87f61d0111a12a6f75530d197198648d0	2026-04-25 10:25:09	2026-04-25 10:25:09
1113	2265	40	7	2025-04-28 15:13:27	6d18bbf87f61d0111a12a6f75530d197198648d0	2026-04-25 10:25:09	2026-04-25 10:25:09
1114	3923	40	7	2025-04-28 15:13:27	6d18bbf87f61d0111a12a6f75530d197198648d0	2026-04-25 10:25:09	2026-04-25 10:25:09
1115	2388	40	7	2025-04-28 15:13:27	6d18bbf87f61d0111a12a6f75530d197198648d0	2026-04-25 10:25:09	2026-04-25 10:25:09
1116	3608	40	7	2025-04-28 15:13:27	6d18bbf87f61d0111a12a6f75530d197198648d0	2026-04-25 10:25:09	2026-04-25 10:25:09
1117	3570	40	7	2025-04-28 15:13:27	6d18bbf87f61d0111a12a6f75530d197198648d0	2026-04-25 10:25:09	2026-04-25 10:25:09
1118	1182	71	6	2025-04-28 13:29:33	036af72c9a6fbf4105dcd6fc85539abbc7b35460	2026-04-25 10:25:09	2026-04-25 10:25:09
1119	1385	71	6	2025-04-28 13:29:33	036af72c9a6fbf4105dcd6fc85539abbc7b35460	2026-04-25 10:25:09	2026-04-25 10:25:09
1120	2022	71	6	2025-04-28 13:29:33	036af72c9a6fbf4105dcd6fc85539abbc7b35460	2026-04-25 10:25:09	2026-04-25 10:25:09
1121	1750	71	6	2025-04-28 13:29:33	036af72c9a6fbf4105dcd6fc85539abbc7b35460	2026-04-25 10:25:09	2026-04-25 10:25:09
1122	2278	71	6	2025-04-28 13:29:33	036af72c9a6fbf4105dcd6fc85539abbc7b35460	2026-04-25 10:25:09	2026-04-25 10:25:09
1123	1962	30	5	2025-11-29 15:43:15	825392aef6fedb4626c0e3c9ee4efa9f3714f840	2026-04-25 10:25:09	2026-04-25 10:25:09
1124	1940	30	5	2025-11-29 15:43:15	825392aef6fedb4626c0e3c9ee4efa9f3714f840	2026-04-25 10:25:09	2026-04-25 10:25:09
1125	4207	30	5	2025-11-29 15:43:15	825392aef6fedb4626c0e3c9ee4efa9f3714f840	2026-04-25 10:25:09	2026-04-25 10:25:09
1126	1320	30	5	2025-11-29 15:43:15	825392aef6fedb4626c0e3c9ee4efa9f3714f840	2026-04-25 10:25:09	2026-04-25 10:25:09
1127	1592	30	5	2025-11-29 15:43:15	825392aef6fedb4626c0e3c9ee4efa9f3714f840	2026-04-25 10:25:09	2026-04-25 10:25:09
1128	457	30	5	2025-11-29 15:43:15	825392aef6fedb4626c0e3c9ee4efa9f3714f840	2026-04-25 10:25:09	2026-04-25 10:25:09
1129	4826	30	5	2025-11-29 15:43:15	825392aef6fedb4626c0e3c9ee4efa9f3714f840	2026-04-25 10:25:09	2026-04-25 10:25:09
1130	978	41	3	2026-03-25 10:13:05	494f42455f07fdb0ed9f0f4806ba709210f6e9d6	2026-04-25 10:25:09	2026-04-25 10:25:09
1131	1586	41	3	2026-03-25 10:13:05	494f42455f07fdb0ed9f0f4806ba709210f6e9d6	2026-04-25 10:25:09	2026-04-25 10:25:09
1132	3850	41	3	2026-03-25 10:13:05	494f42455f07fdb0ed9f0f4806ba709210f6e9d6	2026-04-25 10:25:09	2026-04-25 10:25:09
1133	3080	41	3	2026-03-25 10:13:05	494f42455f07fdb0ed9f0f4806ba709210f6e9d6	2026-04-25 10:25:09	2026-04-25 10:25:09
1134	442	41	3	2026-03-25 10:13:05	494f42455f07fdb0ed9f0f4806ba709210f6e9d6	2026-04-25 10:25:09	2026-04-25 10:25:09
1135	1977	12	8	2026-04-05 09:44:48	ab2471734424ad982e312648d8a65015977d47ff	2026-04-25 10:25:09	2026-04-25 10:25:09
1136	564	12	8	2026-04-05 09:44:48	ab2471734424ad982e312648d8a65015977d47ff	2026-04-25 10:25:09	2026-04-25 10:25:09
1137	3974	12	8	2026-04-05 09:44:48	ab2471734424ad982e312648d8a65015977d47ff	2026-04-25 10:25:09	2026-04-25 10:25:09
1138	3250	12	8	2026-04-05 09:44:48	ab2471734424ad982e312648d8a65015977d47ff	2026-04-25 10:25:09	2026-04-25 10:25:09
1139	857	12	8	2026-04-05 09:44:48	ab2471734424ad982e312648d8a65015977d47ff	2026-04-25 10:25:09	2026-04-25 10:25:09
1140	3499	12	8	2026-04-05 09:44:48	ab2471734424ad982e312648d8a65015977d47ff	2026-04-25 10:25:09	2026-04-25 10:25:09
1141	1252	12	8	2026-04-05 09:44:48	ab2471734424ad982e312648d8a65015977d47ff	2026-04-25 10:25:09	2026-04-25 10:25:09
1142	987	12	8	2026-04-05 09:44:48	ab2471734424ad982e312648d8a65015977d47ff	2026-04-25 10:25:09	2026-04-25 10:25:09
1143	2004	12	8	2026-04-05 09:44:48	ab2471734424ad982e312648d8a65015977d47ff	2026-04-25 10:25:09	2026-04-25 10:25:09
1144	1048	12	8	2026-04-05 09:44:48	ab2471734424ad982e312648d8a65015977d47ff	2026-04-25 10:25:09	2026-04-25 10:25:09
1145	3523	38	9	2026-02-03 14:21:16	81f51c32e0c8d832a58450f6a9bc2e6303e45728	2026-04-25 10:25:09	2026-04-25 10:25:09
1146	4538	38	9	2026-02-03 14:21:16	81f51c32e0c8d832a58450f6a9bc2e6303e45728	2026-04-25 10:25:09	2026-04-25 10:25:09
1147	336	38	9	2026-02-03 14:21:16	81f51c32e0c8d832a58450f6a9bc2e6303e45728	2026-04-25 10:25:09	2026-04-25 10:25:09
1148	2053	38	9	2026-02-03 14:21:16	81f51c32e0c8d832a58450f6a9bc2e6303e45728	2026-04-25 10:25:09	2026-04-25 10:25:09
1149	2248	38	9	2026-02-03 14:21:16	81f51c32e0c8d832a58450f6a9bc2e6303e45728	2026-04-25 10:25:09	2026-04-25 10:25:09
1150	801	38	9	2026-02-03 14:21:16	81f51c32e0c8d832a58450f6a9bc2e6303e45728	2026-04-25 10:25:09	2026-04-25 10:25:09
1151	2614	38	9	2026-02-03 14:21:16	81f51c32e0c8d832a58450f6a9bc2e6303e45728	2026-04-25 10:25:09	2026-04-25 10:25:09
1152	234	38	9	2026-02-03 14:21:16	81f51c32e0c8d832a58450f6a9bc2e6303e45728	2026-04-25 10:25:09	2026-04-25 10:25:09
1153	2872	38	9	2026-02-03 14:21:16	81f51c32e0c8d832a58450f6a9bc2e6303e45728	2026-04-25 10:25:09	2026-04-25 10:25:09
1154	738	51	10	2025-11-29 16:09:23	2736767d0dc979413ee6d74c13a2cdb51875e89f	2026-04-25 10:25:09	2026-04-25 10:25:09
1155	2303	51	10	2025-11-29 16:09:23	2736767d0dc979413ee6d74c13a2cdb51875e89f	2026-04-25 10:25:09	2026-04-25 10:25:09
1156	154	51	10	2025-11-29 16:09:23	2736767d0dc979413ee6d74c13a2cdb51875e89f	2026-04-25 10:25:09	2026-04-25 10:25:09
1157	1147	51	10	2025-11-29 16:09:23	2736767d0dc979413ee6d74c13a2cdb51875e89f	2026-04-25 10:25:09	2026-04-25 10:25:09
1158	3912	51	10	2025-11-29 16:09:23	2736767d0dc979413ee6d74c13a2cdb51875e89f	2026-04-25 10:25:09	2026-04-25 10:25:09
1159	1296	55	4	2025-12-23 16:08:10	2c0dc2741a52cc816f6172471246311cfc52c031	2026-04-25 10:25:09	2026-04-25 10:25:09
1160	3471	55	4	2025-12-23 16:08:10	2c0dc2741a52cc816f6172471246311cfc52c031	2026-04-25 10:25:09	2026-04-25 10:25:09
1161	4483	55	4	2025-12-23 16:08:10	2c0dc2741a52cc816f6172471246311cfc52c031	2026-04-25 10:25:09	2026-04-25 10:25:09
1162	4665	55	4	2025-12-23 16:08:10	2c0dc2741a52cc816f6172471246311cfc52c031	2026-04-25 10:25:09	2026-04-25 10:25:09
1163	1552	55	4	2025-12-23 16:08:10	2c0dc2741a52cc816f6172471246311cfc52c031	2026-04-25 10:25:09	2026-04-25 10:25:09
1164	3612	55	4	2025-12-23 16:08:10	2c0dc2741a52cc816f6172471246311cfc52c031	2026-04-25 10:25:09	2026-04-25 10:25:09
1165	4008	42	6	2025-10-04 15:32:57	1f409a0153ff382b3b6e484f04e446970323cab3	2026-04-25 10:25:09	2026-04-25 10:25:09
1166	376	42	6	2025-10-04 15:32:57	1f409a0153ff382b3b6e484f04e446970323cab3	2026-04-25 10:25:09	2026-04-25 10:25:09
1167	2920	42	6	2025-10-04 15:32:57	1f409a0153ff382b3b6e484f04e446970323cab3	2026-04-25 10:25:09	2026-04-25 10:25:09
1168	1016	42	6	2025-10-04 15:32:57	1f409a0153ff382b3b6e484f04e446970323cab3	2026-04-25 10:25:09	2026-04-25 10:25:09
1169	1908	42	6	2025-10-04 15:32:57	1f409a0153ff382b3b6e484f04e446970323cab3	2026-04-25 10:25:09	2026-04-25 10:25:09
1170	641	42	6	2025-10-04 15:32:57	1f409a0153ff382b3b6e484f04e446970323cab3	2026-04-25 10:25:09	2026-04-25 10:25:09
1171	4632	42	6	2025-10-04 15:32:57	1f409a0153ff382b3b6e484f04e446970323cab3	2026-04-25 10:25:09	2026-04-25 10:25:09
1172	2275	42	6	2025-10-04 15:32:57	1f409a0153ff382b3b6e484f04e446970323cab3	2026-04-25 10:25:09	2026-04-25 10:25:09
1173	4170	42	6	2025-10-04 15:32:57	1f409a0153ff382b3b6e484f04e446970323cab3	2026-04-25 10:25:09	2026-04-25 10:25:09
1174	4289	78	4	2025-12-19 12:38:26	0a05757a2326e9da108c25bd0cb9a5fc29562404	2026-04-25 10:25:09	2026-04-25 10:25:09
1175	1966	78	4	2025-12-19 12:38:26	0a05757a2326e9da108c25bd0cb9a5fc29562404	2026-04-25 10:25:09	2026-04-25 10:25:09
1176	1166	78	4	2025-12-19 12:38:26	0a05757a2326e9da108c25bd0cb9a5fc29562404	2026-04-25 10:25:09	2026-04-25 10:25:09
1177	3271	78	4	2025-12-19 12:38:26	0a05757a2326e9da108c25bd0cb9a5fc29562404	2026-04-25 10:25:09	2026-04-25 10:25:09
1178	1815	78	4	2025-12-19 12:38:26	0a05757a2326e9da108c25bd0cb9a5fc29562404	2026-04-25 10:25:09	2026-04-25 10:25:09
1179	2195	78	4	2025-12-19 12:38:26	0a05757a2326e9da108c25bd0cb9a5fc29562404	2026-04-25 10:25:09	2026-04-25 10:25:09
1180	917	66	2	2025-10-01 15:32:40	bb63ebfe8e46ce6f30f2a44ddcb81934a40b3e01	2026-04-25 10:25:09	2026-04-25 10:25:09
1181	1180	66	2	2025-10-01 15:32:40	bb63ebfe8e46ce6f30f2a44ddcb81934a40b3e01	2026-04-25 10:25:09	2026-04-25 10:25:09
1182	4545	66	2	2025-10-01 15:32:40	bb63ebfe8e46ce6f30f2a44ddcb81934a40b3e01	2026-04-25 10:25:09	2026-04-25 10:25:09
1183	2509	66	2	2025-10-01 15:32:40	bb63ebfe8e46ce6f30f2a44ddcb81934a40b3e01	2026-04-25 10:25:09	2026-04-25 10:25:09
1184	3562	66	2	2025-10-01 15:32:40	bb63ebfe8e46ce6f30f2a44ddcb81934a40b3e01	2026-04-25 10:25:09	2026-04-25 10:25:09
1185	2674	66	2	2025-10-01 15:32:40	bb63ebfe8e46ce6f30f2a44ddcb81934a40b3e01	2026-04-25 10:25:09	2026-04-25 10:25:09
1186	2937	66	2	2025-10-01 15:32:40	bb63ebfe8e46ce6f30f2a44ddcb81934a40b3e01	2026-04-25 10:25:09	2026-04-25 10:25:09
1187	4463	93	3	2025-11-17 16:03:42	9bd113031f30440f12b068dfd18145a603f9ecff	2026-04-25 10:25:09	2026-04-25 10:25:09
1188	3225	93	3	2025-11-17 16:03:42	9bd113031f30440f12b068dfd18145a603f9ecff	2026-04-25 10:25:09	2026-04-25 10:25:09
1189	49	93	3	2025-11-17 16:03:42	9bd113031f30440f12b068dfd18145a603f9ecff	2026-04-25 10:25:09	2026-04-25 10:25:09
1190	1372	93	3	2025-11-17 16:03:42	9bd113031f30440f12b068dfd18145a603f9ecff	2026-04-25 10:25:09	2026-04-25 10:25:09
1191	2821	50	2	2025-11-29 12:18:54	e9bd5289683858e744274f9e67c607c7e8171d3c	2026-04-25 10:25:09	2026-04-25 10:25:09
1192	563	50	2	2025-11-29 12:18:54	e9bd5289683858e744274f9e67c607c7e8171d3c	2026-04-25 10:25:09	2026-04-25 10:25:09
1193	570	69	10	2026-02-21 09:52:00	6eba98d914470c9d7658b091526b407b6763a287	2026-04-25 10:25:09	2026-04-25 10:25:09
1194	1739	69	10	2026-02-21 09:52:00	6eba98d914470c9d7658b091526b407b6763a287	2026-04-25 10:25:09	2026-04-25 10:25:09
1195	4354	78	10	2025-06-30 17:31:33	d5ef7e45f3e6b7bd07ae7ea67cc7eed6ac30cd27	2026-04-25 10:25:09	2026-04-25 10:25:09
1196	1095	78	10	2025-06-30 17:31:33	d5ef7e45f3e6b7bd07ae7ea67cc7eed6ac30cd27	2026-04-25 10:25:09	2026-04-25 10:25:09
1197	1546	78	10	2025-06-30 17:31:33	d5ef7e45f3e6b7bd07ae7ea67cc7eed6ac30cd27	2026-04-25 10:25:09	2026-04-25 10:25:09
1198	1495	78	10	2025-06-30 17:31:33	d5ef7e45f3e6b7bd07ae7ea67cc7eed6ac30cd27	2026-04-25 10:25:09	2026-04-25 10:25:09
1199	84	78	10	2025-06-30 17:31:33	d5ef7e45f3e6b7bd07ae7ea67cc7eed6ac30cd27	2026-04-25 10:25:09	2026-04-25 10:25:09
1200	623	78	10	2025-06-30 17:31:33	d5ef7e45f3e6b7bd07ae7ea67cc7eed6ac30cd27	2026-04-25 10:25:09	2026-04-25 10:25:09
1201	1754	81	10	2025-10-08 14:15:02	b72ae344aef11792fbd5888883e9aeee30da20df	2026-04-25 10:25:09	2026-04-25 10:25:09
1202	39	81	10	2025-10-08 14:15:02	b72ae344aef11792fbd5888883e9aeee30da20df	2026-04-25 10:25:09	2026-04-25 10:25:09
1203	820	81	10	2025-10-08 14:15:02	b72ae344aef11792fbd5888883e9aeee30da20df	2026-04-25 10:25:09	2026-04-25 10:25:09
1204	4520	81	10	2025-10-08 14:15:02	b72ae344aef11792fbd5888883e9aeee30da20df	2026-04-25 10:25:09	2026-04-25 10:25:09
1205	889	81	10	2025-10-08 14:15:02	b72ae344aef11792fbd5888883e9aeee30da20df	2026-04-25 10:25:09	2026-04-25 10:25:09
1206	4477	81	10	2025-10-08 14:15:02	b72ae344aef11792fbd5888883e9aeee30da20df	2026-04-25 10:25:09	2026-04-25 10:25:09
1207	2982	81	10	2025-10-08 14:15:02	b72ae344aef11792fbd5888883e9aeee30da20df	2026-04-25 10:25:09	2026-04-25 10:25:09
1208	4140	81	10	2025-10-08 14:15:02	b72ae344aef11792fbd5888883e9aeee30da20df	2026-04-25 10:25:09	2026-04-25 10:25:09
1209	3451	81	10	2025-10-08 14:15:02	b72ae344aef11792fbd5888883e9aeee30da20df	2026-04-25 10:25:09	2026-04-25 10:25:09
1210	4710	48	8	2025-09-14 13:49:18	c95b03fdf2045c56fb3ba630f0378a57e47ea814	2026-04-25 10:25:09	2026-04-25 10:25:09
1211	1004	48	8	2025-09-14 13:49:18	c95b03fdf2045c56fb3ba630f0378a57e47ea814	2026-04-25 10:25:09	2026-04-25 10:25:09
1212	414	48	8	2025-09-14 13:49:18	c95b03fdf2045c56fb3ba630f0378a57e47ea814	2026-04-25 10:25:09	2026-04-25 10:25:09
1213	4280	48	8	2025-09-14 13:49:18	c95b03fdf2045c56fb3ba630f0378a57e47ea814	2026-04-25 10:25:09	2026-04-25 10:25:09
1214	2358	48	8	2025-09-14 13:49:18	c95b03fdf2045c56fb3ba630f0378a57e47ea814	2026-04-25 10:25:09	2026-04-25 10:25:09
1215	4799	48	8	2025-09-14 13:49:18	c95b03fdf2045c56fb3ba630f0378a57e47ea814	2026-04-25 10:25:09	2026-04-25 10:25:09
1216	3743	48	8	2025-09-14 13:49:18	c95b03fdf2045c56fb3ba630f0378a57e47ea814	2026-04-25 10:25:09	2026-04-25 10:25:09
1217	2567	48	8	2025-09-14 13:49:18	c95b03fdf2045c56fb3ba630f0378a57e47ea814	2026-04-25 10:25:09	2026-04-25 10:25:09
1218	499	39	1	2026-03-21 16:31:00	bee85fa445a327cd598d9b2e0594730d86d655df	2026-04-25 10:25:09	2026-04-25 10:25:09
1219	4275	1	6	2025-06-09 17:47:28	f30da84fe096dc99a29f232f65a31a15f7b43cb5	2026-04-25 10:25:09	2026-04-25 10:25:09
1220	191	1	6	2025-06-09 17:47:28	f30da84fe096dc99a29f232f65a31a15f7b43cb5	2026-04-25 10:25:09	2026-04-25 10:25:09
1221	3401	1	6	2025-06-09 17:47:28	f30da84fe096dc99a29f232f65a31a15f7b43cb5	2026-04-25 10:25:09	2026-04-25 10:25:09
1222	2273	1	6	2025-06-09 17:47:28	f30da84fe096dc99a29f232f65a31a15f7b43cb5	2026-04-25 10:25:09	2026-04-25 10:25:09
1223	2835	1	6	2025-06-09 17:47:28	f30da84fe096dc99a29f232f65a31a15f7b43cb5	2026-04-25 10:25:09	2026-04-25 10:25:09
1224	4130	1	6	2025-06-09 17:47:28	f30da84fe096dc99a29f232f65a31a15f7b43cb5	2026-04-25 10:25:09	2026-04-25 10:25:09
1225	4732	1	6	2025-06-09 17:47:28	f30da84fe096dc99a29f232f65a31a15f7b43cb5	2026-04-25 10:25:09	2026-04-25 10:25:09
1226	2482	12	6	2026-01-28 14:21:26	6d2c795442b68b96d90a7cf404d6776b42aeafad	2026-04-25 10:25:09	2026-04-25 10:25:09
1227	411	12	6	2026-01-28 14:21:26	6d2c795442b68b96d90a7cf404d6776b42aeafad	2026-04-25 10:25:09	2026-04-25 10:25:09
1228	4920	12	6	2026-01-28 14:21:26	6d2c795442b68b96d90a7cf404d6776b42aeafad	2026-04-25 10:25:09	2026-04-25 10:25:09
1229	3957	93	9	2026-04-12 16:51:24	2044e7c3c18b7d0bdb783b50820b9f53ac8f7bcc	2026-04-25 10:25:09	2026-04-25 10:25:09
1230	991	93	9	2026-04-12 16:51:24	2044e7c3c18b7d0bdb783b50820b9f53ac8f7bcc	2026-04-25 10:25:09	2026-04-25 10:25:09
1231	3928	93	9	2026-04-12 16:51:24	2044e7c3c18b7d0bdb783b50820b9f53ac8f7bcc	2026-04-25 10:25:09	2026-04-25 10:25:09
1232	3736	70	3	2025-10-26 11:24:25	68a6b7b9dd867c5510c756370e0fb7103c1c7cbd	2026-04-25 10:25:09	2026-04-25 10:25:09
1233	857	70	3	2025-10-26 11:24:25	68a6b7b9dd867c5510c756370e0fb7103c1c7cbd	2026-04-25 10:25:09	2026-04-25 10:25:09
1234	558	70	3	2025-10-26 11:24:25	68a6b7b9dd867c5510c756370e0fb7103c1c7cbd	2026-04-25 10:25:09	2026-04-25 10:25:09
1235	833	70	3	2025-10-26 11:24:25	68a6b7b9dd867c5510c756370e0fb7103c1c7cbd	2026-04-25 10:25:09	2026-04-25 10:25:09
1236	1318	70	3	2025-10-26 11:24:25	68a6b7b9dd867c5510c756370e0fb7103c1c7cbd	2026-04-25 10:25:09	2026-04-25 10:25:09
1237	1266	70	3	2025-10-26 11:24:25	68a6b7b9dd867c5510c756370e0fb7103c1c7cbd	2026-04-25 10:25:09	2026-04-25 10:25:09
1238	3420	70	3	2025-10-26 11:24:25	68a6b7b9dd867c5510c756370e0fb7103c1c7cbd	2026-04-25 10:25:09	2026-04-25 10:25:09
1239	1903	77	2	2026-04-21 15:32:04	b6a1e7d8102771873ba9980abeacf77c5841a8f7	2026-04-25 10:25:09	2026-04-25 10:25:09
1240	2603	77	2	2026-04-21 15:32:04	b6a1e7d8102771873ba9980abeacf77c5841a8f7	2026-04-25 10:25:09	2026-04-25 10:25:09
1241	4772	77	2	2026-04-21 15:32:04	b6a1e7d8102771873ba9980abeacf77c5841a8f7	2026-04-25 10:25:09	2026-04-25 10:25:09
1242	4476	77	4	2025-06-06 12:33:55	1d5eb358b7f4a2cfb9b5facb64a52f3079b07f13	2026-04-25 10:25:09	2026-04-25 10:25:09
1243	2372	77	4	2025-06-06 12:33:55	1d5eb358b7f4a2cfb9b5facb64a52f3079b07f13	2026-04-25 10:25:09	2026-04-25 10:25:09
1244	4836	77	4	2025-06-06 12:33:55	1d5eb358b7f4a2cfb9b5facb64a52f3079b07f13	2026-04-25 10:25:09	2026-04-25 10:25:09
1245	1074	77	4	2025-06-06 12:33:55	1d5eb358b7f4a2cfb9b5facb64a52f3079b07f13	2026-04-25 10:25:09	2026-04-25 10:25:09
1246	3789	77	4	2025-06-06 12:33:55	1d5eb358b7f4a2cfb9b5facb64a52f3079b07f13	2026-04-25 10:25:09	2026-04-25 10:25:09
1247	4266	77	4	2025-06-06 12:33:55	1d5eb358b7f4a2cfb9b5facb64a52f3079b07f13	2026-04-25 10:25:09	2026-04-25 10:25:09
1248	4307	77	4	2025-06-06 12:33:55	1d5eb358b7f4a2cfb9b5facb64a52f3079b07f13	2026-04-25 10:25:09	2026-04-25 10:25:09
1249	3841	77	4	2025-06-06 12:33:55	1d5eb358b7f4a2cfb9b5facb64a52f3079b07f13	2026-04-25 10:25:09	2026-04-25 10:25:09
1250	3519	5	4	2025-05-26 15:34:12	e7811ba3b326478aa2077012bf0b370ade44adcf	2026-04-25 10:25:09	2026-04-25 10:25:09
1251	321	5	4	2025-05-26 15:34:12	e7811ba3b326478aa2077012bf0b370ade44adcf	2026-04-25 10:25:09	2026-04-25 10:25:09
1252	3665	5	4	2025-05-26 15:34:12	e7811ba3b326478aa2077012bf0b370ade44adcf	2026-04-25 10:25:09	2026-04-25 10:25:09
1253	4908	5	4	2025-05-26 15:34:12	e7811ba3b326478aa2077012bf0b370ade44adcf	2026-04-25 10:25:09	2026-04-25 10:25:09
1254	3271	5	4	2025-05-26 15:34:12	e7811ba3b326478aa2077012bf0b370ade44adcf	2026-04-25 10:25:09	2026-04-25 10:25:09
1255	4078	5	4	2025-05-26 15:34:12	e7811ba3b326478aa2077012bf0b370ade44adcf	2026-04-25 10:25:09	2026-04-25 10:25:09
1256	318	5	4	2025-05-26 15:34:12	e7811ba3b326478aa2077012bf0b370ade44adcf	2026-04-25 10:25:09	2026-04-25 10:25:09
1257	3409	7	4	2025-10-02 13:19:02	5ce3b8fd9f9ea405a5677d03e03dceb98d498822	2026-04-25 10:25:09	2026-04-25 10:25:09
1258	2719	7	4	2025-10-02 13:19:02	5ce3b8fd9f9ea405a5677d03e03dceb98d498822	2026-04-25 10:25:09	2026-04-25 10:25:09
1259	2266	7	4	2025-10-02 13:19:02	5ce3b8fd9f9ea405a5677d03e03dceb98d498822	2026-04-25 10:25:09	2026-04-25 10:25:09
1260	4332	7	4	2025-10-02 13:19:02	5ce3b8fd9f9ea405a5677d03e03dceb98d498822	2026-04-25 10:25:09	2026-04-25 10:25:09
1261	2375	7	4	2025-10-02 13:19:02	5ce3b8fd9f9ea405a5677d03e03dceb98d498822	2026-04-25 10:25:09	2026-04-25 10:25:09
1262	1541	63	7	2025-12-25 15:34:12	3d73734fce9037fad401e413171f7816230c3d3e	2026-04-25 10:25:09	2026-04-25 10:25:09
1263	3495	17	6	2025-12-25 16:23:10	ed4e402ad60e9aad3433d63223c6911b4af7c4cb	2026-04-25 10:25:09	2026-04-25 10:25:09
1264	5000	17	6	2025-12-25 16:23:10	ed4e402ad60e9aad3433d63223c6911b4af7c4cb	2026-04-25 10:25:09	2026-04-25 10:25:09
1265	2678	17	6	2025-12-25 16:23:10	ed4e402ad60e9aad3433d63223c6911b4af7c4cb	2026-04-25 10:25:09	2026-04-25 10:25:09
1266	2720	17	6	2025-12-25 16:23:10	ed4e402ad60e9aad3433d63223c6911b4af7c4cb	2026-04-25 10:25:09	2026-04-25 10:25:09
1267	4301	17	6	2025-12-25 16:23:10	ed4e402ad60e9aad3433d63223c6911b4af7c4cb	2026-04-25 10:25:09	2026-04-25 10:25:09
1268	28	17	6	2025-12-25 16:23:10	ed4e402ad60e9aad3433d63223c6911b4af7c4cb	2026-04-25 10:25:09	2026-04-25 10:25:09
1269	4973	85	5	2025-06-16 10:03:59	eb141ade1482c22b8820ba7f2cdd770665f00f1a	2026-04-25 10:25:09	2026-04-25 10:25:09
1270	75	85	5	2025-06-16 10:03:59	eb141ade1482c22b8820ba7f2cdd770665f00f1a	2026-04-25 10:25:09	2026-04-25 10:25:09
1271	3332	39	9	2026-01-22 09:44:06	f35843c24e293dac7d1697cabcf4c203a8d57ebc	2026-04-25 10:25:09	2026-04-25 10:25:09
1272	813	73	10	2025-08-02 15:21:27	1203659d335ba0dec2b9f4b1020608248725a20b	2026-04-25 10:25:09	2026-04-25 10:25:09
1273	99	73	10	2025-08-02 15:21:27	1203659d335ba0dec2b9f4b1020608248725a20b	2026-04-25 10:25:09	2026-04-25 10:25:09
1274	2864	73	10	2025-08-02 15:21:27	1203659d335ba0dec2b9f4b1020608248725a20b	2026-04-25 10:25:09	2026-04-25 10:25:09
1275	623	73	10	2025-08-02 15:21:27	1203659d335ba0dec2b9f4b1020608248725a20b	2026-04-25 10:25:09	2026-04-25 10:25:09
1276	3600	73	10	2025-08-02 15:21:27	1203659d335ba0dec2b9f4b1020608248725a20b	2026-04-25 10:25:09	2026-04-25 10:25:09
1277	2871	73	10	2025-08-02 15:21:27	1203659d335ba0dec2b9f4b1020608248725a20b	2026-04-25 10:25:09	2026-04-25 10:25:09
1278	1067	36	10	2025-12-07 16:32:58	08c88b616a2c332780dc22e491e9ad1ff042b33a	2026-04-25 10:25:09	2026-04-25 10:25:09
1279	547	36	10	2025-12-07 16:32:58	08c88b616a2c332780dc22e491e9ad1ff042b33a	2026-04-25 10:25:09	2026-04-25 10:25:09
1280	1183	36	10	2025-12-07 16:32:58	08c88b616a2c332780dc22e491e9ad1ff042b33a	2026-04-25 10:25:09	2026-04-25 10:25:09
1281	2666	36	10	2025-12-07 16:32:58	08c88b616a2c332780dc22e491e9ad1ff042b33a	2026-04-25 10:25:09	2026-04-25 10:25:09
1282	1133	36	10	2025-12-07 16:32:58	08c88b616a2c332780dc22e491e9ad1ff042b33a	2026-04-25 10:25:09	2026-04-25 10:25:09
1283	2412	36	10	2025-12-07 16:32:58	08c88b616a2c332780dc22e491e9ad1ff042b33a	2026-04-25 10:25:09	2026-04-25 10:25:09
1284	1369	36	10	2025-12-07 16:32:58	08c88b616a2c332780dc22e491e9ad1ff042b33a	2026-04-25 10:25:09	2026-04-25 10:25:09
1285	2684	36	10	2025-12-07 16:32:58	08c88b616a2c332780dc22e491e9ad1ff042b33a	2026-04-25 10:25:09	2026-04-25 10:25:09
1286	4184	36	10	2025-12-07 16:32:58	08c88b616a2c332780dc22e491e9ad1ff042b33a	2026-04-25 10:25:09	2026-04-25 10:25:09
1287	1480	36	10	2025-12-07 16:32:58	08c88b616a2c332780dc22e491e9ad1ff042b33a	2026-04-25 10:25:09	2026-04-25 10:25:09
1288	1099	63	6	2025-10-29 10:18:10	0af3836e25497d6a0be06246785a7ca9cafdfb6e	2026-04-25 10:25:09	2026-04-25 10:25:09
1289	2560	20	1	2026-04-17 13:13:49	44b957969cb75d3863a8a4716945a0217f078bd2	2026-04-25 10:25:09	2026-04-25 10:25:09
1290	2344	20	1	2026-04-17 13:13:49	44b957969cb75d3863a8a4716945a0217f078bd2	2026-04-25 10:25:09	2026-04-25 10:25:09
1291	3877	20	1	2026-04-17 13:13:49	44b957969cb75d3863a8a4716945a0217f078bd2	2026-04-25 10:25:09	2026-04-25 10:25:09
1292	3561	20	1	2026-04-17 13:13:49	44b957969cb75d3863a8a4716945a0217f078bd2	2026-04-25 10:25:09	2026-04-25 10:25:09
1293	2073	20	1	2026-04-17 13:13:49	44b957969cb75d3863a8a4716945a0217f078bd2	2026-04-25 10:25:09	2026-04-25 10:25:09
1294	151	20	1	2026-04-17 13:13:49	44b957969cb75d3863a8a4716945a0217f078bd2	2026-04-25 10:25:09	2026-04-25 10:25:09
1295	3028	20	1	2026-04-17 13:13:49	44b957969cb75d3863a8a4716945a0217f078bd2	2026-04-25 10:25:09	2026-04-25 10:25:09
1296	3985	20	1	2026-04-17 13:13:49	44b957969cb75d3863a8a4716945a0217f078bd2	2026-04-25 10:25:09	2026-04-25 10:25:09
1297	3322	20	1	2026-04-17 13:13:49	44b957969cb75d3863a8a4716945a0217f078bd2	2026-04-25 10:25:09	2026-04-25 10:25:09
1298	2821	95	2	2026-01-13 14:04:02	05a2545d021d5211ad5054129225f98653e4b19a	2026-04-25 10:25:09	2026-04-25 10:25:09
1299	1902	95	2	2026-01-13 14:04:02	05a2545d021d5211ad5054129225f98653e4b19a	2026-04-25 10:25:09	2026-04-25 10:25:09
1300	3903	95	2	2026-01-13 14:04:02	05a2545d021d5211ad5054129225f98653e4b19a	2026-04-25 10:25:09	2026-04-25 10:25:09
1301	3801	95	2	2026-01-13 14:04:02	05a2545d021d5211ad5054129225f98653e4b19a	2026-04-25 10:25:09	2026-04-25 10:25:09
1302	166	95	2	2026-01-13 14:04:02	05a2545d021d5211ad5054129225f98653e4b19a	2026-04-25 10:25:09	2026-04-25 10:25:09
1303	241	61	3	2025-05-23 14:46:54	c077641c05f50a33d1e0b51d4b20e2713add69ef	2026-04-25 10:25:09	2026-04-25 10:25:09
1304	1787	61	3	2025-05-23 14:46:54	c077641c05f50a33d1e0b51d4b20e2713add69ef	2026-04-25 10:25:09	2026-04-25 10:25:09
1305	1027	61	3	2025-05-23 14:46:54	c077641c05f50a33d1e0b51d4b20e2713add69ef	2026-04-25 10:25:09	2026-04-25 10:25:09
1306	3489	61	3	2025-05-23 14:46:54	c077641c05f50a33d1e0b51d4b20e2713add69ef	2026-04-25 10:25:09	2026-04-25 10:25:09
1307	470	61	3	2025-05-23 14:46:54	c077641c05f50a33d1e0b51d4b20e2713add69ef	2026-04-25 10:25:09	2026-04-25 10:25:09
1308	2526	61	3	2025-05-23 14:46:54	c077641c05f50a33d1e0b51d4b20e2713add69ef	2026-04-25 10:25:09	2026-04-25 10:25:09
1309	4147	30	1	2025-06-18 10:07:42	0694667fb418fc9fbf5b40d4fd7ceb29e0f72bb6	2026-04-25 10:25:09	2026-04-25 10:25:09
1310	26	30	1	2025-06-18 10:07:42	0694667fb418fc9fbf5b40d4fd7ceb29e0f72bb6	2026-04-25 10:25:09	2026-04-25 10:25:09
1311	2158	30	1	2025-06-18 10:07:42	0694667fb418fc9fbf5b40d4fd7ceb29e0f72bb6	2026-04-25 10:25:09	2026-04-25 10:25:09
1312	3749	30	1	2025-06-18 10:07:42	0694667fb418fc9fbf5b40d4fd7ceb29e0f72bb6	2026-04-25 10:25:09	2026-04-25 10:25:09
1313	3410	30	1	2025-06-18 10:07:42	0694667fb418fc9fbf5b40d4fd7ceb29e0f72bb6	2026-04-25 10:25:09	2026-04-25 10:25:09
1314	4287	30	1	2025-06-18 10:07:42	0694667fb418fc9fbf5b40d4fd7ceb29e0f72bb6	2026-04-25 10:25:09	2026-04-25 10:25:09
1315	2979	30	1	2025-06-18 10:07:42	0694667fb418fc9fbf5b40d4fd7ceb29e0f72bb6	2026-04-25 10:25:09	2026-04-25 10:25:09
1316	4519	30	1	2025-06-18 10:07:42	0694667fb418fc9fbf5b40d4fd7ceb29e0f72bb6	2026-04-25 10:25:09	2026-04-25 10:25:09
1317	4764	30	1	2025-06-18 10:07:42	0694667fb418fc9fbf5b40d4fd7ceb29e0f72bb6	2026-04-25 10:25:09	2026-04-25 10:25:09
1318	4957	42	8	2025-12-26 17:58:40	b8b2a10505391ce69b749dd55500195e744f16ba	2026-04-25 10:25:09	2026-04-25 10:25:09
1319	2506	42	8	2025-12-26 17:58:40	b8b2a10505391ce69b749dd55500195e744f16ba	2026-04-25 10:25:09	2026-04-25 10:25:09
1320	4946	42	8	2025-12-26 17:58:40	b8b2a10505391ce69b749dd55500195e744f16ba	2026-04-25 10:25:09	2026-04-25 10:25:09
1321	677	42	8	2025-12-26 17:58:40	b8b2a10505391ce69b749dd55500195e744f16ba	2026-04-25 10:25:09	2026-04-25 10:25:09
1322	4987	42	8	2025-12-26 17:58:40	b8b2a10505391ce69b749dd55500195e744f16ba	2026-04-25 10:25:09	2026-04-25 10:25:09
1323	3109	42	8	2025-12-26 17:58:40	b8b2a10505391ce69b749dd55500195e744f16ba	2026-04-25 10:25:09	2026-04-25 10:25:09
1324	204	42	8	2025-12-26 17:58:40	b8b2a10505391ce69b749dd55500195e744f16ba	2026-04-25 10:25:09	2026-04-25 10:25:09
1325	1144	79	6	2025-10-03 12:41:25	bfdb4ca8ee49d79b4e6fbadfc95160804820867f	2026-04-25 10:25:09	2026-04-25 10:25:09
1326	217	79	6	2025-10-03 12:41:25	bfdb4ca8ee49d79b4e6fbadfc95160804820867f	2026-04-25 10:25:09	2026-04-25 10:25:09
1327	1808	79	6	2025-10-03 12:41:25	bfdb4ca8ee49d79b4e6fbadfc95160804820867f	2026-04-25 10:25:09	2026-04-25 10:25:09
1328	1668	79	6	2025-10-03 12:41:25	bfdb4ca8ee49d79b4e6fbadfc95160804820867f	2026-04-25 10:25:09	2026-04-25 10:25:09
1329	3176	79	6	2025-10-03 12:41:25	bfdb4ca8ee49d79b4e6fbadfc95160804820867f	2026-04-25 10:25:09	2026-04-25 10:25:09
1330	1727	79	6	2025-10-03 12:41:25	bfdb4ca8ee49d79b4e6fbadfc95160804820867f	2026-04-25 10:25:09	2026-04-25 10:25:09
1331	467	79	6	2025-10-03 12:41:25	bfdb4ca8ee49d79b4e6fbadfc95160804820867f	2026-04-25 10:25:09	2026-04-25 10:25:09
1332	776	37	8	2025-12-02 14:40:20	b1441cf083e1b190c2ea949fcecbf76b879ff797	2026-04-25 10:25:09	2026-04-25 10:25:09
1333	1507	37	8	2025-12-02 14:40:20	b1441cf083e1b190c2ea949fcecbf76b879ff797	2026-04-25 10:25:09	2026-04-25 10:25:09
1334	1784	37	8	2025-12-02 14:40:20	b1441cf083e1b190c2ea949fcecbf76b879ff797	2026-04-25 10:25:09	2026-04-25 10:25:09
1335	3780	30	7	2025-09-01 14:45:37	deb648685b9abfea04d9484530f1bf726cb552d7	2026-04-25 10:25:09	2026-04-25 10:25:09
1336	3641	30	7	2025-09-01 14:45:37	deb648685b9abfea04d9484530f1bf726cb552d7	2026-04-25 10:25:09	2026-04-25 10:25:09
1337	802	38	3	2025-06-15 10:38:49	17abe6dad541c14baa178774669fc61207570b1b	2026-04-25 10:25:09	2026-04-25 10:25:09
1338	4703	38	3	2025-06-15 10:38:49	17abe6dad541c14baa178774669fc61207570b1b	2026-04-25 10:25:09	2026-04-25 10:25:09
1339	289	38	3	2025-06-15 10:38:49	17abe6dad541c14baa178774669fc61207570b1b	2026-04-25 10:25:09	2026-04-25 10:25:09
1340	1702	38	3	2025-06-15 10:38:49	17abe6dad541c14baa178774669fc61207570b1b	2026-04-25 10:25:09	2026-04-25 10:25:09
1341	210	38	3	2025-06-15 10:38:49	17abe6dad541c14baa178774669fc61207570b1b	2026-04-25 10:25:09	2026-04-25 10:25:09
1342	655	38	3	2025-06-15 10:38:49	17abe6dad541c14baa178774669fc61207570b1b	2026-04-25 10:25:09	2026-04-25 10:25:09
1343	4265	38	3	2025-06-15 10:38:49	17abe6dad541c14baa178774669fc61207570b1b	2026-04-25 10:25:09	2026-04-25 10:25:09
1344	3953	38	3	2025-06-15 10:38:49	17abe6dad541c14baa178774669fc61207570b1b	2026-04-25 10:25:09	2026-04-25 10:25:09
1345	3	38	3	2025-06-15 10:38:49	17abe6dad541c14baa178774669fc61207570b1b	2026-04-25 10:25:09	2026-04-25 10:25:09
1346	854	38	3	2025-06-15 10:38:49	17abe6dad541c14baa178774669fc61207570b1b	2026-04-25 10:25:09	2026-04-25 10:25:09
1347	3640	51	2	2026-01-16 13:39:34	fc0bd1d8508cbf6bd7bfa00512007e419a0cd6da	2026-04-25 10:25:09	2026-04-25 10:25:09
1348	4450	51	2	2026-01-16 13:39:34	fc0bd1d8508cbf6bd7bfa00512007e419a0cd6da	2026-04-25 10:25:09	2026-04-25 10:25:09
1349	1959	51	2	2026-01-16 13:39:34	fc0bd1d8508cbf6bd7bfa00512007e419a0cd6da	2026-04-25 10:25:09	2026-04-25 10:25:09
1350	3672	51	2	2026-01-16 13:39:34	fc0bd1d8508cbf6bd7bfa00512007e419a0cd6da	2026-04-25 10:25:09	2026-04-25 10:25:09
1351	1021	51	2	2026-01-16 13:39:34	fc0bd1d8508cbf6bd7bfa00512007e419a0cd6da	2026-04-25 10:25:09	2026-04-25 10:25:09
1352	801	51	2	2026-01-16 13:39:34	fc0bd1d8508cbf6bd7bfa00512007e419a0cd6da	2026-04-25 10:25:09	2026-04-25 10:25:09
1353	3430	51	2	2026-01-16 13:39:34	fc0bd1d8508cbf6bd7bfa00512007e419a0cd6da	2026-04-25 10:25:09	2026-04-25 10:25:09
1354	2270	31	5	2025-10-30 15:00:30	8c097dacc66299aa7af20d2b14123f3bdb6401b0	2026-04-25 10:25:09	2026-04-25 10:25:09
1355	1056	73	1	2026-01-14 12:15:43	13613b8b6ac90da6231d866844639a1bf75f10a7	2026-04-25 10:25:09	2026-04-25 10:25:09
1356	4782	73	1	2026-01-14 12:15:43	13613b8b6ac90da6231d866844639a1bf75f10a7	2026-04-25 10:25:09	2026-04-25 10:25:09
1357	2037	73	1	2026-01-14 12:15:43	13613b8b6ac90da6231d866844639a1bf75f10a7	2026-04-25 10:25:09	2026-04-25 10:25:09
1358	1925	73	1	2026-01-14 12:15:43	13613b8b6ac90da6231d866844639a1bf75f10a7	2026-04-25 10:25:09	2026-04-25 10:25:09
1359	3626	73	1	2026-01-14 12:15:43	13613b8b6ac90da6231d866844639a1bf75f10a7	2026-04-25 10:25:09	2026-04-25 10:25:09
1360	4427	73	1	2026-01-14 12:15:43	13613b8b6ac90da6231d866844639a1bf75f10a7	2026-04-25 10:25:09	2026-04-25 10:25:09
1361	4011	73	1	2026-01-14 12:15:43	13613b8b6ac90da6231d866844639a1bf75f10a7	2026-04-25 10:25:09	2026-04-25 10:25:09
1362	4467	32	10	2026-02-25 10:41:26	feb4cdf12ebf1061d2cef4002403468253756f4a	2026-04-25 10:25:09	2026-04-25 10:25:09
1363	2977	32	10	2026-02-25 10:41:26	feb4cdf12ebf1061d2cef4002403468253756f4a	2026-04-25 10:25:09	2026-04-25 10:25:09
1364	2126	32	10	2026-02-25 10:41:26	feb4cdf12ebf1061d2cef4002403468253756f4a	2026-04-25 10:25:09	2026-04-25 10:25:09
1365	1200	32	10	2026-02-25 10:41:26	feb4cdf12ebf1061d2cef4002403468253756f4a	2026-04-25 10:25:09	2026-04-25 10:25:09
1366	506	32	10	2026-02-25 10:41:26	feb4cdf12ebf1061d2cef4002403468253756f4a	2026-04-25 10:25:09	2026-04-25 10:25:09
1367	4806	32	10	2026-02-25 10:41:26	feb4cdf12ebf1061d2cef4002403468253756f4a	2026-04-25 10:25:09	2026-04-25 10:25:09
1368	4007	32	10	2026-02-25 10:41:26	feb4cdf12ebf1061d2cef4002403468253756f4a	2026-04-25 10:25:09	2026-04-25 10:25:09
1369	2008	32	10	2026-02-25 10:41:26	feb4cdf12ebf1061d2cef4002403468253756f4a	2026-04-25 10:25:09	2026-04-25 10:25:09
1370	2583	37	7	2025-08-27 11:23:09	9cd25d9debd32f241d60901cf0ed794cd3a3d34f	2026-04-25 10:25:09	2026-04-25 10:25:09
1371	3059	37	7	2025-08-27 11:23:09	9cd25d9debd32f241d60901cf0ed794cd3a3d34f	2026-04-25 10:25:09	2026-04-25 10:25:09
1372	1019	37	7	2025-08-27 11:23:09	9cd25d9debd32f241d60901cf0ed794cd3a3d34f	2026-04-25 10:25:09	2026-04-25 10:25:09
1373	323	37	7	2025-08-27 11:23:09	9cd25d9debd32f241d60901cf0ed794cd3a3d34f	2026-04-25 10:25:09	2026-04-25 10:25:09
1374	2440	37	7	2025-08-27 11:23:09	9cd25d9debd32f241d60901cf0ed794cd3a3d34f	2026-04-25 10:25:09	2026-04-25 10:25:09
1375	1603	37	7	2025-08-27 11:23:09	9cd25d9debd32f241d60901cf0ed794cd3a3d34f	2026-04-25 10:25:09	2026-04-25 10:25:09
1376	1291	37	7	2025-08-27 11:23:09	9cd25d9debd32f241d60901cf0ed794cd3a3d34f	2026-04-25 10:25:09	2026-04-25 10:25:09
1377	4682	14	10	2025-10-16 10:20:16	a217e448742e89ff97d19f1d44c80219362d7b57	2026-04-25 10:25:09	2026-04-25 10:25:09
1378	2368	14	10	2025-10-16 10:20:16	a217e448742e89ff97d19f1d44c80219362d7b57	2026-04-25 10:25:09	2026-04-25 10:25:09
1379	1346	14	10	2025-10-16 10:20:16	a217e448742e89ff97d19f1d44c80219362d7b57	2026-04-25 10:25:09	2026-04-25 10:25:09
1380	585	14	10	2025-10-16 10:20:16	a217e448742e89ff97d19f1d44c80219362d7b57	2026-04-25 10:25:09	2026-04-25 10:25:09
1381	3080	14	10	2025-10-16 10:20:16	a217e448742e89ff97d19f1d44c80219362d7b57	2026-04-25 10:25:09	2026-04-25 10:25:09
1382	2892	14	10	2025-10-16 10:20:16	a217e448742e89ff97d19f1d44c80219362d7b57	2026-04-25 10:25:09	2026-04-25 10:25:09
1383	3364	14	10	2025-10-16 10:20:16	a217e448742e89ff97d19f1d44c80219362d7b57	2026-04-25 10:25:09	2026-04-25 10:25:09
1384	4736	14	10	2025-10-16 10:20:16	a217e448742e89ff97d19f1d44c80219362d7b57	2026-04-25 10:25:09	2026-04-25 10:25:09
1385	3970	14	10	2025-10-16 10:20:16	a217e448742e89ff97d19f1d44c80219362d7b57	2026-04-25 10:25:09	2026-04-25 10:25:09
1386	664	14	10	2025-10-16 10:20:16	a217e448742e89ff97d19f1d44c80219362d7b57	2026-04-25 10:25:09	2026-04-25 10:25:09
1387	3007	31	10	2025-11-25 17:35:14	8da599346372653b246b035300577f4d44feb97c	2026-04-25 10:25:09	2026-04-25 10:25:09
1388	3442	31	10	2025-11-25 17:35:14	8da599346372653b246b035300577f4d44feb97c	2026-04-25 10:25:09	2026-04-25 10:25:09
1389	4819	31	10	2025-11-25 17:35:14	8da599346372653b246b035300577f4d44feb97c	2026-04-25 10:25:09	2026-04-25 10:25:09
1390	4455	31	10	2025-11-25 17:35:14	8da599346372653b246b035300577f4d44feb97c	2026-04-25 10:25:09	2026-04-25 10:25:09
1391	1026	31	10	2025-11-25 17:35:14	8da599346372653b246b035300577f4d44feb97c	2026-04-25 10:25:09	2026-04-25 10:25:09
1392	949	31	10	2025-11-25 17:35:14	8da599346372653b246b035300577f4d44feb97c	2026-04-25 10:25:09	2026-04-25 10:25:09
1393	857	31	10	2025-11-25 17:35:14	8da599346372653b246b035300577f4d44feb97c	2026-04-25 10:25:09	2026-04-25 10:25:09
1394	2208	54	9	2025-05-16 10:34:35	061a167b26e3761c40e6c4c1f81e6e7f9c12730f	2026-04-25 10:25:09	2026-04-25 10:25:09
1395	4240	14	7	2025-07-07 10:44:33	c4575a3674a8c1588aa6d29dea4ba5715f619135	2026-04-25 10:25:09	2026-04-25 10:25:09
1396	2736	14	7	2025-07-07 10:44:33	c4575a3674a8c1588aa6d29dea4ba5715f619135	2026-04-25 10:25:09	2026-04-25 10:25:09
1397	2223	14	7	2025-07-07 10:44:33	c4575a3674a8c1588aa6d29dea4ba5715f619135	2026-04-25 10:25:09	2026-04-25 10:25:09
1398	4557	14	7	2025-07-07 10:44:33	c4575a3674a8c1588aa6d29dea4ba5715f619135	2026-04-25 10:25:09	2026-04-25 10:25:09
1399	457	14	7	2025-07-07 10:44:33	c4575a3674a8c1588aa6d29dea4ba5715f619135	2026-04-25 10:25:09	2026-04-25 10:25:09
1400	627	14	7	2025-07-07 10:44:33	c4575a3674a8c1588aa6d29dea4ba5715f619135	2026-04-25 10:25:09	2026-04-25 10:25:09
1401	1951	14	7	2025-07-07 10:44:33	c4575a3674a8c1588aa6d29dea4ba5715f619135	2026-04-25 10:25:09	2026-04-25 10:25:09
1402	1251	14	7	2025-07-07 10:44:33	c4575a3674a8c1588aa6d29dea4ba5715f619135	2026-04-25 10:25:09	2026-04-25 10:25:09
1403	575	7	6	2025-10-17 11:39:32	757f4e06164a800309aabc29534872e78980a88d	2026-04-25 10:25:09	2026-04-25 10:25:09
1404	1934	7	6	2025-10-17 11:39:32	757f4e06164a800309aabc29534872e78980a88d	2026-04-25 10:25:09	2026-04-25 10:25:09
1405	3730	7	6	2025-10-17 11:39:32	757f4e06164a800309aabc29534872e78980a88d	2026-04-25 10:25:09	2026-04-25 10:25:09
1406	2115	7	6	2025-10-17 11:39:32	757f4e06164a800309aabc29534872e78980a88d	2026-04-25 10:25:09	2026-04-25 10:25:09
1407	3847	7	6	2025-10-17 11:39:32	757f4e06164a800309aabc29534872e78980a88d	2026-04-25 10:25:09	2026-04-25 10:25:09
1408	1421	7	6	2025-10-17 11:39:32	757f4e06164a800309aabc29534872e78980a88d	2026-04-25 10:25:09	2026-04-25 10:25:09
1409	1296	7	6	2025-10-17 11:39:32	757f4e06164a800309aabc29534872e78980a88d	2026-04-25 10:25:09	2026-04-25 10:25:09
1410	2885	7	6	2025-10-17 11:39:32	757f4e06164a800309aabc29534872e78980a88d	2026-04-25 10:25:09	2026-04-25 10:25:09
1411	2876	75	8	2026-01-12 09:47:22	2ca2049817f882f31a8e2bcf80bf4bb9bc5839fd	2026-04-25 10:25:09	2026-04-25 10:25:09
1412	363	75	8	2026-01-12 09:47:22	2ca2049817f882f31a8e2bcf80bf4bb9bc5839fd	2026-04-25 10:25:09	2026-04-25 10:25:09
1413	3689	75	8	2026-01-12 09:47:22	2ca2049817f882f31a8e2bcf80bf4bb9bc5839fd	2026-04-25 10:25:09	2026-04-25 10:25:09
1414	3737	75	8	2026-01-12 09:47:22	2ca2049817f882f31a8e2bcf80bf4bb9bc5839fd	2026-04-25 10:25:09	2026-04-25 10:25:09
1415	2696	75	8	2026-01-12 09:47:22	2ca2049817f882f31a8e2bcf80bf4bb9bc5839fd	2026-04-25 10:25:09	2026-04-25 10:25:09
1416	3782	75	8	2026-01-12 09:47:22	2ca2049817f882f31a8e2bcf80bf4bb9bc5839fd	2026-04-25 10:25:09	2026-04-25 10:25:09
1417	4123	75	8	2026-01-12 09:47:22	2ca2049817f882f31a8e2bcf80bf4bb9bc5839fd	2026-04-25 10:25:09	2026-04-25 10:25:09
1418	2875	39	5	2025-05-24 17:19:28	315a80cbc3b47ac20d9fccec6485e9e60d9fdace	2026-04-25 10:25:09	2026-04-25 10:25:09
1419	3869	39	5	2025-05-24 17:19:28	315a80cbc3b47ac20d9fccec6485e9e60d9fdace	2026-04-25 10:25:09	2026-04-25 10:25:09
1420	2143	39	5	2025-05-24 17:19:28	315a80cbc3b47ac20d9fccec6485e9e60d9fdace	2026-04-25 10:25:09	2026-04-25 10:25:09
1421	2980	39	5	2025-05-24 17:19:28	315a80cbc3b47ac20d9fccec6485e9e60d9fdace	2026-04-25 10:25:09	2026-04-25 10:25:09
1422	2561	39	5	2025-05-24 17:19:28	315a80cbc3b47ac20d9fccec6485e9e60d9fdace	2026-04-25 10:25:09	2026-04-25 10:25:09
1423	3725	39	5	2025-05-24 17:19:28	315a80cbc3b47ac20d9fccec6485e9e60d9fdace	2026-04-25 10:25:09	2026-04-25 10:25:09
1424	2675	74	5	2025-06-24 10:23:52	0b31325bb2784bde7fd4ef90d1146804ae0581b1	2026-04-25 10:25:09	2026-04-25 10:25:09
1425	4463	74	5	2025-06-24 10:23:52	0b31325bb2784bde7fd4ef90d1146804ae0581b1	2026-04-25 10:25:09	2026-04-25 10:25:09
1426	4844	74	5	2025-06-24 10:23:52	0b31325bb2784bde7fd4ef90d1146804ae0581b1	2026-04-25 10:25:09	2026-04-25 10:25:09
1427	2367	74	5	2025-06-24 10:23:52	0b31325bb2784bde7fd4ef90d1146804ae0581b1	2026-04-25 10:25:09	2026-04-25 10:25:09
1428	251	74	5	2025-06-24 10:23:52	0b31325bb2784bde7fd4ef90d1146804ae0581b1	2026-04-25 10:25:09	2026-04-25 10:25:09
1429	3375	74	5	2025-06-24 10:23:52	0b31325bb2784bde7fd4ef90d1146804ae0581b1	2026-04-25 10:25:09	2026-04-25 10:25:09
1430	1940	92	5	2025-07-26 15:39:15	dd794aef45663502b662be79662108dd4382b44f	2026-04-25 10:25:09	2026-04-25 10:25:09
1431	2031	92	5	2025-07-26 15:39:15	dd794aef45663502b662be79662108dd4382b44f	2026-04-25 10:25:09	2026-04-25 10:25:09
1432	1703	92	5	2025-07-26 15:39:15	dd794aef45663502b662be79662108dd4382b44f	2026-04-25 10:25:09	2026-04-25 10:25:09
1433	1605	84	3	2025-08-10 16:08:50	cf155db42d93b9fda47bc86c4dea4ede7bb057d4	2026-04-25 10:25:09	2026-04-25 10:25:09
1434	1594	84	3	2025-08-10 16:08:50	cf155db42d93b9fda47bc86c4dea4ede7bb057d4	2026-04-25 10:25:09	2026-04-25 10:25:09
1435	3665	35	5	2025-12-25 12:20:58	dfbe217519bacf2aeaf91b0d036f6d3ced8b5404	2026-04-25 10:25:09	2026-04-25 10:25:09
1436	4461	35	5	2025-12-25 12:20:58	dfbe217519bacf2aeaf91b0d036f6d3ced8b5404	2026-04-25 10:25:09	2026-04-25 10:25:09
1437	831	35	5	2025-12-25 12:20:58	dfbe217519bacf2aeaf91b0d036f6d3ced8b5404	2026-04-25 10:25:09	2026-04-25 10:25:09
1438	2703	35	5	2025-12-25 12:20:58	dfbe217519bacf2aeaf91b0d036f6d3ced8b5404	2026-04-25 10:25:09	2026-04-25 10:25:09
1439	1187	35	5	2025-12-25 12:20:58	dfbe217519bacf2aeaf91b0d036f6d3ced8b5404	2026-04-25 10:25:09	2026-04-25 10:25:09
1440	3976	38	6	2025-05-02 09:02:17	60ceee5e6af1fa0d6053bd6a18810c73a7ff1073	2026-04-25 10:25:09	2026-04-25 10:25:09
1441	2363	38	6	2025-05-02 09:02:17	60ceee5e6af1fa0d6053bd6a18810c73a7ff1073	2026-04-25 10:25:09	2026-04-25 10:25:09
1442	1749	38	6	2025-05-02 09:02:17	60ceee5e6af1fa0d6053bd6a18810c73a7ff1073	2026-04-25 10:25:09	2026-04-25 10:25:09
1443	4819	38	6	2025-05-02 09:02:17	60ceee5e6af1fa0d6053bd6a18810c73a7ff1073	2026-04-25 10:25:09	2026-04-25 10:25:09
1444	2753	38	6	2025-05-02 09:02:17	60ceee5e6af1fa0d6053bd6a18810c73a7ff1073	2026-04-25 10:25:09	2026-04-25 10:25:09
1445	4271	38	6	2025-05-02 09:02:17	60ceee5e6af1fa0d6053bd6a18810c73a7ff1073	2026-04-25 10:25:09	2026-04-25 10:25:09
1446	4014	23	3	2026-03-17 13:02:29	8f041a9a9c77ab3027acd151a294a3d3192a47ea	2026-04-25 10:25:09	2026-04-25 10:25:09
1447	4915	23	3	2026-03-17 13:02:29	8f041a9a9c77ab3027acd151a294a3d3192a47ea	2026-04-25 10:25:09	2026-04-25 10:25:09
1448	587	23	3	2026-03-17 13:02:29	8f041a9a9c77ab3027acd151a294a3d3192a47ea	2026-04-25 10:25:09	2026-04-25 10:25:09
1449	4763	23	3	2026-03-17 13:02:29	8f041a9a9c77ab3027acd151a294a3d3192a47ea	2026-04-25 10:25:09	2026-04-25 10:25:09
1450	4023	95	1	2025-08-13 10:20:03	fc4f6876854241f5fe042105d8305463dd55b5ca	2026-04-25 10:25:09	2026-04-25 10:25:09
1451	1111	95	1	2025-08-13 10:20:03	fc4f6876854241f5fe042105d8305463dd55b5ca	2026-04-25 10:25:09	2026-04-25 10:25:09
1452	3373	36	4	2025-05-31 11:02:47	0e5c9f9ffcc3b0004cf18d465fea8019afdae16b	2026-04-25 10:25:09	2026-04-25 10:25:09
1453	4256	36	4	2025-05-31 11:02:47	0e5c9f9ffcc3b0004cf18d465fea8019afdae16b	2026-04-25 10:25:09	2026-04-25 10:25:09
1454	1317	36	4	2025-05-31 11:02:47	0e5c9f9ffcc3b0004cf18d465fea8019afdae16b	2026-04-25 10:25:09	2026-04-25 10:25:09
1455	835	36	4	2025-05-31 11:02:47	0e5c9f9ffcc3b0004cf18d465fea8019afdae16b	2026-04-25 10:25:09	2026-04-25 10:25:09
1456	3463	36	4	2025-05-31 11:02:47	0e5c9f9ffcc3b0004cf18d465fea8019afdae16b	2026-04-25 10:25:09	2026-04-25 10:25:09
1457	2386	36	4	2025-05-31 11:02:47	0e5c9f9ffcc3b0004cf18d465fea8019afdae16b	2026-04-25 10:25:09	2026-04-25 10:25:09
1458	2505	1	4	2025-08-16 16:38:03	10ca981c875e387c25aa134b7597492607415d60	2026-04-25 10:25:09	2026-04-25 10:25:09
1459	3110	1	4	2025-08-16 16:38:03	10ca981c875e387c25aa134b7597492607415d60	2026-04-25 10:25:09	2026-04-25 10:25:09
1460	4739	1	4	2025-08-16 16:38:03	10ca981c875e387c25aa134b7597492607415d60	2026-04-25 10:25:09	2026-04-25 10:25:09
1461	2399	1	4	2025-08-16 16:38:03	10ca981c875e387c25aa134b7597492607415d60	2026-04-25 10:25:09	2026-04-25 10:25:09
1462	1884	1	4	2025-08-16 16:38:03	10ca981c875e387c25aa134b7597492607415d60	2026-04-25 10:25:09	2026-04-25 10:25:09
1463	4595	1	4	2025-08-16 16:38:03	10ca981c875e387c25aa134b7597492607415d60	2026-04-25 10:25:09	2026-04-25 10:25:09
1464	4989	1	4	2025-08-16 16:38:03	10ca981c875e387c25aa134b7597492607415d60	2026-04-25 10:25:09	2026-04-25 10:25:09
1465	2311	1	4	2025-08-16 16:38:03	10ca981c875e387c25aa134b7597492607415d60	2026-04-25 10:25:09	2026-04-25 10:25:09
1466	2251	1	4	2025-08-16 16:38:03	10ca981c875e387c25aa134b7597492607415d60	2026-04-25 10:25:09	2026-04-25 10:25:09
1467	2798	28	1	2025-07-02 14:56:58	ab4a28490fcad24162608fce827452b32f498142	2026-04-25 10:25:09	2026-04-25 10:25:09
1468	137	28	1	2025-07-02 14:56:58	ab4a28490fcad24162608fce827452b32f498142	2026-04-25 10:25:09	2026-04-25 10:25:09
1469	2488	28	1	2025-07-02 14:56:58	ab4a28490fcad24162608fce827452b32f498142	2026-04-25 10:25:09	2026-04-25 10:25:09
1470	3096	28	1	2025-07-02 14:56:58	ab4a28490fcad24162608fce827452b32f498142	2026-04-25 10:25:09	2026-04-25 10:25:09
1471	2957	28	1	2025-07-02 14:56:58	ab4a28490fcad24162608fce827452b32f498142	2026-04-25 10:25:09	2026-04-25 10:25:09
1472	849	28	1	2025-07-02 14:56:58	ab4a28490fcad24162608fce827452b32f498142	2026-04-25 10:25:09	2026-04-25 10:25:09
1473	4672	28	1	2025-07-02 14:56:58	ab4a28490fcad24162608fce827452b32f498142	2026-04-25 10:25:09	2026-04-25 10:25:09
1474	3208	28	1	2025-07-02 14:56:58	ab4a28490fcad24162608fce827452b32f498142	2026-04-25 10:25:09	2026-04-25 10:25:09
1475	4308	28	1	2025-07-02 14:56:58	ab4a28490fcad24162608fce827452b32f498142	2026-04-25 10:25:09	2026-04-25 10:25:09
1476	2351	35	6	2025-12-28 13:12:18	697954088694df5679e538646ef085cab442d23b	2026-04-25 10:25:09	2026-04-25 10:25:09
1477	2692	35	6	2025-12-28 13:12:18	697954088694df5679e538646ef085cab442d23b	2026-04-25 10:25:09	2026-04-25 10:25:09
1478	2173	35	6	2025-12-28 13:12:18	697954088694df5679e538646ef085cab442d23b	2026-04-25 10:25:09	2026-04-25 10:25:09
1479	4088	35	6	2025-12-28 13:12:18	697954088694df5679e538646ef085cab442d23b	2026-04-25 10:25:09	2026-04-25 10:25:09
1480	1748	35	6	2025-12-28 13:12:18	697954088694df5679e538646ef085cab442d23b	2026-04-25 10:25:09	2026-04-25 10:25:09
1481	152	35	6	2025-12-28 13:12:18	697954088694df5679e538646ef085cab442d23b	2026-04-25 10:25:09	2026-04-25 10:25:09
1482	2502	35	6	2025-12-28 13:12:18	697954088694df5679e538646ef085cab442d23b	2026-04-25 10:25:09	2026-04-25 10:25:09
1483	3189	97	9	2026-02-10 12:44:09	615ea71ba8dc343f0db3ad6b619ad71387c59a17	2026-04-25 10:25:09	2026-04-25 10:25:09
1484	1307	97	9	2026-02-10 12:44:09	615ea71ba8dc343f0db3ad6b619ad71387c59a17	2026-04-25 10:25:09	2026-04-25 10:25:09
1485	425	97	9	2026-02-10 12:44:09	615ea71ba8dc343f0db3ad6b619ad71387c59a17	2026-04-25 10:25:09	2026-04-25 10:25:09
1486	4888	97	9	2026-02-10 12:44:09	615ea71ba8dc343f0db3ad6b619ad71387c59a17	2026-04-25 10:25:09	2026-04-25 10:25:09
1487	4146	97	9	2026-02-10 12:44:09	615ea71ba8dc343f0db3ad6b619ad71387c59a17	2026-04-25 10:25:09	2026-04-25 10:25:09
1488	3425	75	5	2026-01-10 11:54:29	f215877b307e299760d1b00ddebd4f39c0e2fbfc	2026-04-25 10:25:09	2026-04-25 10:25:09
1489	3576	75	5	2026-01-10 11:54:29	f215877b307e299760d1b00ddebd4f39c0e2fbfc	2026-04-25 10:25:09	2026-04-25 10:25:09
1490	1005	75	5	2026-01-10 11:54:29	f215877b307e299760d1b00ddebd4f39c0e2fbfc	2026-04-25 10:25:09	2026-04-25 10:25:09
1491	763	75	5	2026-01-10 11:54:29	f215877b307e299760d1b00ddebd4f39c0e2fbfc	2026-04-25 10:25:09	2026-04-25 10:25:09
1492	1097	75	5	2026-01-10 11:54:29	f215877b307e299760d1b00ddebd4f39c0e2fbfc	2026-04-25 10:25:09	2026-04-25 10:25:09
1493	2062	75	5	2026-01-10 11:54:29	f215877b307e299760d1b00ddebd4f39c0e2fbfc	2026-04-25 10:25:09	2026-04-25 10:25:09
1494	329	75	5	2026-01-10 11:54:29	f215877b307e299760d1b00ddebd4f39c0e2fbfc	2026-04-25 10:25:09	2026-04-25 10:25:09
1495	4369	75	5	2026-01-10 11:54:29	f215877b307e299760d1b00ddebd4f39c0e2fbfc	2026-04-25 10:25:09	2026-04-25 10:25:09
1496	2661	40	7	2025-09-29 10:27:18	e6f71083e48df9040ee63e0772c4149bfb3a005c	2026-04-25 10:25:09	2026-04-25 10:25:09
1497	1976	40	7	2025-09-29 10:27:18	e6f71083e48df9040ee63e0772c4149bfb3a005c	2026-04-25 10:25:09	2026-04-25 10:25:09
1498	3111	40	7	2025-09-29 10:27:18	e6f71083e48df9040ee63e0772c4149bfb3a005c	2026-04-25 10:25:09	2026-04-25 10:25:09
1499	2242	40	7	2025-09-29 10:27:18	e6f71083e48df9040ee63e0772c4149bfb3a005c	2026-04-25 10:25:09	2026-04-25 10:25:09
1500	3278	40	7	2025-09-29 10:27:18	e6f71083e48df9040ee63e0772c4149bfb3a005c	2026-04-25 10:25:09	2026-04-25 10:25:09
1501	3789	40	7	2025-09-29 10:27:18	e6f71083e48df9040ee63e0772c4149bfb3a005c	2026-04-25 10:25:09	2026-04-25 10:25:09
1502	3171	40	7	2025-09-29 10:27:18	e6f71083e48df9040ee63e0772c4149bfb3a005c	2026-04-25 10:25:09	2026-04-25 10:25:09
1503	4875	40	7	2025-09-29 10:27:18	e6f71083e48df9040ee63e0772c4149bfb3a005c	2026-04-25 10:25:09	2026-04-25 10:25:09
1504	4709	40	7	2025-09-29 10:27:18	e6f71083e48df9040ee63e0772c4149bfb3a005c	2026-04-25 10:25:09	2026-04-25 10:25:09
1505	3620	40	7	2025-09-29 10:27:18	e6f71083e48df9040ee63e0772c4149bfb3a005c	2026-04-25 10:25:09	2026-04-25 10:25:09
1506	1109	26	1	2026-02-27 15:12:26	b75752ba45cf5a7bb889822bf1a3bce8ab28669f	2026-04-25 10:25:09	2026-04-25 10:25:09
1507	4384	26	1	2026-02-27 15:12:26	b75752ba45cf5a7bb889822bf1a3bce8ab28669f	2026-04-25 10:25:09	2026-04-25 10:25:09
1508	33	26	1	2026-02-27 15:12:26	b75752ba45cf5a7bb889822bf1a3bce8ab28669f	2026-04-25 10:25:09	2026-04-25 10:25:09
1509	3562	26	1	2026-02-27 15:12:26	b75752ba45cf5a7bb889822bf1a3bce8ab28669f	2026-04-25 10:25:09	2026-04-25 10:25:09
1510	2768	26	1	2026-02-27 15:12:26	b75752ba45cf5a7bb889822bf1a3bce8ab28669f	2026-04-25 10:25:09	2026-04-25 10:25:09
1511	2773	68	7	2025-09-01 10:05:16	2bd4f34dda533e237a8a04a7801b73ca4e938f95	2026-04-25 10:25:09	2026-04-25 10:25:09
1512	572	68	7	2025-09-01 10:05:16	2bd4f34dda533e237a8a04a7801b73ca4e938f95	2026-04-25 10:25:09	2026-04-25 10:25:09
1513	623	27	2	2025-11-23 09:56:43	88abd92aa2ed81952f2ea9fed550bdd66448f5a6	2026-04-25 10:25:09	2026-04-25 10:25:09
1514	412	27	2	2025-11-23 09:56:43	88abd92aa2ed81952f2ea9fed550bdd66448f5a6	2026-04-25 10:25:09	2026-04-25 10:25:09
1515	214	27	2	2025-11-23 09:56:43	88abd92aa2ed81952f2ea9fed550bdd66448f5a6	2026-04-25 10:25:09	2026-04-25 10:25:09
1516	2980	27	2	2025-11-23 09:56:43	88abd92aa2ed81952f2ea9fed550bdd66448f5a6	2026-04-25 10:25:09	2026-04-25 10:25:09
1517	621	27	2	2025-11-23 09:56:43	88abd92aa2ed81952f2ea9fed550bdd66448f5a6	2026-04-25 10:25:09	2026-04-25 10:25:09
1518	1305	27	2	2025-11-23 09:56:43	88abd92aa2ed81952f2ea9fed550bdd66448f5a6	2026-04-25 10:25:09	2026-04-25 10:25:09
1519	4084	27	2	2025-11-23 09:56:43	88abd92aa2ed81952f2ea9fed550bdd66448f5a6	2026-04-25 10:25:09	2026-04-25 10:25:09
1520	4914	27	2	2025-11-23 09:56:43	88abd92aa2ed81952f2ea9fed550bdd66448f5a6	2026-04-25 10:25:09	2026-04-25 10:25:09
1521	1814	27	2	2025-11-23 09:56:43	88abd92aa2ed81952f2ea9fed550bdd66448f5a6	2026-04-25 10:25:09	2026-04-25 10:25:09
1522	1156	72	2	2025-05-31 09:31:31	86f46f2df979db77df4664a87f135a2bc45d9fe0	2026-04-25 10:25:09	2026-04-25 10:25:09
1523	4776	72	2	2025-05-31 09:31:31	86f46f2df979db77df4664a87f135a2bc45d9fe0	2026-04-25 10:25:09	2026-04-25 10:25:09
1524	605	72	2	2025-05-31 09:31:31	86f46f2df979db77df4664a87f135a2bc45d9fe0	2026-04-25 10:25:09	2026-04-25 10:25:09
1525	3978	72	2	2025-05-31 09:31:31	86f46f2df979db77df4664a87f135a2bc45d9fe0	2026-04-25 10:25:09	2026-04-25 10:25:09
1526	1464	72	2	2025-05-31 09:31:31	86f46f2df979db77df4664a87f135a2bc45d9fe0	2026-04-25 10:25:09	2026-04-25 10:25:09
1527	256	72	2	2025-05-31 09:31:31	86f46f2df979db77df4664a87f135a2bc45d9fe0	2026-04-25 10:25:09	2026-04-25 10:25:09
1528	783	72	2	2025-05-31 09:31:31	86f46f2df979db77df4664a87f135a2bc45d9fe0	2026-04-25 10:25:09	2026-04-25 10:25:09
1529	2257	72	2	2025-05-31 09:31:31	86f46f2df979db77df4664a87f135a2bc45d9fe0	2026-04-25 10:25:09	2026-04-25 10:25:09
1530	3820	72	2	2025-05-31 09:31:31	86f46f2df979db77df4664a87f135a2bc45d9fe0	2026-04-25 10:25:09	2026-04-25 10:25:09
1531	4073	19	3	2025-08-13 12:28:56	2580557f75437d2813b4cced3a095e19ec0f8063	2026-04-25 10:25:09	2026-04-25 10:25:09
1532	4619	19	3	2025-08-13 12:28:56	2580557f75437d2813b4cced3a095e19ec0f8063	2026-04-25 10:25:09	2026-04-25 10:25:09
1533	2665	19	3	2025-08-13 12:28:56	2580557f75437d2813b4cced3a095e19ec0f8063	2026-04-25 10:25:09	2026-04-25 10:25:09
1534	3699	19	3	2025-08-13 12:28:56	2580557f75437d2813b4cced3a095e19ec0f8063	2026-04-25 10:25:09	2026-04-25 10:25:09
1535	2882	19	3	2025-08-13 12:28:56	2580557f75437d2813b4cced3a095e19ec0f8063	2026-04-25 10:25:09	2026-04-25 10:25:09
1536	63	19	3	2025-08-13 12:28:56	2580557f75437d2813b4cced3a095e19ec0f8063	2026-04-25 10:25:09	2026-04-25 10:25:09
1537	1177	19	3	2025-08-13 12:28:56	2580557f75437d2813b4cced3a095e19ec0f8063	2026-04-25 10:25:09	2026-04-25 10:25:09
1538	209	14	3	2025-10-08 13:00:31	17c95be3e54b555f332c013d3e65d1ed75c7ae98	2026-04-25 10:25:09	2026-04-25 10:25:09
1539	1784	14	3	2025-10-08 13:00:31	17c95be3e54b555f332c013d3e65d1ed75c7ae98	2026-04-25 10:25:09	2026-04-25 10:25:09
1540	2555	14	3	2025-10-08 13:00:31	17c95be3e54b555f332c013d3e65d1ed75c7ae98	2026-04-25 10:25:09	2026-04-25 10:25:09
1541	21	14	3	2025-10-08 13:00:31	17c95be3e54b555f332c013d3e65d1ed75c7ae98	2026-04-25 10:25:09	2026-04-25 10:25:09
1542	4084	14	3	2025-10-08 13:00:31	17c95be3e54b555f332c013d3e65d1ed75c7ae98	2026-04-25 10:25:09	2026-04-25 10:25:09
1543	3955	14	3	2025-10-08 13:00:31	17c95be3e54b555f332c013d3e65d1ed75c7ae98	2026-04-25 10:25:09	2026-04-25 10:25:09
1544	1142	14	3	2025-10-08 13:00:31	17c95be3e54b555f332c013d3e65d1ed75c7ae98	2026-04-25 10:25:09	2026-04-25 10:25:09
1545	1583	14	3	2025-10-08 13:00:31	17c95be3e54b555f332c013d3e65d1ed75c7ae98	2026-04-25 10:25:09	2026-04-25 10:25:09
1546	284	14	3	2025-10-08 13:00:31	17c95be3e54b555f332c013d3e65d1ed75c7ae98	2026-04-25 10:25:09	2026-04-25 10:25:09
1547	3217	63	8	2025-11-04 09:30:08	7b81d9186720f4d676729419657f299e8e9e11dc	2026-04-25 10:25:09	2026-04-25 10:25:09
1548	488	63	8	2025-11-04 09:30:08	7b81d9186720f4d676729419657f299e8e9e11dc	2026-04-25 10:25:09	2026-04-25 10:25:09
1549	2805	63	8	2025-11-04 09:30:08	7b81d9186720f4d676729419657f299e8e9e11dc	2026-04-25 10:25:09	2026-04-25 10:25:09
1550	4295	63	8	2025-11-04 09:30:08	7b81d9186720f4d676729419657f299e8e9e11dc	2026-04-25 10:25:09	2026-04-25 10:25:09
1551	1398	63	8	2025-11-04 09:30:08	7b81d9186720f4d676729419657f299e8e9e11dc	2026-04-25 10:25:09	2026-04-25 10:25:09
1552	3190	63	8	2025-11-04 09:30:08	7b81d9186720f4d676729419657f299e8e9e11dc	2026-04-25 10:25:09	2026-04-25 10:25:09
1553	4370	63	8	2025-11-04 09:30:08	7b81d9186720f4d676729419657f299e8e9e11dc	2026-04-25 10:25:09	2026-04-25 10:25:09
1554	4959	52	6	2025-12-21 12:23:45	a3f42aa901c617c3dbbc721c7f488f3b7b7a43f3	2026-04-25 10:25:09	2026-04-25 10:25:09
1555	2359	52	6	2025-12-21 12:23:45	a3f42aa901c617c3dbbc721c7f488f3b7b7a43f3	2026-04-25 10:25:09	2026-04-25 10:25:09
1556	3336	52	6	2025-12-21 12:23:45	a3f42aa901c617c3dbbc721c7f488f3b7b7a43f3	2026-04-25 10:25:09	2026-04-25 10:25:09
1557	1415	52	6	2025-12-21 12:23:45	a3f42aa901c617c3dbbc721c7f488f3b7b7a43f3	2026-04-25 10:25:09	2026-04-25 10:25:09
1558	2074	52	6	2025-12-21 12:23:45	a3f42aa901c617c3dbbc721c7f488f3b7b7a43f3	2026-04-25 10:25:09	2026-04-25 10:25:09
1559	3862	55	9	2025-12-05 17:17:54	c3dcfd9a85f597dfee1a3716662b3be3d04b114a	2026-04-25 10:25:09	2026-04-25 10:25:09
1560	923	55	9	2025-12-05 17:17:54	c3dcfd9a85f597dfee1a3716662b3be3d04b114a	2026-04-25 10:25:09	2026-04-25 10:25:09
1561	3782	55	9	2025-12-05 17:17:54	c3dcfd9a85f597dfee1a3716662b3be3d04b114a	2026-04-25 10:25:09	2026-04-25 10:25:09
1562	790	55	9	2025-12-05 17:17:54	c3dcfd9a85f597dfee1a3716662b3be3d04b114a	2026-04-25 10:25:09	2026-04-25 10:25:09
1563	2276	55	9	2025-12-05 17:17:54	c3dcfd9a85f597dfee1a3716662b3be3d04b114a	2026-04-25 10:25:09	2026-04-25 10:25:09
1564	4886	55	9	2025-12-05 17:17:54	c3dcfd9a85f597dfee1a3716662b3be3d04b114a	2026-04-25 10:25:09	2026-04-25 10:25:09
1565	2436	55	9	2025-12-05 17:17:54	c3dcfd9a85f597dfee1a3716662b3be3d04b114a	2026-04-25 10:25:09	2026-04-25 10:25:09
1566	4940	55	9	2025-12-05 17:17:54	c3dcfd9a85f597dfee1a3716662b3be3d04b114a	2026-04-25 10:25:09	2026-04-25 10:25:09
1567	2157	55	9	2025-12-05 17:17:54	c3dcfd9a85f597dfee1a3716662b3be3d04b114a	2026-04-25 10:25:09	2026-04-25 10:25:09
1568	2906	98	7	2026-04-14 12:31:57	5dcd4f56333c5c259462c8682d3ce99d1d0d336e	2026-04-25 10:25:09	2026-04-25 10:25:09
1569	2311	98	7	2026-04-14 12:31:57	5dcd4f56333c5c259462c8682d3ce99d1d0d336e	2026-04-25 10:25:09	2026-04-25 10:25:09
1570	4028	98	7	2026-04-14 12:31:57	5dcd4f56333c5c259462c8682d3ce99d1d0d336e	2026-04-25 10:25:09	2026-04-25 10:25:09
1571	1236	98	7	2026-04-14 12:31:57	5dcd4f56333c5c259462c8682d3ce99d1d0d336e	2026-04-25 10:25:09	2026-04-25 10:25:09
1572	1029	98	7	2026-04-14 12:31:57	5dcd4f56333c5c259462c8682d3ce99d1d0d336e	2026-04-25 10:25:09	2026-04-25 10:25:09
1573	19	98	7	2026-04-14 12:31:57	5dcd4f56333c5c259462c8682d3ce99d1d0d336e	2026-04-25 10:25:09	2026-04-25 10:25:09
1574	923	48	6	2025-12-13 10:31:49	e809f2142b0647d567f0a8842ab7d6bf54d80b9f	2026-04-25 10:25:09	2026-04-25 10:25:09
1575	2252	48	6	2025-12-13 10:31:49	e809f2142b0647d567f0a8842ab7d6bf54d80b9f	2026-04-25 10:25:09	2026-04-25 10:25:09
1576	1825	48	6	2025-12-13 10:31:49	e809f2142b0647d567f0a8842ab7d6bf54d80b9f	2026-04-25 10:25:09	2026-04-25 10:25:09
1577	3244	48	6	2025-12-13 10:31:49	e809f2142b0647d567f0a8842ab7d6bf54d80b9f	2026-04-25 10:25:09	2026-04-25 10:25:09
1578	4340	48	6	2025-12-13 10:31:49	e809f2142b0647d567f0a8842ab7d6bf54d80b9f	2026-04-25 10:25:09	2026-04-25 10:25:09
1579	3496	9	10	2026-04-02 11:04:09	3e649efaf6c63c2ce1cf8773c6a83cba33faa05f	2026-04-25 10:25:09	2026-04-25 10:25:09
1580	4830	9	10	2026-04-02 11:04:09	3e649efaf6c63c2ce1cf8773c6a83cba33faa05f	2026-04-25 10:25:09	2026-04-25 10:25:09
1581	4116	9	10	2026-04-02 11:04:09	3e649efaf6c63c2ce1cf8773c6a83cba33faa05f	2026-04-25 10:25:09	2026-04-25 10:25:09
1582	2619	9	10	2026-04-02 11:04:09	3e649efaf6c63c2ce1cf8773c6a83cba33faa05f	2026-04-25 10:25:09	2026-04-25 10:25:09
1583	4948	9	10	2026-04-02 11:04:09	3e649efaf6c63c2ce1cf8773c6a83cba33faa05f	2026-04-25 10:25:09	2026-04-25 10:25:09
1584	2655	9	10	2026-04-02 11:04:09	3e649efaf6c63c2ce1cf8773c6a83cba33faa05f	2026-04-25 10:25:09	2026-04-25 10:25:09
1585	263	9	10	2026-04-02 11:04:09	3e649efaf6c63c2ce1cf8773c6a83cba33faa05f	2026-04-25 10:25:09	2026-04-25 10:25:09
1586	3636	9	10	2026-04-02 11:04:09	3e649efaf6c63c2ce1cf8773c6a83cba33faa05f	2026-04-25 10:25:09	2026-04-25 10:25:09
1587	4330	9	10	2026-04-02 11:04:09	3e649efaf6c63c2ce1cf8773c6a83cba33faa05f	2026-04-25 10:25:09	2026-04-25 10:25:09
1588	4752	9	10	2026-04-02 11:04:09	3e649efaf6c63c2ce1cf8773c6a83cba33faa05f	2026-04-25 10:25:09	2026-04-25 10:25:09
1589	1071	69	2	2026-03-23 17:27:31	b90cc82c29e5392f50521fba7599c5b968b3b81b	2026-04-25 10:25:09	2026-04-25 10:25:09
1590	1116	69	2	2026-03-23 17:27:31	b90cc82c29e5392f50521fba7599c5b968b3b81b	2026-04-25 10:25:09	2026-04-25 10:25:09
1591	4222	69	2	2026-03-23 17:27:31	b90cc82c29e5392f50521fba7599c5b968b3b81b	2026-04-25 10:25:09	2026-04-25 10:25:09
1592	4597	69	2	2026-03-23 17:27:31	b90cc82c29e5392f50521fba7599c5b968b3b81b	2026-04-25 10:25:09	2026-04-25 10:25:09
1593	719	69	2	2026-03-23 17:27:31	b90cc82c29e5392f50521fba7599c5b968b3b81b	2026-04-25 10:25:09	2026-04-25 10:25:09
1594	3338	69	2	2026-03-23 17:27:31	b90cc82c29e5392f50521fba7599c5b968b3b81b	2026-04-25 10:25:09	2026-04-25 10:25:09
1595	1246	11	8	2025-07-22 13:28:52	92b6ec162d2076aaf4ea13b10c540345fd1ebc4a	2026-04-25 10:25:09	2026-04-25 10:25:09
1596	2981	11	8	2025-07-22 13:28:52	92b6ec162d2076aaf4ea13b10c540345fd1ebc4a	2026-04-25 10:25:09	2026-04-25 10:25:09
1597	740	2	10	2026-01-08 16:44:33	2338a43a9386f1a268b4af45f9dd35bdee322d96	2026-04-25 10:25:09	2026-04-25 10:25:09
1598	1591	2	10	2026-01-08 16:44:33	2338a43a9386f1a268b4af45f9dd35bdee322d96	2026-04-25 10:25:09	2026-04-25 10:25:09
1599	2135	2	10	2026-01-08 16:44:33	2338a43a9386f1a268b4af45f9dd35bdee322d96	2026-04-25 10:25:09	2026-04-25 10:25:09
1600	1392	2	10	2026-01-08 16:44:33	2338a43a9386f1a268b4af45f9dd35bdee322d96	2026-04-25 10:25:09	2026-04-25 10:25:09
1601	2229	2	10	2026-01-08 16:44:33	2338a43a9386f1a268b4af45f9dd35bdee322d96	2026-04-25 10:25:09	2026-04-25 10:25:09
1602	4861	45	1	2026-02-27 13:01:28	00292238915dcbd215e71e05054d454c59782835	2026-04-25 10:25:09	2026-04-25 10:25:09
1603	2632	45	1	2026-02-27 13:01:28	00292238915dcbd215e71e05054d454c59782835	2026-04-25 10:25:09	2026-04-25 10:25:09
1604	4227	45	1	2026-02-27 13:01:28	00292238915dcbd215e71e05054d454c59782835	2026-04-25 10:25:09	2026-04-25 10:25:09
1605	3852	45	1	2026-02-27 13:01:28	00292238915dcbd215e71e05054d454c59782835	2026-04-25 10:25:09	2026-04-25 10:25:09
1606	3089	45	1	2026-02-27 13:01:28	00292238915dcbd215e71e05054d454c59782835	2026-04-25 10:25:09	2026-04-25 10:25:09
1607	4150	45	1	2026-02-27 13:01:28	00292238915dcbd215e71e05054d454c59782835	2026-04-25 10:25:09	2026-04-25 10:25:09
1608	2093	87	1	2025-04-27 16:52:44	038b123f9889d1b75a6b34f59b5b5c3d8edd11e2	2026-04-25 10:25:09	2026-04-25 10:25:09
1609	52	87	1	2025-04-27 16:52:44	038b123f9889d1b75a6b34f59b5b5c3d8edd11e2	2026-04-25 10:25:09	2026-04-25 10:25:09
1610	1445	87	1	2025-04-27 16:52:44	038b123f9889d1b75a6b34f59b5b5c3d8edd11e2	2026-04-25 10:25:09	2026-04-25 10:25:09
1611	1027	87	1	2025-04-27 16:52:44	038b123f9889d1b75a6b34f59b5b5c3d8edd11e2	2026-04-25 10:25:09	2026-04-25 10:25:09
1612	2669	87	1	2025-04-27 16:52:44	038b123f9889d1b75a6b34f59b5b5c3d8edd11e2	2026-04-25 10:25:09	2026-04-25 10:25:09
1613	1039	87	1	2025-04-27 16:52:44	038b123f9889d1b75a6b34f59b5b5c3d8edd11e2	2026-04-25 10:25:09	2026-04-25 10:25:09
1614	118	13	3	2026-04-12 12:27:11	863b0c52c33f2a702b17d82343550a112af5918b	2026-04-25 10:25:09	2026-04-25 10:25:09
1615	4109	13	3	2026-04-12 12:27:11	863b0c52c33f2a702b17d82343550a112af5918b	2026-04-25 10:25:09	2026-04-25 10:25:09
1616	667	13	3	2026-04-12 12:27:11	863b0c52c33f2a702b17d82343550a112af5918b	2026-04-25 10:25:09	2026-04-25 10:25:09
1617	4715	13	3	2026-04-12 12:27:11	863b0c52c33f2a702b17d82343550a112af5918b	2026-04-25 10:25:09	2026-04-25 10:25:09
1618	2482	13	3	2026-04-12 12:27:11	863b0c52c33f2a702b17d82343550a112af5918b	2026-04-25 10:25:09	2026-04-25 10:25:09
1619	4384	13	3	2026-04-12 12:27:11	863b0c52c33f2a702b17d82343550a112af5918b	2026-04-25 10:25:09	2026-04-25 10:25:09
1620	592	13	3	2026-04-12 12:27:11	863b0c52c33f2a702b17d82343550a112af5918b	2026-04-25 10:25:09	2026-04-25 10:25:09
1621	4130	13	3	2026-04-12 12:27:11	863b0c52c33f2a702b17d82343550a112af5918b	2026-04-25 10:25:09	2026-04-25 10:25:09
1622	4899	13	3	2026-04-12 12:27:11	863b0c52c33f2a702b17d82343550a112af5918b	2026-04-25 10:25:09	2026-04-25 10:25:09
1623	2865	10	10	2025-10-11 17:32:07	37f1c3b9a315e23f5853b308f8577be9aeca69d6	2026-04-25 10:25:09	2026-04-25 10:25:09
1624	1064	10	10	2025-10-11 17:32:07	37f1c3b9a315e23f5853b308f8577be9aeca69d6	2026-04-25 10:25:09	2026-04-25 10:25:09
1625	4145	10	10	2025-10-11 17:32:07	37f1c3b9a315e23f5853b308f8577be9aeca69d6	2026-04-25 10:25:09	2026-04-25 10:25:09
1626	1470	10	10	2025-10-11 17:32:07	37f1c3b9a315e23f5853b308f8577be9aeca69d6	2026-04-25 10:25:09	2026-04-25 10:25:09
1627	4568	10	10	2025-10-11 17:32:07	37f1c3b9a315e23f5853b308f8577be9aeca69d6	2026-04-25 10:25:09	2026-04-25 10:25:09
1628	1988	10	10	2025-10-11 17:32:07	37f1c3b9a315e23f5853b308f8577be9aeca69d6	2026-04-25 10:25:09	2026-04-25 10:25:09
1629	1232	10	10	2025-10-11 17:32:07	37f1c3b9a315e23f5853b308f8577be9aeca69d6	2026-04-25 10:25:09	2026-04-25 10:25:09
1630	791	10	10	2025-10-11 17:32:07	37f1c3b9a315e23f5853b308f8577be9aeca69d6	2026-04-25 10:25:09	2026-04-25 10:25:09
1631	3735	89	10	2025-06-18 10:54:05	c5aba426fe5d7df367599e6a9d0138cad1aba2c0	2026-04-25 10:25:09	2026-04-25 10:25:09
1632	4234	89	10	2025-06-18 10:54:05	c5aba426fe5d7df367599e6a9d0138cad1aba2c0	2026-04-25 10:25:09	2026-04-25 10:25:09
1633	3939	89	10	2025-06-18 10:54:05	c5aba426fe5d7df367599e6a9d0138cad1aba2c0	2026-04-25 10:25:09	2026-04-25 10:25:09
1634	2981	89	10	2025-06-18 10:54:05	c5aba426fe5d7df367599e6a9d0138cad1aba2c0	2026-04-25 10:25:09	2026-04-25 10:25:09
1635	2221	89	10	2025-06-18 10:54:05	c5aba426fe5d7df367599e6a9d0138cad1aba2c0	2026-04-25 10:25:09	2026-04-25 10:25:09
1636	4266	89	10	2025-06-18 10:54:05	c5aba426fe5d7df367599e6a9d0138cad1aba2c0	2026-04-25 10:25:09	2026-04-25 10:25:09
1637	4240	89	10	2025-06-18 10:54:05	c5aba426fe5d7df367599e6a9d0138cad1aba2c0	2026-04-25 10:25:09	2026-04-25 10:25:09
1638	4614	89	10	2025-06-18 10:54:05	c5aba426fe5d7df367599e6a9d0138cad1aba2c0	2026-04-25 10:25:09	2026-04-25 10:25:09
1639	577	89	10	2025-06-18 10:54:05	c5aba426fe5d7df367599e6a9d0138cad1aba2c0	2026-04-25 10:25:09	2026-04-25 10:25:09
1640	2796	89	10	2025-06-18 10:54:05	c5aba426fe5d7df367599e6a9d0138cad1aba2c0	2026-04-25 10:25:09	2026-04-25 10:25:09
1641	3634	66	6	2025-09-02 11:15:07	d770a2e51623c35f602c2f53029b09e669c6037e	2026-04-25 10:25:09	2026-04-25 10:25:09
1642	1696	66	6	2025-09-02 11:15:07	d770a2e51623c35f602c2f53029b09e669c6037e	2026-04-25 10:25:09	2026-04-25 10:25:09
1643	2822	82	2	2025-08-16 12:52:52	afcea258b1ecf6fb96a821aad42e8a71f3547f6d	2026-04-25 10:25:09	2026-04-25 10:25:09
1644	203	82	2	2025-08-16 12:52:52	afcea258b1ecf6fb96a821aad42e8a71f3547f6d	2026-04-25 10:25:09	2026-04-25 10:25:09
1645	2581	82	2	2025-08-16 12:52:52	afcea258b1ecf6fb96a821aad42e8a71f3547f6d	2026-04-25 10:25:09	2026-04-25 10:25:09
1646	4284	82	2	2025-08-16 12:52:52	afcea258b1ecf6fb96a821aad42e8a71f3547f6d	2026-04-25 10:25:09	2026-04-25 10:25:09
1647	2793	82	2	2025-08-16 12:52:52	afcea258b1ecf6fb96a821aad42e8a71f3547f6d	2026-04-25 10:25:09	2026-04-25 10:25:09
1648	4548	82	2	2025-08-16 12:52:52	afcea258b1ecf6fb96a821aad42e8a71f3547f6d	2026-04-25 10:25:09	2026-04-25 10:25:09
1649	300	25	6	2026-02-03 16:51:15	680730083eed0e32ff4cd8f60bee131de0acbec5	2026-04-25 10:25:09	2026-04-25 10:25:09
1650	744	25	6	2026-02-03 16:51:15	680730083eed0e32ff4cd8f60bee131de0acbec5	2026-04-25 10:25:09	2026-04-25 10:25:09
1651	748	25	6	2026-02-03 16:51:15	680730083eed0e32ff4cd8f60bee131de0acbec5	2026-04-25 10:25:09	2026-04-25 10:25:09
1652	1663	25	6	2026-02-03 16:51:15	680730083eed0e32ff4cd8f60bee131de0acbec5	2026-04-25 10:25:09	2026-04-25 10:25:09
1653	722	8	9	2025-05-21 13:53:15	18f681c05e7dadc30da22c17082151d94a83ec83	2026-04-25 10:25:09	2026-04-25 10:25:09
1654	456	8	9	2025-05-21 13:53:15	18f681c05e7dadc30da22c17082151d94a83ec83	2026-04-25 10:25:09	2026-04-25 10:25:09
1655	4731	8	9	2025-05-21 13:53:15	18f681c05e7dadc30da22c17082151d94a83ec83	2026-04-25 10:25:09	2026-04-25 10:25:09
1656	456	8	9	2025-05-21 13:53:15	18f681c05e7dadc30da22c17082151d94a83ec83	2026-04-25 10:25:09	2026-04-25 10:25:09
1657	4663	8	9	2025-05-21 13:53:15	18f681c05e7dadc30da22c17082151d94a83ec83	2026-04-25 10:25:09	2026-04-25 10:25:09
1658	4368	8	9	2025-05-21 13:53:15	18f681c05e7dadc30da22c17082151d94a83ec83	2026-04-25 10:25:09	2026-04-25 10:25:09
1659	2625	8	9	2025-05-21 13:53:15	18f681c05e7dadc30da22c17082151d94a83ec83	2026-04-25 10:25:09	2026-04-25 10:25:09
1660	3733	83	8	2025-05-25 12:31:19	25b8961c7cbb78483bb659b2442641eccf65796f	2026-04-25 10:25:09	2026-04-25 10:25:09
1661	59	83	8	2025-05-25 12:31:19	25b8961c7cbb78483bb659b2442641eccf65796f	2026-04-25 10:25:09	2026-04-25 10:25:09
1662	1144	83	8	2025-05-25 12:31:19	25b8961c7cbb78483bb659b2442641eccf65796f	2026-04-25 10:25:09	2026-04-25 10:25:09
1663	2501	83	8	2025-05-25 12:31:19	25b8961c7cbb78483bb659b2442641eccf65796f	2026-04-25 10:25:09	2026-04-25 10:25:09
1664	3762	83	8	2025-05-25 12:31:19	25b8961c7cbb78483bb659b2442641eccf65796f	2026-04-25 10:25:09	2026-04-25 10:25:09
1665	3674	83	8	2025-05-25 12:31:19	25b8961c7cbb78483bb659b2442641eccf65796f	2026-04-25 10:25:09	2026-04-25 10:25:09
1666	4996	83	8	2025-05-25 12:31:19	25b8961c7cbb78483bb659b2442641eccf65796f	2026-04-25 10:25:09	2026-04-25 10:25:09
1667	4995	62	3	2026-03-10 16:44:08	7e49877e92bd8104d2ebe7495413db3dd2c8f80a	2026-04-25 10:25:09	2026-04-25 10:25:09
1668	3492	62	3	2026-03-10 16:44:08	7e49877e92bd8104d2ebe7495413db3dd2c8f80a	2026-04-25 10:25:09	2026-04-25 10:25:09
1669	3117	62	3	2026-03-10 16:44:08	7e49877e92bd8104d2ebe7495413db3dd2c8f80a	2026-04-25 10:25:09	2026-04-25 10:25:09
1670	1370	62	3	2026-03-10 16:44:08	7e49877e92bd8104d2ebe7495413db3dd2c8f80a	2026-04-25 10:25:09	2026-04-25 10:25:09
1671	736	62	3	2026-03-10 16:44:08	7e49877e92bd8104d2ebe7495413db3dd2c8f80a	2026-04-25 10:25:09	2026-04-25 10:25:09
1672	4284	62	3	2026-03-10 16:44:08	7e49877e92bd8104d2ebe7495413db3dd2c8f80a	2026-04-25 10:25:09	2026-04-25 10:25:09
1673	3374	62	3	2026-03-10 16:44:08	7e49877e92bd8104d2ebe7495413db3dd2c8f80a	2026-04-25 10:25:09	2026-04-25 10:25:09
1674	1394	62	3	2026-03-10 16:44:08	7e49877e92bd8104d2ebe7495413db3dd2c8f80a	2026-04-25 10:25:09	2026-04-25 10:25:09
1675	1887	67	7	2026-01-26 15:48:58	e12059a35e3f78eecccef8e48f633a4107576526	2026-04-25 10:25:09	2026-04-25 10:25:09
1676	3823	67	7	2026-01-26 15:48:58	e12059a35e3f78eecccef8e48f633a4107576526	2026-04-25 10:25:09	2026-04-25 10:25:09
1677	3134	69	8	2025-12-20 09:12:04	8661fd5183e2da0625e94f57e5a08cf37cc6fced	2026-04-25 10:25:09	2026-04-25 10:25:09
1678	744	69	8	2025-12-20 09:12:04	8661fd5183e2da0625e94f57e5a08cf37cc6fced	2026-04-25 10:25:09	2026-04-25 10:25:09
1679	1506	69	8	2025-12-20 09:12:04	8661fd5183e2da0625e94f57e5a08cf37cc6fced	2026-04-25 10:25:09	2026-04-25 10:25:09
1680	1532	69	8	2025-12-20 09:12:04	8661fd5183e2da0625e94f57e5a08cf37cc6fced	2026-04-25 10:25:09	2026-04-25 10:25:09
1681	2421	50	7	2025-12-11 09:59:12	abab6d0418e95cfe0a2d126ec150e9ae660441d2	2026-04-25 10:25:09	2026-04-25 10:25:09
1682	3555	50	7	2025-12-11 09:59:12	abab6d0418e95cfe0a2d126ec150e9ae660441d2	2026-04-25 10:25:09	2026-04-25 10:25:09
1683	2249	50	7	2025-12-11 09:59:12	abab6d0418e95cfe0a2d126ec150e9ae660441d2	2026-04-25 10:25:09	2026-04-25 10:25:09
1684	3737	53	4	2026-01-11 14:52:28	c8c580a51e294cc704e74addf1a8ef6c823057ef	2026-04-25 10:25:09	2026-04-25 10:25:09
1685	2281	53	4	2026-01-11 14:52:28	c8c580a51e294cc704e74addf1a8ef6c823057ef	2026-04-25 10:25:09	2026-04-25 10:25:09
1686	125	53	4	2026-01-11 14:52:28	c8c580a51e294cc704e74addf1a8ef6c823057ef	2026-04-25 10:25:09	2026-04-25 10:25:09
1687	3133	53	4	2026-01-11 14:52:28	c8c580a51e294cc704e74addf1a8ef6c823057ef	2026-04-25 10:25:09	2026-04-25 10:25:09
1688	1478	53	4	2026-01-11 14:52:28	c8c580a51e294cc704e74addf1a8ef6c823057ef	2026-04-25 10:25:09	2026-04-25 10:25:09
1689	42	76	8	2026-02-20 14:24:28	a779d50afb8b3e07edd7712835cf4cc4e6b1b752	2026-04-25 10:25:09	2026-04-25 10:25:09
1690	4685	76	8	2026-02-20 14:24:28	a779d50afb8b3e07edd7712835cf4cc4e6b1b752	2026-04-25 10:25:09	2026-04-25 10:25:09
1691	2331	76	8	2026-02-20 14:24:28	a779d50afb8b3e07edd7712835cf4cc4e6b1b752	2026-04-25 10:25:09	2026-04-25 10:25:09
1692	2540	76	8	2026-02-20 14:24:28	a779d50afb8b3e07edd7712835cf4cc4e6b1b752	2026-04-25 10:25:09	2026-04-25 10:25:09
1693	4172	76	8	2026-02-20 14:24:28	a779d50afb8b3e07edd7712835cf4cc4e6b1b752	2026-04-25 10:25:09	2026-04-25 10:25:09
1694	4037	76	8	2026-02-20 14:24:28	a779d50afb8b3e07edd7712835cf4cc4e6b1b752	2026-04-25 10:25:09	2026-04-25 10:25:09
1695	3276	76	8	2026-02-20 14:24:28	a779d50afb8b3e07edd7712835cf4cc4e6b1b752	2026-04-25 10:25:09	2026-04-25 10:25:09
1696	4261	76	8	2026-02-20 14:24:28	a779d50afb8b3e07edd7712835cf4cc4e6b1b752	2026-04-25 10:25:09	2026-04-25 10:25:09
1697	4417	28	3	2025-09-30 16:08:36	8dc7295c290dba8b223acc0adc0e8eb63aaa8ad3	2026-04-25 10:25:09	2026-04-25 10:25:09
1698	3482	28	3	2025-09-30 16:08:36	8dc7295c290dba8b223acc0adc0e8eb63aaa8ad3	2026-04-25 10:25:09	2026-04-25 10:25:09
1699	2553	28	3	2025-09-30 16:08:36	8dc7295c290dba8b223acc0adc0e8eb63aaa8ad3	2026-04-25 10:25:09	2026-04-25 10:25:09
1700	4944	28	3	2025-09-30 16:08:36	8dc7295c290dba8b223acc0adc0e8eb63aaa8ad3	2026-04-25 10:25:09	2026-04-25 10:25:09
1701	3129	28	3	2025-09-30 16:08:36	8dc7295c290dba8b223acc0adc0e8eb63aaa8ad3	2026-04-25 10:25:09	2026-04-25 10:25:09
1702	4688	28	3	2025-09-30 16:08:36	8dc7295c290dba8b223acc0adc0e8eb63aaa8ad3	2026-04-25 10:25:09	2026-04-25 10:25:09
1703	3624	28	3	2025-09-30 16:08:36	8dc7295c290dba8b223acc0adc0e8eb63aaa8ad3	2026-04-25 10:25:09	2026-04-25 10:25:09
1704	650	28	3	2025-09-30 16:08:36	8dc7295c290dba8b223acc0adc0e8eb63aaa8ad3	2026-04-25 10:25:09	2026-04-25 10:25:09
1705	483	28	3	2025-09-30 16:08:36	8dc7295c290dba8b223acc0adc0e8eb63aaa8ad3	2026-04-25 10:25:09	2026-04-25 10:25:09
1706	2967	18	6	2025-11-14 14:53:18	afa2ad7f1a3185bd296a921b187fbeabd13a9748	2026-04-25 10:25:09	2026-04-25 10:25:09
1707	615	18	6	2025-11-14 14:53:18	afa2ad7f1a3185bd296a921b187fbeabd13a9748	2026-04-25 10:25:09	2026-04-25 10:25:09
1708	424	18	6	2025-11-14 14:53:18	afa2ad7f1a3185bd296a921b187fbeabd13a9748	2026-04-25 10:25:09	2026-04-25 10:25:09
1709	3293	18	6	2025-11-14 14:53:18	afa2ad7f1a3185bd296a921b187fbeabd13a9748	2026-04-25 10:25:09	2026-04-25 10:25:09
1710	1057	18	6	2025-11-14 14:53:18	afa2ad7f1a3185bd296a921b187fbeabd13a9748	2026-04-25 10:25:09	2026-04-25 10:25:09
1711	3109	18	6	2025-11-14 14:53:18	afa2ad7f1a3185bd296a921b187fbeabd13a9748	2026-04-25 10:25:09	2026-04-25 10:25:09
1712	2427	18	6	2025-11-14 14:53:18	afa2ad7f1a3185bd296a921b187fbeabd13a9748	2026-04-25 10:25:09	2026-04-25 10:25:09
1713	1010	18	6	2025-11-14 14:53:18	afa2ad7f1a3185bd296a921b187fbeabd13a9748	2026-04-25 10:25:09	2026-04-25 10:25:09
1714	2734	18	6	2025-11-14 14:53:18	afa2ad7f1a3185bd296a921b187fbeabd13a9748	2026-04-25 10:25:09	2026-04-25 10:25:09
1715	4151	18	6	2025-11-14 14:53:18	afa2ad7f1a3185bd296a921b187fbeabd13a9748	2026-04-25 10:25:09	2026-04-25 10:25:09
1716	4566	12	1	2025-06-21 16:23:42	cfa458922a6d6604a6b3ac8dbf0914cf95516f1b	2026-04-25 10:25:09	2026-04-25 10:25:09
1717	4914	12	1	2025-06-21 16:23:42	cfa458922a6d6604a6b3ac8dbf0914cf95516f1b	2026-04-25 10:25:09	2026-04-25 10:25:09
1718	1563	12	1	2025-06-21 16:23:42	cfa458922a6d6604a6b3ac8dbf0914cf95516f1b	2026-04-25 10:25:09	2026-04-25 10:25:09
1719	602	12	1	2025-06-21 16:23:42	cfa458922a6d6604a6b3ac8dbf0914cf95516f1b	2026-04-25 10:25:09	2026-04-25 10:25:09
1720	2312	12	1	2025-06-21 16:23:42	cfa458922a6d6604a6b3ac8dbf0914cf95516f1b	2026-04-25 10:25:09	2026-04-25 10:25:09
1721	4690	12	1	2025-06-21 16:23:42	cfa458922a6d6604a6b3ac8dbf0914cf95516f1b	2026-04-25 10:25:09	2026-04-25 10:25:09
1722	3463	12	1	2025-06-21 16:23:42	cfa458922a6d6604a6b3ac8dbf0914cf95516f1b	2026-04-25 10:25:09	2026-04-25 10:25:09
1723	1371	88	9	2025-12-02 11:23:55	bed12590fef458d1b19941219389b3c0e6882e6e	2026-04-25 10:25:09	2026-04-25 10:25:09
1724	2625	88	9	2025-12-02 11:23:55	bed12590fef458d1b19941219389b3c0e6882e6e	2026-04-25 10:25:09	2026-04-25 10:25:09
1725	894	88	9	2025-12-02 11:23:55	bed12590fef458d1b19941219389b3c0e6882e6e	2026-04-25 10:25:09	2026-04-25 10:25:09
1726	3404	88	9	2025-12-02 11:23:55	bed12590fef458d1b19941219389b3c0e6882e6e	2026-04-25 10:25:09	2026-04-25 10:25:09
1727	3252	88	9	2025-12-02 11:23:55	bed12590fef458d1b19941219389b3c0e6882e6e	2026-04-25 10:25:09	2026-04-25 10:25:09
1728	1470	88	9	2025-12-02 11:23:55	bed12590fef458d1b19941219389b3c0e6882e6e	2026-04-25 10:25:09	2026-04-25 10:25:09
1729	1013	88	9	2025-12-02 11:23:55	bed12590fef458d1b19941219389b3c0e6882e6e	2026-04-25 10:25:09	2026-04-25 10:25:09
1730	4478	88	9	2025-12-02 11:23:55	bed12590fef458d1b19941219389b3c0e6882e6e	2026-04-25 10:25:09	2026-04-25 10:25:09
1731	2696	88	9	2025-12-02 11:23:55	bed12590fef458d1b19941219389b3c0e6882e6e	2026-04-25 10:25:09	2026-04-25 10:25:09
1732	3514	88	9	2025-12-02 11:23:55	bed12590fef458d1b19941219389b3c0e6882e6e	2026-04-25 10:25:09	2026-04-25 10:25:09
1733	4950	97	7	2025-07-19 11:31:47	8e3f8f89e166ef51c259589c0c348f1627f98117	2026-04-25 10:25:09	2026-04-25 10:25:09
1734	958	97	7	2025-07-19 11:31:47	8e3f8f89e166ef51c259589c0c348f1627f98117	2026-04-25 10:25:09	2026-04-25 10:25:09
1735	88	97	7	2025-07-19 11:31:47	8e3f8f89e166ef51c259589c0c348f1627f98117	2026-04-25 10:25:09	2026-04-25 10:25:09
1736	4699	97	7	2025-07-19 11:31:47	8e3f8f89e166ef51c259589c0c348f1627f98117	2026-04-25 10:25:09	2026-04-25 10:25:09
1737	2635	59	3	2025-12-01 11:34:03	8d2196df939fe0a56745fa489cfc0b3e7a23b62c	2026-04-25 10:25:09	2026-04-25 10:25:09
1738	4503	59	3	2025-12-01 11:34:03	8d2196df939fe0a56745fa489cfc0b3e7a23b62c	2026-04-25 10:25:09	2026-04-25 10:25:09
1739	1811	59	3	2025-12-01 11:34:03	8d2196df939fe0a56745fa489cfc0b3e7a23b62c	2026-04-25 10:25:09	2026-04-25 10:25:09
1740	4637	59	3	2025-12-01 11:34:03	8d2196df939fe0a56745fa489cfc0b3e7a23b62c	2026-04-25 10:25:09	2026-04-25 10:25:09
1741	2082	59	3	2025-12-01 11:34:03	8d2196df939fe0a56745fa489cfc0b3e7a23b62c	2026-04-25 10:25:09	2026-04-25 10:25:09
1742	2584	59	3	2025-12-01 11:34:03	8d2196df939fe0a56745fa489cfc0b3e7a23b62c	2026-04-25 10:25:09	2026-04-25 10:25:09
1743	2072	17	6	2025-11-09 16:05:47	d03c7b7dbf491aede2afea65c78817ce6f70d33d	2026-04-25 10:25:09	2026-04-25 10:25:09
1744	1893	17	6	2025-11-09 16:05:47	d03c7b7dbf491aede2afea65c78817ce6f70d33d	2026-04-25 10:25:09	2026-04-25 10:25:09
1745	2703	64	5	2026-02-02 12:57:42	fb27a87e1b8b6a016c227ec5f08fed72cdb86f12	2026-04-25 10:25:09	2026-04-25 10:25:09
1746	191	64	5	2026-02-02 12:57:42	fb27a87e1b8b6a016c227ec5f08fed72cdb86f12	2026-04-25 10:25:09	2026-04-25 10:25:09
1747	2235	64	5	2026-02-02 12:57:42	fb27a87e1b8b6a016c227ec5f08fed72cdb86f12	2026-04-25 10:25:09	2026-04-25 10:25:09
1748	23	64	5	2026-02-02 12:57:42	fb27a87e1b8b6a016c227ec5f08fed72cdb86f12	2026-04-25 10:25:09	2026-04-25 10:25:09
1749	1108	64	5	2026-02-02 12:57:42	fb27a87e1b8b6a016c227ec5f08fed72cdb86f12	2026-04-25 10:25:09	2026-04-25 10:25:09
1750	281	64	5	2026-02-02 12:57:42	fb27a87e1b8b6a016c227ec5f08fed72cdb86f12	2026-04-25 10:25:09	2026-04-25 10:25:09
1751	1445	64	5	2026-02-02 12:57:42	fb27a87e1b8b6a016c227ec5f08fed72cdb86f12	2026-04-25 10:25:09	2026-04-25 10:25:09
1752	2274	64	5	2026-02-02 12:57:42	fb27a87e1b8b6a016c227ec5f08fed72cdb86f12	2026-04-25 10:25:09	2026-04-25 10:25:09
1753	513	64	5	2026-02-02 12:57:42	fb27a87e1b8b6a016c227ec5f08fed72cdb86f12	2026-04-25 10:25:09	2026-04-25 10:25:09
1754	4405	60	9	2025-06-02 12:22:30	985fd44fc99c54b0a61f754d1e636861d4cb1cec	2026-04-25 10:25:09	2026-04-25 10:25:09
1755	4164	81	9	2025-08-02 15:21:44	91d4e60eb2cdde4455a3217552990b21aedf5fde	2026-04-25 10:25:09	2026-04-25 10:25:09
1756	2349	81	9	2025-08-02 15:21:44	91d4e60eb2cdde4455a3217552990b21aedf5fde	2026-04-25 10:25:09	2026-04-25 10:25:09
1757	4018	97	1	2025-11-12 10:56:01	ceb0bd36b206e5a11ca2459c550578e52396eab1	2026-04-25 10:25:09	2026-04-25 10:25:09
1758	947	97	1	2025-11-12 10:56:01	ceb0bd36b206e5a11ca2459c550578e52396eab1	2026-04-25 10:25:09	2026-04-25 10:25:09
1759	856	97	1	2025-11-12 10:56:01	ceb0bd36b206e5a11ca2459c550578e52396eab1	2026-04-25 10:25:09	2026-04-25 10:25:09
1760	3867	97	1	2025-11-12 10:56:01	ceb0bd36b206e5a11ca2459c550578e52396eab1	2026-04-25 10:25:09	2026-04-25 10:25:09
1761	3282	97	1	2025-11-12 10:56:01	ceb0bd36b206e5a11ca2459c550578e52396eab1	2026-04-25 10:25:09	2026-04-25 10:25:09
1762	4514	97	1	2025-11-12 10:56:01	ceb0bd36b206e5a11ca2459c550578e52396eab1	2026-04-25 10:25:09	2026-04-25 10:25:09
1763	4678	97	1	2025-11-12 10:56:01	ceb0bd36b206e5a11ca2459c550578e52396eab1	2026-04-25 10:25:09	2026-04-25 10:25:09
1764	1502	35	10	2025-06-23 14:21:39	3fa2d73783ed468201113fbdeba5d54ad3b193b5	2026-04-25 10:25:09	2026-04-25 10:25:09
1765	2306	23	6	2026-02-18 10:22:10	529759e22af6bb9feb87840df356ab7a2c4db93b	2026-04-25 10:25:09	2026-04-25 10:25:09
1766	2506	23	6	2026-02-18 10:22:10	529759e22af6bb9feb87840df356ab7a2c4db93b	2026-04-25 10:25:09	2026-04-25 10:25:09
1767	4232	23	6	2026-02-18 10:22:10	529759e22af6bb9feb87840df356ab7a2c4db93b	2026-04-25 10:25:09	2026-04-25 10:25:09
1768	4145	23	6	2026-02-18 10:22:10	529759e22af6bb9feb87840df356ab7a2c4db93b	2026-04-25 10:25:09	2026-04-25 10:25:09
1769	1958	23	6	2026-02-18 10:22:10	529759e22af6bb9feb87840df356ab7a2c4db93b	2026-04-25 10:25:09	2026-04-25 10:25:09
1770	1576	23	6	2026-02-18 10:22:10	529759e22af6bb9feb87840df356ab7a2c4db93b	2026-04-25 10:25:09	2026-04-25 10:25:09
1771	745	72	8	2025-08-14 17:47:00	786be24866c3e06c0ecd9dbc2e17a5cced1005c0	2026-04-25 10:25:09	2026-04-25 10:25:09
1772	1295	72	8	2025-08-14 17:47:00	786be24866c3e06c0ecd9dbc2e17a5cced1005c0	2026-04-25 10:25:09	2026-04-25 10:25:09
1773	4296	72	8	2025-08-14 17:47:00	786be24866c3e06c0ecd9dbc2e17a5cced1005c0	2026-04-25 10:25:09	2026-04-25 10:25:09
1774	4653	28	10	2025-12-05 17:40:00	eadefcc736b698c0b35308410dfe1f15c5e931f4	2026-04-25 10:25:09	2026-04-25 10:25:09
1775	913	28	10	2025-12-05 17:40:00	eadefcc736b698c0b35308410dfe1f15c5e931f4	2026-04-25 10:25:09	2026-04-25 10:25:09
1776	1837	28	10	2025-12-05 17:40:00	eadefcc736b698c0b35308410dfe1f15c5e931f4	2026-04-25 10:25:09	2026-04-25 10:25:09
1777	4056	28	10	2025-12-05 17:40:00	eadefcc736b698c0b35308410dfe1f15c5e931f4	2026-04-25 10:25:09	2026-04-25 10:25:09
1778	4112	61	4	2026-03-18 12:51:06	669b5fb0fce74f5cc5e9105d6a2e9ce6acbf4f26	2026-04-25 10:25:09	2026-04-25 10:25:09
1779	1516	61	4	2026-03-18 12:51:06	669b5fb0fce74f5cc5e9105d6a2e9ce6acbf4f26	2026-04-25 10:25:09	2026-04-25 10:25:09
1780	3051	61	4	2026-03-18 12:51:06	669b5fb0fce74f5cc5e9105d6a2e9ce6acbf4f26	2026-04-25 10:25:09	2026-04-25 10:25:09
1781	2214	61	4	2026-03-18 12:51:06	669b5fb0fce74f5cc5e9105d6a2e9ce6acbf4f26	2026-04-25 10:25:09	2026-04-25 10:25:09
1782	3615	61	4	2026-03-18 12:51:06	669b5fb0fce74f5cc5e9105d6a2e9ce6acbf4f26	2026-04-25 10:25:09	2026-04-25 10:25:09
1783	4655	61	4	2026-03-18 12:51:06	669b5fb0fce74f5cc5e9105d6a2e9ce6acbf4f26	2026-04-25 10:25:09	2026-04-25 10:25:09
1784	3222	61	4	2026-03-18 12:51:06	669b5fb0fce74f5cc5e9105d6a2e9ce6acbf4f26	2026-04-25 10:25:09	2026-04-25 10:25:09
1785	136	61	4	2026-03-18 12:51:06	669b5fb0fce74f5cc5e9105d6a2e9ce6acbf4f26	2026-04-25 10:25:09	2026-04-25 10:25:09
1786	3972	61	4	2026-03-18 12:51:06	669b5fb0fce74f5cc5e9105d6a2e9ce6acbf4f26	2026-04-25 10:25:09	2026-04-25 10:25:09
1787	4057	61	4	2026-03-18 12:51:06	669b5fb0fce74f5cc5e9105d6a2e9ce6acbf4f26	2026-04-25 10:25:09	2026-04-25 10:25:09
1788	4069	89	4	2025-07-21 11:40:28	9b88c4fb924e020298496c0380b9a8421ea26158	2026-04-25 10:25:09	2026-04-25 10:25:09
1789	681	89	4	2025-07-21 11:40:28	9b88c4fb924e020298496c0380b9a8421ea26158	2026-04-25 10:25:09	2026-04-25 10:25:09
1790	4194	89	4	2025-07-21 11:40:28	9b88c4fb924e020298496c0380b9a8421ea26158	2026-04-25 10:25:09	2026-04-25 10:25:09
1791	319	88	5	2025-09-09 12:25:25	b0fe24433b1f1522b800d13788f5621d5d34abbc	2026-04-25 10:25:09	2026-04-25 10:25:09
1792	4492	88	5	2025-09-09 12:25:25	b0fe24433b1f1522b800d13788f5621d5d34abbc	2026-04-25 10:25:09	2026-04-25 10:25:09
1793	3210	88	5	2025-09-09 12:25:25	b0fe24433b1f1522b800d13788f5621d5d34abbc	2026-04-25 10:25:09	2026-04-25 10:25:09
1794	3876	88	5	2025-09-09 12:25:25	b0fe24433b1f1522b800d13788f5621d5d34abbc	2026-04-25 10:25:09	2026-04-25 10:25:09
1795	1650	88	5	2025-09-09 12:25:25	b0fe24433b1f1522b800d13788f5621d5d34abbc	2026-04-25 10:25:09	2026-04-25 10:25:09
1796	4961	88	5	2025-09-09 12:25:25	b0fe24433b1f1522b800d13788f5621d5d34abbc	2026-04-25 10:25:09	2026-04-25 10:25:09
1797	3752	16	5	2025-09-17 11:36:31	b3d57941fd0fb30f0b87db5538befe6424105da0	2026-04-25 10:25:09	2026-04-25 10:25:09
1798	3604	53	4	2025-06-10 10:21:15	a6337915d99beee58b7e13c66fe85628f1c3214e	2026-04-25 10:25:09	2026-04-25 10:25:09
1799	1331	53	4	2025-06-10 10:21:15	a6337915d99beee58b7e13c66fe85628f1c3214e	2026-04-25 10:25:09	2026-04-25 10:25:09
1800	4453	53	4	2025-06-10 10:21:15	a6337915d99beee58b7e13c66fe85628f1c3214e	2026-04-25 10:25:09	2026-04-25 10:25:09
1801	1873	53	4	2025-06-10 10:21:15	a6337915d99beee58b7e13c66fe85628f1c3214e	2026-04-25 10:25:09	2026-04-25 10:25:09
1802	4305	53	4	2025-06-10 10:21:15	a6337915d99beee58b7e13c66fe85628f1c3214e	2026-04-25 10:25:09	2026-04-25 10:25:09
1803	2363	53	4	2025-06-10 10:21:15	a6337915d99beee58b7e13c66fe85628f1c3214e	2026-04-25 10:25:09	2026-04-25 10:25:09
1804	33	53	4	2025-06-10 10:21:15	a6337915d99beee58b7e13c66fe85628f1c3214e	2026-04-25 10:25:09	2026-04-25 10:25:09
1805	3240	53	4	2025-06-10 10:21:15	a6337915d99beee58b7e13c66fe85628f1c3214e	2026-04-25 10:25:09	2026-04-25 10:25:09
1806	3463	53	4	2025-06-10 10:21:15	a6337915d99beee58b7e13c66fe85628f1c3214e	2026-04-25 10:25:09	2026-04-25 10:25:09
1807	1183	53	4	2025-06-10 10:21:15	a6337915d99beee58b7e13c66fe85628f1c3214e	2026-04-25 10:25:09	2026-04-25 10:25:09
1808	1455	75	3	2025-12-30 15:30:01	9967bd06a4c0879c5b5ecc93dd6d799b762475a3	2026-04-25 10:25:09	2026-04-25 10:25:09
1809	1505	75	3	2025-12-30 15:30:01	9967bd06a4c0879c5b5ecc93dd6d799b762475a3	2026-04-25 10:25:09	2026-04-25 10:25:09
1810	3821	75	3	2025-12-30 15:30:01	9967bd06a4c0879c5b5ecc93dd6d799b762475a3	2026-04-25 10:25:09	2026-04-25 10:25:09
1811	4340	75	3	2025-12-30 15:30:01	9967bd06a4c0879c5b5ecc93dd6d799b762475a3	2026-04-25 10:25:09	2026-04-25 10:25:09
1812	1486	75	3	2025-12-30 15:30:01	9967bd06a4c0879c5b5ecc93dd6d799b762475a3	2026-04-25 10:25:09	2026-04-25 10:25:09
1813	1836	75	3	2025-12-30 15:30:01	9967bd06a4c0879c5b5ecc93dd6d799b762475a3	2026-04-25 10:25:09	2026-04-25 10:25:09
1814	4360	75	3	2025-12-30 15:30:01	9967bd06a4c0879c5b5ecc93dd6d799b762475a3	2026-04-25 10:25:09	2026-04-25 10:25:09
1815	1475	75	3	2025-12-30 15:30:01	9967bd06a4c0879c5b5ecc93dd6d799b762475a3	2026-04-25 10:25:09	2026-04-25 10:25:09
1816	4823	75	3	2025-12-30 15:30:01	9967bd06a4c0879c5b5ecc93dd6d799b762475a3	2026-04-25 10:25:09	2026-04-25 10:25:09
1817	4074	75	3	2025-12-30 15:30:01	9967bd06a4c0879c5b5ecc93dd6d799b762475a3	2026-04-25 10:25:09	2026-04-25 10:25:09
1818	4719	32	2	2025-11-25 16:30:17	e939ee0075225871deb2686a728fe6bff249e062	2026-04-25 10:25:09	2026-04-25 10:25:09
1819	1201	32	2	2025-11-25 16:30:17	e939ee0075225871deb2686a728fe6bff249e062	2026-04-25 10:25:09	2026-04-25 10:25:09
1820	1827	32	2	2025-11-25 16:30:17	e939ee0075225871deb2686a728fe6bff249e062	2026-04-25 10:25:09	2026-04-25 10:25:09
1821	1702	67	10	2026-03-08 12:50:43	e400999f131277e4c924001ce63911b03a7f3aa8	2026-04-25 10:25:09	2026-04-25 10:25:09
1822	1184	2	9	2025-10-13 14:22:50	bcf1c0a309b0d352dcec637d0dee90743a1a7161	2026-04-25 10:25:09	2026-04-25 10:25:09
1823	1011	2	9	2025-10-13 14:22:50	bcf1c0a309b0d352dcec637d0dee90743a1a7161	2026-04-25 10:25:09	2026-04-25 10:25:09
1824	903	2	9	2025-10-13 14:22:50	bcf1c0a309b0d352dcec637d0dee90743a1a7161	2026-04-25 10:25:09	2026-04-25 10:25:09
1825	1100	45	5	2025-07-13 12:48:30	c6e2ba41bdc6f9e8561d91d274d2547927cff2e2	2026-04-25 10:25:09	2026-04-25 10:25:09
1826	2124	45	5	2025-07-13 12:48:30	c6e2ba41bdc6f9e8561d91d274d2547927cff2e2	2026-04-25 10:25:09	2026-04-25 10:25:09
1827	2659	45	5	2025-07-13 12:48:30	c6e2ba41bdc6f9e8561d91d274d2547927cff2e2	2026-04-25 10:25:09	2026-04-25 10:25:09
1828	2063	45	5	2025-07-13 12:48:30	c6e2ba41bdc6f9e8561d91d274d2547927cff2e2	2026-04-25 10:25:09	2026-04-25 10:25:09
1829	2967	45	5	2025-07-13 12:48:30	c6e2ba41bdc6f9e8561d91d274d2547927cff2e2	2026-04-25 10:25:09	2026-04-25 10:25:09
1830	449	45	5	2025-07-13 12:48:30	c6e2ba41bdc6f9e8561d91d274d2547927cff2e2	2026-04-25 10:25:09	2026-04-25 10:25:09
1831	2335	58	10	2025-08-26 17:50:12	b5a3d16c20b1f9a509310a3a31b91d1d901a777b	2026-04-25 10:25:09	2026-04-25 10:25:09
1832	1766	58	10	2025-08-26 17:50:12	b5a3d16c20b1f9a509310a3a31b91d1d901a777b	2026-04-25 10:25:09	2026-04-25 10:25:09
1833	696	92	4	2025-08-07 13:12:29	81fbacbb652eb800027b1e37b8e23f54e027ad79	2026-04-25 10:25:09	2026-04-25 10:25:09
1834	615	92	4	2025-08-07 13:12:29	81fbacbb652eb800027b1e37b8e23f54e027ad79	2026-04-25 10:25:09	2026-04-25 10:25:09
1835	1885	92	4	2025-08-07 13:12:29	81fbacbb652eb800027b1e37b8e23f54e027ad79	2026-04-25 10:25:09	2026-04-25 10:25:09
1836	1094	92	4	2025-08-07 13:12:29	81fbacbb652eb800027b1e37b8e23f54e027ad79	2026-04-25 10:25:09	2026-04-25 10:25:09
1837	4920	69	8	2025-07-04 13:33:17	de8f5dbe5c068da3c274739cd73d0e2027332c55	2026-04-25 10:25:09	2026-04-25 10:25:09
1838	2174	69	8	2025-07-04 13:33:17	de8f5dbe5c068da3c274739cd73d0e2027332c55	2026-04-25 10:25:09	2026-04-25 10:25:09
1839	754	69	8	2025-07-04 13:33:17	de8f5dbe5c068da3c274739cd73d0e2027332c55	2026-04-25 10:25:09	2026-04-25 10:25:09
1840	185	69	8	2025-07-04 13:33:17	de8f5dbe5c068da3c274739cd73d0e2027332c55	2026-04-25 10:25:09	2026-04-25 10:25:09
1841	4616	91	4	2025-07-27 16:31:44	b35b052201b6840efdf2d500fc3af0a7ad551f7c	2026-04-25 10:25:09	2026-04-25 10:25:09
1842	3412	91	4	2025-07-27 16:31:44	b35b052201b6840efdf2d500fc3af0a7ad551f7c	2026-04-25 10:25:09	2026-04-25 10:25:09
1843	1524	91	4	2025-07-27 16:31:44	b35b052201b6840efdf2d500fc3af0a7ad551f7c	2026-04-25 10:25:09	2026-04-25 10:25:09
1844	1993	51	10	2025-12-03 11:02:13	6ca39cd60901c0b1a7cd6af20d02ca81ff8f1c20	2026-04-25 10:25:09	2026-04-25 10:25:09
1845	2496	51	10	2025-12-03 11:02:13	6ca39cd60901c0b1a7cd6af20d02ca81ff8f1c20	2026-04-25 10:25:09	2026-04-25 10:25:09
1846	15	51	10	2025-12-03 11:02:13	6ca39cd60901c0b1a7cd6af20d02ca81ff8f1c20	2026-04-25 10:25:09	2026-04-25 10:25:09
1847	1398	57	3	2025-07-28 15:20:37	dfd8d9fab770225f51065b203979b7d1007d050e	2026-04-25 10:25:09	2026-04-25 10:25:09
1848	4268	57	3	2025-07-28 15:20:37	dfd8d9fab770225f51065b203979b7d1007d050e	2026-04-25 10:25:09	2026-04-25 10:25:09
1849	4291	57	3	2025-07-28 15:20:37	dfd8d9fab770225f51065b203979b7d1007d050e	2026-04-25 10:25:09	2026-04-25 10:25:09
1850	3973	57	3	2025-07-28 15:20:37	dfd8d9fab770225f51065b203979b7d1007d050e	2026-04-25 10:25:09	2026-04-25 10:25:09
1851	234	57	3	2025-07-28 15:20:37	dfd8d9fab770225f51065b203979b7d1007d050e	2026-04-25 10:25:09	2026-04-25 10:25:09
1852	1732	57	3	2025-07-28 15:20:37	dfd8d9fab770225f51065b203979b7d1007d050e	2026-04-25 10:25:09	2026-04-25 10:25:09
1853	1487	57	3	2025-07-28 15:20:37	dfd8d9fab770225f51065b203979b7d1007d050e	2026-04-25 10:25:09	2026-04-25 10:25:09
1854	78	57	3	2025-07-28 15:20:37	dfd8d9fab770225f51065b203979b7d1007d050e	2026-04-25 10:25:09	2026-04-25 10:25:09
1855	2078	57	3	2025-07-28 15:20:37	dfd8d9fab770225f51065b203979b7d1007d050e	2026-04-25 10:25:09	2026-04-25 10:25:09
1856	1333	36	7	2025-12-10 11:49:51	d543b626064d8288f35e31365b998181fc432744	2026-04-25 10:25:09	2026-04-25 10:25:09
1857	1494	36	7	2025-12-10 11:49:51	d543b626064d8288f35e31365b998181fc432744	2026-04-25 10:25:09	2026-04-25 10:25:09
1858	513	31	1	2025-12-24 17:18:50	1eeb1f459d887a521320e954730f10af476c05a9	2026-04-25 10:25:09	2026-04-25 10:25:09
1859	3849	31	1	2025-12-24 17:18:50	1eeb1f459d887a521320e954730f10af476c05a9	2026-04-25 10:25:09	2026-04-25 10:25:09
1860	2779	31	1	2025-12-24 17:18:50	1eeb1f459d887a521320e954730f10af476c05a9	2026-04-25 10:25:09	2026-04-25 10:25:09
1861	4396	31	1	2025-12-24 17:18:50	1eeb1f459d887a521320e954730f10af476c05a9	2026-04-25 10:25:09	2026-04-25 10:25:09
1862	1026	31	1	2025-12-24 17:18:50	1eeb1f459d887a521320e954730f10af476c05a9	2026-04-25 10:25:09	2026-04-25 10:25:09
1863	792	31	1	2025-12-24 17:18:50	1eeb1f459d887a521320e954730f10af476c05a9	2026-04-25 10:25:09	2026-04-25 10:25:09
1864	290	31	1	2025-12-24 17:18:50	1eeb1f459d887a521320e954730f10af476c05a9	2026-04-25 10:25:09	2026-04-25 10:25:09
1865	356	31	1	2025-12-24 17:18:50	1eeb1f459d887a521320e954730f10af476c05a9	2026-04-25 10:25:09	2026-04-25 10:25:09
1866	1161	31	1	2025-12-24 17:18:50	1eeb1f459d887a521320e954730f10af476c05a9	2026-04-25 10:25:09	2026-04-25 10:25:09
1867	1868	31	1	2025-12-24 17:18:50	1eeb1f459d887a521320e954730f10af476c05a9	2026-04-25 10:25:09	2026-04-25 10:25:09
1868	367	56	10	2025-12-31 13:23:47	2c3300658314df67bb99f6d40aa4996d5e9efd4e	2026-04-25 10:25:09	2026-04-25 10:25:09
1869	1533	56	10	2025-12-31 13:23:47	2c3300658314df67bb99f6d40aa4996d5e9efd4e	2026-04-25 10:25:09	2026-04-25 10:25:09
1870	2623	56	10	2025-12-31 13:23:47	2c3300658314df67bb99f6d40aa4996d5e9efd4e	2026-04-25 10:25:09	2026-04-25 10:25:09
1871	4231	56	10	2025-12-31 13:23:47	2c3300658314df67bb99f6d40aa4996d5e9efd4e	2026-04-25 10:25:09	2026-04-25 10:25:09
1872	81	56	10	2025-12-31 13:23:47	2c3300658314df67bb99f6d40aa4996d5e9efd4e	2026-04-25 10:25:09	2026-04-25 10:25:09
1873	3545	56	10	2025-12-31 13:23:47	2c3300658314df67bb99f6d40aa4996d5e9efd4e	2026-04-25 10:25:09	2026-04-25 10:25:09
1874	3431	56	10	2025-12-31 13:23:47	2c3300658314df67bb99f6d40aa4996d5e9efd4e	2026-04-25 10:25:09	2026-04-25 10:25:09
1875	3976	56	10	2025-12-31 13:23:47	2c3300658314df67bb99f6d40aa4996d5e9efd4e	2026-04-25 10:25:09	2026-04-25 10:25:09
1876	2138	56	10	2025-12-31 13:23:47	2c3300658314df67bb99f6d40aa4996d5e9efd4e	2026-04-25 10:25:09	2026-04-25 10:25:09
1877	2654	55	10	2025-11-08 13:30:41	4d5285bead99df246a3f7ec1e2d2a7ec41460b1d	2026-04-25 10:25:09	2026-04-25 10:25:09
1878	2311	55	10	2025-11-08 13:30:41	4d5285bead99df246a3f7ec1e2d2a7ec41460b1d	2026-04-25 10:25:09	2026-04-25 10:25:09
1879	3385	55	10	2025-11-08 13:30:41	4d5285bead99df246a3f7ec1e2d2a7ec41460b1d	2026-04-25 10:25:09	2026-04-25 10:25:09
1880	2478	55	10	2025-11-08 13:30:41	4d5285bead99df246a3f7ec1e2d2a7ec41460b1d	2026-04-25 10:25:09	2026-04-25 10:25:09
1881	3885	55	10	2025-11-08 13:30:41	4d5285bead99df246a3f7ec1e2d2a7ec41460b1d	2026-04-25 10:25:09	2026-04-25 10:25:09
1882	2684	55	10	2025-11-08 13:30:41	4d5285bead99df246a3f7ec1e2d2a7ec41460b1d	2026-04-25 10:25:09	2026-04-25 10:25:09
1883	411	55	10	2025-11-08 13:30:41	4d5285bead99df246a3f7ec1e2d2a7ec41460b1d	2026-04-25 10:25:09	2026-04-25 10:25:09
1884	1214	55	10	2025-11-08 13:30:41	4d5285bead99df246a3f7ec1e2d2a7ec41460b1d	2026-04-25 10:25:09	2026-04-25 10:25:09
1885	3641	7	2	2025-05-27 16:38:57	9cf358c0b0fd1445a0e022ec4f783815f238709c	2026-04-25 10:25:09	2026-04-25 10:25:09
1886	3537	7	2	2025-05-27 16:38:57	9cf358c0b0fd1445a0e022ec4f783815f238709c	2026-04-25 10:25:09	2026-04-25 10:25:09
1887	4338	7	2	2025-05-27 16:38:57	9cf358c0b0fd1445a0e022ec4f783815f238709c	2026-04-25 10:25:09	2026-04-25 10:25:09
1888	3862	7	2	2025-05-27 16:38:57	9cf358c0b0fd1445a0e022ec4f783815f238709c	2026-04-25 10:25:09	2026-04-25 10:25:09
1889	190	7	2	2025-05-27 16:38:57	9cf358c0b0fd1445a0e022ec4f783815f238709c	2026-04-25 10:25:09	2026-04-25 10:25:09
1890	363	7	2	2025-05-27 16:38:57	9cf358c0b0fd1445a0e022ec4f783815f238709c	2026-04-25 10:25:09	2026-04-25 10:25:09
1891	1070	7	2	2025-05-27 16:38:57	9cf358c0b0fd1445a0e022ec4f783815f238709c	2026-04-25 10:25:09	2026-04-25 10:25:09
1892	4712	7	2	2025-05-27 16:38:57	9cf358c0b0fd1445a0e022ec4f783815f238709c	2026-04-25 10:25:09	2026-04-25 10:25:09
1893	289	7	2	2025-05-27 16:38:57	9cf358c0b0fd1445a0e022ec4f783815f238709c	2026-04-25 10:25:09	2026-04-25 10:25:09
1894	4019	7	2	2025-05-27 16:38:57	9cf358c0b0fd1445a0e022ec4f783815f238709c	2026-04-25 10:25:09	2026-04-25 10:25:09
1895	4060	64	1	2025-11-11 12:10:42	fc779630f7862ae8ac288bd80a621fdb253425e4	2026-04-25 10:25:09	2026-04-25 10:25:09
1896	2054	64	1	2025-11-11 12:10:42	fc779630f7862ae8ac288bd80a621fdb253425e4	2026-04-25 10:25:09	2026-04-25 10:25:09
1897	4996	64	1	2025-11-11 12:10:42	fc779630f7862ae8ac288bd80a621fdb253425e4	2026-04-25 10:25:09	2026-04-25 10:25:09
1898	317	64	1	2025-11-11 12:10:42	fc779630f7862ae8ac288bd80a621fdb253425e4	2026-04-25 10:25:09	2026-04-25 10:25:09
1899	4806	94	1	2026-04-04 12:38:33	34d1f1cb5744297b1aec54c50ebdde0fafe7a12f	2026-04-25 10:25:09	2026-04-25 10:25:09
1900	1881	94	1	2026-04-04 12:38:33	34d1f1cb5744297b1aec54c50ebdde0fafe7a12f	2026-04-25 10:25:09	2026-04-25 10:25:09
1901	4473	51	3	2026-04-05 09:25:08	ce97601bc6c585a8e98a74981aa0bfa9a79aaa09	2026-04-25 10:25:09	2026-04-25 10:25:09
1902	3436	51	3	2026-04-05 09:25:08	ce97601bc6c585a8e98a74981aa0bfa9a79aaa09	2026-04-25 10:25:09	2026-04-25 10:25:09
1903	2472	51	3	2026-04-05 09:25:08	ce97601bc6c585a8e98a74981aa0bfa9a79aaa09	2026-04-25 10:25:09	2026-04-25 10:25:09
1904	1607	51	3	2026-04-05 09:25:08	ce97601bc6c585a8e98a74981aa0bfa9a79aaa09	2026-04-25 10:25:09	2026-04-25 10:25:09
1905	2356	51	3	2026-04-05 09:25:08	ce97601bc6c585a8e98a74981aa0bfa9a79aaa09	2026-04-25 10:25:09	2026-04-25 10:25:09
1906	2273	51	3	2026-04-05 09:25:08	ce97601bc6c585a8e98a74981aa0bfa9a79aaa09	2026-04-25 10:25:09	2026-04-25 10:25:09
1907	940	42	7	2025-09-25 11:23:45	4cd6138fcc7fa8e11258a5c8c37e91a5b8bf84cb	2026-04-25 10:25:09	2026-04-25 10:25:09
1908	3293	42	7	2025-09-25 11:23:45	4cd6138fcc7fa8e11258a5c8c37e91a5b8bf84cb	2026-04-25 10:25:09	2026-04-25 10:25:09
1909	47	42	7	2025-09-25 11:23:45	4cd6138fcc7fa8e11258a5c8c37e91a5b8bf84cb	2026-04-25 10:25:09	2026-04-25 10:25:09
1910	3523	42	7	2025-09-25 11:23:45	4cd6138fcc7fa8e11258a5c8c37e91a5b8bf84cb	2026-04-25 10:25:09	2026-04-25 10:25:09
1911	4729	42	7	2025-09-25 11:23:45	4cd6138fcc7fa8e11258a5c8c37e91a5b8bf84cb	2026-04-25 10:25:09	2026-04-25 10:25:09
1912	2866	42	7	2025-09-25 11:23:45	4cd6138fcc7fa8e11258a5c8c37e91a5b8bf84cb	2026-04-25 10:25:09	2026-04-25 10:25:09
1913	4982	42	7	2025-09-25 11:23:45	4cd6138fcc7fa8e11258a5c8c37e91a5b8bf84cb	2026-04-25 10:25:09	2026-04-25 10:25:09
1914	55	42	7	2025-09-25 11:23:45	4cd6138fcc7fa8e11258a5c8c37e91a5b8bf84cb	2026-04-25 10:25:09	2026-04-25 10:25:09
1915	1700	42	7	2025-09-25 11:23:45	4cd6138fcc7fa8e11258a5c8c37e91a5b8bf84cb	2026-04-25 10:25:09	2026-04-25 10:25:09
1916	4563	7	8	2026-02-04 15:38:05	41f3f0d283186498ad0ddf92ae533e31088e4fa1	2026-04-25 10:25:09	2026-04-25 10:25:09
1917	3270	7	8	2026-02-04 15:38:05	41f3f0d283186498ad0ddf92ae533e31088e4fa1	2026-04-25 10:25:09	2026-04-25 10:25:09
1918	2495	7	8	2026-02-04 15:38:05	41f3f0d283186498ad0ddf92ae533e31088e4fa1	2026-04-25 10:25:09	2026-04-25 10:25:09
1919	1040	7	8	2026-02-04 15:38:05	41f3f0d283186498ad0ddf92ae533e31088e4fa1	2026-04-25 10:25:09	2026-04-25 10:25:09
1920	366	73	5	2026-04-12 17:00:54	dd269798aece421626a35a8d37f25e7584667afe	2026-04-25 10:25:09	2026-04-25 10:25:09
1921	1042	73	5	2026-04-12 17:00:54	dd269798aece421626a35a8d37f25e7584667afe	2026-04-25 10:25:09	2026-04-25 10:25:09
1922	854	73	5	2026-04-12 17:00:54	dd269798aece421626a35a8d37f25e7584667afe	2026-04-25 10:25:09	2026-04-25 10:25:09
1923	1038	73	5	2026-04-12 17:00:54	dd269798aece421626a35a8d37f25e7584667afe	2026-04-25 10:25:09	2026-04-25 10:25:09
1924	2722	73	5	2026-04-12 17:00:54	dd269798aece421626a35a8d37f25e7584667afe	2026-04-25 10:25:09	2026-04-25 10:25:09
1925	883	73	5	2026-04-12 17:00:54	dd269798aece421626a35a8d37f25e7584667afe	2026-04-25 10:25:09	2026-04-25 10:25:09
1926	3422	35	2	2026-01-19 16:50:25	96c3db2a566ece32009274729f191908fe979da9	2026-04-25 10:25:09	2026-04-25 10:25:09
1927	1992	35	2	2026-01-19 16:50:25	96c3db2a566ece32009274729f191908fe979da9	2026-04-25 10:25:09	2026-04-25 10:25:09
1928	987	35	2	2026-01-19 16:50:25	96c3db2a566ece32009274729f191908fe979da9	2026-04-25 10:25:09	2026-04-25 10:25:09
1929	193	35	2	2026-01-19 16:50:25	96c3db2a566ece32009274729f191908fe979da9	2026-04-25 10:25:09	2026-04-25 10:25:09
1930	3901	35	2	2026-01-19 16:50:25	96c3db2a566ece32009274729f191908fe979da9	2026-04-25 10:25:09	2026-04-25 10:25:09
1931	4721	35	2	2026-01-19 16:50:25	96c3db2a566ece32009274729f191908fe979da9	2026-04-25 10:25:09	2026-04-25 10:25:09
1932	628	35	2	2026-01-19 16:50:25	96c3db2a566ece32009274729f191908fe979da9	2026-04-25 10:25:09	2026-04-25 10:25:09
1933	4373	75	6	2025-08-23 11:55:06	f32a44f3962b4300862a0468214a12613235ea3b	2026-04-25 10:25:09	2026-04-25 10:25:09
1934	3947	75	6	2025-08-23 11:55:06	f32a44f3962b4300862a0468214a12613235ea3b	2026-04-25 10:25:09	2026-04-25 10:25:09
1935	3723	75	6	2025-08-23 11:55:06	f32a44f3962b4300862a0468214a12613235ea3b	2026-04-25 10:25:09	2026-04-25 10:25:09
1936	3464	7	1	2025-09-01 11:03:18	82869c6f9648df7cb1d586557336d0dd70f7bb07	2026-04-25 10:25:09	2026-04-25 10:25:09
1937	1759	7	1	2025-09-01 11:03:18	82869c6f9648df7cb1d586557336d0dd70f7bb07	2026-04-25 10:25:09	2026-04-25 10:25:09
1938	4329	7	1	2025-09-01 11:03:18	82869c6f9648df7cb1d586557336d0dd70f7bb07	2026-04-25 10:25:09	2026-04-25 10:25:09
1939	801	7	1	2025-09-01 11:03:18	82869c6f9648df7cb1d586557336d0dd70f7bb07	2026-04-25 10:25:09	2026-04-25 10:25:09
1940	3277	7	1	2025-09-01 11:03:18	82869c6f9648df7cb1d586557336d0dd70f7bb07	2026-04-25 10:25:09	2026-04-25 10:25:09
1941	259	7	1	2025-09-01 11:03:18	82869c6f9648df7cb1d586557336d0dd70f7bb07	2026-04-25 10:25:09	2026-04-25 10:25:09
1942	3316	7	1	2025-09-01 11:03:18	82869c6f9648df7cb1d586557336d0dd70f7bb07	2026-04-25 10:25:09	2026-04-25 10:25:09
1943	266	7	1	2025-09-01 11:03:18	82869c6f9648df7cb1d586557336d0dd70f7bb07	2026-04-25 10:25:09	2026-04-25 10:25:09
1944	744	7	1	2025-09-01 11:03:18	82869c6f9648df7cb1d586557336d0dd70f7bb07	2026-04-25 10:25:09	2026-04-25 10:25:09
1945	205	40	4	2025-10-12 16:20:08	76ada77d59b16613752f669dd9daa068c13b8903	2026-04-25 10:25:09	2026-04-25 10:25:09
1946	4416	40	4	2025-10-12 16:20:08	76ada77d59b16613752f669dd9daa068c13b8903	2026-04-25 10:25:09	2026-04-25 10:25:09
1947	2433	40	4	2025-10-12 16:20:08	76ada77d59b16613752f669dd9daa068c13b8903	2026-04-25 10:25:09	2026-04-25 10:25:09
1948	3480	40	4	2025-10-12 16:20:08	76ada77d59b16613752f669dd9daa068c13b8903	2026-04-25 10:25:09	2026-04-25 10:25:09
1949	3483	40	4	2025-10-12 16:20:08	76ada77d59b16613752f669dd9daa068c13b8903	2026-04-25 10:25:09	2026-04-25 10:25:09
1950	1519	40	4	2025-10-12 16:20:08	76ada77d59b16613752f669dd9daa068c13b8903	2026-04-25 10:25:09	2026-04-25 10:25:09
1951	4521	40	4	2025-10-12 16:20:08	76ada77d59b16613752f669dd9daa068c13b8903	2026-04-25 10:25:09	2026-04-25 10:25:09
1952	4470	40	4	2025-10-12 16:20:08	76ada77d59b16613752f669dd9daa068c13b8903	2026-04-25 10:25:09	2026-04-25 10:25:09
1953	496	96	2	2025-09-12 11:07:39	5464263a20f329b5a8b26a4efbbbc72131ef5056	2026-04-25 10:25:09	2026-04-25 10:25:09
1954	4806	96	2	2025-09-12 11:07:39	5464263a20f329b5a8b26a4efbbbc72131ef5056	2026-04-25 10:25:09	2026-04-25 10:25:09
1955	4156	96	2	2025-09-12 11:07:39	5464263a20f329b5a8b26a4efbbbc72131ef5056	2026-04-25 10:25:09	2026-04-25 10:25:09
1956	4513	96	2	2025-09-12 11:07:39	5464263a20f329b5a8b26a4efbbbc72131ef5056	2026-04-25 10:25:09	2026-04-25 10:25:09
1957	3958	96	2	2025-09-12 11:07:39	5464263a20f329b5a8b26a4efbbbc72131ef5056	2026-04-25 10:25:09	2026-04-25 10:25:09
1958	2139	27	4	2025-06-20 09:16:48	5b4bcc26f508f08f4824a20c8a446ebb79ec915e	2026-04-25 10:25:09	2026-04-25 10:25:09
1959	2739	39	4	2026-02-15 10:04:44	87fceaa9f7fca4a21d65ed71bd7a041030516531	2026-04-25 10:25:09	2026-04-25 10:25:09
1960	1402	39	4	2026-02-15 10:04:44	87fceaa9f7fca4a21d65ed71bd7a041030516531	2026-04-25 10:25:09	2026-04-25 10:25:09
1961	153	39	4	2026-02-15 10:04:44	87fceaa9f7fca4a21d65ed71bd7a041030516531	2026-04-25 10:25:09	2026-04-25 10:25:09
1962	4184	39	4	2026-02-15 10:04:44	87fceaa9f7fca4a21d65ed71bd7a041030516531	2026-04-25 10:25:09	2026-04-25 10:25:09
1963	4781	39	4	2026-02-15 10:04:44	87fceaa9f7fca4a21d65ed71bd7a041030516531	2026-04-25 10:25:09	2026-04-25 10:25:09
1964	2020	39	4	2026-02-15 10:04:44	87fceaa9f7fca4a21d65ed71bd7a041030516531	2026-04-25 10:25:09	2026-04-25 10:25:09
1965	3136	39	4	2026-02-15 10:04:44	87fceaa9f7fca4a21d65ed71bd7a041030516531	2026-04-25 10:25:09	2026-04-25 10:25:09
1966	2761	39	4	2026-02-15 10:04:44	87fceaa9f7fca4a21d65ed71bd7a041030516531	2026-04-25 10:25:09	2026-04-25 10:25:09
1967	4290	66	3	2026-01-29 13:04:31	c3dc8b02707af93b9f54b39384f40ec8a9871141	2026-04-25 10:25:09	2026-04-25 10:25:09
1968	1427	66	3	2026-01-29 13:04:31	c3dc8b02707af93b9f54b39384f40ec8a9871141	2026-04-25 10:25:09	2026-04-25 10:25:09
1969	4656	66	3	2026-01-29 13:04:31	c3dc8b02707af93b9f54b39384f40ec8a9871141	2026-04-25 10:25:09	2026-04-25 10:25:09
1970	352	66	3	2026-01-29 13:04:31	c3dc8b02707af93b9f54b39384f40ec8a9871141	2026-04-25 10:25:09	2026-04-25 10:25:09
1971	2661	66	3	2026-01-29 13:04:31	c3dc8b02707af93b9f54b39384f40ec8a9871141	2026-04-25 10:25:09	2026-04-25 10:25:09
1972	1694	18	9	2025-12-07 16:55:55	45d4782894f4721138a2ce7791832fe5778c8d17	2026-04-25 10:25:09	2026-04-25 10:25:09
1973	2989	18	9	2025-12-07 16:55:55	45d4782894f4721138a2ce7791832fe5778c8d17	2026-04-25 10:25:09	2026-04-25 10:25:09
1974	4482	18	9	2025-12-07 16:55:55	45d4782894f4721138a2ce7791832fe5778c8d17	2026-04-25 10:25:09	2026-04-25 10:25:09
1975	4781	18	9	2025-12-07 16:55:55	45d4782894f4721138a2ce7791832fe5778c8d17	2026-04-25 10:25:09	2026-04-25 10:25:09
1976	4310	18	9	2025-12-07 16:55:55	45d4782894f4721138a2ce7791832fe5778c8d17	2026-04-25 10:25:09	2026-04-25 10:25:09
1977	2151	18	9	2025-12-07 16:55:55	45d4782894f4721138a2ce7791832fe5778c8d17	2026-04-25 10:25:09	2026-04-25 10:25:09
1978	3915	18	9	2025-12-07 16:55:55	45d4782894f4721138a2ce7791832fe5778c8d17	2026-04-25 10:25:09	2026-04-25 10:25:09
1979	3262	18	9	2025-12-07 16:55:55	45d4782894f4721138a2ce7791832fe5778c8d17	2026-04-25 10:25:09	2026-04-25 10:25:09
1980	2555	18	9	2025-12-07 16:55:55	45d4782894f4721138a2ce7791832fe5778c8d17	2026-04-25 10:25:09	2026-04-25 10:25:09
1981	4798	18	9	2025-12-07 16:55:55	45d4782894f4721138a2ce7791832fe5778c8d17	2026-04-25 10:25:09	2026-04-25 10:25:09
1982	821	49	3	2026-01-19 13:18:18	c90e5e8d2387494d42178a392c0e24b314aebc74	2026-04-25 10:25:09	2026-04-25 10:25:09
1983	2211	49	3	2026-01-19 13:18:18	c90e5e8d2387494d42178a392c0e24b314aebc74	2026-04-25 10:25:09	2026-04-25 10:25:09
1984	1989	49	3	2026-01-19 13:18:18	c90e5e8d2387494d42178a392c0e24b314aebc74	2026-04-25 10:25:09	2026-04-25 10:25:09
1985	713	57	10	2025-07-31 09:41:13	12b8489e175176212eb3a2dadf4ba6c2de3662be	2026-04-25 10:25:09	2026-04-25 10:25:09
1986	2568	57	10	2025-07-31 09:41:13	12b8489e175176212eb3a2dadf4ba6c2de3662be	2026-04-25 10:25:09	2026-04-25 10:25:09
1987	3787	57	10	2025-07-31 09:41:13	12b8489e175176212eb3a2dadf4ba6c2de3662be	2026-04-25 10:25:09	2026-04-25 10:25:09
1988	2332	57	10	2025-07-31 09:41:13	12b8489e175176212eb3a2dadf4ba6c2de3662be	2026-04-25 10:25:09	2026-04-25 10:25:09
1989	236	79	5	2025-08-17 13:42:41	342b60ec145c3046baf07be77431a54b38aadd59	2026-04-25 10:25:09	2026-04-25 10:25:09
1990	4291	79	5	2025-08-17 13:42:41	342b60ec145c3046baf07be77431a54b38aadd59	2026-04-25 10:25:09	2026-04-25 10:25:09
1991	2516	79	5	2025-08-17 13:42:41	342b60ec145c3046baf07be77431a54b38aadd59	2026-04-25 10:25:09	2026-04-25 10:25:09
1992	4630	79	5	2025-08-17 13:42:41	342b60ec145c3046baf07be77431a54b38aadd59	2026-04-25 10:25:09	2026-04-25 10:25:09
1993	4917	79	5	2025-08-17 13:42:41	342b60ec145c3046baf07be77431a54b38aadd59	2026-04-25 10:25:09	2026-04-25 10:25:09
1994	1928	79	5	2025-08-17 13:42:41	342b60ec145c3046baf07be77431a54b38aadd59	2026-04-25 10:25:09	2026-04-25 10:25:09
1995	695	79	5	2025-08-17 13:42:41	342b60ec145c3046baf07be77431a54b38aadd59	2026-04-25 10:25:09	2026-04-25 10:25:09
1996	699	79	5	2025-08-17 13:42:41	342b60ec145c3046baf07be77431a54b38aadd59	2026-04-25 10:25:09	2026-04-25 10:25:09
1997	2766	79	5	2025-08-17 13:42:41	342b60ec145c3046baf07be77431a54b38aadd59	2026-04-25 10:25:09	2026-04-25 10:25:09
1998	2440	79	5	2025-08-17 13:42:41	342b60ec145c3046baf07be77431a54b38aadd59	2026-04-25 10:25:09	2026-04-25 10:25:09
1999	577	99	7	2025-09-28 17:02:32	a01f02ea3b6d5448e3d4db3028e2365c30a8eb70	2026-04-25 10:25:09	2026-04-25 10:25:09
2000	2030	99	7	2025-09-28 17:02:32	a01f02ea3b6d5448e3d4db3028e2365c30a8eb70	2026-04-25 10:25:09	2026-04-25 10:25:09
2001	2698	99	7	2025-09-28 17:02:32	a01f02ea3b6d5448e3d4db3028e2365c30a8eb70	2026-04-25 10:25:09	2026-04-25 10:25:09
2002	3317	99	7	2025-09-28 17:02:32	a01f02ea3b6d5448e3d4db3028e2365c30a8eb70	2026-04-25 10:25:09	2026-04-25 10:25:09
2003	3993	99	7	2025-09-28 17:02:32	a01f02ea3b6d5448e3d4db3028e2365c30a8eb70	2026-04-25 10:25:09	2026-04-25 10:25:09
2004	4896	99	7	2025-09-28 17:02:32	a01f02ea3b6d5448e3d4db3028e2365c30a8eb70	2026-04-25 10:25:09	2026-04-25 10:25:09
2005	1271	99	7	2025-09-28 17:02:32	a01f02ea3b6d5448e3d4db3028e2365c30a8eb70	2026-04-25 10:25:09	2026-04-25 10:25:09
2006	1040	18	5	2025-09-02 10:01:33	b8dc9deae1994bacb797b5d12eb106caa6cf1bd1	2026-04-25 10:25:09	2026-04-25 10:25:09
2007	273	18	5	2025-09-02 10:01:33	b8dc9deae1994bacb797b5d12eb106caa6cf1bd1	2026-04-25 10:25:09	2026-04-25 10:25:09
2008	3527	18	5	2025-09-02 10:01:33	b8dc9deae1994bacb797b5d12eb106caa6cf1bd1	2026-04-25 10:25:09	2026-04-25 10:25:09
2009	3257	18	5	2025-09-02 10:01:33	b8dc9deae1994bacb797b5d12eb106caa6cf1bd1	2026-04-25 10:25:09	2026-04-25 10:25:09
2010	1988	18	5	2025-09-02 10:01:33	b8dc9deae1994bacb797b5d12eb106caa6cf1bd1	2026-04-25 10:25:09	2026-04-25 10:25:09
2011	4939	18	5	2025-09-02 10:01:33	b8dc9deae1994bacb797b5d12eb106caa6cf1bd1	2026-04-25 10:25:09	2026-04-25 10:25:09
2012	3386	18	5	2025-09-02 10:01:33	b8dc9deae1994bacb797b5d12eb106caa6cf1bd1	2026-04-25 10:25:09	2026-04-25 10:25:09
2013	2797	18	5	2025-09-02 10:01:33	b8dc9deae1994bacb797b5d12eb106caa6cf1bd1	2026-04-25 10:25:09	2026-04-25 10:25:09
2014	687	16	5	2025-11-30 13:43:43	83e35a9b2d8044cbf3af27d63249cf5766dee57f	2026-04-25 10:25:09	2026-04-25 10:25:09
2015	852	28	1	2025-12-20 16:14:31	465d3a715c4baf72b132c28eca9adcfd7af270d8	2026-04-25 10:25:09	2026-04-25 10:25:09
2016	3025	28	1	2025-12-20 16:14:31	465d3a715c4baf72b132c28eca9adcfd7af270d8	2026-04-25 10:25:09	2026-04-25 10:25:09
2017	408	28	1	2025-12-20 16:14:31	465d3a715c4baf72b132c28eca9adcfd7af270d8	2026-04-25 10:25:09	2026-04-25 10:25:09
2018	180	28	1	2025-12-20 16:14:31	465d3a715c4baf72b132c28eca9adcfd7af270d8	2026-04-25 10:25:09	2026-04-25 10:25:09
2019	2661	28	1	2025-12-20 16:14:31	465d3a715c4baf72b132c28eca9adcfd7af270d8	2026-04-25 10:25:09	2026-04-25 10:25:09
2020	1911	28	1	2025-12-20 16:14:31	465d3a715c4baf72b132c28eca9adcfd7af270d8	2026-04-25 10:25:09	2026-04-25 10:25:09
2021	3341	28	1	2025-12-20 16:14:31	465d3a715c4baf72b132c28eca9adcfd7af270d8	2026-04-25 10:25:09	2026-04-25 10:25:09
2022	117	45	8	2026-01-11 17:41:28	c358d7f21963ba54baf71b9b19e9fb8f4d408611	2026-04-25 10:25:09	2026-04-25 10:25:09
2023	272	45	8	2026-01-11 17:41:28	c358d7f21963ba54baf71b9b19e9fb8f4d408611	2026-04-25 10:25:09	2026-04-25 10:25:09
2024	2892	45	8	2026-01-11 17:41:28	c358d7f21963ba54baf71b9b19e9fb8f4d408611	2026-04-25 10:25:09	2026-04-25 10:25:09
2025	2288	45	8	2026-01-11 17:41:28	c358d7f21963ba54baf71b9b19e9fb8f4d408611	2026-04-25 10:25:09	2026-04-25 10:25:09
2026	2192	45	8	2026-01-11 17:41:28	c358d7f21963ba54baf71b9b19e9fb8f4d408611	2026-04-25 10:25:09	2026-04-25 10:25:09
2027	3414	66	2	2025-12-25 11:14:51	c7cb123229de46f33e8bd2777f5ffd978a97780a	2026-04-25 10:25:09	2026-04-25 10:25:09
2028	2364	66	2	2025-12-25 11:14:51	c7cb123229de46f33e8bd2777f5ffd978a97780a	2026-04-25 10:25:09	2026-04-25 10:25:09
2029	2531	66	2	2025-12-25 11:14:51	c7cb123229de46f33e8bd2777f5ffd978a97780a	2026-04-25 10:25:09	2026-04-25 10:25:09
2030	138	66	2	2025-12-25 11:14:51	c7cb123229de46f33e8bd2777f5ffd978a97780a	2026-04-25 10:25:09	2026-04-25 10:25:09
2031	60	66	2	2025-12-25 11:14:51	c7cb123229de46f33e8bd2777f5ffd978a97780a	2026-04-25 10:25:09	2026-04-25 10:25:09
2032	2100	66	2	2025-12-25 11:14:51	c7cb123229de46f33e8bd2777f5ffd978a97780a	2026-04-25 10:25:09	2026-04-25 10:25:09
2033	194	38	9	2026-02-21 15:10:25	3cc2af445e104c667b9298e99515d5966ae67a9c	2026-04-25 10:25:09	2026-04-25 10:25:09
2034	4316	38	9	2026-02-21 15:10:25	3cc2af445e104c667b9298e99515d5966ae67a9c	2026-04-25 10:25:09	2026-04-25 10:25:09
2035	771	38	9	2026-02-21 15:10:25	3cc2af445e104c667b9298e99515d5966ae67a9c	2026-04-25 10:25:09	2026-04-25 10:25:09
2036	1868	38	9	2026-02-21 15:10:25	3cc2af445e104c667b9298e99515d5966ae67a9c	2026-04-25 10:25:09	2026-04-25 10:25:09
2037	2415	22	5	2025-06-07 15:14:02	478ac7619c0eacd1464fa6b66c2aa2f348ca39b0	2026-04-25 10:25:09	2026-04-25 10:25:09
2038	2912	22	5	2025-06-07 15:14:02	478ac7619c0eacd1464fa6b66c2aa2f348ca39b0	2026-04-25 10:25:09	2026-04-25 10:25:09
2039	2744	22	5	2025-06-07 15:14:02	478ac7619c0eacd1464fa6b66c2aa2f348ca39b0	2026-04-25 10:25:09	2026-04-25 10:25:09
2040	3688	85	3	2025-10-15 13:29:56	8591f8dd8293ccf5664ef8823508bf24d0a50647	2026-04-25 10:25:09	2026-04-25 10:25:09
2041	2352	85	3	2025-10-15 13:29:56	8591f8dd8293ccf5664ef8823508bf24d0a50647	2026-04-25 10:25:09	2026-04-25 10:25:09
2042	3665	85	3	2025-10-15 13:29:56	8591f8dd8293ccf5664ef8823508bf24d0a50647	2026-04-25 10:25:09	2026-04-25 10:25:09
2043	3759	85	3	2025-10-15 13:29:56	8591f8dd8293ccf5664ef8823508bf24d0a50647	2026-04-25 10:25:09	2026-04-25 10:25:09
2044	581	85	3	2025-10-15 13:29:56	8591f8dd8293ccf5664ef8823508bf24d0a50647	2026-04-25 10:25:09	2026-04-25 10:25:09
2045	4472	85	3	2025-10-15 13:29:56	8591f8dd8293ccf5664ef8823508bf24d0a50647	2026-04-25 10:25:09	2026-04-25 10:25:09
2046	3491	85	3	2025-10-15 13:29:56	8591f8dd8293ccf5664ef8823508bf24d0a50647	2026-04-25 10:25:09	2026-04-25 10:25:09
2047	2778	85	3	2025-10-15 13:29:56	8591f8dd8293ccf5664ef8823508bf24d0a50647	2026-04-25 10:25:09	2026-04-25 10:25:09
2048	837	85	3	2025-10-15 13:29:56	8591f8dd8293ccf5664ef8823508bf24d0a50647	2026-04-25 10:25:09	2026-04-25 10:25:09
2049	1607	85	3	2025-10-15 13:29:56	8591f8dd8293ccf5664ef8823508bf24d0a50647	2026-04-25 10:25:09	2026-04-25 10:25:09
2050	227	14	8	2025-12-16 12:55:34	aac5d4d7230ac26721974d10e29f7a283e2084e3	2026-04-25 10:25:09	2026-04-25 10:25:09
2051	2090	14	8	2025-12-16 12:55:34	aac5d4d7230ac26721974d10e29f7a283e2084e3	2026-04-25 10:25:09	2026-04-25 10:25:09
2052	3170	14	8	2025-12-16 12:55:34	aac5d4d7230ac26721974d10e29f7a283e2084e3	2026-04-25 10:25:09	2026-04-25 10:25:09
2053	1293	14	8	2025-12-16 12:55:34	aac5d4d7230ac26721974d10e29f7a283e2084e3	2026-04-25 10:25:09	2026-04-25 10:25:09
2054	416	14	8	2025-12-16 12:55:34	aac5d4d7230ac26721974d10e29f7a283e2084e3	2026-04-25 10:25:09	2026-04-25 10:25:09
2055	1803	14	8	2025-12-16 12:55:34	aac5d4d7230ac26721974d10e29f7a283e2084e3	2026-04-25 10:25:09	2026-04-25 10:25:09
2056	4041	14	8	2025-12-16 12:55:34	aac5d4d7230ac26721974d10e29f7a283e2084e3	2026-04-25 10:25:09	2026-04-25 10:25:09
2057	4244	14	8	2025-12-16 12:55:34	aac5d4d7230ac26721974d10e29f7a283e2084e3	2026-04-25 10:25:09	2026-04-25 10:25:09
2058	1393	14	8	2025-12-16 12:55:34	aac5d4d7230ac26721974d10e29f7a283e2084e3	2026-04-25 10:25:09	2026-04-25 10:25:09
2059	1954	14	8	2025-12-16 12:55:34	aac5d4d7230ac26721974d10e29f7a283e2084e3	2026-04-25 10:25:09	2026-04-25 10:25:09
2060	3046	59	5	2025-10-22 16:58:26	a6ee7550f103dd03d37228433f5b013b959f51c6	2026-04-25 10:25:09	2026-04-25 10:25:09
2061	4792	59	5	2025-10-22 16:58:26	a6ee7550f103dd03d37228433f5b013b959f51c6	2026-04-25 10:25:09	2026-04-25 10:25:09
2062	118	59	5	2025-10-22 16:58:26	a6ee7550f103dd03d37228433f5b013b959f51c6	2026-04-25 10:25:09	2026-04-25 10:25:09
2063	3017	59	5	2025-10-22 16:58:26	a6ee7550f103dd03d37228433f5b013b959f51c6	2026-04-25 10:25:09	2026-04-25 10:25:09
2064	2799	59	5	2025-10-22 16:58:26	a6ee7550f103dd03d37228433f5b013b959f51c6	2026-04-25 10:25:09	2026-04-25 10:25:09
2065	3221	59	5	2025-10-22 16:58:26	a6ee7550f103dd03d37228433f5b013b959f51c6	2026-04-25 10:25:09	2026-04-25 10:25:09
2066	1328	59	5	2025-10-22 16:58:26	a6ee7550f103dd03d37228433f5b013b959f51c6	2026-04-25 10:25:09	2026-04-25 10:25:09
2067	3057	59	5	2025-10-22 16:58:26	a6ee7550f103dd03d37228433f5b013b959f51c6	2026-04-25 10:25:09	2026-04-25 10:25:09
2068	4823	59	5	2025-10-22 16:58:26	a6ee7550f103dd03d37228433f5b013b959f51c6	2026-04-25 10:25:09	2026-04-25 10:25:09
2069	809	59	5	2025-10-22 16:58:26	a6ee7550f103dd03d37228433f5b013b959f51c6	2026-04-25 10:25:09	2026-04-25 10:25:09
2070	2989	28	5	2025-12-11 17:17:55	5cfbd319b6c87e4e99069349f56cc5e03315a1fd	2026-04-25 10:25:09	2026-04-25 10:25:09
2071	3807	28	5	2025-12-11 17:17:55	5cfbd319b6c87e4e99069349f56cc5e03315a1fd	2026-04-25 10:25:09	2026-04-25 10:25:09
2072	3192	28	5	2025-12-11 17:17:55	5cfbd319b6c87e4e99069349f56cc5e03315a1fd	2026-04-25 10:25:09	2026-04-25 10:25:09
2073	3302	31	3	2026-04-14 09:04:57	d8ed740eb315b5784fca4ea49da0a5295c53f2ed	2026-04-25 10:25:09	2026-04-25 10:25:09
2074	2937	94	9	2025-11-28 16:12:15	6ebcc5dbd14697d7411f49c4470878fe1733712e	2026-04-25 10:25:09	2026-04-25 10:25:09
2075	121	94	9	2025-11-28 16:12:15	6ebcc5dbd14697d7411f49c4470878fe1733712e	2026-04-25 10:25:09	2026-04-25 10:25:09
2076	3223	94	9	2025-11-28 16:12:15	6ebcc5dbd14697d7411f49c4470878fe1733712e	2026-04-25 10:25:09	2026-04-25 10:25:09
2077	4031	43	3	2025-12-04 11:01:45	e28a34e5cf64871b01803b46366379196d0a3a36	2026-04-25 10:25:09	2026-04-25 10:25:09
2078	1867	43	3	2025-12-04 11:01:45	e28a34e5cf64871b01803b46366379196d0a3a36	2026-04-25 10:25:09	2026-04-25 10:25:09
2079	77	43	3	2025-12-04 11:01:45	e28a34e5cf64871b01803b46366379196d0a3a36	2026-04-25 10:25:09	2026-04-25 10:25:09
2080	519	12	6	2025-08-16 10:56:29	84d0962d05f37b910f0a3db57eff0e940b1f191d	2026-04-25 10:25:09	2026-04-25 10:25:09
2081	2486	12	6	2025-08-16 10:56:29	84d0962d05f37b910f0a3db57eff0e940b1f191d	2026-04-25 10:25:09	2026-04-25 10:25:09
2082	4043	12	6	2025-08-16 10:56:29	84d0962d05f37b910f0a3db57eff0e940b1f191d	2026-04-25 10:25:09	2026-04-25 10:25:09
2083	4050	12	6	2025-08-16 10:56:29	84d0962d05f37b910f0a3db57eff0e940b1f191d	2026-04-25 10:25:09	2026-04-25 10:25:09
2084	4289	12	6	2025-08-16 10:56:29	84d0962d05f37b910f0a3db57eff0e940b1f191d	2026-04-25 10:25:09	2026-04-25 10:25:09
2085	4958	12	6	2025-08-16 10:56:29	84d0962d05f37b910f0a3db57eff0e940b1f191d	2026-04-25 10:25:09	2026-04-25 10:25:09
2086	2042	12	6	2025-08-16 10:56:29	84d0962d05f37b910f0a3db57eff0e940b1f191d	2026-04-25 10:25:09	2026-04-25 10:25:09
2087	1882	12	6	2025-08-16 10:56:29	84d0962d05f37b910f0a3db57eff0e940b1f191d	2026-04-25 10:25:09	2026-04-25 10:25:09
2088	4925	84	4	2025-04-27 09:25:05	aa9f7e8e74c83658929543667d6c4c1ce26659f3	2026-04-25 10:25:09	2026-04-25 10:25:09
2089	368	84	4	2025-04-27 09:25:05	aa9f7e8e74c83658929543667d6c4c1ce26659f3	2026-04-25 10:25:09	2026-04-25 10:25:09
2090	4843	84	4	2025-04-27 09:25:05	aa9f7e8e74c83658929543667d6c4c1ce26659f3	2026-04-25 10:25:09	2026-04-25 10:25:09
2091	4565	84	4	2025-04-27 09:25:05	aa9f7e8e74c83658929543667d6c4c1ce26659f3	2026-04-25 10:25:09	2026-04-25 10:25:09
2092	2431	37	9	2025-09-18 11:27:32	0c94d74a9a302edb18c2cf926e3b2eb577d58cf7	2026-04-25 10:25:09	2026-04-25 10:25:09
2093	2688	37	9	2025-09-18 11:27:32	0c94d74a9a302edb18c2cf926e3b2eb577d58cf7	2026-04-25 10:25:09	2026-04-25 10:25:09
2094	3482	88	4	2026-04-13 15:58:39	5d48c87ed2b9f6d53a98490b77cb0b27c47beb6b	2026-04-25 10:25:09	2026-04-25 10:25:09
2095	4295	88	4	2026-04-13 15:58:39	5d48c87ed2b9f6d53a98490b77cb0b27c47beb6b	2026-04-25 10:25:09	2026-04-25 10:25:09
2096	4267	88	4	2026-04-13 15:58:39	5d48c87ed2b9f6d53a98490b77cb0b27c47beb6b	2026-04-25 10:25:09	2026-04-25 10:25:09
2097	4836	88	4	2026-04-13 15:58:39	5d48c87ed2b9f6d53a98490b77cb0b27c47beb6b	2026-04-25 10:25:09	2026-04-25 10:25:09
2098	275	88	4	2026-04-13 15:58:39	5d48c87ed2b9f6d53a98490b77cb0b27c47beb6b	2026-04-25 10:25:09	2026-04-25 10:25:09
2099	1350	80	8	2025-11-24 09:27:12	74446b4826d78d985fa277665f838818c4eae53e	2026-04-25 10:25:09	2026-04-25 10:25:09
2100	941	80	8	2025-11-24 09:27:12	74446b4826d78d985fa277665f838818c4eae53e	2026-04-25 10:25:09	2026-04-25 10:25:09
2101	1577	80	8	2025-11-24 09:27:12	74446b4826d78d985fa277665f838818c4eae53e	2026-04-25 10:25:09	2026-04-25 10:25:09
2102	1728	80	8	2025-11-24 09:27:12	74446b4826d78d985fa277665f838818c4eae53e	2026-04-25 10:25:09	2026-04-25 10:25:09
2103	726	23	10	2025-05-25 15:55:29	43238c670b19574c79ba55a6b7580a4f90e54efa	2026-04-25 10:25:09	2026-04-25 10:25:09
2104	2784	23	10	2025-05-25 15:55:29	43238c670b19574c79ba55a6b7580a4f90e54efa	2026-04-25 10:25:09	2026-04-25 10:25:09
2105	3260	23	10	2025-05-25 15:55:29	43238c670b19574c79ba55a6b7580a4f90e54efa	2026-04-25 10:25:09	2026-04-25 10:25:09
2106	2169	23	10	2025-05-25 15:55:29	43238c670b19574c79ba55a6b7580a4f90e54efa	2026-04-25 10:25:09	2026-04-25 10:25:09
2107	2101	23	10	2025-05-25 15:55:29	43238c670b19574c79ba55a6b7580a4f90e54efa	2026-04-25 10:25:09	2026-04-25 10:25:09
2108	4559	23	10	2025-05-25 15:55:29	43238c670b19574c79ba55a6b7580a4f90e54efa	2026-04-25 10:25:09	2026-04-25 10:25:09
2109	3360	23	10	2025-05-25 15:55:29	43238c670b19574c79ba55a6b7580a4f90e54efa	2026-04-25 10:25:09	2026-04-25 10:25:09
2110	3133	23	10	2025-05-25 15:55:29	43238c670b19574c79ba55a6b7580a4f90e54efa	2026-04-25 10:25:09	2026-04-25 10:25:09
2111	3373	32	2	2025-11-04 17:19:55	21c393074ce58b1e3c5b734d91938bbb55512fc8	2026-04-25 10:25:09	2026-04-25 10:25:09
2112	952	32	2	2025-11-04 17:19:55	21c393074ce58b1e3c5b734d91938bbb55512fc8	2026-04-25 10:25:09	2026-04-25 10:25:09
2113	2208	32	2	2025-11-04 17:19:55	21c393074ce58b1e3c5b734d91938bbb55512fc8	2026-04-25 10:25:09	2026-04-25 10:25:09
2114	2062	32	2	2025-11-04 17:19:55	21c393074ce58b1e3c5b734d91938bbb55512fc8	2026-04-25 10:25:09	2026-04-25 10:25:09
2115	3027	32	2	2025-11-04 17:19:55	21c393074ce58b1e3c5b734d91938bbb55512fc8	2026-04-25 10:25:09	2026-04-25 10:25:09
\.


--
-- Data for Name: salespeople; Type: TABLE DATA; Schema: public; Owner: prs
--

COPY public.salespeople (id, name, nickname, created_at, updated_at) FROM stdin;
1	Estêvão  Marin	estêvão.marin	2026-04-25 10:25:09	2026-04-25 10:25:09
2	Santiago  Serrano	santiago.serrano	2026-04-25 10:25:09	2026-04-25 10:25:09
3	Bruna  Santana	bruna.santana	2026-04-25 10:25:09	2026-04-25 10:25:09
4	Lavínia  Fernandes	lavínia.fernandes	2026-04-25 10:25:09	2026-04-25 10:25:09
5	Sebastião  Burgos	sebastião.burgos	2026-04-25 10:25:09	2026-04-25 10:25:09
6	Ellen  Serrano	ellen.serrano	2026-04-25 10:25:09	2026-04-25 10:25:09
7	Sara  Perez	sara.perez	2026-04-25 10:25:09	2026-04-25 10:25:09
8	Maya  Aranda	maya.aranda	2026-04-25 10:25:09	2026-04-25 10:25:09
9	Melinda  Paz	melinda.paz	2026-04-25 10:25:09	2026-04-25 10:25:09
10	Luara  Furtado	luara.furtado	2026-04-25 10:25:09	2026-04-25 10:25:09
\.


--
-- Data for Name: sessions; Type: TABLE DATA; Schema: public; Owner: prs
--

COPY public.sessions (id, user_id, ip_address, user_agent, payload, last_activity) FROM stdin;
PJWcdcJ9xknz6uqhW6KT0rPYAGruEwQuvrMEZ4JL	1	127.0.0.1	Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/147.0.0.0 Safari/537.36	YTo1OntzOjY6Il90b2tlbiI7czo0MDoid2F4Njd1RE04Q1ZTenk1aVZRcHcyTUFVQXdxdVQwWG5ZcWZTSGN0ZCI7czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6MzU6Imh0dHA6Ly9sb2NhbGhvc3Q6ODAwMC9wcm9kdWN0cy9saXN0IjtzOjU6InJvdXRlIjtzOjEzOiJwcm9kdWN0cy5saXN0Ijt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319czo1MDoibG9naW5fd2ViXzU5YmEzNmFkZGMyYjJmOTQwMTU4MGYwMTRjN2Y1OGVhNGUzMDk4OWQiO2k6MTtzOjE5OiJ0d29fZmFjdG9yX2VtcHR5X2F0IjtpOjE3NzcxMDg3NjY7fQ==	1777108800
\.


--
-- Data for Name: sizes; Type: TABLE DATA; Schema: public; Owner: prs
--

COPY public.sizes (id, size, created_at, updated_at) FROM stdin;
1	P	\N	\N
2	M	\N	\N
3	G	\N	\N
4	GG	\N	\N
5	U	\N	\N
6	35	\N	\N
7	36	\N	\N
8	37	\N	\N
9	38	\N	\N
10	39	\N	\N
11	40	\N	\N
12	42	\N	\N
13	44	\N	\N
14	48	\N	\N
15	50	\N	\N
16	XS	\N	\N
17	XL	\N	\N
18	XXL	\N	\N
19	XXG	\N	\N
\.


--
-- Data for Name: users; Type: TABLE DATA; Schema: public; Owner: prs
--

COPY public.users (id, name, avatar, email, email_verified_at, password, remember_token, created_at, updated_at, uuid, two_factor_secret, two_factor_recovery_codes, two_factor_confirmed_at) FROM stdin;
2	Hernani  Colaço	https://api.dicebear.com/7.x/avataaars/svg?seed=tXBpp4tI55	hernani.colaco@psr.net	2026-04-21 10:28:48	$2y$12$E9s7/dn1RW7Eb4a06r2t9OextDBv/vJ12QNk6FgCA9ZZU9DPl1NAK	\N	2026-04-21 10:28:48	2026-04-21 10:28:48	70109426-f77e-40bf-bcb7-032fbac14ace	\N	\N	\N
4	Nelson  Arruda	https://api.dicebear.com/7.x/avataaars/svg?seed=SAQOuglmN7	nelson.arruda@psr.net	2026-04-21 10:28:48	$2y$12$JQIGiIpCp47OM3Uq2dcxzOhamFEyUB/b2EmDVCwyu8R2Vj16IkGHG	\N	2026-04-21 10:28:48	2026-04-21 10:28:48	756985dd-23f6-4f9d-a33d-7706d0d21d87	\N	\N	\N
5	Simon  Cordeiro	https://api.dicebear.com/7.x/avataaars/svg?seed=YAthl1j3uF	simon.cordeiro@psr.net	2026-04-21 10:28:49	$2y$12$fjs43op/LJ3Ctzzh7ZPHauquERQVYF2WzJ7xyVL2pyB2w1KbT6i/W	\N	2026-04-21 10:28:49	2026-04-21 10:28:49	570e4e0c-b3e0-4452-aa71-c9ecf74867a8	\N	\N	\N
6	Julieta  Pena	https://api.dicebear.com/7.x/avataaars/svg?seed=uD1DfTgn6n	julieta.pena@psr.net	2026-04-21 10:28:49	$2y$12$KYg58.8YDc5BXmrVBjwpd.8Tu9nbkK4iI4BPTiD3GHorNJyCovaXi	\N	2026-04-21 10:28:49	2026-04-21 10:28:49	e79566c3-d2c5-437b-b993-ddad17308e06	\N	\N	\N
7	Lavínia  Faria	https://api.dicebear.com/7.x/avataaars/svg?seed=xqykAWBsR1	lavinia.faria@psr.net	2026-04-21 10:28:49	$2y$12$.m9sstIAa4NGsafT33rL3.wdyk6H0UyY4zLd/ClCduwwbcyCo/BDO	\N	2026-04-21 10:28:49	2026-04-21 10:28:49	c879e7e5-dd85-4410-bf3a-18d3fb8ecc6b	\N	\N	\N
8	Noa  Alcantara	https://api.dicebear.com/7.x/avataaars/svg?seed=sEjGR0KqdY	noa.alcantara@psr.net	2026-04-21 10:28:49	$2y$12$oxHUx.9EFEWf.vufqOjTh.7BFyXwemmXfV6HjQx1r6sI7tNi0GCHm	\N	2026-04-21 10:28:49	2026-04-21 10:28:49	02154c13-be21-4e70-b679-83aac275640b	\N	\N	\N
9	Antonieta  Ferminiano	https://api.dicebear.com/7.x/avataaars/svg?seed=GyF9nbEmqA	antonieta.ferminiano@psr.net	2026-04-21 10:28:49	$2y$12$J0VUZhpR2y.k1jmRCbZxPend///W6udf9nXO9GBaSjHDI0SxCheMi	\N	2026-04-21 10:28:49	2026-04-21 10:28:49	4bef9b56-3af4-4992-9cc4-952ceaae6071	\N	\N	\N
10	Sandra  Delgado	https://api.dicebear.com/7.x/avataaars/svg?seed=8ODnPKOmza	sandra.delgado@psr.net	2026-04-21 10:28:50	$2y$12$RBtboMSDFj5Pp11O/zu1SOsoUZy9bC/ASwbeCL3y7arTb4KEyKCcO	\N	2026-04-21 10:28:50	2026-04-21 10:28:50	ac8af8b4-9345-47f3-8f2c-77e7c0bdd769	\N	\N	\N
3	Ítalo  Rosa	https://api.dicebear.com/7.x/avataaars/svg?seed=Hvp8NEuPMZ	italo.rosa@psr.net	2026-04-21 10:28:48	$2y$12$Tw0A5QjOkDOp73iTygx0sex1mHRkjiJ8lvVXGUap/PkzO2ObN/lpW	oDCXpdZXK3UcTILbXeNaJOYcQtvGz9x33fPnjQSaB4ZlxqKI1W4lAkhivPI6	2026-04-21 10:28:48	2026-04-21 10:28:48	785646c1-26b6-4b4d-9236-bda58febe7db	\N	\N	\N
1	Jennifer  Espinoza	https://api.dicebear.com/7.x/avataaars/svg?seed=M57dbPZQkr	jennifer.espinoza@psr.net	2026-04-21 10:28:48	$2y$12$GvFul9Dr1ePnqPLmIYLulOUm58I9XLw0MMiNA0pozIwIrxO53DjY6	j5eRhUEs1mSkC6UWronJ5MGiEYdZkBbYU4sqplmoFgPBgffBrMT9OrfIkR19	2026-04-21 10:28:48	2026-04-21 10:28:48	fe740842-17d8-440d-8176-5091382450c8	\N	\N	\N
\.


--
-- Name: brands_id_seq; Type: SEQUENCE SET; Schema: public; Owner: prs
--

SELECT pg_catalog.setval('public.brands_id_seq', 31, true);


--
-- Name: categories_id_seq; Type: SEQUENCE SET; Schema: public; Owner: prs
--

SELECT pg_catalog.setval('public.categories_id_seq', 21, true);


--
-- Name: colors_id_seq; Type: SEQUENCE SET; Schema: public; Owner: prs
--

SELECT pg_catalog.setval('public.colors_id_seq', 20, true);


--
-- Name: customers_id_seq; Type: SEQUENCE SET; Schema: public; Owner: prs
--

SELECT pg_catalog.setval('public.customers_id_seq', 120, true);


--
-- Name: failed_jobs_id_seq; Type: SEQUENCE SET; Schema: public; Owner: prs
--

SELECT pg_catalog.setval('public.failed_jobs_id_seq', 1, false);


--
-- Name: features_id_seq; Type: SEQUENCE SET; Schema: public; Owner: prs
--

SELECT pg_catalog.setval('public.features_id_seq', 32, true);


--
-- Name: jobs_id_seq; Type: SEQUENCE SET; Schema: public; Owner: prs
--

SELECT pg_catalog.setval('public.jobs_id_seq', 1, false);


--
-- Name: migrations_id_seq; Type: SEQUENCE SET; Schema: public; Owner: prs
--

SELECT pg_catalog.setval('public.migrations_id_seq', 12, true);


--
-- Name: products_id_seq; Type: SEQUENCE SET; Schema: public; Owner: prs
--

SELECT pg_catalog.setval('public.products_id_seq', 5000, true);


--
-- Name: purcheases_id_seq; Type: SEQUENCE SET; Schema: public; Owner: prs
--

SELECT pg_catalog.setval('public.purcheases_id_seq', 2115, true);


--
-- Name: salespeople_id_seq; Type: SEQUENCE SET; Schema: public; Owner: prs
--

SELECT pg_catalog.setval('public.salespeople_id_seq', 10, true);


--
-- Name: sizes_id_seq; Type: SEQUENCE SET; Schema: public; Owner: prs
--

SELECT pg_catalog.setval('public.sizes_id_seq', 19, true);


--
-- Name: users_id_seq; Type: SEQUENCE SET; Schema: public; Owner: prs
--

SELECT pg_catalog.setval('public.users_id_seq', 10, true);


--
-- Name: brands brands_brand_unique; Type: CONSTRAINT; Schema: public; Owner: prs
--

ALTER TABLE ONLY public.brands
    ADD CONSTRAINT brands_brand_unique UNIQUE (brand);


--
-- Name: brands brands_pkey; Type: CONSTRAINT; Schema: public; Owner: prs
--

ALTER TABLE ONLY public.brands
    ADD CONSTRAINT brands_pkey PRIMARY KEY (id);


--
-- Name: cache_locks cache_locks_pkey; Type: CONSTRAINT; Schema: public; Owner: prs
--

ALTER TABLE ONLY public.cache_locks
    ADD CONSTRAINT cache_locks_pkey PRIMARY KEY (key);


--
-- Name: cache cache_pkey; Type: CONSTRAINT; Schema: public; Owner: prs
--

ALTER TABLE ONLY public.cache
    ADD CONSTRAINT cache_pkey PRIMARY KEY (key);


--
-- Name: categories categories_category_unique; Type: CONSTRAINT; Schema: public; Owner: prs
--

ALTER TABLE ONLY public.categories
    ADD CONSTRAINT categories_category_unique UNIQUE (category);


--
-- Name: categories categories_pkey; Type: CONSTRAINT; Schema: public; Owner: prs
--

ALTER TABLE ONLY public.categories
    ADD CONSTRAINT categories_pkey PRIMARY KEY (id);


--
-- Name: colors colors_color_unique; Type: CONSTRAINT; Schema: public; Owner: prs
--

ALTER TABLE ONLY public.colors
    ADD CONSTRAINT colors_color_unique UNIQUE (color);


--
-- Name: colors colors_pkey; Type: CONSTRAINT; Schema: public; Owner: prs
--

ALTER TABLE ONLY public.colors
    ADD CONSTRAINT colors_pkey PRIMARY KEY (id);


--
-- Name: customers customers_pkey; Type: CONSTRAINT; Schema: public; Owner: prs
--

ALTER TABLE ONLY public.customers
    ADD CONSTRAINT customers_pkey PRIMARY KEY (id);


--
-- Name: failed_jobs failed_jobs_pkey; Type: CONSTRAINT; Schema: public; Owner: prs
--

ALTER TABLE ONLY public.failed_jobs
    ADD CONSTRAINT failed_jobs_pkey PRIMARY KEY (id);


--
-- Name: failed_jobs failed_jobs_uuid_unique; Type: CONSTRAINT; Schema: public; Owner: prs
--

ALTER TABLE ONLY public.failed_jobs
    ADD CONSTRAINT failed_jobs_uuid_unique UNIQUE (uuid);


--
-- Name: features features_feature_unique; Type: CONSTRAINT; Schema: public; Owner: prs
--

ALTER TABLE ONLY public.features
    ADD CONSTRAINT features_feature_unique UNIQUE (feature);


--
-- Name: features features_pkey; Type: CONSTRAINT; Schema: public; Owner: prs
--

ALTER TABLE ONLY public.features
    ADD CONSTRAINT features_pkey PRIMARY KEY (id);


--
-- Name: job_batches job_batches_pkey; Type: CONSTRAINT; Schema: public; Owner: prs
--

ALTER TABLE ONLY public.job_batches
    ADD CONSTRAINT job_batches_pkey PRIMARY KEY (id);


--
-- Name: jobs jobs_pkey; Type: CONSTRAINT; Schema: public; Owner: prs
--

ALTER TABLE ONLY public.jobs
    ADD CONSTRAINT jobs_pkey PRIMARY KEY (id);


--
-- Name: migrations migrations_pkey; Type: CONSTRAINT; Schema: public; Owner: prs
--

ALTER TABLE ONLY public.migrations
    ADD CONSTRAINT migrations_pkey PRIMARY KEY (id);


--
-- Name: password_reset_tokens password_reset_tokens_pkey; Type: CONSTRAINT; Schema: public; Owner: prs
--

ALTER TABLE ONLY public.password_reset_tokens
    ADD CONSTRAINT password_reset_tokens_pkey PRIMARY KEY (email);


--
-- Name: products products_pkey; Type: CONSTRAINT; Schema: public; Owner: prs
--

ALTER TABLE ONLY public.products
    ADD CONSTRAINT products_pkey PRIMARY KEY (id);


--
-- Name: purcheases purcheases_pkey; Type: CONSTRAINT; Schema: public; Owner: prs
--

ALTER TABLE ONLY public.purcheases
    ADD CONSTRAINT purcheases_pkey PRIMARY KEY (id);


--
-- Name: salespeople salespeople_nickname_unique; Type: CONSTRAINT; Schema: public; Owner: prs
--

ALTER TABLE ONLY public.salespeople
    ADD CONSTRAINT salespeople_nickname_unique UNIQUE (nickname);


--
-- Name: salespeople salespeople_pkey; Type: CONSTRAINT; Schema: public; Owner: prs
--

ALTER TABLE ONLY public.salespeople
    ADD CONSTRAINT salespeople_pkey PRIMARY KEY (id);


--
-- Name: sessions sessions_pkey; Type: CONSTRAINT; Schema: public; Owner: prs
--

ALTER TABLE ONLY public.sessions
    ADD CONSTRAINT sessions_pkey PRIMARY KEY (id);


--
-- Name: sizes sizes_pkey; Type: CONSTRAINT; Schema: public; Owner: prs
--

ALTER TABLE ONLY public.sizes
    ADD CONSTRAINT sizes_pkey PRIMARY KEY (id);


--
-- Name: sizes sizes_size_unique; Type: CONSTRAINT; Schema: public; Owner: prs
--

ALTER TABLE ONLY public.sizes
    ADD CONSTRAINT sizes_size_unique UNIQUE (size);


--
-- Name: users users_email_unique; Type: CONSTRAINT; Schema: public; Owner: prs
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_unique UNIQUE (email);


--
-- Name: users users_pkey; Type: CONSTRAINT; Schema: public; Owner: prs
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_pkey PRIMARY KEY (id);


--
-- Name: users users_uuid_unique; Type: CONSTRAINT; Schema: public; Owner: prs
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_uuid_unique UNIQUE (uuid);


--
-- Name: brands_brand_index; Type: INDEX; Schema: public; Owner: prs
--

CREATE INDEX brands_brand_index ON public.brands USING btree (brand);


--
-- Name: categories_category_index; Type: INDEX; Schema: public; Owner: prs
--

CREATE INDEX categories_category_index ON public.categories USING btree (category);


--
-- Name: colors_color_index; Type: INDEX; Schema: public; Owner: prs
--

CREATE INDEX colors_color_index ON public.colors USING btree (color);


--
-- Name: customers_age_index; Type: INDEX; Schema: public; Owner: prs
--

CREATE INDEX customers_age_index ON public.customers USING btree (age);


--
-- Name: features_feature_index; Type: INDEX; Schema: public; Owner: prs
--

CREATE INDEX features_feature_index ON public.features USING btree (feature);


--
-- Name: jobs_queue_index; Type: INDEX; Schema: public; Owner: prs
--

CREATE INDEX jobs_queue_index ON public.jobs USING btree (queue);


--
-- Name: products_category_id_color_id_size_id_index; Type: INDEX; Schema: public; Owner: prs
--

CREATE INDEX products_category_id_color_id_size_id_index ON public.products USING btree (category_id, color_id, size_id);


--
-- Name: purcheases_purchease_hash_index; Type: INDEX; Schema: public; Owner: prs
--

CREATE INDEX purcheases_purchease_hash_index ON public.purcheases USING btree (purchease_hash);


--
-- Name: salespeople_nickname_index; Type: INDEX; Schema: public; Owner: prs
--

CREATE INDEX salespeople_nickname_index ON public.salespeople USING btree (nickname);


--
-- Name: sessions_last_activity_index; Type: INDEX; Schema: public; Owner: prs
--

CREATE INDEX sessions_last_activity_index ON public.sessions USING btree (last_activity);


--
-- Name: sessions_user_id_index; Type: INDEX; Schema: public; Owner: prs
--

CREATE INDEX sessions_user_id_index ON public.sessions USING btree (user_id);


--
-- Name: sizes_size_index; Type: INDEX; Schema: public; Owner: prs
--

CREATE INDEX sizes_size_index ON public.sizes USING btree (size);


--
-- Name: products products_brand_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: prs
--

ALTER TABLE ONLY public.products
    ADD CONSTRAINT products_brand_id_foreign FOREIGN KEY (brand_id) REFERENCES public.brands(id) ON DELETE CASCADE;


--
-- Name: products products_category_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: prs
--

ALTER TABLE ONLY public.products
    ADD CONSTRAINT products_category_id_foreign FOREIGN KEY (category_id) REFERENCES public.categories(id) ON DELETE CASCADE;


--
-- Name: products products_color_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: prs
--

ALTER TABLE ONLY public.products
    ADD CONSTRAINT products_color_id_foreign FOREIGN KEY (color_id) REFERENCES public.colors(id) ON DELETE CASCADE;


--
-- Name: products products_feature_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: prs
--

ALTER TABLE ONLY public.products
    ADD CONSTRAINT products_feature_id_foreign FOREIGN KEY (feature_id) REFERENCES public.features(id) ON DELETE CASCADE;


--
-- Name: products products_size_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: prs
--

ALTER TABLE ONLY public.products
    ADD CONSTRAINT products_size_id_foreign FOREIGN KEY (size_id) REFERENCES public.sizes(id) ON DELETE CASCADE;


--
-- Name: purcheases purcheases_customer_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: prs
--

ALTER TABLE ONLY public.purcheases
    ADD CONSTRAINT purcheases_customer_id_foreign FOREIGN KEY (customer_id) REFERENCES public.customers(id) ON DELETE CASCADE;


--
-- Name: purcheases purcheases_product_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: prs
--

ALTER TABLE ONLY public.purcheases
    ADD CONSTRAINT purcheases_product_id_foreign FOREIGN KEY (product_id) REFERENCES public.products(id) ON DELETE CASCADE;


--
-- Name: purcheases purcheases_salesperson_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: prs
--

ALTER TABLE ONLY public.purcheases
    ADD CONSTRAINT purcheases_salesperson_id_foreign FOREIGN KEY (salesperson_id) REFERENCES public.salespeople(id) ON DELETE CASCADE;


--
-- Name: TABLE pg_database; Type: ACL; Schema: pg_catalog; Owner: postgres
--

REVOKE SELECT ON TABLE pg_catalog.pg_database FROM PUBLIC;
GRANT SELECT ON TABLE pg_catalog.pg_database TO prs;


--
-- PostgreSQL database dump complete
--

\unrestrict 6UaIG5GHiGkFfnb0GgnYvICSrtmDfcVcEMAEygW7vBKRNjMexEdb9ltLYBrnD8o

