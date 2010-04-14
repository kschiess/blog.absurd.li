--
-- PostgreSQL database dump
--

SET statement_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = off;
SET check_function_bodies = false;
SET client_min_messages = warning;
SET escape_string_warning = off;

SET search_path = public, pg_catalog;

--
-- Name: acl_id_seq; Type: SEQUENCE; Schema: public; Owner: rt
--

CREATE SEQUENCE acl_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;


ALTER TABLE public.acl_id_seq OWNER TO rt;

--
-- Name: acl_id_seq; Type: SEQUENCE SET; Schema: public; Owner: rt
--

SELECT pg_catalog.setval('acl_id_seq', 1, false);


SET default_tablespace = '';

SET default_with_oids = false;

--
-- Name: acl; Type: TABLE; Schema: public; Owner: rt; Tablespace: 
--

CREATE TABLE acl (
    id integer DEFAULT nextval('acl_id_seq'::regclass) NOT NULL,
    principaltype character varying(25) NOT NULL,
    principalid integer NOT NULL,
    rightname character varying(25) NOT NULL,
    objecttype character varying(25) NOT NULL,
    objectid integer DEFAULT 0 NOT NULL,
    delegatedby integer DEFAULT 0 NOT NULL,
    delegatedfrom integer DEFAULT 0 NOT NULL
);


ALTER TABLE public.acl OWNER TO rt;

--
-- Name: attachments_id_seq; Type: SEQUENCE; Schema: public; Owner: rt
--

CREATE SEQUENCE attachments_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;


ALTER TABLE public.attachments_id_seq OWNER TO rt;

--
-- Name: attachments_id_seq; Type: SEQUENCE SET; Schema: public; Owner: rt
--

SELECT pg_catalog.setval('attachments_id_seq', 1, false);


--
-- Name: attachments; Type: TABLE; Schema: public; Owner: rt; Tablespace: 
--

CREATE TABLE attachments (
    id integer DEFAULT nextval('attachments_id_seq'::regclass) NOT NULL,
    transactionid integer NOT NULL,
    parent integer DEFAULT 0 NOT NULL,
    messageid character varying(160),
    subject character varying(255),
    filename character varying(255),
    contenttype character varying(80),
    contentencoding character varying(80),
    content text,
    headers text,
    creator integer DEFAULT 0 NOT NULL,
    created timestamp without time zone
);


ALTER TABLE public.attachments OWNER TO rt;

--
-- Name: attributes_id_seq; Type: SEQUENCE; Schema: public; Owner: rt
--

CREATE SEQUENCE attributes_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;


ALTER TABLE public.attributes_id_seq OWNER TO rt;

--
-- Name: attributes_id_seq; Type: SEQUENCE SET; Schema: public; Owner: rt
--

SELECT pg_catalog.setval('attributes_id_seq', 1, false);


--
-- Name: attributes; Type: TABLE; Schema: public; Owner: rt; Tablespace: 
--

CREATE TABLE attributes (
    id integer DEFAULT nextval('attributes_id_seq'::regclass) NOT NULL,
    name character varying(255) NOT NULL,
    description character varying(255),
    content text,
    contenttype character varying(16),
    objecttype character varying(64),
    objectid integer,
    creator integer DEFAULT 0 NOT NULL,
    created timestamp without time zone,
    lastupdatedby integer DEFAULT 0 NOT NULL,
    lastupdated timestamp without time zone
);


ALTER TABLE public.attributes OWNER TO rt;

--
-- Name: cachedgroupmembers_id_seq; Type: SEQUENCE; Schema: public; Owner: rt
--

CREATE SEQUENCE cachedgroupmembers_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;


ALTER TABLE public.cachedgroupmembers_id_seq OWNER TO rt;

--
-- Name: cachedgroupmembers_id_seq; Type: SEQUENCE SET; Schema: public; Owner: rt
--

SELECT pg_catalog.setval('cachedgroupmembers_id_seq', 1, false);


--
-- Name: cachedgroupmembers; Type: TABLE; Schema: public; Owner: rt; Tablespace: 
--

CREATE TABLE cachedgroupmembers (
    id integer DEFAULT nextval('cachedgroupmembers_id_seq'::regclass) NOT NULL,
    groupid integer,
    memberid integer,
    via integer,
    immediateparentid integer,
    disabled integer DEFAULT 0 NOT NULL
);


ALTER TABLE public.cachedgroupmembers OWNER TO rt;

--
-- Name: customfields_id_seq; Type: SEQUENCE; Schema: public; Owner: rt
--

CREATE SEQUENCE customfields_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;


ALTER TABLE public.customfields_id_seq OWNER TO rt;

--
-- Name: customfields_id_seq; Type: SEQUENCE SET; Schema: public; Owner: rt
--

SELECT pg_catalog.setval('customfields_id_seq', 1, false);


--
-- Name: customfields; Type: TABLE; Schema: public; Owner: rt; Tablespace: 
--

CREATE TABLE customfields (
    id integer DEFAULT nextval('customfields_id_seq'::regclass) NOT NULL,
    name character varying(200),
    type character varying(200),
    maxvalues integer DEFAULT 0 NOT NULL,
    repeated integer DEFAULT 0 NOT NULL,
    pattern character varying(65536),
    lookuptype character varying(255) NOT NULL,
    description character varying(255),
    sortorder integer DEFAULT 0 NOT NULL,
    creator integer DEFAULT 0 NOT NULL,
    created timestamp without time zone,
    lastupdatedby integer DEFAULT 0 NOT NULL,
    lastupdated timestamp without time zone,
    disabled integer DEFAULT 0 NOT NULL
);


ALTER TABLE public.customfields OWNER TO rt;

--
-- Name: customfieldvalues_id_seq; Type: SEQUENCE; Schema: public; Owner: rt
--

CREATE SEQUENCE customfieldvalues_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;


ALTER TABLE public.customfieldvalues_id_seq OWNER TO rt;

--
-- Name: customfieldvalues_id_seq; Type: SEQUENCE SET; Schema: public; Owner: rt
--

SELECT pg_catalog.setval('customfieldvalues_id_seq', 1, false);


--
-- Name: customfieldvalues; Type: TABLE; Schema: public; Owner: rt; Tablespace: 
--

CREATE TABLE customfieldvalues (
    id integer DEFAULT nextval('customfieldvalues_id_seq'::regclass) NOT NULL,
    customfield integer NOT NULL,
    name character varying(200),
    description character varying(255),
    sortorder integer DEFAULT 0 NOT NULL,
    creator integer DEFAULT 0 NOT NULL,
    created timestamp without time zone,
    lastupdatedby integer DEFAULT 0 NOT NULL,
    lastupdated timestamp without time zone
);


ALTER TABLE public.customfieldvalues OWNER TO rt;

--
-- Name: groupmembers_id_seq; Type: SEQUENCE; Schema: public; Owner: rt
--

CREATE SEQUENCE groupmembers_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;


ALTER TABLE public.groupmembers_id_seq OWNER TO rt;

--
-- Name: groupmembers_id_seq; Type: SEQUENCE SET; Schema: public; Owner: rt
--

SELECT pg_catalog.setval('groupmembers_id_seq', 1, false);


--
-- Name: groupmembers; Type: TABLE; Schema: public; Owner: rt; Tablespace: 
--

CREATE TABLE groupmembers (
    id integer DEFAULT nextval('groupmembers_id_seq'::regclass) NOT NULL,
    groupid integer DEFAULT 0 NOT NULL,
    memberid integer DEFAULT 0 NOT NULL
);


ALTER TABLE public.groupmembers OWNER TO rt;

--
-- Name: groups_id_seq; Type: SEQUENCE; Schema: public; Owner: rt
--

CREATE SEQUENCE groups_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;


ALTER TABLE public.groups_id_seq OWNER TO rt;

--
-- Name: groups_id_seq; Type: SEQUENCE SET; Schema: public; Owner: rt
--

SELECT pg_catalog.setval('groups_id_seq', 1, false);


--
-- Name: groups; Type: TABLE; Schema: public; Owner: rt; Tablespace: 
--

CREATE TABLE groups (
    id integer DEFAULT nextval('groups_id_seq'::regclass) NOT NULL,
    name character varying(200),
    description character varying(255),
    domain character varying(64),
    type character varying(64),
    instance integer
);


ALTER TABLE public.groups OWNER TO rt;

--
-- Name: links_id_seq; Type: SEQUENCE; Schema: public; Owner: rt
--

CREATE SEQUENCE links_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;


ALTER TABLE public.links_id_seq OWNER TO rt;

--
-- Name: links_id_seq; Type: SEQUENCE SET; Schema: public; Owner: rt
--

SELECT pg_catalog.setval('links_id_seq', 1, false);


--
-- Name: links; Type: TABLE; Schema: public; Owner: rt; Tablespace: 
--

CREATE TABLE links (
    id integer DEFAULT nextval('links_id_seq'::regclass) NOT NULL,
    base character varying(240),
    target character varying(240),
    type character varying(20) NOT NULL,
    localtarget integer DEFAULT 0 NOT NULL,
    localbase integer DEFAULT 0 NOT NULL,
    lastupdatedby integer DEFAULT 0 NOT NULL,
    lastupdated timestamp without time zone,
    creator integer DEFAULT 0 NOT NULL,
    created timestamp without time zone
);


ALTER TABLE public.links OWNER TO rt;

--
-- Name: objectcustomfields_id_s; Type: SEQUENCE; Schema: public; Owner: rt
--

CREATE SEQUENCE objectcustomfields_id_s
    START WITH 1
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;


ALTER TABLE public.objectcustomfields_id_s OWNER TO rt;

--
-- Name: objectcustomfields_id_s; Type: SEQUENCE SET; Schema: public; Owner: rt
--

SELECT pg_catalog.setval('objectcustomfields_id_s', 1, false);


--
-- Name: objectcustomfields; Type: TABLE; Schema: public; Owner: rt; Tablespace: 
--

CREATE TABLE objectcustomfields (
    id integer DEFAULT nextval('objectcustomfields_id_s'::regclass) NOT NULL,
    customfield integer NOT NULL,
    objectid integer NOT NULL,
    sortorder integer DEFAULT 0 NOT NULL,
    creator integer DEFAULT 0 NOT NULL,
    created timestamp without time zone,
    lastupdatedby integer DEFAULT 0 NOT NULL,
    lastupdated timestamp without time zone
);


ALTER TABLE public.objectcustomfields OWNER TO rt;

--
-- Name: objectcustomfieldvalues_id_s; Type: SEQUENCE; Schema: public; Owner: rt
--

CREATE SEQUENCE objectcustomfieldvalues_id_s
    START WITH 1
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;


ALTER TABLE public.objectcustomfieldvalues_id_s OWNER TO rt;

--
-- Name: objectcustomfieldvalues_id_s; Type: SEQUENCE SET; Schema: public; Owner: rt
--

SELECT pg_catalog.setval('objectcustomfieldvalues_id_s', 1, false);


--
-- Name: objectcustomfieldvalues; Type: TABLE; Schema: public; Owner: rt; Tablespace: 
--

CREATE TABLE objectcustomfieldvalues (
    id integer DEFAULT nextval('objectcustomfieldvalues_id_s'::regclass) NOT NULL,
    customfield integer NOT NULL,
    objecttype character varying(255),
    objectid integer NOT NULL,
    sortorder integer DEFAULT 0 NOT NULL,
    content character varying(255),
    largecontent text,
    contenttype character varying(80),
    contentencoding character varying(80),
    creator integer DEFAULT 0 NOT NULL,
    created timestamp without time zone,
    lastupdatedby integer DEFAULT 0 NOT NULL,
    lastupdated timestamp without time zone,
    disabled integer DEFAULT 0 NOT NULL
);


ALTER TABLE public.objectcustomfieldvalues OWNER TO rt;

--
-- Name: principals_id_seq; Type: SEQUENCE; Schema: public; Owner: rt
--

CREATE SEQUENCE principals_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;


ALTER TABLE public.principals_id_seq OWNER TO rt;

--
-- Name: principals_id_seq; Type: SEQUENCE SET; Schema: public; Owner: rt
--

SELECT pg_catalog.setval('principals_id_seq', 1, false);


--
-- Name: principals; Type: TABLE; Schema: public; Owner: rt; Tablespace: 
--

CREATE TABLE principals (
    id integer DEFAULT nextval('principals_id_seq'::regclass) NOT NULL,
    principaltype character varying(16) NOT NULL,
    objectid integer,
    disabled integer DEFAULT 0 NOT NULL
);


ALTER TABLE public.principals OWNER TO rt;

--
-- Name: queues_id_seq; Type: SEQUENCE; Schema: public; Owner: rt
--

CREATE SEQUENCE queues_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;


ALTER TABLE public.queues_id_seq OWNER TO rt;

--
-- Name: queues_id_seq; Type: SEQUENCE SET; Schema: public; Owner: rt
--

SELECT pg_catalog.setval('queues_id_seq', 1, false);


--
-- Name: queues; Type: TABLE; Schema: public; Owner: rt; Tablespace: 
--

CREATE TABLE queues (
    id integer DEFAULT nextval('queues_id_seq'::regclass) NOT NULL,
    name character varying(200) NOT NULL,
    description character varying(255),
    correspondaddress character varying(120),
    commentaddress character varying(120),
    initialpriority integer DEFAULT 0 NOT NULL,
    finalpriority integer DEFAULT 0 NOT NULL,
    defaultduein integer DEFAULT 0 NOT NULL,
    creator integer DEFAULT 0 NOT NULL,
    created timestamp without time zone,
    lastupdatedby integer DEFAULT 0 NOT NULL,
    lastupdated timestamp without time zone,
    disabled integer DEFAULT 0 NOT NULL
);


ALTER TABLE public.queues OWNER TO rt;

--
-- Name: scripactions_id_seq; Type: SEQUENCE; Schema: public; Owner: rt
--

CREATE SEQUENCE scripactions_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;


ALTER TABLE public.scripactions_id_seq OWNER TO rt;

--
-- Name: scripactions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: rt
--

SELECT pg_catalog.setval('scripactions_id_seq', 1, false);


--
-- Name: scripactions; Type: TABLE; Schema: public; Owner: rt; Tablespace: 
--

CREATE TABLE scripactions (
    id integer DEFAULT nextval('scripactions_id_seq'::regclass) NOT NULL,
    name character varying(200),
    description character varying(255),
    execmodule character varying(60),
    argument character varying(255),
    creator integer DEFAULT 0 NOT NULL,
    created timestamp without time zone,
    lastupdatedby integer DEFAULT 0 NOT NULL,
    lastupdated timestamp without time zone
);


ALTER TABLE public.scripactions OWNER TO rt;

--
-- Name: scripconditions_id_seq; Type: SEQUENCE; Schema: public; Owner: rt
--

CREATE SEQUENCE scripconditions_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;


ALTER TABLE public.scripconditions_id_seq OWNER TO rt;

--
-- Name: scripconditions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: rt
--

SELECT pg_catalog.setval('scripconditions_id_seq', 1, false);


--
-- Name: scripconditions; Type: TABLE; Schema: public; Owner: rt; Tablespace: 
--

CREATE TABLE scripconditions (
    id integer DEFAULT nextval('scripconditions_id_seq'::regclass) NOT NULL,
    name character varying(200),
    description character varying(255),
    execmodule character varying(60),
    argument character varying(255),
    applicabletranstypes character varying(60),
    creator integer DEFAULT 0 NOT NULL,
    created timestamp without time zone,
    lastupdatedby integer DEFAULT 0 NOT NULL,
    lastupdated timestamp without time zone
);


ALTER TABLE public.scripconditions OWNER TO rt;

--
-- Name: scrips_id_seq; Type: SEQUENCE; Schema: public; Owner: rt
--

CREATE SEQUENCE scrips_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;


ALTER TABLE public.scrips_id_seq OWNER TO rt;

--
-- Name: scrips_id_seq; Type: SEQUENCE SET; Schema: public; Owner: rt
--

SELECT pg_catalog.setval('scrips_id_seq', 1, false);


--
-- Name: scrips; Type: TABLE; Schema: public; Owner: rt; Tablespace: 
--

CREATE TABLE scrips (
    id integer DEFAULT nextval('scrips_id_seq'::regclass) NOT NULL,
    description character varying(255),
    scripcondition integer DEFAULT 0 NOT NULL,
    scripaction integer DEFAULT 0 NOT NULL,
    conditionrules text,
    actionrules text,
    customisapplicablecode text,
    custompreparecode text,
    customcommitcode text,
    stage character varying(32),
    queue integer DEFAULT 0 NOT NULL,
    template integer DEFAULT 0 NOT NULL,
    creator integer DEFAULT 0 NOT NULL,
    created timestamp without time zone,
    lastupdatedby integer DEFAULT 0 NOT NULL,
    lastupdated timestamp without time zone
);


ALTER TABLE public.scrips OWNER TO rt;

--
-- Name: sessions; Type: TABLE; Schema: public; Owner: rt; Tablespace: 
--

CREATE TABLE sessions (
    id character(32) NOT NULL,
    a_session bytea,
    lastupdated timestamp without time zone DEFAULT now() NOT NULL
);


ALTER TABLE public.sessions OWNER TO rt;

--
-- Name: templates_id_seq; Type: SEQUENCE; Schema: public; Owner: rt
--

CREATE SEQUENCE templates_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;


ALTER TABLE public.templates_id_seq OWNER TO rt;

--
-- Name: templates_id_seq; Type: SEQUENCE SET; Schema: public; Owner: rt
--

SELECT pg_catalog.setval('templates_id_seq', 1, false);


--
-- Name: templates; Type: TABLE; Schema: public; Owner: rt; Tablespace: 
--

CREATE TABLE templates (
    id integer DEFAULT nextval('templates_id_seq'::regclass) NOT NULL,
    queue integer DEFAULT 0 NOT NULL,
    name character varying(200) NOT NULL,
    description character varying(255),
    type character varying(16),
    language character varying(16),
    translationof integer DEFAULT 0 NOT NULL,
    content text,
    lastupdated timestamp without time zone,
    lastupdatedby integer DEFAULT 0 NOT NULL,
    creator integer DEFAULT 0 NOT NULL,
    created timestamp without time zone
);


ALTER TABLE public.templates OWNER TO rt;

--
-- Name: tickets_id_seq; Type: SEQUENCE; Schema: public; Owner: rt
--

CREATE SEQUENCE tickets_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;


ALTER TABLE public.tickets_id_seq OWNER TO rt;

--
-- Name: tickets_id_seq; Type: SEQUENCE SET; Schema: public; Owner: rt
--

SELECT pg_catalog.setval('tickets_id_seq', 1, false);


--
-- Name: tickets; Type: TABLE; Schema: public; Owner: rt; Tablespace: 
--

CREATE TABLE tickets (
    id integer DEFAULT nextval('tickets_id_seq'::regclass) NOT NULL,
    effectiveid integer DEFAULT 0 NOT NULL,
    queue integer DEFAULT 0 NOT NULL,
    type character varying(16),
    issuestatement integer DEFAULT 0 NOT NULL,
    resolution integer DEFAULT 0 NOT NULL,
    owner integer DEFAULT 0 NOT NULL,
    subject character varying(200) DEFAULT '[no subject]'::character varying,
    initialpriority integer DEFAULT 0 NOT NULL,
    finalpriority integer DEFAULT 0 NOT NULL,
    priority integer DEFAULT 0 NOT NULL,
    timeestimated integer DEFAULT 0 NOT NULL,
    timeworked integer DEFAULT 0 NOT NULL,
    status character varying(10),
    timeleft integer DEFAULT 0 NOT NULL,
    told timestamp without time zone,
    starts timestamp without time zone,
    started timestamp without time zone,
    due timestamp without time zone,
    resolved timestamp without time zone,
    lastupdatedby integer DEFAULT 0 NOT NULL,
    lastupdated timestamp without time zone,
    creator integer DEFAULT 0 NOT NULL,
    created timestamp without time zone,
    disabled integer DEFAULT 0 NOT NULL
);


ALTER TABLE public.tickets OWNER TO rt;

--
-- Name: transactions_id_seq; Type: SEQUENCE; Schema: public; Owner: rt
--

CREATE SEQUENCE transactions_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;


ALTER TABLE public.transactions_id_seq OWNER TO rt;

--
-- Name: transactions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: rt
--

SELECT pg_catalog.setval('transactions_id_seq', 1, false);


--
-- Name: transactions; Type: TABLE; Schema: public; Owner: rt; Tablespace: 
--

CREATE TABLE transactions (
    id integer DEFAULT nextval('transactions_id_seq'::regclass) NOT NULL,
    objecttype character varying(255) NOT NULL,
    objectid integer DEFAULT 0 NOT NULL,
    timetaken integer DEFAULT 0 NOT NULL,
    type character varying(20),
    field character varying(40),
    oldvalue character varying(255),
    newvalue character varying(255),
    referencetype character varying(255),
    oldreference integer,
    newreference integer,
    data character varying(255),
    creator integer DEFAULT 0 NOT NULL,
    created timestamp without time zone
);


ALTER TABLE public.transactions OWNER TO rt;

--
-- Name: users_id_seq; Type: SEQUENCE; Schema: public; Owner: rt
--

CREATE SEQUENCE users_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;


ALTER TABLE public.users_id_seq OWNER TO rt;

--
-- Name: users_id_seq; Type: SEQUENCE SET; Schema: public; Owner: rt
--

SELECT pg_catalog.setval('users_id_seq', 1, false);


--
-- Name: users; Type: TABLE; Schema: public; Owner: rt; Tablespace: 
--

CREATE TABLE users (
    id integer DEFAULT nextval('users_id_seq'::regclass) NOT NULL,
    name character varying(200) NOT NULL,
    password character varying(40),
    comments text,
    signature text,
    emailaddress character varying(120),
    freeformcontactinfo text,
    organization character varying(200),
    realname character varying(120),
    nickname character varying(16),
    lang character varying(16),
    emailencoding character varying(16),
    webencoding character varying(16),
    externalcontactinfoid character varying(100),
    contactinfosystem character varying(30),
    externalauthid character varying(100),
    authsystem character varying(30),
    gecos character varying(16),
    homephone character varying(30),
    workphone character varying(30),
    mobilephone character varying(30),
    pagerphone character varying(30),
    address1 character varying(200),
    address2 character varying(200),
    city character varying(100),
    state character varying(100),
    zip character varying(16),
    country character varying(50),
    timezone character varying(50),
    pgpkey text,
    creator integer DEFAULT 0 NOT NULL,
    created timestamp without time zone,
    lastupdatedby integer DEFAULT 0 NOT NULL,
    lastupdated timestamp without time zone
);


ALTER TABLE public.users OWNER TO rt;

--
-- Data for Name: acl; Type: TABLE DATA; Schema: public; Owner: rt
--

COPY acl (id, principaltype, principalid, rightname, objecttype, objectid, delegatedby, delegatedfrom) FROM stdin;
\.


--
-- Data for Name: attachments; Type: TABLE DATA; Schema: public; Owner: rt
--

COPY attachments (id, transactionid, parent, messageid, subject, filename, contenttype, contentencoding, content, headers, creator, created) FROM stdin;
\.


--
-- Data for Name: attributes; Type: TABLE DATA; Schema: public; Owner: rt
--

COPY attributes (id, name, description, content, contenttype, objecttype, objectid, creator, created, lastupdatedby, lastupdated) FROM stdin;
\.


--
-- Data for Name: cachedgroupmembers; Type: TABLE DATA; Schema: public; Owner: rt
--

COPY cachedgroupmembers (id, groupid, memberid, via, immediateparentid, disabled) FROM stdin;
\.


--
-- Data for Name: customfields; Type: TABLE DATA; Schema: public; Owner: rt
--

COPY customfields (id, name, type, maxvalues, repeated, pattern, lookuptype, description, sortorder, creator, created, lastupdatedby, lastupdated, disabled) FROM stdin;
\.


--
-- Data for Name: customfieldvalues; Type: TABLE DATA; Schema: public; Owner: rt
--

COPY customfieldvalues (id, customfield, name, description, sortorder, creator, created, lastupdatedby, lastupdated) FROM stdin;
\.


--
-- Data for Name: groupmembers; Type: TABLE DATA; Schema: public; Owner: rt
--

COPY groupmembers (id, groupid, memberid) FROM stdin;
\.


--
-- Data for Name: groups; Type: TABLE DATA; Schema: public; Owner: rt
--

COPY groups (id, name, description, domain, type, instance) FROM stdin;
\.


--
-- Data for Name: links; Type: TABLE DATA; Schema: public; Owner: rt
--

COPY links (id, base, target, type, localtarget, localbase, lastupdatedby, lastupdated, creator, created) FROM stdin;
\.


--
-- Data for Name: objectcustomfields; Type: TABLE DATA; Schema: public; Owner: rt
--

COPY objectcustomfields (id, customfield, objectid, sortorder, creator, created, lastupdatedby, lastupdated) FROM stdin;
\.


--
-- Data for Name: objectcustomfieldvalues; Type: TABLE DATA; Schema: public; Owner: rt
--

COPY objectcustomfieldvalues (id, customfield, objecttype, objectid, sortorder, content, largecontent, contenttype, contentencoding, creator, created, lastupdatedby, lastupdated, disabled) FROM stdin;
\.


--
-- Data for Name: principals; Type: TABLE DATA; Schema: public; Owner: rt
--

COPY principals (id, principaltype, objectid, disabled) FROM stdin;
\.


--
-- Data for Name: queues; Type: TABLE DATA; Schema: public; Owner: rt
--

COPY queues (id, name, description, correspondaddress, commentaddress, initialpriority, finalpriority, defaultduein, creator, created, lastupdatedby, lastupdated, disabled) FROM stdin;
\.


--
-- Data for Name: scripactions; Type: TABLE DATA; Schema: public; Owner: rt
--

COPY scripactions (id, name, description, execmodule, argument, creator, created, lastupdatedby, lastupdated) FROM stdin;
\.


--
-- Data for Name: scripconditions; Type: TABLE DATA; Schema: public; Owner: rt
--

COPY scripconditions (id, name, description, execmodule, argument, applicabletranstypes, creator, created, lastupdatedby, lastupdated) FROM stdin;
\.


--
-- Data for Name: scrips; Type: TABLE DATA; Schema: public; Owner: rt
--

COPY scrips (id, description, scripcondition, scripaction, conditionrules, actionrules, customisapplicablecode, custompreparecode, customcommitcode, stage, queue, template, creator, created, lastupdatedby, lastupdated) FROM stdin;
\.


--
-- Data for Name: sessions; Type: TABLE DATA; Schema: public; Owner: rt
--

COPY sessions (id, a_session, lastupdated) FROM stdin;
\.


--
-- Data for Name: templates; Type: TABLE DATA; Schema: public; Owner: rt
--

COPY templates (id, queue, name, description, type, language, translationof, content, lastupdated, lastupdatedby, creator, created) FROM stdin;
\.


--
-- Data for Name: tickets; Type: TABLE DATA; Schema: public; Owner: rt
--

COPY tickets (id, effectiveid, queue, type, issuestatement, resolution, owner, subject, initialpriority, finalpriority, priority, timeestimated, timeworked, status, timeleft, told, starts, started, due, resolved, lastupdatedby, lastupdated, creator, created, disabled) FROM stdin;
\.


--
-- Data for Name: transactions; Type: TABLE DATA; Schema: public; Owner: rt
--

COPY transactions (id, objecttype, objectid, timetaken, type, field, oldvalue, newvalue, referencetype, oldreference, newreference, data, creator, created) FROM stdin;
\.


--
-- Data for Name: users; Type: TABLE DATA; Schema: public; Owner: rt
--

COPY users (id, name, password, comments, signature, emailaddress, freeformcontactinfo, organization, realname, nickname, lang, emailencoding, webencoding, externalcontactinfoid, contactinfosystem, externalauthid, authsystem, gecos, homephone, workphone, mobilephone, pagerphone, address1, address2, city, state, zip, country, timezone, pgpkey, creator, created, lastupdatedby, lastupdated) FROM stdin;
\.


--
-- Name: acl_pkey; Type: CONSTRAINT; Schema: public; Owner: rt; Tablespace: 
--

ALTER TABLE ONLY acl
    ADD CONSTRAINT acl_pkey PRIMARY KEY (id);


--
-- Name: attachments_pkey; Type: CONSTRAINT; Schema: public; Owner: rt; Tablespace: 
--

ALTER TABLE ONLY attachments
    ADD CONSTRAINT attachments_pkey PRIMARY KEY (id);


--
-- Name: attributes_pkey; Type: CONSTRAINT; Schema: public; Owner: rt; Tablespace: 
--

ALTER TABLE ONLY attributes
    ADD CONSTRAINT attributes_pkey PRIMARY KEY (id);


--
-- Name: cachedgroupmembers_pkey; Type: CONSTRAINT; Schema: public; Owner: rt; Tablespace: 
--

ALTER TABLE ONLY cachedgroupmembers
    ADD CONSTRAINT cachedgroupmembers_pkey PRIMARY KEY (id);


--
-- Name: customfields_pkey; Type: CONSTRAINT; Schema: public; Owner: rt; Tablespace: 
--

ALTER TABLE ONLY customfields
    ADD CONSTRAINT customfields_pkey PRIMARY KEY (id);


--
-- Name: customfieldvalues_pkey; Type: CONSTRAINT; Schema: public; Owner: rt; Tablespace: 
--

ALTER TABLE ONLY customfieldvalues
    ADD CONSTRAINT customfieldvalues_pkey PRIMARY KEY (id);


--
-- Name: groupmembers_pkey; Type: CONSTRAINT; Schema: public; Owner: rt; Tablespace: 
--

ALTER TABLE ONLY groupmembers
    ADD CONSTRAINT groupmembers_pkey PRIMARY KEY (id);


--
-- Name: groups_pkey; Type: CONSTRAINT; Schema: public; Owner: rt; Tablespace: 
--

ALTER TABLE ONLY groups
    ADD CONSTRAINT groups_pkey PRIMARY KEY (id);


--
-- Name: links_pkey; Type: CONSTRAINT; Schema: public; Owner: rt; Tablespace: 
--

ALTER TABLE ONLY links
    ADD CONSTRAINT links_pkey PRIMARY KEY (id);


--
-- Name: objectcustomfields_pkey; Type: CONSTRAINT; Schema: public; Owner: rt; Tablespace: 
--

ALTER TABLE ONLY objectcustomfields
    ADD CONSTRAINT objectcustomfields_pkey PRIMARY KEY (id);


--
-- Name: objectcustomfieldvalues_pkey; Type: CONSTRAINT; Schema: public; Owner: rt; Tablespace: 
--

ALTER TABLE ONLY objectcustomfieldvalues
    ADD CONSTRAINT objectcustomfieldvalues_pkey PRIMARY KEY (id);


--
-- Name: principals_pkey; Type: CONSTRAINT; Schema: public; Owner: rt; Tablespace: 
--

ALTER TABLE ONLY principals
    ADD CONSTRAINT principals_pkey PRIMARY KEY (id);


--
-- Name: queues_pkey; Type: CONSTRAINT; Schema: public; Owner: rt; Tablespace: 
--

ALTER TABLE ONLY queues
    ADD CONSTRAINT queues_pkey PRIMARY KEY (id);


--
-- Name: scripactions_pkey; Type: CONSTRAINT; Schema: public; Owner: rt; Tablespace: 
--

ALTER TABLE ONLY scripactions
    ADD CONSTRAINT scripactions_pkey PRIMARY KEY (id);


--
-- Name: scripconditions_pkey; Type: CONSTRAINT; Schema: public; Owner: rt; Tablespace: 
--

ALTER TABLE ONLY scripconditions
    ADD CONSTRAINT scripconditions_pkey PRIMARY KEY (id);


--
-- Name: scrips_pkey; Type: CONSTRAINT; Schema: public; Owner: rt; Tablespace: 
--

ALTER TABLE ONLY scrips
    ADD CONSTRAINT scrips_pkey PRIMARY KEY (id);


--
-- Name: sessions_pkey; Type: CONSTRAINT; Schema: public; Owner: rt; Tablespace: 
--

ALTER TABLE ONLY sessions
    ADD CONSTRAINT sessions_pkey PRIMARY KEY (id);


--
-- Name: templates_pkey; Type: CONSTRAINT; Schema: public; Owner: rt; Tablespace: 
--

ALTER TABLE ONLY templates
    ADD CONSTRAINT templates_pkey PRIMARY KEY (id);


--
-- Name: tickets_pkey; Type: CONSTRAINT; Schema: public; Owner: rt; Tablespace: 
--

ALTER TABLE ONLY tickets
    ADD CONSTRAINT tickets_pkey PRIMARY KEY (id);


--
-- Name: transactions_pkey; Type: CONSTRAINT; Schema: public; Owner: rt; Tablespace: 
--

ALTER TABLE ONLY transactions
    ADD CONSTRAINT transactions_pkey PRIMARY KEY (id);


--
-- Name: users_pkey; Type: CONSTRAINT; Schema: public; Owner: rt; Tablespace: 
--

ALTER TABLE ONLY users
    ADD CONSTRAINT users_pkey PRIMARY KEY (id);


--
-- Name: acl1; Type: INDEX; Schema: public; Owner: rt; Tablespace: 
--

CREATE INDEX acl1 ON acl USING btree (rightname, objecttype, objectid, principaltype, principalid);


--
-- Name: attachments1; Type: INDEX; Schema: public; Owner: rt; Tablespace: 
--

CREATE INDEX attachments1 ON attachments USING btree (parent);


--
-- Name: attachments2; Type: INDEX; Schema: public; Owner: rt; Tablespace: 
--

CREATE INDEX attachments2 ON attachments USING btree (transactionid);


--
-- Name: attachments3; Type: INDEX; Schema: public; Owner: rt; Tablespace: 
--

CREATE INDEX attachments3 ON attachments USING btree (parent, transactionid);


--
-- Name: attributes1; Type: INDEX; Schema: public; Owner: rt; Tablespace: 
--

CREATE INDEX attributes1 ON attributes USING btree (name);


--
-- Name: attributes2; Type: INDEX; Schema: public; Owner: rt; Tablespace: 
--

CREATE INDEX attributes2 ON attributes USING btree (objecttype, objectid);


--
-- Name: cachedgroupmembers2; Type: INDEX; Schema: public; Owner: rt; Tablespace: 
--

CREATE INDEX cachedgroupmembers2 ON cachedgroupmembers USING btree (memberid);


--
-- Name: cachedgroupmembers3; Type: INDEX; Schema: public; Owner: rt; Tablespace: 
--

CREATE INDEX cachedgroupmembers3 ON cachedgroupmembers USING btree (groupid);


--
-- Name: customfieldvalues1; Type: INDEX; Schema: public; Owner: rt; Tablespace: 
--

CREATE INDEX customfieldvalues1 ON customfieldvalues USING btree (customfield);


--
-- Name: disgroumem; Type: INDEX; Schema: public; Owner: rt; Tablespace: 
--

CREATE INDEX disgroumem ON cachedgroupmembers USING btree (groupid, memberid, disabled);


--
-- Name: groupmembers1; Type: INDEX; Schema: public; Owner: rt; Tablespace: 
--

CREATE UNIQUE INDEX groupmembers1 ON groupmembers USING btree (groupid, memberid);


--
-- Name: groups1; Type: INDEX; Schema: public; Owner: rt; Tablespace: 
--

CREATE UNIQUE INDEX groups1 ON groups USING btree (domain, instance, type, id, name);


--
-- Name: groups2; Type: INDEX; Schema: public; Owner: rt; Tablespace: 
--

CREATE INDEX groups2 ON groups USING btree (type, instance, domain);


--
-- Name: links1; Type: INDEX; Schema: public; Owner: rt; Tablespace: 
--

CREATE UNIQUE INDEX links1 ON links USING btree (base, target, type);


--
-- Name: links4; Type: INDEX; Schema: public; Owner: rt; Tablespace: 
--

CREATE INDEX links4 ON links USING btree (type, localbase);


--
-- Name: objectcustomfieldvalues1; Type: INDEX; Schema: public; Owner: rt; Tablespace: 
--

CREATE INDEX objectcustomfieldvalues1 ON objectcustomfieldvalues USING btree (customfield, objecttype, objectid, content);


--
-- Name: objectcustomfieldvalues2; Type: INDEX; Schema: public; Owner: rt; Tablespace: 
--

CREATE INDEX objectcustomfieldvalues2 ON objectcustomfieldvalues USING btree (customfield, objecttype, objectid);


--
-- Name: principals2; Type: INDEX; Schema: public; Owner: rt; Tablespace: 
--

CREATE INDEX principals2 ON principals USING btree (objectid);


--
-- Name: queues1; Type: INDEX; Schema: public; Owner: rt; Tablespace: 
--

CREATE UNIQUE INDEX queues1 ON queues USING btree (name);


--
-- Name: tickets1; Type: INDEX; Schema: public; Owner: rt; Tablespace: 
--

CREATE INDEX tickets1 ON tickets USING btree (queue, status);


--
-- Name: tickets2; Type: INDEX; Schema: public; Owner: rt; Tablespace: 
--

CREATE INDEX tickets2 ON tickets USING btree (owner);


--
-- Name: tickets3; Type: INDEX; Schema: public; Owner: rt; Tablespace: 
--

CREATE INDEX tickets3 ON tickets USING btree (effectiveid);


--
-- Name: tickets4; Type: INDEX; Schema: public; Owner: rt; Tablespace: 
--

CREATE INDEX tickets4 ON tickets USING btree (id, status);


--
-- Name: tickets5; Type: INDEX; Schema: public; Owner: rt; Tablespace: 
--

CREATE INDEX tickets5 ON tickets USING btree (id, effectiveid);


--
-- Name: transactions1; Type: INDEX; Schema: public; Owner: rt; Tablespace: 
--

CREATE INDEX transactions1 ON transactions USING btree (objecttype, objectid);


--
-- Name: users1; Type: INDEX; Schema: public; Owner: rt; Tablespace: 
--

CREATE UNIQUE INDEX users1 ON users USING btree (name);


--
-- Name: users3; Type: INDEX; Schema: public; Owner: rt; Tablespace: 
--

CREATE INDEX users3 ON users USING btree (id, emailaddress);


--
-- Name: users4; Type: INDEX; Schema: public; Owner: rt; Tablespace: 
--

CREATE INDEX users4 ON users USING btree (emailaddress);


--
-- Name: public; Type: ACL; Schema: -; Owner: postgres
--

REVOKE ALL ON SCHEMA public FROM PUBLIC;
REVOKE ALL ON SCHEMA public FROM postgres;
GRANT ALL ON SCHEMA public TO postgres;
GRANT ALL ON SCHEMA public TO PUBLIC;


--
-- PostgreSQL database dump complete
--

