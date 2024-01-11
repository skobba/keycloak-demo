--
-- PostgreSQL database dump
--

-- Dumped from database version 13.2 (Debian 13.2-1.pgdg100+1)
-- Dumped by pg_dump version 13.2 (Debian 13.2-1.pgdg100+1)

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
-- Name: admin_event_entity; Type: TABLE; Schema: public; Owner: keycloak
--

CREATE TABLE public.admin_event_entity (
    id character varying(36) NOT NULL,
    admin_event_time bigint,
    realm_id character varying(255),
    operation_type character varying(255),
    auth_realm_id character varying(255),
    auth_client_id character varying(255),
    auth_user_id character varying(255),
    ip_address character varying(255),
    resource_path character varying(2550),
    representation text,
    error character varying(255),
    resource_type character varying(64)
);


ALTER TABLE public.admin_event_entity OWNER TO keycloak;

--
-- Name: associated_policy; Type: TABLE; Schema: public; Owner: keycloak
--

CREATE TABLE public.associated_policy (
    policy_id character varying(36) NOT NULL,
    associated_policy_id character varying(36) NOT NULL
);


ALTER TABLE public.associated_policy OWNER TO keycloak;

--
-- Name: authentication_execution; Type: TABLE; Schema: public; Owner: keycloak
--

CREATE TABLE public.authentication_execution (
    id character varying(36) NOT NULL,
    alias character varying(255),
    authenticator character varying(36),
    realm_id character varying(36),
    flow_id character varying(36),
    requirement integer,
    priority integer,
    authenticator_flow boolean DEFAULT false NOT NULL,
    auth_flow_id character varying(36),
    auth_config character varying(36)
);


ALTER TABLE public.authentication_execution OWNER TO keycloak;

--
-- Name: authentication_flow; Type: TABLE; Schema: public; Owner: keycloak
--

CREATE TABLE public.authentication_flow (
    id character varying(36) NOT NULL,
    alias character varying(255),
    description character varying(255),
    realm_id character varying(36),
    provider_id character varying(36) DEFAULT 'basic-flow'::character varying NOT NULL,
    top_level boolean DEFAULT false NOT NULL,
    built_in boolean DEFAULT false NOT NULL
);


ALTER TABLE public.authentication_flow OWNER TO keycloak;

--
-- Name: authenticator_config; Type: TABLE; Schema: public; Owner: keycloak
--

CREATE TABLE public.authenticator_config (
    id character varying(36) NOT NULL,
    alias character varying(255),
    realm_id character varying(36)
);


ALTER TABLE public.authenticator_config OWNER TO keycloak;

--
-- Name: authenticator_config_entry; Type: TABLE; Schema: public; Owner: keycloak
--

CREATE TABLE public.authenticator_config_entry (
    authenticator_id character varying(36) NOT NULL,
    value text,
    name character varying(255) NOT NULL
);


ALTER TABLE public.authenticator_config_entry OWNER TO keycloak;

--
-- Name: broker_link; Type: TABLE; Schema: public; Owner: keycloak
--

CREATE TABLE public.broker_link (
    identity_provider character varying(255) NOT NULL,
    storage_provider_id character varying(255),
    realm_id character varying(36) NOT NULL,
    broker_user_id character varying(255),
    broker_username character varying(255),
    token text,
    user_id character varying(255) NOT NULL
);


ALTER TABLE public.broker_link OWNER TO keycloak;

--
-- Name: client; Type: TABLE; Schema: public; Owner: keycloak
--

CREATE TABLE public.client (
    id character varying(36) NOT NULL,
    enabled boolean DEFAULT false NOT NULL,
    full_scope_allowed boolean DEFAULT false NOT NULL,
    client_id character varying(255),
    not_before integer,
    public_client boolean DEFAULT false NOT NULL,
    secret character varying(255),
    base_url character varying(255),
    bearer_only boolean DEFAULT false NOT NULL,
    management_url character varying(255),
    surrogate_auth_required boolean DEFAULT false NOT NULL,
    realm_id character varying(36),
    protocol character varying(255),
    node_rereg_timeout integer DEFAULT 0,
    frontchannel_logout boolean DEFAULT false NOT NULL,
    consent_required boolean DEFAULT false NOT NULL,
    name character varying(255),
    service_accounts_enabled boolean DEFAULT false NOT NULL,
    client_authenticator_type character varying(255),
    root_url character varying(255),
    description character varying(255),
    registration_token character varying(255),
    standard_flow_enabled boolean DEFAULT true NOT NULL,
    implicit_flow_enabled boolean DEFAULT false NOT NULL,
    direct_access_grants_enabled boolean DEFAULT false NOT NULL,
    always_display_in_console boolean DEFAULT false NOT NULL
);


ALTER TABLE public.client OWNER TO keycloak;

--
-- Name: client_attributes; Type: TABLE; Schema: public; Owner: keycloak
--

CREATE TABLE public.client_attributes (
    client_id character varying(36) NOT NULL,
    name character varying(255) NOT NULL,
    value text
);


ALTER TABLE public.client_attributes OWNER TO keycloak;

--
-- Name: client_auth_flow_bindings; Type: TABLE; Schema: public; Owner: keycloak
--

CREATE TABLE public.client_auth_flow_bindings (
    client_id character varying(36) NOT NULL,
    flow_id character varying(36),
    binding_name character varying(255) NOT NULL
);


ALTER TABLE public.client_auth_flow_bindings OWNER TO keycloak;

--
-- Name: client_initial_access; Type: TABLE; Schema: public; Owner: keycloak
--

CREATE TABLE public.client_initial_access (
    id character varying(36) NOT NULL,
    realm_id character varying(36) NOT NULL,
    "timestamp" integer,
    expiration integer,
    count integer,
    remaining_count integer
);


ALTER TABLE public.client_initial_access OWNER TO keycloak;

--
-- Name: client_node_registrations; Type: TABLE; Schema: public; Owner: keycloak
--

CREATE TABLE public.client_node_registrations (
    client_id character varying(36) NOT NULL,
    value integer,
    name character varying(255) NOT NULL
);


ALTER TABLE public.client_node_registrations OWNER TO keycloak;

--
-- Name: client_scope; Type: TABLE; Schema: public; Owner: keycloak
--

CREATE TABLE public.client_scope (
    id character varying(36) NOT NULL,
    name character varying(255),
    realm_id character varying(36),
    description character varying(255),
    protocol character varying(255)
);


ALTER TABLE public.client_scope OWNER TO keycloak;

--
-- Name: client_scope_attributes; Type: TABLE; Schema: public; Owner: keycloak
--

CREATE TABLE public.client_scope_attributes (
    scope_id character varying(36) NOT NULL,
    value character varying(2048),
    name character varying(255) NOT NULL
);


ALTER TABLE public.client_scope_attributes OWNER TO keycloak;

--
-- Name: client_scope_client; Type: TABLE; Schema: public; Owner: keycloak
--

CREATE TABLE public.client_scope_client (
    client_id character varying(255) NOT NULL,
    scope_id character varying(255) NOT NULL,
    default_scope boolean DEFAULT false NOT NULL
);


ALTER TABLE public.client_scope_client OWNER TO keycloak;

--
-- Name: client_scope_role_mapping; Type: TABLE; Schema: public; Owner: keycloak
--

CREATE TABLE public.client_scope_role_mapping (
    scope_id character varying(36) NOT NULL,
    role_id character varying(36) NOT NULL
);


ALTER TABLE public.client_scope_role_mapping OWNER TO keycloak;

--
-- Name: client_session; Type: TABLE; Schema: public; Owner: keycloak
--

CREATE TABLE public.client_session (
    id character varying(36) NOT NULL,
    client_id character varying(36),
    redirect_uri character varying(255),
    state character varying(255),
    "timestamp" integer,
    session_id character varying(36),
    auth_method character varying(255),
    realm_id character varying(255),
    auth_user_id character varying(36),
    current_action character varying(36)
);


ALTER TABLE public.client_session OWNER TO keycloak;

--
-- Name: client_session_auth_status; Type: TABLE; Schema: public; Owner: keycloak
--

CREATE TABLE public.client_session_auth_status (
    authenticator character varying(36) NOT NULL,
    status integer,
    client_session character varying(36) NOT NULL
);


ALTER TABLE public.client_session_auth_status OWNER TO keycloak;

--
-- Name: client_session_note; Type: TABLE; Schema: public; Owner: keycloak
--

CREATE TABLE public.client_session_note (
    name character varying(255) NOT NULL,
    value character varying(255),
    client_session character varying(36) NOT NULL
);


ALTER TABLE public.client_session_note OWNER TO keycloak;

--
-- Name: client_session_prot_mapper; Type: TABLE; Schema: public; Owner: keycloak
--

CREATE TABLE public.client_session_prot_mapper (
    protocol_mapper_id character varying(36) NOT NULL,
    client_session character varying(36) NOT NULL
);


ALTER TABLE public.client_session_prot_mapper OWNER TO keycloak;

--
-- Name: client_session_role; Type: TABLE; Schema: public; Owner: keycloak
--

CREATE TABLE public.client_session_role (
    role_id character varying(255) NOT NULL,
    client_session character varying(36) NOT NULL
);


ALTER TABLE public.client_session_role OWNER TO keycloak;

--
-- Name: client_user_session_note; Type: TABLE; Schema: public; Owner: keycloak
--

CREATE TABLE public.client_user_session_note (
    name character varying(255) NOT NULL,
    value character varying(2048),
    client_session character varying(36) NOT NULL
);


ALTER TABLE public.client_user_session_note OWNER TO keycloak;

--
-- Name: component; Type: TABLE; Schema: public; Owner: keycloak
--

CREATE TABLE public.component (
    id character varying(36) NOT NULL,
    name character varying(255),
    parent_id character varying(36),
    provider_id character varying(36),
    provider_type character varying(255),
    realm_id character varying(36),
    sub_type character varying(255)
);


ALTER TABLE public.component OWNER TO keycloak;

--
-- Name: component_config; Type: TABLE; Schema: public; Owner: keycloak
--

CREATE TABLE public.component_config (
    id character varying(36) NOT NULL,
    component_id character varying(36) NOT NULL,
    name character varying(255) NOT NULL,
    value text
);


ALTER TABLE public.component_config OWNER TO keycloak;

--
-- Name: composite_role; Type: TABLE; Schema: public; Owner: keycloak
--

CREATE TABLE public.composite_role (
    composite character varying(36) NOT NULL,
    child_role character varying(36) NOT NULL
);


ALTER TABLE public.composite_role OWNER TO keycloak;

--
-- Name: credential; Type: TABLE; Schema: public; Owner: keycloak
--

CREATE TABLE public.credential (
    id character varying(36) NOT NULL,
    salt bytea,
    type character varying(255),
    user_id character varying(36),
    created_date bigint,
    user_label character varying(255),
    secret_data text,
    credential_data text,
    priority integer
);


ALTER TABLE public.credential OWNER TO keycloak;

--
-- Name: databasechangelog; Type: TABLE; Schema: public; Owner: keycloak
--

CREATE TABLE public.databasechangelog (
    id character varying(255) NOT NULL,
    author character varying(255) NOT NULL,
    filename character varying(255) NOT NULL,
    dateexecuted timestamp without time zone NOT NULL,
    orderexecuted integer NOT NULL,
    exectype character varying(10) NOT NULL,
    md5sum character varying(35),
    description character varying(255),
    comments character varying(255),
    tag character varying(255),
    liquibase character varying(20),
    contexts character varying(255),
    labels character varying(255),
    deployment_id character varying(10)
);


ALTER TABLE public.databasechangelog OWNER TO keycloak;

--
-- Name: databasechangeloglock; Type: TABLE; Schema: public; Owner: keycloak
--

CREATE TABLE public.databasechangeloglock (
    id integer NOT NULL,
    locked boolean NOT NULL,
    lockgranted timestamp without time zone,
    lockedby character varying(255)
);


ALTER TABLE public.databasechangeloglock OWNER TO keycloak;

--
-- Name: default_client_scope; Type: TABLE; Schema: public; Owner: keycloak
--

CREATE TABLE public.default_client_scope (
    realm_id character varying(36) NOT NULL,
    scope_id character varying(36) NOT NULL,
    default_scope boolean DEFAULT false NOT NULL
);


ALTER TABLE public.default_client_scope OWNER TO keycloak;

--
-- Name: event_entity; Type: TABLE; Schema: public; Owner: keycloak
--

CREATE TABLE public.event_entity (
    id character varying(36) NOT NULL,
    client_id character varying(255),
    details_json character varying(2550),
    error character varying(255),
    ip_address character varying(255),
    realm_id character varying(255),
    session_id character varying(255),
    event_time bigint,
    type character varying(255),
    user_id character varying(255),
    details_json_long_value text
);


ALTER TABLE public.event_entity OWNER TO keycloak;

--
-- Name: fed_user_attribute; Type: TABLE; Schema: public; Owner: keycloak
--

CREATE TABLE public.fed_user_attribute (
    id character varying(36) NOT NULL,
    name character varying(255) NOT NULL,
    user_id character varying(255) NOT NULL,
    realm_id character varying(36) NOT NULL,
    storage_provider_id character varying(36),
    value character varying(2024)
);


ALTER TABLE public.fed_user_attribute OWNER TO keycloak;

--
-- Name: fed_user_consent; Type: TABLE; Schema: public; Owner: keycloak
--

CREATE TABLE public.fed_user_consent (
    id character varying(36) NOT NULL,
    client_id character varying(255),
    user_id character varying(255) NOT NULL,
    realm_id character varying(36) NOT NULL,
    storage_provider_id character varying(36),
    created_date bigint,
    last_updated_date bigint,
    client_storage_provider character varying(36),
    external_client_id character varying(255)
);


ALTER TABLE public.fed_user_consent OWNER TO keycloak;

--
-- Name: fed_user_consent_cl_scope; Type: TABLE; Schema: public; Owner: keycloak
--

CREATE TABLE public.fed_user_consent_cl_scope (
    user_consent_id character varying(36) NOT NULL,
    scope_id character varying(36) NOT NULL
);


ALTER TABLE public.fed_user_consent_cl_scope OWNER TO keycloak;

--
-- Name: fed_user_credential; Type: TABLE; Schema: public; Owner: keycloak
--

CREATE TABLE public.fed_user_credential (
    id character varying(36) NOT NULL,
    salt bytea,
    type character varying(255),
    created_date bigint,
    user_id character varying(255) NOT NULL,
    realm_id character varying(36) NOT NULL,
    storage_provider_id character varying(36),
    user_label character varying(255),
    secret_data text,
    credential_data text,
    priority integer
);


ALTER TABLE public.fed_user_credential OWNER TO keycloak;

--
-- Name: fed_user_group_membership; Type: TABLE; Schema: public; Owner: keycloak
--

CREATE TABLE public.fed_user_group_membership (
    group_id character varying(36) NOT NULL,
    user_id character varying(255) NOT NULL,
    realm_id character varying(36) NOT NULL,
    storage_provider_id character varying(36)
);


ALTER TABLE public.fed_user_group_membership OWNER TO keycloak;

--
-- Name: fed_user_required_action; Type: TABLE; Schema: public; Owner: keycloak
--

CREATE TABLE public.fed_user_required_action (
    required_action character varying(255) DEFAULT ' '::character varying NOT NULL,
    user_id character varying(255) NOT NULL,
    realm_id character varying(36) NOT NULL,
    storage_provider_id character varying(36)
);


ALTER TABLE public.fed_user_required_action OWNER TO keycloak;

--
-- Name: fed_user_role_mapping; Type: TABLE; Schema: public; Owner: keycloak
--

CREATE TABLE public.fed_user_role_mapping (
    role_id character varying(36) NOT NULL,
    user_id character varying(255) NOT NULL,
    realm_id character varying(36) NOT NULL,
    storage_provider_id character varying(36)
);


ALTER TABLE public.fed_user_role_mapping OWNER TO keycloak;

--
-- Name: federated_identity; Type: TABLE; Schema: public; Owner: keycloak
--

CREATE TABLE public.federated_identity (
    identity_provider character varying(255) NOT NULL,
    realm_id character varying(36),
    federated_user_id character varying(255),
    federated_username character varying(255),
    token text,
    user_id character varying(36) NOT NULL
);


ALTER TABLE public.federated_identity OWNER TO keycloak;

--
-- Name: federated_user; Type: TABLE; Schema: public; Owner: keycloak
--

CREATE TABLE public.federated_user (
    id character varying(255) NOT NULL,
    storage_provider_id character varying(255),
    realm_id character varying(36) NOT NULL
);


ALTER TABLE public.federated_user OWNER TO keycloak;

--
-- Name: group_attribute; Type: TABLE; Schema: public; Owner: keycloak
--

CREATE TABLE public.group_attribute (
    id character varying(36) DEFAULT 'sybase-needs-something-here'::character varying NOT NULL,
    name character varying(255) NOT NULL,
    value character varying(255),
    group_id character varying(36) NOT NULL
);


ALTER TABLE public.group_attribute OWNER TO keycloak;

--
-- Name: group_role_mapping; Type: TABLE; Schema: public; Owner: keycloak
--

CREATE TABLE public.group_role_mapping (
    role_id character varying(36) NOT NULL,
    group_id character varying(36) NOT NULL
);


ALTER TABLE public.group_role_mapping OWNER TO keycloak;

--
-- Name: identity_provider; Type: TABLE; Schema: public; Owner: keycloak
--

CREATE TABLE public.identity_provider (
    internal_id character varying(36) NOT NULL,
    enabled boolean DEFAULT false NOT NULL,
    provider_alias character varying(255),
    provider_id character varying(255),
    store_token boolean DEFAULT false NOT NULL,
    authenticate_by_default boolean DEFAULT false NOT NULL,
    realm_id character varying(36),
    add_token_role boolean DEFAULT true NOT NULL,
    trust_email boolean DEFAULT false NOT NULL,
    first_broker_login_flow_id character varying(36),
    post_broker_login_flow_id character varying(36),
    provider_display_name character varying(255),
    link_only boolean DEFAULT false NOT NULL
);


ALTER TABLE public.identity_provider OWNER TO keycloak;

--
-- Name: identity_provider_config; Type: TABLE; Schema: public; Owner: keycloak
--

CREATE TABLE public.identity_provider_config (
    identity_provider_id character varying(36) NOT NULL,
    value text,
    name character varying(255) NOT NULL
);


ALTER TABLE public.identity_provider_config OWNER TO keycloak;

--
-- Name: identity_provider_mapper; Type: TABLE; Schema: public; Owner: keycloak
--

CREATE TABLE public.identity_provider_mapper (
    id character varying(36) NOT NULL,
    name character varying(255) NOT NULL,
    idp_alias character varying(255) NOT NULL,
    idp_mapper_name character varying(255) NOT NULL,
    realm_id character varying(36) NOT NULL
);


ALTER TABLE public.identity_provider_mapper OWNER TO keycloak;

--
-- Name: idp_mapper_config; Type: TABLE; Schema: public; Owner: keycloak
--

CREATE TABLE public.idp_mapper_config (
    idp_mapper_id character varying(36) NOT NULL,
    value text,
    name character varying(255) NOT NULL
);


ALTER TABLE public.idp_mapper_config OWNER TO keycloak;

--
-- Name: keycloak_group; Type: TABLE; Schema: public; Owner: keycloak
--

CREATE TABLE public.keycloak_group (
    id character varying(36) NOT NULL,
    name character varying(255),
    parent_group character varying(36) NOT NULL,
    realm_id character varying(36)
);


ALTER TABLE public.keycloak_group OWNER TO keycloak;

--
-- Name: keycloak_role; Type: TABLE; Schema: public; Owner: keycloak
--

CREATE TABLE public.keycloak_role (
    id character varying(36) NOT NULL,
    client_realm_constraint character varying(255),
    client_role boolean DEFAULT false NOT NULL,
    description character varying(255),
    name character varying(255),
    realm_id character varying(255),
    client character varying(36),
    realm character varying(36)
);


ALTER TABLE public.keycloak_role OWNER TO keycloak;

--
-- Name: migration_model; Type: TABLE; Schema: public; Owner: keycloak
--

CREATE TABLE public.migration_model (
    id character varying(36) NOT NULL,
    version character varying(36),
    update_time bigint DEFAULT 0 NOT NULL
);


ALTER TABLE public.migration_model OWNER TO keycloak;

--
-- Name: offline_client_session; Type: TABLE; Schema: public; Owner: keycloak
--

CREATE TABLE public.offline_client_session (
    user_session_id character varying(36) NOT NULL,
    client_id character varying(255) NOT NULL,
    offline_flag character varying(4) NOT NULL,
    "timestamp" integer,
    data text,
    client_storage_provider character varying(36) DEFAULT 'local'::character varying NOT NULL,
    external_client_id character varying(255) DEFAULT 'local'::character varying NOT NULL
);


ALTER TABLE public.offline_client_session OWNER TO keycloak;

--
-- Name: offline_user_session; Type: TABLE; Schema: public; Owner: keycloak
--

CREATE TABLE public.offline_user_session (
    user_session_id character varying(36) NOT NULL,
    user_id character varying(255) NOT NULL,
    realm_id character varying(36) NOT NULL,
    created_on integer NOT NULL,
    offline_flag character varying(4) NOT NULL,
    data text,
    last_session_refresh integer DEFAULT 0 NOT NULL
);


ALTER TABLE public.offline_user_session OWNER TO keycloak;

--
-- Name: policy_config; Type: TABLE; Schema: public; Owner: keycloak
--

CREATE TABLE public.policy_config (
    policy_id character varying(36) NOT NULL,
    name character varying(255) NOT NULL,
    value text
);


ALTER TABLE public.policy_config OWNER TO keycloak;

--
-- Name: protocol_mapper; Type: TABLE; Schema: public; Owner: keycloak
--

CREATE TABLE public.protocol_mapper (
    id character varying(36) NOT NULL,
    name character varying(255) NOT NULL,
    protocol character varying(255) NOT NULL,
    protocol_mapper_name character varying(255) NOT NULL,
    client_id character varying(36),
    client_scope_id character varying(36)
);


ALTER TABLE public.protocol_mapper OWNER TO keycloak;

--
-- Name: protocol_mapper_config; Type: TABLE; Schema: public; Owner: keycloak
--

CREATE TABLE public.protocol_mapper_config (
    protocol_mapper_id character varying(36) NOT NULL,
    value text,
    name character varying(255) NOT NULL
);


ALTER TABLE public.protocol_mapper_config OWNER TO keycloak;

--
-- Name: realm; Type: TABLE; Schema: public; Owner: keycloak
--

CREATE TABLE public.realm (
    id character varying(36) NOT NULL,
    access_code_lifespan integer,
    user_action_lifespan integer,
    access_token_lifespan integer,
    account_theme character varying(255),
    admin_theme character varying(255),
    email_theme character varying(255),
    enabled boolean DEFAULT false NOT NULL,
    events_enabled boolean DEFAULT false NOT NULL,
    events_expiration bigint,
    login_theme character varying(255),
    name character varying(255),
    not_before integer,
    password_policy character varying(2550),
    registration_allowed boolean DEFAULT false NOT NULL,
    remember_me boolean DEFAULT false NOT NULL,
    reset_password_allowed boolean DEFAULT false NOT NULL,
    social boolean DEFAULT false NOT NULL,
    ssl_required character varying(255),
    sso_idle_timeout integer,
    sso_max_lifespan integer,
    update_profile_on_soc_login boolean DEFAULT false NOT NULL,
    verify_email boolean DEFAULT false NOT NULL,
    master_admin_client character varying(36),
    login_lifespan integer,
    internationalization_enabled boolean DEFAULT false NOT NULL,
    default_locale character varying(255),
    reg_email_as_username boolean DEFAULT false NOT NULL,
    admin_events_enabled boolean DEFAULT false NOT NULL,
    admin_events_details_enabled boolean DEFAULT false NOT NULL,
    edit_username_allowed boolean DEFAULT false NOT NULL,
    otp_policy_counter integer DEFAULT 0,
    otp_policy_window integer DEFAULT 1,
    otp_policy_period integer DEFAULT 30,
    otp_policy_digits integer DEFAULT 6,
    otp_policy_alg character varying(36) DEFAULT 'HmacSHA1'::character varying,
    otp_policy_type character varying(36) DEFAULT 'totp'::character varying,
    browser_flow character varying(36),
    registration_flow character varying(36),
    direct_grant_flow character varying(36),
    reset_credentials_flow character varying(36),
    client_auth_flow character varying(36),
    offline_session_idle_timeout integer DEFAULT 0,
    revoke_refresh_token boolean DEFAULT false NOT NULL,
    access_token_life_implicit integer DEFAULT 0,
    login_with_email_allowed boolean DEFAULT true NOT NULL,
    duplicate_emails_allowed boolean DEFAULT false NOT NULL,
    docker_auth_flow character varying(36),
    refresh_token_max_reuse integer DEFAULT 0,
    allow_user_managed_access boolean DEFAULT false NOT NULL,
    sso_max_lifespan_remember_me integer DEFAULT 0 NOT NULL,
    sso_idle_timeout_remember_me integer DEFAULT 0 NOT NULL,
    default_role character varying(255)
);


ALTER TABLE public.realm OWNER TO keycloak;

--
-- Name: realm_attribute; Type: TABLE; Schema: public; Owner: keycloak
--

CREATE TABLE public.realm_attribute (
    name character varying(255) NOT NULL,
    realm_id character varying(36) NOT NULL,
    value text
);


ALTER TABLE public.realm_attribute OWNER TO keycloak;

--
-- Name: realm_default_groups; Type: TABLE; Schema: public; Owner: keycloak
--

CREATE TABLE public.realm_default_groups (
    realm_id character varying(36) NOT NULL,
    group_id character varying(36) NOT NULL
);


ALTER TABLE public.realm_default_groups OWNER TO keycloak;

--
-- Name: realm_enabled_event_types; Type: TABLE; Schema: public; Owner: keycloak
--

CREATE TABLE public.realm_enabled_event_types (
    realm_id character varying(36) NOT NULL,
    value character varying(255) NOT NULL
);


ALTER TABLE public.realm_enabled_event_types OWNER TO keycloak;

--
-- Name: realm_events_listeners; Type: TABLE; Schema: public; Owner: keycloak
--

CREATE TABLE public.realm_events_listeners (
    realm_id character varying(36) NOT NULL,
    value character varying(255) NOT NULL
);


ALTER TABLE public.realm_events_listeners OWNER TO keycloak;

--
-- Name: realm_localizations; Type: TABLE; Schema: public; Owner: keycloak
--

CREATE TABLE public.realm_localizations (
    realm_id character varying(255) NOT NULL,
    locale character varying(255) NOT NULL,
    texts text NOT NULL
);


ALTER TABLE public.realm_localizations OWNER TO keycloak;

--
-- Name: realm_required_credential; Type: TABLE; Schema: public; Owner: keycloak
--

CREATE TABLE public.realm_required_credential (
    type character varying(255) NOT NULL,
    form_label character varying(255),
    input boolean DEFAULT false NOT NULL,
    secret boolean DEFAULT false NOT NULL,
    realm_id character varying(36) NOT NULL
);


ALTER TABLE public.realm_required_credential OWNER TO keycloak;

--
-- Name: realm_smtp_config; Type: TABLE; Schema: public; Owner: keycloak
--

CREATE TABLE public.realm_smtp_config (
    realm_id character varying(36) NOT NULL,
    value character varying(255),
    name character varying(255) NOT NULL
);


ALTER TABLE public.realm_smtp_config OWNER TO keycloak;

--
-- Name: realm_supported_locales; Type: TABLE; Schema: public; Owner: keycloak
--

CREATE TABLE public.realm_supported_locales (
    realm_id character varying(36) NOT NULL,
    value character varying(255) NOT NULL
);


ALTER TABLE public.realm_supported_locales OWNER TO keycloak;

--
-- Name: redirect_uris; Type: TABLE; Schema: public; Owner: keycloak
--

CREATE TABLE public.redirect_uris (
    client_id character varying(36) NOT NULL,
    value character varying(255) NOT NULL
);


ALTER TABLE public.redirect_uris OWNER TO keycloak;

--
-- Name: required_action_config; Type: TABLE; Schema: public; Owner: keycloak
--

CREATE TABLE public.required_action_config (
    required_action_id character varying(36) NOT NULL,
    value text,
    name character varying(255) NOT NULL
);


ALTER TABLE public.required_action_config OWNER TO keycloak;

--
-- Name: required_action_provider; Type: TABLE; Schema: public; Owner: keycloak
--

CREATE TABLE public.required_action_provider (
    id character varying(36) NOT NULL,
    alias character varying(255),
    name character varying(255),
    realm_id character varying(36),
    enabled boolean DEFAULT false NOT NULL,
    default_action boolean DEFAULT false NOT NULL,
    provider_id character varying(255),
    priority integer
);


ALTER TABLE public.required_action_provider OWNER TO keycloak;

--
-- Name: resource_attribute; Type: TABLE; Schema: public; Owner: keycloak
--

CREATE TABLE public.resource_attribute (
    id character varying(36) DEFAULT 'sybase-needs-something-here'::character varying NOT NULL,
    name character varying(255) NOT NULL,
    value character varying(255),
    resource_id character varying(36) NOT NULL
);


ALTER TABLE public.resource_attribute OWNER TO keycloak;

--
-- Name: resource_policy; Type: TABLE; Schema: public; Owner: keycloak
--

CREATE TABLE public.resource_policy (
    resource_id character varying(36) NOT NULL,
    policy_id character varying(36) NOT NULL
);


ALTER TABLE public.resource_policy OWNER TO keycloak;

--
-- Name: resource_scope; Type: TABLE; Schema: public; Owner: keycloak
--

CREATE TABLE public.resource_scope (
    resource_id character varying(36) NOT NULL,
    scope_id character varying(36) NOT NULL
);


ALTER TABLE public.resource_scope OWNER TO keycloak;

--
-- Name: resource_server; Type: TABLE; Schema: public; Owner: keycloak
--

CREATE TABLE public.resource_server (
    id character varying(36) NOT NULL,
    allow_rs_remote_mgmt boolean DEFAULT false NOT NULL,
    policy_enforce_mode smallint NOT NULL,
    decision_strategy smallint DEFAULT 1 NOT NULL
);


ALTER TABLE public.resource_server OWNER TO keycloak;

--
-- Name: resource_server_perm_ticket; Type: TABLE; Schema: public; Owner: keycloak
--

CREATE TABLE public.resource_server_perm_ticket (
    id character varying(36) NOT NULL,
    owner character varying(255) NOT NULL,
    requester character varying(255) NOT NULL,
    created_timestamp bigint NOT NULL,
    granted_timestamp bigint,
    resource_id character varying(36) NOT NULL,
    scope_id character varying(36),
    resource_server_id character varying(36) NOT NULL,
    policy_id character varying(36)
);


ALTER TABLE public.resource_server_perm_ticket OWNER TO keycloak;

--
-- Name: resource_server_policy; Type: TABLE; Schema: public; Owner: keycloak
--

CREATE TABLE public.resource_server_policy (
    id character varying(36) NOT NULL,
    name character varying(255) NOT NULL,
    description character varying(255),
    type character varying(255) NOT NULL,
    decision_strategy smallint,
    logic smallint,
    resource_server_id character varying(36) NOT NULL,
    owner character varying(255)
);


ALTER TABLE public.resource_server_policy OWNER TO keycloak;

--
-- Name: resource_server_resource; Type: TABLE; Schema: public; Owner: keycloak
--

CREATE TABLE public.resource_server_resource (
    id character varying(36) NOT NULL,
    name character varying(255) NOT NULL,
    type character varying(255),
    icon_uri character varying(255),
    owner character varying(255) NOT NULL,
    resource_server_id character varying(36) NOT NULL,
    owner_managed_access boolean DEFAULT false NOT NULL,
    display_name character varying(255)
);


ALTER TABLE public.resource_server_resource OWNER TO keycloak;

--
-- Name: resource_server_scope; Type: TABLE; Schema: public; Owner: keycloak
--

CREATE TABLE public.resource_server_scope (
    id character varying(36) NOT NULL,
    name character varying(255) NOT NULL,
    icon_uri character varying(255),
    resource_server_id character varying(36) NOT NULL,
    display_name character varying(255)
);


ALTER TABLE public.resource_server_scope OWNER TO keycloak;

--
-- Name: resource_uris; Type: TABLE; Schema: public; Owner: keycloak
--

CREATE TABLE public.resource_uris (
    resource_id character varying(36) NOT NULL,
    value character varying(255) NOT NULL
);


ALTER TABLE public.resource_uris OWNER TO keycloak;

--
-- Name: role_attribute; Type: TABLE; Schema: public; Owner: keycloak
--

CREATE TABLE public.role_attribute (
    id character varying(36) NOT NULL,
    role_id character varying(36) NOT NULL,
    name character varying(255) NOT NULL,
    value character varying(255)
);


ALTER TABLE public.role_attribute OWNER TO keycloak;

--
-- Name: scope_mapping; Type: TABLE; Schema: public; Owner: keycloak
--

CREATE TABLE public.scope_mapping (
    client_id character varying(36) NOT NULL,
    role_id character varying(36) NOT NULL
);


ALTER TABLE public.scope_mapping OWNER TO keycloak;

--
-- Name: scope_policy; Type: TABLE; Schema: public; Owner: keycloak
--

CREATE TABLE public.scope_policy (
    scope_id character varying(36) NOT NULL,
    policy_id character varying(36) NOT NULL
);


ALTER TABLE public.scope_policy OWNER TO keycloak;

--
-- Name: user_attribute; Type: TABLE; Schema: public; Owner: keycloak
--

CREATE TABLE public.user_attribute (
    name character varying(255) NOT NULL,
    value character varying(255),
    user_id character varying(36) NOT NULL,
    id character varying(36) DEFAULT 'sybase-needs-something-here'::character varying NOT NULL
);


ALTER TABLE public.user_attribute OWNER TO keycloak;

--
-- Name: user_consent; Type: TABLE; Schema: public; Owner: keycloak
--

CREATE TABLE public.user_consent (
    id character varying(36) NOT NULL,
    client_id character varying(255),
    user_id character varying(36) NOT NULL,
    created_date bigint,
    last_updated_date bigint,
    client_storage_provider character varying(36),
    external_client_id character varying(255)
);


ALTER TABLE public.user_consent OWNER TO keycloak;

--
-- Name: user_consent_client_scope; Type: TABLE; Schema: public; Owner: keycloak
--

CREATE TABLE public.user_consent_client_scope (
    user_consent_id character varying(36) NOT NULL,
    scope_id character varying(36) NOT NULL
);


ALTER TABLE public.user_consent_client_scope OWNER TO keycloak;

--
-- Name: user_entity; Type: TABLE; Schema: public; Owner: keycloak
--

CREATE TABLE public.user_entity (
    id character varying(36) NOT NULL,
    email character varying(255),
    email_constraint character varying(255),
    email_verified boolean DEFAULT false NOT NULL,
    enabled boolean DEFAULT false NOT NULL,
    federation_link character varying(255),
    first_name character varying(255),
    last_name character varying(255),
    realm_id character varying(255),
    username character varying(255),
    created_timestamp bigint,
    service_account_client_link character varying(255),
    not_before integer DEFAULT 0 NOT NULL
);


ALTER TABLE public.user_entity OWNER TO keycloak;

--
-- Name: user_federation_config; Type: TABLE; Schema: public; Owner: keycloak
--

CREATE TABLE public.user_federation_config (
    user_federation_provider_id character varying(36) NOT NULL,
    value character varying(255),
    name character varying(255) NOT NULL
);


ALTER TABLE public.user_federation_config OWNER TO keycloak;

--
-- Name: user_federation_mapper; Type: TABLE; Schema: public; Owner: keycloak
--

CREATE TABLE public.user_federation_mapper (
    id character varying(36) NOT NULL,
    name character varying(255) NOT NULL,
    federation_provider_id character varying(36) NOT NULL,
    federation_mapper_type character varying(255) NOT NULL,
    realm_id character varying(36) NOT NULL
);


ALTER TABLE public.user_federation_mapper OWNER TO keycloak;

--
-- Name: user_federation_mapper_config; Type: TABLE; Schema: public; Owner: keycloak
--

CREATE TABLE public.user_federation_mapper_config (
    user_federation_mapper_id character varying(36) NOT NULL,
    value character varying(255),
    name character varying(255) NOT NULL
);


ALTER TABLE public.user_federation_mapper_config OWNER TO keycloak;

--
-- Name: user_federation_provider; Type: TABLE; Schema: public; Owner: keycloak
--

CREATE TABLE public.user_federation_provider (
    id character varying(36) NOT NULL,
    changed_sync_period integer,
    display_name character varying(255),
    full_sync_period integer,
    last_sync integer,
    priority integer,
    provider_name character varying(255),
    realm_id character varying(36)
);


ALTER TABLE public.user_federation_provider OWNER TO keycloak;

--
-- Name: user_group_membership; Type: TABLE; Schema: public; Owner: keycloak
--

CREATE TABLE public.user_group_membership (
    group_id character varying(36) NOT NULL,
    user_id character varying(36) NOT NULL
);


ALTER TABLE public.user_group_membership OWNER TO keycloak;

--
-- Name: user_required_action; Type: TABLE; Schema: public; Owner: keycloak
--

CREATE TABLE public.user_required_action (
    user_id character varying(36) NOT NULL,
    required_action character varying(255) DEFAULT ' '::character varying NOT NULL
);


ALTER TABLE public.user_required_action OWNER TO keycloak;

--
-- Name: user_role_mapping; Type: TABLE; Schema: public; Owner: keycloak
--

CREATE TABLE public.user_role_mapping (
    role_id character varying(255) NOT NULL,
    user_id character varying(36) NOT NULL
);


ALTER TABLE public.user_role_mapping OWNER TO keycloak;

--
-- Name: user_session; Type: TABLE; Schema: public; Owner: keycloak
--

CREATE TABLE public.user_session (
    id character varying(36) NOT NULL,
    auth_method character varying(255),
    ip_address character varying(255),
    last_session_refresh integer,
    login_username character varying(255),
    realm_id character varying(255),
    remember_me boolean DEFAULT false NOT NULL,
    started integer,
    user_id character varying(255),
    user_session_state integer,
    broker_session_id character varying(255),
    broker_user_id character varying(255)
);


ALTER TABLE public.user_session OWNER TO keycloak;

--
-- Name: user_session_note; Type: TABLE; Schema: public; Owner: keycloak
--

CREATE TABLE public.user_session_note (
    user_session character varying(36) NOT NULL,
    name character varying(255) NOT NULL,
    value character varying(2048)
);


ALTER TABLE public.user_session_note OWNER TO keycloak;

--
-- Name: username_login_failure; Type: TABLE; Schema: public; Owner: keycloak
--

CREATE TABLE public.username_login_failure (
    realm_id character varying(36) NOT NULL,
    username character varying(255) NOT NULL,
    failed_login_not_before integer,
    last_failure bigint,
    last_ip_failure character varying(255),
    num_failures integer
);


ALTER TABLE public.username_login_failure OWNER TO keycloak;

--
-- Name: web_origins; Type: TABLE; Schema: public; Owner: keycloak
--

CREATE TABLE public.web_origins (
    client_id character varying(36) NOT NULL,
    value character varying(255) NOT NULL
);


ALTER TABLE public.web_origins OWNER TO keycloak;

--
-- Data for Name: admin_event_entity; Type: TABLE DATA; Schema: public; Owner: keycloak
--

COPY public.admin_event_entity (id, admin_event_time, realm_id, operation_type, auth_realm_id, auth_client_id, auth_user_id, ip_address, resource_path, representation, error, resource_type) FROM stdin;
\.


--
-- Data for Name: associated_policy; Type: TABLE DATA; Schema: public; Owner: keycloak
--

COPY public.associated_policy (policy_id, associated_policy_id) FROM stdin;
\.


--
-- Data for Name: authentication_execution; Type: TABLE DATA; Schema: public; Owner: keycloak
--

COPY public.authentication_execution (id, alias, authenticator, realm_id, flow_id, requirement, priority, authenticator_flow, auth_flow_id, auth_config) FROM stdin;
92802cb2-f7f5-4c05-bc1b-f385c838e178	\N	auth-cookie	e9abe5f8-460d-41ff-a21e-ada47aba8547	589bec8e-fc7b-48b1-8050-0f4b28d81a5f	2	10	f	\N	\N
d99211c5-fd51-4fcf-896a-27b1eb3c8b3c	\N	auth-spnego	e9abe5f8-460d-41ff-a21e-ada47aba8547	589bec8e-fc7b-48b1-8050-0f4b28d81a5f	3	20	f	\N	\N
ed0309da-6b76-4321-b5a0-3487003229c3	\N	identity-provider-redirector	e9abe5f8-460d-41ff-a21e-ada47aba8547	589bec8e-fc7b-48b1-8050-0f4b28d81a5f	2	25	f	\N	\N
ec7e67e0-c524-4469-84cd-824594991731	\N	\N	e9abe5f8-460d-41ff-a21e-ada47aba8547	589bec8e-fc7b-48b1-8050-0f4b28d81a5f	2	30	t	8742fa4d-9245-4fbc-9721-58e195e4ea98	\N
4a63a14d-3486-4e36-9863-4581127ef8b4	\N	auth-username-password-form	e9abe5f8-460d-41ff-a21e-ada47aba8547	8742fa4d-9245-4fbc-9721-58e195e4ea98	0	10	f	\N	\N
13a8e85a-1a90-488f-a876-6a90773fd4af	\N	\N	e9abe5f8-460d-41ff-a21e-ada47aba8547	8742fa4d-9245-4fbc-9721-58e195e4ea98	1	20	t	1f5d56ec-ff9d-4f0a-8b51-289362184a19	\N
4341f154-17d9-45d3-ba4f-24f0173b4942	\N	conditional-user-configured	e9abe5f8-460d-41ff-a21e-ada47aba8547	1f5d56ec-ff9d-4f0a-8b51-289362184a19	0	10	f	\N	\N
bb15b885-bbbf-466d-9e04-a9a4e4cb061a	\N	auth-otp-form	e9abe5f8-460d-41ff-a21e-ada47aba8547	1f5d56ec-ff9d-4f0a-8b51-289362184a19	0	20	f	\N	\N
522de305-4a44-40d3-9ca3-c2766dec78ed	\N	direct-grant-validate-username	e9abe5f8-460d-41ff-a21e-ada47aba8547	4415131e-d28d-4489-9879-9b38c339ee73	0	10	f	\N	\N
a8bd7d6d-61a5-43d3-adbc-b1cb765be7d6	\N	direct-grant-validate-password	e9abe5f8-460d-41ff-a21e-ada47aba8547	4415131e-d28d-4489-9879-9b38c339ee73	0	20	f	\N	\N
0005d1e0-8e37-44af-8bc8-83ceffabd726	\N	\N	e9abe5f8-460d-41ff-a21e-ada47aba8547	4415131e-d28d-4489-9879-9b38c339ee73	1	30	t	23b013b7-a9a0-4dc2-8bdd-c86c4de89ac5	\N
ac027326-d6e1-4b32-ae8d-a58ef4aebfa9	\N	conditional-user-configured	e9abe5f8-460d-41ff-a21e-ada47aba8547	23b013b7-a9a0-4dc2-8bdd-c86c4de89ac5	0	10	f	\N	\N
ee8ad997-0583-432e-8fd7-990f7739a14e	\N	direct-grant-validate-otp	e9abe5f8-460d-41ff-a21e-ada47aba8547	23b013b7-a9a0-4dc2-8bdd-c86c4de89ac5	0	20	f	\N	\N
33d3a2d3-6956-403f-a5d5-e664458cbd2a	\N	registration-page-form	e9abe5f8-460d-41ff-a21e-ada47aba8547	8a0b3f88-739e-43d3-adb8-04b3469bb774	0	10	t	c2aeb6c8-aba5-4d1d-99cf-d1c16e552ab6	\N
1970ae96-e7f2-4dbc-9217-3fcbb0ba45f1	\N	registration-user-creation	e9abe5f8-460d-41ff-a21e-ada47aba8547	c2aeb6c8-aba5-4d1d-99cf-d1c16e552ab6	0	20	f	\N	\N
ab036150-2f71-48d6-9113-6e0c2b69688d	\N	registration-password-action	e9abe5f8-460d-41ff-a21e-ada47aba8547	c2aeb6c8-aba5-4d1d-99cf-d1c16e552ab6	0	50	f	\N	\N
52b00d6e-16a1-42cd-a094-d07abe078365	\N	registration-recaptcha-action	e9abe5f8-460d-41ff-a21e-ada47aba8547	c2aeb6c8-aba5-4d1d-99cf-d1c16e552ab6	3	60	f	\N	\N
c0c16728-594f-4e4d-8d12-3275ce573c20	\N	registration-terms-and-conditions	e9abe5f8-460d-41ff-a21e-ada47aba8547	c2aeb6c8-aba5-4d1d-99cf-d1c16e552ab6	3	70	f	\N	\N
848c68c7-bd1e-4c25-b498-3f16c42c79c3	\N	reset-credentials-choose-user	e9abe5f8-460d-41ff-a21e-ada47aba8547	58a53ed5-ea37-4835-882e-c1b6b69250c8	0	10	f	\N	\N
66067e2f-8f5f-4fc7-83d2-f87d9d790311	\N	reset-credential-email	e9abe5f8-460d-41ff-a21e-ada47aba8547	58a53ed5-ea37-4835-882e-c1b6b69250c8	0	20	f	\N	\N
bdf59412-6992-4fba-a0d0-b377dfe90b0e	\N	reset-password	e9abe5f8-460d-41ff-a21e-ada47aba8547	58a53ed5-ea37-4835-882e-c1b6b69250c8	0	30	f	\N	\N
b644a57c-6782-4ebd-8599-f9f17c2eb936	\N	\N	e9abe5f8-460d-41ff-a21e-ada47aba8547	58a53ed5-ea37-4835-882e-c1b6b69250c8	1	40	t	edfa46c3-0334-40b7-9a77-5d3a4ce5a561	\N
05e1acd2-d193-4cbe-a583-82c964743b13	\N	conditional-user-configured	e9abe5f8-460d-41ff-a21e-ada47aba8547	edfa46c3-0334-40b7-9a77-5d3a4ce5a561	0	10	f	\N	\N
f5eb9125-2dac-4c12-92a7-a90e12b7d915	\N	reset-otp	e9abe5f8-460d-41ff-a21e-ada47aba8547	edfa46c3-0334-40b7-9a77-5d3a4ce5a561	0	20	f	\N	\N
9098fe3f-0297-4856-b5fb-c6afe9e0b76e	\N	client-secret	e9abe5f8-460d-41ff-a21e-ada47aba8547	3a4c805a-dce6-4f41-99b7-c0533e9d9b02	2	10	f	\N	\N
aa6c8abe-7a07-4a0f-932a-f3a2b41faf47	\N	client-jwt	e9abe5f8-460d-41ff-a21e-ada47aba8547	3a4c805a-dce6-4f41-99b7-c0533e9d9b02	2	20	f	\N	\N
602d3bdf-1642-487e-a660-d5e021aff3de	\N	client-secret-jwt	e9abe5f8-460d-41ff-a21e-ada47aba8547	3a4c805a-dce6-4f41-99b7-c0533e9d9b02	2	30	f	\N	\N
edaed11b-e85e-49a1-aa71-e962eb1bd1bd	\N	client-x509	e9abe5f8-460d-41ff-a21e-ada47aba8547	3a4c805a-dce6-4f41-99b7-c0533e9d9b02	2	40	f	\N	\N
dea42286-e21c-41f3-a43c-1aec9d080728	\N	idp-review-profile	e9abe5f8-460d-41ff-a21e-ada47aba8547	4ff70e00-aa8b-4c32-bf3c-f79d5bdfbda9	0	10	f	\N	1863bc0b-eedd-426c-aa76-1155dd91f998
9273d0b8-61e6-4135-8118-b1d4c425e550	\N	\N	e9abe5f8-460d-41ff-a21e-ada47aba8547	4ff70e00-aa8b-4c32-bf3c-f79d5bdfbda9	0	20	t	d6dd11ba-a7a1-4bbb-8b15-0eaf3192794e	\N
6cfd587b-615e-4e69-ab76-a7fe9564bbda	\N	idp-create-user-if-unique	e9abe5f8-460d-41ff-a21e-ada47aba8547	d6dd11ba-a7a1-4bbb-8b15-0eaf3192794e	2	10	f	\N	588646e5-6c4f-4fbd-a4fe-ff49906790df
414e791f-b0ee-49bd-99b0-feb2bc29b78b	\N	\N	e9abe5f8-460d-41ff-a21e-ada47aba8547	d6dd11ba-a7a1-4bbb-8b15-0eaf3192794e	2	20	t	195e45bb-fb29-4bab-a7ae-f460fb8e2c88	\N
33b328a2-0bb2-40fe-95b0-744dcc299338	\N	idp-confirm-link	e9abe5f8-460d-41ff-a21e-ada47aba8547	195e45bb-fb29-4bab-a7ae-f460fb8e2c88	0	10	f	\N	\N
4a77c34f-08b7-40e1-934a-0abbf9f2ee25	\N	\N	e9abe5f8-460d-41ff-a21e-ada47aba8547	195e45bb-fb29-4bab-a7ae-f460fb8e2c88	0	20	t	9b9615e6-34fc-45f7-abfa-57ce39a030f4	\N
7a8e0a82-ac66-4708-b296-a6646fe48652	\N	idp-email-verification	e9abe5f8-460d-41ff-a21e-ada47aba8547	9b9615e6-34fc-45f7-abfa-57ce39a030f4	2	10	f	\N	\N
026873d6-c17b-439b-906a-e57316492f05	\N	\N	e9abe5f8-460d-41ff-a21e-ada47aba8547	9b9615e6-34fc-45f7-abfa-57ce39a030f4	2	20	t	c49391d5-37e3-4974-9352-b39b0cf9b5e8	\N
0f14bf92-f339-4982-9b32-7be412c3217a	\N	idp-username-password-form	e9abe5f8-460d-41ff-a21e-ada47aba8547	c49391d5-37e3-4974-9352-b39b0cf9b5e8	0	10	f	\N	\N
76a0e5ed-ffba-4b3c-9607-35c4cd023d3a	\N	\N	e9abe5f8-460d-41ff-a21e-ada47aba8547	c49391d5-37e3-4974-9352-b39b0cf9b5e8	1	20	t	b3fa749e-41b6-43ce-b387-e556bd55244f	\N
a912b8d4-6369-4553-8c2d-1dd1d4b8db9f	\N	conditional-user-configured	e9abe5f8-460d-41ff-a21e-ada47aba8547	b3fa749e-41b6-43ce-b387-e556bd55244f	0	10	f	\N	\N
faabf7a0-2fc8-43d5-99fd-1f0b2f6c0e7d	\N	auth-otp-form	e9abe5f8-460d-41ff-a21e-ada47aba8547	b3fa749e-41b6-43ce-b387-e556bd55244f	0	20	f	\N	\N
625d309a-9c60-437c-acd4-8d22f86ec221	\N	http-basic-authenticator	e9abe5f8-460d-41ff-a21e-ada47aba8547	9856bdd9-7400-4bc1-a160-84b5f63431b6	0	10	f	\N	\N
26279582-01a9-486b-9676-f3d7c31e1658	\N	docker-http-basic-authenticator	e9abe5f8-460d-41ff-a21e-ada47aba8547	edc41823-aaf9-440c-a4de-9182d99daf7f	0	10	f	\N	\N
8d66c6a8-6d29-4839-8954-699c609a39ad	\N	auth-cookie	8ba89cf8-e84c-4cca-b865-2802d8b005ca	3f530ff2-6206-4c5f-9624-be228bfd69b6	2	10	f	\N	\N
9b1453ee-8c13-4644-bc63-3e3a0602c925	\N	auth-spnego	8ba89cf8-e84c-4cca-b865-2802d8b005ca	3f530ff2-6206-4c5f-9624-be228bfd69b6	3	20	f	\N	\N
985e8d3a-68be-4f7c-818b-8904ef9f160f	\N	identity-provider-redirector	8ba89cf8-e84c-4cca-b865-2802d8b005ca	3f530ff2-6206-4c5f-9624-be228bfd69b6	2	25	f	\N	\N
239ba6ab-1afb-4980-8f48-e374141a9d14	\N	\N	8ba89cf8-e84c-4cca-b865-2802d8b005ca	3f530ff2-6206-4c5f-9624-be228bfd69b6	2	30	t	002fa7a6-4017-4b48-8ed8-0e60235a34ce	\N
91b25e5f-7df9-4b2c-98e1-07c47db36ce3	\N	auth-username-password-form	8ba89cf8-e84c-4cca-b865-2802d8b005ca	002fa7a6-4017-4b48-8ed8-0e60235a34ce	0	10	f	\N	\N
cd7888bb-4f99-4264-b65b-5c8a25429fc3	\N	\N	8ba89cf8-e84c-4cca-b865-2802d8b005ca	002fa7a6-4017-4b48-8ed8-0e60235a34ce	1	20	t	61cc9fd8-888d-450b-a66c-2839b56691bb	\N
f5b7899c-e20c-47da-8fbf-a226f90cd15e	\N	conditional-user-configured	8ba89cf8-e84c-4cca-b865-2802d8b005ca	61cc9fd8-888d-450b-a66c-2839b56691bb	0	10	f	\N	\N
e464dfcd-f157-4ff6-9da0-fde9b14869d6	\N	auth-otp-form	8ba89cf8-e84c-4cca-b865-2802d8b005ca	61cc9fd8-888d-450b-a66c-2839b56691bb	0	20	f	\N	\N
949ea895-0443-40cb-8e76-6b6b68dabffd	\N	direct-grant-validate-username	8ba89cf8-e84c-4cca-b865-2802d8b005ca	dca06a0b-9e9c-42e1-92cf-c71a66e70239	0	10	f	\N	\N
25e7afd6-4a28-482d-80a4-1bc05f10dba6	\N	direct-grant-validate-password	8ba89cf8-e84c-4cca-b865-2802d8b005ca	dca06a0b-9e9c-42e1-92cf-c71a66e70239	0	20	f	\N	\N
14b19637-1a70-40f0-8aab-138f68e9ef03	\N	\N	8ba89cf8-e84c-4cca-b865-2802d8b005ca	dca06a0b-9e9c-42e1-92cf-c71a66e70239	1	30	t	706f392d-1191-46f0-bec6-bd04395ef629	\N
d8493a54-4860-4cb0-990d-9f4f54b365cd	\N	conditional-user-configured	8ba89cf8-e84c-4cca-b865-2802d8b005ca	706f392d-1191-46f0-bec6-bd04395ef629	0	10	f	\N	\N
8a7c2e39-ce08-4408-96e6-56063f81c7b2	\N	direct-grant-validate-otp	8ba89cf8-e84c-4cca-b865-2802d8b005ca	706f392d-1191-46f0-bec6-bd04395ef629	0	20	f	\N	\N
a6576ba3-910a-43c6-919a-9b89a34c61fb	\N	registration-page-form	8ba89cf8-e84c-4cca-b865-2802d8b005ca	309f193e-90e2-4ea9-a090-7b8eeb95421c	0	10	t	d3f36dbe-7c76-4e3a-976d-c834c474bb4e	\N
35d30cd9-4b34-4df2-909b-08b745b19053	\N	registration-user-creation	8ba89cf8-e84c-4cca-b865-2802d8b005ca	d3f36dbe-7c76-4e3a-976d-c834c474bb4e	0	20	f	\N	\N
d4ffc94a-edcb-499b-88b3-1d1c1004b61e	\N	registration-password-action	8ba89cf8-e84c-4cca-b865-2802d8b005ca	d3f36dbe-7c76-4e3a-976d-c834c474bb4e	0	50	f	\N	\N
5f81b2d6-0e13-42c8-ba48-b29b257f01ea	\N	registration-recaptcha-action	8ba89cf8-e84c-4cca-b865-2802d8b005ca	d3f36dbe-7c76-4e3a-976d-c834c474bb4e	3	60	f	\N	\N
6c96e938-5042-482d-8d14-72563eb72fb8	\N	reset-credentials-choose-user	8ba89cf8-e84c-4cca-b865-2802d8b005ca	c9bba8f8-31c8-419f-a1e6-203eca34e30f	0	10	f	\N	\N
b735b84e-f61d-4536-a94f-c372f419eff8	\N	reset-credential-email	8ba89cf8-e84c-4cca-b865-2802d8b005ca	c9bba8f8-31c8-419f-a1e6-203eca34e30f	0	20	f	\N	\N
9328c8be-7164-4425-9b58-7e7131465e9c	\N	reset-password	8ba89cf8-e84c-4cca-b865-2802d8b005ca	c9bba8f8-31c8-419f-a1e6-203eca34e30f	0	30	f	\N	\N
c209d11a-1397-4b46-aed4-f612366174d3	\N	\N	8ba89cf8-e84c-4cca-b865-2802d8b005ca	c9bba8f8-31c8-419f-a1e6-203eca34e30f	1	40	t	a7db38cc-ca84-431e-be19-b6794f019250	\N
7a880252-ca50-4c47-9988-cda08d7c081c	\N	conditional-user-configured	8ba89cf8-e84c-4cca-b865-2802d8b005ca	a7db38cc-ca84-431e-be19-b6794f019250	0	10	f	\N	\N
3c8b41a3-b49e-480e-ae06-e65c172d5a5b	\N	reset-otp	8ba89cf8-e84c-4cca-b865-2802d8b005ca	a7db38cc-ca84-431e-be19-b6794f019250	0	20	f	\N	\N
f5f88f9c-cd77-45a9-9b6c-57c57a09d389	\N	client-secret	8ba89cf8-e84c-4cca-b865-2802d8b005ca	c6294993-8aaa-426c-bf7a-e610f548f006	2	10	f	\N	\N
7ae4b2ec-6132-469d-9473-f47adf87b704	\N	client-jwt	8ba89cf8-e84c-4cca-b865-2802d8b005ca	c6294993-8aaa-426c-bf7a-e610f548f006	2	20	f	\N	\N
522ca1c6-2b89-4f8f-862e-4415141fd111	\N	client-secret-jwt	8ba89cf8-e84c-4cca-b865-2802d8b005ca	c6294993-8aaa-426c-bf7a-e610f548f006	2	30	f	\N	\N
88cdaacf-84aa-4f21-bb63-8d462b3019d2	\N	client-x509	8ba89cf8-e84c-4cca-b865-2802d8b005ca	c6294993-8aaa-426c-bf7a-e610f548f006	2	40	f	\N	\N
c4f5a1c4-3d06-4eb9-838e-4e70864504b9	\N	idp-review-profile	8ba89cf8-e84c-4cca-b865-2802d8b005ca	8756b217-ca43-43d0-8400-a21e51978235	0	10	f	\N	e02b51d9-d5f9-4a6b-860d-5562dad32a72
dac618e4-b9c9-4670-b2ba-005411cdf259	\N	\N	8ba89cf8-e84c-4cca-b865-2802d8b005ca	8756b217-ca43-43d0-8400-a21e51978235	0	20	t	cfdd6645-c5fb-4397-9d78-9cf5486bda66	\N
7c8e9e51-c2c6-4353-a70a-0af7e6fa69e0	\N	idp-create-user-if-unique	8ba89cf8-e84c-4cca-b865-2802d8b005ca	cfdd6645-c5fb-4397-9d78-9cf5486bda66	2	10	f	\N	4508e094-24eb-4924-b83a-a913aabef9e3
caaaf076-f584-4b99-8b0b-8217c70f6979	\N	\N	8ba89cf8-e84c-4cca-b865-2802d8b005ca	cfdd6645-c5fb-4397-9d78-9cf5486bda66	2	20	t	35720362-a846-418c-aa7f-45a21172e353	\N
594ee4f8-e865-4654-907a-fc8201994082	\N	idp-confirm-link	8ba89cf8-e84c-4cca-b865-2802d8b005ca	35720362-a846-418c-aa7f-45a21172e353	0	10	f	\N	\N
ee465b8d-f764-498c-a95a-4456c039427c	\N	\N	8ba89cf8-e84c-4cca-b865-2802d8b005ca	35720362-a846-418c-aa7f-45a21172e353	0	20	t	31336068-0a2b-432d-a5ab-9ebf4f77363a	\N
3b4418a7-81cd-4bb3-89b9-53e786f1f03b	\N	idp-email-verification	8ba89cf8-e84c-4cca-b865-2802d8b005ca	31336068-0a2b-432d-a5ab-9ebf4f77363a	2	10	f	\N	\N
d98860f0-a4ed-4b8f-9416-bb0f2832edf8	\N	\N	8ba89cf8-e84c-4cca-b865-2802d8b005ca	31336068-0a2b-432d-a5ab-9ebf4f77363a	2	20	t	3542200f-de61-4b8d-8404-53a8a40b00ac	\N
5f129c3d-3d3b-469d-875d-127fbf1b9da2	\N	idp-username-password-form	8ba89cf8-e84c-4cca-b865-2802d8b005ca	3542200f-de61-4b8d-8404-53a8a40b00ac	0	10	f	\N	\N
07d115e1-d558-4dba-a801-3497901d5d43	\N	\N	8ba89cf8-e84c-4cca-b865-2802d8b005ca	3542200f-de61-4b8d-8404-53a8a40b00ac	1	20	t	2f450f16-f17e-42d5-9209-dfd9875058d6	\N
fe9375f7-61da-43e0-911b-cfccd236db7e	\N	conditional-user-configured	8ba89cf8-e84c-4cca-b865-2802d8b005ca	2f450f16-f17e-42d5-9209-dfd9875058d6	0	10	f	\N	\N
9b71155e-d915-407e-be99-ef5dd25f6bab	\N	auth-otp-form	8ba89cf8-e84c-4cca-b865-2802d8b005ca	2f450f16-f17e-42d5-9209-dfd9875058d6	0	20	f	\N	\N
93b6c640-131a-4c13-a687-e8de9ed9e38d	\N	http-basic-authenticator	8ba89cf8-e84c-4cca-b865-2802d8b005ca	63d3e341-2cd4-4450-9677-ad895a7bed16	0	10	f	\N	\N
6559a255-2200-410e-bc0d-656dde9aacca	\N	docker-http-basic-authenticator	8ba89cf8-e84c-4cca-b865-2802d8b005ca	d615921b-b80e-42fd-9f25-b52faed09c14	0	10	f	\N	\N
\.


--
-- Data for Name: authentication_flow; Type: TABLE DATA; Schema: public; Owner: keycloak
--

COPY public.authentication_flow (id, alias, description, realm_id, provider_id, top_level, built_in) FROM stdin;
589bec8e-fc7b-48b1-8050-0f4b28d81a5f	browser	browser based authentication	e9abe5f8-460d-41ff-a21e-ada47aba8547	basic-flow	t	t
8742fa4d-9245-4fbc-9721-58e195e4ea98	forms	Username, password, otp and other auth forms.	e9abe5f8-460d-41ff-a21e-ada47aba8547	basic-flow	f	t
1f5d56ec-ff9d-4f0a-8b51-289362184a19	Browser - Conditional OTP	Flow to determine if the OTP is required for the authentication	e9abe5f8-460d-41ff-a21e-ada47aba8547	basic-flow	f	t
4415131e-d28d-4489-9879-9b38c339ee73	direct grant	OpenID Connect Resource Owner Grant	e9abe5f8-460d-41ff-a21e-ada47aba8547	basic-flow	t	t
23b013b7-a9a0-4dc2-8bdd-c86c4de89ac5	Direct Grant - Conditional OTP	Flow to determine if the OTP is required for the authentication	e9abe5f8-460d-41ff-a21e-ada47aba8547	basic-flow	f	t
8a0b3f88-739e-43d3-adb8-04b3469bb774	registration	registration flow	e9abe5f8-460d-41ff-a21e-ada47aba8547	basic-flow	t	t
c2aeb6c8-aba5-4d1d-99cf-d1c16e552ab6	registration form	registration form	e9abe5f8-460d-41ff-a21e-ada47aba8547	form-flow	f	t
58a53ed5-ea37-4835-882e-c1b6b69250c8	reset credentials	Reset credentials for a user if they forgot their password or something	e9abe5f8-460d-41ff-a21e-ada47aba8547	basic-flow	t	t
edfa46c3-0334-40b7-9a77-5d3a4ce5a561	Reset - Conditional OTP	Flow to determine if the OTP should be reset or not. Set to REQUIRED to force.	e9abe5f8-460d-41ff-a21e-ada47aba8547	basic-flow	f	t
3a4c805a-dce6-4f41-99b7-c0533e9d9b02	clients	Base authentication for clients	e9abe5f8-460d-41ff-a21e-ada47aba8547	client-flow	t	t
4ff70e00-aa8b-4c32-bf3c-f79d5bdfbda9	first broker login	Actions taken after first broker login with identity provider account, which is not yet linked to any Keycloak account	e9abe5f8-460d-41ff-a21e-ada47aba8547	basic-flow	t	t
d6dd11ba-a7a1-4bbb-8b15-0eaf3192794e	User creation or linking	Flow for the existing/non-existing user alternatives	e9abe5f8-460d-41ff-a21e-ada47aba8547	basic-flow	f	t
195e45bb-fb29-4bab-a7ae-f460fb8e2c88	Handle Existing Account	Handle what to do if there is existing account with same email/username like authenticated identity provider	e9abe5f8-460d-41ff-a21e-ada47aba8547	basic-flow	f	t
9b9615e6-34fc-45f7-abfa-57ce39a030f4	Account verification options	Method with which to verity the existing account	e9abe5f8-460d-41ff-a21e-ada47aba8547	basic-flow	f	t
c49391d5-37e3-4974-9352-b39b0cf9b5e8	Verify Existing Account by Re-authentication	Reauthentication of existing account	e9abe5f8-460d-41ff-a21e-ada47aba8547	basic-flow	f	t
b3fa749e-41b6-43ce-b387-e556bd55244f	First broker login - Conditional OTP	Flow to determine if the OTP is required for the authentication	e9abe5f8-460d-41ff-a21e-ada47aba8547	basic-flow	f	t
9856bdd9-7400-4bc1-a160-84b5f63431b6	saml ecp	SAML ECP Profile Authentication Flow	e9abe5f8-460d-41ff-a21e-ada47aba8547	basic-flow	t	t
edc41823-aaf9-440c-a4de-9182d99daf7f	docker auth	Used by Docker clients to authenticate against the IDP	e9abe5f8-460d-41ff-a21e-ada47aba8547	basic-flow	t	t
3f530ff2-6206-4c5f-9624-be228bfd69b6	browser	browser based authentication	8ba89cf8-e84c-4cca-b865-2802d8b005ca	basic-flow	t	t
002fa7a6-4017-4b48-8ed8-0e60235a34ce	forms	Username, password, otp and other auth forms.	8ba89cf8-e84c-4cca-b865-2802d8b005ca	basic-flow	f	t
61cc9fd8-888d-450b-a66c-2839b56691bb	Browser - Conditional OTP	Flow to determine if the OTP is required for the authentication	8ba89cf8-e84c-4cca-b865-2802d8b005ca	basic-flow	f	t
dca06a0b-9e9c-42e1-92cf-c71a66e70239	direct grant	OpenID Connect Resource Owner Grant	8ba89cf8-e84c-4cca-b865-2802d8b005ca	basic-flow	t	t
706f392d-1191-46f0-bec6-bd04395ef629	Direct Grant - Conditional OTP	Flow to determine if the OTP is required for the authentication	8ba89cf8-e84c-4cca-b865-2802d8b005ca	basic-flow	f	t
309f193e-90e2-4ea9-a090-7b8eeb95421c	registration	registration flow	8ba89cf8-e84c-4cca-b865-2802d8b005ca	basic-flow	t	t
d3f36dbe-7c76-4e3a-976d-c834c474bb4e	registration form	registration form	8ba89cf8-e84c-4cca-b865-2802d8b005ca	form-flow	f	t
c9bba8f8-31c8-419f-a1e6-203eca34e30f	reset credentials	Reset credentials for a user if they forgot their password or something	8ba89cf8-e84c-4cca-b865-2802d8b005ca	basic-flow	t	t
a7db38cc-ca84-431e-be19-b6794f019250	Reset - Conditional OTP	Flow to determine if the OTP should be reset or not. Set to REQUIRED to force.	8ba89cf8-e84c-4cca-b865-2802d8b005ca	basic-flow	f	t
c6294993-8aaa-426c-bf7a-e610f548f006	clients	Base authentication for clients	8ba89cf8-e84c-4cca-b865-2802d8b005ca	client-flow	t	t
8756b217-ca43-43d0-8400-a21e51978235	first broker login	Actions taken after first broker login with identity provider account, which is not yet linked to any Keycloak account	8ba89cf8-e84c-4cca-b865-2802d8b005ca	basic-flow	t	t
cfdd6645-c5fb-4397-9d78-9cf5486bda66	User creation or linking	Flow for the existing/non-existing user alternatives	8ba89cf8-e84c-4cca-b865-2802d8b005ca	basic-flow	f	t
35720362-a846-418c-aa7f-45a21172e353	Handle Existing Account	Handle what to do if there is existing account with same email/username like authenticated identity provider	8ba89cf8-e84c-4cca-b865-2802d8b005ca	basic-flow	f	t
31336068-0a2b-432d-a5ab-9ebf4f77363a	Account verification options	Method with which to verity the existing account	8ba89cf8-e84c-4cca-b865-2802d8b005ca	basic-flow	f	t
3542200f-de61-4b8d-8404-53a8a40b00ac	Verify Existing Account by Re-authentication	Reauthentication of existing account	8ba89cf8-e84c-4cca-b865-2802d8b005ca	basic-flow	f	t
2f450f16-f17e-42d5-9209-dfd9875058d6	First broker login - Conditional OTP	Flow to determine if the OTP is required for the authentication	8ba89cf8-e84c-4cca-b865-2802d8b005ca	basic-flow	f	t
63d3e341-2cd4-4450-9677-ad895a7bed16	saml ecp	SAML ECP Profile Authentication Flow	8ba89cf8-e84c-4cca-b865-2802d8b005ca	basic-flow	t	t
d615921b-b80e-42fd-9f25-b52faed09c14	docker auth	Used by Docker clients to authenticate against the IDP	8ba89cf8-e84c-4cca-b865-2802d8b005ca	basic-flow	t	t
\.


--
-- Data for Name: authenticator_config; Type: TABLE DATA; Schema: public; Owner: keycloak
--

COPY public.authenticator_config (id, alias, realm_id) FROM stdin;
1863bc0b-eedd-426c-aa76-1155dd91f998	review profile config	e9abe5f8-460d-41ff-a21e-ada47aba8547
588646e5-6c4f-4fbd-a4fe-ff49906790df	create unique user config	e9abe5f8-460d-41ff-a21e-ada47aba8547
e02b51d9-d5f9-4a6b-860d-5562dad32a72	review profile config	8ba89cf8-e84c-4cca-b865-2802d8b005ca
4508e094-24eb-4924-b83a-a913aabef9e3	create unique user config	8ba89cf8-e84c-4cca-b865-2802d8b005ca
\.


--
-- Data for Name: authenticator_config_entry; Type: TABLE DATA; Schema: public; Owner: keycloak
--

COPY public.authenticator_config_entry (authenticator_id, value, name) FROM stdin;
1863bc0b-eedd-426c-aa76-1155dd91f998	missing	update.profile.on.first.login
588646e5-6c4f-4fbd-a4fe-ff49906790df	false	require.password.update.after.registration
4508e094-24eb-4924-b83a-a913aabef9e3	false	require.password.update.after.registration
e02b51d9-d5f9-4a6b-860d-5562dad32a72	missing	update.profile.on.first.login
\.


--
-- Data for Name: broker_link; Type: TABLE DATA; Schema: public; Owner: keycloak
--

COPY public.broker_link (identity_provider, storage_provider_id, realm_id, broker_user_id, broker_username, token, user_id) FROM stdin;
\.


--
-- Data for Name: client; Type: TABLE DATA; Schema: public; Owner: keycloak
--

COPY public.client (id, enabled, full_scope_allowed, client_id, not_before, public_client, secret, base_url, bearer_only, management_url, surrogate_auth_required, realm_id, protocol, node_rereg_timeout, frontchannel_logout, consent_required, name, service_accounts_enabled, client_authenticator_type, root_url, description, registration_token, standard_flow_enabled, implicit_flow_enabled, direct_access_grants_enabled, always_display_in_console) FROM stdin;
49c6ffbf-1b8b-4a50-9d56-cb24f14c7764	t	f	master-realm	0	f	\N	\N	t	\N	f	e9abe5f8-460d-41ff-a21e-ada47aba8547	\N	0	f	f	master Realm	f	client-secret	\N	\N	\N	t	f	f	f
65ae636c-d85e-4b1b-9b7f-3cce1fcc3372	t	f	account	0	t	\N	/realms/master/account/	f	\N	f	e9abe5f8-460d-41ff-a21e-ada47aba8547	openid-connect	0	f	f	${client_account}	f	client-secret	${authBaseUrl}	\N	\N	t	f	f	f
00a76cf0-1fb3-498b-8d01-0aa773f28db1	t	f	account-console	0	t	\N	/realms/master/account/	f	\N	f	e9abe5f8-460d-41ff-a21e-ada47aba8547	openid-connect	0	f	f	${client_account-console}	f	client-secret	${authBaseUrl}	\N	\N	t	f	f	f
14d22350-9a35-455b-8f76-0c35e8916cab	t	f	broker	0	f	\N	\N	t	\N	f	e9abe5f8-460d-41ff-a21e-ada47aba8547	openid-connect	0	f	f	${client_broker}	f	client-secret	\N	\N	\N	t	f	f	f
fea8af4b-842d-4ecf-b54f-97acfa55708e	t	f	security-admin-console	0	t	\N	/admin/master/console/	f	\N	f	e9abe5f8-460d-41ff-a21e-ada47aba8547	openid-connect	0	f	f	${client_security-admin-console}	f	client-secret	${authAdminUrl}	\N	\N	t	f	f	f
5d46b1d8-3360-4e19-8c0b-3be0b8e86a66	t	f	admin-cli	0	t	\N	\N	f	\N	f	e9abe5f8-460d-41ff-a21e-ada47aba8547	openid-connect	0	f	f	${client_admin-cli}	f	client-secret	\N	\N	\N	f	f	t	f
e4739f42-b559-4aa1-bd67-667487da932b	t	f	demo-realm	0	f	\N	\N	t	\N	f	e9abe5f8-460d-41ff-a21e-ada47aba8547	\N	0	f	f	demo Realm	f	client-secret	\N	\N	\N	t	f	f	f
55b6b6c9-aa79-495a-987e-ea7ad4e555af	t	f	realm-management	0	f	\N	\N	t	\N	f	8ba89cf8-e84c-4cca-b865-2802d8b005ca	openid-connect	0	f	f	${client_realm-management}	f	client-secret	\N	\N	\N	t	f	f	f
094f2c33-6332-4c44-a019-4bce38b81868	t	f	account	0	t	\N	/realms/demo/account/	f	\N	f	8ba89cf8-e84c-4cca-b865-2802d8b005ca	openid-connect	0	f	f	${client_account}	f	client-secret	${authBaseUrl}	\N	\N	t	f	f	f
35aaeedb-7200-42ee-b867-ea4fa6dbb0fb	t	f	account-console	0	t	\N	/realms/demo/account/	f	\N	f	8ba89cf8-e84c-4cca-b865-2802d8b005ca	openid-connect	0	f	f	${client_account-console}	f	client-secret	${authBaseUrl}	\N	\N	t	f	f	f
e3a31513-08e0-41eb-9d34-32a5adb704d1	t	f	broker	0	f	\N	\N	t	\N	f	8ba89cf8-e84c-4cca-b865-2802d8b005ca	openid-connect	0	f	f	${client_broker}	f	client-secret	\N	\N	\N	t	f	f	f
25052911-8e99-40e5-ba66-36f49639c56d	t	f	security-admin-console	0	t	\N	/admin/demo/console/	f	\N	f	8ba89cf8-e84c-4cca-b865-2802d8b005ca	openid-connect	0	f	f	${client_security-admin-console}	f	client-secret	${authAdminUrl}	\N	\N	t	f	f	f
f6ddf5f8-d488-4661-b4ea-6096bcd531fe	t	f	admin-cli	0	t	\N	\N	f	\N	f	8ba89cf8-e84c-4cca-b865-2802d8b005ca	openid-connect	0	f	f	${client_admin-cli}	f	client-secret	\N	\N	\N	f	f	t	f
fe9d9161-94f7-4d95-9203-a5c8df6003af	t	t	nextjs-demo	0	f	1CWGvAY8XpBo06ooT5Y73W4tvQMmBFDh	http://localhost:3000	f	http://localhost:3000	f	8ba89cf8-e84c-4cca-b865-2802d8b005ca	openid-connect	-1	t	f	NextJS Demo	t	client-secret	http://localhost:3000		\N	t	f	t	f
\.


--
-- Data for Name: client_attributes; Type: TABLE DATA; Schema: public; Owner: keycloak
--

COPY public.client_attributes (client_id, name, value) FROM stdin;
65ae636c-d85e-4b1b-9b7f-3cce1fcc3372	post.logout.redirect.uris	+
00a76cf0-1fb3-498b-8d01-0aa773f28db1	post.logout.redirect.uris	+
00a76cf0-1fb3-498b-8d01-0aa773f28db1	pkce.code.challenge.method	S256
fea8af4b-842d-4ecf-b54f-97acfa55708e	post.logout.redirect.uris	+
fea8af4b-842d-4ecf-b54f-97acfa55708e	pkce.code.challenge.method	S256
094f2c33-6332-4c44-a019-4bce38b81868	post.logout.redirect.uris	+
35aaeedb-7200-42ee-b867-ea4fa6dbb0fb	post.logout.redirect.uris	+
35aaeedb-7200-42ee-b867-ea4fa6dbb0fb	pkce.code.challenge.method	S256
25052911-8e99-40e5-ba66-36f49639c56d	post.logout.redirect.uris	+
25052911-8e99-40e5-ba66-36f49639c56d	pkce.code.challenge.method	S256
fe9d9161-94f7-4d95-9203-a5c8df6003af	client.secret.creation.time	1704444772
fe9d9161-94f7-4d95-9203-a5c8df6003af	oauth2.device.authorization.grant.enabled	false
fe9d9161-94f7-4d95-9203-a5c8df6003af	oidc.ciba.grant.enabled	false
fe9d9161-94f7-4d95-9203-a5c8df6003af	backchannel.logout.session.required	true
fe9d9161-94f7-4d95-9203-a5c8df6003af	backchannel.logout.revoke.offline.tokens	false
fe9d9161-94f7-4d95-9203-a5c8df6003af	display.on.consent.screen	false
\.


--
-- Data for Name: client_auth_flow_bindings; Type: TABLE DATA; Schema: public; Owner: keycloak
--

COPY public.client_auth_flow_bindings (client_id, flow_id, binding_name) FROM stdin;
\.


--
-- Data for Name: client_initial_access; Type: TABLE DATA; Schema: public; Owner: keycloak
--

COPY public.client_initial_access (id, realm_id, "timestamp", expiration, count, remaining_count) FROM stdin;
\.


--
-- Data for Name: client_node_registrations; Type: TABLE DATA; Schema: public; Owner: keycloak
--

COPY public.client_node_registrations (client_id, value, name) FROM stdin;
\.


--
-- Data for Name: client_scope; Type: TABLE DATA; Schema: public; Owner: keycloak
--

COPY public.client_scope (id, name, realm_id, description, protocol) FROM stdin;
b27475e7-bc97-4aaa-986d-fac2200372af	offline_access	e9abe5f8-460d-41ff-a21e-ada47aba8547	OpenID Connect built-in scope: offline_access	openid-connect
ff7c30aa-546f-4612-b991-80ebf2f55ca9	role_list	e9abe5f8-460d-41ff-a21e-ada47aba8547	SAML role list	saml
32386eee-7165-46c5-b136-92b0c042c694	profile	e9abe5f8-460d-41ff-a21e-ada47aba8547	OpenID Connect built-in scope: profile	openid-connect
c7a7e7e2-ab91-4a83-bd60-c00c17b53a46	email	e9abe5f8-460d-41ff-a21e-ada47aba8547	OpenID Connect built-in scope: email	openid-connect
c6307d2f-4a15-4630-8d8f-638088435cac	address	e9abe5f8-460d-41ff-a21e-ada47aba8547	OpenID Connect built-in scope: address	openid-connect
95f43eac-8ecf-44e3-92dd-75f1941e132f	phone	e9abe5f8-460d-41ff-a21e-ada47aba8547	OpenID Connect built-in scope: phone	openid-connect
8771c695-3f76-4e73-a6af-2e2ea861384c	roles	e9abe5f8-460d-41ff-a21e-ada47aba8547	OpenID Connect scope for add user roles to the access token	openid-connect
97c4ec94-4f7c-4bfc-bc5c-d3b7e32bf5df	web-origins	e9abe5f8-460d-41ff-a21e-ada47aba8547	OpenID Connect scope for add allowed web origins to the access token	openid-connect
f714f310-507b-44a3-8f8d-8851b53dbddb	microprofile-jwt	e9abe5f8-460d-41ff-a21e-ada47aba8547	Microprofile - JWT built-in scope	openid-connect
5f2e54f5-e7ab-4db7-8207-13e79d067d59	acr	e9abe5f8-460d-41ff-a21e-ada47aba8547	OpenID Connect scope for add acr (authentication context class reference) to the token	openid-connect
d5e376af-2796-4d01-b231-276cfd97fa55	offline_access	8ba89cf8-e84c-4cca-b865-2802d8b005ca	OpenID Connect built-in scope: offline_access	openid-connect
0b96651f-8dc8-4237-9f82-373fb09cdb09	role_list	8ba89cf8-e84c-4cca-b865-2802d8b005ca	SAML role list	saml
4c065ba4-a674-438b-98bd-7f70c56fbad9	profile	8ba89cf8-e84c-4cca-b865-2802d8b005ca	OpenID Connect built-in scope: profile	openid-connect
9d5da259-7833-4638-84d8-86c0bfb66c0d	email	8ba89cf8-e84c-4cca-b865-2802d8b005ca	OpenID Connect built-in scope: email	openid-connect
d0e805c6-1ff4-436d-9232-d62815f93f3d	address	8ba89cf8-e84c-4cca-b865-2802d8b005ca	OpenID Connect built-in scope: address	openid-connect
bb8517ac-ab0d-4649-ae68-8a1868a1088c	phone	8ba89cf8-e84c-4cca-b865-2802d8b005ca	OpenID Connect built-in scope: phone	openid-connect
4cbae6de-22b0-466b-af25-812a8258aee6	roles	8ba89cf8-e84c-4cca-b865-2802d8b005ca	OpenID Connect scope for add user roles to the access token	openid-connect
ab0c4e03-f2a1-4989-80c8-29b3018ad9e9	web-origins	8ba89cf8-e84c-4cca-b865-2802d8b005ca	OpenID Connect scope for add allowed web origins to the access token	openid-connect
aaa15b45-2eae-4a31-83e0-f843c1d40f2a	microprofile-jwt	8ba89cf8-e84c-4cca-b865-2802d8b005ca	Microprofile - JWT built-in scope	openid-connect
d9502030-29c4-480e-9ec2-6c89f903c656	acr	8ba89cf8-e84c-4cca-b865-2802d8b005ca	OpenID Connect scope for add acr (authentication context class reference) to the token	openid-connect
\.


--
-- Data for Name: client_scope_attributes; Type: TABLE DATA; Schema: public; Owner: keycloak
--

COPY public.client_scope_attributes (scope_id, value, name) FROM stdin;
b27475e7-bc97-4aaa-986d-fac2200372af	true	display.on.consent.screen
b27475e7-bc97-4aaa-986d-fac2200372af	${offlineAccessScopeConsentText}	consent.screen.text
ff7c30aa-546f-4612-b991-80ebf2f55ca9	true	display.on.consent.screen
ff7c30aa-546f-4612-b991-80ebf2f55ca9	${samlRoleListScopeConsentText}	consent.screen.text
32386eee-7165-46c5-b136-92b0c042c694	true	display.on.consent.screen
32386eee-7165-46c5-b136-92b0c042c694	${profileScopeConsentText}	consent.screen.text
32386eee-7165-46c5-b136-92b0c042c694	true	include.in.token.scope
c7a7e7e2-ab91-4a83-bd60-c00c17b53a46	true	display.on.consent.screen
c7a7e7e2-ab91-4a83-bd60-c00c17b53a46	${emailScopeConsentText}	consent.screen.text
c7a7e7e2-ab91-4a83-bd60-c00c17b53a46	true	include.in.token.scope
c6307d2f-4a15-4630-8d8f-638088435cac	true	display.on.consent.screen
c6307d2f-4a15-4630-8d8f-638088435cac	${addressScopeConsentText}	consent.screen.text
c6307d2f-4a15-4630-8d8f-638088435cac	true	include.in.token.scope
95f43eac-8ecf-44e3-92dd-75f1941e132f	true	display.on.consent.screen
95f43eac-8ecf-44e3-92dd-75f1941e132f	${phoneScopeConsentText}	consent.screen.text
95f43eac-8ecf-44e3-92dd-75f1941e132f	true	include.in.token.scope
8771c695-3f76-4e73-a6af-2e2ea861384c	true	display.on.consent.screen
8771c695-3f76-4e73-a6af-2e2ea861384c	${rolesScopeConsentText}	consent.screen.text
8771c695-3f76-4e73-a6af-2e2ea861384c	false	include.in.token.scope
97c4ec94-4f7c-4bfc-bc5c-d3b7e32bf5df	false	display.on.consent.screen
97c4ec94-4f7c-4bfc-bc5c-d3b7e32bf5df		consent.screen.text
97c4ec94-4f7c-4bfc-bc5c-d3b7e32bf5df	false	include.in.token.scope
f714f310-507b-44a3-8f8d-8851b53dbddb	false	display.on.consent.screen
f714f310-507b-44a3-8f8d-8851b53dbddb	true	include.in.token.scope
5f2e54f5-e7ab-4db7-8207-13e79d067d59	false	display.on.consent.screen
5f2e54f5-e7ab-4db7-8207-13e79d067d59	false	include.in.token.scope
d5e376af-2796-4d01-b231-276cfd97fa55	true	display.on.consent.screen
d5e376af-2796-4d01-b231-276cfd97fa55	${offlineAccessScopeConsentText}	consent.screen.text
0b96651f-8dc8-4237-9f82-373fb09cdb09	true	display.on.consent.screen
0b96651f-8dc8-4237-9f82-373fb09cdb09	${samlRoleListScopeConsentText}	consent.screen.text
4c065ba4-a674-438b-98bd-7f70c56fbad9	true	display.on.consent.screen
4c065ba4-a674-438b-98bd-7f70c56fbad9	${profileScopeConsentText}	consent.screen.text
4c065ba4-a674-438b-98bd-7f70c56fbad9	true	include.in.token.scope
9d5da259-7833-4638-84d8-86c0bfb66c0d	true	display.on.consent.screen
9d5da259-7833-4638-84d8-86c0bfb66c0d	${emailScopeConsentText}	consent.screen.text
9d5da259-7833-4638-84d8-86c0bfb66c0d	true	include.in.token.scope
d0e805c6-1ff4-436d-9232-d62815f93f3d	true	display.on.consent.screen
d0e805c6-1ff4-436d-9232-d62815f93f3d	${addressScopeConsentText}	consent.screen.text
d0e805c6-1ff4-436d-9232-d62815f93f3d	true	include.in.token.scope
bb8517ac-ab0d-4649-ae68-8a1868a1088c	true	display.on.consent.screen
bb8517ac-ab0d-4649-ae68-8a1868a1088c	${phoneScopeConsentText}	consent.screen.text
bb8517ac-ab0d-4649-ae68-8a1868a1088c	true	include.in.token.scope
4cbae6de-22b0-466b-af25-812a8258aee6	true	display.on.consent.screen
4cbae6de-22b0-466b-af25-812a8258aee6	${rolesScopeConsentText}	consent.screen.text
4cbae6de-22b0-466b-af25-812a8258aee6	false	include.in.token.scope
ab0c4e03-f2a1-4989-80c8-29b3018ad9e9	false	display.on.consent.screen
ab0c4e03-f2a1-4989-80c8-29b3018ad9e9		consent.screen.text
ab0c4e03-f2a1-4989-80c8-29b3018ad9e9	false	include.in.token.scope
aaa15b45-2eae-4a31-83e0-f843c1d40f2a	false	display.on.consent.screen
aaa15b45-2eae-4a31-83e0-f843c1d40f2a	true	include.in.token.scope
d9502030-29c4-480e-9ec2-6c89f903c656	false	display.on.consent.screen
d9502030-29c4-480e-9ec2-6c89f903c656	false	include.in.token.scope
\.


--
-- Data for Name: client_scope_client; Type: TABLE DATA; Schema: public; Owner: keycloak
--

COPY public.client_scope_client (client_id, scope_id, default_scope) FROM stdin;
65ae636c-d85e-4b1b-9b7f-3cce1fcc3372	5f2e54f5-e7ab-4db7-8207-13e79d067d59	t
65ae636c-d85e-4b1b-9b7f-3cce1fcc3372	c7a7e7e2-ab91-4a83-bd60-c00c17b53a46	t
65ae636c-d85e-4b1b-9b7f-3cce1fcc3372	32386eee-7165-46c5-b136-92b0c042c694	t
65ae636c-d85e-4b1b-9b7f-3cce1fcc3372	97c4ec94-4f7c-4bfc-bc5c-d3b7e32bf5df	t
65ae636c-d85e-4b1b-9b7f-3cce1fcc3372	8771c695-3f76-4e73-a6af-2e2ea861384c	t
65ae636c-d85e-4b1b-9b7f-3cce1fcc3372	95f43eac-8ecf-44e3-92dd-75f1941e132f	f
65ae636c-d85e-4b1b-9b7f-3cce1fcc3372	c6307d2f-4a15-4630-8d8f-638088435cac	f
65ae636c-d85e-4b1b-9b7f-3cce1fcc3372	f714f310-507b-44a3-8f8d-8851b53dbddb	f
65ae636c-d85e-4b1b-9b7f-3cce1fcc3372	b27475e7-bc97-4aaa-986d-fac2200372af	f
00a76cf0-1fb3-498b-8d01-0aa773f28db1	5f2e54f5-e7ab-4db7-8207-13e79d067d59	t
00a76cf0-1fb3-498b-8d01-0aa773f28db1	c7a7e7e2-ab91-4a83-bd60-c00c17b53a46	t
00a76cf0-1fb3-498b-8d01-0aa773f28db1	32386eee-7165-46c5-b136-92b0c042c694	t
00a76cf0-1fb3-498b-8d01-0aa773f28db1	97c4ec94-4f7c-4bfc-bc5c-d3b7e32bf5df	t
00a76cf0-1fb3-498b-8d01-0aa773f28db1	8771c695-3f76-4e73-a6af-2e2ea861384c	t
00a76cf0-1fb3-498b-8d01-0aa773f28db1	95f43eac-8ecf-44e3-92dd-75f1941e132f	f
00a76cf0-1fb3-498b-8d01-0aa773f28db1	c6307d2f-4a15-4630-8d8f-638088435cac	f
00a76cf0-1fb3-498b-8d01-0aa773f28db1	f714f310-507b-44a3-8f8d-8851b53dbddb	f
00a76cf0-1fb3-498b-8d01-0aa773f28db1	b27475e7-bc97-4aaa-986d-fac2200372af	f
5d46b1d8-3360-4e19-8c0b-3be0b8e86a66	5f2e54f5-e7ab-4db7-8207-13e79d067d59	t
5d46b1d8-3360-4e19-8c0b-3be0b8e86a66	c7a7e7e2-ab91-4a83-bd60-c00c17b53a46	t
5d46b1d8-3360-4e19-8c0b-3be0b8e86a66	32386eee-7165-46c5-b136-92b0c042c694	t
5d46b1d8-3360-4e19-8c0b-3be0b8e86a66	97c4ec94-4f7c-4bfc-bc5c-d3b7e32bf5df	t
5d46b1d8-3360-4e19-8c0b-3be0b8e86a66	8771c695-3f76-4e73-a6af-2e2ea861384c	t
5d46b1d8-3360-4e19-8c0b-3be0b8e86a66	95f43eac-8ecf-44e3-92dd-75f1941e132f	f
5d46b1d8-3360-4e19-8c0b-3be0b8e86a66	c6307d2f-4a15-4630-8d8f-638088435cac	f
5d46b1d8-3360-4e19-8c0b-3be0b8e86a66	f714f310-507b-44a3-8f8d-8851b53dbddb	f
5d46b1d8-3360-4e19-8c0b-3be0b8e86a66	b27475e7-bc97-4aaa-986d-fac2200372af	f
14d22350-9a35-455b-8f76-0c35e8916cab	5f2e54f5-e7ab-4db7-8207-13e79d067d59	t
14d22350-9a35-455b-8f76-0c35e8916cab	c7a7e7e2-ab91-4a83-bd60-c00c17b53a46	t
14d22350-9a35-455b-8f76-0c35e8916cab	32386eee-7165-46c5-b136-92b0c042c694	t
14d22350-9a35-455b-8f76-0c35e8916cab	97c4ec94-4f7c-4bfc-bc5c-d3b7e32bf5df	t
14d22350-9a35-455b-8f76-0c35e8916cab	8771c695-3f76-4e73-a6af-2e2ea861384c	t
14d22350-9a35-455b-8f76-0c35e8916cab	95f43eac-8ecf-44e3-92dd-75f1941e132f	f
14d22350-9a35-455b-8f76-0c35e8916cab	c6307d2f-4a15-4630-8d8f-638088435cac	f
14d22350-9a35-455b-8f76-0c35e8916cab	f714f310-507b-44a3-8f8d-8851b53dbddb	f
14d22350-9a35-455b-8f76-0c35e8916cab	b27475e7-bc97-4aaa-986d-fac2200372af	f
49c6ffbf-1b8b-4a50-9d56-cb24f14c7764	5f2e54f5-e7ab-4db7-8207-13e79d067d59	t
49c6ffbf-1b8b-4a50-9d56-cb24f14c7764	c7a7e7e2-ab91-4a83-bd60-c00c17b53a46	t
49c6ffbf-1b8b-4a50-9d56-cb24f14c7764	32386eee-7165-46c5-b136-92b0c042c694	t
49c6ffbf-1b8b-4a50-9d56-cb24f14c7764	97c4ec94-4f7c-4bfc-bc5c-d3b7e32bf5df	t
49c6ffbf-1b8b-4a50-9d56-cb24f14c7764	8771c695-3f76-4e73-a6af-2e2ea861384c	t
49c6ffbf-1b8b-4a50-9d56-cb24f14c7764	95f43eac-8ecf-44e3-92dd-75f1941e132f	f
49c6ffbf-1b8b-4a50-9d56-cb24f14c7764	c6307d2f-4a15-4630-8d8f-638088435cac	f
49c6ffbf-1b8b-4a50-9d56-cb24f14c7764	f714f310-507b-44a3-8f8d-8851b53dbddb	f
49c6ffbf-1b8b-4a50-9d56-cb24f14c7764	b27475e7-bc97-4aaa-986d-fac2200372af	f
fea8af4b-842d-4ecf-b54f-97acfa55708e	5f2e54f5-e7ab-4db7-8207-13e79d067d59	t
fea8af4b-842d-4ecf-b54f-97acfa55708e	c7a7e7e2-ab91-4a83-bd60-c00c17b53a46	t
fea8af4b-842d-4ecf-b54f-97acfa55708e	32386eee-7165-46c5-b136-92b0c042c694	t
fea8af4b-842d-4ecf-b54f-97acfa55708e	97c4ec94-4f7c-4bfc-bc5c-d3b7e32bf5df	t
fea8af4b-842d-4ecf-b54f-97acfa55708e	8771c695-3f76-4e73-a6af-2e2ea861384c	t
fea8af4b-842d-4ecf-b54f-97acfa55708e	95f43eac-8ecf-44e3-92dd-75f1941e132f	f
fea8af4b-842d-4ecf-b54f-97acfa55708e	c6307d2f-4a15-4630-8d8f-638088435cac	f
fea8af4b-842d-4ecf-b54f-97acfa55708e	f714f310-507b-44a3-8f8d-8851b53dbddb	f
fea8af4b-842d-4ecf-b54f-97acfa55708e	b27475e7-bc97-4aaa-986d-fac2200372af	f
094f2c33-6332-4c44-a019-4bce38b81868	4cbae6de-22b0-466b-af25-812a8258aee6	t
094f2c33-6332-4c44-a019-4bce38b81868	d9502030-29c4-480e-9ec2-6c89f903c656	t
094f2c33-6332-4c44-a019-4bce38b81868	4c065ba4-a674-438b-98bd-7f70c56fbad9	t
094f2c33-6332-4c44-a019-4bce38b81868	9d5da259-7833-4638-84d8-86c0bfb66c0d	t
094f2c33-6332-4c44-a019-4bce38b81868	ab0c4e03-f2a1-4989-80c8-29b3018ad9e9	t
094f2c33-6332-4c44-a019-4bce38b81868	aaa15b45-2eae-4a31-83e0-f843c1d40f2a	f
094f2c33-6332-4c44-a019-4bce38b81868	d5e376af-2796-4d01-b231-276cfd97fa55	f
094f2c33-6332-4c44-a019-4bce38b81868	d0e805c6-1ff4-436d-9232-d62815f93f3d	f
094f2c33-6332-4c44-a019-4bce38b81868	bb8517ac-ab0d-4649-ae68-8a1868a1088c	f
35aaeedb-7200-42ee-b867-ea4fa6dbb0fb	4cbae6de-22b0-466b-af25-812a8258aee6	t
35aaeedb-7200-42ee-b867-ea4fa6dbb0fb	d9502030-29c4-480e-9ec2-6c89f903c656	t
35aaeedb-7200-42ee-b867-ea4fa6dbb0fb	4c065ba4-a674-438b-98bd-7f70c56fbad9	t
35aaeedb-7200-42ee-b867-ea4fa6dbb0fb	9d5da259-7833-4638-84d8-86c0bfb66c0d	t
35aaeedb-7200-42ee-b867-ea4fa6dbb0fb	ab0c4e03-f2a1-4989-80c8-29b3018ad9e9	t
35aaeedb-7200-42ee-b867-ea4fa6dbb0fb	aaa15b45-2eae-4a31-83e0-f843c1d40f2a	f
35aaeedb-7200-42ee-b867-ea4fa6dbb0fb	d5e376af-2796-4d01-b231-276cfd97fa55	f
35aaeedb-7200-42ee-b867-ea4fa6dbb0fb	d0e805c6-1ff4-436d-9232-d62815f93f3d	f
35aaeedb-7200-42ee-b867-ea4fa6dbb0fb	bb8517ac-ab0d-4649-ae68-8a1868a1088c	f
f6ddf5f8-d488-4661-b4ea-6096bcd531fe	4cbae6de-22b0-466b-af25-812a8258aee6	t
f6ddf5f8-d488-4661-b4ea-6096bcd531fe	d9502030-29c4-480e-9ec2-6c89f903c656	t
f6ddf5f8-d488-4661-b4ea-6096bcd531fe	4c065ba4-a674-438b-98bd-7f70c56fbad9	t
f6ddf5f8-d488-4661-b4ea-6096bcd531fe	9d5da259-7833-4638-84d8-86c0bfb66c0d	t
f6ddf5f8-d488-4661-b4ea-6096bcd531fe	ab0c4e03-f2a1-4989-80c8-29b3018ad9e9	t
f6ddf5f8-d488-4661-b4ea-6096bcd531fe	aaa15b45-2eae-4a31-83e0-f843c1d40f2a	f
f6ddf5f8-d488-4661-b4ea-6096bcd531fe	d5e376af-2796-4d01-b231-276cfd97fa55	f
f6ddf5f8-d488-4661-b4ea-6096bcd531fe	d0e805c6-1ff4-436d-9232-d62815f93f3d	f
f6ddf5f8-d488-4661-b4ea-6096bcd531fe	bb8517ac-ab0d-4649-ae68-8a1868a1088c	f
e3a31513-08e0-41eb-9d34-32a5adb704d1	4cbae6de-22b0-466b-af25-812a8258aee6	t
e3a31513-08e0-41eb-9d34-32a5adb704d1	d9502030-29c4-480e-9ec2-6c89f903c656	t
e3a31513-08e0-41eb-9d34-32a5adb704d1	4c065ba4-a674-438b-98bd-7f70c56fbad9	t
e3a31513-08e0-41eb-9d34-32a5adb704d1	9d5da259-7833-4638-84d8-86c0bfb66c0d	t
e3a31513-08e0-41eb-9d34-32a5adb704d1	ab0c4e03-f2a1-4989-80c8-29b3018ad9e9	t
e3a31513-08e0-41eb-9d34-32a5adb704d1	aaa15b45-2eae-4a31-83e0-f843c1d40f2a	f
e3a31513-08e0-41eb-9d34-32a5adb704d1	d5e376af-2796-4d01-b231-276cfd97fa55	f
e3a31513-08e0-41eb-9d34-32a5adb704d1	d0e805c6-1ff4-436d-9232-d62815f93f3d	f
e3a31513-08e0-41eb-9d34-32a5adb704d1	bb8517ac-ab0d-4649-ae68-8a1868a1088c	f
55b6b6c9-aa79-495a-987e-ea7ad4e555af	4cbae6de-22b0-466b-af25-812a8258aee6	t
55b6b6c9-aa79-495a-987e-ea7ad4e555af	d9502030-29c4-480e-9ec2-6c89f903c656	t
55b6b6c9-aa79-495a-987e-ea7ad4e555af	4c065ba4-a674-438b-98bd-7f70c56fbad9	t
55b6b6c9-aa79-495a-987e-ea7ad4e555af	9d5da259-7833-4638-84d8-86c0bfb66c0d	t
55b6b6c9-aa79-495a-987e-ea7ad4e555af	ab0c4e03-f2a1-4989-80c8-29b3018ad9e9	t
55b6b6c9-aa79-495a-987e-ea7ad4e555af	aaa15b45-2eae-4a31-83e0-f843c1d40f2a	f
55b6b6c9-aa79-495a-987e-ea7ad4e555af	d5e376af-2796-4d01-b231-276cfd97fa55	f
55b6b6c9-aa79-495a-987e-ea7ad4e555af	d0e805c6-1ff4-436d-9232-d62815f93f3d	f
55b6b6c9-aa79-495a-987e-ea7ad4e555af	bb8517ac-ab0d-4649-ae68-8a1868a1088c	f
25052911-8e99-40e5-ba66-36f49639c56d	4cbae6de-22b0-466b-af25-812a8258aee6	t
25052911-8e99-40e5-ba66-36f49639c56d	d9502030-29c4-480e-9ec2-6c89f903c656	t
25052911-8e99-40e5-ba66-36f49639c56d	4c065ba4-a674-438b-98bd-7f70c56fbad9	t
25052911-8e99-40e5-ba66-36f49639c56d	9d5da259-7833-4638-84d8-86c0bfb66c0d	t
25052911-8e99-40e5-ba66-36f49639c56d	ab0c4e03-f2a1-4989-80c8-29b3018ad9e9	t
25052911-8e99-40e5-ba66-36f49639c56d	aaa15b45-2eae-4a31-83e0-f843c1d40f2a	f
25052911-8e99-40e5-ba66-36f49639c56d	d5e376af-2796-4d01-b231-276cfd97fa55	f
25052911-8e99-40e5-ba66-36f49639c56d	d0e805c6-1ff4-436d-9232-d62815f93f3d	f
25052911-8e99-40e5-ba66-36f49639c56d	bb8517ac-ab0d-4649-ae68-8a1868a1088c	f
fe9d9161-94f7-4d95-9203-a5c8df6003af	4cbae6de-22b0-466b-af25-812a8258aee6	t
fe9d9161-94f7-4d95-9203-a5c8df6003af	d9502030-29c4-480e-9ec2-6c89f903c656	t
fe9d9161-94f7-4d95-9203-a5c8df6003af	4c065ba4-a674-438b-98bd-7f70c56fbad9	t
fe9d9161-94f7-4d95-9203-a5c8df6003af	9d5da259-7833-4638-84d8-86c0bfb66c0d	t
fe9d9161-94f7-4d95-9203-a5c8df6003af	ab0c4e03-f2a1-4989-80c8-29b3018ad9e9	t
fe9d9161-94f7-4d95-9203-a5c8df6003af	aaa15b45-2eae-4a31-83e0-f843c1d40f2a	f
fe9d9161-94f7-4d95-9203-a5c8df6003af	d5e376af-2796-4d01-b231-276cfd97fa55	f
fe9d9161-94f7-4d95-9203-a5c8df6003af	d0e805c6-1ff4-436d-9232-d62815f93f3d	f
fe9d9161-94f7-4d95-9203-a5c8df6003af	bb8517ac-ab0d-4649-ae68-8a1868a1088c	f
\.


--
-- Data for Name: client_scope_role_mapping; Type: TABLE DATA; Schema: public; Owner: keycloak
--

COPY public.client_scope_role_mapping (scope_id, role_id) FROM stdin;
b27475e7-bc97-4aaa-986d-fac2200372af	37cc39a1-f76f-4e60-9adb-4bd3c82546e9
d5e376af-2796-4d01-b231-276cfd97fa55	eaaf6668-f479-4aa9-a9aa-b88c253925ff
\.


--
-- Data for Name: client_session; Type: TABLE DATA; Schema: public; Owner: keycloak
--

COPY public.client_session (id, client_id, redirect_uri, state, "timestamp", session_id, auth_method, realm_id, auth_user_id, current_action) FROM stdin;
\.


--
-- Data for Name: client_session_auth_status; Type: TABLE DATA; Schema: public; Owner: keycloak
--

COPY public.client_session_auth_status (authenticator, status, client_session) FROM stdin;
\.


--
-- Data for Name: client_session_note; Type: TABLE DATA; Schema: public; Owner: keycloak
--

COPY public.client_session_note (name, value, client_session) FROM stdin;
\.


--
-- Data for Name: client_session_prot_mapper; Type: TABLE DATA; Schema: public; Owner: keycloak
--

COPY public.client_session_prot_mapper (protocol_mapper_id, client_session) FROM stdin;
\.


--
-- Data for Name: client_session_role; Type: TABLE DATA; Schema: public; Owner: keycloak
--

COPY public.client_session_role (role_id, client_session) FROM stdin;
\.


--
-- Data for Name: client_user_session_note; Type: TABLE DATA; Schema: public; Owner: keycloak
--

COPY public.client_user_session_note (name, value, client_session) FROM stdin;
\.


--
-- Data for Name: component; Type: TABLE DATA; Schema: public; Owner: keycloak
--

COPY public.component (id, name, parent_id, provider_id, provider_type, realm_id, sub_type) FROM stdin;
a5b1208f-82b6-4436-bfb8-79612a1308f2	Trusted Hosts	e9abe5f8-460d-41ff-a21e-ada47aba8547	trusted-hosts	org.keycloak.services.clientregistration.policy.ClientRegistrationPolicy	e9abe5f8-460d-41ff-a21e-ada47aba8547	anonymous
879c8bc4-34b3-431f-b956-1c80f09292b6	Consent Required	e9abe5f8-460d-41ff-a21e-ada47aba8547	consent-required	org.keycloak.services.clientregistration.policy.ClientRegistrationPolicy	e9abe5f8-460d-41ff-a21e-ada47aba8547	anonymous
4dc58dae-3547-47a3-8e9b-21b6ad930312	Full Scope Disabled	e9abe5f8-460d-41ff-a21e-ada47aba8547	scope	org.keycloak.services.clientregistration.policy.ClientRegistrationPolicy	e9abe5f8-460d-41ff-a21e-ada47aba8547	anonymous
2de003a4-4ed4-4749-bb82-132defa1916b	Max Clients Limit	e9abe5f8-460d-41ff-a21e-ada47aba8547	max-clients	org.keycloak.services.clientregistration.policy.ClientRegistrationPolicy	e9abe5f8-460d-41ff-a21e-ada47aba8547	anonymous
06dffc24-88c4-4864-91c8-441a1bad610e	Allowed Protocol Mapper Types	e9abe5f8-460d-41ff-a21e-ada47aba8547	allowed-protocol-mappers	org.keycloak.services.clientregistration.policy.ClientRegistrationPolicy	e9abe5f8-460d-41ff-a21e-ada47aba8547	anonymous
ee7451cb-633d-410e-b4a1-36381add125e	Allowed Client Scopes	e9abe5f8-460d-41ff-a21e-ada47aba8547	allowed-client-templates	org.keycloak.services.clientregistration.policy.ClientRegistrationPolicy	e9abe5f8-460d-41ff-a21e-ada47aba8547	anonymous
b4a87ae2-b080-4f33-b59a-2e82c2296a27	Allowed Protocol Mapper Types	e9abe5f8-460d-41ff-a21e-ada47aba8547	allowed-protocol-mappers	org.keycloak.services.clientregistration.policy.ClientRegistrationPolicy	e9abe5f8-460d-41ff-a21e-ada47aba8547	authenticated
d39b584c-bc2b-49f8-be8f-0772fa552e19	Allowed Client Scopes	e9abe5f8-460d-41ff-a21e-ada47aba8547	allowed-client-templates	org.keycloak.services.clientregistration.policy.ClientRegistrationPolicy	e9abe5f8-460d-41ff-a21e-ada47aba8547	authenticated
a4bbd5e4-8a2b-4ece-b88b-14e701dfce86	rsa-generated	e9abe5f8-460d-41ff-a21e-ada47aba8547	rsa-generated	org.keycloak.keys.KeyProvider	e9abe5f8-460d-41ff-a21e-ada47aba8547	\N
b3fc122d-e9ea-461c-bc2a-0fa2a7440c0f	rsa-enc-generated	e9abe5f8-460d-41ff-a21e-ada47aba8547	rsa-enc-generated	org.keycloak.keys.KeyProvider	e9abe5f8-460d-41ff-a21e-ada47aba8547	\N
d796161e-d6b4-45ed-8c28-6eb81d9fd4e3	hmac-generated	e9abe5f8-460d-41ff-a21e-ada47aba8547	hmac-generated	org.keycloak.keys.KeyProvider	e9abe5f8-460d-41ff-a21e-ada47aba8547	\N
624e80d3-6e09-4a35-9c52-5bba0d653ccc	aes-generated	e9abe5f8-460d-41ff-a21e-ada47aba8547	aes-generated	org.keycloak.keys.KeyProvider	e9abe5f8-460d-41ff-a21e-ada47aba8547	\N
c8f06b71-2b91-4d46-a814-ac7591394d93	rsa-generated	8ba89cf8-e84c-4cca-b865-2802d8b005ca	rsa-generated	org.keycloak.keys.KeyProvider	8ba89cf8-e84c-4cca-b865-2802d8b005ca	\N
8efaa179-dd15-4a70-ade1-2b8e08830c1b	rsa-enc-generated	8ba89cf8-e84c-4cca-b865-2802d8b005ca	rsa-enc-generated	org.keycloak.keys.KeyProvider	8ba89cf8-e84c-4cca-b865-2802d8b005ca	\N
78167a55-4a78-483b-81a2-680e9849d12f	hmac-generated	8ba89cf8-e84c-4cca-b865-2802d8b005ca	hmac-generated	org.keycloak.keys.KeyProvider	8ba89cf8-e84c-4cca-b865-2802d8b005ca	\N
e358e78f-df2e-4bab-99b3-6b1ee263bd63	aes-generated	8ba89cf8-e84c-4cca-b865-2802d8b005ca	aes-generated	org.keycloak.keys.KeyProvider	8ba89cf8-e84c-4cca-b865-2802d8b005ca	\N
3fa10bf5-c4c2-4100-beff-e5e5ea21fbfe	Trusted Hosts	8ba89cf8-e84c-4cca-b865-2802d8b005ca	trusted-hosts	org.keycloak.services.clientregistration.policy.ClientRegistrationPolicy	8ba89cf8-e84c-4cca-b865-2802d8b005ca	anonymous
8940d31e-952c-4348-a59d-02a43e09171e	Consent Required	8ba89cf8-e84c-4cca-b865-2802d8b005ca	consent-required	org.keycloak.services.clientregistration.policy.ClientRegistrationPolicy	8ba89cf8-e84c-4cca-b865-2802d8b005ca	anonymous
0d16eead-0917-4257-b5f9-fc71c1b59186	Full Scope Disabled	8ba89cf8-e84c-4cca-b865-2802d8b005ca	scope	org.keycloak.services.clientregistration.policy.ClientRegistrationPolicy	8ba89cf8-e84c-4cca-b865-2802d8b005ca	anonymous
767d2132-9970-45da-875a-728519ec72e8	Max Clients Limit	8ba89cf8-e84c-4cca-b865-2802d8b005ca	max-clients	org.keycloak.services.clientregistration.policy.ClientRegistrationPolicy	8ba89cf8-e84c-4cca-b865-2802d8b005ca	anonymous
7b566fef-2052-4f11-adca-8cc6a5931047	Allowed Protocol Mapper Types	8ba89cf8-e84c-4cca-b865-2802d8b005ca	allowed-protocol-mappers	org.keycloak.services.clientregistration.policy.ClientRegistrationPolicy	8ba89cf8-e84c-4cca-b865-2802d8b005ca	anonymous
c931d6f8-5a26-41fe-a626-94c2f3021c5c	Allowed Client Scopes	8ba89cf8-e84c-4cca-b865-2802d8b005ca	allowed-client-templates	org.keycloak.services.clientregistration.policy.ClientRegistrationPolicy	8ba89cf8-e84c-4cca-b865-2802d8b005ca	anonymous
80eeddae-679b-49d2-bc6e-dc803f0872e5	Allowed Protocol Mapper Types	8ba89cf8-e84c-4cca-b865-2802d8b005ca	allowed-protocol-mappers	org.keycloak.services.clientregistration.policy.ClientRegistrationPolicy	8ba89cf8-e84c-4cca-b865-2802d8b005ca	authenticated
009dc0cb-765e-4508-81fe-d0c2ff031aba	Allowed Client Scopes	8ba89cf8-e84c-4cca-b865-2802d8b005ca	allowed-client-templates	org.keycloak.services.clientregistration.policy.ClientRegistrationPolicy	8ba89cf8-e84c-4cca-b865-2802d8b005ca	authenticated
\.


--
-- Data for Name: component_config; Type: TABLE DATA; Schema: public; Owner: keycloak
--

COPY public.component_config (id, component_id, name, value) FROM stdin;
697c92ba-1557-4d6e-861e-fb219f905a3b	ee7451cb-633d-410e-b4a1-36381add125e	allow-default-scopes	true
fa992f47-c07b-41a5-9a90-eaddf0033d6c	2de003a4-4ed4-4749-bb82-132defa1916b	max-clients	200
b75c7043-e896-4459-8ff1-5cfe16a8152a	b4a87ae2-b080-4f33-b59a-2e82c2296a27	allowed-protocol-mapper-types	saml-user-property-mapper
eb5a0667-a101-4ea2-8640-8c198ed7c914	b4a87ae2-b080-4f33-b59a-2e82c2296a27	allowed-protocol-mapper-types	oidc-address-mapper
2e157db0-8552-4a69-accd-4abaa882830b	b4a87ae2-b080-4f33-b59a-2e82c2296a27	allowed-protocol-mapper-types	oidc-full-name-mapper
aaf27108-2e20-4a10-96d2-76217e848a47	b4a87ae2-b080-4f33-b59a-2e82c2296a27	allowed-protocol-mapper-types	oidc-usermodel-attribute-mapper
6ebbd471-83c4-4586-88a3-ecb5fe10c1f4	b4a87ae2-b080-4f33-b59a-2e82c2296a27	allowed-protocol-mapper-types	saml-role-list-mapper
bb2e576d-632b-43e2-ab2a-e5696619fab8	b4a87ae2-b080-4f33-b59a-2e82c2296a27	allowed-protocol-mapper-types	oidc-usermodel-property-mapper
2ff89c2a-52b9-4699-9c25-55b7aecd830f	b4a87ae2-b080-4f33-b59a-2e82c2296a27	allowed-protocol-mapper-types	saml-user-attribute-mapper
c614e281-ee16-4227-a5ca-f69ed8c23fce	b4a87ae2-b080-4f33-b59a-2e82c2296a27	allowed-protocol-mapper-types	oidc-sha256-pairwise-sub-mapper
83daf3ba-d1f2-4ff9-a6f6-0d4da3f272d2	06dffc24-88c4-4864-91c8-441a1bad610e	allowed-protocol-mapper-types	oidc-sha256-pairwise-sub-mapper
ce374243-2725-4cc2-80fd-193fc0a4aa3f	06dffc24-88c4-4864-91c8-441a1bad610e	allowed-protocol-mapper-types	saml-role-list-mapper
459370a3-59b2-41da-8082-4f6f3defd110	06dffc24-88c4-4864-91c8-441a1bad610e	allowed-protocol-mapper-types	oidc-usermodel-attribute-mapper
29e04f06-828e-456e-8a5f-800626044987	06dffc24-88c4-4864-91c8-441a1bad610e	allowed-protocol-mapper-types	saml-user-property-mapper
6514c3d2-12da-4d2b-9353-1f3f7f8547c8	06dffc24-88c4-4864-91c8-441a1bad610e	allowed-protocol-mapper-types	saml-user-attribute-mapper
88458b41-cfb7-4b9d-b1bc-6fd544d1fe9e	06dffc24-88c4-4864-91c8-441a1bad610e	allowed-protocol-mapper-types	oidc-usermodel-property-mapper
8dfd86cf-4456-4472-96e2-6d4c72923de9	06dffc24-88c4-4864-91c8-441a1bad610e	allowed-protocol-mapper-types	oidc-full-name-mapper
cbbacc2b-3507-4c48-80e7-facb2a9db35b	06dffc24-88c4-4864-91c8-441a1bad610e	allowed-protocol-mapper-types	oidc-address-mapper
a0b70f52-67e6-4bf3-bca0-ad55a17b3d11	d39b584c-bc2b-49f8-be8f-0772fa552e19	allow-default-scopes	true
0fbb6987-65f0-4387-830e-96a680a3981c	a5b1208f-82b6-4436-bfb8-79612a1308f2	client-uris-must-match	true
5c8128b1-50dc-4440-bb95-c11e64c98f70	a5b1208f-82b6-4436-bfb8-79612a1308f2	host-sending-registration-request-must-match	true
fcb95f3d-84f0-46ac-bc53-ca87ba35b8aa	b3fc122d-e9ea-461c-bc2a-0fa2a7440c0f	certificate	MIICmzCCAYMCBgGM2NEzVzANBgkqhkiG9w0BAQsFADARMQ8wDQYDVQQDDAZtYXN0ZXIwHhcNMjQwMTA1MDg0ODU4WhcNMzQwMTA1MDg1MDM4WjARMQ8wDQYDVQQDDAZtYXN0ZXIwggEiMA0GCSqGSIb3DQEBAQUAA4IBDwAwggEKAoIBAQCbOKysfsuc2aDk4+8e92IHp0m8FwGb77KPEVhLuXw2msszn2qlSCF2Tt3O7asyqsxMBb5BF1S78k9czQi2QWbxwk61C5lnRJjIyLfT7RIYWypOx3iWvaWi6P+0sAiW9nKedkHF484afBQle2Z0O/kDcWMBWDRLm160qw+OnsOoddbugH/GrVSGtpjDH1De00h9Mn2ZCdSClD82r5pSKZQ5+RTnQqsRrFUxgG5PU09Y3zhUhYssnWUrcb7J3h61TA1PDclh4eR1naFP5cQFpw7mBj2z/SVN79lFATug9iWJAH7CyCdvKKRspFoh+5SJDs7FDcGPz/jIABYl8angVyBxAgMBAAEwDQYJKoZIhvcNAQELBQADggEBABm/llfC1/nPPStobqIWEeWnkwKr4ljuS74mgffc1k5ro5nrJ1kAhKIiWVFPr+VxpSFd0mJs5gzqSHG0FqfWc1L/bWBUuXBjmfdw3KaPd5eyDA+8xsDLCVh25s4nkOhnfA3LAChnyeM3AET04kYAbcajrw0adHmXFU5qQKWZCgi9eOgBc+bMwehXgUMb9Jf+jQWsfSUoS6mPGUiFg/96tWcTuUL5i4LyYKoQY8CbhMKT8YWm1FXgyHJ4tpSAX6k4BLRTQJ/nGaEfSPiknA1P5qHwOC9HNqghZeA2O9FsmW1YHlvp4hKrVQEOc2zEZfJV1Vnp38sU2OMuq3942LWqS3U=
6317388f-3d64-492c-843f-4a2b91d4a45c	b3fc122d-e9ea-461c-bc2a-0fa2a7440c0f	algorithm	RSA-OAEP
5ae32473-6569-4fbc-ac14-67bc7da01217	b3fc122d-e9ea-461c-bc2a-0fa2a7440c0f	keyUse	ENC
8c956fbf-639a-4f36-9981-a3107d1b7f85	b3fc122d-e9ea-461c-bc2a-0fa2a7440c0f	privateKey	MIIEowIBAAKCAQEAmzisrH7LnNmg5OPvHvdiB6dJvBcBm++yjxFYS7l8NprLM59qpUghdk7dzu2rMqrMTAW+QRdUu/JPXM0ItkFm8cJOtQuZZ0SYyMi30+0SGFsqTsd4lr2louj/tLAIlvZynnZBxePOGnwUJXtmdDv5A3FjAVg0S5tetKsPjp7DqHXW7oB/xq1UhraYwx9Q3tNIfTJ9mQnUgpQ/Nq+aUimUOfkU50KrEaxVMYBuT1NPWN84VIWLLJ1lK3G+yd4etUwNTw3JYeHkdZ2hT+XEBacO5gY9s/0lTe/ZRQE7oPYliQB+wsgnbyikbKRaIfuUiQ7OxQ3Bj8/4yAAWJfGp4FcgcQIDAQABAoIBAAfM0LoMFtypX8VCyj9RzoN8kcctt4kr0drwQ+Htxq76hz2vTBFVUyemIc2ySismE7U6CGgOVWXqsLfkzoRUm+kIEvMUe7Npmj0kP38bA6DVU3ZhHhdinTRHHcLpYeweoy7A+fAJISA59hv2VBUhFqPIdtGAaoPWYVtmOXZY9nN0kO/gWfy8k+3ZyqkiYWJTDjmkKHPEqRF+nT8J+m+S2vcvFeCB7oDlqVXXb2cYfD1s5TykvwT+QZJ2eP9wF9ZVaFHa+pD9lmOz19ENOG6JfupjoXmytIqSYgp3zXwYvAHt6UzxRtgW0l6cawJkfsAQ9caKlLOeGTLrZv/Pca0pwuECgYEA0JZo0kw+sUIwDBIkdvLccrtqj7ytF1D9kKshFm55BcrcuB4wahBIV4a/lqb98pCDOgMZtmNT7kzojRgIwY7OS3e+VHbV8Hg/D/8vTV6b6whp1fg6nolows8rjPsbN0zEWabNSTImeuhbxsuTD7OLAc3M/JgTbCv73nw5kEA5wWECgYEAvoDrPUhn3y5pqTrlHRi1kbXgnyMk7Lcu8A/49BVqlWrRIZ5KBZd2GCoCw/qaeGs+aH0tOUqYI9GLzl0Dtxpp8VXIlLpfqqUv7RopGNomKTRGbZsbiWdWEq/u3JxTV1FmNv1WWjz54wSTEtM7ppv3VZY6jl+yL6YUddVDjzuA6RECgYAVvphO1AP1FqFLoNiMTeUNUNxa/6BLvfWxDyXz4LBdGjjION1zMR9ZgIKYgfAXSVlkws37ZX9qaDoV+1tuUiTPWTxOMdU7rE1mrYOQ3TwD1Gy0EZyKymhRZqdzmvnLWgVeEzVzW/cG+RIYN0CtclobZgjojDH6JNus5eZaU1eyAQKBgBKpZmH2edZvIYKmdlNHXGINwxdTxgY6W6rApc6jWnGQqTP14aJyl+r+Eo9IOWGaf96UhJ2cJRM9L8jja73AJKizkpafO0foLq23Zlc854gZytxp2WS4bsId4fRSjAd9vdmdL5xfZMtMY2vwrWNA3BXSRaI01au9RTvVzGx3k8VBAoGBAKSIvM10GddIbICdYHzAo2t/VgO2FBxanbUJMtNGkCLgXfEwfcl9VoXDhKI2EBYzuil6eMMT2VV/+TQGj1bkVBUgIi1xkfDQ9OXdaTUlSpziZyc6kANva7GBKr/RMzhdQAKyGxL4ykl/LvYqFb8GxkRYv6nibw1iCnFM9bVB/Csw
6e4ebf0a-118d-4978-b584-a6ad09d67959	b3fc122d-e9ea-461c-bc2a-0fa2a7440c0f	priority	100
961d7153-291e-495b-8c78-6e8d7a406ac5	a4bbd5e4-8a2b-4ece-b88b-14e701dfce86	privateKey	MIIEowIBAAKCAQEArQHoNgODxaK/egmUsAMzVuRowEqTXKV+MPCTkD6IkRhUlobYh8PuaDkj8/qytv9NziZZEuZ0HXsFunbm8QnBvdnrYCs8tlFKUeAzhhL0A7rhMf1RizoPKYExHku8mfJ7YrsQ9iaLmyiNX9vbFCnvbnTqGvHvhnE0CoWBdmeTmNtwbWN10OnYOk76i8Hf0pBZvAy5Urlx6MRAUwA0Q//ZvbWDstsWyxdLp4dTeF+4VXfO6EQve+XIf2WqyyZQ6eUyQQ792XhwqAOoNyHPQIeBbXa2ebyr2JKg/VEM3ZqN9Tm7VrOZnZUSk5tYm+NG94xQZ2bKgsGXsYrvCIGadNaR3QIDAQABAoIBAAdmRHtC7TjfvBbJIB3jFSgLPtuylNjqjxoiv/z0X7zs8Hk7rTkpTSISB5Kgz1H6W2aMx1SCnMbCAz21Zi07AJlRH7sOPluB4I7d6vY6C0u5i3Yq4nj0878Psn0cOiXPdC2F2LTecywgsOM/sQAMxxvPTk/2twrl/pbQnPfmeC6aahEAJ38rYkhNtI2xHLPRlJzOjGtQW3u4nPVuqzGDEquqbwZPOkwAwVxcRpedbvKdTOnpkgOErJKPnEvszLoiywg44aRjQ0CuFSNT5TPEkyBOYlh/6DDVDKsdchMZTPkfdI/VykFhifldJ8owOeKFbJohDcOMPdRZagQF2rjLHrUCgYEA22t0X6SdqwMHKkURpWVn0uo6jKKY5VJGSQmm1vFNUTYINGHQRIwmyE/veJXVtK0Q4+Z7CK6G6ZfdtqIwV5H3kp1kS0o+wpZDNQcSj+vl9bif1SEFPky72qwtq/pCfMuxa38spJ4ck7fc/xe4AsqIOGqYfuQ2c9HKxNzyil8YCZMCgYEAydmjDdUWbtHnkGZRwZoolB5XZ8qiKn3S7sniqzYtigPgkxt/2hRIhcwqFG7pfq0Jh56l0DZt7peCNoIuoX08JxTVXIBY20iFAqF9QKPVy+w7ArFgJN7tj8cJJjQ6j4Z3z1AklegzPANeh5tdlTWSplJSpLQBeGRukrQzkqDyXM8CgYB3gSjaxp+Q+o82eHPJ71cCysukuRIpJAxfzz/tJXOE3bbOQM/b5bFhvBejR4gjZXcjiO5NpjCYnTwGMoO9ziRW2B4922wfMxPbl8SGWmbe0/VJcTiX29ccnFYrqpv3uEEjWRqJdgv+cE+PJ+3ypzhV8cioo8b8gbC8U9JNhslivQKBgQDBbfkuITxtGGOS4iqIn8UxI95YzTsYAxmm0PqRXcrIDq0f6+NaRcO1zA+rIxpI1WNjfmmhnPc+BBy5RYmQIaYKQZGxIiGEiftEqSKRVi9kSs3F59qdmrAG7xJadQSFU7Pui/tzWF/4q7Xjt8Q3X25YSl1+Di22hG/d0Cf35Jo8ywKBgH0nIUj7r07PQHehhqyfNrwnQ/Y32MWi7jU/rfP4JOpOV4NskicwsIyMCcfEdqa32dydW251W4+KIdcuC/4RPJsp+DxzMTThdhH63w28cSDbovdTPcv4HNJeM8q8lnYq31p/DMzCku3YU69tcppjLU6xUamltP+Co7rx5OxAJ0ry
a411f4a3-cc35-4e4f-9720-571dde9625ed	a4bbd5e4-8a2b-4ece-b88b-14e701dfce86	keyUse	SIG
6cd15418-6f53-49f7-b728-2ff6dac74c6f	a4bbd5e4-8a2b-4ece-b88b-14e701dfce86	priority	100
4a5012fb-a72e-418e-b53e-235b1ecc7f61	a4bbd5e4-8a2b-4ece-b88b-14e701dfce86	certificate	MIICmzCCAYMCBgGM2NExnTANBgkqhkiG9w0BAQsFADARMQ8wDQYDVQQDDAZtYXN0ZXIwHhcNMjQwMTA1MDg0ODU3WhcNMzQwMTA1MDg1MDM3WjARMQ8wDQYDVQQDDAZtYXN0ZXIwggEiMA0GCSqGSIb3DQEBAQUAA4IBDwAwggEKAoIBAQCtAeg2A4PFor96CZSwAzNW5GjASpNcpX4w8JOQPoiRGFSWhtiHw+5oOSPz+rK2/03OJlkS5nQdewW6dubxCcG92etgKzy2UUpR4DOGEvQDuuEx/VGLOg8pgTEeS7yZ8ntiuxD2JoubKI1f29sUKe9udOoa8e+GcTQKhYF2Z5OY23BtY3XQ6dg6TvqLwd/SkFm8DLlSuXHoxEBTADRD/9m9tYOy2xbLF0unh1N4X7hVd87oRC975ch/ZarLJlDp5TJBDv3ZeHCoA6g3Ic9Ah4FtdrZ5vKvYkqD9UQzdmo31ObtWs5mdlRKTm1ib40b3jFBnZsqCwZexiu8IgZp01pHdAgMBAAEwDQYJKoZIhvcNAQELBQADggEBAKTZAZMzUKhxe61TKDkPokfxAg3XRPiMTnYzARFWR4QQZWWwGcggy8zKtUuUFIw/c57mKUsJbwhF/suc0xPqaVuMB6r5yeS8krr6gKtYtRJ2uQZXMaO84ME8pmiZK0wsm8kcyjk/ULtElnGTXy8wlo5LRG7ZbCQM0doMH2BaNq7M3+cB8uHfZTxbIK1WnLW/6qrW9It+Cg6nQoklhhSXro/mPKw2aD62UyeygxycjF6BXPBcS1v+6tExsBf0sMBKBfOj4mWZ830M2VOozY1m9f/NDJ4J9J9Evta/g/w0tGTHEhHa2/BJAMn5uJiS+B9FlnjuBOQZUwCcEd+vAFLA6/I=
3a79f333-c686-4713-9e42-d23318eb4206	d796161e-d6b4-45ed-8c28-6eb81d9fd4e3	kid	cd43f4c2-6ed2-4329-9f4d-f3ef39fea14f
0b1bff89-94d3-406b-b790-1bb498391682	d796161e-d6b4-45ed-8c28-6eb81d9fd4e3	priority	100
a1784fdb-cf6a-40e2-9c32-24b04f2cf35a	d796161e-d6b4-45ed-8c28-6eb81d9fd4e3	algorithm	HS256
904d9ced-25d8-4a6b-ab6f-8da4347cc2e5	d796161e-d6b4-45ed-8c28-6eb81d9fd4e3	secret	PV8h-7C3gJLGtVAFUraZQXM_6_gv5MPs-aZCNfyerTeUJ3NHlVcIUOZmPseGPKYD2GrqYxjD1aw-9BjlcFYzRQ
dd723adf-00bb-44c4-9434-afa2190fea61	624e80d3-6e09-4a35-9c52-5bba0d653ccc	secret	itj7pe3EEmFJdCbydGSOZA
e9c2e762-6c26-4fcc-bbb0-9d998f4c79ca	624e80d3-6e09-4a35-9c52-5bba0d653ccc	priority	100
f3da7170-f149-47cf-b41a-a30b7efff6ac	624e80d3-6e09-4a35-9c52-5bba0d653ccc	kid	c83afbae-9712-49f9-a027-bab171f513fc
27e97a53-dbe6-428b-adb6-fbf3adb39835	8efaa179-dd15-4a70-ade1-2b8e08830c1b	privateKey	MIIEogIBAAKCAQEAxhcYbgv64VGbkDFoP89Wo4K1s6/0bJ6qJ6qdOlDilHfDEIw4DVVSzd9deotzx+2zgGpSTVlRnmmMxRSDvBVhXDHSap67rYez/mbr2IYy/wU40bpQOcHvPxW4Pw4sns23kvrlygMEFujcHQyaHV8HzcBQDYedP8sf/opU21z/tm4SS4rcYD9JwnFWLOkAeev49snh81T9bmr6TVtsTnAOa//5UouOZz1xpUDDC8v292Hi1CtF/feungeDQ/FcefFHdgsgbNmOzrhzeLI+TqZ5xl7bznwrhAmLEgmzBBWl0OP04cygwoFa9hNUSLnJVeGGRXGD9pkr3ER5vklo98S4dQIDAQABAoIBAA9AWvdUwSGqTK266Bm1nH2QBEO2lz0/sBPIF+fpWgXv/Jr1uMu/VytA+IEFY0owMSMAzJ+7nJmeQHeHX1HSsZbNbTPGpJDf7bSiIaQfnPsz4I6L55Oy106bnP5vLcdM88aDaRV3IFBP6Gvs0EwqSL8HgK0HVSJCwOQHrDCMMKdPyokBZD5LiPDk8vAp+xBrmawMu7sUeXrD73bkhXbiGJLevrbw7rkVjD+fY12wfp2OtcfHskthsJtQUs1P5sqqmdvMc3mp7Xk53Crn/fUMXWrRDJHQKXwKZdzKFIF1fOkeUW7WwP2eqUFJQd5lgwemh0DZXSHPpwSaaAFaim0/FAECgYEA6FA8VNn/l+H6E2S1FqhekhtGsdpALS3966VZ9N8swu99aT/6veaOuu5f0U+u66AtpHAfa9Ma7Ug1Iswy9T+MRcjtazZpuB/8AQvjFY9Qm7OhLaS/8cV7EUu0W1/UiP8OcP4IVyxqzc4S8P4NBFvmxrpZiFGMkh6xoEWxGQitkgECgYEA2kmT2sEJVlicnDr+o3idN8sP7ePQ7VgsnLszf5lt0kYdTM4zjABPMmFs+Se0NeEVyR4VgUafoxsBsrxrihRdn5OuoHKhXaexQcG5Ei9q+8CceucBz3HESPVO8XfLQOUvr3rfCrcXh7jKOHAw4w3W2YRzLhMnqvgO1OrHsWGU/nUCgYA0dmopf1GJKy8eUg/THhK9TAua/n6ftVMydBTsh7nEC/F2Y0xstjRlYo+g5S3LaFDmYau23eWm0DevtA2N9Nvopod3PsKBIjf2xIhzxfmeL+KmPB5cqwwvy7jfKbUFexP30GZxyUYVVARTCAxIf7iOCGdPsZrdJLFYUGS+EoegAQKBgGP8XdhOoXtGnX3GXAr+3WzH+6TovDNrNwwXh3BEFBTD/vnGXcAcCCq4i5TYxegEENmNiSYs9kRcw3teaRfXWkcU+2ENALMIc9394UreI2/rewGkvKSLpPASRTW/vH8eO6hybKXY1dNaJm6RnSLznN0HmUaaiYn7k7edTxkF7JxdAoGAFmAbwMKKOGiTqHESy+uE1duobgTxep/Zw8pGeHLeMcGvHDGN9CwS5JzG8KExDqGoiJ1KUI3KkoTj0xBFIVAA8fCl8RbdtIaXPTxSqSPOjmzy+ZwbFAiguzqdIX3ylLYzcDP4iN4yQABoHxv+0eh5+hikzOblfbg/G0RqjTwixpA=
89fc8fcb-3f1a-4f49-8208-e11cb7d945f6	8efaa179-dd15-4a70-ade1-2b8e08830c1b	certificate	MIIClzCCAX8CBgGM2NHxITANBgkqhkiG9w0BAQsFADAPMQ0wCwYDVQQDDARkZW1vMB4XDTI0MDEwNTA4NDk0NloXDTM0MDEwNTA4NTEyNlowDzENMAsGA1UEAwwEZGVtbzCCASIwDQYJKoZIhvcNAQEBBQADggEPADCCAQoCggEBAMYXGG4L+uFRm5AxaD/PVqOCtbOv9GyeqieqnTpQ4pR3wxCMOA1VUs3fXXqLc8fts4BqUk1ZUZ5pjMUUg7wVYVwx0mqeu62Hs/5m69iGMv8FONG6UDnB7z8VuD8OLJ7Nt5L65coDBBbo3B0Mmh1fB83AUA2HnT/LH/6KVNtc/7ZuEkuK3GA/ScJxVizpAHnr+PbJ4fNU/W5q+k1bbE5wDmv/+VKLjmc9caVAwwvL9vdh4tQrRf33rp4Hg0PxXHnxR3YLIGzZjs64c3iyPk6mecZe2858K4QJixIJswQVpdDj9OHMoMKBWvYTVEi5yVXhhkVxg/aZK9xEeb5JaPfEuHUCAwEAATANBgkqhkiG9w0BAQsFAAOCAQEAqmqqpon8wJDNDaaczcDiTeVGALGs9r+QIhubzDDU2QWri6v04nZ/WvKEKyA92Q3fJHp3y4bmXi2OeX6tAKYYM+GqDhXJ1/BLyWPU9hkRUxyzOZHbPZITB6jO+o9ijV8mhyYuYHqRDU33WNadXsJdtU61MRxQqmyb7n+RQGubNkf6eWLqgn8tHw+BQLKrmcJp5yJ364OT7GUXZbrdOXEsNRc5LRwmXXLezQTbCHOM9FRYO4g9Py9rCf0Rx41fsuodxfCcxJ8XfvHdxLs304eEeLqeTs87cCa8pcovAQNQwJwt+OJPb5xRdovJ7yFQxIHcp+FmNSjxAxFfAjlqQ05MJw==
c8e81bee-c5f6-407c-923d-5d0a3354a04f	8efaa179-dd15-4a70-ade1-2b8e08830c1b	keyUse	ENC
69581e1e-2242-43a6-b531-529776342450	8efaa179-dd15-4a70-ade1-2b8e08830c1b	priority	100
2a4fa3a2-e38a-425e-89d5-6afa02ee87d3	8efaa179-dd15-4a70-ade1-2b8e08830c1b	algorithm	RSA-OAEP
f924602b-f7e3-41b0-afa1-8a057fddee49	c8f06b71-2b91-4d46-a814-ac7591394d93	certificate	MIIClzCCAX8CBgGM2NHwATANBgkqhkiG9w0BAQsFADAPMQ0wCwYDVQQDDARkZW1vMB4XDTI0MDEwNTA4NDk0NloXDTM0MDEwNTA4NTEyNlowDzENMAsGA1UEAwwEZGVtbzCCASIwDQYJKoZIhvcNAQEBBQADggEPADCCAQoCggEBALQSydR/U/v2DgQwZMt9p3Y7c/jrrkW4xMJ+xFDpVtAsff1fX9qPx8Dm5w/hxGgoi1I7jI7exhLe5WddjHN65gnovHOqrY1TlIVrvlsr2Rd35yhc0DpjOZTG3XkcnZTaz2VAzuG3I+S1uKligubGGs58KqAiQQHBdQK2uT9yDthuzXsYH08/YdWs6d19BhwXRpWrqmg2Pp57wNccpt4dUkUgumsPTln0Y/bLf5j9h6jyqO8nKu3O8X2h/gg6ZWKg3iTUUmDQ6ceEH+JIHwywqer9e3w10VPots1QZXBcJNd7HZcawMZHuO8HRCWW9WTylIbNF9GxmC5cEA4tz+MiIs8CAwEAATANBgkqhkiG9w0BAQsFAAOCAQEAnz35Ue0+C3N+Reu/6IZ1JS9Kb6i7cLhTcmyesjhMPlOmAcTQQ01mBT1kjftKCyTmseBwbjIGqL6VJH4dilVBU9s2vKA7LmgNWe5AguKAOHhPekrDuwf6bhLaIhGF2R56yf9EZpdvsbIT4rypHI9b2LmMiKVtbOamws+ILHtD+Sju4x47cVKxjinMFb3EfGHxCvwNOuOn0E7m/691qyD3Lo6YrWnHlI/9FL1YV9cc8StMmhOfr7P5SJ/0KfNRQX09PhiIyfRAsni2bHZHRYpV5d6cyC+fxUBSN7KxVb/4qT+3+xHaheb+X8GES8/Q23sDmspHqE0zYOa+ZWtcgawmQQ==
3ac8af2c-82bc-4464-b034-7c4aa7d43cf6	c8f06b71-2b91-4d46-a814-ac7591394d93	keyUse	SIG
deba8167-ee56-486e-93e8-13f0be367bed	c8f06b71-2b91-4d46-a814-ac7591394d93	priority	100
96752c11-491d-4263-8f2a-dde40b308542	c8f06b71-2b91-4d46-a814-ac7591394d93	privateKey	MIIEogIBAAKCAQEAtBLJ1H9T+/YOBDBky32ndjtz+OuuRbjEwn7EUOlW0Cx9/V9f2o/HwObnD+HEaCiLUjuMjt7GEt7lZ12Mc3rmCei8c6qtjVOUhWu+WyvZF3fnKFzQOmM5lMbdeRydlNrPZUDO4bcj5LW4qWKC5sYaznwqoCJBAcF1Ara5P3IO2G7NexgfTz9h1azp3X0GHBdGlauqaDY+nnvA1xym3h1SRSC6aw9OWfRj9st/mP2HqPKo7ycq7c7xfaH+CDplYqDeJNRSYNDpx4Qf4kgfDLCp6v17fDXRU+i2zVBlcFwk13sdlxrAxke47wdEJZb1ZPKUhs0X0bGYLlwQDi3P4yIizwIDAQABAoIBAA4ja4IqFrrLShs9SxMVfcOxGoOKZAriKipOY07D0Ca7V49zoMY7g8BUxzX4A/PDOy0gGWkeR9Vmqs+Mby3VK6EB8cnv6X1IxeCArr5GmXgkpRs5YYZnRASD/xLQEsKDnsUHnmnnRAPKpzUL09TkUpzjvHUJbqrOOOGw3XQ3Zr/Knl4rBL7HFgYnfRNMRqF+V/19RsxRz7i5hdizWDLhWH8fdNsm/ezD6Pr42ggneKGBAyzvkn+FB7eWg2Iq7ui/9gQAFuIrw5eL6gNCyziFgKUF5E7AkUeXGs40rF0Oi/6Hi8fMS+fa/wU0yW2R2Sg2reJixx4h4g0QcLuxRxRxEAECgYEA47yQ/4dj/dOkRxOp0wmq/gvRkduiUobG85C/91pyMqq7L3jwgUwPLSGz+J8pBIPdWjKjLOwyEiGfBHuG5ZdiFqCOaCrBbeU5bMBFjoPuYTeWOf21Wd8u+P6I/O6D+qHQsTH7/9PwqaVkzntpZ/msPo87oAXaMzFDIdbmUBT1Ov8CgYEAymvpXgUKHe+wmDjNc6kZ0kxL32Uk/qxC4gUb2Ed9+vZ/nQt7KlHxgWU9U/sHayLaK1YCvyp42cvcYRPy989IExnHwu8+ANBTiZ8k3nV1kbq4TdcYWHuhvdyn1m5bN5GrLyJUiiITiJdLwuuvw9gE6wIzs5yWbh2cOWS2KtMGKDECgYAOOtcYkF4oGxRVuJ3Q6Pa9PwHOSln/LBq8V1wXWZhvIAnoMndcrOL53/Q94bwPYynum+FkSjHqvh0Qi6NnLyla3pdnXNyPQFZxPCZcfFPl0TJa10aAohhuSIFIxKKMg5XlrIjheF2+S+5blIyGiaxAkHSaUCNNNZPLRoFHmbelAwKBgHyA/1s7Ekvzf9VBKu13F1DIaOqRFb4nSkQnDEdtQcm5ECkSRMF1AWyrTpt3DcsR9sss7ieTAh5ES9rSIGHX9ub4tmvqJ2LswFUns8+4w4XNKUuHf4v9DzDupbU4z5ZQXNBy9zi3WPhsxsavnL6DAhNimVZifAxi3hJXJc0VWvYhAoGAfVzePRQ/jUSkUIt6xmHE5JjG31VMSGkBeo/scnR/RyvNa0VhvU1TQJYWHnA8Zd9194FVVSigHOMKWkZKvTa2g5l++Uhyx/E7z/V8a8F7Szg81QDNQsw1ZVlXNjqJVsuaXh5HaM60hB29UybMa1a5BjK8JIOX2FrHOD7Y8rClMCU=
a8e1af1e-9b67-4f9a-a110-b51dd4159fa4	78167a55-4a78-483b-81a2-680e9849d12f	kid	e307a9ed-c337-4239-ac74-fc9922e39d66
14b8d07e-8e87-4a08-8ab2-f8bfcea73a35	78167a55-4a78-483b-81a2-680e9849d12f	priority	100
c05b0c81-330e-4f4f-855d-ef0137f6c02f	78167a55-4a78-483b-81a2-680e9849d12f	secret	YoClGLr_LhbV9ttL9WBhyY-px9NzXURsGznBeJHnE80jb_qe2fxeqerZIr-siGMV1jJFasYQfXq2f7h6kx-ZKw
b2e90019-0f41-4968-afc7-567fa877c894	78167a55-4a78-483b-81a2-680e9849d12f	algorithm	HS256
4e30a294-ef67-4ed3-ac86-f198e423cd95	e358e78f-df2e-4bab-99b3-6b1ee263bd63	secret	t0Nh6cLwy10Zx84Qn0FI8Q
495cf0a6-3769-4e86-ba3e-48c1fee68557	e358e78f-df2e-4bab-99b3-6b1ee263bd63	priority	100
9ee80077-f946-4f28-85ab-810d0a1f4dc4	e358e78f-df2e-4bab-99b3-6b1ee263bd63	kid	31a54d4e-b3da-4466-8ce2-b5f180fbcf72
3d227485-76b6-4f8e-b39b-cd629b8e0e0c	7b566fef-2052-4f11-adca-8cc6a5931047	allowed-protocol-mapper-types	oidc-usermodel-attribute-mapper
c48479ad-6852-40fd-8469-58a7ea44549d	7b566fef-2052-4f11-adca-8cc6a5931047	allowed-protocol-mapper-types	saml-role-list-mapper
f11e2fbd-999d-4397-8f9a-075846d8f48a	7b566fef-2052-4f11-adca-8cc6a5931047	allowed-protocol-mapper-types	oidc-usermodel-property-mapper
629e5bb2-0b78-4784-95d9-23fa039b7f4c	7b566fef-2052-4f11-adca-8cc6a5931047	allowed-protocol-mapper-types	oidc-full-name-mapper
cc19fb5b-bc2d-41f7-8368-be50ea995f7e	7b566fef-2052-4f11-adca-8cc6a5931047	allowed-protocol-mapper-types	oidc-address-mapper
795b532a-a4cb-40df-933b-6209bcd8ffa5	7b566fef-2052-4f11-adca-8cc6a5931047	allowed-protocol-mapper-types	saml-user-attribute-mapper
a3831c18-f4da-49d3-a15a-c2fcba29094a	7b566fef-2052-4f11-adca-8cc6a5931047	allowed-protocol-mapper-types	saml-user-property-mapper
ecba20d7-4726-4424-89ab-2bdf544265b6	7b566fef-2052-4f11-adca-8cc6a5931047	allowed-protocol-mapper-types	oidc-sha256-pairwise-sub-mapper
0f653756-a4f0-46be-8e35-c88a6e95cd56	767d2132-9970-45da-875a-728519ec72e8	max-clients	200
ca29f4d6-04c5-4c2c-a072-61ccb27966b9	009dc0cb-765e-4508-81fe-d0c2ff031aba	allow-default-scopes	true
1f7566a2-6b57-49f5-849f-5a0ff4701d68	c931d6f8-5a26-41fe-a626-94c2f3021c5c	allow-default-scopes	true
d37ed894-dff8-47f5-b7c6-763584c2e697	80eeddae-679b-49d2-bc6e-dc803f0872e5	allowed-protocol-mapper-types	saml-role-list-mapper
3cde7ffb-7c66-4789-b43f-47550786a485	80eeddae-679b-49d2-bc6e-dc803f0872e5	allowed-protocol-mapper-types	oidc-usermodel-attribute-mapper
cdf8f805-8795-46df-bd50-f3bf7100b8a4	80eeddae-679b-49d2-bc6e-dc803f0872e5	allowed-protocol-mapper-types	saml-user-attribute-mapper
7cb01fe3-e3d6-4bf3-8f9a-736aaf5ebd4b	80eeddae-679b-49d2-bc6e-dc803f0872e5	allowed-protocol-mapper-types	oidc-sha256-pairwise-sub-mapper
cbac7820-c0b4-419d-94d6-e823771e18d5	80eeddae-679b-49d2-bc6e-dc803f0872e5	allowed-protocol-mapper-types	oidc-address-mapper
225aeceb-7e11-4e60-b584-3a367f39cf9b	80eeddae-679b-49d2-bc6e-dc803f0872e5	allowed-protocol-mapper-types	saml-user-property-mapper
2a789826-9341-4b87-8d2b-ed1d33bb1845	80eeddae-679b-49d2-bc6e-dc803f0872e5	allowed-protocol-mapper-types	oidc-usermodel-property-mapper
d3f18a7b-ae6a-4172-9e5e-90bfd0dfa906	80eeddae-679b-49d2-bc6e-dc803f0872e5	allowed-protocol-mapper-types	oidc-full-name-mapper
46a3799c-aa54-47ca-9743-5f55ec3a643e	3fa10bf5-c4c2-4100-beff-e5e5ea21fbfe	client-uris-must-match	true
6e28988a-b430-4d9f-8db6-1824a1d405bd	3fa10bf5-c4c2-4100-beff-e5e5ea21fbfe	host-sending-registration-request-must-match	true
\.


--
-- Data for Name: composite_role; Type: TABLE DATA; Schema: public; Owner: keycloak
--

COPY public.composite_role (composite, child_role) FROM stdin;
fdda8650-93bd-4ef4-a6f0-a1b3335084cc	b90267a3-2206-4719-8a2b-3b7b4e835057
fdda8650-93bd-4ef4-a6f0-a1b3335084cc	63f21f4f-a8f6-4cec-971d-f4bee5f9f866
fdda8650-93bd-4ef4-a6f0-a1b3335084cc	00d43f3b-79e7-4ea7-9f8b-b1bba9044b50
fdda8650-93bd-4ef4-a6f0-a1b3335084cc	61154b78-eeca-49d3-91a2-f402172d43d5
fdda8650-93bd-4ef4-a6f0-a1b3335084cc	2bb3b3ed-8483-4c7c-88a0-4a7d6391c60d
fdda8650-93bd-4ef4-a6f0-a1b3335084cc	c3c4bd3e-c62a-489b-a36b-e8bd47dc1f8a
fdda8650-93bd-4ef4-a6f0-a1b3335084cc	50245363-c9a8-40ca-b9dc-1b83bb010a6c
fdda8650-93bd-4ef4-a6f0-a1b3335084cc	f75ea275-2d25-4578-acf3-506194d7b2a7
fdda8650-93bd-4ef4-a6f0-a1b3335084cc	d15cbc08-7c56-46b9-9756-6913fa762b3f
fdda8650-93bd-4ef4-a6f0-a1b3335084cc	69c8c097-29a1-4a11-85ed-bff7d5acd497
fdda8650-93bd-4ef4-a6f0-a1b3335084cc	80ec89e9-4b06-43d1-9792-67c6a22c6fba
fdda8650-93bd-4ef4-a6f0-a1b3335084cc	a72cc808-47a5-4896-ba31-523ee4fc6b4e
fdda8650-93bd-4ef4-a6f0-a1b3335084cc	8bb15d8e-0208-4eb4-9e29-70f2a3d33fd5
fdda8650-93bd-4ef4-a6f0-a1b3335084cc	6333b327-3414-4544-bde5-734507757f26
fdda8650-93bd-4ef4-a6f0-a1b3335084cc	6a8583a2-d0a5-43ea-9891-9e809bb080d0
fdda8650-93bd-4ef4-a6f0-a1b3335084cc	1da8a33c-78d3-41a0-8a96-b6fa4a2f15c2
fdda8650-93bd-4ef4-a6f0-a1b3335084cc	39267745-dd8f-4dc8-82e0-c22862461ff3
fdda8650-93bd-4ef4-a6f0-a1b3335084cc	024fd900-1e22-4fdd-92b4-dba992930eac
2085ed59-03e6-4a5f-ace6-2ef054404862	9d2ae9ec-e181-4760-9f8c-67b72c674c04
2bb3b3ed-8483-4c7c-88a0-4a7d6391c60d	1da8a33c-78d3-41a0-8a96-b6fa4a2f15c2
61154b78-eeca-49d3-91a2-f402172d43d5	6a8583a2-d0a5-43ea-9891-9e809bb080d0
61154b78-eeca-49d3-91a2-f402172d43d5	024fd900-1e22-4fdd-92b4-dba992930eac
2085ed59-03e6-4a5f-ace6-2ef054404862	a000e09d-b6ed-4bd9-b272-d59544815cda
a000e09d-b6ed-4bd9-b272-d59544815cda	3efdde28-ce0a-4d3d-94f5-3ee2af1ad10e
9092a030-4750-45d1-9c93-5f583a3d4eac	0fb976a5-02c3-4665-8e79-f33ab9b303cb
fdda8650-93bd-4ef4-a6f0-a1b3335084cc	a1a028f8-a840-4e30-9676-fa4678822487
2085ed59-03e6-4a5f-ace6-2ef054404862	37cc39a1-f76f-4e60-9adb-4bd3c82546e9
2085ed59-03e6-4a5f-ace6-2ef054404862	a22a36bd-80e0-4014-85ff-3365f19571ce
fdda8650-93bd-4ef4-a6f0-a1b3335084cc	1936228d-5862-409c-a4f5-21047d01d071
fdda8650-93bd-4ef4-a6f0-a1b3335084cc	d21cbda3-85de-46f7-a155-b5fa8a650551
fdda8650-93bd-4ef4-a6f0-a1b3335084cc	488e5184-286d-4a09-8984-e5e18559444f
fdda8650-93bd-4ef4-a6f0-a1b3335084cc	ab15c588-64cb-4fcb-a73e-76bcfa52ce3d
fdda8650-93bd-4ef4-a6f0-a1b3335084cc	b4ff58f9-782e-49e3-895e-6e96b3e064ec
fdda8650-93bd-4ef4-a6f0-a1b3335084cc	9108dd2d-ffbe-4a2b-869d-b436fd4f28f4
fdda8650-93bd-4ef4-a6f0-a1b3335084cc	95f01605-cd80-4701-99c6-a848a93f8864
fdda8650-93bd-4ef4-a6f0-a1b3335084cc	25e71cd3-de55-4127-8650-e5393a725379
fdda8650-93bd-4ef4-a6f0-a1b3335084cc	48f63132-a46a-44c0-b16f-52b52f681ab1
fdda8650-93bd-4ef4-a6f0-a1b3335084cc	a67be111-26f9-4138-b23c-63c46f61669d
fdda8650-93bd-4ef4-a6f0-a1b3335084cc	006bc68c-155b-4aea-8570-107f5fe15ad0
fdda8650-93bd-4ef4-a6f0-a1b3335084cc	24ce9836-6f4a-4220-8b3d-cb4428ff6345
fdda8650-93bd-4ef4-a6f0-a1b3335084cc	563c9c9e-55db-481c-8948-1374791f6d28
fdda8650-93bd-4ef4-a6f0-a1b3335084cc	d32093a0-df45-4bf0-8b75-a6729bc93a5d
fdda8650-93bd-4ef4-a6f0-a1b3335084cc	31bf2f60-54ca-4933-919a-efccdfbfbf09
fdda8650-93bd-4ef4-a6f0-a1b3335084cc	681fcb52-e769-43a9-987e-e2c9a3578f77
fdda8650-93bd-4ef4-a6f0-a1b3335084cc	dcae9340-ceab-4079-8b0f-b1e169e908a9
488e5184-286d-4a09-8984-e5e18559444f	d32093a0-df45-4bf0-8b75-a6729bc93a5d
488e5184-286d-4a09-8984-e5e18559444f	dcae9340-ceab-4079-8b0f-b1e169e908a9
ab15c588-64cb-4fcb-a73e-76bcfa52ce3d	31bf2f60-54ca-4933-919a-efccdfbfbf09
c083318a-e6fd-4f87-9a4b-b6ee816c3e2e	3907b8bf-077c-4881-b1c6-2445f157e924
c083318a-e6fd-4f87-9a4b-b6ee816c3e2e	10fd7db6-ba7c-4640-b0b6-055bf55100bb
c083318a-e6fd-4f87-9a4b-b6ee816c3e2e	be17e22f-c976-4a2f-927e-2fad89857889
c083318a-e6fd-4f87-9a4b-b6ee816c3e2e	1c761568-7fc7-4cd6-8563-ca70ad95f97b
c083318a-e6fd-4f87-9a4b-b6ee816c3e2e	42c654c2-38ac-48cf-bee6-49ffc3cc01d7
c083318a-e6fd-4f87-9a4b-b6ee816c3e2e	4092956c-3968-445f-b774-f2d9d0048745
c083318a-e6fd-4f87-9a4b-b6ee816c3e2e	6ba799f6-f2a0-4484-8251-b5752cc0eb4d
c083318a-e6fd-4f87-9a4b-b6ee816c3e2e	be9470dd-fa53-4609-a1c6-40ec1b461cba
c083318a-e6fd-4f87-9a4b-b6ee816c3e2e	397e508f-cba5-42d4-af09-71d37e85a369
c083318a-e6fd-4f87-9a4b-b6ee816c3e2e	98c30502-7458-4b80-9794-515f79946f1a
c083318a-e6fd-4f87-9a4b-b6ee816c3e2e	35573b81-407d-41bc-8c94-90a865000445
c083318a-e6fd-4f87-9a4b-b6ee816c3e2e	019601f7-b5d5-4782-8af6-ab753ee96ee4
c083318a-e6fd-4f87-9a4b-b6ee816c3e2e	42996e92-ee45-4aec-adaf-afb7a533434e
c083318a-e6fd-4f87-9a4b-b6ee816c3e2e	f68c9aaa-27ae-4731-90fa-28b97b25d9b8
c083318a-e6fd-4f87-9a4b-b6ee816c3e2e	6fdf8b20-a63b-453d-a6c4-dc2eaa080bec
c083318a-e6fd-4f87-9a4b-b6ee816c3e2e	8d77632b-5d46-4a88-a78a-86a6ba594a51
c083318a-e6fd-4f87-9a4b-b6ee816c3e2e	64bc28f1-a378-4c1c-93fb-97175e16057e
1c761568-7fc7-4cd6-8563-ca70ad95f97b	6fdf8b20-a63b-453d-a6c4-dc2eaa080bec
616b357d-93ce-4ad0-9175-96cf9fbc6800	8fea7d4f-8980-4f9f-8f27-193a03d956e5
be17e22f-c976-4a2f-927e-2fad89857889	f68c9aaa-27ae-4731-90fa-28b97b25d9b8
be17e22f-c976-4a2f-927e-2fad89857889	64bc28f1-a378-4c1c-93fb-97175e16057e
616b357d-93ce-4ad0-9175-96cf9fbc6800	5f8c1fd3-5ee3-432f-a174-d5225157ead8
5f8c1fd3-5ee3-432f-a174-d5225157ead8	25281e7d-942f-4b29-9ace-488c88cf43d3
75bac620-1f4e-46f4-8168-cec7cfd04686	252cfe54-0c6f-4c47-a1aa-2da76bf4ce2b
fdda8650-93bd-4ef4-a6f0-a1b3335084cc	1f2c8799-9e0d-4a23-980f-2b63eb215847
c083318a-e6fd-4f87-9a4b-b6ee816c3e2e	dfcded6d-1ee6-4795-be8d-545c0a8198e8
616b357d-93ce-4ad0-9175-96cf9fbc6800	eaaf6668-f479-4aa9-a9aa-b88c253925ff
616b357d-93ce-4ad0-9175-96cf9fbc6800	9c4878d6-bf9c-4b8a-a636-0f99b0eca277
\.


--
-- Data for Name: credential; Type: TABLE DATA; Schema: public; Owner: keycloak
--

COPY public.credential (id, salt, type, user_id, created_date, user_label, secret_data, credential_data, priority) FROM stdin;
5006e6d0-403c-444c-9240-51b7ff944e9c	\N	password	6f90abf4-c385-4319-a759-27915e2c7b36	1704444638996	\N	{"value":"9CYlA4vFkTCl/QdRPyL8AJ0CEH29W2HZk9G8fUn71K0=","salt":"1ynt+MbWRSWNV/IbtT/bwQ==","additionalParameters":{}}	{"hashIterations":27500,"algorithm":"pbkdf2-sha256","additionalParameters":{}}	10
44080c48-20d7-4329-86b9-39388e4813f7	\N	password	df8e2cd0-047c-4022-b0d2-926382d17bb0	1704444845458	My password	{"value":"RseunlOdjkX303mlPBq3nJoSe4Od4e5viI9d25zqQi8=","salt":"Ge/AN/QtyzS9Uj0irdLC0w==","additionalParameters":{}}	{"hashIterations":27500,"algorithm":"pbkdf2-sha256","additionalParameters":{}}	10
\.


--
-- Data for Name: databasechangelog; Type: TABLE DATA; Schema: public; Owner: keycloak
--

COPY public.databasechangelog (id, author, filename, dateexecuted, orderexecuted, exectype, md5sum, description, comments, tag, liquibase, contexts, labels, deployment_id) FROM stdin;
1.0.0.Final-KEYCLOAK-5461	sthorger@redhat.com	META-INF/jpa-changelog-1.0.0.Final.xml	2024-01-05 08:50:32.436117	1	EXECUTED	9:6f1016664e21e16d26517a4418f5e3df	createTable tableName=APPLICATION_DEFAULT_ROLES; createTable tableName=CLIENT; createTable tableName=CLIENT_SESSION; createTable tableName=CLIENT_SESSION_ROLE; createTable tableName=COMPOSITE_ROLE; createTable tableName=CREDENTIAL; createTable tab...		\N	4.23.2	\N	\N	4444631456
1.0.0.Final-KEYCLOAK-5461	sthorger@redhat.com	META-INF/db2-jpa-changelog-1.0.0.Final.xml	2024-01-05 08:50:32.515397	2	MARK_RAN	9:828775b1596a07d1200ba1d49e5e3941	createTable tableName=APPLICATION_DEFAULT_ROLES; createTable tableName=CLIENT; createTable tableName=CLIENT_SESSION; createTable tableName=CLIENT_SESSION_ROLE; createTable tableName=COMPOSITE_ROLE; createTable tableName=CREDENTIAL; createTable tab...		\N	4.23.2	\N	\N	4444631456
1.1.0.Beta1	sthorger@redhat.com	META-INF/jpa-changelog-1.1.0.Beta1.xml	2024-01-05 08:50:32.584921	3	EXECUTED	9:5f090e44a7d595883c1fb61f4b41fd38	delete tableName=CLIENT_SESSION_ROLE; delete tableName=CLIENT_SESSION; delete tableName=USER_SESSION; createTable tableName=CLIENT_ATTRIBUTES; createTable tableName=CLIENT_SESSION_NOTE; createTable tableName=APP_NODE_REGISTRATIONS; addColumn table...		\N	4.23.2	\N	\N	4444631456
1.1.0.Final	sthorger@redhat.com	META-INF/jpa-changelog-1.1.0.Final.xml	2024-01-05 08:50:32.593411	4	EXECUTED	9:c07e577387a3d2c04d1adc9aaad8730e	renameColumn newColumnName=EVENT_TIME, oldColumnName=TIME, tableName=EVENT_ENTITY		\N	4.23.2	\N	\N	4444631456
1.2.0.Beta1	psilva@redhat.com	META-INF/jpa-changelog-1.2.0.Beta1.xml	2024-01-05 08:50:32.741147	5	EXECUTED	9:b68ce996c655922dbcd2fe6b6ae72686	delete tableName=CLIENT_SESSION_ROLE; delete tableName=CLIENT_SESSION_NOTE; delete tableName=CLIENT_SESSION; delete tableName=USER_SESSION; createTable tableName=PROTOCOL_MAPPER; createTable tableName=PROTOCOL_MAPPER_CONFIG; createTable tableName=...		\N	4.23.2	\N	\N	4444631456
1.2.0.Beta1	psilva@redhat.com	META-INF/db2-jpa-changelog-1.2.0.Beta1.xml	2024-01-05 08:50:32.767219	6	MARK_RAN	9:543b5c9989f024fe35c6f6c5a97de88e	delete tableName=CLIENT_SESSION_ROLE; delete tableName=CLIENT_SESSION_NOTE; delete tableName=CLIENT_SESSION; delete tableName=USER_SESSION; createTable tableName=PROTOCOL_MAPPER; createTable tableName=PROTOCOL_MAPPER_CONFIG; createTable tableName=...		\N	4.23.2	\N	\N	4444631456
1.2.0.RC1	bburke@redhat.com	META-INF/jpa-changelog-1.2.0.CR1.xml	2024-01-05 08:50:32.924388	7	EXECUTED	9:765afebbe21cf5bbca048e632df38336	delete tableName=CLIENT_SESSION_ROLE; delete tableName=CLIENT_SESSION_NOTE; delete tableName=CLIENT_SESSION; delete tableName=USER_SESSION_NOTE; delete tableName=USER_SESSION; createTable tableName=MIGRATION_MODEL; createTable tableName=IDENTITY_P...		\N	4.23.2	\N	\N	4444631456
1.2.0.RC1	bburke@redhat.com	META-INF/db2-jpa-changelog-1.2.0.CR1.xml	2024-01-05 08:50:32.951981	8	MARK_RAN	9:db4a145ba11a6fdaefb397f6dbf829a1	delete tableName=CLIENT_SESSION_ROLE; delete tableName=CLIENT_SESSION_NOTE; delete tableName=CLIENT_SESSION; delete tableName=USER_SESSION_NOTE; delete tableName=USER_SESSION; createTable tableName=MIGRATION_MODEL; createTable tableName=IDENTITY_P...		\N	4.23.2	\N	\N	4444631456
1.2.0.Final	keycloak	META-INF/jpa-changelog-1.2.0.Final.xml	2024-01-05 08:50:32.962214	9	EXECUTED	9:9d05c7be10cdb873f8bcb41bc3a8ab23	update tableName=CLIENT; update tableName=CLIENT; update tableName=CLIENT		\N	4.23.2	\N	\N	4444631456
1.3.0	bburke@redhat.com	META-INF/jpa-changelog-1.3.0.xml	2024-01-05 08:50:33.233607	10	EXECUTED	9:18593702353128d53111f9b1ff0b82b8	delete tableName=CLIENT_SESSION_ROLE; delete tableName=CLIENT_SESSION_PROT_MAPPER; delete tableName=CLIENT_SESSION_NOTE; delete tableName=CLIENT_SESSION; delete tableName=USER_SESSION_NOTE; delete tableName=USER_SESSION; createTable tableName=ADMI...		\N	4.23.2	\N	\N	4444631456
1.4.0	bburke@redhat.com	META-INF/jpa-changelog-1.4.0.xml	2024-01-05 08:50:33.308656	11	EXECUTED	9:6122efe5f090e41a85c0f1c9e52cbb62	delete tableName=CLIENT_SESSION_AUTH_STATUS; delete tableName=CLIENT_SESSION_ROLE; delete tableName=CLIENT_SESSION_PROT_MAPPER; delete tableName=CLIENT_SESSION_NOTE; delete tableName=CLIENT_SESSION; delete tableName=USER_SESSION_NOTE; delete table...		\N	4.23.2	\N	\N	4444631456
1.4.0	bburke@redhat.com	META-INF/db2-jpa-changelog-1.4.0.xml	2024-01-05 08:50:33.32935	12	MARK_RAN	9:e1ff28bf7568451453f844c5d54bb0b5	delete tableName=CLIENT_SESSION_AUTH_STATUS; delete tableName=CLIENT_SESSION_ROLE; delete tableName=CLIENT_SESSION_PROT_MAPPER; delete tableName=CLIENT_SESSION_NOTE; delete tableName=CLIENT_SESSION; delete tableName=USER_SESSION_NOTE; delete table...		\N	4.23.2	\N	\N	4444631456
1.5.0	bburke@redhat.com	META-INF/jpa-changelog-1.5.0.xml	2024-01-05 08:50:33.356401	13	EXECUTED	9:7af32cd8957fbc069f796b61217483fd	delete tableName=CLIENT_SESSION_AUTH_STATUS; delete tableName=CLIENT_SESSION_ROLE; delete tableName=CLIENT_SESSION_PROT_MAPPER; delete tableName=CLIENT_SESSION_NOTE; delete tableName=CLIENT_SESSION; delete tableName=USER_SESSION_NOTE; delete table...		\N	4.23.2	\N	\N	4444631456
1.6.1_from15	mposolda@redhat.com	META-INF/jpa-changelog-1.6.1.xml	2024-01-05 08:50:33.377836	14	EXECUTED	9:6005e15e84714cd83226bf7879f54190	addColumn tableName=REALM; addColumn tableName=KEYCLOAK_ROLE; addColumn tableName=CLIENT; createTable tableName=OFFLINE_USER_SESSION; createTable tableName=OFFLINE_CLIENT_SESSION; addPrimaryKey constraintName=CONSTRAINT_OFFL_US_SES_PK2, tableName=...		\N	4.23.2	\N	\N	4444631456
1.6.1_from16-pre	mposolda@redhat.com	META-INF/jpa-changelog-1.6.1.xml	2024-01-05 08:50:33.379898	15	MARK_RAN	9:bf656f5a2b055d07f314431cae76f06c	delete tableName=OFFLINE_CLIENT_SESSION; delete tableName=OFFLINE_USER_SESSION		\N	4.23.2	\N	\N	4444631456
1.6.1_from16	mposolda@redhat.com	META-INF/jpa-changelog-1.6.1.xml	2024-01-05 08:50:33.384192	16	MARK_RAN	9:f8dadc9284440469dcf71e25ca6ab99b	dropPrimaryKey constraintName=CONSTRAINT_OFFLINE_US_SES_PK, tableName=OFFLINE_USER_SESSION; dropPrimaryKey constraintName=CONSTRAINT_OFFLINE_CL_SES_PK, tableName=OFFLINE_CLIENT_SESSION; addColumn tableName=OFFLINE_USER_SESSION; update tableName=OF...		\N	4.23.2	\N	\N	4444631456
1.6.1	mposolda@redhat.com	META-INF/jpa-changelog-1.6.1.xml	2024-01-05 08:50:33.387486	17	EXECUTED	9:d41d8cd98f00b204e9800998ecf8427e	empty		\N	4.23.2	\N	\N	4444631456
1.7.0	bburke@redhat.com	META-INF/jpa-changelog-1.7.0.xml	2024-01-05 08:50:33.442435	18	EXECUTED	9:3368ff0be4c2855ee2dd9ca813b38d8e	createTable tableName=KEYCLOAK_GROUP; createTable tableName=GROUP_ROLE_MAPPING; createTable tableName=GROUP_ATTRIBUTE; createTable tableName=USER_GROUP_MEMBERSHIP; createTable tableName=REALM_DEFAULT_GROUPS; addColumn tableName=IDENTITY_PROVIDER; ...		\N	4.23.2	\N	\N	4444631456
1.8.0	mposolda@redhat.com	META-INF/jpa-changelog-1.8.0.xml	2024-01-05 08:50:33.503332	19	EXECUTED	9:8ac2fb5dd030b24c0570a763ed75ed20	addColumn tableName=IDENTITY_PROVIDER; createTable tableName=CLIENT_TEMPLATE; createTable tableName=CLIENT_TEMPLATE_ATTRIBUTES; createTable tableName=TEMPLATE_SCOPE_MAPPING; dropNotNullConstraint columnName=CLIENT_ID, tableName=PROTOCOL_MAPPER; ad...		\N	4.23.2	\N	\N	4444631456
1.8.0-2	keycloak	META-INF/jpa-changelog-1.8.0.xml	2024-01-05 08:50:33.509473	20	EXECUTED	9:f91ddca9b19743db60e3057679810e6c	dropDefaultValue columnName=ALGORITHM, tableName=CREDENTIAL; update tableName=CREDENTIAL		\N	4.23.2	\N	\N	4444631456
1.8.0	mposolda@redhat.com	META-INF/db2-jpa-changelog-1.8.0.xml	2024-01-05 08:50:33.521122	21	MARK_RAN	9:831e82914316dc8a57dc09d755f23c51	addColumn tableName=IDENTITY_PROVIDER; createTable tableName=CLIENT_TEMPLATE; createTable tableName=CLIENT_TEMPLATE_ATTRIBUTES; createTable tableName=TEMPLATE_SCOPE_MAPPING; dropNotNullConstraint columnName=CLIENT_ID, tableName=PROTOCOL_MAPPER; ad...		\N	4.23.2	\N	\N	4444631456
1.8.0-2	keycloak	META-INF/db2-jpa-changelog-1.8.0.xml	2024-01-05 08:50:33.526384	22	MARK_RAN	9:f91ddca9b19743db60e3057679810e6c	dropDefaultValue columnName=ALGORITHM, tableName=CREDENTIAL; update tableName=CREDENTIAL		\N	4.23.2	\N	\N	4444631456
1.9.0	mposolda@redhat.com	META-INF/jpa-changelog-1.9.0.xml	2024-01-05 08:50:33.556295	23	EXECUTED	9:bc3d0f9e823a69dc21e23e94c7a94bb1	update tableName=REALM; update tableName=REALM; update tableName=REALM; update tableName=REALM; update tableName=CREDENTIAL; update tableName=CREDENTIAL; update tableName=CREDENTIAL; update tableName=REALM; update tableName=REALM; customChange; dr...		\N	4.23.2	\N	\N	4444631456
1.9.1	keycloak	META-INF/jpa-changelog-1.9.1.xml	2024-01-05 08:50:33.563914	24	EXECUTED	9:c9999da42f543575ab790e76439a2679	modifyDataType columnName=PRIVATE_KEY, tableName=REALM; modifyDataType columnName=PUBLIC_KEY, tableName=REALM; modifyDataType columnName=CERTIFICATE, tableName=REALM		\N	4.23.2	\N	\N	4444631456
1.9.1	keycloak	META-INF/db2-jpa-changelog-1.9.1.xml	2024-01-05 08:50:33.566088	25	MARK_RAN	9:0d6c65c6f58732d81569e77b10ba301d	modifyDataType columnName=PRIVATE_KEY, tableName=REALM; modifyDataType columnName=CERTIFICATE, tableName=REALM		\N	4.23.2	\N	\N	4444631456
1.9.2	keycloak	META-INF/jpa-changelog-1.9.2.xml	2024-01-05 08:50:33.604916	26	EXECUTED	9:fc576660fc016ae53d2d4778d84d86d0	createIndex indexName=IDX_USER_EMAIL, tableName=USER_ENTITY; createIndex indexName=IDX_USER_ROLE_MAPPING, tableName=USER_ROLE_MAPPING; createIndex indexName=IDX_USER_GROUP_MAPPING, tableName=USER_GROUP_MEMBERSHIP; createIndex indexName=IDX_USER_CO...		\N	4.23.2	\N	\N	4444631456
authz-2.0.0	psilva@redhat.com	META-INF/jpa-changelog-authz-2.0.0.xml	2024-01-05 08:50:33.690464	27	EXECUTED	9:43ed6b0da89ff77206289e87eaa9c024	createTable tableName=RESOURCE_SERVER; addPrimaryKey constraintName=CONSTRAINT_FARS, tableName=RESOURCE_SERVER; addUniqueConstraint constraintName=UK_AU8TT6T700S9V50BU18WS5HA6, tableName=RESOURCE_SERVER; createTable tableName=RESOURCE_SERVER_RESOU...		\N	4.23.2	\N	\N	4444631456
authz-2.5.1	psilva@redhat.com	META-INF/jpa-changelog-authz-2.5.1.xml	2024-01-05 08:50:33.695737	28	EXECUTED	9:44bae577f551b3738740281eceb4ea70	update tableName=RESOURCE_SERVER_POLICY		\N	4.23.2	\N	\N	4444631456
2.1.0-KEYCLOAK-5461	bburke@redhat.com	META-INF/jpa-changelog-2.1.0.xml	2024-01-05 08:50:33.756197	29	EXECUTED	9:bd88e1f833df0420b01e114533aee5e8	createTable tableName=BROKER_LINK; createTable tableName=FED_USER_ATTRIBUTE; createTable tableName=FED_USER_CONSENT; createTable tableName=FED_USER_CONSENT_ROLE; createTable tableName=FED_USER_CONSENT_PROT_MAPPER; createTable tableName=FED_USER_CR...		\N	4.23.2	\N	\N	4444631456
2.2.0	bburke@redhat.com	META-INF/jpa-changelog-2.2.0.xml	2024-01-05 08:50:33.770129	30	EXECUTED	9:a7022af5267f019d020edfe316ef4371	addColumn tableName=ADMIN_EVENT_ENTITY; createTable tableName=CREDENTIAL_ATTRIBUTE; createTable tableName=FED_CREDENTIAL_ATTRIBUTE; modifyDataType columnName=VALUE, tableName=CREDENTIAL; addForeignKeyConstraint baseTableName=FED_CREDENTIAL_ATTRIBU...		\N	4.23.2	\N	\N	4444631456
2.3.0	bburke@redhat.com	META-INF/jpa-changelog-2.3.0.xml	2024-01-05 08:50:33.788169	31	EXECUTED	9:fc155c394040654d6a79227e56f5e25a	createTable tableName=FEDERATED_USER; addPrimaryKey constraintName=CONSTR_FEDERATED_USER, tableName=FEDERATED_USER; dropDefaultValue columnName=TOTP, tableName=USER_ENTITY; dropColumn columnName=TOTP, tableName=USER_ENTITY; addColumn tableName=IDE...		\N	4.23.2	\N	\N	4444631456
2.4.0	bburke@redhat.com	META-INF/jpa-changelog-2.4.0.xml	2024-01-05 08:50:33.79369	32	EXECUTED	9:eac4ffb2a14795e5dc7b426063e54d88	customChange		\N	4.23.2	\N	\N	4444631456
2.5.0	bburke@redhat.com	META-INF/jpa-changelog-2.5.0.xml	2024-01-05 08:50:33.800966	33	EXECUTED	9:54937c05672568c4c64fc9524c1e9462	customChange; modifyDataType columnName=USER_ID, tableName=OFFLINE_USER_SESSION		\N	4.23.2	\N	\N	4444631456
2.5.0-unicode-oracle	hmlnarik@redhat.com	META-INF/jpa-changelog-2.5.0.xml	2024-01-05 08:50:33.804844	34	MARK_RAN	9:3a32bace77c84d7678d035a7f5a8084e	modifyDataType columnName=DESCRIPTION, tableName=AUTHENTICATION_FLOW; modifyDataType columnName=DESCRIPTION, tableName=CLIENT_TEMPLATE; modifyDataType columnName=DESCRIPTION, tableName=RESOURCE_SERVER_POLICY; modifyDataType columnName=DESCRIPTION,...		\N	4.23.2	\N	\N	4444631456
2.5.0-unicode-other-dbs	hmlnarik@redhat.com	META-INF/jpa-changelog-2.5.0.xml	2024-01-05 08:50:33.848493	35	EXECUTED	9:33d72168746f81f98ae3a1e8e0ca3554	modifyDataType columnName=DESCRIPTION, tableName=AUTHENTICATION_FLOW; modifyDataType columnName=DESCRIPTION, tableName=CLIENT_TEMPLATE; modifyDataType columnName=DESCRIPTION, tableName=RESOURCE_SERVER_POLICY; modifyDataType columnName=DESCRIPTION,...		\N	4.23.2	\N	\N	4444631456
2.5.0-duplicate-email-support	slawomir@dabek.name	META-INF/jpa-changelog-2.5.0.xml	2024-01-05 08:50:33.853996	36	EXECUTED	9:61b6d3d7a4c0e0024b0c839da283da0c	addColumn tableName=REALM		\N	4.23.2	\N	\N	4444631456
2.5.0-unique-group-names	hmlnarik@redhat.com	META-INF/jpa-changelog-2.5.0.xml	2024-01-05 08:50:33.860538	37	EXECUTED	9:8dcac7bdf7378e7d823cdfddebf72fda	addUniqueConstraint constraintName=SIBLING_NAMES, tableName=KEYCLOAK_GROUP		\N	4.23.2	\N	\N	4444631456
2.5.1	bburke@redhat.com	META-INF/jpa-changelog-2.5.1.xml	2024-01-05 08:50:33.865567	38	EXECUTED	9:a2b870802540cb3faa72098db5388af3	addColumn tableName=FED_USER_CONSENT		\N	4.23.2	\N	\N	4444631456
3.0.0	bburke@redhat.com	META-INF/jpa-changelog-3.0.0.xml	2024-01-05 08:50:33.86992	39	EXECUTED	9:132a67499ba24bcc54fb5cbdcfe7e4c0	addColumn tableName=IDENTITY_PROVIDER		\N	4.23.2	\N	\N	4444631456
3.2.0-fix	keycloak	META-INF/jpa-changelog-3.2.0.xml	2024-01-05 08:50:33.871567	40	MARK_RAN	9:938f894c032f5430f2b0fafb1a243462	addNotNullConstraint columnName=REALM_ID, tableName=CLIENT_INITIAL_ACCESS		\N	4.23.2	\N	\N	4444631456
3.2.0-fix-with-keycloak-5416	keycloak	META-INF/jpa-changelog-3.2.0.xml	2024-01-05 08:50:33.874936	41	MARK_RAN	9:845c332ff1874dc5d35974b0babf3006	dropIndex indexName=IDX_CLIENT_INIT_ACC_REALM, tableName=CLIENT_INITIAL_ACCESS; addNotNullConstraint columnName=REALM_ID, tableName=CLIENT_INITIAL_ACCESS; createIndex indexName=IDX_CLIENT_INIT_ACC_REALM, tableName=CLIENT_INITIAL_ACCESS		\N	4.23.2	\N	\N	4444631456
3.2.0-fix-offline-sessions	hmlnarik	META-INF/jpa-changelog-3.2.0.xml	2024-01-05 08:50:33.87967	42	EXECUTED	9:fc86359c079781adc577c5a217e4d04c	customChange		\N	4.23.2	\N	\N	4444631456
3.2.0-fixed	keycloak	META-INF/jpa-changelog-3.2.0.xml	2024-01-05 08:50:34.102753	43	EXECUTED	9:59a64800e3c0d09b825f8a3b444fa8f4	addColumn tableName=REALM; dropPrimaryKey constraintName=CONSTRAINT_OFFL_CL_SES_PK2, tableName=OFFLINE_CLIENT_SESSION; dropColumn columnName=CLIENT_SESSION_ID, tableName=OFFLINE_CLIENT_SESSION; addPrimaryKey constraintName=CONSTRAINT_OFFL_CL_SES_P...		\N	4.23.2	\N	\N	4444631456
3.3.0	keycloak	META-INF/jpa-changelog-3.3.0.xml	2024-01-05 08:50:34.109794	44	EXECUTED	9:d48d6da5c6ccf667807f633fe489ce88	addColumn tableName=USER_ENTITY		\N	4.23.2	\N	\N	4444631456
authz-3.4.0.CR1-resource-server-pk-change-part1	glavoie@gmail.com	META-INF/jpa-changelog-authz-3.4.0.CR1.xml	2024-01-05 08:50:34.118527	45	EXECUTED	9:dde36f7973e80d71fceee683bc5d2951	addColumn tableName=RESOURCE_SERVER_POLICY; addColumn tableName=RESOURCE_SERVER_RESOURCE; addColumn tableName=RESOURCE_SERVER_SCOPE		\N	4.23.2	\N	\N	4444631456
authz-3.4.0.CR1-resource-server-pk-change-part2-KEYCLOAK-6095	hmlnarik@redhat.com	META-INF/jpa-changelog-authz-3.4.0.CR1.xml	2024-01-05 08:50:34.126451	46	EXECUTED	9:b855e9b0a406b34fa323235a0cf4f640	customChange		\N	4.23.2	\N	\N	4444631456
authz-3.4.0.CR1-resource-server-pk-change-part3-fixed	glavoie@gmail.com	META-INF/jpa-changelog-authz-3.4.0.CR1.xml	2024-01-05 08:50:34.130038	47	MARK_RAN	9:51abbacd7b416c50c4421a8cabf7927e	dropIndex indexName=IDX_RES_SERV_POL_RES_SERV, tableName=RESOURCE_SERVER_POLICY; dropIndex indexName=IDX_RES_SRV_RES_RES_SRV, tableName=RESOURCE_SERVER_RESOURCE; dropIndex indexName=IDX_RES_SRV_SCOPE_RES_SRV, tableName=RESOURCE_SERVER_SCOPE		\N	4.23.2	\N	\N	4444631456
authz-3.4.0.CR1-resource-server-pk-change-part3-fixed-nodropindex	glavoie@gmail.com	META-INF/jpa-changelog-authz-3.4.0.CR1.xml	2024-01-05 08:50:34.188859	48	EXECUTED	9:bdc99e567b3398bac83263d375aad143	addNotNullConstraint columnName=RESOURCE_SERVER_CLIENT_ID, tableName=RESOURCE_SERVER_POLICY; addNotNullConstraint columnName=RESOURCE_SERVER_CLIENT_ID, tableName=RESOURCE_SERVER_RESOURCE; addNotNullConstraint columnName=RESOURCE_SERVER_CLIENT_ID, ...		\N	4.23.2	\N	\N	4444631456
authn-3.4.0.CR1-refresh-token-max-reuse	glavoie@gmail.com	META-INF/jpa-changelog-authz-3.4.0.CR1.xml	2024-01-05 08:50:34.195219	49	EXECUTED	9:d198654156881c46bfba39abd7769e69	addColumn tableName=REALM		\N	4.23.2	\N	\N	4444631456
3.4.0	keycloak	META-INF/jpa-changelog-3.4.0.xml	2024-01-05 08:50:34.239566	50	EXECUTED	9:cfdd8736332ccdd72c5256ccb42335db	addPrimaryKey constraintName=CONSTRAINT_REALM_DEFAULT_ROLES, tableName=REALM_DEFAULT_ROLES; addPrimaryKey constraintName=CONSTRAINT_COMPOSITE_ROLE, tableName=COMPOSITE_ROLE; addPrimaryKey constraintName=CONSTR_REALM_DEFAULT_GROUPS, tableName=REALM...		\N	4.23.2	\N	\N	4444631456
3.4.0-KEYCLOAK-5230	hmlnarik@redhat.com	META-INF/jpa-changelog-3.4.0.xml	2024-01-05 08:50:34.270494	51	EXECUTED	9:7c84de3d9bd84d7f077607c1a4dcb714	createIndex indexName=IDX_FU_ATTRIBUTE, tableName=FED_USER_ATTRIBUTE; createIndex indexName=IDX_FU_CONSENT, tableName=FED_USER_CONSENT; createIndex indexName=IDX_FU_CONSENT_RU, tableName=FED_USER_CONSENT; createIndex indexName=IDX_FU_CREDENTIAL, t...		\N	4.23.2	\N	\N	4444631456
3.4.1	psilva@redhat.com	META-INF/jpa-changelog-3.4.1.xml	2024-01-05 08:50:34.273939	52	EXECUTED	9:5a6bb36cbefb6a9d6928452c0852af2d	modifyDataType columnName=VALUE, tableName=CLIENT_ATTRIBUTES		\N	4.23.2	\N	\N	4444631456
3.4.2	keycloak	META-INF/jpa-changelog-3.4.2.xml	2024-01-05 08:50:34.277266	53	EXECUTED	9:8f23e334dbc59f82e0a328373ca6ced0	update tableName=REALM		\N	4.23.2	\N	\N	4444631456
3.4.2-KEYCLOAK-5172	mkanis@redhat.com	META-INF/jpa-changelog-3.4.2.xml	2024-01-05 08:50:34.281045	54	EXECUTED	9:9156214268f09d970cdf0e1564d866af	update tableName=CLIENT		\N	4.23.2	\N	\N	4444631456
4.0.0-KEYCLOAK-6335	bburke@redhat.com	META-INF/jpa-changelog-4.0.0.xml	2024-01-05 08:50:34.291281	55	EXECUTED	9:db806613b1ed154826c02610b7dbdf74	createTable tableName=CLIENT_AUTH_FLOW_BINDINGS; addPrimaryKey constraintName=C_CLI_FLOW_BIND, tableName=CLIENT_AUTH_FLOW_BINDINGS		\N	4.23.2	\N	\N	4444631456
4.0.0-CLEANUP-UNUSED-TABLE	bburke@redhat.com	META-INF/jpa-changelog-4.0.0.xml	2024-01-05 08:50:34.296593	56	EXECUTED	9:229a041fb72d5beac76bb94a5fa709de	dropTable tableName=CLIENT_IDENTITY_PROV_MAPPING		\N	4.23.2	\N	\N	4444631456
4.0.0-KEYCLOAK-6228	bburke@redhat.com	META-INF/jpa-changelog-4.0.0.xml	2024-01-05 08:50:34.321573	57	EXECUTED	9:079899dade9c1e683f26b2aa9ca6ff04	dropUniqueConstraint constraintName=UK_JKUWUVD56ONTGSUHOGM8UEWRT, tableName=USER_CONSENT; dropNotNullConstraint columnName=CLIENT_ID, tableName=USER_CONSENT; addColumn tableName=USER_CONSENT; addUniqueConstraint constraintName=UK_JKUWUVD56ONTGSUHO...		\N	4.23.2	\N	\N	4444631456
4.0.0-KEYCLOAK-5579-fixed	mposolda@redhat.com	META-INF/jpa-changelog-4.0.0.xml	2024-01-05 08:50:34.496719	58	EXECUTED	9:139b79bcbbfe903bb1c2d2a4dbf001d9	dropForeignKeyConstraint baseTableName=CLIENT_TEMPLATE_ATTRIBUTES, constraintName=FK_CL_TEMPL_ATTR_TEMPL; renameTable newTableName=CLIENT_SCOPE_ATTRIBUTES, oldTableName=CLIENT_TEMPLATE_ATTRIBUTES; renameColumn newColumnName=SCOPE_ID, oldColumnName...		\N	4.23.2	\N	\N	4444631456
authz-4.0.0.CR1	psilva@redhat.com	META-INF/jpa-changelog-authz-4.0.0.CR1.xml	2024-01-05 08:50:34.548577	59	EXECUTED	9:b55738ad889860c625ba2bf483495a04	createTable tableName=RESOURCE_SERVER_PERM_TICKET; addPrimaryKey constraintName=CONSTRAINT_FAPMT, tableName=RESOURCE_SERVER_PERM_TICKET; addForeignKeyConstraint baseTableName=RESOURCE_SERVER_PERM_TICKET, constraintName=FK_FRSRHO213XCX4WNKOG82SSPMT...		\N	4.23.2	\N	\N	4444631456
authz-4.0.0.Beta3	psilva@redhat.com	META-INF/jpa-changelog-authz-4.0.0.Beta3.xml	2024-01-05 08:50:34.558092	60	EXECUTED	9:e0057eac39aa8fc8e09ac6cfa4ae15fe	addColumn tableName=RESOURCE_SERVER_POLICY; addColumn tableName=RESOURCE_SERVER_PERM_TICKET; addForeignKeyConstraint baseTableName=RESOURCE_SERVER_PERM_TICKET, constraintName=FK_FRSRPO2128CX4WNKOG82SSRFY, referencedTableName=RESOURCE_SERVER_POLICY		\N	4.23.2	\N	\N	4444631456
authz-4.2.0.Final	mhajas@redhat.com	META-INF/jpa-changelog-authz-4.2.0.Final.xml	2024-01-05 08:50:34.571013	61	EXECUTED	9:42a33806f3a0443fe0e7feeec821326c	createTable tableName=RESOURCE_URIS; addForeignKeyConstraint baseTableName=RESOURCE_URIS, constraintName=FK_RESOURCE_SERVER_URIS, referencedTableName=RESOURCE_SERVER_RESOURCE; customChange; dropColumn columnName=URI, tableName=RESOURCE_SERVER_RESO...		\N	4.23.2	\N	\N	4444631456
authz-4.2.0.Final-KEYCLOAK-9944	hmlnarik@redhat.com	META-INF/jpa-changelog-authz-4.2.0.Final.xml	2024-01-05 08:50:34.581323	62	EXECUTED	9:9968206fca46eecc1f51db9c024bfe56	addPrimaryKey constraintName=CONSTRAINT_RESOUR_URIS_PK, tableName=RESOURCE_URIS		\N	4.23.2	\N	\N	4444631456
4.2.0-KEYCLOAK-6313	wadahiro@gmail.com	META-INF/jpa-changelog-4.2.0.xml	2024-01-05 08:50:34.592065	63	EXECUTED	9:92143a6daea0a3f3b8f598c97ce55c3d	addColumn tableName=REQUIRED_ACTION_PROVIDER		\N	4.23.2	\N	\N	4444631456
4.3.0-KEYCLOAK-7984	wadahiro@gmail.com	META-INF/jpa-changelog-4.3.0.xml	2024-01-05 08:50:34.600393	64	EXECUTED	9:82bab26a27195d889fb0429003b18f40	update tableName=REQUIRED_ACTION_PROVIDER		\N	4.23.2	\N	\N	4444631456
4.6.0-KEYCLOAK-7950	psilva@redhat.com	META-INF/jpa-changelog-4.6.0.xml	2024-01-05 08:50:34.614437	65	EXECUTED	9:e590c88ddc0b38b0ae4249bbfcb5abc3	update tableName=RESOURCE_SERVER_RESOURCE		\N	4.23.2	\N	\N	4444631456
4.6.0-KEYCLOAK-8377	keycloak	META-INF/jpa-changelog-4.6.0.xml	2024-01-05 08:50:34.65491	66	EXECUTED	9:5c1f475536118dbdc38d5d7977950cc0	createTable tableName=ROLE_ATTRIBUTE; addPrimaryKey constraintName=CONSTRAINT_ROLE_ATTRIBUTE_PK, tableName=ROLE_ATTRIBUTE; addForeignKeyConstraint baseTableName=ROLE_ATTRIBUTE, constraintName=FK_ROLE_ATTRIBUTE_ID, referencedTableName=KEYCLOAK_ROLE...		\N	4.23.2	\N	\N	4444631456
4.6.0-KEYCLOAK-8555	gideonray@gmail.com	META-INF/jpa-changelog-4.6.0.xml	2024-01-05 08:50:34.670068	67	EXECUTED	9:e7c9f5f9c4d67ccbbcc215440c718a17	createIndex indexName=IDX_COMPONENT_PROVIDER_TYPE, tableName=COMPONENT		\N	4.23.2	\N	\N	4444631456
4.7.0-KEYCLOAK-1267	sguilhen@redhat.com	META-INF/jpa-changelog-4.7.0.xml	2024-01-05 08:50:34.680548	68	EXECUTED	9:88e0bfdda924690d6f4e430c53447dd5	addColumn tableName=REALM		\N	4.23.2	\N	\N	4444631456
4.7.0-KEYCLOAK-7275	keycloak	META-INF/jpa-changelog-4.7.0.xml	2024-01-05 08:50:34.700551	69	EXECUTED	9:f53177f137e1c46b6a88c59ec1cb5218	renameColumn newColumnName=CREATED_ON, oldColumnName=LAST_SESSION_REFRESH, tableName=OFFLINE_USER_SESSION; addNotNullConstraint columnName=CREATED_ON, tableName=OFFLINE_USER_SESSION; addColumn tableName=OFFLINE_USER_SESSION; customChange; createIn...		\N	4.23.2	\N	\N	4444631456
4.8.0-KEYCLOAK-8835	sguilhen@redhat.com	META-INF/jpa-changelog-4.8.0.xml	2024-01-05 08:50:34.71815	70	EXECUTED	9:a74d33da4dc42a37ec27121580d1459f	addNotNullConstraint columnName=SSO_MAX_LIFESPAN_REMEMBER_ME, tableName=REALM; addNotNullConstraint columnName=SSO_IDLE_TIMEOUT_REMEMBER_ME, tableName=REALM		\N	4.23.2	\N	\N	4444631456
authz-7.0.0-KEYCLOAK-10443	psilva@redhat.com	META-INF/jpa-changelog-authz-7.0.0.xml	2024-01-05 08:50:34.727607	71	EXECUTED	9:fd4ade7b90c3b67fae0bfcfcb42dfb5f	addColumn tableName=RESOURCE_SERVER		\N	4.23.2	\N	\N	4444631456
8.0.0-adding-credential-columns	keycloak	META-INF/jpa-changelog-8.0.0.xml	2024-01-05 08:50:34.740959	72	EXECUTED	9:aa072ad090bbba210d8f18781b8cebf4	addColumn tableName=CREDENTIAL; addColumn tableName=FED_USER_CREDENTIAL		\N	4.23.2	\N	\N	4444631456
8.0.0-updating-credential-data-not-oracle-fixed	keycloak	META-INF/jpa-changelog-8.0.0.xml	2024-01-05 08:50:34.773095	73	EXECUTED	9:1ae6be29bab7c2aa376f6983b932be37	update tableName=CREDENTIAL; update tableName=CREDENTIAL; update tableName=CREDENTIAL; update tableName=FED_USER_CREDENTIAL; update tableName=FED_USER_CREDENTIAL; update tableName=FED_USER_CREDENTIAL		\N	4.23.2	\N	\N	4444631456
8.0.0-updating-credential-data-oracle-fixed	keycloak	META-INF/jpa-changelog-8.0.0.xml	2024-01-05 08:50:34.78263	74	MARK_RAN	9:14706f286953fc9a25286dbd8fb30d97	update tableName=CREDENTIAL; update tableName=CREDENTIAL; update tableName=CREDENTIAL; update tableName=FED_USER_CREDENTIAL; update tableName=FED_USER_CREDENTIAL; update tableName=FED_USER_CREDENTIAL		\N	4.23.2	\N	\N	4444631456
8.0.0-credential-cleanup-fixed	keycloak	META-INF/jpa-changelog-8.0.0.xml	2024-01-05 08:50:34.853811	75	EXECUTED	9:2b9cc12779be32c5b40e2e67711a218b	dropDefaultValue columnName=COUNTER, tableName=CREDENTIAL; dropDefaultValue columnName=DIGITS, tableName=CREDENTIAL; dropDefaultValue columnName=PERIOD, tableName=CREDENTIAL; dropDefaultValue columnName=ALGORITHM, tableName=CREDENTIAL; dropColumn ...		\N	4.23.2	\N	\N	4444631456
8.0.0-resource-tag-support	keycloak	META-INF/jpa-changelog-8.0.0.xml	2024-01-05 08:50:34.869816	76	EXECUTED	9:91fa186ce7a5af127a2d7a91ee083cc5	addColumn tableName=MIGRATION_MODEL; createIndex indexName=IDX_UPDATE_TIME, tableName=MIGRATION_MODEL		\N	4.23.2	\N	\N	4444631456
9.0.0-always-display-client	keycloak	META-INF/jpa-changelog-9.0.0.xml	2024-01-05 08:50:34.880863	77	EXECUTED	9:6335e5c94e83a2639ccd68dd24e2e5ad	addColumn tableName=CLIENT		\N	4.23.2	\N	\N	4444631456
9.0.0-drop-constraints-for-column-increase	keycloak	META-INF/jpa-changelog-9.0.0.xml	2024-01-05 08:50:34.884967	78	MARK_RAN	9:6bdb5658951e028bfe16fa0a8228b530	dropUniqueConstraint constraintName=UK_FRSR6T700S9V50BU18WS5PMT, tableName=RESOURCE_SERVER_PERM_TICKET; dropUniqueConstraint constraintName=UK_FRSR6T700S9V50BU18WS5HA6, tableName=RESOURCE_SERVER_RESOURCE; dropPrimaryKey constraintName=CONSTRAINT_O...		\N	4.23.2	\N	\N	4444631456
9.0.0-increase-column-size-federated-fk	keycloak	META-INF/jpa-changelog-9.0.0.xml	2024-01-05 08:50:34.925941	79	EXECUTED	9:d5bc15a64117ccad481ce8792d4c608f	modifyDataType columnName=CLIENT_ID, tableName=FED_USER_CONSENT; modifyDataType columnName=CLIENT_REALM_CONSTRAINT, tableName=KEYCLOAK_ROLE; modifyDataType columnName=OWNER, tableName=RESOURCE_SERVER_POLICY; modifyDataType columnName=CLIENT_ID, ta...		\N	4.23.2	\N	\N	4444631456
9.0.0-recreate-constraints-after-column-increase	keycloak	META-INF/jpa-changelog-9.0.0.xml	2024-01-05 08:50:34.937431	80	MARK_RAN	9:077cba51999515f4d3e7ad5619ab592c	addNotNullConstraint columnName=CLIENT_ID, tableName=OFFLINE_CLIENT_SESSION; addNotNullConstraint columnName=OWNER, tableName=RESOURCE_SERVER_PERM_TICKET; addNotNullConstraint columnName=REQUESTER, tableName=RESOURCE_SERVER_PERM_TICKET; addNotNull...		\N	4.23.2	\N	\N	4444631456
9.0.1-add-index-to-client.client_id	keycloak	META-INF/jpa-changelog-9.0.1.xml	2024-01-05 08:50:34.952038	81	EXECUTED	9:be969f08a163bf47c6b9e9ead8ac2afb	createIndex indexName=IDX_CLIENT_ID, tableName=CLIENT		\N	4.23.2	\N	\N	4444631456
9.0.1-KEYCLOAK-12579-drop-constraints	keycloak	META-INF/jpa-changelog-9.0.1.xml	2024-01-05 08:50:34.954506	82	MARK_RAN	9:6d3bb4408ba5a72f39bd8a0b301ec6e3	dropUniqueConstraint constraintName=SIBLING_NAMES, tableName=KEYCLOAK_GROUP		\N	4.23.2	\N	\N	4444631456
9.0.1-KEYCLOAK-12579-add-not-null-constraint	keycloak	META-INF/jpa-changelog-9.0.1.xml	2024-01-05 08:50:34.963065	83	EXECUTED	9:966bda61e46bebf3cc39518fbed52fa7	addNotNullConstraint columnName=PARENT_GROUP, tableName=KEYCLOAK_GROUP		\N	4.23.2	\N	\N	4444631456
9.0.1-KEYCLOAK-12579-recreate-constraints	keycloak	META-INF/jpa-changelog-9.0.1.xml	2024-01-05 08:50:34.965823	84	MARK_RAN	9:8dcac7bdf7378e7d823cdfddebf72fda	addUniqueConstraint constraintName=SIBLING_NAMES, tableName=KEYCLOAK_GROUP		\N	4.23.2	\N	\N	4444631456
9.0.1-add-index-to-events	keycloak	META-INF/jpa-changelog-9.0.1.xml	2024-01-05 08:50:34.976513	85	EXECUTED	9:7d93d602352a30c0c317e6a609b56599	createIndex indexName=IDX_EVENT_TIME, tableName=EVENT_ENTITY		\N	4.23.2	\N	\N	4444631456
map-remove-ri	keycloak	META-INF/jpa-changelog-11.0.0.xml	2024-01-05 08:50:34.983443	86	EXECUTED	9:71c5969e6cdd8d7b6f47cebc86d37627	dropForeignKeyConstraint baseTableName=REALM, constraintName=FK_TRAF444KK6QRKMS7N56AIWQ5Y; dropForeignKeyConstraint baseTableName=KEYCLOAK_ROLE, constraintName=FK_KJHO5LE2C0RAL09FL8CM9WFW9		\N	4.23.2	\N	\N	4444631456
map-remove-ri	keycloak	META-INF/jpa-changelog-12.0.0.xml	2024-01-05 08:50:34.995747	87	EXECUTED	9:a9ba7d47f065f041b7da856a81762021	dropForeignKeyConstraint baseTableName=REALM_DEFAULT_GROUPS, constraintName=FK_DEF_GROUPS_GROUP; dropForeignKeyConstraint baseTableName=REALM_DEFAULT_ROLES, constraintName=FK_H4WPD7W4HSOOLNI3H0SW7BTJE; dropForeignKeyConstraint baseTableName=CLIENT...		\N	4.23.2	\N	\N	4444631456
12.1.0-add-realm-localization-table	keycloak	META-INF/jpa-changelog-12.0.0.xml	2024-01-05 08:50:35.010737	88	EXECUTED	9:fffabce2bc01e1a8f5110d5278500065	createTable tableName=REALM_LOCALIZATIONS; addPrimaryKey tableName=REALM_LOCALIZATIONS		\N	4.23.2	\N	\N	4444631456
default-roles	keycloak	META-INF/jpa-changelog-13.0.0.xml	2024-01-05 08:50:35.019111	89	EXECUTED	9:fa8a5b5445e3857f4b010bafb5009957	addColumn tableName=REALM; customChange		\N	4.23.2	\N	\N	4444631456
default-roles-cleanup	keycloak	META-INF/jpa-changelog-13.0.0.xml	2024-01-05 08:50:35.028376	90	EXECUTED	9:67ac3241df9a8582d591c5ed87125f39	dropTable tableName=REALM_DEFAULT_ROLES; dropTable tableName=CLIENT_DEFAULT_ROLES		\N	4.23.2	\N	\N	4444631456
13.0.0-KEYCLOAK-16844	keycloak	META-INF/jpa-changelog-13.0.0.xml	2024-01-05 08:50:35.037735	91	EXECUTED	9:ad1194d66c937e3ffc82386c050ba089	createIndex indexName=IDX_OFFLINE_USS_PRELOAD, tableName=OFFLINE_USER_SESSION		\N	4.23.2	\N	\N	4444631456
map-remove-ri-13.0.0	keycloak	META-INF/jpa-changelog-13.0.0.xml	2024-01-05 08:50:35.048946	92	EXECUTED	9:d9be619d94af5a2f5d07b9f003543b91	dropForeignKeyConstraint baseTableName=DEFAULT_CLIENT_SCOPE, constraintName=FK_R_DEF_CLI_SCOPE_SCOPE; dropForeignKeyConstraint baseTableName=CLIENT_SCOPE_CLIENT, constraintName=FK_C_CLI_SCOPE_SCOPE; dropForeignKeyConstraint baseTableName=CLIENT_SC...		\N	4.23.2	\N	\N	4444631456
13.0.0-KEYCLOAK-17992-drop-constraints	keycloak	META-INF/jpa-changelog-13.0.0.xml	2024-01-05 08:50:35.051576	93	MARK_RAN	9:544d201116a0fcc5a5da0925fbbc3bde	dropPrimaryKey constraintName=C_CLI_SCOPE_BIND, tableName=CLIENT_SCOPE_CLIENT; dropIndex indexName=IDX_CLSCOPE_CL, tableName=CLIENT_SCOPE_CLIENT; dropIndex indexName=IDX_CL_CLSCOPE, tableName=CLIENT_SCOPE_CLIENT		\N	4.23.2	\N	\N	4444631456
13.0.0-increase-column-size-federated	keycloak	META-INF/jpa-changelog-13.0.0.xml	2024-01-05 08:50:35.064667	94	EXECUTED	9:43c0c1055b6761b4b3e89de76d612ccf	modifyDataType columnName=CLIENT_ID, tableName=CLIENT_SCOPE_CLIENT; modifyDataType columnName=SCOPE_ID, tableName=CLIENT_SCOPE_CLIENT		\N	4.23.2	\N	\N	4444631456
13.0.0-KEYCLOAK-17992-recreate-constraints	keycloak	META-INF/jpa-changelog-13.0.0.xml	2024-01-05 08:50:35.070245	95	MARK_RAN	9:8bd711fd0330f4fe980494ca43ab1139	addNotNullConstraint columnName=CLIENT_ID, tableName=CLIENT_SCOPE_CLIENT; addNotNullConstraint columnName=SCOPE_ID, tableName=CLIENT_SCOPE_CLIENT; addPrimaryKey constraintName=C_CLI_SCOPE_BIND, tableName=CLIENT_SCOPE_CLIENT; createIndex indexName=...		\N	4.23.2	\N	\N	4444631456
json-string-accomodation-fixed	keycloak	META-INF/jpa-changelog-13.0.0.xml	2024-01-05 08:50:35.078206	96	EXECUTED	9:e07d2bc0970c348bb06fb63b1f82ddbf	addColumn tableName=REALM_ATTRIBUTE; update tableName=REALM_ATTRIBUTE; dropColumn columnName=VALUE, tableName=REALM_ATTRIBUTE; renameColumn newColumnName=VALUE, oldColumnName=VALUE_NEW, tableName=REALM_ATTRIBUTE		\N	4.23.2	\N	\N	4444631456
14.0.0-KEYCLOAK-11019	keycloak	META-INF/jpa-changelog-14.0.0.xml	2024-01-05 08:50:35.096603	97	EXECUTED	9:24fb8611e97f29989bea412aa38d12b7	createIndex indexName=IDX_OFFLINE_CSS_PRELOAD, tableName=OFFLINE_CLIENT_SESSION; createIndex indexName=IDX_OFFLINE_USS_BY_USER, tableName=OFFLINE_USER_SESSION; createIndex indexName=IDX_OFFLINE_USS_BY_USERSESS, tableName=OFFLINE_USER_SESSION		\N	4.23.2	\N	\N	4444631456
14.0.0-KEYCLOAK-18286	keycloak	META-INF/jpa-changelog-14.0.0.xml	2024-01-05 08:50:35.09893	98	MARK_RAN	9:259f89014ce2506ee84740cbf7163aa7	createIndex indexName=IDX_CLIENT_ATT_BY_NAME_VALUE, tableName=CLIENT_ATTRIBUTES		\N	4.23.2	\N	\N	4444631456
14.0.0-KEYCLOAK-18286-revert	keycloak	META-INF/jpa-changelog-14.0.0.xml	2024-01-05 08:50:35.11322	99	MARK_RAN	9:04baaf56c116ed19951cbc2cca584022	dropIndex indexName=IDX_CLIENT_ATT_BY_NAME_VALUE, tableName=CLIENT_ATTRIBUTES		\N	4.23.2	\N	\N	4444631456
14.0.0-KEYCLOAK-18286-supported-dbs	keycloak	META-INF/jpa-changelog-14.0.0.xml	2024-01-05 08:50:35.127384	100	EXECUTED	9:60ca84a0f8c94ec8c3504a5a3bc88ee8	createIndex indexName=IDX_CLIENT_ATT_BY_NAME_VALUE, tableName=CLIENT_ATTRIBUTES		\N	4.23.2	\N	\N	4444631456
14.0.0-KEYCLOAK-18286-unsupported-dbs	keycloak	META-INF/jpa-changelog-14.0.0.xml	2024-01-05 08:50:35.130085	101	MARK_RAN	9:d3d977031d431db16e2c181ce49d73e9	createIndex indexName=IDX_CLIENT_ATT_BY_NAME_VALUE, tableName=CLIENT_ATTRIBUTES		\N	4.23.2	\N	\N	4444631456
KEYCLOAK-17267-add-index-to-user-attributes	keycloak	META-INF/jpa-changelog-14.0.0.xml	2024-01-05 08:50:35.139655	102	EXECUTED	9:0b305d8d1277f3a89a0a53a659ad274c	createIndex indexName=IDX_USER_ATTRIBUTE_NAME, tableName=USER_ATTRIBUTE		\N	4.23.2	\N	\N	4444631456
KEYCLOAK-18146-add-saml-art-binding-identifier	keycloak	META-INF/jpa-changelog-14.0.0.xml	2024-01-05 08:50:35.145075	103	EXECUTED	9:2c374ad2cdfe20e2905a84c8fac48460	customChange		\N	4.23.2	\N	\N	4444631456
15.0.0-KEYCLOAK-18467	keycloak	META-INF/jpa-changelog-15.0.0.xml	2024-01-05 08:50:35.154085	104	EXECUTED	9:47a760639ac597360a8219f5b768b4de	addColumn tableName=REALM_LOCALIZATIONS; update tableName=REALM_LOCALIZATIONS; dropColumn columnName=TEXTS, tableName=REALM_LOCALIZATIONS; renameColumn newColumnName=TEXTS, oldColumnName=TEXTS_NEW, tableName=REALM_LOCALIZATIONS; addNotNullConstrai...		\N	4.23.2	\N	\N	4444631456
17.0.0-9562	keycloak	META-INF/jpa-changelog-17.0.0.xml	2024-01-05 08:50:35.163983	105	EXECUTED	9:a6272f0576727dd8cad2522335f5d99e	createIndex indexName=IDX_USER_SERVICE_ACCOUNT, tableName=USER_ENTITY		\N	4.23.2	\N	\N	4444631456
18.0.0-10625-IDX_ADMIN_EVENT_TIME	keycloak	META-INF/jpa-changelog-18.0.0.xml	2024-01-05 08:50:35.172909	106	EXECUTED	9:015479dbd691d9cc8669282f4828c41d	createIndex indexName=IDX_ADMIN_EVENT_TIME, tableName=ADMIN_EVENT_ENTITY		\N	4.23.2	\N	\N	4444631456
19.0.0-10135	keycloak	META-INF/jpa-changelog-19.0.0.xml	2024-01-05 08:50:35.179897	107	EXECUTED	9:9518e495fdd22f78ad6425cc30630221	customChange		\N	4.23.2	\N	\N	4444631456
20.0.0-12964-supported-dbs	keycloak	META-INF/jpa-changelog-20.0.0.xml	2024-01-05 08:50:35.193699	108	EXECUTED	9:e5f243877199fd96bcc842f27a1656ac	createIndex indexName=IDX_GROUP_ATT_BY_NAME_VALUE, tableName=GROUP_ATTRIBUTE		\N	4.23.2	\N	\N	4444631456
20.0.0-12964-unsupported-dbs	keycloak	META-INF/jpa-changelog-20.0.0.xml	2024-01-05 08:50:35.197054	109	MARK_RAN	9:1a6fcaa85e20bdeae0a9ce49b41946a5	createIndex indexName=IDX_GROUP_ATT_BY_NAME_VALUE, tableName=GROUP_ATTRIBUTE		\N	4.23.2	\N	\N	4444631456
client-attributes-string-accomodation-fixed	keycloak	META-INF/jpa-changelog-20.0.0.xml	2024-01-05 08:50:35.211794	110	EXECUTED	9:3f332e13e90739ed0c35b0b25b7822ca	addColumn tableName=CLIENT_ATTRIBUTES; update tableName=CLIENT_ATTRIBUTES; dropColumn columnName=VALUE, tableName=CLIENT_ATTRIBUTES; renameColumn newColumnName=VALUE, oldColumnName=VALUE_NEW, tableName=CLIENT_ATTRIBUTES		\N	4.23.2	\N	\N	4444631456
21.0.2-17277	keycloak	META-INF/jpa-changelog-21.0.2.xml	2024-01-05 08:50:35.217367	111	EXECUTED	9:7ee1f7a3fb8f5588f171fb9a6ab623c0	customChange		\N	4.23.2	\N	\N	4444631456
21.1.0-19404	keycloak	META-INF/jpa-changelog-21.1.0.xml	2024-01-05 08:50:35.254103	112	EXECUTED	9:3d7e830b52f33676b9d64f7f2b2ea634	modifyDataType columnName=DECISION_STRATEGY, tableName=RESOURCE_SERVER_POLICY; modifyDataType columnName=LOGIC, tableName=RESOURCE_SERVER_POLICY; modifyDataType columnName=POLICY_ENFORCE_MODE, tableName=RESOURCE_SERVER		\N	4.23.2	\N	\N	4444631456
21.1.0-19404-2	keycloak	META-INF/jpa-changelog-21.1.0.xml	2024-01-05 08:50:35.258872	113	MARK_RAN	9:627d032e3ef2c06c0e1f73d2ae25c26c	addColumn tableName=RESOURCE_SERVER_POLICY; update tableName=RESOURCE_SERVER_POLICY; dropColumn columnName=DECISION_STRATEGY, tableName=RESOURCE_SERVER_POLICY; renameColumn newColumnName=DECISION_STRATEGY, oldColumnName=DECISION_STRATEGY_NEW, tabl...		\N	4.23.2	\N	\N	4444631456
22.0.0-17484-updated	keycloak	META-INF/jpa-changelog-22.0.0.xml	2024-01-05 08:50:35.267133	114	EXECUTED	9:90af0bfd30cafc17b9f4d6eccd92b8b3	customChange		\N	4.23.2	\N	\N	4444631456
22.0.5-24031	keycloak	META-INF/jpa-changelog-22.0.0.xml	2024-01-05 08:50:35.270802	115	MARK_RAN	9:a60d2d7b315ec2d3eba9e2f145f9df28	customChange		\N	4.23.2	\N	\N	4444631456
23.0.0-12062	keycloak	META-INF/jpa-changelog-23.0.0.xml	2024-01-05 08:50:35.280911	116	EXECUTED	9:2168fbe728fec46ae9baf15bf80927b8	addColumn tableName=COMPONENT_CONFIG; update tableName=COMPONENT_CONFIG; dropColumn columnName=VALUE, tableName=COMPONENT_CONFIG; renameColumn newColumnName=VALUE, oldColumnName=VALUE_NEW, tableName=COMPONENT_CONFIG		\N	4.23.2	\N	\N	4444631456
23.0.0-17258	keycloak	META-INF/jpa-changelog-23.0.0.xml	2024-01-05 08:50:35.285762	117	EXECUTED	9:36506d679a83bbfda85a27ea1864dca8	addColumn tableName=EVENT_ENTITY		\N	4.23.2	\N	\N	4444631456
\.


--
-- Data for Name: databasechangeloglock; Type: TABLE DATA; Schema: public; Owner: keycloak
--

COPY public.databasechangeloglock (id, locked, lockgranted, lockedby) FROM stdin;
1	f	\N	\N
1000	f	\N	\N
1001	f	\N	\N
\.


--
-- Data for Name: default_client_scope; Type: TABLE DATA; Schema: public; Owner: keycloak
--

COPY public.default_client_scope (realm_id, scope_id, default_scope) FROM stdin;
e9abe5f8-460d-41ff-a21e-ada47aba8547	b27475e7-bc97-4aaa-986d-fac2200372af	f
e9abe5f8-460d-41ff-a21e-ada47aba8547	ff7c30aa-546f-4612-b991-80ebf2f55ca9	t
e9abe5f8-460d-41ff-a21e-ada47aba8547	32386eee-7165-46c5-b136-92b0c042c694	t
e9abe5f8-460d-41ff-a21e-ada47aba8547	c7a7e7e2-ab91-4a83-bd60-c00c17b53a46	t
e9abe5f8-460d-41ff-a21e-ada47aba8547	c6307d2f-4a15-4630-8d8f-638088435cac	f
e9abe5f8-460d-41ff-a21e-ada47aba8547	95f43eac-8ecf-44e3-92dd-75f1941e132f	f
e9abe5f8-460d-41ff-a21e-ada47aba8547	8771c695-3f76-4e73-a6af-2e2ea861384c	t
e9abe5f8-460d-41ff-a21e-ada47aba8547	97c4ec94-4f7c-4bfc-bc5c-d3b7e32bf5df	t
e9abe5f8-460d-41ff-a21e-ada47aba8547	f714f310-507b-44a3-8f8d-8851b53dbddb	f
e9abe5f8-460d-41ff-a21e-ada47aba8547	5f2e54f5-e7ab-4db7-8207-13e79d067d59	t
8ba89cf8-e84c-4cca-b865-2802d8b005ca	d5e376af-2796-4d01-b231-276cfd97fa55	f
8ba89cf8-e84c-4cca-b865-2802d8b005ca	0b96651f-8dc8-4237-9f82-373fb09cdb09	t
8ba89cf8-e84c-4cca-b865-2802d8b005ca	4c065ba4-a674-438b-98bd-7f70c56fbad9	t
8ba89cf8-e84c-4cca-b865-2802d8b005ca	9d5da259-7833-4638-84d8-86c0bfb66c0d	t
8ba89cf8-e84c-4cca-b865-2802d8b005ca	d0e805c6-1ff4-436d-9232-d62815f93f3d	f
8ba89cf8-e84c-4cca-b865-2802d8b005ca	bb8517ac-ab0d-4649-ae68-8a1868a1088c	f
8ba89cf8-e84c-4cca-b865-2802d8b005ca	4cbae6de-22b0-466b-af25-812a8258aee6	t
8ba89cf8-e84c-4cca-b865-2802d8b005ca	ab0c4e03-f2a1-4989-80c8-29b3018ad9e9	t
8ba89cf8-e84c-4cca-b865-2802d8b005ca	aaa15b45-2eae-4a31-83e0-f843c1d40f2a	f
8ba89cf8-e84c-4cca-b865-2802d8b005ca	d9502030-29c4-480e-9ec2-6c89f903c656	t
\.


--
-- Data for Name: event_entity; Type: TABLE DATA; Schema: public; Owner: keycloak
--

COPY public.event_entity (id, client_id, details_json, error, ip_address, realm_id, session_id, event_time, type, user_id, details_json_long_value) FROM stdin;
\.


--
-- Data for Name: fed_user_attribute; Type: TABLE DATA; Schema: public; Owner: keycloak
--

COPY public.fed_user_attribute (id, name, user_id, realm_id, storage_provider_id, value) FROM stdin;
\.


--
-- Data for Name: fed_user_consent; Type: TABLE DATA; Schema: public; Owner: keycloak
--

COPY public.fed_user_consent (id, client_id, user_id, realm_id, storage_provider_id, created_date, last_updated_date, client_storage_provider, external_client_id) FROM stdin;
\.


--
-- Data for Name: fed_user_consent_cl_scope; Type: TABLE DATA; Schema: public; Owner: keycloak
--

COPY public.fed_user_consent_cl_scope (user_consent_id, scope_id) FROM stdin;
\.


--
-- Data for Name: fed_user_credential; Type: TABLE DATA; Schema: public; Owner: keycloak
--

COPY public.fed_user_credential (id, salt, type, created_date, user_id, realm_id, storage_provider_id, user_label, secret_data, credential_data, priority) FROM stdin;
\.


--
-- Data for Name: fed_user_group_membership; Type: TABLE DATA; Schema: public; Owner: keycloak
--

COPY public.fed_user_group_membership (group_id, user_id, realm_id, storage_provider_id) FROM stdin;
\.


--
-- Data for Name: fed_user_required_action; Type: TABLE DATA; Schema: public; Owner: keycloak
--

COPY public.fed_user_required_action (required_action, user_id, realm_id, storage_provider_id) FROM stdin;
\.


--
-- Data for Name: fed_user_role_mapping; Type: TABLE DATA; Schema: public; Owner: keycloak
--

COPY public.fed_user_role_mapping (role_id, user_id, realm_id, storage_provider_id) FROM stdin;
\.


--
-- Data for Name: federated_identity; Type: TABLE DATA; Schema: public; Owner: keycloak
--

COPY public.federated_identity (identity_provider, realm_id, federated_user_id, federated_username, token, user_id) FROM stdin;
\.


--
-- Data for Name: federated_user; Type: TABLE DATA; Schema: public; Owner: keycloak
--

COPY public.federated_user (id, storage_provider_id, realm_id) FROM stdin;
\.


--
-- Data for Name: group_attribute; Type: TABLE DATA; Schema: public; Owner: keycloak
--

COPY public.group_attribute (id, name, value, group_id) FROM stdin;
\.


--
-- Data for Name: group_role_mapping; Type: TABLE DATA; Schema: public; Owner: keycloak
--

COPY public.group_role_mapping (role_id, group_id) FROM stdin;
\.


--
-- Data for Name: identity_provider; Type: TABLE DATA; Schema: public; Owner: keycloak
--

COPY public.identity_provider (internal_id, enabled, provider_alias, provider_id, store_token, authenticate_by_default, realm_id, add_token_role, trust_email, first_broker_login_flow_id, post_broker_login_flow_id, provider_display_name, link_only) FROM stdin;
\.


--
-- Data for Name: identity_provider_config; Type: TABLE DATA; Schema: public; Owner: keycloak
--

COPY public.identity_provider_config (identity_provider_id, value, name) FROM stdin;
\.


--
-- Data for Name: identity_provider_mapper; Type: TABLE DATA; Schema: public; Owner: keycloak
--

COPY public.identity_provider_mapper (id, name, idp_alias, idp_mapper_name, realm_id) FROM stdin;
\.


--
-- Data for Name: idp_mapper_config; Type: TABLE DATA; Schema: public; Owner: keycloak
--

COPY public.idp_mapper_config (idp_mapper_id, value, name) FROM stdin;
\.


--
-- Data for Name: keycloak_group; Type: TABLE DATA; Schema: public; Owner: keycloak
--

COPY public.keycloak_group (id, name, parent_group, realm_id) FROM stdin;
\.


--
-- Data for Name: keycloak_role; Type: TABLE DATA; Schema: public; Owner: keycloak
--

COPY public.keycloak_role (id, client_realm_constraint, client_role, description, name, realm_id, client, realm) FROM stdin;
2085ed59-03e6-4a5f-ace6-2ef054404862	e9abe5f8-460d-41ff-a21e-ada47aba8547	f	${role_default-roles}	default-roles-master	e9abe5f8-460d-41ff-a21e-ada47aba8547	\N	\N
b90267a3-2206-4719-8a2b-3b7b4e835057	e9abe5f8-460d-41ff-a21e-ada47aba8547	f	${role_create-realm}	create-realm	e9abe5f8-460d-41ff-a21e-ada47aba8547	\N	\N
fdda8650-93bd-4ef4-a6f0-a1b3335084cc	e9abe5f8-460d-41ff-a21e-ada47aba8547	f	${role_admin}	admin	e9abe5f8-460d-41ff-a21e-ada47aba8547	\N	\N
63f21f4f-a8f6-4cec-971d-f4bee5f9f866	49c6ffbf-1b8b-4a50-9d56-cb24f14c7764	t	${role_create-client}	create-client	e9abe5f8-460d-41ff-a21e-ada47aba8547	49c6ffbf-1b8b-4a50-9d56-cb24f14c7764	\N
00d43f3b-79e7-4ea7-9f8b-b1bba9044b50	49c6ffbf-1b8b-4a50-9d56-cb24f14c7764	t	${role_view-realm}	view-realm	e9abe5f8-460d-41ff-a21e-ada47aba8547	49c6ffbf-1b8b-4a50-9d56-cb24f14c7764	\N
61154b78-eeca-49d3-91a2-f402172d43d5	49c6ffbf-1b8b-4a50-9d56-cb24f14c7764	t	${role_view-users}	view-users	e9abe5f8-460d-41ff-a21e-ada47aba8547	49c6ffbf-1b8b-4a50-9d56-cb24f14c7764	\N
2bb3b3ed-8483-4c7c-88a0-4a7d6391c60d	49c6ffbf-1b8b-4a50-9d56-cb24f14c7764	t	${role_view-clients}	view-clients	e9abe5f8-460d-41ff-a21e-ada47aba8547	49c6ffbf-1b8b-4a50-9d56-cb24f14c7764	\N
c3c4bd3e-c62a-489b-a36b-e8bd47dc1f8a	49c6ffbf-1b8b-4a50-9d56-cb24f14c7764	t	${role_view-events}	view-events	e9abe5f8-460d-41ff-a21e-ada47aba8547	49c6ffbf-1b8b-4a50-9d56-cb24f14c7764	\N
50245363-c9a8-40ca-b9dc-1b83bb010a6c	49c6ffbf-1b8b-4a50-9d56-cb24f14c7764	t	${role_view-identity-providers}	view-identity-providers	e9abe5f8-460d-41ff-a21e-ada47aba8547	49c6ffbf-1b8b-4a50-9d56-cb24f14c7764	\N
f75ea275-2d25-4578-acf3-506194d7b2a7	49c6ffbf-1b8b-4a50-9d56-cb24f14c7764	t	${role_view-authorization}	view-authorization	e9abe5f8-460d-41ff-a21e-ada47aba8547	49c6ffbf-1b8b-4a50-9d56-cb24f14c7764	\N
d15cbc08-7c56-46b9-9756-6913fa762b3f	49c6ffbf-1b8b-4a50-9d56-cb24f14c7764	t	${role_manage-realm}	manage-realm	e9abe5f8-460d-41ff-a21e-ada47aba8547	49c6ffbf-1b8b-4a50-9d56-cb24f14c7764	\N
69c8c097-29a1-4a11-85ed-bff7d5acd497	49c6ffbf-1b8b-4a50-9d56-cb24f14c7764	t	${role_manage-users}	manage-users	e9abe5f8-460d-41ff-a21e-ada47aba8547	49c6ffbf-1b8b-4a50-9d56-cb24f14c7764	\N
80ec89e9-4b06-43d1-9792-67c6a22c6fba	49c6ffbf-1b8b-4a50-9d56-cb24f14c7764	t	${role_manage-clients}	manage-clients	e9abe5f8-460d-41ff-a21e-ada47aba8547	49c6ffbf-1b8b-4a50-9d56-cb24f14c7764	\N
a72cc808-47a5-4896-ba31-523ee4fc6b4e	49c6ffbf-1b8b-4a50-9d56-cb24f14c7764	t	${role_manage-events}	manage-events	e9abe5f8-460d-41ff-a21e-ada47aba8547	49c6ffbf-1b8b-4a50-9d56-cb24f14c7764	\N
8bb15d8e-0208-4eb4-9e29-70f2a3d33fd5	49c6ffbf-1b8b-4a50-9d56-cb24f14c7764	t	${role_manage-identity-providers}	manage-identity-providers	e9abe5f8-460d-41ff-a21e-ada47aba8547	49c6ffbf-1b8b-4a50-9d56-cb24f14c7764	\N
6333b327-3414-4544-bde5-734507757f26	49c6ffbf-1b8b-4a50-9d56-cb24f14c7764	t	${role_manage-authorization}	manage-authorization	e9abe5f8-460d-41ff-a21e-ada47aba8547	49c6ffbf-1b8b-4a50-9d56-cb24f14c7764	\N
6a8583a2-d0a5-43ea-9891-9e809bb080d0	49c6ffbf-1b8b-4a50-9d56-cb24f14c7764	t	${role_query-users}	query-users	e9abe5f8-460d-41ff-a21e-ada47aba8547	49c6ffbf-1b8b-4a50-9d56-cb24f14c7764	\N
1da8a33c-78d3-41a0-8a96-b6fa4a2f15c2	49c6ffbf-1b8b-4a50-9d56-cb24f14c7764	t	${role_query-clients}	query-clients	e9abe5f8-460d-41ff-a21e-ada47aba8547	49c6ffbf-1b8b-4a50-9d56-cb24f14c7764	\N
39267745-dd8f-4dc8-82e0-c22862461ff3	49c6ffbf-1b8b-4a50-9d56-cb24f14c7764	t	${role_query-realms}	query-realms	e9abe5f8-460d-41ff-a21e-ada47aba8547	49c6ffbf-1b8b-4a50-9d56-cb24f14c7764	\N
024fd900-1e22-4fdd-92b4-dba992930eac	49c6ffbf-1b8b-4a50-9d56-cb24f14c7764	t	${role_query-groups}	query-groups	e9abe5f8-460d-41ff-a21e-ada47aba8547	49c6ffbf-1b8b-4a50-9d56-cb24f14c7764	\N
9d2ae9ec-e181-4760-9f8c-67b72c674c04	65ae636c-d85e-4b1b-9b7f-3cce1fcc3372	t	${role_view-profile}	view-profile	e9abe5f8-460d-41ff-a21e-ada47aba8547	65ae636c-d85e-4b1b-9b7f-3cce1fcc3372	\N
a000e09d-b6ed-4bd9-b272-d59544815cda	65ae636c-d85e-4b1b-9b7f-3cce1fcc3372	t	${role_manage-account}	manage-account	e9abe5f8-460d-41ff-a21e-ada47aba8547	65ae636c-d85e-4b1b-9b7f-3cce1fcc3372	\N
3efdde28-ce0a-4d3d-94f5-3ee2af1ad10e	65ae636c-d85e-4b1b-9b7f-3cce1fcc3372	t	${role_manage-account-links}	manage-account-links	e9abe5f8-460d-41ff-a21e-ada47aba8547	65ae636c-d85e-4b1b-9b7f-3cce1fcc3372	\N
84c93f35-a382-429f-8bbc-bbcd20bc097d	65ae636c-d85e-4b1b-9b7f-3cce1fcc3372	t	${role_view-applications}	view-applications	e9abe5f8-460d-41ff-a21e-ada47aba8547	65ae636c-d85e-4b1b-9b7f-3cce1fcc3372	\N
0fb976a5-02c3-4665-8e79-f33ab9b303cb	65ae636c-d85e-4b1b-9b7f-3cce1fcc3372	t	${role_view-consent}	view-consent	e9abe5f8-460d-41ff-a21e-ada47aba8547	65ae636c-d85e-4b1b-9b7f-3cce1fcc3372	\N
9092a030-4750-45d1-9c93-5f583a3d4eac	65ae636c-d85e-4b1b-9b7f-3cce1fcc3372	t	${role_manage-consent}	manage-consent	e9abe5f8-460d-41ff-a21e-ada47aba8547	65ae636c-d85e-4b1b-9b7f-3cce1fcc3372	\N
0e803c45-99fd-4cb2-8372-cca4f5fa250f	65ae636c-d85e-4b1b-9b7f-3cce1fcc3372	t	${role_view-groups}	view-groups	e9abe5f8-460d-41ff-a21e-ada47aba8547	65ae636c-d85e-4b1b-9b7f-3cce1fcc3372	\N
a994dd46-0652-473d-9b2f-949867b1aeb6	65ae636c-d85e-4b1b-9b7f-3cce1fcc3372	t	${role_delete-account}	delete-account	e9abe5f8-460d-41ff-a21e-ada47aba8547	65ae636c-d85e-4b1b-9b7f-3cce1fcc3372	\N
79c0d240-adef-4dde-80c8-9964ff392d6f	14d22350-9a35-455b-8f76-0c35e8916cab	t	${role_read-token}	read-token	e9abe5f8-460d-41ff-a21e-ada47aba8547	14d22350-9a35-455b-8f76-0c35e8916cab	\N
a1a028f8-a840-4e30-9676-fa4678822487	49c6ffbf-1b8b-4a50-9d56-cb24f14c7764	t	${role_impersonation}	impersonation	e9abe5f8-460d-41ff-a21e-ada47aba8547	49c6ffbf-1b8b-4a50-9d56-cb24f14c7764	\N
37cc39a1-f76f-4e60-9adb-4bd3c82546e9	e9abe5f8-460d-41ff-a21e-ada47aba8547	f	${role_offline-access}	offline_access	e9abe5f8-460d-41ff-a21e-ada47aba8547	\N	\N
a22a36bd-80e0-4014-85ff-3365f19571ce	e9abe5f8-460d-41ff-a21e-ada47aba8547	f	${role_uma_authorization}	uma_authorization	e9abe5f8-460d-41ff-a21e-ada47aba8547	\N	\N
616b357d-93ce-4ad0-9175-96cf9fbc6800	8ba89cf8-e84c-4cca-b865-2802d8b005ca	f	${role_default-roles}	default-roles-demo	8ba89cf8-e84c-4cca-b865-2802d8b005ca	\N	\N
1936228d-5862-409c-a4f5-21047d01d071	e4739f42-b559-4aa1-bd67-667487da932b	t	${role_create-client}	create-client	e9abe5f8-460d-41ff-a21e-ada47aba8547	e4739f42-b559-4aa1-bd67-667487da932b	\N
d21cbda3-85de-46f7-a155-b5fa8a650551	e4739f42-b559-4aa1-bd67-667487da932b	t	${role_view-realm}	view-realm	e9abe5f8-460d-41ff-a21e-ada47aba8547	e4739f42-b559-4aa1-bd67-667487da932b	\N
488e5184-286d-4a09-8984-e5e18559444f	e4739f42-b559-4aa1-bd67-667487da932b	t	${role_view-users}	view-users	e9abe5f8-460d-41ff-a21e-ada47aba8547	e4739f42-b559-4aa1-bd67-667487da932b	\N
ab15c588-64cb-4fcb-a73e-76bcfa52ce3d	e4739f42-b559-4aa1-bd67-667487da932b	t	${role_view-clients}	view-clients	e9abe5f8-460d-41ff-a21e-ada47aba8547	e4739f42-b559-4aa1-bd67-667487da932b	\N
b4ff58f9-782e-49e3-895e-6e96b3e064ec	e4739f42-b559-4aa1-bd67-667487da932b	t	${role_view-events}	view-events	e9abe5f8-460d-41ff-a21e-ada47aba8547	e4739f42-b559-4aa1-bd67-667487da932b	\N
9108dd2d-ffbe-4a2b-869d-b436fd4f28f4	e4739f42-b559-4aa1-bd67-667487da932b	t	${role_view-identity-providers}	view-identity-providers	e9abe5f8-460d-41ff-a21e-ada47aba8547	e4739f42-b559-4aa1-bd67-667487da932b	\N
95f01605-cd80-4701-99c6-a848a93f8864	e4739f42-b559-4aa1-bd67-667487da932b	t	${role_view-authorization}	view-authorization	e9abe5f8-460d-41ff-a21e-ada47aba8547	e4739f42-b559-4aa1-bd67-667487da932b	\N
25e71cd3-de55-4127-8650-e5393a725379	e4739f42-b559-4aa1-bd67-667487da932b	t	${role_manage-realm}	manage-realm	e9abe5f8-460d-41ff-a21e-ada47aba8547	e4739f42-b559-4aa1-bd67-667487da932b	\N
48f63132-a46a-44c0-b16f-52b52f681ab1	e4739f42-b559-4aa1-bd67-667487da932b	t	${role_manage-users}	manage-users	e9abe5f8-460d-41ff-a21e-ada47aba8547	e4739f42-b559-4aa1-bd67-667487da932b	\N
a67be111-26f9-4138-b23c-63c46f61669d	e4739f42-b559-4aa1-bd67-667487da932b	t	${role_manage-clients}	manage-clients	e9abe5f8-460d-41ff-a21e-ada47aba8547	e4739f42-b559-4aa1-bd67-667487da932b	\N
006bc68c-155b-4aea-8570-107f5fe15ad0	e4739f42-b559-4aa1-bd67-667487da932b	t	${role_manage-events}	manage-events	e9abe5f8-460d-41ff-a21e-ada47aba8547	e4739f42-b559-4aa1-bd67-667487da932b	\N
24ce9836-6f4a-4220-8b3d-cb4428ff6345	e4739f42-b559-4aa1-bd67-667487da932b	t	${role_manage-identity-providers}	manage-identity-providers	e9abe5f8-460d-41ff-a21e-ada47aba8547	e4739f42-b559-4aa1-bd67-667487da932b	\N
563c9c9e-55db-481c-8948-1374791f6d28	e4739f42-b559-4aa1-bd67-667487da932b	t	${role_manage-authorization}	manage-authorization	e9abe5f8-460d-41ff-a21e-ada47aba8547	e4739f42-b559-4aa1-bd67-667487da932b	\N
d32093a0-df45-4bf0-8b75-a6729bc93a5d	e4739f42-b559-4aa1-bd67-667487da932b	t	${role_query-users}	query-users	e9abe5f8-460d-41ff-a21e-ada47aba8547	e4739f42-b559-4aa1-bd67-667487da932b	\N
31bf2f60-54ca-4933-919a-efccdfbfbf09	e4739f42-b559-4aa1-bd67-667487da932b	t	${role_query-clients}	query-clients	e9abe5f8-460d-41ff-a21e-ada47aba8547	e4739f42-b559-4aa1-bd67-667487da932b	\N
681fcb52-e769-43a9-987e-e2c9a3578f77	e4739f42-b559-4aa1-bd67-667487da932b	t	${role_query-realms}	query-realms	e9abe5f8-460d-41ff-a21e-ada47aba8547	e4739f42-b559-4aa1-bd67-667487da932b	\N
dcae9340-ceab-4079-8b0f-b1e169e908a9	e4739f42-b559-4aa1-bd67-667487da932b	t	${role_query-groups}	query-groups	e9abe5f8-460d-41ff-a21e-ada47aba8547	e4739f42-b559-4aa1-bd67-667487da932b	\N
c083318a-e6fd-4f87-9a4b-b6ee816c3e2e	55b6b6c9-aa79-495a-987e-ea7ad4e555af	t	${role_realm-admin}	realm-admin	8ba89cf8-e84c-4cca-b865-2802d8b005ca	55b6b6c9-aa79-495a-987e-ea7ad4e555af	\N
3907b8bf-077c-4881-b1c6-2445f157e924	55b6b6c9-aa79-495a-987e-ea7ad4e555af	t	${role_create-client}	create-client	8ba89cf8-e84c-4cca-b865-2802d8b005ca	55b6b6c9-aa79-495a-987e-ea7ad4e555af	\N
10fd7db6-ba7c-4640-b0b6-055bf55100bb	55b6b6c9-aa79-495a-987e-ea7ad4e555af	t	${role_view-realm}	view-realm	8ba89cf8-e84c-4cca-b865-2802d8b005ca	55b6b6c9-aa79-495a-987e-ea7ad4e555af	\N
be17e22f-c976-4a2f-927e-2fad89857889	55b6b6c9-aa79-495a-987e-ea7ad4e555af	t	${role_view-users}	view-users	8ba89cf8-e84c-4cca-b865-2802d8b005ca	55b6b6c9-aa79-495a-987e-ea7ad4e555af	\N
1c761568-7fc7-4cd6-8563-ca70ad95f97b	55b6b6c9-aa79-495a-987e-ea7ad4e555af	t	${role_view-clients}	view-clients	8ba89cf8-e84c-4cca-b865-2802d8b005ca	55b6b6c9-aa79-495a-987e-ea7ad4e555af	\N
42c654c2-38ac-48cf-bee6-49ffc3cc01d7	55b6b6c9-aa79-495a-987e-ea7ad4e555af	t	${role_view-events}	view-events	8ba89cf8-e84c-4cca-b865-2802d8b005ca	55b6b6c9-aa79-495a-987e-ea7ad4e555af	\N
4092956c-3968-445f-b774-f2d9d0048745	55b6b6c9-aa79-495a-987e-ea7ad4e555af	t	${role_view-identity-providers}	view-identity-providers	8ba89cf8-e84c-4cca-b865-2802d8b005ca	55b6b6c9-aa79-495a-987e-ea7ad4e555af	\N
6ba799f6-f2a0-4484-8251-b5752cc0eb4d	55b6b6c9-aa79-495a-987e-ea7ad4e555af	t	${role_view-authorization}	view-authorization	8ba89cf8-e84c-4cca-b865-2802d8b005ca	55b6b6c9-aa79-495a-987e-ea7ad4e555af	\N
be9470dd-fa53-4609-a1c6-40ec1b461cba	55b6b6c9-aa79-495a-987e-ea7ad4e555af	t	${role_manage-realm}	manage-realm	8ba89cf8-e84c-4cca-b865-2802d8b005ca	55b6b6c9-aa79-495a-987e-ea7ad4e555af	\N
397e508f-cba5-42d4-af09-71d37e85a369	55b6b6c9-aa79-495a-987e-ea7ad4e555af	t	${role_manage-users}	manage-users	8ba89cf8-e84c-4cca-b865-2802d8b005ca	55b6b6c9-aa79-495a-987e-ea7ad4e555af	\N
98c30502-7458-4b80-9794-515f79946f1a	55b6b6c9-aa79-495a-987e-ea7ad4e555af	t	${role_manage-clients}	manage-clients	8ba89cf8-e84c-4cca-b865-2802d8b005ca	55b6b6c9-aa79-495a-987e-ea7ad4e555af	\N
35573b81-407d-41bc-8c94-90a865000445	55b6b6c9-aa79-495a-987e-ea7ad4e555af	t	${role_manage-events}	manage-events	8ba89cf8-e84c-4cca-b865-2802d8b005ca	55b6b6c9-aa79-495a-987e-ea7ad4e555af	\N
019601f7-b5d5-4782-8af6-ab753ee96ee4	55b6b6c9-aa79-495a-987e-ea7ad4e555af	t	${role_manage-identity-providers}	manage-identity-providers	8ba89cf8-e84c-4cca-b865-2802d8b005ca	55b6b6c9-aa79-495a-987e-ea7ad4e555af	\N
42996e92-ee45-4aec-adaf-afb7a533434e	55b6b6c9-aa79-495a-987e-ea7ad4e555af	t	${role_manage-authorization}	manage-authorization	8ba89cf8-e84c-4cca-b865-2802d8b005ca	55b6b6c9-aa79-495a-987e-ea7ad4e555af	\N
f68c9aaa-27ae-4731-90fa-28b97b25d9b8	55b6b6c9-aa79-495a-987e-ea7ad4e555af	t	${role_query-users}	query-users	8ba89cf8-e84c-4cca-b865-2802d8b005ca	55b6b6c9-aa79-495a-987e-ea7ad4e555af	\N
6fdf8b20-a63b-453d-a6c4-dc2eaa080bec	55b6b6c9-aa79-495a-987e-ea7ad4e555af	t	${role_query-clients}	query-clients	8ba89cf8-e84c-4cca-b865-2802d8b005ca	55b6b6c9-aa79-495a-987e-ea7ad4e555af	\N
8d77632b-5d46-4a88-a78a-86a6ba594a51	55b6b6c9-aa79-495a-987e-ea7ad4e555af	t	${role_query-realms}	query-realms	8ba89cf8-e84c-4cca-b865-2802d8b005ca	55b6b6c9-aa79-495a-987e-ea7ad4e555af	\N
64bc28f1-a378-4c1c-93fb-97175e16057e	55b6b6c9-aa79-495a-987e-ea7ad4e555af	t	${role_query-groups}	query-groups	8ba89cf8-e84c-4cca-b865-2802d8b005ca	55b6b6c9-aa79-495a-987e-ea7ad4e555af	\N
8fea7d4f-8980-4f9f-8f27-193a03d956e5	094f2c33-6332-4c44-a019-4bce38b81868	t	${role_view-profile}	view-profile	8ba89cf8-e84c-4cca-b865-2802d8b005ca	094f2c33-6332-4c44-a019-4bce38b81868	\N
5f8c1fd3-5ee3-432f-a174-d5225157ead8	094f2c33-6332-4c44-a019-4bce38b81868	t	${role_manage-account}	manage-account	8ba89cf8-e84c-4cca-b865-2802d8b005ca	094f2c33-6332-4c44-a019-4bce38b81868	\N
25281e7d-942f-4b29-9ace-488c88cf43d3	094f2c33-6332-4c44-a019-4bce38b81868	t	${role_manage-account-links}	manage-account-links	8ba89cf8-e84c-4cca-b865-2802d8b005ca	094f2c33-6332-4c44-a019-4bce38b81868	\N
eef59a15-e192-4f19-a70b-dd821c83807c	094f2c33-6332-4c44-a019-4bce38b81868	t	${role_view-applications}	view-applications	8ba89cf8-e84c-4cca-b865-2802d8b005ca	094f2c33-6332-4c44-a019-4bce38b81868	\N
252cfe54-0c6f-4c47-a1aa-2da76bf4ce2b	094f2c33-6332-4c44-a019-4bce38b81868	t	${role_view-consent}	view-consent	8ba89cf8-e84c-4cca-b865-2802d8b005ca	094f2c33-6332-4c44-a019-4bce38b81868	\N
75bac620-1f4e-46f4-8168-cec7cfd04686	094f2c33-6332-4c44-a019-4bce38b81868	t	${role_manage-consent}	manage-consent	8ba89cf8-e84c-4cca-b865-2802d8b005ca	094f2c33-6332-4c44-a019-4bce38b81868	\N
d04f34b3-37bb-4b69-bf84-4366f7ded200	094f2c33-6332-4c44-a019-4bce38b81868	t	${role_view-groups}	view-groups	8ba89cf8-e84c-4cca-b865-2802d8b005ca	094f2c33-6332-4c44-a019-4bce38b81868	\N
57252ae4-9689-41c2-8d5b-7f4eb6c3d031	094f2c33-6332-4c44-a019-4bce38b81868	t	${role_delete-account}	delete-account	8ba89cf8-e84c-4cca-b865-2802d8b005ca	094f2c33-6332-4c44-a019-4bce38b81868	\N
1f2c8799-9e0d-4a23-980f-2b63eb215847	e4739f42-b559-4aa1-bd67-667487da932b	t	${role_impersonation}	impersonation	e9abe5f8-460d-41ff-a21e-ada47aba8547	e4739f42-b559-4aa1-bd67-667487da932b	\N
dfcded6d-1ee6-4795-be8d-545c0a8198e8	55b6b6c9-aa79-495a-987e-ea7ad4e555af	t	${role_impersonation}	impersonation	8ba89cf8-e84c-4cca-b865-2802d8b005ca	55b6b6c9-aa79-495a-987e-ea7ad4e555af	\N
a4104498-b098-4fef-a7da-92d8953329e6	e3a31513-08e0-41eb-9d34-32a5adb704d1	t	${role_read-token}	read-token	8ba89cf8-e84c-4cca-b865-2802d8b005ca	e3a31513-08e0-41eb-9d34-32a5adb704d1	\N
eaaf6668-f479-4aa9-a9aa-b88c253925ff	8ba89cf8-e84c-4cca-b865-2802d8b005ca	f	${role_offline-access}	offline_access	8ba89cf8-e84c-4cca-b865-2802d8b005ca	\N	\N
9c4878d6-bf9c-4b8a-a636-0f99b0eca277	8ba89cf8-e84c-4cca-b865-2802d8b005ca	f	${role_uma_authorization}	uma_authorization	8ba89cf8-e84c-4cca-b865-2802d8b005ca	\N	\N
b5d1023e-f8a8-4ca9-adaf-2e82b50e0b40	fe9d9161-94f7-4d95-9203-a5c8df6003af	t	\N	uma_protection	8ba89cf8-e84c-4cca-b865-2802d8b005ca	fe9d9161-94f7-4d95-9203-a5c8df6003af	\N
\.


--
-- Data for Name: migration_model; Type: TABLE DATA; Schema: public; Owner: keycloak
--

COPY public.migration_model (id, version, update_time) FROM stdin;
bp19g	23.0.3	1704444635
\.


--
-- Data for Name: offline_client_session; Type: TABLE DATA; Schema: public; Owner: keycloak
--

COPY public.offline_client_session (user_session_id, client_id, offline_flag, "timestamp", data, client_storage_provider, external_client_id) FROM stdin;
\.


--
-- Data for Name: offline_user_session; Type: TABLE DATA; Schema: public; Owner: keycloak
--

COPY public.offline_user_session (user_session_id, user_id, realm_id, created_on, offline_flag, data, last_session_refresh) FROM stdin;
\.


--
-- Data for Name: policy_config; Type: TABLE DATA; Schema: public; Owner: keycloak
--

COPY public.policy_config (policy_id, name, value) FROM stdin;
\.


--
-- Data for Name: protocol_mapper; Type: TABLE DATA; Schema: public; Owner: keycloak
--

COPY public.protocol_mapper (id, name, protocol, protocol_mapper_name, client_id, client_scope_id) FROM stdin;
7798df52-f2dc-4a10-a019-a6846fe0a5d8	audience resolve	openid-connect	oidc-audience-resolve-mapper	00a76cf0-1fb3-498b-8d01-0aa773f28db1	\N
befd9fe4-a0b0-4a66-8576-be1c1f18f9bb	locale	openid-connect	oidc-usermodel-attribute-mapper	fea8af4b-842d-4ecf-b54f-97acfa55708e	\N
3ccba154-297f-44f8-bde2-eda81ada5afb	role list	saml	saml-role-list-mapper	\N	ff7c30aa-546f-4612-b991-80ebf2f55ca9
8839f208-c9e5-42d8-aeba-1b9306f8291b	full name	openid-connect	oidc-full-name-mapper	\N	32386eee-7165-46c5-b136-92b0c042c694
a32f8c39-f608-408b-b154-b1a2120e097d	family name	openid-connect	oidc-usermodel-attribute-mapper	\N	32386eee-7165-46c5-b136-92b0c042c694
b8762779-b8a0-45af-a229-695ef2b0feab	given name	openid-connect	oidc-usermodel-attribute-mapper	\N	32386eee-7165-46c5-b136-92b0c042c694
09cfda88-b5d1-4f1d-ad36-ed4ae4297bf4	middle name	openid-connect	oidc-usermodel-attribute-mapper	\N	32386eee-7165-46c5-b136-92b0c042c694
e558eb86-1c66-46e2-be6d-ad67274a18d8	nickname	openid-connect	oidc-usermodel-attribute-mapper	\N	32386eee-7165-46c5-b136-92b0c042c694
4a14e0d7-f8ae-4467-b551-0e835bcbbf88	username	openid-connect	oidc-usermodel-attribute-mapper	\N	32386eee-7165-46c5-b136-92b0c042c694
1e702509-df5c-4229-aa6c-2bab3a14001b	profile	openid-connect	oidc-usermodel-attribute-mapper	\N	32386eee-7165-46c5-b136-92b0c042c694
77be9a67-ee13-4657-a808-4addeedfcc77	picture	openid-connect	oidc-usermodel-attribute-mapper	\N	32386eee-7165-46c5-b136-92b0c042c694
a8ca67a7-5e19-4c18-a213-08ed4fc99dc0	website	openid-connect	oidc-usermodel-attribute-mapper	\N	32386eee-7165-46c5-b136-92b0c042c694
9194cf7d-6a33-479f-b5df-7ede00f587dd	gender	openid-connect	oidc-usermodel-attribute-mapper	\N	32386eee-7165-46c5-b136-92b0c042c694
02ffc8db-3e30-4a86-ba91-b76c7f59aa19	birthdate	openid-connect	oidc-usermodel-attribute-mapper	\N	32386eee-7165-46c5-b136-92b0c042c694
9abbe38d-839e-40ad-855a-fe0da8901162	zoneinfo	openid-connect	oidc-usermodel-attribute-mapper	\N	32386eee-7165-46c5-b136-92b0c042c694
ef5a2cd4-3d88-44d1-845a-4de5a6634140	locale	openid-connect	oidc-usermodel-attribute-mapper	\N	32386eee-7165-46c5-b136-92b0c042c694
0d5c801e-bbe7-40b8-b466-487dca2b1707	updated at	openid-connect	oidc-usermodel-attribute-mapper	\N	32386eee-7165-46c5-b136-92b0c042c694
090ba3f6-0be6-47ba-9ea5-e54df1392217	email	openid-connect	oidc-usermodel-attribute-mapper	\N	c7a7e7e2-ab91-4a83-bd60-c00c17b53a46
2df8d092-894e-442e-b73d-5fb4855cb9df	email verified	openid-connect	oidc-usermodel-property-mapper	\N	c7a7e7e2-ab91-4a83-bd60-c00c17b53a46
c303e180-4225-460e-9e17-81693a47b007	address	openid-connect	oidc-address-mapper	\N	c6307d2f-4a15-4630-8d8f-638088435cac
f0b4d307-eeff-471c-b663-1df9b08b8bac	phone number	openid-connect	oidc-usermodel-attribute-mapper	\N	95f43eac-8ecf-44e3-92dd-75f1941e132f
9f7ac920-a8fa-41e7-b13e-758f034dbb47	phone number verified	openid-connect	oidc-usermodel-attribute-mapper	\N	95f43eac-8ecf-44e3-92dd-75f1941e132f
8e036db4-e64b-4957-a0c2-42f64b69b8f2	realm roles	openid-connect	oidc-usermodel-realm-role-mapper	\N	8771c695-3f76-4e73-a6af-2e2ea861384c
f9078802-469a-446d-ad35-5564e33eecc5	client roles	openid-connect	oidc-usermodel-client-role-mapper	\N	8771c695-3f76-4e73-a6af-2e2ea861384c
ced223be-ffb9-4fe5-bae2-0d12742fa33b	audience resolve	openid-connect	oidc-audience-resolve-mapper	\N	8771c695-3f76-4e73-a6af-2e2ea861384c
1beaf88e-b2b3-472f-afe7-009c6f859140	allowed web origins	openid-connect	oidc-allowed-origins-mapper	\N	97c4ec94-4f7c-4bfc-bc5c-d3b7e32bf5df
e248ed73-69bd-4431-adfa-3eacccacc9b6	upn	openid-connect	oidc-usermodel-attribute-mapper	\N	f714f310-507b-44a3-8f8d-8851b53dbddb
c1a6204c-be48-4559-bb8d-8532b2e809ec	groups	openid-connect	oidc-usermodel-realm-role-mapper	\N	f714f310-507b-44a3-8f8d-8851b53dbddb
3247958c-e787-43e8-ba06-d758c686b887	acr loa level	openid-connect	oidc-acr-mapper	\N	5f2e54f5-e7ab-4db7-8207-13e79d067d59
46f6c81c-8ed6-4790-a69c-2731ff2a7672	audience resolve	openid-connect	oidc-audience-resolve-mapper	35aaeedb-7200-42ee-b867-ea4fa6dbb0fb	\N
f9f1740e-3461-4493-8638-76932a66e3b8	role list	saml	saml-role-list-mapper	\N	0b96651f-8dc8-4237-9f82-373fb09cdb09
71bfcf96-c6b4-4c8d-bbf6-f6eb88c656d8	full name	openid-connect	oidc-full-name-mapper	\N	4c065ba4-a674-438b-98bd-7f70c56fbad9
28cb3058-192e-4435-8e1e-54ec392621e9	family name	openid-connect	oidc-usermodel-attribute-mapper	\N	4c065ba4-a674-438b-98bd-7f70c56fbad9
cd56c085-ea5a-4f6a-b403-f4046fc73136	given name	openid-connect	oidc-usermodel-attribute-mapper	\N	4c065ba4-a674-438b-98bd-7f70c56fbad9
c4a9c67e-bd34-4260-a4f9-16d14cc2125c	middle name	openid-connect	oidc-usermodel-attribute-mapper	\N	4c065ba4-a674-438b-98bd-7f70c56fbad9
f0b71ee5-7113-4aa4-aa0f-0ea4dba5a261	nickname	openid-connect	oidc-usermodel-attribute-mapper	\N	4c065ba4-a674-438b-98bd-7f70c56fbad9
f05a290e-316f-4620-a0dc-107d2944ae3a	username	openid-connect	oidc-usermodel-attribute-mapper	\N	4c065ba4-a674-438b-98bd-7f70c56fbad9
09051d78-c60d-4708-918e-c5431b01ae71	profile	openid-connect	oidc-usermodel-attribute-mapper	\N	4c065ba4-a674-438b-98bd-7f70c56fbad9
bbc08181-ef13-4603-9b4d-eb5b1b26984f	picture	openid-connect	oidc-usermodel-attribute-mapper	\N	4c065ba4-a674-438b-98bd-7f70c56fbad9
5c2b6b5d-edeb-472e-a0dc-7e9df3a2a8df	website	openid-connect	oidc-usermodel-attribute-mapper	\N	4c065ba4-a674-438b-98bd-7f70c56fbad9
94b2a896-26ae-4863-9cb7-c31e3de8967a	gender	openid-connect	oidc-usermodel-attribute-mapper	\N	4c065ba4-a674-438b-98bd-7f70c56fbad9
a33254c4-7c87-4cfb-92f6-e3158d073b33	birthdate	openid-connect	oidc-usermodel-attribute-mapper	\N	4c065ba4-a674-438b-98bd-7f70c56fbad9
025902d1-40c1-49e3-97a7-7c1828862702	zoneinfo	openid-connect	oidc-usermodel-attribute-mapper	\N	4c065ba4-a674-438b-98bd-7f70c56fbad9
b185cafa-259f-42fe-846e-83d578bbbddc	locale	openid-connect	oidc-usermodel-attribute-mapper	\N	4c065ba4-a674-438b-98bd-7f70c56fbad9
258e6cb9-4ae7-4e09-9949-92cd0a2fb073	updated at	openid-connect	oidc-usermodel-attribute-mapper	\N	4c065ba4-a674-438b-98bd-7f70c56fbad9
02257eaf-e0cf-45f4-86dd-187ffa0be3a1	email	openid-connect	oidc-usermodel-attribute-mapper	\N	9d5da259-7833-4638-84d8-86c0bfb66c0d
0e826fab-6472-4240-abd7-db78efb73ea4	email verified	openid-connect	oidc-usermodel-property-mapper	\N	9d5da259-7833-4638-84d8-86c0bfb66c0d
e41bc4c4-8e81-43ed-adf2-0e2dc5ce48e3	address	openid-connect	oidc-address-mapper	\N	d0e805c6-1ff4-436d-9232-d62815f93f3d
eb2d374a-f029-4857-af6e-b4ed62739a5a	phone number	openid-connect	oidc-usermodel-attribute-mapper	\N	bb8517ac-ab0d-4649-ae68-8a1868a1088c
8fe5a512-ed13-41c3-8410-71bde6ce190e	phone number verified	openid-connect	oidc-usermodel-attribute-mapper	\N	bb8517ac-ab0d-4649-ae68-8a1868a1088c
09a516d5-785c-4a4e-b50a-6397e2c41382	realm roles	openid-connect	oidc-usermodel-realm-role-mapper	\N	4cbae6de-22b0-466b-af25-812a8258aee6
0e0296bb-802a-413d-b8c9-3a063c378f88	client roles	openid-connect	oidc-usermodel-client-role-mapper	\N	4cbae6de-22b0-466b-af25-812a8258aee6
4379dee3-07c5-481f-8b95-6709f81b2b24	audience resolve	openid-connect	oidc-audience-resolve-mapper	\N	4cbae6de-22b0-466b-af25-812a8258aee6
9fb1c05d-7413-46ab-a756-0add56321515	allowed web origins	openid-connect	oidc-allowed-origins-mapper	\N	ab0c4e03-f2a1-4989-80c8-29b3018ad9e9
6ae56398-71ef-4c6e-8028-a9d41ff385cd	upn	openid-connect	oidc-usermodel-attribute-mapper	\N	aaa15b45-2eae-4a31-83e0-f843c1d40f2a
ca90123f-2749-466d-9411-b374a69323b0	groups	openid-connect	oidc-usermodel-realm-role-mapper	\N	aaa15b45-2eae-4a31-83e0-f843c1d40f2a
8418537c-427d-445a-854d-1a2955b6d0a1	acr loa level	openid-connect	oidc-acr-mapper	\N	d9502030-29c4-480e-9ec2-6c89f903c656
a8e5c06e-8bbc-489c-85a7-841475c50d5b	locale	openid-connect	oidc-usermodel-attribute-mapper	25052911-8e99-40e5-ba66-36f49639c56d	\N
592144da-3353-4966-a79d-536cea1e4da2	Client ID	openid-connect	oidc-usersessionmodel-note-mapper	fe9d9161-94f7-4d95-9203-a5c8df6003af	\N
bea0949d-2243-47af-8540-feaa8cd98872	Client Host	openid-connect	oidc-usersessionmodel-note-mapper	fe9d9161-94f7-4d95-9203-a5c8df6003af	\N
83d19d5a-a12c-426a-8c7f-60306fa1faa0	Client IP Address	openid-connect	oidc-usersessionmodel-note-mapper	fe9d9161-94f7-4d95-9203-a5c8df6003af	\N
\.


--
-- Data for Name: protocol_mapper_config; Type: TABLE DATA; Schema: public; Owner: keycloak
--

COPY public.protocol_mapper_config (protocol_mapper_id, value, name) FROM stdin;
befd9fe4-a0b0-4a66-8576-be1c1f18f9bb	true	introspection.token.claim
befd9fe4-a0b0-4a66-8576-be1c1f18f9bb	true	userinfo.token.claim
befd9fe4-a0b0-4a66-8576-be1c1f18f9bb	locale	user.attribute
befd9fe4-a0b0-4a66-8576-be1c1f18f9bb	true	id.token.claim
befd9fe4-a0b0-4a66-8576-be1c1f18f9bb	true	access.token.claim
befd9fe4-a0b0-4a66-8576-be1c1f18f9bb	locale	claim.name
befd9fe4-a0b0-4a66-8576-be1c1f18f9bb	String	jsonType.label
3ccba154-297f-44f8-bde2-eda81ada5afb	false	single
3ccba154-297f-44f8-bde2-eda81ada5afb	Basic	attribute.nameformat
3ccba154-297f-44f8-bde2-eda81ada5afb	Role	attribute.name
02ffc8db-3e30-4a86-ba91-b76c7f59aa19	true	introspection.token.claim
02ffc8db-3e30-4a86-ba91-b76c7f59aa19	true	userinfo.token.claim
02ffc8db-3e30-4a86-ba91-b76c7f59aa19	birthdate	user.attribute
02ffc8db-3e30-4a86-ba91-b76c7f59aa19	true	id.token.claim
02ffc8db-3e30-4a86-ba91-b76c7f59aa19	true	access.token.claim
02ffc8db-3e30-4a86-ba91-b76c7f59aa19	birthdate	claim.name
02ffc8db-3e30-4a86-ba91-b76c7f59aa19	String	jsonType.label
09cfda88-b5d1-4f1d-ad36-ed4ae4297bf4	true	introspection.token.claim
09cfda88-b5d1-4f1d-ad36-ed4ae4297bf4	true	userinfo.token.claim
09cfda88-b5d1-4f1d-ad36-ed4ae4297bf4	middleName	user.attribute
09cfda88-b5d1-4f1d-ad36-ed4ae4297bf4	true	id.token.claim
09cfda88-b5d1-4f1d-ad36-ed4ae4297bf4	true	access.token.claim
09cfda88-b5d1-4f1d-ad36-ed4ae4297bf4	middle_name	claim.name
09cfda88-b5d1-4f1d-ad36-ed4ae4297bf4	String	jsonType.label
0d5c801e-bbe7-40b8-b466-487dca2b1707	true	introspection.token.claim
0d5c801e-bbe7-40b8-b466-487dca2b1707	true	userinfo.token.claim
0d5c801e-bbe7-40b8-b466-487dca2b1707	updatedAt	user.attribute
0d5c801e-bbe7-40b8-b466-487dca2b1707	true	id.token.claim
0d5c801e-bbe7-40b8-b466-487dca2b1707	true	access.token.claim
0d5c801e-bbe7-40b8-b466-487dca2b1707	updated_at	claim.name
0d5c801e-bbe7-40b8-b466-487dca2b1707	long	jsonType.label
1e702509-df5c-4229-aa6c-2bab3a14001b	true	introspection.token.claim
1e702509-df5c-4229-aa6c-2bab3a14001b	true	userinfo.token.claim
1e702509-df5c-4229-aa6c-2bab3a14001b	profile	user.attribute
1e702509-df5c-4229-aa6c-2bab3a14001b	true	id.token.claim
1e702509-df5c-4229-aa6c-2bab3a14001b	true	access.token.claim
1e702509-df5c-4229-aa6c-2bab3a14001b	profile	claim.name
1e702509-df5c-4229-aa6c-2bab3a14001b	String	jsonType.label
4a14e0d7-f8ae-4467-b551-0e835bcbbf88	true	introspection.token.claim
4a14e0d7-f8ae-4467-b551-0e835bcbbf88	true	userinfo.token.claim
4a14e0d7-f8ae-4467-b551-0e835bcbbf88	username	user.attribute
4a14e0d7-f8ae-4467-b551-0e835bcbbf88	true	id.token.claim
4a14e0d7-f8ae-4467-b551-0e835bcbbf88	true	access.token.claim
4a14e0d7-f8ae-4467-b551-0e835bcbbf88	preferred_username	claim.name
4a14e0d7-f8ae-4467-b551-0e835bcbbf88	String	jsonType.label
77be9a67-ee13-4657-a808-4addeedfcc77	true	introspection.token.claim
77be9a67-ee13-4657-a808-4addeedfcc77	true	userinfo.token.claim
77be9a67-ee13-4657-a808-4addeedfcc77	picture	user.attribute
77be9a67-ee13-4657-a808-4addeedfcc77	true	id.token.claim
77be9a67-ee13-4657-a808-4addeedfcc77	true	access.token.claim
77be9a67-ee13-4657-a808-4addeedfcc77	picture	claim.name
77be9a67-ee13-4657-a808-4addeedfcc77	String	jsonType.label
8839f208-c9e5-42d8-aeba-1b9306f8291b	true	introspection.token.claim
8839f208-c9e5-42d8-aeba-1b9306f8291b	true	userinfo.token.claim
8839f208-c9e5-42d8-aeba-1b9306f8291b	true	id.token.claim
8839f208-c9e5-42d8-aeba-1b9306f8291b	true	access.token.claim
9194cf7d-6a33-479f-b5df-7ede00f587dd	true	introspection.token.claim
9194cf7d-6a33-479f-b5df-7ede00f587dd	true	userinfo.token.claim
9194cf7d-6a33-479f-b5df-7ede00f587dd	gender	user.attribute
9194cf7d-6a33-479f-b5df-7ede00f587dd	true	id.token.claim
9194cf7d-6a33-479f-b5df-7ede00f587dd	true	access.token.claim
9194cf7d-6a33-479f-b5df-7ede00f587dd	gender	claim.name
9194cf7d-6a33-479f-b5df-7ede00f587dd	String	jsonType.label
9abbe38d-839e-40ad-855a-fe0da8901162	true	introspection.token.claim
9abbe38d-839e-40ad-855a-fe0da8901162	true	userinfo.token.claim
9abbe38d-839e-40ad-855a-fe0da8901162	zoneinfo	user.attribute
9abbe38d-839e-40ad-855a-fe0da8901162	true	id.token.claim
9abbe38d-839e-40ad-855a-fe0da8901162	true	access.token.claim
9abbe38d-839e-40ad-855a-fe0da8901162	zoneinfo	claim.name
9abbe38d-839e-40ad-855a-fe0da8901162	String	jsonType.label
a32f8c39-f608-408b-b154-b1a2120e097d	true	introspection.token.claim
a32f8c39-f608-408b-b154-b1a2120e097d	true	userinfo.token.claim
a32f8c39-f608-408b-b154-b1a2120e097d	lastName	user.attribute
a32f8c39-f608-408b-b154-b1a2120e097d	true	id.token.claim
a32f8c39-f608-408b-b154-b1a2120e097d	true	access.token.claim
a32f8c39-f608-408b-b154-b1a2120e097d	family_name	claim.name
a32f8c39-f608-408b-b154-b1a2120e097d	String	jsonType.label
a8ca67a7-5e19-4c18-a213-08ed4fc99dc0	true	introspection.token.claim
a8ca67a7-5e19-4c18-a213-08ed4fc99dc0	true	userinfo.token.claim
a8ca67a7-5e19-4c18-a213-08ed4fc99dc0	website	user.attribute
a8ca67a7-5e19-4c18-a213-08ed4fc99dc0	true	id.token.claim
a8ca67a7-5e19-4c18-a213-08ed4fc99dc0	true	access.token.claim
a8ca67a7-5e19-4c18-a213-08ed4fc99dc0	website	claim.name
a8ca67a7-5e19-4c18-a213-08ed4fc99dc0	String	jsonType.label
b8762779-b8a0-45af-a229-695ef2b0feab	true	introspection.token.claim
b8762779-b8a0-45af-a229-695ef2b0feab	true	userinfo.token.claim
b8762779-b8a0-45af-a229-695ef2b0feab	firstName	user.attribute
b8762779-b8a0-45af-a229-695ef2b0feab	true	id.token.claim
b8762779-b8a0-45af-a229-695ef2b0feab	true	access.token.claim
b8762779-b8a0-45af-a229-695ef2b0feab	given_name	claim.name
b8762779-b8a0-45af-a229-695ef2b0feab	String	jsonType.label
e558eb86-1c66-46e2-be6d-ad67274a18d8	true	introspection.token.claim
e558eb86-1c66-46e2-be6d-ad67274a18d8	true	userinfo.token.claim
e558eb86-1c66-46e2-be6d-ad67274a18d8	nickname	user.attribute
e558eb86-1c66-46e2-be6d-ad67274a18d8	true	id.token.claim
e558eb86-1c66-46e2-be6d-ad67274a18d8	true	access.token.claim
e558eb86-1c66-46e2-be6d-ad67274a18d8	nickname	claim.name
e558eb86-1c66-46e2-be6d-ad67274a18d8	String	jsonType.label
ef5a2cd4-3d88-44d1-845a-4de5a6634140	true	introspection.token.claim
ef5a2cd4-3d88-44d1-845a-4de5a6634140	true	userinfo.token.claim
ef5a2cd4-3d88-44d1-845a-4de5a6634140	locale	user.attribute
ef5a2cd4-3d88-44d1-845a-4de5a6634140	true	id.token.claim
ef5a2cd4-3d88-44d1-845a-4de5a6634140	true	access.token.claim
ef5a2cd4-3d88-44d1-845a-4de5a6634140	locale	claim.name
ef5a2cd4-3d88-44d1-845a-4de5a6634140	String	jsonType.label
090ba3f6-0be6-47ba-9ea5-e54df1392217	true	introspection.token.claim
090ba3f6-0be6-47ba-9ea5-e54df1392217	true	userinfo.token.claim
090ba3f6-0be6-47ba-9ea5-e54df1392217	email	user.attribute
090ba3f6-0be6-47ba-9ea5-e54df1392217	true	id.token.claim
090ba3f6-0be6-47ba-9ea5-e54df1392217	true	access.token.claim
090ba3f6-0be6-47ba-9ea5-e54df1392217	email	claim.name
090ba3f6-0be6-47ba-9ea5-e54df1392217	String	jsonType.label
2df8d092-894e-442e-b73d-5fb4855cb9df	true	introspection.token.claim
2df8d092-894e-442e-b73d-5fb4855cb9df	true	userinfo.token.claim
2df8d092-894e-442e-b73d-5fb4855cb9df	emailVerified	user.attribute
2df8d092-894e-442e-b73d-5fb4855cb9df	true	id.token.claim
2df8d092-894e-442e-b73d-5fb4855cb9df	true	access.token.claim
2df8d092-894e-442e-b73d-5fb4855cb9df	email_verified	claim.name
2df8d092-894e-442e-b73d-5fb4855cb9df	boolean	jsonType.label
c303e180-4225-460e-9e17-81693a47b007	formatted	user.attribute.formatted
c303e180-4225-460e-9e17-81693a47b007	country	user.attribute.country
c303e180-4225-460e-9e17-81693a47b007	true	introspection.token.claim
c303e180-4225-460e-9e17-81693a47b007	postal_code	user.attribute.postal_code
c303e180-4225-460e-9e17-81693a47b007	true	userinfo.token.claim
c303e180-4225-460e-9e17-81693a47b007	street	user.attribute.street
c303e180-4225-460e-9e17-81693a47b007	true	id.token.claim
c303e180-4225-460e-9e17-81693a47b007	region	user.attribute.region
c303e180-4225-460e-9e17-81693a47b007	true	access.token.claim
c303e180-4225-460e-9e17-81693a47b007	locality	user.attribute.locality
9f7ac920-a8fa-41e7-b13e-758f034dbb47	true	introspection.token.claim
9f7ac920-a8fa-41e7-b13e-758f034dbb47	true	userinfo.token.claim
9f7ac920-a8fa-41e7-b13e-758f034dbb47	phoneNumberVerified	user.attribute
9f7ac920-a8fa-41e7-b13e-758f034dbb47	true	id.token.claim
9f7ac920-a8fa-41e7-b13e-758f034dbb47	true	access.token.claim
9f7ac920-a8fa-41e7-b13e-758f034dbb47	phone_number_verified	claim.name
9f7ac920-a8fa-41e7-b13e-758f034dbb47	boolean	jsonType.label
f0b4d307-eeff-471c-b663-1df9b08b8bac	true	introspection.token.claim
f0b4d307-eeff-471c-b663-1df9b08b8bac	true	userinfo.token.claim
f0b4d307-eeff-471c-b663-1df9b08b8bac	phoneNumber	user.attribute
f0b4d307-eeff-471c-b663-1df9b08b8bac	true	id.token.claim
f0b4d307-eeff-471c-b663-1df9b08b8bac	true	access.token.claim
f0b4d307-eeff-471c-b663-1df9b08b8bac	phone_number	claim.name
f0b4d307-eeff-471c-b663-1df9b08b8bac	String	jsonType.label
8e036db4-e64b-4957-a0c2-42f64b69b8f2	true	introspection.token.claim
8e036db4-e64b-4957-a0c2-42f64b69b8f2	true	multivalued
8e036db4-e64b-4957-a0c2-42f64b69b8f2	foo	user.attribute
8e036db4-e64b-4957-a0c2-42f64b69b8f2	true	access.token.claim
8e036db4-e64b-4957-a0c2-42f64b69b8f2	realm_access.roles	claim.name
8e036db4-e64b-4957-a0c2-42f64b69b8f2	String	jsonType.label
ced223be-ffb9-4fe5-bae2-0d12742fa33b	true	introspection.token.claim
ced223be-ffb9-4fe5-bae2-0d12742fa33b	true	access.token.claim
f9078802-469a-446d-ad35-5564e33eecc5	true	introspection.token.claim
f9078802-469a-446d-ad35-5564e33eecc5	true	multivalued
f9078802-469a-446d-ad35-5564e33eecc5	foo	user.attribute
f9078802-469a-446d-ad35-5564e33eecc5	true	access.token.claim
f9078802-469a-446d-ad35-5564e33eecc5	resource_access.${client_id}.roles	claim.name
f9078802-469a-446d-ad35-5564e33eecc5	String	jsonType.label
1beaf88e-b2b3-472f-afe7-009c6f859140	true	introspection.token.claim
1beaf88e-b2b3-472f-afe7-009c6f859140	true	access.token.claim
c1a6204c-be48-4559-bb8d-8532b2e809ec	true	introspection.token.claim
c1a6204c-be48-4559-bb8d-8532b2e809ec	true	multivalued
c1a6204c-be48-4559-bb8d-8532b2e809ec	foo	user.attribute
c1a6204c-be48-4559-bb8d-8532b2e809ec	true	id.token.claim
c1a6204c-be48-4559-bb8d-8532b2e809ec	true	access.token.claim
c1a6204c-be48-4559-bb8d-8532b2e809ec	groups	claim.name
c1a6204c-be48-4559-bb8d-8532b2e809ec	String	jsonType.label
e248ed73-69bd-4431-adfa-3eacccacc9b6	true	introspection.token.claim
e248ed73-69bd-4431-adfa-3eacccacc9b6	true	userinfo.token.claim
e248ed73-69bd-4431-adfa-3eacccacc9b6	username	user.attribute
e248ed73-69bd-4431-adfa-3eacccacc9b6	true	id.token.claim
e248ed73-69bd-4431-adfa-3eacccacc9b6	true	access.token.claim
e248ed73-69bd-4431-adfa-3eacccacc9b6	upn	claim.name
e248ed73-69bd-4431-adfa-3eacccacc9b6	String	jsonType.label
3247958c-e787-43e8-ba06-d758c686b887	true	introspection.token.claim
3247958c-e787-43e8-ba06-d758c686b887	true	id.token.claim
3247958c-e787-43e8-ba06-d758c686b887	true	access.token.claim
f9f1740e-3461-4493-8638-76932a66e3b8	false	single
f9f1740e-3461-4493-8638-76932a66e3b8	Basic	attribute.nameformat
f9f1740e-3461-4493-8638-76932a66e3b8	Role	attribute.name
025902d1-40c1-49e3-97a7-7c1828862702	true	introspection.token.claim
025902d1-40c1-49e3-97a7-7c1828862702	true	userinfo.token.claim
025902d1-40c1-49e3-97a7-7c1828862702	zoneinfo	user.attribute
025902d1-40c1-49e3-97a7-7c1828862702	true	id.token.claim
025902d1-40c1-49e3-97a7-7c1828862702	true	access.token.claim
025902d1-40c1-49e3-97a7-7c1828862702	zoneinfo	claim.name
025902d1-40c1-49e3-97a7-7c1828862702	String	jsonType.label
09051d78-c60d-4708-918e-c5431b01ae71	true	introspection.token.claim
09051d78-c60d-4708-918e-c5431b01ae71	true	userinfo.token.claim
09051d78-c60d-4708-918e-c5431b01ae71	profile	user.attribute
09051d78-c60d-4708-918e-c5431b01ae71	true	id.token.claim
09051d78-c60d-4708-918e-c5431b01ae71	true	access.token.claim
09051d78-c60d-4708-918e-c5431b01ae71	profile	claim.name
09051d78-c60d-4708-918e-c5431b01ae71	String	jsonType.label
258e6cb9-4ae7-4e09-9949-92cd0a2fb073	true	introspection.token.claim
258e6cb9-4ae7-4e09-9949-92cd0a2fb073	true	userinfo.token.claim
258e6cb9-4ae7-4e09-9949-92cd0a2fb073	updatedAt	user.attribute
258e6cb9-4ae7-4e09-9949-92cd0a2fb073	true	id.token.claim
258e6cb9-4ae7-4e09-9949-92cd0a2fb073	true	access.token.claim
258e6cb9-4ae7-4e09-9949-92cd0a2fb073	updated_at	claim.name
258e6cb9-4ae7-4e09-9949-92cd0a2fb073	long	jsonType.label
28cb3058-192e-4435-8e1e-54ec392621e9	true	introspection.token.claim
28cb3058-192e-4435-8e1e-54ec392621e9	true	userinfo.token.claim
28cb3058-192e-4435-8e1e-54ec392621e9	lastName	user.attribute
28cb3058-192e-4435-8e1e-54ec392621e9	true	id.token.claim
28cb3058-192e-4435-8e1e-54ec392621e9	true	access.token.claim
28cb3058-192e-4435-8e1e-54ec392621e9	family_name	claim.name
28cb3058-192e-4435-8e1e-54ec392621e9	String	jsonType.label
5c2b6b5d-edeb-472e-a0dc-7e9df3a2a8df	true	introspection.token.claim
5c2b6b5d-edeb-472e-a0dc-7e9df3a2a8df	true	userinfo.token.claim
5c2b6b5d-edeb-472e-a0dc-7e9df3a2a8df	website	user.attribute
5c2b6b5d-edeb-472e-a0dc-7e9df3a2a8df	true	id.token.claim
5c2b6b5d-edeb-472e-a0dc-7e9df3a2a8df	true	access.token.claim
5c2b6b5d-edeb-472e-a0dc-7e9df3a2a8df	website	claim.name
5c2b6b5d-edeb-472e-a0dc-7e9df3a2a8df	String	jsonType.label
71bfcf96-c6b4-4c8d-bbf6-f6eb88c656d8	true	introspection.token.claim
71bfcf96-c6b4-4c8d-bbf6-f6eb88c656d8	true	userinfo.token.claim
71bfcf96-c6b4-4c8d-bbf6-f6eb88c656d8	true	id.token.claim
71bfcf96-c6b4-4c8d-bbf6-f6eb88c656d8	true	access.token.claim
94b2a896-26ae-4863-9cb7-c31e3de8967a	true	introspection.token.claim
94b2a896-26ae-4863-9cb7-c31e3de8967a	true	userinfo.token.claim
94b2a896-26ae-4863-9cb7-c31e3de8967a	gender	user.attribute
94b2a896-26ae-4863-9cb7-c31e3de8967a	true	id.token.claim
94b2a896-26ae-4863-9cb7-c31e3de8967a	true	access.token.claim
94b2a896-26ae-4863-9cb7-c31e3de8967a	gender	claim.name
94b2a896-26ae-4863-9cb7-c31e3de8967a	String	jsonType.label
a33254c4-7c87-4cfb-92f6-e3158d073b33	true	introspection.token.claim
a33254c4-7c87-4cfb-92f6-e3158d073b33	true	userinfo.token.claim
a33254c4-7c87-4cfb-92f6-e3158d073b33	birthdate	user.attribute
a33254c4-7c87-4cfb-92f6-e3158d073b33	true	id.token.claim
a33254c4-7c87-4cfb-92f6-e3158d073b33	true	access.token.claim
a33254c4-7c87-4cfb-92f6-e3158d073b33	birthdate	claim.name
a33254c4-7c87-4cfb-92f6-e3158d073b33	String	jsonType.label
b185cafa-259f-42fe-846e-83d578bbbddc	true	introspection.token.claim
b185cafa-259f-42fe-846e-83d578bbbddc	true	userinfo.token.claim
b185cafa-259f-42fe-846e-83d578bbbddc	locale	user.attribute
b185cafa-259f-42fe-846e-83d578bbbddc	true	id.token.claim
b185cafa-259f-42fe-846e-83d578bbbddc	true	access.token.claim
b185cafa-259f-42fe-846e-83d578bbbddc	locale	claim.name
b185cafa-259f-42fe-846e-83d578bbbddc	String	jsonType.label
bbc08181-ef13-4603-9b4d-eb5b1b26984f	true	introspection.token.claim
bbc08181-ef13-4603-9b4d-eb5b1b26984f	true	userinfo.token.claim
bbc08181-ef13-4603-9b4d-eb5b1b26984f	picture	user.attribute
bbc08181-ef13-4603-9b4d-eb5b1b26984f	true	id.token.claim
bbc08181-ef13-4603-9b4d-eb5b1b26984f	true	access.token.claim
bbc08181-ef13-4603-9b4d-eb5b1b26984f	picture	claim.name
bbc08181-ef13-4603-9b4d-eb5b1b26984f	String	jsonType.label
c4a9c67e-bd34-4260-a4f9-16d14cc2125c	true	introspection.token.claim
c4a9c67e-bd34-4260-a4f9-16d14cc2125c	true	userinfo.token.claim
c4a9c67e-bd34-4260-a4f9-16d14cc2125c	middleName	user.attribute
c4a9c67e-bd34-4260-a4f9-16d14cc2125c	true	id.token.claim
c4a9c67e-bd34-4260-a4f9-16d14cc2125c	true	access.token.claim
c4a9c67e-bd34-4260-a4f9-16d14cc2125c	middle_name	claim.name
c4a9c67e-bd34-4260-a4f9-16d14cc2125c	String	jsonType.label
cd56c085-ea5a-4f6a-b403-f4046fc73136	true	introspection.token.claim
cd56c085-ea5a-4f6a-b403-f4046fc73136	true	userinfo.token.claim
cd56c085-ea5a-4f6a-b403-f4046fc73136	firstName	user.attribute
cd56c085-ea5a-4f6a-b403-f4046fc73136	true	id.token.claim
cd56c085-ea5a-4f6a-b403-f4046fc73136	true	access.token.claim
cd56c085-ea5a-4f6a-b403-f4046fc73136	given_name	claim.name
cd56c085-ea5a-4f6a-b403-f4046fc73136	String	jsonType.label
f05a290e-316f-4620-a0dc-107d2944ae3a	true	introspection.token.claim
f05a290e-316f-4620-a0dc-107d2944ae3a	true	userinfo.token.claim
f05a290e-316f-4620-a0dc-107d2944ae3a	username	user.attribute
f05a290e-316f-4620-a0dc-107d2944ae3a	true	id.token.claim
f05a290e-316f-4620-a0dc-107d2944ae3a	true	access.token.claim
f05a290e-316f-4620-a0dc-107d2944ae3a	preferred_username	claim.name
f05a290e-316f-4620-a0dc-107d2944ae3a	String	jsonType.label
f0b71ee5-7113-4aa4-aa0f-0ea4dba5a261	true	introspection.token.claim
f0b71ee5-7113-4aa4-aa0f-0ea4dba5a261	true	userinfo.token.claim
f0b71ee5-7113-4aa4-aa0f-0ea4dba5a261	nickname	user.attribute
f0b71ee5-7113-4aa4-aa0f-0ea4dba5a261	true	id.token.claim
f0b71ee5-7113-4aa4-aa0f-0ea4dba5a261	true	access.token.claim
f0b71ee5-7113-4aa4-aa0f-0ea4dba5a261	nickname	claim.name
f0b71ee5-7113-4aa4-aa0f-0ea4dba5a261	String	jsonType.label
02257eaf-e0cf-45f4-86dd-187ffa0be3a1	true	introspection.token.claim
02257eaf-e0cf-45f4-86dd-187ffa0be3a1	true	userinfo.token.claim
02257eaf-e0cf-45f4-86dd-187ffa0be3a1	email	user.attribute
02257eaf-e0cf-45f4-86dd-187ffa0be3a1	true	id.token.claim
02257eaf-e0cf-45f4-86dd-187ffa0be3a1	true	access.token.claim
02257eaf-e0cf-45f4-86dd-187ffa0be3a1	email	claim.name
02257eaf-e0cf-45f4-86dd-187ffa0be3a1	String	jsonType.label
0e826fab-6472-4240-abd7-db78efb73ea4	true	introspection.token.claim
0e826fab-6472-4240-abd7-db78efb73ea4	true	userinfo.token.claim
0e826fab-6472-4240-abd7-db78efb73ea4	emailVerified	user.attribute
0e826fab-6472-4240-abd7-db78efb73ea4	true	id.token.claim
0e826fab-6472-4240-abd7-db78efb73ea4	true	access.token.claim
0e826fab-6472-4240-abd7-db78efb73ea4	email_verified	claim.name
0e826fab-6472-4240-abd7-db78efb73ea4	boolean	jsonType.label
e41bc4c4-8e81-43ed-adf2-0e2dc5ce48e3	formatted	user.attribute.formatted
e41bc4c4-8e81-43ed-adf2-0e2dc5ce48e3	country	user.attribute.country
e41bc4c4-8e81-43ed-adf2-0e2dc5ce48e3	true	introspection.token.claim
e41bc4c4-8e81-43ed-adf2-0e2dc5ce48e3	postal_code	user.attribute.postal_code
e41bc4c4-8e81-43ed-adf2-0e2dc5ce48e3	true	userinfo.token.claim
e41bc4c4-8e81-43ed-adf2-0e2dc5ce48e3	street	user.attribute.street
e41bc4c4-8e81-43ed-adf2-0e2dc5ce48e3	true	id.token.claim
e41bc4c4-8e81-43ed-adf2-0e2dc5ce48e3	region	user.attribute.region
e41bc4c4-8e81-43ed-adf2-0e2dc5ce48e3	true	access.token.claim
e41bc4c4-8e81-43ed-adf2-0e2dc5ce48e3	locality	user.attribute.locality
8fe5a512-ed13-41c3-8410-71bde6ce190e	true	introspection.token.claim
8fe5a512-ed13-41c3-8410-71bde6ce190e	true	userinfo.token.claim
8fe5a512-ed13-41c3-8410-71bde6ce190e	phoneNumberVerified	user.attribute
8fe5a512-ed13-41c3-8410-71bde6ce190e	true	id.token.claim
8fe5a512-ed13-41c3-8410-71bde6ce190e	true	access.token.claim
8fe5a512-ed13-41c3-8410-71bde6ce190e	phone_number_verified	claim.name
8fe5a512-ed13-41c3-8410-71bde6ce190e	boolean	jsonType.label
eb2d374a-f029-4857-af6e-b4ed62739a5a	true	introspection.token.claim
eb2d374a-f029-4857-af6e-b4ed62739a5a	true	userinfo.token.claim
eb2d374a-f029-4857-af6e-b4ed62739a5a	phoneNumber	user.attribute
eb2d374a-f029-4857-af6e-b4ed62739a5a	true	id.token.claim
eb2d374a-f029-4857-af6e-b4ed62739a5a	true	access.token.claim
eb2d374a-f029-4857-af6e-b4ed62739a5a	phone_number	claim.name
eb2d374a-f029-4857-af6e-b4ed62739a5a	String	jsonType.label
09a516d5-785c-4a4e-b50a-6397e2c41382	true	introspection.token.claim
09a516d5-785c-4a4e-b50a-6397e2c41382	true	multivalued
09a516d5-785c-4a4e-b50a-6397e2c41382	foo	user.attribute
09a516d5-785c-4a4e-b50a-6397e2c41382	true	access.token.claim
09a516d5-785c-4a4e-b50a-6397e2c41382	realm_access.roles	claim.name
09a516d5-785c-4a4e-b50a-6397e2c41382	String	jsonType.label
0e0296bb-802a-413d-b8c9-3a063c378f88	true	introspection.token.claim
0e0296bb-802a-413d-b8c9-3a063c378f88	true	multivalued
0e0296bb-802a-413d-b8c9-3a063c378f88	foo	user.attribute
0e0296bb-802a-413d-b8c9-3a063c378f88	true	access.token.claim
0e0296bb-802a-413d-b8c9-3a063c378f88	resource_access.${client_id}.roles	claim.name
0e0296bb-802a-413d-b8c9-3a063c378f88	String	jsonType.label
4379dee3-07c5-481f-8b95-6709f81b2b24	true	introspection.token.claim
4379dee3-07c5-481f-8b95-6709f81b2b24	true	access.token.claim
9fb1c05d-7413-46ab-a756-0add56321515	true	introspection.token.claim
9fb1c05d-7413-46ab-a756-0add56321515	true	access.token.claim
6ae56398-71ef-4c6e-8028-a9d41ff385cd	true	introspection.token.claim
6ae56398-71ef-4c6e-8028-a9d41ff385cd	true	userinfo.token.claim
6ae56398-71ef-4c6e-8028-a9d41ff385cd	username	user.attribute
6ae56398-71ef-4c6e-8028-a9d41ff385cd	true	id.token.claim
6ae56398-71ef-4c6e-8028-a9d41ff385cd	true	access.token.claim
6ae56398-71ef-4c6e-8028-a9d41ff385cd	upn	claim.name
6ae56398-71ef-4c6e-8028-a9d41ff385cd	String	jsonType.label
ca90123f-2749-466d-9411-b374a69323b0	true	introspection.token.claim
ca90123f-2749-466d-9411-b374a69323b0	true	multivalued
ca90123f-2749-466d-9411-b374a69323b0	foo	user.attribute
ca90123f-2749-466d-9411-b374a69323b0	true	id.token.claim
ca90123f-2749-466d-9411-b374a69323b0	true	access.token.claim
ca90123f-2749-466d-9411-b374a69323b0	groups	claim.name
ca90123f-2749-466d-9411-b374a69323b0	String	jsonType.label
8418537c-427d-445a-854d-1a2955b6d0a1	true	introspection.token.claim
8418537c-427d-445a-854d-1a2955b6d0a1	true	id.token.claim
8418537c-427d-445a-854d-1a2955b6d0a1	true	access.token.claim
a8e5c06e-8bbc-489c-85a7-841475c50d5b	true	introspection.token.claim
a8e5c06e-8bbc-489c-85a7-841475c50d5b	true	userinfo.token.claim
a8e5c06e-8bbc-489c-85a7-841475c50d5b	locale	user.attribute
a8e5c06e-8bbc-489c-85a7-841475c50d5b	true	id.token.claim
a8e5c06e-8bbc-489c-85a7-841475c50d5b	true	access.token.claim
a8e5c06e-8bbc-489c-85a7-841475c50d5b	locale	claim.name
a8e5c06e-8bbc-489c-85a7-841475c50d5b	String	jsonType.label
592144da-3353-4966-a79d-536cea1e4da2	client_id	user.session.note
592144da-3353-4966-a79d-536cea1e4da2	true	introspection.token.claim
592144da-3353-4966-a79d-536cea1e4da2	true	id.token.claim
592144da-3353-4966-a79d-536cea1e4da2	true	access.token.claim
592144da-3353-4966-a79d-536cea1e4da2	client_id	claim.name
592144da-3353-4966-a79d-536cea1e4da2	String	jsonType.label
83d19d5a-a12c-426a-8c7f-60306fa1faa0	clientAddress	user.session.note
83d19d5a-a12c-426a-8c7f-60306fa1faa0	true	introspection.token.claim
83d19d5a-a12c-426a-8c7f-60306fa1faa0	true	id.token.claim
83d19d5a-a12c-426a-8c7f-60306fa1faa0	true	access.token.claim
83d19d5a-a12c-426a-8c7f-60306fa1faa0	clientAddress	claim.name
83d19d5a-a12c-426a-8c7f-60306fa1faa0	String	jsonType.label
bea0949d-2243-47af-8540-feaa8cd98872	clientHost	user.session.note
bea0949d-2243-47af-8540-feaa8cd98872	true	introspection.token.claim
bea0949d-2243-47af-8540-feaa8cd98872	true	id.token.claim
bea0949d-2243-47af-8540-feaa8cd98872	true	access.token.claim
bea0949d-2243-47af-8540-feaa8cd98872	clientHost	claim.name
bea0949d-2243-47af-8540-feaa8cd98872	String	jsonType.label
\.


--
-- Data for Name: realm; Type: TABLE DATA; Schema: public; Owner: keycloak
--

COPY public.realm (id, access_code_lifespan, user_action_lifespan, access_token_lifespan, account_theme, admin_theme, email_theme, enabled, events_enabled, events_expiration, login_theme, name, not_before, password_policy, registration_allowed, remember_me, reset_password_allowed, social, ssl_required, sso_idle_timeout, sso_max_lifespan, update_profile_on_soc_login, verify_email, master_admin_client, login_lifespan, internationalization_enabled, default_locale, reg_email_as_username, admin_events_enabled, admin_events_details_enabled, edit_username_allowed, otp_policy_counter, otp_policy_window, otp_policy_period, otp_policy_digits, otp_policy_alg, otp_policy_type, browser_flow, registration_flow, direct_grant_flow, reset_credentials_flow, client_auth_flow, offline_session_idle_timeout, revoke_refresh_token, access_token_life_implicit, login_with_email_allowed, duplicate_emails_allowed, docker_auth_flow, refresh_token_max_reuse, allow_user_managed_access, sso_max_lifespan_remember_me, sso_idle_timeout_remember_me, default_role) FROM stdin;
e9abe5f8-460d-41ff-a21e-ada47aba8547	60	300	60	\N	\N	\N	t	f	0	\N	master	0	\N	f	f	f	f	EXTERNAL	1800	36000	f	f	49c6ffbf-1b8b-4a50-9d56-cb24f14c7764	1800	f	\N	f	f	f	f	0	1	30	6	HmacSHA1	totp	589bec8e-fc7b-48b1-8050-0f4b28d81a5f	8a0b3f88-739e-43d3-adb8-04b3469bb774	4415131e-d28d-4489-9879-9b38c339ee73	58a53ed5-ea37-4835-882e-c1b6b69250c8	3a4c805a-dce6-4f41-99b7-c0533e9d9b02	2592000	f	900	t	f	edc41823-aaf9-440c-a4de-9182d99daf7f	0	f	0	0	2085ed59-03e6-4a5f-ace6-2ef054404862
8ba89cf8-e84c-4cca-b865-2802d8b005ca	60	300	300	\N	\N	\N	t	f	0	\N	demo	0	\N	f	f	f	f	EXTERNAL	1800	36000	f	f	e4739f42-b559-4aa1-bd67-667487da932b	1800	f	\N	f	f	f	f	0	1	30	6	HmacSHA1	totp	3f530ff2-6206-4c5f-9624-be228bfd69b6	309f193e-90e2-4ea9-a090-7b8eeb95421c	dca06a0b-9e9c-42e1-92cf-c71a66e70239	c9bba8f8-31c8-419f-a1e6-203eca34e30f	c6294993-8aaa-426c-bf7a-e610f548f006	2592000	f	900	t	f	d615921b-b80e-42fd-9f25-b52faed09c14	0	f	0	0	616b357d-93ce-4ad0-9175-96cf9fbc6800
\.


--
-- Data for Name: realm_attribute; Type: TABLE DATA; Schema: public; Owner: keycloak
--

COPY public.realm_attribute (name, realm_id, value) FROM stdin;
_browser_header.contentSecurityPolicyReportOnly	e9abe5f8-460d-41ff-a21e-ada47aba8547	
_browser_header.xContentTypeOptions	e9abe5f8-460d-41ff-a21e-ada47aba8547	nosniff
_browser_header.referrerPolicy	e9abe5f8-460d-41ff-a21e-ada47aba8547	no-referrer
_browser_header.xRobotsTag	e9abe5f8-460d-41ff-a21e-ada47aba8547	none
_browser_header.xFrameOptions	e9abe5f8-460d-41ff-a21e-ada47aba8547	SAMEORIGIN
_browser_header.contentSecurityPolicy	e9abe5f8-460d-41ff-a21e-ada47aba8547	frame-src 'self'; frame-ancestors 'self'; object-src 'none';
_browser_header.xXSSProtection	e9abe5f8-460d-41ff-a21e-ada47aba8547	1; mode=block
_browser_header.strictTransportSecurity	e9abe5f8-460d-41ff-a21e-ada47aba8547	max-age=31536000; includeSubDomains
bruteForceProtected	e9abe5f8-460d-41ff-a21e-ada47aba8547	false
permanentLockout	e9abe5f8-460d-41ff-a21e-ada47aba8547	false
maxFailureWaitSeconds	e9abe5f8-460d-41ff-a21e-ada47aba8547	900
minimumQuickLoginWaitSeconds	e9abe5f8-460d-41ff-a21e-ada47aba8547	60
waitIncrementSeconds	e9abe5f8-460d-41ff-a21e-ada47aba8547	60
quickLoginCheckMilliSeconds	e9abe5f8-460d-41ff-a21e-ada47aba8547	1000
maxDeltaTimeSeconds	e9abe5f8-460d-41ff-a21e-ada47aba8547	43200
failureFactor	e9abe5f8-460d-41ff-a21e-ada47aba8547	30
realmReusableOtpCode	e9abe5f8-460d-41ff-a21e-ada47aba8547	false
displayName	e9abe5f8-460d-41ff-a21e-ada47aba8547	Keycloak
displayNameHtml	e9abe5f8-460d-41ff-a21e-ada47aba8547	<div class="kc-logo-text"><span>Keycloak</span></div>
defaultSignatureAlgorithm	e9abe5f8-460d-41ff-a21e-ada47aba8547	RS256
offlineSessionMaxLifespanEnabled	e9abe5f8-460d-41ff-a21e-ada47aba8547	false
offlineSessionMaxLifespan	e9abe5f8-460d-41ff-a21e-ada47aba8547	5184000
_browser_header.contentSecurityPolicyReportOnly	8ba89cf8-e84c-4cca-b865-2802d8b005ca	
_browser_header.xContentTypeOptions	8ba89cf8-e84c-4cca-b865-2802d8b005ca	nosniff
_browser_header.referrerPolicy	8ba89cf8-e84c-4cca-b865-2802d8b005ca	no-referrer
_browser_header.xRobotsTag	8ba89cf8-e84c-4cca-b865-2802d8b005ca	none
_browser_header.xFrameOptions	8ba89cf8-e84c-4cca-b865-2802d8b005ca	SAMEORIGIN
_browser_header.contentSecurityPolicy	8ba89cf8-e84c-4cca-b865-2802d8b005ca	frame-src 'self'; frame-ancestors 'self'; object-src 'none';
_browser_header.xXSSProtection	8ba89cf8-e84c-4cca-b865-2802d8b005ca	1; mode=block
_browser_header.strictTransportSecurity	8ba89cf8-e84c-4cca-b865-2802d8b005ca	max-age=31536000; includeSubDomains
bruteForceProtected	8ba89cf8-e84c-4cca-b865-2802d8b005ca	false
permanentLockout	8ba89cf8-e84c-4cca-b865-2802d8b005ca	false
maxFailureWaitSeconds	8ba89cf8-e84c-4cca-b865-2802d8b005ca	900
minimumQuickLoginWaitSeconds	8ba89cf8-e84c-4cca-b865-2802d8b005ca	60
waitIncrementSeconds	8ba89cf8-e84c-4cca-b865-2802d8b005ca	60
quickLoginCheckMilliSeconds	8ba89cf8-e84c-4cca-b865-2802d8b005ca	1000
maxDeltaTimeSeconds	8ba89cf8-e84c-4cca-b865-2802d8b005ca	43200
failureFactor	8ba89cf8-e84c-4cca-b865-2802d8b005ca	30
realmReusableOtpCode	8ba89cf8-e84c-4cca-b865-2802d8b005ca	false
defaultSignatureAlgorithm	8ba89cf8-e84c-4cca-b865-2802d8b005ca	RS256
offlineSessionMaxLifespanEnabled	8ba89cf8-e84c-4cca-b865-2802d8b005ca	false
offlineSessionMaxLifespan	8ba89cf8-e84c-4cca-b865-2802d8b005ca	5184000
actionTokenGeneratedByAdminLifespan	8ba89cf8-e84c-4cca-b865-2802d8b005ca	43200
actionTokenGeneratedByUserLifespan	8ba89cf8-e84c-4cca-b865-2802d8b005ca	300
oauth2DeviceCodeLifespan	8ba89cf8-e84c-4cca-b865-2802d8b005ca	600
oauth2DevicePollingInterval	8ba89cf8-e84c-4cca-b865-2802d8b005ca	5
webAuthnPolicyRpEntityName	8ba89cf8-e84c-4cca-b865-2802d8b005ca	keycloak
webAuthnPolicySignatureAlgorithms	8ba89cf8-e84c-4cca-b865-2802d8b005ca	ES256
webAuthnPolicyRpId	8ba89cf8-e84c-4cca-b865-2802d8b005ca	
webAuthnPolicyAttestationConveyancePreference	8ba89cf8-e84c-4cca-b865-2802d8b005ca	not specified
webAuthnPolicyAuthenticatorAttachment	8ba89cf8-e84c-4cca-b865-2802d8b005ca	not specified
webAuthnPolicyRequireResidentKey	8ba89cf8-e84c-4cca-b865-2802d8b005ca	not specified
webAuthnPolicyUserVerificationRequirement	8ba89cf8-e84c-4cca-b865-2802d8b005ca	not specified
webAuthnPolicyCreateTimeout	8ba89cf8-e84c-4cca-b865-2802d8b005ca	0
webAuthnPolicyAvoidSameAuthenticatorRegister	8ba89cf8-e84c-4cca-b865-2802d8b005ca	false
webAuthnPolicyRpEntityNamePasswordless	8ba89cf8-e84c-4cca-b865-2802d8b005ca	keycloak
webAuthnPolicySignatureAlgorithmsPasswordless	8ba89cf8-e84c-4cca-b865-2802d8b005ca	ES256
webAuthnPolicyRpIdPasswordless	8ba89cf8-e84c-4cca-b865-2802d8b005ca	
webAuthnPolicyAttestationConveyancePreferencePasswordless	8ba89cf8-e84c-4cca-b865-2802d8b005ca	not specified
webAuthnPolicyAuthenticatorAttachmentPasswordless	8ba89cf8-e84c-4cca-b865-2802d8b005ca	not specified
webAuthnPolicyRequireResidentKeyPasswordless	8ba89cf8-e84c-4cca-b865-2802d8b005ca	not specified
webAuthnPolicyUserVerificationRequirementPasswordless	8ba89cf8-e84c-4cca-b865-2802d8b005ca	not specified
webAuthnPolicyCreateTimeoutPasswordless	8ba89cf8-e84c-4cca-b865-2802d8b005ca	0
webAuthnPolicyAvoidSameAuthenticatorRegisterPasswordless	8ba89cf8-e84c-4cca-b865-2802d8b005ca	false
cibaBackchannelTokenDeliveryMode	8ba89cf8-e84c-4cca-b865-2802d8b005ca	poll
cibaExpiresIn	8ba89cf8-e84c-4cca-b865-2802d8b005ca	120
cibaInterval	8ba89cf8-e84c-4cca-b865-2802d8b005ca	5
cibaAuthRequestedUserHint	8ba89cf8-e84c-4cca-b865-2802d8b005ca	login_hint
parRequestUriLifespan	8ba89cf8-e84c-4cca-b865-2802d8b005ca	60
\.


--
-- Data for Name: realm_default_groups; Type: TABLE DATA; Schema: public; Owner: keycloak
--

COPY public.realm_default_groups (realm_id, group_id) FROM stdin;
\.


--
-- Data for Name: realm_enabled_event_types; Type: TABLE DATA; Schema: public; Owner: keycloak
--

COPY public.realm_enabled_event_types (realm_id, value) FROM stdin;
\.


--
-- Data for Name: realm_events_listeners; Type: TABLE DATA; Schema: public; Owner: keycloak
--

COPY public.realm_events_listeners (realm_id, value) FROM stdin;
e9abe5f8-460d-41ff-a21e-ada47aba8547	jboss-logging
8ba89cf8-e84c-4cca-b865-2802d8b005ca	jboss-logging
\.


--
-- Data for Name: realm_localizations; Type: TABLE DATA; Schema: public; Owner: keycloak
--

COPY public.realm_localizations (realm_id, locale, texts) FROM stdin;
\.


--
-- Data for Name: realm_required_credential; Type: TABLE DATA; Schema: public; Owner: keycloak
--

COPY public.realm_required_credential (type, form_label, input, secret, realm_id) FROM stdin;
password	password	t	t	e9abe5f8-460d-41ff-a21e-ada47aba8547
password	password	t	t	8ba89cf8-e84c-4cca-b865-2802d8b005ca
\.


--
-- Data for Name: realm_smtp_config; Type: TABLE DATA; Schema: public; Owner: keycloak
--

COPY public.realm_smtp_config (realm_id, value, name) FROM stdin;
\.


--
-- Data for Name: realm_supported_locales; Type: TABLE DATA; Schema: public; Owner: keycloak
--

COPY public.realm_supported_locales (realm_id, value) FROM stdin;
\.


--
-- Data for Name: redirect_uris; Type: TABLE DATA; Schema: public; Owner: keycloak
--

COPY public.redirect_uris (client_id, value) FROM stdin;
65ae636c-d85e-4b1b-9b7f-3cce1fcc3372	/realms/master/account/*
00a76cf0-1fb3-498b-8d01-0aa773f28db1	/realms/master/account/*
fea8af4b-842d-4ecf-b54f-97acfa55708e	/admin/master/console/*
094f2c33-6332-4c44-a019-4bce38b81868	/realms/demo/account/*
35aaeedb-7200-42ee-b867-ea4fa6dbb0fb	/realms/demo/account/*
25052911-8e99-40e5-ba66-36f49639c56d	/admin/demo/console/*
fe9d9161-94f7-4d95-9203-a5c8df6003af	http://localhost:3000/*
\.


--
-- Data for Name: required_action_config; Type: TABLE DATA; Schema: public; Owner: keycloak
--

COPY public.required_action_config (required_action_id, value, name) FROM stdin;
\.


--
-- Data for Name: required_action_provider; Type: TABLE DATA; Schema: public; Owner: keycloak
--

COPY public.required_action_provider (id, alias, name, realm_id, enabled, default_action, provider_id, priority) FROM stdin;
2fc2f180-43ad-4a2c-ba6a-e049498f4bb9	VERIFY_EMAIL	Verify Email	e9abe5f8-460d-41ff-a21e-ada47aba8547	t	f	VERIFY_EMAIL	50
7364aed1-ab1e-4ea5-96f4-7b6de739212f	UPDATE_PROFILE	Update Profile	e9abe5f8-460d-41ff-a21e-ada47aba8547	t	f	UPDATE_PROFILE	40
67cf3bdc-e59e-4520-9872-89df56ad86b6	CONFIGURE_TOTP	Configure OTP	e9abe5f8-460d-41ff-a21e-ada47aba8547	t	f	CONFIGURE_TOTP	10
a67fc1de-3dbd-4960-99b8-506055415c7f	UPDATE_PASSWORD	Update Password	e9abe5f8-460d-41ff-a21e-ada47aba8547	t	f	UPDATE_PASSWORD	30
64a8da5c-71fd-49fb-9dbc-875574569a29	TERMS_AND_CONDITIONS	Terms and Conditions	e9abe5f8-460d-41ff-a21e-ada47aba8547	f	f	TERMS_AND_CONDITIONS	20
e1e191ac-4d7a-487a-bcbf-d588999d43b8	delete_account	Delete Account	e9abe5f8-460d-41ff-a21e-ada47aba8547	f	f	delete_account	60
bc2ec58b-2d6c-43de-b300-f983c2629516	update_user_locale	Update User Locale	e9abe5f8-460d-41ff-a21e-ada47aba8547	t	f	update_user_locale	1000
56203931-c54a-4583-8505-7115679d9dac	webauthn-register	Webauthn Register	e9abe5f8-460d-41ff-a21e-ada47aba8547	t	f	webauthn-register	70
fe7e9cd9-d386-4864-aa01-5d00536deb30	webauthn-register-passwordless	Webauthn Register Passwordless	e9abe5f8-460d-41ff-a21e-ada47aba8547	t	f	webauthn-register-passwordless	80
88fef52c-97e5-4b84-b9ba-ef70462c0cf2	VERIFY_EMAIL	Verify Email	8ba89cf8-e84c-4cca-b865-2802d8b005ca	t	f	VERIFY_EMAIL	50
4241d717-d725-4009-959b-744959ded79d	UPDATE_PROFILE	Update Profile	8ba89cf8-e84c-4cca-b865-2802d8b005ca	t	f	UPDATE_PROFILE	40
ff44333b-be96-4669-9843-2307ddbada49	CONFIGURE_TOTP	Configure OTP	8ba89cf8-e84c-4cca-b865-2802d8b005ca	t	f	CONFIGURE_TOTP	10
5c44c8d7-c77c-48ff-8b4f-dda82d656afe	UPDATE_PASSWORD	Update Password	8ba89cf8-e84c-4cca-b865-2802d8b005ca	t	f	UPDATE_PASSWORD	30
6078be4e-d426-4d6f-83fe-b0d57559f152	TERMS_AND_CONDITIONS	Terms and Conditions	8ba89cf8-e84c-4cca-b865-2802d8b005ca	f	f	TERMS_AND_CONDITIONS	20
cfa50eda-68f8-47d5-980b-607017d02833	delete_account	Delete Account	8ba89cf8-e84c-4cca-b865-2802d8b005ca	f	f	delete_account	60
c8e6191f-ad6b-47d5-aed0-fc7248105f4b	update_user_locale	Update User Locale	8ba89cf8-e84c-4cca-b865-2802d8b005ca	t	f	update_user_locale	1000
b6cc7c6d-fe5e-421a-943a-fcdc8d7813fd	webauthn-register	Webauthn Register	8ba89cf8-e84c-4cca-b865-2802d8b005ca	t	f	webauthn-register	70
03093c1a-f979-479e-b94d-c324dac7da2b	webauthn-register-passwordless	Webauthn Register Passwordless	8ba89cf8-e84c-4cca-b865-2802d8b005ca	t	f	webauthn-register-passwordless	80
\.


--
-- Data for Name: resource_attribute; Type: TABLE DATA; Schema: public; Owner: keycloak
--

COPY public.resource_attribute (id, name, value, resource_id) FROM stdin;
\.


--
-- Data for Name: resource_policy; Type: TABLE DATA; Schema: public; Owner: keycloak
--

COPY public.resource_policy (resource_id, policy_id) FROM stdin;
\.


--
-- Data for Name: resource_scope; Type: TABLE DATA; Schema: public; Owner: keycloak
--

COPY public.resource_scope (resource_id, scope_id) FROM stdin;
\.


--
-- Data for Name: resource_server; Type: TABLE DATA; Schema: public; Owner: keycloak
--

COPY public.resource_server (id, allow_rs_remote_mgmt, policy_enforce_mode, decision_strategy) FROM stdin;
\.


--
-- Data for Name: resource_server_perm_ticket; Type: TABLE DATA; Schema: public; Owner: keycloak
--

COPY public.resource_server_perm_ticket (id, owner, requester, created_timestamp, granted_timestamp, resource_id, scope_id, resource_server_id, policy_id) FROM stdin;
\.


--
-- Data for Name: resource_server_policy; Type: TABLE DATA; Schema: public; Owner: keycloak
--

COPY public.resource_server_policy (id, name, description, type, decision_strategy, logic, resource_server_id, owner) FROM stdin;
\.


--
-- Data for Name: resource_server_resource; Type: TABLE DATA; Schema: public; Owner: keycloak
--

COPY public.resource_server_resource (id, name, type, icon_uri, owner, resource_server_id, owner_managed_access, display_name) FROM stdin;
\.


--
-- Data for Name: resource_server_scope; Type: TABLE DATA; Schema: public; Owner: keycloak
--

COPY public.resource_server_scope (id, name, icon_uri, resource_server_id, display_name) FROM stdin;
\.


--
-- Data for Name: resource_uris; Type: TABLE DATA; Schema: public; Owner: keycloak
--

COPY public.resource_uris (resource_id, value) FROM stdin;
\.


--
-- Data for Name: role_attribute; Type: TABLE DATA; Schema: public; Owner: keycloak
--

COPY public.role_attribute (id, role_id, name, value) FROM stdin;
\.


--
-- Data for Name: scope_mapping; Type: TABLE DATA; Schema: public; Owner: keycloak
--

COPY public.scope_mapping (client_id, role_id) FROM stdin;
00a76cf0-1fb3-498b-8d01-0aa773f28db1	a000e09d-b6ed-4bd9-b272-d59544815cda
00a76cf0-1fb3-498b-8d01-0aa773f28db1	0e803c45-99fd-4cb2-8372-cca4f5fa250f
35aaeedb-7200-42ee-b867-ea4fa6dbb0fb	d04f34b3-37bb-4b69-bf84-4366f7ded200
35aaeedb-7200-42ee-b867-ea4fa6dbb0fb	5f8c1fd3-5ee3-432f-a174-d5225157ead8
\.


--
-- Data for Name: scope_policy; Type: TABLE DATA; Schema: public; Owner: keycloak
--

COPY public.scope_policy (scope_id, policy_id) FROM stdin;
\.


--
-- Data for Name: user_attribute; Type: TABLE DATA; Schema: public; Owner: keycloak
--

COPY public.user_attribute (name, value, user_id, id) FROM stdin;
\.


--
-- Data for Name: user_consent; Type: TABLE DATA; Schema: public; Owner: keycloak
--

COPY public.user_consent (id, client_id, user_id, created_date, last_updated_date, client_storage_provider, external_client_id) FROM stdin;
\.


--
-- Data for Name: user_consent_client_scope; Type: TABLE DATA; Schema: public; Owner: keycloak
--

COPY public.user_consent_client_scope (user_consent_id, scope_id) FROM stdin;
\.


--
-- Data for Name: user_entity; Type: TABLE DATA; Schema: public; Owner: keycloak
--

COPY public.user_entity (id, email, email_constraint, email_verified, enabled, federation_link, first_name, last_name, realm_id, username, created_timestamp, service_account_client_link, not_before) FROM stdin;
6f90abf4-c385-4319-a759-27915e2c7b36	\N	61a9e9cc-667d-4261-a2c3-24cf7339c7b2	f	t	\N	\N	\N	e9abe5f8-460d-41ff-a21e-ada47aba8547	admin	1704444638734	\N	0
7a3a7599-7fc5-46a8-8af5-82bfaa0485e5	\N	03bd70aa-4066-4ae9-b230-15692929d217	f	t	\N	\N	\N	8ba89cf8-e84c-4cca-b865-2802d8b005ca	service-account-nextjs-demo	1704444772827	fe9d9161-94f7-4d95-9203-a5c8df6003af	0
df8e2cd0-047c-4022-b0d2-926382d17bb0	demo@demo.org	demo@demo.org	f	t	\N	Demo	User	8ba89cf8-e84c-4cca-b865-2802d8b005ca	demo	1704444826599	\N	0
\.


--
-- Data for Name: user_federation_config; Type: TABLE DATA; Schema: public; Owner: keycloak
--

COPY public.user_federation_config (user_federation_provider_id, value, name) FROM stdin;
\.


--
-- Data for Name: user_federation_mapper; Type: TABLE DATA; Schema: public; Owner: keycloak
--

COPY public.user_federation_mapper (id, name, federation_provider_id, federation_mapper_type, realm_id) FROM stdin;
\.


--
-- Data for Name: user_federation_mapper_config; Type: TABLE DATA; Schema: public; Owner: keycloak
--

COPY public.user_federation_mapper_config (user_federation_mapper_id, value, name) FROM stdin;
\.


--
-- Data for Name: user_federation_provider; Type: TABLE DATA; Schema: public; Owner: keycloak
--

COPY public.user_federation_provider (id, changed_sync_period, display_name, full_sync_period, last_sync, priority, provider_name, realm_id) FROM stdin;
\.


--
-- Data for Name: user_group_membership; Type: TABLE DATA; Schema: public; Owner: keycloak
--

COPY public.user_group_membership (group_id, user_id) FROM stdin;
\.


--
-- Data for Name: user_required_action; Type: TABLE DATA; Schema: public; Owner: keycloak
--

COPY public.user_required_action (user_id, required_action) FROM stdin;
\.


--
-- Data for Name: user_role_mapping; Type: TABLE DATA; Schema: public; Owner: keycloak
--

COPY public.user_role_mapping (role_id, user_id) FROM stdin;
2085ed59-03e6-4a5f-ace6-2ef054404862	6f90abf4-c385-4319-a759-27915e2c7b36
fdda8650-93bd-4ef4-a6f0-a1b3335084cc	6f90abf4-c385-4319-a759-27915e2c7b36
1936228d-5862-409c-a4f5-21047d01d071	6f90abf4-c385-4319-a759-27915e2c7b36
d21cbda3-85de-46f7-a155-b5fa8a650551	6f90abf4-c385-4319-a759-27915e2c7b36
488e5184-286d-4a09-8984-e5e18559444f	6f90abf4-c385-4319-a759-27915e2c7b36
ab15c588-64cb-4fcb-a73e-76bcfa52ce3d	6f90abf4-c385-4319-a759-27915e2c7b36
b4ff58f9-782e-49e3-895e-6e96b3e064ec	6f90abf4-c385-4319-a759-27915e2c7b36
9108dd2d-ffbe-4a2b-869d-b436fd4f28f4	6f90abf4-c385-4319-a759-27915e2c7b36
95f01605-cd80-4701-99c6-a848a93f8864	6f90abf4-c385-4319-a759-27915e2c7b36
25e71cd3-de55-4127-8650-e5393a725379	6f90abf4-c385-4319-a759-27915e2c7b36
48f63132-a46a-44c0-b16f-52b52f681ab1	6f90abf4-c385-4319-a759-27915e2c7b36
a67be111-26f9-4138-b23c-63c46f61669d	6f90abf4-c385-4319-a759-27915e2c7b36
006bc68c-155b-4aea-8570-107f5fe15ad0	6f90abf4-c385-4319-a759-27915e2c7b36
24ce9836-6f4a-4220-8b3d-cb4428ff6345	6f90abf4-c385-4319-a759-27915e2c7b36
563c9c9e-55db-481c-8948-1374791f6d28	6f90abf4-c385-4319-a759-27915e2c7b36
d32093a0-df45-4bf0-8b75-a6729bc93a5d	6f90abf4-c385-4319-a759-27915e2c7b36
31bf2f60-54ca-4933-919a-efccdfbfbf09	6f90abf4-c385-4319-a759-27915e2c7b36
681fcb52-e769-43a9-987e-e2c9a3578f77	6f90abf4-c385-4319-a759-27915e2c7b36
dcae9340-ceab-4079-8b0f-b1e169e908a9	6f90abf4-c385-4319-a759-27915e2c7b36
616b357d-93ce-4ad0-9175-96cf9fbc6800	7a3a7599-7fc5-46a8-8af5-82bfaa0485e5
616b357d-93ce-4ad0-9175-96cf9fbc6800	df8e2cd0-047c-4022-b0d2-926382d17bb0
b5d1023e-f8a8-4ca9-adaf-2e82b50e0b40	7a3a7599-7fc5-46a8-8af5-82bfaa0485e5
\.


--
-- Data for Name: user_session; Type: TABLE DATA; Schema: public; Owner: keycloak
--

COPY public.user_session (id, auth_method, ip_address, last_session_refresh, login_username, realm_id, remember_me, started, user_id, user_session_state, broker_session_id, broker_user_id) FROM stdin;
\.


--
-- Data for Name: user_session_note; Type: TABLE DATA; Schema: public; Owner: keycloak
--

COPY public.user_session_note (user_session, name, value) FROM stdin;
\.


--
-- Data for Name: username_login_failure; Type: TABLE DATA; Schema: public; Owner: keycloak
--

COPY public.username_login_failure (realm_id, username, failed_login_not_before, last_failure, last_ip_failure, num_failures) FROM stdin;
\.


--
-- Data for Name: web_origins; Type: TABLE DATA; Schema: public; Owner: keycloak
--

COPY public.web_origins (client_id, value) FROM stdin;
fea8af4b-842d-4ecf-b54f-97acfa55708e	+
25052911-8e99-40e5-ba66-36f49639c56d	+
fe9d9161-94f7-4d95-9203-a5c8df6003af	http://localhost:3000
\.


--
-- Name: username_login_failure CONSTRAINT_17-2; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.username_login_failure
    ADD CONSTRAINT "CONSTRAINT_17-2" PRIMARY KEY (realm_id, username);


--
-- Name: keycloak_role UK_J3RWUVD56ONTGSUHOGM184WW2-2; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.keycloak_role
    ADD CONSTRAINT "UK_J3RWUVD56ONTGSUHOGM184WW2-2" UNIQUE (name, client_realm_constraint);


--
-- Name: client_auth_flow_bindings c_cli_flow_bind; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.client_auth_flow_bindings
    ADD CONSTRAINT c_cli_flow_bind PRIMARY KEY (client_id, binding_name);


--
-- Name: client_scope_client c_cli_scope_bind; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.client_scope_client
    ADD CONSTRAINT c_cli_scope_bind PRIMARY KEY (client_id, scope_id);


--
-- Name: client_initial_access cnstr_client_init_acc_pk; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.client_initial_access
    ADD CONSTRAINT cnstr_client_init_acc_pk PRIMARY KEY (id);


--
-- Name: realm_default_groups con_group_id_def_groups; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.realm_default_groups
    ADD CONSTRAINT con_group_id_def_groups UNIQUE (group_id);


--
-- Name: broker_link constr_broker_link_pk; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.broker_link
    ADD CONSTRAINT constr_broker_link_pk PRIMARY KEY (identity_provider, user_id);


--
-- Name: client_user_session_note constr_cl_usr_ses_note; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.client_user_session_note
    ADD CONSTRAINT constr_cl_usr_ses_note PRIMARY KEY (client_session, name);


--
-- Name: component_config constr_component_config_pk; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.component_config
    ADD CONSTRAINT constr_component_config_pk PRIMARY KEY (id);


--
-- Name: component constr_component_pk; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.component
    ADD CONSTRAINT constr_component_pk PRIMARY KEY (id);


--
-- Name: fed_user_required_action constr_fed_required_action; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.fed_user_required_action
    ADD CONSTRAINT constr_fed_required_action PRIMARY KEY (required_action, user_id);


--
-- Name: fed_user_attribute constr_fed_user_attr_pk; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.fed_user_attribute
    ADD CONSTRAINT constr_fed_user_attr_pk PRIMARY KEY (id);


--
-- Name: fed_user_consent constr_fed_user_consent_pk; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.fed_user_consent
    ADD CONSTRAINT constr_fed_user_consent_pk PRIMARY KEY (id);


--
-- Name: fed_user_credential constr_fed_user_cred_pk; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.fed_user_credential
    ADD CONSTRAINT constr_fed_user_cred_pk PRIMARY KEY (id);


--
-- Name: fed_user_group_membership constr_fed_user_group; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.fed_user_group_membership
    ADD CONSTRAINT constr_fed_user_group PRIMARY KEY (group_id, user_id);


--
-- Name: fed_user_role_mapping constr_fed_user_role; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.fed_user_role_mapping
    ADD CONSTRAINT constr_fed_user_role PRIMARY KEY (role_id, user_id);


--
-- Name: federated_user constr_federated_user; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.federated_user
    ADD CONSTRAINT constr_federated_user PRIMARY KEY (id);


--
-- Name: realm_default_groups constr_realm_default_groups; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.realm_default_groups
    ADD CONSTRAINT constr_realm_default_groups PRIMARY KEY (realm_id, group_id);


--
-- Name: realm_enabled_event_types constr_realm_enabl_event_types; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.realm_enabled_event_types
    ADD CONSTRAINT constr_realm_enabl_event_types PRIMARY KEY (realm_id, value);


--
-- Name: realm_events_listeners constr_realm_events_listeners; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.realm_events_listeners
    ADD CONSTRAINT constr_realm_events_listeners PRIMARY KEY (realm_id, value);


--
-- Name: realm_supported_locales constr_realm_supported_locales; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.realm_supported_locales
    ADD CONSTRAINT constr_realm_supported_locales PRIMARY KEY (realm_id, value);


--
-- Name: identity_provider constraint_2b; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.identity_provider
    ADD CONSTRAINT constraint_2b PRIMARY KEY (internal_id);


--
-- Name: client_attributes constraint_3c; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.client_attributes
    ADD CONSTRAINT constraint_3c PRIMARY KEY (client_id, name);


--
-- Name: event_entity constraint_4; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.event_entity
    ADD CONSTRAINT constraint_4 PRIMARY KEY (id);


--
-- Name: federated_identity constraint_40; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.federated_identity
    ADD CONSTRAINT constraint_40 PRIMARY KEY (identity_provider, user_id);


--
-- Name: realm constraint_4a; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.realm
    ADD CONSTRAINT constraint_4a PRIMARY KEY (id);


--
-- Name: client_session_role constraint_5; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.client_session_role
    ADD CONSTRAINT constraint_5 PRIMARY KEY (client_session, role_id);


--
-- Name: user_session constraint_57; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.user_session
    ADD CONSTRAINT constraint_57 PRIMARY KEY (id);


--
-- Name: user_federation_provider constraint_5c; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.user_federation_provider
    ADD CONSTRAINT constraint_5c PRIMARY KEY (id);


--
-- Name: client_session_note constraint_5e; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.client_session_note
    ADD CONSTRAINT constraint_5e PRIMARY KEY (client_session, name);


--
-- Name: client constraint_7; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.client
    ADD CONSTRAINT constraint_7 PRIMARY KEY (id);


--
-- Name: client_session constraint_8; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.client_session
    ADD CONSTRAINT constraint_8 PRIMARY KEY (id);


--
-- Name: scope_mapping constraint_81; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.scope_mapping
    ADD CONSTRAINT constraint_81 PRIMARY KEY (client_id, role_id);


--
-- Name: client_node_registrations constraint_84; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.client_node_registrations
    ADD CONSTRAINT constraint_84 PRIMARY KEY (client_id, name);


--
-- Name: realm_attribute constraint_9; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.realm_attribute
    ADD CONSTRAINT constraint_9 PRIMARY KEY (name, realm_id);


--
-- Name: realm_required_credential constraint_92; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.realm_required_credential
    ADD CONSTRAINT constraint_92 PRIMARY KEY (realm_id, type);


--
-- Name: keycloak_role constraint_a; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.keycloak_role
    ADD CONSTRAINT constraint_a PRIMARY KEY (id);


--
-- Name: admin_event_entity constraint_admin_event_entity; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.admin_event_entity
    ADD CONSTRAINT constraint_admin_event_entity PRIMARY KEY (id);


--
-- Name: authenticator_config_entry constraint_auth_cfg_pk; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.authenticator_config_entry
    ADD CONSTRAINT constraint_auth_cfg_pk PRIMARY KEY (authenticator_id, name);


--
-- Name: authentication_execution constraint_auth_exec_pk; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.authentication_execution
    ADD CONSTRAINT constraint_auth_exec_pk PRIMARY KEY (id);


--
-- Name: authentication_flow constraint_auth_flow_pk; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.authentication_flow
    ADD CONSTRAINT constraint_auth_flow_pk PRIMARY KEY (id);


--
-- Name: authenticator_config constraint_auth_pk; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.authenticator_config
    ADD CONSTRAINT constraint_auth_pk PRIMARY KEY (id);


--
-- Name: client_session_auth_status constraint_auth_status_pk; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.client_session_auth_status
    ADD CONSTRAINT constraint_auth_status_pk PRIMARY KEY (client_session, authenticator);


--
-- Name: user_role_mapping constraint_c; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.user_role_mapping
    ADD CONSTRAINT constraint_c PRIMARY KEY (role_id, user_id);


--
-- Name: composite_role constraint_composite_role; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.composite_role
    ADD CONSTRAINT constraint_composite_role PRIMARY KEY (composite, child_role);


--
-- Name: client_session_prot_mapper constraint_cs_pmp_pk; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.client_session_prot_mapper
    ADD CONSTRAINT constraint_cs_pmp_pk PRIMARY KEY (client_session, protocol_mapper_id);


--
-- Name: identity_provider_config constraint_d; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.identity_provider_config
    ADD CONSTRAINT constraint_d PRIMARY KEY (identity_provider_id, name);


--
-- Name: policy_config constraint_dpc; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.policy_config
    ADD CONSTRAINT constraint_dpc PRIMARY KEY (policy_id, name);


--
-- Name: realm_smtp_config constraint_e; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.realm_smtp_config
    ADD CONSTRAINT constraint_e PRIMARY KEY (realm_id, name);


--
-- Name: credential constraint_f; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.credential
    ADD CONSTRAINT constraint_f PRIMARY KEY (id);


--
-- Name: user_federation_config constraint_f9; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.user_federation_config
    ADD CONSTRAINT constraint_f9 PRIMARY KEY (user_federation_provider_id, name);


--
-- Name: resource_server_perm_ticket constraint_fapmt; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.resource_server_perm_ticket
    ADD CONSTRAINT constraint_fapmt PRIMARY KEY (id);


--
-- Name: resource_server_resource constraint_farsr; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.resource_server_resource
    ADD CONSTRAINT constraint_farsr PRIMARY KEY (id);


--
-- Name: resource_server_policy constraint_farsrp; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.resource_server_policy
    ADD CONSTRAINT constraint_farsrp PRIMARY KEY (id);


--
-- Name: associated_policy constraint_farsrpap; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.associated_policy
    ADD CONSTRAINT constraint_farsrpap PRIMARY KEY (policy_id, associated_policy_id);


--
-- Name: resource_policy constraint_farsrpp; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.resource_policy
    ADD CONSTRAINT constraint_farsrpp PRIMARY KEY (resource_id, policy_id);


--
-- Name: resource_server_scope constraint_farsrs; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.resource_server_scope
    ADD CONSTRAINT constraint_farsrs PRIMARY KEY (id);


--
-- Name: resource_scope constraint_farsrsp; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.resource_scope
    ADD CONSTRAINT constraint_farsrsp PRIMARY KEY (resource_id, scope_id);


--
-- Name: scope_policy constraint_farsrsps; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.scope_policy
    ADD CONSTRAINT constraint_farsrsps PRIMARY KEY (scope_id, policy_id);


--
-- Name: user_entity constraint_fb; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.user_entity
    ADD CONSTRAINT constraint_fb PRIMARY KEY (id);


--
-- Name: user_federation_mapper_config constraint_fedmapper_cfg_pm; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.user_federation_mapper_config
    ADD CONSTRAINT constraint_fedmapper_cfg_pm PRIMARY KEY (user_federation_mapper_id, name);


--
-- Name: user_federation_mapper constraint_fedmapperpm; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.user_federation_mapper
    ADD CONSTRAINT constraint_fedmapperpm PRIMARY KEY (id);


--
-- Name: fed_user_consent_cl_scope constraint_fgrntcsnt_clsc_pm; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.fed_user_consent_cl_scope
    ADD CONSTRAINT constraint_fgrntcsnt_clsc_pm PRIMARY KEY (user_consent_id, scope_id);


--
-- Name: user_consent_client_scope constraint_grntcsnt_clsc_pm; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.user_consent_client_scope
    ADD CONSTRAINT constraint_grntcsnt_clsc_pm PRIMARY KEY (user_consent_id, scope_id);


--
-- Name: user_consent constraint_grntcsnt_pm; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.user_consent
    ADD CONSTRAINT constraint_grntcsnt_pm PRIMARY KEY (id);


--
-- Name: keycloak_group constraint_group; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.keycloak_group
    ADD CONSTRAINT constraint_group PRIMARY KEY (id);


--
-- Name: group_attribute constraint_group_attribute_pk; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.group_attribute
    ADD CONSTRAINT constraint_group_attribute_pk PRIMARY KEY (id);


--
-- Name: group_role_mapping constraint_group_role; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.group_role_mapping
    ADD CONSTRAINT constraint_group_role PRIMARY KEY (role_id, group_id);


--
-- Name: identity_provider_mapper constraint_idpm; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.identity_provider_mapper
    ADD CONSTRAINT constraint_idpm PRIMARY KEY (id);


--
-- Name: idp_mapper_config constraint_idpmconfig; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.idp_mapper_config
    ADD CONSTRAINT constraint_idpmconfig PRIMARY KEY (idp_mapper_id, name);


--
-- Name: migration_model constraint_migmod; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.migration_model
    ADD CONSTRAINT constraint_migmod PRIMARY KEY (id);


--
-- Name: offline_client_session constraint_offl_cl_ses_pk3; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.offline_client_session
    ADD CONSTRAINT constraint_offl_cl_ses_pk3 PRIMARY KEY (user_session_id, client_id, client_storage_provider, external_client_id, offline_flag);


--
-- Name: offline_user_session constraint_offl_us_ses_pk2; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.offline_user_session
    ADD CONSTRAINT constraint_offl_us_ses_pk2 PRIMARY KEY (user_session_id, offline_flag);


--
-- Name: protocol_mapper constraint_pcm; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.protocol_mapper
    ADD CONSTRAINT constraint_pcm PRIMARY KEY (id);


--
-- Name: protocol_mapper_config constraint_pmconfig; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.protocol_mapper_config
    ADD CONSTRAINT constraint_pmconfig PRIMARY KEY (protocol_mapper_id, name);


--
-- Name: redirect_uris constraint_redirect_uris; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.redirect_uris
    ADD CONSTRAINT constraint_redirect_uris PRIMARY KEY (client_id, value);


--
-- Name: required_action_config constraint_req_act_cfg_pk; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.required_action_config
    ADD CONSTRAINT constraint_req_act_cfg_pk PRIMARY KEY (required_action_id, name);


--
-- Name: required_action_provider constraint_req_act_prv_pk; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.required_action_provider
    ADD CONSTRAINT constraint_req_act_prv_pk PRIMARY KEY (id);


--
-- Name: user_required_action constraint_required_action; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.user_required_action
    ADD CONSTRAINT constraint_required_action PRIMARY KEY (required_action, user_id);


--
-- Name: resource_uris constraint_resour_uris_pk; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.resource_uris
    ADD CONSTRAINT constraint_resour_uris_pk PRIMARY KEY (resource_id, value);


--
-- Name: role_attribute constraint_role_attribute_pk; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.role_attribute
    ADD CONSTRAINT constraint_role_attribute_pk PRIMARY KEY (id);


--
-- Name: user_attribute constraint_user_attribute_pk; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.user_attribute
    ADD CONSTRAINT constraint_user_attribute_pk PRIMARY KEY (id);


--
-- Name: user_group_membership constraint_user_group; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.user_group_membership
    ADD CONSTRAINT constraint_user_group PRIMARY KEY (group_id, user_id);


--
-- Name: user_session_note constraint_usn_pk; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.user_session_note
    ADD CONSTRAINT constraint_usn_pk PRIMARY KEY (user_session, name);


--
-- Name: web_origins constraint_web_origins; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.web_origins
    ADD CONSTRAINT constraint_web_origins PRIMARY KEY (client_id, value);


--
-- Name: databasechangeloglock databasechangeloglock_pkey; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.databasechangeloglock
    ADD CONSTRAINT databasechangeloglock_pkey PRIMARY KEY (id);


--
-- Name: client_scope_attributes pk_cl_tmpl_attr; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.client_scope_attributes
    ADD CONSTRAINT pk_cl_tmpl_attr PRIMARY KEY (scope_id, name);


--
-- Name: client_scope pk_cli_template; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.client_scope
    ADD CONSTRAINT pk_cli_template PRIMARY KEY (id);


--
-- Name: resource_server pk_resource_server; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.resource_server
    ADD CONSTRAINT pk_resource_server PRIMARY KEY (id);


--
-- Name: client_scope_role_mapping pk_template_scope; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.client_scope_role_mapping
    ADD CONSTRAINT pk_template_scope PRIMARY KEY (scope_id, role_id);


--
-- Name: default_client_scope r_def_cli_scope_bind; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.default_client_scope
    ADD CONSTRAINT r_def_cli_scope_bind PRIMARY KEY (realm_id, scope_id);


--
-- Name: realm_localizations realm_localizations_pkey; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.realm_localizations
    ADD CONSTRAINT realm_localizations_pkey PRIMARY KEY (realm_id, locale);


--
-- Name: resource_attribute res_attr_pk; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.resource_attribute
    ADD CONSTRAINT res_attr_pk PRIMARY KEY (id);


--
-- Name: keycloak_group sibling_names; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.keycloak_group
    ADD CONSTRAINT sibling_names UNIQUE (realm_id, parent_group, name);


--
-- Name: identity_provider uk_2daelwnibji49avxsrtuf6xj33; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.identity_provider
    ADD CONSTRAINT uk_2daelwnibji49avxsrtuf6xj33 UNIQUE (provider_alias, realm_id);


--
-- Name: client uk_b71cjlbenv945rb6gcon438at; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.client
    ADD CONSTRAINT uk_b71cjlbenv945rb6gcon438at UNIQUE (realm_id, client_id);


--
-- Name: client_scope uk_cli_scope; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.client_scope
    ADD CONSTRAINT uk_cli_scope UNIQUE (realm_id, name);


--
-- Name: user_entity uk_dykn684sl8up1crfei6eckhd7; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.user_entity
    ADD CONSTRAINT uk_dykn684sl8up1crfei6eckhd7 UNIQUE (realm_id, email_constraint);


--
-- Name: resource_server_resource uk_frsr6t700s9v50bu18ws5ha6; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.resource_server_resource
    ADD CONSTRAINT uk_frsr6t700s9v50bu18ws5ha6 UNIQUE (name, owner, resource_server_id);


--
-- Name: resource_server_perm_ticket uk_frsr6t700s9v50bu18ws5pmt; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.resource_server_perm_ticket
    ADD CONSTRAINT uk_frsr6t700s9v50bu18ws5pmt UNIQUE (owner, requester, resource_server_id, resource_id, scope_id);


--
-- Name: resource_server_policy uk_frsrpt700s9v50bu18ws5ha6; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.resource_server_policy
    ADD CONSTRAINT uk_frsrpt700s9v50bu18ws5ha6 UNIQUE (name, resource_server_id);


--
-- Name: resource_server_scope uk_frsrst700s9v50bu18ws5ha6; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.resource_server_scope
    ADD CONSTRAINT uk_frsrst700s9v50bu18ws5ha6 UNIQUE (name, resource_server_id);


--
-- Name: user_consent uk_jkuwuvd56ontgsuhogm8uewrt; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.user_consent
    ADD CONSTRAINT uk_jkuwuvd56ontgsuhogm8uewrt UNIQUE (client_id, client_storage_provider, external_client_id, user_id);


--
-- Name: realm uk_orvsdmla56612eaefiq6wl5oi; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.realm
    ADD CONSTRAINT uk_orvsdmla56612eaefiq6wl5oi UNIQUE (name);


--
-- Name: user_entity uk_ru8tt6t700s9v50bu18ws5ha6; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.user_entity
    ADD CONSTRAINT uk_ru8tt6t700s9v50bu18ws5ha6 UNIQUE (realm_id, username);


--
-- Name: idx_admin_event_time; Type: INDEX; Schema: public; Owner: keycloak
--

CREATE INDEX idx_admin_event_time ON public.admin_event_entity USING btree (realm_id, admin_event_time);


--
-- Name: idx_assoc_pol_assoc_pol_id; Type: INDEX; Schema: public; Owner: keycloak
--

CREATE INDEX idx_assoc_pol_assoc_pol_id ON public.associated_policy USING btree (associated_policy_id);


--
-- Name: idx_auth_config_realm; Type: INDEX; Schema: public; Owner: keycloak
--

CREATE INDEX idx_auth_config_realm ON public.authenticator_config USING btree (realm_id);


--
-- Name: idx_auth_exec_flow; Type: INDEX; Schema: public; Owner: keycloak
--

CREATE INDEX idx_auth_exec_flow ON public.authentication_execution USING btree (flow_id);


--
-- Name: idx_auth_exec_realm_flow; Type: INDEX; Schema: public; Owner: keycloak
--

CREATE INDEX idx_auth_exec_realm_flow ON public.authentication_execution USING btree (realm_id, flow_id);


--
-- Name: idx_auth_flow_realm; Type: INDEX; Schema: public; Owner: keycloak
--

CREATE INDEX idx_auth_flow_realm ON public.authentication_flow USING btree (realm_id);


--
-- Name: idx_cl_clscope; Type: INDEX; Schema: public; Owner: keycloak
--

CREATE INDEX idx_cl_clscope ON public.client_scope_client USING btree (scope_id);


--
-- Name: idx_client_id; Type: INDEX; Schema: public; Owner: keycloak
--

CREATE INDEX idx_client_id ON public.client USING btree (client_id);


--
-- Name: idx_client_init_acc_realm; Type: INDEX; Schema: public; Owner: keycloak
--

CREATE INDEX idx_client_init_acc_realm ON public.client_initial_access USING btree (realm_id);


--
-- Name: idx_client_session_session; Type: INDEX; Schema: public; Owner: keycloak
--

CREATE INDEX idx_client_session_session ON public.client_session USING btree (session_id);


--
-- Name: idx_clscope_attrs; Type: INDEX; Schema: public; Owner: keycloak
--

CREATE INDEX idx_clscope_attrs ON public.client_scope_attributes USING btree (scope_id);


--
-- Name: idx_clscope_cl; Type: INDEX; Schema: public; Owner: keycloak
--

CREATE INDEX idx_clscope_cl ON public.client_scope_client USING btree (client_id);


--
-- Name: idx_clscope_protmap; Type: INDEX; Schema: public; Owner: keycloak
--

CREATE INDEX idx_clscope_protmap ON public.protocol_mapper USING btree (client_scope_id);


--
-- Name: idx_clscope_role; Type: INDEX; Schema: public; Owner: keycloak
--

CREATE INDEX idx_clscope_role ON public.client_scope_role_mapping USING btree (scope_id);


--
-- Name: idx_compo_config_compo; Type: INDEX; Schema: public; Owner: keycloak
--

CREATE INDEX idx_compo_config_compo ON public.component_config USING btree (component_id);


--
-- Name: idx_component_provider_type; Type: INDEX; Schema: public; Owner: keycloak
--

CREATE INDEX idx_component_provider_type ON public.component USING btree (provider_type);


--
-- Name: idx_component_realm; Type: INDEX; Schema: public; Owner: keycloak
--

CREATE INDEX idx_component_realm ON public.component USING btree (realm_id);


--
-- Name: idx_composite; Type: INDEX; Schema: public; Owner: keycloak
--

CREATE INDEX idx_composite ON public.composite_role USING btree (composite);


--
-- Name: idx_composite_child; Type: INDEX; Schema: public; Owner: keycloak
--

CREATE INDEX idx_composite_child ON public.composite_role USING btree (child_role);


--
-- Name: idx_defcls_realm; Type: INDEX; Schema: public; Owner: keycloak
--

CREATE INDEX idx_defcls_realm ON public.default_client_scope USING btree (realm_id);


--
-- Name: idx_defcls_scope; Type: INDEX; Schema: public; Owner: keycloak
--

CREATE INDEX idx_defcls_scope ON public.default_client_scope USING btree (scope_id);


--
-- Name: idx_event_time; Type: INDEX; Schema: public; Owner: keycloak
--

CREATE INDEX idx_event_time ON public.event_entity USING btree (realm_id, event_time);


--
-- Name: idx_fedidentity_feduser; Type: INDEX; Schema: public; Owner: keycloak
--

CREATE INDEX idx_fedidentity_feduser ON public.federated_identity USING btree (federated_user_id);


--
-- Name: idx_fedidentity_user; Type: INDEX; Schema: public; Owner: keycloak
--

CREATE INDEX idx_fedidentity_user ON public.federated_identity USING btree (user_id);


--
-- Name: idx_fu_attribute; Type: INDEX; Schema: public; Owner: keycloak
--

CREATE INDEX idx_fu_attribute ON public.fed_user_attribute USING btree (user_id, realm_id, name);


--
-- Name: idx_fu_cnsnt_ext; Type: INDEX; Schema: public; Owner: keycloak
--

CREATE INDEX idx_fu_cnsnt_ext ON public.fed_user_consent USING btree (user_id, client_storage_provider, external_client_id);


--
-- Name: idx_fu_consent; Type: INDEX; Schema: public; Owner: keycloak
--

CREATE INDEX idx_fu_consent ON public.fed_user_consent USING btree (user_id, client_id);


--
-- Name: idx_fu_consent_ru; Type: INDEX; Schema: public; Owner: keycloak
--

CREATE INDEX idx_fu_consent_ru ON public.fed_user_consent USING btree (realm_id, user_id);


--
-- Name: idx_fu_credential; Type: INDEX; Schema: public; Owner: keycloak
--

CREATE INDEX idx_fu_credential ON public.fed_user_credential USING btree (user_id, type);


--
-- Name: idx_fu_credential_ru; Type: INDEX; Schema: public; Owner: keycloak
--

CREATE INDEX idx_fu_credential_ru ON public.fed_user_credential USING btree (realm_id, user_id);


--
-- Name: idx_fu_group_membership; Type: INDEX; Schema: public; Owner: keycloak
--

CREATE INDEX idx_fu_group_membership ON public.fed_user_group_membership USING btree (user_id, group_id);


--
-- Name: idx_fu_group_membership_ru; Type: INDEX; Schema: public; Owner: keycloak
--

CREATE INDEX idx_fu_group_membership_ru ON public.fed_user_group_membership USING btree (realm_id, user_id);


--
-- Name: idx_fu_required_action; Type: INDEX; Schema: public; Owner: keycloak
--

CREATE INDEX idx_fu_required_action ON public.fed_user_required_action USING btree (user_id, required_action);


--
-- Name: idx_fu_required_action_ru; Type: INDEX; Schema: public; Owner: keycloak
--

CREATE INDEX idx_fu_required_action_ru ON public.fed_user_required_action USING btree (realm_id, user_id);


--
-- Name: idx_fu_role_mapping; Type: INDEX; Schema: public; Owner: keycloak
--

CREATE INDEX idx_fu_role_mapping ON public.fed_user_role_mapping USING btree (user_id, role_id);


--
-- Name: idx_fu_role_mapping_ru; Type: INDEX; Schema: public; Owner: keycloak
--

CREATE INDEX idx_fu_role_mapping_ru ON public.fed_user_role_mapping USING btree (realm_id, user_id);


--
-- Name: idx_group_att_by_name_value; Type: INDEX; Schema: public; Owner: keycloak
--

CREATE INDEX idx_group_att_by_name_value ON public.group_attribute USING btree (name, ((value)::character varying(250)));


--
-- Name: idx_group_attr_group; Type: INDEX; Schema: public; Owner: keycloak
--

CREATE INDEX idx_group_attr_group ON public.group_attribute USING btree (group_id);


--
-- Name: idx_group_role_mapp_group; Type: INDEX; Schema: public; Owner: keycloak
--

CREATE INDEX idx_group_role_mapp_group ON public.group_role_mapping USING btree (group_id);


--
-- Name: idx_id_prov_mapp_realm; Type: INDEX; Schema: public; Owner: keycloak
--

CREATE INDEX idx_id_prov_mapp_realm ON public.identity_provider_mapper USING btree (realm_id);


--
-- Name: idx_ident_prov_realm; Type: INDEX; Schema: public; Owner: keycloak
--

CREATE INDEX idx_ident_prov_realm ON public.identity_provider USING btree (realm_id);


--
-- Name: idx_keycloak_role_client; Type: INDEX; Schema: public; Owner: keycloak
--

CREATE INDEX idx_keycloak_role_client ON public.keycloak_role USING btree (client);


--
-- Name: idx_keycloak_role_realm; Type: INDEX; Schema: public; Owner: keycloak
--

CREATE INDEX idx_keycloak_role_realm ON public.keycloak_role USING btree (realm);


--
-- Name: idx_offline_css_preload; Type: INDEX; Schema: public; Owner: keycloak
--

CREATE INDEX idx_offline_css_preload ON public.offline_client_session USING btree (client_id, offline_flag);


--
-- Name: idx_offline_uss_by_user; Type: INDEX; Schema: public; Owner: keycloak
--

CREATE INDEX idx_offline_uss_by_user ON public.offline_user_session USING btree (user_id, realm_id, offline_flag);


--
-- Name: idx_offline_uss_by_usersess; Type: INDEX; Schema: public; Owner: keycloak
--

CREATE INDEX idx_offline_uss_by_usersess ON public.offline_user_session USING btree (realm_id, offline_flag, user_session_id);


--
-- Name: idx_offline_uss_createdon; Type: INDEX; Schema: public; Owner: keycloak
--

CREATE INDEX idx_offline_uss_createdon ON public.offline_user_session USING btree (created_on);


--
-- Name: idx_offline_uss_preload; Type: INDEX; Schema: public; Owner: keycloak
--

CREATE INDEX idx_offline_uss_preload ON public.offline_user_session USING btree (offline_flag, created_on, user_session_id);


--
-- Name: idx_protocol_mapper_client; Type: INDEX; Schema: public; Owner: keycloak
--

CREATE INDEX idx_protocol_mapper_client ON public.protocol_mapper USING btree (client_id);


--
-- Name: idx_realm_attr_realm; Type: INDEX; Schema: public; Owner: keycloak
--

CREATE INDEX idx_realm_attr_realm ON public.realm_attribute USING btree (realm_id);


--
-- Name: idx_realm_clscope; Type: INDEX; Schema: public; Owner: keycloak
--

CREATE INDEX idx_realm_clscope ON public.client_scope USING btree (realm_id);


--
-- Name: idx_realm_def_grp_realm; Type: INDEX; Schema: public; Owner: keycloak
--

CREATE INDEX idx_realm_def_grp_realm ON public.realm_default_groups USING btree (realm_id);


--
-- Name: idx_realm_evt_list_realm; Type: INDEX; Schema: public; Owner: keycloak
--

CREATE INDEX idx_realm_evt_list_realm ON public.realm_events_listeners USING btree (realm_id);


--
-- Name: idx_realm_evt_types_realm; Type: INDEX; Schema: public; Owner: keycloak
--

CREATE INDEX idx_realm_evt_types_realm ON public.realm_enabled_event_types USING btree (realm_id);


--
-- Name: idx_realm_master_adm_cli; Type: INDEX; Schema: public; Owner: keycloak
--

CREATE INDEX idx_realm_master_adm_cli ON public.realm USING btree (master_admin_client);


--
-- Name: idx_realm_supp_local_realm; Type: INDEX; Schema: public; Owner: keycloak
--

CREATE INDEX idx_realm_supp_local_realm ON public.realm_supported_locales USING btree (realm_id);


--
-- Name: idx_redir_uri_client; Type: INDEX; Schema: public; Owner: keycloak
--

CREATE INDEX idx_redir_uri_client ON public.redirect_uris USING btree (client_id);


--
-- Name: idx_req_act_prov_realm; Type: INDEX; Schema: public; Owner: keycloak
--

CREATE INDEX idx_req_act_prov_realm ON public.required_action_provider USING btree (realm_id);


--
-- Name: idx_res_policy_policy; Type: INDEX; Schema: public; Owner: keycloak
--

CREATE INDEX idx_res_policy_policy ON public.resource_policy USING btree (policy_id);


--
-- Name: idx_res_scope_scope; Type: INDEX; Schema: public; Owner: keycloak
--

CREATE INDEX idx_res_scope_scope ON public.resource_scope USING btree (scope_id);


--
-- Name: idx_res_serv_pol_res_serv; Type: INDEX; Schema: public; Owner: keycloak
--

CREATE INDEX idx_res_serv_pol_res_serv ON public.resource_server_policy USING btree (resource_server_id);


--
-- Name: idx_res_srv_res_res_srv; Type: INDEX; Schema: public; Owner: keycloak
--

CREATE INDEX idx_res_srv_res_res_srv ON public.resource_server_resource USING btree (resource_server_id);


--
-- Name: idx_res_srv_scope_res_srv; Type: INDEX; Schema: public; Owner: keycloak
--

CREATE INDEX idx_res_srv_scope_res_srv ON public.resource_server_scope USING btree (resource_server_id);


--
-- Name: idx_role_attribute; Type: INDEX; Schema: public; Owner: keycloak
--

CREATE INDEX idx_role_attribute ON public.role_attribute USING btree (role_id);


--
-- Name: idx_role_clscope; Type: INDEX; Schema: public; Owner: keycloak
--

CREATE INDEX idx_role_clscope ON public.client_scope_role_mapping USING btree (role_id);


--
-- Name: idx_scope_mapping_role; Type: INDEX; Schema: public; Owner: keycloak
--

CREATE INDEX idx_scope_mapping_role ON public.scope_mapping USING btree (role_id);


--
-- Name: idx_scope_policy_policy; Type: INDEX; Schema: public; Owner: keycloak
--

CREATE INDEX idx_scope_policy_policy ON public.scope_policy USING btree (policy_id);


--
-- Name: idx_update_time; Type: INDEX; Schema: public; Owner: keycloak
--

CREATE INDEX idx_update_time ON public.migration_model USING btree (update_time);


--
-- Name: idx_us_sess_id_on_cl_sess; Type: INDEX; Schema: public; Owner: keycloak
--

CREATE INDEX idx_us_sess_id_on_cl_sess ON public.offline_client_session USING btree (user_session_id);


--
-- Name: idx_usconsent_clscope; Type: INDEX; Schema: public; Owner: keycloak
--

CREATE INDEX idx_usconsent_clscope ON public.user_consent_client_scope USING btree (user_consent_id);


--
-- Name: idx_user_attribute; Type: INDEX; Schema: public; Owner: keycloak
--

CREATE INDEX idx_user_attribute ON public.user_attribute USING btree (user_id);


--
-- Name: idx_user_attribute_name; Type: INDEX; Schema: public; Owner: keycloak
--

CREATE INDEX idx_user_attribute_name ON public.user_attribute USING btree (name, value);


--
-- Name: idx_user_consent; Type: INDEX; Schema: public; Owner: keycloak
--

CREATE INDEX idx_user_consent ON public.user_consent USING btree (user_id);


--
-- Name: idx_user_credential; Type: INDEX; Schema: public; Owner: keycloak
--

CREATE INDEX idx_user_credential ON public.credential USING btree (user_id);


--
-- Name: idx_user_email; Type: INDEX; Schema: public; Owner: keycloak
--

CREATE INDEX idx_user_email ON public.user_entity USING btree (email);


--
-- Name: idx_user_group_mapping; Type: INDEX; Schema: public; Owner: keycloak
--

CREATE INDEX idx_user_group_mapping ON public.user_group_membership USING btree (user_id);


--
-- Name: idx_user_reqactions; Type: INDEX; Schema: public; Owner: keycloak
--

CREATE INDEX idx_user_reqactions ON public.user_required_action USING btree (user_id);


--
-- Name: idx_user_role_mapping; Type: INDEX; Schema: public; Owner: keycloak
--

CREATE INDEX idx_user_role_mapping ON public.user_role_mapping USING btree (user_id);


--
-- Name: idx_user_service_account; Type: INDEX; Schema: public; Owner: keycloak
--

CREATE INDEX idx_user_service_account ON public.user_entity USING btree (realm_id, service_account_client_link);


--
-- Name: idx_usr_fed_map_fed_prv; Type: INDEX; Schema: public; Owner: keycloak
--

CREATE INDEX idx_usr_fed_map_fed_prv ON public.user_federation_mapper USING btree (federation_provider_id);


--
-- Name: idx_usr_fed_map_realm; Type: INDEX; Schema: public; Owner: keycloak
--

CREATE INDEX idx_usr_fed_map_realm ON public.user_federation_mapper USING btree (realm_id);


--
-- Name: idx_usr_fed_prv_realm; Type: INDEX; Schema: public; Owner: keycloak
--

CREATE INDEX idx_usr_fed_prv_realm ON public.user_federation_provider USING btree (realm_id);


--
-- Name: idx_web_orig_client; Type: INDEX; Schema: public; Owner: keycloak
--

CREATE INDEX idx_web_orig_client ON public.web_origins USING btree (client_id);


--
-- Name: client_session_auth_status auth_status_constraint; Type: FK CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.client_session_auth_status
    ADD CONSTRAINT auth_status_constraint FOREIGN KEY (client_session) REFERENCES public.client_session(id);


--
-- Name: identity_provider fk2b4ebc52ae5c3b34; Type: FK CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.identity_provider
    ADD CONSTRAINT fk2b4ebc52ae5c3b34 FOREIGN KEY (realm_id) REFERENCES public.realm(id);


--
-- Name: client_attributes fk3c47c64beacca966; Type: FK CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.client_attributes
    ADD CONSTRAINT fk3c47c64beacca966 FOREIGN KEY (client_id) REFERENCES public.client(id);


--
-- Name: federated_identity fk404288b92ef007a6; Type: FK CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.federated_identity
    ADD CONSTRAINT fk404288b92ef007a6 FOREIGN KEY (user_id) REFERENCES public.user_entity(id);


--
-- Name: client_node_registrations fk4129723ba992f594; Type: FK CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.client_node_registrations
    ADD CONSTRAINT fk4129723ba992f594 FOREIGN KEY (client_id) REFERENCES public.client(id);


--
-- Name: client_session_note fk5edfb00ff51c2736; Type: FK CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.client_session_note
    ADD CONSTRAINT fk5edfb00ff51c2736 FOREIGN KEY (client_session) REFERENCES public.client_session(id);


--
-- Name: user_session_note fk5edfb00ff51d3472; Type: FK CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.user_session_note
    ADD CONSTRAINT fk5edfb00ff51d3472 FOREIGN KEY (user_session) REFERENCES public.user_session(id);


--
-- Name: client_session_role fk_11b7sgqw18i532811v7o2dv76; Type: FK CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.client_session_role
    ADD CONSTRAINT fk_11b7sgqw18i532811v7o2dv76 FOREIGN KEY (client_session) REFERENCES public.client_session(id);


--
-- Name: redirect_uris fk_1burs8pb4ouj97h5wuppahv9f; Type: FK CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.redirect_uris
    ADD CONSTRAINT fk_1burs8pb4ouj97h5wuppahv9f FOREIGN KEY (client_id) REFERENCES public.client(id);


--
-- Name: user_federation_provider fk_1fj32f6ptolw2qy60cd8n01e8; Type: FK CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.user_federation_provider
    ADD CONSTRAINT fk_1fj32f6ptolw2qy60cd8n01e8 FOREIGN KEY (realm_id) REFERENCES public.realm(id);


--
-- Name: client_session_prot_mapper fk_33a8sgqw18i532811v7o2dk89; Type: FK CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.client_session_prot_mapper
    ADD CONSTRAINT fk_33a8sgqw18i532811v7o2dk89 FOREIGN KEY (client_session) REFERENCES public.client_session(id);


--
-- Name: realm_required_credential fk_5hg65lybevavkqfki3kponh9v; Type: FK CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.realm_required_credential
    ADD CONSTRAINT fk_5hg65lybevavkqfki3kponh9v FOREIGN KEY (realm_id) REFERENCES public.realm(id);


--
-- Name: resource_attribute fk_5hrm2vlf9ql5fu022kqepovbr; Type: FK CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.resource_attribute
    ADD CONSTRAINT fk_5hrm2vlf9ql5fu022kqepovbr FOREIGN KEY (resource_id) REFERENCES public.resource_server_resource(id);


--
-- Name: user_attribute fk_5hrm2vlf9ql5fu043kqepovbr; Type: FK CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.user_attribute
    ADD CONSTRAINT fk_5hrm2vlf9ql5fu043kqepovbr FOREIGN KEY (user_id) REFERENCES public.user_entity(id);


--
-- Name: user_required_action fk_6qj3w1jw9cvafhe19bwsiuvmd; Type: FK CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.user_required_action
    ADD CONSTRAINT fk_6qj3w1jw9cvafhe19bwsiuvmd FOREIGN KEY (user_id) REFERENCES public.user_entity(id);


--
-- Name: keycloak_role fk_6vyqfe4cn4wlq8r6kt5vdsj5c; Type: FK CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.keycloak_role
    ADD CONSTRAINT fk_6vyqfe4cn4wlq8r6kt5vdsj5c FOREIGN KEY (realm) REFERENCES public.realm(id);


--
-- Name: realm_smtp_config fk_70ej8xdxgxd0b9hh6180irr0o; Type: FK CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.realm_smtp_config
    ADD CONSTRAINT fk_70ej8xdxgxd0b9hh6180irr0o FOREIGN KEY (realm_id) REFERENCES public.realm(id);


--
-- Name: realm_attribute fk_8shxd6l3e9atqukacxgpffptw; Type: FK CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.realm_attribute
    ADD CONSTRAINT fk_8shxd6l3e9atqukacxgpffptw FOREIGN KEY (realm_id) REFERENCES public.realm(id);


--
-- Name: composite_role fk_a63wvekftu8jo1pnj81e7mce2; Type: FK CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.composite_role
    ADD CONSTRAINT fk_a63wvekftu8jo1pnj81e7mce2 FOREIGN KEY (composite) REFERENCES public.keycloak_role(id);


--
-- Name: authentication_execution fk_auth_exec_flow; Type: FK CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.authentication_execution
    ADD CONSTRAINT fk_auth_exec_flow FOREIGN KEY (flow_id) REFERENCES public.authentication_flow(id);


--
-- Name: authentication_execution fk_auth_exec_realm; Type: FK CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.authentication_execution
    ADD CONSTRAINT fk_auth_exec_realm FOREIGN KEY (realm_id) REFERENCES public.realm(id);


--
-- Name: authentication_flow fk_auth_flow_realm; Type: FK CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.authentication_flow
    ADD CONSTRAINT fk_auth_flow_realm FOREIGN KEY (realm_id) REFERENCES public.realm(id);


--
-- Name: authenticator_config fk_auth_realm; Type: FK CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.authenticator_config
    ADD CONSTRAINT fk_auth_realm FOREIGN KEY (realm_id) REFERENCES public.realm(id);


--
-- Name: client_session fk_b4ao2vcvat6ukau74wbwtfqo1; Type: FK CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.client_session
    ADD CONSTRAINT fk_b4ao2vcvat6ukau74wbwtfqo1 FOREIGN KEY (session_id) REFERENCES public.user_session(id);


--
-- Name: user_role_mapping fk_c4fqv34p1mbylloxang7b1q3l; Type: FK CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.user_role_mapping
    ADD CONSTRAINT fk_c4fqv34p1mbylloxang7b1q3l FOREIGN KEY (user_id) REFERENCES public.user_entity(id);


--
-- Name: client_scope_attributes fk_cl_scope_attr_scope; Type: FK CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.client_scope_attributes
    ADD CONSTRAINT fk_cl_scope_attr_scope FOREIGN KEY (scope_id) REFERENCES public.client_scope(id);


--
-- Name: client_scope_role_mapping fk_cl_scope_rm_scope; Type: FK CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.client_scope_role_mapping
    ADD CONSTRAINT fk_cl_scope_rm_scope FOREIGN KEY (scope_id) REFERENCES public.client_scope(id);


--
-- Name: client_user_session_note fk_cl_usr_ses_note; Type: FK CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.client_user_session_note
    ADD CONSTRAINT fk_cl_usr_ses_note FOREIGN KEY (client_session) REFERENCES public.client_session(id);


--
-- Name: protocol_mapper fk_cli_scope_mapper; Type: FK CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.protocol_mapper
    ADD CONSTRAINT fk_cli_scope_mapper FOREIGN KEY (client_scope_id) REFERENCES public.client_scope(id);


--
-- Name: client_initial_access fk_client_init_acc_realm; Type: FK CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.client_initial_access
    ADD CONSTRAINT fk_client_init_acc_realm FOREIGN KEY (realm_id) REFERENCES public.realm(id);


--
-- Name: component_config fk_component_config; Type: FK CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.component_config
    ADD CONSTRAINT fk_component_config FOREIGN KEY (component_id) REFERENCES public.component(id);


--
-- Name: component fk_component_realm; Type: FK CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.component
    ADD CONSTRAINT fk_component_realm FOREIGN KEY (realm_id) REFERENCES public.realm(id);


--
-- Name: realm_default_groups fk_def_groups_realm; Type: FK CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.realm_default_groups
    ADD CONSTRAINT fk_def_groups_realm FOREIGN KEY (realm_id) REFERENCES public.realm(id);


--
-- Name: user_federation_mapper_config fk_fedmapper_cfg; Type: FK CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.user_federation_mapper_config
    ADD CONSTRAINT fk_fedmapper_cfg FOREIGN KEY (user_federation_mapper_id) REFERENCES public.user_federation_mapper(id);


--
-- Name: user_federation_mapper fk_fedmapperpm_fedprv; Type: FK CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.user_federation_mapper
    ADD CONSTRAINT fk_fedmapperpm_fedprv FOREIGN KEY (federation_provider_id) REFERENCES public.user_federation_provider(id);


--
-- Name: user_federation_mapper fk_fedmapperpm_realm; Type: FK CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.user_federation_mapper
    ADD CONSTRAINT fk_fedmapperpm_realm FOREIGN KEY (realm_id) REFERENCES public.realm(id);


--
-- Name: associated_policy fk_frsr5s213xcx4wnkog82ssrfy; Type: FK CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.associated_policy
    ADD CONSTRAINT fk_frsr5s213xcx4wnkog82ssrfy FOREIGN KEY (associated_policy_id) REFERENCES public.resource_server_policy(id);


--
-- Name: scope_policy fk_frsrasp13xcx4wnkog82ssrfy; Type: FK CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.scope_policy
    ADD CONSTRAINT fk_frsrasp13xcx4wnkog82ssrfy FOREIGN KEY (policy_id) REFERENCES public.resource_server_policy(id);


--
-- Name: resource_server_perm_ticket fk_frsrho213xcx4wnkog82sspmt; Type: FK CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.resource_server_perm_ticket
    ADD CONSTRAINT fk_frsrho213xcx4wnkog82sspmt FOREIGN KEY (resource_server_id) REFERENCES public.resource_server(id);


--
-- Name: resource_server_resource fk_frsrho213xcx4wnkog82ssrfy; Type: FK CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.resource_server_resource
    ADD CONSTRAINT fk_frsrho213xcx4wnkog82ssrfy FOREIGN KEY (resource_server_id) REFERENCES public.resource_server(id);


--
-- Name: resource_server_perm_ticket fk_frsrho213xcx4wnkog83sspmt; Type: FK CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.resource_server_perm_ticket
    ADD CONSTRAINT fk_frsrho213xcx4wnkog83sspmt FOREIGN KEY (resource_id) REFERENCES public.resource_server_resource(id);


--
-- Name: resource_server_perm_ticket fk_frsrho213xcx4wnkog84sspmt; Type: FK CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.resource_server_perm_ticket
    ADD CONSTRAINT fk_frsrho213xcx4wnkog84sspmt FOREIGN KEY (scope_id) REFERENCES public.resource_server_scope(id);


--
-- Name: associated_policy fk_frsrpas14xcx4wnkog82ssrfy; Type: FK CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.associated_policy
    ADD CONSTRAINT fk_frsrpas14xcx4wnkog82ssrfy FOREIGN KEY (policy_id) REFERENCES public.resource_server_policy(id);


--
-- Name: scope_policy fk_frsrpass3xcx4wnkog82ssrfy; Type: FK CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.scope_policy
    ADD CONSTRAINT fk_frsrpass3xcx4wnkog82ssrfy FOREIGN KEY (scope_id) REFERENCES public.resource_server_scope(id);


--
-- Name: resource_server_perm_ticket fk_frsrpo2128cx4wnkog82ssrfy; Type: FK CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.resource_server_perm_ticket
    ADD CONSTRAINT fk_frsrpo2128cx4wnkog82ssrfy FOREIGN KEY (policy_id) REFERENCES public.resource_server_policy(id);


--
-- Name: resource_server_policy fk_frsrpo213xcx4wnkog82ssrfy; Type: FK CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.resource_server_policy
    ADD CONSTRAINT fk_frsrpo213xcx4wnkog82ssrfy FOREIGN KEY (resource_server_id) REFERENCES public.resource_server(id);


--
-- Name: resource_scope fk_frsrpos13xcx4wnkog82ssrfy; Type: FK CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.resource_scope
    ADD CONSTRAINT fk_frsrpos13xcx4wnkog82ssrfy FOREIGN KEY (resource_id) REFERENCES public.resource_server_resource(id);


--
-- Name: resource_policy fk_frsrpos53xcx4wnkog82ssrfy; Type: FK CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.resource_policy
    ADD CONSTRAINT fk_frsrpos53xcx4wnkog82ssrfy FOREIGN KEY (resource_id) REFERENCES public.resource_server_resource(id);


--
-- Name: resource_policy fk_frsrpp213xcx4wnkog82ssrfy; Type: FK CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.resource_policy
    ADD CONSTRAINT fk_frsrpp213xcx4wnkog82ssrfy FOREIGN KEY (policy_id) REFERENCES public.resource_server_policy(id);


--
-- Name: resource_scope fk_frsrps213xcx4wnkog82ssrfy; Type: FK CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.resource_scope
    ADD CONSTRAINT fk_frsrps213xcx4wnkog82ssrfy FOREIGN KEY (scope_id) REFERENCES public.resource_server_scope(id);


--
-- Name: resource_server_scope fk_frsrso213xcx4wnkog82ssrfy; Type: FK CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.resource_server_scope
    ADD CONSTRAINT fk_frsrso213xcx4wnkog82ssrfy FOREIGN KEY (resource_server_id) REFERENCES public.resource_server(id);


--
-- Name: composite_role fk_gr7thllb9lu8q4vqa4524jjy8; Type: FK CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.composite_role
    ADD CONSTRAINT fk_gr7thllb9lu8q4vqa4524jjy8 FOREIGN KEY (child_role) REFERENCES public.keycloak_role(id);


--
-- Name: user_consent_client_scope fk_grntcsnt_clsc_usc; Type: FK CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.user_consent_client_scope
    ADD CONSTRAINT fk_grntcsnt_clsc_usc FOREIGN KEY (user_consent_id) REFERENCES public.user_consent(id);


--
-- Name: user_consent fk_grntcsnt_user; Type: FK CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.user_consent
    ADD CONSTRAINT fk_grntcsnt_user FOREIGN KEY (user_id) REFERENCES public.user_entity(id);


--
-- Name: group_attribute fk_group_attribute_group; Type: FK CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.group_attribute
    ADD CONSTRAINT fk_group_attribute_group FOREIGN KEY (group_id) REFERENCES public.keycloak_group(id);


--
-- Name: group_role_mapping fk_group_role_group; Type: FK CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.group_role_mapping
    ADD CONSTRAINT fk_group_role_group FOREIGN KEY (group_id) REFERENCES public.keycloak_group(id);


--
-- Name: realm_enabled_event_types fk_h846o4h0w8epx5nwedrf5y69j; Type: FK CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.realm_enabled_event_types
    ADD CONSTRAINT fk_h846o4h0w8epx5nwedrf5y69j FOREIGN KEY (realm_id) REFERENCES public.realm(id);


--
-- Name: realm_events_listeners fk_h846o4h0w8epx5nxev9f5y69j; Type: FK CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.realm_events_listeners
    ADD CONSTRAINT fk_h846o4h0w8epx5nxev9f5y69j FOREIGN KEY (realm_id) REFERENCES public.realm(id);


--
-- Name: identity_provider_mapper fk_idpm_realm; Type: FK CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.identity_provider_mapper
    ADD CONSTRAINT fk_idpm_realm FOREIGN KEY (realm_id) REFERENCES public.realm(id);


--
-- Name: idp_mapper_config fk_idpmconfig; Type: FK CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.idp_mapper_config
    ADD CONSTRAINT fk_idpmconfig FOREIGN KEY (idp_mapper_id) REFERENCES public.identity_provider_mapper(id);


--
-- Name: web_origins fk_lojpho213xcx4wnkog82ssrfy; Type: FK CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.web_origins
    ADD CONSTRAINT fk_lojpho213xcx4wnkog82ssrfy FOREIGN KEY (client_id) REFERENCES public.client(id);


--
-- Name: scope_mapping fk_ouse064plmlr732lxjcn1q5f1; Type: FK CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.scope_mapping
    ADD CONSTRAINT fk_ouse064plmlr732lxjcn1q5f1 FOREIGN KEY (client_id) REFERENCES public.client(id);


--
-- Name: protocol_mapper fk_pcm_realm; Type: FK CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.protocol_mapper
    ADD CONSTRAINT fk_pcm_realm FOREIGN KEY (client_id) REFERENCES public.client(id);


--
-- Name: credential fk_pfyr0glasqyl0dei3kl69r6v0; Type: FK CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.credential
    ADD CONSTRAINT fk_pfyr0glasqyl0dei3kl69r6v0 FOREIGN KEY (user_id) REFERENCES public.user_entity(id);


--
-- Name: protocol_mapper_config fk_pmconfig; Type: FK CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.protocol_mapper_config
    ADD CONSTRAINT fk_pmconfig FOREIGN KEY (protocol_mapper_id) REFERENCES public.protocol_mapper(id);


--
-- Name: default_client_scope fk_r_def_cli_scope_realm; Type: FK CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.default_client_scope
    ADD CONSTRAINT fk_r_def_cli_scope_realm FOREIGN KEY (realm_id) REFERENCES public.realm(id);


--
-- Name: required_action_provider fk_req_act_realm; Type: FK CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.required_action_provider
    ADD CONSTRAINT fk_req_act_realm FOREIGN KEY (realm_id) REFERENCES public.realm(id);


--
-- Name: resource_uris fk_resource_server_uris; Type: FK CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.resource_uris
    ADD CONSTRAINT fk_resource_server_uris FOREIGN KEY (resource_id) REFERENCES public.resource_server_resource(id);


--
-- Name: role_attribute fk_role_attribute_id; Type: FK CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.role_attribute
    ADD CONSTRAINT fk_role_attribute_id FOREIGN KEY (role_id) REFERENCES public.keycloak_role(id);


--
-- Name: realm_supported_locales fk_supported_locales_realm; Type: FK CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.realm_supported_locales
    ADD CONSTRAINT fk_supported_locales_realm FOREIGN KEY (realm_id) REFERENCES public.realm(id);


--
-- Name: user_federation_config fk_t13hpu1j94r2ebpekr39x5eu5; Type: FK CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.user_federation_config
    ADD CONSTRAINT fk_t13hpu1j94r2ebpekr39x5eu5 FOREIGN KEY (user_federation_provider_id) REFERENCES public.user_federation_provider(id);


--
-- Name: user_group_membership fk_user_group_user; Type: FK CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.user_group_membership
    ADD CONSTRAINT fk_user_group_user FOREIGN KEY (user_id) REFERENCES public.user_entity(id);


--
-- Name: policy_config fkdc34197cf864c4e43; Type: FK CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.policy_config
    ADD CONSTRAINT fkdc34197cf864c4e43 FOREIGN KEY (policy_id) REFERENCES public.resource_server_policy(id);


--
-- Name: identity_provider_config fkdc4897cf864c4e43; Type: FK CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.identity_provider_config
    ADD CONSTRAINT fkdc4897cf864c4e43 FOREIGN KEY (identity_provider_id) REFERENCES public.identity_provider(internal_id);


--
-- PostgreSQL database dump complete
--

