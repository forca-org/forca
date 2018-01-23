create temporary table pgdump_restore_path(p text);
--
-- NOTE:
--
-- File paths need to be edited. Search for $$PATH$$ and
-- replace it with the path to the directory containing
-- the extracted data files.
--
-- Edit the following to match the path where the
-- tar archive has been extracted.
--
insert into pgdump_restore_path values('/tmp');

--
-- PostgreSQL database dump
--

SET client_encoding = 'UTF8';
SET check_function_bodies = false;
SET client_min_messages = warning;

SET search_path = public, pg_catalog;

ALTER TABLE ONLY public.profs_discs DROP CONSTRAINT profs_discs_professor_id_fkey;
ALTER TABLE ONLY public.profs_discs DROP CONSTRAINT profs_discs_disciplina_id_fkey;
ALTER TABLE ONLY public.karmas DROP CONSTRAINT karmas_avaliacao_id_fkey;
ALTER TABLE ONLY public.karmas DROP CONSTRAINT karmas_aluno_id_fkey;
ALTER TABLE ONLY public.favoritos DROP CONSTRAINT favoritos_avaliacao_id_fkey;
ALTER TABLE ONLY public.avaliacoes DROP CONSTRAINT avaliacoes_professor_id_fkey;
ALTER TABLE ONLY public.avaliacoes DROP CONSTRAINT avaliacoes_disciplina_id_fkey;
ALTER TABLE ONLY public.avaliacoes DROP CONSTRAINT avaliacoes_aluno_id_fkey;
ALTER TABLE ONLY public.auth_permission DROP CONSTRAINT auth_permission_group_id_fkey;
ALTER TABLE ONLY public.auth_membership DROP CONSTRAINT auth_membership_user_id_fkey;
ALTER TABLE ONLY public.auth_membership DROP CONSTRAINT auth_membership_group_id_fkey;
ALTER TABLE ONLY public.auth_event DROP CONSTRAINT auth_event_user_id_fkey;
ALTER TABLE ONLY public.auth_cas DROP CONSTRAINT auth_cas_user_id_fkey;
ALTER TABLE ONLY public.profs_discs DROP CONSTRAINT profs_discs_pkey;
ALTER TABLE ONLY public.professores DROP CONSTRAINT professores_pkey;
ALTER TABLE ONLY public.professores DROP CONSTRAINT professores_email_key;
ALTER TABLE ONLY public.karmas DROP CONSTRAINT karmas_pkey;
ALTER TABLE ONLY public.favoritos DROP CONSTRAINT favoritos_pkey;
ALTER TABLE ONLY public.disciplinas DROP CONSTRAINT disciplinas_pkey;
ALTER TABLE ONLY public.disciplinas DROP CONSTRAINT disciplinas_code_key;
ALTER TABLE ONLY public.avaliacoes DROP CONSTRAINT avaliacoes_pkey;
ALTER TABLE ONLY public.auth_user DROP CONSTRAINT auth_user_pkey;
ALTER TABLE ONLY public.auth_user DROP CONSTRAINT auth_user_email_key;
ALTER TABLE ONLY public.auth_permission DROP CONSTRAINT auth_permission_pkey;
ALTER TABLE ONLY public.auth_membership DROP CONSTRAINT auth_membership_pkey;
ALTER TABLE ONLY public.auth_group DROP CONSTRAINT auth_group_pkey;
ALTER TABLE ONLY public.auth_event DROP CONSTRAINT auth_event_pkey;
ALTER TABLE ONLY public.auth_cas DROP CONSTRAINT auth_cas_pkey;
ALTER TABLE ONLY public.alunos DROP CONSTRAINT alunos_pkey;
ALTER TABLE ONLY public.alunos DROP CONSTRAINT alunos_email_key;
DROP TABLE public.profs_discs;
DROP TABLE public.professores;
DROP SEQUENCE public.phpbb_words_seq;
DROP SEQUENCE public.phpbb_warnings_seq;
DROP SEQUENCE public.phpbb_users_seq;
DROP SEQUENCE public.phpbb_topics_seq;
DROP SEQUENCE public.phpbb_styles_theme_seq;
DROP SEQUENCE public.phpbb_styles_template_seq;
DROP SEQUENCE public.phpbb_styles_seq;
DROP SEQUENCE public.phpbb_styles_imageset_seq;
DROP SEQUENCE public.phpbb_styles_imageset_data_seq;
DROP SEQUENCE public.phpbb_smilies_seq;
DROP SEQUENCE public.phpbb_sitelist_seq;
DROP SEQUENCE public.phpbb_search_wordlist_seq;
DROP SEQUENCE public.phpbb_reports_seq;
DROP SEQUENCE public.phpbb_reports_reasons_seq;
DROP SEQUENCE public.phpbb_ranks_seq;
DROP SEQUENCE public.phpbb_profile_fields_seq;
DROP SEQUENCE public.phpbb_privmsgs_seq;
DROP SEQUENCE public.phpbb_privmsgs_rules_seq;
DROP SEQUENCE public.phpbb_privmsgs_folder_seq;
DROP SEQUENCE public.phpbb_posts_seq;
DROP SEQUENCE public.phpbb_modules_seq;
DROP SEQUENCE public.phpbb_log_seq;
DROP SEQUENCE public.phpbb_lang_seq;
DROP SEQUENCE public.phpbb_icons_seq;
DROP SEQUENCE public.phpbb_groups_seq;
DROP SEQUENCE public.phpbb_forums_seq;
DROP SEQUENCE public.phpbb_extensions_seq;
DROP SEQUENCE public.phpbb_extension_groups_seq;
DROP SEQUENCE public.phpbb_drafts_seq;
DROP SEQUENCE public.phpbb_disallow_seq;
DROP SEQUENCE public.phpbb_bots_seq;
DROP SEQUENCE public.phpbb_banlist_seq;
DROP SEQUENCE public.phpbb_attachments_seq;
DROP SEQUENCE public.phpbb_acl_roles_seq;
DROP SEQUENCE public.phpbb_acl_options_seq;
DROP TABLE public.karmas;
DROP TABLE public.favoritos;
DROP TABLE public.disciplinas;
DROP TABLE public.avaliacoes;
DROP TABLE public.auth_user;
DROP TABLE public.auth_permission;
DROP TABLE public.auth_membership;
DROP TABLE public.auth_group;
DROP TABLE public.auth_event;
DROP TABLE public.auth_cas;
DROP TABLE public.alunos;
DROP OPERATOR public.>= (varchar_ci, varchar_ci);
DROP OPERATOR public.> (varchar_ci, varchar_ci);
DROP OPERATOR public.= (varchar_ci, varchar_ci);
DROP OPERATOR public.<> (varchar_ci, varchar_ci);
DROP OPERATOR public.<= (varchar_ci, varchar_ci);
DROP OPERATOR public.< (varchar_ci, varchar_ci);
DROP FUNCTION public._varchar_ci_not_equal(varchar_ci, varchar_ci);
DROP FUNCTION public._varchar_ci_less_than(varchar_ci, varchar_ci);
DROP FUNCTION public._varchar_ci_less_equal(varchar_ci, varchar_ci);
DROP FUNCTION public._varchar_ci_greater_than(varchar_ci, varchar_ci);
DROP FUNCTION public._varchar_ci_greater_equals(varchar_ci, varchar_ci);
DROP FUNCTION public._varchar_ci_equal(varchar_ci, varchar_ci);
DROP DOMAIN public.varchar_ci;
DROP SCHEMA public;
--
-- Name: public; Type: SCHEMA; Schema: -; Owner: postgres
--

CREATE SCHEMA public;


ALTER SCHEMA public OWNER TO postgres;

--
-- Name: SCHEMA public; Type: COMMENT; Schema: -; Owner: postgres
--

COMMENT ON SCHEMA public IS 'Standard public schema';


--
-- Name: varchar_ci; Type: DOMAIN; Schema: public; Owner: dacompi_forum3
--

CREATE DOMAIN varchar_ci AS character varying(255) NOT NULL DEFAULT ''::character varying;


ALTER DOMAIN public.varchar_ci OWNER TO dacompi_forum3;

--
-- Name: _varchar_ci_equal(varchar_ci, varchar_ci); Type: FUNCTION; Schema: public; Owner: dacompi_forum3
--

CREATE FUNCTION _varchar_ci_equal(varchar_ci, varchar_ci) RETURNS boolean
    AS $_$SELECT LOWER($1) = LOWER($2)$_$
    LANGUAGE sql STRICT;


ALTER FUNCTION public._varchar_ci_equal(varchar_ci, varchar_ci) OWNER TO dacompi_forum3;

--
-- Name: _varchar_ci_greater_equals(varchar_ci, varchar_ci); Type: FUNCTION; Schema: public; Owner: dacompi_forum3
--

CREATE FUNCTION _varchar_ci_greater_equals(varchar_ci, varchar_ci) RETURNS boolean
    AS $_$SELECT LOWER($1) >= LOWER($2)$_$
    LANGUAGE sql STRICT;


ALTER FUNCTION public._varchar_ci_greater_equals(varchar_ci, varchar_ci) OWNER TO dacompi_forum3;

--
-- Name: _varchar_ci_greater_than(varchar_ci, varchar_ci); Type: FUNCTION; Schema: public; Owner: dacompi_forum3
--

CREATE FUNCTION _varchar_ci_greater_than(varchar_ci, varchar_ci) RETURNS boolean
    AS $_$SELECT LOWER($1) > LOWER($2)$_$
    LANGUAGE sql STRICT;


ALTER FUNCTION public._varchar_ci_greater_than(varchar_ci, varchar_ci) OWNER TO dacompi_forum3;

--
-- Name: _varchar_ci_less_equal(varchar_ci, varchar_ci); Type: FUNCTION; Schema: public; Owner: dacompi_forum3
--

CREATE FUNCTION _varchar_ci_less_equal(varchar_ci, varchar_ci) RETURNS boolean
    AS $_$SELECT LOWER($1) <= LOWER($2)$_$
    LANGUAGE sql STRICT;


ALTER FUNCTION public._varchar_ci_less_equal(varchar_ci, varchar_ci) OWNER TO dacompi_forum3;

--
-- Name: _varchar_ci_less_than(varchar_ci, varchar_ci); Type: FUNCTION; Schema: public; Owner: dacompi_forum3
--

CREATE FUNCTION _varchar_ci_less_than(varchar_ci, varchar_ci) RETURNS boolean
    AS $_$SELECT LOWER($1) < LOWER($2)$_$
    LANGUAGE sql STRICT;


ALTER FUNCTION public._varchar_ci_less_than(varchar_ci, varchar_ci) OWNER TO dacompi_forum3;

--
-- Name: _varchar_ci_not_equal(varchar_ci, varchar_ci); Type: FUNCTION; Schema: public; Owner: dacompi_forum3
--

CREATE FUNCTION _varchar_ci_not_equal(varchar_ci, varchar_ci) RETURNS boolean
    AS $_$SELECT LOWER($1) != LOWER($2)$_$
    LANGUAGE sql STRICT;


ALTER FUNCTION public._varchar_ci_not_equal(varchar_ci, varchar_ci) OWNER TO dacompi_forum3;

--
-- Name: <; Type: OPERATOR; Schema: public; Owner: dacompi_forum3
--

CREATE OPERATOR < (
    PROCEDURE = _varchar_ci_less_than,
    LEFTARG = varchar_ci,
    RIGHTARG = varchar_ci,
    COMMUTATOR = >,
    NEGATOR = >=,
    RESTRICT = scalarltsel,
    JOIN = scalarltjoinsel
);


ALTER OPERATOR public.< (varchar_ci, varchar_ci) OWNER TO dacompi_forum3;

--
-- Name: <=; Type: OPERATOR; Schema: public; Owner: dacompi_forum3
--

CREATE OPERATOR <= (
    PROCEDURE = _varchar_ci_less_equal,
    LEFTARG = varchar_ci,
    RIGHTARG = varchar_ci,
    COMMUTATOR = >=,
    NEGATOR = >,
    RESTRICT = scalarltsel,
    JOIN = scalarltjoinsel
);


ALTER OPERATOR public.<= (varchar_ci, varchar_ci) OWNER TO dacompi_forum3;

--
-- Name: <>; Type: OPERATOR; Schema: public; Owner: dacompi_forum3
--

CREATE OPERATOR <> (
    PROCEDURE = _varchar_ci_not_equal,
    LEFTARG = varchar_ci,
    RIGHTARG = varchar_ci,
    COMMUTATOR = <>,
    NEGATOR = =,
    RESTRICT = neqsel,
    JOIN = neqjoinsel
);


ALTER OPERATOR public.<> (varchar_ci, varchar_ci) OWNER TO dacompi_forum3;

--
-- Name: =; Type: OPERATOR; Schema: public; Owner: dacompi_forum3
--

CREATE OPERATOR = (
    PROCEDURE = _varchar_ci_equal,
    LEFTARG = varchar_ci,
    RIGHTARG = varchar_ci,
    COMMUTATOR = =,
    NEGATOR = <>,
    HASHES,
    RESTRICT = eqsel,
    JOIN = eqjoinsel,
    SORT1 = <,
    SORT2 = <,
    LTCMP = <,
    GTCMP = >
);


ALTER OPERATOR public.= (varchar_ci, varchar_ci) OWNER TO dacompi_forum3;

--
-- Name: >; Type: OPERATOR; Schema: public; Owner: dacompi_forum3
--

CREATE OPERATOR > (
    PROCEDURE = _varchar_ci_greater_than,
    LEFTARG = varchar_ci,
    RIGHTARG = varchar_ci,
    COMMUTATOR = <,
    NEGATOR = <=,
    RESTRICT = scalargtsel,
    JOIN = scalargtjoinsel
);


ALTER OPERATOR public.> (varchar_ci, varchar_ci) OWNER TO dacompi_forum3;

--
-- Name: >=; Type: OPERATOR; Schema: public; Owner: dacompi_forum3
--

CREATE OPERATOR >= (
    PROCEDURE = _varchar_ci_greater_equals,
    LEFTARG = varchar_ci,
    RIGHTARG = varchar_ci,
    COMMUTATOR = <=,
    NEGATOR = <,
    RESTRICT = scalargtsel,
    JOIN = scalargtjoinsel
);


ALTER OPERATOR public.>= (varchar_ci, varchar_ci) OWNER TO dacompi_forum3;

SET default_tablespace = '';

SET default_with_oids = false;

--
-- Name: alunos; Type: TABLE; Schema: public; Owner: dacompi_forum3; Tablespace: 
--

CREATE TABLE alunos (
    id serial NOT NULL,
    user_id integer,
    email character varying(64) NOT NULL,
    full_name character varying(128) NOT NULL,
    short_name character varying(32),
    grade character varying(1)
);


ALTER TABLE public.alunos OWNER TO dacompi_forum3;

--
-- Name: alunos_id_seq; Type: SEQUENCE SET; Schema: public; Owner: dacompi_forum3
--

SELECT pg_catalog.setval(pg_catalog.pg_get_serial_sequence('alunos', 'id'), 407, true);


--
-- Name: auth_cas; Type: TABLE; Schema: public; Owner: dacompi_forum3; Tablespace: 
--

CREATE TABLE auth_cas (
    id serial NOT NULL,
    user_id integer,
    created_on timestamp without time zone,
    url character varying(512),
    uuid character varying(512)
);


ALTER TABLE public.auth_cas OWNER TO dacompi_forum3;

--
-- Name: auth_cas_id_seq; Type: SEQUENCE SET; Schema: public; Owner: dacompi_forum3
--

SELECT pg_catalog.setval(pg_catalog.pg_get_serial_sequence('auth_cas', 'id'), 1, false);


--
-- Name: auth_event; Type: TABLE; Schema: public; Owner: dacompi_forum3; Tablespace: 
--

CREATE TABLE auth_event (
    id serial NOT NULL,
    time_stamp timestamp without time zone,
    client_ip character varying(512),
    user_id integer,
    origin character varying(512),
    description text
);


ALTER TABLE public.auth_event OWNER TO dacompi_forum3;

--
-- Name: auth_event_id_seq; Type: SEQUENCE SET; Schema: public; Owner: dacompi_forum3
--

SELECT pg_catalog.setval(pg_catalog.pg_get_serial_sequence('auth_event', 'id'), 733, true);


--
-- Name: auth_group; Type: TABLE; Schema: public; Owner: dacompi_forum3; Tablespace: 
--

CREATE TABLE auth_group (
    id serial NOT NULL,
    "role" character varying(512),
    description text
);


ALTER TABLE public.auth_group OWNER TO dacompi_forum3;

--
-- Name: auth_group_id_seq; Type: SEQUENCE SET; Schema: public; Owner: dacompi_forum3
--

SELECT pg_catalog.setval(pg_catalog.pg_get_serial_sequence('auth_group', 'id'), 3, true);


--
-- Name: auth_membership; Type: TABLE; Schema: public; Owner: dacompi_forum3; Tablespace: 
--

CREATE TABLE auth_membership (
    id serial NOT NULL,
    user_id integer,
    group_id integer
);


ALTER TABLE public.auth_membership OWNER TO dacompi_forum3;

--
-- Name: auth_membership_id_seq; Type: SEQUENCE SET; Schema: public; Owner: dacompi_forum3
--

SELECT pg_catalog.setval(pg_catalog.pg_get_serial_sequence('auth_membership', 'id'), 1236, true);


--
-- Name: auth_permission; Type: TABLE; Schema: public; Owner: dacompi_forum3; Tablespace: 
--

CREATE TABLE auth_permission (
    id serial NOT NULL,
    group_id integer,
    name character varying(512),
    table_name character varying(512),
    record_id integer
);


ALTER TABLE public.auth_permission OWNER TO dacompi_forum3;

--
-- Name: auth_permission_id_seq; Type: SEQUENCE SET; Schema: public; Owner: dacompi_forum3
--

SELECT pg_catalog.setval(pg_catalog.pg_get_serial_sequence('auth_permission', 'id'), 1, false);


--
-- Name: auth_user; Type: TABLE; Schema: public; Owner: dacompi_forum3; Tablespace: 
--

CREATE TABLE auth_user (
    id serial NOT NULL,
    first_name character varying(128),
    last_name character varying(128),
    email character varying(128),
    "password" character varying(512),
    registration_key character varying(512),
    reset_password_key character varying(512),
    registration_id character varying(512)
);


ALTER TABLE public.auth_user OWNER TO dacompi_forum3;

--
-- Name: auth_user_id_seq; Type: SEQUENCE SET; Schema: public; Owner: dacompi_forum3
--

SELECT pg_catalog.setval(pg_catalog.pg_get_serial_sequence('auth_user', 'id'), 456, true);


--
-- Name: avaliacoes; Type: TABLE; Schema: public; Owner: dacompi_forum3; Tablespace: 
--

CREATE TABLE avaliacoes (
    id serial NOT NULL,
    aluno_id integer,
    disciplina_id integer,
    professor_id integer,
    "year" integer,
    semester integer,
    grade character varying(2),
    "comment" text,
    karma integer,
    reply text,
    anonimo character(1),
    timestamp_eval timestamp without time zone,
    timestamp_reply timestamp without time zone
);


ALTER TABLE public.avaliacoes OWNER TO dacompi_forum3;

--
-- Name: avaliacoes_id_seq; Type: SEQUENCE SET; Schema: public; Owner: dacompi_forum3
--

SELECT pg_catalog.setval(pg_catalog.pg_get_serial_sequence('avaliacoes', 'id'), 556, true);


--
-- Name: disciplinas; Type: TABLE; Schema: public; Owner: dacompi_forum3; Tablespace: 
--

CREATE TABLE disciplinas (
    id serial NOT NULL,
    name character varying(128) NOT NULL,
    short_name character varying(32),
    code character varying(8) NOT NULL,
    resume text,
    grade character varying(2)
);


ALTER TABLE public.disciplinas OWNER TO dacompi_forum3;

--
-- Name: disciplinas_id_seq; Type: SEQUENCE SET; Schema: public; Owner: dacompi_forum3
--

SELECT pg_catalog.setval(pg_catalog.pg_get_serial_sequence('disciplinas', 'id'), 77, true);


--
-- Name: favoritos; Type: TABLE; Schema: public; Owner: dacompi_forum3; Tablespace: 
--

CREATE TABLE favoritos (
    id serial NOT NULL,
    user_id integer,
    avaliacao_id integer
);


ALTER TABLE public.favoritos OWNER TO dacompi_forum3;

--
-- Name: favoritos_id_seq; Type: SEQUENCE SET; Schema: public; Owner: dacompi_forum3
--

SELECT pg_catalog.setval(pg_catalog.pg_get_serial_sequence('favoritos', 'id'), 27, true);


--
-- Name: karmas; Type: TABLE; Schema: public; Owner: dacompi_forum3; Tablespace: 
--

CREATE TABLE karmas (
    id serial NOT NULL,
    aluno_id integer,
    avaliacao_id integer,
    value integer
);


ALTER TABLE public.karmas OWNER TO dacompi_forum3;

--
-- Name: karmas_id_seq; Type: SEQUENCE SET; Schema: public; Owner: dacompi_forum3
--

SELECT pg_catalog.setval(pg_catalog.pg_get_serial_sequence('karmas', 'id'), 5473, true);


--
-- Name: phpbb_acl_options_seq; Type: SEQUENCE; Schema: public; Owner: dacompi_forum3
--

CREATE SEQUENCE phpbb_acl_options_seq
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;


ALTER TABLE public.phpbb_acl_options_seq OWNER TO dacompi_forum3;

--
-- Name: phpbb_acl_options_seq; Type: SEQUENCE SET; Schema: public; Owner: dacompi_forum3
--

SELECT pg_catalog.setval('phpbb_acl_options_seq', 117, true);


--
-- Name: phpbb_acl_roles_seq; Type: SEQUENCE; Schema: public; Owner: dacompi_forum3
--

CREATE SEQUENCE phpbb_acl_roles_seq
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;


ALTER TABLE public.phpbb_acl_roles_seq OWNER TO dacompi_forum3;

--
-- Name: phpbb_acl_roles_seq; Type: SEQUENCE SET; Schema: public; Owner: dacompi_forum3
--

SELECT pg_catalog.setval('phpbb_acl_roles_seq', 24, true);


--
-- Name: phpbb_attachments_seq; Type: SEQUENCE; Schema: public; Owner: dacompi_forum3
--

CREATE SEQUENCE phpbb_attachments_seq
    START WITH 1
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;


ALTER TABLE public.phpbb_attachments_seq OWNER TO dacompi_forum3;

--
-- Name: phpbb_attachments_seq; Type: SEQUENCE SET; Schema: public; Owner: dacompi_forum3
--

SELECT pg_catalog.setval('phpbb_attachments_seq', 1, false);


--
-- Name: phpbb_banlist_seq; Type: SEQUENCE; Schema: public; Owner: dacompi_forum3
--

CREATE SEQUENCE phpbb_banlist_seq
    START WITH 1
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;


ALTER TABLE public.phpbb_banlist_seq OWNER TO dacompi_forum3;

--
-- Name: phpbb_banlist_seq; Type: SEQUENCE SET; Schema: public; Owner: dacompi_forum3
--

SELECT pg_catalog.setval('phpbb_banlist_seq', 1, false);


--
-- Name: phpbb_bots_seq; Type: SEQUENCE; Schema: public; Owner: dacompi_forum3
--

CREATE SEQUENCE phpbb_bots_seq
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;


ALTER TABLE public.phpbb_bots_seq OWNER TO dacompi_forum3;

--
-- Name: phpbb_bots_seq; Type: SEQUENCE SET; Schema: public; Owner: dacompi_forum3
--

SELECT pg_catalog.setval('phpbb_bots_seq', 50, true);


--
-- Name: phpbb_disallow_seq; Type: SEQUENCE; Schema: public; Owner: dacompi_forum3
--

CREATE SEQUENCE phpbb_disallow_seq
    START WITH 1
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;


ALTER TABLE public.phpbb_disallow_seq OWNER TO dacompi_forum3;

--
-- Name: phpbb_disallow_seq; Type: SEQUENCE SET; Schema: public; Owner: dacompi_forum3
--

SELECT pg_catalog.setval('phpbb_disallow_seq', 1, false);


--
-- Name: phpbb_drafts_seq; Type: SEQUENCE; Schema: public; Owner: dacompi_forum3
--

CREATE SEQUENCE phpbb_drafts_seq
    START WITH 1
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;


ALTER TABLE public.phpbb_drafts_seq OWNER TO dacompi_forum3;

--
-- Name: phpbb_drafts_seq; Type: SEQUENCE SET; Schema: public; Owner: dacompi_forum3
--

SELECT pg_catalog.setval('phpbb_drafts_seq', 1, false);


--
-- Name: phpbb_extension_groups_seq; Type: SEQUENCE; Schema: public; Owner: dacompi_forum3
--

CREATE SEQUENCE phpbb_extension_groups_seq
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;


ALTER TABLE public.phpbb_extension_groups_seq OWNER TO dacompi_forum3;

--
-- Name: phpbb_extension_groups_seq; Type: SEQUENCE SET; Schema: public; Owner: dacompi_forum3
--

SELECT pg_catalog.setval('phpbb_extension_groups_seq', 9, true);


--
-- Name: phpbb_extensions_seq; Type: SEQUENCE; Schema: public; Owner: dacompi_forum3
--

CREATE SEQUENCE phpbb_extensions_seq
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;


ALTER TABLE public.phpbb_extensions_seq OWNER TO dacompi_forum3;

--
-- Name: phpbb_extensions_seq; Type: SEQUENCE SET; Schema: public; Owner: dacompi_forum3
--

SELECT pg_catalog.setval('phpbb_extensions_seq', 66, true);


--
-- Name: phpbb_forums_seq; Type: SEQUENCE; Schema: public; Owner: dacompi_forum3
--

CREATE SEQUENCE phpbb_forums_seq
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;


ALTER TABLE public.phpbb_forums_seq OWNER TO dacompi_forum3;

--
-- Name: phpbb_forums_seq; Type: SEQUENCE SET; Schema: public; Owner: dacompi_forum3
--

SELECT pg_catalog.setval('phpbb_forums_seq', 2, true);


--
-- Name: phpbb_groups_seq; Type: SEQUENCE; Schema: public; Owner: dacompi_forum3
--

CREATE SEQUENCE phpbb_groups_seq
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;


ALTER TABLE public.phpbb_groups_seq OWNER TO dacompi_forum3;

--
-- Name: phpbb_groups_seq; Type: SEQUENCE SET; Schema: public; Owner: dacompi_forum3
--

SELECT pg_catalog.setval('phpbb_groups_seq', 7, true);


--
-- Name: phpbb_icons_seq; Type: SEQUENCE; Schema: public; Owner: dacompi_forum3
--

CREATE SEQUENCE phpbb_icons_seq
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;


ALTER TABLE public.phpbb_icons_seq OWNER TO dacompi_forum3;

--
-- Name: phpbb_icons_seq; Type: SEQUENCE SET; Schema: public; Owner: dacompi_forum3
--

SELECT pg_catalog.setval('phpbb_icons_seq', 10, true);


--
-- Name: phpbb_lang_seq; Type: SEQUENCE; Schema: public; Owner: dacompi_forum3
--

CREATE SEQUENCE phpbb_lang_seq
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;


ALTER TABLE public.phpbb_lang_seq OWNER TO dacompi_forum3;

--
-- Name: phpbb_lang_seq; Type: SEQUENCE SET; Schema: public; Owner: dacompi_forum3
--

SELECT pg_catalog.setval('phpbb_lang_seq', 2, true);


--
-- Name: phpbb_log_seq; Type: SEQUENCE; Schema: public; Owner: dacompi_forum3
--

CREATE SEQUENCE phpbb_log_seq
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;


ALTER TABLE public.phpbb_log_seq OWNER TO dacompi_forum3;

--
-- Name: phpbb_log_seq; Type: SEQUENCE SET; Schema: public; Owner: dacompi_forum3
--

SELECT pg_catalog.setval('phpbb_log_seq', 21, true);


--
-- Name: phpbb_modules_seq; Type: SEQUENCE; Schema: public; Owner: dacompi_forum3
--

CREATE SEQUENCE phpbb_modules_seq
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;


ALTER TABLE public.phpbb_modules_seq OWNER TO dacompi_forum3;

--
-- Name: phpbb_modules_seq; Type: SEQUENCE SET; Schema: public; Owner: dacompi_forum3
--

SELECT pg_catalog.setval('phpbb_modules_seq', 197, true);


--
-- Name: phpbb_posts_seq; Type: SEQUENCE; Schema: public; Owner: dacompi_forum3
--

CREATE SEQUENCE phpbb_posts_seq
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;


ALTER TABLE public.phpbb_posts_seq OWNER TO dacompi_forum3;

--
-- Name: phpbb_posts_seq; Type: SEQUENCE SET; Schema: public; Owner: dacompi_forum3
--

SELECT pg_catalog.setval('phpbb_posts_seq', 1, true);


--
-- Name: phpbb_privmsgs_folder_seq; Type: SEQUENCE; Schema: public; Owner: dacompi_forum3
--

CREATE SEQUENCE phpbb_privmsgs_folder_seq
    START WITH 1
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;


ALTER TABLE public.phpbb_privmsgs_folder_seq OWNER TO dacompi_forum3;

--
-- Name: phpbb_privmsgs_folder_seq; Type: SEQUENCE SET; Schema: public; Owner: dacompi_forum3
--

SELECT pg_catalog.setval('phpbb_privmsgs_folder_seq', 1, false);


--
-- Name: phpbb_privmsgs_rules_seq; Type: SEQUENCE; Schema: public; Owner: dacompi_forum3
--

CREATE SEQUENCE phpbb_privmsgs_rules_seq
    START WITH 1
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;


ALTER TABLE public.phpbb_privmsgs_rules_seq OWNER TO dacompi_forum3;

--
-- Name: phpbb_privmsgs_rules_seq; Type: SEQUENCE SET; Schema: public; Owner: dacompi_forum3
--

SELECT pg_catalog.setval('phpbb_privmsgs_rules_seq', 1, false);


--
-- Name: phpbb_privmsgs_seq; Type: SEQUENCE; Schema: public; Owner: dacompi_forum3
--

CREATE SEQUENCE phpbb_privmsgs_seq
    START WITH 1
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;


ALTER TABLE public.phpbb_privmsgs_seq OWNER TO dacompi_forum3;

--
-- Name: phpbb_privmsgs_seq; Type: SEQUENCE SET; Schema: public; Owner: dacompi_forum3
--

SELECT pg_catalog.setval('phpbb_privmsgs_seq', 1, false);


--
-- Name: phpbb_profile_fields_seq; Type: SEQUENCE; Schema: public; Owner: dacompi_forum3
--

CREATE SEQUENCE phpbb_profile_fields_seq
    START WITH 1
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;


ALTER TABLE public.phpbb_profile_fields_seq OWNER TO dacompi_forum3;

--
-- Name: phpbb_profile_fields_seq; Type: SEQUENCE SET; Schema: public; Owner: dacompi_forum3
--

SELECT pg_catalog.setval('phpbb_profile_fields_seq', 1, false);


--
-- Name: phpbb_ranks_seq; Type: SEQUENCE; Schema: public; Owner: dacompi_forum3
--

CREATE SEQUENCE phpbb_ranks_seq
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;


ALTER TABLE public.phpbb_ranks_seq OWNER TO dacompi_forum3;

--
-- Name: phpbb_ranks_seq; Type: SEQUENCE SET; Schema: public; Owner: dacompi_forum3
--

SELECT pg_catalog.setval('phpbb_ranks_seq', 1, true);


--
-- Name: phpbb_reports_reasons_seq; Type: SEQUENCE; Schema: public; Owner: dacompi_forum3
--

CREATE SEQUENCE phpbb_reports_reasons_seq
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;


ALTER TABLE public.phpbb_reports_reasons_seq OWNER TO dacompi_forum3;

--
-- Name: phpbb_reports_reasons_seq; Type: SEQUENCE SET; Schema: public; Owner: dacompi_forum3
--

SELECT pg_catalog.setval('phpbb_reports_reasons_seq', 4, true);


--
-- Name: phpbb_reports_seq; Type: SEQUENCE; Schema: public; Owner: dacompi_forum3
--

CREATE SEQUENCE phpbb_reports_seq
    START WITH 1
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;


ALTER TABLE public.phpbb_reports_seq OWNER TO dacompi_forum3;

--
-- Name: phpbb_reports_seq; Type: SEQUENCE SET; Schema: public; Owner: dacompi_forum3
--

SELECT pg_catalog.setval('phpbb_reports_seq', 1, false);


--
-- Name: phpbb_search_wordlist_seq; Type: SEQUENCE; Schema: public; Owner: dacompi_forum3
--

CREATE SEQUENCE phpbb_search_wordlist_seq
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;


ALTER TABLE public.phpbb_search_wordlist_seq OWNER TO dacompi_forum3;

--
-- Name: phpbb_search_wordlist_seq; Type: SEQUENCE SET; Schema: public; Owner: dacompi_forum3
--

SELECT pg_catalog.setval('phpbb_search_wordlist_seq', 74, true);


--
-- Name: phpbb_sitelist_seq; Type: SEQUENCE; Schema: public; Owner: dacompi_forum3
--

CREATE SEQUENCE phpbb_sitelist_seq
    START WITH 1
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;


ALTER TABLE public.phpbb_sitelist_seq OWNER TO dacompi_forum3;

--
-- Name: phpbb_sitelist_seq; Type: SEQUENCE SET; Schema: public; Owner: dacompi_forum3
--

SELECT pg_catalog.setval('phpbb_sitelist_seq', 1, false);


--
-- Name: phpbb_smilies_seq; Type: SEQUENCE; Schema: public; Owner: dacompi_forum3
--

CREATE SEQUENCE phpbb_smilies_seq
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;


ALTER TABLE public.phpbb_smilies_seq OWNER TO dacompi_forum3;

--
-- Name: phpbb_smilies_seq; Type: SEQUENCE SET; Schema: public; Owner: dacompi_forum3
--

SELECT pg_catalog.setval('phpbb_smilies_seq', 42, true);


--
-- Name: phpbb_styles_imageset_data_seq; Type: SEQUENCE; Schema: public; Owner: dacompi_forum3
--

CREATE SEQUENCE phpbb_styles_imageset_data_seq
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;


ALTER TABLE public.phpbb_styles_imageset_data_seq OWNER TO dacompi_forum3;

--
-- Name: phpbb_styles_imageset_data_seq; Type: SEQUENCE SET; Schema: public; Owner: dacompi_forum3
--

SELECT pg_catalog.setval('phpbb_styles_imageset_data_seq', 78, true);


--
-- Name: phpbb_styles_imageset_seq; Type: SEQUENCE; Schema: public; Owner: dacompi_forum3
--

CREATE SEQUENCE phpbb_styles_imageset_seq
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;


ALTER TABLE public.phpbb_styles_imageset_seq OWNER TO dacompi_forum3;

--
-- Name: phpbb_styles_imageset_seq; Type: SEQUENCE SET; Schema: public; Owner: dacompi_forum3
--

SELECT pg_catalog.setval('phpbb_styles_imageset_seq', 1, true);


--
-- Name: phpbb_styles_seq; Type: SEQUENCE; Schema: public; Owner: dacompi_forum3
--

CREATE SEQUENCE phpbb_styles_seq
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;


ALTER TABLE public.phpbb_styles_seq OWNER TO dacompi_forum3;

--
-- Name: phpbb_styles_seq; Type: SEQUENCE SET; Schema: public; Owner: dacompi_forum3
--

SELECT pg_catalog.setval('phpbb_styles_seq', 1, true);


--
-- Name: phpbb_styles_template_seq; Type: SEQUENCE; Schema: public; Owner: dacompi_forum3
--

CREATE SEQUENCE phpbb_styles_template_seq
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;


ALTER TABLE public.phpbb_styles_template_seq OWNER TO dacompi_forum3;

--
-- Name: phpbb_styles_template_seq; Type: SEQUENCE SET; Schema: public; Owner: dacompi_forum3
--

SELECT pg_catalog.setval('phpbb_styles_template_seq', 1, true);


--
-- Name: phpbb_styles_theme_seq; Type: SEQUENCE; Schema: public; Owner: dacompi_forum3
--

CREATE SEQUENCE phpbb_styles_theme_seq
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;


ALTER TABLE public.phpbb_styles_theme_seq OWNER TO dacompi_forum3;

--
-- Name: phpbb_styles_theme_seq; Type: SEQUENCE SET; Schema: public; Owner: dacompi_forum3
--

SELECT pg_catalog.setval('phpbb_styles_theme_seq', 1, true);


--
-- Name: phpbb_topics_seq; Type: SEQUENCE; Schema: public; Owner: dacompi_forum3
--

CREATE SEQUENCE phpbb_topics_seq
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;


ALTER TABLE public.phpbb_topics_seq OWNER TO dacompi_forum3;

--
-- Name: phpbb_topics_seq; Type: SEQUENCE SET; Schema: public; Owner: dacompi_forum3
--

SELECT pg_catalog.setval('phpbb_topics_seq', 1, true);


--
-- Name: phpbb_users_seq; Type: SEQUENCE; Schema: public; Owner: dacompi_forum3
--

CREATE SEQUENCE phpbb_users_seq
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;


ALTER TABLE public.phpbb_users_seq OWNER TO dacompi_forum3;

--
-- Name: phpbb_users_seq; Type: SEQUENCE SET; Schema: public; Owner: dacompi_forum3
--

SELECT pg_catalog.setval('phpbb_users_seq', 52, true);


--
-- Name: phpbb_warnings_seq; Type: SEQUENCE; Schema: public; Owner: dacompi_forum3
--

CREATE SEQUENCE phpbb_warnings_seq
    START WITH 1
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;


ALTER TABLE public.phpbb_warnings_seq OWNER TO dacompi_forum3;

--
-- Name: phpbb_warnings_seq; Type: SEQUENCE SET; Schema: public; Owner: dacompi_forum3
--

SELECT pg_catalog.setval('phpbb_warnings_seq', 1, false);


--
-- Name: phpbb_words_seq; Type: SEQUENCE; Schema: public; Owner: dacompi_forum3
--

CREATE SEQUENCE phpbb_words_seq
    START WITH 1
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;


ALTER TABLE public.phpbb_words_seq OWNER TO dacompi_forum3;

--
-- Name: phpbb_words_seq; Type: SEQUENCE SET; Schema: public; Owner: dacompi_forum3
--

SELECT pg_catalog.setval('phpbb_words_seq', 1, false);


--
-- Name: professores; Type: TABLE; Schema: public; Owner: dacompi_forum3; Tablespace: 
--

CREATE TABLE professores (
    id serial NOT NULL,
    user_id integer,
    email character varying(64) NOT NULL,
    full_name character varying(128) NOT NULL,
    short_name character varying(32),
    grade character varying(2),
    site character varying(64),
    picture character varying(512),
    blocked character(1)
);


ALTER TABLE public.professores OWNER TO dacompi_forum3;

--
-- Name: professores_id_seq; Type: SEQUENCE SET; Schema: public; Owner: dacompi_forum3
--

SELECT pg_catalog.setval(pg_catalog.pg_get_serial_sequence('professores', 'id'), 80, true);


--
-- Name: profs_discs; Type: TABLE; Schema: public; Owner: dacompi_forum3; Tablespace: 
--

CREATE TABLE profs_discs (
    id serial NOT NULL,
    professor_id integer,
    disciplina_id integer,
    count integer
);


ALTER TABLE public.profs_discs OWNER TO dacompi_forum3;

--
-- Name: profs_discs_id_seq; Type: SEQUENCE SET; Schema: public; Owner: dacompi_forum3
--

SELECT pg_catalog.setval(pg_catalog.pg_get_serial_sequence('profs_discs', 'id'), 219, true);


--
-- Data for Name: alunos; Type: TABLE DATA; Schema: public; Owner: dacompi_forum3
--

COPY alunos (id, user_id, email, full_name, short_name, grade) FROM stdin;
\.
copy alunos (id, user_id, email, full_name, short_name, grade)  from '$$PATH$$/1710.dat' ;
--
-- Data for Name: auth_cas; Type: TABLE DATA; Schema: public; Owner: dacompi_forum3
--

COPY auth_cas (id, user_id, created_on, url, uuid) FROM stdin;
\.
copy auth_cas (id, user_id, created_on, url, uuid)  from '$$PATH$$/1709.dat' ;
--
-- Data for Name: auth_event; Type: TABLE DATA; Schema: public; Owner: dacompi_forum3
--

COPY auth_event (id, time_stamp, client_ip, user_id, origin, description) FROM stdin;
\.
copy auth_event (id, time_stamp, client_ip, user_id, origin, description)  from '$$PATH$$/1708.dat' ;
--
-- Data for Name: auth_group; Type: TABLE DATA; Schema: public; Owner: dacompi_forum3
--

COPY auth_group (id, "role", description) FROM stdin;
\.
copy auth_group (id, "role", description)  from '$$PATH$$/1705.dat' ;
--
-- Data for Name: auth_membership; Type: TABLE DATA; Schema: public; Owner: dacompi_forum3
--

COPY auth_membership (id, user_id, group_id) FROM stdin;
\.
copy auth_membership (id, user_id, group_id)  from '$$PATH$$/1706.dat' ;
--
-- Data for Name: auth_permission; Type: TABLE DATA; Schema: public; Owner: dacompi_forum3
--

COPY auth_permission (id, group_id, name, table_name, record_id) FROM stdin;
\.
copy auth_permission (id, group_id, name, table_name, record_id)  from '$$PATH$$/1707.dat' ;
--
-- Data for Name: auth_user; Type: TABLE DATA; Schema: public; Owner: dacompi_forum3
--

COPY auth_user (id, first_name, last_name, email, "password", registration_key, reset_password_key, registration_id) FROM stdin;
\.
copy auth_user (id, first_name, last_name, email, "password", registration_key, reset_password_key, registration_id)  from '$$PATH$$/1704.dat' ;
--
-- Data for Name: avaliacoes; Type: TABLE DATA; Schema: public; Owner: dacompi_forum3
--

COPY avaliacoes (id, aluno_id, disciplina_id, professor_id, "year", semester, grade, "comment", karma, reply, anonimo, timestamp_eval, timestamp_reply) FROM stdin;
\.
copy avaliacoes (id, aluno_id, disciplina_id, professor_id, "year", semester, grade, "comment", karma, reply, anonimo, timestamp_eval, timestamp_reply)  from '$$PATH$$/1713.dat' ;
--
-- Data for Name: disciplinas; Type: TABLE DATA; Schema: public; Owner: dacompi_forum3
--

COPY disciplinas (id, name, short_name, code, resume, grade) FROM stdin;
\.
copy disciplinas (id, name, short_name, code, resume, grade)  from '$$PATH$$/1711.dat' ;
--
-- Data for Name: favoritos; Type: TABLE DATA; Schema: public; Owner: dacompi_forum3
--

COPY favoritos (id, user_id, avaliacao_id) FROM stdin;
\.
copy favoritos (id, user_id, avaliacao_id)  from '$$PATH$$/1716.dat' ;
--
-- Data for Name: karmas; Type: TABLE DATA; Schema: public; Owner: dacompi_forum3
--

COPY karmas (id, aluno_id, avaliacao_id, value) FROM stdin;
\.
copy karmas (id, aluno_id, avaliacao_id, value)  from '$$PATH$$/1715.dat' ;
--
-- Data for Name: professores; Type: TABLE DATA; Schema: public; Owner: dacompi_forum3
--

COPY professores (id, user_id, email, full_name, short_name, grade, site, picture, blocked) FROM stdin;
\.
copy professores (id, user_id, email, full_name, short_name, grade, site, picture, blocked)  from '$$PATH$$/1712.dat' ;
--
-- Data for Name: profs_discs; Type: TABLE DATA; Schema: public; Owner: dacompi_forum3
--

COPY profs_discs (id, professor_id, disciplina_id, count) FROM stdin;
\.
copy profs_discs (id, professor_id, disciplina_id, count)  from '$$PATH$$/1714.dat' ;
--
-- Name: alunos_email_key; Type: CONSTRAINT; Schema: public; Owner: dacompi_forum3; Tablespace: 
--

ALTER TABLE ONLY alunos
    ADD CONSTRAINT alunos_email_key UNIQUE (email);


--
-- Name: alunos_pkey; Type: CONSTRAINT; Schema: public; Owner: dacompi_forum3; Tablespace: 
--

ALTER TABLE ONLY alunos
    ADD CONSTRAINT alunos_pkey PRIMARY KEY (id);


--
-- Name: auth_cas_pkey; Type: CONSTRAINT; Schema: public; Owner: dacompi_forum3; Tablespace: 
--

ALTER TABLE ONLY auth_cas
    ADD CONSTRAINT auth_cas_pkey PRIMARY KEY (id);


--
-- Name: auth_event_pkey; Type: CONSTRAINT; Schema: public; Owner: dacompi_forum3; Tablespace: 
--

ALTER TABLE ONLY auth_event
    ADD CONSTRAINT auth_event_pkey PRIMARY KEY (id);


--
-- Name: auth_group_pkey; Type: CONSTRAINT; Schema: public; Owner: dacompi_forum3; Tablespace: 
--

ALTER TABLE ONLY auth_group
    ADD CONSTRAINT auth_group_pkey PRIMARY KEY (id);


--
-- Name: auth_membership_pkey; Type: CONSTRAINT; Schema: public; Owner: dacompi_forum3; Tablespace: 
--

ALTER TABLE ONLY auth_membership
    ADD CONSTRAINT auth_membership_pkey PRIMARY KEY (id);


--
-- Name: auth_permission_pkey; Type: CONSTRAINT; Schema: public; Owner: dacompi_forum3; Tablespace: 
--

ALTER TABLE ONLY auth_permission
    ADD CONSTRAINT auth_permission_pkey PRIMARY KEY (id);


--
-- Name: auth_user_email_key; Type: CONSTRAINT; Schema: public; Owner: dacompi_forum3; Tablespace: 
--

ALTER TABLE ONLY auth_user
    ADD CONSTRAINT auth_user_email_key UNIQUE (email);


--
-- Name: auth_user_pkey; Type: CONSTRAINT; Schema: public; Owner: dacompi_forum3; Tablespace: 
--

ALTER TABLE ONLY auth_user
    ADD CONSTRAINT auth_user_pkey PRIMARY KEY (id);


--
-- Name: avaliacoes_pkey; Type: CONSTRAINT; Schema: public; Owner: dacompi_forum3; Tablespace: 
--

ALTER TABLE ONLY avaliacoes
    ADD CONSTRAINT avaliacoes_pkey PRIMARY KEY (id);


--
-- Name: disciplinas_code_key; Type: CONSTRAINT; Schema: public; Owner: dacompi_forum3; Tablespace: 
--

ALTER TABLE ONLY disciplinas
    ADD CONSTRAINT disciplinas_code_key UNIQUE (code);


--
-- Name: disciplinas_pkey; Type: CONSTRAINT; Schema: public; Owner: dacompi_forum3; Tablespace: 
--

ALTER TABLE ONLY disciplinas
    ADD CONSTRAINT disciplinas_pkey PRIMARY KEY (id);


--
-- Name: favoritos_pkey; Type: CONSTRAINT; Schema: public; Owner: dacompi_forum3; Tablespace: 
--

ALTER TABLE ONLY favoritos
    ADD CONSTRAINT favoritos_pkey PRIMARY KEY (id);


--
-- Name: karmas_pkey; Type: CONSTRAINT; Schema: public; Owner: dacompi_forum3; Tablespace: 
--

ALTER TABLE ONLY karmas
    ADD CONSTRAINT karmas_pkey PRIMARY KEY (id);


--
-- Name: professores_email_key; Type: CONSTRAINT; Schema: public; Owner: dacompi_forum3; Tablespace: 
--

ALTER TABLE ONLY professores
    ADD CONSTRAINT professores_email_key UNIQUE (email);


--
-- Name: professores_pkey; Type: CONSTRAINT; Schema: public; Owner: dacompi_forum3; Tablespace: 
--

ALTER TABLE ONLY professores
    ADD CONSTRAINT professores_pkey PRIMARY KEY (id);


--
-- Name: profs_discs_pkey; Type: CONSTRAINT; Schema: public; Owner: dacompi_forum3; Tablespace: 
--

ALTER TABLE ONLY profs_discs
    ADD CONSTRAINT profs_discs_pkey PRIMARY KEY (id);


--
-- Name: auth_cas_user_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: dacompi_forum3
--

ALTER TABLE ONLY auth_cas
    ADD CONSTRAINT auth_cas_user_id_fkey FOREIGN KEY (user_id) REFERENCES auth_user(id) ON DELETE CASCADE;


--
-- Name: auth_event_user_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: dacompi_forum3
--

ALTER TABLE ONLY auth_event
    ADD CONSTRAINT auth_event_user_id_fkey FOREIGN KEY (user_id) REFERENCES auth_user(id) ON DELETE CASCADE;


--
-- Name: auth_membership_group_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: dacompi_forum3
--

ALTER TABLE ONLY auth_membership
    ADD CONSTRAINT auth_membership_group_id_fkey FOREIGN KEY (group_id) REFERENCES auth_group(id) ON DELETE CASCADE;


--
-- Name: auth_membership_user_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: dacompi_forum3
--

ALTER TABLE ONLY auth_membership
    ADD CONSTRAINT auth_membership_user_id_fkey FOREIGN KEY (user_id) REFERENCES auth_user(id) ON DELETE CASCADE;


--
-- Name: auth_permission_group_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: dacompi_forum3
--

ALTER TABLE ONLY auth_permission
    ADD CONSTRAINT auth_permission_group_id_fkey FOREIGN KEY (group_id) REFERENCES auth_group(id) ON DELETE CASCADE;


--
-- Name: avaliacoes_aluno_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: dacompi_forum3
--

ALTER TABLE ONLY avaliacoes
    ADD CONSTRAINT avaliacoes_aluno_id_fkey FOREIGN KEY (aluno_id) REFERENCES alunos(id) ON DELETE CASCADE;


--
-- Name: avaliacoes_disciplina_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: dacompi_forum3
--

ALTER TABLE ONLY avaliacoes
    ADD CONSTRAINT avaliacoes_disciplina_id_fkey FOREIGN KEY (disciplina_id) REFERENCES disciplinas(id) ON DELETE CASCADE;


--
-- Name: avaliacoes_professor_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: dacompi_forum3
--

ALTER TABLE ONLY avaliacoes
    ADD CONSTRAINT avaliacoes_professor_id_fkey FOREIGN KEY (professor_id) REFERENCES professores(id) ON DELETE CASCADE;


--
-- Name: favoritos_avaliacao_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: dacompi_forum3
--

ALTER TABLE ONLY favoritos
    ADD CONSTRAINT favoritos_avaliacao_id_fkey FOREIGN KEY (avaliacao_id) REFERENCES avaliacoes(id) ON DELETE CASCADE;


--
-- Name: karmas_aluno_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: dacompi_forum3
--

ALTER TABLE ONLY karmas
    ADD CONSTRAINT karmas_aluno_id_fkey FOREIGN KEY (aluno_id) REFERENCES alunos(id) ON DELETE CASCADE;


--
-- Name: karmas_avaliacao_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: dacompi_forum3
--

ALTER TABLE ONLY karmas
    ADD CONSTRAINT karmas_avaliacao_id_fkey FOREIGN KEY (avaliacao_id) REFERENCES avaliacoes(id) ON DELETE CASCADE;


--
-- Name: profs_discs_disciplina_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: dacompi_forum3
--

ALTER TABLE ONLY profs_discs
    ADD CONSTRAINT profs_discs_disciplina_id_fkey FOREIGN KEY (disciplina_id) REFERENCES disciplinas(id) ON DELETE CASCADE;


--
-- Name: profs_discs_professor_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: dacompi_forum3
--

ALTER TABLE ONLY profs_discs
    ADD CONSTRAINT profs_discs_professor_id_fkey FOREIGN KEY (professor_id) REFERENCES professores(id) ON DELETE CASCADE;


--
-- Name: public; Type: ACL; Schema: -; Owner: postgres
--

REVOKE ALL ON SCHEMA public FROM PUBLIC;
REVOKE ALL ON SCHEMA public FROM postgres;
GRANT ALL ON SCHEMA public TO postgres;
GRANT ALL ON SCHEMA public TO PUBLIC;


--
-- Name: alunos; Type: ACL; Schema: public; Owner: dacompi_forum3
--

REVOKE ALL ON TABLE alunos FROM PUBLIC;
REVOKE ALL ON TABLE alunos FROM dacompi_forum3;
GRANT ALL ON TABLE alunos TO dacompi_forum3;
GRANT ALL ON TABLE alunos TO dacompi;


--
-- Name: alunos_id_seq; Type: ACL; Schema: public; Owner: dacompi_forum3
--

REVOKE ALL ON TABLE alunos_id_seq FROM PUBLIC;
REVOKE ALL ON TABLE alunos_id_seq FROM dacompi_forum3;
GRANT ALL ON TABLE alunos_id_seq TO dacompi_forum3;
GRANT ALL ON TABLE alunos_id_seq TO dacompi;


--
-- Name: auth_cas; Type: ACL; Schema: public; Owner: dacompi_forum3
--

REVOKE ALL ON TABLE auth_cas FROM PUBLIC;
REVOKE ALL ON TABLE auth_cas FROM dacompi_forum3;
GRANT ALL ON TABLE auth_cas TO dacompi_forum3;
GRANT ALL ON TABLE auth_cas TO dacompi;


--
-- Name: auth_cas_id_seq; Type: ACL; Schema: public; Owner: dacompi_forum3
--

REVOKE ALL ON TABLE auth_cas_id_seq FROM PUBLIC;
REVOKE ALL ON TABLE auth_cas_id_seq FROM dacompi_forum3;
GRANT ALL ON TABLE auth_cas_id_seq TO dacompi_forum3;
GRANT ALL ON TABLE auth_cas_id_seq TO dacompi;


--
-- Name: auth_event; Type: ACL; Schema: public; Owner: dacompi_forum3
--

REVOKE ALL ON TABLE auth_event FROM PUBLIC;
REVOKE ALL ON TABLE auth_event FROM dacompi_forum3;
GRANT ALL ON TABLE auth_event TO dacompi_forum3;
GRANT ALL ON TABLE auth_event TO dacompi;


--
-- Name: auth_event_id_seq; Type: ACL; Schema: public; Owner: dacompi_forum3
--

REVOKE ALL ON TABLE auth_event_id_seq FROM PUBLIC;
REVOKE ALL ON TABLE auth_event_id_seq FROM dacompi_forum3;
GRANT ALL ON TABLE auth_event_id_seq TO dacompi_forum3;
GRANT ALL ON TABLE auth_event_id_seq TO dacompi;


--
-- Name: auth_group; Type: ACL; Schema: public; Owner: dacompi_forum3
--

REVOKE ALL ON TABLE auth_group FROM PUBLIC;
REVOKE ALL ON TABLE auth_group FROM dacompi_forum3;
GRANT ALL ON TABLE auth_group TO dacompi_forum3;
GRANT ALL ON TABLE auth_group TO dacompi;


--
-- Name: auth_group_id_seq; Type: ACL; Schema: public; Owner: dacompi_forum3
--

REVOKE ALL ON TABLE auth_group_id_seq FROM PUBLIC;
REVOKE ALL ON TABLE auth_group_id_seq FROM dacompi_forum3;
GRANT ALL ON TABLE auth_group_id_seq TO dacompi_forum3;
GRANT ALL ON TABLE auth_group_id_seq TO dacompi;


--
-- Name: auth_membership; Type: ACL; Schema: public; Owner: dacompi_forum3
--

REVOKE ALL ON TABLE auth_membership FROM PUBLIC;
REVOKE ALL ON TABLE auth_membership FROM dacompi_forum3;
GRANT ALL ON TABLE auth_membership TO dacompi_forum3;
GRANT ALL ON TABLE auth_membership TO dacompi;


--
-- Name: auth_membership_id_seq; Type: ACL; Schema: public; Owner: dacompi_forum3
--

REVOKE ALL ON TABLE auth_membership_id_seq FROM PUBLIC;
REVOKE ALL ON TABLE auth_membership_id_seq FROM dacompi_forum3;
GRANT ALL ON TABLE auth_membership_id_seq TO dacompi_forum3;
GRANT ALL ON TABLE auth_membership_id_seq TO dacompi;


--
-- Name: auth_permission; Type: ACL; Schema: public; Owner: dacompi_forum3
--

REVOKE ALL ON TABLE auth_permission FROM PUBLIC;
REVOKE ALL ON TABLE auth_permission FROM dacompi_forum3;
GRANT ALL ON TABLE auth_permission TO dacompi_forum3;
GRANT ALL ON TABLE auth_permission TO dacompi;


--
-- Name: auth_permission_id_seq; Type: ACL; Schema: public; Owner: dacompi_forum3
--

REVOKE ALL ON TABLE auth_permission_id_seq FROM PUBLIC;
REVOKE ALL ON TABLE auth_permission_id_seq FROM dacompi_forum3;
GRANT ALL ON TABLE auth_permission_id_seq TO dacompi_forum3;
GRANT ALL ON TABLE auth_permission_id_seq TO dacompi;


--
-- Name: auth_user; Type: ACL; Schema: public; Owner: dacompi_forum3
--

REVOKE ALL ON TABLE auth_user FROM PUBLIC;
REVOKE ALL ON TABLE auth_user FROM dacompi_forum3;
GRANT ALL ON TABLE auth_user TO dacompi_forum3;
GRANT ALL ON TABLE auth_user TO dacompi;


--
-- Name: auth_user_id_seq; Type: ACL; Schema: public; Owner: dacompi_forum3
--

REVOKE ALL ON TABLE auth_user_id_seq FROM PUBLIC;
REVOKE ALL ON TABLE auth_user_id_seq FROM dacompi_forum3;
GRANT ALL ON TABLE auth_user_id_seq TO dacompi_forum3;
GRANT ALL ON TABLE auth_user_id_seq TO dacompi;


--
-- Name: avaliacoes; Type: ACL; Schema: public; Owner: dacompi_forum3
--

REVOKE ALL ON TABLE avaliacoes FROM PUBLIC;
REVOKE ALL ON TABLE avaliacoes FROM dacompi_forum3;
GRANT ALL ON TABLE avaliacoes TO dacompi_forum3;
GRANT ALL ON TABLE avaliacoes TO dacompi;


--
-- Name: avaliacoes_id_seq; Type: ACL; Schema: public; Owner: dacompi_forum3
--

REVOKE ALL ON TABLE avaliacoes_id_seq FROM PUBLIC;
REVOKE ALL ON TABLE avaliacoes_id_seq FROM dacompi_forum3;
GRANT ALL ON TABLE avaliacoes_id_seq TO dacompi_forum3;
GRANT ALL ON TABLE avaliacoes_id_seq TO dacompi;


--
-- Name: disciplinas; Type: ACL; Schema: public; Owner: dacompi_forum3
--

REVOKE ALL ON TABLE disciplinas FROM PUBLIC;
REVOKE ALL ON TABLE disciplinas FROM dacompi_forum3;
GRANT ALL ON TABLE disciplinas TO dacompi_forum3;
GRANT ALL ON TABLE disciplinas TO dacompi;


--
-- Name: disciplinas_id_seq; Type: ACL; Schema: public; Owner: dacompi_forum3
--

REVOKE ALL ON TABLE disciplinas_id_seq FROM PUBLIC;
REVOKE ALL ON TABLE disciplinas_id_seq FROM dacompi_forum3;
GRANT ALL ON TABLE disciplinas_id_seq TO dacompi_forum3;
GRANT ALL ON TABLE disciplinas_id_seq TO dacompi;


--
-- Name: favoritos; Type: ACL; Schema: public; Owner: dacompi_forum3
--

REVOKE ALL ON TABLE favoritos FROM PUBLIC;
REVOKE ALL ON TABLE favoritos FROM dacompi_forum3;
GRANT ALL ON TABLE favoritos TO dacompi_forum3;
GRANT ALL ON TABLE favoritos TO dacompi;


--
-- Name: favoritos_id_seq; Type: ACL; Schema: public; Owner: dacompi_forum3
--

REVOKE ALL ON TABLE favoritos_id_seq FROM PUBLIC;
REVOKE ALL ON TABLE favoritos_id_seq FROM dacompi_forum3;
GRANT ALL ON TABLE favoritos_id_seq TO dacompi_forum3;
GRANT ALL ON TABLE favoritos_id_seq TO dacompi;


--
-- Name: karmas; Type: ACL; Schema: public; Owner: dacompi_forum3
--

REVOKE ALL ON TABLE karmas FROM PUBLIC;
REVOKE ALL ON TABLE karmas FROM dacompi_forum3;
GRANT ALL ON TABLE karmas TO dacompi_forum3;
GRANT ALL ON TABLE karmas TO dacompi;


--
-- Name: karmas_id_seq; Type: ACL; Schema: public; Owner: dacompi_forum3
--

REVOKE ALL ON TABLE karmas_id_seq FROM PUBLIC;
REVOKE ALL ON TABLE karmas_id_seq FROM dacompi_forum3;
GRANT ALL ON TABLE karmas_id_seq TO dacompi_forum3;
GRANT ALL ON TABLE karmas_id_seq TO dacompi;


--
-- Name: phpbb_acl_options_seq; Type: ACL; Schema: public; Owner: dacompi_forum3
--

REVOKE ALL ON TABLE phpbb_acl_options_seq FROM PUBLIC;
REVOKE ALL ON TABLE phpbb_acl_options_seq FROM dacompi_forum3;
GRANT ALL ON TABLE phpbb_acl_options_seq TO dacompi_forum3;
GRANT ALL ON TABLE phpbb_acl_options_seq TO dacompi;


--
-- Name: phpbb_acl_roles_seq; Type: ACL; Schema: public; Owner: dacompi_forum3
--

REVOKE ALL ON TABLE phpbb_acl_roles_seq FROM PUBLIC;
REVOKE ALL ON TABLE phpbb_acl_roles_seq FROM dacompi_forum3;
GRANT ALL ON TABLE phpbb_acl_roles_seq TO dacompi_forum3;
GRANT ALL ON TABLE phpbb_acl_roles_seq TO dacompi;


--
-- Name: phpbb_attachments_seq; Type: ACL; Schema: public; Owner: dacompi_forum3
--

REVOKE ALL ON TABLE phpbb_attachments_seq FROM PUBLIC;
REVOKE ALL ON TABLE phpbb_attachments_seq FROM dacompi_forum3;
GRANT ALL ON TABLE phpbb_attachments_seq TO dacompi_forum3;
GRANT ALL ON TABLE phpbb_attachments_seq TO dacompi;


--
-- Name: phpbb_banlist_seq; Type: ACL; Schema: public; Owner: dacompi_forum3
--

REVOKE ALL ON TABLE phpbb_banlist_seq FROM PUBLIC;
REVOKE ALL ON TABLE phpbb_banlist_seq FROM dacompi_forum3;
GRANT ALL ON TABLE phpbb_banlist_seq TO dacompi_forum3;
GRANT ALL ON TABLE phpbb_banlist_seq TO dacompi;


--
-- Name: phpbb_bots_seq; Type: ACL; Schema: public; Owner: dacompi_forum3
--

REVOKE ALL ON TABLE phpbb_bots_seq FROM PUBLIC;
REVOKE ALL ON TABLE phpbb_bots_seq FROM dacompi_forum3;
GRANT ALL ON TABLE phpbb_bots_seq TO dacompi_forum3;
GRANT ALL ON TABLE phpbb_bots_seq TO dacompi;


--
-- Name: phpbb_disallow_seq; Type: ACL; Schema: public; Owner: dacompi_forum3
--

REVOKE ALL ON TABLE phpbb_disallow_seq FROM PUBLIC;
REVOKE ALL ON TABLE phpbb_disallow_seq FROM dacompi_forum3;
GRANT ALL ON TABLE phpbb_disallow_seq TO dacompi_forum3;
GRANT ALL ON TABLE phpbb_disallow_seq TO dacompi;


--
-- Name: phpbb_drafts_seq; Type: ACL; Schema: public; Owner: dacompi_forum3
--

REVOKE ALL ON TABLE phpbb_drafts_seq FROM PUBLIC;
REVOKE ALL ON TABLE phpbb_drafts_seq FROM dacompi_forum3;
GRANT ALL ON TABLE phpbb_drafts_seq TO dacompi_forum3;
GRANT ALL ON TABLE phpbb_drafts_seq TO dacompi;


--
-- Name: phpbb_extension_groups_seq; Type: ACL; Schema: public; Owner: dacompi_forum3
--

REVOKE ALL ON TABLE phpbb_extension_groups_seq FROM PUBLIC;
REVOKE ALL ON TABLE phpbb_extension_groups_seq FROM dacompi_forum3;
GRANT ALL ON TABLE phpbb_extension_groups_seq TO dacompi_forum3;
GRANT ALL ON TABLE phpbb_extension_groups_seq TO dacompi;


--
-- Name: phpbb_extensions_seq; Type: ACL; Schema: public; Owner: dacompi_forum3
--

REVOKE ALL ON TABLE phpbb_extensions_seq FROM PUBLIC;
REVOKE ALL ON TABLE phpbb_extensions_seq FROM dacompi_forum3;
GRANT ALL ON TABLE phpbb_extensions_seq TO dacompi_forum3;
GRANT ALL ON TABLE phpbb_extensions_seq TO dacompi;


--
-- Name: phpbb_forums_seq; Type: ACL; Schema: public; Owner: dacompi_forum3
--

REVOKE ALL ON TABLE phpbb_forums_seq FROM PUBLIC;
REVOKE ALL ON TABLE phpbb_forums_seq FROM dacompi_forum3;
GRANT ALL ON TABLE phpbb_forums_seq TO dacompi_forum3;
GRANT ALL ON TABLE phpbb_forums_seq TO dacompi;


--
-- Name: phpbb_groups_seq; Type: ACL; Schema: public; Owner: dacompi_forum3
--

REVOKE ALL ON TABLE phpbb_groups_seq FROM PUBLIC;
REVOKE ALL ON TABLE phpbb_groups_seq FROM dacompi_forum3;
GRANT ALL ON TABLE phpbb_groups_seq TO dacompi_forum3;
GRANT ALL ON TABLE phpbb_groups_seq TO dacompi;


--
-- Name: phpbb_icons_seq; Type: ACL; Schema: public; Owner: dacompi_forum3
--

REVOKE ALL ON TABLE phpbb_icons_seq FROM PUBLIC;
REVOKE ALL ON TABLE phpbb_icons_seq FROM dacompi_forum3;
GRANT ALL ON TABLE phpbb_icons_seq TO dacompi_forum3;
GRANT ALL ON TABLE phpbb_icons_seq TO dacompi;


--
-- Name: phpbb_lang_seq; Type: ACL; Schema: public; Owner: dacompi_forum3
--

REVOKE ALL ON TABLE phpbb_lang_seq FROM PUBLIC;
REVOKE ALL ON TABLE phpbb_lang_seq FROM dacompi_forum3;
GRANT ALL ON TABLE phpbb_lang_seq TO dacompi_forum3;
GRANT ALL ON TABLE phpbb_lang_seq TO dacompi;


--
-- Name: phpbb_log_seq; Type: ACL; Schema: public; Owner: dacompi_forum3
--

REVOKE ALL ON TABLE phpbb_log_seq FROM PUBLIC;
REVOKE ALL ON TABLE phpbb_log_seq FROM dacompi_forum3;
GRANT ALL ON TABLE phpbb_log_seq TO dacompi_forum3;
GRANT ALL ON TABLE phpbb_log_seq TO dacompi;


--
-- Name: phpbb_modules_seq; Type: ACL; Schema: public; Owner: dacompi_forum3
--

REVOKE ALL ON TABLE phpbb_modules_seq FROM PUBLIC;
REVOKE ALL ON TABLE phpbb_modules_seq FROM dacompi_forum3;
GRANT ALL ON TABLE phpbb_modules_seq TO dacompi_forum3;
GRANT ALL ON TABLE phpbb_modules_seq TO dacompi;


--
-- Name: phpbb_posts_seq; Type: ACL; Schema: public; Owner: dacompi_forum3
--

REVOKE ALL ON TABLE phpbb_posts_seq FROM PUBLIC;
REVOKE ALL ON TABLE phpbb_posts_seq FROM dacompi_forum3;
GRANT ALL ON TABLE phpbb_posts_seq TO dacompi_forum3;
GRANT ALL ON TABLE phpbb_posts_seq TO dacompi;


--
-- Name: phpbb_privmsgs_folder_seq; Type: ACL; Schema: public; Owner: dacompi_forum3
--

REVOKE ALL ON TABLE phpbb_privmsgs_folder_seq FROM PUBLIC;
REVOKE ALL ON TABLE phpbb_privmsgs_folder_seq FROM dacompi_forum3;
GRANT ALL ON TABLE phpbb_privmsgs_folder_seq TO dacompi_forum3;
GRANT ALL ON TABLE phpbb_privmsgs_folder_seq TO dacompi;


--
-- Name: phpbb_privmsgs_rules_seq; Type: ACL; Schema: public; Owner: dacompi_forum3
--

REVOKE ALL ON TABLE phpbb_privmsgs_rules_seq FROM PUBLIC;
REVOKE ALL ON TABLE phpbb_privmsgs_rules_seq FROM dacompi_forum3;
GRANT ALL ON TABLE phpbb_privmsgs_rules_seq TO dacompi_forum3;
GRANT ALL ON TABLE phpbb_privmsgs_rules_seq TO dacompi;


--
-- Name: phpbb_privmsgs_seq; Type: ACL; Schema: public; Owner: dacompi_forum3
--

REVOKE ALL ON TABLE phpbb_privmsgs_seq FROM PUBLIC;
REVOKE ALL ON TABLE phpbb_privmsgs_seq FROM dacompi_forum3;
GRANT ALL ON TABLE phpbb_privmsgs_seq TO dacompi_forum3;
GRANT ALL ON TABLE phpbb_privmsgs_seq TO dacompi;


--
-- Name: phpbb_profile_fields_seq; Type: ACL; Schema: public; Owner: dacompi_forum3
--

REVOKE ALL ON TABLE phpbb_profile_fields_seq FROM PUBLIC;
REVOKE ALL ON TABLE phpbb_profile_fields_seq FROM dacompi_forum3;
GRANT ALL ON TABLE phpbb_profile_fields_seq TO dacompi_forum3;
GRANT ALL ON TABLE phpbb_profile_fields_seq TO dacompi;


--
-- Name: phpbb_ranks_seq; Type: ACL; Schema: public; Owner: dacompi_forum3
--

REVOKE ALL ON TABLE phpbb_ranks_seq FROM PUBLIC;
REVOKE ALL ON TABLE phpbb_ranks_seq FROM dacompi_forum3;
GRANT ALL ON TABLE phpbb_ranks_seq TO dacompi_forum3;
GRANT ALL ON TABLE phpbb_ranks_seq TO dacompi;


--
-- Name: phpbb_reports_reasons_seq; Type: ACL; Schema: public; Owner: dacompi_forum3
--

REVOKE ALL ON TABLE phpbb_reports_reasons_seq FROM PUBLIC;
REVOKE ALL ON TABLE phpbb_reports_reasons_seq FROM dacompi_forum3;
GRANT ALL ON TABLE phpbb_reports_reasons_seq TO dacompi_forum3;
GRANT ALL ON TABLE phpbb_reports_reasons_seq TO dacompi;


--
-- Name: phpbb_reports_seq; Type: ACL; Schema: public; Owner: dacompi_forum3
--

REVOKE ALL ON TABLE phpbb_reports_seq FROM PUBLIC;
REVOKE ALL ON TABLE phpbb_reports_seq FROM dacompi_forum3;
GRANT ALL ON TABLE phpbb_reports_seq TO dacompi_forum3;
GRANT ALL ON TABLE phpbb_reports_seq TO dacompi;


--
-- Name: phpbb_search_wordlist_seq; Type: ACL; Schema: public; Owner: dacompi_forum3
--

REVOKE ALL ON TABLE phpbb_search_wordlist_seq FROM PUBLIC;
REVOKE ALL ON TABLE phpbb_search_wordlist_seq FROM dacompi_forum3;
GRANT ALL ON TABLE phpbb_search_wordlist_seq TO dacompi_forum3;
GRANT ALL ON TABLE phpbb_search_wordlist_seq TO dacompi;


--
-- Name: phpbb_sitelist_seq; Type: ACL; Schema: public; Owner: dacompi_forum3
--

REVOKE ALL ON TABLE phpbb_sitelist_seq FROM PUBLIC;
REVOKE ALL ON TABLE phpbb_sitelist_seq FROM dacompi_forum3;
GRANT ALL ON TABLE phpbb_sitelist_seq TO dacompi_forum3;
GRANT ALL ON TABLE phpbb_sitelist_seq TO dacompi;


--
-- Name: phpbb_smilies_seq; Type: ACL; Schema: public; Owner: dacompi_forum3
--

REVOKE ALL ON TABLE phpbb_smilies_seq FROM PUBLIC;
REVOKE ALL ON TABLE phpbb_smilies_seq FROM dacompi_forum3;
GRANT ALL ON TABLE phpbb_smilies_seq TO dacompi_forum3;
GRANT ALL ON TABLE phpbb_smilies_seq TO dacompi;


--
-- Name: phpbb_styles_imageset_data_seq; Type: ACL; Schema: public; Owner: dacompi_forum3
--

REVOKE ALL ON TABLE phpbb_styles_imageset_data_seq FROM PUBLIC;
REVOKE ALL ON TABLE phpbb_styles_imageset_data_seq FROM dacompi_forum3;
GRANT ALL ON TABLE phpbb_styles_imageset_data_seq TO dacompi_forum3;
GRANT ALL ON TABLE phpbb_styles_imageset_data_seq TO dacompi;


--
-- Name: phpbb_styles_imageset_seq; Type: ACL; Schema: public; Owner: dacompi_forum3
--

REVOKE ALL ON TABLE phpbb_styles_imageset_seq FROM PUBLIC;
REVOKE ALL ON TABLE phpbb_styles_imageset_seq FROM dacompi_forum3;
GRANT ALL ON TABLE phpbb_styles_imageset_seq TO dacompi_forum3;
GRANT ALL ON TABLE phpbb_styles_imageset_seq TO dacompi;


--
-- Name: phpbb_styles_seq; Type: ACL; Schema: public; Owner: dacompi_forum3
--

REVOKE ALL ON TABLE phpbb_styles_seq FROM PUBLIC;
REVOKE ALL ON TABLE phpbb_styles_seq FROM dacompi_forum3;
GRANT ALL ON TABLE phpbb_styles_seq TO dacompi_forum3;
GRANT ALL ON TABLE phpbb_styles_seq TO dacompi;


--
-- Name: phpbb_styles_template_seq; Type: ACL; Schema: public; Owner: dacompi_forum3
--

REVOKE ALL ON TABLE phpbb_styles_template_seq FROM PUBLIC;
REVOKE ALL ON TABLE phpbb_styles_template_seq FROM dacompi_forum3;
GRANT ALL ON TABLE phpbb_styles_template_seq TO dacompi_forum3;
GRANT ALL ON TABLE phpbb_styles_template_seq TO dacompi;


--
-- Name: phpbb_styles_theme_seq; Type: ACL; Schema: public; Owner: dacompi_forum3
--

REVOKE ALL ON TABLE phpbb_styles_theme_seq FROM PUBLIC;
REVOKE ALL ON TABLE phpbb_styles_theme_seq FROM dacompi_forum3;
GRANT ALL ON TABLE phpbb_styles_theme_seq TO dacompi_forum3;
GRANT ALL ON TABLE phpbb_styles_theme_seq TO dacompi;


--
-- Name: phpbb_topics_seq; Type: ACL; Schema: public; Owner: dacompi_forum3
--

REVOKE ALL ON TABLE phpbb_topics_seq FROM PUBLIC;
REVOKE ALL ON TABLE phpbb_topics_seq FROM dacompi_forum3;
GRANT ALL ON TABLE phpbb_topics_seq TO dacompi_forum3;
GRANT ALL ON TABLE phpbb_topics_seq TO dacompi;


--
-- Name: phpbb_users_seq; Type: ACL; Schema: public; Owner: dacompi_forum3
--

REVOKE ALL ON TABLE phpbb_users_seq FROM PUBLIC;
REVOKE ALL ON TABLE phpbb_users_seq FROM dacompi_forum3;
GRANT ALL ON TABLE phpbb_users_seq TO dacompi_forum3;
GRANT ALL ON TABLE phpbb_users_seq TO dacompi;


--
-- Name: phpbb_warnings_seq; Type: ACL; Schema: public; Owner: dacompi_forum3
--

REVOKE ALL ON TABLE phpbb_warnings_seq FROM PUBLIC;
REVOKE ALL ON TABLE phpbb_warnings_seq FROM dacompi_forum3;
GRANT ALL ON TABLE phpbb_warnings_seq TO dacompi_forum3;
GRANT ALL ON TABLE phpbb_warnings_seq TO dacompi;


--
-- Name: phpbb_words_seq; Type: ACL; Schema: public; Owner: dacompi_forum3
--

REVOKE ALL ON TABLE phpbb_words_seq FROM PUBLIC;
REVOKE ALL ON TABLE phpbb_words_seq FROM dacompi_forum3;
GRANT ALL ON TABLE phpbb_words_seq TO dacompi_forum3;
GRANT ALL ON TABLE phpbb_words_seq TO dacompi;


--
-- Name: professores; Type: ACL; Schema: public; Owner: dacompi_forum3
--

REVOKE ALL ON TABLE professores FROM PUBLIC;
REVOKE ALL ON TABLE professores FROM dacompi_forum3;
GRANT ALL ON TABLE professores TO dacompi_forum3;
GRANT ALL ON TABLE professores TO dacompi;


--
-- Name: professores_id_seq; Type: ACL; Schema: public; Owner: dacompi_forum3
--

REVOKE ALL ON TABLE professores_id_seq FROM PUBLIC;
REVOKE ALL ON TABLE professores_id_seq FROM dacompi_forum3;
GRANT ALL ON TABLE professores_id_seq TO dacompi_forum3;
GRANT ALL ON TABLE professores_id_seq TO dacompi;


--
-- Name: profs_discs; Type: ACL; Schema: public; Owner: dacompi_forum3
--

REVOKE ALL ON TABLE profs_discs FROM PUBLIC;
REVOKE ALL ON TABLE profs_discs FROM dacompi_forum3;
GRANT ALL ON TABLE profs_discs TO dacompi_forum3;
GRANT ALL ON TABLE profs_discs TO dacompi;


--
-- Name: profs_discs_id_seq; Type: ACL; Schema: public; Owner: dacompi_forum3
--

REVOKE ALL ON TABLE profs_discs_id_seq FROM PUBLIC;
REVOKE ALL ON TABLE profs_discs_id_seq FROM dacompi_forum3;
GRANT ALL ON TABLE profs_discs_id_seq TO dacompi_forum3;
GRANT ALL ON TABLE profs_discs_id_seq TO dacompi;


--
-- PostgreSQL database dump complete
--

