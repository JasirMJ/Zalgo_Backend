--
-- PostgreSQL database dump
--

-- Dumped from database version 11.13
-- Dumped by pg_dump version 11.13

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

SET default_with_oids = false;

--
-- Name: BannerApp_banner; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."BannerApp_banner" (
    id bigint NOT NULL,
    name character varying(255) NOT NULL,
    description text,
    file character varying(100),
    url text,
    is_active boolean NOT NULL,
    is_broker_image boolean NOT NULL,
    type character varying(255),
    is_internal boolean NOT NULL,
    product_id bigint
);


ALTER TABLE public."BannerApp_banner" OWNER TO postgres;

--
-- Name: BannerApp_banner_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public."BannerApp_banner_id_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public."BannerApp_banner_id_seq" OWNER TO postgres;

--
-- Name: BannerApp_banner_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public."BannerApp_banner_id_seq" OWNED BY public."BannerApp_banner".id;


--
-- Name: CountryApp_country; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."CountryApp_country" (
    id bigint NOT NULL,
    name character varying(50) NOT NULL,
    file character varying(100) NOT NULL,
    country_code character varying(5) NOT NULL,
    is_active boolean NOT NULL
);


ALTER TABLE public."CountryApp_country" OWNER TO postgres;

--
-- Name: CountryApp_country_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public."CountryApp_country_id_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public."CountryApp_country_id_seq" OWNER TO postgres;

--
-- Name: CountryApp_country_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public."CountryApp_country_id_seq" OWNED BY public."CountryApp_country".id;


--
-- Name: CourseApp_course; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."CourseApp_course" (
    id bigint NOT NULL,
    name character varying(50) NOT NULL,
    course_duration character varying(50),
    file character varying(100) NOT NULL,
    description text,
    priority integer,
    is_active boolean NOT NULL
);


ALTER TABLE public."CourseApp_course" OWNER TO postgres;

--
-- Name: CourseApp_course_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public."CourseApp_course_id_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public."CourseApp_course_id_seq" OWNER TO postgres;

--
-- Name: CourseApp_course_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public."CourseApp_course_id_seq" OWNED BY public."CourseApp_course".id;


--
-- Name: CourseApp_course_lessons; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."CourseApp_course_lessons" (
    id integer NOT NULL,
    course_id bigint NOT NULL,
    lesson_id bigint NOT NULL
);


ALTER TABLE public."CourseApp_course_lessons" OWNER TO postgres;

--
-- Name: CourseApp_course_lessons_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public."CourseApp_course_lessons_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public."CourseApp_course_lessons_id_seq" OWNER TO postgres;

--
-- Name: CourseApp_course_lessons_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public."CourseApp_course_lessons_id_seq" OWNED BY public."CourseApp_course_lessons".id;


--
-- Name: LessonApp_lesson; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."LessonApp_lesson" (
    id bigint NOT NULL,
    name character varying(50) NOT NULL,
    description text,
    priority integer,
    is_active boolean NOT NULL
);


ALTER TABLE public."LessonApp_lesson" OWNER TO postgres;

--
-- Name: LessonApp_lesson_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public."LessonApp_lesson_id_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public."LessonApp_lesson_id_seq" OWNER TO postgres;

--
-- Name: LessonApp_lesson_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public."LessonApp_lesson_id_seq" OWNED BY public."LessonApp_lesson".id;


--
-- Name: LessonApp_lesson_topic; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."LessonApp_lesson_topic" (
    id integer NOT NULL,
    lesson_id bigint NOT NULL,
    topic_id bigint NOT NULL
);


ALTER TABLE public."LessonApp_lesson_topic" OWNER TO postgres;

--
-- Name: LessonApp_lesson_topic_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public."LessonApp_lesson_topic_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public."LessonApp_lesson_topic_id_seq" OWNER TO postgres;

--
-- Name: LessonApp_lesson_topic_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public."LessonApp_lesson_topic_id_seq" OWNED BY public."LessonApp_lesson_topic".id;


--
-- Name: NotificationApp_notification; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."NotificationApp_notification" (
    id bigint NOT NULL,
    name character varying(255) NOT NULL,
    description text,
    file character varying(100),
    url text,
    is_active boolean NOT NULL,
    created_at timestamp with time zone NOT NULL,
    updated_at timestamp with time zone NOT NULL
);


ALTER TABLE public."NotificationApp_notification" OWNER TO postgres;

--
-- Name: NotificationApp_notification_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public."NotificationApp_notification_id_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public."NotificationApp_notification_id_seq" OWNER TO postgres;

--
-- Name: NotificationApp_notification_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public."NotificationApp_notification_id_seq" OWNED BY public."NotificationApp_notification".id;


--
-- Name: NotificationApp_usernotificationstatus; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."NotificationApp_usernotificationstatus" (
    id bigint NOT NULL,
    read boolean NOT NULL,
    notification_id bigint NOT NULL,
    user_id bigint NOT NULL
);


ALTER TABLE public."NotificationApp_usernotificationstatus" OWNER TO postgres;

--
-- Name: NotificationApp_usernotificationstatus_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public."NotificationApp_usernotificationstatus_id_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public."NotificationApp_usernotificationstatus_id_seq" OWNER TO postgres;

--
-- Name: NotificationApp_usernotificationstatus_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public."NotificationApp_usernotificationstatus_id_seq" OWNED BY public."NotificationApp_usernotificationstatus".id;


--
-- Name: PartnersApp_partners; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."PartnersApp_partners" (
    id bigint NOT NULL,
    created_at timestamp with time zone NOT NULL,
    updated_at timestamp with time zone NOT NULL,
    file character varying(100),
    description character varying(255),
    user_id bigint,
    name character varying(255) NOT NULL,
    available_at character varying(20),
    phone character varying(20) NOT NULL,
    vip_rank character varying(20)
);


ALTER TABLE public."PartnersApp_partners" OWNER TO postgres;

--
-- Name: PartnersApp_partners_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public."PartnersApp_partners_id_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public."PartnersApp_partners_id_seq" OWNER TO postgres;

--
-- Name: PartnersApp_partners_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public."PartnersApp_partners_id_seq" OWNED BY public."PartnersApp_partners".id;


--
-- Name: ProductApp_product; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."ProductApp_product" (
    id bigint NOT NULL,
    name character varying(255) NOT NULL,
    price character varying(255),
    description text NOT NULL,
    terms_and_condition character varying(255),
    file character varying(100),
    created_at timestamp with time zone NOT NULL,
    updated_at timestamp with time zone NOT NULL,
    is_product boolean NOT NULL,
    is_service boolean NOT NULL,
    is_free_trail boolean NOT NULL
);


ALTER TABLE public."ProductApp_product" OWNER TO postgres;

--
-- Name: ProductApp_product_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public."ProductApp_product_id_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public."ProductApp_product_id_seq" OWNER TO postgres;

--
-- Name: ProductApp_product_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public."ProductApp_product_id_seq" OWNED BY public."ProductApp_product".id;


--
-- Name: ProductApp_product_sub_product; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."ProductApp_product_sub_product" (
    id integer NOT NULL,
    product_id bigint NOT NULL,
    subproduct_id bigint NOT NULL
);


ALTER TABLE public."ProductApp_product_sub_product" OWNER TO postgres;

--
-- Name: ProductApp_product_sub_product_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public."ProductApp_product_sub_product_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public."ProductApp_product_sub_product_id_seq" OWNER TO postgres;

--
-- Name: ProductApp_product_sub_product_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public."ProductApp_product_sub_product_id_seq" OWNED BY public."ProductApp_product_sub_product".id;


--
-- Name: ProductApp_subproduct; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."ProductApp_subproduct" (
    id bigint NOT NULL,
    name character varying(255) NOT NULL,
    file character varying(100),
    price character varying(255),
    description text NOT NULL
);


ALTER TABLE public."ProductApp_subproduct" OWNER TO postgres;

--
-- Name: ProductApp_subproduct_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public."ProductApp_subproduct_id_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public."ProductApp_subproduct_id_seq" OWNER TO postgres;

--
-- Name: ProductApp_subproduct_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public."ProductApp_subproduct_id_seq" OWNED BY public."ProductApp_subproduct".id;


--
-- Name: RequestsApp_requestmodel; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."RequestsApp_requestmodel" (
    id bigint NOT NULL,
    name character varying(255) NOT NULL,
    created_at timestamp with time zone NOT NULL,
    updated_at timestamp with time zone NOT NULL,
    user_id bigint NOT NULL,
    account_number character varying(255),
    broker character varying(255),
    customer_name character varying(255),
    is_free_trail boolean NOT NULL,
    is_paid boolean NOT NULL,
    password character varying(255),
    phone_number character varying(255),
    request_by character varying(255) NOT NULL,
    server character varying(255),
    amount character varying(20),
    payment_status character varying(20)
);


ALTER TABLE public."RequestsApp_requestmodel" OWNER TO postgres;

--
-- Name: RequestsApp_requestmodel_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public."RequestsApp_requestmodel_id_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public."RequestsApp_requestmodel_id_seq" OWNER TO postgres;

--
-- Name: RequestsApp_requestmodel_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public."RequestsApp_requestmodel_id_seq" OWNED BY public."RequestsApp_requestmodel".id;


--
-- Name: SettingsApp_settingsmodel; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."SettingsApp_settingsmodel" (
    id bigint NOT NULL,
    field_name character varying(255) NOT NULL,
    value character varying(300) NOT NULL,
    description character varying(255),
    data_type text NOT NULL,
    is_active boolean NOT NULL
);


ALTER TABLE public."SettingsApp_settingsmodel" OWNER TO postgres;

--
-- Name: SettingsApp_settingsmodel_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public."SettingsApp_settingsmodel_id_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public."SettingsApp_settingsmodel_id_seq" OWNER TO postgres;

--
-- Name: SettingsApp_settingsmodel_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public."SettingsApp_settingsmodel_id_seq" OWNED BY public."SettingsApp_settingsmodel".id;


--
-- Name: SubscriptionApp_subscription; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."SubscriptionApp_subscription" (
    id bigint NOT NULL,
    name character varying(50) NOT NULL,
    created_at timestamp with time zone NOT NULL,
    updated_at timestamp with time zone NOT NULL,
    subscribed_date date,
    subscription_end_date date,
    user_id bigint NOT NULL,
    product_id bigint,
    is_free_trail boolean NOT NULL
);


ALTER TABLE public."SubscriptionApp_subscription" OWNER TO postgres;

--
-- Name: SubscriptionApp_subscription_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public."SubscriptionApp_subscription_id_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public."SubscriptionApp_subscription_id_seq" OWNER TO postgres;

--
-- Name: SubscriptionApp_subscription_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public."SubscriptionApp_subscription_id_seq" OWNED BY public."SubscriptionApp_subscription".id;


--
-- Name: TopicApp_topic; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."TopicApp_topic" (
    id bigint NOT NULL,
    name character varying(50) NOT NULL,
    duration character varying(50),
    file character varying(100) NOT NULL,
    description text,
    url text,
    priority integer,
    is_active boolean NOT NULL
);


ALTER TABLE public."TopicApp_topic" OWNER TO postgres;

--
-- Name: TopicApp_topic_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public."TopicApp_topic_id_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public."TopicApp_topic_id_seq" OWNER TO postgres;

--
-- Name: TopicApp_topic_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public."TopicApp_topic_id_seq" OWNED BY public."TopicApp_topic".id;


--
-- Name: TransactionApp_transaction; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."TransactionApp_transaction" (
    id bigint NOT NULL,
    transaction_id character varying(50) NOT NULL,
    created_at timestamp with time zone NOT NULL,
    updated_at timestamp with time zone NOT NULL,
    description character varying(255),
    amount_in double precision,
    amount_out double precision,
    user_id bigint NOT NULL,
    product_id bigint,
    product_name character varying(25),
    status character varying(20),
    username character varying(25)
);


ALTER TABLE public."TransactionApp_transaction" OWNER TO postgres;

--
-- Name: TransactionApp_transaction_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public."TransactionApp_transaction_id_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public."TransactionApp_transaction_id_seq" OWNER TO postgres;

--
-- Name: TransactionApp_transaction_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public."TransactionApp_transaction_id_seq" OWNED BY public."TransactionApp_transaction".id;


--
-- Name: UserApp_userdetails; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."UserApp_userdetails" (
    id bigint NOT NULL,
    password character varying(128) NOT NULL,
    last_login timestamp with time zone,
    is_superuser boolean NOT NULL,
    username character varying(150) NOT NULL,
    first_name character varying(150) NOT NULL,
    last_name character varying(150) NOT NULL,
    email character varying(254) NOT NULL,
    is_staff boolean NOT NULL,
    is_active boolean NOT NULL,
    date_joined timestamp with time zone NOT NULL,
    mobile character varying(20) NOT NULL,
    referal_code character varying(12),
    referal_user character varying(50),
    referal_code_used character varying(12),
    referred_count integer NOT NULL,
    file character varying(100),
    pan_card_details character varying(255),
    bankaccount_details character varying(255),
    vip_rank character varying(10),
    wallet_balance character varying(50),
    wallet_credited character varying(50),
    wallet_withdraw character varying(50),
    player_id character varying(200),
    is_blocked boolean NOT NULL,
    is_deleted boolean NOT NULL,
    is_partner boolean NOT NULL,
    "bankaccount_IFSC" character varying(255),
    date_of_birth date,
    bankaccount_name character varying(255),
    commission character varying(10),
    grade_name character varying(10),
    is_account_holder boolean NOT NULL
);


ALTER TABLE public."UserApp_userdetails" OWNER TO postgres;

--
-- Name: UserApp_userdetails_groups; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."UserApp_userdetails_groups" (
    id integer NOT NULL,
    userdetails_id bigint NOT NULL,
    group_id integer NOT NULL
);


ALTER TABLE public."UserApp_userdetails_groups" OWNER TO postgres;

--
-- Name: UserApp_userdetails_groups_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public."UserApp_userdetails_groups_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public."UserApp_userdetails_groups_id_seq" OWNER TO postgres;

--
-- Name: UserApp_userdetails_groups_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public."UserApp_userdetails_groups_id_seq" OWNED BY public."UserApp_userdetails_groups".id;


--
-- Name: UserApp_userdetails_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public."UserApp_userdetails_id_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public."UserApp_userdetails_id_seq" OWNER TO postgres;

--
-- Name: UserApp_userdetails_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public."UserApp_userdetails_id_seq" OWNED BY public."UserApp_userdetails".id;


--
-- Name: UserApp_userdetails_user_permissions; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."UserApp_userdetails_user_permissions" (
    id integer NOT NULL,
    userdetails_id bigint NOT NULL,
    permission_id integer NOT NULL
);


ALTER TABLE public."UserApp_userdetails_user_permissions" OWNER TO postgres;

--
-- Name: UserApp_userdetails_user_permissions_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public."UserApp_userdetails_user_permissions_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public."UserApp_userdetails_user_permissions_id_seq" OWNER TO postgres;

--
-- Name: UserApp_userdetails_user_permissions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public."UserApp_userdetails_user_permissions_id_seq" OWNED BY public."UserApp_userdetails_user_permissions".id;


--
-- Name: ZalgoAccountApp_zalgoaccount; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."ZalgoAccountApp_zalgoaccount" (
    id bigint NOT NULL,
    first_name character varying(50) NOT NULL,
    last_name character varying(50) NOT NULL,
    email character varying(50) NOT NULL,
    mobile character varying(20) NOT NULL,
    gender character varying(10) NOT NULL,
    dob date NOT NULL,
    national_id character varying(50) NOT NULL,
    pancard character varying(50) NOT NULL,
    house_name text NOT NULL,
    street_name character varying(50) NOT NULL,
    pincode character varying(10) NOT NULL,
    city character varying(50) NOT NULL,
    user_id bigint NOT NULL,
    national_id_back character varying(100),
    national_id_front character varying(100),
    pancard_back character varying(100),
    pancard_front character varying(100)
);


ALTER TABLE public."ZalgoAccountApp_zalgoaccount" OWNER TO postgres;

--
-- Name: ZalgoAccountApp_zalgoaccount_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public."ZalgoAccountApp_zalgoaccount_id_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public."ZalgoAccountApp_zalgoaccount_id_seq" OWNER TO postgres;

--
-- Name: ZalgoAccountApp_zalgoaccount_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public."ZalgoAccountApp_zalgoaccount_id_seq" OWNED BY public."ZalgoAccountApp_zalgoaccount".id;


--
-- Name: auth_group; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.auth_group (
    id integer NOT NULL,
    name character varying(150) NOT NULL
);


ALTER TABLE public.auth_group OWNER TO postgres;

--
-- Name: auth_group_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.auth_group_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_group_id_seq OWNER TO postgres;

--
-- Name: auth_group_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.auth_group_id_seq OWNED BY public.auth_group.id;


--
-- Name: auth_group_permissions; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.auth_group_permissions (
    id integer NOT NULL,
    group_id integer NOT NULL,
    permission_id integer NOT NULL
);


ALTER TABLE public.auth_group_permissions OWNER TO postgres;

--
-- Name: auth_group_permissions_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.auth_group_permissions_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_group_permissions_id_seq OWNER TO postgres;

--
-- Name: auth_group_permissions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.auth_group_permissions_id_seq OWNED BY public.auth_group_permissions.id;


--
-- Name: auth_permission; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.auth_permission (
    id integer NOT NULL,
    name character varying(255) NOT NULL,
    content_type_id integer NOT NULL,
    codename character varying(100) NOT NULL
);


ALTER TABLE public.auth_permission OWNER TO postgres;

--
-- Name: auth_permission_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.auth_permission_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_permission_id_seq OWNER TO postgres;

--
-- Name: auth_permission_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.auth_permission_id_seq OWNED BY public.auth_permission.id;


--
-- Name: authtoken_token; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.authtoken_token (
    key character varying(40) NOT NULL,
    created timestamp with time zone NOT NULL,
    user_id bigint NOT NULL
);


ALTER TABLE public.authtoken_token OWNER TO postgres;

--
-- Name: django_admin_log; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.django_admin_log (
    id integer NOT NULL,
    action_time timestamp with time zone NOT NULL,
    object_id text,
    object_repr character varying(200) NOT NULL,
    action_flag smallint NOT NULL,
    change_message text NOT NULL,
    content_type_id integer,
    user_id bigint NOT NULL,
    CONSTRAINT django_admin_log_action_flag_check CHECK ((action_flag >= 0))
);


ALTER TABLE public.django_admin_log OWNER TO postgres;

--
-- Name: django_admin_log_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.django_admin_log_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.django_admin_log_id_seq OWNER TO postgres;

--
-- Name: django_admin_log_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.django_admin_log_id_seq OWNED BY public.django_admin_log.id;


--
-- Name: django_content_type; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.django_content_type (
    id integer NOT NULL,
    app_label character varying(100) NOT NULL,
    model character varying(100) NOT NULL
);


ALTER TABLE public.django_content_type OWNER TO postgres;

--
-- Name: django_content_type_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.django_content_type_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.django_content_type_id_seq OWNER TO postgres;

--
-- Name: django_content_type_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.django_content_type_id_seq OWNED BY public.django_content_type.id;


--
-- Name: django_migrations; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.django_migrations (
    id integer NOT NULL,
    app character varying(255) NOT NULL,
    name character varying(255) NOT NULL,
    applied timestamp with time zone NOT NULL
);


ALTER TABLE public.django_migrations OWNER TO postgres;

--
-- Name: django_migrations_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.django_migrations_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.django_migrations_id_seq OWNER TO postgres;

--
-- Name: django_migrations_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.django_migrations_id_seq OWNED BY public.django_migrations.id;


--
-- Name: django_session; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.django_session (
    session_key character varying(40) NOT NULL,
    session_data text NOT NULL,
    expire_date timestamp with time zone NOT NULL
);


ALTER TABLE public.django_session OWNER TO postgres;

--
-- Name: BannerApp_banner id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."BannerApp_banner" ALTER COLUMN id SET DEFAULT nextval('public."BannerApp_banner_id_seq"'::regclass);


--
-- Name: CountryApp_country id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."CountryApp_country" ALTER COLUMN id SET DEFAULT nextval('public."CountryApp_country_id_seq"'::regclass);


--
-- Name: CourseApp_course id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."CourseApp_course" ALTER COLUMN id SET DEFAULT nextval('public."CourseApp_course_id_seq"'::regclass);


--
-- Name: CourseApp_course_lessons id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."CourseApp_course_lessons" ALTER COLUMN id SET DEFAULT nextval('public."CourseApp_course_lessons_id_seq"'::regclass);


--
-- Name: LessonApp_lesson id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."LessonApp_lesson" ALTER COLUMN id SET DEFAULT nextval('public."LessonApp_lesson_id_seq"'::regclass);


--
-- Name: LessonApp_lesson_topic id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."LessonApp_lesson_topic" ALTER COLUMN id SET DEFAULT nextval('public."LessonApp_lesson_topic_id_seq"'::regclass);


--
-- Name: NotificationApp_notification id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."NotificationApp_notification" ALTER COLUMN id SET DEFAULT nextval('public."NotificationApp_notification_id_seq"'::regclass);


--
-- Name: NotificationApp_usernotificationstatus id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."NotificationApp_usernotificationstatus" ALTER COLUMN id SET DEFAULT nextval('public."NotificationApp_usernotificationstatus_id_seq"'::regclass);


--
-- Name: PartnersApp_partners id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."PartnersApp_partners" ALTER COLUMN id SET DEFAULT nextval('public."PartnersApp_partners_id_seq"'::regclass);


--
-- Name: ProductApp_product id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."ProductApp_product" ALTER COLUMN id SET DEFAULT nextval('public."ProductApp_product_id_seq"'::regclass);


--
-- Name: ProductApp_product_sub_product id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."ProductApp_product_sub_product" ALTER COLUMN id SET DEFAULT nextval('public."ProductApp_product_sub_product_id_seq"'::regclass);


--
-- Name: ProductApp_subproduct id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."ProductApp_subproduct" ALTER COLUMN id SET DEFAULT nextval('public."ProductApp_subproduct_id_seq"'::regclass);


--
-- Name: RequestsApp_requestmodel id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."RequestsApp_requestmodel" ALTER COLUMN id SET DEFAULT nextval('public."RequestsApp_requestmodel_id_seq"'::regclass);


--
-- Name: SettingsApp_settingsmodel id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."SettingsApp_settingsmodel" ALTER COLUMN id SET DEFAULT nextval('public."SettingsApp_settingsmodel_id_seq"'::regclass);


--
-- Name: SubscriptionApp_subscription id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."SubscriptionApp_subscription" ALTER COLUMN id SET DEFAULT nextval('public."SubscriptionApp_subscription_id_seq"'::regclass);


--
-- Name: TopicApp_topic id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."TopicApp_topic" ALTER COLUMN id SET DEFAULT nextval('public."TopicApp_topic_id_seq"'::regclass);


--
-- Name: TransactionApp_transaction id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."TransactionApp_transaction" ALTER COLUMN id SET DEFAULT nextval('public."TransactionApp_transaction_id_seq"'::regclass);


--
-- Name: UserApp_userdetails id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."UserApp_userdetails" ALTER COLUMN id SET DEFAULT nextval('public."UserApp_userdetails_id_seq"'::regclass);


--
-- Name: UserApp_userdetails_groups id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."UserApp_userdetails_groups" ALTER COLUMN id SET DEFAULT nextval('public."UserApp_userdetails_groups_id_seq"'::regclass);


--
-- Name: UserApp_userdetails_user_permissions id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."UserApp_userdetails_user_permissions" ALTER COLUMN id SET DEFAULT nextval('public."UserApp_userdetails_user_permissions_id_seq"'::regclass);


--
-- Name: ZalgoAccountApp_zalgoaccount id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."ZalgoAccountApp_zalgoaccount" ALTER COLUMN id SET DEFAULT nextval('public."ZalgoAccountApp_zalgoaccount_id_seq"'::regclass);


--
-- Name: auth_group id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_group ALTER COLUMN id SET DEFAULT nextval('public.auth_group_id_seq'::regclass);


--
-- Name: auth_group_permissions id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_group_permissions ALTER COLUMN id SET DEFAULT nextval('public.auth_group_permissions_id_seq'::regclass);


--
-- Name: auth_permission id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_permission ALTER COLUMN id SET DEFAULT nextval('public.auth_permission_id_seq'::regclass);


--
-- Name: django_admin_log id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.django_admin_log ALTER COLUMN id SET DEFAULT nextval('public.django_admin_log_id_seq'::regclass);


--
-- Name: django_content_type id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.django_content_type ALTER COLUMN id SET DEFAULT nextval('public.django_content_type_id_seq'::regclass);


--
-- Name: django_migrations id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.django_migrations ALTER COLUMN id SET DEFAULT nextval('public.django_migrations_id_seq'::regclass);


--
-- Data for Name: BannerApp_banner; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."BannerApp_banner" (id, name, description, file, url, is_active, is_broker_image, type, is_internal, product_id) FROM stdin;
5	Learn Forex for Free	adsaasd asd asd asdas	stock-market-forex-online-trading-graph-smartphone-background-concept_73426-412.jpeg	www.google.com	t	f	hero	f	\N
3	fxtm	adsaasd asd asd asdas	banner-5-bg.jpeg	www.google.com	t	t	broker	f	\N
6	Become our Partner	\N	images_kdObMj1.jpeg	\N	t	f	\N	f	\N
7	Contact Us	\N	images_1.jpeg	\N	t	f	\N	f	\N
\.


--
-- Data for Name: CountryApp_country; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."CountryApp_country" (id, name, file, country_code, is_active) FROM stdin;
4	India	1200px-Flag_of_India.svg.png	91	t
5	Congo	congo.png	243	t
6	United Kingdom	1200px-Flag_of_the_United_Kingdom.svg.png	44	t
7	France	1200px-Flag_of_France.svg.png	33	t
10	Argentina	ar-flag.jpeg	54	t
\.


--
-- Data for Name: CourseApp_course; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."CourseApp_course" (id, name, course_duration, file, description, priority, is_active) FROM stdin;
2	Advanced	8 4.5hrs	adnav.png	Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam erat, sed diam voluptua. At vero eos et accusam et justo duo dolores et ea rebum. Stet clita kasd gubergren, no sea takimata sanctus est Lorem ipsum dolor sit amet. Lorem ipsum	\N	t
\.


--
-- Data for Name: CourseApp_course_lessons; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."CourseApp_course_lessons" (id, course_id, lesson_id) FROM stdin;
4	2	4
5	2	5
6	2	6
\.


--
-- Data for Name: LessonApp_lesson; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."LessonApp_lesson" (id, name, description, priority, is_active) FROM stdin;
2	c1 lesson 2	Basic trading seriese, to be come master	\N	t
4	c2 lesson 1	Basic trading seriese, to be come master	\N	t
5	c2 lesson 2	Basic trading seriese, to be come master	\N	t
6	hISTORY	hISTORY	\N	t
\.


--
-- Data for Name: LessonApp_lesson_topic; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."LessonApp_lesson_topic" (id, lesson_id, topic_id) FROM stdin;
5	2	5
6	2	6
9	6	7
\.


--
-- Data for Name: NotificationApp_notification; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."NotificationApp_notification" (id, name, description, file, url, is_active, created_at, updated_at) FROM stdin;
1	test Notification	adsaasd asd asd asdas		www.google.com	t	2021-10-23 19:57:05.053+00	2021-10-23 19:57:25.65+00
\.


--
-- Data for Name: NotificationApp_usernotificationstatus; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."NotificationApp_usernotificationstatus" (id, read, notification_id, user_id) FROM stdin;
\.


--
-- Data for Name: PartnersApp_partners; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."PartnersApp_partners" (id, created_at, updated_at, file, description, user_id, name, available_at, phone, vip_rank) FROM stdin;
1	2021-10-28 19:25:08.673566+00	2021-11-04 12:08:57.880422+00	download.jpeg	dsd	1	Salih	\N	14124124	\N
2	2021-10-28 19:25:45.933052+00	2021-11-06 20:30:20.419151+00	images.jpeg	dsd	2	Jasir	\N	14124124	vip 2
3	2021-11-07 08:38:14.618776+00	2021-11-07 08:38:14.6188+00		dsd	22	Aswin Raj	\N	+919656057080	vip 1
4	2021-11-20 16:16:13.183097+00	2021-11-20 16:16:13.183122+00		dsd	23	Aswin	\N	7012957683	vip 3
\.


--
-- Data for Name: ProductApp_product; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."ProductApp_product" (id, name, price, description, terms_and_condition, file, created_at, updated_at, is_product, is_service, is_free_trail) FROM stdin;
13	Direct Selling Softwares	349	purchase products		standa_VL8Avh7.png	2021-10-22 15:06:41.015+00	2021-11-04 18:00:50.919265+00	f	t	t
17	Ghost	699	15%-30% Return on Investment\nMinimum Deposit $5000/-\nMinimum Drawdown\nTrading pair: GBP/USD\n1 Month free VPS Service	*VPS is compulsory for automated robots VPS is not included in this product	ghos_lNytZXs.png	2021-11-04 19:14:41.49564+00	2021-11-04 19:14:57.971958+00	f	f	t
18	Ghost	699	15%-30% Return on Investment\nMinimum Deposit $5000/-\nMinimum Drawdown\nTrading pair: GBP/USD\n1 Month free VPS Service	*VPS is compulsory for automated robots VPS is not included in this product	ghos_tKeyE37.png	2021-11-04 19:25:48.553823+00	2021-11-04 19:25:48.553848+00	t	f	t
4	Phantom	499	15%-30% Return on Investment\nMinimum Deposit $1500/-\nSmart AI News Analysis\nTrading pair: GBP/USD\n1 Month free VPS Service	*VPS is compulsory for automated robots VPS is not included in this product	pro1_sHACJQF.png	2021-10-22 15:04:27.207+00	2021-11-04 17:04:22.505259+00	t	f	t
5	Cullinan	349	10%-20% Return on Investment\nMinimum Deposit $1000/-\nSmart Lot Management\nTrading pair: GBP/USD,\nEUR/USD, USD/CAD\n1 Month free VPS Service	*VPS is compulsory for automated robots VPS is not included in this product	cul.png	2021-10-22 15:04:36.838+00	2021-11-04 17:06:50.653147+00	t	f	t
14	Ghost	699	15%-30% Return on Investment\nMinimum Deposit $5000/-\nMinimum Drawdown\nTrading pair: GBP/USD\n1 Month free VPS Service	*VPS is compulsory for automated robots VPS is not included in this product	ghos.png	2021-11-04 17:08:18.475469+00	2021-11-04 17:08:33.027529+00	f	f	t
15	Ghost			\N		2021-11-04 17:09:22.834862+00	2021-11-04 17:09:22.834887+00	f	f	t
16	Ghost	555	fdf	dfdf	ghos_mR72H1R.png	2021-11-04 17:13:44.206532+00	2021-11-04 17:14:15.888176+00	f	f	t
6	VPS	349	Rent a VPS		vpp.png	2021-10-22 15:04:55.782+00	2021-11-04 17:37:47.567845+00	f	t	t
7	Build a Robot	349	Build Your Own Robot		build_wwzVlUv.png	2021-10-22 15:05:22.404+00	2021-11-04 17:48:06.940999+00	f	t	t
8	Web Development	349	Build responsive websites		web_Hk4U9CF.png	2021-10-22 15:05:32.02+00	2021-11-04 17:50:21.228563+00	f	t	t
9	Application Development	349	Multi-platform Android & iOS\nmobile apps		application.png	2021-10-22 15:05:42.812+00	2021-11-04 17:51:05.828949+00	f	t	t
10	UI/UX Design	349	Build Your Own Robot		uiux.png	2021-10-22 15:05:54.337+00	2021-11-04 17:52:05.438865+00	f	t	t
11	MT4/MT5 White Label	349	Build Your Own Robot		m4.png	2021-10-22 15:06:13.066+00	2021-11-04 17:53:48.769235+00	f	t	t
12	Digital Marketing	349	Social media marketing		digital.png	2021-10-22 15:06:23.526+00	2021-11-04 17:55:39.343673+00	f	t	t
\.


--
-- Data for Name: ProductApp_product_sub_product; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."ProductApp_product_sub_product" (id, product_id, subproduct_id) FROM stdin;
1	6	1
2	6	2
3	6	4
\.


--
-- Data for Name: ProductApp_subproduct; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."ProductApp_subproduct" (id, name, file, price, description) FROM stdin;
1	Regular	regular.png	20	2- Core CPU\n4 GB Ram\n40 GB SSD
2	Standard	standa.png	30	3- Core CPU\n4 GB Ram\n80 GB SSD
4	Pro	pro.png	50	4- Core CPU\n8 GB Ram\n80 GB SSD
\.


--
-- Data for Name: RequestsApp_requestmodel; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."RequestsApp_requestmodel" (id, name, created_at, updated_at, user_id, account_number, broker, customer_name, is_free_trail, is_paid, password, phone_number, request_by, server, amount, payment_status) FROM stdin;
1	Book Product Free Trail	2021-10-21 18:35:59.568+00	2021-10-21 18:42:01.348+00	1			jasir	f	f			admin		\N	\N
2	Book Product Free Trail	2021-10-21 18:42:10.947+00	2021-10-26 20:11:40.427412+00	1			amd	f	f			admin		\N	\N
3	IB Change Request	2021-10-21 18:42:13.754+00	2021-10-26 20:29:12.776845+00	3			Adsalihac	f	f			Adsalihac		\N	\N
5	Open Account Request	2021-10-26 20:38:49.691098+00	2021-10-26 20:38:49.691122+00	1			amd	f	f			admin		\N	\N
7	Deposit Request	2021-10-27 20:02:47.475872+00	2021-10-27 20:02:47.475899+00	3				f	f			Adsalihac		\N	\N
8	Buy Product	2021-10-27 20:05:09.766366+00	2021-10-27 20:05:09.766391+00	3	Ufif	Ufigvi	Jcj	f	f	xhuduc	866860	Adsalihac	Cjjvgk	\N	\N
9	Buy Product	2021-10-27 20:06:21.635521+00	2021-10-27 20:06:21.635546+00	3	Ufif	Ufigvi	Jcj	f	f	xhuduc	866860	Adsalihac	Cjjvgk	\N	\N
10	web developement	2021-10-27 20:19:39.487201+00	2021-10-27 20:19:39.487225+00	3				f	f			Adsalihac		\N	\N
11	Application developement	2021-10-27 20:19:46.066348+00	2021-10-27 20:19:46.066373+00	3				f	f			Adsalihac		\N	\N
12	regular Service Request	2021-10-27 20:41:47.309967+00	2021-10-27 20:41:47.309993+00	3				f	f			Adsalihac		\N	\N
13	Application developement	2021-10-27 21:16:01.728053+00	2021-10-27 21:16:01.728079+00	3				f	f			Adsalihac		\N	\N
14	Request for payout	2021-10-30 17:52:29.375269+00	2021-10-30 17:52:29.375307+00	3				f	f			Adsalihac		\N	\N
15	Become our partner Request	2021-10-30 18:44:24.753834+00	2021-10-30 18:44:24.753858+00	3				f	f			Adsalihac		\N	\N
16	Become our partner Request	2021-10-30 18:58:39.697445+00	2021-10-30 18:58:39.697484+00	3			Adsalihac	f	f		8880088	Adsalihac		\N	\N
17	Become our partner Request	2021-10-30 19:58:33.254592+00	2021-10-30 19:58:33.254617+00	3			Adsalihac	f	f		8880088	Adsalihac		\N	\N
6	Standard- Service Request	2021-10-27 20:02:10.016317+00	2021-11-04 18:11:22.32818+00	16				f	f		918889996	sssddd		\N	\N
18	Book Product Free Trail - Ghost	2021-11-04 06:16:21.697527+00	2021-11-04 19:33:20.607115+00	16	Ygygu		Ijj	f	f	ghh	938886	sssddd	Hhv	\N	\N
4	Buy Product - Phantom	2021-10-26 20:38:11.166027+00	2021-11-04 19:36:18.912555+00	16	Yfycyc	Cyg	Ihuvhv	f	f	h hchvhc	68686868	sssddd	Ucycch	\N	\N
19	IB Change Request	2021-11-07 08:39:45.665848+00	2021-11-07 08:39:45.665873+00	22				f	f		919656057080	Ashiq		\N	\N
20	Become our partner Request	2021-11-08 17:26:36.413813+00	2021-11-08 17:26:36.413837+00	23			Aswin	f	f		916235707007	Aswin		\N	\N
21	IB Change Request	2021-11-08 17:31:13.487258+00	2021-11-08 17:31:13.487283+00	23				f	f		916235707007	Aswin		\N	\N
22	Withdrawal Request	2021-11-08 17:31:17.748665+00	2021-11-08 17:31:17.74869+00	23				f	f		916235707007	Aswin		\N	\N
23	Deposit Request	2021-11-08 17:31:21.414688+00	2021-11-08 17:31:21.414712+00	23				f	f		916235707007	Aswin		\N	\N
24	Digital Marketing	2021-11-08 17:31:38.57064+00	2021-11-08 17:31:38.570663+00	23				f	f		916235707007	Aswin		\N	\N
25	MT4/MT5 White Label	2021-11-08 17:31:42.149779+00	2021-11-08 17:31:42.149804+00	23				f	f		916235707007	Aswin		\N	\N
26	Digital Marketing	2021-11-20 09:26:46.782668+00	2021-11-20 09:26:46.782692+00	22				f	f		919656057080	Ashiq		\N	\N
27	Build a Robot	2021-11-20 09:29:35.500837+00	2021-11-20 09:29:35.500863+00	22				f	f		919656057080	Ashiq		\N	\N
28	Web Development	2021-11-20 09:29:40.987135+00	2021-11-20 09:29:40.98716+00	22				f	f		919656057080	Ashiq		\N	\N
29	Web Development	2021-11-20 09:29:57.325968+00	2021-11-20 09:29:57.325993+00	22				f	f		919656057080	Ashiq		\N	\N
30	Application Development	2021-11-20 09:30:00.908802+00	2021-11-20 09:30:00.908828+00	22				f	f		919656057080	Ashiq		\N	\N
31	UI/UX Design	2021-11-20 09:30:04.327386+00	2021-11-20 09:30:04.327411+00	22				f	f		919656057080	Ashiq		\N	\N
32	MT4/MT5 White Label	2021-11-20 09:30:08.371671+00	2021-11-20 09:30:08.371697+00	22				f	f		919656057080	Ashiq		\N	\N
\.


--
-- Data for Name: SettingsApp_settingsmodel; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."SettingsApp_settingsmodel" (id, field_name, value, description, data_type, is_active) FROM stdin;
65	URL Privacy policy	https://www.google.com/	URL for privacy policy	TEXT	t
63	IB change option	true	if its true then IB change option will be shown in app	BOOLEAN	t
52	EA queries	917907960873	Whatsapp number of EA queries	NUMBER	t
53	VPS queries	917907960873	Whatsapp number of VPS queries	NUMBER	t
54	Broker queries	917907960873	Whatsapp number of Broker queries	NUMBER	t
55	Other queries	917907960873	Whatsapp number of Other queries	NUMBER	t
56	Free trail periods in days	14	Free trail periods for product and services	NUMBER	t
57	Subscription priods in days	30	Subscripton periods for product and services	NUMBER	t
58	Subscription renewal option in days	3	Subscription renewal option display with in the specified days of expiry	NUMBER	t
59	VIP 1 %	30	Percentage of commission value for VIP 1	NUMBER	t
60	VIP 2 %	30	Percentage of commission value for VIP 2	NUMBER	t
61	VIP 3 %	15	Percentage of commission value for VIP 3	NUMBER	t
62	VIP 4 %	20	Percentage of commission value for VIP 4	NUMBER	t
64	URL Terms and condition	https://www.google.com/	URL for terms and condition	TEXT	t
66	Razorpay API Key	rzp_test_bGi2cqJhwKKzT1	Razorpay key for online payments	TEXT	t
67	Razorpay Secret API Key	7FekPaDihsgYNAk8WfgNuhxH	Razorpay Secret key for REST API's	TEXT	t
68	Google API Key	7FekPaDihsgYNAk8WfgNuhxH	Razorpay Secret key for REST API's	TEXT	t
69	onesignal_app_id	8b97c9bb-8bd0-47cd-baec-05eee09b5cd6	Used to send notification to the users	TEXT	t
70	onesignal_rest_api_key	ZThhZGZmOTQtMzE1ZC00MjNkLThhOGMtYzA3YTJjNjk1YzM0	Used to send notification to the users	TEXT	t
\.


--
-- Data for Name: SubscriptionApp_subscription; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."SubscriptionApp_subscription" (id, name, created_at, updated_at, subscribed_date, subscription_end_date, user_id, product_id, is_free_trail) FROM stdin;
1	webdevelopement	2021-10-29 18:44:20.483394+00	2021-10-29 18:44:20.483417+00	2021-10-28	2021-11-15	1	\N	f
2	vps pros	2021-10-31 11:37:05.975171+00	2021-10-31 11:37:05.975199+00	2021-10-28	2021-11-15	3	6	f
3	cac	2021-10-31 11:37:38.261509+00	2021-11-01 20:20:45.360019+00	2021-10-31	2021-11-10	5	6	t
4	cac	2021-10-31 11:37:45.302214+00	2021-11-01 20:34:26.623944+00	2021-10-26	2021-11-01	5	6	t
5	sasa	2021-11-05 18:55:10.868965+00	2021-11-05 18:55:10.868989+00	2021-11-06	2021-11-30	19	5	f
6	sss	2021-11-05 18:58:58.024676+00	2021-11-05 18:58:58.0247+00	2021-11-06	2021-12-14	19	16	t
7	sss	2021-11-05 18:58:58.039677+00	2021-11-07 08:41:34.410463+00	2021-11-06	2021-11-07	19	16	t
\.


--
-- Data for Name: TopicApp_topic; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."TopicApp_topic" (id, name, duration, file, description, url, priority, is_active) FROM stdin;
1	l1 topic 1	25	P2_YBBH1G0.jpg	description	\N	\N	t
2	l1 topic 2	25	P2_dB3n3ni.jpg	description	\N	\N	t
3	l1 topic 3	25	P2_SASijmz.jpg	description	\N	\N	t
6	chapter 2	\N	sample.pdf	\N	\N	\N	f
5	chapter 1	30		\N	7Od5-9UApcM	\N	t
7	hISTORY	3 MIN	Abstract-Seminar_2021.pdf	\N	\N	\N	f
\.


--
-- Data for Name: TransactionApp_transaction; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."TransactionApp_transaction" (id, transaction_id, created_at, updated_at, description, amount_in, amount_out, user_id, product_id, product_name, status, username) FROM stdin;
1		2021-10-29 18:39:29.877176+00	2021-10-29 18:39:29.8772+00	\N	\N	\N	1	\N	\N	\N	\N
2	errere	2021-10-29 18:41:50.041956+00	2021-10-29 18:41:50.04198+00	\N	\N	\N	1	\N	\N	\N	\N
3		2021-10-31 17:55:24.224006+00	2021-10-31 17:55:24.224031+00	\N	\N	\N	1	\N	\N	\N	\N
\.


--
-- Data for Name: UserApp_userdetails; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."UserApp_userdetails" (id, password, last_login, is_superuser, username, first_name, last_name, email, is_staff, is_active, date_joined, mobile, referal_code, referal_user, referal_code_used, referred_count, file, pan_card_details, bankaccount_details, vip_rank, wallet_balance, wallet_credited, wallet_withdraw, player_id, is_blocked, is_deleted, is_partner, "bankaccount_IFSC", date_of_birth, bankaccount_name, commission, grade_name, is_account_holder) FROM stdin;
24	pbkdf2_sha256$260000$MC6Hl4GjIfsNTM5LeMfZhC$zYguuok2tUGi0fLFIlQeTe8r5SqJzhQAmfeU9l2T1vg=	\N	f	Saliii				f	t	2021-11-25 18:12:09.570284+00	549656460604	jjdSB	\N	\N	0		\N	\N	\N	\N	\N	\N	b7f76d2f-eccc-40dd-85bb-d1c914a283bd	f	f	f	\N	\N	\N	\N	\N	f
3	pbkdf2_sha256$260000$up6ZIDfHLspQUgHKl6Hyb7$fwtslUDj7D9ck2ihs5ZcdA8FIE6+i0xF4ymwBrYJK/0=	\N	f	Adsalihac			adsalihac@gmail.com	f	t	2021-10-26 17:16:52.813736+00	8880088	\N	\N	\N	0	rn_image_picker_lib_temp_7ce222ca-9e6f-43be-b120-55d2d5769e79.jpg	Dbhru	\N	\N	\N	\N	\N	8c9aa644-4409-4b1d-920a-5e4ffc836a62	f	f	f	\N	2021-10-20	\N	\N	\N	f
4	pbkdf2_sha256$260000$QzdpGBNTq26mevHBcqGiek$ELS7uMVBaTIswDZhEyXpUTYxiVUGblVHjmUoqzuhgJs=	\N	f	adsalihac				f	t	2021-10-30 20:44:33.549956+00	9656564646	\N	\N	\N	0	rn_image_picker_lib_temp_de39e657-b9a4-4ea1-9043-b991bee05104.jpg	\N	\N	\N	\N	\N	\N	d8b545f2-6726-42f9-a174-bda0c40ca489	f	f	f	\N	\N	\N	\N	\N	f
5	pbkdf2_sha256$260000$7sqkUqtRcDbBXmUtNTXnNg$hpPFobKtLoKgQICLDvKzdZHWlqt7LsPMOJcZQVZ8IUE=	\N	f	Saaa				f	t	2021-10-31 14:47:25.792714+00	9656460604	\N	\N	\N	0		\N	\N	\N	\N	\N	\N	\N	f	f	f	\N	\N	\N	\N	\N	f
6	pbkdf2_sha256$260000$WmNj9PRrDiRrB1i3z8DJtZ$iL9ifWIU3VEIAiHi/wahbEeI3qEnRcTPyqd7r/q2hEo=	\N	f	favaz				f	t	2021-11-03 16:44:20.24832+00	9559499449	\N	\N	\N	0		\N	\N	\N	\N	\N	\N	\N	f	f	f	\N	\N	\N	\N	\N	f
7	pbkdf2_sha256$260000$kFZYt2t5y5Npz0cHJjS3oO$dkCKxDsMYQ55JCtKPr3YebXssmuoh8rugNoo4eJsaUc=	\N	f	Aaaa				f	t	2021-11-03 16:47:59.303179+00	9759595949	\N	\N	\N	0		\N	\N	\N	\N	\N	\N	\N	f	f	f	\N	\N	\N	\N	\N	f
8	pbkdf2_sha256$260000$7wGUj31BgqsK93LyD7cK1P$72Z3UztihANG2WOm4FLIhxWFgq5eE4JSs2Ntc3GR89E=	\N	f	Bhb				f	t	2021-11-03 16:49:31.604798+00	99999996	\N	\N	\N	0		\N	\N	\N	\N	\N	\N	\N	f	f	f	\N	\N	\N	\N	\N	f
9	pbkdf2_sha256$260000$md9CD0EgFCiOOT3jmCy8LK$D60hR/m3B5fm/jkCyA87EpXm3I+9Mr42UaYFzIpRSSc=	\N	f	Adassss				f	t	2021-11-04 05:28:21.329006+00	3355522121	cedjh	\N	\N	0		\N	\N	\N	\N	\N	\N	\N	f	f	f	\N	\N	\N	\N	\N	f
10	pbkdf2_sha256$260000$0FGyEteR4i8DOFggRiMlMY$LSrdsbHKenifErOKTVM4epdLFOtYSVdV8O2erQKAfpg=	\N	f	Ssd				f	t	2021-11-04 05:40:41.448226+00	3345769779	jgiNo	\N	\N	0		\N	\N	\N	\N	\N	\N	\N	f	f	f	\N	\N	\N	\N	\N	f
16	pbkdf2_sha256$260000$ckOg6YyKHGE7ziypJ879Cy$k85d5chMiIJqF3ND9Qgmc38WNosN+Re4SWmsX3TnBuA=	\N	f	sssddd				f	t	2021-11-04 18:01:12.916797+00	918889996	ldDw1	\N	\N	0		\N	\N	\N	\N	\N	\N	33b76b0e-46bd-4d1b-9cdd-6a85309906b4	f	f	f	\N	\N	\N	\N	\N	f
11	pbkdf2_sha256$260000$1wr7sdpQ2pIXUAQMCesOTy$UHEajpS6Q3agGqhU9f+Ihi7DEmVVZtIu4RmD2sKxycE=	\N	f	adsalihac@gmail.com			adsalihac@gmail.com	f	t	2021-11-04 05:56:00.125617+00	91885885556	uWFNS	\N	\N	0		\N	\N	\N	\N	\N	\N	\N	f	f	f	\N	\N	\N	\N	\N	f
17	pbkdf2_sha256$260000$L5VBJSw5LlWqykfCppQxTZ$5Io1NJk5aSFBvOW3ZzPTU7VeyBsC/c0EQTzhyZ7+VSw=	\N	f	Saakih				f	t	2021-11-05 05:16:18.689304+00	9996665	7fwo6	\N	\N	0		\N	\N	\N	\N	\N	\N	9d969048-7427-4f43-a0af-6d8f5f941ccc	f	f	f	\N	\N	\N	\N	\N	f
13	pbkdf2_sha256$260000$1IMECgfyMd0gMKWYNhpt8s$Epi1xQuNg+UV07xJti0+KdNmQ3j5vc27OVG5xZNzdtU=	\N	f	Ffvgg				f	t	2021-11-04 06:10:50.25793+00	915555555	gwB9C	\N	\N	0		\N	\N	\N	\N	\N	\N	\N	f	f	f	\N	\N	\N	\N	\N	f
14	pbkdf2_sha256$260000$uPdSNv7oov98cLpn3yOm1F$gmRT7MA9k8OsY7jmP7YT4trNgksG7KNG7vAU4zRNOFE=	\N	f	Zzzxzzzz			Zalho@gnail.xom	f	t	2021-11-04 06:11:36.998923+00	91845995985	JjA6q	\N	\N	0	rn_image_picker_lib_temp_442d6cd7-9280-43e6-abc4-1c8bf6dcd92a.jpg	\N	\N	\N	\N	\N	\N	96e1d6c8-0bed-4248-84a7-d73dbecb53d1	f	f	f	\N	\N	\N	\N	\N	f
15	pbkdf2_sha256$260000$6opTx6sGoj7mh330S6FOcW$yVkO6r+enPtwwCw0yyAfHMdJRkXeInpK3dzLuX2Rb2Y=	\N	f	Adsalihahhh				f	t	2021-11-04 07:22:57.551299+00	66559996	LW2Os	\N	\N	0		\N	\N	\N	\N	\N	\N	4dde6d0f-681a-4b5a-8210-38d93944cadb	f	f	f	\N	\N	\N	\N	\N	f
18	pbkdf2_sha256$260000$p4gUbCr3iIe5FlmTwYwpdh$Q/8Xt8xTJtmGsoe3EYWGBjSgydHRfGCemf1yCcsunR8=	\N	f	Saaali				f	t	2021-11-05 18:00:01.561968+00	919656460601	4EuBu	\N	\N	0		\N	\N	\N	\N	\N	\N	\N	f	f	f	\N	\N	\N	\N	\N	f
19	pbkdf2_sha256$260000$ctIPB3P8JbGKRL8PmX62L1$H7n9LC2XqrxUoB+gUWib1TvLu1KQGxUzwoj4iJ2cKeU=	\N	f	Adsalihacaa				f	t	2021-11-05 18:37:52.864483+00	5456955656	94FXA	\N	\N	0		\N	\N	\N	\N	\N	\N	68c7d7c4-132f-4433-8a8a-3999d88cba29	f	f	f	\N	\N	\N	\N	\N	f
20	pbkdf2_sha256$260000$33TRZYHYbqZYiI3UUKnDhQ$+C/NZ5cCYv4EQzGRbffZQSYeWSgwWwYpRCBH1gezu8Q=	\N	f	Hiii				f	t	2021-11-05 19:21:32.369064+00	918999996	iz35X	\N	\N	0		\N	\N	\N	\N	\N	\N	1fbeba1e-fb51-49d4-90e0-3bd976a1b04b	f	f	f	\N	\N	\N	\N	\N	f
21	pbkdf2_sha256$260000$C4RllUhk32UC8EwDespUx7$bAz90VCz3tvID32mMztBgy5IlLegVAs5RlbDcKhN1tw=	\N	f	Hhbhh				f	t	2021-11-06 21:34:21.699444+00	5469999898	e5DCD	\N	\N	0		\N	\N	\N	\N	\N	\N	1aa26efd-f3ad-4002-b738-e7bc99cdae78	f	f	f	\N	\N	\N	\N	\N	f
25	pbkdf2_sha256$260000$U7JlyOpee9RE3WxRv8kXOs$cgcf8fOLZ3z78ZheFaX8okWVZgZU8eg4y+m9PJZpm2Q=	\N	f	adsalihac123				f	t	2021-11-26 17:07:46.12987+00	919656460604	N4lc1	\N	\N	0		\N	\N	\N	\N	\N	\N	defc7f9c-07ab-42a5-b3bb-3c8961749530	f	f	f	\N	\N	\N	\N	\N	f
23	pbkdf2_sha256$260000$BRfKfTx1gn5ZXRkXpLdJrB$F/330qI7J5cn2VjCc3vj1Y91A5CmcdL/hAeBv0wvY1o=	\N	f	Aswin			Dfg@gmail.com	f	t	2021-11-08 17:24:48.730601+00	916235707007	uH4rx	\N	\N	0		\N	\N	\N	\N	\N	\N	\N	f	f	f	\N	\N	\N	\N	\N	f
22	pbkdf2_sha256$260000$SiuC50xqiwe6qxtMIiPBNc$2MPPCEZl31xxWTntvdypqvOXQqgJpZKipaBTPZdltcM=	\N	f	Ashiq			ashiq@rtonline.in	f	t	2021-11-07 04:05:37.290818+00	919656057080	Pe8ek	\N	\N	0		\N	\N	\N	\N	\N	\N	18323652-7760-4ebc-9c5e-d74907b269f5	f	f	f	\N	\N	\N	\N	\N	f
1	pbkdf2_sha256$260000$7tEJphnxo2EIeDNr3l0WCD$onasmk5kXR78ZPBX+KBC4Olem4Nd2pdFDWDhgC4oas4=	\N	t	admin	zaalgo	panel	zaalgo@admin.com	t	t	2021-10-20 18:54:13.105+00	434343434	\N	\N	\N	0	zalgo.d2f2fcd3.png	\N	\N	\N	\N	\N	\N	\N	f	f	f	\N	\N	\N	\N	\N	f
12	pbkdf2_sha256$260000$3gVaPx9GU9D9Q17P3Hlw4q$9D1OPAmyGzDRWrXZ7yZKq30c53Xj2/Prrl4JsOnaLNo=	\N	f	Saaaa				f	t	2021-11-04 06:02:42.96778+00	undefined	fFl2L	\N	\N	0		\N	\N	\N	\N	\N	\N	\N	f	f	f	\N	\N	\N	\N	\N	f
2	pbkdf2_sha256$260000$6pCcZcsOcmSHdn9n3gAETt$aQUh88KIDlmfOrtj2T3qKkh0xZ+/DrR29Q5UtZzAUeg=	\N	f	jasirmj				f	t	2021-10-20 19:03:09.782+00	917907960873	\N	\N	\N	0		\N	\N	\N	\N	\N	\N	\N	f	f	f	\N	\N	\N	\N	\N	f
\.


--
-- Data for Name: UserApp_userdetails_groups; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."UserApp_userdetails_groups" (id, userdetails_id, group_id) FROM stdin;
\.


--
-- Data for Name: UserApp_userdetails_user_permissions; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."UserApp_userdetails_user_permissions" (id, userdetails_id, permission_id) FROM stdin;
\.


--
-- Data for Name: ZalgoAccountApp_zalgoaccount; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."ZalgoAccountApp_zalgoaccount" (id, first_name, last_name, email, mobile, gender, dob, national_id, pancard, house_name, street_name, pincode, city, user_id, national_id_back, national_id_front, pancard_back, pancard_front) FROM stdin;
1	fname2	last nme	jasirmj@gmail.com	7897987989456	male	2021-10-20	143242312314		asfasdfa	dasdadas	253425	1qdqwqwd	2	rn_image_picker_lib_temp_d96bb090-de9e-44ac-b1cd-5084ac09cff4.jpg	rn_image_picker_lib_temp_e268437e-1a1c-4b6d-9e10-6868070d0b90.jpg		rn_image_picker_lib_temp_22fc5e05-8eeb-4945-a4a9-3a13d32d6e33.jpg
2	Salih	Ac	Zalho@gnail.xom	91845995985	Male	2021-11-01	434343434		Muttiyarakkal House , odungode , PO Mavilayi , Kannur	Near Muttiyrakkal Masjid	670633	kannur	14	rn_image_picker_lib_temp_e278d607-8f0d-4a63-9303-40c1322d428f.jpg	rn_image_picker_lib_temp_8c065f4c-2dba-4951-b4ac-5399d82e2628.jpg		rn_image_picker_lib_temp_e73f904a-760b-4f62-996b-230b11718bb5.jpg
\.


--
-- Data for Name: auth_group; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.auth_group (id, name) FROM stdin;
\.


--
-- Data for Name: auth_group_permissions; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.auth_group_permissions (id, group_id, permission_id) FROM stdin;
\.


--
-- Data for Name: auth_permission; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.auth_permission (id, name, content_type_id, codename) FROM stdin;
1	Can add log entry	1	add_logentry
2	Can change log entry	1	change_logentry
3	Can delete log entry	1	delete_logentry
4	Can view log entry	1	view_logentry
5	Can add permission	2	add_permission
6	Can change permission	2	change_permission
7	Can delete permission	2	delete_permission
8	Can view permission	2	view_permission
9	Can add group	3	add_group
10	Can change group	3	change_group
11	Can delete group	3	delete_group
12	Can view group	3	view_group
13	Can add content type	4	add_contenttype
14	Can change content type	4	change_contenttype
15	Can delete content type	4	delete_contenttype
16	Can view content type	4	view_contenttype
17	Can add session	5	add_session
18	Can change session	5	change_session
19	Can delete session	5	delete_session
20	Can view session	5	view_session
21	Can add user	6	add_userdetails
22	Can change user	6	change_userdetails
23	Can delete user	6	delete_userdetails
24	Can view user	6	view_userdetails
25	Can add settings model	7	add_settingsmodel
26	Can change settings model	7	change_settingsmodel
27	Can delete settings model	7	delete_settingsmodel
28	Can view settings model	7	view_settingsmodel
29	Can add Token	8	add_token
30	Can change Token	8	change_token
31	Can delete Token	8	delete_token
32	Can view Token	8	view_token
33	Can add token	9	add_tokenproxy
34	Can change token	9	change_tokenproxy
35	Can delete token	9	delete_tokenproxy
36	Can view token	9	view_tokenproxy
37	Can add request model	10	add_requestmodel
38	Can change request model	10	change_requestmodel
39	Can delete request model	10	delete_requestmodel
40	Can view request model	10	view_requestmodel
41	Can add country	11	add_country
42	Can change country	11	change_country
43	Can delete country	11	delete_country
44	Can view country	11	view_country
45	Can add sub product	12	add_subproduct
46	Can change sub product	12	change_subproduct
47	Can delete sub product	12	delete_subproduct
48	Can view sub product	12	view_subproduct
49	Can add product	13	add_product
50	Can change product	13	change_product
51	Can delete product	13	delete_product
52	Can view product	13	view_product
53	Can add banner	14	add_banner
54	Can change banner	14	change_banner
55	Can delete banner	14	delete_banner
56	Can view banner	14	view_banner
57	Can add notification	15	add_notification
58	Can change notification	15	change_notification
59	Can delete notification	15	delete_notification
60	Can view notification	15	view_notification
61	Can add lesson	16	add_lesson
62	Can change lesson	16	change_lesson
63	Can delete lesson	16	delete_lesson
64	Can view lesson	16	view_lesson
65	Can add course	17	add_course
66	Can change course	17	change_course
67	Can delete course	17	delete_course
68	Can view course	17	view_course
69	Can add topic	18	add_topic
70	Can change topic	18	change_topic
71	Can delete topic	18	delete_topic
72	Can view topic	18	view_topic
73	Can add subscription	19	add_subscription
74	Can change subscription	19	change_subscription
75	Can delete subscription	19	delete_subscription
76	Can view subscription	19	view_subscription
77	Can add transaction	20	add_transaction
78	Can change transaction	20	change_transaction
79	Can delete transaction	20	delete_transaction
80	Can view transaction	20	view_transaction
81	Can add partners	21	add_partners
82	Can change partners	21	change_partners
83	Can delete partners	21	delete_partners
84	Can view partners	21	view_partners
85	Can add zalgo account	22	add_zalgoaccount
86	Can change zalgo account	22	change_zalgoaccount
87	Can delete zalgo account	22	delete_zalgoaccount
88	Can view zalgo account	22	view_zalgoaccount
89	Can add user notification status	23	add_usernotificationstatus
90	Can change user notification status	23	change_usernotificationstatus
91	Can delete user notification status	23	delete_usernotificationstatus
92	Can view user notification status	23	view_usernotificationstatus
\.


--
-- Data for Name: authtoken_token; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.authtoken_token (key, created, user_id) FROM stdin;
a803c7df69d18ac2a364494436fe79ef6fe61019	2021-10-26 17:16:52.818806+00	3
b7573fca60bde1402e7ddd7c8e2b91aa1ca688e0	2021-10-20 19:12:26.816+00	1
c4e33e9eb2abe1630077c718fa4502b77e1088d8	2021-10-20 19:03:09.79+00	2
b9daf46a72e0215fb14c27c0d14a48a100762721	2021-10-30 20:44:33.55452+00	4
b68e43475be8793ff5fb661a9b75d91f42e8e753	2021-10-31 14:47:25.800797+00	5
eebf889ddd0b36294dcc097216e1f8b9d8a5fb4d	2021-11-03 16:44:20.270053+00	6
c66611684206e41936030d986683eb4fe4f92a90	2021-11-03 16:47:59.307426+00	7
c4da12fe032b0abc4b8c097d1570b0543da1a370	2021-11-03 16:49:31.6093+00	8
df721098efef7af18ad76c2ae6a80c412dad8a0a	2021-11-04 05:28:21.333779+00	9
8945763b56109c0593471564bc6efdd7bc56e8f3	2021-11-04 05:40:41.452767+00	10
3d49ed6b197cd8229a0c468d0b3511963a45ace1	2021-11-04 05:56:00.129958+00	11
c67212eda1a41be5daef836a94c260a4f465b90a	2021-11-04 06:02:42.972223+00	12
40289899d8cdca27bc1a160a5451b0812db31651	2021-11-04 06:10:50.261985+00	13
3218cf796825444f1537391a1bf5d0c36b5ea139	2021-11-04 06:11:37.003385+00	14
b8e6c81637af22106783545ea18d7a41fda8e727	2021-11-04 07:22:57.555762+00	15
69a131fb5e85f2f6145073eec0ad208bc4f3cd09	2021-11-04 18:01:12.921435+00	16
460b665ab817876ee2bd3ea4f20574058d08b5e4	2021-11-05 05:16:18.693802+00	17
5170c68857a5e29ef97b2a434bc0b70c8e9da88b	2021-11-05 18:00:01.566703+00	18
2c8355e87bdb0549d120fd1d715d773709d01886	2021-11-05 18:37:52.8688+00	19
289774248a6b127406ea4084ef6e527d36e9452b	2021-11-05 19:21:32.373425+00	20
20f34ccafc4aab1f94e7ea1f5d19558b0009a265	2021-11-06 21:34:21.703899+00	21
6c3005a69629f85ed2eda7706856460bb65ad654	2021-11-07 04:05:37.295012+00	22
77753858cf4670b01fba1f37406a22fc4a843757	2021-11-08 17:24:48.734894+00	23
062df839d24256a8a25149d243e7b6d90f96fc29	2021-11-25 18:12:09.574663+00	24
d4e5e870aff1b5e11dcc9c570fff8ae70ce6d9c3	2021-11-26 17:07:46.134274+00	25
\.


--
-- Data for Name: django_admin_log; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.django_admin_log (id, action_time, object_id, object_repr, action_flag, change_message, content_type_id, user_id) FROM stdin;
\.


--
-- Data for Name: django_content_type; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.django_content_type (id, app_label, model) FROM stdin;
19	SubscriptionApp	subscription
20	TransactionApp	transaction
21	PartnersApp	partners
22	ZalgoAccountApp	zalgoaccount
23	NotificationApp	usernotificationstatus
1	admin	logentry
2	auth	permission
3	auth	group
4	contenttypes	contenttype
5	sessions	session
6	UserApp	userdetails
7	SettingsApp	settingsmodel
8	authtoken	token
9	authtoken	tokenproxy
10	RequestsApp	requestmodel
11	CountryApp	country
12	ProductApp	subproduct
13	ProductApp	product
14	BannerApp	banner
15	NotificationApp	notification
16	LessonApp	lesson
17	CourseApp	course
18	TopicApp	topic
\.


--
-- Data for Name: django_migrations; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.django_migrations (id, app, name, applied) FROM stdin;
1	BannerApp	0001_initial	2021-10-26 14:52:45.409547+00
2	BannerApp	0002_banner_type	2021-10-26 14:52:45.415306+00
3	CountryApp	0001_initial	2021-10-26 14:52:45.439307+00
4	CountryApp	0002_country_is_active	2021-10-26 14:52:45.444247+00
5	TopicApp	0001_initial	2021-10-26 14:52:45.463966+00
6	LessonApp	0001_initial	2021-10-26 14:52:45.505403+00
7	CourseApp	0001_initial	2021-10-26 14:52:45.548406+00
8	NotificationApp	0001_initial	2021-10-26 14:52:45.561071+00
9	NotificationApp	0002_remove_notification_type	2021-10-26 14:52:45.566147+00
10	ProductApp	0001_initial	2021-10-26 14:52:45.618732+00
11	contenttypes	0001_initial	2021-10-26 14:52:45.632983+00
12	contenttypes	0002_remove_content_type_name	2021-10-26 14:52:45.650792+00
13	auth	0001_initial	2021-10-26 14:52:45.715951+00
14	auth	0002_alter_permission_name_max_length	2021-10-26 14:52:45.723006+00
15	auth	0003_alter_user_email_max_length	2021-10-26 14:52:45.730681+00
16	auth	0004_alter_user_username_opts	2021-10-26 14:52:45.738672+00
17	auth	0005_alter_user_last_login_null	2021-10-26 14:52:45.746505+00
18	auth	0006_require_contenttypes_0002	2021-10-26 14:52:45.749636+00
19	auth	0007_alter_validators_add_error_messages	2021-10-26 14:52:45.757802+00
20	auth	0008_alter_user_username_max_length	2021-10-26 14:52:45.765973+00
21	auth	0009_alter_user_last_name_max_length	2021-10-26 14:52:45.77381+00
22	auth	0010_alter_group_name_max_length	2021-10-26 14:52:45.782958+00
23	auth	0011_update_proxy_permissions	2021-10-26 14:52:45.798615+00
24	auth	0012_alter_user_first_name_max_length	2021-10-26 14:52:45.806466+00
25	UserApp	0001_initial	2021-10-26 14:52:45.885331+00
26	RequestsApp	0001_initial	2021-10-26 14:52:45.907933+00
27	RequestsApp	0002_auto_20211022_0005	2021-10-26 14:52:45.990943+00
28	SettingsApp	0001_initial	2021-10-26 14:52:46.005068+00
29	UserApp	0002_alter_userdetails_mobile	2021-10-26 14:52:46.019258+00
30	UserApp	0003_auto_20211024_2357	2021-10-26 14:52:46.038955+00
31	UserApp	0004_userdetails_bankaccount_name	2021-10-26 14:52:46.052835+00
32	admin	0001_initial	2021-10-26 14:52:46.088059+00
33	admin	0002_logentry_remove_auto_add	2021-10-26 14:52:46.100091+00
34	admin	0003_logentry_add_action_flag_choices	2021-10-26 14:52:46.11271+00
35	authtoken	0001_initial	2021-10-26 14:52:46.143516+00
36	authtoken	0002_auto_20160226_1747	2021-10-26 14:52:46.187539+00
37	authtoken	0003_tokenproxy	2021-10-26 14:52:46.19258+00
38	sessions	0001_initial	2021-10-26 14:52:46.220297+00
39	CourseApp	0002_alter_course_name	2021-10-26 19:36:35.21053+00
40	LessonApp	0002_alter_lesson_name	2021-10-26 19:36:35.235883+00
41	TopicApp	0002_alter_topic_name	2021-10-26 19:36:35.270447+00
42	SubscriptionApp	0001_initial	2021-10-28 17:39:12.94525+00
43	SubscriptionApp	0002_auto_20211028_2303	2021-10-28 17:39:12.982457+00
44	UserApp	0005_auto_20211028_2259	2021-10-28 17:39:13.008947+00
45	BannerApp	0003_banner_is_internal	2021-10-28 18:03:39.859681+00
46	BannerApp	0004_banner_product	2021-10-28 18:03:39.879341+00
47	PartnersApp	0001_initial	2021-10-28 18:28:00.579054+00
48	TransactionApp	0001_initial	2021-10-28 18:28:00.61973+00
49	PartnersApp	0002_auto_20211029_0000	2021-10-28 18:36:58.295598+00
50	ZalgoAccountApp	0001_initial	2021-10-28 19:24:07.266269+00
51	PartnersApp	0003_auto_20211031_0121	2021-10-30 20:00:06.217676+00
52	RequestsApp	0003_auto_20211031_0121	2021-10-30 20:00:06.250366+00
53	TransactionApp	0002_auto_20211031_0121	2021-10-30 20:00:06.316002+00
54	ZalgoAccountApp	0002_auto_20211031_0129	2021-10-30 20:00:06.470544+00
55	SubscriptionApp	0003_subscription_product	2021-10-30 20:22:03.507399+00
56	ZalgoAccountApp	0003_rename_parncard_zalgoaccount_pancard	2021-10-30 20:22:03.542883+00
57	SubscriptionApp	0004_subscription_is_free_trail	2021-10-31 11:41:12.668061+00
58	UserApp	0006_userdetails_is_account_holder	2021-10-31 18:47:05.627543+00
59	LessonApp	0003_alter_lesson_options	2021-11-02 18:18:54.434869+00
60	TopicApp	0003_alter_topic_url	2021-11-02 18:34:16.426996+00
61	UserApp	0007_alter_userdetails_referal_code	2021-11-03 21:30:58.747143+00
62	UserApp	0008_alter_userdetails_referred_count	2021-11-03 21:30:58.808731+00
63	UserApp	0009_alter_userdetails_referred_count	2021-11-04 12:42:26.974366+00
64	TransactionApp	0003_transaction_username	2021-11-04 19:56:38.517665+00
65	PartnersApp	0004_partners_vip_rank	2021-11-06 20:29:30.727573+00
66	NotificationApp	0003_usernotificationstatus	2021-11-09 18:46:46.146046+00
\.


--
-- Data for Name: django_session; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.django_session (session_key, session_data, expire_date) FROM stdin;
\.


--
-- Name: BannerApp_banner_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public."BannerApp_banner_id_seq"', 12, true);


--
-- Name: CountryApp_country_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public."CountryApp_country_id_seq"', 11, true);


--
-- Name: CourseApp_course_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public."CourseApp_course_id_seq"', 2, true);


--
-- Name: CourseApp_course_lessons_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public."CourseApp_course_lessons_id_seq"', 6, true);


--
-- Name: LessonApp_lesson_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public."LessonApp_lesson_id_seq"', 6, true);


--
-- Name: LessonApp_lesson_topic_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public."LessonApp_lesson_topic_id_seq"', 9, true);


--
-- Name: NotificationApp_notification_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public."NotificationApp_notification_id_seq"', 1, true);


--
-- Name: NotificationApp_usernotificationstatus_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public."NotificationApp_usernotificationstatus_id_seq"', 1, false);


--
-- Name: PartnersApp_partners_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public."PartnersApp_partners_id_seq"', 4, true);


--
-- Name: ProductApp_product_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public."ProductApp_product_id_seq"', 19, true);


--
-- Name: ProductApp_product_sub_product_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public."ProductApp_product_sub_product_id_seq"', 6, true);


--
-- Name: ProductApp_subproduct_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public."ProductApp_subproduct_id_seq"', 4, true);


--
-- Name: RequestsApp_requestmodel_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public."RequestsApp_requestmodel_id_seq"', 32, true);


--
-- Name: SettingsApp_settingsmodel_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public."SettingsApp_settingsmodel_id_seq"', 70, true);


--
-- Name: SubscriptionApp_subscription_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public."SubscriptionApp_subscription_id_seq"', 7, true);


--
-- Name: TopicApp_topic_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public."TopicApp_topic_id_seq"', 7, true);


--
-- Name: TransactionApp_transaction_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public."TransactionApp_transaction_id_seq"', 3, true);


--
-- Name: UserApp_userdetails_groups_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public."UserApp_userdetails_groups_id_seq"', 1, false);


--
-- Name: UserApp_userdetails_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public."UserApp_userdetails_id_seq"', 25, true);


--
-- Name: UserApp_userdetails_user_permissions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public."UserApp_userdetails_user_permissions_id_seq"', 1, false);


--
-- Name: ZalgoAccountApp_zalgoaccount_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public."ZalgoAccountApp_zalgoaccount_id_seq"', 2, true);


--
-- Name: auth_group_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.auth_group_id_seq', 1, false);


--
-- Name: auth_group_permissions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.auth_group_permissions_id_seq', 1, false);


--
-- Name: auth_permission_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.auth_permission_id_seq', 92, true);


--
-- Name: django_admin_log_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.django_admin_log_id_seq', 1, false);


--
-- Name: django_content_type_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.django_content_type_id_seq', 23, true);


--
-- Name: django_migrations_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.django_migrations_id_seq', 66, true);


--
-- Name: BannerApp_banner BannerApp_banner_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."BannerApp_banner"
    ADD CONSTRAINT "BannerApp_banner_pkey" PRIMARY KEY (id);


--
-- Name: CountryApp_country CountryApp_country_country_code_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."CountryApp_country"
    ADD CONSTRAINT "CountryApp_country_country_code_key" UNIQUE (country_code);


--
-- Name: CountryApp_country CountryApp_country_name_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."CountryApp_country"
    ADD CONSTRAINT "CountryApp_country_name_key" UNIQUE (name);


--
-- Name: CountryApp_country CountryApp_country_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."CountryApp_country"
    ADD CONSTRAINT "CountryApp_country_pkey" PRIMARY KEY (id);


--
-- Name: CourseApp_course_lessons CourseApp_course_lessons_course_id_lesson_id_d42ef995_uniq; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."CourseApp_course_lessons"
    ADD CONSTRAINT "CourseApp_course_lessons_course_id_lesson_id_d42ef995_uniq" UNIQUE (course_id, lesson_id);


--
-- Name: CourseApp_course_lessons CourseApp_course_lessons_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."CourseApp_course_lessons"
    ADD CONSTRAINT "CourseApp_course_lessons_pkey" PRIMARY KEY (id);


--
-- Name: CourseApp_course CourseApp_course_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."CourseApp_course"
    ADD CONSTRAINT "CourseApp_course_pkey" PRIMARY KEY (id);


--
-- Name: LessonApp_lesson LessonApp_lesson_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."LessonApp_lesson"
    ADD CONSTRAINT "LessonApp_lesson_pkey" PRIMARY KEY (id);


--
-- Name: LessonApp_lesson_topic LessonApp_lesson_topic_lesson_id_topic_id_fd13606b_uniq; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."LessonApp_lesson_topic"
    ADD CONSTRAINT "LessonApp_lesson_topic_lesson_id_topic_id_fd13606b_uniq" UNIQUE (lesson_id, topic_id);


--
-- Name: LessonApp_lesson_topic LessonApp_lesson_topic_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."LessonApp_lesson_topic"
    ADD CONSTRAINT "LessonApp_lesson_topic_pkey" PRIMARY KEY (id);


--
-- Name: NotificationApp_notification NotificationApp_notification_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."NotificationApp_notification"
    ADD CONSTRAINT "NotificationApp_notification_pkey" PRIMARY KEY (id);


--
-- Name: NotificationApp_usernotificationstatus NotificationApp_usernotificationstatus_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."NotificationApp_usernotificationstatus"
    ADD CONSTRAINT "NotificationApp_usernotificationstatus_pkey" PRIMARY KEY (id);


--
-- Name: PartnersApp_partners PartnersApp_partners_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."PartnersApp_partners"
    ADD CONSTRAINT "PartnersApp_partners_pkey" PRIMARY KEY (id);


--
-- Name: ProductApp_product ProductApp_product_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."ProductApp_product"
    ADD CONSTRAINT "ProductApp_product_pkey" PRIMARY KEY (id);


--
-- Name: ProductApp_product_sub_product ProductApp_product_sub_p_product_id_subproduct_id_df04b18d_uniq; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."ProductApp_product_sub_product"
    ADD CONSTRAINT "ProductApp_product_sub_p_product_id_subproduct_id_df04b18d_uniq" UNIQUE (product_id, subproduct_id);


--
-- Name: ProductApp_product_sub_product ProductApp_product_sub_product_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."ProductApp_product_sub_product"
    ADD CONSTRAINT "ProductApp_product_sub_product_pkey" PRIMARY KEY (id);


--
-- Name: ProductApp_subproduct ProductApp_subproduct_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."ProductApp_subproduct"
    ADD CONSTRAINT "ProductApp_subproduct_pkey" PRIMARY KEY (id);


--
-- Name: RequestsApp_requestmodel RequestsApp_requestmodel_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."RequestsApp_requestmodel"
    ADD CONSTRAINT "RequestsApp_requestmodel_pkey" PRIMARY KEY (id);


--
-- Name: SettingsApp_settingsmodel SettingsApp_settingsmodel_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."SettingsApp_settingsmodel"
    ADD CONSTRAINT "SettingsApp_settingsmodel_pkey" PRIMARY KEY (id);


--
-- Name: SubscriptionApp_subscription SubscriptionApp_subscription_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."SubscriptionApp_subscription"
    ADD CONSTRAINT "SubscriptionApp_subscription_pkey" PRIMARY KEY (id);


--
-- Name: TopicApp_topic TopicApp_topic_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."TopicApp_topic"
    ADD CONSTRAINT "TopicApp_topic_pkey" PRIMARY KEY (id);


--
-- Name: TransactionApp_transaction TransactionApp_transaction_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."TransactionApp_transaction"
    ADD CONSTRAINT "TransactionApp_transaction_pkey" PRIMARY KEY (id);


--
-- Name: UserApp_userdetails_groups UserApp_userdetails_grou_userdetails_id_group_id_e7db61c9_uniq; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."UserApp_userdetails_groups"
    ADD CONSTRAINT "UserApp_userdetails_grou_userdetails_id_group_id_e7db61c9_uniq" UNIQUE (userdetails_id, group_id);


--
-- Name: UserApp_userdetails_groups UserApp_userdetails_groups_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."UserApp_userdetails_groups"
    ADD CONSTRAINT "UserApp_userdetails_groups_pkey" PRIMARY KEY (id);


--
-- Name: UserApp_userdetails UserApp_userdetails_mobile_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."UserApp_userdetails"
    ADD CONSTRAINT "UserApp_userdetails_mobile_key" UNIQUE (mobile);


--
-- Name: UserApp_userdetails UserApp_userdetails_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."UserApp_userdetails"
    ADD CONSTRAINT "UserApp_userdetails_pkey" PRIMARY KEY (id);


--
-- Name: UserApp_userdetails UserApp_userdetails_referal_code_2e314e3d_uniq; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."UserApp_userdetails"
    ADD CONSTRAINT "UserApp_userdetails_referal_code_2e314e3d_uniq" UNIQUE (referal_code);


--
-- Name: UserApp_userdetails_user_permissions UserApp_userdetails_user_permissions_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."UserApp_userdetails_user_permissions"
    ADD CONSTRAINT "UserApp_userdetails_user_permissions_pkey" PRIMARY KEY (id);


--
-- Name: UserApp_userdetails_user_permissions UserApp_userdetails_user_userdetails_id_permissio_bc6b4db9_uniq; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."UserApp_userdetails_user_permissions"
    ADD CONSTRAINT "UserApp_userdetails_user_userdetails_id_permissio_bc6b4db9_uniq" UNIQUE (userdetails_id, permission_id);


--
-- Name: UserApp_userdetails UserApp_userdetails_username_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."UserApp_userdetails"
    ADD CONSTRAINT "UserApp_userdetails_username_key" UNIQUE (username);


--
-- Name: ZalgoAccountApp_zalgoaccount ZalgoAccountApp_zalgoaccount_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."ZalgoAccountApp_zalgoaccount"
    ADD CONSTRAINT "ZalgoAccountApp_zalgoaccount_pkey" PRIMARY KEY (id);


--
-- Name: auth_group auth_group_name_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_group
    ADD CONSTRAINT auth_group_name_key UNIQUE (name);


--
-- Name: auth_group_permissions auth_group_permissions_group_id_permission_id_0cd325b0_uniq; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_group_permissions
    ADD CONSTRAINT auth_group_permissions_group_id_permission_id_0cd325b0_uniq UNIQUE (group_id, permission_id);


--
-- Name: auth_group_permissions auth_group_permissions_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_group_permissions
    ADD CONSTRAINT auth_group_permissions_pkey PRIMARY KEY (id);


--
-- Name: auth_group auth_group_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_group
    ADD CONSTRAINT auth_group_pkey PRIMARY KEY (id);


--
-- Name: auth_permission auth_permission_content_type_id_codename_01ab375a_uniq; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_permission
    ADD CONSTRAINT auth_permission_content_type_id_codename_01ab375a_uniq UNIQUE (content_type_id, codename);


--
-- Name: auth_permission auth_permission_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_permission
    ADD CONSTRAINT auth_permission_pkey PRIMARY KEY (id);


--
-- Name: authtoken_token authtoken_token_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.authtoken_token
    ADD CONSTRAINT authtoken_token_pkey PRIMARY KEY (key);


--
-- Name: authtoken_token authtoken_token_user_id_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.authtoken_token
    ADD CONSTRAINT authtoken_token_user_id_key UNIQUE (user_id);


--
-- Name: django_admin_log django_admin_log_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.django_admin_log
    ADD CONSTRAINT django_admin_log_pkey PRIMARY KEY (id);


--
-- Name: django_content_type django_content_type_app_label_model_76bd3d3b_uniq; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.django_content_type
    ADD CONSTRAINT django_content_type_app_label_model_76bd3d3b_uniq UNIQUE (app_label, model);


--
-- Name: django_content_type django_content_type_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.django_content_type
    ADD CONSTRAINT django_content_type_pkey PRIMARY KEY (id);


--
-- Name: django_migrations django_migrations_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.django_migrations
    ADD CONSTRAINT django_migrations_pkey PRIMARY KEY (id);


--
-- Name: django_session django_session_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.django_session
    ADD CONSTRAINT django_session_pkey PRIMARY KEY (session_key);


--
-- Name: BannerApp_banner_product_id_79c493c9; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "BannerApp_banner_product_id_79c493c9" ON public."BannerApp_banner" USING btree (product_id);


--
-- Name: CountryApp_country_country_code_64f7875d_like; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "CountryApp_country_country_code_64f7875d_like" ON public."CountryApp_country" USING btree (country_code varchar_pattern_ops);


--
-- Name: CountryApp_country_name_bb3d2fcf_like; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "CountryApp_country_name_bb3d2fcf_like" ON public."CountryApp_country" USING btree (name varchar_pattern_ops);


--
-- Name: CourseApp_course_lessons_course_id_cde5fba0; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "CourseApp_course_lessons_course_id_cde5fba0" ON public."CourseApp_course_lessons" USING btree (course_id);


--
-- Name: CourseApp_course_lessons_lesson_id_a39b9ca1; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "CourseApp_course_lessons_lesson_id_a39b9ca1" ON public."CourseApp_course_lessons" USING btree (lesson_id);


--
-- Name: LessonApp_lesson_topic_lesson_id_6fc8246d; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "LessonApp_lesson_topic_lesson_id_6fc8246d" ON public."LessonApp_lesson_topic" USING btree (lesson_id);


--
-- Name: LessonApp_lesson_topic_topic_id_e2fe5648; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "LessonApp_lesson_topic_topic_id_e2fe5648" ON public."LessonApp_lesson_topic" USING btree (topic_id);


--
-- Name: NotificationApp_usernotificationstatus_notification_id_b319ae11; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "NotificationApp_usernotificationstatus_notification_id_b319ae11" ON public."NotificationApp_usernotificationstatus" USING btree (notification_id);


--
-- Name: NotificationApp_usernotificationstatus_user_id_2fc8a2c7; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "NotificationApp_usernotificationstatus_user_id_2fc8a2c7" ON public."NotificationApp_usernotificationstatus" USING btree (user_id);


--
-- Name: PartnersApp_partners_user_id_b365d0aa; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "PartnersApp_partners_user_id_b365d0aa" ON public."PartnersApp_partners" USING btree (user_id);


--
-- Name: ProductApp_product_sub_product_product_id_c2e886d8; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "ProductApp_product_sub_product_product_id_c2e886d8" ON public."ProductApp_product_sub_product" USING btree (product_id);


--
-- Name: ProductApp_product_sub_product_subproduct_id_6d841672; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "ProductApp_product_sub_product_subproduct_id_6d841672" ON public."ProductApp_product_sub_product" USING btree (subproduct_id);


--
-- Name: RequestsApp_requestmodel_user_id_4ac868ed; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "RequestsApp_requestmodel_user_id_4ac868ed" ON public."RequestsApp_requestmodel" USING btree (user_id);


--
-- Name: SubscriptionApp_subscription_product_id_ca7cf556; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "SubscriptionApp_subscription_product_id_ca7cf556" ON public."SubscriptionApp_subscription" USING btree (product_id);


--
-- Name: SubscriptionApp_subscription_user_id_28d3fa0d; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "SubscriptionApp_subscription_user_id_28d3fa0d" ON public."SubscriptionApp_subscription" USING btree (user_id);


--
-- Name: TransactionApp_transaction_product_id_7dc216f0; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "TransactionApp_transaction_product_id_7dc216f0" ON public."TransactionApp_transaction" USING btree (product_id);


--
-- Name: TransactionApp_transaction_user_id_f9e73382; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "TransactionApp_transaction_user_id_f9e73382" ON public."TransactionApp_transaction" USING btree (user_id);


--
-- Name: UserApp_userdetails_groups_group_id_c560a12f; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "UserApp_userdetails_groups_group_id_c560a12f" ON public."UserApp_userdetails_groups" USING btree (group_id);


--
-- Name: UserApp_userdetails_groups_userdetails_id_171092df; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "UserApp_userdetails_groups_userdetails_id_171092df" ON public."UserApp_userdetails_groups" USING btree (userdetails_id);


--
-- Name: UserApp_userdetails_mobile_7e5569b2_like; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "UserApp_userdetails_mobile_7e5569b2_like" ON public."UserApp_userdetails" USING btree (mobile varchar_pattern_ops);


--
-- Name: UserApp_userdetails_referal_code_2e314e3d_like; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "UserApp_userdetails_referal_code_2e314e3d_like" ON public."UserApp_userdetails" USING btree (referal_code varchar_pattern_ops);


--
-- Name: UserApp_userdetails_user_permissions_permission_id_56d2d308; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "UserApp_userdetails_user_permissions_permission_id_56d2d308" ON public."UserApp_userdetails_user_permissions" USING btree (permission_id);


--
-- Name: UserApp_userdetails_user_permissions_userdetails_id_567955f6; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "UserApp_userdetails_user_permissions_userdetails_id_567955f6" ON public."UserApp_userdetails_user_permissions" USING btree (userdetails_id);


--
-- Name: UserApp_userdetails_username_59ca1088_like; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "UserApp_userdetails_username_59ca1088_like" ON public."UserApp_userdetails" USING btree (username varchar_pattern_ops);


--
-- Name: ZalgoAccountApp_zalgoaccount_user_id_1e932a84; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "ZalgoAccountApp_zalgoaccount_user_id_1e932a84" ON public."ZalgoAccountApp_zalgoaccount" USING btree (user_id);


--
-- Name: auth_group_name_a6ea08ec_like; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX auth_group_name_a6ea08ec_like ON public.auth_group USING btree (name varchar_pattern_ops);


--
-- Name: auth_group_permissions_group_id_b120cbf9; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX auth_group_permissions_group_id_b120cbf9 ON public.auth_group_permissions USING btree (group_id);


--
-- Name: auth_group_permissions_permission_id_84c5c92e; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX auth_group_permissions_permission_id_84c5c92e ON public.auth_group_permissions USING btree (permission_id);


--
-- Name: auth_permission_content_type_id_2f476e4b; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX auth_permission_content_type_id_2f476e4b ON public.auth_permission USING btree (content_type_id);


--
-- Name: authtoken_token_key_10f0b77e_like; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX authtoken_token_key_10f0b77e_like ON public.authtoken_token USING btree (key varchar_pattern_ops);


--
-- Name: django_admin_log_content_type_id_c4bce8eb; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX django_admin_log_content_type_id_c4bce8eb ON public.django_admin_log USING btree (content_type_id);


--
-- Name: django_admin_log_user_id_c564eba6; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX django_admin_log_user_id_c564eba6 ON public.django_admin_log USING btree (user_id);


--
-- Name: django_session_expire_date_a5c62663; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX django_session_expire_date_a5c62663 ON public.django_session USING btree (expire_date);


--
-- Name: django_session_session_key_c0390e0f_like; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX django_session_session_key_c0390e0f_like ON public.django_session USING btree (session_key varchar_pattern_ops);


--
-- Name: BannerApp_banner BannerApp_banner_product_id_79c493c9_fk_ProductApp_product_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."BannerApp_banner"
    ADD CONSTRAINT "BannerApp_banner_product_id_79c493c9_fk_ProductApp_product_id" FOREIGN KEY (product_id) REFERENCES public."ProductApp_product"(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: CourseApp_course_lessons CourseApp_course_les_course_id_cde5fba0_fk_CourseApp; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."CourseApp_course_lessons"
    ADD CONSTRAINT "CourseApp_course_les_course_id_cde5fba0_fk_CourseApp" FOREIGN KEY (course_id) REFERENCES public."CourseApp_course"(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: CourseApp_course_lessons CourseApp_course_les_lesson_id_a39b9ca1_fk_LessonApp; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."CourseApp_course_lessons"
    ADD CONSTRAINT "CourseApp_course_les_lesson_id_a39b9ca1_fk_LessonApp" FOREIGN KEY (lesson_id) REFERENCES public."LessonApp_lesson"(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: LessonApp_lesson_topic LessonApp_lesson_top_lesson_id_6fc8246d_fk_LessonApp; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."LessonApp_lesson_topic"
    ADD CONSTRAINT "LessonApp_lesson_top_lesson_id_6fc8246d_fk_LessonApp" FOREIGN KEY (lesson_id) REFERENCES public."LessonApp_lesson"(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: LessonApp_lesson_topic LessonApp_lesson_topic_topic_id_e2fe5648_fk_TopicApp_topic_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."LessonApp_lesson_topic"
    ADD CONSTRAINT "LessonApp_lesson_topic_topic_id_e2fe5648_fk_TopicApp_topic_id" FOREIGN KEY (topic_id) REFERENCES public."TopicApp_topic"(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: NotificationApp_usernotificationstatus NotificationApp_user_notification_id_b319ae11_fk_Notificat; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."NotificationApp_usernotificationstatus"
    ADD CONSTRAINT "NotificationApp_user_notification_id_b319ae11_fk_Notificat" FOREIGN KEY (notification_id) REFERENCES public."NotificationApp_notification"(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: NotificationApp_usernotificationstatus NotificationApp_user_user_id_2fc8a2c7_fk_UserApp_u; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."NotificationApp_usernotificationstatus"
    ADD CONSTRAINT "NotificationApp_user_user_id_2fc8a2c7_fk_UserApp_u" FOREIGN KEY (user_id) REFERENCES public."UserApp_userdetails"(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: PartnersApp_partners PartnersApp_partners_user_id_b365d0aa_fk_UserApp_userdetails_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."PartnersApp_partners"
    ADD CONSTRAINT "PartnersApp_partners_user_id_b365d0aa_fk_UserApp_userdetails_id" FOREIGN KEY (user_id) REFERENCES public."UserApp_userdetails"(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: ProductApp_product_sub_product ProductApp_product_s_product_id_c2e886d8_fk_ProductAp; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."ProductApp_product_sub_product"
    ADD CONSTRAINT "ProductApp_product_s_product_id_c2e886d8_fk_ProductAp" FOREIGN KEY (product_id) REFERENCES public."ProductApp_product"(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: ProductApp_product_sub_product ProductApp_product_s_subproduct_id_6d841672_fk_ProductAp; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."ProductApp_product_sub_product"
    ADD CONSTRAINT "ProductApp_product_s_subproduct_id_6d841672_fk_ProductAp" FOREIGN KEY (subproduct_id) REFERENCES public."ProductApp_subproduct"(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: RequestsApp_requestmodel RequestsApp_requestm_user_id_4ac868ed_fk_UserApp_u; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."RequestsApp_requestmodel"
    ADD CONSTRAINT "RequestsApp_requestm_user_id_4ac868ed_fk_UserApp_u" FOREIGN KEY (user_id) REFERENCES public."UserApp_userdetails"(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: SubscriptionApp_subscription SubscriptionApp_subs_product_id_ca7cf556_fk_ProductAp; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."SubscriptionApp_subscription"
    ADD CONSTRAINT "SubscriptionApp_subs_product_id_ca7cf556_fk_ProductAp" FOREIGN KEY (product_id) REFERENCES public."ProductApp_product"(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: SubscriptionApp_subscription SubscriptionApp_subs_user_id_28d3fa0d_fk_UserApp_u; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."SubscriptionApp_subscription"
    ADD CONSTRAINT "SubscriptionApp_subs_user_id_28d3fa0d_fk_UserApp_u" FOREIGN KEY (user_id) REFERENCES public."UserApp_userdetails"(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: TransactionApp_transaction TransactionApp_trans_product_id_7dc216f0_fk_ProductAp; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."TransactionApp_transaction"
    ADD CONSTRAINT "TransactionApp_trans_product_id_7dc216f0_fk_ProductAp" FOREIGN KEY (product_id) REFERENCES public."ProductApp_product"(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: TransactionApp_transaction TransactionApp_trans_user_id_f9e73382_fk_UserApp_u; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."TransactionApp_transaction"
    ADD CONSTRAINT "TransactionApp_trans_user_id_f9e73382_fk_UserApp_u" FOREIGN KEY (user_id) REFERENCES public."UserApp_userdetails"(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: UserApp_userdetails_user_permissions UserApp_userdetails__permission_id_56d2d308_fk_auth_perm; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."UserApp_userdetails_user_permissions"
    ADD CONSTRAINT "UserApp_userdetails__permission_id_56d2d308_fk_auth_perm" FOREIGN KEY (permission_id) REFERENCES public.auth_permission(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: UserApp_userdetails_groups UserApp_userdetails__userdetails_id_171092df_fk_UserApp_u; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."UserApp_userdetails_groups"
    ADD CONSTRAINT "UserApp_userdetails__userdetails_id_171092df_fk_UserApp_u" FOREIGN KEY (userdetails_id) REFERENCES public."UserApp_userdetails"(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: UserApp_userdetails_user_permissions UserApp_userdetails__userdetails_id_567955f6_fk_UserApp_u; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."UserApp_userdetails_user_permissions"
    ADD CONSTRAINT "UserApp_userdetails__userdetails_id_567955f6_fk_UserApp_u" FOREIGN KEY (userdetails_id) REFERENCES public."UserApp_userdetails"(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: UserApp_userdetails_groups UserApp_userdetails_groups_group_id_c560a12f_fk_auth_group_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."UserApp_userdetails_groups"
    ADD CONSTRAINT "UserApp_userdetails_groups_group_id_c560a12f_fk_auth_group_id" FOREIGN KEY (group_id) REFERENCES public.auth_group(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: ZalgoAccountApp_zalgoaccount ZalgoAccountApp_zalg_user_id_1e932a84_fk_UserApp_u; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."ZalgoAccountApp_zalgoaccount"
    ADD CONSTRAINT "ZalgoAccountApp_zalg_user_id_1e932a84_fk_UserApp_u" FOREIGN KEY (user_id) REFERENCES public."UserApp_userdetails"(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_group_permissions auth_group_permissio_permission_id_84c5c92e_fk_auth_perm; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_group_permissions
    ADD CONSTRAINT auth_group_permissio_permission_id_84c5c92e_fk_auth_perm FOREIGN KEY (permission_id) REFERENCES public.auth_permission(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_group_permissions auth_group_permissions_group_id_b120cbf9_fk_auth_group_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_group_permissions
    ADD CONSTRAINT auth_group_permissions_group_id_b120cbf9_fk_auth_group_id FOREIGN KEY (group_id) REFERENCES public.auth_group(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_permission auth_permission_content_type_id_2f476e4b_fk_django_co; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_permission
    ADD CONSTRAINT auth_permission_content_type_id_2f476e4b_fk_django_co FOREIGN KEY (content_type_id) REFERENCES public.django_content_type(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: authtoken_token authtoken_token_user_id_35299eff_fk_UserApp_userdetails_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.authtoken_token
    ADD CONSTRAINT "authtoken_token_user_id_35299eff_fk_UserApp_userdetails_id" FOREIGN KEY (user_id) REFERENCES public."UserApp_userdetails"(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: django_admin_log django_admin_log_content_type_id_c4bce8eb_fk_django_co; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.django_admin_log
    ADD CONSTRAINT django_admin_log_content_type_id_c4bce8eb_fk_django_co FOREIGN KEY (content_type_id) REFERENCES public.django_content_type(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: django_admin_log django_admin_log_user_id_c564eba6_fk_UserApp_userdetails_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.django_admin_log
    ADD CONSTRAINT "django_admin_log_user_id_c564eba6_fk_UserApp_userdetails_id" FOREIGN KEY (user_id) REFERENCES public."UserApp_userdetails"(id) DEFERRABLE INITIALLY DEFERRED;


--
-- PostgreSQL database dump complete
--

