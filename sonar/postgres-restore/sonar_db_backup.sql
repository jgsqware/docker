--
-- PostgreSQL database dump
--

SET statement_timeout = 0;
SET lock_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SET check_function_bodies = false;
SET client_min_messages = warning;

--
-- Name: plpgsql; Type: EXTENSION; Schema: -; Owner: 
--

CREATE EXTENSION IF NOT EXISTS plpgsql WITH SCHEMA pg_catalog;


--
-- Name: EXTENSION plpgsql; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION plpgsql IS 'PL/pgSQL procedural language';


SET search_path = public, pg_catalog;

SET default_tablespace = '';

SET default_with_oids = false;

--
-- Name: action_plans; Type: TABLE; Schema: public; Owner: sonar; Tablespace: 
--

CREATE TABLE action_plans (
    id bigint NOT NULL,
    created_at timestamp without time zone,
    updated_at timestamp without time zone,
    name character varying(200),
    description character varying(1000),
    deadline timestamp without time zone,
    user_login character varying(255),
    project_id integer,
    status character varying(10),
    kee character varying(100)
);


ALTER TABLE action_plans OWNER TO sonar;

--
-- Name: action_plans_id_seq; Type: SEQUENCE; Schema: public; Owner: sonar
--

CREATE SEQUENCE action_plans_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE action_plans_id_seq OWNER TO sonar;

--
-- Name: action_plans_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: sonar
--

ALTER SEQUENCE action_plans_id_seq OWNED BY action_plans.id;


--
-- Name: active_dashboards; Type: TABLE; Schema: public; Owner: sonar; Tablespace: 
--

CREATE TABLE active_dashboards (
    id integer NOT NULL,
    dashboard_id integer NOT NULL,
    user_id integer,
    order_index integer
);


ALTER TABLE active_dashboards OWNER TO sonar;

--
-- Name: active_dashboards_id_seq; Type: SEQUENCE; Schema: public; Owner: sonar
--

CREATE SEQUENCE active_dashboards_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE active_dashboards_id_seq OWNER TO sonar;

--
-- Name: active_dashboards_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: sonar
--

ALTER SEQUENCE active_dashboards_id_seq OWNED BY active_dashboards.id;


--
-- Name: active_rule_parameters; Type: TABLE; Schema: public; Owner: sonar; Tablespace: 
--

CREATE TABLE active_rule_parameters (
    id integer NOT NULL,
    active_rule_id integer NOT NULL,
    rules_parameter_id integer NOT NULL,
    value character varying(4000),
    rules_parameter_key character varying(128)
);


ALTER TABLE active_rule_parameters OWNER TO sonar;

--
-- Name: active_rule_parameters_id_seq; Type: SEQUENCE; Schema: public; Owner: sonar
--

CREATE SEQUENCE active_rule_parameters_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE active_rule_parameters_id_seq OWNER TO sonar;

--
-- Name: active_rule_parameters_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: sonar
--

ALTER SEQUENCE active_rule_parameters_id_seq OWNED BY active_rule_parameters.id;


--
-- Name: active_rules; Type: TABLE; Schema: public; Owner: sonar; Tablespace: 
--

CREATE TABLE active_rules (
    id integer NOT NULL,
    profile_id integer NOT NULL,
    rule_id integer NOT NULL,
    failure_level integer NOT NULL,
    inheritance character varying(10),
    created_at timestamp without time zone,
    updated_at timestamp without time zone
);


ALTER TABLE active_rules OWNER TO sonar;

--
-- Name: active_rules_id_seq; Type: SEQUENCE; Schema: public; Owner: sonar
--

CREATE SEQUENCE active_rules_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE active_rules_id_seq OWNER TO sonar;

--
-- Name: active_rules_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: sonar
--

ALTER SEQUENCE active_rules_id_seq OWNED BY active_rules.id;


--
-- Name: activities; Type: TABLE; Schema: public; Owner: sonar; Tablespace: 
--

CREATE TABLE activities (
    id integer NOT NULL,
    created_at timestamp without time zone NOT NULL,
    user_login character varying(255),
    data_field text,
    log_type character varying(50),
    log_action character varying(50),
    log_message character varying(4000),
    log_key character varying(250)
);


ALTER TABLE activities OWNER TO sonar;

--
-- Name: activities_id_seq; Type: SEQUENCE; Schema: public; Owner: sonar
--

CREATE SEQUENCE activities_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE activities_id_seq OWNER TO sonar;

--
-- Name: activities_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: sonar
--

ALTER SEQUENCE activities_id_seq OWNED BY activities.id;


--
-- Name: authors; Type: TABLE; Schema: public; Owner: sonar; Tablespace: 
--

CREATE TABLE authors (
    id integer NOT NULL,
    person_id integer NOT NULL,
    login character varying(255),
    created_at timestamp without time zone,
    updated_at timestamp without time zone
);


ALTER TABLE authors OWNER TO sonar;

--
-- Name: authors_id_seq; Type: SEQUENCE; Schema: public; Owner: sonar
--

CREATE SEQUENCE authors_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE authors_id_seq OWNER TO sonar;

--
-- Name: authors_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: sonar
--

ALTER SEQUENCE authors_id_seq OWNED BY authors.id;


--
-- Name: ce_activity; Type: TABLE; Schema: public; Owner: sonar; Tablespace: 
--

CREATE TABLE ce_activity (
    id integer NOT NULL,
    uuid character varying(40) NOT NULL,
    task_type character varying(15) NOT NULL,
    component_uuid character varying(40),
    status character varying(15) NOT NULL,
    is_last boolean NOT NULL,
    is_last_key character varying(55) NOT NULL,
    submitter_login character varying(255),
    submitted_at bigint NOT NULL,
    started_at bigint,
    executed_at bigint,
    created_at bigint NOT NULL,
    updated_at bigint NOT NULL,
    execution_time_ms bigint
);


ALTER TABLE ce_activity OWNER TO sonar;

--
-- Name: ce_activity_id_seq; Type: SEQUENCE; Schema: public; Owner: sonar
--

CREATE SEQUENCE ce_activity_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE ce_activity_id_seq OWNER TO sonar;

--
-- Name: ce_activity_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: sonar
--

ALTER SEQUENCE ce_activity_id_seq OWNED BY ce_activity.id;


--
-- Name: ce_queue; Type: TABLE; Schema: public; Owner: sonar; Tablespace: 
--

CREATE TABLE ce_queue (
    id integer NOT NULL,
    uuid character varying(40) NOT NULL,
    task_type character varying(15) NOT NULL,
    component_uuid character varying(40),
    status character varying(15) NOT NULL,
    submitter_login character varying(255),
    started_at bigint,
    created_at bigint NOT NULL,
    updated_at bigint NOT NULL
);


ALTER TABLE ce_queue OWNER TO sonar;

--
-- Name: ce_queue_id_seq; Type: SEQUENCE; Schema: public; Owner: sonar
--

CREATE SEQUENCE ce_queue_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE ce_queue_id_seq OWNER TO sonar;

--
-- Name: ce_queue_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: sonar
--

ALTER SEQUENCE ce_queue_id_seq OWNED BY ce_queue.id;


--
-- Name: characteristics; Type: TABLE; Schema: public; Owner: sonar; Tablespace: 
--

CREATE TABLE characteristics (
    id integer NOT NULL,
    kee character varying(100),
    name character varying(100),
    rule_id integer,
    characteristic_order integer,
    enabled boolean,
    parent_id integer,
    root_id integer,
    function_key character varying(100),
    factor_value numeric(30,20),
    factor_unit character varying(100),
    offset_value numeric(30,20),
    offset_unit character varying(100),
    created_at timestamp without time zone,
    updated_at timestamp without time zone
);


ALTER TABLE characteristics OWNER TO sonar;

--
-- Name: characteristics_id_seq; Type: SEQUENCE; Schema: public; Owner: sonar
--

CREATE SEQUENCE characteristics_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE characteristics_id_seq OWNER TO sonar;

--
-- Name: characteristics_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: sonar
--

ALTER SEQUENCE characteristics_id_seq OWNED BY characteristics.id;


--
-- Name: dashboards; Type: TABLE; Schema: public; Owner: sonar; Tablespace: 
--

CREATE TABLE dashboards (
    id integer NOT NULL,
    user_id integer,
    name character varying(256),
    description character varying(1000),
    column_layout character varying(20),
    shared boolean,
    created_at timestamp without time zone,
    updated_at timestamp without time zone,
    is_global boolean
);


ALTER TABLE dashboards OWNER TO sonar;

--
-- Name: dashboards_id_seq; Type: SEQUENCE; Schema: public; Owner: sonar
--

CREATE SEQUENCE dashboards_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE dashboards_id_seq OWNER TO sonar;

--
-- Name: dashboards_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: sonar
--

ALTER SEQUENCE dashboards_id_seq OWNED BY dashboards.id;


--
-- Name: duplications_index; Type: TABLE; Schema: public; Owner: sonar; Tablespace: 
--

CREATE TABLE duplications_index (
    project_snapshot_id integer NOT NULL,
    snapshot_id integer NOT NULL,
    hash character varying(50) NOT NULL,
    index_in_file integer NOT NULL,
    start_line integer NOT NULL,
    end_line integer NOT NULL,
    id bigint NOT NULL
);


ALTER TABLE duplications_index OWNER TO sonar;

--
-- Name: duplications_index_id_seq; Type: SEQUENCE; Schema: public; Owner: sonar
--

CREATE SEQUENCE duplications_index_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE duplications_index_id_seq OWNER TO sonar;

--
-- Name: duplications_index_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: sonar
--

ALTER SEQUENCE duplications_index_id_seq OWNED BY duplications_index.id;


--
-- Name: events; Type: TABLE; Schema: public; Owner: sonar; Tablespace: 
--

CREATE TABLE events (
    id integer NOT NULL,
    name character varying(400),
    snapshot_id integer,
    category character varying(50),
    description character varying(4000),
    event_data character varying(4000),
    event_date bigint NOT NULL,
    created_at bigint NOT NULL,
    component_uuid character varying(50)
);


ALTER TABLE events OWNER TO sonar;

--
-- Name: events_id_seq; Type: SEQUENCE; Schema: public; Owner: sonar
--

CREATE SEQUENCE events_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE events_id_seq OWNER TO sonar;

--
-- Name: events_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: sonar
--

ALTER SEQUENCE events_id_seq OWNED BY events.id;


--
-- Name: file_sources; Type: TABLE; Schema: public; Owner: sonar; Tablespace: 
--

CREATE TABLE file_sources (
    id integer NOT NULL,
    project_uuid character varying(50) NOT NULL,
    file_uuid character varying(50) NOT NULL,
    line_hashes text,
    data_hash character varying(50),
    created_at bigint NOT NULL,
    updated_at bigint NOT NULL,
    src_hash character varying(50),
    binary_data bytea,
    data_type character varying(20),
    revision character varying(100)
);


ALTER TABLE file_sources OWNER TO sonar;

--
-- Name: file_sources_id_seq; Type: SEQUENCE; Schema: public; Owner: sonar
--

CREATE SEQUENCE file_sources_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE file_sources_id_seq OWNER TO sonar;

--
-- Name: file_sources_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: sonar
--

ALTER SEQUENCE file_sources_id_seq OWNED BY file_sources.id;


--
-- Name: group_roles; Type: TABLE; Schema: public; Owner: sonar; Tablespace: 
--

CREATE TABLE group_roles (
    id integer NOT NULL,
    group_id integer,
    resource_id integer,
    role character varying(64) NOT NULL
);


ALTER TABLE group_roles OWNER TO sonar;

--
-- Name: group_roles_id_seq; Type: SEQUENCE; Schema: public; Owner: sonar
--

CREATE SEQUENCE group_roles_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE group_roles_id_seq OWNER TO sonar;

--
-- Name: group_roles_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: sonar
--

ALTER SEQUENCE group_roles_id_seq OWNED BY group_roles.id;


--
-- Name: groups; Type: TABLE; Schema: public; Owner: sonar; Tablespace: 
--

CREATE TABLE groups (
    id integer NOT NULL,
    name character varying(500),
    description character varying(200),
    created_at timestamp without time zone,
    updated_at timestamp without time zone
);


ALTER TABLE groups OWNER TO sonar;

--
-- Name: groups_id_seq; Type: SEQUENCE; Schema: public; Owner: sonar
--

CREATE SEQUENCE groups_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE groups_id_seq OWNER TO sonar;

--
-- Name: groups_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: sonar
--

ALTER SEQUENCE groups_id_seq OWNED BY groups.id;


--
-- Name: groups_users; Type: TABLE; Schema: public; Owner: sonar; Tablespace: 
--

CREATE TABLE groups_users (
    user_id integer,
    group_id integer
);


ALTER TABLE groups_users OWNER TO sonar;

--
-- Name: issue_changes; Type: TABLE; Schema: public; Owner: sonar; Tablespace: 
--

CREATE TABLE issue_changes (
    id bigint NOT NULL,
    kee character varying(50),
    issue_key character varying(50) NOT NULL,
    user_login character varying(40),
    change_type character varying(20),
    change_data text,
    created_at bigint,
    updated_at bigint,
    issue_change_creation_date bigint
);


ALTER TABLE issue_changes OWNER TO sonar;

--
-- Name: issue_changes_id_seq; Type: SEQUENCE; Schema: public; Owner: sonar
--

CREATE SEQUENCE issue_changes_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE issue_changes_id_seq OWNER TO sonar;

--
-- Name: issue_changes_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: sonar
--

ALTER SEQUENCE issue_changes_id_seq OWNED BY issue_changes.id;


--
-- Name: issue_filter_favourites; Type: TABLE; Schema: public; Owner: sonar; Tablespace: 
--

CREATE TABLE issue_filter_favourites (
    id integer NOT NULL,
    user_login character varying(255) NOT NULL,
    issue_filter_id integer NOT NULL,
    created_at timestamp without time zone
);


ALTER TABLE issue_filter_favourites OWNER TO sonar;

--
-- Name: issue_filter_favourites_id_seq; Type: SEQUENCE; Schema: public; Owner: sonar
--

CREATE SEQUENCE issue_filter_favourites_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE issue_filter_favourites_id_seq OWNER TO sonar;

--
-- Name: issue_filter_favourites_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: sonar
--

ALTER SEQUENCE issue_filter_favourites_id_seq OWNED BY issue_filter_favourites.id;


--
-- Name: issue_filters; Type: TABLE; Schema: public; Owner: sonar; Tablespace: 
--

CREATE TABLE issue_filters (
    id integer NOT NULL,
    name character varying(100) NOT NULL,
    user_login character varying(255),
    shared boolean DEFAULT false NOT NULL,
    description character varying(4000),
    data text,
    created_at timestamp without time zone,
    updated_at timestamp without time zone
);


ALTER TABLE issue_filters OWNER TO sonar;

--
-- Name: issue_filters_id_seq; Type: SEQUENCE; Schema: public; Owner: sonar
--

CREATE SEQUENCE issue_filters_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE issue_filters_id_seq OWNER TO sonar;

--
-- Name: issue_filters_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: sonar
--

ALTER SEQUENCE issue_filters_id_seq OWNED BY issue_filters.id;


--
-- Name: issues; Type: TABLE; Schema: public; Owner: sonar; Tablespace: 
--

CREATE TABLE issues (
    id bigint NOT NULL,
    kee character varying(50) NOT NULL,
    rule_id integer,
    severity character varying(10),
    manual_severity boolean NOT NULL,
    message character varying(4000),
    line integer,
    effort_to_fix numeric(30,20),
    status character varying(20),
    resolution character varying(20),
    checksum character varying(1000),
    reporter character varying(255),
    assignee character varying(255),
    author_login character varying(255),
    action_plan_key character varying(50),
    issue_attributes character varying(4000),
    technical_debt integer,
    created_at bigint,
    updated_at bigint,
    issue_creation_date bigint,
    issue_update_date bigint,
    issue_close_date bigint,
    tags character varying(4000),
    component_uuid character varying(50),
    project_uuid character varying(50),
    locations bytea
);


ALTER TABLE issues OWNER TO sonar;

--
-- Name: issues_id_seq; Type: SEQUENCE; Schema: public; Owner: sonar
--

CREATE SEQUENCE issues_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE issues_id_seq OWNER TO sonar;

--
-- Name: issues_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: sonar
--

ALTER SEQUENCE issues_id_seq OWNED BY issues.id;


--
-- Name: loaded_templates; Type: TABLE; Schema: public; Owner: sonar; Tablespace: 
--

CREATE TABLE loaded_templates (
    id integer NOT NULL,
    kee character varying(200),
    template_type character varying(15)
);


ALTER TABLE loaded_templates OWNER TO sonar;

--
-- Name: loaded_templates_id_seq; Type: SEQUENCE; Schema: public; Owner: sonar
--

CREATE SEQUENCE loaded_templates_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE loaded_templates_id_seq OWNER TO sonar;

--
-- Name: loaded_templates_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: sonar
--

ALTER SEQUENCE loaded_templates_id_seq OWNED BY loaded_templates.id;


--
-- Name: manual_measures; Type: TABLE; Schema: public; Owner: sonar; Tablespace: 
--

CREATE TABLE manual_measures (
    id bigint NOT NULL,
    metric_id integer NOT NULL,
    value numeric(38,20),
    text_value character varying(4000),
    user_login character varying(255),
    description character varying(4000),
    created_at bigint,
    updated_at bigint,
    component_uuid character varying(50)
);


ALTER TABLE manual_measures OWNER TO sonar;

--
-- Name: manual_measures_id_seq; Type: SEQUENCE; Schema: public; Owner: sonar
--

CREATE SEQUENCE manual_measures_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE manual_measures_id_seq OWNER TO sonar;

--
-- Name: manual_measures_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: sonar
--

ALTER SEQUENCE manual_measures_id_seq OWNED BY manual_measures.id;


--
-- Name: measure_filter_favourites; Type: TABLE; Schema: public; Owner: sonar; Tablespace: 
--

CREATE TABLE measure_filter_favourites (
    id integer NOT NULL,
    user_id integer NOT NULL,
    measure_filter_id integer NOT NULL,
    created_at timestamp without time zone
);


ALTER TABLE measure_filter_favourites OWNER TO sonar;

--
-- Name: measure_filter_favourites_id_seq; Type: SEQUENCE; Schema: public; Owner: sonar
--

CREATE SEQUENCE measure_filter_favourites_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE measure_filter_favourites_id_seq OWNER TO sonar;

--
-- Name: measure_filter_favourites_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: sonar
--

ALTER SEQUENCE measure_filter_favourites_id_seq OWNED BY measure_filter_favourites.id;


--
-- Name: measure_filters; Type: TABLE; Schema: public; Owner: sonar; Tablespace: 
--

CREATE TABLE measure_filters (
    id integer NOT NULL,
    name character varying(100) NOT NULL,
    user_id integer,
    shared boolean DEFAULT false NOT NULL,
    description character varying(4000),
    data text,
    created_at timestamp without time zone,
    updated_at timestamp without time zone
);


ALTER TABLE measure_filters OWNER TO sonar;

--
-- Name: measure_filters_id_seq; Type: SEQUENCE; Schema: public; Owner: sonar
--

CREATE SEQUENCE measure_filters_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE measure_filters_id_seq OWNER TO sonar;

--
-- Name: measure_filters_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: sonar
--

ALTER SEQUENCE measure_filters_id_seq OWNED BY measure_filters.id;


--
-- Name: metrics; Type: TABLE; Schema: public; Owner: sonar; Tablespace: 
--

CREATE TABLE metrics (
    id integer NOT NULL,
    name character varying(64) NOT NULL,
    description character varying(255),
    direction integer DEFAULT 0 NOT NULL,
    domain character varying(64),
    short_name character varying(64),
    qualitative boolean DEFAULT false NOT NULL,
    val_type character varying(8),
    user_managed boolean DEFAULT false,
    enabled boolean DEFAULT true,
    worst_value numeric(38,20),
    best_value numeric(38,20),
    optimized_best_value boolean,
    hidden boolean,
    delete_historical_data boolean
);


ALTER TABLE metrics OWNER TO sonar;

--
-- Name: metrics_id_seq; Type: SEQUENCE; Schema: public; Owner: sonar
--

CREATE SEQUENCE metrics_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE metrics_id_seq OWNER TO sonar;

--
-- Name: metrics_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: sonar
--

ALTER SEQUENCE metrics_id_seq OWNED BY metrics.id;


--
-- Name: notifications; Type: TABLE; Schema: public; Owner: sonar; Tablespace: 
--

CREATE TABLE notifications (
    id integer NOT NULL,
    data bytea
);


ALTER TABLE notifications OWNER TO sonar;

--
-- Name: notifications_id_seq; Type: SEQUENCE; Schema: public; Owner: sonar
--

CREATE SEQUENCE notifications_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE notifications_id_seq OWNER TO sonar;

--
-- Name: notifications_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: sonar
--

ALTER SEQUENCE notifications_id_seq OWNED BY notifications.id;


--
-- Name: perm_templates_groups; Type: TABLE; Schema: public; Owner: sonar; Tablespace: 
--

CREATE TABLE perm_templates_groups (
    id integer NOT NULL,
    group_id integer,
    template_id integer NOT NULL,
    permission_reference character varying(64) NOT NULL,
    created_at timestamp without time zone,
    updated_at timestamp without time zone
);


ALTER TABLE perm_templates_groups OWNER TO sonar;

--
-- Name: perm_templates_groups_id_seq; Type: SEQUENCE; Schema: public; Owner: sonar
--

CREATE SEQUENCE perm_templates_groups_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE perm_templates_groups_id_seq OWNER TO sonar;

--
-- Name: perm_templates_groups_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: sonar
--

ALTER SEQUENCE perm_templates_groups_id_seq OWNED BY perm_templates_groups.id;


--
-- Name: perm_templates_users; Type: TABLE; Schema: public; Owner: sonar; Tablespace: 
--

CREATE TABLE perm_templates_users (
    id integer NOT NULL,
    user_id integer NOT NULL,
    template_id integer NOT NULL,
    permission_reference character varying(64) NOT NULL,
    created_at timestamp without time zone,
    updated_at timestamp without time zone
);


ALTER TABLE perm_templates_users OWNER TO sonar;

--
-- Name: perm_templates_users_id_seq; Type: SEQUENCE; Schema: public; Owner: sonar
--

CREATE SEQUENCE perm_templates_users_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE perm_templates_users_id_seq OWNER TO sonar;

--
-- Name: perm_templates_users_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: sonar
--

ALTER SEQUENCE perm_templates_users_id_seq OWNED BY perm_templates_users.id;


--
-- Name: permission_templates; Type: TABLE; Schema: public; Owner: sonar; Tablespace: 
--

CREATE TABLE permission_templates (
    id integer NOT NULL,
    name character varying(100) NOT NULL,
    kee character varying(100) NOT NULL,
    description character varying(4000),
    created_at timestamp without time zone,
    updated_at timestamp without time zone,
    key_pattern character varying(500)
);


ALTER TABLE permission_templates OWNER TO sonar;

--
-- Name: permission_templates_id_seq; Type: SEQUENCE; Schema: public; Owner: sonar
--

CREATE SEQUENCE permission_templates_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE permission_templates_id_seq OWNER TO sonar;

--
-- Name: permission_templates_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: sonar
--

ALTER SEQUENCE permission_templates_id_seq OWNED BY permission_templates.id;


--
-- Name: project_links; Type: TABLE; Schema: public; Owner: sonar; Tablespace: 
--

CREATE TABLE project_links (
    id integer NOT NULL,
    link_type character varying(20),
    name character varying(128),
    href character varying(2048) NOT NULL,
    component_uuid character varying(50)
);


ALTER TABLE project_links OWNER TO sonar;

--
-- Name: project_links_id_seq; Type: SEQUENCE; Schema: public; Owner: sonar
--

CREATE SEQUENCE project_links_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE project_links_id_seq OWNER TO sonar;

--
-- Name: project_links_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: sonar
--

ALTER SEQUENCE project_links_id_seq OWNED BY project_links.id;


--
-- Name: project_measures; Type: TABLE; Schema: public; Owner: sonar; Tablespace: 
--

CREATE TABLE project_measures (
    id bigint NOT NULL,
    value numeric(38,20),
    metric_id integer NOT NULL,
    snapshot_id integer,
    rule_id integer,
    rules_category_id integer,
    text_value character varying(4000),
    tendency integer,
    measure_date timestamp without time zone,
    project_id integer,
    alert_status character varying(5),
    alert_text character varying(4000),
    url character varying(2000),
    description character varying(4000),
    rule_priority integer,
    characteristic_id integer,
    person_id integer,
    variation_value_1 numeric(38,20),
    variation_value_2 numeric(38,20),
    variation_value_3 numeric(38,20),
    variation_value_4 numeric(38,20),
    variation_value_5 numeric(38,20),
    measure_data bytea
);


ALTER TABLE project_measures OWNER TO sonar;

--
-- Name: project_measures_id_seq; Type: SEQUENCE; Schema: public; Owner: sonar
--

CREATE SEQUENCE project_measures_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE project_measures_id_seq OWNER TO sonar;

--
-- Name: project_measures_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: sonar
--

ALTER SEQUENCE project_measures_id_seq OWNED BY project_measures.id;


--
-- Name: project_qprofiles; Type: TABLE; Schema: public; Owner: sonar; Tablespace: 
--

CREATE TABLE project_qprofiles (
    id integer NOT NULL,
    project_uuid character varying(50) NOT NULL,
    profile_key character varying(255) NOT NULL
);


ALTER TABLE project_qprofiles OWNER TO sonar;

--
-- Name: project_qprofiles_id_seq; Type: SEQUENCE; Schema: public; Owner: sonar
--

CREATE SEQUENCE project_qprofiles_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE project_qprofiles_id_seq OWNER TO sonar;

--
-- Name: project_qprofiles_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: sonar
--

ALTER SEQUENCE project_qprofiles_id_seq OWNED BY project_qprofiles.id;


--
-- Name: projects; Type: TABLE; Schema: public; Owner: sonar; Tablespace: 
--

CREATE TABLE projects (
    id integer NOT NULL,
    name character varying(256),
    description character varying(2000),
    enabled boolean DEFAULT true NOT NULL,
    scope character varying(3),
    qualifier character varying(10),
    kee character varying(400),
    root_id integer,
    language character varying(20),
    copy_resource_id integer,
    long_name character varying(256),
    person_id integer,
    created_at timestamp without time zone,
    path character varying(2000),
    deprecated_kee character varying(400),
    uuid character varying(50),
    project_uuid character varying(50),
    module_uuid character varying(50),
    module_uuid_path character varying(4000),
    authorization_updated_at bigint
);


ALTER TABLE projects OWNER TO sonar;

--
-- Name: projects_id_seq; Type: SEQUENCE; Schema: public; Owner: sonar
--

CREATE SEQUENCE projects_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE projects_id_seq OWNER TO sonar;

--
-- Name: projects_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: sonar
--

ALTER SEQUENCE projects_id_seq OWNED BY projects.id;


--
-- Name: properties; Type: TABLE; Schema: public; Owner: sonar; Tablespace: 
--

CREATE TABLE properties (
    id integer NOT NULL,
    prop_key character varying(512),
    resource_id integer,
    text_value text,
    user_id integer
);


ALTER TABLE properties OWNER TO sonar;

--
-- Name: properties_id_seq; Type: SEQUENCE; Schema: public; Owner: sonar
--

CREATE SEQUENCE properties_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE properties_id_seq OWNER TO sonar;

--
-- Name: properties_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: sonar
--

ALTER SEQUENCE properties_id_seq OWNED BY properties.id;


--
-- Name: quality_gate_conditions; Type: TABLE; Schema: public; Owner: sonar; Tablespace: 
--

CREATE TABLE quality_gate_conditions (
    id integer NOT NULL,
    qgate_id integer,
    metric_id integer,
    period integer,
    operator character varying(3),
    value_error character varying(64),
    value_warning character varying(64),
    created_at timestamp without time zone,
    updated_at timestamp without time zone
);


ALTER TABLE quality_gate_conditions OWNER TO sonar;

--
-- Name: quality_gate_conditions_id_seq; Type: SEQUENCE; Schema: public; Owner: sonar
--

CREATE SEQUENCE quality_gate_conditions_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE quality_gate_conditions_id_seq OWNER TO sonar;

--
-- Name: quality_gate_conditions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: sonar
--

ALTER SEQUENCE quality_gate_conditions_id_seq OWNED BY quality_gate_conditions.id;


--
-- Name: quality_gates; Type: TABLE; Schema: public; Owner: sonar; Tablespace: 
--

CREATE TABLE quality_gates (
    id integer NOT NULL,
    name character varying(100) NOT NULL,
    created_at timestamp without time zone,
    updated_at timestamp without time zone
);


ALTER TABLE quality_gates OWNER TO sonar;

--
-- Name: quality_gates_id_seq; Type: SEQUENCE; Schema: public; Owner: sonar
--

CREATE SEQUENCE quality_gates_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE quality_gates_id_seq OWNER TO sonar;

--
-- Name: quality_gates_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: sonar
--

ALTER SEQUENCE quality_gates_id_seq OWNED BY quality_gates.id;


--
-- Name: resource_index; Type: TABLE; Schema: public; Owner: sonar; Tablespace: 
--

CREATE TABLE resource_index (
    id integer NOT NULL,
    kee character varying(400) NOT NULL,
    "position" integer NOT NULL,
    name_size integer NOT NULL,
    resource_id integer NOT NULL,
    root_project_id integer NOT NULL,
    qualifier character varying(10) NOT NULL
);


ALTER TABLE resource_index OWNER TO sonar;

--
-- Name: resource_index_id_seq; Type: SEQUENCE; Schema: public; Owner: sonar
--

CREATE SEQUENCE resource_index_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE resource_index_id_seq OWNER TO sonar;

--
-- Name: resource_index_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: sonar
--

ALTER SEQUENCE resource_index_id_seq OWNED BY resource_index.id;


--
-- Name: rules; Type: TABLE; Schema: public; Owner: sonar; Tablespace: 
--

CREATE TABLE rules (
    id integer NOT NULL,
    name character varying(200),
    plugin_rule_key character varying(200) NOT NULL,
    plugin_config_key character varying(200),
    plugin_name character varying(255) NOT NULL,
    description text,
    priority integer,
    template_id integer,
    status character varying(40),
    language character varying(20),
    created_at timestamp without time zone,
    updated_at timestamp without time zone,
    note_created_at timestamp without time zone,
    note_updated_at timestamp without time zone,
    note_user_login character varying(255),
    note_data text,
    characteristic_id integer,
    default_characteristic_id integer,
    remediation_function character varying(20),
    default_remediation_function character varying(20),
    remediation_coeff character varying(20),
    default_remediation_coeff character varying(20),
    remediation_offset character varying(20),
    default_remediation_offset character varying(20),
    effort_to_fix_description character varying(4000),
    tags character varying(4000),
    system_tags character varying(4000),
    is_template boolean DEFAULT false NOT NULL,
    description_format character varying(20)
);


ALTER TABLE rules OWNER TO sonar;

--
-- Name: rules_id_seq; Type: SEQUENCE; Schema: public; Owner: sonar
--

CREATE SEQUENCE rules_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE rules_id_seq OWNER TO sonar;

--
-- Name: rules_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: sonar
--

ALTER SEQUENCE rules_id_seq OWNED BY rules.id;


--
-- Name: rules_parameters; Type: TABLE; Schema: public; Owner: sonar; Tablespace: 
--

CREATE TABLE rules_parameters (
    id integer NOT NULL,
    rule_id integer NOT NULL,
    name character varying(128) NOT NULL,
    description character varying(4000),
    param_type character varying(512) NOT NULL,
    default_value character varying(4000)
);


ALTER TABLE rules_parameters OWNER TO sonar;

--
-- Name: rules_parameters_id_seq; Type: SEQUENCE; Schema: public; Owner: sonar
--

CREATE SEQUENCE rules_parameters_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE rules_parameters_id_seq OWNER TO sonar;

--
-- Name: rules_parameters_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: sonar
--

ALTER SEQUENCE rules_parameters_id_seq OWNED BY rules_parameters.id;


--
-- Name: rules_profiles; Type: TABLE; Schema: public; Owner: sonar; Tablespace: 
--

CREATE TABLE rules_profiles (
    id integer NOT NULL,
    name character varying(100) NOT NULL,
    language character varying(20),
    kee character varying(255) NOT NULL,
    parent_kee character varying(255),
    rules_updated_at character varying(100),
    created_at timestamp without time zone,
    updated_at timestamp without time zone,
    is_default boolean DEFAULT false NOT NULL
);


ALTER TABLE rules_profiles OWNER TO sonar;

--
-- Name: rules_profiles_id_seq; Type: SEQUENCE; Schema: public; Owner: sonar
--

CREATE SEQUENCE rules_profiles_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE rules_profiles_id_seq OWNER TO sonar;

--
-- Name: rules_profiles_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: sonar
--

ALTER SEQUENCE rules_profiles_id_seq OWNED BY rules_profiles.id;


--
-- Name: schema_migrations; Type: TABLE; Schema: public; Owner: sonar; Tablespace: 
--

CREATE TABLE schema_migrations (
    version character varying(255) NOT NULL
);


ALTER TABLE schema_migrations OWNER TO sonar;

--
-- Name: snapshots; Type: TABLE; Schema: public; Owner: sonar; Tablespace: 
--

CREATE TABLE snapshots (
    id integer NOT NULL,
    project_id integer NOT NULL,
    parent_snapshot_id integer,
    status character varying(4) DEFAULT 'U'::character varying NOT NULL,
    islast boolean DEFAULT false NOT NULL,
    scope character varying(10),
    qualifier character varying(3),
    root_snapshot_id integer,
    version character varying(500),
    path character varying(500),
    depth integer,
    root_project_id integer,
    purge_status integer,
    period1_mode character varying(100),
    period1_param character varying(100),
    period2_mode character varying(100),
    period2_param character varying(100),
    period3_mode character varying(100),
    period3_param character varying(100),
    period4_mode character varying(100),
    period4_param character varying(100),
    period5_mode character varying(100),
    period5_param character varying(100),
    created_at bigint,
    build_date bigint,
    period1_date bigint,
    period2_date bigint,
    period3_date bigint,
    period4_date bigint,
    period5_date bigint
);


ALTER TABLE snapshots OWNER TO sonar;

--
-- Name: snapshots_id_seq; Type: SEQUENCE; Schema: public; Owner: sonar
--

CREATE SEQUENCE snapshots_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE snapshots_id_seq OWNER TO sonar;

--
-- Name: snapshots_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: sonar
--

ALTER SEQUENCE snapshots_id_seq OWNED BY snapshots.id;


--
-- Name: user_roles; Type: TABLE; Schema: public; Owner: sonar; Tablespace: 
--

CREATE TABLE user_roles (
    id integer NOT NULL,
    user_id integer,
    resource_id integer,
    role character varying(64) NOT NULL
);


ALTER TABLE user_roles OWNER TO sonar;

--
-- Name: user_roles_id_seq; Type: SEQUENCE; Schema: public; Owner: sonar
--

CREATE SEQUENCE user_roles_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE user_roles_id_seq OWNER TO sonar;

--
-- Name: user_roles_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: sonar
--

ALTER SEQUENCE user_roles_id_seq OWNED BY user_roles.id;


--
-- Name: users; Type: TABLE; Schema: public; Owner: sonar; Tablespace: 
--

CREATE TABLE users (
    id integer NOT NULL,
    login character varying(255),
    name character varying(200),
    email character varying(100),
    crypted_password character varying(40),
    salt character varying(40),
    remember_token character varying(500),
    remember_token_expires_at timestamp without time zone,
    active boolean DEFAULT true,
    created_at bigint,
    updated_at bigint,
    scm_accounts character varying(4000)
);


ALTER TABLE users OWNER TO sonar;

--
-- Name: users_id_seq; Type: SEQUENCE; Schema: public; Owner: sonar
--

CREATE SEQUENCE users_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE users_id_seq OWNER TO sonar;

--
-- Name: users_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: sonar
--

ALTER SEQUENCE users_id_seq OWNED BY users.id;


--
-- Name: widget_properties; Type: TABLE; Schema: public; Owner: sonar; Tablespace: 
--

CREATE TABLE widget_properties (
    id integer NOT NULL,
    widget_id integer NOT NULL,
    kee character varying(100),
    text_value character varying(4000)
);


ALTER TABLE widget_properties OWNER TO sonar;

--
-- Name: widget_properties_id_seq; Type: SEQUENCE; Schema: public; Owner: sonar
--

CREATE SEQUENCE widget_properties_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE widget_properties_id_seq OWNER TO sonar;

--
-- Name: widget_properties_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: sonar
--

ALTER SEQUENCE widget_properties_id_seq OWNED BY widget_properties.id;


--
-- Name: widgets; Type: TABLE; Schema: public; Owner: sonar; Tablespace: 
--

CREATE TABLE widgets (
    id integer NOT NULL,
    dashboard_id integer NOT NULL,
    widget_key character varying(256) NOT NULL,
    name character varying(256),
    description character varying(1000),
    column_index integer,
    row_index integer,
    configured boolean,
    created_at timestamp without time zone,
    updated_at timestamp without time zone,
    resource_id integer
);


ALTER TABLE widgets OWNER TO sonar;

--
-- Name: widgets_id_seq; Type: SEQUENCE; Schema: public; Owner: sonar
--

CREATE SEQUENCE widgets_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE widgets_id_seq OWNER TO sonar;

--
-- Name: widgets_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: sonar
--

ALTER SEQUENCE widgets_id_seq OWNED BY widgets.id;


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: sonar
--

ALTER TABLE ONLY action_plans ALTER COLUMN id SET DEFAULT nextval('action_plans_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: sonar
--

ALTER TABLE ONLY active_dashboards ALTER COLUMN id SET DEFAULT nextval('active_dashboards_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: sonar
--

ALTER TABLE ONLY active_rule_parameters ALTER COLUMN id SET DEFAULT nextval('active_rule_parameters_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: sonar
--

ALTER TABLE ONLY active_rules ALTER COLUMN id SET DEFAULT nextval('active_rules_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: sonar
--

ALTER TABLE ONLY activities ALTER COLUMN id SET DEFAULT nextval('activities_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: sonar
--

ALTER TABLE ONLY authors ALTER COLUMN id SET DEFAULT nextval('authors_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: sonar
--

ALTER TABLE ONLY ce_activity ALTER COLUMN id SET DEFAULT nextval('ce_activity_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: sonar
--

ALTER TABLE ONLY ce_queue ALTER COLUMN id SET DEFAULT nextval('ce_queue_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: sonar
--

ALTER TABLE ONLY characteristics ALTER COLUMN id SET DEFAULT nextval('characteristics_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: sonar
--

ALTER TABLE ONLY dashboards ALTER COLUMN id SET DEFAULT nextval('dashboards_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: sonar
--

ALTER TABLE ONLY duplications_index ALTER COLUMN id SET DEFAULT nextval('duplications_index_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: sonar
--

ALTER TABLE ONLY events ALTER COLUMN id SET DEFAULT nextval('events_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: sonar
--

ALTER TABLE ONLY file_sources ALTER COLUMN id SET DEFAULT nextval('file_sources_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: sonar
--

ALTER TABLE ONLY group_roles ALTER COLUMN id SET DEFAULT nextval('group_roles_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: sonar
--

ALTER TABLE ONLY groups ALTER COLUMN id SET DEFAULT nextval('groups_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: sonar
--

ALTER TABLE ONLY issue_changes ALTER COLUMN id SET DEFAULT nextval('issue_changes_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: sonar
--

ALTER TABLE ONLY issue_filter_favourites ALTER COLUMN id SET DEFAULT nextval('issue_filter_favourites_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: sonar
--

ALTER TABLE ONLY issue_filters ALTER COLUMN id SET DEFAULT nextval('issue_filters_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: sonar
--

ALTER TABLE ONLY issues ALTER COLUMN id SET DEFAULT nextval('issues_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: sonar
--

ALTER TABLE ONLY loaded_templates ALTER COLUMN id SET DEFAULT nextval('loaded_templates_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: sonar
--

ALTER TABLE ONLY manual_measures ALTER COLUMN id SET DEFAULT nextval('manual_measures_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: sonar
--

ALTER TABLE ONLY measure_filter_favourites ALTER COLUMN id SET DEFAULT nextval('measure_filter_favourites_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: sonar
--

ALTER TABLE ONLY measure_filters ALTER COLUMN id SET DEFAULT nextval('measure_filters_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: sonar
--

ALTER TABLE ONLY metrics ALTER COLUMN id SET DEFAULT nextval('metrics_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: sonar
--

ALTER TABLE ONLY notifications ALTER COLUMN id SET DEFAULT nextval('notifications_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: sonar
--

ALTER TABLE ONLY perm_templates_groups ALTER COLUMN id SET DEFAULT nextval('perm_templates_groups_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: sonar
--

ALTER TABLE ONLY perm_templates_users ALTER COLUMN id SET DEFAULT nextval('perm_templates_users_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: sonar
--

ALTER TABLE ONLY permission_templates ALTER COLUMN id SET DEFAULT nextval('permission_templates_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: sonar
--

ALTER TABLE ONLY project_links ALTER COLUMN id SET DEFAULT nextval('project_links_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: sonar
--

ALTER TABLE ONLY project_measures ALTER COLUMN id SET DEFAULT nextval('project_measures_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: sonar
--

ALTER TABLE ONLY project_qprofiles ALTER COLUMN id SET DEFAULT nextval('project_qprofiles_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: sonar
--

ALTER TABLE ONLY projects ALTER COLUMN id SET DEFAULT nextval('projects_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: sonar
--

ALTER TABLE ONLY properties ALTER COLUMN id SET DEFAULT nextval('properties_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: sonar
--

ALTER TABLE ONLY quality_gate_conditions ALTER COLUMN id SET DEFAULT nextval('quality_gate_conditions_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: sonar
--

ALTER TABLE ONLY quality_gates ALTER COLUMN id SET DEFAULT nextval('quality_gates_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: sonar
--

ALTER TABLE ONLY resource_index ALTER COLUMN id SET DEFAULT nextval('resource_index_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: sonar
--

ALTER TABLE ONLY rules ALTER COLUMN id SET DEFAULT nextval('rules_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: sonar
--

ALTER TABLE ONLY rules_parameters ALTER COLUMN id SET DEFAULT nextval('rules_parameters_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: sonar
--

ALTER TABLE ONLY rules_profiles ALTER COLUMN id SET DEFAULT nextval('rules_profiles_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: sonar
--

ALTER TABLE ONLY snapshots ALTER COLUMN id SET DEFAULT nextval('snapshots_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: sonar
--

ALTER TABLE ONLY user_roles ALTER COLUMN id SET DEFAULT nextval('user_roles_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: sonar
--

ALTER TABLE ONLY users ALTER COLUMN id SET DEFAULT nextval('users_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: sonar
--

ALTER TABLE ONLY widget_properties ALTER COLUMN id SET DEFAULT nextval('widget_properties_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: sonar
--

ALTER TABLE ONLY widgets ALTER COLUMN id SET DEFAULT nextval('widgets_id_seq'::regclass);


--
-- Data for Name: action_plans; Type: TABLE DATA; Schema: public; Owner: sonar
--

COPY action_plans (id, created_at, updated_at, name, description, deadline, user_login, project_id, status, kee) FROM stdin;
\.


--
-- Name: action_plans_id_seq; Type: SEQUENCE SET; Schema: public; Owner: sonar
--

SELECT pg_catalog.setval('action_plans_id_seq', 1, false);


--
-- Data for Name: active_dashboards; Type: TABLE DATA; Schema: public; Owner: sonar
--

COPY active_dashboards (id, dashboard_id, user_id, order_index) FROM stdin;
1	1	\N	1
2	4	\N	2
3	2	\N	3
4	3	\N	4
\.


--
-- Name: active_dashboards_id_seq; Type: SEQUENCE SET; Schema: public; Owner: sonar
--

SELECT pg_catalog.setval('active_dashboards_id_seq', 4, true);


--
-- Data for Name: active_rule_parameters; Type: TABLE DATA; Schema: public; Owner: sonar
--

COPY active_rule_parameters (id, active_rule_id, rules_parameter_id, value, rules_parameter_key) FROM stdin;
1	2	1	65.0	minimumBranchCoverageRatio
2	4	27	10	Threshold
3	5	34	200	max
4	8	36	7	max
5	8	37	7	constructorMax
6	10	26	^[a-z][a-zA-Z0-9]*$	format
7	11	25	^[A-Z][a-zA-Z0-9]*$	format
8	12	45	^[A-Z][a-zA-Z0-9]*$	format
9	13	47	^[A-Z][A-Z0-9]*(_[A-Z0-9]+)*$	format
10	14	46	^[a-z][a-zA-Z0-9]*$	format
11	15	30	^[a-z][a-zA-Z0-9]*$	format
12	16	43	^[a-z][a-zA-Z0-9]*$	format
13	17	44	^[A-Z][0-9]?$	format
14	18	41	^[a-z]+(\\.[a-z][a-z0-9]*)*$	format
15	43	32	3	max
16	57	29	3	max
17	61	28	5	max
18	63	24	java.lang.InterruptedException, java.lang.NumberFormatException, java.text.ParseException, java.net.MalformedURLException	exceptions
19	65	33	20	Max
20	77	17	3	threshold
21	93	9	LOG(?:GER)?	format
22	116	35	30	maximum
\.


--
-- Name: active_rule_parameters_id_seq; Type: SEQUENCE SET; Schema: public; Owner: sonar
--

SELECT pg_catalog.setval('active_rule_parameters_id_seq', 22, true);


--
-- Data for Name: active_rules; Type: TABLE DATA; Schema: public; Owner: sonar
--

COPY active_rules (id, profile_id, rule_id, failure_level, inheritance, created_at, updated_at) FROM stdin;
1	1	4	2	\N	2015-11-20 10:43:13.392	2015-11-20 10:43:13.392
2	1	1	2	\N	2015-11-20 10:43:13.419	2015-11-20 10:43:13.419
3	1	309	1	\N	2015-11-20 10:43:13.425	2015-11-20 10:43:13.425
4	1	174	2	\N	2015-11-20 10:43:13.438	2015-11-20 10:43:13.438
5	1	226	2	\N	2015-11-20 10:43:13.442	2015-11-20 10:43:13.442
6	1	93	2	\N	2015-11-20 10:43:13.454	2015-11-20 10:43:13.454
7	1	301	2	\N	2015-11-20 10:43:13.466	2015-11-20 10:43:13.466
8	1	292	2	\N	2015-11-20 10:43:13.471	2015-11-20 10:43:13.471
9	1	282	2	\N	2015-11-20 10:43:13.476	2015-11-20 10:43:13.476
10	1	173	1	\N	2015-11-20 10:43:13.484	2015-11-20 10:43:13.484
11	1	171	1	\N	2015-11-20 10:43:13.497	2015-11-20 10:43:13.497
12	1	330	1	\N	2015-11-20 10:43:13.499	2015-11-20 10:43:13.499
13	1	336	1	\N	2015-11-20 10:43:13.501	2015-11-20 10:43:13.501
14	1	334	1	\N	2015-11-20 10:43:13.516	2015-11-20 10:43:13.516
15	1	197	1	\N	2015-11-20 10:43:13.518	2015-11-20 10:43:13.518
16	1	324	1	\N	2015-11-20 10:43:13.531	2015-11-20 10:43:13.531
17	1	327	1	\N	2015-11-20 10:43:13.535	2015-11-20 10:43:13.535
18	1	317	1	\N	2015-11-20 10:43:13.554	2015-11-20 10:43:13.554
19	1	318	1	\N	2015-11-20 10:43:13.557	2015-11-20 10:43:13.557
20	1	305	1	\N	2015-11-20 10:43:13.558	2015-11-20 10:43:13.558
21	1	257	2	\N	2015-11-20 10:43:13.562	2015-11-20 10:43:13.562
22	1	127	3	\N	2015-11-20 10:43:13.563	2015-11-20 10:43:13.563
23	1	36	3	\N	2015-11-20 10:43:13.57	2015-11-20 10:43:13.57
24	1	68	4	\N	2015-11-20 10:43:13.573	2015-11-20 10:43:13.573
25	1	72	2	\N	2015-11-20 10:43:13.574	2015-11-20 10:43:13.574
26	1	37	2	\N	2015-11-20 10:43:13.576	2015-11-20 10:43:13.576
27	1	183	2	\N	2015-11-20 10:43:13.587	2015-11-20 10:43:13.587
28	1	241	2	\N	2015-11-20 10:43:13.595	2015-11-20 10:43:13.595
29	1	109	1	\N	2015-11-20 10:43:13.597	2015-11-20 10:43:13.597
30	1	21	1	\N	2015-11-20 10:43:13.599	2015-11-20 10:43:13.599
31	1	133	2	\N	2015-11-20 10:43:13.601	2015-11-20 10:43:13.601
32	1	260	1	\N	2015-11-20 10:43:13.607	2015-11-20 10:43:13.607
33	1	147	1	\N	2015-11-20 10:43:13.609	2015-11-20 10:43:13.609
34	1	148	2	\N	2015-11-20 10:43:13.619	2015-11-20 10:43:13.619
35	1	196	2	\N	2015-11-20 10:43:13.621	2015-11-20 10:43:13.621
36	1	328	0	\N	2015-11-20 10:43:13.623	2015-11-20 10:43:13.623
37	1	331	2	\N	2015-11-20 10:43:13.625	2015-11-20 10:43:13.625
38	1	333	0	\N	2015-11-20 10:43:13.636	2015-11-20 10:43:13.636
39	1	265	2	\N	2015-11-20 10:43:13.647	2015-11-20 10:43:13.647
40	1	325	2	\N	2015-11-20 10:43:13.649	2015-11-20 10:43:13.649
41	1	255	1	\N	2015-11-20 10:43:13.651	2015-11-20 10:43:13.651
42	1	252	1	\N	2015-11-20 10:43:13.653	2015-11-20 10:43:13.653
43	1	211	2	\N	2015-11-20 10:43:13.665	2015-11-20 10:43:13.665
44	1	293	2	\N	2015-11-20 10:43:13.674	2015-11-20 10:43:13.674
45	1	310	3	\N	2015-11-20 10:43:13.676	2015-11-20 10:43:13.676
46	1	298	4	\N	2015-11-20 10:43:13.679	2015-11-20 10:43:13.679
47	1	186	2	\N	2015-11-20 10:43:13.682	2015-11-20 10:43:13.682
48	1	184	2	\N	2015-11-20 10:43:13.683	2015-11-20 10:43:13.683
49	1	284	2	\N	2015-11-20 10:43:13.704	2015-11-20 10:43:13.704
50	1	222	2	\N	2015-11-20 10:43:13.706	2015-11-20 10:43:13.706
51	1	168	2	\N	2015-11-20 10:43:13.708	2015-11-20 10:43:13.708
52	1	221	1	\N	2015-11-20 10:43:13.714	2015-11-20 10:43:13.714
53	1	158	2	\N	2015-11-20 10:43:13.73	2015-11-20 10:43:13.73
54	1	118	2	\N	2015-11-20 10:43:13.744	2015-11-20 10:43:13.744
55	1	162	2	\N	2015-11-20 10:43:13.747	2015-11-20 10:43:13.747
56	1	208	2	\N	2015-11-20 10:43:13.749	2015-11-20 10:43:13.749
57	1	180	2	\N	2015-11-20 10:43:13.751	2015-11-20 10:43:13.751
58	1	190	4	\N	2015-11-20 10:43:13.756	2015-11-20 10:43:13.756
59	1	175	2	\N	2015-11-20 10:43:13.765	2015-11-20 10:43:13.765
60	1	191	2	\N	2015-11-20 10:43:13.767	2015-11-20 10:43:13.767
61	1	176	2	\N	2015-11-20 10:43:13.77	2015-11-20 10:43:13.77
62	1	172	3	\N	2015-11-20 10:43:13.777	2015-11-20 10:43:13.777
63	1	164	3	\N	2015-11-20 10:43:13.779	2015-11-20 10:43:13.779
64	1	87	2	\N	2015-11-20 10:43:13.782	2015-11-20 10:43:13.782
65	1	212	2	\N	2015-11-20 10:43:13.796	2015-11-20 10:43:13.796
66	1	88	2	\N	2015-11-20 10:43:13.8	2015-11-20 10:43:13.8
67	1	139	2	\N	2015-11-20 10:43:13.802	2015-11-20 10:43:13.802
68	1	204	2	\N	2015-11-20 10:43:13.807	2015-11-20 10:43:13.807
69	1	201	1	\N	2015-11-20 10:43:13.811	2015-11-20 10:43:13.811
70	1	232	2	\N	2015-11-20 10:43:13.813	2015-11-20 10:43:13.813
71	1	233	2	\N	2015-11-20 10:43:13.814	2015-11-20 10:43:13.814
72	1	181	1	\N	2015-11-20 10:43:13.824	2015-11-20 10:43:13.824
73	1	313	3	\N	2015-11-20 10:43:13.826	2015-11-20 10:43:13.826
74	1	94	1	\N	2015-11-20 10:43:13.828	2015-11-20 10:43:13.828
75	1	92	2	\N	2015-11-20 10:43:13.829	2015-11-20 10:43:13.829
76	1	90	2	\N	2015-11-20 10:43:13.844	2015-11-20 10:43:13.844
77	1	89	1	\N	2015-11-20 10:43:13.846	2015-11-20 10:43:13.846
78	1	188	2	\N	2015-11-20 10:43:13.854	2015-11-20 10:43:13.854
79	1	50	3	\N	2015-11-20 10:43:13.855	2015-11-20 10:43:13.855
80	1	99	1	\N	2015-11-20 10:43:13.858	2015-11-20 10:43:13.858
81	1	42	1	\N	2015-11-20 10:43:13.859	2015-11-20 10:43:13.859
82	1	43	3	\N	2015-11-20 10:43:13.861	2015-11-20 10:43:13.861
83	1	102	2	\N	2015-11-20 10:43:13.873	2015-11-20 10:43:13.873
84	1	63	1	\N	2015-11-20 10:43:13.875	2015-11-20 10:43:13.875
85	1	18	3	\N	2015-11-20 10:43:13.877	2015-11-20 10:43:13.877
86	1	55	3	\N	2015-11-20 10:43:13.879	2015-11-20 10:43:13.879
87	1	12	4	\N	2015-11-20 10:43:13.881	2015-11-20 10:43:13.881
88	1	53	3	\N	2015-11-20 10:43:13.894	2015-11-20 10:43:13.894
89	1	116	1	\N	2015-11-20 10:43:13.897	2015-11-20 10:43:13.897
90	1	25	2	\N	2015-11-20 10:43:13.899	2015-11-20 10:43:13.899
91	1	38	2	\N	2015-11-20 10:43:13.901	2015-11-20 10:43:13.901
92	1	33	2	\N	2015-11-20 10:43:13.903	2015-11-20 10:43:13.903
93	1	32	1	\N	2015-11-20 10:43:13.915	2015-11-20 10:43:13.915
94	1	45	2	\N	2015-11-20 10:43:13.917	2015-11-20 10:43:13.917
95	1	29	2	\N	2015-11-20 10:43:13.919	2015-11-20 10:43:13.919
96	1	61	1	\N	2015-11-20 10:43:13.92	2015-11-20 10:43:13.92
97	1	19	3	\N	2015-11-20 10:43:13.927	2015-11-20 10:43:13.927
98	1	56	2	\N	2015-11-20 10:43:13.929	2015-11-20 10:43:13.929
99	1	240	2	\N	2015-11-20 10:43:13.931	2015-11-20 10:43:13.931
100	1	214	2	\N	2015-11-20 10:43:13.933	2015-11-20 10:43:13.933
101	1	27	2	\N	2015-11-20 10:43:13.941	2015-11-20 10:43:13.941
102	1	274	2	\N	2015-11-20 10:43:13.95	2015-11-20 10:43:13.95
103	1	258	2	\N	2015-11-20 10:43:13.952	2015-11-20 10:43:13.952
104	1	67	1	\N	2015-11-20 10:43:13.954	2015-11-20 10:43:13.954
105	1	138	2	\N	2015-11-20 10:43:13.956	2015-11-20 10:43:13.956
106	1	52	3	\N	2015-11-20 10:43:13.957	2015-11-20 10:43:13.957
107	1	218	3	\N	2015-11-20 10:43:13.962	2015-11-20 10:43:13.962
108	1	253	1	\N	2015-11-20 10:43:13.971	2015-11-20 10:43:13.971
109	1	149	2	\N	2015-11-20 10:43:13.973	2015-11-20 10:43:13.973
110	1	227	1	\N	2015-11-20 10:43:13.977	2015-11-20 10:43:13.977
111	1	287	2	\N	2015-11-20 10:43:13.979	2015-11-20 10:43:13.979
112	1	223	2	\N	2015-11-20 10:43:13.981	2015-11-20 10:43:13.981
113	1	277	2	\N	2015-11-20 10:43:13.987	2015-11-20 10:43:13.987
114	1	106	3	\N	2015-11-20 10:43:13.988	2015-11-20 10:43:13.988
115	1	291	3	\N	2015-11-20 10:43:14.003	2015-11-20 10:43:14.003
116	1	262	2	\N	2015-11-20 10:43:14.006	2015-11-20 10:43:14.006
117	1	85	3	\N	2015-11-20 10:43:14.011	2015-11-20 10:43:14.011
118	1	248	3	\N	2015-11-20 10:43:14.013	2015-11-20 10:43:14.013
119	1	111	3	\N	2015-11-20 10:43:14.015	2015-11-20 10:43:14.015
120	1	140	2	\N	2015-11-20 10:43:14.018	2015-11-20 10:43:14.018
121	1	107	3	\N	2015-11-20 10:43:14.024	2015-11-20 10:43:14.024
122	1	9	2	\N	2015-11-20 10:43:14.026	2015-11-20 10:43:14.026
123	1	237	2	\N	2015-11-20 10:43:14.028	2015-11-20 10:43:14.028
124	1	259	1	\N	2015-11-20 10:43:14.03	2015-11-20 10:43:14.03
125	1	307	3	\N	2015-11-20 10:43:14.037	2015-11-20 10:43:14.037
126	1	205	2	\N	2015-11-20 10:43:14.039	2015-11-20 10:43:14.039
127	1	122	2	\N	2015-11-20 10:43:14.044	2015-11-20 10:43:14.044
128	1	337	3	\N	2015-11-20 10:43:14.047	2015-11-20 10:43:14.047
129	1	297	3	\N	2015-11-20 10:43:14.054	2015-11-20 10:43:14.054
130	1	271	2	\N	2015-11-20 10:43:14.058	2015-11-20 10:43:14.058
131	1	7	3	\N	2015-11-20 10:43:14.066	2015-11-20 10:43:14.066
132	1	154	3	\N	2015-11-20 10:43:14.074	2015-11-20 10:43:14.074
133	1	308	3	\N	2015-11-20 10:43:14.076	2015-11-20 10:43:14.076
134	1	22	3	\N	2015-11-20 10:43:14.078	2015-11-20 10:43:14.078
135	1	132	3	\N	2015-11-20 10:43:14.079	2015-11-20 10:43:14.079
136	1	302	3	\N	2015-11-20 10:43:14.082	2015-11-20 10:43:14.082
137	1	155	4	\N	2015-11-20 10:43:14.098	2015-11-20 10:43:14.098
138	1	314	4	\N	2015-11-20 10:43:14.1	2015-11-20 10:43:14.1
139	1	150	4	\N	2015-11-20 10:43:14.102	2015-11-20 10:43:14.102
140	1	141	4	\N	2015-11-20 10:43:14.104	2015-11-20 10:43:14.104
141	1	160	3	\N	2015-11-20 10:43:14.105	2015-11-20 10:43:14.105
142	1	165	3	\N	2015-11-20 10:43:14.111	2015-11-20 10:43:14.111
143	1	145	3	\N	2015-11-20 10:43:14.113	2015-11-20 10:43:14.113
144	1	335	3	\N	2015-11-20 10:43:14.115	2015-11-20 10:43:14.115
145	1	303	3	\N	2015-11-20 10:43:14.122	2015-11-20 10:43:14.122
146	1	320	4	\N	2015-11-20 10:43:14.129	2015-11-20 10:43:14.129
147	1	193	3	\N	2015-11-20 10:43:14.132	2015-11-20 10:43:14.132
148	1	213	3	\N	2015-11-20 10:43:14.135	2015-11-20 10:43:14.135
149	1	206	3	\N	2015-11-20 10:43:14.137	2015-11-20 10:43:14.137
150	1	194	2	\N	2015-11-20 10:43:14.141	2015-11-20 10:43:14.141
151	1	209	3	\N	2015-11-20 10:43:14.15	2015-11-20 10:43:14.15
152	1	278	4	\N	2015-11-20 10:43:14.153	2015-11-20 10:43:14.153
153	1	77	3	\N	2015-11-20 10:43:14.162	2015-11-20 10:43:14.162
154	1	311	3	\N	2015-11-20 10:43:14.164	2015-11-20 10:43:14.164
155	1	217	3	\N	2015-11-20 10:43:14.165	2015-11-20 10:43:14.165
156	1	202	3	\N	2015-11-20 10:43:14.167	2015-11-20 10:43:14.167
157	1	195	4	\N	2015-11-20 10:43:14.169	2015-11-20 10:43:14.169
158	1	189	4	\N	2015-11-20 10:43:14.176	2015-11-20 10:43:14.176
159	1	215	4	\N	2015-11-20 10:43:14.181	2015-11-20 10:43:14.181
160	1	74	3	\N	2015-11-20 10:43:14.193	2015-11-20 10:43:14.193
161	1	285	3	\N	2015-11-20 10:43:14.195	2015-11-20 10:43:14.195
162	1	128	3	\N	2015-11-20 10:43:14.197	2015-11-20 10:43:14.197
163	1	130	1	\N	2015-11-20 10:43:14.198	2015-11-20 10:43:14.198
164	1	120	3	\N	2015-11-20 10:43:14.203	2015-11-20 10:43:14.203
165	1	75	2	\N	2015-11-20 10:43:14.205	2015-11-20 10:43:14.205
166	1	142	2	\N	2015-11-20 10:43:14.206	2015-11-20 10:43:14.206
167	1	103	2	\N	2015-11-20 10:43:14.212	2015-11-20 10:43:14.212
168	1	207	2	\N	2015-11-20 10:43:14.214	2015-11-20 10:43:14.214
169	1	263	2	\N	2015-11-20 10:43:14.216	2015-11-20 10:43:14.216
170	1	119	3	\N	2015-11-20 10:43:14.218	2015-11-20 10:43:14.218
171	1	101	3	\N	2015-11-20 10:43:14.227	2015-11-20 10:43:14.227
172	1	98	2	\N	2015-11-20 10:43:14.229	2015-11-20 10:43:14.229
173	1	185	4	\N	2015-11-20 10:43:14.242	2015-11-20 10:43:14.242
174	1	163	2	\N	2015-11-20 10:43:14.25	2015-11-20 10:43:14.25
175	1	76	3	\N	2015-11-20 10:43:14.252	2015-11-20 10:43:14.252
176	1	264	3	\N	2015-11-20 10:43:14.254	2015-11-20 10:43:14.254
177	1	161	2	\N	2015-11-20 10:43:14.256	2015-11-20 10:43:14.256
178	1	39	2	\N	2015-11-20 10:43:14.263	2015-11-20 10:43:14.263
179	1	295	3	\N	2015-11-20 10:43:14.264	2015-11-20 10:43:14.264
180	1	91	2	\N	2015-11-20 10:43:14.266	2015-11-20 10:43:14.266
181	1	105	3	\N	2015-11-20 10:43:14.268	2015-11-20 10:43:14.268
182	1	269	2	\N	2015-11-20 10:43:14.283	2015-11-20 10:43:14.283
183	1	273	3	\N	2015-11-20 10:43:14.286	2015-11-20 10:43:14.286
184	1	182	3	\N	2015-11-20 10:43:14.287	2015-11-20 10:43:14.287
185	1	166	2	\N	2015-11-20 10:43:14.289	2015-11-20 10:43:14.289
186	1	203	3	\N	2015-11-20 10:43:14.291	2015-11-20 10:43:14.291
187	1	272	4	\N	2015-11-20 10:43:14.314	2015-11-20 10:43:14.314
188	1	238	2	\N	2015-11-20 10:43:14.316	2015-11-20 10:43:14.316
189	1	41	3	\N	2015-11-20 10:43:14.318	2015-11-20 10:43:14.318
190	1	169	4	\N	2015-11-20 10:43:14.32	2015-11-20 10:43:14.32
191	1	323	4	\N	2015-11-20 10:43:14.322	2015-11-20 10:43:14.322
192	1	251	3	\N	2015-11-20 10:43:14.333	2015-11-20 10:43:14.333
193	1	46	3	\N	2015-11-20 10:43:14.336	2015-11-20 10:43:14.336
194	1	246	4	\N	2015-11-20 10:43:14.337	2015-11-20 10:43:14.337
195	1	299	3	\N	2015-11-20 10:43:14.343	2015-11-20 10:43:14.343
196	1	235	2	\N	2015-11-20 10:43:14.345	2015-11-20 10:43:14.345
197	1	65	2	\N	2015-11-20 10:43:14.348	2015-11-20 10:43:14.348
198	1	8	4	\N	2015-11-20 10:43:14.35	2015-11-20 10:43:14.35
199	1	47	4	\N	2015-11-20 10:43:14.354	2015-11-20 10:43:14.354
200	1	231	2	\N	2015-11-20 10:43:14.356	2015-11-20 10:43:14.356
201	1	136	2	\N	2015-11-20 10:43:14.358	2015-11-20 10:43:14.358
202	1	245	3	\N	2015-11-20 10:43:14.375	2015-11-20 10:43:14.375
203	1	44	2	\N	2015-11-20 10:43:14.377	2015-11-20 10:43:14.377
204	1	48	3	\N	2015-11-20 10:43:14.379	2015-11-20 10:43:14.379
205	1	34	3	\N	2015-11-20 10:43:14.381	2015-11-20 10:43:14.381
206	1	326	3	\N	2015-11-20 10:43:14.383	2015-11-20 10:43:14.383
207	1	10	4	\N	2015-11-20 10:43:14.395	2015-11-20 10:43:14.395
208	1	121	2	\N	2015-11-20 10:43:14.397	2015-11-20 10:43:14.397
209	1	220	2	\N	2015-11-20 10:43:14.399	2015-11-20 10:43:14.399
210	1	290	2	\N	2015-11-20 10:43:14.401	2015-11-20 10:43:14.401
211	1	267	2	\N	2015-11-20 10:43:14.403	2015-11-20 10:43:14.403
212	1	280	1	\N	2015-11-20 10:43:14.412	2015-11-20 10:43:14.412
213	1	300	1	\N	2015-11-20 10:43:14.415	2015-11-20 10:43:14.415
214	1	270	3	\N	2015-11-20 10:43:14.417	2015-11-20 10:43:14.417
215	1	81	2	\N	2015-11-20 10:43:14.419	2015-11-20 10:43:14.419
216	1	70	3	\N	2015-11-20 10:43:14.427	2015-11-20 10:43:14.427
217	1	199	3	\N	2015-11-20 10:43:14.43	2015-11-20 10:43:14.43
218	1	152	2	\N	2015-11-20 10:43:14.431	2015-11-20 10:43:14.431
219	1	236	3	\N	2015-11-20 10:43:14.435	2015-11-20 10:43:14.435
220	1	71	2	\N	2015-11-20 10:43:14.437	2015-11-20 10:43:14.437
221	1	17	3	\N	2015-11-20 10:43:14.445	2015-11-20 10:43:14.445
222	1	230	2	\N	2015-11-20 10:43:14.447	2015-11-20 10:43:14.447
223	1	134	3	\N	2015-11-20 10:43:14.454	2015-11-20 10:43:14.454
224	1	131	3	\N	2015-11-20 10:43:14.456	2015-11-20 10:43:14.456
225	1	129	2	\N	2015-11-20 10:43:14.458	2015-11-20 10:43:14.458
226	1	192	3	\N	2015-11-20 10:43:14.46	2015-11-20 10:43:14.46
227	1	79	3	\N	2015-11-20 10:43:14.462	2015-11-20 10:43:14.462
228	1	178	3	\N	2015-11-20 10:43:14.463	2015-11-20 10:43:14.463
229	1	179	2	\N	2015-11-20 10:43:14.478	2015-11-20 10:43:14.478
\.


--
-- Name: active_rules_id_seq; Type: SEQUENCE SET; Schema: public; Owner: sonar
--

SELECT pg_catalog.setval('active_rules_id_seq', 229, true);


--
-- Data for Name: activities; Type: TABLE DATA; Schema: public; Owner: sonar
--

COPY activities (id, created_at, user_login, data_field, log_type, log_action, log_message, log_key) FROM stdin;
1	2015-11-20 10:43:13.408	\N	key=java-sonar-way-87679:common-java:DuplicatedBlocks;ruleKey=common-java:DuplicatedBlocks;profileKey=java-sonar-way-87679;severity=MAJOR	QPROFILE	ACTIVATED	\N	AVEkfadxDYGOfkZA7KEv
2	2015-11-20 10:43:13.421	\N	key=java-sonar-way-87679:common-java:InsufficientBranchCoverage;ruleKey=common-java:InsufficientBranchCoverage;profileKey=java-sonar-way-87679;param_minimumBranchCoverageRatio=65.0;severity=MAJOR	QPROFILE	ACTIVATED	\N	AVEkfaeNDYGOfkZA7KEw
3	2015-11-20 10:43:13.427	\N	key=java-sonar-way-87679:squid:S00105;ruleKey=squid:S00105;profileKey=java-sonar-way-87679;severity=MINOR	QPROFILE	ACTIVATED	\N	AVEkfaeTDYGOfkZA7KEx
4	2015-11-20 10:43:13.439	\N	key=java-sonar-way-87679:squid:MethodCyclomaticComplexity;ruleKey=squid:MethodCyclomaticComplexity;profileKey=java-sonar-way-87679;param_Threshold=10;severity=MAJOR	QPROFILE	ACTIVATED	\N	AVEkfaefDYGOfkZA7KEy
5	2015-11-20 10:43:13.443	\N	key=java-sonar-way-87679:squid:ClassCyclomaticComplexity;ruleKey=squid:ClassCyclomaticComplexity;profileKey=java-sonar-way-87679;param_max=200;severity=MAJOR	QPROFILE	ACTIVATED	\N	AVEkfaejDYGOfkZA7KEz
6	2015-11-20 10:43:13.454	\N	key=java-sonar-way-87679:squid:CommentedOutCodeLine;ruleKey=squid:CommentedOutCodeLine;profileKey=java-sonar-way-87679;severity=MAJOR	QPROFILE	ACTIVATED	\N	AVEkfaeuDYGOfkZA7KE0
7	2015-11-20 10:43:13.466	\N	key=java-sonar-way-87679:squid:S00108;ruleKey=squid:S00108;profileKey=java-sonar-way-87679;severity=MAJOR	QPROFILE	ACTIVATED	\N	AVEkfae6DYGOfkZA7KE1
8	2015-11-20 10:43:13.472	\N	key=java-sonar-way-87679:squid:S00107;ruleKey=squid:S00107;profileKey=java-sonar-way-87679;param_max=7;param_constructorMax=7;severity=MAJOR	QPROFILE	ACTIVATED	\N	AVEkfae_DYGOfkZA7KE2
9	2015-11-20 10:43:13.476	\N	key=java-sonar-way-87679:squid:S00112;ruleKey=squid:S00112;profileKey=java-sonar-way-87679;severity=MAJOR	QPROFILE	ACTIVATED	\N	AVEkfafEDYGOfkZA7KE3
10	2015-11-20 10:43:13.485	\N	key=java-sonar-way-87679:squid:S00100;ruleKey=squid:S00100;profileKey=java-sonar-way-87679;param_format=^[a-z][a-zA-Z0-9]*$;severity=MINOR	QPROFILE	ACTIVATED	\N	AVEkfafNDYGOfkZA7KE4
11	2015-11-20 10:43:13.497	\N	key=java-sonar-way-87679:squid:S00101;ruleKey=squid:S00101;profileKey=java-sonar-way-87679;param_format=^[A-Z][a-zA-Z0-9]*$;severity=MINOR	QPROFILE	ACTIVATED	\N	AVEkfafZDYGOfkZA7KE5
12	2015-11-20 10:43:13.499	\N	key=java-sonar-way-87679:squid:S00114;ruleKey=squid:S00114;profileKey=java-sonar-way-87679;param_format=^[A-Z][a-zA-Z0-9]*$;severity=MINOR	QPROFILE	ACTIVATED	\N	AVEkfafbDYGOfkZA7KE6
13	2015-11-20 10:43:13.502	\N	key=java-sonar-way-87679:squid:S00115;ruleKey=squid:S00115;profileKey=java-sonar-way-87679;param_format=^[A-Z][A-Z0-9]*(_[A-Z0-9]+)*$;severity=MINOR	QPROFILE	ACTIVATED	\N	AVEkfafeDYGOfkZA7KE7
14	2015-11-20 10:43:13.516	\N	key=java-sonar-way-87679:squid:S00116;ruleKey=squid:S00116;profileKey=java-sonar-way-87679;param_format=^[a-z][a-zA-Z0-9]*$;severity=MINOR	QPROFILE	ACTIVATED	\N	AVEkfafsDYGOfkZA7KE8
15	2015-11-20 10:43:13.519	\N	key=java-sonar-way-87679:squid:S3008;ruleKey=squid:S3008;profileKey=java-sonar-way-87679;param_format=^[a-z][a-zA-Z0-9]*$;severity=MINOR	QPROFILE	ACTIVATED	\N	AVEkfafvDYGOfkZA7KE9
16	2015-11-20 10:43:13.532	\N	key=java-sonar-way-87679:squid:S00117;ruleKey=squid:S00117;profileKey=java-sonar-way-87679;param_format=^[a-z][a-zA-Z0-9]*$;severity=MINOR	QPROFILE	ACTIVATED	\N	AVEkfaf8DYGOfkZA7KE-
17	2015-11-20 10:43:13.536	\N	key=java-sonar-way-87679:squid:S00119;ruleKey=squid:S00119;profileKey=java-sonar-way-87679;param_format=^[A-Z][0-9]?$;severity=MINOR	QPROFILE	ACTIVATED	\N	AVEkfagADYGOfkZA7KE_
18	2015-11-20 10:43:13.555	\N	key=java-sonar-way-87679:squid:S00120;ruleKey=squid:S00120;profileKey=java-sonar-way-87679;param_format=^[a-z]+(\\.[a-z][a-z0-9]*)*$;severity=MINOR	QPROFILE	ACTIVATED	\N	AVEkfagTDYGOfkZA7KFA
19	2015-11-20 10:43:13.557	\N	key=java-sonar-way-87679:squid:S00122;ruleKey=squid:S00122;profileKey=java-sonar-way-87679;severity=MINOR	QPROFILE	ACTIVATED	\N	AVEkfagVDYGOfkZA7KFB
20	2015-11-20 10:43:13.559	\N	key=java-sonar-way-87679:squid:RightCurlyBraceStartLineCheck;ruleKey=squid:RightCurlyBraceStartLineCheck;profileKey=java-sonar-way-87679;severity=MINOR	QPROFILE	ACTIVATED	\N	AVEkfagXDYGOfkZA7KFC
21	2015-11-20 10:43:13.562	\N	key=java-sonar-way-87679:squid:UselessParenthesesCheck;ruleKey=squid:UselessParenthesesCheck;profileKey=java-sonar-way-87679;severity=MAJOR	QPROFILE	ACTIVATED	\N	AVEkfagaDYGOfkZA7KFD
22	2015-11-20 10:43:13.568	\N	key=java-sonar-way-87679:squid:ObjectFinalizeCheck;ruleKey=squid:ObjectFinalizeCheck;profileKey=java-sonar-way-87679;severity=CRITICAL	QPROFILE	ACTIVATED	\N	AVEkfaggDYGOfkZA7KFE
23	2015-11-20 10:43:13.57	\N	key=java-sonar-way-87679:squid:ObjectFinalizeOverridenCheck;ruleKey=squid:ObjectFinalizeOverridenCheck;profileKey=java-sonar-way-87679;severity=CRITICAL	QPROFILE	ACTIVATED	\N	AVEkfagiDYGOfkZA7KFF
24	2015-11-20 10:43:13.573	\N	key=java-sonar-way-87679:squid:ObjectFinalizeOverridenCallsSuperFinalizeCheck;ruleKey=squid:ObjectFinalizeOverridenCallsSuperFinalizeCheck;profileKey=java-sonar-way-87679;severity=BLOCKER	QPROFILE	ACTIVATED	\N	AVEkfaglDYGOfkZA7KFG
25	2015-11-20 10:43:13.575	\N	key=java-sonar-way-87679:squid:ClassVariableVisibilityCheck;ruleKey=squid:ClassVariableVisibilityCheck;profileKey=java-sonar-way-87679;severity=MAJOR	QPROFILE	ACTIVATED	\N	AVEkfagnDYGOfkZA7KFH
26	2015-11-20 10:43:13.579	\N	key=java-sonar-way-87679:squid:ForLoopCounterChangedCheck;ruleKey=squid:ForLoopCounterChangedCheck;profileKey=java-sonar-way-87679;severity=MAJOR	QPROFILE	ACTIVATED	\N	AVEkfagrDYGOfkZA7KFI
27	2015-11-20 10:43:13.587	\N	key=java-sonar-way-87679:squid:LabelsShouldNotBeUsedCheck;ruleKey=squid:LabelsShouldNotBeUsedCheck;profileKey=java-sonar-way-87679;severity=MAJOR	QPROFILE	ACTIVATED	\N	AVEkfagzDYGOfkZA7KFJ
28	2015-11-20 10:43:13.595	\N	key=java-sonar-way-87679:squid:SwitchLastCaseIsDefaultCheck;ruleKey=squid:SwitchLastCaseIsDefaultCheck;profileKey=java-sonar-way-87679;severity=MAJOR	QPROFILE	ACTIVATED	\N	AVEkfag7DYGOfkZA7KFK
29	2015-11-20 10:43:13.598	\N	key=java-sonar-way-87679:squid:EmptyStatementUsageCheck;ruleKey=squid:EmptyStatementUsageCheck;profileKey=java-sonar-way-87679;severity=MINOR	QPROFILE	ACTIVATED	\N	AVEkfag9DYGOfkZA7KFL
30	2015-11-20 10:43:13.599	\N	key=java-sonar-way-87679:squid:ModifiersOrderCheck;ruleKey=squid:ModifiersOrderCheck;profileKey=java-sonar-way-87679;severity=MINOR	QPROFILE	ACTIVATED	\N	AVEkfag_DYGOfkZA7KFM
31	2015-11-20 10:43:13.601	\N	key=java-sonar-way-87679:squid:AssignmentInSubExpressionCheck;ruleKey=squid:AssignmentInSubExpressionCheck;profileKey=java-sonar-way-87679;severity=MAJOR	QPROFILE	ACTIVATED	\N	AVEkfahBDYGOfkZA7KFN
32	2015-11-20 10:43:13.607	\N	key=java-sonar-way-87679:squid:UselessImportCheck;ruleKey=squid:UselessImportCheck;profileKey=java-sonar-way-87679;severity=MINOR	QPROFILE	ACTIVATED	\N	AVEkfahHDYGOfkZA7KFO
33	2015-11-20 10:43:13.609	\N	key=java-sonar-way-87679:squid:LowerCaseLongSuffixCheck;ruleKey=squid:LowerCaseLongSuffixCheck;profileKey=java-sonar-way-87679;severity=MINOR	QPROFILE	ACTIVATED	\N	AVEkfahJDYGOfkZA7KFP
34	2015-11-20 10:43:13.62	\N	key=java-sonar-way-87679:squid:MissingDeprecatedCheck;ruleKey=squid:MissingDeprecatedCheck;profileKey=java-sonar-way-87679;severity=MAJOR	QPROFILE	ACTIVATED	\N	AVEkfahTDYGOfkZA7KFQ
35	2015-11-20 10:43:13.622	\N	key=java-sonar-way-87679:squid:HiddenFieldCheck;ruleKey=squid:HiddenFieldCheck;profileKey=java-sonar-way-87679;severity=MAJOR	QPROFILE	ACTIVATED	\N	AVEkfahWDYGOfkZA7KFR
36	2015-11-20 10:43:13.624	\N	key=java-sonar-way-87679:squid:S1133;ruleKey=squid:S1133;profileKey=java-sonar-way-87679;severity=INFO	QPROFILE	ACTIVATED	\N	AVEkfahYDYGOfkZA7KFS
37	2015-11-20 10:43:13.625	\N	key=java-sonar-way-87679:squid:S1134;ruleKey=squid:S1134;profileKey=java-sonar-way-87679;severity=MAJOR	QPROFILE	ACTIVATED	\N	AVEkfahZDYGOfkZA7KFT
38	2015-11-20 10:43:13.645	\N	key=java-sonar-way-87679:squid:S1135;ruleKey=squid:S1135;profileKey=java-sonar-way-87679;severity=INFO	QPROFILE	ACTIVATED	\N	AVEkfahtDYGOfkZA7KFU
39	2015-11-20 10:43:13.647	\N	key=java-sonar-way-87679:squid:S1118;ruleKey=squid:S1118;profileKey=java-sonar-way-87679;severity=MAJOR	QPROFILE	ACTIVATED	\N	AVEkfahvDYGOfkZA7KFV
40	2015-11-20 10:43:13.649	\N	key=java-sonar-way-87679:squid:S1132;ruleKey=squid:S1132;profileKey=java-sonar-way-87679;severity=MAJOR	QPROFILE	ACTIVATED	\N	AVEkfahxDYGOfkZA7KFW
41	2015-11-20 10:43:13.651	\N	key=java-sonar-way-87679:squid:S1126;ruleKey=squid:S1126;profileKey=java-sonar-way-87679;severity=MINOR	QPROFILE	ACTIVATED	\N	AVEkfahzDYGOfkZA7KFX
42	2015-11-20 10:43:13.653	\N	key=java-sonar-way-87679:squid:S1125;ruleKey=squid:S1125;profileKey=java-sonar-way-87679;severity=MINOR	QPROFILE	ACTIVATED	\N	AVEkfah1DYGOfkZA7KFY
43	2015-11-20 10:43:13.665	\N	key=java-sonar-way-87679:squid:S1067;ruleKey=squid:S1067;profileKey=java-sonar-way-87679;param_max=3;severity=MAJOR	QPROFILE	ACTIVATED	\N	AVEkfaiBDYGOfkZA7KFZ
44	2015-11-20 10:43:13.674	\N	key=java-sonar-way-87679:squid:S1141;ruleKey=squid:S1141;profileKey=java-sonar-way-87679;severity=MAJOR	QPROFILE	ACTIVATED	\N	AVEkfaiKDYGOfkZA7KFa
45	2015-11-20 10:43:13.676	\N	key=java-sonar-way-87679:squid:S1147;ruleKey=squid:S1147;profileKey=java-sonar-way-87679;severity=CRITICAL	QPROFILE	ACTIVATED	\N	AVEkfaiMDYGOfkZA7KFb
46	2015-11-20 10:43:13.68	\N	key=java-sonar-way-87679:squid:S1143;ruleKey=squid:S1143;profileKey=java-sonar-way-87679;severity=BLOCKER	QPROFILE	ACTIVATED	\N	AVEkfaiQDYGOfkZA7KFc
47	2015-11-20 10:43:13.682	\N	key=java-sonar-way-87679:squid:S1157;ruleKey=squid:S1157;profileKey=java-sonar-way-87679;severity=MAJOR	QPROFILE	ACTIVATED	\N	AVEkfaiSDYGOfkZA7KFd
48	2015-11-20 10:43:13.684	\N	key=java-sonar-way-87679:squid:S1155;ruleKey=squid:S1155;profileKey=java-sonar-way-87679;severity=MAJOR	QPROFILE	ACTIVATED	\N	AVEkfaiUDYGOfkZA7KFe
49	2015-11-20 10:43:13.704	\N	key=java-sonar-way-87679:squid:S1149;ruleKey=squid:S1149;profileKey=java-sonar-way-87679;severity=MAJOR	QPROFILE	ACTIVATED	\N	AVEkfaioDYGOfkZA7KFf
50	2015-11-20 10:43:13.706	\N	key=java-sonar-way-87679:squid:S1171;ruleKey=squid:S1171;profileKey=java-sonar-way-87679;severity=MAJOR	QPROFILE	ACTIVATED	\N	AVEkfaiqDYGOfkZA7KFg
51	2015-11-20 10:43:13.709	\N	key=java-sonar-way-87679:squid:S1168;ruleKey=squid:S1168;profileKey=java-sonar-way-87679;severity=MAJOR	QPROFILE	ACTIVATED	\N	AVEkfaitDYGOfkZA7KFh
52	2015-11-20 10:43:13.714	\N	key=java-sonar-way-87679:squid:S1170;ruleKey=squid:S1170;profileKey=java-sonar-way-87679;severity=MINOR	QPROFILE	ACTIVATED	\N	AVEkfaiyDYGOfkZA7KFi
53	2015-11-20 10:43:13.731	\N	key=java-sonar-way-87679:squid:S1163;ruleKey=squid:S1163;profileKey=java-sonar-way-87679;severity=MAJOR	QPROFILE	ACTIVATED	\N	AVEkfajCDYGOfkZA7KFj
54	2015-11-20 10:43:13.745	\N	key=java-sonar-way-87679:squid:S106;ruleKey=squid:S106;profileKey=java-sonar-way-87679;severity=MAJOR	QPROFILE	ACTIVATED	\N	AVEkfajQDYGOfkZA7KFk
55	2015-11-20 10:43:13.747	\N	key=java-sonar-way-87679:squid:S1165;ruleKey=squid:S1165;profileKey=java-sonar-way-87679;severity=MAJOR	QPROFILE	ACTIVATED	\N	AVEkfajTDYGOfkZA7KFl
56	2015-11-20 10:43:13.75	\N	key=java-sonar-way-87679:squid:S1066;ruleKey=squid:S1066;profileKey=java-sonar-way-87679;severity=MAJOR	QPROFILE	ACTIVATED	\N	AVEkfajVDYGOfkZA7KFm
57	2015-11-20 10:43:13.754	\N	key=java-sonar-way-87679:squid:S134;ruleKey=squid:S134;profileKey=java-sonar-way-87679;param_max=3;severity=MAJOR	QPROFILE	ACTIVATED	\N	AVEkfajaDYGOfkZA7KFn
58	2015-11-20 10:43:13.756	\N	key=java-sonar-way-87679:squid:S1181;ruleKey=squid:S1181;profileKey=java-sonar-way-87679;severity=BLOCKER	QPROFILE	ACTIVATED	\N	AVEkfajcDYGOfkZA7KFo
59	2015-11-20 10:43:13.766	\N	key=java-sonar-way-87679:squid:S1150;ruleKey=squid:S1150;profileKey=java-sonar-way-87679;severity=MAJOR	QPROFILE	ACTIVATED	\N	AVEkfajmDYGOfkZA7KFp
60	2015-11-20 10:43:13.768	\N	key=java-sonar-way-87679:squid:S1182;ruleKey=squid:S1182;profileKey=java-sonar-way-87679;severity=MAJOR	QPROFILE	ACTIVATED	\N	AVEkfajoDYGOfkZA7KFq
61	2015-11-20 10:43:13.77	\N	key=java-sonar-way-87679:squid:S1151;ruleKey=squid:S1151;profileKey=java-sonar-way-87679;param_max=5;severity=MAJOR	QPROFILE	ACTIVATED	\N	AVEkfajqDYGOfkZA7KFr
62	2015-11-20 10:43:13.778	\N	key=java-sonar-way-87679:squid:S128;ruleKey=squid:S128;profileKey=java-sonar-way-87679;severity=CRITICAL	QPROFILE	ACTIVATED	\N	AVEkfajyDYGOfkZA7KFs
63	2015-11-20 10:43:13.78	\N	key=java-sonar-way-87679:squid:S1166;ruleKey=squid:S1166;profileKey=java-sonar-way-87679;param_exceptions=java.lang.InterruptedException, java.lang.NumberFormatException, java.text.ParseException, java.net.MalformedURLException;severity=CRITICAL	QPROFILE	ACTIVATED	\N	AVEkfaj0DYGOfkZA7KFt
64	2015-11-20 10:43:13.782	\N	key=java-sonar-way-87679:squid:S1190;ruleKey=squid:S1190;profileKey=java-sonar-way-87679;severity=MAJOR	QPROFILE	ACTIVATED	\N	AVEkfaj2DYGOfkZA7KFu
65	2015-11-20 10:43:13.796	\N	key=java-sonar-way-87679:squid:S1188;ruleKey=squid:S1188;profileKey=java-sonar-way-87679;param_Max=20;severity=MAJOR	QPROFILE	ACTIVATED	\N	AVEkfakEDYGOfkZA7KFv
66	2015-11-20 10:43:13.801	\N	key=java-sonar-way-87679:squid:S1191;ruleKey=squid:S1191;profileKey=java-sonar-way-87679;param_Exclude=;severity=MAJOR	QPROFILE	ACTIVATED	\N	AVEkfakJDYGOfkZA7KFw
67	2015-11-20 10:43:13.803	\N	key=java-sonar-way-87679:squid:S135;ruleKey=squid:S135;profileKey=java-sonar-way-87679;severity=MAJOR	QPROFILE	ACTIVATED	\N	AVEkfakKDYGOfkZA7KFx
68	2015-11-20 10:43:13.808	\N	key=java-sonar-way-87679:squid:S1186;ruleKey=squid:S1186;profileKey=java-sonar-way-87679;severity=MAJOR	QPROFILE	ACTIVATED	\N	AVEkfakQDYGOfkZA7KFy
69	2015-11-20 10:43:13.811	\N	key=java-sonar-way-87679:squid:S1185;ruleKey=squid:S1185;profileKey=java-sonar-way-87679;severity=MINOR	QPROFILE	ACTIVATED	\N	AVEkfakTDYGOfkZA7KFz
70	2015-11-20 10:43:13.813	\N	key=java-sonar-way-87679:squid:S1174;ruleKey=squid:S1174;profileKey=java-sonar-way-87679;severity=MAJOR	QPROFILE	ACTIVATED	\N	AVEkfakVDYGOfkZA7KF0
71	2015-11-20 10:43:13.814	\N	key=java-sonar-way-87679:squid:S1175;ruleKey=squid:S1175;profileKey=java-sonar-way-87679;severity=MAJOR	QPROFILE	ACTIVATED	\N	AVEkfakWDYGOfkZA7KF1
72	2015-11-20 10:43:13.825	\N	key=java-sonar-way-87679:squid:S1153;ruleKey=squid:S1153;profileKey=java-sonar-way-87679;severity=MINOR	QPROFILE	ACTIVATED	\N	AVEkfakgDYGOfkZA7KF2
73	2015-11-20 10:43:13.826	\N	key=java-sonar-way-87679:squid:S1148;ruleKey=squid:S1148;profileKey=java-sonar-way-87679;severity=CRITICAL	QPROFILE	ACTIVATED	\N	AVEkfakiDYGOfkZA7KF3
74	2015-11-20 10:43:13.828	\N	key=java-sonar-way-87679:squid:S1195;ruleKey=squid:S1195;profileKey=java-sonar-way-87679;severity=MINOR	QPROFILE	ACTIVATED	\N	AVEkfakkDYGOfkZA7KF4
75	2015-11-20 10:43:13.83	\N	key=java-sonar-way-87679:squid:S1194;ruleKey=squid:S1194;profileKey=java-sonar-way-87679;severity=MAJOR	QPROFILE	ACTIVATED	\N	AVEkfaklDYGOfkZA7KF5
76	2015-11-20 10:43:13.844	\N	key=java-sonar-way-87679:squid:S1193;ruleKey=squid:S1193;profileKey=java-sonar-way-87679;severity=MAJOR	QPROFILE	ACTIVATED	\N	AVEkfak0DYGOfkZA7KF6
77	2015-11-20 10:43:13.846	\N	key=java-sonar-way-87679:squid:S1192;ruleKey=squid:S1192;profileKey=java-sonar-way-87679;param_threshold=3;severity=MINOR	QPROFILE	ACTIVATED	\N	AVEkfak2DYGOfkZA7KF7
78	2015-11-20 10:43:13.854	\N	key=java-sonar-way-87679:squid:S1158;ruleKey=squid:S1158;profileKey=java-sonar-way-87679;severity=MAJOR	QPROFILE	ACTIVATED	\N	AVEkfak-DYGOfkZA7KF8
79	2015-11-20 10:43:13.856	\N	key=java-sonar-way-87679:squid:S1215;ruleKey=squid:S1215;profileKey=java-sonar-way-87679;severity=CRITICAL	QPROFILE	ACTIVATED	\N	AVEkfalADYGOfkZA7KF9
80	2015-11-20 10:43:13.858	\N	key=java-sonar-way-87679:squid:S1197;ruleKey=squid:S1197;profileKey=java-sonar-way-87679;severity=MINOR	QPROFILE	ACTIVATED	\N	AVEkfalCDYGOfkZA7KF-
81	2015-11-20 10:43:13.86	\N	key=java-sonar-way-87679:squid:S1220;ruleKey=squid:S1220;profileKey=java-sonar-way-87679;severity=MINOR	QPROFILE	ACTIVATED	\N	AVEkfalEDYGOfkZA7KF_
82	2015-11-20 10:43:13.861	\N	key=java-sonar-way-87679:squid:S1221;ruleKey=squid:S1221;profileKey=java-sonar-way-87679;severity=CRITICAL	QPROFILE	ACTIVATED	\N	AVEkfalFDYGOfkZA7KGA
83	2015-11-20 10:43:13.873	\N	key=java-sonar-way-87679:squid:S1199;ruleKey=squid:S1199;profileKey=java-sonar-way-87679;severity=MAJOR	QPROFILE	ACTIVATED	\N	AVEkfalRDYGOfkZA7KGB
84	2015-11-20 10:43:13.875	\N	key=java-sonar-way-87679:squid:S1214;ruleKey=squid:S1214;profileKey=java-sonar-way-87679;severity=MINOR	QPROFILE	ACTIVATED	\N	AVEkfalTDYGOfkZA7KGC
85	2015-11-20 10:43:13.878	\N	key=java-sonar-way-87679:squid:S1201;ruleKey=squid:S1201;profileKey=java-sonar-way-87679;severity=CRITICAL	QPROFILE	ACTIVATED	\N	AVEkfalWDYGOfkZA7KGD
86	2015-11-20 10:43:13.879	\N	key=java-sonar-way-87679:squid:S1210;ruleKey=squid:S1210;profileKey=java-sonar-way-87679;severity=CRITICAL	QPROFILE	ACTIVATED	\N	AVEkfalXDYGOfkZA7KGE
87	2015-11-20 10:43:13.881	\N	key=java-sonar-way-87679:squid:S1206;ruleKey=squid:S1206;profileKey=java-sonar-way-87679;severity=BLOCKER	QPROFILE	ACTIVATED	\N	AVEkfalZDYGOfkZA7KGF
88	2015-11-20 10:43:13.895	\N	key=java-sonar-way-87679:squid:S1219;ruleKey=squid:S1219;profileKey=java-sonar-way-87679;severity=CRITICAL	QPROFILE	ACTIVATED	\N	AVEkfalnDYGOfkZA7KGG
89	2015-11-20 10:43:13.897	\N	key=java-sonar-way-87679:squid:S1301;ruleKey=squid:S1301;profileKey=java-sonar-way-87679;severity=MINOR	QPROFILE	ACTIVATED	\N	AVEkfalpDYGOfkZA7KGH
90	2015-11-20 10:43:13.899	\N	key=java-sonar-way-87679:squid:S1314;ruleKey=squid:S1314;profileKey=java-sonar-way-87679;severity=MAJOR	QPROFILE	ACTIVATED	\N	AVEkfalrDYGOfkZA7KGI
91	2015-11-20 10:43:13.902	\N	key=java-sonar-way-87679:squid:S1226;ruleKey=squid:S1226;profileKey=java-sonar-way-87679;severity=MAJOR	QPROFILE	ACTIVATED	\N	AVEkfaluDYGOfkZA7KGJ
92	2015-11-20 10:43:13.903	\N	key=java-sonar-way-87679:squid:S1313;ruleKey=squid:S1313;profileKey=java-sonar-way-87679;severity=MAJOR	QPROFILE	ACTIVATED	\N	AVEkfalvDYGOfkZA7KGK
93	2015-11-20 10:43:13.915	\N	key=java-sonar-way-87679:squid:S1312;ruleKey=squid:S1312;profileKey=java-sonar-way-87679;param_format=LOG(?:GER)?;severity=MINOR	QPROFILE	ACTIVATED	\N	AVEkfal7DYGOfkZA7KGL
94	2015-11-20 10:43:13.917	\N	key=java-sonar-way-87679:squid:S1223;ruleKey=squid:S1223;profileKey=java-sonar-way-87679;severity=MAJOR	QPROFILE	ACTIVATED	\N	AVEkfal9DYGOfkZA7KGM
95	2015-11-20 10:43:13.919	\N	key=java-sonar-way-87679:squid:S1319;ruleKey=squid:S1319;profileKey=java-sonar-way-87679;severity=MAJOR	QPROFILE	ACTIVATED	\N	AVEkfal_DYGOfkZA7KGN
96	2015-11-20 10:43:13.921	\N	key=java-sonar-way-87679:squid:S1213;ruleKey=squid:S1213;profileKey=java-sonar-way-87679;severity=MINOR	QPROFILE	ACTIVATED	\N	AVEkfamBDYGOfkZA7KGO
97	2015-11-20 10:43:13.927	\N	key=java-sonar-way-87679:squid:S1444;ruleKey=squid:S1444;profileKey=java-sonar-way-87679;severity=CRITICAL	QPROFILE	ACTIVATED	\N	AVEkfamHDYGOfkZA7KGP
98	2015-11-20 10:43:13.93	\N	key=java-sonar-way-87679:squid:S1452;ruleKey=squid:S1452;profileKey=java-sonar-way-87679;severity=MAJOR	QPROFILE	ACTIVATED	\N	AVEkfamJDYGOfkZA7KGQ
99	2015-11-20 10:43:13.931	\N	key=java-sonar-way-87679:squid:S1481;ruleKey=squid:S1481;profileKey=java-sonar-way-87679;severity=MAJOR	QPROFILE	ACTIVATED	\N	AVEkfamLDYGOfkZA7KGR
100	2015-11-20 10:43:13.933	\N	key=java-sonar-way-87679:squid:S1068;ruleKey=squid:S1068;profileKey=java-sonar-way-87679;severity=MAJOR	QPROFILE	ACTIVATED	\N	AVEkfamNDYGOfkZA7KGS
101	2015-11-20 10:43:13.942	\N	key=java-sonar-way-87679:squid:S1317;ruleKey=squid:S1317;profileKey=java-sonar-way-87679;severity=MAJOR	QPROFILE	ACTIVATED	\N	AVEkfamWDYGOfkZA7KGT
102	2015-11-20 10:43:13.95	\N	key=java-sonar-way-87679:squid:S1596;ruleKey=squid:S1596;profileKey=java-sonar-way-87679;severity=MAJOR	QPROFILE	ACTIVATED	\N	AVEkfameDYGOfkZA7KGU
103	2015-11-20 10:43:13.952	\N	key=java-sonar-way-87679:squid:UnusedPrivateMethod;ruleKey=squid:UnusedPrivateMethod;profileKey=java-sonar-way-87679;severity=MAJOR	QPROFILE	ACTIVATED	\N	AVEkfamgDYGOfkZA7KGV
104	2015-11-20 10:43:13.954	\N	key=java-sonar-way-87679:squid:RedundantThrowsDeclarationCheck;ruleKey=squid:RedundantThrowsDeclarationCheck;profileKey=java-sonar-way-87679;severity=MINOR	QPROFILE	ACTIVATED	\N	AVEkfamiDYGOfkZA7KGW
105	2015-11-20 10:43:13.956	\N	key=java-sonar-way-87679:squid:S1160;ruleKey=squid:S1160;profileKey=java-sonar-way-87679;severity=MAJOR	QPROFILE	ACTIVATED	\N	AVEkfamkDYGOfkZA7KGX
106	2015-11-20 10:43:13.958	\N	key=java-sonar-way-87679:squid:S1217;ruleKey=squid:S1217;profileKey=java-sonar-way-87679;severity=CRITICAL	QPROFILE	ACTIVATED	\N	AVEkfammDYGOfkZA7KGY
107	2015-11-20 10:43:13.962	\N	key=java-sonar-way-87679:squid:S1862;ruleKey=squid:S1862;profileKey=java-sonar-way-87679;severity=CRITICAL	QPROFILE	ACTIVATED	\N	AVEkfamqDYGOfkZA7KGZ
108	2015-11-20 10:43:13.971	\N	key=java-sonar-way-87679:squid:S1488;ruleKey=squid:S1488;profileKey=java-sonar-way-87679;severity=MINOR	QPROFILE	ACTIVATED	\N	AVEkfamzDYGOfkZA7KGa
109	2015-11-20 10:43:13.975	\N	key=java-sonar-way-87679:squid:S1602;ruleKey=squid:S1602;profileKey=java-sonar-way-87679;severity=MAJOR	QPROFILE	ACTIVATED	\N	AVEkfam3DYGOfkZA7KGb
110	2015-11-20 10:43:13.978	\N	key=java-sonar-way-87679:squid:S1611;ruleKey=squid:S1611;profileKey=java-sonar-way-87679;severity=MINOR	QPROFILE	ACTIVATED	\N	AVEkfam6DYGOfkZA7KGc
111	2015-11-20 10:43:13.979	\N	key=java-sonar-way-87679:squid:S1700;ruleKey=squid:S1700;profileKey=java-sonar-way-87679;severity=MAJOR	QPROFILE	ACTIVATED	\N	AVEkfam7DYGOfkZA7KGd
112	2015-11-20 10:43:13.981	\N	key=java-sonar-way-87679:squid:S1172;ruleKey=squid:S1172;profileKey=java-sonar-way-87679;severity=MAJOR	QPROFILE	ACTIVATED	\N	AVEkfam9DYGOfkZA7KGe
113	2015-11-20 10:43:13.987	\N	key=java-sonar-way-87679:squid:S1598;ruleKey=squid:S1598;profileKey=java-sonar-way-87679;severity=MAJOR	QPROFILE	ACTIVATED	\N	AVEkfanDDYGOfkZA7KGf
114	2015-11-20 10:43:13.989	\N	key=java-sonar-way-87679:squid:S1873;ruleKey=squid:S1873;profileKey=java-sonar-way-87679;severity=CRITICAL	QPROFILE	ACTIVATED	\N	AVEkfanEDYGOfkZA7KGg
115	2015-11-20 10:43:14.003	\N	key=java-sonar-way-87679:squid:S1948;ruleKey=squid:S1948;profileKey=java-sonar-way-87679;severity=CRITICAL	QPROFILE	ACTIVATED	\N	AVEkfanTDYGOfkZA7KGh
116	2015-11-20 10:43:14.007	\N	key=java-sonar-way-87679:squid:S1479;ruleKey=squid:S1479;profileKey=java-sonar-way-87679;param_maximum=30;severity=MAJOR	QPROFILE	ACTIVATED	\N	AVEkfanWDYGOfkZA7KGi
117	2015-11-20 10:43:14.011	\N	key=java-sonar-way-87679:squid:S1764;ruleKey=squid:S1764;profileKey=java-sonar-way-87679;severity=CRITICAL	QPROFILE	ACTIVATED	\N	AVEkfanbDYGOfkZA7KGj
118	2015-11-20 10:43:14.013	\N	key=java-sonar-way-87679:squid:S1244;ruleKey=squid:S1244;profileKey=java-sonar-way-87679;severity=CRITICAL	QPROFILE	ACTIVATED	\N	AVEkfandDYGOfkZA7KGk
119	2015-11-20 10:43:14.015	\N	key=java-sonar-way-87679:squid:S2077;ruleKey=squid:S2077;profileKey=java-sonar-way-87679;severity=CRITICAL	QPROFILE	ACTIVATED	\N	AVEkfanfDYGOfkZA7KGl
120	2015-11-20 10:43:14.018	\N	key=java-sonar-way-87679:squid:S1161;ruleKey=squid:S1161;profileKey=java-sonar-way-87679;severity=MAJOR	QPROFILE	ACTIVATED	\N	AVEkfaniDYGOfkZA7KGm
121	2015-11-20 10:43:14.024	\N	key=java-sonar-way-87679:squid:S1994;ruleKey=squid:S1994;profileKey=java-sonar-way-87679;severity=CRITICAL	QPROFILE	ACTIVATED	\N	AVEkfanoDYGOfkZA7KGn
122	2015-11-20 10:43:14.026	\N	key=java-sonar-way-87679:squid:S2094;ruleKey=squid:S2094;profileKey=java-sonar-way-87679;severity=MAJOR	QPROFILE	ACTIVATED	\N	AVEkfanqDYGOfkZA7KGo
123	2015-11-20 10:43:14.029	\N	key=java-sonar-way-87679:squid:S1850;ruleKey=squid:S1850;profileKey=java-sonar-way-87679;severity=MAJOR	QPROFILE	ACTIVATED	\N	AVEkfansDYGOfkZA7KGp
124	2015-11-20 10:43:14.03	\N	key=java-sonar-way-87679:squid:S1905;ruleKey=squid:S1905;profileKey=java-sonar-way-87679;severity=MINOR	QPROFILE	ACTIVATED	\N	AVEkfanuDYGOfkZA7KGq
125	2015-11-20 10:43:14.037	\N	key=java-sonar-way-87679:squid:S2114;ruleKey=squid:S2114;profileKey=java-sonar-way-87679;severity=CRITICAL	QPROFILE	ACTIVATED	\N	AVEkfan1DYGOfkZA7KGr
126	2015-11-20 10:43:14.039	\N	key=java-sonar-way-87679:squid:S1065;ruleKey=squid:S1065;profileKey=java-sonar-way-87679;severity=MAJOR	QPROFILE	ACTIVATED	\N	AVEkfan3DYGOfkZA7KGs
127	2015-11-20 10:43:14.045	\N	key=java-sonar-way-87679:squid:S2184;ruleKey=squid:S2184;profileKey=java-sonar-way-87679;severity=MAJOR	QPROFILE	ACTIVATED	\N	AVEkfan8DYGOfkZA7KGt
128	2015-11-20 10:43:14.048	\N	key=java-sonar-way-87679:squid:S2225;ruleKey=squid:S2225;profileKey=java-sonar-way-87679;severity=CRITICAL	QPROFILE	ACTIVATED	\N	AVEkfaoADYGOfkZA7KGu
129	2015-11-20 10:43:14.054	\N	key=java-sonar-way-87679:squid:S2230;ruleKey=squid:S2230;profileKey=java-sonar-way-87679;severity=CRITICAL	QPROFILE	ACTIVATED	\N	AVEkfaoGDYGOfkZA7KGv
130	2015-11-20 10:43:14.058	\N	key=java-sonar-way-87679:squid:S2200;ruleKey=squid:S2200;profileKey=java-sonar-way-87679;severity=MAJOR	QPROFILE	ACTIVATED	\N	AVEkfaoKDYGOfkZA7KGw
131	2015-11-20 10:43:14.067	\N	key=java-sonar-way-87679:squid:S2092;ruleKey=squid:S2092;profileKey=java-sonar-way-87679;severity=CRITICAL	QPROFILE	ACTIVATED	\N	AVEkfaoTDYGOfkZA7KGx
132	2015-11-20 10:43:14.074	\N	key=java-sonar-way-87679:squid:S1848;ruleKey=squid:S1848;profileKey=java-sonar-way-87679;severity=CRITICAL	QPROFILE	ACTIVATED	\N	AVEkfaoaDYGOfkZA7KGy
133	2015-11-20 10:43:14.076	\N	key=java-sonar-way-87679:squid:S2235;ruleKey=squid:S2235;profileKey=java-sonar-way-87679;severity=CRITICAL	QPROFILE	ACTIVATED	\N	AVEkfaocDYGOfkZA7KGz
134	2015-11-20 10:43:14.078	\N	key=java-sonar-way-87679:squid:S888;ruleKey=squid:S888;profileKey=java-sonar-way-87679;severity=CRITICAL	QPROFILE	ACTIVATED	\N	AVEkfaoeDYGOfkZA7KG0
135	2015-11-20 10:43:14.08	\N	key=java-sonar-way-87679:squid:S2068;ruleKey=squid:S2068;profileKey=java-sonar-way-87679;severity=CRITICAL	QPROFILE	ACTIVATED	\N	AVEkfaofDYGOfkZA7KG1
136	2015-11-20 10:43:14.082	\N	key=java-sonar-way-87679:squid:S2232;ruleKey=squid:S2232;profileKey=java-sonar-way-87679;severity=CRITICAL	QPROFILE	ACTIVATED	\N	AVEkfaoiDYGOfkZA7KG2
137	2015-11-20 10:43:14.098	\N	key=java-sonar-way-87679:squid:S1849;ruleKey=squid:S1849;profileKey=java-sonar-way-87679;severity=BLOCKER	QPROFILE	ACTIVATED	\N	AVEkfaoyDYGOfkZA7KG3
138	2015-11-20 10:43:14.1	\N	key=java-sonar-way-87679:squid:S2236;ruleKey=squid:S2236;profileKey=java-sonar-way-87679;severity=BLOCKER	QPROFILE	ACTIVATED	\N	AVEkfao0DYGOfkZA7KG4
139	2015-11-20 10:43:14.102	\N	key=java-sonar-way-87679:squid:S1844;ruleKey=squid:S1844;profileKey=java-sonar-way-87679;severity=BLOCKER	QPROFILE	ACTIVATED	\N	AVEkfao2DYGOfkZA7KG5
140	2015-11-20 10:43:14.104	\N	key=java-sonar-way-87679:squid:S2251;ruleKey=squid:S2251;profileKey=java-sonar-way-87679;severity=BLOCKER	QPROFILE	ACTIVATED	\N	AVEkfao4DYGOfkZA7KG6
141	2015-11-20 10:43:14.106	\N	key=java-sonar-way-87679:squid:S2252;ruleKey=squid:S2252;profileKey=java-sonar-way-87679;severity=CRITICAL	QPROFILE	ACTIVATED	\N	AVEkfao6DYGOfkZA7KG7
142	2015-11-20 10:43:14.112	\N	key=java-sonar-way-87679:squid:S2254;ruleKey=squid:S2254;profileKey=java-sonar-way-87679;severity=CRITICAL	QPROFILE	ACTIVATED	\N	AVEkfapADYGOfkZA7KG8
143	2015-11-20 10:43:14.114	\N	key=java-sonar-way-87679:squid:S2250;ruleKey=squid:S2250;profileKey=java-sonar-way-87679;severity=CRITICAL	QPROFILE	ACTIVATED	\N	AVEkfapCDYGOfkZA7KG9
144	2015-11-20 10:43:14.115	\N	key=java-sonar-way-87679:squid:S2226;ruleKey=squid:S2226;profileKey=java-sonar-way-87679;severity=CRITICAL	QPROFILE	ACTIVATED	\N	AVEkfapDDYGOfkZA7KG-
145	2015-11-20 10:43:14.122	\N	key=java-sonar-way-87679:squid:S2111;ruleKey=squid:S2111;profileKey=java-sonar-way-87679;severity=CRITICAL	QPROFILE	ACTIVATED	\N	AVEkfapKDYGOfkZA7KG_
146	2015-11-20 10:43:14.129	\N	key=java-sonar-way-87679:squid:S2109;ruleKey=squid:S2109;profileKey=java-sonar-way-87679;severity=BLOCKER	QPROFILE	ACTIVATED	\N	AVEkfapRDYGOfkZA7KHA
147	2015-11-20 10:43:14.133	\N	key=java-sonar-way-87679:squid:S2273;ruleKey=squid:S2273;profileKey=java-sonar-way-87679;severity=CRITICAL	QPROFILE	ACTIVATED	\N	AVEkfapVDYGOfkZA7KHB
148	2015-11-20 10:43:14.135	\N	key=java-sonar-way-87679:squid:S2276;ruleKey=squid:S2276;profileKey=java-sonar-way-87679;severity=CRITICAL	QPROFILE	ACTIVATED	\N	AVEkfapXDYGOfkZA7KHC
149	2015-11-20 10:43:14.137	\N	key=java-sonar-way-87679:squid:S2274;ruleKey=squid:S2274;profileKey=java-sonar-way-87679;severity=CRITICAL	QPROFILE	ACTIVATED	\N	AVEkfapZDYGOfkZA7KHD
150	2015-11-20 10:43:14.141	\N	key=java-sonar-way-87679:squid:S2272;ruleKey=squid:S2272;profileKey=java-sonar-way-87679;severity=MAJOR	QPROFILE	ACTIVATED	\N	AVEkfapdDYGOfkZA7KHE
151	2015-11-20 10:43:14.151	\N	key=java-sonar-way-87679:squid:S2277;ruleKey=squid:S2277;profileKey=java-sonar-way-87679;severity=CRITICAL	QPROFILE	ACTIVATED	\N	AVEkfapnDYGOfkZA7KHF
152	2015-11-20 10:43:14.153	\N	key=java-sonar-way-87679:squid:S2204;ruleKey=squid:S2204;profileKey=java-sonar-way-87679;severity=BLOCKER	QPROFILE	ACTIVATED	\N	AVEkfappDYGOfkZA7KHG
153	2015-11-20 10:43:14.162	\N	key=java-sonar-way-87679:squid:S2178;ruleKey=squid:S2178;profileKey=java-sonar-way-87679;severity=CRITICAL	QPROFILE	ACTIVATED	\N	AVEkfapyDYGOfkZA7KHH
154	2015-11-20 10:43:14.164	\N	key=java-sonar-way-87679:squid:S2116;ruleKey=squid:S2116;profileKey=java-sonar-way-87679;severity=CRITICAL	QPROFILE	ACTIVATED	\N	AVEkfap0DYGOfkZA7KHI
155	2015-11-20 10:43:14.166	\N	key=java-sonar-way-87679:squid:S2157;ruleKey=squid:S2157;profileKey=java-sonar-way-87679;severity=CRITICAL	QPROFILE	ACTIVATED	\N	AVEkfap2DYGOfkZA7KHJ
156	2015-11-20 10:43:14.167	\N	key=java-sonar-way-87679:squid:S2275;ruleKey=squid:S2275;profileKey=java-sonar-way-87679;severity=CRITICAL	QPROFILE	ACTIVATED	\N	AVEkfap3DYGOfkZA7KHK
157	2015-11-20 10:43:14.169	\N	key=java-sonar-way-87679:squid:S2151;ruleKey=squid:S2151;profileKey=java-sonar-way-87679;severity=BLOCKER	QPROFILE	ACTIVATED	\N	AVEkfap5DYGOfkZA7KHL
158	2015-11-20 10:43:14.177	\N	key=java-sonar-way-87679:squid:S2127;ruleKey=squid:S2127;profileKey=java-sonar-way-87679;severity=BLOCKER	QPROFILE	ACTIVATED	\N	AVEkfaqBDYGOfkZA7KHM
159	2015-11-20 10:43:14.191	\N	key=java-sonar-way-87679:squid:S1860;ruleKey=squid:S1860;profileKey=java-sonar-way-87679;severity=BLOCKER	QPROFILE	ACTIVATED	\N	AVEkfaqPDYGOfkZA7KHN
160	2015-11-20 10:43:14.193	\N	key=java-sonar-way-87679:squid:S2055;ruleKey=squid:S2055;profileKey=java-sonar-way-87679;severity=CRITICAL	QPROFILE	ACTIVATED	\N	AVEkfaqRDYGOfkZA7KHO
161	2015-11-20 10:43:14.195	\N	key=java-sonar-way-87679:squid:S2118;ruleKey=squid:S2118;profileKey=java-sonar-way-87679;severity=CRITICAL	QPROFILE	ACTIVATED	\N	AVEkfaqTDYGOfkZA7KHP
162	2015-11-20 10:43:14.197	\N	key=java-sonar-way-87679:squid:S2066;ruleKey=squid:S2066;profileKey=java-sonar-way-87679;severity=CRITICAL	QPROFILE	ACTIVATED	\N	AVEkfaqVDYGOfkZA7KHQ
163	2015-11-20 10:43:14.199	\N	key=java-sonar-way-87679:squid:S2065;ruleKey=squid:S2065;profileKey=java-sonar-way-87679;severity=MINOR	QPROFILE	ACTIVATED	\N	AVEkfaqXDYGOfkZA7KHR
164	2015-11-20 10:43:14.203	\N	key=java-sonar-way-87679:squid:S2061;ruleKey=squid:S2061;profileKey=java-sonar-way-87679;severity=CRITICAL	QPROFILE	ACTIVATED	\N	AVEkfaqbDYGOfkZA7KHS
165	2015-11-20 10:43:14.205	\N	key=java-sonar-way-87679:squid:S2176;ruleKey=squid:S2176;profileKey=java-sonar-way-87679;severity=MAJOR	QPROFILE	ACTIVATED	\N	AVEkfaqdDYGOfkZA7KHT
166	2015-11-20 10:43:14.206	\N	key=java-sonar-way-87679:squid:S2130;ruleKey=squid:S2130;profileKey=java-sonar-way-87679;severity=MAJOR	QPROFILE	ACTIVATED	\N	AVEkfaqeDYGOfkZA7KHU
167	2015-11-20 10:43:14.213	\N	key=java-sonar-way-87679:squid:S2166;ruleKey=squid:S2166;profileKey=java-sonar-way-87679;severity=MAJOR	QPROFILE	ACTIVATED	\N	AVEkfaqlDYGOfkZA7KHV
168	2015-11-20 10:43:14.215	\N	key=java-sonar-way-87679:squid:S2153;ruleKey=squid:S2153;profileKey=java-sonar-way-87679;severity=MAJOR	QPROFILE	ACTIVATED	\N	AVEkfaqnDYGOfkZA7KHW
169	2015-11-20 10:43:14.216	\N	key=java-sonar-way-87679:squid:S2326;ruleKey=squid:S2326;profileKey=java-sonar-way-87679;severity=MAJOR	QPROFILE	ACTIVATED	\N	AVEkfaqoDYGOfkZA7KHX
170	2015-11-20 10:43:14.221	\N	key=java-sonar-way-87679:squid:S2183;ruleKey=squid:S2183;profileKey=java-sonar-way-87679;severity=CRITICAL	QPROFILE	ACTIVATED	\N	AVEkfaqtDYGOfkZA7KHY
171	2015-11-20 10:43:14.227	\N	key=java-sonar-way-87679:squid:S2167;ruleKey=squid:S2167;profileKey=java-sonar-way-87679;severity=CRITICAL	QPROFILE	ACTIVATED	\N	AVEkfaqzDYGOfkZA7KHZ
172	2015-11-20 10:43:14.229	\N	key=java-sonar-way-87679:squid:S2165;ruleKey=squid:S2165;profileKey=java-sonar-way-87679;severity=MAJOR	QPROFILE	ACTIVATED	\N	AVEkfaq1DYGOfkZA7KHa
173	2015-11-20 10:43:14.242	\N	key=java-sonar-way-87679:squid:S2122;ruleKey=squid:S2122;profileKey=java-sonar-way-87679;severity=BLOCKER	QPROFILE	ACTIVATED	\N	AVEkfarCDYGOfkZA7KHb
174	2015-11-20 10:43:14.25	\N	key=java-sonar-way-87679:squid:S2134;ruleKey=squid:S2134;profileKey=java-sonar-way-87679;severity=MAJOR	QPROFILE	ACTIVATED	\N	AVEkfarKDYGOfkZA7KHc
175	2015-11-20 10:43:14.252	\N	key=java-sonar-way-87679:squid:S2175;ruleKey=squid:S2175;profileKey=java-sonar-way-87679;severity=CRITICAL	QPROFILE	ACTIVATED	\N	AVEkfarMDYGOfkZA7KHd
176	2015-11-20 10:43:14.254	\N	key=java-sonar-way-87679:squid:S2447;ruleKey=squid:S2447;profileKey=java-sonar-way-87679;severity=CRITICAL	QPROFILE	ACTIVATED	\N	AVEkfarODYGOfkZA7KHe
177	2015-11-20 10:43:14.256	\N	key=java-sonar-way-87679:squid:S2131;ruleKey=squid:S2131;profileKey=java-sonar-way-87679;severity=MAJOR	QPROFILE	ACTIVATED	\N	AVEkfarQDYGOfkZA7KHf
178	2015-11-20 10:43:14.263	\N	key=java-sonar-way-87679:squid:S2437;ruleKey=squid:S2437;profileKey=java-sonar-way-87679;severity=MAJOR	QPROFILE	ACTIVATED	\N	AVEkfarXDYGOfkZA7KHg
179	2015-11-20 10:43:14.265	\N	key=java-sonar-way-87679:squid:S2110;ruleKey=squid:S2110;profileKey=java-sonar-way-87679;severity=CRITICAL	QPROFILE	ACTIVATED	\N	AVEkfarZDYGOfkZA7KHh
180	2015-11-20 10:43:14.266	\N	key=java-sonar-way-87679:squid:S2160;ruleKey=squid:S2160;profileKey=java-sonar-way-87679;severity=MAJOR	QPROFILE	ACTIVATED	\N	AVEkfaraDYGOfkZA7KHi
181	2015-11-20 10:43:14.268	\N	key=java-sonar-way-87679:squid:S1872;ruleKey=squid:S1872;profileKey=java-sonar-way-87679;severity=CRITICAL	QPROFILE	ACTIVATED	\N	AVEkfarcDYGOfkZA7KHj
182	2015-11-20 10:43:14.284	\N	key=java-sonar-way-87679:squid:S2440;ruleKey=squid:S2440;profileKey=java-sonar-way-87679;severity=MAJOR	QPROFILE	ACTIVATED	\N	AVEkfarsDYGOfkZA7KHk
183	2015-11-20 10:43:14.286	\N	key=java-sonar-way-87679:squid:S2441;ruleKey=squid:S2441;profileKey=java-sonar-way-87679;severity=CRITICAL	QPROFILE	ACTIVATED	\N	AVEkfaruDYGOfkZA7KHl
184	2015-11-20 10:43:14.288	\N	key=java-sonar-way-87679:squid:S2123;ruleKey=squid:S2123;profileKey=java-sonar-way-87679;severity=CRITICAL	QPROFILE	ACTIVATED	\N	AVEkfarwDYGOfkZA7KHm
185	2015-11-20 10:43:14.289	\N	key=java-sonar-way-87679:squid:S2133;ruleKey=squid:S2133;profileKey=java-sonar-way-87679;severity=MAJOR	QPROFILE	ACTIVATED	\N	AVEkfarxDYGOfkZA7KHn
186	2015-11-20 10:43:14.291	\N	key=java-sonar-way-87679:squid:S2154;ruleKey=squid:S2154;profileKey=java-sonar-way-87679;severity=CRITICAL	QPROFILE	ACTIVATED	\N	AVEkfarzDYGOfkZA7KHo
187	2015-11-20 10:43:14.314	\N	key=java-sonar-way-87679:squid:S2442;ruleKey=squid:S2442;profileKey=java-sonar-way-87679;severity=BLOCKER	QPROFILE	ACTIVATED	\N	AVEkfasKDYGOfkZA7KHp
188	2015-11-20 10:43:14.316	\N	key=java-sonar-way-87679:squid:S2388;ruleKey=squid:S2388;profileKey=java-sonar-way-87679;severity=MAJOR	QPROFILE	ACTIVATED	\N	AVEkfasMDYGOfkZA7KHq
189	2015-11-20 10:43:14.319	\N	key=java-sonar-way-87679:squid:S2438;ruleKey=squid:S2438;profileKey=java-sonar-way-87679;severity=CRITICAL	QPROFILE	ACTIVATED	\N	AVEkfasODYGOfkZA7KHr
190	2015-11-20 10:43:14.32	\N	key=java-sonar-way-87679:squid:S2259;ruleKey=squid:S2259;profileKey=java-sonar-way-87679;severity=BLOCKER	QPROFILE	ACTIVATED	\N	AVEkfasQDYGOfkZA7KHs
191	2015-11-20 10:43:14.322	\N	key=java-sonar-way-87679:squid:S2583;ruleKey=squid:S2583;profileKey=java-sonar-way-87679;severity=BLOCKER	QPROFILE	ACTIVATED	\N	AVEkfasSDYGOfkZA7KHt
192	2015-11-20 10:43:14.334	\N	key=java-sonar-way-87679:squid:S2696;ruleKey=squid:S2696;profileKey=java-sonar-way-87679;severity=CRITICAL	QPROFILE	ACTIVATED	\N	AVEkfaseDYGOfkZA7KHu
193	2015-11-20 10:43:14.336	\N	key=java-sonar-way-87679:squid:S2674;ruleKey=squid:S2674;profileKey=java-sonar-way-87679;severity=CRITICAL	QPROFILE	ACTIVATED	\N	AVEkfasgDYGOfkZA7KHv
194	2015-11-20 10:43:14.337	\N	key=java-sonar-way-87679:squid:S2695;ruleKey=squid:S2695;profileKey=java-sonar-way-87679;severity=BLOCKER	QPROFILE	ACTIVATED	\N	AVEkfashDYGOfkZA7KHw
195	2015-11-20 10:43:14.344	\N	key=java-sonar-way-87679:squid:S2112;ruleKey=squid:S2112;profileKey=java-sonar-way-87679;severity=CRITICAL	QPROFILE	ACTIVATED	\N	AVEkfasoDYGOfkZA7KHx
196	2015-11-20 10:43:14.346	\N	key=java-sonar-way-87679:squid:S2387;ruleKey=squid:S2387;profileKey=java-sonar-way-87679;severity=MAJOR	QPROFILE	ACTIVATED	\N	AVEkfasqDYGOfkZA7KHy
197	2015-11-20 10:43:14.348	\N	key=java-sonar-way-87679:squid:S2786;ruleKey=squid:S2786;profileKey=java-sonar-way-87679;severity=MAJOR	QPROFILE	ACTIVATED	\N	AVEkfassDYGOfkZA7KHz
198	2015-11-20 10:43:14.35	\N	key=java-sonar-way-87679:squid:S2095;ruleKey=squid:S2095;profileKey=java-sonar-way-87679;severity=BLOCKER	QPROFILE	ACTIVATED	\N	AVEkfasuDYGOfkZA7KH0
199	2015-11-20 10:43:14.354	\N	key=java-sonar-way-87679:squid:S2677;ruleKey=squid:S2677;profileKey=java-sonar-way-87679;severity=BLOCKER	QPROFILE	ACTIVATED	\N	AVEkfasyDYGOfkZA7KH1
200	2015-11-20 10:43:14.356	\N	key=java-sonar-way-87679:squid:S1858;ruleKey=squid:S1858;profileKey=java-sonar-way-87679;severity=MAJOR	QPROFILE	ACTIVATED	\N	AVEkfas0DYGOfkZA7KH2
201	2015-11-20 10:43:14.358	\N	key=java-sonar-way-87679:squid:S2864;ruleKey=squid:S2864;profileKey=java-sonar-way-87679;severity=MAJOR	QPROFILE	ACTIVATED	\N	AVEkfas2DYGOfkZA7KH3
202	2015-11-20 10:43:14.375	\N	key=java-sonar-way-87679:squid:S2692;ruleKey=squid:S2692;profileKey=java-sonar-way-87679;severity=CRITICAL	QPROFILE	ACTIVATED	\N	AVEkfatHDYGOfkZA7KH4
203	2015-11-20 10:43:14.377	\N	key=java-sonar-way-87679:squid:S2675;ruleKey=squid:S2675;profileKey=java-sonar-way-87679;severity=MAJOR	QPROFILE	ACTIVATED	\N	AVEkfatJDYGOfkZA7KH5
204	2015-11-20 10:43:14.379	\N	key=java-sonar-way-87679:squid:S2676;ruleKey=squid:S2676;profileKey=java-sonar-way-87679;severity=CRITICAL	QPROFILE	ACTIVATED	\N	AVEkfatLDYGOfkZA7KH6
205	2015-11-20 10:43:14.381	\N	key=java-sonar-way-87679:squid:S2885;ruleKey=squid:S2885;profileKey=java-sonar-way-87679;severity=CRITICAL	QPROFILE	ACTIVATED	\N	AVEkfatNDYGOfkZA7KH7
206	2015-11-20 10:43:14.383	\N	key=java-sonar-way-87679:squid:S2222;ruleKey=squid:S2222;profileKey=java-sonar-way-87679;severity=CRITICAL	QPROFILE	ACTIVATED	\N	AVEkfatPDYGOfkZA7KH8
207	2015-11-20 10:43:14.395	\N	key=java-sonar-way-87679:squid:S2097;ruleKey=squid:S2097;profileKey=java-sonar-way-87679;severity=BLOCKER	QPROFILE	ACTIVATED	\N	AVEkfatbDYGOfkZA7KH9
208	2015-11-20 10:43:14.397	\N	key=java-sonar-way-87679:squid:S2185;ruleKey=squid:S2185;profileKey=java-sonar-way-87679;severity=MAJOR	QPROFILE	ACTIVATED	\N	AVEkfatdDYGOfkZA7KH-
209	2015-11-20 10:43:14.399	\N	key=java-sonar-way-87679:squid:S2159;ruleKey=squid:S2159;profileKey=java-sonar-way-87679;severity=MAJOR	QPROFILE	ACTIVATED	\N	AVEkfatfDYGOfkZA7KH_
210	2015-11-20 10:43:14.401	\N	key=java-sonar-way-87679:squid:S2912;ruleKey=squid:S2912;profileKey=java-sonar-way-87679;severity=MAJOR	QPROFILE	ACTIVATED	\N	AVEkfathDYGOfkZA7KIA
211	2015-11-20 10:43:14.403	\N	key=java-sonar-way-87679:squid:S2209;ruleKey=squid:S2209;profileKey=java-sonar-way-87679;severity=MAJOR	QPROFILE	ACTIVATED	\N	AVEkfatjDYGOfkZA7KIB
212	2015-11-20 10:43:14.413	\N	key=java-sonar-way-87679:squid:S2325;ruleKey=squid:S2325;profileKey=java-sonar-way-87679;severity=MINOR	QPROFILE	ACTIVATED	\N	AVEkfattDYGOfkZA7KIC
213	2015-11-20 10:43:14.415	\N	key=java-sonar-way-87679:squid:S1264;ruleKey=squid:S1264;profileKey=java-sonar-way-87679;severity=MINOR	QPROFILE	ACTIVATED	\N	AVEkfatvDYGOfkZA7KID
214	2015-11-20 10:43:14.418	\N	key=java-sonar-way-87679:squid:S2681;ruleKey=squid:S2681;profileKey=java-sonar-way-87679;severity=CRITICAL	QPROFILE	ACTIVATED	\N	AVEkfatxDYGOfkZA7KIE
215	2015-11-20 10:43:14.42	\N	key=java-sonar-way-87679:squid:S1640;ruleKey=squid:S1640;profileKey=java-sonar-way-87679;severity=MAJOR	QPROFILE	ACTIVATED	\N	AVEkfat0DYGOfkZA7KIF
216	2015-11-20 10:43:14.428	\N	key=java-sonar-way-87679:squid:S2976;ruleKey=squid:S2976;profileKey=java-sonar-way-87679;severity=CRITICAL	QPROFILE	ACTIVATED	\N	AVEkfat8DYGOfkZA7KIG
217	2015-11-20 10:43:14.43	\N	key=java-sonar-way-87679:squid:S1989;ruleKey=squid:S1989;profileKey=java-sonar-way-87679;severity=CRITICAL	QPROFILE	ACTIVATED	\N	AVEkfat-DYGOfkZA7KIH
218	2015-11-20 10:43:14.431	\N	key=java-sonar-way-87679:squid:S1845;ruleKey=squid:S1845;profileKey=java-sonar-way-87679;severity=MAJOR	QPROFILE	ACTIVATED	\N	AVEkfat_DYGOfkZA7KII
219	2015-11-20 10:43:14.435	\N	key=java-sonar-way-87679:squid:S2386;ruleKey=squid:S2386;profileKey=java-sonar-way-87679;severity=CRITICAL	QPROFILE	ACTIVATED	\N	AVEkfauDDYGOfkZA7KIJ
220	2015-11-20 10:43:14.437	\N	key=java-sonar-way-87679:squid:S2975;ruleKey=squid:S2975;profileKey=java-sonar-way-87679;severity=MAJOR	QPROFILE	ACTIVATED	\N	AVEkfauFDYGOfkZA7KIK
221	2015-11-20 10:43:14.445	\N	key=java-sonar-way-87679:squid:S2653;ruleKey=squid:S2653;profileKey=java-sonar-way-87679;severity=CRITICAL	QPROFILE	ACTIVATED	\N	AVEkfauNDYGOfkZA7KIL
222	2015-11-20 10:43:14.447	\N	key=java-sonar-way-87679:squid:S1854;ruleKey=squid:S1854;profileKey=java-sonar-way-87679;severity=MAJOR	QPROFILE	ACTIVATED	\N	AVEkfauPDYGOfkZA7KIM
223	2015-11-20 10:43:14.454	\N	key=java-sonar-way-87679:squid:S2188;ruleKey=squid:S2188;profileKey=java-sonar-way-87679;severity=CRITICAL	QPROFILE	ACTIVATED	\N	AVEkfauWDYGOfkZA7KIN
224	2015-11-20 10:43:14.456	\N	key=java-sonar-way-87679:squid:S2186;ruleKey=squid:S2186;profileKey=java-sonar-way-87679;severity=CRITICAL	QPROFILE	ACTIVATED	\N	AVEkfauYDYGOfkZA7KIO
225	2015-11-20 10:43:14.458	\N	key=java-sonar-way-87679:squid:S2187;ruleKey=squid:S2187;profileKey=java-sonar-way-87679;severity=MAJOR	QPROFILE	ACTIVATED	\N	AVEkfauaDYGOfkZA7KIP
226	2015-11-20 10:43:14.46	\N	key=java-sonar-way-87679:squid:S2391;ruleKey=squid:S2391;profileKey=java-sonar-way-87679;severity=CRITICAL	QPROFILE	ACTIVATED	\N	AVEkfaucDYGOfkZA7KIQ
227	2015-11-20 10:43:14.462	\N	key=java-sonar-way-87679:squid:S2970;ruleKey=squid:S2970;profileKey=java-sonar-way-87679;severity=CRITICAL	QPROFILE	ACTIVATED	\N	AVEkfaueDYGOfkZA7KIR
228	2015-11-20 10:43:14.473	\N	key=java-sonar-way-87679:squid:S2925;ruleKey=squid:S2925;profileKey=java-sonar-way-87679;severity=CRITICAL	QPROFILE	ACTIVATED	\N	AVEkfaupDYGOfkZA7KIS
229	2015-11-20 10:43:14.478	\N	key=java-sonar-way-87679:squid:S2924;ruleKey=squid:S2924;profileKey=java-sonar-way-87679;severity=MAJOR	QPROFILE	ACTIVATED	\N	AVEkfauuDYGOfkZA7KIT
\.


--
-- Name: activities_id_seq; Type: SEQUENCE SET; Schema: public; Owner: sonar
--

SELECT pg_catalog.setval('activities_id_seq', 229, true);


--
-- Data for Name: authors; Type: TABLE DATA; Schema: public; Owner: sonar
--

COPY authors (id, person_id, login, created_at, updated_at) FROM stdin;
\.


--
-- Name: authors_id_seq; Type: SEQUENCE SET; Schema: public; Owner: sonar
--

SELECT pg_catalog.setval('authors_id_seq', 1, false);


--
-- Data for Name: ce_activity; Type: TABLE DATA; Schema: public; Owner: sonar
--

COPY ce_activity (id, uuid, task_type, component_uuid, status, is_last, is_last_key, submitter_login, submitted_at, started_at, executed_at, created_at, updated_at, execution_time_ms) FROM stdin;
\.


--
-- Name: ce_activity_id_seq; Type: SEQUENCE SET; Schema: public; Owner: sonar
--

SELECT pg_catalog.setval('ce_activity_id_seq', 1, false);


--
-- Data for Name: ce_queue; Type: TABLE DATA; Schema: public; Owner: sonar
--

COPY ce_queue (id, uuid, task_type, component_uuid, status, submitter_login, started_at, created_at, updated_at) FROM stdin;
\.


--
-- Name: ce_queue_id_seq; Type: SEQUENCE SET; Schema: public; Owner: sonar
--

SELECT pg_catalog.setval('ce_queue_id_seq', 1, false);


--
-- Data for Name: characteristics; Type: TABLE DATA; Schema: public; Owner: sonar
--

COPY characteristics (id, kee, name, rule_id, characteristic_order, enabled, parent_id, root_id, function_key, factor_value, factor_unit, offset_value, offset_unit, created_at, updated_at) FROM stdin;
1	REUSABILITY	Reusability	\N	1	t	\N	\N	\N	\N	\N	\N	\N	2015-11-20 10:43:07.296	\N
2	MODULARITY	Modularity	\N	\N	t	1	\N	\N	\N	\N	\N	\N	2015-11-20 10:43:07.296	\N
3	REUSABILITY_COMPLIANCE	Reusability Compliance	\N	\N	t	1	\N	\N	\N	\N	\N	\N	2015-11-20 10:43:07.296	\N
4	TRANSPORTABILITY	Transportability	\N	\N	t	1	\N	\N	\N	\N	\N	\N	2015-11-20 10:43:07.296	\N
5	PORTABILITY	Portability	\N	2	t	\N	\N	\N	\N	\N	\N	\N	2015-11-20 10:43:07.296	\N
6	COMPILER_RELATED_PORTABILITY	Compiler	\N	\N	t	5	\N	\N	\N	\N	\N	\N	2015-11-20 10:43:07.296	\N
7	HARDWARE_RELATED_PORTABILITY	Hardware	\N	\N	t	5	\N	\N	\N	\N	\N	\N	2015-11-20 10:43:07.296	\N
8	LANGUAGE_RELATED_PORTABILITY	Language	\N	\N	t	5	\N	\N	\N	\N	\N	\N	2015-11-20 10:43:07.296	\N
9	OS_RELATED_PORTABILITY	OS	\N	\N	t	5	\N	\N	\N	\N	\N	\N	2015-11-20 10:43:07.296	\N
10	PORTABILITY_COMPLIANCE	Portability Compliance	\N	\N	t	5	\N	\N	\N	\N	\N	\N	2015-11-20 10:43:07.296	\N
11	SOFTWARE_RELATED_PORTABILITY	Software	\N	\N	t	5	\N	\N	\N	\N	\N	\N	2015-11-20 10:43:07.296	\N
12	TIME_ZONE_RELATED_PORTABILITY	Time zone	\N	\N	t	5	\N	\N	\N	\N	\N	\N	2015-11-20 10:43:07.296	\N
13	MAINTAINABILITY	Maintainability	\N	3	t	\N	\N	\N	\N	\N	\N	\N	2015-11-20 10:43:07.296	\N
14	MAINTAINABILITY_COMPLIANCE	Maintainability Compliance	\N	\N	t	13	\N	\N	\N	\N	\N	\N	2015-11-20 10:43:07.296	\N
15	READABILITY	Readability	\N	\N	t	13	\N	\N	\N	\N	\N	\N	2015-11-20 10:43:07.296	\N
16	UNDERSTANDABILITY	Understandability	\N	\N	t	13	\N	\N	\N	\N	\N	\N	2015-11-20 10:43:07.296	\N
17	SECURITY	Security	\N	4	t	\N	\N	\N	\N	\N	\N	\N	2015-11-20 10:43:07.296	\N
18	API_ABUSE	API abuse	\N	\N	t	17	\N	\N	\N	\N	\N	\N	2015-11-20 10:43:07.296	\N
19	ERRORS	Errors	\N	\N	t	17	\N	\N	\N	\N	\N	\N	2015-11-20 10:43:07.296	\N
20	INPUT_VALIDATION_AND_REPRESENTATION	Input validation and representation	\N	\N	t	17	\N	\N	\N	\N	\N	\N	2015-11-20 10:43:07.296	\N
21	SECURITY_COMPLIANCE	Security Compliance	\N	\N	t	17	\N	\N	\N	\N	\N	\N	2015-11-20 10:43:07.296	\N
22	SECURITY_FEATURES	Security features	\N	\N	t	17	\N	\N	\N	\N	\N	\N	2015-11-20 10:43:07.296	\N
23	USABILITY	Usability	\N	5	t	\N	\N	\N	\N	\N	\N	\N	2015-11-20 10:43:07.296	\N
24	USABILITY_ACCESSIBILITY	Accessibility	\N	\N	t	23	\N	\N	\N	\N	\N	\N	2015-11-20 10:43:07.296	\N
25	USABILITY_EASE_OF_USE	Ease of Use	\N	\N	t	23	\N	\N	\N	\N	\N	\N	2015-11-20 10:43:07.296	\N
26	USABILITY_COMPLIANCE	Usability Compliance	\N	\N	t	23	\N	\N	\N	\N	\N	\N	2015-11-20 10:43:07.296	\N
27	EFFICIENCY	Efficiency	\N	6	t	\N	\N	\N	\N	\N	\N	\N	2015-11-20 10:43:07.296	\N
28	EFFICIENCY_COMPLIANCE	Efficiency Compliance	\N	\N	t	27	\N	\N	\N	\N	\N	\N	2015-11-20 10:43:07.296	\N
29	MEMORY_EFFICIENCY	Memory use	\N	\N	t	27	\N	\N	\N	\N	\N	\N	2015-11-20 10:43:07.296	\N
30	NETWORK_USE	Network use	\N	\N	t	27	\N	\N	\N	\N	\N	\N	2015-11-20 10:43:07.296	\N
31	CPU_EFFICIENCY	Processor use	\N	\N	t	27	\N	\N	\N	\N	\N	\N	2015-11-20 10:43:07.296	\N
32	CHANGEABILITY	Changeability	\N	7	t	\N	\N	\N	\N	\N	\N	\N	2015-11-20 10:43:07.296	\N
33	ARCHITECTURE_CHANGEABILITY	Architecture	\N	\N	t	32	\N	\N	\N	\N	\N	\N	2015-11-20 10:43:07.296	\N
34	CHANGEABILITY_COMPLIANCE	Changeability Compliance	\N	\N	t	32	\N	\N	\N	\N	\N	\N	2015-11-20 10:43:07.296	\N
35	DATA_CHANGEABILITY	Data	\N	\N	t	32	\N	\N	\N	\N	\N	\N	2015-11-20 10:43:07.296	\N
36	LOGIC_CHANGEABILITY	Logic	\N	\N	t	32	\N	\N	\N	\N	\N	\N	2015-11-20 10:43:07.296	\N
37	RELIABILITY	Reliability	\N	8	t	\N	\N	\N	\N	\N	\N	\N	2015-11-20 10:43:07.296	\N
38	ARCHITECTURE_RELIABILITY	Architecture	\N	\N	t	37	\N	\N	\N	\N	\N	\N	2015-11-20 10:43:07.296	\N
39	DATA_RELIABILITY	Data	\N	\N	t	37	\N	\N	\N	\N	\N	\N	2015-11-20 10:43:07.296	\N
40	EXCEPTION_HANDLING	Exception handling	\N	\N	t	37	\N	\N	\N	\N	\N	\N	2015-11-20 10:43:07.296	\N
41	FAULT_TOLERANCE	Fault tolerance	\N	\N	t	37	\N	\N	\N	\N	\N	\N	2015-11-20 10:43:07.296	\N
42	INSTRUCTION_RELIABILITY	Instruction	\N	\N	t	37	\N	\N	\N	\N	\N	\N	2015-11-20 10:43:07.296	\N
43	LOGIC_RELIABILITY	Logic	\N	\N	t	37	\N	\N	\N	\N	\N	\N	2015-11-20 10:43:07.296	\N
44	RELIABILITY_COMPLIANCE	Reliability Compliance	\N	\N	t	37	\N	\N	\N	\N	\N	\N	2015-11-20 10:43:07.296	\N
45	RESOURCE_RELIABILITY	Resource	\N	\N	t	37	\N	\N	\N	\N	\N	\N	2015-11-20 10:43:07.296	\N
46	SYNCHRONIZATION_RELIABILITY	Synchronization	\N	\N	t	37	\N	\N	\N	\N	\N	\N	2015-11-20 10:43:07.296	\N
47	UNIT_TESTS	Unit tests coverage	\N	\N	t	37	\N	\N	\N	\N	\N	\N	2015-11-20 10:43:07.296	\N
48	TESTABILITY	Testability	\N	9	t	\N	\N	\N	\N	\N	\N	\N	2015-11-20 10:43:07.296	\N
49	INTEGRATION_TESTABILITY	Integration level	\N	\N	t	48	\N	\N	\N	\N	\N	\N	2015-11-20 10:43:07.296	\N
50	TESTABILITY_COMPLIANCE	Testability Compliance	\N	\N	t	48	\N	\N	\N	\N	\N	\N	2015-11-20 10:43:07.296	\N
51	UNIT_TESTABILITY	Unit level	\N	\N	t	48	\N	\N	\N	\N	\N	\N	2015-11-20 10:43:07.296	\N
\.


--
-- Name: characteristics_id_seq; Type: SEQUENCE SET; Schema: public; Owner: sonar
--

SELECT pg_catalog.setval('characteristics_id_seq', 51, true);


--
-- Data for Name: dashboards; Type: TABLE DATA; Schema: public; Owner: sonar
--

COPY dashboards (id, user_id, name, description, column_layout, shared, created_at, updated_at, is_global) FROM stdin;
1	\N	Dashboard	\N	50%-50%	t	2015-11-20 10:43:15.643	2015-11-20 10:43:15.643	f
2	\N	Issues	\N	50%-50%	t	2015-11-20 10:43:15.665	2015-11-20 10:43:15.665	f
3	\N	TimeMachine	\N	50%-50%	t	2015-11-20 10:43:15.673	2015-11-20 10:43:15.673	f
4	\N	Home	\N	50%-50%	t	2015-11-20 10:43:15.698	2015-11-20 10:43:15.698	t
\.


--
-- Name: dashboards_id_seq; Type: SEQUENCE SET; Schema: public; Owner: sonar
--

SELECT pg_catalog.setval('dashboards_id_seq', 4, true);


--
-- Data for Name: duplications_index; Type: TABLE DATA; Schema: public; Owner: sonar
--

COPY duplications_index (project_snapshot_id, snapshot_id, hash, index_in_file, start_line, end_line, id) FROM stdin;
\.


--
-- Name: duplications_index_id_seq; Type: SEQUENCE SET; Schema: public; Owner: sonar
--

SELECT pg_catalog.setval('duplications_index_id_seq', 1, false);


--
-- Data for Name: events; Type: TABLE DATA; Schema: public; Owner: sonar
--

COPY events (id, name, snapshot_id, category, description, event_data, event_date, created_at, component_uuid) FROM stdin;
\.


--
-- Name: events_id_seq; Type: SEQUENCE SET; Schema: public; Owner: sonar
--

SELECT pg_catalog.setval('events_id_seq', 1, false);


--
-- Data for Name: file_sources; Type: TABLE DATA; Schema: public; Owner: sonar
--

COPY file_sources (id, project_uuid, file_uuid, line_hashes, data_hash, created_at, updated_at, src_hash, binary_data, data_type, revision) FROM stdin;
\.


--
-- Name: file_sources_id_seq; Type: SEQUENCE SET; Schema: public; Owner: sonar
--

SELECT pg_catalog.setval('file_sources_id_seq', 1, false);


--
-- Data for Name: group_roles; Type: TABLE DATA; Schema: public; Owner: sonar
--

COPY group_roles (id, group_id, resource_id, role) FROM stdin;
1	1	\N	admin
2	1	\N	profileadmin
3	1	\N	shareDashboard
4	\N	\N	scan
5	\N	\N	dryRunScan
6	\N	\N	provisioning
7	1	\N	provisioning
\.


--
-- Name: group_roles_id_seq; Type: SEQUENCE SET; Schema: public; Owner: sonar
--

SELECT pg_catalog.setval('group_roles_id_seq', 7, true);


--
-- Data for Name: groups; Type: TABLE DATA; Schema: public; Owner: sonar
--

COPY groups (id, name, description, created_at, updated_at) FROM stdin;
1	sonar-administrators	System administrators	2015-11-20 10:42:58.612	2015-11-20 10:42:58.612
2	sonar-users	Any new users created will automatically join this group	2015-11-20 10:42:58.977	2015-11-20 10:42:58.977
\.


--
-- Name: groups_id_seq; Type: SEQUENCE SET; Schema: public; Owner: sonar
--

SELECT pg_catalog.setval('groups_id_seq', 2, true);


--
-- Data for Name: groups_users; Type: TABLE DATA; Schema: public; Owner: sonar
--

COPY groups_users (user_id, group_id) FROM stdin;
1	1
1	2
\.


--
-- Data for Name: issue_changes; Type: TABLE DATA; Schema: public; Owner: sonar
--

COPY issue_changes (id, kee, issue_key, user_login, change_type, change_data, created_at, updated_at, issue_change_creation_date) FROM stdin;
\.


--
-- Name: issue_changes_id_seq; Type: SEQUENCE SET; Schema: public; Owner: sonar
--

SELECT pg_catalog.setval('issue_changes_id_seq', 1, false);


--
-- Data for Name: issue_filter_favourites; Type: TABLE DATA; Schema: public; Owner: sonar
--

COPY issue_filter_favourites (id, user_login, issue_filter_id, created_at) FROM stdin;
\.


--
-- Name: issue_filter_favourites_id_seq; Type: SEQUENCE SET; Schema: public; Owner: sonar
--

SELECT pg_catalog.setval('issue_filter_favourites_id_seq', 1, false);


--
-- Data for Name: issue_filters; Type: TABLE DATA; Schema: public; Owner: sonar
--

COPY issue_filters (id, name, user_login, shared, description, data, created_at, updated_at) FROM stdin;
1	Unresolved Issues	\N	t	\N	resolved=false	2015-11-20 10:43:15.628	2015-11-20 10:43:15.628
2	False Positive and Won't Fix Issues	\N	t	\N	resolutions=FALSE-POSITIVE,WONTFIX	2015-11-20 10:43:15.628	2015-11-20 10:43:15.628
3	My Unresolved Issues	\N	t	\N	resolved=false|assignees=__me__	2015-11-20 10:43:15.628	2015-11-20 10:43:15.628
\.


--
-- Name: issue_filters_id_seq; Type: SEQUENCE SET; Schema: public; Owner: sonar
--

SELECT pg_catalog.setval('issue_filters_id_seq', 3, true);


--
-- Data for Name: issues; Type: TABLE DATA; Schema: public; Owner: sonar
--

COPY issues (id, kee, rule_id, severity, manual_severity, message, line, effort_to_fix, status, resolution, checksum, reporter, assignee, author_login, action_plan_key, issue_attributes, technical_debt, created_at, updated_at, issue_creation_date, issue_update_date, issue_close_date, tags, component_uuid, project_uuid, locations) FROM stdin;
\.


--
-- Name: issues_id_seq; Type: SEQUENCE SET; Schema: public; Owner: sonar
--

SELECT pg_catalog.setval('issues_id_seq', 1, false);


--
-- Data for Name: loaded_templates; Type: TABLE DATA; Schema: public; Owner: sonar
--

COPY loaded_templates (id, kee, template_type) FROM stdin;
1	SonarQube way	QUALITY_GATE
2	java:Sonar way	QUALITY_PROFILE
3	Projects	FILTER
4	My favourites	FILTER
5	Unresolved Issues	ISSUE_FILTER
6	False Positive and Won't Fix Issues	ISSUE_FILTER
7	My Unresolved Issues	ISSUE_FILTER
8	Dashboard	DASHBOARD
9	Issues	DASHBOARD
10	TimeMachine	DASHBOARD
11	Home	DASHBOARD
12	default_template	PERM_TEMPLATE
13	RenameIssueWidgets	ONE_SHOT_TASK
14	DisplayLogOnDeprecatedProjects	ONE_SHOT_TASK
15	ClearRulesOverloadedDebt	ONE_SHOT_TASK
\.


--
-- Name: loaded_templates_id_seq; Type: SEQUENCE SET; Schema: public; Owner: sonar
--

SELECT pg_catalog.setval('loaded_templates_id_seq', 15, true);


--
-- Data for Name: manual_measures; Type: TABLE DATA; Schema: public; Owner: sonar
--

COPY manual_measures (id, metric_id, value, text_value, user_login, description, created_at, updated_at, component_uuid) FROM stdin;
\.


--
-- Name: manual_measures_id_seq; Type: SEQUENCE SET; Schema: public; Owner: sonar
--

SELECT pg_catalog.setval('manual_measures_id_seq', 1, false);


--
-- Data for Name: measure_filter_favourites; Type: TABLE DATA; Schema: public; Owner: sonar
--

COPY measure_filter_favourites (id, user_id, measure_filter_id, created_at) FROM stdin;
\.


--
-- Name: measure_filter_favourites_id_seq; Type: SEQUENCE SET; Schema: public; Owner: sonar
--

SELECT pg_catalog.setval('measure_filter_favourites_id_seq', 1, false);


--
-- Data for Name: measure_filters; Type: TABLE DATA; Schema: public; Owner: sonar
--

COPY measure_filters (id, name, user_id, shared, description, data, created_at, updated_at) FROM stdin;
1	Projects	\N	t	\N	display=list|qualifiers=TRK|cols=metric:alert_status,name,version,metric:ncloc,metric:sqale_index,date	2015-11-20 10:43:15.621	2015-11-20 10:43:15.621
2	My favourites	\N	t	\N	display=list|onFavourites=true|cols=metric:alert_status,name,date	2015-11-20 10:43:15.624	2015-11-20 10:43:15.624
\.


--
-- Name: measure_filters_id_seq; Type: SEQUENCE SET; Schema: public; Owner: sonar
--

SELECT pg_catalog.setval('measure_filters_id_seq', 2, true);


--
-- Data for Name: metrics; Type: TABLE DATA; Schema: public; Owner: sonar
--

COPY metrics (id, name, description, direction, domain, short_name, qualitative, val_type, user_managed, enabled, worst_value, best_value, optimized_best_value, hidden, delete_historical_data) FROM stdin;
1	lines	Lines	-1	Size	Lines	f	INT	f	t	\N	\N	f	f	f
122	burned_budget	\N	0	Management	Burned budget	f	FLOAT	t	t	\N	\N	f	f	f
123	business_value	\N	1	Management	Business value	t	FLOAT	t	t	\N	\N	f	f	f
124	team_size	\N	0	Management	Team size	f	INT	t	t	\N	\N	f	f	f
2	generated_lines	Number of generated lines	-1	Size	Generated Lines	f	INT	f	t	\N	0.00000000000000000000	t	f	f
3	ncloc	Non Commenting Lines of Code	-1	Size	Lines of code	f	INT	f	t	\N	\N	f	f	f
4	ncloc_language_distribution	Non Commenting Lines of Code Distributed By Language	-1	Size	Lines of code per language	f	DATA	f	t	\N	\N	f	f	f
5	generated_ncloc	Generated non Commenting Lines of Code	-1	Size	Generated lines of code	f	INT	f	t	\N	0.00000000000000000000	t	f	f
6	classes	Classes	-1	Size	Classes	f	INT	f	t	\N	\N	f	f	f
7	files	Number of files	-1	Size	Files	f	INT	f	t	\N	\N	f	f	f
8	directories	Directories	-1	Size	Directories	f	INT	f	t	\N	\N	f	f	f
9	packages	Packages	-1	Size	Packages	f	INT	f	t	\N	\N	f	t	f
10	functions	Functions	-1	Size	Functions	f	INT	f	t	\N	\N	f	f	f
11	accessors	Accessors	-1	Size	Accessors	f	INT	f	t	\N	\N	f	t	f
12	statements	Number of statements	-1	Size	Statements	f	INT	f	t	\N	\N	f	f	f
13	public_api	Public API	-1	Size	Public API	f	INT	f	t	\N	\N	f	f	f
14	projects	Number of projects	-1	Size	Projects	f	INT	f	t	\N	\N	f	f	f
15	comment_lines	Number of comment lines	1	Documentation	Comment lines	f	INT	f	t	\N	\N	f	f	f
16	comment_lines_density	Comments balanced by ncloc + comment lines	1	Documentation	Comments (%)	t	PERCENT	f	t	0.00000000000000000000	100.00000000000000000000	f	f	f
17	public_documented_api_density	Public documented classes and functions balanced by ncloc	1	Documentation	Public documented API (%)	t	PERCENT	f	t	0.00000000000000000000	100.00000000000000000000	t	f	f
18	public_undocumented_api	Public undocumented classes, functions and variables	-1	Documentation	Public undocumented API	t	INT	f	t	\N	0.00000000000000000000	t	f	f
19	commented_out_code_lines	Commented lines of code	-1	Documentation	Commented-out LOC	t	INT	f	t	\N	0.00000000000000000000	t	t	f
20	complexity	Cyclomatic complexity	-1	Complexity	Complexity	f	INT	f	t	\N	\N	f	f	f
21	file_complexity	Complexity average by file	-1	Complexity	Complexity /file	t	FLOAT	f	t	\N	\N	f	f	f
22	complexity_in_classes	Cyclomatic complexity in classes	-1	Complexity	Complexity in classes	f	INT	f	t	\N	\N	f	t	t
23	class_complexity	Complexity average by class	-1	Complexity	Complexity /class	t	FLOAT	f	t	\N	\N	f	f	f
24	complexity_in_functions	Cyclomatic complexity in functions	-1	Complexity	Complexity in functions	f	INT	f	t	\N	\N	f	t	t
25	function_complexity	Complexity average by function	-1	Complexity	Complexity /function	t	FLOAT	f	t	\N	\N	f	f	f
26	class_complexity_distribution	Classes distribution /complexity	0	Complexity	Classes distribution /complexity	t	DISTRIB	f	t	\N	\N	f	t	f
27	function_complexity_distribution	Functions distribution /complexity	0	Complexity	Functions distribution /complexity	t	DISTRIB	f	t	\N	\N	f	f	f
28	file_complexity_distribution	Files distribution /complexity	0	Complexity	Files distribution /complexity	t	DISTRIB	f	t	\N	\N	f	f	f
29	tests	Number of unit tests	-1	Tests	Unit tests	f	INT	f	t	\N	\N	f	f	f
30	test_execution_time	Execution duration of unit tests	-1	Tests	Unit tests duration	f	MILLISEC	f	t	\N	\N	f	f	f
31	test_errors	Number of unit test errors	-1	Tests	Unit test errors	t	INT	f	t	\N	0.00000000000000000000	t	f	f
32	skipped_tests	Number of skipped unit tests	-1	Tests	Skipped unit tests	t	INT	f	t	\N	0.00000000000000000000	t	f	f
33	test_failures	Number of unit test failures	-1	Tests	Unit test failures	t	INT	f	t	\N	0.00000000000000000000	t	f	f
34	test_success_density	Density of successful unit tests	1	Tests	Unit test success (%)	t	PERCENT	f	t	0.00000000000000000000	100.00000000000000000000	t	f	f
35	test_data	Unit tests details	-1	Tests	Unit tests details	f	DATA	f	t	\N	\N	f	f	f
36	coverage	Coverage by unit tests	1	Tests	Coverage	t	PERCENT	f	t	0.00000000000000000000	100.00000000000000000000	f	f	f
37	new_coverage	Coverage of new/changed code	1	Tests	Coverage on new code	t	PERCENT	f	t	0.00000000000000000000	100.00000000000000000000	f	f	t
38	lines_to_cover	Lines to cover	1	Tests	Lines to cover	f	INT	f	t	\N	\N	f	f	f
39	new_lines_to_cover	Lines to cover on new code	-1	Tests	Lines to cover on new code	f	INT	f	t	\N	\N	f	f	t
40	uncovered_lines	Uncovered lines	-1	Tests	Uncovered lines	f	INT	f	t	\N	0.00000000000000000000	f	f	f
41	new_uncovered_lines	Uncovered lines on new code	-1	Tests	Uncovered lines on new code	f	INT	f	t	\N	0.00000000000000000000	f	f	t
42	line_coverage	Line coverage	1	Tests	Line coverage	t	PERCENT	f	t	0.00000000000000000000	100.00000000000000000000	f	f	f
43	new_line_coverage	Line coverage of added/changed code	1	Tests	Line coverage on new code	t	PERCENT	f	t	0.00000000000000000000	100.00000000000000000000	f	f	t
44	coverage_line_hits_data	\N	0	Tests	Coverage hits by line	f	DATA	f	t	\N	\N	f	f	t
45	conditions_to_cover	Branches to cover	0	Tests	Branches to cover	f	INT	f	t	\N	\N	f	t	f
46	new_conditions_to_cover	Branches to cover on new code	0	Tests	Branches to cover on new code	f	INT	f	t	\N	\N	f	t	t
47	uncovered_conditions	Uncovered branches	-1	Tests	Uncovered branches	f	INT	f	t	\N	0.00000000000000000000	f	f	f
48	new_uncovered_conditions	Uncovered branches on new code	-1	Tests	Uncovered branches on new code	f	INT	f	t	\N	0.00000000000000000000	f	f	t
49	branch_coverage	Condition coverage	1	Tests	Condition coverage	t	PERCENT	f	t	0.00000000000000000000	100.00000000000000000000	f	f	f
50	new_branch_coverage	Condition coverage of new/changed code	1	Tests	Condition coverage on new code	t	PERCENT	f	t	0.00000000000000000000	100.00000000000000000000	f	f	t
51	conditions_by_line	\N	0	Tests	Conditions by line	f	DATA	f	t	\N	\N	f	f	t
52	covered_conditions_by_line	\N	0	Tests	Covered conditions by line	f	DATA	f	t	\N	\N	f	f	t
53	it_coverage	Coverage by integration tests	1	Tests (Integration)	IT coverage	t	PERCENT	f	t	0.00000000000000000000	100.00000000000000000000	f	f	f
54	new_it_coverage	Integration Tests Coverage of new/changed code	1	Tests (Integration)	Coverage by IT on new code	t	PERCENT	f	t	0.00000000000000000000	100.00000000000000000000	f	f	t
55	it_lines_to_cover	Lines to cover by Integration Tests	1	Tests (Integration)	IT lines to cover	f	INT	f	t	\N	\N	f	t	f
56	new_it_lines_to_cover	Lines to cover by Integration Tests on new code	-1	Tests (Integration)	Lines to cover by IT on new code	f	INT	f	t	\N	\N	f	f	t
57	it_uncovered_lines	IT uncovered lines	-1	Tests (Integration)	IT uncovered lines	f	INT	f	t	\N	\N	f	f	f
58	new_it_uncovered_lines	Uncovered lines by IT on new code	-1	Tests (Integration)	Uncovered lines by IT on new code	f	INT	f	t	\N	0.00000000000000000000	f	f	t
59	it_line_coverage	IT line coverage	1	Tests (Integration)	IT line coverage	t	PERCENT	f	t	0.00000000000000000000	100.00000000000000000000	f	f	f
60	new_it_line_coverage	Line Coverage by Integration Tests of added/changed code	1	Tests (Integration)	Line coverage by IT on new code	t	PERCENT	f	t	0.00000000000000000000	100.00000000000000000000	f	f	t
61	it_coverage_line_hits_data	Integration Tests Code coverage line hits data	0	Tests (Integration)	IT coverage hits data	f	DATA	f	t	\N	\N	f	f	t
62	it_conditions_to_cover	Integration Tests conditions to cover	1	Tests (Integration)	IT branches to cover	f	INT	f	t	\N	\N	f	t	f
63	new_it_conditions_to_cover	Branches to cover by Integration Tests on new code	0	Tests (Integration)	Branches to cover by IT on new code	f	INT	f	t	\N	\N	f	t	t
64	it_uncovered_conditions	Integration Tests uncovered conditions	-1	Tests (Integration)	IT uncovered branches	f	INT	f	t	\N	\N	f	f	f
65	new_it_uncovered_conditions	Uncovered branches by Integration Tests on new code	-1	Tests (Integration)	Uncovered branches by IT on new code	f	INT	f	t	\N	0.00000000000000000000	f	f	t
66	it_branch_coverage	IT condition coverage	1	Tests (Integration)	IT condition coverage	t	PERCENT	f	t	0.00000000000000000000	100.00000000000000000000	f	f	f
67	new_it_branch_coverage	Condition coverage by Integration Tests of new/changed code	1	Tests (Integration)	Condition coverage by IT on new code	t	PERCENT	f	t	0.00000000000000000000	100.00000000000000000000	f	f	t
68	it_conditions_by_line	\N	0	Tests (Integration)	IT conditions by line	f	DATA	f	t	\N	\N	f	f	t
69	it_covered_conditions_by_line	\N	0	Tests (Integration)	IT covered conditions by line	f	DATA	f	t	\N	\N	f	f	t
70	overall_coverage	Overall test coverage	1	Tests (Overall)	Overall coverage	t	PERCENT	f	t	0.00000000000000000000	100.00000000000000000000	f	f	f
71	new_overall_coverage	Overall coverage of new/changed code	1	Tests (Overall)	Overall coverage on new code	t	PERCENT	f	t	0.00000000000000000000	100.00000000000000000000	f	f	t
72	overall_lines_to_cover	Overall lines to cover by all tests	1	Tests (Overall)	Overall lines to cover	f	INT	f	t	\N	\N	f	t	f
73	new_overall_lines_to_cover	New lines to cover by all tests	-1	Tests (Overall)	Overall lines to cover on new code	f	INT	f	t	\N	\N	f	f	t
74	overall_uncovered_lines	Uncovered lines by all tests	-1	Tests (Overall)	Overall uncovered lines	f	INT	f	t	\N	\N	f	f	f
75	new_overall_uncovered_lines	New lines that are not covered by any tests	-1	Tests (Overall)	Overall uncovered lines on new code	f	INT	f	t	\N	0.00000000000000000000	f	f	t
76	overall_line_coverage	Line coverage by all tests	1	Tests (Overall)	Overall line coverage	t	PERCENT	f	t	0.00000000000000000000	100.00000000000000000000	f	f	f
77	new_overall_line_coverage	Line coverage of added/changed code by all tests	1	Tests (Overall)	Overall line coverage on new code	t	PERCENT	f	t	0.00000000000000000000	100.00000000000000000000	f	f	t
78	overall_coverage_line_hits_data	Coverage hits by all tests and by line	0	Tests (Overall)	Overall coverage hits by line	f	DATA	f	t	\N	\N	f	f	t
79	overall_conditions_to_cover	Branches to cover by all tests	1	Tests (Overall)	Overall branches to cover	f	INT	f	t	\N	\N	f	t	f
80	new_overall_conditions_to_cover	New branches to cover by all tests	0	Tests (Overall)	Overall branches to cover on new code	f	INT	f	t	\N	\N	f	t	t
81	overall_uncovered_conditions	Uncovered branches by all tests	-1	Tests (Overall)	Overall uncovered branches	f	INT	f	t	\N	\N	f	f	f
82	new_overall_uncovered_conditions	New branches that are not covered by any test	-1	Tests (Overall)	Overall uncovered branches on new code	f	INT	f	t	\N	0.00000000000000000000	f	f	t
83	overall_branch_coverage	Condition coverage by all tests	1	Tests (Overall)	Overall condition coverage	t	PERCENT	f	t	0.00000000000000000000	100.00000000000000000000	f	f	f
84	new_overall_branch_coverage	Condition coverage of new/changed code by all tests	1	Tests (Overall)	Overall condition coverage on new code	t	PERCENT	f	t	0.00000000000000000000	100.00000000000000000000	f	f	t
85	overall_conditions_by_line	Overall conditions by all tests and by line	0	Tests (Overall)	Overall conditions by line	f	DATA	f	t	\N	\N	f	f	t
86	overall_covered_conditions_by_line	Overall covered branches by all tests and by line	0	Tests (Overall)	Overall covered branches by line	f	DATA	f	t	\N	\N	f	f	t
87	duplicated_lines	Duplicated lines	-1	Duplication	Duplicated lines	t	INT	f	t	\N	0.00000000000000000000	t	f	f
88	duplicated_blocks	Duplicated blocks	-1	Duplication	Duplicated blocks	t	INT	f	t	\N	0.00000000000000000000	t	f	f
89	duplicated_files	Duplicated files	-1	Duplication	Duplicated files	t	INT	f	t	\N	0.00000000000000000000	t	f	f
90	duplicated_lines_density	Duplicated lines balanced by statements	-1	Duplication	Duplicated lines (%)	t	PERCENT	f	t	100.00000000000000000000	0.00000000000000000000	t	f	f
91	duplications_data	Duplications details	0	Duplication	Duplications details	f	DATA	f	t	\N	\N	f	f	t
92	violations	Issues	-1	Issues	Issues	t	INT	f	t	\N	0.00000000000000000000	t	f	f
93	blocker_violations	Blocker issues	-1	Issues	Blocker issues	t	INT	f	t	\N	0.00000000000000000000	t	f	f
94	critical_violations	Critical issues	-1	Issues	Critical issues	t	INT	f	t	\N	0.00000000000000000000	t	f	f
95	major_violations	Major issues	-1	Issues	Major issues	t	INT	f	t	\N	0.00000000000000000000	t	f	f
96	minor_violations	Minor issues	-1	Issues	Minor issues	t	INT	f	t	\N	0.00000000000000000000	t	f	f
97	info_violations	Info issues	-1	Issues	Info issues	t	INT	f	t	\N	0.00000000000000000000	t	f	f
98	new_violations	New Issues	-1	Issues	New issues	t	INT	f	t	\N	0.00000000000000000000	t	f	t
99	new_blocker_violations	New Blocker issues	-1	Issues	New Blocker issues	t	INT	f	t	\N	0.00000000000000000000	t	f	t
100	new_critical_violations	New Critical issues	-1	Issues	New Critical issues	t	INT	f	t	\N	0.00000000000000000000	t	f	t
101	new_major_violations	New Major issues	-1	Issues	New Major issues	t	INT	f	t	\N	0.00000000000000000000	t	f	t
102	new_minor_violations	New Minor issues	-1	Issues	New Minor issues	t	INT	f	t	\N	0.00000000000000000000	t	f	t
103	new_info_violations	New Info issues	-1	Issues	New Info issues	t	INT	f	t	\N	0.00000000000000000000	t	f	t
104	false_positive_issues	False positive issues	-1	Issues	False positive issues	f	INT	f	t	\N	0.00000000000000000000	t	f	f
105	open_issues	Open issues	-1	Issues	Open issues	f	INT	f	t	\N	0.00000000000000000000	t	f	f
106	reopened_issues	Reopened issues	-1	Issues	Reopened issues	t	INT	f	t	\N	0.00000000000000000000	t	f	f
107	confirmed_issues	Confirmed issues	-1	Issues	Confirmed issues	t	INT	f	t	\N	0.00000000000000000000	t	f	f
108	sqale_index	\N	-1	Technical Debt	Technical Debt	t	WORK_DUR	f	t	\N	0.00000000000000000000	t	f	f
109	new_technical_debt	Technical Debt of new code	-1	Technical Debt	Technical Debt on new code	t	WORK_DUR	f	t	\N	0.00000000000000000000	t	f	t
110	sqale_rating	\N	-1	Technical Debt	SQALE Rating	t	RATING	f	t	5.00000000000000000000	1.00000000000000000000	f	f	f
111	development_cost	\N	-1	Technical Debt	SQALE Development Cost	t	STRING	f	t	\N	0.00000000000000000000	t	t	f
112	sqale_debt_ratio	Ratio of the technical debt compared to what it would cost to develop the whole source code from scratch.	-1	Technical Debt	Technical Debt Ratio	t	PERCENT	f	t	100.00000000000000000000	0.00000000000000000000	t	f	f
113	new_sqale_debt_ratio	Technical Debt Ratio of new/changed code.	-1	Technical Debt	Technical Debt Ratio on new code	t	PERCENT	f	t	100.00000000000000000000	0.00000000000000000000	t	f	f
114	ncloc_data	\N	0	Size	ncloc_data	f	DATA	f	t	\N	\N	f	t	f
115	comment_lines_data	\N	0	Documentation	comment_lines_data	f	DATA	f	t	\N	\N	f	t	f
116	alert_status	The project status with regard to its quality gate.	1	General	Quality Gate Status	t	LEVEL	f	t	\N	\N	f	f	f
117	quality_gate_details	The project detailed status with regard to its quality gate.	0	General	Quality Gate Details	f	DATA	f	t	\N	\N	f	f	f
118	profile	Selected quality profile	0	General	Profile	f	DATA	f	t	\N	\N	f	f	f
119	profile_version	Selected quality profile version	0	General	Profile version	f	INT	f	t	\N	\N	f	t	f
120	quality_profiles	Details of quality profiles used during analysis	0	General	Profiles	f	DATA	f	t	\N	\N	f	t	f
121	last_commit_date	\N	0	SCM	Date of last commit	f	MILLISEC	f	t	\N	\N	f	t	f
\.


--
-- Name: metrics_id_seq; Type: SEQUENCE SET; Schema: public; Owner: sonar
--

SELECT pg_catalog.setval('metrics_id_seq', 124, true);


--
-- Data for Name: notifications; Type: TABLE DATA; Schema: public; Owner: sonar
--

COPY notifications (id, data) FROM stdin;
\.


--
-- Name: notifications_id_seq; Type: SEQUENCE SET; Schema: public; Owner: sonar
--

SELECT pg_catalog.setval('notifications_id_seq', 1, false);


--
-- Data for Name: perm_templates_groups; Type: TABLE DATA; Schema: public; Owner: sonar
--

COPY perm_templates_groups (id, group_id, template_id, permission_reference, created_at, updated_at) FROM stdin;
1	1	1	admin	2015-11-20 10:43:15.735	2015-11-20 10:43:15.735
2	1	1	issueadmin	2015-11-20 10:43:15.747	2015-11-20 10:43:15.747
3	\N	1	user	2015-11-20 10:43:15.748	2015-11-20 10:43:15.748
4	\N	1	codeviewer	2015-11-20 10:43:15.748	2015-11-20 10:43:15.748
\.


--
-- Name: perm_templates_groups_id_seq; Type: SEQUENCE SET; Schema: public; Owner: sonar
--

SELECT pg_catalog.setval('perm_templates_groups_id_seq', 4, true);


--
-- Data for Name: perm_templates_users; Type: TABLE DATA; Schema: public; Owner: sonar
--

COPY perm_templates_users (id, user_id, template_id, permission_reference, created_at, updated_at) FROM stdin;
\.


--
-- Name: perm_templates_users_id_seq; Type: SEQUENCE SET; Schema: public; Owner: sonar
--

SELECT pg_catalog.setval('perm_templates_users_id_seq', 1, false);


--
-- Data for Name: permission_templates; Type: TABLE DATA; Schema: public; Owner: sonar
--

COPY permission_templates (id, name, kee, description, created_at, updated_at, key_pattern) FROM stdin;
1	Default template	default_template	This permission template will be used as default when no other permission configuration is available	2015-11-20 10:43:15.718	2015-11-20 10:43:15.718	\N
\.


--
-- Name: permission_templates_id_seq; Type: SEQUENCE SET; Schema: public; Owner: sonar
--

SELECT pg_catalog.setval('permission_templates_id_seq', 1, true);


--
-- Data for Name: project_links; Type: TABLE DATA; Schema: public; Owner: sonar
--

COPY project_links (id, link_type, name, href, component_uuid) FROM stdin;
\.


--
-- Name: project_links_id_seq; Type: SEQUENCE SET; Schema: public; Owner: sonar
--

SELECT pg_catalog.setval('project_links_id_seq', 1, false);


--
-- Data for Name: project_measures; Type: TABLE DATA; Schema: public; Owner: sonar
--

COPY project_measures (id, value, metric_id, snapshot_id, rule_id, rules_category_id, text_value, tendency, measure_date, project_id, alert_status, alert_text, url, description, rule_priority, characteristic_id, person_id, variation_value_1, variation_value_2, variation_value_3, variation_value_4, variation_value_5, measure_data) FROM stdin;
\.


--
-- Name: project_measures_id_seq; Type: SEQUENCE SET; Schema: public; Owner: sonar
--

SELECT pg_catalog.setval('project_measures_id_seq', 1, false);


--
-- Data for Name: project_qprofiles; Type: TABLE DATA; Schema: public; Owner: sonar
--

COPY project_qprofiles (id, project_uuid, profile_key) FROM stdin;
\.


--
-- Name: project_qprofiles_id_seq; Type: SEQUENCE SET; Schema: public; Owner: sonar
--

SELECT pg_catalog.setval('project_qprofiles_id_seq', 1, false);


--
-- Data for Name: projects; Type: TABLE DATA; Schema: public; Owner: sonar
--

COPY projects (id, name, description, enabled, scope, qualifier, kee, root_id, language, copy_resource_id, long_name, person_id, created_at, path, deprecated_kee, uuid, project_uuid, module_uuid, module_uuid_path, authorization_updated_at) FROM stdin;
\.


--
-- Name: projects_id_seq; Type: SEQUENCE SET; Schema: public; Owner: sonar
--

SELECT pg_catalog.setval('projects_id_seq', 1, false);


--
-- Data for Name: properties; Type: TABLE DATA; Schema: public; Owner: sonar
--

COPY properties (id, prop_key, resource_id, text_value, user_id) FROM stdin;
13	sonar.qualitygate	\N	1	\N
14	sonar.permission.template.default	\N	default_template	\N
15	sonar.core.id	\N	20151120153811	\N
16	sonar.core.version	\N	5.2	\N
17	sonar.core.startTime	\N	2015-11-20T15:38:11+0000	\N
\.


--
-- Name: properties_id_seq; Type: SEQUENCE SET; Schema: public; Owner: sonar
--

SELECT pg_catalog.setval('properties_id_seq', 17, true);


--
-- Data for Name: quality_gate_conditions; Type: TABLE DATA; Schema: public; Owner: sonar
--

COPY quality_gate_conditions (id, qgate_id, metric_id, period, operator, value_error, value_warning, created_at, updated_at) FROM stdin;
1	1	99	3	GT	0	\N	2015-11-20 10:43:07.274	\N
2	1	100	3	GT	0	\N	2015-11-20 10:43:07.279	\N
3	1	113	3	GT	5	\N	2015-11-20 10:43:07.281	\N
4	1	37	3	LT	80	\N	2015-11-20 10:43:07.284	\N
\.


--
-- Name: quality_gate_conditions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: sonar
--

SELECT pg_catalog.setval('quality_gate_conditions_id_seq', 4, true);


--
-- Data for Name: quality_gates; Type: TABLE DATA; Schema: public; Owner: sonar
--

COPY quality_gates (id, name, created_at, updated_at) FROM stdin;
1	SonarQube way	2015-11-20 10:43:07.256	\N
\.


--
-- Name: quality_gates_id_seq; Type: SEQUENCE SET; Schema: public; Owner: sonar
--

SELECT pg_catalog.setval('quality_gates_id_seq', 1, true);


--
-- Data for Name: resource_index; Type: TABLE DATA; Schema: public; Owner: sonar
--

COPY resource_index (id, kee, "position", name_size, resource_id, root_project_id, qualifier) FROM stdin;
\.


--
-- Name: resource_index_id_seq; Type: SEQUENCE SET; Schema: public; Owner: sonar
--

SELECT pg_catalog.setval('resource_index_id_seq', 1, false);


--
-- Data for Name: rules; Type: TABLE DATA; Schema: public; Owner: sonar
--

COPY rules (id, name, plugin_rule_key, plugin_config_key, plugin_name, description, priority, template_id, status, language, created_at, updated_at, note_created_at, note_updated_at, note_user_login, note_data, characteristic_id, default_characteristic_id, remediation_function, default_remediation_function, remediation_coeff, default_remediation_coeff, remediation_offset, default_remediation_offset, effort_to_fix_description, tags, system_tags, is_template, description_format) FROM stdin;
1	Branches should have sufficient coverage by unit tests	InsufficientBranchCoverage	\N	common-java	An issue is created on a file as soon as the branch coverage on this file is less than the required threshold.It gives the number of branches to be covered in order to reach the required threshold.	2	\N	READY	java	2015-11-20 10:43:07.807	2015-11-20 10:43:07.813	\N	\N	\N	\N	\N	51	\N	LINEAR	\N	5min	\N	\N	number of uncovered conditions	\N	bad-practice	f	HTML
2	Lines should have sufficient coverage by unit tests	InsufficientLineCoverage	\N	common-java	An issue is created on a file as soon as the line coverage on this file is less than the required threshold. It gives the number of lines to be covered in order to reach the required threshold.	2	\N	READY	java	2015-11-20 10:43:07.817	2015-11-20 10:43:07.818	\N	\N	\N	\N	\N	51	\N	LINEAR	\N	2min	\N	\N	number of lines under the coverage threshold	\N	bad-practice	f	HTML
3	Source files should have a sufficient density of comment lines	InsufficientCommentDensity	\N	common-java	An issue is created on a file as soon as the density of comment lines on this file is less than the required threshold. The number of comment lines to be written in order to reach the required threshold is provided by each issue message.	2	\N	READY	java	2015-11-20 10:43:07.819	2015-11-20 10:43:07.819	\N	\N	\N	\N	\N	16	\N	LINEAR	\N	2min	\N	\N	number of lines required to meet minimum density	\N	convention	f	HTML
4	Source files should not have any duplicated blocks	DuplicatedBlocks	\N	common-java	An issue is created on a file as soon as there is at least one block of duplicated code on this file	2	\N	READY	java	2015-11-20 10:43:07.821	2015-11-20 10:43:07.822	\N	\N	\N	\N	\N	36	\N	LINEAR_OFFSET	\N	10min	\N	10min	number of duplicate blocks	\N	pitfall	f	HTML
5	Skipped unit tests should be either removed or fixed	SkippedUnitTests	\N	common-java	Skipped unit tests are considered as dead code. Either they should be activated again (and updated) or they should be removed.	2	\N	READY	java	2015-11-20 10:43:07.824	2015-11-20 10:43:07.825	\N	\N	\N	\N	\N	51	\N	LINEAR	\N	10min	\N	\N	number of skipped tests	\N	pitfall	f	HTML
6	Failed unit tests should be fixed	FailedUnitTests	\N	common-java	Test failures or errors generally indicate that regressions have been introduced. Those tests should be handled as soon as possible to reduce the cost to fix the corresponding regressions.	2	\N	READY	java	2015-11-20 10:43:07.825	2015-11-20 10:43:07.826	\N	\N	\N	\N	\N	51	\N	LINEAR	\N	10min	\N	\N	number of failed tests	\N	bug	f	HTML
7	Cookies should be "secure"	S2092	S2092	squid	<p>The "secure" attribute prevents cookies from being sent over plaintext connections such as HTTP, where they would be easily eavesdropped upon. Instead, cookies with the secure attribute are only sent over encrypted HTTPS connections.</p>\n<h2>Noncompliant Code Example</h2>\n\n<pre>\nCookie c = new Cookie(SECRET, secret);  // Noncompliant; cookie is not secure\nresponse.addCookie(c);\n</pre>\n<h2>Compliant Solution</h2>\n\n<pre>\nCookie c = new Cookie(SECRET, secret);\nc.setSecure(true);\nresponse.addCookie(c);\n</pre>\n<h2>See</h2>\n\n<ul>\n<li> <a href="http://cwe.mitre.org/data/definitions/614">MITRE, CWE-614</a> - Sensitive Cookie in HTTPS Session Without 'Secure' Attribute\n</li><li> <a href="https://www.owasp.org/index.php/Top_10_2013-A2-Broken_Authentication_and_Session_Management">OWASP Top Ten 2013 Category A2</a> - Broken Authentication and Session Management\n</li><li> <a href="https://www.owasp.org/index.php/Top_10_2013-A6-Sensitive_Data_Exposure">OWASP Top Ten 2013 Category A6</a> - Sensitive Data Exposure\n</li></ul>	3	\N	READY	java	2015-11-20 10:43:08.288	2015-11-20 10:43:08.29	\N	\N	\N	\N	\N	22	\N	CONSTANT_ISSUE	\N	\N	\N	5min	\N	\N	cwe,owasp-a2,owasp-a6,security	f	HTML
21	Modifiers should be declared in the correct order	ModifiersOrderCheck	ModifiersOrderCheck	squid	<p>The Java Language Specification recommends listing modifiers in the following order:</p>\n<p>1. Annotations</p>\n<p>2. public</p>\n<p>3. protected</p>\n<p>4. private</p>\n<p>5. abstract</p>\n<p>6. static</p>\n<p>7. final</p>\n<p>8. transient</p>\n<p>9. volatile</p>\n<p>10. synchronized</p>\n<p>11. native</p>\n<p>12. strictfp</p>\n<p>Not following this convention has no technical impact, but will reduce the code's readability because most developers are used to the standard order.</p>\n<h2>Noncompliant Code Example</h2>\n\n<pre>\nstatic public void main(String[] args) {   // Noncompliant\n}\n</pre>\n<h2>Compliant Solution</h2>\n\n<pre>\npublic static void main(String[] args) {   // Compliant\n}\n</pre>	1	\N	READY	java	2015-11-20 10:43:08.336	2015-11-20 10:43:08.336	\N	\N	\N	\N	\N	15	\N	CONSTANT_ISSUE	\N	\N	\N	2min	\N	\N	convention	f	HTML
31	"NOPMD" suppression comments should not be used	S1310	S1310	squid	<p>This rule allows you to track the use of the PMD suppression comment mechanism. </p>\n<h2>Noncompliant Code Example</h2>\n\n<pre>\n// NOPMD\n</pre>	1	\N	READY	java	2015-11-20 10:43:08.356	2015-11-20 10:43:08.357	\N	\N	\N	\N	\N	16	\N	CONSTANT_ISSUE	\N	\N	\N	10min	\N	\N	bad-practice	f	HTML
8	Resources should be closed	S2095	S2095	squid	<p>Java's garbage collection cannot be relied on to clean up everything. Specifically, connections, streams, files and other classes that implement the <code>Closeable</code> interface or it's super-interface, <code>AutoCloseable</code>, must be manually closed after creation. Failure to do so will result in a resource leak which could bring first the application and then perhaps the box it's on to their knees.</p>\n\n<h2>Noncompliant Code Example</h2>\n\n<pre>\nOutputStream stream = null;\ntry{\n  for (String property : propertyList) {\n    stream = new FileOutputStream("myfile.txt");  // Noncompliant\n    // ...\n  }\n}catch(Exception e){\n  // ...\n}finally{\n  stream.close();  // Multiple streams were opened. Only the last is closed.\n}\n</pre>\n\n<h2>Compliant Solution</h2>\n\n<pre>\nOutputStream stream = null;\ntry{\n  stream = new FileOutputStream("myfile.txt");\n  for (String property : propertyList) {\n    // ...\n  }\n}catch(Exception e){\n  // ...\n}finally{\n  stream.close();\n}\n</pre>\n\n<h2>Exceptions</h2>\n\n<p>Java 7 introduced the try-with-resources statement, which implicitly closes <code>Closeables</code>. All resources opened in a try-with-resources statement are ignored by this rule.</p>\n\n<pre>\ntry (BufferedReader br = new BufferedReader(new FileReader(fileName))) {\n  //...\n}\ncatch ( ... ) {\n  //...\n}\n</pre>\n\n<h2>See</h2>\n\n<ul>\n  <li><a href="http://cwe.mitre.org/data/definitions/459.html">MITRE, CWE-459</a> - Incomplete Cleanup</li>\n  <li><a href="https://www.securecoding.cert.org/confluence/x/9gFqAQ">CERT, FIO04-J</a> - Release resources when they are no longer needed</li>\n</ul>	4	\N	READY	java	2015-11-20 10:43:08.291	2015-11-20 10:43:08.291	\N	\N	\N	\N	\N	43	\N	CONSTANT_ISSUE	\N	\N	\N	5min	\N	\N	bug,cert,cwe,denial-of-service,leak,security	f	HTML
9	Classes should not be empty	S2094	S2094	squid	<p>There is no good excuse for an empty class. If it's being used simply as a common extension point, it should be replaced with an <code>interface</code>. If it was stubbed in as a placeholder for future development it should be fleshed-out. In any other case, it should be eliminated.</p>\n\n<h2>Noncompliant Code Example</h2>\n<pre>\npublic class Nothing {  // Noncompliant\n}\n</pre>\n\n<h2>Compliant Solution</h2>\n<pre>\npublic interface Nothing {\n}\n</pre>	2	\N	READY	java	2015-11-20 10:43:08.295	2015-11-20 10:43:08.306	\N	\N	\N	\N	\N	16	\N	CONSTANT_ISSUE	\N	\N	\N	5min	\N	\N	clumsy	f	HTML
10	"equals(Object obj)" should test argument type	S2097	S2097	squid	<p>Because the <code>equals</code> method takes a generic <code>Object</code> as a parameter, any type of object may be passed to it. The method should not assume it will only be used to test objects of its class type. It must instead check the parameter's type.</p>\n<h2>Noncompliant Code Example</h2>\n\n<pre>\npublic boolean equals(Object obj) {\n  MyClass mc = (MyClass)obj;  // Noncompliant\n  // ...\n}\n</pre>\n<h2>Compliant Solution</h2>\n\n<pre>\npublic boolean equals(Object obj) {\n  if (obj == null)\n    return false;\n\n  if (this.getClass() != obj.getClass())\n    return false;\n\n  MyClass mc = (MyClass)obj;\n  // ...\n}\n</pre>	4	\N	READY	java	2015-11-20 10:43:08.307	2015-11-20 10:43:08.307	\N	\N	\N	\N	\N	43	\N	CONSTANT_ISSUE	\N	\N	\N	5min	\N	\N	bug	f	HTML
11	"main" should not "throw" anything	S2096	S2096	squid	<p>There's no reason for a <code>main</code> method to <code>throw</code> anything. After all, what's going to catch it?</p>\n\n<p>Instead, the method should itself gracefully handle any exceptions that may bubble up to it, attach as much contextual information as possible, and perform whatever logging or user communication is necessary.</p>\n\n<h2>Noncompliant Code Example</h2>\n<pre>\npublic static void main(String args[]) throws Exception { // Noncompliant\n</pre>\n\n<h2>Compliant Solution</h2>\n<pre>\npublic static void main(String args[]) {\n</pre>	2	\N	READY	java	2015-11-20 10:43:08.308	2015-11-20 10:43:08.308	\N	\N	\N	\N	\N	40	\N	CONSTANT_ISSUE	\N	\N	\N	15min	\N	\N	error-handling,security	f	HTML
12	"equals(Object obj)" and "hashCode()" should be overridden in pairs	S1206	S1206	squid	<p>According to the Java Language Specification, there is a contract between <code>equals(Object)</code> and <code>hashCode()</code>:</p>\n<blockquote>\n<p>If two objects are equal according to the <code>equals(Object)</code> method, then calling the <code>hashCode</code> method on each of the two objects must produce the same integer result. </p>\n<p>It is not required that if two objects are unequal according to the <code>equals(java.lang.Object)</code> method, then calling the <code>hashCode</code> method on each of the two objects must produce distinct integer results.</p>\n<p>However, the programmer should be aware that producing distinct integer results for unequal objects may improve the performance of hashtables.</p>\n</blockquote>\n<p>In order to comply with this contract, those methods should be either both inherited, or both overridden.</p>\n<h2>Noncompliant Code Example</h2>\n\n<pre>\nclass MyClass {    // Noncompliant - should also override "hashCode()"\n\n  @Override\n  public boolean equals(Object obj) {\n    /* ... */\n  }\n\n}\n</pre>\n<h2>Compliant Solution</h2>\n\n<pre>\nclass MyClass {    // Compliant\n\n  @Override\n  public boolean equals(Object obj) {\n    /* ... */\n  }\n\n  @Override\n  public int hashCode() {\n    /* ... */\n  }\n\n}\n</pre>\n<h2>See</h2>\n\n<ul>\n<li> <a href="http://cwe.mitre.org/data/definitions/581.html">MITRE, CWE-581</a> - Object Model Violation: Just One of Equals and Hashcode Defined</li>\n<li> CERT Java Secure Coding, MET09-J - Classes that define an equals() method must also define a hashCode() method</li>\n</ul>	4	\N	READY	java	2015-11-20 10:43:08.309	2015-11-20 10:43:08.312	\N	\N	\N	\N	\N	38	\N	CONSTANT_ISSUE	\N	\N	\N	15min	\N	\N	bug,cert,cwe	f	HTML
13	Classes should not have too many methods	S1448	S1448	squid	<p>\n  A class that grows too much tends to aggregate too many responsibilities\n  and inevitably becomes harder to understand and therefore to maintain.\n  Above a specific threshold, it is strongly advised to refactor the class\n  into smaller ones which focus on well defined topics.\n</p>	2	\N	READY	java	2015-11-20 10:43:08.313	2015-11-20 10:43:08.314	\N	\N	\N	\N	\N	33	\N	CONSTANT_ISSUE	\N	\N	\N	1h	\N	\N	brain-overload	f	HTML
14	Classes should not be loaded dynamically	S2658	S2658	squid	<p>\n  Dynamically loaded classes could contain malicious code executed by a static class initializer.\n  I.E. you wouldn't even have to instantiate or explicitly invoke methods on such classes to be vulnerable to an attack.\n</p>\n\n<p>This rule raises an issue for each use of dynamic class loading.</p>\n\n<h2>Noncompliant Code Example</h2>\n<pre>\nString className = System.getProperty("messageClassName");\nClass clazz = Class.forName(className);  // Noncompliant\n</pre>\n\n<h2>See</h2>\n<ul>\n  <li><a href="http://cwe.mitre.org/data/definitions/545.html">MITRE, CWE-545</a> - Use of Dynamic Class Loading</li>\n  <li><a href="https://www.owasp.org/index.php/Top_10_2013-A1-Injection">OWASP Top 10 2013 Category A1</a> - Injection</li>\n</ul>	3	\N	READY	java	2015-11-20 10:43:08.315	2015-11-20 10:43:08.316	\N	\N	\N	\N	\N	18	\N	CONSTANT_ISSUE	\N	\N	\N	45min	\N	\N	cwe,owasp-a1,security	f	HTML
15	Source code should be indented consistently	IndentationCheck	IndentationCheck	squid	<p>Proper indentation is a simple and effective way to improve the code's readability. Consistent indentation among the developers on a team also reduces the differences that are committed to source control systems, making code reviews easier. </p>\n<p>By default this rule checks that each block of code is indented but not the size of this indent. The parameter "indentSize" allows the expected indent size to be defined. Only the first line of a badly indented section is reported.</p>\n<p>The following code illustrates this rule when the expected indent size is set to 2:</p>\n<h2>Noncompliant Code Example</h2>\n\n<pre>\nclass Foo {\n  public int a; \n   public int b;   // Noncompliant, expected to start at column 4\n\n...\n\n  public void doSomething() {\n    if(something) {\n          doSomethingElse();  // Noncompliant, expected to start at column 6\n  }   // Noncompliant, expected to start at column 4\n  }\n}\n</pre>\n<h2>Compliant Solution</h2>\n\n<pre>\nclass Foo {\n  public int a; \n  public int b; \n\n...\n\n  public void doSomething() {\n    if(something) {\n        doSomethingElse();\n    } \n  }\n}\n</pre>	1	\N	READY	java	2015-11-20 10:43:08.317	2015-11-20 10:43:08.317	\N	\N	\N	\N	\N	15	\N	CONSTANT_ISSUE	\N	\N	\N	1min	\N	\N	convention	f	HTML
16	Classes should not be coupled to too many other classes (Single Responsibility Principle)	S1200	S1200	squid	<p>\n  According to the Single Responsibility Principle, introduced by Robert C. Martin in his book "Principles of Object Oriented Design", a class should have only one responsibility:\n</p>\n\n<blockquote>\nIf a class has more than one responsibility, then the responsibilities become coupled.\nChanges to one responsibility may impair or inhibit the class' ability to meet the others.\nThis kind of coupling leads to fragile designs that break in unexpected ways when changed.\n</blockquote>\n\n<p>\n  Classes which rely on many other classes tend to aggregate too many responsibilities and should be split into several smaller ones.\n</p>\n<p>\n  Nested classes dependencies are not counted as dependencies of the outer class.\n</p>\n\n<h2>Noncompliant Code Example</h2>\n<p>With a threshold of 5:</p>\n<pre>\nclass Foo {                        // Noncompliant - Foo depends on too many classes: T1, T2, T3, T4, T5, T6 and T7\n  T1 a1;                           // Foo is coupled to T1\n  T2 a2;                           // Foo is coupled to T2\n  T3 a3;                           // Foo is coupled to T3\n\n  public T4 compute(T5 a, T6 b) {  // Foo is coupled to T4, T5 and T6\n    T7 result = a.getResult(b);    // Foo is coupled to T7\n    return result;\n  }\n\n  public static class Bar {        // Compliant - Bar depends on 2 classes: T8 and T9\n    T8 a8;\n    T9 a9;\n  }\n}\n</pre>	2	\N	READY	java	2015-11-20 10:43:08.325	2015-11-20 10:43:08.325	\N	\N	\N	\N	\N	33	\N	CONSTANT_ISSUE	\N	\N	\N	2h	\N	\N	brain-overload	f	HTML
17	Web applications should not have a "main" method	S2653	S2653	squid	<p>\n  There is no reason to have a <code>main</code> method in a web application.\n  It may have been useful for debugging during application development,\n  but such a method should never make it into production.\n  Having a <code>main</code> method in a web application opens a door to the application logic\n  that an attacker may never be able to reach (but watch out if one does!),\n  but it is a sloppy practice and indicates that other problems may be present.\n</p>\n<p>\n  This rule raises an issue when a <code>main</code> method is found in a servlet or an EJB.\n</p>\n\n<h2>Noncompliant Code Example</h2>\n<pre>\npublic class MyServlet extends HttpServlet {\n  public void doGet(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {\n    if (userIsAuthorized(req)) {\n      updatePrices(req);\n    }\n  }\n\n  public static void main(String[] args) { // Noncompliant\n    updatePrices(req);\n  }\n}\n</pre>\n\n<h2>See</h2>\n<ul>\n  <li><a href="http://cwe.mitre.org/data/definitions/489.html">MITRE, CWE-489</a> - Leftover Debug Code</li>\n</ul>	3	\N	READY	java	2015-11-20 10:43:08.327	2015-11-20 10:43:08.327	\N	\N	\N	\N	\N	22	\N	CONSTANT_ISSUE	\N	\N	\N	5min	\N	\N	cwe,jee,security	f	HTML
18	Methods named "equals" should override Object.equals(Object)	S1201	S1201	squid	<p>"equals" as a method name should be used exclusively to override <code>Object.equals(Object)</code> to prevent any confusion.</p>\n<p>It is tempting to overload the method to take a specific class instead of <code>Object</code> as parameter, to save the class comparison check. However, this will not work as expected.</p>\n<h2>Noncompliant Code Example</h2>\n\n<pre>\nclass MyClass {\n  private int foo = 1;\n\n  public boolean equals(MyClass o) {                    // Noncompliant - "equals" method which does not override Object.equals(Object)\n    return o != null &amp;&amp; o.foo == this.foo;\n  }\n\n  public static void main(String[] args) {\n    MyClass o1 = new MyClass();\n    Object o2 = new MyClass();\n    System.out.println(o1.equals(o2));                  // Will display "false" because "o2" is of type "Object" and not "MyClass"\n  }\n}\n</pre>\n<h2>Compliant Solution</h2>\n\n<pre>\nclass MyClass {\n  private int foo = 1;\n\n  @Override\n  public boolean equals(Object o) {                     // Compliant - overrides Object.equals(Object)\n    if (o == null || !(o instanceof MyClass)) {\n      return false;\n    }\n\n    MyClass other = (MyClass)o;\n    return this.foo == other.foo;\n  }\n\n  /* ... */\n}\n</pre>	3	\N	READY	java	2015-11-20 10:43:08.327	2015-11-20 10:43:08.334	\N	\N	\N	\N	\N	38	\N	CONSTANT_ISSUE	\N	\N	\N	10min	\N	\N	pitfall	f	HTML
19	"public static" fields should be constant	S1444	S1444	squid	<p>There is no good reason to declare a field "public" and "static" without also declaring it "final". Most of the time this is a kludge to share a state among several objects. But with this approach, any object can do whatever it wants with the shared state, such as setting it to <code>null</code>. </p>\n<h2>Noncompliant Code Example</h2>\n\n<pre>\npublic class Greeter {\n  public static Foo foo = new Foo();\n  ...\n}\n</pre>\n<h2>Compliant Solution</h2>\n\n<pre>\npublic class Greeter {\n  public static final Foo FOO = new Foo();\n  ...\n}\n</pre>\n<h2>See</h2>\n\n<ul>\n<li> <a href="http://cwe.mitre.org/data/definitions/500.html">MITRE, CWE-500</a> - Public Static Field Not Marked Final</li>\n<li> <a href="https://www.securecoding.cert.org/confluence/display/java/OBJ10-J.">CERT OBJ10-J</a> - Do not use public static nonfinal variables</li>\n</ul>	3	\N	READY	java	2015-11-20 10:43:08.334	2015-11-20 10:43:08.335	\N	\N	\N	\N	\N	22	\N	CONSTANT_ISSUE	\N	\N	\N	20min	\N	\N	cert,cwe,security	f	HTML
20	Strings should be compared using "equals()"	StringEqualityComparisonCheck	StringEqualityComparisonCheck	squid	<p>Strings, just like any other <code>Object</code>, should be compared using the <code>equals()</code> method.</p>\n<p>Using <code>==</code> and <code>!=</code> compares references rather than values, and usually does not work.</p>\n\n<h2>Noncompliant Code Example</h2>\n\n<pre>\nif (variable == "foo") { /* ... */ }\nif (variable != "foo") { /* ... */ }\n</pre>\n\n<h2>Compliant Solution</h2>\n\n<pre>\nif ("foo".equals(variable)) { /* ... */ }    // Compliant\nif (!"foo".equals(variable)) { /* ... */ }   // Compliant\n</pre>\n\n<h2>See</h2>\n\n<ul>\n<li> <a href="http://cwe.mitre.org/data/definitions/597.html">MITRE, CWE-597</a> - Use of Wrong Operator in String Comparison</li>\n</ul>\n\n<p>This rule is deprecated, use {rule:squid:S1698} instead.</p>	3	\N	READY	java	2015-11-20 10:43:08.335	2015-11-20 10:43:08.336	\N	\N	\N	\N	\N	42	\N	CONSTANT_ISSUE	\N	\N	\N	5min	\N	\N	cwe	f	HTML
22	Relational operators should be used in "for" loop termination conditions	S888	S888	squid	<p>Testing <code>for</code> loop termination using an equality operator (<code>==</code> and <code>!=</code>) is dangerous, because it could set up an infinite loop. Using a broader relational operator instead casts a wider net, and makes it harder (but not impossible) to accidentally write an infinite loop.</p>\n<h2>Noncompliant Code Example</h2>\n\n<pre>\nfor (int i = 1; i != 10; i += 2)  // Noncompliant. Infinite; i goes from 9 straight to 11.\n{\n  //...\n} \n</pre>\n<h2>Compliant Solution</h2>\n\n<pre>\nfor (int i = 1; i &lt;= 10; i += 2)  // Compliant\n{\n  //...\n} \n</pre>\n<h2>Exceptions</h2>\n\n<p>Equality operators are ignored if the loop counter is not modified within the body of the loop and either:</p>\n<ul>\n<li> starts below the ending value and is incremented by 1 on each iteration.</li>\n<li> starts above the ending value and is decremented by 1 on each iteration.</li>\n</ul>\n<p>Equality operators are also ignored when the test is against <code>null</code>.</p>\n<pre>\nfor (int i = 0; arr[i] != null; i++) {\n  // ...\n}\n\nfor (int i = 0; (item = arr[i]) != null; i++) {\n  // ...\n}\n</pre>\n<h2>See</h2>\n\n<ul>\n<li> MISRA C++:2008, 6-5-2</li>\n<li> <a href="http://cwe.mitre.org/data/definitions/835">MITRE, CWE-835</a> - Loop with Unreachable Exit Condition ('Infinite Loop')</li>\n<li> <a href="https://www.securecoding.cert.org/confluence/x/EwDJAQ">CERT, MSC21-C</a> - Use robust loop termination conditions</li>\n<li> <a href="https://www.securecoding.cert.org/confluence/x/GwDJAQ">CERT, MSC21-CPP</a> - Use inequality to terminate a loop whose counter changes by more than one</li>\n</ul>	3	\N	READY	java	2015-11-20 10:43:08.337	2015-11-20 10:43:08.337	\N	\N	\N	\N	\N	43	\N	CONSTANT_ISSUE	\N	\N	\N	2min	\N	\N	bug,cert,cwe,misra	f	HTML
23	Fields should not be initialized to default values	S3052	S3052	squid	<p>\n  The compiler automatically initializes class fields to their default values before setting them with any initialization values,\n  so there is no need to explicitly set a field to its default value. Further, under the logic that cleaner code is better code,\n  it's considered poor style to do so.\n</p>\n\n<h2>Noncompliant Code Example</h2>\n<pre>\npublic class MyClass {\n\n  int count = 0;  // Noncompliant\n  // ...\n\n}\n</pre>\n\n<h2>Compliant Solution</h2>\n<pre>\npublic class MyClass {\n\n  int count;\n  // ...\n\n}\n</pre>\n\n<h2>Exceptions</h2>\n<p>Do not raise issues for final fields.</p>	1	\N	READY	java	2015-11-20 10:43:08.338	2015-11-20 10:43:08.338	\N	\N	\N	\N	\N	15	\N	CONSTANT_ISSUE	\N	\N	\N	2min	\N	\N	convention	f	HTML
24	Inheritance tree of classes should not be too deep	MaximumInheritanceDepth	MaximumInheritanceDepth	squid	<p>Inheritance is certainly one of the most valuable concepts in object-oriented programming.</p>\n<p>It's a way to compartmentalize and reuse code by creating collections of attributes and behaviors called classes which can be based on previously created classes.</p>\n<p>But abusing of this concept by creating a deep inheritance tree can lead to very complex and unmaintainable source code.</p>\n<p>Most of the time a too deep inheritance tree is due to bad object oriented design which has led to systematically use 'inheritance' when 'composition' would suit better.</p>	2	\N	READY	java	2015-11-20 10:43:08.339	2015-11-20 10:43:08.339	\N	\N	\N	\N	\N	16	\N	CONSTANT_ISSUE	\N	\N	\N	4h	\N	\N	design	f	HTML
25	Octal values should not be used	S1314	S1314	squid	<p>Integer literals starting with a zero are octal rather than decimal values. While using octal values is fully supported, most developers do not have experience with them. They may not recognize octal values as such, mistaking them instead for decimal values.</p>\n<h2>Noncompliant Code Example</h2>\n\n<pre>\nint myNumber = 010;   // Noncompliant. myNumber will hold 8, not 10 - was this really expected?\n</pre>\n<h2>Compliant Solution</h2>\n\n<pre>\nint myNumber = 8;\n</pre>\n\n<h2>See</h2>\n<ul>\n<li> MISRA C:2004, 7.1 - Octal constants (other than zero) and octal escape sequences shall not be used.\n</li><li> MISRA C++:2008, 2-13-2 - Octal constants (other than zero) and octal escape sequences (other than "\\0") shall not be used\n</li><li> MISRA C:2012, 7.1 - Octal constants shall not be used\n</li><li> <a href="https://www.securecoding.cert.org/confluence/x/_QC7AQ">CERT DCL18-C</a> - Do not begin integer constants with 0 when specifying a decimal value\n</li></ul>	2	\N	READY	java	2015-11-20 10:43:08.345	2015-11-20 10:43:08.345	\N	\N	\N	\N	\N	39	\N	CONSTANT_ISSUE	\N	\N	\N	5min	\N	\N	cert,misra,pitfall	f	HTML
26	"CHECKSTYLE:OFF" suppression comments should not be used	S1315	S1315	squid	<p>This rule allows you to track the use of the Checkstyle suppression comment mechanism. </p>\n<h2>Noncompliant Code Example</h2>\n\n<pre>\n// CHECKSTYLE:OFF\n</pre>	1	\N	READY	java	2015-11-20 10:43:08.346	2015-11-20 10:43:08.346	\N	\N	\N	\N	\N	16	\N	CONSTANT_ISSUE	\N	\N	\N	5min	\N	\N	bad-practice	f	HTML
27	"StringBuilder" and "StringBuffer" should not be instantiated with a character	S1317	S1317	squid	<p>Instantiating a <code>StringBuilder</code> or a <code>StringBuffer</code> with a character is misleading because most Java developers would expect the character to be the initial value of the <code>StringBuffer</code>. </p>\n<p>What actually happens is that the int representation of the character is used to determine the initial size of the <code>StringBuffer</code>.</p>\n<h2>Noncompliant Code Example</h2>\n\n<pre>\nStringBuffer foo = new StringBuffer('x');   //equivalent to StringBuffer foo = new StringBuffer(120);\n</pre>\n<h2>Compliant Solution</h2>\n\n<pre>\nStringBuffer foo = new StringBuffer("x");\n</pre>	2	\N	READY	java	2015-11-20 10:43:08.347	2015-11-20 10:43:08.354	\N	\N	\N	\N	\N	42	\N	CONSTANT_ISSUE	\N	\N	\N	5min	\N	\N	pitfall	f	HTML
28	"object == null" should be used instead of "object.equals(null)"	S1318	S1318	squid	<p>Inexperienced Java developers might expect the <code>Object.equals(Object obj)</code> method to correctly handle the case where the left hand side is null, but that is not the case.</p>\n\n<h2>Noncompliant Code Example</h2>\n<pre>\nif (variable.equals(null)) { /* ... */ }   // Noncompliant - "variable" is really null, a NullPointerException is thrown\n</pre>\n\n<h2>Compliant Solution</h2>\n<pre>\nif (variable == null) { /* ... */ }        // Compliant\n</pre>\n\n<h2>Deprecated</h2>\n<p>\nThis rule is deprecated, use {rule:squid:S2159} instead.\n</p>	3	\N	DEPRECATED	java	2015-11-20 10:43:08.354	2015-11-20 10:43:08.355	\N	\N	\N	\N	\N	42	\N	CONSTANT_ISSUE	\N	\N	\N	5min	\N	\N	\N	f	HTML
29	Declarations should use Java collection interfaces such as "List" rather than specific implementation classes such as "LinkedList"	S1319	S1319	squid	<p>The purpose of the Java Collections API is to provide a well defined hierarchy of interfaces in order to hide implementation details.</p>\n<p>Implementing classes must be used to instantiate new collections, but the result of an instantiation should ideally be stored in a variable whose type is a Java Collection interface.</p>\n<p>This rule raises an issue when an implementation class:</p>\n<ul>\n<li> is returned from a <code>public</code> method.</li>\n<li> is accepted as an argument to a <code>public</code> method.</li>\n<li> is exposed as a <code>public</code> member.</li>\n</ul>\n<h2>Noncompliant Code Example</h2>\n\n<pre>\npublic class Employees {\n  private HashSet&lt;Employee&gt; employees = new HashSet&lt;Employee&gt;();  // Noncompliant - "employees" should have type "Set" rather than "HashSet"\n\n  public HashSet&lt;Employee&gt; getEmployees() {                       // Noncompliant\n    return employees;\n  }\n}\n</pre>\n<h2>Compliant Solution</h2>\n\n<pre>\npublic class Employees {\n  private Set&lt;Employee&gt; employees = new HashSet&lt;Employee&gt;();      // Compliant\n\n  public Set&lt;Employee&gt; getEmployees() {                           // Compliant\n    return employees;\n  }\n}\n</pre>	2	\N	READY	java	2015-11-20 10:43:08.355	2015-11-20 10:43:08.355	\N	\N	\N	\N	\N	33	\N	CONSTANT_ISSUE	\N	\N	\N	10min	\N	\N	bad-practice	f	HTML
30	HTTP referers should not be relied on	S2089	S2089	squid	<p>The fields in an HTTP request are putty in the hands of an attacker, and you cannot rely on them to tell you the truth about anything. While it may be safe to store such values after they have been neutralized, decisions should never be made based on their contents.</p>\n<p>This rule flags uses of the referer header field.</p>\n<h2>Noncompliant Code Example</h2>\n\n<pre>\npublic class MyServlet extends HttpServlet {\n  protected void doPost(HttpServletRequest request, HttpServletResponse response) \n        throws ServletException, IOException {\n    String referer = request.getHeader("referer");  // Noncompliant\n    if(isTrustedReferer(referer)){\n      //..\n    }\n    //...\n  }\n}\n</pre>\n<h2>See</h2>\n\n<ul>\n<li> <a href="http://cwe.mitre.org/data/definitions/807">MITRE, CWE-807</a> - Reliance on Untrusted Inputs in a Security Decision\n</li><li> <a href="http://cwe.mitre.org/data/definitions/293">MITRE, CWE-293</a> - Using Referer Field for Authentication\n</li><li> <a href="http://www.sans.org/top25-software-errors/">SANS Top 25</a> - Porous Defenses\n</li><li> <a href="https://www.owasp.org/index.php/Top_10_2013-A2-Broken_Authentication_and_Session_Management">OWASP Top Ten 2013 Category A2</a> - Broken Authentication and Session Management\n</li></ul>	3	\N	READY	java	2015-11-20 10:43:08.356	2015-11-20 10:43:08.356	\N	\N	\N	\N	\N	20	\N	CONSTANT_ISSUE	\N	\N	\N	20min	\N	\N	cwe,owasp-a2,sans-top25-porous,security	f	HTML
32	Loggers should be "private static final" and should share a naming convention	S1312	S1312	squid	<p>Loggers should:</p>\n<ul>\n  <li><code>private</code>: never be accessible outside of its parent class. If another class needs to log something, it should instantiate its own logger.</li>\n  <li><code>static</code>: not be dependent on an instance of a class (an object). When logging something, contextual information can of course be provided in the messages but the logger should be created at class level to prevent creating a logger along with each object.</li>\n  <li><code>final</code>: be created once and only once per class.</li>\n</ul>\n\n<h2>Noncompliant Code Example</h2>\n<p>With a default regular expression of <code>LOG(?:GER)?</code>:</p>\n<pre>\npublic Logger logger = LoggerFactory.getLogger(Foo.class);  // Noncompliant\n</pre>\n\n<h2>Compliant Solution</h2>\n<pre>\nprivate static final Logger LOGGER = LoggerFactory.getLogger(Foo.class);\n</pre>\n\n<h2>Exceptions</h2>\n<p>Variables of type <code>org.apache.maven.plugin.logging.Log</code> are ignored.</p>	1	\N	READY	java	2015-11-20 10:43:08.358	2015-11-20 10:43:08.358	\N	\N	\N	\N	\N	16	\N	CONSTANT_ISSUE	\N	\N	\N	5min	\N	\N	convention	f	HTML
33	IP addresses should not be hardcoded	S1313	S1313	squid	<p>Hardcoding an IP address into source code is a bad idea for several reasons:</p>\n<ul>\n<li> a recompile is required if the address changes</li>\n<li> it forces the same address to be used in every environment (dev, sys, qa, prod)</li>\n<li> it places the responsibility of setting the value to use in production on the shoulders of the developer</li>\n<li> it allows attackers to decompile the code and thereby discover a potentially sensitive address</li>\n</ul>\n<h2>Noncompliant Code Example</h2>\n\n<pre>\nString ip = "127.0.0.1";\nSocket socket = new Socket(ip, 6667);\n</pre>\n<h2>Compliant Solution</h2>\n\n<pre>\nString ip = System.getProperty("myapplication.ip");\nSocket socket = new Socket(ip, 6667);\n</pre>\n<h2>See</h2>\n\n<ul>\n<li> <a href="https://www.securecoding.cert.org/confluence/x/qQCHAQ">CERT, MSC03-J</a> - Never hard code sensitive information</li>\n</ul>	2	\N	READY	java	2015-11-20 10:43:08.362	2015-11-20 10:43:08.363	\N	\N	\N	\N	\N	33	\N	CONSTANT_ISSUE	\N	\N	\N	30min	\N	\N	cert,security	f	HTML
34	"Calendars" and "DateFormats" should not be static	S2885	S2885	squid	<p>Neither <code>Calendar</code> not <code>DateFormat</code> were written to be thread-safe. Using them in a multi-threaded manner is highly likely to cause data problems or exceptions at runtime.</p>\n<h2>Noncompliant Code Example</h2>\n\n<pre>\npublic class MyClass {\n  static private SimpleDateFormat format = new SimpleDateFormat("HH-mm-ss");  // Noncompliant\n  static private Calendar calendar = Calendar.getInstance();  // Noncompliant\n</pre>\n<h2>Compliant Solution</h2>\n\n<pre>\npublic class MyClass {\n  private SimpleDateFormat format = new SimpleDateFormat("HH-mm-ss");\n  private Calendar calendar = Calendar.getInstance();\n</pre>	3	\N	READY	java	2015-11-20 10:43:08.363	2015-11-20 10:43:08.364	\N	\N	\N	\N	\N	46	\N	CONSTANT_ISSUE	\N	\N	\N	15min	\N	\N	bug,multi-threading	f	HTML
35	Architectural constraints should be followed	ArchitecturalConstraint	ArchitecturalConstraint	squid	<p>A source code comply to an architectural model when it fully\n\tadheres to a set of architectural constraints. A constraint allows to\n\tdeny references between classes by pattern.</p>\n<p>You can for instance use this rule to :</p>\n<ul>\n\t<li>forbid access to **.web.** from **.dao.** classes</li>\n\t<li>forbid access to java.util.Vector, java.util.Hashtable and\n\t\tjava.util.Enumeration from any classes</li>\n\t<li>forbid access to java.sql.** from **.ui.** and **.web.**\n\t\tclasses</li>\n</ul>	2	\N	READY	java	2015-11-20 10:43:08.364	2015-11-20 10:43:08.364	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	t	HTML
36	The Object.finalize() method should not be overriden	ObjectFinalizeOverridenCheck	ObjectFinalizeOverridenCheck	squid	<p>This Object.finalize() method is called by the garbage collector on an object when garbage collection determines that there are no more references to the object. But there is absolutely no warranty that this method will be called AS SOON AS the last references to the object are removed. It can be few microseconds to few minutes later. So when some system resources need to be disposed by an object, it's better to not rely on this asynchronous mechanism to dispose them.</p>\n<h2>Noncompliant Code Example</h2>\n\n<pre>\npublic class MyClass {\n  ...\n  protected void finalize() {\n    releaseSomeResources();    // Noncompliant\n  }\n  ...\n}\n</pre>\n<h2>See</h2>\n\n<ul>\n<li> CERT Java Secure Coding, MET12-J - Do not use finalizers</li>\n</ul>	3	\N	READY	java	2015-11-20 10:43:08.365	2015-11-20 10:43:08.365	\N	\N	\N	\N	\N	38	\N	CONSTANT_ISSUE	\N	\N	\N	20min	\N	\N	cert,unpredictable	f	HTML
37	"for" loop stop conditions should be invariant	ForLoopCounterChangedCheck	ForLoopCounterChangedCheck	squid	<p><code>for</code> loop stop conditions must be invariant (i.e. true at both the beginning and ending of every loop iteration). Ideally, this means that the stop condition is set to a local variable just before the loop begins. </p>\n<p>Stop conditions that are not invariant are difficult to understand and maintain, and will likely lead to the introduction of errors in the future.</p>\n<p>This rule tracks three types of non-invariant stop conditions:</p>\n\n<ul>\n<li> When the loop counters are updated in the body of the <code>for</code> loop</li>\n<li> When the stop condition depend upon a method call</li>\n<li> When the stop condition depends on an object property, since such properties could change during the execution of the loop.</li>\n</ul>\n\n<h2>Noncompliant Code Example</h2>\n\n<pre> \nfor (int i = 0; i &lt; 10; i++) {\n  ...\n  i = i - 1; // Noncompliant; counter updated in the body of the loop\n  ...\n} \n\nfor (int i = 0; i &lt; getMaximumNumber(); i++) {...} // Noncompliant; stop condition depends on the result of a method call\n</pre>\n<h2>Compliant Solution</h2>\n\n<pre> \nint stopCondition = getMaximumNumber();\nfor (int i = 0; i &lt; stopCondition; i++) {...} \n</pre>\n\n<h2>See</h2>\n\n<ul>\n<li> MISRA C:2004, 13.6 - Numeric variables being used within a <em>for</em> loop for iteration counting shall not be modified in the body of the loop.</li>\n<li> MISRA C++:2008, 6-5-3 - The <em>loop-counter</em> shall not be modified within <em>condition</em> or <em>statement</em>.</li>\n</ul>	2	\N	READY	java	2015-11-20 10:43:08.365	2015-11-20 10:43:08.366	\N	\N	\N	\N	\N	43	\N	CONSTANT_ISSUE	\N	\N	\N	10min	\N	\N	misra,pitfall	f	HTML
38	Method parameters, caught exceptions and foreach variables should not be reassigned	S1226	S1226	squid	<p>While it is technically correct to assign to parameters from within method bodies, it is better to use temporary variables to store intermediate results.</p>\n<p>This rule will typically detect cases where a constructor parameter is assigned to itself instead of a field of the same name, i.e. when <code>this</code> was forgotten.</p>\n<p>Allowing parameters to be assigned to also reduces the code readability as developers will not be able to know whether the original parameter or some temporary variable is being accessed without going through the whole method.</p>\n<p>Moreover, some developers might also expect assignments of method parameters to be visible from callers, which is not the case and can confuse them.</p>\n<p>All parameters should be treated as <code>final</code>.</p>\n<h2>Noncompliant Code Example</h2>\n\n<pre>\nclass MyClass {\n  public String name;\n\n  public MyClass(String name) {\n    name = name;                    // Noncompliant - useless identity assignment\n  }\n\n  public int add(int a, int b) {\n    a = a + b;                      // Noncompliant\n\n    /* additional logic */\n\n    return a;                       // Seems like the parameter is returned as is, what is the point?\n  }\n\n  public static void main(String[] args) {\n    MyClass foo = new MyClass();\n    int a = 40;\n    int b = 2;\n    foo.add(a, b);                  // Variable "a" will still hold 40 after this call\n  }\n}\n</pre>\n<h2>Compliant Solution</h2>\n\n<pre>\nclass MyClass {\n  public String name;\n\n  public MyClass(String name) {\n    this.name = name;               // Compliant\n  }\n\n  public int add(int a, int b) {\n    return a + b;                   // Compliant\n  }\n\n  public static void main(String[] args) {\n    MyClass foo = new MyClass();\n    int a = 40;\n    int b = 2;\n    foo.add(a, b);\n  }\n}\n</pre>\n<h2>See</h2>\n\n<ul>\n<li> MISRA C:2012, 17.8 - A function parameter should not be modified</li>\n</ul>	2	\N	READY	java	2015-11-20 10:43:08.366	2015-11-20 10:43:08.366	\N	\N	\N	\N	\N	38	\N	CONSTANT_ISSUE	\N	\N	\N	5min	\N	\N	misra,pitfall	f	HTML
39	Silly bit operations should not be performed	S2437	S2437	squid	<p>Certain bit operations are just silly and should not be performed because their results are predictable.</p>\n\n<p>Specifically, using <code>&amp; -1</code> with any value will always result in the original value, as will <code>anyValue ^ 0</code> and <code>anyValue | 0</code>.</p>	2	\N	READY	java	2015-11-20 10:43:08.369	2015-11-20 10:43:08.372	\N	\N	\N	\N	\N	43	\N	CONSTANT_ISSUE	\N	\N	\N	5min	\N	\N	bug	f	HTML
40	Packages should have a javadoc file 'package-info.java'	S1228	S1228	squid	<p>Each package in a Java project should include a <code>package-info.java</code> file. The purpose of this file is to document the Java package using javadoc and declare package annotations.</p>\n\n<h2>Compliant Solution</h2>\n<pre>\n/**\n* This package has non null parameters and is documented.\n**/\n@ParametersAreNonnullByDefault\npackage org.foo.bar;\n</pre>	1	\N	READY	java	2015-11-20 10:43:08.376	2015-11-20 10:43:08.377	\N	\N	\N	\N	\N	16	\N	CONSTANT_ISSUE	\N	\N	\N	20min	\N	\N	convention	f	HTML
41	"Threads" should not be used where "Runnables" are expected	S2438	S2438	squid	<p>While it is technically correct to use a <code>Thread</code> where a <code>Runnable</code> is called for, the semantics of the two objects are different, and mixing them is a bad practice that will likely lead to headaches in the future.</p>\n\n<p>The crux of the issue is that <code>Thread</code> is a larger concept than <code>Runnable</code>. A <code>Runnable</code> is an object whose running should be managed. A <code>Thread</code> expects to manage the running of itself or other <code>Runnables</code>.</p>\n\n<h2>Noncompliant Code Example</h2>\n\n<pre>\n    public static void main(String[] args) {\n        Thread r =new Thread() {\n            int p;\n            @Override\n            public void run() {\n                while(true)\n                    System.out.println("a");\n            }\n        };\n        new Thread(r).start();  // Noncompliant\n</pre>\n\n<h2>Compliant Solution</h2>\n\n<pre>\n    public static void main(String[] args) {\n        Runnable r =new Runnable() {\n            int p;\n            @Override\n            public void run() {\n                while(true)\n                    System.out.println("a");\n            }\n        };\n        new Thread(r).start();\n</pre>	3	\N	READY	java	2015-11-20 10:43:08.377	2015-11-20 10:43:08.378	\N	\N	\N	\N	\N	42	\N	CONSTANT_ISSUE	\N	\N	\N	15min	\N	\N	multi-threading,pitfall	f	HTML
42	The default unnamed package should not be used	S1220	S1220	squid	<p>According to the Java Language Specification:</p>\n\n<blockquote>\nUnnamed packages are provided by the Java platform principally for convenience when developing small or temporary applications or when just beginning development.\n</blockquote>\n\n<p>To enforce this best practice, classes located in default package can no longer be accessed from named ones since Java 1.4.</p>\n\n<h2>Noncompliant Code Example</h2>\n<pre>\npublic class MyClass { /* ... */ }\n</pre>\n\n<h2>Compliant Solution</h2>\n<pre>\npackage org.example;\n\npublic class MyClass{ /* ... */ }\n</pre>	1	\N	READY	java	2015-11-20 10:43:08.378	2015-11-20 10:43:08.378	\N	\N	\N	\N	\N	33	\N	CONSTANT_ISSUE	\N	\N	\N	10min	\N	\N	convention	f	HTML
43	Methods should not be named "hashcode" or "equal"	S1221	S1221	squid	<p>Naming a method <code>hashcode()</code> or <code>equal</code> is either:</p>\n<ul>\n<li> A bug in the form of a typo. Overriding <code>Object.hashCode()</code> (note the camelCasing) or <code>Object.equals</code> (note the 's' on the end) was meant, and the application does not behave as expected.</li>\n<li> Done on purpose. The name however will confuse every other developer, who may not notice the naming difference, or who will think it is a bug.</li>\n</ul>\n<p>In both cases, the method should be renamed.</p>\n<h2>Noncompliant Code Example</h2>\n\n<pre>\npublic int hashcode() { /* ... */ }  // Noncompliant\n\npublic boolean equal(Object obj) { /* ... */ }  // Noncompliant\n</pre>\n<h2>Compliant Solution</h2>\n\n<pre>\n@Override\npublic int hashCode() { /* ... */ }\n\npublic boolean equals(Object obj) { /* ... */ } \n</pre>	3	\N	READY	java	2015-11-20 10:43:08.379	2015-11-20 10:43:08.379	\N	\N	\N	\N	\N	38	\N	CONSTANT_ISSUE	\N	\N	\N	10min	\N	\N	bug,pitfall	f	HTML
44	"readObject" should not be "synchronized"	S2675	S2675	squid	<p>A <code>readObject</code> method is written when a <code>Serializable</code> object needs special handling to be rehydrated from file.\nIt should be the case that the object being created by <code>readObject</code> is only visible to the thread that invoked the method,\nand the <code>synchronized</code> keyword is not needed, and using <code>synchronized</code> anyway is just confusing.\nIf this is not the case, the method should be refactored to make it the case.</p>\n\n<h2>Noncompliant Code Example</h2>\n\n<pre>\nprivate synchronized void readObject(java.io.ObjectInputStream in)\n     throws IOException, ClassNotFoundException { // Noncompliant\n  //...\n}\n</pre>\n\n<h2>Compliant Solution</h2>\n\n<pre>\nprivate void readObject(java.io.ObjectInputStream in)\n     throws IOException, ClassNotFoundException { // Compliant\n  //...\n}\n</pre>	2	\N	READY	java	2015-11-20 10:43:08.381	2015-11-20 10:43:08.382	\N	\N	\N	\N	\N	16	\N	CONSTANT_ISSUE	\N	\N	\N	2min	\N	\N	confusing	f	HTML
45	Non-constructor methods should not have the same name as the enclosing class	S1223	S1223	squid	<p>Having a class and some of its methods sharing the same name is misleading, and leaves others to wonder whether it was done that way on purpose, or was the methods supposed to be a constructor.</p>\n<h2>Noncompliant Code Example</h2>\n\n<pre>\npublic class Foo {\n   public Foo() {...}\n   public void Foo(String label) {...}  // Noncompliant\n}\n</pre>\n<h2>Compliant Solution</h2>\n\n<pre>\npublic class Foo {\n   public Foo() {...}\n   public void foo(String label) {...}  // Compliant\n}\n</pre>	2	\N	READY	java	2015-11-20 10:43:08.391	2015-11-20 10:43:08.392	\N	\N	\N	\N	\N	38	\N	CONSTANT_ISSUE	\N	\N	\N	5min	\N	\N	pitfall	f	HTML
46	The value returned from a stream read should be checked	S2674	S2674	squid	<p>You cannot assume that any given stream reading call will fill the <code>byte[]</code> passed in to the method. Instead, you must check the value returned by the read method to see how many bytes were read. Fail to do so, and you introduce bug that is both harmful and difficult to reproduce.</p>\n\n<p>Similarly, you cannot assume that <code>InputStream.skip</code> will actually skip the requested number of bytes, but must check the value returned from the method.</p>\n\n<p>This rule raises an issue when an <code>InputStream.read</code> method that accepts a <code>byte[]</code> is called, but the return value is not checked, and when the return value of <code>InputStream.skip</code> is not checked. The rule also applies to <code>InputStream</code> child classes.</p>\n\n<h2>Noncompliant Code Example</h2>\n\n<pre>\npublic void doSomething(String fileName) {\n  try {\n    InputStream is = new InputStream(file);\n    byte [] buffer = new byte[1000];\n    is.read(buffer);  // Noncompliant\n    // ...\n  } catch (IOException e) { ... }\n}\n</pre>\n\n<h2>Compliant Solution</h2>\n\n<pre>\npublic void doSomething(String fileName) {\n  try {\n    InputStream is = new InputStream(file);\n    byte [] buffer = new byte[1000];\n    int count = 0;\n    while (count = is.read(buffer) &gt; 0) {\n      // ...\n    }\n  } catch (IOException e) { ... }\n}\n</pre>	3	\N	READY	java	2015-11-20 10:43:08.392	2015-11-20 10:43:08.393	\N	\N	\N	\N	\N	39	\N	CONSTANT_ISSUE	\N	\N	\N	15min	\N	\N	bug	f	HTML
47	"read" and "readLine" return values should be used	S2677	S2677	squid	<p>When a method is called that returns data read from some data source, that data should be stored rather than thrown away. Any other course of action is surely a bug.</p>\n\n<p>This rule raises an issue when the return value of any of the following is ignored or merely null-checked: <code>Reader.read()</code>, <code>BufferedReader.readLine()</code>, and these methods in any child classes.</p>\n\n<h2>Noncompliant Code Example</h2>\n\n<pre>\npublic void doSomethingWithFile(String fileName) {\n  BufferedReader buffReader = null;\n  try {\n    buffReader = new BufferedReader(new FileReader(fileName));\n    while (buffReader.readLine() != null) { // Noncompliant\n      // ...\n    }\n  } catch (IOException e) {\n    // ...\n  }\n}\n</pre>\n\n<h2>Compliant Solution</h2>\n\n<pre>\npublic void doSomethingWithFile(String fileName) {\n  BufferedReader buffReader = null;\n  try {\n    buffReader = new BufferedReader(new FileReader(fileName));\n    String line = null;\n    while ((line = buffReader.readLine()) != null) {\n      // ...\n    }\n  } catch (IOException e) {\n    // ...\n  }\n}\n</pre>	4	\N	READY	java	2015-11-20 10:43:08.393	2015-11-20 10:43:08.399	\N	\N	\N	\N	\N	39	\N	CONSTANT_ISSUE	\N	\N	\N	5min	\N	\N	bug	f	HTML
48	Neither "Math.abs" nor negation should be used on numbers that could be "MIN_VALUE"	S2676	S2676	squid	<p>It is possible for a call to <code>hashCode</code> to return <code>Integer.MIN_VALUE</code>. Take the absolute value of such a hashcode and you'll still have a negative number. Since your code is likely to assume that it's a positive value instead, your results will be unreliable.</p>\n<p>Similarly, <code>Integer.MIN_VALUE</code> could be returned from <code>Random.nextInt()</code> or any object's <code>compareTo</code> method, and <code>Long.MIN_VALUE</code> could be returned from <code>Random.nextLong()</code>. Calling <code>Math.abs</code> on values returned from these methods is similarly ill-advised.</p>\n<h2>Noncompliant Code Example</h2>\n\n<pre>\npublic void doSomething(String str) {\n  if (Math.abs(str.hashCode()) &gt; 0) { // Noncompliant\n    // ...\n  }\n}\n</pre>\n<h2>Compliant Solution</h2>\n\n<pre>\npublic void doSomething(String str) {\n  if (str.hashCode() != 0) {\n    // ...\n  }\n}\n</pre>	3	\N	READY	java	2015-11-20 10:43:08.4	2015-11-20 10:43:08.4	\N	\N	\N	\N	\N	43	\N	CONSTANT_ISSUE	\N	\N	\N	5min	\N	\N	bug	f	HTML
49	Comments should not be located at the end of lines of code	TrailingCommentCheck	TrailingCommentCheck	squid	<p>This rule verifies that single-line comments are not located at the end of a line of code. The main idea behind this rule is that in order to be really readable, trailing comments would have to be properly written and formatted (correct alignment, no interference with the visual structure of the code, not too long to be visible) but most often, automatic code formatters would not handle this correctly: the code would end up less readable. Comments are far better placed on the previous empty line of code, where they will always be visible and properly formatted.</p>\n<h2>Noncompliant Code Example</h2>\n\n<pre>\nint a1 = b + c; // This is a trailing comment that can be very very long\n</pre>\n<h2>Compliant Solution</h2>\n\n<pre>\n// This very long comment is better placed before the line of code\nint a2 = b + c;\n</pre>\n<h2>Exceptions</h2>\n\n<p>By default, the property "legalTrailingCommentPattern" allows to ignore comments containing only one word :</p>\n<pre>\ndoSomething(); //FIXME\n</pre>	0	\N	READY	java	2015-11-20 10:43:08.4	2015-11-20 10:43:08.4	\N	\N	\N	\N	\N	15	\N	CONSTANT_ISSUE	\N	\N	\N	1min	\N	\N	convention	f	HTML
50	Execution of the Garbage Collector should be triggered only by the JVM	S1215	S1215	squid	<p>\nCalling <code>System.gc()</code> or <code>Runtime.getRuntime().gc()</code> is a bad idea for a simple reason:\nthere is no way to know exactly what will be done under the hood by the JVM because the behavior will depend on its vendor, version and options:\n</p>\n\n<ul>\n  <li>Will the whole application be frozen during the call?</li>\n  <li>Is the -XX:DisableExplicitGC option activated?</li>\n  <li>Will the JVM simply ignore the call?</li>\n  <li>...</li>\n</ul>\n\n<p>An application relying on those unpredictable methods is also unpredictable and therefore broken.</p>\n\n<p>The task of running the garbage collector should be left exclusively to the JVM.</p>	3	\N	READY	java	2015-11-20 10:43:08.402	2015-11-20 10:43:08.402	\N	\N	\N	\N	\N	42	\N	CONSTANT_ISSUE	\N	\N	\N	30min	\N	\N	unpredictable	f	HTML
51	Constructors should only call non-overridable methods	S1699	S1699	squid	<p>Calling an overridable method from a constructor could result in failures or strange behaviors when instantiating a subclass which overrides the method.</p>\n<p>For example:</p>\n<ul>\n<li> The subclass class constructor starts by contract by calling the parent class constructor.</li>\n<li> The parent class constructor calls the method, which has been overridden in the child class.</li>\n<li> If the behavior of the child class method depends on fields that are initialized in the child class constructor, unexpected behavior (like a <code>NullPointerException</code>) can result, because the fields aren't initialized yet.</li>\n</ul>	2	\N	READY	java	2015-11-20 10:43:08.402	2015-11-20 10:43:08.402	\N	\N	\N	\N	\N	38	\N	CONSTANT_ISSUE	\N	\N	\N	10min	\N	\N	bug	f	HTML
52	Thread.run() and Runnable.run() should not be called directly	S1217	S1217	squid	<p>The purpose of the <code>Thread.run()</code> and <code>Runnable.run()</code> methods is to execute code in a separate, dedicated thread. Calling those methods directly doesn't make sense because it causes their code to be executed in the current thread. </p>\n<p>To get the expected behavior, call the <code>Thread.start()</code> method instead.</p>\n<h2>Noncompliant Code Example</h2>\n\n<pre>\nThread myThread = new Thread(runnable);\nmyThread.run(); // Noncompliant\n</pre>\n<h2>Compliant Solution</h2>\n\n<pre>\nThread myThread = new Thread(runnable);\nmyThread.start(); // Compliant\n</pre>\n<h2>See</h2>\n\n<ul>\n<li> <a href="http://cwe.mitre.org/data/definitions/572.html">MITRE, CWE-572</a> - Call to Thread run() instead of start()</li>\n<li> <a href="https://www.securecoding.cert.org/confluence/x/KQAiAg">CERT THI00-J</a> - Do not invoke Thread.run()</li>\n</ul>	3	\N	READY	java	2015-11-20 10:43:08.404	2015-11-20 10:43:08.404	\N	\N	\N	\N	\N	42	\N	CONSTANT_ISSUE	\N	\N	\N	20min	\N	\N	cert,cwe,multi-threading	f	HTML
53	"switch" statements should not contain non-case labels	S1219	S1219	squid	<p>Even if it is legal, mixing case and non-case labels in the body of a switch statement is very confusing and can even be the result of a typing error.</p>\n<h2>Noncompliant Code Example</h2>\n<pre>\nswitch (day) {\n  case MONDAY:\n  case TUESDAY:\n  WEDNESDAY:   // Noncompliant; syntactically correct, but behavior is not what's expected\n    doSomething();\n    break;\n  ...\n}\n\nswitch (day) {\n  case MONDAY:\n    break;\n  case TUESDAY:\n    foo:for(int i = 0 ; i &lt; X ; i++) {  // Noncompliant; the code is correct and behaves as expected but is barely readable \n         /* ... */\n        break foo;  // this break statement doesn't relate to the nesting case TUESDAY\n         /* ... */\n    }\n    break;\n    /* ... */\n}\n</pre>\n<h2>Compliant Solution</h2>\n\n<pre>\nswitch (day) {\n  case MONDAY:\n  case TUESDAY:\n  case WEDNESDAY:\n    doSomething();\n    break;\n  ...\n}\n\nswitch (day) {\n  case MONDAY:\n    break;\n  case TUESDAY:\n    compute(args); // put the content of the labelled "for" statement in a dedicated method\n    break;\n\n    /* ... */\n}\n</pre>\n<h2>See</h2>\n\n<ul>\n<li> MISRA C:2004, 15.0 - The MISRA C <em>switch</em> syntax shall be used.\n</li><li> MISRA C++:2008, 6-4-3 - A switch statement shall be a well-formed switch statement.\n</li><li> MISRA C:2012, 16.1 - All switch statements shall be well-formed\n</li></ul>	3	\N	READY	java	2015-11-20 10:43:08.405	2015-11-20 10:43:08.405	\N	\N	\N	\N	\N	15	\N	CONSTANT_ISSUE	\N	\N	\N	10min	\N	\N	misra,pitfall	f	HTML
54	Copyright and license headers should be defined	S1451	S1451	squid	<p>Each source file should start with a header stating file ownership and the license which must be used to distribute the application. </p>\n<p>This rule must be fed with the header text that is expected at the beginning of every file.</p>\n<h2>Compliant Solution</h2>\n\n<pre>\n/*\n * SonarQube, open source software quality management tool.\n * Copyright (C) 2008-2013 SonarSource\n * mailto:contact AT sonarsource DOT com\n *\n * SonarQube is free software; you can redistribute it and/or\n * modify it under the terms of the GNU Lesser General Public\n * License as published by the Free Software Foundation; either\n * version 3 of the License, or (at your option) any later version.\n *\n * SonarQube is distributed in the hope that it will be useful,\n * but WITHOUT ANY WARRANTY; without even the implied warranty of\n * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU\n * Lesser General Public License for more details.\n *\n * You should have received a copy of the GNU Lesser General Public License\n * along with this program; if not, write to the Free Software Foundation,\n * Inc., 51 Franklin Street, Fifth Floor, Boston, MA  02110-1301, USA.\n */\n</pre>	4	\N	READY	java	2015-11-20 10:43:08.405	2015-11-20 10:43:08.405	\N	\N	\N	\N	\N	22	\N	CONSTANT_ISSUE	\N	\N	\N	5min	\N	\N	\N	f	HTML
55	"equals(Object obj)" should be overridden along with the "compareTo(T obj)" method	S1210	S1210	squid	<p>\nAccording to the Java <code>Comparable.compareTo(T o)</code> documentation:\n</p>\n\n<blockquote>\nIt is strongly recommended, but not strictly required that <code>(x.compareTo(y)==0) == (x.equals(y))</code>.\nGenerally speaking, any class that implements the Comparable interface and violates this condition should clearly indicate this fact.\nThe recommended language is "Note: this class has a natural ordering that is inconsistent with equals."\n</blockquote>\n\n<p>\nIf this rule is violated, weird and unpredictable failures can occur.\nFor example, in Java 5 the <code>PriorityQueue.remove()</code> method relied on <code>compareTo()</code>, but since Java 6 it relies on <code>equals()</code>.\n</p>\n\n<h2>Noncompliant Code Example</h2>\n\n<pre>\npublic class Foo implements Comparable&lt;Foo&gt; {\n  @Override\n  public int compareTo(Foo foo) { /* ... */ }      // Noncompliant as the equals(Object obj) method is not overridden\n}\n</pre>\n\n<h2>Compliant Solution</h2>\n\n<pre>\npublic class Foo implements Comparable&lt;Foo&gt; {\n  @Override\n  public int compareTo(Foo foo) { /* ... */ }      // Compliant\n\n  @Override\n  public boolean equals(Object obj) { /* ... */ }\n}\n</pre>	3	\N	READY	java	2015-11-20 10:43:08.415	2015-11-20 10:43:08.416	\N	\N	\N	\N	\N	38	\N	CONSTANT_ISSUE	\N	\N	\N	15min	\N	\N	bug	f	HTML
56	Generic wildcard types should not be used in return parameters	S1452	S1452	squid	<p>Using a wildcard as a return type implicitly means that the return parameter should be considered as read-only but without any way to enforce this contract. </p>\n<p>Let's take the example of method returning a "List&lt;? extends Animal&gt;". Is it possible on this list to add a Dog, a Cat, ... we simply don't know. The consumer of a method should not have to deal with such disruptive questions. </p>\n<h2>Noncompliant Code Example</h2>\n\n<pre>\nList&lt;? extends Animal&gt; getAnimals(){...}\n</pre>	2	\N	READY	java	2015-11-20 10:43:08.416	2015-11-20 10:43:08.416	\N	\N	\N	\N	\N	38	\N	CONSTANT_ISSUE	\N	\N	\N	20min	\N	\N	pitfall	f	HTML
57	An abstract class should have both abstract and concrete methods	S1694	S1694	squid	<p>The purpose of an abstract class is to provide some heritable behaviors while also defining methods which must be implemented by sub-classes.</p>\n<p>A class with no abstract methods that was made abstract purely to prevent instantiation should be converted to a concrete class (i.e. remove the <code>abstract</code> keyword) with a private constructor.</p>\n<p>A class with only abstract methods and no inheritable behavior should be converted to an interface.</p>\n\n<h2>Noncompliant Code Example</h2>\n<pre>\npublic abstract class Animal {  // Noncompliant; should be an interface\n  abstract void move();\n  abstract void feed();\n}\n\npublic abstract class Color {  // Noncompliant; should be concrete with a private constructor\n  private int red = 0;\n  private int green = 0;\n  private int blue = 0;\n\n  public int getRed() {\n    return red;\n  }\n}\n</pre>\n\n<h2>Compliant Solution</h2>\n<pre>\npublic interface Animal {\n  void move();\n  void feed();\n}\n\npublic class Color {\n  private int red = 0;\n  private int green = 0;\n  private int blue = 0;\n\n  private Color () {}\n\n  public int getRed() {\n    return red;\n  }\n}\n\npublic abstract class Lamp {\n\n  private boolean switchLamp=false;\n\n  public abstract void glow();\n\n  public void flipSwitch() {\n    switchLamp = !switchLamp;\n    if (switchLamp) {\n      glow();\n    }\n  }\n}\n</pre>	1	\N	READY	java	2015-11-20 10:43:08.417	2015-11-20 10:43:08.417	\N	\N	\N	\N	\N	16	\N	CONSTANT_ISSUE	\N	\N	\N	5min	\N	\N	convention	f	HTML
58	"NullPointerException" should not be explicitly thrown	S1695	S1695	squid	<p>A <code>NullPointerException</code> should indicate that a <code>null</code> value was unexpectedly encountered. Good programming practice dictates that code is structured to avoid NPE's. </p>\n<p>Explicitly throwing <code>NullPointerException</code> forces a method's callers to explicitly catch it, rather than coding to avoid it. Further, it makes it difficult to distinguish between the unexpectedly-encountered <code>null</code> value and the condition which causes the method to purposely throw an NPE.</p>\n<p>If an NPE is being thrown to indicate that a parameter to the method should not have been null, use the <code>@NotNull</code> annotation instead.</p>\n\n<h2>Noncompliant Code Example</h2>\n<pre>\npublic void doSomething (String aString) throws NullPointerException {\n     throw new NullPointerException();\n}\n</pre>\n\n<h2>Compliant Solution</h2>\n<pre>\npublic void doSomething (@NotNull String aString) {\n}\n</pre>	2	\N	READY	java	2015-11-20 10:43:08.418	2015-11-20 10:43:08.418	\N	\N	\N	\N	\N	42	\N	CONSTANT_ISSUE	\N	\N	\N	10min	\N	\N	pitfall	f	HTML
59	Public methods should not contain selector arguments	S2301	S2301	squid	<p>A selector argument is a <code>boolean</code> argument that's used to determine which of two paths to take through a method. Specifying such a parameter may seem innocuous, particularly if it's well named.</p>\n\n<p>Unfortunately, the maintainers of the code calling the method won't see the parameter name, only its value. They'll be forced either to guess at the meaning or to take extra time to look the method up.</p>\n\n<p>Instead, separate methods should be written.</p>\n\n<p>This rule finds methods with a <code>boolean</code> that's used to determine which path to take through the method.</p>\n\n<h2>Noncompliant Code Example</h2>\n<pre>\npublic void tempt(String name, boolean ofAge) {\n  if (ofAge) {\n    offerLiquor(name);\n  } else {\n    offerCandy(name);\n  }\n}\n\n// ...\npublic void corrupt() {\n  tempt("Joe", false); // does this mean not to temp Joe?\n}\n</pre>\n\n<h2>Compliant Solution</h2>\n<pre>\npublic void temptAdult(String name) {\n  offerLiquor(name);\n}\n\npublic void temptChild(String name) {\n    offerCandy(name);\n}\n\n// ...\npublic void corrupt() {\n  offerCandy("Joe");\n}\n</pre>	2	\N	READY	java	2015-11-20 10:43:08.418	2015-11-20 10:43:08.419	\N	\N	\N	\N	\N	2	\N	CONSTANT_ISSUE	\N	\N	\N	15min	\N	\N	design	f	HTML
60	"NullPointerException" should not be caught	S1696	S1696	squid	<p><code>NullPointerException</code> should be avoided, not caught. Any situation in which <code>NullPointerException</code> is explicitly caught can easily be converted to a <code>null</code> test, and any behavior being carried out in the catch block can easily be moved to the "is null" branch of the conditional.</p>\n\n<h2>Noncompliant Code Example</h2>\n<pre>\npublic int lengthPlus(String str) {\n  int len = 2;\n  try {\n    len += str.length();\n  }\n  catch (NullPointerException e) {\n    log.info("argument was null");\n  }\n  return len;\n}\n</pre>\n\n<h2>Compliant Solution</h2>\n<pre>\npublic int lengthPlus(String str) {\n  int len = 2;\n\n  if (str != null) {\n    len += str.length();\n  }\n  else {\n    log.info("argument was null");\n  }\n  return len;\n}\n</pre>\n\n<h2>See</h2>\n<ul>\n  <li><a href="http://cwe.mitre.org/data/definitions/395.html">MITRE, CWE-395</a> - Use of NullPointerException Catch to Detect NULL Pointer Dereference</li>\n  <li> <a href="https://www.securecoding.cert.org/confluence/x/BIB3AQ">CERT, ERR08-J</a> - Do not catch NullPointerException or any of its ancestors</li>\n</ul>	2	\N	READY	java	2015-11-20 10:43:08.419	2015-11-20 10:43:08.42	\N	\N	\N	\N	\N	31	\N	CONSTANT_ISSUE	\N	\N	\N	5min	\N	\N	cert,cwe,error-handling,security	f	HTML
61	The members of an interface declaration or class should appear in a pre-defined order	S1213	S1213	squid	<p>According to the Java Code Conventions as defined by Oracle, the members of a class or interface declaration should appear in the following order in the source files:</p>\n<ul>\n<li> Class and instance variables</li>\n<li> Constructors</li>\n<li> Methods</li>\n</ul>\n<h2>Noncompliant Code Example</h2>\n\n<pre>\npublic class Foo{ \n   private int field = 0;\n   public boolean isTrue() {...}     \n   public Foo() {...}                         // Noncompliant, constructor defined after methods\n   public static final int OPEN = 4;  //Noncompliant, variable defined after constructors and methods\n}\n</pre>\n<h2>Compliant Solution</h2>\n\n<pre>\npublic class Foo{ \n   public static final int OPEN = 4;\n   private int field = 0;\n   public Foo() {...}\n   public boolean isTrue() {...}\n}\n</pre>	1	\N	READY	java	2015-11-20 10:43:08.42	2015-11-20 10:43:08.422	\N	\N	\N	\N	\N	15	\N	CONSTANT_ISSUE	\N	\N	\N	5min	\N	\N	convention	f	HTML
62	Short-circuit logic should be used to prevent null pointer dereferences in conditionals	S1697	S1697	squid	<p>\n  When either the equality operator in a null test or the logical operator that follows it is reversed,\n  the code has the appearance of safely null-testing the object before dereferencing it.\n  Unfortunately the effect is just the opposite - the object is null-tested and then dereferenced\n  <em>only</em> if it is null, leading to a guaranteed null pointer dereference.\n</p>\n\n<h2>Noncompliant Code Example</h2>\n<pre>\nif (str == null &amp;&amp; str.length() == 0) {\n  System.out.println("String is empty");\n}\n\nif (str != null || str.length() &gt; 0) {\n  System.out.println("String is not empty");\n}\n</pre>\n\n<h2>Compliant Solution</h2>\n<pre>\nif (str == null || str.length() == 0) {\n  System.out.println("String is empty");\n}\n\nif (str != null &amp;&amp; str.length() &gt; 0) {\n  System.out.println("String is not empty");\n}\n</pre>	4	\N	READY	java	2015-11-20 10:43:08.422	2015-11-20 10:43:08.422	\N	\N	\N	\N	\N	43	\N	CONSTANT_ISSUE	\N	\N	\N	2min	\N	\N	bug	f	HTML
63	Constants should not be defined in interfaces	S1214	S1214	squid	<p>According to Joshua Bloch, author of "Effective Java":</p>\n\n<blockquote>\n<p>\nThe constant interface pattern is a poor use of interfaces.\n</p>\n\n<p>\nThat a class uses some constants internally is an implementation detail.\nImplementing a constant interface causes this implementation detail to leak into the class's exported API.\nIt is of no consequence to the users of a class that the class implements a constant interface.\nIn fact, it may even confuse them.\nWorse, it represents a commitment:\nif in a future release the class is modified so that it no longer needs to use the constants,\nit still must implement the interface to ensure binary compatibility.\nIf a nonfinal class implements a constant interface,\nall of its subclasses will have their namespaces polluted by the constants in the interface.\n</p>\n</blockquote>\n\n<h2>Noncompliant Code Example</h2>\n\n<pre>\ninterface Status {                      // Noncompliant\n   int OPEN = 1;\n   int CLOSED = 2;\n}\n</pre>\n\n<h2>Compliant Solution</h2>\n\n<pre>\npublic enum Status {                    // Compliant\n  OPEN,\n  CLOSED;\n}\n</pre>\n\n<p>or</p>\n\n<pre>\npublic final class Status {             // Compliant\n   public static final int OPEN = 1;\n   public static final int CLOSED = 2;\n}\n</pre>	1	\N	READY	java	2015-11-20 10:43:08.426	2015-11-20 10:43:08.427	\N	\N	\N	\N	\N	33	\N	CONSTANT_ISSUE	\N	\N	\N	10min	\N	\N	bad-practice	f	HTML
73	Close curly brace and the next "else", "catch" and "finally" keywords should be on two different lines	RightCurlyBraceDifferentLineAsNextBlockCheck	RightCurlyBraceDifferentLineAsNextBlockCheck	squid	<p>Shared coding conventions make it possible for a team to collaborate efficiently.</p>\n<p>This rule makes it mandatory to place a closing curly brace and the next <code>else</code>, <code>catch</code> or <code>finally</code> keyword on two different lines.</p>\n<p>The following code snippet illustrates this rule:</p>\n<pre>\npublic void myMethod() {\n  if(something) {\n    executeTask();\n  } else if (somethingElse) {          // Noncompliant\n    doSomethingElse();\n  }\n  else {                               // Compliant\n     generateError();\n  }\n\n  try {\n    generateOrder();\n  } catch (Exception e) {              // Noncompliant\n    log(e);\n  }\n  finally {                            // Compliant\n    closeConnection();\n  }\n}\n</pre>	1	\N	READY	java	2015-11-20 10:43:08.442	2015-11-20 10:43:08.443	\N	\N	\N	\N	\N	15	\N	CONSTANT_ISSUE	\N	\N	\N	1min	\N	\N	convention	f	HTML
64	Objects should be compared with "equals()"	S1698	S1698	squid	<p>Using the equality (<code>==</code>) and inequality (<code>!=</code>) operators to compare two objects does not check to see if they have the same values. Rather it checks to see if both object references point to exactly the same object in memory. The vast majority of the time, this is not what you want to do. Use the .equals() method to compare the values of two objects or to compare a string object to a string literal.</p>\n\n<h2>Noncompliant Code Example</h2>\n<pre>\nString str1 = "blue";\nString str2 = "blue";\nString str3 = str1;\n\nif (str1 == str2)\n{\n  System.out.println("they're both 'blue'"); // this doesn't print because the objects are different\n}\n\nif (str1 == "blue")\n{\n  System.out.println("they're both 'blue'"); // this doesn't print because the objects are different\n}\n\nif (str1 == str3)\n{\n  System.out.println("they're the same object"); // this prints\n}\n</pre>\n\n<h2>Compliant Solution</h2>\n<pre>\nString str1 = "blue";\nString str2 = "blue";\nString str3 = str1;\n\nif (str1.equals(str2))\n{\n  System.out.println("they're both 'blue'"); // this prints\n}\n\nif (str1.equals("blue"))\n{\n  System.out.println("they're both 'blue'"); // this prints\n}\n\nif (str1 == str3)\n{\n  System.out.println("they're the same object"); // this still prints, but it's probably not what you meant to do\n}\n</pre>\n\n<h2>See</h2>\n<ul>\n  <li><a href="http://cwe.mitre.org/data/definitions/595.html">MITRE, CWE-595</a> - Comparison of Object References Instead of Object Contents</li>\n  <li><a href="http://cwe.mitre.org/data/definitions/597">MITRE, CWE-597</a> - Use of Wrong Operator in String Comparison</li>\n  <li><a href="https://www.securecoding.cert.org/confluence/x/wwD1AQ">CERT, EXP03-J</a> - Do not use the equality operators when comparing values of boxed primitives</li>\n</ul>	2	\N	READY	java	2015-11-20 10:43:08.427	2015-11-20 10:43:08.428	\N	\N	\N	\N	\N	43	\N	CONSTANT_ISSUE	\N	\N	\N	2min	\N	\N	cert,cwe	f	HTML
65	Nested "enum"s should not be declared static	S2786	S2786	squid	<p>According to <a href="http://docs.oracle.com/javase/specs/jls/se7/html/jls-8.html#jls-8.9">the docs</a>:</p>\n<blockquote>Nested enum types are implicitly <code>static</code>.</blockquote>\n<p>So there's no need to declare them <code>static</code> explicitly.</p>\n\n<h2>Noncompliant Code Example</h2>\n<pre>\npublic class Flower {\n  static enum Color { // Noncompliant; static is redundant here\n    RED, YELLOW, BLUE, ORANGE\n  }\n\n  // ...\n}\n</pre>\n\n<h2>Compliant Solution</h2>\n<pre>\npublic class Flower {\n  enum Color { // Compliant\n    RED, YELLOW, BLUE, ORANGE\n  }\n\n  // ...\n}\n</pre>	2	\N	READY	java	2015-11-20 10:43:08.428	2015-11-20 10:43:08.429	\N	\N	\N	\N	\N	15	\N	CONSTANT_ISSUE	\N	\N	\N	2min	\N	\N	clumsy	f	HTML
66	Files should not be empty	EmptyFile	EmptyFile	squid	<p>Files with no lines of code clutter a project and should be removed. </p>\n<h2>Noncompliant Code Example</h2>\n\n<pre>\n//package org.foo;\n//\n//public class Bar {}\n</pre>	2	\N	READY	java	2015-11-20 10:43:08.43	2015-11-20 10:43:08.43	\N	\N	\N	\N	\N	16	\N	CONSTANT_ISSUE	\N	\N	\N	5min	\N	\N	unused	f	HTML
67	Throws declarations should not be superfluous	RedundantThrowsDeclarationCheck	RedundantThrowsDeclarationCheck	squid	<p>\nAn exception in a <code>throws</code> declaration in Java is superfluous if it is:\n</p>\n\n<ul>\n  <li>listed multiple times</li>\n  <li>a subclass of another listed exception</li>\n  <li>a <code>RuntimeException</code>, or one of its descendants</li>\n  <li>completely unnecessary because the declared exception type cannot actually be thrown</li>\n</ul>\n\n<h2>Noncompliant Code Example</h2>\n\n<pre>\nvoid foo() throws MyException, MyException {}  // Noncompliant; should be listed once\nvoid bar() throws Throwable, Exception {}  // Noncompliant; Exception is a subclass of Throwable\nvoid baz() throws RuntimeException {}  // Noncompliant; RuntimeException can always be thrown\n</pre>\n\n<h2>Compliant Solution</h2>\n\n<pre>\nvoid foo() throws MyException {}\nvoid bar() throws Throwable {}\nvoid baz() {}\n</pre>	1	\N	READY	java	2015-11-20 10:43:08.43	2015-11-20 10:43:08.431	\N	\N	\N	\N	\N	16	\N	CONSTANT_ISSUE	\N	\N	\N	5min	\N	\N	error-handling,security	f	HTML
68	super.finalize() should be called at the end of Object.finalize() implementations	ObjectFinalizeOverridenCallsSuperFinalizeCheck	ObjectFinalizeOverridenCallsSuperFinalizeCheck	squid	<p>Overriding the <code>Object.finalize()</code> method must be done with caution to dispose some system resources.</p>\n<p>Calling the <code>super.finalize()</code> at the end of this method implementation is highly recommended in case parent implementations must also dispose some system resources.</p>\n<h2>Noncompliant Code Example</h2>\n\n<pre>\nprotected void finalize() {   // Noncompliant; no call to super.finalize();\n  releaseSomeResources();\n}\n\nprotected void finalize() {\n  super.finalize();  // Noncompliant; this call should come last\n  releaseSomeResources();\n}\n</pre>\n<h2>Compliant Solution</h2>\n\n<pre>\nprotected void finalize() {\n  releaseSomeResources();\n  super.finalize();    \n}\n</pre>\n<h2>See</h2>\n\n<ul>\n<li> <a href="http://cwe.mitre.org/data/definitions/568.html">MITRE, CWE-568</a> - finalize() Method Without super.finalize()</li>\n<li> <a href="https://www.securecoding.cert.org/confluence/x/H4cbAQ">CERT, MET12-J</a> - Do not use finalizers</li>\n</ul>	4	\N	READY	java	2015-11-20 10:43:08.433	2015-11-20 10:43:08.433	\N	\N	\N	\N	\N	42	\N	CONSTANT_ISSUE	\N	\N	\N	5min	\N	\N	bug,cert,cwe	f	HTML
69	An open curly brace should be located at the beginning of a line	LeftCurlyBraceStartLineCheck	LeftCurlyBraceStartLineCheck	squid	<p>Shared coding conventions make it possible to collaborate efficiently. This rule make it mandatory to place the open curly brace at the beginning of a line.</p>\n\n<h2>Noncompliant Code Example</h2>\n<pre>\npublic void myMethod {  // Noncompliant\n  if(something) {  // Noncompliant\n    executeTask();\n  } else {  // Noncompliant\n    doSomethingElse();\n  }\n}\n</pre>\n\n<h2>Compliant Solution</h2>\n<pre>\npublic void myMethod\n{\n  if(something)\n  {\n    executeTask();\n  } else\n  {\n    doSomethingElse();\n  }\n}\n</pre>	1	\N	READY	java	2015-11-20 10:43:08.434	2015-11-20 10:43:08.434	\N	\N	\N	\N	\N	15	\N	CONSTANT_ISSUE	\N	\N	\N	1min	\N	\N	convention	f	HTML
70	"File.createTempFile" should not be used to create a directory	S2976	S2976	squid	<p>\n  Using <code>File.createTempFile</code> as the first step in creating a temporary directory causes a race condition\n  and is inherently unreliable and insecure. Instead, <code>Files.createTempDirectory</code> (Java 7+) or\n  a library function such as Guava's similarly-named <code>Files.createTempDir</code> should be used.\n</p>\n<p>This rule raises an issue when the following steps are taken in immediate sequence:</p>\n<ul>\n  <li>call to <code>File.createTempFile</code></li>\n  <li>delete resulting file</li>\n  <li>call <code>mkdir</code> on the File object</li>\n</ul>\n\n<h2>Noncompliant Code Example</h2>\n<pre>\nFile tempDir;\ntempDir = File.createTempFile("", ".");\ntempDir.delete();\ntempDir.mkdir();  // Noncompliant\n</pre>\n\n<h2>Compliant Solution</h2>\n<pre>\nPath tempPath = Files.createTempDirectory("");\nFile tempDir = tempPath.toFile();\n</pre>\n\n<h2>See</h2>\n<ul>\n  <li><a href="https://www.owasp.org/index.php/Top_10_2013-A9-Using_Components_with_Known_Vulnerabilities">OWAPS Top Ten 2013 Category A9 - Using Components with Known Vulnerabilities</a></li>\n</ul>	3	\N	READY	java	2015-11-20 10:43:08.437	2015-11-20 10:43:08.437	\N	\N	\N	\N	\N	18	\N	CONSTANT_ISSUE	\N	\N	\N	5min	\N	\N	owasp-a9,security	f	HTML
80	"Serializable" inner classes of "Serializable" classes should be static	S2059	S2059	squid	<p>Serializing a non-<code>static</code> inner class will result in an attempt at serializing the outer class as well. If the outer class is actually serializable, then the serialization will succeed but possibly write out far more data than was intended.</p>\n\n<p>Making the inner class <code>static</code> (i.e. "nested") avoids this problem, therefore inner classes should be <code>static</code> if possible. However, you should be aware that there are semantic differences between an inner class and a nested one: \n<ul>\n  <li>an inner class can only be instantiated within the context of an instance of the outer class.</li>\n  <li>a nested (<code>static</code>) class can be instantiated independently of the outer class.</li>\n</ul>\n</p>\n\n<h2>Noncompliant Code Example</h2>\n<pre>\npublic class Raspberry implements Serializable {\n  // ...\n\n  public class Drupelet implements Serializable {  // Noncompliant; output may be too large\n    // ...\n  }\n}\n</pre>\n\n<h2>Compliant Solution</h2>\n<pre>\npublic class Raspberry implements Serializable {\n  // ...\n\n  public static class Drupelet implements Serializable {\n    // ...\n  }\n}\n</pre>	2	\N	READY	java	2015-11-20 10:43:08.461	2015-11-20 10:43:08.466	\N	\N	\N	\N	\N	29	\N	CONSTANT_ISSUE	\N	\N	\N	15min	\N	\N	pitfall,serialization	f	HTML
71	"clone" should not be overridden	S2975	S2975	squid	<p>\n  Many consider <code>clone</code> and <code>Cloneable</code> broken in Java,\n  largely because the rules for overriding <code>clone</code> are tricky and difficult to get right, according to Joshua Bloch:\n</p>\n<blockquote>\n  Object's clone method is very tricky. It's based on field copies, and it's "extra-linguistic."\n  It creates an object without calling a constructor.\n  There are no guarantees that it preserves the invariants established by the constructors.\n  There have been lots of bugs over the years, both in and outside Sun,\n  stemming from the fact that if you just call super.clone repeatedly up the chain until you have cloned an object,\n  you have a shallow copy of the object.  The clone generally shares state with the object being cloned.\n  If that state is mutable, you don't have two independent objects.\n  If you modify one, the other changes as well. And all of a sudden, you get random behavior.\n</blockquote>\n<p>\n  A copy constructor or copy factory should be used instead.\n</p>\n<p>\n  This rule raises an issue when <code>clone</code> is overridden,\n  whether or not <code>Cloneable</code> is implemented.\n</p>\n\n<h2>Noncompliant Code Example</h2>\n<pre>\npublic class MyClass {\n  // ...\n\n  public Object clone() { // Noncompliant\n    //...\n  }\n}\n</pre>\n\n<h2>Compliant Solution</h2>\n<pre>\npublic class MyClass {\n  // ...\n\n  MyClass (MyClass source) {\n    //...\n  }\n}\n</pre>\n\n<h2>See</h2>\n<ul>\n  <li><a href="http://www.artima.com/intv/bloch13.html">Copy Constructor versus Cloning</a></li>\n</ul>\n\n<h3>See Also</h3>\n<ul>\n  <li>S2157 - "Cloneables" should implement "clone"</li>\n  <li>S1182 - Classes that override "clone" should be "Cloneable" and call "super.clone()"</li>\n</ul>	2	\N	READY	java	2015-11-20 10:43:08.438	2015-11-20 10:43:08.438	\N	\N	\N	\N	\N	38	\N	CONSTANT_ISSUE	\N	\N	\N	30min	\N	\N	suspicious	f	HTML
72	Class variable fields should not have public accessibility	ClassVariableVisibilityCheck	ClassVariableVisibilityCheck	squid	<p>Public class variable fields do not respect the encapsulation principle and has three main disadvantages:</p>\n<ul>\n<li> Additional behavior such as validation cannot be added.</li>\n<li> The internal representation is exposed, and cannot be changed afterwards.</li>\n<li> Member values are subject to change from anywhere in the code and may not meet the programmer's assumptions.</li>\n</ul>\n<p>By using private attributes and accessor methods (set and get), unauthorized modifications are prevented.</p>\n<h2>Noncompliant Code Example</h2>\n\n<pre>\npublic class MyClass {\n\n  public static final int SOME_CONSTANT = 0;     // Compliant - constants are not checked\n\n  public String firstName;                       // Noncompliant\n\n}\n</pre>\n<h2>Compliant Solution</h2>\n\n<pre>\npublic class MyClass {\n\n  public static final int SOME_CONSTANT = 0;     // Compliant - constants are not checked\n\n  private String firstName;                      // Compliant\n\n  public String getFirstName() {\n    return firstName;\n  }\n\n  public void setFirstName(String firstName) {\n    this.firstName = firstName;\n  }\n\n}\n</pre>\n<h2>See</h2>\n\n<ul>\n<li> <a href="http://cwe.mitre.org/data/definitions/493.html">MITRE, CWE-493</a> - Critical Public Variable Without Final Modifier</li>\n</ul>	2	\N	READY	java	2015-11-20 10:43:08.438	2015-11-20 10:43:08.439	\N	\N	\N	\N	\N	33	\N	CONSTANT_ISSUE	\N	\N	\N	10min	\N	\N	cwe	f	HTML
74	The non-serializable super class of a "Serializable" class should have a no-argument constructor	S2055	S2055	squid	<p>When a <code>Serializable</code> object has a non-serializable ancestor in its inheritance chain, object deserialization (re-instantiating the object from file) starts at the first non-serializable class, and proceeds down the chain, adding the properties of each subsequent child class, until the final object has been instantiated.</p>\n\n<p>In order to create the non-serializable ancestor, its no-argument constructor is called. Therefore the non-serializable ancestor of a <code>Serializable</code> class must have a no-arg constructor. Otherwise the class is <code>Serializable</code> but not deserializable.</p>\n\n<h2>Noncompliant Code Example</h2>\n<pre>\npublic class Fruit {\n  private Season ripe;\n\n  public Fruit (Season ripe) {...}\n  public void setRipe(Season ripe) {...}\n  public Season getRipe() {...}\n}\n\npublic class Raspberry extends Fruit \n        implements Serializable {  // Noncompliant; nonserializable ancestor doesn't have no-arg constructor\n  private static final long serialVersionUID = 1;\n\n  private String variety;\n\n  public Raspberry(Season ripe, String variety) { ...}\n  public void setVariety(String variety) {...}\n  public String getVarity() {...}\n}\n</pre>\n\n<h2>Compliant Solution</h2>\n<pre>\npublic class Fruit {\n  private Season ripe;\n\n  public Fruit () {...};  // Compliant; no-arg constructor added to ancestor\n  public Fruit (Season ripe) {...}\n  public void setRipe(Season ripe) {...}\n  public Season getRipe() {...}\n}\n\npublic class Raspberry extends Fruit \n        implements Serializable {\n  private static final long serialVersionUID = 1;\n\n  private String variety;\n\n  public Raspberry(Season ripe, String variety) {...}\n  public void setVariety(String variety) {...}\n  public String getVarity() {...}\n}\n</pre>	3	\N	READY	java	2015-11-20 10:43:08.443	2015-11-20 10:43:08.444	\N	\N	\N	\N	\N	39	\N	CONSTANT_ISSUE	\N	\N	\N	30min	\N	\N	bug,serialization	f	HTML
75	Class names should not shadow interfaces or superclasses	S2176	S2176	squid	While it's perfectly legal to give a class the same simple name as a class in another package that it extends or interface it implements, it's confusing and could cause problems in the future. \n\n<h2>Noncompliant Code Example</h2>\n<pre>\npackage my.mypackage;\n\npublic class Foo implements a.b.Foo { // Noncompliant\n</pre>\n\n<h2>Compliant Solution</h2>\n<pre>\npackage my.mypackage;\n\npublic class FooJr implements a.b.Foo {\n</pre>	2	\N	READY	java	2015-11-20 10:43:08.444	2015-11-20 10:43:08.444	\N	\N	\N	\N	\N	16	\N	CONSTANT_ISSUE	\N	\N	\N	5min	\N	\N	pitfall	f	HTML
76	Inappropriate "Collection" calls should not be made	S2175	S2175	squid	<p>A couple <code>Collection</code> methods can be called with arguments of an incorrect type, but doing so is pointless and likely the result of using the wrong argument. This rule will raise an issue when the type of the argument to <code>List.contains</code> or <code>List.remove</code> is unrelated to the type used for the list declaration.</p>\n<h2>Noncompliant Code Example</h2>\n\n<pre>\nList&lt;String&gt; list = new ArrayList&lt;String&gt;();\nInteger integer = Integer.valueOf(1);\n\nif (list.contains(integer)) {  // Noncompliant. Always false.\n  list.remove(integer); // Noncompliant. list.add(iger) doesn't compile, so this will always return false\n}\n</pre>	3	\N	READY	java	2015-11-20 10:43:08.455	2015-11-20 10:43:08.456	\N	\N	\N	\N	\N	39	\N	CONSTANT_ISSUE	\N	\N	\N	15min	\N	\N	bug	f	HTML
77	Short-circuit logic should be used in boolean contexts	S2178	S2178	squid	The use of non-short-circuit logic in a boolean context is likely a mistake - one that could cause serious program errors as conditions are evaluated under the wrong circumstances.\n\n<h2>Noncompliant Code Example</h2>\n<pre>\nif(getTrue() | getFalse()) { ... } // Noncompliant; both sides evaluated\n</pre>\n\n<h2>Compliant Solution</h2>\n<pre>\nif(getTrue() || getFalse()) { ... }  // true short-circuit logic\n</pre>	3	\N	READY	java	2015-11-20 10:43:08.458	2015-11-20 10:43:08.458	\N	\N	\N	\N	\N	43	\N	CONSTANT_ISSUE	\N	\N	\N	5min	\N	\N	bug	f	HTML
78	"Serializable" classes should have a version id	S2057	S2057	squid	<p>A <code>serialVersionUID</code> field is required in all <code>Serializable</code> classes. If you do not provide one, one will be calculated for you by the compiler. The danger in not explicitly choosing the value is that when the class changes, the compiler will generate an entirely new id, and you will be suddenly unable to deserialize (read from file) objects that were serialized with the previous version of the class.</p>\n\n<p><code>serialVersionUID</code>'s should be declared with all of these modifiers: <code>static final long</code>.</p>\n\n<h2>Noncompliant Code Example</h2>\n<pre>\npublic class Raspberry extends Fruit  // Noncompliant; no serialVersionUID. \n        implements Serializable {\n  private String variety;\n\n  public Raspberry(Season ripe, String variety) { ...}\n  public void setVariety(String variety) {...}\n  public String getVarity() {...}\n}\n\npublic class Raspberry extends Fruit\n        implements Serializable {\n  private final int serialVersionUID = 1; // Noncompliant; not static &amp; int rather than long\n</pre>\n\n<h2>Compliant Solution</h2>\n<pre>\npublic class Raspberry extends Fruit\n        implements Serializable {\n  private static final long serialVersionUID = 1;\n  private String variety;\n\n  public Raspberry(Season ripe, String variety) { ...}\n  public void setVariety(String variety) {...}\n  public String getVarity() {...}\n}\n</pre>\n\n<h2>Exceptions</h2>\nSwing and AWT classes, <code>abstract</code> classes, <code>Throwable</code> and its subclasses (<code>Exception</code>s and <code>Error</code>s), and classes marked with <code>@SuppressWarnings("serial")</code> are ignored.	2	\N	READY	java	2015-11-20 10:43:08.46	2015-11-20 10:43:08.46	\N	\N	\N	\N	\N	35	\N	CONSTANT_ISSUE	\N	\N	\N	5min	\N	\N	pitfall,serialization	f	HTML
79	Assertions should be complete	S2970	S2970	squid	<p>\n  It is very easy to write incomplete assertions when using some test frameworks.\n  This rule enforces complete assertions in the following cases:\n</p>\n<ul>\n  <li>Fest: <code>assertThat</code> is not followed by an assertion invocation</li>\n  <li>AssertJ: <code>assertThat</code> is not followed by an assertion invocation</li>\n  <li>Mockito: <code>verify</code> is not followed by a method invocation</li>\n</ul>\n<p>\n  In such cases, what is intended to be a test doesn't actually verify anything.\n</p>\n\n<h2>Noncompliant Code Example</h2>\n<pre>\n// Fest\nboolean result = performAction();\n// let's now check that result value is true\nassertThat(result); // Noncompliant; nothing is actually checked, the test passes whether "result" is true or false\n\n// Mockito\nList mockedList = Mockito.mock(List.class);\nmockedList.add("one");\nmockedList.clear();\n// let's check that "add" and "clear" methods are actually called\nMockito.verify(mockedList); // Noncompliant; nothing is checked here, oups no call is chained to verify()\n</pre>\n\n<h2>Compliant Solution</h2>\n<pre>\n// Fest\nboolean result = performAction();\n// let's now check that result value is true\nassertThat(result).isTrue();\n\n// Mockito\nList mockedList = Mockito.mock(List.class);\nmockedList.add("one");\nmockedList.clear();\n// let's check that "add" and "clear" methods are actually called\nMockito.verify(mockedList).add("one");\nMockito.verify(mockedList).clear();\n</pre>\n\n<h2>Exceptions</h2>\n<p>Variable assignments and return statements are skipped to allow helper methods.</p>\n<pre>\nprivate BooleanAssert check(String filename, String key) {\n  String fileContent = readFileContent(filename);\n  performReplacements(fileContent);\n  return assertThat(fileContent.contains(key)); // No issue is raised here\n}\n\n@Test\npublic void test() {\n  check("foo.txt", "key1").isTrue();\n  check("bar.txt", "key2").isTrue();\n}\n</pre>	3	\N	READY	java	2015-11-20 10:43:08.461	2015-11-20 10:43:08.461	\N	\N	\N	\N	\N	51	\N	CONSTANT_ISSUE	\N	\N	\N	5min	\N	\N	junit	f	HTML
81	Maps with keys that are enum values should be replaced with EnumMap	S1640	S1640	squid	<p>\n  When all the keys of a Map are values from the same enum, the <code>Map</code> can be replaced with an <code>EnumMap</code>,\n  which can be much more efficient than other sets because the underlying data structure is a simple array.\n</p>\n\n<h2>Noncompliant Code Example</h2>\n<pre>\npublic class MyClass {\n\n  public enum COLOR {\n    RED, GREEN, BLUE, ORANGE;\n  }\n\n  public void mapMood() {\n    Map&lt;COLOR, String&gt; moodMap = new HashMap&lt;COLOR, String&gt; ();\n  }\n}\n</pre>\n\n<h2>Compliant Solution</h2>\n<pre>\npublic class MyClass {\n\n  public enum COLOR {\n    RED, GREEN, BLUE, ORANGE;\n  }\n\n  public void mapMood() {\n    EnumMap&lt;COLOR, String&gt; moodMap = new EnumMap&lt;COLOR, String&gt; (COLOR.class);\n  }\n}\n</pre>	2	\N	READY	java	2015-11-20 10:43:08.467	2015-11-20 10:43:08.467	\N	\N	\N	\N	\N	31	\N	CONSTANT_ISSUE	\N	\N	\N	5min	\N	\N	performance	f	HTML
82	Inner classes should not have too many lines	S2972	S2972	squid	<p>\n  Inner classes should be short and sweet, to manage complexity in the overall file.\n  An inner class that has grown longer than a certain threshold should probably be externalized to its own file.\n</p>	2	\N	READY	java	2015-11-20 10:43:08.468	2015-11-20 10:43:08.468	\N	\N	\N	\N	\N	16	\N	CONSTANT_ISSUE	\N	\N	\N	20min	\N	\N	brain-overload	f	HTML
83	Classes without "public" constructors should be "final"	S2974	S2974	squid	<p>Classes with only <code>private</code> constructors should be marked <code>final</code> to prevent any mistaken extension attempts.</p>\n<h2>Noncompliant Code Example</h2>\n\n<pre>\npublic class PrivateConstructorClass {  // Noncompliant\n  private PrivateConstructorClass() {\n    // ...\n  }\n\n  public static int magic(){\n    return 42;\n  }\n}\n</pre>\n<h2>Compliant Solution</h2>\n\n<pre>\npublic final class PrivateConstructorClass {  // Compliant\n  private PrivateConstructorClass() {\n    // ...\n  }\n\n  public static int magic(){\n    return 42;\n  }\n}\n</pre>	2	\N	READY	java	2015-11-20 10:43:08.469	2015-11-20 10:43:08.469	\N	\N	\N	\N	\N	16	\N	CONSTANT_ISSUE	\N	\N	\N	5min	\N	\N	design	f	HTML
84	Strings should not be concatenated using '+' in a loop	S1643	S1643	squid	<p>Strings are immutable objects in Java, so concatenation doesn't simply add the new String to the end of the existing string. Instead, in each loop iteration, the first String is converted to an intermediate object type, the second string is appended, and then the intermediate object is converted back to a String. Further, performance of these intermediate operations degrades as the String gets longer. Therefore, the use of StringBuilder is preferred.</p>\n\n<h2>Noncompliant Code Example</h2>\n<pre>\nString str = "";\nfor (int i = 0; i < arrayOfStrings.length ; ++i) {\n  str = str + arrayOfStrings[i];\n}\n</pre>\n\n<h2>Compliant Solution</h2>\n<pre>\nStringBuilder bld = new StringBuilder();\nfor (int i = 0; i < arrayOfStrings.length; ++i) {\n  bld.append(arrayOfStrings[i]);\n}\nString str = bld.toString();\n</pre>	2	\N	READY	java	2015-11-20 10:43:08.47	2015-11-20 10:43:08.47	\N	\N	\N	\N	\N	29	\N	CONSTANT_ISSUE	\N	\N	\N	10min	\N	\N	performance	f	HTML
93	Sections of code should not be "commented out"	CommentedOutCodeLine	CommentedOutCodeLine	squid	<p>Programmers should not comment out code as it bloats programs and reduces readability.</p>\n<p>Unused code should be deleted and can be retrieved from source control history if required.</p>\n<h2>See</h2>\n\n<ul>\n<li> MISRA C:2004, 2.4 - Sections of code should not be "commented out".</li>\n<li> MISRA C++:2008, 2-7-2 - Sections of code shall not be "commented out" using C-style comments.</li>\n<li> MISRA C++:2008, 2-7-3 - Sections of code should not be "commented out" using C++ comments.</li>\n<li> MISRA C:2012, Dir. 4.4 - Sections of code should not be "commented out"</li>\n</ul>	2	\N	READY	java	2015-11-20 10:43:08.49	2015-11-20 10:43:08.49	\N	\N	\N	\N	\N	16	\N	CONSTANT_ISSUE	\N	\N	\N	5min	\N	\N	misra,unused	f	HTML
85	Identical expressions should not be used on both sides of a binary operator	S1764	S1764	squid	<p>Using the same value on either side of a binary operator is almost always a mistake. In the case of logical operators, it is either a copy/paste error and therefore a bug, or it is simply wasted code, and should be simplified. In the case of bitwise operators and most binary mathematical operators, having the same value on both sides of an operator yields predictable results, and should be simplified.</p>\n<p>This rule ignores <code>*</code>, <code>+</code>, and <code>=</code>. </p>\n<h2>Noncompliant Code Example</h2>\n\n<pre>\nif ( a == a ) { // always true\n  doZ();\n}\nif ( a != a ) { // always false\n  doY();\n}\nif ( a == b &amp;&amp; a == b ) { // if the first one is true, the second one is too\n  doX();\n}\nif ( a == b || a == b ) { // if the first one is true, the second one is too\n  doW();\n}\n\nint j = 5 / 5; //always 1\nint k = 5 - 5; //always 0\n</pre>\n<h2>Compliant Solution</h2>\n\n<pre>\ndoZ();\n\nif ( a == b ) {\n  doX();\n}\nif ( a == b ) {\n  doW();\n}\n\nint j = 1;\nint k = 0;\n</pre>\n<h2>Exceptions</h2>\n\n<p>The specific case of testing a floating point value against itself is a valid test for <code>NaN</code> and is therefore ignored.</p>\n<p>Similarly, left-shifting 1 onto 1 is common in the construction of bit masks, and is ignored.</p>\n<pre>\nfloat f;\nif(f != f) { //test for NaN value\n  System.out.println("f is NaN");\n}\n\nint i = 1 &lt;&lt; 1; // Compliant\nint j = a &lt;&lt; a; // Noncompliant\n</pre>\n<h2>See</h2>\n\n<ul>\n<li> <a href="https://www.securecoding.cert.org/confluence/x/NYA5">CERT, MSC12-C</a> - Detect and remove code that has no effect</li>\n<li> <a href="https://www.securecoding.cert.org/confluence/x/SIIyAQ">CERT, MSC12-CPP</a> - Detect and remove code that has no effect</li>\n<li> Rule S1656 - Implements a check on <code>=</code>. </li>\n</ul>	3	\N	READY	java	2015-11-20 10:43:08.471	2015-11-20 10:43:08.471	\N	\N	\N	\N	\N	43	\N	CONSTANT_ISSUE	\N	\N	\N	2min	\N	\N	bug,cert	f	HTML
86	Escaped Unicode characters should not be used	S2973	S2973	squid	<p>The use of Unicode escape sequences should be reserved for characters that would otherwise be ambiguous, such as unprintable characters.</p>\n<p>This rule ignores sequences composed entirely of Unicode characters, but otherwise raises an issue for each Unicode character that represents a printable character.</p>\n\n<h2>Noncompliant Code Example</h2>\n<pre>\nString prefix = "n\\u00E9e"; // Noncompliant\n</pre>\n\n<h2>Compliant Solution</h2>\n<pre>\nString prefix = "née";\n</pre>	2	\N	READY	java	2015-11-20 10:43:08.472	2015-11-20 10:43:08.476	\N	\N	\N	\N	\N	16	\N	CONSTANT_ISSUE	\N	\N	\N	5min	\N	\N	confusing	f	HTML
87	Future keywords should not be used as names	S1190	S1190	squid	<p>Through Java's evolution keywords have been added. While code that uses those words as identifiers may be compilable under older versions of Java, it will not be under modern versions. </p>\n<table>\n<tr><th>Keyword</th><th>Added</th></tr>\n<tr><td>assert</td><td>1.4</td></tr>\n<tr><td>const</td><td>reserved</td></tr>\n<tr><td>enum</td><td>5.0</td></tr>\n<tr><td>goto</td><td>reserved</td></tr>\n<tr><td>strictfp</td><td>1.2</td></tr>\n</table>\n\n<h2>Noncompliant Code Example</h2>\n<pre>\npublic void doSomething() {\n  int enum = 42;            // Noncompliant\n}\n</pre>\n\n<h2>Compliant Solution</h2>\n<pre>\npublic void doSomething() {\n  int magic = 42;\n}\n</pre>	2	\N	READY	java	2015-11-20 10:43:08.478	2015-11-20 10:43:08.478	\N	\N	\N	\N	\N	6	\N	CONSTANT_ISSUE	\N	\N	\N	5min	\N	\N	obsolete,pitfall	f	HTML
88	Classes from "sun.*" packages should not be used	S1191	S1191	squid	<p>Classes in the <code>sun.*</code> packages are considered implementation details, and are not part of the Java API.</p>\n<p>They can cause problems when moving to new versions of Java because there is no backwards compatibility guarantee. Similarly, they can cause problems when moving to a different Java vendor, such as OpenJDK.</p>\n<p>Such classes are almost always wrapped by Java API classes that should be used instead.</p>\n<h2>Noncompliant Code Example</h2>\n\n<pre>\nimport com.sun.jna.Native;     // Noncompliant\nimport sun.misc.BASE64Encoder; // Noncompliant\n</pre>	2	\N	READY	java	2015-11-20 10:43:08.478	2015-11-20 10:43:08.479	\N	\N	\N	\N	\N	6	\N	CONSTANT_ISSUE	\N	\N	\N	1h	\N	\N	lock-in,pitfall	f	HTML
89	String literals should not be duplicated	S1192	S1192	squid	<p>Duplicated string literals make the process of refactoring error-prone, since you must be sure to update all occurrences.</p>\n<p>On the other hand, constants can be referenced from many places, but only need to be updated in a single place.</p>\n<h2>Noncompliant Code Example</h2>\n\n<p>With the default threshold of 3:</p>\n<pre>\npublic void run() {\n  prepare("action1");                              // Noncompliant - "action1" is duplicated 3 times\n  execute("action1");\n  release("action1");\n}\n\n@SuppressWarning("all")                            // Compliant - annotations are excluded\nprivate void method1() { /* ... */ }\n@SuppressWarning("all")\nprivate void method2() { /* ... */ }\n\npublic String method3(String a) {\n  System.out.println("'" + a + "'");               // Compliant - literal "'" has less than 5 characters and is excluded\n  return "";                                       // Compliant - literal "" has less than 5 characters and is excluded\n}\n</pre>\n<h2>Compliant Solution</h2>\n\n<pre>\nprivate static final String ACTION_1 = "action1";  // Compliant\n\npublic void run() {\n  prepare(ACTION_1);                               // Compliant\n  execute(ACTION_1);\n  release(ACTION_1);\n}\n</pre>\n<h2>Exceptions</h2>\n\n<p>To prevent generating some false-positives, literals having less than 5 characters are excluded.</p>	1	\N	READY	java	2015-11-20 10:43:08.48	2015-11-20 10:43:08.481	\N	\N	\N	\N	\N	39	\N	LINEAR_OFFSET	\N	2min	\N	2min	per duplicate instance	\N	design	f	HTML
90	Exception types should not be tested using "instanceof" in catch blocks	S1193	S1193	squid	<p>\nMultiple catch blocks of the appropriate type should be used instead of catching a general exception, and then testing on the type.\n</p>\n\n<p>For example, following code:</p>\n\n<pre>\ntry {\n  /* ... */\n} catch (Exception e) {\n  if(e instanceof IOException) { /* ... */ }         // Noncompliant\n  if(e instanceof NullPointerException{ /* ... */ }  // Noncompliant\n}\n</pre>\n\n<p>should be refactored into:</p>\n\n<pre>\ntry {\n  /* ... */\n} catch (IOException e) { /* ... */ }                // Compliant\n} catch (NullPointerException e) { /* ... */ }       // Compliant\n</pre>	2	\N	READY	java	2015-11-20 10:43:08.484	2015-11-20 10:43:08.487	\N	\N	\N	\N	\N	16	\N	CONSTANT_ISSUE	\N	\N	\N	10min	\N	\N	error-handling,security	f	HTML
91	Subclasses that add fields should override "equals"	S2160	S2160	squid	<p>Extend a class that overrides <code>equals</code> and add fields without overriding <code>equals</code> in the subclass, and you run the risk of non-equivalent instances of your subclass being seen as equal, because only the superclass fields will be considered in the equality test.</p>\n\n<p>This rule looks for classes that do all of the following:</p>\n<ul>\n    <li>extend classes that override <code>equals</code>.</li>\n    <li>do not themselves override <code>equals</code>.</li>\n    <li>add fields.</li>\n</ul>\n\n<h2>Noncompliant Code Example</h2>\n<pre>\npublic class Fruit {\n  private Season ripe;\n\n  public boolean equals(Object obj) {\n    if (obj == this) {\n      return true;\n    }\n    if (this.class != obj.class) {\n      return false;\n    }\n    Fruit fobj = (Fruit) obj;\n    if (ripe.equals(fobj.getRipe()) {\n      return true;\n    }\n    return false;\n  }\n}\n\npublic class Raspberry extends Fruit {  // Noncompliant; instances will use Fruit's equals method\n  private Color ripeColor;\n}\n</pre>\n\n<h2>Compliant Solution</h2>\n<pre>\npublic class Fruit {\n  private Season ripe;\n\n  public boolean equals(Object obj) {\n    if (obj == this) {\n      return true;\n    }\n    if (this.class != obj.class) {\n      return false;\n    }\n    Fruit fobj = (Fruit) obj;\n    if (ripe.equals(fobj.getRipe()) {\n      return true;\n    }\n    return false;\n  }\n}\n\npublic class Raspberry extends Fruit {\n  private Color ripeColor;\n\n  public boolean equals(Object obj) {\n    if (! super.equals(obj)) {\n      return false;\n    }\n    Raspberry fobj = (Raspberry) obj;\n    if (ripeColor.equals(fobj.getRipeColor()) {  // added fields are tested\n      return true;\n    }\n    return false;\n  }\n}\n</pre>	2	\N	READY	java	2015-11-20 10:43:08.488	2015-11-20 10:43:08.488	\N	\N	\N	\N	\N	43	\N	CONSTANT_ISSUE	\N	\N	\N	30min	\N	\N	bug	f	HTML
92	"java.lang.Error" should not be extended	S1194	S1194	squid	<p><code>java.lang.Error</code> and its subclasses represent abnormal conditions, such as <code>OutOfMemoryError</code>, which should only be encountered by the Java Virtual Machine.</p>\n<h2>Noncompliant Code Example</h2>\n\n<pre>\npublic class MyException extends Error { /* ... */ }       // Noncompliant\n</pre>\n<h2>Compliant Solution</h2>\n\n<pre>\npublic class MyException extends Exception { /* ... */ }   // Compliant\n</pre>	2	\N	READY	java	2015-11-20 10:43:08.489	2015-11-20 10:43:08.489	\N	\N	\N	\N	\N	40	\N	CONSTANT_ISSUE	\N	\N	\N	10min	\N	\N	error-handling,security	f	HTML
94	Array designators "[]" should be located after the type in method signatures	S1195	S1195	squid	<p>According to the Java Language Specification: </p>\n<blockquote>\n<p>For compatibility with older versions of the Java SE platform,</p>\n<p>the declaration of a method that returns an array is allowed to place (some or all of) the empty bracket pairs that form the declaration of the array type after the formal parameter list.</p>\n<p>This obsolescent syntax should not be used in new code.</p>\n</blockquote>\n<p>The following code snippet illustrates this rule:</p>\n<pre>\npublic int getVector()[] { /* ... */ }    // Noncompliant\n\npublic int[] getVector() { /* ... */ }    // Compliant\n\npublic int[] getMatrix()[] { /* ... */ }  // Noncompliant\n\npublic int[][] getMatrix() { /* ... */ }  // Compliant\n</pre>	1	\N	READY	java	2015-11-20 10:43:08.493	2015-11-20 10:43:08.494	\N	\N	\N	\N	\N	15	\N	CONSTANT_ISSUE	\N	\N	\N	5min	\N	\N	convention	f	HTML
95	"equals" methods should be symmetric and work for subclasses	S2162	S2162	squid	<p>A key facet of the <code>equals</code> contract is that if <code>a.equals(b)</code> then <code>b.equals(a)</code>, i.e. that the relationship is symmetric. </p>\n<p>Using <code>instanceof</code> breaks the contract when there are subclasses, because while the child is an <code>instanceof</code> the parent, the parent is not an <code>intanceof</code> the child. For instance, assume that <code>Raspberry extends Fruit</code> and adds some fields (requiring a new implementation of <code>equals</code>):</p>\n<pre>\nFruit fruit = new Fruit();\nRaspberry raspberry = new Raspberry();\n\nif (raspberry instanceof Fruit) { ... } // true\nif (fruit instanceof Raspberry) { ... } // false\n</pre>\n<p>If similar <code>instanceof</code> checks were used in the classes' <code>equals</code> methods, the symmetry principle would be broken:</p>\n<pre>\nraspberry.equals(fruit); // false\nfruit.equals(raspberry); //true\n</pre>\n<p>Additionally, non <code>final</code> classes shouldn't use a hardcoded class name in the <code>equals</code> method because doing so breaks the method for subclasses. Instead, make the comparison dynamic.</p>\n<p>Further, comparing to an unrelated class type breaks the contract for that unrelated type, because while <code>thisClass.equals(unrelatedClass)</code> can return true, <code>unrelatedClass.equals(thisClass)</code> will not.</p>\n<h2>Noncompliant Code Example</h2>\n\n<pre>\npublic class Fruit extends Food {\n  private Season ripe;\n\n  public boolean equals(Object obj) {\n    if (obj == this) {\n      return true;\n    }\n    if (Fruit.class == obj.getClass()) { // Noncompliant; broken for child classes\n      return ripe.equals(((Fruit)obj).getRipe());\n    }\n    if (obj instanceof Fruit ) {  // Noncompliant; broken for child classes\n      return ripe.equals(((Fruit)obj).getRipe());\n    }\n    else if (obj instanceof Season) { // Noncompliant; symmetry broken for Season class\n      // ...\n    }\n    //...\n</pre>\n<h2>Compliant Solution</h2>\n\n<pre>\npublic class Fruit extends Food {\n  private Season ripe;\n\n  public boolean equals(Object obj) {\n    if (obj == this) {\n      return true;\n    }\n    if (this.getClass() == obj.getClass()) {\n      return ripe.equals(((Fruit)obj).getRipe());\n    }\n    return false;\n}\n</pre>	3	\N	READY	java	2015-11-20 10:43:08.494	2015-11-20 10:43:08.494	\N	\N	\N	\N	\N	42	\N	CONSTANT_ISSUE	\N	\N	\N	5min	\N	\N	bug	f	HTML
96	Unused protected methods should be removed	UnusedProtectedMethod	UnusedProtectedMethod	squid	<p>Protected methods that are never used by any of the classes in the same project are suspected to be dead code. Dead code is unnecessary, inoperative code that should be removed. Removing dead code makes maintenance easier by decreasing the size of the maintained code base, thereby making it easier to understand the program and preventing the introduction of bugs.</p>\n<p>Unused protected methods are not considered dead code in the following cases:</p>\n<ul>\n<li> Protected methods which override a parent class method.</li>\n<li> Protected methods of an abstract class.</li>\n</ul>	2	\N	READY	java	2015-11-20 10:43:08.498	2015-11-20 10:43:08.499	\N	\N	\N	\N	\N	16	\N	CONSTANT_ISSUE	\N	\N	\N	10min	\N	\N	unused	f	HTML
97	Files should contain only one top-level class or interface each	S1996	S1996	squid	<p>\n  A file that grows too much tends to aggregate too many responsibilities and inevitably becomes harder to understand and therefore to maintain.\n  This is doubly true for a file with multiple top-level classes and interfaces. It is strongly advised to divide the file into one top-level class or interface per file.\n</p>	2	\N	READY	java	2015-11-20 10:43:08.499	2015-11-20 10:43:08.5	\N	\N	\N	\N	\N	16	\N	LINEAR	\N	10min	\N	\N	per extra "class" or "interface"	\N	brain-overload	f	HTML
228	Literal boolean values should not be used in assertions	S2701	S2701	squid	<p>There's no reason to use literal boolean values in assertions. Doing so is at best confusing for maintainers, and at worst a bug.</p>\n<h2>Noncompliant Code Example</h2>\n\n<pre>\nAssert.assertTrue(true);  // Noncompliant\nassertThat(true).isTrue(); // Noncompliant\n</pre>	2	\N	READY	java	2015-11-20 10:43:08.732	2015-11-20 10:43:08.732	\N	\N	\N	\N	\N	51	\N	CONSTANT_ISSUE	\N	\N	\N	5min	\N	\N	junit	f	HTML
98	"finalize" should not set fields to "null"	S2165	S2165	squid	<p>There is no point in setting class fields to <code>null</code> in a finalizer. If this this is a hint to the garbage collector, it is unnecessary - the object will be garbage collected anyway - and doing so may actually cause extra work for the garbage collector.</p>\n<h2>Noncompliant Code Example</h2>\n\n<pre>\npublic class Foo {\n  private String name;\n\n  @Override\n  void finalize() {\n    name = null;  // Noncompliant; completely unnecessary\n</pre>	2	\N	READY	java	2015-11-20 10:43:08.5	2015-11-20 10:43:08.504	\N	\N	\N	\N	\N	31	\N	CONSTANT_ISSUE	\N	\N	\N	5min	\N	\N	clumsy,performance	f	HTML
99	Array designators "[]" should be on the type, not the variable	S1197	S1197	squid	<p>\n  Array designators should always be located on the type for better code readability.\n  Otherwise, developers must look both at the type and the variable name to know whether or\n  not a variable is an array.\n</p>\n\n<h2>Noncompliant Code Example</h2>\n<pre>\nint matrix[][];   // Noncompliant\nint[] matrix[];   // Noncompliant\n</pre>\n\n<h2>Compliant Solution</h2>\n<pre>\nint[][] matrix;   // Compliant\n</pre>	1	\N	READY	java	2015-11-20 10:43:08.505	2015-11-20 10:43:08.505	\N	\N	\N	\N	\N	15	\N	CONSTANT_ISSUE	\N	\N	\N	5min	\N	\N	convention	f	HTML
100	Math should not be performed on floats	S2164	S2164	squid	For small numbers, <code>float</code> math has enough precision to yield the expected value, but for larger numbers, it does not. <code>BigDecimal</code> is the best alternative, but if a primitive is required, use a <code>double</code>.\n\n<h2>Noncompliant Code Example</h2>\n<pre>\nfloat a = 16777216.0f;\nfloat b = 1.0f;\nfloat c = a + b; // Noncompliant; yields 1.6777216E7 not 1.6777217E7\n\ndouble d = a + b; // Noncompliant; addition is still between 2 floats\n</pre>\n\n<h2>Compliant Solution</h2>\n<pre>\nfloat a = 16777216.0f;\nfloat b = 1.0f;\nBigDecimal c = BigDecimal.valueOf(a).add(BigDecimal.valueOf(b));\n\ndouble d = (double)a + (double)b;\n</pre>	3	\N	READY	java	2015-11-20 10:43:08.505	2015-11-20 10:43:08.505	\N	\N	\N	\N	\N	39	\N	CONSTANT_ISSUE	\N	\N	\N	15min	\N	\N	bug	f	HTML
101	"compareTo" should not return "Integer.MIN_VALUE"	S2167	S2167	squid	<p>It is the sign, rather than the magnitude of the value returned from <code>compareTo</code> that matters. Returning <code>Integer.MIN_VALUE</code> does not convey a higher degree of inequality, and doing so can cause errors because the return value of <code>compareTo</code> is sometimes inversed, with the expectation that negative values become positive. However, inversing <code>Integer.MIN_VALUE</code> yields <code>Integer.MIN_VALUE</code> rather than <code>Integer.MAX_VALUE</code>.</p>\n\n<h2>Noncompliant Code Example</h2>\n<pre>\npublic int compareTo(MyClass) {\n  if (condition) {\n    return Integer.MIN_VALUE;  // Noncompliant\n  }\n</pre>\n\n<h2>Compliant Solution</h2>\n<pre>\npublic int compareTo(MyClass) {\n  if (condition) {\n    return -1;\n  }\n</pre>	3	\N	READY	java	2015-11-20 10:43:08.506	2015-11-20 10:43:08.506	\N	\N	\N	\N	\N	43	\N	CONSTANT_ISSUE	\N	\N	\N	5min	\N	\N	bug	f	HTML
102	Nested code blocks should not be used	S1199	S1199	squid	<p>Nested code blocks can be used to create a new scope and restrict the visibility of the variables defined inside it. Using this feature in a method typically indicates that the method has too many responsibilities, and should be refactored into smaller methods.</p>\n<h2>Noncompliant Code Example</h2>\n\n<pre>\npublic void evaluate(int operator) {\n  switch (operator) {\n    /* ... */\n    case ADD: {                                // Noncompliant - nested code block '{' ... '}'\n        int a = stack.pop();\n        int b = stack.pop();\n        int result = a + b;\n        stack.push(result);\n        break;\n      }\n    /* ... */\n  }\n}\n</pre>\n<h2>Compliant Solution</h2>\n\n<pre>\npublic void evaluate(int operator) {\n  switch (operator) {\n    /* ... */\n    case ADD:                                  // Compliant\n      evaluateAdd();\n      break;\n    /* ... */\n  }\n}\n\nprivate void evaluateAdd() {\n  int a = stack.pop();\n  int b = stack.pop();\n  int result = a + b;\n  stack.push(result);\n}\n</pre>	2	\N	READY	java	2015-11-20 10:43:08.506	2015-11-20 10:43:08.507	\N	\N	\N	\N	\N	16	\N	CONSTANT_ISSUE	\N	\N	\N	10min	\N	\N	bad-practice	f	HTML
103	Classes named like "Exception" should extend "Exception" or a subclass	S2166	S2166	squid	Clear, communicative naming is important in code. It helps maintainers and API users understand the intentions for and uses of a unit of code. Using "exception" in the name of a class that does not extend <code>Exception</code> or one of its subclasses is a clear violation of the expectation that a class' name will indicate what it is and/or does.\n\n<h2>Noncompliant Code Example</h2>\n<pre>\npublic class FruitException {  // Noncompliant; this has nothing to do with Exception\n  private Fruit expected;\n  private String unusualCharacteristics;\n  private boolean appropriateForCommercialExploitation;\n  // ...\n}\n\npublic class CarException {  // Noncompliant; the extends clause was forgotten?\n  public CarException(String message, Throwable cause) {\n  // ...\n</pre>\n\n<h2>Compliant Solution</h2>\n<pre>\npublic class FruitSport {\n  private Fruit expected;\n  private String unusualCharacteristics;\n  private boolean appropriateForCommercialExploitation;\n  // ...\n}\n\npublic class CarException extends Exception {\n  public CarException(String message, Throwable cause) {\n  // ...\n</pre>	2	\N	READY	java	2015-11-20 10:43:08.507	2015-11-20 10:43:08.507	\N	\N	\N	\N	\N	16	\N	CONSTANT_ISSUE	\N	\N	\N	5min	\N	\N	convention,pitfall	f	HTML
104	Two branches in the same conditional structure should not have exactly the same implementation	S1871	S1871	squid	<p>Having two <code>cases</code> in the same <code>switch</code> statement or branches in the same <code>if</code> structure  with the same implementation is at best duplicate code, and at worst a coding error. If the same logic is truly needed for both instances, then they should be combined, for an <code>if</code> structure or one should fall through to the other for a <code>switch</code>.</p>\n<h2>Noncompliant Code Example</h2>\n\n<pre>\nswitch (i) {\n  case 1: \n    doSomething();\n    break;\n  case 2: \n    doSomethingDifferent();\n    break;\n  case 3:  // Noncompliant; duplicates case 1's implementation\n    doSomething(); \n    break;\n  default: \n    doTheRest();\n}\n\nif (a &gt;= 0 &amp;&amp; a &lt; 10) {\n  doTheThing();\nelse if (a &gt;= 10 &amp;&amp; a &lt; 20) {\n  doTheOtherThing();\n}\nelse if (a &gt;= 20 &amp;&amp; a &lt; 50) {\n  doTheThing();  // Noncompliant; duplicates first condition\n}\nelse {\n  doTheRest(); \n}\n</pre>\n<h2>Compliant Solution</h2>\n\n<pre>\nswitch (i) {\n  case 1: \n  case 3:\n    doSomething();\n    break;\n  case 2: \n    doSomethingDifferent();\n    break;\n  default: \n    doTheRest();\n}\n\nif ((a &gt;= 0 &amp;&amp; a &lt; 10) || (a &gt;= 20 &amp;&amp; a &lt; 50)) {\n  doTheThing();\nelse if (a &gt;= 10 &amp;&amp; a &lt; 20) {\n  doTheOtherThing();\n}\nelse {\n  doTheRest(); \n}\n</pre>\n<p>or </p>\n<pre>\nswitch (i) {\n  case 1: \n    doSomething();\n    break;\n  case 2: \n    doSomethingDifferent();\n    break;\n  case 3:\n    doThirdThing(); \n    break;\n  default: \n    doTheRest();\n}\n\nif (a &gt;= 0 &amp;&amp; a &lt; 10) {\n  doTheThing();\nelse if (a &gt;= 10 &amp;&amp; a &lt; 20) {\n  doTheOtherThing();\n}\nelse if (a &gt;= 20 &amp;&amp; a &lt; 50) {\n  doTheThirdThing();\n}\nelse {\n  doTheRest(); \n}\n</pre>	2	\N	READY	java	2015-11-20 10:43:08.509	2015-11-20 10:43:08.51	\N	\N	\N	\N	\N	43	\N	CONSTANT_ISSUE	\N	\N	\N	10min	\N	\N	bug	f	HTML
105	Classes should not be compared by name	S1872	S1872	squid	<p>There is no requirement that class names be unique, only that they be unique within a package. Therefore trying to determine an object's type based on its class name is an exercise fraught with danger. One of those dangers is that a malicious user will send objects of the same name as the trusted class and thereby gain trusted access. </p>\n<p>Instead, the <code>instanceof</code> operator should be used to check the object's underlying type.</p>\n<h2>Noncompliant Code Example</h2>\n\n<pre>\npackage computer;\nclass Pear extends Laptop { ... }\n\npackage food;\nclass Pear extends Fruit { ... }\n\nclass Store {\n\n  public boolean hasSellByDate(Object item) {\n    if ("Pear".equals(item.getClass().getSimpleName())) {  // Noncompliant\n      return true;  // Results in throwing away week-old computers\n    }\n  }\n}\n</pre>\n<h2>Compliant Solution</h2>\n\n<pre>\nclass Store {\n\n  public boolean hasSellByDate(Object item) {\n    if (item instanceof food.Pear) {\n      return true;\n    }\n  }\n}\n</pre>\n<h2>See</h2>\n\n<ul>\n<li> <a href="http://cwe.mitre.org/data/definitions/486.html">MITRE, CWE-486</a> - Comparison of Classes by Name</li>\n</ul>	3	\N	READY	java	2015-11-20 10:43:08.51	2015-11-20 10:43:08.51	\N	\N	\N	\N	\N	42	\N	CONSTANT_ISSUE	\N	\N	\N	5min	\N	\N	bug,cwe,security	f	HTML
106	"static final" arrays should be "private"	S1873	S1873	squid	<p>Public arrays, even ones declared <code>static final</code> can have their contents edited by malicious programs. The <code>final</code> keyword on an array declaration means that the array object itself may only be assigned once, but its contents are still mutable. Therefore making arrays <code>public</code> is a security risk.</p>\n<p>Instead, arrays should be private and accessed through methods.</p>\n<h2>Noncompliant Code Example</h2>\n\n<pre>\npublic class Estate {\n  // Noncompliant; array contents can be modified\n  public static final String [] HEIRS = new String [] { \n    "Betty", "Suzy" };\n}\n\npublic class Malicious {\n  public void changeWill() {\n    Estate.HEIRS[0] = "Biff";\n    if (Estate.HEIRS.length &gt; 1) {\n      for (int i = 1; i &lt; Estate.HEIRS.length; i++) {\n        Estate.HEIRS[i] = "";\n      }\n  }\n}\n</pre>\n<h2>Compliant Solution</h2>\n\n<pre>\npublic class Estate {\n  private static final String [] HEIRS = new String [] { \n    "Betty", "Suzy" };\n\n  public String [] getHeirs() {\n    // return copy of HEIRS\n  }\n}\n\n</pre>\n<h2>See</h2>\n\n<ul>\n<li> <a href="http://cwe.mitre.org/data/definitions/582.html">MITRE, CWE-582</a> - Array Declared Public, Final, and Static</li>\n<li> <a href="http://cwe.mitre.org/data/definitions/607.html">MITRE, CWE-607</a> - Public Static Final Field References Mutable Object</li>\n</ul>	3	\N	READY	java	2015-11-20 10:43:08.516	2015-11-20 10:43:08.524	\N	\N	\N	\N	\N	18	\N	CONSTANT_ISSUE	\N	\N	\N	15min	\N	\N	cwe,security	f	HTML
107	"for" loop incrementers should modify the variable being tested in the loop's stop condition	S1994	S1994	squid	<p>It is almost always an error when a <code>for</code> loop's stop condition and incrementer don't act on the same variable. Even when it is not, it could confuse future maintainers of the code, and should be avoided.</p>\n\n<h2>Noncompliant Code Example</h2>\n<pre>\nfor (i = 0; i < 10; j++) {  // Noncompliant\n  // ...\n}\n</pre>\n\n<h2>Compliant Solution</h2>\n<pre>\nfor (i = 0; i < 10; i++) {\n  // ...\n}\n</pre>	3	\N	READY	java	2015-11-20 10:43:08.525	2015-11-20 10:43:08.525	\N	\N	\N	\N	\N	43	\N	CONSTANT_ISSUE	\N	\N	\N	20min	\N	\N	bug	f	HTML
108	SHA-1 and Message-Digest hash algorithms should not be used	S2070	S2070	squid	<p>The MD5 algorithm and its successor, SHA-1, are no longer considered secure, because it is too easy to create hash collisions with them. That is, it takes too little computational effort to come up with a different input that produces the same MD5 or SHA-1 hash, and using the new, same-hash value gives an attacker the same access as if he had the originally-hashed value. This applies as well to the other Message-Digest algorithms: MD2, MD4, MD6.</p>\n<p>This rule tracks usage of the <code>java.security.MessageDigest</code>, and <code>org.apache.commons.codec.digest.DigestUtils</code> classes  to instantiate MD or SHA-1 algorithms, and of Guava's <code>com.google.common.hash.Hashing sha1</code> and <code>md5</code> methods. </p>\n<h2>Noncompliant Code Example</h2>\n\n<pre>\nMessageDigest md = MessageDigest.getInstance("SHA1");  // Noncompliant\n</pre>\n<h2>Compliant Solution</h2>\n\n<pre>\nMessageDigest md = MessageDigest.getInstance("SHA-256");\n</pre>\n<p>or</p>\n<pre>\nCipher cipher = Cipher.getInstance("AES/CBC/PKCS5PADDING");\n</pre>\n<h2>See</h2>\n\n<ul>\n<li> <a href="http://cwe.mitre.org/data/definitions/328">MITRE, CWE-328</a> - Reversible One-Way Hash</li>\n<li> <a href="http://cwe.mitre.org/data/definitions/327">MITRE, CWE-327</a> - Use of a Broken or Risky Cryptographic Algorithm</li>\n<li> <a href="https://www.owasp.org/index.php/Top_10_2013-A6-Sensitive_Data_Exposure">OWASP Top Ten 2013 Category A6</a> - Sensitive Data Exposure</li>\n<li> <a href="http://www.sans.org/top25-software-errors/">SANS Top 25</a> - Porous Defenses</li>\n<li> Derived from FindSecBugs rule <a href="http://h3xstream.github.io/find-sec-bugs/bugs.htm#WEAK_MESSAGE_DIGEST">MessageDigest Is Weak</a></li>\n</ul>	3	\N	READY	java	2015-11-20 10:43:08.526	2015-11-20 10:43:08.526	\N	\N	\N	\N	\N	22	\N	CONSTANT_ISSUE	\N	\N	\N	30min	\N	\N	cwe,owasp-a6,sans-top25-porous,security	f	HTML
109	Empty statements should be removed	EmptyStatementUsageCheck	EmptyStatementUsageCheck	squid	<p>Empty statements, i.e. <code>;</code>, are usually introduced by mistake, for example because:</p>\n<ul>\n<li> It was meant to be replaced by an actual statement, but this was forgotten.</li>\n<li> There was a typo which lead the semicolon to be doubled, i.e. <code>;;</code>.</li>\n</ul>\n<h2>Noncompliant Code Example</h2>\n<pre>\nvoid doSomething() {\n  ;                                                       // Noncompliant - was used as a kind of TODO marker\n}\n\nvoid doSomethingElse() {\n  System.out.println("Hello, world!");;                     // Noncompliant - double ;\n  ...\n  for (int i = 0; i &lt; 3; System.out.println(i), i++);       // Noncompliant - Rarely, they are used on purpose as the body of a loop. It is a bad practice to have side-effects outside of the loop body\n  ...\n}\n</pre>\n<h2>Compliant Solution</h2>\n<pre>\nvoid doSomething() {}\n\nvoid doSomethingElse() {\n  System.out.println("Hello, world!");\n  ...\n  for (int i = 0; i &lt; 3; i++){\n    System.out.println(i);\n  }\n  ...\n}\n</pre>\n<h2>See</h2>\n\n<ul>\n<li> MISRA C:2004, 14.3 - Before preprocessing, a null statement shall only occur on a line by itself; it may be followed by a comment provided that the first character following the null statement is a white-space character.</li>\n<li> MISRA C++:2008, 6-2-3 - Before preprocessing, a null statement shall only occur on a line by itself; it may be followed by a comment, provided that the first character following the null statement is a white-space character.</li>\n<li> <a href="https://www.securecoding.cert.org/confluence/x/NYA5">CERT, MSC12-C</a> - Detect and remove code that has no effect</li>\n<li> <a href="https://www.securecoding.cert.org/confluence/x/SIIyAQ">CERT, MSC12-CPP</a> - Detect and remove code that has no effect</li>\n</ul>	1	\N	READY	java	2015-11-20 10:43:08.526	2015-11-20 10:43:08.527	\N	\N	\N	\N	\N	42	\N	CONSTANT_ISSUE	\N	\N	\N	2min	\N	\N	cert,misra,unused	f	HTML
110	The @SuppressWarnings annotation should not be used	S1309	S1309	squid	<p>This rule allows you to track the usage of the <code>@SuppressWarnings</code> mechanism.</p>\n<h2>Noncompliant Code Example</h2>\n<p>In case &quot;listOfWarnings=unchecked&quot;</p>\n<pre>\n@SuppressWarnings("all")\n</pre>\n<h2>Compliant Solution</h2>\n<p>In case &quot;listOfWarnings=unchecked&quot;</p>\n<pre>\n@SuppressWarnings("unchecked")\n</pre>	0	\N	READY	java	2015-11-20 10:43:08.527	2015-11-20 10:43:08.531	\N	\N	\N	\N	\N	16	\N	CONSTANT_ISSUE	\N	\N	\N	10min	\N	\N	\N	f	HTML
113	Modulus results should not be checked for direct equality	S2197	S2197	squid	When the modulus of a negative number is calculated, the result will either be negative or zero. Thus, comparing the modulus of a variable for equality with a positive number (or a negative one) could result in false negatives. \n\n<h2>Noncompliant Code Example</h2>\n<pre>\npublic boolean isOdd(int x) {\n  return x % 2 == 1;  // Noncompliant; if x is negative, x % 2 == -1\n}\n</pre>\n\n<h2>Compliant Solution</h2>\n<pre>\npublic boolean isOdd(int x) {\n  return x %2 != 0;\n}\n</pre>\n\nor\n\n<pre>\npublic boolean isOdd(int x) {\n  return Math.abs(x %2) != 1;\n}\n</pre>	3	\N	READY	java	2015-11-20 10:43:08.534	2015-11-20 10:43:08.534	\N	\N	\N	\N	\N	39	\N	CONSTANT_ISSUE	\N	\N	\N	5min	\N	\N	bug	f	HTML
111	Values passed to SQL commands should be sanitized	S2077	S2077	squid	<p>Applications that execute SQL commands should neutralize any externally-provided values used in those commands. Failure to do so could allow an attacker to include input that changes the query so that unintended commands are executed, or sensitive data is exposed.</p>\n<p>This rule checks that method parameters are not used directly in non-Hibernate SQL statements, and that parameter binding, rather than concatenation is used in Hibernate statements.</p>\n<h2>Noncompliant Code Example</h2>\n\n<pre>\npublic User getUser(Connection con, String user) throws SQLException {\n\n  Statement stmt1 = null;\n  Statement stmt2 = null;\n  PreparedStatement pstmt;\n  try {\n    stmt1 = con.createStatement();\n    ResultSet rs1 = stmt1.executeQuery("GETDATE()"); // Compliant; parameters not used here\n\n    stmt2 = con.createStatement();\n    ResultSet rs2 = stmt2.executeQuery("select FNAME, LNAME, SSN " +\n                 "from USERS where UNAME=" + user);  // Noncompliant; parameter concatenated directly into query\n\n    pstmt = con.prepareStatement("select FNAME, LNAME, SSN " +\n                 "from USERS where UNAME=" + user);  // Noncompliant; parameter concatenated directly into query\n    ResultSet rs3 = pstmt.executeQuery();\n\n    //...\n}\n\npublic User getUserHibernate(org.hibernate.Session session, String userInput) {\n\n  org.hibernate.Query query = session.createQuery(  // Compliant\n            "FROM students where fname = " + userInput);  // Noncompliant; parameter binding should be used instead\n  // ...\n}\n</pre>\n<h2>Compliant Solution</h2>\n\n<pre>\npublic User getUser(Connection con, String user) throws SQLException {\n\n  Statement stmt1 = null;\n  PreparedStatement pstmt = null;\n  String query = "select FNAME, LNAME, SSN " +\n                 "from USERS where UNAME=?"\n  try {\n    stmt1 = con.createStatement();\n    ResultSet rs1 = stmt1.executeQuery("GETDATE()");\n\n    pstmt = con.prepareStatement(query);\n    pstmt.setString(1, user);  // Compliant; PreparedStatements escape their inputs.\n    ResultSet rs2 = pstmt.executeQuery();\n\n    //...\n  }\n}\n\npublic User getUserHibernate(org.hibernate.Session session, String userInput) {\n\n  org.hibernate.Query query =  session.createQuery("FROM students where fname = ?");\n  query = query.setParameter(0,userInput);  // Parameter binding escapes all input\n  // ...\n</pre>\n<h2>See</h2>\n\n<ul>\n<li> <a href="http://cwe.mitre.org/data/definitions/89">MITRE, CWE-89</a> - Improper Neutralization of Special Elements used in an SQL Command</li>\n<li> <a href="http://cwe.mitre.org/data/definitions/564.html">MITRE, CWE-564</a> - SQL Injection: Hibernate</li>\n<li> <a href="http://cwe.mitre.org/data/definitions/20.html">MITRE, CWE-20</a> - Improper Input Validation</li>\n<li> <a href="http://cwe.mitre.org/data/definitions/943.html">MITRE, CWE-943</a> - Improper Neutralization of Special Elements in Data Query Logic</li>\n<li> <a href="https://www.owasp.org/index.php/Top_10_2013-A1-Injection">OWASP Top Ten 2013 Category A1</a> - Injection</li>\n<li> <a href="http://www.sans.org/top25-software-errors/">SANS Top 25</a> - Insecure Interaction Between Components</li>\n<li> Derived from FindSecBugs rules <a href="http://h3xstream.github.io/find-sec-bugs/bugs.htm#SQL_INJECTION_JPA">Potential SQL/JPQL Injection (JPA)</a>, <a href="http://h3xstream.github.io/find-sec-bugs/bugs.htm#SQL_INJECTION_JDO">Potential SQL/JDOQL Injection (JDO)</a>, <a href="http://h3xstream.github.io/find-sec-bugs/bugs.htm#SQL_INJECTION_HIBERNATE">Potential SQL/HQL Injection (Hibernate)</a></li>\n</ul>	3	\N	READY	java	2015-11-20 10:43:08.532	2015-11-20 10:43:08.532	\N	\N	\N	\N	\N	20	\N	CONSTANT_ISSUE	\N	\N	\N	20min	\N	\N	cwe,hibernate,owasp-a1,sans-top25-insecure,security,sql	f	HTML
112	Values passed to OS commands should be sanitized	S2076	S2076	squid	<p>Applications that execute operating system commands or execute commands that interact with the underlying system should neutralize any externally-provided values used in those commands. Failure to do so could allow an attacker to include input that executes unintended commands, or exposes sensitive data.</p>\n<p>This rule logs an issue as soon as a command is built dynamically. it's then up to the auditor to figure out if the command execution is secure or not. </p>\n<h2>Noncompliant Code Example</h2>\n\n<pre>\npublic void listContent(String input) {\n  Runtime rt = Runtime.getRuntime();\n  rt.exec("ls " + input); // Noncompliant; input could easily contain extra commands\n  ...\n}\n\npublic void execute(String command, String argument) {\n  ProcessBuilder pb = new ProcessBuilder(command, argument); // Noncompliant\n  ...\n}\n</pre>\n<h2>See</h2>\n\n<ul>\n<li> <a href="http://cwe.mitre.org/data/definitions/78">MITRE, CWE-78</a> - Improper Neutralization of Special Elements used in an OS Command</li>\n<li> <a href="http://cwe.mitre.org/data/definitions/88">MITRE, CWE-88</a> - Argument Injection or Modification</li>\n<li> <a href="https://www.owasp.org/index.php/Top_10_2013-A1-Injection">OWASP Top Ten 2013 Category A1</a> - Injection</li>\n<li> <a href="http://www.sans.org/top25-software-errors/">SANS Top 25</a> - Insecure Interaction Between Components</li>\n<li> Derived from the FindSecBugs rule <a href="http://h3xstream.github.io/find-sec-bugs/bugs.htm#COMMAND_INJECTION">Potential Command Injection</a></li>\n</ul>	3	\N	READY	java	2015-11-20 10:43:08.533	2015-11-20 10:43:08.534	\N	\N	\N	\N	\N	20	\N	CONSTANT_ISSUE	\N	\N	\N	30min	\N	\N	cwe,owasp-a1,sans-top25-insecure,security	f	HTML
114	Multiple loops over the same set should be combined	S3047	S3047	squid	<p>\n  When a method loops multiple over the same set of data,\n  whether it's a list or a set of numbers,\n  it is highly likely that the method could be made more efficient by combining\n  the loops into a single set of iterations.\n</p>\n\n<h2>Noncompliant Code Example</h2>\n<pre>\npublic void doSomethingToAList(List&lt;String&gt; strings) {\n  for (String str : strings) {\n    doStep1(str);\n  }\n  for (String str : strings) {  // Noncompliant\n    doStep2(str);\n  }\n}\n</pre>\n\n<h2>Compliant Solution</h2>\n<pre>\npublic void doSomethingToAList(List&lt;String&gt; strings) {\n  for (String str : strings) {\n    doStep1(str);\n    doStep2(str);\n  }\n}\n</pre>	2	\N	READY	java	2015-11-20 10:43:08.535	2015-11-20 10:43:08.535	\N	\N	\N	\N	\N	31	\N	CONSTANT_ISSUE	\N	\N	\N	20min	\N	\N	performance	f	HTML
115	Values passed to LDAP queries should be sanitized	S2078	S2078	squid	<p>Applications that execute LDAP queries should neutralize any externally-provided values in those commands. Failure to do so could allow an attacker to include input that changes the query so that unintended commands are executed, or sensitive data is exposed. Unhappily LDAP doesn't provide any prepared statement interfaces like SQL to easily remove this risk. So each time a LDAP query is built dynamically this rule logs an issue.</p>\n<h2>Noncompliant Code Example</h2>\n\n<pre>\npublic User lookupUser(String username, String base, String [] requestedAttrs) {\n\n  // ...\n  DirContext dctx = new InitialDirContext(env);\n\n  SearchControls sc = new SearchControls();\n  sc.setReturningAttributes(requestedAttrs);  // Noncompliant\n  sc.setSearchScope(SearchControls.SUBTREE_SCOPE);\n\n  String filter = "(&amp;(objectClass=user)(sAMAccountName=" + username + "))";\n\n  NamingEnumeration results = dctx.search(base,  // Noncompliant\n        filter,  // Noncompliant; parameter concatenated directly into string\n        sc);\n</pre>\n<h2>Compliant Solution</h2>\n\n<pre>\npublic User lookupUser(String username, String base, String [] requestedAttrs) {\n\n  // ...\n  DirContext dctx = new InitialDirContext(env);\n\n  SearchControls sc = new SearchControls();\n  sc.setReturningAttributes(buildAttrFilter(requestedAttrs));  // Compliant; method presumably scrubs input\n  sc.setSearchScope(SearchControls.SUBTREE_SCOPE);\n  \n  String useBase = "ou=People";\n  if (! base.startsWith(useBase)) {\n    useBase = base;\n  }\n  \n  String filter = "(&amp;(objectClass=user)(sAMAccountName=" + username.replaceAll("[()| ]","") + "))";\n\n  NamingEnumeration results = dctx.search(useBase,  // Compliant; originally value used conditionally\n        filter,  // Compliant; parameter NOT concatenated directly into string\n        sc);\n</pre>\n<h2>See</h2>\n\n<ul>\n<li> <a href="http://cwe.mitre.org/data/definitions/90">MITRE CWE-90</a> - Improper Neutralization of Special Elements used in an LDAP Query ('LDAP Injection')</li>\n<li> <a href="https://www.owasp.org/index.php/Top_10_2013-A1-Injection">OWASP Top Ten 2013 Category A1</a> - Injection</li>\n<li> Derived from FindSecBugs rule <a href="http://h3xstream.github.io/find-sec-bugs/bugs.htm#LDAP_INJECTION">Potential LDAP Injection</a></li>\n</ul>	3	\N	READY	java	2015-11-20 10:43:08.536	2015-11-20 10:43:08.537	\N	\N	\N	\N	\N	20	\N	CONSTANT_ISSUE	\N	\N	\N	30min	\N	\N	cwe,owasp-a1,security	f	HTML
116	"switch" statements should have at least 3 "case" clauses	S1301	S1301	squid	<p><code>switch</code> statements are useful when there are many different cases depending on the value of the same expression.</p>\n<p>For just one or two cases however, the code will be more readable with <code>if</code> statements.</p>\n<h2>Noncompliant Code Example</h2>\n\n<pre>\nswitch (variable) {\n  case 0:\n    doSomething();\n    break;\n  default:\n    doSomethingElse();\n    break;\n}\n</pre>\n<h2>Compliant Solution</h2>\n\n<pre>\nif (variable == 0) {\n  doSomething();\n} else {\n  doSomethingElse();\n}\n</pre>\n<h2>See</h2>\n\n<ul>\n<li> MISRA C:2004, 15.5 - Every switch statement shall have at least one case clause.</li>\n<li> MISRA C++:2008, 6-4-8 - Every switch statement shall have at least one case-clause.</li>\n<li> MISRA C:2012, 16.6 - Every switch statement shall have at least two switch-clauses</li>\n</ul>	1	\N	READY	java	2015-11-20 10:43:08.538	2015-11-20 10:43:08.539	\N	\N	\N	\N	\N	15	\N	CONSTANT_ISSUE	\N	\N	\N	5min	\N	\N	misra	f	HTML
117	Magic numbers should not be used	S109	S109	squid	<p>A magic number is a number that comes out of nowhere, and is directly used in a statement. Magic numbers are often used, for instance to limit the number of iterations of a loops, to test the value of a property, etc.</p>\n\n<p>Using magic numbers may seem obvious and straightforward when you're writing a piece of code, but they are much less obvious and straightforward at debugging time.</p>\n\n<p>That is why magic numbers must be demystified by first being assigned to clearly named variables before being used.</p>\n<p>-1, 0 and 1 are not considered magic numbers (by default, configurable).</p>\n\n<h2>Noncompliant Code Example</h2>\n<pre>\npublic static void doSomething() {\n  for(int i = 0; i &lt; 4; i++){                 // Noncompliant, 4 is a magic number\n    ...\n  }\n}\n</pre>\n\n<h2>Compliant Solution</h2>\n<pre>\npublic static final int NUMBER_OF_CYCLES = 4;\npublic static void doSomething() {\n  for(int i = 0; i &lt; NUMBER_OF_CYCLES ; i++){\n    ...\n  }\n}\n</pre>	1	\N	READY	java	2015-11-20 10:43:08.54	2015-11-20 10:43:08.542	\N	\N	\N	\N	\N	35	\N	CONSTANT_ISSUE	\N	\N	\N	5min	\N	\N	brain-overload	f	HTML
118	Standard outputs should not be used directly to log anything	S106	S106	squid	<p>When logging a message there are two important requirements which must be fulfilled:</p>\n<ul>\n  <li> The user must be able to easily retrieve the logs</li>\n  <li> The format of all logged message must be uniform to allow the user to easily read the log</li>\n</ul>\n\n<p>If a program directly writes to the standard outputs, there is absolutely no way to comply with those requirements. That's why defining and using a dedicated logger is highly recommended.</p>\n\n<h2>Noncompliant Code Example</h2>\n<pre>\nSystem.out.println("My Message");  // Noncompliant\n</pre>\n\n<h2>Compliant Solution</h2>\n<pre>\nlogger.log("My Message");\n</pre>	2	\N	READY	java	2015-11-20 10:43:08.55	2015-11-20 10:43:08.55	\N	\N	\N	\N	\N	19	\N	CONSTANT_ISSUE	\N	\N	\N	10min	\N	\N	bad-practice	f	HTML
119	Ints and longs should not be shifted by more than their number of bits-1	S2183	S2183	squid	<p>Since an <code>int</code> is a 32-bit variable, shifting by more than (-)31 is confusing at best and an error at worst. Shifting an <code>int</code> by 32 is the same as shifting it by 0, and shifting it by 33 is the same as shifting it by 1.</p>\n\n<p>Similarly, shifting a <code>long</code> by (-)64 is the same as shifting it by 0, and shifting it by 65 is the same as shifting it by 1.</p>\n\n<h2>Noncompliant Code Example</h2>\n<pre>\npublic int shift(int a) {\n  return a << 48;\n}\n</pre>\n\n<h2>Compliant Solution</h2>\n<pre>\npublic int shift(int a) {\n  return a << 16;\n}\n</pre>	3	\N	READY	java	2015-11-20 10:43:08.552	2015-11-20 10:43:08.552	\N	\N	\N	\N	\N	16	\N	CONSTANT_ISSUE	\N	\N	\N	5min	\N	\N	bug	f	HTML
120	Custom serialization method signatures should meet requirements	S2061	S2061	squid	Writers of <code>Serializable</code> classes can choose to let Java's automatic mechanisms handle serialization and deserialization, or they can choose to handle it themselves by implementing specific methods. However, if the signatures of those methods are not exactly what is expected, they will be ignored and the default serialization mechanisms will kick back in. \n\n<h2>Noncompliant Code Example</h2>\n<pre>\npublic class Watermelon implements Serializable {\n  // ...\n  void writeObject(java.io.ObjectOutputStream out)// Noncompliant; not private\n        throws IOException  \n  {...}\n\n  private void readObject(java.io.ObjectInputStream in)\n  {...}\n\n  public void readObjectNoData()  // Noncompliant; not private \n  {...}\n\n  static Object readResolve() throws ObjectStreamException  // Noncompliant; this method may have any access modifier, may not be static\n\n  Watermelon writeReplace() throws ObjectStreamException // Noncompliant; this method may have any access modifier, but must return Object\n  {...}\n} \n</pre>\n\n<h2>Compliant Solution</h2>\n<pre>\npublic class Watermelon implements Serializable {\n  // ...\n  private void writeObject(java.io.ObjectOutputStream out) \n        throws IOException \n  {...}\n\n  private void readObject(java.io.ObjectInputStream in)\n        throws IOException, ClassNotFoundException\n  {...}\n\n  private void readObjectNoData()\n        throws ObjectStreamException\n  {...}\n\n  protected Object readResolve() throws ObjectStreamException\n  {...}\n\n  private Object writeReplace() throws ObjectStreamException\n  {...}\n</pre>	3	\N	READY	java	2015-11-20 10:43:08.562	2015-11-20 10:43:08.562	\N	\N	\N	\N	\N	39	\N	CONSTANT_ISSUE	\N	\N	\N	5min	\N	\N	bug	f	HTML
121	Silly math should not be performed	S2185	S2185	squid	<p>Certain math operations are just silly and should not be performed because their results are predictable.</p>\n<p>In particular, <code>anyValue % 1</code> is silly because it will always return 0.</p>\n<p>Casting a non-floating-point value to floating-point and then passing it to <code>Math.round</code>, <code>Math.ceil</code>, or <code>Math.floor</code> is silly  because the result will always be the original value. </p>\n<p>These operations are silly with any constant value: <code>Math.abs</code>, <code>Math.ceil</code>, <code>Math.floor</code>, <code>Math.rint</code>, <code>Math.round</code>.</p>\n<p>And these oprations are silly with certain constant values:</p>\n<table>\n<tr><th>Operation</th><th>Value</th></tr>\n<tr><td>acos</td><td>0.0 or 1.0</td></tr>\n<tr><td>asin</td><td>0.0 or 1.0</td></tr>\n<tr><td>atan</td><td>0.0 or 1.0</td></tr>\n<tr><td>atan2</td><td>0.0</td></tr>\n<tr><td>cbrt</td><td>0.0 or 1.0</td></tr>\n<tr><td>cos</td><td>0.0</td></tr>\n<tr><td>cosh</td><td>0.0</td></tr>\n<tr><td>exp</td><td>0.0 or 1.0</td></tr>\n<tr><td>expm1</td><td>0.0</td></tr>\n<tr><td>log</td><td>0.0 or 1.0</td></tr>\n<tr><td>log10</td><td>0.0 or 1.0</td></tr>\n<tr><td>sin</td><td>0.0</td></tr>\n<tr><td>sinh</td><td>0.0</td></tr>\n<tr><td>sqrt</td><td>0.0 or 1.0</td></tr>\n<tr><td>tan</td><td>0.0</td></tr>\n<tr><td>tanh</td><td>0.0</td></tr>\n<tr><td>toDegrees</td><td>0.0 or 1.0</td></tr>\n<tr><td>toRadians</td><td>0.0</td></tr>\n</table>\n<h2>Noncompliant Code Example</h2>\n\n<pre>\npublic void doMath(int a)\ndouble floor = Math.floor((double)a); // Noncompliant\ndouble ceiling = Math.ceil(4.2);\ndouble arcTan = Math.atan(0.0);\n</pre>	2	\N	READY	java	2015-11-20 10:43:08.563	2015-11-20 10:43:08.564	\N	\N	\N	\N	\N	43	\N	CONSTANT_ISSUE	\N	\N	\N	15min	\N	\N	clumsy	f	HTML
122	Math operands should be cast before assignment	S2184	S2184	squid	<p>When arithmetic is performed on <code>int</code>s, the result will always be an <code>int</code>. You can assign that result to a <code>long</code>, <code>double</code>, or <code>float</code> with automatic type conversion, but having started as an <code>int</code>, the result will likely not be what you expect. </p>\n<p>For instance, if the result of <code>int</code> division is assigned to a floating-point variable, precision will have been lost before the assignment. Likewise, if the result of multiplication is assigned to a <code>long</code>, it may have already overflowed before the assignment.</p>\n<p>In either case, the result will not be what was expected. Instead, at least one operand should be cast or promoted to the final type before the operation takes place.</p>\n<h2>Noncompliant Code Example</h2>\n\n<pre>\nfloat twoThirds = 2/3; // Noncompliant; int division. Yields 0.0\nlong millisInYear = 1_000*3_600*24*365; // Noncompliant; int multiplication. Yields 1471228928\nlong bigNum = Integer.MAX_VALUE + 2; // Noncompliant. Yields -2147483647\nlong bigNegNum =  Integer.MIN_VALUE-1; //Noncompliant, gives a positive result instead of a negative one. \nDate myDate = new Date(seconds * 1_000); //Noncompliant, won't produce the expected result if seconds &gt; 2_147_483\n...\npublic long compute(int factor){\n  return factor * 10_000;  //Noncompliant, won't produce the expected result if factor &gt; 214_748\n}\n</pre>\n<h2>Compliant Solution</h2>\n\n<pre>\nfloat twoThirds = 2f/3; // 2 promoted to float. Yields 0.6666667\nlong millisInYear = 1_000L*3_600*24*365; // 1000 promoted to long. Yields 31_536_000_000\nlong bigNum = Integer.MAX_VALUE + 2L; // 2 promoted to long. Yields 2_147_483_649\nlong bigNegNum =  Integer.MIN_VALUE-1L; // Yields -2_147_483_649\nDate myDate = new Date(seconds * 1_000L);\n...\npublic long compute(int factor){\n  return factor * 10_000L;\n}\n</pre>\n<p>or</p>\n<pre>\nfloat twoThirds = (float)2/3; // 2 cast to float\nlong millisInYear = (long)1_000*3_600*24*365; // 1_000 cast to long\nlong bigNum = (long)Integer.MAX_VALUE + 2;\nlong bigNegNum =  (long)Integer.MIN_VALUE-1;\nDate myDate = new Date((long)seconds * 1_000);\n...\npublic long compute(long factor){\n  return factor * 10_000;\n}\n</pre>\n<h2>See</h2>\n\n<ul>\n<li> <a href="http://cwe.mitre.org/data/definitions/190">MITRE, CWE-190</a> - Integer Overflow or Wraparound</li>\n<li> <a href="http://www.sans.org/top25-software-errors/">SANS Top 25</a> - Risky Resource Management</li>\n</ul>	2	\N	READY	java	2015-11-20 10:43:08.564	2015-11-20 10:43:08.565	\N	\N	\N	\N	\N	39	\N	CONSTANT_ISSUE	\N	\N	\N	5min	\N	\N	bug,cwe,sans-top25-risky,security	f	HTML
332	Files should contain an empty new line at the end	S00113	S00113	squid	<p>Some tools such as Git work better when files end with an empty line.</p>\n<p>This rule simply generates an issue if it is missing.</p>\n<p>For example, a Git diff looks like this if the empty line is missing at the end of the file:</p>\n<pre>\n+class Test {\n+}\n\\ No newline at end of file\n</pre>	1	\N	READY	java	2015-11-20 10:43:08.846	2015-11-20 10:43:08.846	\N	\N	\N	\N	\N	15	\N	CONSTANT_ISSUE	\N	\N	\N	1min	\N	\N	convention	f	HTML
123	Comparators should be "Serializable"	S2063	S2063	squid	A non-serializable <code>Comparator</code> can prevent an otherwise-<code>Serializable</code> ordered collection from being serializable. Since the overhead to make a <code>Comparator</code> serializable is usually low, doing so can be considered good defensive programming.\n\n<h2>Noncompliant Code Example</h2>\n<pre>\npublic class FruitComparator implements Comparator&lt;Fruit&gt; {  // Noncompliant\n  int compare(Fruit f1, Fruit f2) {...}\n  boolean equals(Object obj) {...}\n}\n</pre>\n\n<h2>Compliant Solution</h2>\n<pre>\npublic class FruitComparator implements Comparator&lt;Fruit&gt;, Serializable {\n  private static final long serialVersionUID = 1;\n\n  int compare(Fruit f1, Fruit f2) {...}\n  boolean equals(Object obj) {...}\n}\n</pre>	2	\N	READY	java	2015-11-20 10:43:08.565	2015-11-20 10:43:08.565	\N	\N	\N	\N	\N	39	\N	CONSTANT_ISSUE	\N	\N	\N	5min	\N	\N	pitfall,serialization	f	HTML
124	Variables should not be self-assigned	S1656	S1656	squid	<p>\n  There is no reason to re-assign a variable to itself.\n  Either this statement is redundant and should be removed,\n  or the re-assignment is a mistake and some other value or variable was intended for the assignment instead.\n</p>\n\n<h2>Noncompliant Code Example</h2>\n<pre>\npublic void setName(String name) {\n  name = name;\n}\n</pre>\n\n<h2>Compliant Solution</h2>\n<pre>\npublic void setName(String name) {\n  this.name = name;\n}\n</pre>\n\n<h2>See</h2>\n<ul>\n  <li><a href="https://www.securecoding.cert.org/confluence/x/NYA5">CERT, MSC12-C</a> - Detect and remove code that has no effect</li>\n  <li><a href="https://www.securecoding.cert.org/confluence/x/SIIyAQ">CERT, MSC12-CPP</a> - Detect and remove code that has no effect</li>\n</ul>	2	\N	READY	java	2015-11-20 10:43:08.566	2015-11-20 10:43:08.566	\N	\N	\N	\N	\N	39	\N	CONSTANT_ISSUE	\N	\N	\N	3min	\N	\N	bug,cert	f	HTML
125	Java parser failure	ParsingError	ParsingError	squid	<p>When the Java parser fails, it is possible to record the failure as a violation on the file. This way, not only it is possible to track the number of files that do not parse but also to easily find out why they do not parse.</p>	2	\N	READY	java	2015-11-20 10:43:08.567	2015-11-20 10:43:08.567	\N	\N	\N	\N	\N	42	\N	CONSTANT_ISSUE	\N	\N	\N	30min	\N	\N	\N	f	HTML
126	Multiple variables should not be declared on the same line	S1659	S1659	squid	<p>Declaring multiple variable on one line is difficult to read.</p>\n<h2>Noncompliant Code Example</h2>\n\n<pre>\nclass MyClass {\n\n  private int a, b;\n\n  public void method(){\n    int c; int d;\n  }\n}\n</pre>\n<h2>Compliant Solution</h2>\n\n<pre>\nclass MyClass {\n\n  private int a;\n  private int b;\n\n  public void method(){\n    int c;\n    int d;\n  }\n}\n</pre>	1	\N	READY	java	2015-11-20 10:43:08.567	2015-11-20 10:43:08.568	\N	\N	\N	\N	\N	42	\N	CONSTANT_ISSUE	\N	\N	\N	2min	\N	\N	convention	f	HTML
127	The Object.finalize() method should not be called	ObjectFinalizeCheck	ObjectFinalizeCheck	squid	<p>According to the official javadoc documentation, this Object.finalize() is called by the garbage collector on an object when garbage collection determines that there are no more references to the object. Calling this method explicitly breaks this contract and so is misleading. </p>\n<h2>Noncompliant Code Example</h2>\n\n<pre>\npublic void dispose() throws Throwable {\n  this.finalize();                       // Noncompliant\n}\n</pre>\n<h2>See</h2>\n\n<ul>\n<li> <a href="http://cwe.mitre.org/data/definitions/586.html">MITRE, CWE-586</a> - Explicit Call to Finalize()</li>\n<li> <a href="https://www.securecoding.cert.org/confluence/x/H4cbAQ">CERT, MET12-J</a> - Do not use finalizers</li>\n</ul>	3	\N	READY	java	2015-11-20 10:43:08.568	2015-11-20 10:43:08.568	\N	\N	\N	\N	\N	38	\N	CONSTANT_ISSUE	\N	\N	\N	20min	\N	\N	cert,cwe,security	f	HTML
128	"Serializable" inner classes of non-serializable classes should be "static"	S2066	S2066	squid	<p>Serializing a non-<code>static</code> inner class will result in an attempt at serializing the outer class as well. If the outer class is not serializable, then serialization will fail, resulting in a runtime error.</p>\n\n<p>Making the inner class <code>static</code> (i.e. "nested") avoids this problem, therefore inner classes should be <code>static</code> if possible. However, you should be aware that there are semantic differences between an inner class and a nested one: \n<ul>\n  <li>an inner class can only be instantiated within the context of an instance of the outer class.</li>\n  <li>a nested (<code>static</code>) class can be instantiated independently of the outer class.</li>\n</ul>\n</p>\n\n<h2>Noncompliant Code Example</h2>\n<pre>\npublic class Pomegranate {\n  // ...\n\n  public class Seed implements Serializable {  // Noncompliant; serialization will fail\n    // ...\n  }\n} \n</pre>\n\n<h2>Compliant Solution</h2>\n<pre>\npublic class Pomegranate {\n  // ...\n\n  public static class Seed implements Serializable {\n    // ...\n  }\n} \n</pre>	3	\N	READY	java	2015-11-20 10:43:08.569	2015-11-20 10:43:08.569	\N	\N	\N	\N	\N	39	\N	CONSTANT_ISSUE	\N	\N	\N	15min	\N	\N	bug,serialization	f	HTML
129	TestCases should contain tests	S2187	S2187	squid	<p>There's no point in having a JUnit <code>TestCase</code> without any test methods. Similarly, you shouldn't have a file in the tests directory with "Test" in the name, but not tests in the file. Doing either of these things may lead someone to think that uncovered classes have been tested.</p>\n<p>This rule raises an issue when files in the test directory have "Test" in the name or implement <code>TestCase</code> but don't contain any tests.</p>	2	\N	READY	java	2015-11-20 10:43:08.569	2015-11-20 10:43:08.571	\N	\N	\N	\N	\N	51	\N	CONSTANT_ISSUE	\N	\N	\N	5min	\N	\N	junit,unused	f	HTML
130	Fields in non-serializable classes should not be "transient"	S2065	S2065	squid	<code>transient</code> is used to mark fields in a <code>Serializable</code> class which will not be written out to file (or stream). In a class that does not implement <code>Serializable</code>, this modifier is simply wasted keystrokes, and should be removed.\n\n<h2>Noncompliant Code Example</h2>\n<pre>\nclass Vegetable {  // does not implement Serializable\n  private transient Season ripe;  // Noncompliant\n  // ...\n}\n</pre>\n\n<h2>Compliant Solution</h2>\n<pre>\nclass Vegetable {\n  private Season ripe;\n  // ...\n}\n</pre>	1	\N	READY	java	2015-11-20 10:43:08.571	2015-11-20 10:43:08.571	\N	\N	\N	\N	\N	15	\N	CONSTANT_ISSUE	\N	\N	\N	2min	\N	\N	serialization,unused	f	HTML
131	JUnit assertions should not be used in "run" methods	S2186	S2186	squid	<p>JUnit assertions should not be made from the <code>run</code> method of a <code>Runnable</code>, because failed assertions result in <code>AssertionError</code>s being thrown. If the error is thrown from a thread other than the one that ran the test, the thread will exit but the test won't fail.</p>\n<h2>Noncompliant Code Example</h2>\n\n<pre>\npublic void run() {\n  // ...\n  Assert.assertEquals(expected, actual);  // Noncompliant\n}\n</pre>	3	\N	READY	java	2015-11-20 10:43:08.572	2015-11-20 10:43:08.572	\N	\N	\N	\N	\N	51	\N	CONSTANT_ISSUE	\N	\N	\N	30min	\N	\N	junit,pitfall	f	HTML
132	Credentials should not be hard-coded	S2068	S2068	squid	<p>Because it is easy to extract strings from a compiled application, credentials should never be hard-coded. Do so, and they're almost guaranteed to end up in the hands of an attacker. This is particularly true for applications that are distributed.</p>\n<p>Credentials should be stored outside of the code in a strongly-protected encrypted configuration file or database.</p>\n<h2>Noncompliant Code Example</h2>\n\n<pre>\nConnection conn = null;\ntry {\n  conn = DriverManager.getConnection("jdbc:mysql://localhost/test?" +\n        "user=steve&amp;password=blue"); // Noncompliant\n  String uname = "steve";\n  String password = "blue";\n  conn = DriverManager.getConnection("jdbc:mysql://localhost/test?" +\n        "user=" + uname + "&amp;password=" + password); // Noncompliant\n</pre>\n<h2>Compliant Solution</h2>\n\n<pre>\nConnection conn = null;\ntry {\n  String uname = getEncryptedUser();\n  String password = getEncryptedPass();\n  conn = DriverManager.getConnection("jdbc:mysql://localhost/test?" +\n        "user=" + uname + "&amp;password=" + password);\n</pre>\n<h2>See</h2>\n\n<ul>\n<li> <a href="http://cwe.mitre.org/data/definitions/798">MITRE, CWE-798</a> - Use of Hard-coded Credentials</li>\n<li> <a href="http://cwe.mitre.org/data/definitions/259">MITRE, CWE-259</a> - Use of Hard-coded Password</li>\n<li> <a href="http://www.sans.org/top25-software-errors/">SANS Top 25</a> - Porous Defenses</li>\n<li> <a href="https://www.owasp.org/index.php/Top_10_2013-A2-Broken_Authentication_and_Session_Management">OWASP Top Ten 2013 Category A2</a> - Broken Authentication and Session Management</li>\n<li> Derived from FindSecBugs rule <a href="http://h3xstream.github.io/find-sec-bugs/bugs.htm#HARD_CODE_PASSWORD">Hard Coded Password</a></li>\n</ul>	3	\N	READY	java	2015-11-20 10:43:08.572	2015-11-20 10:43:08.572	\N	\N	\N	\N	\N	22	\N	CONSTANT_ISSUE	\N	\N	\N	30min	\N	\N	cwe,owasp-a2,sans-top25-porous,security	f	HTML
133	Assignments should not be made from within sub-expressions	AssignmentInSubExpressionCheck	AssignmentInSubExpressionCheck	squid	<p>Assignments within sub-expressions are hard to spot and therefore make the code less readable.</p>\n<p>It is also a common mistake to write <code>=</code> when <code>==</code> was meant.</p>\n<p>Ideally, expressions should not have side-effects.</p>\n<h2>Noncompliant Code Example</h2>\n\n<pre>\ndoSomething(i = 42);\n</pre>\n<h2>Compliant Solution</h2>\n\n<pre>\ni = 42;\ndoSomething(i);   \n</pre>\n<p>or</p>\n<pre>\ndoSomething(i == 42);  // Perhaps in fact the assignment operator was expected\n</pre>\n<h2>Exceptions</h2>\n\n<p>Assignments in <code>while</code> statement conditions, and assignments enclosed in relational expressions are allowed.</p>\n<h2>See</h2>\n\n<ul>\n<li> MISRA C:2004, 13.1 - Assignment operators shall not be used in expressions that yield a Boolean value</li>\n<li> MISRA C++:2008, 6-2-1 - Assignment operators shall not be used in sub-expressions</li>\n<li> MISRA C:2012, 13.4 - The result of of an assignment operator should not be used</li>\n<li> <a href="http://cwe.mitre.org/data/definitions/481.html">MITRE, CWE-481</a> - Assigning instead of Comparing</li>\n</ul>	2	\N	READY	java	2015-11-20 10:43:08.573	2015-11-20 10:43:08.573	\N	\N	\N	\N	\N	42	\N	CONSTANT_ISSUE	\N	\N	\N	5min	\N	\N	bug,cwe,misra	f	HTML
134	JUnit test cases should call super methods	S2188	S2188	squid	<p>Overriding a parent class method prevents that method from being called unless an explicit <code>super</code> call is made in the overriding method. In some cases not calling the <code>super</code> method is acceptable, but not with <code>setUp</code> and <code>tearDown</code> in a JUnit 3 <code>TestCase</code>.</p>\n<h2>Noncompliant Code Example</h2>\n\n<pre>\npublic class MyClassTest extends MyAbstractTestCase {\n\n  private MyClass myClass;\n    @Override\n    protected void setUp() throws Exception {  // Noncompliant\n      myClass = new MyClass();\n    }\n</pre>\n<h2>Compliant Solution</h2>\n\n<pre>\npublic class MyClassTest extends MyAbstractTestCase {\n\n  private MyClass myClass;\n    @Override\n    protected void setUp() throws Exception {\n      super.setUp();\n      myClass = new MyClass();\n    }\n</pre>	3	\N	READY	java	2015-11-20 10:43:08.573	2015-11-20 10:43:08.576	\N	\N	\N	\N	\N	51	\N	CONSTANT_ISSUE	\N	\N	\N	5min	\N	\N	bug,junit	f	HTML
135	The ternary operator should not be used	S1774	S1774	squid	<p>While the ternary operator is pleasingly compact, it's use can make code more difficult to read. It should therefore be avoided in favor of the more verbose <code>if</code>/<code>else</code> structure.</p>\n\n<h2>Noncompliant Code Example</h2>\n<pre>\nSystem.out.println(i>10?"yes":"no");\n</pre>\n\n<h2>Compliant Solution</h2>\n<pre>\nif (i > 10) {\n  System.out.println(("yes");\n} else {\n  System.out.println("no");\n}\n</pre>	2	\N	READY	java	2015-11-20 10:43:08.577	2015-11-20 10:43:08.577	\N	\N	\N	\N	\N	15	\N	CONSTANT_ISSUE	\N	\N	\N	5min	\N	\N	brain-overload	f	HTML
136	"entrySet()" should be iterated when both the key and value are needed	S2864	S2864	squid	<p>When only the keys from a map are needed in a loop, iterating the <code>keySet</code> makes sense. But when both the key and the value are needed, it's more efficient to iterate the <code>entrySet</code>, which will give access to both the key and value, instead.</p>\n\n<h2>Noncompliant Code Example</h2>\n<pre>\npublic void doSomethingWithMap(Map&lt;String,Object&gt; map) {\n  for (String key : map.keySet()) {  // Noncompliant; for each key the value is retrieved\n    Object value = map.get(key);\n    // ...\n  }\n}\n</pre>\n\n<h2>Compliant Solution</h2>\n<pre>\npublic void doSomethingWithMap(Map&lt;String,Object&gt; map) {\n  for (Map.Entry&lt;String,Object&gt; entry : map.entrySet()) {\n    String key = entry.getKey();\n    Object value = entry.getValue();\n    // ...\n  }\n}\n</pre>	2	\N	READY	java	2015-11-20 10:43:08.577	2015-11-20 10:43:08.577	\N	\N	\N	\N	\N	31	\N	CONSTANT_ISSUE	\N	\N	\N	5min	\N	\N	performance	f	HTML
137	Methods should not have too many lines	S138	S138	squid	<p>\nA method that grows too large tends to aggregate too many responsibilities.\nSuch method inevitably become harder to understand and therefore harder to maintain.\n</p>\n\n<p>\nAbove a specific threshold, it is strongly advised to refactor into smaller methods which focus on well-defined tasks.\nThose smaller methods will not only be easier to understand, but also probably easier to test.\n</p>	2	\N	READY	java	2015-11-20 10:43:08.578	2015-11-20 10:43:08.581	\N	\N	\N	\N	\N	16	\N	CONSTANT_ISSUE	\N	\N	\N	20min	\N	\N	brain-overload	f	HTML
138	Public methods should throw at most one checked exception	S1160	S1160	squid	<p>\n  Using checked exceptions forces method callers to deal with errors, either by propagating them or by handling them.\n  This makes those exceptions fully part of the API of the method.\n</p>\n\n<p>\n  To keep the complexity for callers reasonable, methods should not throw more than one kind of checked exception.\n</p>\n\n<h2>Noncompliant Code Example</h2>\n<pre>\npublic void delete() throws IOException, SQLException {      // Noncompliant\n  /* ... */\n}\n</pre>\n\n<h2>Compliant Solution</h2>\n<pre>\npublic void delete() throws SomeApplicationLevelException {\n  /* ... */\n}\n</pre>\n\n<h2>Exceptions</h2>\n<p>\n  Overriding methods are not checked by this rule and are allowed to throw several checked exceptions.\n</p>	2	\N	READY	java	2015-11-20 10:43:08.581	2015-11-20 10:43:08.582	\N	\N	\N	\N	\N	16	\N	CONSTANT_ISSUE	\N	\N	\N	20min	\N	\N	error-handling,security	f	HTML
139	Loops should not contain more than a single "break" or "continue" statement	S135	S135	squid	<p>Restricting the number of <code>break</code> and <code>continue</code> statements in a loop is done in the interest of good structured programming. </p>\n<p>One <code>break</code> and <code>continue</code> statement is acceptable in a loop, since it facilitates optimal coding. If there is more than one, the code should be refactored to increase readability.</p>\n<h2>Noncompliant Code Example</h2>\n\n<pre>\nfor (int i = 1; i &lt;= 10; i++) {     // Noncompliant - 2 continue - one might be tempted to add some logic in between\n  if (i % 2 == 0) {\n    continue;\n  }\n\n  if (i % 3 == 0) {\n    continue;\n  }\n\n  System.out.println("i = " + i);\n}\n</pre>	2	\N	READY	java	2015-11-20 10:43:08.588	2015-11-20 10:43:08.588	\N	\N	\N	\N	\N	16	\N	LINEAR	\N	20min	\N	\N	per extra "break" or "continue" statement	\N	brain-overload	f	HTML
140	"@Override" annotation should be used on any method overriding (since Java 5) or implementing (since Java 6) another one	S1161	S1161	squid	<p>Using the <code>@Override</code> annotation is useful for two reasons :</p>\n<ul>\n  <li>It elicits a warning from the compiler if the annotated method doesn't actually override anything, as in the case of a misspelling.</li>\n  <li>It improves the readability of the source code by making it obvious that methods are overridden.</li>\n</ul>\n<h2>Noncompliant Code Example</h2>\n<pre>\nclass ParentClass {\n  public boolean doSomething(){...}\n}\nclass FirstChildClass extends ParentClass {\n  public boolean doSomething(){...}  // Noncompliant\n}\n</pre>\n\n<h2>Compliant Solution</h2>\n<pre>\nclass ParentClass {\n  public boolean doSomething(){...}\n}\nclass FirstChildClass extends ParentClass {\n  @Override\n  public boolean doSomething(){...}  // Compliant\n}\n</pre>	2	\N	READY	java	2015-11-20 10:43:08.59	2015-11-20 10:43:08.591	\N	\N	\N	\N	\N	16	\N	CONSTANT_ISSUE	\N	\N	\N	5min	\N	\N	bad-practice	f	HTML
141	A "for" loop update clause should move the counter in the right direction	S2251	S2251	squid	A <code>for</code> loop with a counter that moves in the wrong direction is not an infinite loop. Because of wraparound, the loop will eventually reach its stop condition, but in doing so, it will run many, many more times than anticipated, potentially causing unexpected behavior. \n\n<h2>Noncompliant Code Example</h2>\n<pre>\npublic void doSomething(String [] strings) {\n  for (int i = 0; i &lt; strings.length; i--) { // Noncompliant;\n    String string = strings[i];  // ArrayIndexOutOfBoundsException when i reaches -1\n    //...\n  }\n</pre>\n\n<h2>Compliant Solution</h2>\n<pre>\npublic void doSomething(String [] strings) {\n  for (int i = 0; i &lt; strings.length; i++) {\n    String string = strings[i];\n    //...\n  }\n</pre>	4	\N	READY	java	2015-11-20 10:43:08.591	2015-11-20 10:43:08.591	\N	\N	\N	\N	\N	42	\N	CONSTANT_ISSUE	\N	\N	\N	5min	\N	\N	bug	f	HTML
142	Parsing should be used to convert "Strings" to primitives	S2130	S2130	squid	Rather than creating a boxed primitive from a <code>String</code> to extract the primitive value, use the relevant <code>parse</code> method instead. It will be clearer and more efficient.\n\n<h2>Noncompliant Code Example</h2>\n<pre>\nString myNum = "12.2";\n\nfloat f = new Float(myNum).floatValue();  // Noncompliant; creates &amp; discards a Float\n</pre>\n\n<h2>Compliant Solution</h2>\n<pre>\nString myNum = "12.2";\n\nfloat f = Float.parseFloat(myNum);\n</pre>	2	\N	READY	java	2015-11-20 10:43:08.591	2015-11-20 10:43:08.592	\N	\N	\N	\N	\N	29	\N	CONSTANT_ISSUE	\N	\N	\N	5min	\N	\N	performance	f	HTML
143	Annotation arguments should appear in the order in which they were declared	S3340	S3340	squid	<p>For optimal code readability, annotation arguments should be specified in the same order that they were declared in the annotation definition.</p>\n\n<h2>Noncompliant</h2>\n<pre>\n@interface Pet {\nString name();\nString surname();\n}\n\n@Pet(surname ="", name="") // Noncompliant\n</pre>\n\n<h2>Compliant</h2>\n<pre>\n@interface Pet {\nString name();\nString surname();\n}\n\n@Pet(name ="", surname="") // Compliant\n</pre>	1	\N	READY	java	2015-11-20 10:43:08.592	2015-11-20 10:43:08.592	\N	\N	\N	\N	\N	15	\N	CONSTANT_ISSUE	\N	\N	\N	1min	\N	\N	convention	f	HTML
144	Checked Exception should not be thrown	S1162	S1162	squid	<p>The purpose of checked exceptions is to ensure that errors will be dealt with, either by propagating them or by handling them, but some believe that checked exceptions negatively impact the readability of source code, by spreading this error handling/propagation logic everywhere.</p>\n<p>This rule verifies that no method throws a new checked exception.</p>\n<h2>Noncompliant Code Example</h2>\n\n<pre>\npublic void myMethod1() throws CheckedException {\n  ...\n  throw new CheckedException(message);   // Noncompliant\n  ...\n  throw new IllegalArgumentException(message); // Compliant; IllegalArgumentException is unchecked\n}   \n\npublic void myMethod2() throws CheckedException {  // Compliant; propagation allowed\n  myMethod1();\n}\n</pre>	2	\N	READY	java	2015-11-20 10:43:08.603	2015-11-20 10:43:08.603	\N	\N	\N	\N	\N	16	\N	CONSTANT_ISSUE	\N	\N	\N	1h	\N	\N	error-handling,security	f	HTML
145	"ConcurrentLinkedQueue.size()" should not be used	S2250	S2250	squid	<p>For most collections the <code>size()</code> method requires constant time, but the time required to execute <code>ConcurrentLinkedQueue.size()</code> is directly proportional to the number of elements in the queue. When the queue is large, this could therefore be an expensive operation. Further, the results may be inaccurate if the queue is modified during execution.</p>\n\n<p>By the way, if the <code>size()</code> is used only to check that the collection is empty, then the <code>isEmpty()</code> method should be used.</p>\n\n<h2>Noncompliant Code Example</h2>\n<pre>\nConcurrentLinkedQueue queue = new ConcurrentLinkedQueue();\n//...\nlog.info("Queue contains " + queue.size() + " elements");\n</pre>	3	\N	READY	java	2015-11-20 10:43:08.603	2015-11-20 10:43:08.604	\N	\N	\N	\N	\N	31	\N	CONSTANT_ISSUE	\N	\N	\N	15min	\N	\N	performance	f	HTML
146	Literal suffixes should be upper case	S818	S818	squid	<p>Using upper case literal suffixes removes the potential ambiguity between "1" (digit 1) and "l" (letter el) for declaring literals.</p>\n<h2>Noncompliant Code Example</h2>\n\n<pre>\nlong long1 = 1l; // Noncompliant\nfloat float1 = 1.0f; // Noncompliant\ndouble double1 = 1.0d; // Noncompliant\n</pre>\n<h2>Compliant Solution</h2>\n\n<pre>\nlong long1 = 1L;\nfloat float1 = 1.0F;\ndouble double1 = 1.0D;\n</pre>\n<h2>See</h2>\n\n<ul>\n<li> MISRA C++:2008, 2-13-4 - Literal suffixes shall be upper case\n</li><li> MISRA C:2012, 7.3 - The lowercase character "l" shall not be used in a literal suffix\n</li><li> <a href="https://www.securecoding.cert.org/confluence/x/koAtAQ">CERT DCL16-C</a> - Use "L," not "l," to indicate a long value\n</li><li> <a href="https://www.securecoding.cert.org/confluence/x/n4AtAQ">CERT DCL16-CPP</a> - Use "L," not "l," to indicate a long value\n</li></ul>\n<h3>See Also</h3>\n\n<ul>\n<li> {rule:squid:S1129} - Long suffix "L" should be upper case\n</li></ul>	1	\N	READY	java	2015-11-20 10:43:08.604	2015-11-20 10:43:08.604	\N	\N	\N	\N	\N	16	\N	CONSTANT_ISSUE	\N	\N	\N	2min	\N	\N	cert,convention,misra,pitfall	f	HTML
147	Long suffix "L" should be upper case	LowerCaseLongSuffixCheck	LowerCaseLongSuffixCheck	squid	<p>The long suffix should always be written in uppercase, i.e. 'L', as the lowercase 'l' can easily be confused with the digit one '1'.</p>\n<p>The following code:</p>\n<pre>\nlong n = 10l;  // Noncompliant - easily confused with one zero one\n</pre>\n<p>should be refactored into:</p>\n<pre>\nlong n = 10L;  // Compliant\n</pre>	1	\N	READY	java	2015-11-20 10:43:08.605	2015-11-20 10:43:08.605	\N	\N	\N	\N	\N	15	\N	CONSTANT_ISSUE	\N	\N	\N	2min	\N	\N	\N	f	HTML
148	Deprecated elements should have both the annotation and the Javadoc tag	MissingDeprecatedCheck	MissingDeprecatedCheck	squid	<p>Deprecation should be marked with both the <code>@Deprecated</code> annotation and @deprecated Javadoc tag. The annotation enables tools such as IDEs to warn about referencing deprecated elements, and the tag can be used to explain when it was deprecated, why, and how references should be refactored.</p>\n\n<p>The following code illustrates this rule:</p>\n\n<h2>Noncompliant Code Example</h2>\n<pre>\nclass MyClass {\n\n  @Deprecated\n  public void foo1() {\n  }\n\n  /**\n    * @deprecated\n    */\n  public void foo2() {    // Noncompliant\n  }\n\n}\n</pre>\n\n<h2>Compliant Solution</h2>\n<pre>\nclass MyClass {\n\n  /**\n    * @deprecated (when, why, refactoring advice...)\n    */\n  @Deprecated\n  public void foo1() {\n  }\n\n  /**\n    * @deprecated (when, why, refactoring advice...)\n    */\n  @Deprecated\n  public void foo2() {\n  }\n\n}\n</pre>\n\n<h2>Exceptions</h2>\n<p>The members and methods of a deprecated class or interface are ignored by this rule. The classes and interfaces themselves are still subject to it.</p>\n\n<pre>\n/**\n * @deprecated (when, why, etc...)\n */\n@Deprecated\nclass Qix  {\n\n  public void foo() {} // Compliant; class is deprecated\n\n}\n\n/**\n * @deprecated (when, why, etc...)\n */\n@Deprecated\ninterface Plop {\n\n  void bar();\n\n}\n</pre>	2	\N	READY	java	2015-11-20 10:43:08.611	2015-11-20 10:43:08.611	\N	\N	\N	\N	\N	16	\N	CONSTANT_ISSUE	\N	\N	\N	5min	\N	\N	bad-practice	f	HTML
149	Lamdbas containing only one statement should not nest this statement in a block	S1602	S1602	squid	<p>There are two ways to write lambdas that contain single statement, but one is definitely more compact and readable than the other.</p>\n<h2>Noncompliant Code Example</h2>\n\n<pre>\nx -&gt; {System.out.println(x+1);}\n(a, b) -&gt; { return a+b; }\n</pre>\n<h2>Compliant Solution</h2>\n\n<pre>\nx -&gt; System.out.println(x+1)\n(a, b) -&gt; a+b    //For return statement, the return keyword should also be dropped\n</pre>	2	\N	READY	java	2015-11-20 10:43:08.612	2015-11-20 10:43:08.612	\N	\N	\N	\N	\N	15	\N	CONSTANT_ISSUE	\N	\N	\N	5min	\N	\N	java8	f	HTML
240	Unused local variables should be removed	S1481	S1481	squid	<p>If a local variable is declared but not used, it is dead code and should be removed. Doing so will improve maintainability because developers will not wonder what the variable is used for.</p>\n<h2>Noncompliant Code Example</h2>\n\n<pre>\npublic int numberOfMinutes(int hours) {\n  int seconds = 0;   // seconds is never used \n  return hours * 60;\n}\n</pre>\n<h2>Compliant Solution</h2>\n\n<pre>\npublic int numberOfMinutes(int hours) {\n  return hours * 60;\n}\n</pre>	2	\N	READY	java	2015-11-20 10:43:08.746	2015-11-20 10:43:08.747	\N	\N	\N	\N	\N	16	\N	CONSTANT_ISSUE	\N	\N	\N	5min	\N	\N	unused	f	HTML
150	"Object.wait(...)" should never be called on objects that implement "java.util.concurrent.locks.Condition"	S1844	S1844	squid	<p>From the Java API documentation:</p>\n<blockquote>\n<code>Condition</code> factors out the <code>Object</code> monitor methods (<code>wait</code>, <code>notify</code> and <code>notifyAll</code>) into distinct objects to give the effect of having multiple wait-sets per object, by combining them with the use of arbitrary Lock implementations. Where a <code>Lock</code> replaces the use of <code>synchronized</code> methods and statements, a <code>Condition</code> replaces the use of the <code>Object</code> monitor methods.\n</blockquote>\n\nThe purpose of implementing the <code>Condition</code> interface is to gain access to its more nuanced <code>await</code> methods. Therefore, calling the method <code>Object.wait(...)</code> on a class implementing the <code>Condition</code> interface is silly and confusing.\n\n<h2>Noncompliant Code Example</h2>\n\n<pre>\nfinal Lock lock = new ReentrantLock();\nfinal Condition notFull  = lock.newCondition();\n...\nnotFull.wait();\n</pre>\n\n<h2>Compliant Solution</h2>\n<pre>\nfinal Lock lock = new ReentrantLock();\nfinal Condition notFull  = lock.newCondition();\n...\nnotFull.await();\n</pre>	4	\N	READY	java	2015-11-20 10:43:08.612	2015-11-20 10:43:08.613	\N	\N	\N	\N	\N	46	\N	CONSTANT_ISSUE	\N	\N	\N	20min	\N	\N	bug,pitfall	f	HTML
151	Deprecated classes and interfaces should not be extended/implemented	S1724	S1724	squid	<p>Deprecated classes and interfaces should be avoided, rather than used, inherited or extended. Deprecation is a warning that the class or interface has been superseded, and will eventually be removed. The deprecation period allows you to make a smooth transition away from the aging, soon-to-be-retired technology.</p>\n\n<h2>Noncompliant Code Example</h2>\n<pre>\n/**\n* @deprecated  As of release 1.3, replaced by {@link #Fee}\n*/@Deprecated\nclass Foo { ... }\n\nclass Bar extends Foo { ... }\n</pre>\n\n<h2>Compliant Solution</h2>\n<pre>\nclass Bar extends Fee { ... }\n</pre>\n\n<h2>Exception</h2>\n<p>When the class that extends a deprecated class is itself deprecated, the extending class will be ignored.</p>\n<pre>\n@Deprecated\nclass Bar extends Foo { ... } // compliant Bar is deprecated.\n</pre>\n\n  <h2>See</h2>\n    <ul>\n      <li><a href="http://cwe.mitre.org/data/definitions/477.html">MITRE, CWE-477</a> - Use of Obsolete Functions</li>\n    </ul>	2	\N	READY	java	2015-11-20 10:43:08.613	2015-11-20 10:43:08.613	\N	\N	\N	\N	\N	38	\N	CONSTANT_ISSUE	\N	\N	\N	30min	\N	\N	cwe,obsolete	f	HTML
157	An open curly brace should be located at the end of a line	LeftCurlyBraceEndLineCheck	LeftCurlyBraceEndLineCheck	squid	<p>Sharing some coding conventions is a key point to make it possible for a team to efficiently collaborate. This rule make it mandatory to place open curly braces at the end of lines of code.</p>\n<h2>Noncompliant Code Example</h2>\n\n<pre>\nif(condition)\n{\n  doSomething();\n}\n</pre>\n<h2>Compliant Solution</h2>\n\n<pre>\nif(condition) {\n  doSomething();\n}\n</pre>\n<h2>Exceptions</h2>\n\n<p>When blocks are inlined (left and right curly braces on the same line), no issue is triggered. </p>\n<pre>\nif(condition) {doSomething();} \n</pre>	1	\N	READY	java	2015-11-20 10:43:08.616	2015-11-20 10:43:08.616	\N	\N	\N	\N	\N	15	\N	CONSTANT_ISSUE	\N	\N	\N	1min	\N	\N	convention	f	HTML
152	Methods and field names should not be the same or differ only by capitalization	S1845	S1845	squid	<p>Looking at the set of methods in a class, including superclass methods, and finding two methods or fields that differ only by capitalization is confusing to users of the class. It is similarly confusing to have a method and a field which differ only in capitalization or a method and a field with exactly the same name and visibility.</p>\n<p>In the case of methods, it may have been a mistake on the part of the original developer, who intended to override a superclass method, but instead added a new method with nearly the same name.</p>\n<p>Otherwise, this situation simply indicates poor naming. Method names should be action-oriented, and thus contain a verb, which is unlikely in the case where both a method and a member have the same name (with or without capitalization differences). However, renaming a public method could be disruptive to callers. Therefore renaming the member is the recommended action.</p>\n<h2>Noncompliant Code Example</h2>\n\n<pre>\npublic class Car{\n\n  public DriveTrain drive;\n\n  public void tearDown(){...}\n\n  public void drive() {...}  // Noncompliant; duplicates field name\n}\n\npublic class MyCar extends Car{\n  public void teardown(){...}  // Noncompliant; not an override. It it really what's intended?\n\n  public void drivefast(){...} \n\n  public void driveFast(){...} //Huh?\n}\n</pre>\n<h2>Compliant Solution</h2>\n\n<pre>\npublic class Car{\n\n  private DriveTrain drive;\n\n  public void tearDown(){...}\n\n  public void drive() {...}  // field visibility reduced\n}\n\npublic class MyCar extends Car{\n  @Override\n  public void tearDown(){...}\n\n  public void drivefast(){...} \n\n  public void driveReallyFast(){...}\n\n}\n</pre>	2	\N	READY	java	2015-11-20 10:43:08.613	2015-11-20 10:43:08.614	\N	\N	\N	\N	\N	16	\N	CONSTANT_ISSUE	\N	\N	\N	10min	\N	\N	confusing	f	HTML
153	Anonymous inner classes containing only one method should become lambdas	S1604	S1604	squid	<p>Before Java 8, the only way to partially support closures in Java was by using anonymous inner classes. But the syntax of anonymous classes may seem unwieldy and unclear.</p>\n\n<p>With Java 8, most uses of anonymous inner classes should be replaced by lambdas to highly increase the readability of the source code.</p>\n\n<h2>Noncompliant Code Example</h2>\n<pre>\nmyCollection.map(new Mapper<String,String>() {\n  public String map(String input) {\n    return new StringBuilder(input).reverse().toString();\n  }\n});\n</pre>\n\n<h2>Compliant Solution</h2>\n<pre>\nmyCollection.map(element -> new StringBuilder(element).reverse().toString());\n</pre>	2	\N	READY	java	2015-11-20 10:43:08.614	2015-11-20 10:43:08.614	\N	\N	\N	\N	\N	15	\N	CONSTANT_ISSUE	\N	\N	\N	5min	\N	\N	java8	f	HTML
154	Objects should not be created to be dropped immediately without being used	S1848	S1848	squid	There is no good reason to create a new object to not do anything with it. Most of the time, this is due to a missing piece of code and so could lead to an unexpected behavior in production.\n\n<h2>Noncompliant Code Example</h2>\n<pre>\nif (x &lt; 0)\n  new IllegalArgumentException("x must be nonnegative");\n</pre>\n\n<h2>Compliant Solution</h2>\n<pre>\nif (x &lt; 0)\n  throw new IllegalArgumentException("x must be nonnegative");\n</pre>	3	\N	READY	java	2015-11-20 10:43:08.614	2015-11-20 10:43:08.615	\N	\N	\N	\N	\N	42	\N	CONSTANT_ISSUE	\N	\N	\N	5min	\N	\N	bug,unused	f	HTML
155	"Iterator.hasNext()" should not call "Iterator.next()"	S1849	S1849	squid	Calling <code>Iterator.hasNext()</code> is not supposed to have any side effects, and therefore should not change the state of the iterator. <code>Iterator.next()</code> advances the iterator by one item. So calling it inside <code>Iterator.hasNext()</code>, breaks the <code>hasNext()</code> contract, and will lead to unexpected behavior in production.\n\n<h2>Noncompliant Code Example</h2>\n<pre>\npublic class FibonacciIterator implements Iterator&lt;Integer&gt;{\n...\n@Override\npublic boolean hasNext() {\n  if(next() != null) {\n    return true;\n  }\n  return false;\n}\n...\n}\n</pre>	4	\N	READY	java	2015-11-20 10:43:08.615	2015-11-20 10:43:08.615	\N	\N	\N	\N	\N	38	\N	CONSTANT_ISSUE	\N	\N	\N	20min	\N	\N	bug	f	HTML
156	Skipped unit tests should be either removed or fixed	S1607	S1607	squid	Skipped unit tests are considered as dead code. Either they should be activated again (and updated) or they should be removed.	2	\N	READY	java	2015-11-20 10:43:08.616	2015-11-20 10:43:08.616	\N	\N	\N	\N	\N	51	\N	CONSTANT_ISSUE	\N	\N	\N	10min	\N	\N	pitfall	f	HTML
158	Exceptions should not be thrown in finally blocks	S1163	S1163	squid	<p>\nThrowing an exception from within a finally block will mask any exception which was previously thrown in the <code>try</code> or <code>catch</code> block.\nThe masked's exception message and stack trace will be lost.\n</p>\n\n<p>The following code:</p>\n\n<pre>\ntry {\n  /* some work which end up throwing an exception */\n  throw new IllegalArgumentException();\n} finally {\n  /* clean up */\n  throw new RuntimeException();                          // Noncompliant - will mask the IllegalArgumentException\n}\n</pre>\n\n<p>should be refactored into:</p>\n\n<pre>\ntry {\n  /* some work which end up throwing an exception */\n  throw new IllegalArgumentException();\n} finally {\n  /* clean up */                                         // Compliant\n}\n</pre>	2	\N	READY	java	2015-11-20 10:43:08.617	2015-11-20 10:43:08.617	\N	\N	\N	\N	\N	16	\N	CONSTANT_ISSUE	\N	\N	\N	30min	\N	\N	error-handling,security	f	HTML
159	Disallowed methods should not be used	S2253	S2253	squid	<p>This rule allows banning certain methods.</p>\n<h2>Noncompliant Code Example</h2>\n<p>Given parameters:</p>\n<ul>\n<li> className:java.lang.String</li>\n<li> methodName: replace</li>\n<li> argumentTypes: java.lang.CharSequence, java.lang.CharSequence</li>\n</ul>\n\n<pre>\nString name;\nname.replace("A","a");  // Noncompliant\n</pre>	2	\N	READY	java	2015-11-20 10:43:08.618	2015-11-20 10:43:08.618	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	t	HTML
160	Loop conditions should be true at least once	S2252	S2252	squid	If a <code>for</code> loop's condition is false before the first loop iteration, the loop will never be executed. Such loops are almost always bugs, particularly when the initial value and stop conditions are hard-coded.\n\n<h2>Noncompliant Code Example</h2>\n<pre>\nfor (int i = 10; i &lt; 10; i++) {  // Noncompliant \n  // ...\n</pre>	3	\N	READY	java	2015-11-20 10:43:08.619	2015-11-20 10:43:08.619	\N	\N	\N	\N	\N	43	\N	CONSTANT_ISSUE	\N	\N	\N	10min	\N	\N	bug	f	HTML
161	Primitives should not be boxed just for "String" conversion	S2131	S2131	squid	<p>"Boxing" is the process of putting a primitive value into a primitive-wrapper object. When that's done purely to use the wrapper class' <code>toString</code> method, it's a waste of memory and cycles because those methods are <code>static</code>, and can therefore be used without a class instance. Similarly, using the <code>static</code> method <code>valueOf</code> in the primitive-wrapper classes with a non-<code>String</code> argument should be avoided, as should concatenating empty string <code>""</code> to a primitive.</p>\n<h2>Noncompliant Code Example</h2>\n\n<pre>\nint myInt = 4;\nString myIntString = new Integer(myInt).toString(); // Noncompliant; creates &amp; discards an Integer object\nmyIntString = Integer.valueOf(myInt).toString(); // Noncompliant\nmyIntString = 4 + "";  // Noncompliant\n</pre>\n<h2>Compliant Solution</h2>\n\n<pre>\nint myInt = 4;\nString myIntString = Integer.toString(myInt);\n</pre>	2	\N	READY	java	2015-11-20 10:43:08.619	2015-11-20 10:43:08.619	\N	\N	\N	\N	\N	29	\N	CONSTANT_ISSUE	\N	\N	\N	5min	\N	\N	performance	f	HTML
162	Exception classes should be immutable	S1165	S1165	squid	<p>Exceptions are meant to represent the application's state at which an error occurred.</p>\n<p>Making all fields final ensures that this state:</p>\n<ul>\n<li> Will be fully defined at the same time the exception is instantiated.</li>\n<li> Won't be updated or corrupted by some bogus error handler.</li>\n</ul>\n<p>This will enable developers to quickly understand what went wrong.</p>\n<p>The following code:</p>\n<pre>\npublic class MyException extends Exception {\n\n  private int status;                               // Noncompliant\n\n  public MyException(String message) {\n    super(message);\n  }\n\n  public int getStatus() {\n    return status;\n  }\n\n  public void setStatus(int status) {\n    this.status = status;\n  }\n\n}\n</pre>\n<p>should be refactored into:</p>\n<pre>\npublic class MyException extends Exception {\n\n  private final int status;                         // Compliant\n\n  public MyException(String message, int status) {\n    super(message);\n    this.status = status;\n  }\n\n  public int getStatus() {\n    return status;\n  }\n\n}\n</pre>	2	\N	READY	java	2015-11-20 10:43:08.62	2015-11-20 10:43:08.62	\N	\N	\N	\N	\N	40	\N	CONSTANT_ISSUE	\N	\N	\N	15min	\N	\N	error-handling,security	f	HTML
163	Classes extending java.lang.Thread should override the "run" method	S2134	S2134	squid	<p>According to the Java API documentation:</p>\n<blockquote>\nThere are two ways to create a new thread of execution. One is to declare a class to be a subclass of Thread. This subclass should override the run method of class Thread. An instance of the subclass can then be allocated and started...\nThe other way to create a thread is to declare a class that implements the Runnable interface. That class then implements the run method. An instance of the class can then be allocated, passed as an argument when creating Thread, and started.\n</blockquote>\n\n<p>By definition, extending the Thread class without overriding the <code>run</code> method doesn't make sense, and implies that the contract of the <code>Thread</code> class is not well understood.</p>\n\n<h2>Noncompliant Code Example</h2>\n<pre>\npublic class MyRunner extends Thread { // Noncompliant; run method not overridden\n\n  public void doSometing() {...}\n}\n</pre>	2	\N	READY	java	2015-11-20 10:43:08.62	2015-11-20 10:43:08.62	\N	\N	\N	\N	\N	16	\N	CONSTANT_ISSUE	\N	\N	\N	5min	\N	\N	multi-threading,pitfall	f	HTML
164	Exception handlers should preserve the original exception	S1166	S1166	squid	<p>When handling a caught exception, the original exception's message and stack trace should be logged or passed forward.</p>\n<h2>Noncompliant Code Example</h2>\n\n<pre>\n // Noncompliant - exception is lost\ntry { /* ... */ } catch (Exception e) { LOGGER.info("context"); }   \n\n// Noncompliant - exception is lost (only message is preserved)       \ntry { /* ... */ } catch (Exception e) { LOGGER.info(e.getMessage()); }   \n\n// Noncompliant - exception is lost \ntry { /* ... */ } catch (Exception e) { throw new RuntimeException("context"); }\n</pre>\n<h2>Compliant Solution</h2>\n\n<pre>\ntry { /* ... */ } catch (Exception e) { LOGGER.info(e); }   \n\ntry { /* ... */ } catch (Exception e) { throw new RuntimeException(e); }\n\ntry {\n  /* ... */\n} catch (RuntimeException e) {\n  doSomething();\n  throw e;\n} catch (Exception e) {\n  // Conversion into unchecked exception is also allowed\n  throw new RuntimeException(e);\n}\n</pre>\n<h2>Exceptions</h2>\n\n<p><code>InterruptedException</code>, <code>NumberFormatException</code>, <code>ParseException</code> and <code>MalformedURLException</code> exceptions are arguably used to indicate nonexceptional outcomes.</p>\n<p>Because they are part of Java, developers have no choice but to deal with them. This rule does not verify that those particular exceptions are correctly handled.</p>\n<pre>\nint myInteger;\ntry {\n  myInteger = Integer.parseInt(myString);\n} catch (NumberFormatException e) {\n  // It is perfectly acceptable to not handle "e" here\n  myInteger = 0;\n}\n\n</pre>	3	\N	READY	java	2015-11-20 10:43:08.628	2015-11-20 10:43:08.628	\N	\N	\N	\N	\N	40	\N	CONSTANT_ISSUE	\N	\N	\N	10min	\N	\N	error-handling,security	f	HTML
171	Class names should comply with a naming convention	S00101	S00101	squid	<p>Sharing some naming conventions is a key point to make it possible for a team to efficiently collaborate. This rule allows to check that all class names match a provided regular expression.</p>\n<h2>Noncompliant Code Example</h2>\n\n<p>With default provided regular expression <code>^[A-Z][a-zA-Z0-9]*$</code>:</p>\n<pre>\nclass my_class {...}\n</pre>\n<h2>Compliant Solution</h2>\n\n<pre>\nclass MyClass {...}\n</pre>	1	\N	READY	java	2015-11-20 10:43:08.642	2015-11-20 10:43:08.643	\N	\N	\N	\N	\N	15	\N	CONSTANT_ISSUE	\N	\N	\N	5min	\N	\N	convention	f	HTML
165	"HttpServletRequest.getRequestedSessionId()" should not be used	S2254	S2254	squid	<p>According to the Oracle Java API, the <code>HttpServletRequest.getRequestedSessionId()</code> method:</p>\n<blockquote>\n<p>Returns the session ID specified by the client. This may not be the same as the ID of the current valid session for this request. If the client did not specify a session ID, this method returns null.</p>\n</blockquote>\n<p>The session ID it returns is either transmitted in a cookie or a URL parameter so by definition, nothing prevents the end-user from manually updating the value of this session ID in the HTTP request. </p>\n<p>Here is an example of a updated HTTP header:</p>\n<pre>\nGET /pageSomeWhere HTTP/1.1\nHost: webSite.com\nUser-Agent: Mozilla/5.0\nCookie: JSESSIONID=Hacked_Session_Value'''"&gt;\n</pre>\n<p>Due to the ability of the end-user to manually change the value, the session ID in the request should only be used by a servlet container (E.G. Tomcat or Jetty) to see if the value matches the ID of an an existing session. If it does not, the user should be considered  unauthenticated. Moreover, this session ID should never be logged to prevent hijacking of active sessions.</p>\n<h2>Noncompliant Code Example</h2>\n\n<pre>\nif(isActiveSession(request.getRequestedSessionId()) ){\n  ...\n}\n</pre>\n<h2>See</h2>\n\n<ul>\n<li> <a href="https://www.owasp.org/index.php/Top_10_2013-A2-Broken_Authentication_and_Session_Management">OWASP Top Ten 2013 Category A2</a> - Broken Authentication and Session Management</li>\n<li> Derived from FindSecBugs rule <a href="http://h3xstream.github.io/find-sec-bugs/bugs.htm#SERVLET_SESSION_ID">Untrusted Session Cookie Value</a></li>\n</ul>	3	\N	READY	java	2015-11-20 10:43:08.629	2015-11-20 10:43:08.63	\N	\N	\N	\N	\N	22	\N	CONSTANT_ISSUE	\N	\N	\N	10min	\N	\N	cwe,owasp-a2,sans-top25-porous,security	f	HTML
166	Objects should not be created only to "getClass"	S2133	S2133	squid	<p>Creating an object for the sole purpose of calling <code>getClass</code> on it is a waste of memory and cycles. Instead, simply use the class' <code>.class</code> property.</p>\n\n<h2>Noncompliant Code Example</h2>\n<pre>\nMyObject myOb = new MyObject();  // Noncompliant\nClass c = myOb.getClass(); \n</pre>\n\n<h2>Compliant Solution</h2>\n<pre>\nClass c = MyObject.class; \n</pre>	2	\N	READY	java	2015-11-20 10:43:08.63	2015-11-20 10:43:08.63	\N	\N	\N	\N	\N	29	\N	CONSTANT_ISSUE	\N	\N	\N	5min	\N	\N	performance	f	HTML
167	Only standard cryptographic algorithms should be used	S2257	S2257	squid	<p>The use of a non-standard algorithm is dangerous because a determined attacker may be able to break the algorithm and compromise whatever data has been protected. Standard algorithms like <code>SHA-256</code>, <code>SHA-384</code>, <code>SHA-512</code>, ... should be used instead.</p>\n<p>This rule tracks creation of <code>java.security.MessageDigest</code> subclasses.</p>\n<h2>Noncompliant Code Example</h2>\n\n<pre>\nMyCryptographicAlgorithm extends MessageDigest {\n  ...\n}\n</pre>\n<h2>See</h2>\n\n<ul>\n<li> <a href="http://cwe.mitre.org/data/definitions/327.html">CWE-327</a> - Use of a Broken or Risky Cryptographic Algorithm</li>\n<li> <a href="https://www.owasp.org/index.php/Top_10_2013-A6-Sensitive_Data_Exposure">OWASP Top Ten 2013 Category A6</a> - Sensitive Data Exposure</li>\n<li> <a href="http://www.sans.org/top25-software-errors/">SANS Top 25</a> - Porous Defenses</li>\n<li> Derived from FindSecBugs rule <a href="http://h3xstream.github.io/find-sec-bugs/bugs.htm#CUSTOM_MESSAGE_DIGEST">MessageDigest is Custom</a></li>\n</ul>	4	\N	READY	java	2015-11-20 10:43:08.631	2015-11-20 10:43:08.631	\N	\N	\N	\N	\N	22	\N	CONSTANT_ISSUE	\N	\N	\N	1d	\N	\N	cwe,owasp-a6,sans-top25-porous,security	f	HTML
176	"switch case" clauses should not have too many lines	S1151	S1151	squid	<p>\n  The <code>switch</code> statement should be used only to clearly define some new branches in the control flow.\n  As soon as a <code>case</code> clause contains too many statements this highly decreases the readability\n  of the overall control flow statement. In such case, the content of <code>case</code> clause should\n  be extracted in a dedicated method.\n</p>\n\n<h2>Noncompliant Code Example</h2>\n<p>With the default threshold of 5:</p>\n<pre>\nswitch (myVariable) {\n  case 0: // 6 lines till next case\n    methodCall1("");\n    methodCall2("");\n    methodCall3("");\n    methodCall4("");\n    break;\n  case 1:\n  ...\n}\n</pre> \n\n<h2>Compliant Solution</h2>\n<pre>\nswitch (myVariable) {\n  case 0:                  \n    doSomething()\n    break;\n  case 1:\n  ...\n}\n...\nprivate void doSomething(){\n    methodCall1("");\n    methodCall2("");\n    methodCall3("");\n    methodCall4("");\n}\n</pre>	2	\N	READY	java	2015-11-20 10:43:08.662	2015-11-20 10:43:08.662	\N	\N	\N	\N	\N	15	\N	CONSTANT_ISSUE	\N	\N	\N	5min	\N	\N	brain-overload	f	HTML
168	Empty arrays and collections should be returned instead of null	S1168	S1168	squid	<p>Returning <code>null</code> instead of an actual array or collection forces callers of the method to explicitly test for nullity, making them more complex and less readable.</p>\n<p>Moreover, in many cases, <code>null</code> is used as a synonym for empty.</p>\n<p>The following code: </p>\n<pre>\npublic static Result[] getResults() {\n  return null;                             // Noncompliant\n}\n\npublic static void main(String[] args) {\n  Result[] results = getResults();\n  \n  if (results != null) {                   // Nullity test required to prevent NPE\n    for (Result result: results) {\n      /* ... */\n    }\n  }\n}\n</pre>\n<p>should be refactored into:</p>\n<pre>\npublic static Result[] getResults() {\n  return new Result[0];                    // Compliant\n}\n\npublic static void main(String[] args) {\n  for (Result result: getResults()) {\n    /* ... */\n  }\n}\n</pre>\n<p>This rule also applies to collections:</p>\n<pre>\npublic static List&lt;Result&gt; getResults() {\n  return null;                             // Noncompliant\n}\n</pre>\n<p>should be refactored into:</p>\n<pre>\npublic static List&lt;Result&gt; getResults() {\n  return Collections.emptyList();          // Compliant\n}\n</pre>\n<h2>See</h2>\n\n<ul>\n<li> <a href="https://www.securecoding.cert.org/confluence/x/AgG7AQ">CERT, MSC19-C</a> - For functions that return an array, prefer returning an empty array over a null value</li>\n</ul>	2	\N	READY	java	2015-11-20 10:43:08.631	2015-11-20 10:43:08.636	\N	\N	\N	\N	\N	16	\N	CONSTANT_ISSUE	\N	\N	\N	30min	\N	\N	cert	f	HTML
169	Null pointers should not be dereferenced	S2259	S2259	squid	<p>\nA reference to <code>null</code> should never be dereferenced/accessed.\nDoing so will cause a <code>NullPointerException</code> to be thrown. At best, such an exception will cause abrupt program termination.\nAt worst, it could expose debugging information that would be useful to an attacker, or it could allow an attacker to bypass security measures.\n</p>\n\n<p>\nNote that when they are present, this rule takes advantage of <code>@CheckForNull</code> and <code>@Nonnull</code> annotations defined in\n<a href="https://jcp.org/en/jsr/detail?id=305">JSR-305</a> to understand which values are or are not nullable.\n</p>\n\n<p>\n@Nullable denotes that, under some unspecified circumstances, the value might be null. To keep false positives low, this annotation is ignored.\nWhether an explicit test is required or not is left to the developer's discretion.\n</p>\n\n<h2>Noncompliant Code Example</h2>\n<pre>\n@CheckForNull\nString getName() {...}\n\npublic boolean isNameEmpty() {\n  return getName().length() == 0; // Noncompliant; the result of getName() could be null, but isn't null-checked\n}\n</pre>\n\n<pre>\nConnection conn = null;\nStatement stmt = null;\ntry {\n  conn = DriverManager.getConnection(DB_URL,USER,PASS);\n  stmt = conn.createStatement();\n  // ...\n\n} catch(Exception e) {\n  e.printStackTrace();\n} finally {\n  stmt.close(); // Noncompliant; stmt could be null if an exception was thrown in the try{} block\n  conn.close(); // Noncompliant; conn could be null if an exception was thrown\n}\n</pre>\n\n<pre>\nprivate void merge(@Nonnull Color firstColor, @Nonnull Color secondColor){...}\n\npublic void append(@CheckForNull Color color) {\n    merge(currentColor, color); // Noncompliant; color should be null-checked because merge(...) doesn't accept nullable parameters\n}\n</pre>\n\n<pre>\nvoid paint(Color color) {\n  if(color == null) {\n    System.out.println("Unable to apply color " + color.toString()); // Noncompliant; NullPointerException will be thrown\n    return;\n  }\n  ...\n}\n</pre>\n\n<h2>See</h2>\n<ul>\n   <li><a href="http://cwe.mitre.org/data/definitions/476.html">MITRE, CWE-476</a> - NULL Pointer Dereference</li>\n   <li><a href="https://www.securecoding.cert.org/confluence/x/PAw">CERT, EXP34-C</a> - Do not dereference null pointers</li>\n   <li><a href="https://www.securecoding.cert.org/confluence/x/ZwDOAQ">CERT, EXP01-J</a> - Never dereference null pointers</li>\n   <li><a href="https://www.owasp.org/index.php/Top_10_2013-A1-Injection">OWASP Top Ten 2013 Category A1</a> - Injection</li>\n   <li><a href="https://www.owasp.org/index.php/Top_10_2013-A2-Broken_Authentication_and_Session_Management">OWASP Top Ten 2013 Category A2</a> - Broken Authentication and Session Management</li>\n   <li><a href="https://www.owasp.org/index.php/Top_10_2013-A6-Sensitive_Data_Exposure">OWASP Top Ten 2013 Category A6</a> - Sensitive Data Exposure</li>\n</ul>	4	\N	READY	java	2015-11-20 10:43:08.637	2015-11-20 10:43:08.638	\N	\N	\N	\N	\N	43	\N	CONSTANT_ISSUE	\N	\N	\N	10min	\N	\N	bug,cert,cwe,owasp-a1,owasp-a2,owasp-a6,security	f	HTML
170	"javax.crypto.NullCipher" should not be used for anything other than testing	S2258	S2258	squid	<p>By contract, the <code>NullCipher</code> class provides an "identity cipher" -- one that does not transform or encrypt the plaintext in any way. As a consequence, the ciphertext is identical to the plaintext. So this class should be used for testing, and never in production code.</p>\n<h2>Noncompliant Code Example</h2>\n\n<pre>\nNullCipher nc=new NullCipher();\n</pre>\n<h2>See</h2>\n\n<ul>\n<li> <a href="http://cwe.mitre.org/data/definitions/327.html">CWE-327</a>: Use of a Broken or Risky Cryptographic Algorithm</li>\n<li> <a href="https://www.owasp.org/index.php/Top_10_2013-A6-Sensitive_Data_Exposure">OWASP Top Ten 2013 Category A6</a> - Sensitive Data Exposure</li>\n<li> Derived from FindSecBugs rule <a href="http://h3xstream.github.io/find-sec-bugs/bugs.htm#NULL_CIPHER">NullCipher Unsafe</a></li>\n</ul>	4	\N	READY	java	2015-11-20 10:43:08.638	2015-11-20 10:43:08.639	\N	\N	\N	\N	\N	22	\N	CONSTANT_ISSUE	\N	\N	\N	15min	\N	\N	cwe,owasp-a6,security	f	HTML
172	Switch cases should end with an unconditional "break" statement	S128	S128	squid	<p>\n  When the execution is not explicitly terminated at the end of a switch case,\n  it continues to execute the statements of the following case. While this is sometimes intentional,\n  it often is a mistake which leads to unexpected behavior.\n</p>\n\n<h2>Noncompliant Code Example</h2>\n<pre>\nswitch (myVariable) {\n  case 1:                              \n    foo();\n    break;\n  case 2:  // Both 'doSomething()' and 'doSomethingElse()' will be executed. Is it on purpose ?\n    doSomething();\n  default:                               \n    doSomethingElse();\n    break;\n}\n</pre>\n\n<h2>Compliant Solution</h2>\n<pre>\nswitch (myVariable) {\n  case 1:                              \n    foo();\n    break;\n  case 2: \n    doSomething();\n    break;\n  default:                               \n    doSomethingElse();\n    break;\n}\n</pre>\n\n<h2>Exceptions</h2>\n<p>This rule is relaxed in the following cases:</p>\n<pre>\nswitch (myVariable) {\n  case 0:                                // Empty case used to specify the same behavior for a group of cases.\n  case 1:                               \n    doSomething();\n    break;\n  case 2:                                // Use of return statement\n    return;\n  case 3:                                // Use of throw statement\n    throw new IllegalStateException();\n  default:                               // For the last case, use of break statement is optional\n    doSomethingElse();\n}\n</pre>\n\n<h2>See</h2>\n<ul>\n  <li>MISRA C:2004, 15.0 - The MISRA C <em>switch</em> syntax shall be used.</li>\n  <li>MISRA C:2004, 15.2 - An unconditional break statement shall terminate every non-empty switch clause</li>\n  <li>MISRA C++:2008, 6-4-3 - A switch statement shall be a well-formed switch statement.</li>\n  <li>MISRA C++:2008, 6-4-5 - An unconditional throw or break statement shall terminate every non-empty switch-clause</li>\n  <li>MISRA C:2012, 16.1 - All switch statements shall be well-formed</li>\n  <li>MISRA C:2012, 16.3 - An unconditional break statement shall terminate every switch-clause</li>\n  <li><a href="http://cwe.mitre.org/data/definitions/484.html">MITRE, CWE-484</a> - Omitted Break Statement in Switch</li>\n  <li><a href="https://www.securecoding.cert.org/confluence/x/YIFLAQ">CERT, MSC17-C</a> - Finish every set of statements associated with a case label with a break statement</li>\n  <li><a href="https://www.securecoding.cert.org/confluence/x/ZoFLAQ">CERT, MSC18-CPP</a> - Finish every set of statements associated with a case label with a break statement</li>\n</ul>	3	\N	READY	java	2015-11-20 10:43:08.644	2015-11-20 10:43:08.644	\N	\N	\N	\N	\N	43	\N	CONSTANT_ISSUE	\N	\N	\N	10min	\N	\N	cert,cwe,misra,pitfall	f	HTML
173	Method names should comply with a naming convention	S00100	S00100	squid	<p>Shared naming conventions allow teams to collaborate efficiently. This rule checks that all method names match a provided regular expression.</p>\n<h2>Noncompliant Code Example</h2>\n\n<p>With default provided regular expression <code>^[a-z][a-zA-Z0-9]*$</code>:</p>\n<pre>\npublic int DoSomething(){...}\n</pre>\n<h2>Compliant Solution</h2>\n\n<pre>\npublic int doSomething(){...}\n</pre>\n<h2>Exceptions</h2>\n\n<p>Overriding methods are excluded. </p>\n<pre>\n@Override\npublic int Do_Something(){...}\n</pre>	1	\N	READY	java	2015-11-20 10:43:08.644	2015-11-20 10:43:08.646	\N	\N	\N	\N	\N	15	\N	CONSTANT_ISSUE	\N	\N	\N	5min	\N	\N	convention	f	HTML
174	Methods should not be too complex	MethodCyclomaticComplexity	MethodCyclomaticComplexity	squid	<p>\n  The cyclomatic complexity of methods should not exceed a defined threshold.\n  Complex code can perform poorly and will in any case be difficult to understand and therefore to maintain.\n</p>	2	\N	READY	java	2015-11-20 10:43:08.647	2015-11-20 10:43:08.65	\N	\N	\N	\N	\N	51	\N	LINEAR_OFFSET	\N	1min	\N	10min	per complexity point above the threshold	\N	brain-overload	f	HTML
175	Enumeration should not be implemented	S1150	S1150	squid	<p>From the official Oracle Javadoc:</p>\n<blockquote>\n<p>NOTE: The functionality of this Enumeration interface is duplicated by the Iterator interface. In addition, Iterator adds an optional remove operation, and has shorter method names. New implementations should consider using Iterator in preference to Enumeration.</p>\n</blockquote>\n<p>The following code:</p>\n<pre>\npublic class MyClass implements Enumeration {  // Noncompliant\n  /* ... */\n}\n</pre>\n<p>should be refactored into:</p>\n<pre>\npublic class MyClass implements Iterator {     // Compliant\n  /* ... */\n}\n</pre>	2	\N	READY	java	2015-11-20 10:43:08.651	2015-11-20 10:43:08.651	\N	\N	\N	\N	\N	15	\N	CONSTANT_ISSUE	\N	\N	\N	30min	\N	\N	obsolete	f	HTML
177	Annotation repetitions should not be wrapped	S1710	S1710	squid	<p>Before Java 8 if you needed to use multiple instances of the same annotation, they had to be wrapped in a container annotation. With Java 8, that's no longer necessary, allowing for cleaner, more readable code.</p>\n\n<h2>Noncompliant Code Example</h2>\n<pre>\n@SomeAnnotations({\n  @SomeAnnotation(..a..),\n  @SomeAnnotation(..b..),\n  @SomeAnnotation(..c..),\n})\npublic class SomeClass {\n  ...\n}\n</pre>\n\n<h2>Compliant Solution</h2>\n<pre>\n@SomeAnnotation(..a..)\n@SomeAnnotation(..b..)\n@SomeAnnotation(..c..)\npublic class SomeClass {\n  ...\n}\n</pre>	2	\N	READY	java	2015-11-20 10:43:08.663	2015-11-20 10:43:08.664	\N	\N	\N	\N	\N	15	\N	CONSTANT_ISSUE	\N	\N	\N	2min	\N	\N	java8	f	HTML
178	"Thread.sleep" should not be used in tests	S2925	S2925	squid	<p>\n  Using <code>Thread.sleep</code> in a test is just generally a bad idea.\n  It creates brittle tests that can fail unpredictably depending on environment ("Passes on my machine!") or load.\n</p>\n\n<h2>Noncompliant Code Example</h2>\n<pre>\n@Test\npublic void testDoTheThing(){\n\n  MyClass myClass = new MyClass();\n  myClass.doTheThing();\n\n  Thread.sleep(500);  // Noncompliant\n  // assertions...\n}\n</pre>	3	\N	READY	java	2015-11-20 10:43:08.672	2015-11-20 10:43:08.672	\N	\N	\N	\N	\N	47	\N	CONSTANT_ISSUE	\N	\N	\N	20min	\N	\N	bad-practice	f	HTML
179	JUnit rules should be used	S2924	S2924	squid	<p>\n  While some <code>TestRule</code> classes have the desired effect without ever being directly referenced by a test,\n  several others do no, and there's no reason to leave them cluttering up the file if they're not in use.\n</p>\n<p>\n  This rule raises an issue when <code>Test</code> class fields of the following types aren't used by any\n  of the test methods: <code>TemporaryFolder</code>, and <code>TestName</code>.\n</p>\n\n<h2>Noncompliant Code Example</h2>\n<pre>\npublic class ProjectDefinitionTest {\n\n  @Rule\n  public TemporaryFolder temp = new TemporaryFolder();  // Noncompliant\n\n  @Test\n  public void shouldSetKey() {\n    ProjectDefinition def = ProjectDefinition.create();\n    def.setKey("mykey");\n    assertThat(def.getKey(), is("mykey"));\n  }\n}\n</pre>\n\n<h2>Compliant Solution</h2>\n<pre>\npublic class ProjectDefinitionTest {\n\n  @Test\n  public void shouldSetKey() {\n    ProjectDefinition def = ProjectDefinition.create();\n    def.setKey("mykey");\n    assertThat(def.getKey(), is("mykey"));\n  }\n}\n</pre>	2	\N	READY	java	2015-11-20 10:43:08.673	2015-11-20 10:43:08.673	\N	\N	\N	\N	\N	15	\N	CONSTANT_ISSUE	\N	\N	\N	5min	\N	\N	junit,unused	f	HTML
180	Control flow statements "if", "for", "while", "switch" and "try" should not be nested too deeply	S134	S134	squid	<p>\nNested <code>if</code>, <code>for</code>, <code>while</code>, <code>switch</code>, and <code>try</code> statements is a key ingredient for making what's known as "Spaghetti code".\n</p>\n<p>Such code is hard to read, refactor and therefore maintain.</p>\n\n<h2>Noncompliant Code Example</h2>\n<p>With the default threshold of 3:</p>\n<pre>\nif (condition1) {                  // Compliant - depth = 1\n  /* ... */\n  if (condition2) {                // Compliant - depth = 2\n    /* ... */\n    for(int i = 0; i &lt; 10; i++) {  // Compliant - depth = 3, not exceeding the limit\n      /* ... */\n      if (condition4) {            // Noncompliant - depth = 4\n        if (condition5) {          // Depth = 5, exceeding the limit, but issues are only reported on depth = 4\n          /* ... */\n        }\n        return;\n      }\n    }\n  }\n}\n</pre>	2	\N	READY	java	2015-11-20 10:43:08.674	2015-11-20 10:43:08.675	\N	\N	\N	\N	\N	36	\N	CONSTANT_ISSUE	\N	\N	\N	10min	\N	\N	brain-overload	f	HTML
181	String.valueOf() should not be appended to a String	S1153	S1153	squid	<p>\nAppending <code>String.valueOf()</code> to a <code>String</code> decreases the code readability.\nThe argument passed to <code>String.valueOf()</code> should be directly appended instead.\n</p>\n\n<p>The following code:</p>\n\n<pre>\npublic void display(int i){\n  System.out.println("Output is " + String.valueOf(i));    // Noncompliant\n}\n</pre>\n\n<p>should be refactored into:</p>\n\n<pre>\npublic void display(int i){\n  System.out.println("Output is " + i);                    // Compliant\n}\n</pre>	1	\N	READY	java	2015-11-20 10:43:08.676	2015-11-20 10:43:08.676	\N	\N	\N	\N	\N	15	\N	CONSTANT_ISSUE	\N	\N	\N	5min	\N	\N	clumsy	f	HTML
182	Values should not be uselessly incremented	S2123	S2123	squid	<p>A value that is incremented or decremented and then not stored is at best wasted code and at worst a bug.</p>\n<h2>Noncompliant Code Example</h2>\n\n<pre>\npublic int pickNumber() {\n  int i = 0;\n  int j = 0;\n\n  i = i++; // Noncompliant; i is still zero\n\n  return j++; // Noncompliant; 0 returned\n}\n</pre>\n<h2>Compliant Solution</h2>\n\n<pre>\npublic int pickNumber() {\n  int i = 0;\n  int j = 0;\n\n  i++; \n  return ++j; \n}\n</pre>	3	\N	READY	java	2015-11-20 10:43:08.677	2015-11-20 10:43:08.677	\N	\N	\N	\N	\N	43	\N	CONSTANT_ISSUE	\N	\N	\N	5min	\N	\N	bug	f	HTML
183	Labels should not be used	LabelsShouldNotBeUsedCheck	LabelsShouldNotBeUsedCheck	squid	<p>\nLabels are not commonly used in Java, and many developers do not understand how they work.\nMoreover, their usage make the control flow harder to follow, which reduces the code's readability.\n</p>\n\n<p>\nThe following code:\n</p>\n\n<pre>\nint matrix[][] = {\n  {1, 2, 3},\n  {4, 5, 6},\n  {7, 8, 9}\n};\n\nouter: for (int row = 0; row < matrix.length; row++) {   // Noncompliant\n  for (int col = 0; col < matrix[row].length; col++) {\n    if (col == row) {\n      continue outer;\n    }\n    System.out.println(matrix[row][col]);                // Prints the elements under the diagonal, i.e. 4, 7 and 8\n  }\n}\n</pre>\n\n<p>\nshould be refactored into:\n</p>\n\n<pre>\nfor (int row = 1; row < matrix.length; row++) {          // Compliant\n  for (int col = 0; col < row; col++) {\n    System.out.println(matrix[row][col]);                // Also prints 4, 7 and 8\n  }\n}\n</pre>	2	\N	READY	java	2015-11-20 10:43:08.677	2015-11-20 10:43:08.678	\N	\N	\N	\N	\N	16	\N	CONSTANT_ISSUE	\N	\N	\N	30min	\N	\N	confusing	f	HTML
184	Collection.isEmpty() should be used to test for emptiness	S1155	S1155	squid	<p>Using <code>Collection.size()</code> to test for emptiness works, but using <code>Collection.isEmpty()</code> makes the code more readable and can be more performant. The time complexity of any <code>isEmpty()</code> method implementation should be <code>O(1)</code> whereas some implementations of <code>size()</code> can be <code>O\\(n)</code>.</p>\n<h2>Noncompliant Code Example</h2>\n\n<pre>\nif (myCollection.size() == 0) {  // Noncompliant\n  /* ... */\n}\n</pre>\n<h2>Compliant Solution</h2>\n\n<pre>\nif (myCollection.isEmpty()) {    // Compliant\n  /* ... */\n}\n</pre>	2	\N	READY	java	2015-11-20 10:43:08.678	2015-11-20 10:43:08.678	\N	\N	\N	\N	\N	15	\N	CONSTANT_ISSUE	\N	\N	\N	2min	\N	\N	clumsy	f	HTML
185	"ScheduledThreadPoolExecutor" should not have 0 core threads	S2122	S2122	squid	<p><code>java.util.concurrent.ScheduledThreadPoolExecutor</code>'s pool is sized with <code>corePoolSize</code>, so setting <code>corePoolSize</code> to zero means the executor will have no threads and run nothing.</p>\n<p>This rule detects instances where <code>corePoolSize</code> is set to zero, via either its setter or the object constructor.</p>\n<h2>Noncompliant Code Example</h2>\n\n<pre>\npublic void do(){\n\n  ScheduledThreadPoolExecutor stpe1 = new ScheduledThreadPoolExecutor(0); // Noncompliant\n\n  ScheduledThreadPoolExecutor stpe2 = new ScheduledThreadPoolExecutor(POOL_SIZE);\n  stpe2.setCorePoolSize(0);  // Noncompliant\n</pre>	4	\N	READY	java	2015-11-20 10:43:08.678	2015-11-20 10:43:08.679	\N	\N	\N	\N	\N	43	\N	CONSTANT_ISSUE	\N	\N	\N	20min	\N	\N	bug	f	HTML
186	Case insensitive string comparisons should be made without intermediate upper or lower casing	S1157	S1157	squid	<p>\nUsing <code>toLowerCase()</code> or <code>toUpperCase()</code> to make case insensitive comparisons is inefficient because it requires the creation of temporary, intermediate <code>String</code> objects.\n</p>\n\n<p>The following code:</p>\n\n<pre>\nboolean result1 = foo.toUpperCase().equals(bar);             // Noncompliant\nboolean result2 = foo.equals(bar.toUpperCase());             // Noncompliant\nboolean result3 = foo.toLowerCase().equals(bar.LowerCase()); // Noncompliant\n</pre>\n\n<p>should be refactored into:</p>\n\n<pre>\nboolean result = foo.equalsIgnoreCase(bar);                  // Compliant\n</pre>	2	\N	READY	java	2015-11-20 10:43:08.679	2015-11-20 10:43:08.68	\N	\N	\N	\N	\N	31	\N	CONSTANT_ISSUE	\N	\N	\N	5min	\N	\N	clumsy	f	HTML
187	Pseudorandom number generators (PRNGs) should not be used in secure contexts	S2245	S2245	squid	<p>When software generates predictable values in a context requiring unpredictability, it may be possible for an attacker to guess the next value that will be generated, and use this guess to impersonate another user or access sensitive information.</p>\n<p>As the <code>java.util.Random</code> class relies on a pseudorandom number generator, this class and relating <code>java.lang.Math.random()</code> method should not be used for security-critical applications or for protecting sensitive data. In such context, the <code>java.security.SecureRandom</code> class which relies on a cryptographically strong random number generator (RNG) should be used in place.</p>\n<h2>Noncompliant Code Example</h2>\n\n<pre>\nRandom random = new Random();\nbyte bytes[] = new byte[20];\nrandom.nextBytes(bytes);\n</pre>\n<h2>See</h2>\n\n<ul>\n<li> <a href="http://cwe.mitre.org/data/definitions/338.html">MITRE, CWE-338</a> - Use of Cryptographically Weak Pseudo-Random Number Generator (PRNG)</li>\n<li> <a href="http://cwe.mitre.org/data/definitions/330.html">MITRE, CWE-330</a> - Use of Insufficiently Random Values</li>\n<li> <a href="http://cwe.mitre.org/data/definitions/326.html">MITRE, CWE-326</a> - Inadequate Encryption Strength</li>\n<li> <a href="http://cwe.mitre.org/data/definitions/310">MITRE, CWE-310</a> - Cryptographic Issues</li>\n<li> <a href="https://www.securecoding.cert.org/confluence/display/java/MSC02-J.+Generate+strong+random+numbers">CERT, MSC02-J</a> - Generate strong random numbers</li>\n<li> <a href="https://www.owasp.org/index.php/Top_10_2013-A6-Sensitive_Data_Exposure">OWASP Top Ten 2013 Category A6</a> - Sensitive Data Exposure</li>\n<li> Derived from FindSecBugs rule <a href="http://h3xstream.github.io/find-sec-bugs/bugs.htm#PREDICTABLE_RANDOM">Predictable Pseudo Random Number Generator</a></li>\n</ul>	3	\N	READY	java	2015-11-20 10:43:08.68	2015-11-20 10:43:08.68	\N	\N	\N	\N	\N	22	\N	CONSTANT_ISSUE	\N	\N	\N	10min	\N	\N	cert,cwe,owasp-a6,security	f	HTML
188	Primitive wrappers should not be instantiated only for "toString" or "compareTo" calls	S1158	S1158	squid	<p>\n  Creating temporary primitive wrapper objects only for <code>String</code> conversion\n  or the use of the <code>compareTo</code> method is inefficient.\n</p>\n<p>\n  Instead, the static <code>toString()</code> or <code>compareTo</code> method of\n  the primitive wrapper class should be used.\n</p>\n\n<h2>Noncompliant Code Example</h2>\n<pre>\nnew Integer(myInteger).toString();  // Noncompliant\n</pre>\n\n<h2>Compliant Solution</h2>\n<pre>\nInteger.toString(myInteger);        // Compliant\n</pre>	2	\N	READY	java	2015-11-20 10:43:08.681	2015-11-20 10:43:08.681	\N	\N	\N	\N	\N	31	\N	CONSTANT_ISSUE	\N	\N	\N	5min	\N	\N	clumsy	f	HTML
189	"Double.longBitsToDouble" should not be used for "int"	S2127	S2127	squid	<p><code>Double.longBitsToDouble</code> expects a 64-bit, <code>long</code> argument. Pass it a smaller value, such as an <code>int</code> and the mathematical conversion into a <code>double</code> simply won't work as anticipated because the layout of the bits will be interpreted incorrectly, as if a child were trying to use an adult's gloves.</p>\n\n<h2>Noncompliant Code Example</h2>\n<pre>\nint i = 42;\ndouble d = Double.longBitsToDouble(i);  // Noncompliant\n</pre>	4	\N	READY	java	2015-11-20 10:43:08.681	2015-11-20 10:43:08.681	\N	\N	\N	\N	\N	42	\N	CONSTANT_ISSUE	\N	\N	\N	15min	\N	\N	bug	f	HTML
190	Throwable and Error should not be caught	S1181	S1181	squid	<p><code>Throwable</code> is the superclass of all errors and exceptions in Java.</p>\n<p><code>Error</code> is the superclass of all errors, which are not meant to be caught by applications.</p>\n<p>Catching either <code>Throwable</code> or <code>Error</code> will also catch <code>OutOfMemoryError</code> and <code>InternalError</code>, from which an application should not attempt to recover.</p>\n<h2>Noncompliant Code Example</h2>\n\n<pre>\ntry { /* ... */ } catch (Throwable t) { /* ... */ }  \ntry { /* ... */ } catch (Error e) { /* ... */ }   \n</pre>\n<h2>Compliant Solution</h2>\n\n<pre>\ntry { /* ... */ } catch (RuntimeException e) { /* ... */ }\ntry { /* ... */ } catch (MyException e) { /* ... */ }\n</pre>\n<h2>See</h2>\n\n<ul>\n<li> <a href="http://cwe.mitre.org/data/definitions/396.html">MITRE, CWE-396</a> - Declaration of Catch for Generic Exception</li>\n<li> <a href="https://www.securecoding.cert.org/confluence/x/BoB3AQ">CERT, ERR07-J</a> - Do not throw RuntimeException, Exception, or Throwable</li>\n</ul>	4	\N	READY	java	2015-11-20 10:43:08.682	2015-11-20 10:43:08.682	\N	\N	\N	\N	\N	40	\N	CONSTANT_ISSUE	\N	\N	\N	20min	\N	\N	cert,cwe,error-handling,security	f	HTML
191	Classes that override "clone" should be "Cloneable" and call "super.clone()"	S1182	S1182	squid	<p><code>Cloneable</code> is the marker <code>Interface</code> that indicates that <code>clone()</code> may be called on an object. Overriding <code>clone()</code> without implementing <code>Cloneable</code> can be useful if you want to control how subclasses clone themselves, but otherwise, it's probably a mistake.</p>\n<p>The usual convention for <code>Object.clone()</code> according to Oracle's Javadoc is:</p>\n<ol>\n<li> <code>x.clone() != x</code></li>\n<li> <code>x.clone().getClass() == x.getClass()</code></li>\n<li> <code>x.clone().equals(x)</code></li>\n</ol>\n<p>Obtaining the object that will be returned by calling <code>super.clone()</code> helps to satisfy those invariants:</p>\n<ol>\n<li> <code>super.clone()</code> returns a new object instance</li>\n<li> <code>super.clone()</code> returns an object of the same type as the one <code>clone()</code> was called on</li>\n<li> <code>Object.clone()</code> performs a shallow copy of the object's state</li>\n</ol>\n<h2>Noncompliant Code Example</h2>\n\n<pre>\nclass BaseClass {  // Noncompliant; should implement Cloneable\n  @Override\n  public Object clone() throws CloneNotSupportedException {    // Noncompliant; should return the super.clone() instance\n    return new BaseClass();\n  }\n}\n\nclass DerivedClass extends BaseClass implements Cloneable {\n  /* Does not override clone() */\n\n  public void sayHello() {\n    System.out.println("Hello, world!");\n  }\n}\n\nclass Application {\n  public static void main(String[] args) throws Exception {\n    DerivedClass instance = new DerivedClass();\n    ((DerivedClass) instance.clone()).sayHello();              // Throws a ClassCastException because invariant #2 is violated\n  }\n}\n</pre>\n<h2>Compliant Solution</h2>\n\n<pre>\nclass BaseClass implements Cloneable {\n  @Override\n  public Object clone() throws CloneNotSupportedException {    // Compliant\n    return super.clone();\n  }\n}\n\nclass DerivedClass extends BaseClass implements Cloneable {\n  /* Does not override clone() */\n\n  public void sayHello() {\n    System.out.println("Hello, world!");\n  }\n}\n\nclass Application {\n  public static void main(String[] args) throws Exception {\n    DerivedClass instance = new DerivedClass();\n    ((DerivedClass) instance.clone()).sayHello();              // Displays "Hello, world!" as expected. Invariant #2 is satisfied\n  }\n}\n</pre>\n<h2>See</h2>\n\n<ul>\n<li> <a href="http://cwe.mitre.org/data/definitions/580.html">MITRE, CWE-580</a> - clone() Method Without super.clone()</li>\n</ul>	2	\N	READY	java	2015-11-20 10:43:08.682	2015-11-20 10:43:08.683	\N	\N	\N	\N	\N	38	\N	CONSTANT_ISSUE	\N	\N	\N	20min	\N	\N	cwe	f	HTML
192	JUnit framework methods should be declared properly	S2391	S2391	squid	<p>\n  If the <code>suite</code> method in a JUnit 3 <code>TestCase</code> is not declared correctly, it will not be used.\n  Such a method must be named "suite", have no arguments, be <code>public static</code>, and must return either a <code>junit.framework.Test</code>\n  or a <code>junit.framework.TestSuite</code>.\n</p>\n\n<p>\n  Similarly, <code>setUp</code> and <code>tearDown</code> methods that aren't properly capitalized will also be ignored.\n</p>\n\n<h2>Noncompliant Code Example</h2>\n<pre>\nTest suite() { ... }  // Noncompliant; must be public static\npublic static boolean suite() { ... }  // Noncompliant; wrong return type\npublic static Test suit() { ... }  // Noncompliant; typo in method name\npublic static Test suite(int count) { ... } // Noncompliant; must be no-arg\n\npublic void setup() { ... } // Noncompliant; should be setUp\npublic void tearDwon() { ... }  // Noncompliant; should be tearDown\n</pre>\n\n<h2>Compliant Solution</h2>\n<pre>\npublic static Test suite() { ... }\npublic void setUp() { ... }\npublic void tearDown() { ... }\n</pre>	3	\N	READY	java	2015-11-20 10:43:08.683	2015-11-20 10:43:08.683	\N	\N	\N	\N	\N	51	\N	CONSTANT_ISSUE	\N	\N	\N	5min	\N	\N	bug,junit	f	HTML
193	"wait(...)", "notify()" and "notifyAll()" methods should only be called when a lock is obviously held on an object	S2273	S2273	squid	<p>By contract, the method <code>Object.wait(...)</code>, <code>Object.notify()</code> and <code>Object.notifyAll()</code> should be called by a thread that is the owner of the object's monitor. If this is not the case an <code>IllegalMonitorStateException</code> exception is thrown. This rule reinforces this constraint by making it mandatory to call one of these methods only inside a <code>synchronized</code> method or statement.</p>\n\n<h2>Noncompliant Code Example</h2>\n<pre>\nprivate void removeElement() {\n  while (!suitableCondition()){\n    obj.wait();\n  }\n  ... // Perform removal\n}\n</pre>\n\nor\n\n<pre>\nprivate void removeElement() {\n  while (!suitableCondition()){\n    wait();\n  }\n  ... // Perform removal\n}\n</pre>\n\n<h2>Compliant Solution</h2>\n<pre>\nprivate void removeElement() {\n  synchronized(obj) {\n    while (!suitableCondition()){\n      obj.wait();\n    }\n    ... // Perform removal\n  }\n}\n</pre>\n\nor\n\n<pre>\nprivate synchronized void removeElement() {\n  while (!suitableCondition()){\n    wait();\n  }\n  ... // Perform removal\n}\n</pre>	3	\N	READY	java	2015-11-20 10:43:08.683	2015-11-20 10:43:08.684	\N	\N	\N	\N	\N	46	\N	CONSTANT_ISSUE	\N	\N	\N	20min	\N	\N	bug,multi-threading	f	HTML
194	"Iterator.next()" methods should throw "NoSuchElementException"	S2272	S2272	squid	By contract, any implementation of the <code>java.util.Iterator.next()</code> method should throw a <code>NoSuchElementException</code> exception when the iteration has no more elements. Any other behavior when the iteration is done could lead to unexpected behavior for users of this <code>Iterator</code>. \n\n<h2>Noncompliant Code Example</h2>\n<pre>\npublic class MyIterator implements Iterator&lt;String&gt;{\n  ...\n  public String next(){\n    if(!hasNext()){\n      return null;\n    }\n    ...\n  }\n}\n</pre>\n\n<h2>Compliant Solution</h2>\n<pre>\npublic class MyIterator implements Iterator&lt;String&gt;{\n  ...\n  public String next(){\n    if(!hasNext()){\n      throw new NoSuchElementException();\n    }\n    ...\n  }\n}\n</pre>	2	\N	READY	java	2015-11-20 10:43:08.691	2015-11-20 10:43:08.691	\N	\N	\N	\N	\N	38	\N	CONSTANT_ISSUE	\N	\N	\N	5min	\N	\N	bug	f	HTML
195	"runFinalizersOnExit" should not be called	S2151	S2151	squid	<p>Running finalizers on JVM exit is disabled by default. It can be enabled with <code>System.runFinalizersOnExit</code> and <code>Runtime.runFinalizersOnExit</code>, but both methods are deprecated because they are are inherently unsafe. </p>\n<p>According to the Oracle Javadoc:</p>\n<blockquote>\n<p>It may result in finalizers being called on live objects while other threads are concurrently manipulating those objects, resulting in erratic behavior or deadlock.</p>\n</blockquote>\n<p>If you really want to be execute something when the virtual machine begins its shutdown sequence, you should attach a shutdown hook. </p>\n<h2>Noncompliant Code Example</h2>\n\n<pre>\npublic static void main(String [] args) {\n  ...\n  System.runFinalizersOnExit(true);  // Noncompliant\n  ...\n}\n\nprotected void finalize(){\n  doSomething();\n}\n</pre>\n<h2>Compliant Solution</h2>\n\n<pre>\npublic static void main(String [] args) {\n  Runtime.addShutdownHook(new Runnable() {\n    public void run(){\n      doSomething();\n    }\n  });\n  //...\n</pre>\n<h2>See</h2>\n\n<ul>\n<li> <a href="https://www.securecoding.cert.org/confluence/x/H4cbAQ">CERT, MET12-J</a> - Do not use finalizers</li>\n</ul>	4	\N	READY	java	2015-11-20 10:43:08.692	2015-11-20 10:43:08.693	\N	\N	\N	\N	\N	42	\N	CONSTANT_ISSUE	\N	\N	\N	20min	\N	\N	bug,cert,security	f	HTML
196	Local variables should not shadow class fields	HiddenFieldCheck	HiddenFieldCheck	squid	<p>Shadowing fields with a local variable or with a method parameter is a bad practice that reduces code readability: It makes it confusing to know whether the field or the variable is being used.</p>\n<h2>Noncompliant Code Example</h2>\n\n<pre>\nclass Foo {\n  public int myField;\n\n  public void doSomething() {\n    int myField = 0;\n    ...\n  }\n\n  public void doSomethingElse(int myField) {\n    ...\n  }\n}\n</pre>\n<h2>Exceptions</h2>\n\n<p>Constructors and setters are exceptions; it is common practice to name arguments for the fields the values will be assigned to. Static methods are also ignored.</p>\n<pre>\nclass Foo {\n  public int myField;\n\n  public Foo(int myField) {\n    this.myField = myField;\n  }\n\n  public static Foo build(int myField) {\n    ...\n  }\n\n  public void setMyField(int myField){\n    this.myField = myField;\n  } \n}\n</pre>	2	\N	READY	java	2015-11-20 10:43:08.693	2015-11-20 10:43:08.693	\N	\N	\N	\N	\N	39	\N	CONSTANT_ISSUE	\N	\N	\N	5min	\N	\N	pitfall	f	HTML
197	Static non-final field names should comply with a naming convention	S3008	S3008	squid	<p>Shared naming conventions allow teams to  collaborate efficiently. This rule checks that static non-final field names match a provided regular expression.</p>\n<h2>Noncompliant Code Example</h2>\n\n<p>With the default regular expression <code>^[a-z][a-zA-Z0-9]*$</code>:</p>\n<pre>\npublic final class MyClass {\n   private static String foo_bar;\n}\n</pre>\n<h2>Compliant Solution</h2>\n\n<pre>\nclass MyClass {\n   private static String fooBar;\n}\n</pre>	1	\N	READY	java	2015-11-20 10:43:08.694	2015-11-20 10:43:08.694	\N	\N	\N	\N	\N	15	\N	CONSTANT_ISSUE	\N	\N	\N	2min	\N	\N	convention	f	HTML
198	Public types, methods and fields (API) should be documented with Javadoc	UndocumentedApi	UndocumentedApi	squid	<p>Try to imagine using the standard Java API (Collections, JDBC, IO, ...) without Javadoc. It would be a nightmare, because Javadoc is the only way to understand of the contract of the API. Documenting an API with Javadoc increases the productivity of the developers consuming it.</p>\n<p>The following Javadoc elements are required:</p>\n<ul>\n<li> Parameters, using <code>@param parameterName</code>.</li>\n<li> Method return values, using <code>@return</code>.</li>\n<li> Generic types, using <code>@param &lt;T&gt;</code>.</li>\n</ul>\n<p>The following public methods and constructors are not taken into account by this rule:</p>\n<ul>\n<li> Getters and setters.</li>\n<li> Methods with @Override annotation.</li>\n<li> Empty constructors.</li>\n<li> Static constants.</li>\n</ul>\n<h2>Noncompliant Code Example</h2>\n\n<pre>\n/**\n  * This is a Javadoc comment\n  */\npublic class MyClass&lt;T&gt; implements Runnable {    // Noncompliant - missing '@param &lt;T&gt;'\n\n  public static final DEFAULT_STATUS = 0;    // Compliant - static constant\n  private int status;                           // Compliant - not public\n\n  public String message;                  // Noncompliant\n\n  public MyClass() {                         // Noncompliant - missing documentation\n    this.status = DEFAULT_STATUS;\n  }\n\n  public void setStatus(int status) {  // Compliant - setter\n    this.status = status;\n  }\n\n  @Override\n  public void run() {                          // Compliant - has @Override annotation\n  }\n\n  protected void doSomething() {    // Compliant - not public\n  }\n\n  public void doSomething2(int value) {  // Noncompliant\n  }\n\n  public int doSomething3(int value) {  // Noncompliant\n    return value;\n  }\n}\n</pre>\n<h2>Compliant Solution</h2>\n\n<pre>\n/**\n  * This is a Javadoc comment\n  * @param &lt;T&gt; ...\n  */\npublic class MyClass&lt;T&gt; implements Runnable {\n\n  public static final DEFAULT_STATUS = 0;\n  private int status;\n\n  /**\n    * This is a Javadoc comment\n    */\n  public String message;\n\n  /**\n   * Class comment...\n   */\n  public MyClass() {\n    this.status = DEFAULT_STATUS;\n  }\n\n  public void setStatus(int status) {\n    this.status = status;\n  }\n\n  @Override\n  public void run() {\n  }\n\n  protected void doSomething() {\n  }\n\n  /**\n    * @param value ...\n    */\n  public void doSomething(int value) {\n\n  /**\n    *  {@inheritDoc}\n    */\n  public int doSomething(int value) {\n    return value;\n  }\n}\n</pre>	1	\N	READY	java	2015-11-20 10:43:08.694	2015-11-20 10:43:08.695	\N	\N	\N	\N	\N	16	\N	CONSTANT_ISSUE	\N	\N	\N	10min	\N	\N	convention	f	HTML
199	Exceptions should not be thrown from servlet methods	S1989	S1989	squid	<p>\n  Even though the signatures for methods in a servlet include <code>throws IOException, ServletException</code>,\n  it's a bad idea to let such exceptions be thrown.\n  Failure to catch exceptions in a servlet could leave a system in a vulnerable state,\n  possibly resulting in denial-of-service attacks, or the exposure of sensitive information because when\n  a servlet throws an exception, the servlet container typically sends debugging information back to the user.\n  And that information which could be very valuable to an attacker.\n</p>\n<p>\n  This rule checks all exceptions in methods named "do*" are explicitly handled in servlet classes.\n</p>\n\n<h2>Noncompliant Code Example</h2>\n<pre>\npublic void doGet(HttpServletRequest request, HttpServletResponse response)\n  throws IOException, ServletException {\n  String ip = request.getRemoteAddr();\n  InetAddress addr = InetAddress.getByName(ip); // Noncompliant; getByName(String) throws UnknownHostException\n  //...\n}\n</pre>\n\n<h2>Compliant Solution</h2>\n<pre>\npublic void doGet(HttpServletRequest request, HttpServletResponse response)\n  throws IOException, ServletException {\n  try {\n    String ip = request.getRemoteAddr();\n    InetAddress addr = InetAddress.getByName(ip);\n    //...\n  }\n  catch (UnknownHostException uhex) {\n    //...\n  }\n}\n</pre>\n\n<h2>See</h2>\n<ul>\n  <li><a href="http://cwe.mitre.org/data/definitions/600.html">MITRE, CWE-600</a> - Uncaught Exception in Servlet</li>\n  <li><a href="https://www.securecoding.cert.org/confluence/x/s4EVAQ">CERT, ERR01-J</a> - Do not allow exceptions to expose sensitive information</li>\n  <li><a href="https://www.owasp.org/index.php/Top_10_2013-A6-Sensitive_Data_Exposure">OWASP Top Ten Category A6</a> - Sensitive Data Exposure</li>\n</ul>	3	\N	READY	java	2015-11-20 10:43:08.695	2015-11-20 10:43:08.696	\N	\N	\N	\N	\N	19	\N	CONSTANT_ISSUE	\N	\N	\N	20min	\N	\N	cert,cwe,error-handling,owasp-a6,security	f	HTML
200	"DateUtils.truncate" from Apache Commons Lang library should not be used	S2718	S2718	squid	<p>The use of the <code>Instant</code> class introduced in Java 8 to truncate a date can be significantly faster than the <code>DateUtils</code> class from Commons Lang.</p>\n\n<h2>Noncompliant Code Example</h2>\n\n<pre>\npublic Date trunc(Date date) {\n  return DateUtils.truncate(date, Calendar.SECOND);  // Noncompliant \n}\n</pre>\n\n<h2>Compliant Solution</h2>\n\n<pre>\npublic Date trunc(Date date) {\n  Instant instant = date.toInstant();\n  instant = instant.truncatedTo(ChronoUnit.SECONDS);\n  return Date.from(instant);\n}\n</pre>	3	\N	READY	java	2015-11-20 10:43:08.696	2015-11-20 10:43:08.696	\N	\N	\N	\N	\N	31	\N	CONSTANT_ISSUE	\N	\N	\N	10min	\N	\N	java8,performance	f	HTML
201	Overriding methods should do more than simply call the same method in the super class	S1185	S1185	squid	<p>Overriding a method just to call the same method from the super class without performing any other actions is useless and misleading. The only time this is justified is in <code>final</code> overriding methods, where the effect is to lock in the parent class behavior. This rule ignores such overrides of <code>equals</code>, <code>hashCode</code> and <code>toString</code>.</p>\n<h2>Noncompliant Code Example</h2>\n\n<pre>\npublic void doSomething() {                \n  super.doSomething();\n}\n\n@Override\npublic boolean isLegal(Action action) {      \n  return super.isLegal(action);\n}\n</pre>\n<h2>Compliant Solution</h2>\n\n<pre>\n@Override\npublic boolean isLegal(Action action) {         // Compliant - not simply forwarding the call\n  return super.isLegal(new Action(/* ... */));\n}\n\n@Id\n@Override\npublic int getId() {                            // Compliant - there is annotation different from @Override\n  return super.getId();\n}\n</pre>	1	\N	READY	java	2015-11-20 10:43:08.696	2015-11-20 10:43:08.697	\N	\N	\N	\N	\N	16	\N	CONSTANT_ISSUE	\N	\N	\N	5min	\N	\N	clumsy	f	HTML
202	Printf-style format strings should not lead to unexpected behavior at runtime	S2275	S2275	squid	<p>Because <code>printf</code>-style format strings are interpreted at runtime, rather than validated by the Java compiler, they can contain errors that lead to unexpected behavior or runtime errors. This rule statically validates the good behavior of <code>printf</code>-style formats when calling the <code>format(...)</code> methods of <code>java.util.Formatter</code>, <code>java.lang.String</code>, <code>java.io.PrintStream</code> and <code>java.io.PrintWriter</code> classes and the <code>printf(...)</code> methods of <code>java.io.PrintStream</code> or <code>java.io.PrintWriter</code> classes. </p>\n<h2>Noncompliant Code Example</h2>\n\n<pre>\nString.format("The value of my integer is %d", "Hello World");  // Noncompliant; an 'int' is expected rather than a String\nString.format("First {0} and then {1}", "foo", "bar");  //Noncompliant. Looks like there is a confusion with the use of {{java.text.MessageFormat}}, parameters "foo" and "bar" will be simply ignored here\nString.format("Duke's Birthday year is %tX", c);  //Noncompliant; X is not a supported time conversion character\nString.format("Display %3$d and then %d", 1, 2, 3);   //Noncompliant; the second argument '2' is unused\nString.format("Display %0$d and then %d", 1);   //Noncompliant; arguments are numbered starting from 1\nString.format("Too many arguments %d and %d", 1, 2, 3);  //Noncompliant; the third argument '3' is unused\nString.format("Not enough arguments %d and %d", 1);  //Noncompliant; the second argument is missing\nString.format("First Line\\n");   //Noncompliant; %n should be used in place of \\n to produce the platform-specific line separator\nString.format("%&lt; is equals to %d", 2);   //Noncompliant; the argument index '&lt;' refers to the previous format specifier but there isn't one\nString.format("Is myObject null ? %b", myObject);   //Noncompliant; when a non-boolean argument is formatted with %b, it prints true for any nonnull value, and false for null. Even if intended, this is misleading. It's better to directly inject the boolean value (myObject == null in this case)\nString.format("value is " + value); // Noncompliant\nString s = String.format("string without arguments"); // Noncompliant\n</pre>\n<h2>Compliant Solution</h2>\n\n<pre>\nString.format("The value of my integer is %d", 3);\nString.format("First %s and then %s", "foo", "bar");\nString.format("Duke's Birthday year is %tY", c);\nString.format("Display %2$d and then %d", 1, 3);\nString.format("Display %1$d and then %d", 1);\nString.format("Too many arguments %d %d", 1, 2);\nString.format("Not enough arguments %d and %d", 1, 2);\nString.format("First Line%n");\nString.format("%d is equals to %&lt;", 2);\nString.format("Is myObject null ? %b", myObject == null);\nString.format("value is %d", value);\nString s = "string without arguments"; \n</pre>	3	\N	READY	java	2015-11-20 10:43:08.701	2015-11-20 10:43:08.701	\N	\N	\N	\N	\N	42	\N	CONSTANT_ISSUE	\N	\N	\N	10min	\N	\N	bug,pitfall	f	HTML
203	Dissimilar primitive wrappers should not be used with the ternary operator without explicit casting	S2154	S2154	squid	<p>If wrapped primitive values (e.g. <code>Integers</code> and <code>Floats</code>) are used in a ternary operator (e.g. <code>a?b:c</code>), both values will be unboxed and coerced to a common type, potentially leading to unexpected results. To avoid this, add an explicit cast to a compatible type.</p>\n\n<h2>Noncompliant Code Example</h2>\n\n<pre>\nInteger i = 123456789;\nFloat f = 1.0f;\nNumber n = condition ? i : f;  // Noncompliant; i is coerced to float. n = 1.23456792E8\n</pre>\n\n<h2>Compliant Solution</h2>\n\n<pre>\nInteger i = 123456789;\nFloat f = 1.0f;\nNumber n = condition ? (Number) i : f;  // n = 123456789\n</pre>	3	\N	READY	java	2015-11-20 10:43:08.701	2015-11-20 10:43:08.702	\N	\N	\N	\N	\N	42	\N	CONSTANT_ISSUE	\N	\N	\N	5min	\N	\N	bug	f	HTML
204	Methods should not be empty	S1186	S1186	squid	<p>There are several reasons for a method not to have a method body:</p>\n<ul>\n  <li>It is an unintentional omission, and should be fixed to prevent an unexpected behavior in production.</li>\n  <li>It is not yet, or never will be, supported. In this case an <code>UnsupportedOperationException</code> should be thrown.</li>\n  <li>The method is an intentionally-blank override. In this case a nested comment should explain the reason for the blank override.</li>\n  <li>\n    There is a desire to provide a public, no-args constructor.\n    In this case, it can simply be omitted from the code; a default constructor will automatically be generated.\n  </li>\n</ul>\n\n<h2>Noncompliant Code Example</h2>\n<pre>\npublic void doSomething() {\n}\n\npublic void doSomethingElse() {\n}\n</pre>\n\n<h2>Compliant Solution</h2>\n<pre>\n@Override\npublic void doSomething() {\n  // Do nothing because of X and Y.\n}\n\n@Override\npublic void doSomethingElse() {\n  throw new UnsupportedOperationException();\n}\n</pre>\n\n<h2>Exceptions</h2>\n<p>An abstract class may have empty methods, in order to provide default implementations for child classes.</p>\n<pre>\npublic abstract class Animal {\n  void speak() {\n  }\n}\n</pre>	2	\N	READY	java	2015-11-20 10:43:08.702	2015-11-20 10:43:08.702	\N	\N	\N	\N	\N	38	\N	CONSTANT_ISSUE	\N	\N	\N	5min	\N	\N	suspicious	f	HTML
205	Unused labels should be removed	S1065	S1065	squid	<p>If a label is declared but not used in the program, it can be considered as dead code and should therefore be removed.</p>\n<p>This will improve maintainability as developers will not wonder what this label is used for.</p>\n\n<h2>Noncompliant Code Example</h2>\n<pre>\nvoid foo() {\n  outer: //label is not used.\n  for(int i = 0; i<10; i++) {\n    break;\n  }\n}\n</pre>\n\n<h2>Compliant Solution</h2>\n<pre>\nvoid foo() {\n  for(int i = 0; i<10; i++) {\n    break;\n  }\n}\n</pre>\n\n<h2>See</h2>\n<ul>\n  <li>MISRA C:2012, 2.6 - A function should not contain unused label declarations</li>\n</ul>	2	\N	READY	java	2015-11-20 10:43:08.702	2015-11-20 10:43:08.703	\N	\N	\N	\N	\N	16	\N	CONSTANT_ISSUE	\N	\N	\N	2min	\N	\N	misra,unused	f	HTML
206	"Object.wait(...)" and "Condition.await(...)" should be called inside a "while" loop	S2274	S2274	squid	<p>According to the Java <code>Condition</code> interface documentation:</p>\n<blockquote>\n<p>When waiting upon a <code>Condition</code>, a "spurious wakeup" is permitted to occur, in general, as a concession to the underlying platform semantics. This has little practical impact on most application programs as a Condition should always be waited upon in a loop, testing the state predicate that is being waited for. An implementation is free to remove the possibility of spurious wakeups but it is recommended that applications programmers always assume that they can occur and so always wait in a loop.</p>\n</blockquote>\n<p>The same advice is also found for the <code>Object.wait(...)</code> method:</p>\n<blockquote>\n<p>waits should always occur in loops, like this one:</p>\n<pre>\nsynchronized (obj) {\n  while (&lt;condition does not hold&gt;){\n    obj.wait(timeout); \n  }\n   ... // Perform action appropriate to condition\n}\n</pre>\n</blockquote>\n<h2>Noncompliant Code Example</h2>\n\n<pre>\nsynchronized (obj) {\n  if (!suitableCondition()){\n    obj.wait(timeout);   //the thread can wakeup whereas the condition is still false\n  }\n   ... // Perform action appropriate to condition\n}\n</pre>\n<h2>Compliant Solution</h2>\n\n<pre>\nsynchronized (obj) {\n  while (!suitableCondition()){\n    obj.wait(timeout);\n  }\n   ... // Perform action appropriate to condition\n}\n</pre>\n<h2>See</h2>\n\n<ul>\n<li> <a href="https://www.securecoding.cert.org/confluence/display/java/THI03-J.+Always+invoke+wait%28%29+and+await%28%29+methods+inside+a+loop">CERT THI03-J</a> - Always invoke wait() and await() methods inside a loop\n</li></ul>	3	\N	READY	java	2015-11-20 10:43:08.703	2015-11-20 10:43:08.703	\N	\N	\N	\N	\N	46	\N	CONSTANT_ISSUE	\N	\N	\N	20min	\N	\N	bug,cert,multi-threading	f	HTML
207	Boxing and unboxing should not be immediately reversed	S2153	S2153	squid	<p>Boxing is the process of putting a primitive value into an analogous object, such as creating an <code>Integer</code> to hold an <code>int</code> value. Unboxing is the process of retrieving the primitive value from such an object.</p>\n<p>Since the original value is unchanged during boxing and unboxing, there's no point in doing either when not needed. This also applies to autoboxing and auto-unboxing (when Java implicitly handles the primitive/object transition for you).</p>\n<h2>Noncompliant Code Example</h2>\n\n<pre>\npublic void examineInt(int a) { \n  //... \n}\n\npublic void examineInteger(Integer a) { \n  // ...\n}\n\npublic void func() {\n  int i = 0;\n  Integer iger1 = Integer.valueOf(0);\n  double d = 1.0;\n\n  int dIntValue = new Double(d).intValue(); // Noncompliant\n\n  examineInt(new Integer(i).intValue()); // Noncompliant; explicit box/unbox\n  examineInt(Integer.valueOf(i));  // Noncompliant; boxed int will be auto-unboxed\n\n  examineInteger(i); // Compliant; value is boxed but not then unboxed\n  examineInteger(iger1.intValue()); // Noncompliant; unboxed int will be autoboxed\n}\n</pre>	2	\N	READY	java	2015-11-20 10:43:08.705	2015-11-20 10:43:08.705	\N	\N	\N	\N	\N	29	\N	CONSTANT_ISSUE	\N	\N	\N	5min	\N	\N	clumsy	f	HTML
208	Collapsible "if" statements should be merged	S1066	S1066	squid	<p>Merging collapsible <code>if</code> statements increases the code's readability.</p>\n\n<h2>Noncompliant Code Example</h2>\n\n<pre>\nif (file != null) {\n  if (file.isFile() || file.isDirectory()) {\n    /* ... */\n  }\n}\n</pre>\n<h2>Compliant Solution</h2>\n\n<pre>\nif (file != null &amp;&amp; isFileOrDirectory(file)) {\n  /* ... */\n}\n\nprivate static boolean isFileOrDirectory(File file) {\n  return file.isFile() || file.isDirectory();\n}\n</pre>	2	\N	READY	java	2015-11-20 10:43:08.705	2015-11-20 10:43:08.706	\N	\N	\N	\N	\N	15	\N	CONSTANT_ISSUE	\N	\N	\N	5min	\N	\N	clumsy	f	HTML
209	Cryptographic RSA algorithms should always incorporate OAEP (Optimal Asymmetric Encryption Padding)	S2277	S2277	squid	<p>Without OAEP in RSA encryption, it takes less work for an attacker to decrypt the data or infer patterns from the ciphertext. This rule logs an issue as soon as a literal value starts with <code>RSA/NONE</code>. </p>\n<h2>Noncompliant Code Example</h2>\n\n<pre>\nCipher rsa = javax.crypto.Cipher.getInstance("RSA/NONE/NoPadding");\n</pre>\n<h2>Compliant Solution</h2>\n\n<pre>\nCipher rsa = javax.crypto.Cipher.getInstance("RSA/ECB/OAEPWithSHA-1AndMGF1Padding");\n</pre>\n<h2>See</h2>\n\n<ul>\n<li> <a href="http://cwe.mitre.org/data/definitions/780.html">MITRE CWE-780</a> - Use of RSA Algorithm without OAEP</li>\n<li> <a href="http://cwe.mitre.org/data/definitions/327.html">MITRE CWE-327</a>: Use of a Broken or Risky Cryptographic Algorithm</li>\n<li> <a href="https://www.owasp.org/index.php/Top_10_2013-A6-Sensitive_Data_Exposure">OWASP Top Ten 2013 Category A6</a> - Sensitive Data Exposure</li>\n<li> Derived from FindSecBugs rule <a href="http://h3xstream.github.io/find-sec-bugs/bugs.htm#RSA_NO_PADDING">RSA NoPadding Unsafe</a></li>\n</ul>	3	\N	READY	java	2015-11-20 10:43:08.706	2015-11-20 10:43:08.706	\N	\N	\N	\N	\N	22	\N	CONSTANT_ISSUE	\N	\N	\N	20min	\N	\N	cwe,owasp-a6,security	f	HTML
210	"final" classes should not have "protected" members	S2156	S2156	squid	The difference between <code>private</code> and <code>protected</code> visibility is that child classes can see and use <code>protected</code> members, but they cannot see <code>private</code> ones. Since a <code>final</code> class will have no children, marking the members of a <code>final</code> class <code>protected</code> is confusingly pointless.\n\n<h2>Noncompliant Code Example</h2>\n<pre>\npublic final class MyFinalClass {\n\n  protected String name = "Fred";  // Noncompliant\n  protected void setName(String name) {  // Noncompliant\n    // ...\n  }\n</pre>\n\n<h2>Compliant Solution</h2>\n<pre>\npublic final class MyFinalClass {\n\n  private String name = "Fred";\n  public void setName(String name) {\n    // ...\n  }\n</pre>	2	\N	READY	java	2015-11-20 10:43:08.706	2015-11-20 10:43:08.709	\N	\N	\N	\N	\N	16	\N	CONSTANT_ISSUE	\N	\N	\N	5min	\N	\N	confusing	f	HTML
211	Expressions should not be too complex	S1067	S1067	squid	<p>The complexity of an expression is defined by the number of <code>&amp;&amp;</code>, <code>||</code> and <code>condition ? ifTrue : ifFalse</code> operators it contains.</p>\n<p>A single expression's complexity should not become too high to keep the code readable.</p>\n<h2>Noncompliant Code Example</h2>\n\n<p>With the default threshold value of 3:</p>\n<pre>\nif (((condition1 &amp;&amp; condition2) || (condition3 &amp;&amp; condition4)) &amp;&amp; condition5) { ... } \n</pre>\n<h2>Compliant Solution</h2>\n\n<pre>\nif ( (myFirstCondition() || mySecondCondition()) &amp;&amp; myLastCondition()) { ... }     \n</pre>	2	\N	READY	java	2015-11-20 10:43:08.71	2015-11-20 10:43:08.71	\N	\N	\N	\N	\N	51	\N	LINEAR_OFFSET	\N	1min	\N	5min	per complexity point above the threshold	\N	brain-overload	f	HTML
212	Lambdas and anonymous classes should not have too many lines	S1188	S1188	squid	<p>\nAnonymous classes and lambdas (with Java 8) are a very convenient and compact way to inject a behavior without having to create a dedicated class. But those anonymous inner classes and lambdas should be used only if the behavior to be injected can be defined in a few lines of code, otherwise the source code can quickly become unreadable.\n</p>	2	\N	READY	java	2015-11-20 10:43:08.711	2015-11-20 10:43:08.711	\N	\N	\N	\N	\N	15	\N	CONSTANT_ISSUE	\N	\N	\N	20min	\N	\N	java8	f	HTML
213	"wait(...)" should be used instead of "Thread.sleep(...)" when a lock is held	S2276	S2276	squid	<p>If <code>Thread.sleep(...)</code> is called when the current thread holds a lock, it could lead to performance, and scalability issues, or even worse to deadlocks because the execution of the thread holding the lock is frozen. It's better to call <code>wait(...)</code> on the monitor object to temporarily release the lock and allow other threads to run.</p>\n<h2>Noncompliant Code Example</h2>\n\n<pre>\npublic void doSomething(){\n  synchronized(monitor) {\n    while(notReady()){\n      Thread.sleep(200);\n    }\n    process();\n  }\n  ...\n}\n</pre>\n<h2>Compliant Solution</h2>\n\n<pre>\npublic void doSomething(){\n  synchronized(monitor) {\n    while(notReady()){\n      monitor.wait(200);\n    }\n    process();\n  }\n  ...\n}\n</pre>	3	\N	READY	java	2015-11-20 10:43:08.712	2015-11-20 10:43:08.712	\N	\N	\N	\N	\N	46	\N	CONSTANT_ISSUE	\N	\N	\N	5min	\N	\N	multi-threading,performance	f	HTML
214	Unused private fields should be removed	S1068	S1068	squid	<p>\nIf a private field is declared but not used in the program, it can be considered dead code and should therefore be removed.\nThis will improve maintainability because developers will not wonder what the variable is used for.\n</p>\n\n<h2>Noncompliant Code Example</h2>\n<pre>\npublic class MyClass {\n  private int foo = 42;\n\n  public int compute(int a) {\n    return a * 42;\n  }\n}\n</pre>\n\n<h2>Compliant Solution</h2>\n<pre>\npublic class MyClass {\n  public int compute(int a) {\n    return a * 42;\n  }\n}\n</pre>\n\n<h2>Exceptions</h2>\n\n<p>\nThe Java serialization runtime associates with each serializable class a version number, called <code>serialVersionUID</code>, which is used during deserialization to verify that the sender and receiver of a serialized object have loaded classes for that object that are compatible with respect to serialization.\nA serializable class can declare its own <code>serialVersionUID</code> explicitly by declaring a field named <code>serialVersionUID</code> that must be static, final, and of type long. By definition those <code>serialVersionUID</code> fields should not be reported by this rule:\n</p>\n\n<pre>\npublic class MyClass implements java.io.Serializable {\n  private static final long serialVersionUID = 42L;\n}\n</pre>\n<p>Moreover, this rule doesn't raise any issue on annotated fields.</p>	2	\N	READY	java	2015-11-20 10:43:08.712	2015-11-20 10:43:08.712	\N	\N	\N	\N	\N	16	\N	CONSTANT_ISSUE	\N	\N	\N	5min	\N	\N	unused	f	HTML
215	Synchronization should not be based on Strings or boxed primitives	S1860	S1860	squid	<p>Objects which are pooled and potentially reused should not be used for synchronization. If they are, it can cause unrelated threads to deadlock with unhelpful stacktraces. Specifically, <code>String</code> literals, and boxed primitives such as Integers should not be used as lock objects because they are pooled and reused. The story is even worse for <code>Boolean</code> objects, because there are only two instances of <code>Boolean</code>, <code>Boolean.TRUE</code> and <code>Boolean.FALSE</code> and every class that uses a Boolean will be referring to one of the two.</p>\n<h2>Noncompliant Code Example</h2>\n\n<pre>\nprivate static final Boolean bLock = Boolean.FALSE;\nprivate static final Integer iLock = Integer.valueOf(0);\nprivate static final String sLock = "LOCK";\n\npublic void doSomething() {\n\n  synchronized(bLock) {  // Noncompliant\n    // ...\n  }\n  synchronized(iLock) {  // Noncompliant\n    // ...\n  }\n  synchronized(sLock) {  // Noncompliant\n    // ...\n  }\n</pre>\n<h2>Compliant Solution</h2>\n\n<pre>\nprivate static final Object lock1 = new Object();\nprivate static final Object lock2 = new Object();\nprivate static final Object lock3 = new Object();\n\npublic void doSomething() {\n\n  synchronized(lock1) {\n    // ...\n  }\n  synchronized(lock2) {\n    // ...\n  }\n  synchronized(lock3) {\n    // ...\n  }\n</pre>\n<h2>See</h2>\n\n<ul>\n<li> <a href="https://www.securecoding.cert.org/confluence/x/rQGeAQ">CERT, LCK01-J</a> - Do not synchronize on objects that may be reused</li>\n</ul>	4	\N	READY	java	2015-11-20 10:43:08.713	2015-11-20 10:43:08.714	\N	\N	\N	\N	\N	46	\N	CONSTANT_ISSUE	\N	\N	\N	15min	\N	\N	bug,cert,multi-threading	f	HTML
216	Neither DES (Data Encryption Standard) nor DESede (3DES) should be used	S2278	S2278	squid	<p>According to the US National Institute of Standards and Technology (NIST), the Data Encryption Standard (DES) is no longer considered secure:</p>\n<blockquote>\n<p>Adopted in 1977 for federal agencies to use in protecting sensitive, unclassified information, the DES is being withdrawn because it no longer provides the security that is needed to protect federal government information.</p>\n<p>Federal agencies are encouraged to use the Advanced Encryption Standard, a faster and stronger algorithm approved as FIPS 197 in 2001.</p>\n</blockquote>\n<h2>Noncompliant Code Example</h2>\n\n<pre>\nCipher c = Cipher.getInstance("DESede/ECB/PKCS5Padding");\n</pre>\n<h2>Compliant Solution</h2>\n\n<pre>\nCipher c = Cipher.getInstance("AES/GCM/NoPadding");\n</pre>\n<h2>See</h2>\n\n<ul>\n<li> <a href="http://cwe.mitre.org/data/definitions/326.html">MITRE CWE-326</a> - Inadequate Encryption Strength</li>\n<li> <a href="http://cwe.mitre.org/data/definitions/327.html">MITRE CWE-327</a> - Use of a Broken or Risky Cryptographic Algorithm</li>\n<li> <a href="https://www.owasp.org/index.php/Top_10_2013-A6-Sensitive_Data_Exposure">OWASP Top Ten 2013 Category A6</a> - Sensitive Data Exposure</li>\n<li> Derived from FindSecBugs rule <a href="http://h3xstream.github.io/find-sec-bugs/bugs.htm#DES_USAGE">DES / DESede Unsafe</a></li>\n</ul>	3	\N	READY	java	2015-11-20 10:43:08.716	2015-11-20 10:43:08.716	\N	\N	\N	\N	\N	22	\N	CONSTANT_ISSUE	\N	\N	\N	20min	\N	\N	cwe,owasp-a6,security	f	HTML
217	"Cloneables" should implement "clone"	S2157	S2157	squid	<p>Simply implementing <code>Cloneable</code>  without also overriding <code>Object.clone()</code> does not necessarily make the class cloneable. While the <code>Cloneable</code> interface does not include a <code>clone</code> method, it is required by convention, and ensures true cloneability. Otherwise the default JVM <code>clone</code> will be used, which copies primitive values and object references from the source to the target. I.e. without overriding <code>clone</code>, any cloned instances will potentially share members with the source instance.</p>\n\n<p>Removing the <code>Cloneable</code> implementation and providing a good copy constructor is another viable (some say preferable) way of allowing a class to be copied.</p>\n\n<h2>Noncompliant Code Example</h2>\n<pre>\nclass Team implements Cloneable {  // Noncompliant\n  private Person coach;\n  private List&lt;Person&gt; players;\n  public void addPlayer(Person p) {...}\n  public Person getCoach() {...}\n}\n</pre>\n\n<h2>Compliant Solution</h2>\n<pre>\nclass Team implements Cloneable {\n  private Person coach;\n  private List&lt;Person&gt; players;\n  public void addPlayer(Person p) { ... }\n  public Person getCoach() { ... }\n\n  @Override\n  public Object clone() { \n    Team clone = (Team) super.clone();\n    //...\n  }\n}\n</pre>	3	\N	READY	java	2015-11-20 10:43:08.716	2015-11-20 10:43:08.717	\N	\N	\N	\N	\N	42	\N	CONSTANT_ISSUE	\N	\N	\N	30min	\N	\N	bug	f	HTML
218	Related "if/else if" statements should not have the same condition	S1862	S1862	squid	<p>A chain of <code>if</code>/<code>else if</code> statements is evaluated from top to bottom. At most, only one branch will be executed: the first one with a condition that evaluates to <code>true</code>. </p>\n<p>Therefore, duplicating a condition automatically leads to dead code. Usually, this is due to a copy/paste error. At best, it's simply dead code and at worst, it's a bug that is likely to induce further bugs as the code is maintained, and obviously it could lead to unexpected behavior. </p>\n<h2>Noncompliant Code Example</h2>\n\n<pre>\nif (param == 1)\n  openWindow();\nelse if (param == 2)\n  closeWindow();\nelse if (param == 1)  // Noncompliant\n  moveWindowToTheBackground();\n}\n\n</pre>\n<h2>Compliant Solution</h2>\n\n<pre>\nif (param == 1)\n  openWindow();\nelse if (param == 2)\n  closeWindow();\nelse if (param == 3)\n  moveWindowToTheBackground();\n}\n\n</pre>\n<h2>See</h2>\n\n<ul>\n<li> <a href="https://www.securecoding.cert.org/confluence/x/NYA5">CERT, MSC12-C</a> - Detect and remove code that has no effect</li>\n<li> <a href="https://www.securecoding.cert.org/confluence/x/SIIyAQ">CERT, MSC12-CPP</a> - Detect and remove code that has no effect</li>\n</ul>	3	\N	READY	java	2015-11-20 10:43:08.717	2015-11-20 10:43:08.721	\N	\N	\N	\N	\N	43	\N	CONSTANT_ISSUE	\N	\N	\N	10min	\N	\N	bug,cert,pitfall,unused	f	HTML
219	Member variable visibility should be specified	S2039	S2039	squid	<p>Failing to explicitly declare the visibility of a member variable could result it in having a visibility you don't expect, and potentially leave it open to unexpected modification by other classes.</p>\n\n<h2>Noncompliant Code Sample</h2>\n<pre>\nclass Ball {\n  String color="red";  // Noncompliant\n}\nenum A {\n B;\n int a;\n}\n</pre>\n\n<h2>Compliant Solution</h2>\n<pre>\nclass Ball {\n  private String color="red";  // Compliant\n}\nenum A {\n B;\n private int a;\n}\n</pre>	2	\N	READY	java	2015-11-20 10:43:08.722	2015-11-20 10:43:08.722	\N	\N	\N	\N	\N	42	\N	CONSTANT_ISSUE	\N	\N	\N	5min	\N	\N	security	f	HTML
227	Parentheses should be removed from a single lambda input parameter when its type is inferred	S1611	S1611	squid	<p>There are two possible syntaxes for a lambda having only one input parameter with an inferred type: with and without parentheses around that single parameter. The simpler syntax, without parentheses, is more compact and readable than the one with parentheses, and is therefore preferred.</p>\n\n<h2>Noncompliant Code Example</h2>\n<pre>\n(x) -> x * 2\n</pre>\n\n<h2>Compliant Solution</h2>\n<pre>\nx -> x * 2\n</pre>	1	\N	READY	java	2015-11-20 10:43:08.728	2015-11-20 10:43:08.728	\N	\N	\N	\N	\N	15	\N	CONSTANT_ISSUE	\N	\N	\N	2min	\N	\N	java8	f	HTML
220	Silly equality checks should not be made	S2159	S2159	squid	<p>Comparisons of dissimilar types will always return false. The comparison and all its dependent code can simply be removed. This includes:</p>\n<ul>\n<li> comparing an object with null</li>\n<li> comparing an object with an unrelated primitive (E.G. a string with an int)</li>\n<li> comparing unrelated classes</li>\n<li> comparing an unrelated <code>final class</code> and <code>interface</code></li>\n<li> comparing an array to a non-array</li>\n<li> comparing two arrays</li>\n</ul>\n<p>Specifically in the case of arrays, since arrays don't override <code>Object.equals()</code>, calling <code>equals</code> on two arrays is the same as comparing their addresses. This means that <code>array1.equals(array2)</code> is equivalent to <code>array1==array2</code>.</p>\n<p>However, some developers might expect <code>Array.equals(Object obj)</code> to do more than a simple memory address comparison, comparing for instance the size and content of the two arrays. Instead, the <code>==</code> operator or <code>Arrays.equals(array1, array2)</code> should always be used with arrays.</p>\n<h2>Noncompliant Code Example</h2>\n\n<pre>\ninterface KitchenTool { ... };\ninterface Plant {...}\n\npublic final class Spatula implements KitchenTool { ... }\npublic class Tree implements Plant { ...}\n//...\n\nSpatula spatula = new Spatula();\nKitchenTool tool = spatula;\nKitchenTool [] tools = {tool};\n\nTree tree = new Tree();\nPlant plant = tree;\nTree [] trees = {tree};\n\n\nif (spatula.equals(tree)) { // Noncompliant; unrelated classes\n  // ...\n}\nelse if (spatula.equals(plant)) { // Noncompliant; unrelated final class and interface\n  // ...\n}\nelse if (tool.equals(tools)) { // Noncompliant; array &amp; non-array\n  // ...\n}\nelse if (trees.equals(tools)) {  // Noncompliant; incompatible arrays\n  // ...\n}\nelse if (tree.equals(null)) {  // Noncompliant\n  // ...\n}\n</pre>	2	\N	READY	java	2015-11-20 10:43:08.722	2015-11-20 10:43:08.723	\N	\N	\N	\N	\N	43	\N	CONSTANT_ISSUE	\N	\N	\N	15min	\N	\N	bug,unused	f	HTML
221	Public constants and fields initialized at declaration should be "static final" rather than merely "final"	S1170	S1170	squid	<p>Making a constant just <code>final</code> as opposed to <code>static final</code> leads to duplicating its value for every instance of the class, uselessly increasing the amount of memory required to execute the application.</p>\n<h2>Noncompliant Code Example</h2>\n\n<pre>\npublic class Myclass {\n  public final int THRESHOLD = 3;   \n}\n</pre>\n<h2>Compliant Solution</h2>\n\n<pre>\npublic class Myclass {\n  public static final int THRESHOLD = 3;    // Compliant\n}\n</pre>\n<h2>Exceptions (for Java)</h2>\n\n<p>No issues are reported on final fields of inner classes whose type is not a primitive or a String. Indeed according to the Java specification:</p>\n<blockquote>\n<p>An inner class is a nested class that is not explicitly or implicitly declared static. Inner classes may not declare static initializers (§8.7) or member interfaces. Inner classes may not declare static members, unless they are compile-time constant fields (§15.28).</p>\n</blockquote>	1	\N	READY	java	2015-11-20 10:43:08.723	2015-11-20 10:43:08.724	\N	\N	\N	\N	\N	29	\N	CONSTANT_ISSUE	\N	\N	\N	2min	\N	\N	convention	f	HTML
222	Only static class initializers should be used	S1171	S1171	squid	<p>Non-static initializers are rarely used, and can be confusing for most developers.</p>\n<p>When possible, they should be refactored into standard constructors or field initializers.</p>\n<h2>Noncompliant Code Example</h2>\n\n<pre>\nclass MyClass {\n  private static final Map&lt;String, String&gt; MY_MAP = new HashMap&lt;String, String&gt;() {\n\n    // Noncompliant - HashMap should be extended only to add behavior, not for initialization\n    {\n      put("a", "b");\n    }\n\n  };\n}\n</pre>\n<h2>Compliant Solution</h2>\n\n<pre>\nclass MyClass {\n  private static final Map&lt;String, String&gt; MY_MAP = new HashMap&lt;String, String&gt;();\n\n  static {\n    MY_MAP.put("a", "b");\n  }\n}\n</pre>\n<p>or using Guava:</p>\n<pre>\nclass MyClass {\n  // Compliant\n  private static final Map&lt;String, String&gt; MY_MAP = ImmutableMap.of("a", "b");\n}\n</pre>	2	\N	READY	java	2015-11-20 10:43:08.724	2015-11-20 10:43:08.724	\N	\N	\N	\N	\N	15	\N	CONSTANT_ISSUE	\N	\N	\N	30min	\N	\N	pitfall	f	HTML
223	Unused method parameters should be removed	S1172	S1172	squid	<p>Unused parameters are misleading. Whatever the value passed to such parameters is, the behavior will be the same.</p>\n<h2>Noncompliant Code Example</h2>\n\n<pre>\nvoid doSomething(int a, int b) {     // "b" is unused\n  compute(a);\n}\n</pre>\n<h2>Compliant Solution</h2>\n\n<pre>\nvoid doSomething(int a) { \n  compute(a);\n}\n</pre>\n<h2>Exceptions</h2>\n\n<p>Override and implementation methods are excluded, as are methods that are intended to be overridden.</p>\n<pre>\n@override\nvoid doSomething(int a, int b) {     // no issue reported on b\n  compute(a);\n}\n\npublic void foo(String s) {\n  // designed to be extended but noop in standard case\n}\n\nprotected void bar(String s) {\n  //open-closed principle\n}\n\npublic void qix(String s) {\n  throw new UnsupportedOperationException("This method should be implemented in subclasses");\n}\n</pre>\n<h2>See</h2>\n\n<ul>\n<li> MISRA C++:2008, 0-1-11</li>\n<li> MISRA C:2012, 2.7</li>\n</ul>	2	\N	READY	java	2015-11-20 10:43:08.724	2015-11-20 10:43:08.725	\N	\N	\N	\N	\N	16	\N	CONSTANT_ISSUE	\N	\N	\N	5min	\N	\N	misra,unused	f	HTML
224	The Array.equals(Object obj) method should not be used	S1294	S1294	squid	<p>Since arrays do not override <code>Object.equals()</code>, calling equals on two arrays is the same as comparing their addresses. This means that <code>array1.equals(array2)</code> is equivalent to <code>array1==array2</code>. </p>\n<p>However, some developers might expect <code>Array.equals(Object obj)</code> to do more than a simple memory address comparison, comparing for instance the size and content of the two arrays. To prevent such a misunderstanding, the '==' operator or <code>Arrays.equals(array1, array2)</code> must always be used in place of the <code>Array.equals(Object obj)</code> method.</p>\n<h2>Noncompliant Code Example</h2>\n\n<pre>\nif(array1.equals(array2)){...}\n</pre>\n<h2>Compliant Solution</h2>\n\n<pre>\nif(Arrays.equals(array1, array2)){...}\n</pre>\n<p>or</p>\n<pre>\nif(array1 == array2){...}\n</pre>\n\n<h2>Deprecated</h2>\n<p>This rule is deprecated, use {rule:squid:S2159} instead.</p>	3	\N	DEPRECATED	java	2015-11-20 10:43:08.725	2015-11-20 10:43:08.725	\N	\N	\N	\N	\N	42	\N	CONSTANT_ISSUE	\N	\N	\N	5min	\N	\N	\N	f	HTML
225	@FunctionalInterface annotation should be used to flag Single Abstract Method interfaces	S1609	S1609	squid	<p>A Single Abstract Method (SAM) interface is a Java interface containing only one method. The Java API is full of SAM interfaces, such as java.lang.Runnable, java.awt.event.ActionListener, java.util.Comparator and java.util.concurrent.Callable. SAM interfaces have a special place in Java 8 because they can be implemented using Lambda expressions or Method references.</p>\n\n<p>Using <code>@FunctionalInterface</code> forces a compile break when an additional, non-overriding abstract method is added to a SAM, which would break the use of Lambda implementations.</p>\n\n<h2>Noncompliant Code Example</h2>\n<pre>\n  public interface Changeable&lt;T&gt; {\n    public void change(T o);\n  }\n</pre>\n\n<h2>Compliant Solution</h2>\n<pre>\n  @FunctionalInterface\n  public interface Changeable&lt;T&gt; {\n    public void change(T o);\n  }\n</pre>	2	\N	READY	java	2015-11-20 10:43:08.726	2015-11-20 10:43:08.726	\N	\N	\N	\N	\N	16	\N	CONSTANT_ISSUE	\N	\N	\N	2min	\N	\N	java8	f	HTML
226	Classes should not be too complex	ClassCyclomaticComplexity	ClassCyclomaticComplexity	squid	<p>The Cyclomatic Complexity is measured by the number of <code>&amp;&amp;</code> and <code>||</code> operators and <code>if</code>, <code>while</code>, <code>do</code>, <code>for</code>, <code>?:</code>, <code>catch</code>, <code>switch</code>, <code>case</code>, <code>return</code> and <code>throw</code> statements in the body of a class plus one for each constructor, method, static initializer, or instance initializer in the class. The last return statement in method, if exists, is not taken into account.</p>\n<p>Even when the Cyclomatic Complexity of a class is very high, this complexity might be well distributed among all methods. Nevertheless, most of the time, a very complex class is a class which breaks the Single Responsibility Principle and which should be re-factored to be split in several classes.</p>	2	\N	READY	java	2015-11-20 10:43:08.727	2015-11-20 10:43:08.727	\N	\N	\N	\N	\N	16	\N	LINEAR_OFFSET	\N	1min	\N	10min	per complexity point over the threshold	\N	brain-overload	f	HTML
229	Lambdas should be replaced with method references	S1612	S1612	squid	<p>Method/constructor references are more compact and readable than using lambdas, and are therefore preferred.</p>\n\n<h2>Noncompliant Code Example</h2>\n<pre>\n  List<Integer> list = new ArrayList<Integer>();\n  list.add(0);\n  list.add(1);\n  list.add(2);\n\n    list.forEach(n -> { System.out.println(n); });\n</pre>\n\n<h2>Compliant Solution</h2>\n<pre>\n  List<Integer> list = new ArrayList<Integer>();\n  list.add(0);\n  list.add(1);\n  list.add(2);\n\n  list.forEach(System.out::println);\n</pre>	1	\N	READY	java	2015-11-20 10:43:08.732	2015-11-20 10:43:08.732	\N	\N	\N	\N	\N	15	\N	CONSTANT_ISSUE	\N	\N	\N	2min	\N	\N	java8	f	HTML
230	Dead stores should be removed	S1854	S1854	squid	<p>A dead store happens when a local variable is assigned a value, including <code>null</code> that is not read by any subsequent instruction. Calculating or retrieving a value only to then overwrite it or throw it away, could indicate a serious error in the code. Even if it's not an error, it is at best a waste of resources.</p>\n\n<p>Even assigning <code>null</code> to a variable is a dead store if the variable is not subsequently used. Assigning null as a hint to the garbage collector used to be common practice, but is no longer needed and such code should be eliminated.</p>\n\n<h2>Noncompliant Code Example</h2>\n<pre>\npublic void pow(int a, int b) {\n  if(b == 0) {\n    return 0;\n  }\n  int x = a;\n  for(int i= 1, i < b, i++) {\n    x = x * a;  //Dead store because the last return statement should return x instead of returning a\n  }\n  return a;\n}\n</pre>\n\n<h2>Compliant Solution</h2>\n<pre>\npublic void pow(int a, int b) {\n  if(b == 0) {\n    return 0;\n  }\n  int x = a;\n  for(int i= 1, i < b, i++) {\n    x = x * a;\n  }\n  return x;\n}\n</pre>	2	\N	READY	java	2015-11-20 10:43:08.733	2015-11-20 10:43:08.733	\N	\N	\N	\N	\N	39	\N	CONSTANT_ISSUE	\N	\N	\N	15min	\N	\N	cert,cwe,suspicious,unused	f	HTML
231	"toString()" should never be called on a String object	S1858	S1858	squid	<p>Invoking a method designed to return a string representation of an object which is already a string is a waste of keystrokes. This redundant construction may be optimized by the compiler, but will be confusing in the meantime.</p>\n\n<h2>Noncompliant Code Example</h2>\n\n<pre>\nString message = "hello world";\nSystem.out.println(message.toString()); // Noncompliant;\n</pre>\n\n<h2>Compliant Solution</h2>\n\n<pre>\nString message = "hello world";\nSystem.out.println(message);\n</pre>	2	\N	READY	java	2015-11-20 10:43:08.733	2015-11-20 10:43:08.734	\N	\N	\N	\N	\N	16	\N	CONSTANT_ISSUE	\N	\N	\N	5min	\N	\N	clumsy,pitfall	f	HTML
232	"Object.finalize()" should remain protected (versus public) when overriding	S1174	S1174	squid	<p>The contract of the <code>Object.finalize()</code> method is clear: only the Garbage Collector is supposed to call this method.</p>\n<p>Making this method public is misleading, because it implies that any caller can use it.</p>\n<h2>Noncompliant Code Example</h2>\n\n<pre>\npublic class MyClass {\n\n  @Override\n  public void finalize() {    // Noncompliant\n    /* ... */\n  }\n}\n</pre>\n<h2>See</h2>\n\n<ul>\n<li> <a href="http://cwe.mitre.org/data/definitions/583.html">MITRE, CWE-583</a> - finalize() Method Declared Public</li>\n<li> CERT Java Secure Coding, MET12-J - Do not use finalizers</li>\n</ul>	2	\N	READY	java	2015-11-20 10:43:08.734	2015-11-20 10:43:08.735	\N	\N	\N	\N	\N	38	\N	CONSTANT_ISSUE	\N	\N	\N	10min	\N	\N	cert,cwe,security	f	HTML
233	The signature of "finalize()" should match that of "Object.finalize()"	S1175	S1175	squid	<p><code>Object.finalize()</code> is called by the Garbage Collector sometime after the object becomes unreferenced.</p>\n<p>Overloading this method is misleading:</p>\n<ul>\n<li> The overload will not be called by the Garbage Collector.</li>\n<li> Users are not expected to call <code>Object.finalize()</code> and will get confused.</li>\n</ul>\n<p>Another name should be picked for the method.</p>\n<h2>Noncompliant Code Example</h2>\n\n<pre>\npublic int finalize(int someParameter) {        // Noncompliant\n  /* ... */\n}\n</pre>\n<h2>Compliant Solution</h2>\n\n<pre>\npublic int someBetterName(int someParameter) {  // Compliant\n  /* ... */\n}\n</pre>	2	\N	READY	java	2015-11-20 10:43:08.736	2015-11-20 10:43:08.737	\N	\N	\N	\N	\N	38	\N	CONSTANT_ISSUE	\N	\N	\N	10min	\N	\N	pitfall	f	HTML
234	Mutable members should not be stored or returned directly	S2384	S2384	squid	<p>\n  Mutable objects are those whose state can be changed.\n  For instance, an array is mutable, but a String is not.\n  Mutable class members should never be returned to a caller or accepted and stored directly.\n  Doing so leaves you vulnerable to unexpected changes in your class state.\n</p>\n<p>\n  Instead, a copy of the mutable object should be made, and that copy should be stored or returned.\n</p>\n<p>\n  This rule checks that arrays, collections and Dates are not stored or returned directly.\n</p>\n\n<h2>Noncompliant Code Example</h2>\n<pre>\nclass A {\n  private String [] strings;\n\n  public A () {\n    strings = new String[]{"first", "second"};\n  }\n\n  public String [] getStrings() {\n    return strings; // Noncompliant\n  }\n\n  public void setStrings(String [] strings) {\n    this.strings = strings;  // Noncompliant\n  }\n}\n\npublic class B {\n\n  private A a = new A();  // At this point a.strings = {"first", "second"};\n\n  public void wreakHavoc() {\n    a.getStrings()[0] = "yellow";  // a.strings = {"yellow", "second"};\n  }\n}\n</pre>\n\n<h2>Compliant Solution</h2>\n<pre>\nclass A {\n  private String [] strings;\n\n  public A () {\n    strings = new String[]{"first", "second"};\n  }\n\n  public String [] getStrings() {\n    return strings.clone();\n  }\n\n  public void setStrings(String [] strings) {\n    this.strings = strings.clone();\n  }\n}\n\npublic class B {\n\n  private A a = new A();  // At this point a.strings = {"first", "second"};\n\n  public void wreakHavoc() {\n    a.getStrings()[0] = "yellow";  // a.strings = {"first", "second"};\n  }\n}\n</pre>\n\n<h2>See</h2>\n<ul>\n  <li><a href="http://cwe.mitre.org/data/definitions/374">MITRE, CWE-374 - Passing Mutable Objects to an Untrusted Method</a></li>\n  <li><a href="http://cwe.mitre.org/data/definitions/375">MITRE, CWE-375 - Returning a Mutable Object ot an Untrusted Caller</a></li>\n  <li><a href="https://www.securecoding.cert.org/confluence/x/zQCuAQ">CERT, OBJ05-J - Defensively copy private mutable class members before returning their references</a></li>\n</ul>	3	\N	READY	java	2015-11-20 10:43:08.737	2015-11-20 10:43:08.737	\N	\N	\N	\N	\N	39	\N	CONSTANT_ISSUE	\N	\N	\N	5min	\N	\N	cert,cwe,security,unpredictable	f	HTML
235	Child class members should not shadow parent class members	S2387	S2387	squid	<p>Having a variable with the same name in two unrelated classes is fine, but do the same thing within a class hierarchy and you'll get confusion at best,\nchaos at worst. Perhaps even worse is the case where a child class field varies from the name of a parent class only by case.</p>\n\n<p>This rule ignores <code>private</code> parent class members, but in all other such cases, the child class field should be renamed.</p>\n\n<h2>Noncompliant Code Example</h2>\n\n<pre>\npublic class Fruit {\n  protected Season ripe;\n  protected Color flesh;\n\n  // ...\n}\n\npublic class Raspberry extends Fruit {\n  private boolean ripe;  // Noncompliant\n  private static Color FLESH; // Noncompliant\n}\n</pre>\n\n<h2>Compliant Solution</h2>\n\n<pre>\npublic class Fruit {\n  protected Season ripe;\n  protected Color flesh;\n\n  // ...\n}\n\npublic class Raspberry extends Fruit {\n  private boolean ripened;\n  private static Color FLESH_COLOR;\n}\n</pre>	2	\N	READY	java	2015-11-20 10:43:08.738	2015-11-20 10:43:08.743	\N	\N	\N	\N	\N	39	\N	CONSTANT_ISSUE	\N	\N	\N	5min	\N	\N	confusing	f	HTML
333	"TODO" tags should be handled	S1135	S1135	squid	<p><code>TODO</code> tags are commonly used to mark places where some more code is required, but which the developer wants to implement later.</p>\n<p>Sometimes the developer will not have the time or will simply forget to get back to that tag.</p>\n<p>This rule is meant to track those tags, and ensure that they do not go unnoticed.</p>\n<h2>Noncompliant Code Example</h2>\n\n<pre>\nvoid doSomething() {\n  // TODO\n}\n</pre>	0	\N	READY	java	2015-11-20 10:43:08.849	2015-11-20 10:43:08.849	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	f	HTML
236	Mutable fields should not be "public static"	S2386	S2386	squid	<p>There is no good reason to have a mutable object as the <code>public</code> (by default), <code>static</code> member of an <code>interface</code>. Such variables should be moved into classes and their visibility lowered. </p>\n<p>Similarly, mutable <code>static</code> members of classes and enumerations which are accessed directly, rather than through getters and setters, should be protected to the degree possible. That can be done by reducing visibility or making the field <code>final</code> if appropriate. </p>\n<p>Note that making a mutable field, such as an array, <code>final</code> will keep the variable from being reassigned, but doing so has no effect on the mutability of the internal state of the array (i.e. it doesn't accomplish the goal).</p>\n<p>This rule raises issues for <code>public static</code> array, <code>Collection</code>, <code>Date</code>, and <code>awt.Point</code> members.</p>\n<h2>Noncompliant Code Example</h2>\n\n<pre>\npublic interface MyInterface {\n  public static String [] strings; // Noncompliant\n}\n\npublic class A {\n  public static String [] strings1 = {"first","second"};  // Noncompliant\n  public static String [] strings2 = {"first","second"};  // Noncompliant\n  public static List&lt;String&gt; strings3 = new ArrayList&lt;&gt;();  // Noncompliant\n  // ...\n}\n</pre>\n<h2>See</h2>\n\n<ul>\n  <li> <a href="http://cwe.mitre.org/data/definitions/582.html">MITRE, CWE-582</a> - Array Declared Public, Final, and Static</li>\n  <li> <a href="http://cwe.mitre.org/data/definitions/607.html">MITRE, CWE-607</a> - Public Static Final Field References Mutable Object</li>\n</ul>	3	\N	READY	java	2015-11-20 10:43:08.743	2015-11-20 10:43:08.743	\N	\N	\N	\N	\N	18	\N	CONSTANT_ISSUE	\N	\N	\N	15min	\N	\N	cwe,security,unpredictable	f	HTML
237	"instanceof" operators that always return "true" or "false" should be removed	S1850	S1850	squid	<p><code>instanceof</code> operators that always return <code>true</code> or <code>false</code> are either useless or the result of a misunderstanding which could lead to unexpected behavior in production.</p>\n<h2>Noncompliant Code Example</h2>\n\n<pre>\npublic boolean isSuitable(Integer param) {\n...\n  if(param instanceof Number) {  //Always true as param is an Integer, unless param is null\n    doSomething();\n  }\n...\n}\n</pre>\n<h2>Compliant Solution</h2>\n\n<pre>\npublic boolean isSuitable(Integer param) {\n...\n  doSomething();\n...\n}\n</pre>\n<h2>See</h2>\n\n<ul>\n<li> <a href="http://cwe.mitre.org/data/definitions/571.html">MITRE, CWE-571</a> - Expression is Always True</li>\n<li> <a href="http://cwe.mitre.org/data/definitions/570.html">MITRE, CWE-570</a> - Expression is Always False</li>\n</ul>	2	\N	READY	java	2015-11-20 10:43:08.744	2015-11-20 10:43:08.744	\N	\N	\N	\N	\N	38	\N	CONSTANT_ISSUE	\N	\N	\N	5min	\N	\N	bug,cwe	f	HTML
238	Inner class calls to super class methods should be unambiguous	S2388	S2388	squid	<p>When an inner class extends another class, and both its outer class and its parent class have a method with the same name, calls to that method can be confusing. The compiler will resolve the call to the superclass method, but maintainers may be confused, so the superclass method should be called explicitly, using <code>super.</code>.</p>\n<h2>Noncompliant Code Example</h2>\n\n<pre>\npublic class Parent {\n  public void foo() { ... }\n}\n\npublic class Outer {\n\n  public void foo() { ... }\n\n  public class Inner extends Parent {\n\n    public void doTheThing() {\n      foo();  // Noncompliant; was Outer.this.foo() intended instead?\n      // ...\n    }\n  }\n}\n</pre>\n<h2>Compliant Solution</h2>\n\n<pre>\npublic class Parent {\n  public void foo() { ... }\n}\n\npublic class Outer {\n\n  public void foo() { ... }\n\n  public class Inner extends Parent {\n\n    public void doTheThing() {\n      super.foo();\n      // ...\n    }\n  }\n}\n</pre>	2	\N	READY	java	2015-11-20 10:43:08.745	2015-11-20 10:43:08.745	\N	\N	\N	\N	\N	16	\N	CONSTANT_ISSUE	\N	\N	\N	5min	\N	\N	pitfall	f	HTML
239	Abstract classes without fields should be converted to interfaces	S1610	S1610	squid	<p>With Java 8's "default method" feature, any abstract class without direct or inherited field should be converted into an interface.</p>\n\n<h2>Noncompliant Code Example</h2>\n<pre>\npublic abstract class Car {\n  public abstract void start(Environment c);\n\n  public void stop(Environment c) {\n    c.freeze(this);\n  }\n}\n</pre>\n\n<h2>Compliant Solution</h2>\n<pre>\npublic interface Car {\n  public void start(Environment c);\n\n  public default void stop(Environment c) {\n    c.freeze(this);\n  }\n}\n</pre>	2	\N	READY	java	2015-11-20 10:43:08.746	2015-11-20 10:43:08.746	\N	\N	\N	\N	\N	33	\N	CONSTANT_ISSUE	\N	\N	\N	10min	\N	\N	java8	f	HTML
241	"switch" statements should end with a "default" clause	SwitchLastCaseIsDefaultCheck	SwitchLastCaseIsDefaultCheck	squid	<p>The requirement for a final <code>default</code> clause is defensive programming. The clause should either take appropriate action, or contain a suitable comment as to why no action is taken.</p>\n\n<h2>Noncompliant Code Example</h2>\n<pre>\nswitch (param) {  //missing default clause\n  case 0:\n    doSomething();\n    break;\n  case 1:\n    doSomethingElse();\n    break;\n}\n\nswitch (param) {\n  default: // default clause should be the last one\n    error();\n    break;\n  case 0:\n    doSomething();\n    break;\n  case 1:\n    doSomethingElse();\n    break;\n}\n</pre>\n\n<h2>Compliant Solution</h2>\n<pre>\nswitch (param) {\n  case 0:\n    doSomething();\n    break;\n  case 1:\n    doSomethingElse();\n    break;\n  default:\n    error();\n    break;\n}\n</pre>\n\n<h2>See</h2>\n\n<ul>\n<li> MISRA C:2004, 15.0 - The MISRA C <em>switch</em> syntax shall be used.</li>\n<li> MISRA C:2004, 15.3 - The final clause of a switch statement shall be the default clause</li>\n<li> MISRA C++:2008, 6-4-3 - A switch statement shall be a well-formed switch statement.</li>\n<li> MISRA C++:2008, 6-4-6 - The final clause of a switch statement shall be the default-clause</li>\n<li> MISRA C:2012, 16.1 - All switch statements shall be well-formed</li>\n<li> MISRA C:2012, 16.4 - Every <em>switch</em> statement shall have a <em>default</em> label</li>\n<li> MISRA C:2012, 16.5 - A <em>default</em> label shall appear as either the first or the last <em>switch label</em> of a <em>switch</em> statement</li>\n<li> <a href="http://cwe.mitre.org/data/definitions/478.html">MITRE, CWE-478</a> - Missing Default Case in Switch Statement</li>\n<li> <a href="https://www.securecoding.cert.org/confluence/x/YgE">CERT, MSC01-C</a> - Strive for logical completeness</li>\n<li> <a href="https://www.securecoding.cert.org/confluence/x/JoIyAQ">CERT, MSC01-CPP</a> - Strive for logical completeness</li>\n</ul>	2	\N	READY	java	2015-11-20 10:43:08.747	2015-11-20 10:43:08.748	\N	\N	\N	\N	\N	43	\N	CONSTANT_ISSUE	\N	\N	\N	5min	\N	\N	cert,cwe,misra	f	HTML
242	Deprecated methods should not be used	CallToDeprecatedMethod	CallToDeprecatedMethod	squid	<p>Once deprecated, a method should no longer be used as it means that the method might be removed sooner or later.</p>\n<h2>See</h2>\n\n<ul>\n<li> <a href="http://cwe.mitre.org/data/definitions/477.html">MITRE, CWE-477</a> - Use of Obsolete Functions</li>\n<li> <a href="https://www.owasp.org/index.php/Top_10_2013-A9-Using_Components_with_Known_Vulnerabilities">OWASP Top Ten 2013 Category A9</a> - Using Components with Known Vulnerabilities</li>\n</ul>	1	\N	READY	java	2015-11-20 10:43:08.748	2015-11-20 10:43:08.748	\N	\N	\N	\N	\N	11	\N	CONSTANT_ISSUE	\N	\N	\N	15min	\N	\N	cwe,obsolete,owasp-a9,security	f	HTML
243	"deleteOnExit" should not be used	CallToFileDeleteOnExitMethod	CallToFileDeleteOnExitMethod	squid	<p>Use of <code>File.deleteOnExit()</code> is not recommended for the following reasons:</p>\n<ul>\n<li> The deletion occurs only in the case of a normal JVM shutdown but not when the JVM crashes or is killed.</li>\n<li> For each file handler, the memory associated to the handler is released only at the end of the process.</li>\n</ul>\n<h2>Noncompliant Code Example</h2>\n\n<pre>\nFile file = new File("file.txt");\nfile.deleteOnExit();  // Noncompliant\n</pre>	2	\N	READY	java	2015-11-20 10:43:08.749	2015-11-20 10:43:08.749	\N	\N	\N	\N	\N	29	\N	CONSTANT_ISSUE	\N	\N	\N	30min	\N	\N	performance	f	HTML
244	Threads should not be started in constructors	S2693	S2693	squid	<p>The problem with invoking <code>Thread.start()</code> in a constructor is that you'll have a confusing mess on your hands if the class is ever extended because the superclass' constructor will start the thread before the child class has truly been initialized.</p>\n\n<p>This rule raises an issue any time <code>start</code> is invoked in the constructor of a non-<code>final</code> class.</p>\n\n<h2>Noncompliant Code Example</h2>\n\n<pre>\npublic class MyClass {\n\n  Thread thread = null;\n\n  public MyClass(Runnable runnable) {\n    thread = new Thread(runnable);\n    thread.start(); // Noncompliant\n  }\n}\n</pre>	3	\N	READY	java	2015-11-20 10:43:08.749	2015-11-20 10:43:08.75	\N	\N	\N	\N	\N	46	\N	CONSTANT_ISSUE	\N	\N	\N	30min	\N	\N	multi-threading,pitfall	f	HTML
245	"indexOf" checks should not be for positive numbers	S2692	S2692	squid	<p>Most checks against an <code>indexOf</code> value compare it with -1 because 0 is a valid index. Any checks which look for values &gt;0 ignore the first element, which is likely a bug.\nIf the intent is merely to check inclusion of a value in a <code>String</code> or a <code>List</code>, consider using the <code>contains</code> method instead.</p>\n\n<p>For strings, if the intent is truly to find the first index after a specific character index, then use the version of <code>indexOf</code> which takes a start position argument.</p>\n\n<p>This rule raises an issue any time an <code>indexOf</code> value retrieved either from a <code>String</code> or a <code>List</code> is tested for a positive value.</p>\n\n<h2>Noncompliant Code Example</h2>\n\n<pre>\nString color = "blue";\nString name = "ishmael";\n\nList&lt;String&gt; strings = new ArrayList&lt;String&gt;();\nstrings.add(color);\nstrings.add(name);\n\nif (strings.indexOf(color) &gt; 0) {  // Noncompliant\n  // ...\n}\nif (name.indexOf("ish") &gt; 0) { // Noncompliant\n  // ...\n}\nif (name.indexOf("hma") &gt; 2) { // Noncompliant\n  // ...\n}\n</pre>\n\n<h2>Compliant Solution</h2>\n\n<pre>\nString color = "blue";\nString name = "ishmael";\n\nList&lt;String&gt; strings = new ArrayList&lt;String&gt;();\nstrings.add(color);\nstrings.add(name);\n\nif (strings.indexOf(color) &gt; -1) {\n  // ...\n}\nif (name.indexOf("ish") &gt;= 0) {\n  // ...\n}\nif (name.indexOf("hma") &gt; -1) {\n  // ...\n}\n</pre>	3	\N	READY	java	2015-11-20 10:43:08.75	2015-11-20 10:43:08.75	\N	\N	\N	\N	\N	43	\N	CONSTANT_ISSUE	\N	\N	\N	2min	\N	\N	pitfall	f	HTML
246	"PreparedStatement" and "ResultSet" methods should be called with valid indices	S2695	S2695	squid	<p>The parameters in a <code>PreparedStatement</code> are numbered from 1, not 0, so using any set method of a <code>PreparedStatement</code> with a number less than 1 is a bug, as is using an index higher than the number of parameters. Similarly, <code>ResultSet</code> indices also start at 1, rather than 0.</p>\n\n<h2>Noncompliant Code Example</h2>\n\n<pre>\nPreparedStatement ps = con.prepareStatement("SELECT fname, lname FROM employees where hireDate > ? and salary < ?");\nps.setDate(0, date);  // Noncompliant\nps.setDouble(3, salary);  // Noncompliant\n\nResultSet rs = ps.executeQuery();\nwhile (rs.next()) {\n  String fname = rs.getString(0);  // Noncompliant\n  // ...\n}\n</pre>\n\n<h2>Compliant Solution</h2>\n\n<pre>\nPreparedStatement ps = con.prepareStatement("SELECT fname, lname FROM employees where hireDate > ? and salary < ?");\nps.setDate(1, date);\nps.setDouble(2, salary);\n\nResultSet rs = ps.executeQuery();\nwhile (rs.next()) {\n  String fname = rs.getString(1);\n  // ...\n}\n</pre>	4	\N	READY	java	2015-11-20 10:43:08.751	2015-11-20 10:43:08.751	\N	\N	\N	\N	\N	42	\N	CONSTANT_ISSUE	\N	\N	\N	2min	\N	\N	bug,sql	f	HTML
247	Inner classes which do not reference their owning classes should be "static"	S2694	S2694	squid	<p>\n  A non-static inner class has a reference to its outer class, and access to the outer class' fields and methods.\n  That class reference makes the inner class larger and could cause the outer class instance to live in memory longer than necessary.\n</p>\n<p>\n  If the reference to the outer class isn't used, it is more efficient to make the inner class <code>static</code> (also called nested).\n  If the reference is used only in the class constructor, then explicitly pass a class reference to the constructor.\n  If the inner class is anonymous, it will also be necessary to name it.\n</p>\n<p>\n  However, while a nested/<code>static</code> class would be more efficient,\n  it's worth nothing that there are semantic differences between an inner class and a nested one:\n</p>\n<ul>\n  <li>an inner class can only be instantiated within the context of an instance of the outer class.</li>\n  <li>a nested (<code>static</code>) class can be instantiated independently of the outer class.</li>\n</ul>\n\n<h2>Noncompliant Code Example</h2>\n<pre>\npublic class Fruit {\n  // ...\n\n  public class Seed {  // Noncompliant; there's no use of the outer class reference so make it static\n    int germinationDays = 0;\n    public Seed(int germinationDays) {\n      this.germinationDays = germinationDays;\n    }\n    public int getGerminationDays() {\n      return germinationDays;\n    }\n  }\n}\n</pre>\n\n<h2>Compliant Solution</h2>\n<pre>\npublic class Fruit {\n  // ...\n\n  public static class Seed {\n    int germinationDays = 0;\n    public Seed(int germinationDays) {\n      this.germinationDays = germinationDays;\n    }\n    public int getGerminationDays() {\n      return germinationDays;\n    }\n  }\n}\n</pre>	2	\N	READY	java	2015-11-20 10:43:08.753	2015-11-20 10:43:08.753	\N	\N	\N	\N	\N	29	\N	CONSTANT_ISSUE	\N	\N	\N	15min	\N	\N	performance	f	HTML
248	Floating point numbers should not be tested for equality	S1244	S1244	squid	<p>Floating point math is imprecise because of the challenges of storing such values in a binary representation. Even worse, floating point math is not associative; push a <code>float</code> or a <code>double</code> through a series of simple mathematical operations and the answer will be different based on the order of those operation because of the rounding that takes place at each step.</p>\n<p>Even simple floating point assignments are not simple:</p>\n<pre>\nfloat f = 0.1; // 0.100000001490116119384765625\ndouble d = 0.1; // 0.1000000000000000055511151231257827021181583404541015625\n</pre>\n<p>(Results will vary based on compiler and compiler settings);</p>\n<p>Therefore, the use of the equality (<code>==</code>) and inequality (<code>!=</code>) operators on <code>float</code> or <code>double</code> values is almost always an error. Instead the best course is to avoid floating point comparisons altogether. When that is not possible, you should consider using one of Java's float-handling <code>Numbers</code> such as <code>BigDecimal</code> which can properly handle floating point comparisons. A third option is to look not for equality but for whether the value is close enough. I.e. compare the absolute value of the difference between the stored value and the expected value against a margin of acceptable error. Note that this does not cover all cases (<code>NaN</code> and <code>Infinity</code> for instance).</p>\n<p>This rule checks for the use of direct and indirect equality/inequailty tests on floats and doubles.</p>\n<h2>Noncompliant Code Example</h2>\n\n<pre> \nfloat myNumber = 3.146; \nif ( myNumber == 3.146f ) { //Noncompliant. Because of floating point imprecision, this will be false \n  // ... \n} \nif ( myNumber != 3.146f ) { //Noncompliant. Because of floating point imprecision, this will be true \n  // ... \n} \n\nif (myNumber &lt; 4 || myNumber &gt; 4) { // Noncompliant; indirect inequality test\n  // ...\n}\n\nfloat zeroFloat = 0.0f;\nif (zeroFloat == 0) {  // Noncompliant. Computations may end up with a value close but not equal to zero.\n}\n</pre>\n<h2>Compliant Solution</h2>\n\n<pre>\nfloat zeroFloat = 0.0f;\nif (Float.floatToRawIntBits(zeroFloat) == 0) { //Compliant for comparisons of zero. Using bit comparison ensures we compare zero values\n}\n</pre>\n<h2>Exceptions</h2>\n\n<p>Since <code>NaN</code> is not equal to itself, the specific case of testing a floating point value against itself is a valid test for <code>NaN</code> and is therefore ignored.</p>\n<pre>\nfloat f;\ndouble d;\nif(f != f) { // Compliant; test for NaN value\n  System.out.println("f is NaN");\n} else if (f != d) { // Noncompliant\n  // ...\n}\n</pre>\n<h2>See</h2>\n\n<ul>\n<li> MISRA C:2004, 13.3 - Floating-point expressions shall not be tested for equality or inequality.</li>\n<li> MISRA C++:2008, 6-2-2 - Floating-point expressions shall not be directly or indirectly tested for equality or inequality</li>\n</ul>	3	\N	READY	java	2015-11-20 10:43:08.753	2015-11-20 10:43:08.754	\N	\N	\N	\N	\N	42	\N	CONSTANT_ISSUE	\N	\N	\N	5min	\N	\N	bug,misra	f	HTML
249	Close curly brace and the next "else", "catch" and "finally" keywords should be located on the same line	RightCurlyBraceSameLineAsNextBlockCheck	RightCurlyBraceSameLineAsNextBlockCheck	squid	<p>Shared coding conventions make it possible for a team to collaborate efficiently.</p>\n<p>This rule makes it mandatory to place closing curly braces on the same line as the next <code>else</code>, <code>catch</code> or <code>finally</code> keywords.</p>\n<p>The following code snippet illustrates this rule:</p>\n<pre>\npublic void myMethod() {\n  if(something) {\n    executeTask();\n  } else if (somethingElse) {          // Compliant\n    doSomethingElse();\n  }\n  else {                               // Noncompliant\n     generateError();\n  }\n\n  try {\n    generateOrder();\n  } catch (Exception e) {              // Compliant\n    log(e);\n  }\n  finally {                            // Noncompliant\n    closeConnection();\n  }\n}\n</pre>	1	\N	READY	java	2015-11-20 10:43:08.754	2015-11-20 10:43:08.754	\N	\N	\N	\N	\N	15	\N	CONSTANT_ISSUE	\N	\N	\N	1min	\N	\N	convention	f	HTML
250	Redundant modifiers should not be used	S2333	S2333	squid	<p>The methods declared in an <code>interface</code> are <code>public</code> and <code>abstract</code> by default. Any variables are automatically <code>public static final</code>. There is no need to explicitly declare them so.</p>\n\n<p>Since annotations are implicitly interfaces, the same holds true for them as well.</p>\n\n<p>Similarly, the <code>final</code> modifier is redundant on any method of a <code>final</code> class.</p>\n\n<h2>Noncompliant Code Example</h2>\n<pre>\npublic interface Vehicle {\n\n  public void go(int speed, Direction direction);  // Noncompliant\n</pre>\n\n<h2>Compliant Solution</h2>\n<pre>\npublic interface Vehicle {\n\n  void go(int speed, Direction direction);\n</pre>	1	\N	READY	java	2015-11-20 10:43:08.755	2015-11-20 10:43:08.755	\N	\N	\N	\N	\N	15	\N	CONSTANT_ISSUE	\N	\N	\N	2min	\N	\N	clumsy	f	HTML
255	Return of boolean expressions should not be wrapped into an "if-then-else" statement	S1126	S1126	squid	<p>Return of boolean literal statements wrapped into <code>if-then-else</code> ones should be simplified.</p>\n<h2>Noncompliant Code Example</h2>\n\n<pre>\nif (expression) {  \n  return true;\n} else {\n  return false;\n}\n</pre>\n<h2>Compliant Solution</h2>\n\n<pre>\nreturn expression; \n</pre>\n<pre>\nreturn !!expression;\n</pre>	1	\N	READY	java	2015-11-20 10:43:08.76	2015-11-20 10:43:08.76	\N	\N	\N	\N	\N	15	\N	CONSTANT_ISSUE	\N	\N	\N	2min	\N	\N	clumsy	f	HTML
251	Instance methods should not write to "static" fields	S2696	S2696	squid	<p>Correctly updating a <code>static</code> field from a non-static method is tricky to get right and could easily lead to bugs if there are multiple class instances and/or multiple threads in play. Ideally, <code>static</code> fields are only updated from <code>synchronized static</code> methods.</p>\n\n<p>This rule raises an issue each time a <code>static</code> field is updated from a non-static method.</p>\n\n<h2>Noncompliant Code Example</h2>\n\n<pre>\npublic class MyClass {\n\n  private static int count = 0;\n\n  public void doSomething() {\n    //...\n    count++;  // Noncompliant\n  }\n}\n</pre>	3	\N	READY	java	2015-11-20 10:43:08.758	2015-11-20 10:43:08.758	\N	\N	\N	\N	\N	46	\N	CONSTANT_ISSUE	\N	\N	\N	20min	\N	\N	bug,multi-threading	f	HTML
252	Literal boolean values should not be used in condition expressions	S1125	S1125	squid	<p>Remove literal boolean values from conditional expressions to improve readability. Anything that can be tested for equality with a boolean value must itself be a boolean value, and boolean values can be tested atomically.</p>\n<h2>Noncompliant Code Example</h2>\n\n<pre>\nif (booleanVariable == true) { /* ... */ }\nif (booleanVariable != true) { /* ... */ }\nif (booleanVariable || false) { /* ... */ }\ndoSomething(!false);\n\nbooleanVariable = condition ? true : exp;\nbooleanVariable = condition ? false : exp;\nbooleanVariable = condition ?  exp : true;\nbooleanVariable = condition ?  exp : false;\nbooleanVariable = condition ?  true : false;\n</pre>\n<h2>Compliant Solution</h2>\n\n<pre>\nif (booleanVariable) { /* ... */ }\nif (!booleanVariable) { /* ... */ }\nif (booleanVariable) { /* ... */ }\ndoSomething(true);\n\nbooleanVariable = condition || exp;\nbooleanVariable = !condition &amp;&amp; exp;\nbooleanVariable = !condition ||  exp;\nbooleanVariable = condition &amp;&amp; exp;\nbooleanVariable = condition;\n</pre>	1	\N	READY	java	2015-11-20 10:43:08.758	2015-11-20 10:43:08.759	\N	\N	\N	\N	\N	15	\N	CONSTANT_ISSUE	\N	\N	\N	2min	\N	\N	clumsy	f	HTML
253	Local Variables should not be declared and then immediately returned or thrown	S1488	S1488	squid	<p>Declaring a variable only to immediately return or throw it is a bad practice.\nSome developers argue that the practice improves code readability, because it enables them to explicitly name what is being returned. However, this variable is an internal implementation detail that is not exposed to the callers of the method. The method name should be sufficient for callers to know exactly what will be returned.</p>\n\n<h2>Noncompliant Code Example</h2>\n\n<pre>\npublic long computeDurationInMilliseconds() {\n  long duration = (((hours * 60) + minutes) * 60 + seconds ) * 1000 ;\n  return duration;\n}\n\npublic void doSomething() {\n  RuntimeException myException = new RuntimeException();\n  throw myException;\n}\n</pre>\n<h2>Compliant Solution</h2>\n\n<pre>\npublic long computeDurationInMilliseconds() {\n  return (((hours * 60) + minutes) * 60 + seconds ) * 1000 ;\n}\n\npublic void doSomething() {\n  throw new RuntimeException();\n}\n</pre>	1	\N	READY	java	2015-11-20 10:43:08.759	2015-11-20 10:43:08.759	\N	\N	\N	\N	\N	15	\N	CONSTANT_ISSUE	\N	\N	\N	2min	\N	\N	clumsy	f	HTML
254	Tests should include assertions	S2699	S2699	squid	<p>\n  A test case without assertions ensures only that no exceptions are thrown. Beyond basic runnability, it ensures nothing about the behavior of the code under test.\n</p>\n<p>\n  This rule raises an exception when no assertions are found in a JUnit test.\n</p>\n\n<h2>Noncompliant Code Example</h2>\n<pre>\n@Test\npublic void testDoSomething() {  // Noncompliant\n  MyClass myClass = new MyClass();\n  myClass.doSomething();\n  assertThat(myClass.doSomething());  // Fest assertion stub with no checks\n}\n</pre>\n\n<h2>Compliant Solution</h2>\n<pre>\n@Test\npublic void testDoSomething() {\n  MyClass myClass = new MyClass();\n  assertNull(myClass.doSomething());  // JUnit assertion\n  assertThat(myClass.doSomething()).isNull();  // Fest assertion\n}\n</pre>	3	\N	READY	java	2015-11-20 10:43:08.759	2015-11-20 10:43:08.759	\N	\N	\N	\N	\N	51	\N	CONSTANT_ISSUE	\N	\N	\N	10min	\N	\N	junit	f	HTML
256	JUnit assertions should include messages	S2698	S2698	squid	<p>Adding messages to JUnit assertions is an investment in your future productivity. Spend a few seconds writing them now, and you'll save a lot of time on the other end when either the tests fail and you need to quickly diagnose the problem, or when you need to maintain the tests and the assertion messages work as a sort of documentation.</p>\n<h2>Noncompliant Code Example</h2>\n\n<pre>\nassertEquals(4, list.size());  // Noncompliant\n\nassertThat(list.get(0)).isEqualTo("pear");  // Noncompliant\n</pre>\n<h2>Compliant Solution</h2>\n\n<pre>\nassertEquals("There should have been 4 Fruits in the list", 4, list.size());\n\nassertThat(list.get(0)).as("check first element").overridingErrorMessage("The first element should be a pear, not a %s", list.get(0)).isEqualTo("pear"); \n</pre>	2	\N	READY	java	2015-11-20 10:43:08.767	2015-11-20 10:43:08.768	\N	\N	\N	\N	\N	51	\N	CONSTANT_ISSUE	\N	\N	\N	5min	\N	\N	junit	f	HTML
257	Useless parentheses around expressions should be removed to prevent any misunderstanding	UselessParenthesesCheck	UselessParenthesesCheck	squid	<p>\nUseless parentheses can sometimes be misleading and so should be removed.\n</p>\n\n<p>\nThe following code snippet illustrates this rule:\n</p>\n\n<pre>\nreturn 3;             // Compliant\nreturn (x);           // Noncompliant\nreturn (x + 1);       // Noncompliant\nint x = (y / 2 + 1);  // Noncompliant\nint y = (4+X) * y;    // Compliant\n</pre>	2	\N	READY	java	2015-11-20 10:43:08.769	2015-11-20 10:43:08.769	\N	\N	\N	\N	\N	15	\N	CONSTANT_ISSUE	\N	\N	\N	1min	\N	\N	confusing	f	HTML
258	Unused private method should be removed	UnusedPrivateMethod	UnusedPrivateMethod	squid	<p>Private methods that are never executed are dead code: unnecessary, inoperative code that should be removed. Cleaning out dead code decreases the size of the maintained codebase, making it easier to understand the program and preventing bugs from being introduced.</p>\n<h2>Noncompliant Code Example</h2>\n\n<pre>\npublic class Foo implements Serializable\n{\n  private Foo(){}     //Compliant, private empty constructor intentionally used to prevent any direct instantiation of a class.\n  public static void doSomething(){\n    Foo foo = new Foo();\n    ...\n  }\n  private void unusedPrivateMethod(){...}\n  private void writeObject(ObjectOutputStream s){...}  //Compliant, relates to the java serialization mechanism\n  private void readObject(ObjectInputStream in){...}  //Compliant, relates to the java serialization mechanism\n}\n</pre>\n<h2>Compliant Solution</h2>\n\n<pre>\npublic class Foo implements Serializable\n{\n  private Foo(){}     //Compliant, private empty constructor intentionally used to prevent any direct instantiation of a class.\n  public static void doSomething(){\n    Foo foo = new Foo();\n    ...\n  }\n\n  private void writeObject(ObjectOutputStream s){...}  //Compliant, relates to the java serialization mechanism\n\n  private void readObject(ObjectInputStream in){...}  //Compliant, relates to the java serialization mechanism\n}\n</pre>	2	\N	READY	java	2015-11-20 10:43:08.77	2015-11-20 10:43:08.77	\N	\N	\N	\N	\N	16	\N	CONSTANT_ISSUE	\N	\N	\N	5min	\N	\N	unused	f	HTML
259	Redundant casts should not be used	S1905	S1905	squid	<p>Unnecessary casting expressions make the code harder to read and understand.</p>\n\n<h2>Noncompliant Code Example</h2>\n<pre>\npublic void example() {\n  for (Foo obj : (List&lt;Foo&gt;) getFoos()) {  // Noncompliant; cast unnecessary because List&lt;Foo&gt; is what's returned\n  //...\n  }\n}\n\npublic List&lt;Foo&gt; getFoos() {\n  return this.foos;\n}\n</pre>\n\n<h2>Compliant Solution</h2>\n<pre>\npublic void example() {\n  for (Foo obj : getFoos()) {\n    //...\n  }\n}\n\npublic List&lt;Foo&gt; getFoos() {\n  return this.foos;\n}\n</pre>\n\n<h2>Exceptions</h2>\n<p>Casting may be required to distinguish the method to call in the case of overloading:</p>\n<pre>\nclass A {}\nclass B extends A{}\nclass C {\n  void fun(A a){}\n  void fun(B b){}\n\n  void foo() {\n    B b = new B();\n    fun(b);\n    fun((A) b); //call the first method so cast is not redundant.\n  }\n}\n</pre>	1	\N	READY	java	2015-11-20 10:43:08.771	2015-11-20 10:43:08.771	\N	\N	\N	\N	\N	16	\N	CONSTANT_ISSUE	\N	\N	\N	5min	\N	\N	clumsy	f	HTML
260	Useless imports should be removed	UselessImportCheck	UselessImportCheck	squid	<p>\nThe imports part of a file should be handled by the Integrated Development Environment (IDE), not manually by the developer.\nUnused and useless imports should not occur if that is the case.\nLeaving them in reduces the code's readability, since their presence can be confusing.\n</p>\n\n<p>The following code snippet illustrates this rule:</p>\n\n<pre>\npackage my.company;\n\nimport java.lang.String;        // Noncompliant - java.lang classes are always implicitly imported\nimport my.company.SomeClass;    // Noncompliant - same package files are always implicitly imported\nimport java.io.File;            // Noncompliant - File is not used\n\nimport my.company2.SomeType;\nimport my.company2.SomeType;    // Noncompliant - 'SomeType' is already imported\n\nclass ExampleClass {\n\n  public String someString;\n  public SomeType something;\n\n}\n</pre>	1	\N	READY	java	2015-11-20 10:43:08.771	2015-11-20 10:43:08.772	\N	\N	\N	\N	\N	15	\N	CONSTANT_ISSUE	\N	\N	\N	10min	\N	\N	unused	f	HTML
261	Cycles between packages should be removed	CycleBetweenPackages	CycleBetweenPackages	squid	<p>When several packages are involved in a cycle (package A &gt; package B &gt; package C &gt; package A, where "&gt;" means "depends upon"), that means those packages are highly coupled, and there is no way to reuse/extract one of those packages without importing all the other packages. Such cycle could quickly increase the effort required to maintain an application and embrace business change.</p>\n<p>SonarQube not only detect cycles between packages, but also calculates the minimum effort to break those cycles. This rule logs a violation on each source file having an outgoing dependency to be cut in order to break a cycle.</p>	2	\N	READY	java	2015-11-20 10:43:08.772	2015-11-20 10:43:08.772	\N	\N	\N	\N	\N	33	\N	CONSTANT_ISSUE	\N	\N	\N	1d	\N	\N	design	f	HTML
262	"switch" statements should not have too many "case" clauses	S1479	S1479	squid	<p>When <code>switch</code> statements have a large set of <code>case</code> clauses, it is usually an attempt to map two sets of data. A real map structure would be more readable and maintainable, and should be used instead.</p>	2	\N	READY	java	2015-11-20 10:43:08.773	2015-11-20 10:43:08.773	\N	\N	\N	\N	\N	35	\N	CONSTANT_ISSUE	\N	\N	\N	30min	\N	\N	brain-overload	f	HTML
263	Unused type parameters should be removed	S2326	S2326	squid	<p>Type parameters that aren't used are dead code, which can only distract and possibly confuse developers during maintenance. Therefore, unused type parameters should be removed.</p>\n<h2>Noncompliant Code Example</h2>\n\n<pre>\nint &lt;T&gt; Add(int a, int b) // Noncompliant; &lt;T&gt; is ignored\n{\n  return a + b; \n}\n</pre>\n<h2>Compliant Solution</h2>\n\n<pre>\nint Add(int a, int b)\n{\n  return a + b; \n}\n</pre>	2	\N	READY	java	2015-11-20 10:43:08.773	2015-11-20 10:43:08.774	\N	\N	\N	\N	\N	16	\N	CONSTANT_ISSUE	\N	\N	\N	5min	\N	\N	unused	f	HTML
264	Null should not be returned from a "Boolean" method	S2447	S2447	squid	<p>While <code>null</code> is technically a valid <code>Boolean</code> value, that fact, and the distinction between <code>Boolean</code> and <code>boolean</code> is easy to forget. So returning <code>null</code> from a <code>Boolean</code> method is likely to cause problems with callers' code.</p>\n\n<h2>Noncompliant Code Example</h2>\n<pre>\npublic Boolean isUsable() {\n  // ...\n  return null;  // Noncompliant\n}\n</pre>	3	\N	READY	java	2015-11-20 10:43:08.774	2015-11-20 10:43:08.774	\N	\N	\N	\N	\N	42	\N	CONSTANT_ISSUE	\N	\N	\N	20min	\N	\N	pitfall	f	HTML
265	Utility classes should not have public constructors	S1118	S1118	squid	<p>\nUtility classes, which are a collection of static members, are not meant to be instantiated.\nEven abstract utility classes, which can be extended, should not have public constructors.\n</p>\n\n<p>\nJava adds an implicit public constructor to every class which does not define at least one explicitly.\nHence, at least one non-public constructor should be defined.\n</p>\n\n<h2>Noncompliant Code Example</h2>\n\n<pre>\nclass StringUtils { // Noncompliant\n\n  public static String concatenate(String s1, String s2) {\n    return s1 + s2;\n  }\n\n}\n</pre>\n\n<h2>Compliant Solution</h2>\n\n<pre>\nclass StringUtils { // Compliant\n\n  private StringUtils() {\n  }\n\n  public static String concatenate(String s1, String s2) {\n    return s1 + s2;\n  }\n\n}\n</pre>	2	\N	READY	java	2015-11-20 10:43:08.774	2015-11-20 10:43:08.776	\N	\N	\N	\N	\N	16	\N	CONSTANT_ISSUE	\N	\N	\N	30min	\N	\N	design	f	HTML
266	Wildcard imports should not be used	S2208	S2208	squid	<p>Blindly importing all the classes in a package clutters the class namespace and could lead to conflicts between classes in different packages with the same name. On the other hand, specifically listing the necessary classes avoids that problem and makes clear which versions were wanted.</p>\n<h2>Noncompliant Code Example</h2>\n\n<pre>\nimport java.sql.*; // Noncompliant\nimport java.util.*; // Noncompliant\n\nprivate Date date; // Date class exists in java.sql and java.util. Which one is this?\n</pre>\n<h2>Compliant Solution</h2>\n\n<pre>\nimport java.sql.Date;\nimport java.util.List;\nimport java.util.ArrayList;\n\nprivate Date date;\n</pre>\n<h2>Exceptions</h2>\n\n<p>Static imports are ignored by this rule. E.G.</p>\n<pre>\nimport static java.lang.Math.*;\n</pre>	2	\N	READY	java	2015-11-20 10:43:08.776	2015-11-20 10:43:08.776	\N	\N	\N	\N	\N	15	\N	CONSTANT_ISSUE	\N	\N	\N	5min	\N	\N	pitfall	f	HTML
267	"static" members should be accessed statically	S2209	S2209	squid	<p>\n  While it is <em>possible</em> to access <code>static</code> members from a class instance, it's bad form,\n  and considered by most to be misleading because it implies to the readers of your code that\n  there's an instance of the member per class instance.\n</p>\n\n<h2>Noncompliant Code Example</h2>\n<pre>\npublic class A {\n  public static int counter = 0;\n}\n\npublic class B {\n  private A first = new A();\n  private A second = new A();\n\n  public void runUpTheCount() {\n    first.counter ++;  // Noncompliant\n    second.counter ++;  // Noncompliant. A.counter is now 2, which is perhaps contrary to expectations\n  }\n}\n</pre>\n\n<h2>Compliant Solution</h2>\n<pre>\npublic class A {\n  public static int counter = 0;\n}\n\npublic class B {\n  private A first = new A();\n  private A second = new A();\n\n  public void runUpTheCount() {\n    A.counter ++;  // Compliant\n    A.counter ++;  // Compliant\n  }\n}\n</pre>	2	\N	READY	java	2015-11-20 10:43:08.777	2015-11-20 10:43:08.777	\N	\N	\N	\N	\N	42	\N	CONSTANT_ISSUE	\N	\N	\N	5min	\N	\N	pitfall	f	HTML
268	"NOSONAR" should not be used to switch off issues	NoSonar	NoSonar	squid	<p>Any issue to quality rule can be deactivated with the <code>NOSONAR</code> marker. This marker is pretty useful to exclude false-positive results but sometimes it can abusively be used to hide real quality flaws.</p>\n<p>This rule allows to track and/or forbid use of this marker.</p>	2	\N	READY	java	2015-11-20 10:43:08.782	2015-11-20 10:43:08.782	\N	\N	\N	\N	\N	18	\N	CONSTANT_ISSUE	\N	\N	\N	1min	\N	\N	bad-practice	f	HTML
279	"notifyAll" should be used	S2446	S2446	squid	<code>notify</code> and <code>notifyAll</code> both wake up sleeping threads, but <code>notify</code> only rouses one, while <code>notifyAll</code> rouses all of them. Since <code>notify</code> might not wake up the right thread, <code>notifyAll</code> should be used instead.\n\n<h2>Noncompliant Code Example</h2>\n<pre>\nclass MyThread extends Thread{\n\n  @Override\n  public void run(){\n    synchronized(this){\n      // ...\n      notify();  // Noncompliant\n    }\n  }\n}\n</pre>\n\n<h2>Compliant Solution</h2>\n<pre>\nclass MyThread extends Thread{\n\n  @Override\n  public void run(){\n    synchronized(this){\n      // ...\n      notifyAll();\n    }\n  }\n}\n</pre>	3	\N	READY	java	2015-11-20 10:43:08.79	2015-11-20 10:43:08.79	\N	\N	\N	\N	\N	46	\N	CONSTANT_ISSUE	\N	\N	\N	2min	\N	\N	bug,multi-threading	f	HTML
269	Classes with only "static" methods should not be instantiated	S2440	S2440	squid	<p><code>static</code> methods can be accessed without an instance of the enclosing class, so there's no reason to instantiate a class that has only <code>static</code> methods.</p>\n\n<h2>Noncompliant Code Example</h2>\n<pre>\npublic class TextUtils {\n  public static String stripHtml(String source) {\n    return source.replaceAll("<[^>]+>", "");\n  }\n}\n\npublic class TextManipulator {\n\n  // ...\n\n  public void cleanText(String source) {\n    TextUtils textUtils = new TextUtils(); // Noncompliant\n\n    String stripped = textUtils.stripHtml(source);\n\n    //...\n  }\n}\n</pre>\n\n<h2>Compliant Solution</h2>\n<pre>\npublic class TextUtils {\n  public static String stripHtml(String source) {\n    return source.replaceAll("<[^>]+>", "");\n  }\n}\n\npublic class TextManipulator {\n\n  // ...\n\n  public void cleanText(String source) {\n    String stripped = TextUtils.stripHtml(source);\n\n    //...\n  }\n}\n</pre>\n\n<h2>See Also</h2>\n<ul>\n    <li>{rule:squid:S1118} - Utility classes should not have public constructors</li>\n</ul>	2	\N	READY	java	2015-11-20 10:43:08.783	2015-11-20 10:43:08.783	\N	\N	\N	\N	\N	16	\N	CONSTANT_ISSUE	\N	\N	\N	2min	\N	\N	clumsy	f	HTML
270	Multiline blocks should be enclosed in curly braces	S2681	S2681	squid	<p>\n  Curly braces can be omitted from a one-line block, such as with an <code>if</code> statement or <code>for</code> loop, but doing so can be misleading and induce bugs.\n</p>\n<p>\n  This rule raises an issue when the indentation of the lines after a one-line block indicates an intent to include those lines in the block,\n  but the omission of curly braces means the lines will be unconditionally executed once.\n</p>\n\n<h2>Noncompliant Code Example</h2>\n<pre>\nif (condition)\n  firstActionInBlock();\n  secondAction();  // Noncompliant; executed unconditionally\nthirdAction();\n\nString str = null;\nfor (int i = 0; i < array.length; i++)\n  str = array[i];\n  doTheThing(str);  // Noncompliant; executed only on last array element\n</pre>\n\n<h2>Compliant Solution</h2>\n<pre>\nif (condition) {\n  firstActionInBlock();\n  secondAction();\n}\nthirdAction();\n\nString str = null;\nfor (int i = 0; i < array.length; i++) {\n  str = array[i];\n  doTheThing(str);\n}\n</pre>	3	\N	READY	java	2015-11-20 10:43:08.783	2015-11-20 10:43:08.783	\N	\N	\N	\N	\N	43	\N	CONSTANT_ISSUE	\N	\N	\N	5min	\N	\N	bug	f	HTML
271	"compareTo" results should not be checked for specific values	S2200	S2200	squid	While most <code>compareTo</code> methods return -1, 0, or 1, some do not, and testing the result of a <code>compareTo</code> against a specific value other than 0 could result in false negatives.\n\n<h2>Noncompliant Code Example</h2>\n<pre>\nif (myClass.compareTo(arg) == -1) {  // Noncompliant\n  // ...\n}\n</pre>\n\n<h2>Compliant Solution</h2>\n<pre>\nif (myClass.compareTo(arg) &lt; 0) {\n  // ...\n}\n</pre>	2	\N	READY	java	2015-11-20 10:43:08.784	2015-11-20 10:43:08.784	\N	\N	\N	\N	\N	39	\N	CONSTANT_ISSUE	\N	\N	\N	5min	\N	\N	bug	f	HTML
272	"Lock" objects should not be "synchronized"	S2442	S2442	squid	<p>\n<code>java.util.concurrent.locks.Lock</code> offers far more powerful and flexible locking operations than are available with <code>synchronized</code> blocks.\nSo synchronizing on a <code>Lock</code> throws away the power of the object, and is just silly.\nInstead, such objects should be locked and unlocked using <code>tryLock()</code> and <code>unlock()</code>.\n</p>\n\n<h2>Noncompliant Code Example</h2>\n\n<pre>\nLock lock = new MyLockImpl();\nsynchronized(lock) {  // Noncompliant\n  //...\n}\n</pre>\n\n<h2>Compliant Solution</h2>\n\n<pre>\nLock lock = new MyLockImpl();\nlock.tryLock();\n//...\n</pre>	4	\N	READY	java	2015-11-20 10:43:08.784	2015-11-20 10:43:08.785	\N	\N	\N	\N	\N	16	\N	CONSTANT_ISSUE	\N	\N	\N	15min	\N	\N	clumsy,multi-threading	f	HTML
273	Non-serializable objects should not be stored in "HttpSessions"	S2441	S2441	squid	<p>If you have no intention of writting an <code>HttpSession</code> object to file, then storing non-<code>serializable</code> objects in it may not seem like a big deal. But whether or not you explicitly serialize the session, it may be written to disk anyway, as the server manages its memory use in a process called "passivation". Further, some servers automatically write their active sessions out to file at shutdown &amp; deserialize any such sessions at startup.</p>\n<p>The point is, that even though <code>HttpSession</code> does not <code>extend Serializable</code>, you must nonetheless assume that it will be serialized, and </p>\n<p>understand that if you've stored non-serializable objects in the session, errors will result. </p>\n\n<h2>Noncompliant Code Example</h2>\n<pre>\npublic class Address {\n  //...\n}\n\n//...\nHttpSession session = request.getSession();\nsession.setAttribute("address", new Address());  // Noncompliant; Address isn't serializable\n</pre>\n\n<h2>See</h2>\n<ul>\n  <li><a href="http://cwe.mitre.org/data/definitions/579.html">MITRE, CWE-579</a> - J2EE Bad Practices: Non-serializable Object Stored in Session</li>\n</ul>	3	\N	READY	java	2015-11-20 10:43:08.786	2015-11-20 10:43:08.786	\N	\N	\N	\N	\N	39	\N	CONSTANT_ISSUE	\N	\N	\N	20min	\N	\N	bug,cwe	f	HTML
274	Collections.emptyList(), emptyMap() and emptySet() should be used instead of Collections.EMPTY_LIST, EMPTY_MAP and EMPTY_SET	S1596	S1596	squid	<p>Since the introduction of generics in Java 5, it is recommended to use generic types such as <code>List&lt;String&gt;</code> instead of raw ones such as just <code>List</code>. Assigning a raw type into a generic one is not type safe, and will generate a warning. The old <code>EMPTY</em>...</code> fields of the <code>Collections</code> class return raw types, whereas the newer <code>empty...()</code> methods return generic ones.</p>\n<p>Developers will also more easily find the <code>emptyIterator()</code> and <code>emptyListIterator()</code> methods for which there is no field equivalent if they are used to call the methods.</p>\n<h2>Noncompliant Code Example</h2>\n\n<pre>\nList&lt;String&gt; collection1 = Collections.EMPTY_LIST;\nMap&lt;String, String&gt; collection2 = Collections.EMPTY_MAP;\nSet&lt;String&gt; collection3 = Collections.EMPTY_SET;\n</pre>\n<h2>Compliant Solution</h2>\n\n<pre>\nList&lt;String&gt; collection1 = Collections.emptyList();\nMap&lt;String, String&gt; collection2 = Collections.emptyMap();\nSet&lt;String&gt; collection3 = Collections.emptySet();\n</pre>	2	\N	READY	java	2015-11-20 10:43:08.787	2015-11-20 10:43:08.787	\N	\N	\N	\N	\N	15	\N	CONSTANT_ISSUE	\N	\N	\N	2min	\N	\N	obsolete,pitfall	f	HTML
275	Lazy initialization of "static" fields should be "synchronized"	S2444	S2444	squid	<p>In a multi-threaded situation, un-<code>synchronized</code> lazy initialization of non-<code>volatile</code> fields could mean that a second thread has access to a half-initizliaed object while the first thread is still creating it. Allowing such access could cause serious bugs. Instead. the initizliation block should be <code>synchronized</code> or the variable made <code>volatile</code>.</p>\n<p>Similarly, updates of such fields should also be <code>synchronized</code>.</p>\n<h2>Noncompliant Code Example</h2>\n\n<pre>\nprotected static Object instance = null;\n\npublic static Object getInstance() {\n    if (instance != null) {\n        return instance;\n    }\n\n    instance = new Object();  // Noncompliant\n    return instance;\n}\n</pre>\n<h2>Compliant Solution</h2>\n\n<pre>\nprotected static volatile Object instance = null;\n\npublic static Object getInstance() {\n    if (instance != null) {\n        return instance;\n    }\n\n    instance = new Object();\n    return instance;\n}\n</pre>\n<p>or </p>\n<pre>\nprotected static Object instance = null;\n\npublic static synchronized Object getInstance() {\n    if (instance != null) {\n        return instance;\n    }\n\n    instance = new Object();\n    return instance;\n}\n</pre>	3	\N	READY	java	2015-11-20 10:43:08.788	2015-11-20 10:43:08.788	\N	\N	\N	\N	\N	46	\N	CONSTANT_ISSUE	\N	\N	\N	30min	\N	\N	bug,multi-threading	f	HTML
283	Extensions and implementations should not be redundant	S1939	S1939	squid	<p>\nAll classes extend <code>Object</code> implicitly. Doing so explicitly is redundant.\n</p>\n\n<p>\n  Further, declaring the implementation of an interface <em>and</em> one if its parents is also redundant.\n  If you implement the interface, you also implicitly implement its parents and there's no need to do so explicitly.\n</p>\n\n<h2>Noncompliant Code Example</h2>\n<pre>\npublic interface MyFace {\n  // ...\n}\n\npublic interface MyOtherFace extends MyFace {\n  // ...\n}\n\npublic class Foo\n    extends Object // Noncompliant\n    implements MyFace, MyOtherFace {  // Noncompliant\n  //...\n}\n</pre>\n\n<h2>Compliant Solution</h2>\n<pre>\npublic interface MyFace {\n  // ...\n}\n\npublic interface MyOtherFace extends MyFace {\n  // ...\n}\n\npublic class Foo implements MyOtherFace {\n  //...\n}\n</pre>	1	\N	READY	java	2015-11-20 10:43:08.795	2015-11-20 10:43:08.795	\N	\N	\N	\N	\N	16	\N	CONSTANT_ISSUE	\N	\N	\N	1min	\N	\N	clumsy	f	HTML
276	Return values should not be ignored when function calls don't have any side effects	S2201	S2201	squid	<p>When the call to a function doesn't have any side effect, what is the point of ignoring the result of the function call ? In such case, either the function call is useless and should be dropped or the source code doesn't behave as expected. </p>\n<p>To prevent generating any false-positives, this rule triggers an issues only on the following predefined list of immutable classes in the Java API : String, Boolean, Integer, Double, Float, Byte, Character, Short, StackTraceElement.</p>\n<h2>Noncompliant Code Example</h2>\n\n<pre>\npublic void handle(String command){\n  command.toLowerCase(); // Noncompliant; result of method thrown away\n  ...\n}\n</pre>\n<h2>Compliant Solution</h2>\n\n<pre>\npublic void handle(String command){\n  String formattedCommand = command.toLowerCase();\n  ...\n}\n</pre>\n<h2>See</h2>\n\n<ul>\n<li> MISRA C:2012, 17.7 - The value returned by a function having non-void return type shall be used</li>\n<li> <a href="https://www.securecoding.cert.org/confluence/x/9YIRAQ">CERT, EXP12-C</a> - Do not ignore values returned by functions</li>\n<li> <a href="https://www.securecoding.cert.org/confluence/x/eoAyAQ">CERT, EXP12-CPP</a> - Do not ignore values returned by functions or methods</li>\n</ul>	3	\N	READY	java	2015-11-20 10:43:08.788	2015-11-20 10:43:08.789	\N	\N	\N	\N	\N	43	\N	CONSTANT_ISSUE	\N	\N	\N	10min	\N	\N	bug,cert,misra	f	HTML
277	Package declaration should match source file directory	S1598	S1598	squid	<p>By convention, a Java class' physical location (source directories) and its logical representation (packages) should be kept in sync. Thus a Java file located at "src/org/sonarqube/Foo.java" should have a package of "org.sonarqube".</p>\n\n<p>Unfortunately, this convention is not enforced by Java compilers, and nothing prevents a developer from making the "Foo.java" class part of the "com.apple" package, which could degrade the maintainability of both the class and its application.</p>	2	\N	READY	java	2015-11-20 10:43:08.789	2015-11-20 10:43:08.789	\N	\N	\N	\N	\N	16	\N	CONSTANT_ISSUE	\N	\N	\N	5min	\N	\N	pitfall	f	HTML
278	".equals()" should not be used to test the values of "Atomic" classes	S2204	S2204	squid	<p><code>AtomicInteger</code>, and <code>AtomicLong</code> extend <code>Number</code>, but they're distinct from <code>Integer</code> and <code>Long</code> and should be handled differently. <code>AtomicInteger</code> and <code>AtomicLong</code> are designed to support lock-free, thread-safe programming on single variables. As such, an <code>AtomicInteger</code> will only ever be "equal" to itself. Instead, you should <code>.get()</code> the value and make comparisons on it.</p>\n\n<p>This applies to all the atomic, seeming-primitive wrapper classes: <code>AtomicInteger</code>, <code>AtomicLong</code>, and <code>AtomicBoolean</code>.</p>\n\n<h2>Noncompliant Code Example</h2>\n<pre>\nAtomicInteger aInt1 = new AtomicInteger(0);\nAtomicInteger aInt2 = new AtomicInteger(0);\n\nif (aInt1.equals(aInt2)) { ... }  // Noncompliant\n</pre>\n\n<h2>Compliant Solution</h2>\n<pre>\nAtomicInteger aInt1 = new AtomicInteger(0);\nAtomicInteger aInt2 = new AtomicInteger(0);\n\nif (aInt1.get() == aInt2.get()) { ... }\n</pre>	4	\N	READY	java	2015-11-20 10:43:08.789	2015-11-20 10:43:08.79	\N	\N	\N	\N	\N	39	\N	CONSTANT_ISSUE	\N	\N	\N	5min	\N	\N	bug	f	HTML
309	Tabulation characters should not be used	S00105	S00105	squid	<p>\nDevelopers should not need to configure the tab width of their text editors in order to be able to read source code.\nSo the use of tabulation character must be banned.\n</p>	1	\N	READY	java	2015-11-20 10:43:08.833	2015-11-20 10:43:08.833	\N	\N	\N	\N	\N	15	\N	CONSTANT_ISSUE	\N	\N	\N	2min	\N	\N	convention	f	HTML
280	"private" methods that don't access instance data should be "static"	S2325	S2325	squid	<p>\n  <code>private</code> methods that don't access instance data can be <code>static</code>\n  to prevent any misunderstanding about the contract of the method.\n</p>\n\n<h2>Noncompliant Code Example</h2>\n<pre>\nclass Utilities {\n  private static String magicWord = "magic";\n\n  private String getMagicWord() { // Noncompliant\n    return magicWord;\n  }\n\n  private void setMagicWord(String value) { // Noncompliant\n    magicWord = value;\n  }\n\n}\n</pre>\n\n<h2>Compliant Solution</h2>\n<pre>\nclass Utilities {\n  private static String magicWord = "magic";\n\n  private static String getMagicWord() {\n    return magicWord;\n  }\n\n  private static void setMagicWord(String value) {\n    magicWord = value;\n  }\n\n}\n</pre>\n\n<h2>Exceptions</h2>\n<p>\n  When <code>java.io.Serializable</code> is implemented the following three methods are excluded by the rule:\n</p>\n<ul>\n  <li><code>private void writeObject(java.io.ObjectOutputStream out) throws IOException;</code></li>\n  <li><code>private void readObject(java.io.ObjectInputStream in) throws IOException, ClassNotFoundException;</code></li>\n  <li><code>private void readObjectNoData() throws ObjectStreamException;</code></li>\n</ul>	1	\N	READY	java	2015-11-20 10:43:08.793	2015-11-20 10:43:08.793	\N	\N	\N	\N	\N	16	\N	CONSTANT_ISSUE	\N	\N	\N	5min	\N	\N	pitfall	f	HTML
281	Blocks synchronized on fields should not contain assignments of new objects to those fields	S2445	S2445	squid	<p>Synchronizing on a class field synchronizes not on the field itself, but on the object assigned to it. So reassigning a field in a block synchronized on that field's contents immediately opens the block up to access by another thread.</p>\n<h2>Noncompliant Code Example</h2>\n\n<pre>\nprivate String color = "red";\n\nprivate void doSomething(){\n  synchronized(color) {  // lock is actually on object instance "red" referred to by the color variable\n    //...\n    color = "green"; // Noncompliant; other threads now allowed into this block\n    // ...\n  }\n}\n</pre>\n<h2>Compliant Solution</h2>\n\n<pre>\nprivate String color = "red";\nprivate Object lockObj = new Object();\n\nprivate void doSomething(){\n  synchronized(lockObj) {\n    //...\n    color = "green";\n    // ...\n  }\n}\n</pre>	4	\N	READY	java	2015-11-20 10:43:08.794	2015-11-20 10:43:08.794	\N	\N	\N	\N	\N	46	\N	CONSTANT_ISSUE	\N	\N	\N	15min	\N	\N	bug,multi-threading	f	HTML
282	Generic exceptions should never be thrown	S00112	S00112	squid	<p>Using such generic exceptions as <code>Error</code>, <code>RuntimeException</code>, <code>Throwable</code>, and <code>Exception</code> prevents calling methods from handling true, system-generated exceptions differently than application-generated errors. </p>\n<h2>Noncompliant Code Example</h2>\n\n<pre>\npublic void foo(String bar) throws Throwable {  // Noncompliant\n  throw new RuntimeException("My Message");     // Noncompliant\n}\n</pre>\n<h2>Compliant Solution</h2>\n\n<pre>\npublic void foo(String bar) {\n  throw new MyOwnRuntimeException("My Message"); \n}\n</pre>\n<h2>Exceptions</h2>\n\n<p>Generic exceptions in the signatures of overriding methods are ignored.</p>\n<pre>\n@Override\npublic void myMethod() throws Exception {...}\n</pre>\n<h2>See</h2>\n\n<ul>\n<li> <a href="http://cwe.mitre.org/data/definitions/397.html">MITRE, CWE-397</a> - Declaration of Throws for Generic Exception</li>\n</ul>	2	\N	READY	java	2015-11-20 10:43:08.794	2015-11-20 10:43:08.794	\N	\N	\N	\N	\N	40	\N	CONSTANT_ISSUE	\N	\N	\N	20min	\N	\N	cwe,error-handling,security	f	HTML
284	Synchronized classes Vector, Hashtable, Stack and StringBuffer should not be used	S1149	S1149	squid	<p>\nEarly classes of the Java API, such as <code>Vector</code>, <code>Hashtable</code> and <code>StringBuffer</code>, were synchronized to make them thread-safe.\nUnfortunately, synchronization has a big negative impact on performance, even when using these collections from a single thread.\n</p>\n\n<p>It is better to use their new unsynchronized replacements:</p>\n\n<ul>\n  <li><code>ArrayList</code> or <code>LinkedList</code> instead of <code>Vector</code></li>\n  <li><code>Deque</code> instead of <code>Stack</code></li>\n  <li><code>HashMap</code> instead of <code>Hashtable</code></li>\n  <li><code>StringBuilder</code> instead of <code>StringBuffer</code></li>\n</ul>\n\n<h2>Noncompliant Code Example</h2>\n\n<pre>\nVector cats = new Vector();\n</pre>\n\n<h2>Compliant Solution</h2>\n\n<pre>\nArrayList cats = new ArrayList(); \n</pre>\n\n<h2>Exceptions</h2>\n\n<p>Use of those synchronized classes is allowed in method signatures when overriding an existing method.</p>\n\n<pre>\n@Override\npublic Vector getCats() {...} \n</pre>	2	\N	READY	java	2015-11-20 10:43:08.795	2015-11-20 10:43:08.795	\N	\N	\N	\N	\N	31	\N	CONSTANT_ISSUE	\N	\N	\N	20min	\N	\N	multi-threading,performance	f	HTML
285	Non-serializable classes should not be written	S2118	S2118	squid	Nothing in a non-serializable class will be written out to file, and attempting to serialize such a class will result in an exception being thrown. Only a class that <code>implements Serializable</code> or one that extends such a class can successfully be serialized (or de-serialized).\n\n<h2>Noncompliant Code Example</h2>\n<pre>\npublic class Vegetable {  // neither implements Serializable nor extends a class that does\n  //...\n}\n\npublic class Menu {\n  public void meal() throws IOException {\n    Vegetable veg;\n    //...\n    FileOutputStream fout = new FileOutputStream(veg.getName());\n    ObjectOutputStream oos = new ObjectOutputStream(fout);\n    oos.writeObject(veg);  // Noncompliant. Nothing will be written\n  }\n}\n</pre>\n\n<h2>Compliant Solution</h2>\n<pre>\npublic class Vegetable implements Serializable {  // can now be serialized\n  //...\n}\n\npublic class Menu {\n  public void meal() throws IOException {\n    Vegetable veg;\n    //...\n    FileOutputStream fout = new FileOutputStream(veg.getName());\n    ObjectOutputStream oos = new ObjectOutputStream(fout);\n    oos.writeObject(veg);\n  }\n}\n</pre>	3	\N	READY	java	2015-11-20 10:43:08.796	2015-11-20 10:43:08.796	\N	\N	\N	\N	\N	39	\N	CONSTANT_ISSUE	\N	\N	\N	15min	\N	\N	pitfall,serialization	f	HTML
286	Variables should not be declared before they are relevant	S1941	S1941	squid	<p>\n  For the sake of clarity, variables should be declared as close to where they're used as possible.\n  This is particularly true when considering methods that contain early returns and the potential to throw exceptions.\n  In these cases, it is not only pointless, but also confusing to declare a variable that may never be used because conditions for an early return are met first.\n</p>\n\n<h2>Noncompliant Code Example</h2>\n<pre>\npublic boolean isConditionMet(int a, int b) {\n  int difference = a - b;\n  MyClass foo = new MyClass(a);  // Noncompliant; not used before early return\n\n  if (difference &lt; 0) {\n    return false;\n  }\n\n  // ...\n\n  if (foo.doTheThing()) {\n    return true;\n  }\n  return false;\n}\n</pre>\n\n<h2>Compliant Solution</h2>\n<pre>\npublic boolean isConditionMet(int a, int b) {\n  int difference = a - b;\n\n  if (difference &lt; 0) {\n    return false;\n  }\n\n  // ...\n\n  MyClass foo = new MyClass(a);\n  if (foo.doTheThing()) {\n    return true;\n  }\n  return false;\n}\n</pre>	2	\N	READY	java	2015-11-20 10:43:08.796	2015-11-20 10:43:08.796	\N	\N	\N	\N	\N	15	\N	CONSTANT_ISSUE	\N	\N	\N	5min	\N	\N	brain-overload	f	HTML
322	Abstract class names should comply with a naming convention	S00118	S00118	squid	<p>Sharing some naming conventions is a key point to make it possible for a team to efficiently collaborate. This rule allows to check that all abstract class names match a provided regular expression.</p>\n<p>The following code snippet illustrates this rule:</p>\n<pre>\nabstract class MyClass { // Noncompliant\n}\n\nclass AbstractLikeClass { // Noncompliant\n}\n\nabstract class AbstractClass { // Compliant\n}\n</pre>	1	\N	READY	java	2015-11-20 10:43:08.84	2015-11-20 10:43:08.84	\N	\N	\N	\N	\N	15	\N	CONSTANT_ISSUE	\N	\N	\N	10min	\N	\N	convention	f	HTML
287	A field should not duplicate the name of its containing class	S1700	S1700	squid	<p>It's confusing to have a class member with the same name (case differences aside) as its enclosing class. This is particularly so when you consider the common practice of naming a class instance for the class itself.</p>\n<p>Best practice dictates that any field or member with the same name as the enclosing class be renamed to be more descriptive of the particular aspect of the class it represents or holds.</p>\n\n<h2>Noncompliant Code Example</h2>\n<pre>\npublic class Foo { \n  private String foo; \n\n  public String getFoo() { } \n} \n\nFoo foo = new Foo(); \nfoo.getFoo() // what does this return? \n</pre> \n\n<h2>Compliant Solution</h2>\n<pre>\npublic class Foo {\n  private String name; \n\n  public String getName() { }\n}\n\n//...\n\nFoo foo = new Foo();\nfoo.getName()\n\n</pre>\n<h2>Exceptions</h2>\n\n<p>When the type of the field is the containing class and that field is static, no issue is raised to allow singletons named like the type. </p>\n<pre>\npublic class Foo {\n  ...\n  private static Foo foo;\n  public Foo getInstance() {\n    if(foo==null) {\n      foo = new Foo();\n    }\n    return foo;\n  }\n  ...\n}\n</pre>	2	\N	READY	java	2015-11-20 10:43:08.802	2015-11-20 10:43:08.802	\N	\N	\N	\N	\N	16	\N	CONSTANT_ISSUE	\N	\N	\N	10min	\N	\N	brain-overload	f	HTML
288	Fields and methods should not have conflicting names	S1701	S1701	squid	<p>It's confusing to have a class field with the same name as a method in the class. It's also confusing to have multiple fields that differ only in capitalization</p>\n<p>Typically this situation indicates poor naming. Method names should be action-oriented, and thus contain a verb, which is unlikely in the case where both a method and a member have the same name. However, renaming a public method could be disruptive to callers. Therefore renaming the member is the recommended action.</p>\n<h2>Compliant Solution</h2>\n\n<pre>\npublic class Foo {\n\n  public static final String NAME_QUERY = "Select name from person";\n  private String queryString; // member has been renamed\n  public String query() { \n    // do something...\n  }\n\n  private void doSomething() {\n\n    String tmp = query; // results in a compile error\n    String tmp2 = query(); // no question now what was intended\n  }\n}\n</pre>	2	\N	READY	java	2015-11-20 10:43:08.803	2015-11-20 10:43:08.803	\N	\N	\N	\N	\N	43	\N	CONSTANT_ISSUE	\N	\N	\N	10min	\N	\N	brain-overload	f	HTML
289	Classes and methods that rely on the default system encoding should not be used	S1943	S1943	squid	<p>Using classes and methods that rely on the default system encoding can result in code that works fine in its "home" environment. But that code may break for customers who use different encodings in ways that are extremely difficult to diagnose and nearly, if not completely, impossible to reproduce when it's time to fix them.</p>\n<p>This rule detects uses of the following classes and methods:</p>\n<ul>\n<li> <code>FileReader</code></li>\n<li> <code>FileWriter</code></li>\n<li> String constructors with a <code>byte[]</code> argument but no <code>Charset</code> argument</li>\n<ul>\n<li> <code>String(byte[] bytes)</code></li>\n<li> <code>String(byte[] bytes, int offset, int length)</code> </li>\n</ul>\n<li> <code>String.getBytes()</code></li>\n<li> <code>String.getBytes(int srcBegin, int srcEnd, byte[] dst, int dstBegin)</code></li>\n<li> <code>InputStreamReader(InputStream in)</code></li>\n<li> <code>OutputStreamWriter(OutputStream out)</code></li>\n<li> <code>ByteArrayOutputStream.toString()</code></li>\n<li> Some <code>Formatter</code> constructors</li>\n<ul>\n<li> <code>Formatter(String fileName)</code></li>\n<li> <code>Formatter(File file)</code></li>\n<li> <code>Formatter(OutputStream os)</code></li>\n</ul>\n<li> Some <code>Scanner</code> constructors</li>\n<ul>\n<li> <code>Scanner(File source)</code></li>\n<li> <code>Scanner(Path source)</code></li>\n<li> <code>Scanner(InputStream source)</code></li>\n</ul>\n<li> Some <code>PrintStream</code> constructors</li>\n<ul>\n<li> <code>PrintStream(File file)</code></li>\n<li> <code>PrintStream(OutputStream out)</code></li>\n<li> <code>PrintStream(OutputStream out, boolean autoFlush)</code></li>\n<li> <code>PrintStream(String fileName)</code></li>\n</ul>\n<li> Some <code>PrintWriter</code> constructors</li>\n<ul>\n<li> <code>PrintWriter(File file)</code></li>\n<li> <code>PrintWriter(OutputStream out)</code></li>\n<li> <code>PrintWriter(OutputStream out, boolean autoFlush)</code></li>\n<li> <code>PrintWriter(String fileName)</code></li>\n</ul>\n<li> <code>IOUtils</code> methods which accept an encoding argument when that argument is null, and overloads of those methods that omit the encoding argument</li>\n</ul>	2	\N	READY	java	2015-11-20 10:43:08.803	2015-11-20 10:43:08.803	\N	\N	\N	\N	\N	38	\N	CONSTANT_ISSUE	\N	\N	\N	15min	\N	\N	bug	f	HTML
290	"indexOf" checks should use a start position	S2912	S2912	squid	<p>\n  One thing that makes good code good is the clarity with which it conveys the intent of the original programmer to maintainers,\n  and the proper choice of <code>indexOf</code> methods can help move code from confusing to clear.\n</p>\n\n<p>\n  If you need to see whether a substring is located beyond a certain point in a string,\n  you can test the <code>indexOf</code> the substring versus the target point, or you can use the version of <code>indexOf</code>\n  which takes a starting point argument. The latter is arguably clearer because the result is tested against -1,\n  which is an easily recognizable "not found" indicator.\n</p>\n\n<h2>Noncompliant Code Example</h2>\n<pre>\nString name = "ismael";\n\nif (name.indexOf("ae") > 2) { // Noncompliant\n// ...\n}\n</pre>\n\n<h2>Compliant Solution</h2>\n<pre>\nString name = "ismael";\n\nif (name.indexOf("ae", 2) > -1) {\n// ...\n}\n</pre>	2	\N	READY	java	2015-11-20 10:43:08.805	2015-11-20 10:43:08.805	\N	\N	\N	\N	\N	16	\N	CONSTANT_ISSUE	\N	\N	\N	5min	\N	\N	confusing	f	HTML
291	Fields in a "Serializable" class should either be transient or serializable	S1948	S1948	squid	<p>Fields in a <code>Serializable</code> class must themselves be either <code>Serializable</code> or <code>transient</code> even if the class is never explicitly serialized or deserialized. That's because under load, most J2EE application frameworks flush objects to disk, and an allegedly <code>Serializable</code> object with non-transient, non-serializable data members could cause program crashes, and open the door to attackers.</p>\n\n<h2>Noncompliant Code Example</h2>\n<pre>\npublic class Address {\n  //...\n}\n\npublic class Person implements Serializable {\n  private static final long serialVersionUID = 1905122041950251207L;\n\n  private String name;\n  private Address address;  // Noncompliant; Address isn't serializable\n}\n</pre>\n\n<h2>Compliant Example</h2>\n<pre>\npublic class Address implements Serializable {\n  private static final long serialVersionUID = 2405172041950251807L;\n}\n\npublic class Person implements Serializable {\n  private static final long serialVersionUID = 1905122041950251207L;\n\n  private String name;\n  private Address address;\n}\n</pre>\n\n<h2>Exceptions</h2>\n<p>The alternative to making all members <code>serializable</code> or <code>transient</code> is to implement special methods which take on the responsibility of properly serializing and de-serializing the object. This rule ignores classes which implement the following methods:</p>\n\n<pre>\nprivate void writeObject(java.io.ObjectOutputStream out) throws IOException\nprivate void readObject(java.io.ObjectInputStream in) throws IOException, ClassNotFoundException;\n</pre>\n\n<h2>See</h2>\n    <ul>\n      <li><a href="http://cwe.mitre.org/data/definitions/594.html">MITRE, CWE-594</a> - Saving Unserializable Objects to Disk</li>\n      <li><a href="http://docs.oracle.com/javase/6/docs/api/java/io/Serializable.html">Oracle Java 6, Serializable</a></li>\n      <li><a href="http://docs.oracle.com/javase/7/docs/api/java/io/Serializable.html">Oracle Java 7, Serializable</a></li>\n    </ul>	3	\N	READY	java	2015-11-20 10:43:08.807	2015-11-20 10:43:08.808	\N	\N	\N	\N	\N	39	\N	CONSTANT_ISSUE	\N	\N	\N	30min	\N	\N	bug,cwe,serialization	f	HTML
292	Methods should not have too many parameters	S00107	S00107	squid	<p>A long parameter list can indicate that a new structure should be created to wrap the numerous parameters or that the function is doing too many things.</p>\n<h2>Noncompliant Code Example</h2>\n\n<p>With a maximum number of 4 parameters:</p>\n<pre>\npublic void doSomething(int param1, int param2, int param3, String param4, long param5) {\n...\n}\n</pre>\n<h2>Compliant Solution</h2>\n\n<pre>\npublic void doSomething(int param1, int param2, int param3, String param4) {\n...\n}\n</pre>	2	\N	READY	java	2015-11-20 10:43:08.809	2015-11-20 10:43:08.809	\N	\N	\N	\N	\N	51	\N	CONSTANT_ISSUE	\N	\N	\N	20min	\N	\N	brain-overload	f	HTML
293	Try-catch blocks should not be nested	S1141	S1141	squid	<p>Nesting <code>try</code>/<code>catch</code> blocks severely impacts the readability of source code because it makes it too difficult to understand which block will catch which exception.</p>	2	\N	READY	java	2015-11-20 10:43:08.824	2015-11-20 10:43:08.824	\N	\N	\N	\N	\N	15	\N	CONSTANT_ISSUE	\N	\N	\N	20min	\N	\N	confusing	f	HTML
294	Increment (++) and decrement (--) operators should not be mixed with other operators in an expression	S881	S881	squid	<p>The use of increment and decrement operators in combination with other arithmetic operators is not recommended, because:</p>\n<p>It can significantly impair the readability of the code.</p>\n<p>It introduces additional side effects into a statement, with the potential for undefined behavior.</p>\n<p>It is safer to use these operators in isolation from any other arithmetic operators.</p>\n<h2>Noncompliant Code Example</h2>\n\n<pre>\nu8a = ++u8b + u8c--; \nfoo = bar++ / 4;\n</pre>\n<h2>Compliant Solution</h2>\n\n<p>The following sequence is clearer and therefore safer:</p>\n<pre>\n++u8b;    \nu8a = u8b + u8c; \nu8c--; \nfoo = bar / 4;\nbar++;\n</pre>\n<h2>See</h2>\n\n<ul>\n<li> MISRA C:2004, 12.1</li>\n<li> MISRA C:2004, 12.13</li>\n<li> MISRA C:2004, 13.3</li>\n<li> MISRA C++:2008, 5-2-10</li>\n<li> MISRA C:2012, 12.1</li>\n<li> MISRA C:2012, 13.3</li>\n<li> <a href="https://www.securecoding.cert.org/confluence/x/ZwE">CERT, EXP30-C</a> - \tDo not depend on the order of evaluation for side effects</li>\n<li> <a href="https://www.securecoding.cert.org/confluence/x/fYAyAQ">CERT, EXP30-CPP</a> - Do not depend on order of evaluation between sequence points</li>\n<li> <a href="https://www.securecoding.cert.org/confluence/x/yQC7AQ">CERT, EXP05-J</a> - Do not follow a write by a subsequent write or read of the same object within an expression</li>\n</ul>	2	\N	READY	java	2015-11-20 10:43:08.824	2015-11-20 10:43:08.825	\N	\N	\N	\N	\N	43	\N	CONSTANT_ISSUE	\N	\N	\N	5min	\N	\N	cert,misra	f	HTML
295	Invalid "Date" values should not be used	S2110	S2110	squid	<p>Whether the valid value ranges for <code>Date</code> fields start with 0 or 1 varies by field. For instance, month starts at 0, and day of month starts at 1. Enter a date value that goes past the end of the valid range, and the date will roll without error or exception. For instance, enter 12 for month, and you'll get January of the following year.</p>\n\n<p>This rule checks for bad values used in conjunction with <code>java.util.Date</code>, <code>java.sql.Date</code>, and <code>java.util.Calendar</code>. Specifically, values outside of the valid ranges:</p>\n<table>\n  <thead>\n  <tr><td>Field</td> <td>Valid</td></tr>\n  </thead>\n  <tbody>\n    <tr><td>month</td><td>0-11</td></tr>\n    <tr><td>date (day)</td><td>0-31</td></tr>\n    <tr><td>hour</td><td>0-23</td></tr>\n    <tr><td>minute</td><td>0-60</td></tr>\n    <tr><td>second</td><td>0-61</td></tr>\n  </tbody>\n</table>\n\n<p>Note that this rule does not check for invalid leap years, leap seconds (second = 61), or invalid uses of the 31st day of the month.</p>\n\n<h2>Noncompliant Code Example</h2>\n<pre>\nDate d = new Date();\nd.setDate(25);\nd.setYear(2014);\nd.setMonth(12);  // Noncompliant; rolls d into the next year\n\nCalendar c = new GregorianCalendar(2014, 12, 25);  // Noncompliant\nif (c.get(Calendar.MONTH) == 12) {  // Noncompliant; invalid comparison\n  // ...\n}\n</pre>\n\n<h2>Compliant Solution</h2>\n<pre>\nDate d = new Date();\nd.setDate(25);\nd.setYear(2014);\nd.setMonth(11);\n\nCalendar c = new Gregorian Calendar(2014, 11, 25);\nif (c.get(Calendar.MONTH) == 11) {\n  // ...\n}\n</pre>	3	\N	READY	java	2015-11-20 10:43:08.825	2015-11-20 10:43:08.825	\N	\N	\N	\N	\N	42	\N	CONSTANT_ISSUE	\N	\N	\N	5min	\N	\N	bug	f	HTML
296	Methods should not have too many return statements	S1142	S1142	squid	<p>Having too many return statements in a method increases the method's essential complexity because the flow of execution is broken each time a return statement is encountered. This makes it harder to read and understand the logic of the method.</p>\n<h2>Noncompliant Code Example</h2>\n\n<p>With the default threshold of 3:</p>\n<pre>\npublic boolean myMethod() { // Noncompliant; there are 4 return statements\n  if (condition1) {\n    return true;\n  } else {\n    if (condition2) {\n      return false;\n    } else {\n      return true;\n    }\n  }\n  return false;\n}\n</pre>	2	\N	READY	java	2015-11-20 10:43:08.825	2015-11-20 10:43:08.826	\N	\N	\N	\N	\N	16	\N	CONSTANT_ISSUE	\N	\N	\N	20min	\N	\N	brain-overload	f	HTML
297	Non-public methods should not be "@Transactional"	S2230	S2230	squid	Marking a non-public method <code>@Transactional</code> is both useless and misleading because Spring doesn't "see" non-<code>public</code> methods, and so makes no provision for their proper invocation. Nor does Spring make provision for the methods invoked by the method it called.\n\nTherefore marking a <code>private</code>  method, for instance, <code>@Transactional</code> can only result in a runtime error or exception if the method is actually written to be <code>@Transactional</code>.\n\n<h2>Noncompliant Code Example</h2>\n<pre>\n@Transactional  // Noncompliant\nprivate void doTheThing(ArgClass arg) {\n  // ...\n}\n</pre>	3	\N	READY	java	2015-11-20 10:43:08.826	2015-11-20 10:43:08.827	\N	\N	\N	\N	\N	42	\N	CONSTANT_ISSUE	\N	\N	\N	20min	\N	\N	bug,spring	f	HTML
298	"return" statements should not occur in "finally" blocks	S1143	S1143	squid	<p>Returning from a <code>finally</code> block suppresses the propagation of any unhandled <code>Throwable</code> which was thrown in the <code>try</code> or <code>catch</code> block.</p>\n<h2>Noncompliant Code Example</h2>\n\n<pre>\npublic static void main(String[] args) {\n  try {\n    doSomethingWhichThrowsException();\n    System.out.println("OK");   // incorrect "OK" message is printed\n  } catch (RuntimeException e) {\n    System.out.println("ERROR");  // this message is not shown\n  }\n}\n\npublic static void doSomethingWhichThrowsException() {\n  try {\n    throw new RuntimeException();\n  } finally {\n    /* ... */\n    return;      // Noncompliant - prevents the RuntimeException from being propagated\n  }\n}\n</pre>\n\n<h2>Compliant Solution</h2>\n<pre>\npublic static void main(String[] args) {\n  try {\n    doSomethingWhichThrowsException();\n    System.out.println("OK");\n  } catch (RuntimeException e) {\n    System.out.println("ERROR");  // "ERROR" is printed as expected\n  }\n}\n\npublic static void doSomethingWhichThrowsException() {\n  try {\n    throw new RuntimeException();\n  } finally {\n    /* ... */\n  }\n}\n</pre>\n<h2>See</h2>\n\n<ul>\n  <li><a href="http://cwe.mitre.org/data/definitions/584.html">MITRE, CWE-584</a> - Return Inside Finally Block</li>\n</ul>	4	\N	READY	java	2015-11-20 10:43:08.827	2015-11-20 10:43:08.827	\N	\N	\N	\N	\N	42	\N	CONSTANT_ISSUE	\N	\N	\N	30min	\N	\N	bug,cwe,error-handling	f	HTML
299	"URL.hashCode" and "URL.equals" should be avoided	S2112	S2112	squid	<p>The <code>equals</code> and <code>hashCode</code> methods of <code>java.net.URL</code> both make calls out to the Internet and are blocking operations. <code>URI</code> on the other hand makes no such calls and should be used instead unless the specific <code>URL</code> functionality is required.</p>\n\n<p>This rule checks for uses of <code>URL</code>'s in <code>Map</code> and <code>Set</code>, and for explicit calls to the <code>equals</code> and <code>hashCode</code> methods.</p>\n\n<h2>Noncompliant Code Example</h2>\n\n<pre>\npublic void checkUrl(URL url) {\n  Set&lt;URL> sites = new HashSet&lt;URL&gt;();  // Noncompliant\n\n  URL homepage = new URL("http://sonarsource.com");  // Compliant\n  if (homepage.equals(url)) { // Noncompliant\n    // ...\n  }\n}\n</pre>\n\n<h2>Compliant Solution</h2>\n\n<pre>\npublic void checkUrl(URL url) {\n  Set&lt;URI&gt; sites = new HashSet&lt;URI&gt;();  // Compliant\n\n  URI homepage = new URI("http://sonarsource.com");  // Compliant\n  URI uri = url.toURI();\n  if (homepage.equals(uri)) {  // Compliant\n    // ...\n  }\n}\n</pre>	3	\N	READY	java	2015-11-20 10:43:08.828	2015-11-20 10:43:08.828	\N	\N	\N	\N	\N	38	\N	CONSTANT_ISSUE	\N	\N	\N	20min	\N	\N	performance	f	HTML
300	A "while" loop should be used instead of a "for" loop	S1264	S1264	squid	<p>\n  When only the condition expression is defined in a <code>for</code> loop, but the init and increment expressions are missing,\n  a <code>while</code> loop should be used instead to increase readability.\n</p>\n\n<h2>Noncompliant Code Example</h2>\n<pre>\nfor (;condition;) { /*...*/ }\n</pre>\n\n<h2>Compliant Solution</h2>\n<pre>\nwhile (condition) { /*...*/ }\n</pre>	1	\N	READY	java	2015-11-20 10:43:08.828	2015-11-20 10:43:08.828	\N	\N	\N	\N	\N	15	\N	CONSTANT_ISSUE	\N	\N	\N	5min	\N	\N	clumsy	f	HTML
301	Nested blocks of code should not be left empty	S00108	S00108	squid	<p>Most of the time a block of code is empty when a piece of code is really missing. So such empty block must be either filled or removed.</p>\n<h2>Noncompliant Code Example</h2>\n\n<pre>\nfor (int i = 0; i &lt; 42; i++){}  // Empty on purpose or missing piece of code ?\n</pre>\n<h2>Exceptions</h2>\n\n<p>When a block contains a comment, this block is not considered to be empty unless it is a <code>synchronized</code> block. <code>synchronized</code> blocks are still considered empty even with comments because they can still affect program flow.</p>	2	\N	READY	java	2015-11-20 10:43:08.829	2015-11-20 10:43:08.829	\N	\N	\N	\N	\N	43	\N	CONSTANT_ISSUE	\N	\N	\N	5min	\N	\N	bug	f	HTML
302	"ResultSet.isLast()" should not be used	S2232	S2232	squid	<p>There are several reasons to avoid <code>ResultSet.isLast()</code>. First, support for this method is optional for <code>TYPE_FORWARD_ONLY</code> result sets. Second, it can be expensive (the driver may need to fetch the next row to answer the question). Finally, the specification is not clear on what should be returned when the <code>ResultSet</code> is empty, so some drivers may return the opposite of what is expected.</p>\n\n<h2>Noncompliant Code Example</h2>\n<pre>\nstmt.executeQuery("SELECT name, address FROM PERSON");\nResultSet rs = stmt.getResultSet();\nwhile (! rs.isLast()) { // Noncompliant\n// process row\n}\n</pre>\n\n<h2>Compliant Solution</h2>\n<pre>\nResultSet rs = stmt.executeQuery("SELECT name, address FROM PERSON");\nwhile (! rs.next()) {\n// process row\n}\n</pre>	3	\N	READY	java	2015-11-20 10:43:08.829	2015-11-20 10:43:08.829	\N	\N	\N	\N	\N	42	\N	CONSTANT_ISSUE	\N	\N	\N	10min	\N	\N	performance,pitfall,sql	f	HTML
303	"BigDecimal(double)" should not be used	S2111	S2111	squid	<p>Because of floating point imprecision, you're unlikely to get the value you expect from the <code>BigDecimal(double)</code> constructor. </p>\n<p>From <a href="http://docs.oracle.com/javase/7/docs/api/java/math/BigDecimal.html#BigDecimal(double)">the JavaDocs</a>:</p>\n<blockquote>The results of this constructor can be somewhat unpredictable. One might assume that writing new BigDecimal(0.1) in Java creates a BigDecimal which is exactly equal to 0.1 (an unscaled value of 1, with a scale of 1), but it is actually equal to 0.1000000000000000055511151231257827021181583404541015625. This is because 0.1 cannot be represented exactly as a double (or, for that matter, as a binary fraction of any finite length). Thus, the value that is being passed in to the constructor is not exactly equal to 0.1, appearances notwithstanding.</blockquote>\n<p>Instead, you should use <code>BigDecimal.valueOf</code>, which uses a string under the covers to eliminate floating point rounding errors.</p>\n<h2>Noncompliant Code Example</h2>\n\n<pre>\ndouble d = 1.1;\n\nBigDecimal bd1 = new BigDecimal(d); // Noncompliant; see comment above\nBigDecimal bd2 = new BigDecimal(1.1); // Noncompliant; same result\n</pre>\n<h2>Compliant Solution</h2>\n\n<pre>\ndouble d = 1.1;\n\nBigDecimal bd1 = BigDecimal.valueOf(d);\nBigDecimal bd2 = BigDecimal.valueOf(1.1);\n</pre>\n<h2>See</h2>\n\n<ul>\n<li> <a href="https://www.securecoding.cert.org/confluence/x/NQAVAg">CERT, NUM10-J</a> - Do not construct BigDecimal objects from floating-point literals</li>\n</ul>	3	\N	READY	java	2015-11-20 10:43:08.829	2015-11-20 10:43:08.83	\N	\N	\N	\N	\N	42	\N	CONSTANT_ISSUE	\N	\N	\N	5min	\N	\N	bug,cert	f	HTML
304	Lines should not be too long	S00103	S00103	squid	<p>\nHaving to scroll horizontally makes it harder to get a quick overview and understanding of any piece of code.\n</p>	1	\N	READY	java	2015-11-20 10:43:08.83	2015-11-20 10:43:08.83	\N	\N	\N	\N	\N	15	\N	CONSTANT_ISSUE	\N	\N	\N	1min	\N	\N	convention	f	HTML
305	A close curly brace should be located at the beginning of a line	RightCurlyBraceStartLineCheck	RightCurlyBraceStartLineCheck	squid	<p>Shared coding conventions make it possible for a team to efficiently collaborate. This rule makes it mandatory to place a close curly brace at the beginning of a line.</p>\n<h2>Noncompliant Code Example</h2>\n\n<pre>\nif(condition) {\n  doSomething();} \n</pre>\n<h2>Compliant Solution</h2>\n\n<pre>\nif(condition) {\n  doSomething();\n} \n</pre>\n<h2>Exceptions</h2>\n\n<p>When blocks are inlined (open and close curly braces on the same line), no issue is triggered. </p>\n<pre>\nif(condition) {doSomething();} \n</pre>	1	\N	READY	java	2015-11-20 10:43:08.831	2015-11-20 10:43:08.831	\N	\N	\N	\N	\N	15	\N	CONSTANT_ISSUE	\N	\N	\N	1min	\N	\N	convention	f	HTML
330	Interface names should comply with a naming convention	S00114	S00114	squid	<p>Sharing some naming conventions is a key point to make it possible for a team to efficiently collaborate. This rule allows to check that all interface names match a provided regular expression.</p>\n<h2>Noncompliant Code Example</h2>\n\n<p>With the default regular expression <code>^[A-Z][a-zA-Z0-9]*$</code>:</p>\n<pre>\npublic interface myInterface {...} // Noncompliant\n</pre>\n<h2>Compliant Solution</h2>\n\n<pre>\npublic interface MyInterface {...}\n</pre>	1	\N	READY	java	2015-11-20 10:43:08.845	2015-11-20 10:43:08.845	\N	\N	\N	\N	\N	15	\N	CONSTANT_ISSUE	\N	\N	\N	10min	\N	\N	convention	f	HTML
306	Useless "if(true) {...}" and "if(false){...}" blocks should be removed	S1145	S1145	squid	<p><code>if</code> statements with conditions that are always false have the effect of making blocks of code non-functional. <code>if</code> statements with conditions that are always true are completely redundant, and make the code less readable.</p>\n<p>There are three possible causes for the presence of such code: </p>\n<ul>\n<li> An if statement was changed during debugging and that debug code has been committed.</li>\n<li> Some value was left unset.</li>\n<li> Some logic is not doing what the programmer thought it did.</li>\n</ul>\n<p>In any of these cases, unconditional <code>if</code> statements should be removed.</p>\n<h2>Noncompliant Code Example</h2>\n\n<pre>\nif (true) {  \n  doSomething(); \n}\n...\nif (false) {  \n  doSomethingElse(); \n}\n\nif (2 &lt; 3 ) { ... }  // Noncompliant; always false\n\nint i = 0;\nint j = 0;\n// ...\nj = foo();\n\nif (j &gt; 0 &amp;&amp; i &gt; 0) { ... }  // Noncompliant; always false - i never set after initialization\n\nboolean b = true;\n//...\nif (b || !b) { ... }  // Noncompliant\n</pre>\n<h2>Compliant Solution</h2>\n\n<pre>\ndoSomething(); \n...\n</pre>\n<h2>See</h2>\n\n<ul>\n<li> <a href="http://cwe.mitre.org/data/definitions/489.html">MITRE, CWE-489</a> - Leftover Debug Code</li>\n<li> <a href="http://cwe.mitre.org/data/definitions/570.html">MITRE, CWE-570</a> - Expression is Always False</li>\n<li> <a href="http://cwe.mitre.org/data/definitions/571.html">MITRE, CWE-571</a> - Expression is Always True</li>\n<li> MISRA C:2004, 13.7</li>\n<li> MISRA C:2012, 14.3</li>\n</ul>\n\n<p>This rule is deprecated, use {rule:squid:S2583} instead.</p>	2	\N	READY	java	2015-11-20 10:43:08.831	2015-11-20 10:43:08.831	\N	\N	\N	\N	\N	15	\N	CONSTANT_ISSUE	\N	\N	\N	2min	\N	\N	cwe,misra	f	HTML
307	Collections should not be passed as arguments to their own methods	S2114	S2114	squid	<p>Passing a collection as an argument to the collection's own method is either an error - some other argument was intended - or simply nonsensical code.</p>\n\n<p>Further, because some methods require that the argument remain unmodified during the execution, passing a collection to itself can result in undefined behavior.</p>\n\n<h2>Noncompliant Code Example</h2>\n<pre>\nList &lt;Object&gt; objs = new ArrayList&lt;Object&gt;();\n  objs.add("Hello");\n\n  objs.add(objs); // Noncompliant; StackOverflowException if objs.hashCode() called\n  objs.addAll(objs); // Noncompliant; behavior undefined\n  objs.containsAll(objs); // Noncompliant; always true\n  objs.removeAll(objs); // Noncompliant; confusing. Use clear() instead\n  objs.retainAll(objs); // Noncompliant; NOOP\n</pre>	3	\N	READY	java	2015-11-20 10:43:08.832	2015-11-20 10:43:08.832	\N	\N	\N	\N	\N	42	\N	CONSTANT_ISSUE	\N	\N	\N	15min	\N	\N	bug	f	HTML
308	IllegalMonitorStateException should not be caught	S2235	S2235	squid	According to Oracle Javadoc:\n<blockquote>\n<code>IllegalMonitorStateException</code> is thrown when a thread has attempted to wait on an object's monitor or to notify other threads waiting on an object's monitor without owning the specified monitor.\n</blockquote>\n\nIn other words, this exception can be thrown only in case of bad design because <code>Object.wait(...)</code>, <code>Object.notify()</code> and <code>Object.notifyAll()</code> methods should never be called on an object whose monitor is not held. \n\n<h2>Noncompliant Code Example</h2>\n<pre>\npublic void doSomething(){\n  ...\n  try {\n    ...\n    anObject.notify();\n    ...\n  } catch(IllegalMonitorStateException e) {\n    ...\n  }\n}\n</pre>\n\n<h2>Compliant Solution</h2>\n<pre>\npublic void doSomething(){\n  ...\n  synchronized(anObject) {\n    ...\n    anObject.notify();\n    ...\n  }\n}\n</pre>	3	\N	READY	java	2015-11-20 10:43:08.832	2015-11-20 10:43:08.833	\N	\N	\N	\N	\N	38	\N	CONSTANT_ISSUE	\N	\N	\N	20min	\N	\N	bug,multi-threading	f	HTML
310	Exit methods should not be called	S1147	S1147	squid	<p>Calling <code>System.exit(int status)</code> or <code>Rutime.getRuntime().exit(int status)</code> calls the shutdown hooks and shuts downs the entire Java virtual machine. Calling <code>Runtime.getRuntime().halt(int)</code> does an immediate shutdown, without calling the shutdown hooks, and skipping finalization.</p>\n<p>Each of these methods should be used with extreme care, and only when the intent is to stop the whole Java process. For instance, none of them should be called from applications running in a J2EE container.</p>\n<h2>Noncompliant Code Example</h2>\n\n<pre>\nSystem.exit(0);\nRuntime.getRuntime().exit(0);\nRuntime.getRuntime().halt(0);\n</pre>\n\n<h2>Exceptions</h2>\n<p>These methods are ignored inside <code>main</code>.</p>\n\n<h2>See</h2>\n\n<ul>\n<li> <a href="http://cwe.mitre.org/data/definitions/382.html">MITRE, CWE-382</a> - Use of System.exit()</li>\n</ul>	3	\N	READY	java	2015-11-20 10:43:08.834	2015-11-20 10:43:08.834	\N	\N	\N	\N	\N	22	\N	CONSTANT_ISSUE	\N	\N	\N	30min	\N	\N	cwe	f	HTML
311	"hashCode" and "toString" should not be called on array instances	S2116	S2116	squid	While <code>hashCode</code> and <code>toString</code> are available on arrays, they are largely useless. <code>hashCode</code> returns the array's "identity hash code", and <code>toString</code> returns nearly the same value. Neither method's output actually reflects the array's contents. Instead, you should pass the array to the relevant static <code>Arrays</code> method.\n\n<h2>Noncompliant Code Example</h2>\n<pre>\npublic static void main( String[] args )\n{\n    String argStr = args.toString(); // Noncompliant\n    int argHash = args.hashCode(); // Noncompliant\n\n</pre>\n\n<h2>Compliant Solution</h2>\n<pre>\npublic static void main( String[] args )\n{\n    String argStr = Arrays.toString(args);\n    int argHash = Arrays.hashCode(args);\n\n</pre>	3	\N	READY	java	2015-11-20 10:43:08.834	2015-11-20 10:43:08.834	\N	\N	\N	\N	\N	42	\N	CONSTANT_ISSUE	\N	\N	\N	5min	\N	\N	bug	f	HTML
312	Files should not have too many lines	S00104	S00104	squid	<p>\nA source file that grows too much tends to aggregate too many responsibilities and inevitably becomes harder to understand and therefore to maintain.\nAbove a specific threshold, it is strongly advised to refactor it into smaller pieces of code which focus on well defined tasks.\nThose smaller files will not only be easier to understand but also probably easier to test.\n</p>	2	\N	READY	java	2015-11-20 10:43:08.834	2015-11-20 10:43:08.835	\N	\N	\N	\N	\N	15	\N	CONSTANT_ISSUE	\N	\N	\N	1h	\N	\N	brain-overload	f	HTML
313	Throwable.printStackTrace(...) should not be called	S1148	S1148	squid	<p>\n<code>Throwable.printStackTrace(...)</code> prints a throwable and its stack trace to some stream.\n</p>\n\n<p>Loggers should be used instead to print throwables, as they have many advantages:</p>\n<ul>\n  <li>Users are able to easily retrieve the logs.</li>\n  <li>The format of log messages is uniform and allow users to browse the logs easily.</li>\n</ul>\n\n<p>The following code:</p>\n\n<pre>\ntry {\n  /* ... */\n} catch(Exception e) {\n  e.printStackTrace();        // Noncompliant\n}\n</pre>\n\n<p>should be refactored into:</p>\n\n<pre>\ntry {\n  /* ... */\n} catch(Exception e) {\n  LOGGER.log("context", e);   // Compliant\n}\n</pre>	3	\N	READY	java	2015-11-20 10:43:08.835	2015-11-20 10:43:08.835	\N	\N	\N	\N	\N	40	\N	CONSTANT_ISSUE	\N	\N	\N	10min	\N	\N	error-handling,security	f	HTML
314	Methods "wait(...)", "notify()" and "notifyAll()" should never be called on Thread instances	S2236	S2236	squid	<p>On a Thread instance, the methods <code>wait(...)</code>, <code>notify()</code> and <code>notifyAll()</code> are available only because all classes in Java extend <code>Object</code> and therefore automatically inherit the methods. But there are two very good reasons to not call these methods on a Thread instance:</p>\n<ul>\n<li> Doing so is really confusing. What is really expected when calling, for instance, the <code>wait(...)</code> method on a Thread? That the execution of the Thread is suspended, or that acquisition of the object monitor is waited for?</li>\n<li> Internally, the JVM relies on these methods to change the state of the Thread (<code>BLOCKED</code>, <code>WAITING</code>, ...), so calling them will corrupt the behavior of the JVM.</li>\n</ul>\n<h2>Noncompliant Code Example</h2>\n\n<pre>\nThread myThread = new Thread(new RunnableJob());\n...\nmyThread.wait(2000);\n</pre>	4	\N	READY	java	2015-11-20 10:43:08.836	2015-11-20 10:43:08.836	\N	\N	\N	\N	\N	46	\N	CONSTANT_ISSUE	\N	\N	\N	30min	\N	\N	bug,multi-threading	f	HTML
315	Boolean checks should not be inverted	S1940	S1940	squid	<p>\n  It is needlessly complex to invert the result of a boolean comparison.\n  The opposite comparison should be made instead.\n</p>\n\n<h2>Noncompliant Code Example</h2>\n<pre>\nif ( !(a == 2)) { ...}  // Noncompliant\nboolean b = !(i < 10);  // Noncompliant\n</pre>\n\n<h2>Compliant Solution</h2>\n<pre>\nif (a != 2) { ...}\nboolean b = (i >= 10);\n</pre>	2	\N	READY	java	2015-11-20 10:43:08.836	2015-11-20 10:43:08.836	\N	\N	\N	\N	\N	16	\N	CONSTANT_ISSUE	\N	\N	\N	2min	\N	\N	pitfall	f	HTML
316	Control structures should use curly braces	S00121	S00121	squid	<p>While not technically incorrect, the omission of curly braces can be misleading, and may lead to the introduction of errors during maintenance.</p>\n<h2>Noncompliant Code Example</h2>\n\n<pre>\n// the two statements seems to be attached to the if statement, but that is only true for the first one:\nif (condition)\n  executeSomething();\n  checkSomething();\n</pre>\n<h2>Compliant Solution</h2>\n\n<pre>\nif (condition) {\n  executeSomething();\n  checkSomething();\n}\n</pre>\n<h2>See</h2>\n\n<ul>\n<li> MISRA C:2004, 14.8 - The statement forming the body of a switch, while, do ... while or for statement shall be a compound statement\n</li><li> MISRA C:2004, 14.9 - An if (expression) construct shall be followed by a compound statement. The else keyword shall be followed by either a compound statement, or another if statement\n</li><li> MISRA C++:2008, 6-3-1 - The statement forming the body of a switch, while, do ... while or for statement shall be a compound statement\n</li><li> MISRA C++:2008, 6-4-1 - An if (condition) construct shall be followed by a compound statement. The else keyword shall be followed by either a compound statement, or another if statement\n</li><li> MISRA C:2012, 15.6 - The body of an iteration-statement or a selection-statement shall be a compound-statement\n</li><li> <a href="https://www.securecoding.cert.org/confluence/x/1QGMAg">CERT, EXP19-C</a> - Use braces for the body of an if, for, or while statement\n</li><li> <a href="http://cwe.mitre.org/data/definitions/483.html">MITRE, CWE-483</a> - Incorrect Block Delimitation\n</li></ul>	1	\N	READY	java	2015-11-20 10:43:08.837	2015-11-20 10:43:08.837	\N	\N	\N	\N	\N	15	\N	CONSTANT_ISSUE	\N	\N	\N	2min	\N	\N	cert,cwe,misra,pitfall	f	HTML
317	Package names should comply with a naming convention	S00120	S00120	squid	<p>Shared coding conventions allow teams to collaborate efficiently. This rule checks that all package names match a provided regular expression.</p>\n<h2>Noncompliant Code Example</h2>\n\n<p>With the default regular expression <code>^[a-z]+(\\.[a-z][a-z0-9]*)*$</code>:</p>\n<pre>\npackage org.exAmple; // Noncompliant\n</pre>\n<h2>Compliant Solution</h2>\n\n<pre>\npackage org.example; \n</pre>	1	\N	READY	java	2015-11-20 10:43:08.837	2015-11-20 10:43:08.837	\N	\N	\N	\N	\N	15	\N	CONSTANT_ISSUE	\N	\N	\N	10min	\N	\N	convention	f	HTML
318	Statements should be on separate lines	S00122	S00122	squid	<p>For better readability, do not put more than one statement on a single line.</p>\n<h2>Noncompliant Code Example</h2>\n\n<pre>\nif(someCondition) doSomething();\n</pre>\n<h2>Compliant Solution</h2>\n\n<pre>\nif(someCondition) {\n  doSomething();\n}\n</pre>	1	\N	READY	java	2015-11-20 10:43:08.838	2015-11-20 10:43:08.838	\N	\N	\N	\N	\N	15	\N	CONSTANT_ISSUE	\N	\N	\N	1min	\N	\N	convention	f	HTML
319	Limited dependence should be placed on operator precedence rules in expressions	S864	S864	squid	<p>The rules of operator precedence are complicated and can lead to errors. For this reason, parentheses should be used for clarification in complex statements. However, this does not mean that parentheses should be gratuitously added around every operation. </p>\n<p>This rule raises issues when <code>&amp;&amp;</code> and <code>||</code> are used in combination, when assignment and equality or relational operators are used in together in a condition, and for other operator combinations according to the following table:</p>\n<table>\n<tr><td> </td><td><code>+</code>, <code>-</code>, <code>*</code>, <code>/</code>, <code>%</code></td><td><code>&lt;&lt;</code>, <code>&gt;&gt;</code>, <code>&gt;&gt;&gt;</code></td><td><code>&amp;</code></td><td><code>^</code></td><td><code>|</code></td></tr>\n<tr><td><code>+</code>, <code>-</code>, <code>*</code>, <code>/</code>, <code>%</code></td><td> </td><td>x</td><td>x</td><td>x</td><td>x</td></tr>\n<tr><td><code>&lt;&lt;</code>, <code>&gt;&gt;</code>, <code>&gt;&gt;&gt;</code></td><td>x</td><td> </td><td>x</td><td>x</td><td>x</td></tr>\n<tr><td><code>&amp;</code></td><td>x</td><td>x</td><td> </td><td>x</td><td>x</td></tr>\n<tr><td><code>^</code></td><td>x</td><td>x</td><td>x</td><td> </td><td>x</td></tr>\n<tr><td><code>|</code></td><td>x</td><td>x</td><td>x</td><td>x</td><td></td></tr>\n</table>\n<h2>Noncompliant Code Example</h2>\n\n<pre>\nx = a + b - c;\nx = a + 1 &lt;&lt; b;  // Noncompliant\n\nif ( a &gt; b || c &lt; d || a == d) {...}\nif ( a &gt; b &amp;&amp; c &lt; d || a == b) {...}  // Noncompliant\nif (a = f(b,c) == 1) { ... } // Noncompliant; == evaluated first\n</pre>\n<h2>Compliant Solution</h2>\n\n<pre>\nx = a + b - c;\nx = (a + 1) &lt;&lt; b;\n\nif ( a &gt; b || c &lt; d || a == d) {...}\nif ( (a &gt; b &amp;&amp; c &lt; d) || a == b) {...}\nif ( (a = f(b,c)) == 1) { ... }\n</pre>\n<h2>See</h2>\n\n<ul>\n<li> MISRA C:2004, 12.1 - Limited dependence should be placed on C's operator precedence rules in expressions</li>\n<li> MISRA C++:2008, 5-0-2 - Limited dependence should be placed on C++ operator precedence rules in expressions</li>\n<li> MISRA C:2012, 12.1 - The precedence of operators within expressions should be made explicit</li>\n<li> <a href="https://www.securecoding.cert.org/confluence/x/_wI">CERT EXP00-C</a> - Use parentheses for precedence of operation</li>\n<li> <a href="https://www.securecoding.cert.org/confluence/x/VoAyAQ">CERT EXP00-CPP</a> - Use parentheses for precedence of operation</li>\n<li> <a href="http://cwe.mitre.org/data/definitions/783.html">MITRE, CWE-783</a> - Operator Precedence Logic Error</li>\n</ul>	2	\N	READY	java	2015-11-20 10:43:08.838	2015-11-20 10:43:08.839	\N	\N	\N	\N	\N	15	\N	CONSTANT_ISSUE	\N	\N	\N	2min	\N	\N	cert,cwe,misra	f	HTML
320	Reflection should not be used to check non-runtime annotations	S2109	S2109	squid	<p>The writer of an annotation can set one of three retention policies for it:</p>\n<ul>\n  <li><code>RetentionPolicy.SOURCE</code> - these annotations are dropped during compilation, E.G. <code>@Override</code>, <code>@SuppressWarnings</code>.</li>\n  <li><code>RetentionPolicy.CLASS</code> - these annotations are present in a compiled class but not loaded into the JVM at runtime. This is the default.</li>\n  <li><code>RetentionPolicy.RUNTIME</code> - these annotations are present in the class file and loaded into the JVM.</li>\n</ul>\n<p>Only annotations that have been given a <code>RUNTIME</code> retention policy will be available to reflection. Testing for annotations with any other retention policy is simply\n  an error, since the test will always return false.</p>\n\n<p>This rule checks that reflection is not used to detect annotations that do not have <code>RUNTIME</code> retention.</p>\n\n<h2>Noncompliant Code Example</h2>\n<pre>\nMethod m = String.class.getMethod("getBytes", new Class[] {int.class,\nint.class, byte[].class, int.class});\nif (m.isAnnotationPresent(Override.class)) {  // Noncompliant; test will always return false, even when @Override is present in the code\n</pre>	4	\N	READY	java	2015-11-20 10:43:08.839	2015-11-20 10:43:08.839	\N	\N	\N	\N	\N	42	\N	CONSTANT_ISSUE	\N	\N	\N	15min	\N	\N	bug	f	HTML
321	Untrusted data should not be stored in sessions	S3318	S3318	squid	<p>Data in a web session is considered inside the "trust boundary". That is, it is assumed to be trustworthy. But storing unvetted data from an unauthenticated user violates the trust boundary, and may lead that that data being used inappropriately.</p>\n<p>This rule raises an issue when data from <code>Cookie</code>s or <code>HttpServletRequest</code>s is stored in a session. </p>\n<h2>Noncompliant Code Example</h2>\n\n<pre>\nlogin = request.getParameter("login");\nsession.setAttribute("login", login);  // Noncompliant\n</pre>\n<h2>See</h2>\n\n<ul>\n<li> <a href="http://cwe.mitre.org/data/definitions/501">MITRE, CWE-501</a> - Trust Boundary Violation\n</li></ul>	3	\N	READY	java	2015-11-20 10:43:08.84	2015-11-20 10:43:08.84	\N	\N	\N	\N	\N	20	\N	CONSTANT_ISSUE	\N	\N	\N	20min	\N	\N	cwe,security	f	HTML
323	Conditions should not unconditionally evaluate to "TRUE" or to "FALSE"	S2583	S2583	squid	<p>\nConditional statements using a condition which cannot be anything but <code>FALSE</code> have the effect of making blocks of code non-functional.\nIf the condition cannot evaluate to anything but <code>TRUE</code>, the conditional statement is completely redundant, and makes the code less readable.\n</p>\n\n<p>\nIt is quite likely that the code does not match the programmer's intent.\n</p>\n\n<p>\nEither the condition should be removed or it should be updated so that it does not always evaluate to <code>TRUE</code> or <code>FALSE</code>.\n</p>\n\n<h2>Noncompliant Code Example</h2>\n\n<pre>\n//foo can't be both equal and not equal to bar in the same expression\nif(foo == bar && something && foo != bar) {...}\n</pre>\n<pre>\nprivate void compute(int foo) {\n  if (foo == 4) {\n    doSomething();\n    // We know foo is equal to 4 at this point, so the next condition is always false\n    if (foo > 4) {...}\n    ...\n  }\n  ...\n}\n</pre>\n<pre>\nprivate void compute(boolean foo) {\n  if (foo) {\n    return;\n  }\n  doSomething();\n  // foo is always false here\n  if (foo){...}\n  ...\n}\n</pre>\n\n<h2>See</h2>\n<ul>\n  <li><a href="http://cwe.mitre.org/data/definitions/489">MITRE, CWE-489</a> - Leftover Debug Code</li>\n  <li><a href="http://cwe.mitre.org/data/definitions/570">MITRE, CWE-570</a> - Expression is Always False</li>\n  <li><a href="http://cwe.mitre.org/data/definitions/571">MITRE, CWE-571</a> - Expression is Always True</li>\n  <li>MISRA C:2004, 13.7 - Boolean operations whose results are invariant shall not be permitted.</li>\n  <li>MISRA C:2012, 14.3 - Controlling expressions shall not be invariant</li>\n</ul>	4	\N	READY	java	2015-11-20 10:43:08.841	2015-11-20 10:43:08.841	\N	\N	\N	\N	\N	43	\N	CONSTANT_ISSUE	\N	\N	\N	15min	\N	\N	bug,cwe,misra	f	HTML
324	Local variable and method parameter names should comply with a naming convention	S00117	S00117	squid	<p>Sharing some naming conventions is a key point to make it possible for a team to efficiently collaborate. This rule allows to check that all local variable and function parameter names match a provided regular expression.</p>\n<h2>Noncompliant Code Example</h2>\n\n<p>With the default regular expression <code>^[a-z][a-zA-Z0-9]*$</code>:</p>\n<pre>\npublic void doSomething(int my_param) { \n  int LOCAL;    \n  ...             \n}\n</pre>\n<h2>Compliant Solution</h2>\n\n<pre>\npublic void doSomething(int myParam) { \n  int local;  \n  ...               \n}\n</pre>\n\n<h2>Exceptions</h2>\n\n<p>Loop counters are ignored by this rule.</p>\n\n<pre>\nfor (int i = 0; i &lt; limit; i++) {  // Compliant\n  // ...\n}\n</pre>	1	\N	READY	java	2015-11-20 10:43:08.841	2015-11-20 10:43:08.842	\N	\N	\N	\N	\N	15	\N	CONSTANT_ISSUE	\N	\N	\N	2min	\N	\N	convention	f	HTML
325	Strings literals should be placed on the left side when checking for equality	S1132	S1132	squid	<p>\nIt is preferable to place string literals on the left-hand side of an <code>equals()</code> or <code>equalsIgnoreCase()</code> method call.\nThis prevents null pointer exceptions from being raised, as a string literal can never be null by definition.\n</p>\n\n<p>The following code:</p>\n\n<pre>\nString myString = null;\n\nSystem.out.println("Equal? " + myString.equals("foo"));                        // Noncompliant - will raise a NPE\nSystem.out.println("Equal? " + (myString != null &amp;&amp; myString.equals("foo")));  // Noncompliant - null check could be removed\n</pre>\n\n<p>should be refactored into:</p>\n\n<pre>\nSystem.out.println("Equal?" + "foo".equals(myString));                         // Compliant - properly deals with the null case\n</pre>	2	\N	READY	java	2015-11-20 10:43:08.842	2015-11-20 10:43:08.842	\N	\N	\N	\N	\N	42	\N	CONSTANT_ISSUE	\N	\N	\N	10min	\N	\N	bad-practice	f	HTML
331	"FIXME" tags should be handled	S1134	S1134	squid	<p><code>FIXME</code> tags are commonly used to mark places where a bug is suspected, but which the developer wants to deal with later.</p>\n<p>Sometimes the developer will not have the time or will simply forget to get back to that tag.</p>\n<p>This rule is meant to track those tags, and ensure that they do not go unnoticed.</p>\n<h2>Noncompliant Code Example</h2>\n\n<pre>\nint divide(int numerator, int denominator) {\n  return numerator / denominator;              // FIXME denominator value might be  0\n}\n</pre>	2	\N	READY	java	2015-11-20 10:43:08.845	2015-11-20 10:43:08.845	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	f	HTML
326	Locks should be released	S2222	S2222	squid	<p>The logic in a method should ensure that locks are released in the methods in which they were acquired. Failure to release a lock increases the potential for deadlocks and could result in runtime errors in production.</p>\n<h2>Noncompliant Code Example</h2>\n\n<pre>\npublic class MyClass {\n  Lock lock = new Lock();\n\n  public void acquireLock() {\n    lock.lock();  // Noncompliant;\n  }\n\n  public void releaseLock() {\n    lock.unlock();\n  }\n\n  public void doTheThing() {\n    acquireLock();\n    // do work...\n    releaseLock();\n  }\n}\n</pre>\n<h2>Compliant Solution</h2>\n\n<pre>\npublic class MyClass {\n  Lock lock = new Lock();\n\n  public void doTheThing() {\n    lock.lock();\n    // do work...\n    lock.unlock();\n  }\n\n}\n</pre>	3	\N	READY	java	2015-11-20 10:43:08.843	2015-11-20 10:43:08.843	\N	\N	\N	\N	\N	46	\N	CONSTANT_ISSUE	\N	\N	\N	20min	\N	\N	bug,cwe,multi-threading	f	HTML
327	Type parameter names should comply with a naming convention	S00119	S00119	squid	<p>Shared naming conventions make it possible for a team to collaborate efficiently. Following the established convention of single-letter type parameter names helps users and maintainers of your code quickly see the difference between a type parameter and a poorly named class.</p>\n\n<p>This rule check that all type parameter names match a provided regular expression. The following code snippets use the default regular expression.</p>\n\n<h2>Noncompliant Code Example</h2>\n<pre>\npublic class MyClass&lt;TYPE&gt; { // Noncompliant\n  &lt;TYPE&gt; void method(TYPE t) { // Noncompliant\n  }\n}\n</pre>\n<h2>Compliant Solution</h2>\n<pre>\npublic class MyClass&lt;T&gt; {\n  &lt;T&gt; void method(T t) {\n  }\n}\n</pre>	1	\N	READY	java	2015-11-20 10:43:08.843	2015-11-20 10:43:08.843	\N	\N	\N	\N	\N	15	\N	CONSTANT_ISSUE	\N	\N	\N	10min	\N	\N	convention	f	HTML
328	Deprecated code should be removed eventually	S1133	S1133	squid	<p>\nThis rule is meant to be used as a way to track code which is marked as being deprecated.\nDeprecated code should eventually be removed.\n</p>\n\n<p>\nThe following code illustrates this rule:\n</p>\n\n<pre>\nclass Foo {\n  /**\n    * @deprecated\n    */\n  public void foo() {    // Noncompliant\n  }\n\n  @Deprecated            // Noncompliant\n  public void bar() {\n  }\n\n  public void baz() {    // Compliant\n  }\n}\n</pre>	0	\N	READY	java	2015-11-20 10:43:08.844	2015-11-20 10:43:08.844	\N	\N	\N	\N	\N	33	\N	CONSTANT_ISSUE	\N	\N	\N	10min	\N	\N	obsolete	f	HTML
329	"Exception" should not be caught when not required by called methods	S2221	S2221	squid	<p>\n  Catching <code>Exception</code> seems like an efficient way to handle multiple possible exceptions.\n  Unfortunately, it traps all exception types and so both checked and runtime exceptions, casting too broad a net.\n  Indeed, was it really the intention of developers to also catch runtime exceptions? To prevent any misunderstanding,\n  if both checked and runtime exceptions are really expected to be caught, they should be explicitly listed in the <code>catch</code> clause.\n</p>\n\n<h2>Noncompliant Code Example</h2>\n<pre>\ntry {\n  // do something that might throw an UnsupportedDataTypeException or UnsupportedEncodingException\n} catch (Exception e) { // Noncompliant\n  // log exception ...\n}\n</pre>\n\n<h2>Compliant Solution</h2>\n<pre>\ntry {\n  // do something\n} catch (UnsupportedEncodingException|UnsupportedDataTypeException|RuntimeException e) {\n  // log exception ...\n}\n</pre>\n<p>or if runtime exceptions should not be caught:</p>\n<pre>\ntry {\n  // do something\n} catch (UnsupportedEncodingException|UnsupportedDataTypeException e) {\n  // log exception ...\n}\n</pre>\n\n<h2>Exceptions</h2>\n<p>No issue is raised if a method in the <code>try</code> block explicitly throws an <code>Exception</code>.</p>\n\n<h2>See</h2>\n<ul>\n  <li><a href="http://cwe.mitre.org/data/definitions/396.html">MITRE, CWE-396</a> - Declaration of Catch for Generic Exception</li>\n</ul>	3	\N	READY	java	2015-11-20 10:43:08.844	2015-11-20 10:43:08.844	\N	\N	\N	\N	\N	40	\N	CONSTANT_ISSUE	\N	\N	\N	15min	\N	\N	cwe,error-handling,security	f	HTML
334	Field names should comply with a naming convention	S00116	S00116	squid	<p>Sharing some naming conventions is a key point to make it possible for a team to efficiently collaborate. This rule allows to check that field names match a provided regular expression.</p>\n<h2>Noncompliant Code Example</h2>\n\n<p>With the default regular expression <code>^[a-z][a-zA-Z0-9]*$</code>:</p>\n<pre>\nclass MyClass {\n   private int my_field;\n}\n</pre>\n<h2>Compliant Solution</h2>\n\n<pre>\nclass MyClass {\n   private int myField;\n}\n</pre>	1	\N	READY	java	2015-11-20 10:43:08.85	2015-11-20 10:43:08.85	\N	\N	\N	\N	\N	15	\N	CONSTANT_ISSUE	\N	\N	\N	2min	\N	\N	convention	f	HTML
335	Servlets should never have mutable instance fields	S2226	S2226	squid	By contract, a servlet container creates one instance of each servlet and then a dedicated thread is attached to each new incoming HTTP request to process this request. So all threads are sharing the servlet instances and by extension instance fields.  To prevent any misunderstanding and unexpected behavior at runtime, all servlet fields should then be either <code>static</code> and/or <code>final</code>, or simply removed.\n\nWith Struts 1.X, the same constraint exists on <code>org.apache.struts.action.Action</code>.\n\n<h2>Noncompliant Code Example</h2>\n<pre>\npublic class MyServlet extends HttpServlet {\n  private String userName;  //As this field is shared by all users, it's obvious that this piece of information should be managed differently\n  ...\n}\n</pre>\n\nor \n\n<pre>\npublic class MyAction extends Action {\n  private String userName;  //Same reason\n  ...\n}\n</pre>\n\n<h2>See</h2>\n<ul>\n\t<li><a href="https://www.securecoding.cert.org/confluence/display/java/VNA06-J.+Do+not+use+non-static+member+fields+in+a+servlet">CERT VNA06-J</a> - Do not use non-static member fields in a servlet</li>\n</ul>	3	\N	READY	java	2015-11-20 10:43:08.85	2015-11-20 10:43:08.851	\N	\N	\N	\N	\N	46	\N	CONSTANT_ISSUE	\N	\N	\N	30min	\N	\N	bug,cert,multi-threading	f	HTML
336	Constant names should comply with a naming convention	S00115	S00115	squid	<p>Shared coding conventions allow teams to collaborate efficiently. This rule checks that all constant names match a provided regular expression.</p>\n<h2>Noncompliant Code Example</h2>\n\n<p>With the default regular expression <code>^[A-Z][A-Z0-9]*(_[A-Z0-9]+)*$</code>:</p>\n<pre>\npublic class MyClass {\n  public static final int first = 1;\n}\n\npublic enum MyEnum {\n  first;\n}\n</pre>\n<h2>Compliant Solution</h2>\n\n<pre>\npublic class MyClass {\n  public static final int FIRST = 1; \n}\n\npublic enum MyEnum {\n  FIRST;\n}\n</pre>	1	\N	READY	java	2015-11-20 10:43:08.851	2015-11-20 10:43:08.851	\N	\N	\N	\N	\N	15	\N	CONSTANT_ISSUE	\N	\N	\N	2min	\N	\N	convention	f	HTML
337	"toString()" and "clone()" methods should not return null	S2225	S2225	squid	<p>Calling <code>toString()</code> or <code>clone()</code> on an object should always return a string or an object. Returning <code>null</code> instead contravenes the method's implicit contract.</p>\n<h2>Noncompliant Code Example</h2>\n\n<pre>\npublic override string ToString () {\n  if (this.collection.Count == 0) {\n    return null; // Noncompliant\n  } else {\n    // ...\n </pre>\n<h2>Compliant Solution</h2>\n\n<pre>\npublic override string ToString () {\n  if (this.collection.Count == 0) {\n    return "";\n  } else {\n    // ...\n </pre>\n<h2>See</h2>\n\n<ul>\n<li> <a href="http://cwe.mitre.org/data/definitions/476.html">MITRE CWE-476</a> - NULL Pointer Dereference\n</li></ul>	3	\N	READY	java	2015-11-20 10:43:08.852	2015-11-20 10:43:08.852	\N	\N	\N	\N	\N	42	\N	CONSTANT_ISSUE	\N	\N	\N	5min	\N	\N	bug,cwe	f	HTML
338	Classes and enums with private members should have a constructor	S1258	S1258	squid	<p>\n  Non-abstract <code>class</code>es and <code>enum</code>s with non-<code>static</code>,\n  <code>private</code> members should explicitly initialize those members,\n  either in a constructor or with a default value.\n</p>\n\n<h2>Noncompliant Code Example</h2>\n<pre>\nclass A { // Noncompliant\n  private int field;\n}\n</pre>\n\n<h2>Compliant Solution</h2>\n<pre>\nclass A {\n  private int field;\n\n  A(int field) {\n    this.field = field;\n  }\n}\n</pre>	2	\N	READY	java	2015-11-20 10:43:08.852	2015-11-20 10:43:08.853	\N	\N	\N	\N	\N	45	\N	CONSTANT_ISSUE	\N	\N	\N	5min	\N	\N	pitfall	f	HTML
\.


--
-- Name: rules_id_seq; Type: SEQUENCE SET; Schema: public; Owner: sonar
--

SELECT pg_catalog.setval('rules_id_seq', 338, true);


--
-- Data for Name: rules_parameters; Type: TABLE DATA; Schema: public; Owner: sonar
--

COPY rules_parameters (id, rule_id, name, description, param_type, default_value) FROM stdin;
1	1	minimumBranchCoverageRatio	\N	FLOAT	65
2	2	minimumLineCoverageRatio	\N	FLOAT	65
3	3	minimumCommentDensity	\N	FLOAT	25
4	13	countNonpublicMethods	Whether or not to include non-public methods in the count.	BOOLEAN	true
5	13	maximumMethodThreshold	The maximum number of methods authorized in a class.	INTEGER	35
6	15	indentationLevel	Number of white-spaces of an indent. If this property is not set, we just check that the code is indented.	INTEGER	2
7	16	max	Maximum number of classes a single class is allowed to depend upon	INTEGER	20
8	24	max	Maximum depth of the inheritance tree. (Number)	INTEGER	5
9	32	format	Regular expression used to check the logger names against.	STRING	LOG(?:GER)?
10	35	fromClasses	Optional. If this property is not defined, all classes should adhere to this constraint. Ex : **.web.**	STRING	\N
11	35	toClasses	Mandatory. Ex : java.util.Vector, java.util.Hashtable, java.util.Enumeration	STRING	\N
12	49	legalTrailingCommentPattern	Description Pattern for text of trailing comments that are allowed. By default, comments containing only one word.	STRING	^\\s*+[^\\s]++$
13	54	headerFormat	Expected copyright and license header	TEXT	\N
14	54	isRegularExpression	Whether the headerFormat is a regular expression	BOOLEAN	false
15	82	Max	The maximum number of lines allowed	INTEGER	25
16	88	Exclude	Comma separated list of Sun packages to be ignored by this rule. Example: com.sun.jna,sun.misc	STRING	\N
17	89	threshold	Number of times a literal must be duplicated to trigger an issue	INTEGER	3
18	110	listOfWarnings	Comma separated list of warnings that can be suppressed (example: unchecked, cast, boxing). An empty list means that no warning can be suppressed.	STRING	\N
19	117	Authorized numbers	Comma separated list of authorized numbers. Example: -1,0,1,2	STRING	-1,0,1
20	137	max	Maximum authorized lines in a method	INTEGER	100
21	159	methodName	Name of the forbidden method	STRING	\N
22	159	className	Name of the class whose method is forbidden	STRING	\N
23	159	argumentTypes	Comma-delimited list of argument types, E.G. java.lang.String, int[], int	STRING	\N
24	164	exceptions	List of exceptions which should not be checked	STRING	java.lang.InterruptedException, java.lang.NumberFormatException, java.text.ParseException, java.net.MalformedURLException
25	171	format	Regular expression used to check the class names against.	STRING	^[A-Z][a-zA-Z0-9]*$
26	173	format	Regular expression used to check the method names against.	STRING	^[a-z][a-zA-Z0-9]*$
27	174	Threshold	The maximum authorized complexity.	INTEGER	10
28	176	max	Maximum number of lines	INTEGER	5
29	180	max	Maximum allowed control flow statement nesting depth.	INTEGER	3
30	197	format	Regular expression used to check the field names against.	STRING	^[a-z][a-zA-Z0-9]*$
31	198	forClasses	Pattern of classes which should adhere to this constraint. Ex : **.api.**	STRING	**
32	211	max	Maximum number of allowed conditional operators in an expression	INTEGER	3
33	212	Max	Maximum allowed lines in an anonymous class/lambda	INTEGER	20
34	226	max	Maximum complexity allowed.	INTEGER	200
35	262	maximum	Maximum number of case	INTEGER	30
36	292	max	Maximum authorized number of parameters	INTEGER	7
37	292	constructorMax	Maximum authorized number of parameters for a constructor	INTEGER	7
38	296	max	Maximum allowed return statements per method	INTEGER	3
39	304	maximumLineLength	The maximum authorized line length.	INTEGER	120
40	312	Max	Maximum authorized lines in a file.	INTEGER	1000
41	317	format	Regular expression used to check the package names against.	STRING	^[a-z]+(\\.[a-z][a-z0-9]*)*$
42	322	format	Regular expression used to check the abstract class names against.	STRING	^Abstract[A-Z][a-zA-Z0-9]*$
43	324	format	Regular expression used to check the names against.	STRING	^[a-z][a-zA-Z0-9]*$
44	327	format	Regular expression used to check the type parameter names against.	STRING	^[A-Z][0-9]?$
45	330	format	Regular expression used to check the interface names against.	STRING	^[A-Z][a-zA-Z0-9]*$
46	334	format	Regular expression used to check the field names against.	STRING	^[a-z][a-zA-Z0-9]*$
47	336	format	Regular expression used to check the constant names against.	STRING	^[A-Z][A-Z0-9]*(_[A-Z0-9]+)*$
\.


--
-- Name: rules_parameters_id_seq; Type: SEQUENCE SET; Schema: public; Owner: sonar
--

SELECT pg_catalog.setval('rules_parameters_id_seq', 47, true);


--
-- Data for Name: rules_profiles; Type: TABLE DATA; Schema: public; Owner: sonar
--

COPY rules_profiles (id, name, language, kee, parent_kee, rules_updated_at, created_at, updated_at, is_default) FROM stdin;
1	Sonar way	java	java-sonar-way-87679	\N	2015-11-20T10:43:14+0000	2015-11-20 10:43:13.378	2015-11-20 10:43:15.485	t
\.


--
-- Name: rules_profiles_id_seq; Type: SEQUENCE SET; Schema: public; Owner: sonar
--

SELECT pg_catalog.setval('rules_profiles_id_seq', 1, true);


--
-- Data for Name: schema_migrations; Type: TABLE DATA; Schema: public; Owner: sonar
--

COPY schema_migrations (version) FROM stdin;
1
2
10
11
14
35
53
59
61
62
79
80
86
87
88
93
95
131
140
151
163
169
200
202
211
215
217
220
222
235
237
238
239
252
257
283
285
286
300
301
320
350
351
353
354
355
356
358
370
387
388
391
392
398
399
401
404
405
410
411
412
413
414
415
416
417
418
419
432
433
434
441
442
460
461
463
464
465
467
480
483
486
488
492
510
511
520
530
532
533
535
536
538
540
541
542
544
545
548
549
552
555
580
581
600
601
603
604
605
702
703
704
705
706
707
708
709
710
711
712
713
714
715
716
717
718
719
720
721
750
752
753
754
755
756
758
759
760
761
762
763
764
765
766
768
769
770
771
772
773
775
776
777
778
779
780
781
782
783
784
786
787
788
789
790
791
792
793
794
795
796
900
901
902
903
904
905
906
907
908
912
913
915
916
917
918
919
920
921
922
923
924
925
926
927
929
930
931
932
933
934
935
936
937
938
939
940
941
\.


--
-- Data for Name: snapshots; Type: TABLE DATA; Schema: public; Owner: sonar
--

COPY snapshots (id, project_id, parent_snapshot_id, status, islast, scope, qualifier, root_snapshot_id, version, path, depth, root_project_id, purge_status, period1_mode, period1_param, period2_mode, period2_param, period3_mode, period3_param, period4_mode, period4_param, period5_mode, period5_param, created_at, build_date, period1_date, period2_date, period3_date, period4_date, period5_date) FROM stdin;
\.


--
-- Name: snapshots_id_seq; Type: SEQUENCE SET; Schema: public; Owner: sonar
--

SELECT pg_catalog.setval('snapshots_id_seq', 1, false);


--
-- Data for Name: user_roles; Type: TABLE DATA; Schema: public; Owner: sonar
--

COPY user_roles (id, user_id, resource_id, role) FROM stdin;
\.


--
-- Name: user_roles_id_seq; Type: SEQUENCE SET; Schema: public; Owner: sonar
--

SELECT pg_catalog.setval('user_roles_id_seq', 1, false);


--
-- Data for Name: users; Type: TABLE DATA; Schema: public; Owner: sonar
--

COPY users (id, login, name, email, crypted_password, salt, remember_token, remember_token_expires_at, active, created_at, updated_at, scm_accounts) FROM stdin;
1	admin	Administrator		a373a0e667abb2604c1fd571eb4ad47fe8cc0878	48bc4b0d93179b5103fd3885ea9119498e9d161b	\N	\N	t	1448016183117	1448016179802	\N
\.


--
-- Name: users_id_seq; Type: SEQUENCE SET; Schema: public; Owner: sonar
--

SELECT pg_catalog.setval('users_id_seq', 1, true);


--
-- Data for Name: widget_properties; Type: TABLE DATA; Schema: public; Owner: sonar
--

COPY widget_properties (id, widget_id, kee, text_value) FROM stdin;
1	10	filter	1
2	10	distributionAxis	statuses
3	12	filter	1
4	12	distributionAxis	assignees
5	13	filter	3
6	14	filter	2
7	14	distributionAxis	resolutions
8	15	metric1	complexity
9	15	metric2	sqale_index
10	15	metric3	coverage
11	16	displaySparkLine	true
12	16	metric1	ncloc
13	16	metric2	lines
14	16	metric3	statements
15	16	metric4	files
16	16	metric5	classes
17	16	metric6	functions
18	16	metric7	accessors
19	17	displaySparkLine	true
20	17	metric1	comment_lines_density
21	17	metric2	comment_lines
22	17	metric3	public_documented_api_density
23	17	metric4	public_undocumented_api
24	18	displaySparkLine	true
25	18	metric1	duplicated_lines_density
26	18	metric2	duplicated_lines
27	18	metric3	duplicated_blocks
28	18	metric4	duplicated_files
29	19	displaySparkLine	true
30	19	metric1	violations
31	19	metric2	blocker_violations
32	19	metric3	critical_violations
33	19	metric4	major_violations
34	19	metric5	minor_violations
35	19	metric6	info_violations
36	19	metric7	sqale_index
37	20	displaySparkLine	true
38	20	metric1	complexity
39	20	metric2	function_complexity
40	20	metric3	class_complexity
41	20	metric4	file_complexity
42	21	metric8	test_execution_time
43	21	displaySparkLine	true
44	21	metric1	coverage
45	21	metric2	line_coverage
46	21	metric3	branch_coverage
47	21	metric4	test_success_density
48	21	metric5	test_failures
49	21	metric6	test_errors
50	21	metric7	tests
51	23	filter	2
52	23	pageSize	50
53	24	filter	1
54	24	pageSize	20
55	25	filter	1
56	25	colorMetric	coverage
57	25	sizeMetric	ncloc
\.


--
-- Name: widget_properties_id_seq; Type: SEQUENCE SET; Schema: public; Owner: sonar
--

SELECT pg_catalog.setval('widget_properties_id_seq', 57, true);


--
-- Data for Name: widgets; Type: TABLE DATA; Schema: public; Owner: sonar
--

COPY widgets (id, dashboard_id, widget_key, name, description, column_index, row_index, configured, created_at, updated_at, resource_id) FROM stdin;
1	1	size	\N	\N	1	1	t	2015-11-20 10:43:15.643	2015-11-20 10:43:15.643	\N
2	1	duplications	\N	\N	1	2	t	2015-11-20 10:43:15.643	2015-11-20 10:43:15.643	\N
3	1	complexity	\N	\N	1	3	t	2015-11-20 10:43:15.643	2015-11-20 10:43:15.643	\N
4	1	events	\N	\N	1	4	t	2015-11-20 10:43:15.643	2015-11-20 10:43:15.643	\N
5	1	description	\N	\N	1	5	t	2015-11-20 10:43:15.643	2015-11-20 10:43:15.643	\N
6	1	debt_overview	\N	\N	2	1	t	2015-11-20 10:43:15.643	2015-11-20 10:43:15.643	\N
7	1	rules	\N	\N	2	2	t	2015-11-20 10:43:15.643	2015-11-20 10:43:15.643	\N
8	1	alerts	\N	\N	2	3	t	2015-11-20 10:43:15.643	2015-11-20 10:43:15.643	\N
9	1	code_coverage	\N	\N	2	4	t	2015-11-20 10:43:15.643	2015-11-20 10:43:15.643	\N
10	2	project_issue_filter	\N	\N	1	1	t	2015-11-20 10:43:15.665	2015-11-20 10:43:15.665	\N
11	2	action_plans	\N	\N	1	2	t	2015-11-20 10:43:15.665	2015-11-20 10:43:15.665	\N
12	2	project_issue_filter	\N	\N	2	1	t	2015-11-20 10:43:15.665	2015-11-20 10:43:15.665	\N
13	2	project_issue_filter	\N	\N	2	2	t	2015-11-20 10:43:15.665	2015-11-20 10:43:15.665	\N
14	2	project_issue_filter	\N	\N	2	3	t	2015-11-20 10:43:15.665	2015-11-20 10:43:15.665	\N
15	3	timeline	\N	\N	1	1	t	2015-11-20 10:43:15.673	2015-11-20 10:43:15.673	\N
16	3	time_machine	\N	\N	1	2	t	2015-11-20 10:43:15.673	2015-11-20 10:43:15.673	\N
17	3	time_machine	\N	\N	1	3	t	2015-11-20 10:43:15.673	2015-11-20 10:43:15.673	\N
18	3	time_machine	\N	\N	1	4	t	2015-11-20 10:43:15.673	2015-11-20 10:43:15.673	\N
19	3	time_machine	\N	\N	2	1	t	2015-11-20 10:43:15.673	2015-11-20 10:43:15.673	\N
20	3	time_machine	\N	\N	2	2	t	2015-11-20 10:43:15.673	2015-11-20 10:43:15.673	\N
21	3	time_machine	\N	\N	2	3	t	2015-11-20 10:43:15.673	2015-11-20 10:43:15.673	\N
22	4	welcome	\N	\N	1	1	t	2015-11-20 10:43:15.698	2015-11-20 10:43:15.698	\N
23	4	measure_filter_list	\N	\N	1	2	t	2015-11-20 10:43:15.698	2015-11-20 10:43:15.698	\N
24	4	measure_filter_list	\N	\N	2	1	t	2015-11-20 10:43:15.698	2015-11-20 10:43:15.698	\N
25	4	measure_filter_treemap	\N	\N	2	2	t	2015-11-20 10:43:15.698	2015-11-20 10:43:15.698	\N
\.


--
-- Name: widgets_id_seq; Type: SEQUENCE SET; Schema: public; Owner: sonar
--

SELECT pg_catalog.setval('widgets_id_seq', 25, true);


--
-- Name: action_plans_pkey; Type: CONSTRAINT; Schema: public; Owner: sonar; Tablespace: 
--

ALTER TABLE ONLY action_plans
    ADD CONSTRAINT action_plans_pkey PRIMARY KEY (id);


--
-- Name: active_dashboards_pkey; Type: CONSTRAINT; Schema: public; Owner: sonar; Tablespace: 
--

ALTER TABLE ONLY active_dashboards
    ADD CONSTRAINT active_dashboards_pkey PRIMARY KEY (id);


--
-- Name: active_rule_parameters_pkey; Type: CONSTRAINT; Schema: public; Owner: sonar; Tablespace: 
--

ALTER TABLE ONLY active_rule_parameters
    ADD CONSTRAINT active_rule_parameters_pkey PRIMARY KEY (id);


--
-- Name: active_rules_pkey; Type: CONSTRAINT; Schema: public; Owner: sonar; Tablespace: 
--

ALTER TABLE ONLY active_rules
    ADD CONSTRAINT active_rules_pkey PRIMARY KEY (id);


--
-- Name: activities_pkey; Type: CONSTRAINT; Schema: public; Owner: sonar; Tablespace: 
--

ALTER TABLE ONLY activities
    ADD CONSTRAINT activities_pkey PRIMARY KEY (id);


--
-- Name: authors_pkey; Type: CONSTRAINT; Schema: public; Owner: sonar; Tablespace: 
--

ALTER TABLE ONLY authors
    ADD CONSTRAINT authors_pkey PRIMARY KEY (id);


--
-- Name: ce_activity_pkey; Type: CONSTRAINT; Schema: public; Owner: sonar; Tablespace: 
--

ALTER TABLE ONLY ce_activity
    ADD CONSTRAINT ce_activity_pkey PRIMARY KEY (id);


--
-- Name: ce_queue_pkey; Type: CONSTRAINT; Schema: public; Owner: sonar; Tablespace: 
--

ALTER TABLE ONLY ce_queue
    ADD CONSTRAINT ce_queue_pkey PRIMARY KEY (id);


--
-- Name: characteristics_pkey; Type: CONSTRAINT; Schema: public; Owner: sonar; Tablespace: 
--

ALTER TABLE ONLY characteristics
    ADD CONSTRAINT characteristics_pkey PRIMARY KEY (id);


--
-- Name: dashboards_pkey; Type: CONSTRAINT; Schema: public; Owner: sonar; Tablespace: 
--

ALTER TABLE ONLY dashboards
    ADD CONSTRAINT dashboards_pkey PRIMARY KEY (id);


--
-- Name: duplications_index_pkey; Type: CONSTRAINT; Schema: public; Owner: sonar; Tablespace: 
--

ALTER TABLE ONLY duplications_index
    ADD CONSTRAINT duplications_index_pkey PRIMARY KEY (id);


--
-- Name: events_pkey; Type: CONSTRAINT; Schema: public; Owner: sonar; Tablespace: 
--

ALTER TABLE ONLY events
    ADD CONSTRAINT events_pkey PRIMARY KEY (id);


--
-- Name: file_sources_pkey; Type: CONSTRAINT; Schema: public; Owner: sonar; Tablespace: 
--

ALTER TABLE ONLY file_sources
    ADD CONSTRAINT file_sources_pkey PRIMARY KEY (id);


--
-- Name: group_roles_pkey; Type: CONSTRAINT; Schema: public; Owner: sonar; Tablespace: 
--

ALTER TABLE ONLY group_roles
    ADD CONSTRAINT group_roles_pkey PRIMARY KEY (id);


--
-- Name: groups_pkey; Type: CONSTRAINT; Schema: public; Owner: sonar; Tablespace: 
--

ALTER TABLE ONLY groups
    ADD CONSTRAINT groups_pkey PRIMARY KEY (id);


--
-- Name: issue_changes_pkey; Type: CONSTRAINT; Schema: public; Owner: sonar; Tablespace: 
--

ALTER TABLE ONLY issue_changes
    ADD CONSTRAINT issue_changes_pkey PRIMARY KEY (id);


--
-- Name: issue_filter_favourites_pkey; Type: CONSTRAINT; Schema: public; Owner: sonar; Tablespace: 
--

ALTER TABLE ONLY issue_filter_favourites
    ADD CONSTRAINT issue_filter_favourites_pkey PRIMARY KEY (id);


--
-- Name: issue_filters_pkey; Type: CONSTRAINT; Schema: public; Owner: sonar; Tablespace: 
--

ALTER TABLE ONLY issue_filters
    ADD CONSTRAINT issue_filters_pkey PRIMARY KEY (id);


--
-- Name: issues_pkey; Type: CONSTRAINT; Schema: public; Owner: sonar; Tablespace: 
--

ALTER TABLE ONLY issues
    ADD CONSTRAINT issues_pkey PRIMARY KEY (id);


--
-- Name: loaded_templates_pkey; Type: CONSTRAINT; Schema: public; Owner: sonar; Tablespace: 
--

ALTER TABLE ONLY loaded_templates
    ADD CONSTRAINT loaded_templates_pkey PRIMARY KEY (id);


--
-- Name: manual_measures_pkey; Type: CONSTRAINT; Schema: public; Owner: sonar; Tablespace: 
--

ALTER TABLE ONLY manual_measures
    ADD CONSTRAINT manual_measures_pkey PRIMARY KEY (id);


--
-- Name: measure_filter_favourites_pkey; Type: CONSTRAINT; Schema: public; Owner: sonar; Tablespace: 
--

ALTER TABLE ONLY measure_filter_favourites
    ADD CONSTRAINT measure_filter_favourites_pkey PRIMARY KEY (id);


--
-- Name: measure_filters_pkey; Type: CONSTRAINT; Schema: public; Owner: sonar; Tablespace: 
--

ALTER TABLE ONLY measure_filters
    ADD CONSTRAINT measure_filters_pkey PRIMARY KEY (id);


--
-- Name: metrics_pkey; Type: CONSTRAINT; Schema: public; Owner: sonar; Tablespace: 
--

ALTER TABLE ONLY metrics
    ADD CONSTRAINT metrics_pkey PRIMARY KEY (id);


--
-- Name: notifications_pkey; Type: CONSTRAINT; Schema: public; Owner: sonar; Tablespace: 
--

ALTER TABLE ONLY notifications
    ADD CONSTRAINT notifications_pkey PRIMARY KEY (id);


--
-- Name: perm_templates_groups_pkey; Type: CONSTRAINT; Schema: public; Owner: sonar; Tablespace: 
--

ALTER TABLE ONLY perm_templates_groups
    ADD CONSTRAINT perm_templates_groups_pkey PRIMARY KEY (id);


--
-- Name: perm_templates_users_pkey; Type: CONSTRAINT; Schema: public; Owner: sonar; Tablespace: 
--

ALTER TABLE ONLY perm_templates_users
    ADD CONSTRAINT perm_templates_users_pkey PRIMARY KEY (id);


--
-- Name: permission_templates_pkey; Type: CONSTRAINT; Schema: public; Owner: sonar; Tablespace: 
--

ALTER TABLE ONLY permission_templates
    ADD CONSTRAINT permission_templates_pkey PRIMARY KEY (id);


--
-- Name: project_links_pkey; Type: CONSTRAINT; Schema: public; Owner: sonar; Tablespace: 
--

ALTER TABLE ONLY project_links
    ADD CONSTRAINT project_links_pkey PRIMARY KEY (id);


--
-- Name: project_measures_pkey; Type: CONSTRAINT; Schema: public; Owner: sonar; Tablespace: 
--

ALTER TABLE ONLY project_measures
    ADD CONSTRAINT project_measures_pkey PRIMARY KEY (id);


--
-- Name: project_qprofiles_pkey; Type: CONSTRAINT; Schema: public; Owner: sonar; Tablespace: 
--

ALTER TABLE ONLY project_qprofiles
    ADD CONSTRAINT project_qprofiles_pkey PRIMARY KEY (id);


--
-- Name: projects_pkey; Type: CONSTRAINT; Schema: public; Owner: sonar; Tablespace: 
--

ALTER TABLE ONLY projects
    ADD CONSTRAINT projects_pkey PRIMARY KEY (id);


--
-- Name: properties_pkey; Type: CONSTRAINT; Schema: public; Owner: sonar; Tablespace: 
--

ALTER TABLE ONLY properties
    ADD CONSTRAINT properties_pkey PRIMARY KEY (id);


--
-- Name: quality_gate_conditions_pkey; Type: CONSTRAINT; Schema: public; Owner: sonar; Tablespace: 
--

ALTER TABLE ONLY quality_gate_conditions
    ADD CONSTRAINT quality_gate_conditions_pkey PRIMARY KEY (id);


--
-- Name: quality_gates_pkey; Type: CONSTRAINT; Schema: public; Owner: sonar; Tablespace: 
--

ALTER TABLE ONLY quality_gates
    ADD CONSTRAINT quality_gates_pkey PRIMARY KEY (id);


--
-- Name: resource_index_pkey; Type: CONSTRAINT; Schema: public; Owner: sonar; Tablespace: 
--

ALTER TABLE ONLY resource_index
    ADD CONSTRAINT resource_index_pkey PRIMARY KEY (id);


--
-- Name: rules_parameters_pkey; Type: CONSTRAINT; Schema: public; Owner: sonar; Tablespace: 
--

ALTER TABLE ONLY rules_parameters
    ADD CONSTRAINT rules_parameters_pkey PRIMARY KEY (id);


--
-- Name: rules_pkey; Type: CONSTRAINT; Schema: public; Owner: sonar; Tablespace: 
--

ALTER TABLE ONLY rules
    ADD CONSTRAINT rules_pkey PRIMARY KEY (id);


--
-- Name: rules_profiles_pkey; Type: CONSTRAINT; Schema: public; Owner: sonar; Tablespace: 
--

ALTER TABLE ONLY rules_profiles
    ADD CONSTRAINT rules_profiles_pkey PRIMARY KEY (id);


--
-- Name: snapshots_pkey; Type: CONSTRAINT; Schema: public; Owner: sonar; Tablespace: 
--

ALTER TABLE ONLY snapshots
    ADD CONSTRAINT snapshots_pkey PRIMARY KEY (id);


--
-- Name: user_roles_pkey; Type: CONSTRAINT; Schema: public; Owner: sonar; Tablespace: 
--

ALTER TABLE ONLY user_roles
    ADD CONSTRAINT user_roles_pkey PRIMARY KEY (id);


--
-- Name: users_pkey; Type: CONSTRAINT; Schema: public; Owner: sonar; Tablespace: 
--

ALTER TABLE ONLY users
    ADD CONSTRAINT users_pkey PRIMARY KEY (id);


--
-- Name: widget_properties_pkey; Type: CONSTRAINT; Schema: public; Owner: sonar; Tablespace: 
--

ALTER TABLE ONLY widget_properties
    ADD CONSTRAINT widget_properties_pkey PRIMARY KEY (id);


--
-- Name: widgets_pkey; Type: CONSTRAINT; Schema: public; Owner: sonar; Tablespace: 
--

ALTER TABLE ONLY widgets
    ADD CONSTRAINT widgets_pkey PRIMARY KEY (id);


--
-- Name: GROUPS_USERS_UNIQUE; Type: INDEX; Schema: public; Owner: sonar; Tablespace: 
--

CREATE UNIQUE INDEX "GROUPS_USERS_UNIQUE" ON groups_users USING btree (group_id, user_id);


--
-- Name: I_ACTION_PLANS_PROJECT_ID; Type: INDEX; Schema: public; Owner: sonar; Tablespace: 
--

CREATE INDEX "I_ACTION_PLANS_PROJECT_ID" ON action_plans USING btree (project_id);


--
-- Name: active_dashboards_dashboardid; Type: INDEX; Schema: public; Owner: sonar; Tablespace: 
--

CREATE INDEX active_dashboards_dashboardid ON active_dashboards USING btree (dashboard_id);


--
-- Name: active_dashboards_userid; Type: INDEX; Schema: public; Owner: sonar; Tablespace: 
--

CREATE INDEX active_dashboards_userid ON active_dashboards USING btree (user_id);


--
-- Name: activities_log_key; Type: INDEX; Schema: public; Owner: sonar; Tablespace: 
--

CREATE UNIQUE INDEX activities_log_key ON activities USING btree (log_key);


--
-- Name: ce_activity_component_uuid; Type: INDEX; Schema: public; Owner: sonar; Tablespace: 
--

CREATE INDEX ce_activity_component_uuid ON ce_activity USING btree (component_uuid);


--
-- Name: ce_activity_uuid; Type: INDEX; Schema: public; Owner: sonar; Tablespace: 
--

CREATE UNIQUE INDEX ce_activity_uuid ON ce_activity USING btree (uuid);


--
-- Name: ce_queue_uuid; Type: INDEX; Schema: public; Owner: sonar; Tablespace: 
--

CREATE UNIQUE INDEX ce_queue_uuid ON ce_queue USING btree (uuid);


--
-- Name: characteristics_enabled; Type: INDEX; Schema: public; Owner: sonar; Tablespace: 
--

CREATE INDEX characteristics_enabled ON characteristics USING btree (enabled);


--
-- Name: duplications_index_hash; Type: INDEX; Schema: public; Owner: sonar; Tablespace: 
--

CREATE INDEX duplications_index_hash ON duplications_index USING btree (hash);


--
-- Name: duplications_index_psid; Type: INDEX; Schema: public; Owner: sonar; Tablespace: 
--

CREATE INDEX duplications_index_psid ON duplications_index USING btree (project_snapshot_id);


--
-- Name: duplications_index_sid; Type: INDEX; Schema: public; Owner: sonar; Tablespace: 
--

CREATE INDEX duplications_index_sid ON duplications_index USING btree (snapshot_id);


--
-- Name: events_component_uuid; Type: INDEX; Schema: public; Owner: sonar; Tablespace: 
--

CREATE INDEX events_component_uuid ON events USING btree (component_uuid);


--
-- Name: events_snapshot_id; Type: INDEX; Schema: public; Owner: sonar; Tablespace: 
--

CREATE INDEX events_snapshot_id ON events USING btree (snapshot_id);


--
-- Name: file_sources_project_uuid; Type: INDEX; Schema: public; Owner: sonar; Tablespace: 
--

CREATE INDEX file_sources_project_uuid ON file_sources USING btree (project_uuid);


--
-- Name: file_sources_updated_at; Type: INDEX; Schema: public; Owner: sonar; Tablespace: 
--

CREATE INDEX file_sources_updated_at ON file_sources USING btree (updated_at);


--
-- Name: file_sources_uuid_type; Type: INDEX; Schema: public; Owner: sonar; Tablespace: 
--

CREATE UNIQUE INDEX file_sources_uuid_type ON file_sources USING btree (file_uuid, data_type);


--
-- Name: group_roles_group; Type: INDEX; Schema: public; Owner: sonar; Tablespace: 
--

CREATE INDEX group_roles_group ON group_roles USING btree (group_id);


--
-- Name: group_roles_resource; Type: INDEX; Schema: public; Owner: sonar; Tablespace: 
--

CREATE INDEX group_roles_resource ON group_roles USING btree (resource_id);


--
-- Name: group_roles_role; Type: INDEX; Schema: public; Owner: sonar; Tablespace: 
--

CREATE INDEX group_roles_role ON group_roles USING btree (role);


--
-- Name: index_groups_users_on_group_id; Type: INDEX; Schema: public; Owner: sonar; Tablespace: 
--

CREATE INDEX index_groups_users_on_group_id ON groups_users USING btree (group_id);


--
-- Name: index_groups_users_on_user_id; Type: INDEX; Schema: public; Owner: sonar; Tablespace: 
--

CREATE INDEX index_groups_users_on_user_id ON groups_users USING btree (user_id);


--
-- Name: issue_changes_issue_key; Type: INDEX; Schema: public; Owner: sonar; Tablespace: 
--

CREATE INDEX issue_changes_issue_key ON issue_changes USING btree (issue_key);


--
-- Name: issue_changes_kee; Type: INDEX; Schema: public; Owner: sonar; Tablespace: 
--

CREATE INDEX issue_changes_kee ON issue_changes USING btree (kee);


--
-- Name: issue_filter_favs_user; Type: INDEX; Schema: public; Owner: sonar; Tablespace: 
--

CREATE INDEX issue_filter_favs_user ON issue_filter_favourites USING btree (user_login);


--
-- Name: issue_filters_name; Type: INDEX; Schema: public; Owner: sonar; Tablespace: 
--

CREATE INDEX issue_filters_name ON issue_filters USING btree (name);


--
-- Name: issues_action_plan_key; Type: INDEX; Schema: public; Owner: sonar; Tablespace: 
--

CREATE INDEX issues_action_plan_key ON issues USING btree (action_plan_key);


--
-- Name: issues_assignee; Type: INDEX; Schema: public; Owner: sonar; Tablespace: 
--

CREATE INDEX issues_assignee ON issues USING btree (assignee);


--
-- Name: issues_component_uuid; Type: INDEX; Schema: public; Owner: sonar; Tablespace: 
--

CREATE INDEX issues_component_uuid ON issues USING btree (component_uuid);


--
-- Name: issues_creation_date; Type: INDEX; Schema: public; Owner: sonar; Tablespace: 
--

CREATE INDEX issues_creation_date ON issues USING btree (issue_creation_date);


--
-- Name: issues_kee; Type: INDEX; Schema: public; Owner: sonar; Tablespace: 
--

CREATE UNIQUE INDEX issues_kee ON issues USING btree (kee);


--
-- Name: issues_project_uuid; Type: INDEX; Schema: public; Owner: sonar; Tablespace: 
--

CREATE INDEX issues_project_uuid ON issues USING btree (project_uuid);


--
-- Name: issues_resolution; Type: INDEX; Schema: public; Owner: sonar; Tablespace: 
--

CREATE INDEX issues_resolution ON issues USING btree (resolution);


--
-- Name: issues_rule_id; Type: INDEX; Schema: public; Owner: sonar; Tablespace: 
--

CREATE INDEX issues_rule_id ON issues USING btree (rule_id);


--
-- Name: issues_severity; Type: INDEX; Schema: public; Owner: sonar; Tablespace: 
--

CREATE INDEX issues_severity ON issues USING btree (severity);


--
-- Name: issues_status; Type: INDEX; Schema: public; Owner: sonar; Tablespace: 
--

CREATE INDEX issues_status ON issues USING btree (status);


--
-- Name: issues_updated_at; Type: INDEX; Schema: public; Owner: sonar; Tablespace: 
--

CREATE INDEX issues_updated_at ON issues USING btree (updated_at);


--
-- Name: manual_measures_component_uuid; Type: INDEX; Schema: public; Owner: sonar; Tablespace: 
--

CREATE INDEX manual_measures_component_uuid ON manual_measures USING btree (component_uuid);


--
-- Name: measure_filter_favs_userid; Type: INDEX; Schema: public; Owner: sonar; Tablespace: 
--

CREATE INDEX measure_filter_favs_userid ON measure_filter_favourites USING btree (user_id);


--
-- Name: measure_filters_name; Type: INDEX; Schema: public; Owner: sonar; Tablespace: 
--

CREATE INDEX measure_filters_name ON measure_filters USING btree (name);


--
-- Name: measures_sid_metric; Type: INDEX; Schema: public; Owner: sonar; Tablespace: 
--

CREATE INDEX measures_sid_metric ON project_measures USING btree (snapshot_id, metric_id);


--
-- Name: metrics_unique_name; Type: INDEX; Schema: public; Owner: sonar; Tablespace: 
--

CREATE UNIQUE INDEX metrics_unique_name ON metrics USING btree (name);


--
-- Name: projects_kee; Type: INDEX; Schema: public; Owner: sonar; Tablespace: 
--

CREATE UNIQUE INDEX projects_kee ON projects USING btree (kee);


--
-- Name: projects_module_uuid; Type: INDEX; Schema: public; Owner: sonar; Tablespace: 
--

CREATE INDEX projects_module_uuid ON projects USING btree (module_uuid);


--
-- Name: projects_project_uuid; Type: INDEX; Schema: public; Owner: sonar; Tablespace: 
--

CREATE INDEX projects_project_uuid ON projects USING btree (project_uuid);


--
-- Name: projects_qualifier; Type: INDEX; Schema: public; Owner: sonar; Tablespace: 
--

CREATE INDEX projects_qualifier ON projects USING btree (qualifier);


--
-- Name: projects_root_id; Type: INDEX; Schema: public; Owner: sonar; Tablespace: 
--

CREATE INDEX projects_root_id ON projects USING btree (root_id);


--
-- Name: projects_uuid; Type: INDEX; Schema: public; Owner: sonar; Tablespace: 
--

CREATE UNIQUE INDEX projects_uuid ON projects USING btree (uuid);


--
-- Name: properties_key; Type: INDEX; Schema: public; Owner: sonar; Tablespace: 
--

CREATE INDEX properties_key ON properties USING btree (prop_key);


--
-- Name: resource_index_key; Type: INDEX; Schema: public; Owner: sonar; Tablespace: 
--

CREATE INDEX resource_index_key ON resource_index USING btree (kee);


--
-- Name: resource_index_rid; Type: INDEX; Schema: public; Owner: sonar; Tablespace: 
--

CREATE INDEX resource_index_rid ON resource_index USING btree (resource_id);


--
-- Name: rules_parameters_rule_id; Type: INDEX; Schema: public; Owner: sonar; Tablespace: 
--

CREATE INDEX rules_parameters_rule_id ON rules_parameters USING btree (rule_id);


--
-- Name: rules_repo_key; Type: INDEX; Schema: public; Owner: sonar; Tablespace: 
--

CREATE UNIQUE INDEX rules_repo_key ON rules USING btree (plugin_rule_key, plugin_name);


--
-- Name: snapshot_project_id; Type: INDEX; Schema: public; Owner: sonar; Tablespace: 
--

CREATE INDEX snapshot_project_id ON snapshots USING btree (project_id);


--
-- Name: snapshots_parent; Type: INDEX; Schema: public; Owner: sonar; Tablespace: 
--

CREATE INDEX snapshots_parent ON snapshots USING btree (parent_snapshot_id);


--
-- Name: snapshots_qualifier; Type: INDEX; Schema: public; Owner: sonar; Tablespace: 
--

CREATE INDEX snapshots_qualifier ON snapshots USING btree (qualifier);


--
-- Name: snapshots_root; Type: INDEX; Schema: public; Owner: sonar; Tablespace: 
--

CREATE INDEX snapshots_root ON snapshots USING btree (root_snapshot_id);


--
-- Name: snapshots_root_project_id; Type: INDEX; Schema: public; Owner: sonar; Tablespace: 
--

CREATE INDEX snapshots_root_project_id ON snapshots USING btree (root_project_id);


--
-- Name: uniq_author_logins; Type: INDEX; Schema: public; Owner: sonar; Tablespace: 
--

CREATE UNIQUE INDEX uniq_author_logins ON authors USING btree (login);


--
-- Name: uniq_group_roles; Type: INDEX; Schema: public; Owner: sonar; Tablespace: 
--

CREATE UNIQUE INDEX uniq_group_roles ON group_roles USING btree (group_id, resource_id, role);


--
-- Name: uniq_profile_rule_ids; Type: INDEX; Schema: public; Owner: sonar; Tablespace: 
--

CREATE UNIQUE INDEX uniq_profile_rule_ids ON active_rules USING btree (profile_id, rule_id);


--
-- Name: uniq_project_qprofiles; Type: INDEX; Schema: public; Owner: sonar; Tablespace: 
--

CREATE UNIQUE INDEX uniq_project_qprofiles ON project_qprofiles USING btree (project_uuid, profile_key);


--
-- Name: uniq_qprof_key; Type: INDEX; Schema: public; Owner: sonar; Tablespace: 
--

CREATE UNIQUE INDEX uniq_qprof_key ON rules_profiles USING btree (kee);


--
-- Name: uniq_quality_gates; Type: INDEX; Schema: public; Owner: sonar; Tablespace: 
--

CREATE UNIQUE INDEX uniq_quality_gates ON quality_gates USING btree (name);


--
-- Name: unique_schema_migrations; Type: INDEX; Schema: public; Owner: sonar; Tablespace: 
--

CREATE UNIQUE INDEX unique_schema_migrations ON schema_migrations USING btree (version);


--
-- Name: user_roles_resource; Type: INDEX; Schema: public; Owner: sonar; Tablespace: 
--

CREATE INDEX user_roles_resource ON user_roles USING btree (resource_id);


--
-- Name: user_roles_user; Type: INDEX; Schema: public; Owner: sonar; Tablespace: 
--

CREATE INDEX user_roles_user ON user_roles USING btree (user_id);


--
-- Name: users_login; Type: INDEX; Schema: public; Owner: sonar; Tablespace: 
--

CREATE UNIQUE INDEX users_login ON users USING btree (login);


--
-- Name: users_updated_at; Type: INDEX; Schema: public; Owner: sonar; Tablespace: 
--

CREATE INDEX users_updated_at ON users USING btree (updated_at);


--
-- Name: widget_properties_widgets; Type: INDEX; Schema: public; Owner: sonar; Tablespace: 
--

CREATE INDEX widget_properties_widgets ON widget_properties USING btree (widget_id);


--
-- Name: widgets_dashboards; Type: INDEX; Schema: public; Owner: sonar; Tablespace: 
--

CREATE INDEX widgets_dashboards ON widgets USING btree (dashboard_id);


--
-- Name: widgets_widgetkey; Type: INDEX; Schema: public; Owner: sonar; Tablespace: 
--

CREATE INDEX widgets_widgetkey ON widgets USING btree (widget_key);


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

