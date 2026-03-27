--
-- PostgreSQL database dump
--

-- Dumped from database version 15.8
-- Dumped by pg_dump version 15.8

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

DROP EVENT TRIGGER IF EXISTS pgrst_drop_watch;
DROP EVENT TRIGGER IF EXISTS pgrst_ddl_watch;
DROP EVENT TRIGGER IF EXISTS issue_pg_net_access;
DROP EVENT TRIGGER IF EXISTS issue_pg_graphql_access;
DROP EVENT TRIGGER IF EXISTS issue_pg_cron_access;
DROP EVENT TRIGGER IF EXISTS issue_graphql_placeholder;
DROP PUBLICATION IF EXISTS supabase_realtime;
DROP POLICY IF EXISTS "User Full access 1ffg0oo_3" ON storage.objects;
DROP POLICY IF EXISTS "User Full access 1ffg0oo_2" ON storage.objects;
DROP POLICY IF EXISTS "User Full access 1ffg0oo_1" ON storage.objects;
DROP POLICY IF EXISTS "User Full access 1ffg0oo_0" ON storage.objects;
DROP POLICY IF EXISTS "Usuário vê suas permissões" ON public.permissoes;
DROP POLICY IF EXISTS "Usuário edita próprio perfil" ON public.profiles;
DROP POLICY IF EXISTS "Leitura Pública de Perfis" ON public.profiles;
DROP POLICY IF EXISTS "Gives autenticated user full access" ON public.patrimonios;
DROP POLICY IF EXISTS "Edição Híbrida" ON public.patrimonios;
DROP POLICY IF EXISTS "Dono gerencia suas permissões" ON public.permissoes;
DROP POLICY IF EXISTS "Deleção Híbrida" ON public.patrimonios;
ALTER TABLE IF EXISTS ONLY storage.s3_multipart_uploads_parts DROP CONSTRAINT IF EXISTS s3_multipart_uploads_parts_upload_id_fkey;
ALTER TABLE IF EXISTS ONLY storage.s3_multipart_uploads_parts DROP CONSTRAINT IF EXISTS s3_multipart_uploads_parts_bucket_id_fkey;
ALTER TABLE IF EXISTS ONLY storage.s3_multipart_uploads DROP CONSTRAINT IF EXISTS s3_multipart_uploads_bucket_id_fkey;
ALTER TABLE IF EXISTS ONLY storage.prefixes DROP CONSTRAINT IF EXISTS "prefixes_bucketId_fkey";
ALTER TABLE IF EXISTS ONLY storage.objects DROP CONSTRAINT IF EXISTS "objects_bucketId_fkey";
ALTER TABLE IF EXISTS ONLY storage.iceberg_tables DROP CONSTRAINT IF EXISTS iceberg_tables_namespace_id_fkey;
ALTER TABLE IF EXISTS ONLY storage.iceberg_tables DROP CONSTRAINT IF EXISTS iceberg_tables_bucket_id_fkey;
ALTER TABLE IF EXISTS ONLY storage.iceberg_namespaces DROP CONSTRAINT IF EXISTS iceberg_namespaces_bucket_id_fkey;
ALTER TABLE IF EXISTS ONLY public.profiles DROP CONSTRAINT IF EXISTS profiles_id_fkey;
ALTER TABLE IF EXISTS ONLY public.permissoes DROP CONSTRAINT IF EXISTS permissoes_user_id_fkey;
ALTER TABLE IF EXISTS ONLY public.permissoes DROP CONSTRAINT IF EXISTS permissoes_patrimonio_id_fkey;
ALTER TABLE IF EXISTS ONLY public.permissoes DROP CONSTRAINT IF EXISTS permissoes_owner_id_fkey;
ALTER TABLE IF EXISTS ONLY public.patrimonios DROP CONSTRAINT IF EXISTS patrimonios_owner_id_fkey;
ALTER TABLE IF EXISTS ONLY auth.sso_domains DROP CONSTRAINT IF EXISTS sso_domains_sso_provider_id_fkey;
ALTER TABLE IF EXISTS ONLY auth.sessions DROP CONSTRAINT IF EXISTS sessions_user_id_fkey;
ALTER TABLE IF EXISTS ONLY auth.sessions DROP CONSTRAINT IF EXISTS sessions_oauth_client_id_fkey;
ALTER TABLE IF EXISTS ONLY auth.saml_relay_states DROP CONSTRAINT IF EXISTS saml_relay_states_sso_provider_id_fkey;
ALTER TABLE IF EXISTS ONLY auth.saml_relay_states DROP CONSTRAINT IF EXISTS saml_relay_states_flow_state_id_fkey;
ALTER TABLE IF EXISTS ONLY auth.saml_providers DROP CONSTRAINT IF EXISTS saml_providers_sso_provider_id_fkey;
ALTER TABLE IF EXISTS ONLY auth.refresh_tokens DROP CONSTRAINT IF EXISTS refresh_tokens_session_id_fkey;
ALTER TABLE IF EXISTS ONLY auth.one_time_tokens DROP CONSTRAINT IF EXISTS one_time_tokens_user_id_fkey;
ALTER TABLE IF EXISTS ONLY auth.oauth_consents DROP CONSTRAINT IF EXISTS oauth_consents_user_id_fkey;
ALTER TABLE IF EXISTS ONLY auth.oauth_consents DROP CONSTRAINT IF EXISTS oauth_consents_client_id_fkey;
ALTER TABLE IF EXISTS ONLY auth.oauth_authorizations DROP CONSTRAINT IF EXISTS oauth_authorizations_user_id_fkey;
ALTER TABLE IF EXISTS ONLY auth.oauth_authorizations DROP CONSTRAINT IF EXISTS oauth_authorizations_client_id_fkey;
ALTER TABLE IF EXISTS ONLY auth.mfa_factors DROP CONSTRAINT IF EXISTS mfa_factors_user_id_fkey;
ALTER TABLE IF EXISTS ONLY auth.mfa_challenges DROP CONSTRAINT IF EXISTS mfa_challenges_auth_factor_id_fkey;
ALTER TABLE IF EXISTS ONLY auth.mfa_amr_claims DROP CONSTRAINT IF EXISTS mfa_amr_claims_session_id_fkey;
ALTER TABLE IF EXISTS ONLY auth.identities DROP CONSTRAINT IF EXISTS identities_user_id_fkey;
ALTER TABLE IF EXISTS ONLY _realtime.extensions DROP CONSTRAINT IF EXISTS extensions_tenant_external_id_fkey;
DROP TRIGGER IF EXISTS update_objects_updated_at ON storage.objects;
DROP TRIGGER IF EXISTS prefixes_delete_hierarchy ON storage.prefixes;
DROP TRIGGER IF EXISTS prefixes_create_hierarchy ON storage.prefixes;
DROP TRIGGER IF EXISTS objects_update_create_prefix ON storage.objects;
DROP TRIGGER IF EXISTS objects_insert_create_prefix ON storage.objects;
DROP TRIGGER IF EXISTS objects_delete_delete_prefix ON storage.objects;
DROP TRIGGER IF EXISTS enforce_bucket_name_length_trigger ON storage.buckets;
DROP TRIGGER IF EXISTS tr_check_filters ON realtime.subscription;
DROP TRIGGER IF EXISTS on_patrimonio_created ON public.patrimonios;
DROP TRIGGER IF EXISTS on_auth_user_created ON auth.users;
DROP INDEX IF EXISTS supabase_functions.supabase_functions_hooks_request_id_idx;
DROP INDEX IF EXISTS supabase_functions.supabase_functions_hooks_h_table_id_h_name_idx;
DROP INDEX IF EXISTS storage.objects_bucket_id_level_idx;
DROP INDEX IF EXISTS storage.name_prefix_search;
DROP INDEX IF EXISTS storage.idx_prefixes_lower_name;
DROP INDEX IF EXISTS storage.idx_objects_lower_name;
DROP INDEX IF EXISTS storage.idx_objects_bucket_id_name;
DROP INDEX IF EXISTS storage.idx_name_bucket_level_unique;
DROP INDEX IF EXISTS storage.idx_multipart_uploads_list;
DROP INDEX IF EXISTS storage.idx_iceberg_tables_namespace_id;
DROP INDEX IF EXISTS storage.idx_iceberg_namespaces_bucket_id;
DROP INDEX IF EXISTS storage.bucketid_objname;
DROP INDEX IF EXISTS storage.bname;
DROP INDEX IF EXISTS realtime.subscription_subscription_id_entity_filters_key;
DROP INDEX IF EXISTS realtime.messages_2026_03_30_inserted_at_topic_idx;
DROP INDEX IF EXISTS realtime.messages_2026_03_29_inserted_at_topic_idx;
DROP INDEX IF EXISTS realtime.messages_2026_03_28_inserted_at_topic_idx;
DROP INDEX IF EXISTS realtime.messages_2026_03_27_inserted_at_topic_idx;
DROP INDEX IF EXISTS realtime.messages_2026_03_26_inserted_at_topic_idx;
DROP INDEX IF EXISTS realtime.messages_inserted_at_topic_index;
DROP INDEX IF EXISTS realtime.ix_realtime_subscription_entity;
DROP INDEX IF EXISTS auth.users_is_anonymous_idx;
DROP INDEX IF EXISTS auth.users_instance_id_idx;
DROP INDEX IF EXISTS auth.users_instance_id_email_idx;
DROP INDEX IF EXISTS auth.users_email_partial_key;
DROP INDEX IF EXISTS auth.user_id_created_at_idx;
DROP INDEX IF EXISTS auth.unique_phone_factor_per_user;
DROP INDEX IF EXISTS auth.sso_providers_resource_id_pattern_idx;
DROP INDEX IF EXISTS auth.sso_providers_resource_id_idx;
DROP INDEX IF EXISTS auth.sso_domains_sso_provider_id_idx;
DROP INDEX IF EXISTS auth.sso_domains_domain_idx;
DROP INDEX IF EXISTS auth.sessions_user_id_idx;
DROP INDEX IF EXISTS auth.sessions_oauth_client_id_idx;
DROP INDEX IF EXISTS auth.sessions_not_after_idx;
DROP INDEX IF EXISTS auth.saml_relay_states_sso_provider_id_idx;
DROP INDEX IF EXISTS auth.saml_relay_states_for_email_idx;
DROP INDEX IF EXISTS auth.saml_relay_states_created_at_idx;
DROP INDEX IF EXISTS auth.saml_providers_sso_provider_id_idx;
DROP INDEX IF EXISTS auth.refresh_tokens_updated_at_idx;
DROP INDEX IF EXISTS auth.refresh_tokens_session_id_revoked_idx;
DROP INDEX IF EXISTS auth.refresh_tokens_parent_idx;
DROP INDEX IF EXISTS auth.refresh_tokens_instance_id_user_id_idx;
DROP INDEX IF EXISTS auth.refresh_tokens_instance_id_idx;
DROP INDEX IF EXISTS auth.recovery_token_idx;
DROP INDEX IF EXISTS auth.reauthentication_token_idx;
DROP INDEX IF EXISTS auth.one_time_tokens_user_id_token_type_key;
DROP INDEX IF EXISTS auth.one_time_tokens_token_hash_hash_idx;
DROP INDEX IF EXISTS auth.one_time_tokens_relates_to_hash_idx;
DROP INDEX IF EXISTS auth.oauth_consents_user_order_idx;
DROP INDEX IF EXISTS auth.oauth_consents_active_user_client_idx;
DROP INDEX IF EXISTS auth.oauth_consents_active_client_idx;
DROP INDEX IF EXISTS auth.oauth_clients_deleted_at_idx;
DROP INDEX IF EXISTS auth.oauth_auth_pending_exp_idx;
DROP INDEX IF EXISTS auth.mfa_factors_user_id_idx;
DROP INDEX IF EXISTS auth.mfa_factors_user_friendly_name_unique;
DROP INDEX IF EXISTS auth.mfa_challenge_created_at_idx;
DROP INDEX IF EXISTS auth.idx_user_id_auth_method;
DROP INDEX IF EXISTS auth.idx_auth_code;
DROP INDEX IF EXISTS auth.identities_user_id_idx;
DROP INDEX IF EXISTS auth.identities_email_idx;
DROP INDEX IF EXISTS auth.flow_state_created_at_idx;
DROP INDEX IF EXISTS auth.factor_id_created_at_idx;
DROP INDEX IF EXISTS auth.email_change_token_new_idx;
DROP INDEX IF EXISTS auth.email_change_token_current_idx;
DROP INDEX IF EXISTS auth.confirmation_token_idx;
DROP INDEX IF EXISTS auth.audit_logs_instance_id_idx;
DROP INDEX IF EXISTS _realtime.tenants_external_id_index;
DROP INDEX IF EXISTS _realtime.extensions_tenant_external_id_type_index;
DROP INDEX IF EXISTS _realtime.extensions_tenant_external_id_index;
ALTER TABLE IF EXISTS ONLY supabase_functions.migrations DROP CONSTRAINT IF EXISTS migrations_pkey;
ALTER TABLE IF EXISTS ONLY supabase_functions.hooks DROP CONSTRAINT IF EXISTS hooks_pkey;
ALTER TABLE IF EXISTS ONLY storage.s3_multipart_uploads DROP CONSTRAINT IF EXISTS s3_multipart_uploads_pkey;
ALTER TABLE IF EXISTS ONLY storage.s3_multipart_uploads_parts DROP CONSTRAINT IF EXISTS s3_multipart_uploads_parts_pkey;
ALTER TABLE IF EXISTS ONLY storage.prefixes DROP CONSTRAINT IF EXISTS prefixes_pkey;
ALTER TABLE IF EXISTS ONLY storage.objects DROP CONSTRAINT IF EXISTS objects_pkey;
ALTER TABLE IF EXISTS ONLY storage.migrations DROP CONSTRAINT IF EXISTS migrations_pkey;
ALTER TABLE IF EXISTS ONLY storage.migrations DROP CONSTRAINT IF EXISTS migrations_name_key;
ALTER TABLE IF EXISTS ONLY storage.iceberg_tables DROP CONSTRAINT IF EXISTS iceberg_tables_pkey;
ALTER TABLE IF EXISTS ONLY storage.iceberg_namespaces DROP CONSTRAINT IF EXISTS iceberg_namespaces_pkey;
ALTER TABLE IF EXISTS ONLY storage.buckets DROP CONSTRAINT IF EXISTS buckets_pkey;
ALTER TABLE IF EXISTS ONLY storage.buckets_analytics DROP CONSTRAINT IF EXISTS buckets_analytics_pkey;
ALTER TABLE IF EXISTS ONLY realtime.schema_migrations DROP CONSTRAINT IF EXISTS schema_migrations_pkey;
ALTER TABLE IF EXISTS ONLY realtime.subscription DROP CONSTRAINT IF EXISTS pk_subscription;
ALTER TABLE IF EXISTS ONLY realtime.messages_2026_03_30 DROP CONSTRAINT IF EXISTS messages_2026_03_30_pkey;
ALTER TABLE IF EXISTS ONLY realtime.messages_2026_03_29 DROP CONSTRAINT IF EXISTS messages_2026_03_29_pkey;
ALTER TABLE IF EXISTS ONLY realtime.messages_2026_03_28 DROP CONSTRAINT IF EXISTS messages_2026_03_28_pkey;
ALTER TABLE IF EXISTS ONLY realtime.messages_2026_03_27 DROP CONSTRAINT IF EXISTS messages_2026_03_27_pkey;
ALTER TABLE IF EXISTS ONLY realtime.messages_2026_03_26 DROP CONSTRAINT IF EXISTS messages_2026_03_26_pkey;
ALTER TABLE IF EXISTS ONLY realtime.messages DROP CONSTRAINT IF EXISTS messages_pkey;
ALTER TABLE IF EXISTS ONLY public.permissoes DROP CONSTRAINT IF EXISTS unique_permissao;
ALTER TABLE IF EXISTS ONLY public.profiles DROP CONSTRAINT IF EXISTS profiles_pkey;
ALTER TABLE IF EXISTS ONLY public.permissoes DROP CONSTRAINT IF EXISTS permissoes_pkey;
ALTER TABLE IF EXISTS ONLY public.patrimonios DROP CONSTRAINT IF EXISTS patrimonios_pkey;
ALTER TABLE IF EXISTS ONLY auth.users DROP CONSTRAINT IF EXISTS users_pkey;
ALTER TABLE IF EXISTS ONLY auth.users DROP CONSTRAINT IF EXISTS users_phone_key;
ALTER TABLE IF EXISTS ONLY auth.sso_providers DROP CONSTRAINT IF EXISTS sso_providers_pkey;
ALTER TABLE IF EXISTS ONLY auth.sso_domains DROP CONSTRAINT IF EXISTS sso_domains_pkey;
ALTER TABLE IF EXISTS ONLY auth.sessions DROP CONSTRAINT IF EXISTS sessions_pkey;
ALTER TABLE IF EXISTS ONLY auth.schema_migrations DROP CONSTRAINT IF EXISTS schema_migrations_pkey;
ALTER TABLE IF EXISTS ONLY auth.saml_relay_states DROP CONSTRAINT IF EXISTS saml_relay_states_pkey;
ALTER TABLE IF EXISTS ONLY auth.saml_providers DROP CONSTRAINT IF EXISTS saml_providers_pkey;
ALTER TABLE IF EXISTS ONLY auth.saml_providers DROP CONSTRAINT IF EXISTS saml_providers_entity_id_key;
ALTER TABLE IF EXISTS ONLY auth.refresh_tokens DROP CONSTRAINT IF EXISTS refresh_tokens_token_unique;
ALTER TABLE IF EXISTS ONLY auth.refresh_tokens DROP CONSTRAINT IF EXISTS refresh_tokens_pkey;
ALTER TABLE IF EXISTS ONLY auth.one_time_tokens DROP CONSTRAINT IF EXISTS one_time_tokens_pkey;
ALTER TABLE IF EXISTS ONLY auth.oauth_consents DROP CONSTRAINT IF EXISTS oauth_consents_user_client_unique;
ALTER TABLE IF EXISTS ONLY auth.oauth_consents DROP CONSTRAINT IF EXISTS oauth_consents_pkey;
ALTER TABLE IF EXISTS ONLY auth.oauth_clients DROP CONSTRAINT IF EXISTS oauth_clients_pkey;
ALTER TABLE IF EXISTS ONLY auth.oauth_authorizations DROP CONSTRAINT IF EXISTS oauth_authorizations_pkey;
ALTER TABLE IF EXISTS ONLY auth.oauth_authorizations DROP CONSTRAINT IF EXISTS oauth_authorizations_authorization_id_key;
ALTER TABLE IF EXISTS ONLY auth.oauth_authorizations DROP CONSTRAINT IF EXISTS oauth_authorizations_authorization_code_key;
ALTER TABLE IF EXISTS ONLY auth.mfa_factors DROP CONSTRAINT IF EXISTS mfa_factors_pkey;
ALTER TABLE IF EXISTS ONLY auth.mfa_factors DROP CONSTRAINT IF EXISTS mfa_factors_last_challenged_at_key;
ALTER TABLE IF EXISTS ONLY auth.mfa_challenges DROP CONSTRAINT IF EXISTS mfa_challenges_pkey;
ALTER TABLE IF EXISTS ONLY auth.mfa_amr_claims DROP CONSTRAINT IF EXISTS mfa_amr_claims_session_id_authentication_method_pkey;
ALTER TABLE IF EXISTS ONLY auth.instances DROP CONSTRAINT IF EXISTS instances_pkey;
ALTER TABLE IF EXISTS ONLY auth.identities DROP CONSTRAINT IF EXISTS identities_provider_id_provider_unique;
ALTER TABLE IF EXISTS ONLY auth.identities DROP CONSTRAINT IF EXISTS identities_pkey;
ALTER TABLE IF EXISTS ONLY auth.flow_state DROP CONSTRAINT IF EXISTS flow_state_pkey;
ALTER TABLE IF EXISTS ONLY auth.audit_log_entries DROP CONSTRAINT IF EXISTS audit_log_entries_pkey;
ALTER TABLE IF EXISTS ONLY auth.mfa_amr_claims DROP CONSTRAINT IF EXISTS amr_id_pk;
ALTER TABLE IF EXISTS ONLY _realtime.tenants DROP CONSTRAINT IF EXISTS tenants_pkey;
ALTER TABLE IF EXISTS ONLY _realtime.schema_migrations DROP CONSTRAINT IF EXISTS schema_migrations_pkey;
ALTER TABLE IF EXISTS ONLY _realtime.extensions DROP CONSTRAINT IF EXISTS extensions_pkey;
ALTER TABLE IF EXISTS supabase_functions.hooks ALTER COLUMN id DROP DEFAULT;
ALTER TABLE IF EXISTS auth.refresh_tokens ALTER COLUMN id DROP DEFAULT;
DROP TABLE IF EXISTS supabase_functions.migrations;
DROP SEQUENCE IF EXISTS supabase_functions.hooks_id_seq;
DROP TABLE IF EXISTS supabase_functions.hooks;
DROP TABLE IF EXISTS storage.s3_multipart_uploads_parts;
DROP TABLE IF EXISTS storage.s3_multipart_uploads;
DROP TABLE IF EXISTS storage.prefixes;
DROP TABLE IF EXISTS storage.objects;
DROP TABLE IF EXISTS storage.migrations;
DROP TABLE IF EXISTS storage.iceberg_tables;
DROP TABLE IF EXISTS storage.iceberg_namespaces;
DROP TABLE IF EXISTS storage.buckets_analytics;
DROP TABLE IF EXISTS storage.buckets;
DROP TABLE IF EXISTS realtime.subscription;
DROP TABLE IF EXISTS realtime.schema_migrations;
DROP TABLE IF EXISTS realtime.messages_2026_03_30;
DROP TABLE IF EXISTS realtime.messages_2026_03_29;
DROP TABLE IF EXISTS realtime.messages_2026_03_28;
DROP TABLE IF EXISTS realtime.messages_2026_03_27;
DROP TABLE IF EXISTS realtime.messages_2026_03_26;
DROP TABLE IF EXISTS realtime.messages;
DROP TABLE IF EXISTS public.profiles;
DROP TABLE IF EXISTS public.permissoes;
DROP TABLE IF EXISTS public.patrimonios;
DROP TABLE IF EXISTS auth.users;
DROP TABLE IF EXISTS auth.sso_providers;
DROP TABLE IF EXISTS auth.sso_domains;
DROP TABLE IF EXISTS auth.sessions;
DROP TABLE IF EXISTS auth.schema_migrations;
DROP TABLE IF EXISTS auth.saml_relay_states;
DROP TABLE IF EXISTS auth.saml_providers;
DROP SEQUENCE IF EXISTS auth.refresh_tokens_id_seq;
DROP TABLE IF EXISTS auth.refresh_tokens;
DROP TABLE IF EXISTS auth.one_time_tokens;
DROP TABLE IF EXISTS auth.oauth_consents;
DROP TABLE IF EXISTS auth.oauth_clients;
DROP TABLE IF EXISTS auth.oauth_authorizations;
DROP TABLE IF EXISTS auth.mfa_factors;
DROP TABLE IF EXISTS auth.mfa_challenges;
DROP TABLE IF EXISTS auth.mfa_amr_claims;
DROP TABLE IF EXISTS auth.instances;
DROP TABLE IF EXISTS auth.identities;
DROP TABLE IF EXISTS auth.flow_state;
DROP TABLE IF EXISTS auth.audit_log_entries;
DROP TABLE IF EXISTS _realtime.tenants;
DROP TABLE IF EXISTS _realtime.schema_migrations;
DROP TABLE IF EXISTS _realtime.extensions;
DROP FUNCTION IF EXISTS supabase_functions.http_request();
DROP FUNCTION IF EXISTS storage.update_updated_at_column();
DROP FUNCTION IF EXISTS storage.search_v2(prefix text, bucket_name text, limits integer, levels integer, start_after text, sort_order text, sort_column text, sort_column_after text);
DROP FUNCTION IF EXISTS storage.search_v1_optimised(prefix text, bucketname text, limits integer, levels integer, offsets integer, search text, sortcolumn text, sortorder text);
DROP FUNCTION IF EXISTS storage.search_legacy_v1(prefix text, bucketname text, limits integer, levels integer, offsets integer, search text, sortcolumn text, sortorder text);
DROP FUNCTION IF EXISTS storage.search(prefix text, bucketname text, limits integer, levels integer, offsets integer, search text, sortcolumn text, sortorder text);
DROP FUNCTION IF EXISTS storage.prefixes_insert_trigger();
DROP FUNCTION IF EXISTS storage.prefixes_delete_cleanup();
DROP FUNCTION IF EXISTS storage.operation();
DROP FUNCTION IF EXISTS storage.objects_update_prefix_trigger();
DROP FUNCTION IF EXISTS storage.objects_update_level_trigger();
DROP FUNCTION IF EXISTS storage.objects_update_cleanup();
DROP FUNCTION IF EXISTS storage.objects_insert_prefix_trigger();
DROP FUNCTION IF EXISTS storage.objects_delete_cleanup();
DROP FUNCTION IF EXISTS storage.lock_top_prefixes(bucket_ids text[], names text[]);
DROP FUNCTION IF EXISTS storage.list_objects_with_delimiter(bucket_id text, prefix_param text, delimiter_param text, max_keys integer, start_after text, next_token text);
DROP FUNCTION IF EXISTS storage.list_multipart_uploads_with_delimiter(bucket_id text, prefix_param text, delimiter_param text, max_keys integer, next_key_token text, next_upload_token text);
DROP FUNCTION IF EXISTS storage.get_size_by_bucket();
DROP FUNCTION IF EXISTS storage.get_prefixes(name text);
DROP FUNCTION IF EXISTS storage.get_prefix(name text);
DROP FUNCTION IF EXISTS storage.get_level(name text);
DROP FUNCTION IF EXISTS storage.foldername(name text);
DROP FUNCTION IF EXISTS storage.filename(name text);
DROP FUNCTION IF EXISTS storage.extension(name text);
DROP FUNCTION IF EXISTS storage.enforce_bucket_name_length();
DROP FUNCTION IF EXISTS storage.delete_prefix_hierarchy_trigger();
DROP FUNCTION IF EXISTS storage.delete_prefix(_bucket_id text, _name text);
DROP FUNCTION IF EXISTS storage.delete_leaf_prefixes(bucket_ids text[], names text[]);
DROP FUNCTION IF EXISTS storage.can_insert_object(bucketid text, name text, owner uuid, metadata jsonb);
DROP FUNCTION IF EXISTS storage.add_prefixes(_bucket_id text, _name text);
DROP FUNCTION IF EXISTS realtime.topic();
DROP FUNCTION IF EXISTS realtime.to_regrole(role_name text);
DROP FUNCTION IF EXISTS realtime.subscription_check_filters();
DROP FUNCTION IF EXISTS realtime.send(payload jsonb, event text, topic text, private boolean);
DROP FUNCTION IF EXISTS realtime.quote_wal2json(entity regclass);
DROP FUNCTION IF EXISTS realtime.list_changes(publication name, slot_name name, max_changes integer, max_record_bytes integer);
DROP FUNCTION IF EXISTS realtime.is_visible_through_filters(columns realtime.wal_column[], filters realtime.user_defined_filter[]);
DROP FUNCTION IF EXISTS realtime.check_equality_op(op realtime.equality_op, type_ regtype, val_1 text, val_2 text);
DROP FUNCTION IF EXISTS realtime."cast"(val text, type_ regtype);
DROP FUNCTION IF EXISTS realtime.build_prepared_statement_sql(prepared_statement_name text, entity regclass, columns realtime.wal_column[]);
DROP FUNCTION IF EXISTS realtime.broadcast_changes(topic_name text, event_name text, operation text, table_name text, table_schema text, new record, old record, level text);
DROP FUNCTION IF EXISTS realtime.apply_rls(wal jsonb, max_record_bytes integer);
DROP FUNCTION IF EXISTS public.manage_patrimony_permissions(p_patrimonio_id bigint, p_owner_id uuid, p_selected_user_ids uuid[]);
DROP FUNCTION IF EXISTS public.handle_new_user();
DROP FUNCTION IF EXISTS public.auto_grant_creator_permission();
DROP FUNCTION IF EXISTS pgbouncer.get_auth(p_usename text);
DROP FUNCTION IF EXISTS extensions.set_graphql_placeholder();
DROP FUNCTION IF EXISTS extensions.pgrst_drop_watch();
DROP FUNCTION IF EXISTS extensions.pgrst_ddl_watch();
DROP FUNCTION IF EXISTS extensions.grant_pg_net_access();
DROP FUNCTION IF EXISTS extensions.grant_pg_graphql_access();
DROP FUNCTION IF EXISTS extensions.grant_pg_cron_access();
DROP FUNCTION IF EXISTS auth.uid();
DROP FUNCTION IF EXISTS auth.role();
DROP FUNCTION IF EXISTS auth.jwt();
DROP FUNCTION IF EXISTS auth.email();
DROP TYPE IF EXISTS storage.buckettype;
DROP TYPE IF EXISTS realtime.wal_rls;
DROP TYPE IF EXISTS realtime.wal_column;
DROP TYPE IF EXISTS realtime.user_defined_filter;
DROP TYPE IF EXISTS realtime.equality_op;
DROP TYPE IF EXISTS realtime.action;
DROP TYPE IF EXISTS auth.one_time_token_type;
DROP TYPE IF EXISTS auth.oauth_response_type;
DROP TYPE IF EXISTS auth.oauth_registration_type;
DROP TYPE IF EXISTS auth.oauth_client_type;
DROP TYPE IF EXISTS auth.oauth_authorization_status;
DROP TYPE IF EXISTS auth.factor_type;
DROP TYPE IF EXISTS auth.factor_status;
DROP TYPE IF EXISTS auth.code_challenge_method;
DROP TYPE IF EXISTS auth.aal_level;
DROP EXTENSION IF EXISTS "uuid-ossp";
DROP EXTENSION IF EXISTS supabase_vault;
DROP EXTENSION IF EXISTS pgjwt;
DROP EXTENSION IF EXISTS pgcrypto;
DROP EXTENSION IF EXISTS pg_stat_statements;
DROP EXTENSION IF EXISTS pg_graphql;
DROP SCHEMA IF EXISTS vault;
DROP SCHEMA IF EXISTS supabase_functions;
DROP SCHEMA IF EXISTS storage;
DROP SCHEMA IF EXISTS realtime;
DROP SCHEMA IF EXISTS pgbouncer;
DROP EXTENSION IF EXISTS pg_net;
DROP SCHEMA IF EXISTS graphql_public;
DROP SCHEMA IF EXISTS graphql;
DROP SCHEMA IF EXISTS extensions;
DROP SCHEMA IF EXISTS auth;
DROP SCHEMA IF EXISTS _realtime;
--
-- Name: _realtime; Type: SCHEMA; Schema: -; Owner: supabase_admin
--

CREATE SCHEMA _realtime;


ALTER SCHEMA _realtime OWNER TO supabase_admin;

--
-- Name: auth; Type: SCHEMA; Schema: -; Owner: supabase_admin
--

CREATE SCHEMA auth;


ALTER SCHEMA auth OWNER TO supabase_admin;

--
-- Name: extensions; Type: SCHEMA; Schema: -; Owner: postgres
--

CREATE SCHEMA extensions;


ALTER SCHEMA extensions OWNER TO postgres;

--
-- Name: graphql; Type: SCHEMA; Schema: -; Owner: supabase_admin
--

CREATE SCHEMA graphql;


ALTER SCHEMA graphql OWNER TO supabase_admin;

--
-- Name: graphql_public; Type: SCHEMA; Schema: -; Owner: supabase_admin
--

CREATE SCHEMA graphql_public;


ALTER SCHEMA graphql_public OWNER TO supabase_admin;

--
-- Name: pg_net; Type: EXTENSION; Schema: -; Owner: -
--

CREATE EXTENSION IF NOT EXISTS pg_net WITH SCHEMA extensions;


--
-- Name: EXTENSION pg_net; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION pg_net IS 'Async HTTP';


--
-- Name: pgbouncer; Type: SCHEMA; Schema: -; Owner: pgbouncer
--

CREATE SCHEMA pgbouncer;


ALTER SCHEMA pgbouncer OWNER TO pgbouncer;

--
-- Name: realtime; Type: SCHEMA; Schema: -; Owner: supabase_admin
--

CREATE SCHEMA realtime;


ALTER SCHEMA realtime OWNER TO supabase_admin;

--
-- Name: storage; Type: SCHEMA; Schema: -; Owner: supabase_admin
--

CREATE SCHEMA storage;


ALTER SCHEMA storage OWNER TO supabase_admin;

--
-- Name: supabase_functions; Type: SCHEMA; Schema: -; Owner: supabase_admin
--

CREATE SCHEMA supabase_functions;


ALTER SCHEMA supabase_functions OWNER TO supabase_admin;

--
-- Name: vault; Type: SCHEMA; Schema: -; Owner: supabase_admin
--

CREATE SCHEMA vault;


ALTER SCHEMA vault OWNER TO supabase_admin;

--
-- Name: pg_graphql; Type: EXTENSION; Schema: -; Owner: -
--

CREATE EXTENSION IF NOT EXISTS pg_graphql WITH SCHEMA graphql;


--
-- Name: EXTENSION pg_graphql; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION pg_graphql IS 'pg_graphql: GraphQL support';


--
-- Name: pg_stat_statements; Type: EXTENSION; Schema: -; Owner: -
--

CREATE EXTENSION IF NOT EXISTS pg_stat_statements WITH SCHEMA extensions;


--
-- Name: EXTENSION pg_stat_statements; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION pg_stat_statements IS 'track planning and execution statistics of all SQL statements executed';


--
-- Name: pgcrypto; Type: EXTENSION; Schema: -; Owner: -
--

CREATE EXTENSION IF NOT EXISTS pgcrypto WITH SCHEMA extensions;


--
-- Name: EXTENSION pgcrypto; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION pgcrypto IS 'cryptographic functions';


--
-- Name: pgjwt; Type: EXTENSION; Schema: -; Owner: -
--

CREATE EXTENSION IF NOT EXISTS pgjwt WITH SCHEMA extensions;


--
-- Name: EXTENSION pgjwt; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION pgjwt IS 'JSON Web Token API for Postgresql';


--
-- Name: supabase_vault; Type: EXTENSION; Schema: -; Owner: -
--

CREATE EXTENSION IF NOT EXISTS supabase_vault WITH SCHEMA vault;


--
-- Name: EXTENSION supabase_vault; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION supabase_vault IS 'Supabase Vault Extension';


--
-- Name: uuid-ossp; Type: EXTENSION; Schema: -; Owner: -
--

CREATE EXTENSION IF NOT EXISTS "uuid-ossp" WITH SCHEMA extensions;


--
-- Name: EXTENSION "uuid-ossp"; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION "uuid-ossp" IS 'generate universally unique identifiers (UUIDs)';


--
-- Name: aal_level; Type: TYPE; Schema: auth; Owner: supabase_auth_admin
--

CREATE TYPE auth.aal_level AS ENUM (
    'aal1',
    'aal2',
    'aal3'
);


ALTER TYPE auth.aal_level OWNER TO supabase_auth_admin;

--
-- Name: code_challenge_method; Type: TYPE; Schema: auth; Owner: supabase_auth_admin
--

CREATE TYPE auth.code_challenge_method AS ENUM (
    's256',
    'plain'
);


ALTER TYPE auth.code_challenge_method OWNER TO supabase_auth_admin;

--
-- Name: factor_status; Type: TYPE; Schema: auth; Owner: supabase_auth_admin
--

CREATE TYPE auth.factor_status AS ENUM (
    'unverified',
    'verified'
);


ALTER TYPE auth.factor_status OWNER TO supabase_auth_admin;

--
-- Name: factor_type; Type: TYPE; Schema: auth; Owner: supabase_auth_admin
--

CREATE TYPE auth.factor_type AS ENUM (
    'totp',
    'webauthn',
    'phone'
);


ALTER TYPE auth.factor_type OWNER TO supabase_auth_admin;

--
-- Name: oauth_authorization_status; Type: TYPE; Schema: auth; Owner: supabase_auth_admin
--

CREATE TYPE auth.oauth_authorization_status AS ENUM (
    'pending',
    'approved',
    'denied',
    'expired'
);


ALTER TYPE auth.oauth_authorization_status OWNER TO supabase_auth_admin;

--
-- Name: oauth_client_type; Type: TYPE; Schema: auth; Owner: supabase_auth_admin
--

CREATE TYPE auth.oauth_client_type AS ENUM (
    'public',
    'confidential'
);


ALTER TYPE auth.oauth_client_type OWNER TO supabase_auth_admin;

--
-- Name: oauth_registration_type; Type: TYPE; Schema: auth; Owner: supabase_auth_admin
--

CREATE TYPE auth.oauth_registration_type AS ENUM (
    'dynamic',
    'manual'
);


ALTER TYPE auth.oauth_registration_type OWNER TO supabase_auth_admin;

--
-- Name: oauth_response_type; Type: TYPE; Schema: auth; Owner: supabase_auth_admin
--

CREATE TYPE auth.oauth_response_type AS ENUM (
    'code'
);


ALTER TYPE auth.oauth_response_type OWNER TO supabase_auth_admin;

--
-- Name: one_time_token_type; Type: TYPE; Schema: auth; Owner: supabase_auth_admin
--

CREATE TYPE auth.one_time_token_type AS ENUM (
    'confirmation_token',
    'reauthentication_token',
    'recovery_token',
    'email_change_token_new',
    'email_change_token_current',
    'phone_change_token'
);


ALTER TYPE auth.one_time_token_type OWNER TO supabase_auth_admin;

--
-- Name: action; Type: TYPE; Schema: realtime; Owner: supabase_admin
--

CREATE TYPE realtime.action AS ENUM (
    'INSERT',
    'UPDATE',
    'DELETE',
    'TRUNCATE',
    'ERROR'
);


ALTER TYPE realtime.action OWNER TO supabase_admin;

--
-- Name: equality_op; Type: TYPE; Schema: realtime; Owner: supabase_admin
--

CREATE TYPE realtime.equality_op AS ENUM (
    'eq',
    'neq',
    'lt',
    'lte',
    'gt',
    'gte',
    'in'
);


ALTER TYPE realtime.equality_op OWNER TO supabase_admin;

--
-- Name: user_defined_filter; Type: TYPE; Schema: realtime; Owner: supabase_admin
--

CREATE TYPE realtime.user_defined_filter AS (
	column_name text,
	op realtime.equality_op,
	value text
);


ALTER TYPE realtime.user_defined_filter OWNER TO supabase_admin;

--
-- Name: wal_column; Type: TYPE; Schema: realtime; Owner: supabase_admin
--

CREATE TYPE realtime.wal_column AS (
	name text,
	type_name text,
	type_oid oid,
	value jsonb,
	is_pkey boolean,
	is_selectable boolean
);


ALTER TYPE realtime.wal_column OWNER TO supabase_admin;

--
-- Name: wal_rls; Type: TYPE; Schema: realtime; Owner: supabase_admin
--

CREATE TYPE realtime.wal_rls AS (
	wal jsonb,
	is_rls_enabled boolean,
	subscription_ids uuid[],
	errors text[]
);


ALTER TYPE realtime.wal_rls OWNER TO supabase_admin;

--
-- Name: buckettype; Type: TYPE; Schema: storage; Owner: supabase_storage_admin
--

CREATE TYPE storage.buckettype AS ENUM (
    'STANDARD',
    'ANALYTICS'
);


ALTER TYPE storage.buckettype OWNER TO supabase_storage_admin;

--
-- Name: email(); Type: FUNCTION; Schema: auth; Owner: supabase_auth_admin
--

CREATE FUNCTION auth.email() RETURNS text
    LANGUAGE sql STABLE
    AS $$
  select 
  coalesce(
    nullif(current_setting('request.jwt.claim.email', true), ''),
    (nullif(current_setting('request.jwt.claims', true), '')::jsonb ->> 'email')
  )::text
$$;


ALTER FUNCTION auth.email() OWNER TO supabase_auth_admin;

--
-- Name: FUNCTION email(); Type: COMMENT; Schema: auth; Owner: supabase_auth_admin
--

COMMENT ON FUNCTION auth.email() IS 'Deprecated. Use auth.jwt() -> ''email'' instead.';


--
-- Name: jwt(); Type: FUNCTION; Schema: auth; Owner: supabase_auth_admin
--

CREATE FUNCTION auth.jwt() RETURNS jsonb
    LANGUAGE sql STABLE
    AS $$
  select 
    coalesce(
        nullif(current_setting('request.jwt.claim', true), ''),
        nullif(current_setting('request.jwt.claims', true), '')
    )::jsonb
$$;


ALTER FUNCTION auth.jwt() OWNER TO supabase_auth_admin;

--
-- Name: role(); Type: FUNCTION; Schema: auth; Owner: supabase_auth_admin
--

CREATE FUNCTION auth.role() RETURNS text
    LANGUAGE sql STABLE
    AS $$
  select 
  coalesce(
    nullif(current_setting('request.jwt.claim.role', true), ''),
    (nullif(current_setting('request.jwt.claims', true), '')::jsonb ->> 'role')
  )::text
$$;


ALTER FUNCTION auth.role() OWNER TO supabase_auth_admin;

--
-- Name: FUNCTION role(); Type: COMMENT; Schema: auth; Owner: supabase_auth_admin
--

COMMENT ON FUNCTION auth.role() IS 'Deprecated. Use auth.jwt() -> ''role'' instead.';


--
-- Name: uid(); Type: FUNCTION; Schema: auth; Owner: supabase_auth_admin
--

CREATE FUNCTION auth.uid() RETURNS uuid
    LANGUAGE sql STABLE
    AS $$
  select 
  coalesce(
    nullif(current_setting('request.jwt.claim.sub', true), ''),
    (nullif(current_setting('request.jwt.claims', true), '')::jsonb ->> 'sub')
  )::uuid
$$;


ALTER FUNCTION auth.uid() OWNER TO supabase_auth_admin;

--
-- Name: FUNCTION uid(); Type: COMMENT; Schema: auth; Owner: supabase_auth_admin
--

COMMENT ON FUNCTION auth.uid() IS 'Deprecated. Use auth.jwt() -> ''sub'' instead.';


--
-- Name: grant_pg_cron_access(); Type: FUNCTION; Schema: extensions; Owner: supabase_admin
--

CREATE FUNCTION extensions.grant_pg_cron_access() RETURNS event_trigger
    LANGUAGE plpgsql
    AS $$
BEGIN
  IF EXISTS (
    SELECT
    FROM pg_event_trigger_ddl_commands() AS ev
    JOIN pg_extension AS ext
    ON ev.objid = ext.oid
    WHERE ext.extname = 'pg_cron'
  )
  THEN
    grant usage on schema cron to postgres with grant option;

    alter default privileges in schema cron grant all on tables to postgres with grant option;
    alter default privileges in schema cron grant all on functions to postgres with grant option;
    alter default privileges in schema cron grant all on sequences to postgres with grant option;

    alter default privileges for user supabase_admin in schema cron grant all
        on sequences to postgres with grant option;
    alter default privileges for user supabase_admin in schema cron grant all
        on tables to postgres with grant option;
    alter default privileges for user supabase_admin in schema cron grant all
        on functions to postgres with grant option;

    grant all privileges on all tables in schema cron to postgres with grant option;
    revoke all on table cron.job from postgres;
    grant select on table cron.job to postgres with grant option;
  END IF;
END;
$$;


ALTER FUNCTION extensions.grant_pg_cron_access() OWNER TO supabase_admin;

--
-- Name: FUNCTION grant_pg_cron_access(); Type: COMMENT; Schema: extensions; Owner: supabase_admin
--

COMMENT ON FUNCTION extensions.grant_pg_cron_access() IS 'Grants access to pg_cron';


--
-- Name: grant_pg_graphql_access(); Type: FUNCTION; Schema: extensions; Owner: supabase_admin
--

CREATE FUNCTION extensions.grant_pg_graphql_access() RETURNS event_trigger
    LANGUAGE plpgsql
    AS $_$
DECLARE
    func_is_graphql_resolve bool;
BEGIN
    func_is_graphql_resolve = (
        SELECT n.proname = 'resolve'
        FROM pg_event_trigger_ddl_commands() AS ev
        LEFT JOIN pg_catalog.pg_proc AS n
        ON ev.objid = n.oid
    );

    IF func_is_graphql_resolve
    THEN
        -- Update public wrapper to pass all arguments through to the pg_graphql resolve func
        DROP FUNCTION IF EXISTS graphql_public.graphql;
        create or replace function graphql_public.graphql(
            "operationName" text default null,
            query text default null,
            variables jsonb default null,
            extensions jsonb default null
        )
            returns jsonb
            language sql
        as $$
            select graphql.resolve(
                query := query,
                variables := coalesce(variables, '{}'),
                "operationName" := "operationName",
                extensions := extensions
            );
        $$;

        -- This hook executes when `graphql.resolve` is created. That is not necessarily the last
        -- function in the extension so we need to grant permissions on existing entities AND
        -- update default permissions to any others that are created after `graphql.resolve`
        grant usage on schema graphql to postgres, anon, authenticated, service_role;
        grant select on all tables in schema graphql to postgres, anon, authenticated, service_role;
        grant execute on all functions in schema graphql to postgres, anon, authenticated, service_role;
        grant all on all sequences in schema graphql to postgres, anon, authenticated, service_role;
        alter default privileges in schema graphql grant all on tables to postgres, anon, authenticated, service_role;
        alter default privileges in schema graphql grant all on functions to postgres, anon, authenticated, service_role;
        alter default privileges in schema graphql grant all on sequences to postgres, anon, authenticated, service_role;

        -- Allow postgres role to allow granting usage on graphql and graphql_public schemas to custom roles
        grant usage on schema graphql_public to postgres with grant option;
        grant usage on schema graphql to postgres with grant option;
    END IF;

END;
$_$;


ALTER FUNCTION extensions.grant_pg_graphql_access() OWNER TO supabase_admin;

--
-- Name: FUNCTION grant_pg_graphql_access(); Type: COMMENT; Schema: extensions; Owner: supabase_admin
--

COMMENT ON FUNCTION extensions.grant_pg_graphql_access() IS 'Grants access to pg_graphql';


--
-- Name: grant_pg_net_access(); Type: FUNCTION; Schema: extensions; Owner: supabase_admin
--

CREATE FUNCTION extensions.grant_pg_net_access() RETURNS event_trigger
    LANGUAGE plpgsql
    AS $$
BEGIN
  IF EXISTS (
    SELECT 1
    FROM pg_event_trigger_ddl_commands() AS ev
    JOIN pg_extension AS ext
    ON ev.objid = ext.oid
    WHERE ext.extname = 'pg_net'
  )
  THEN
    IF NOT EXISTS (
      SELECT 1
      FROM pg_roles
      WHERE rolname = 'supabase_functions_admin'
    )
    THEN
      CREATE USER supabase_functions_admin NOINHERIT CREATEROLE LOGIN NOREPLICATION;
    END IF;

    GRANT USAGE ON SCHEMA net TO supabase_functions_admin, postgres, anon, authenticated, service_role;

    IF EXISTS (
      SELECT FROM pg_extension
      WHERE extname = 'pg_net'
      -- all versions in use on existing projects as of 2025-02-20
      -- version 0.12.0 onwards don't need these applied
      AND extversion IN ('0.2', '0.6', '0.7', '0.7.1', '0.8', '0.10.0', '0.11.0')
    ) THEN
      ALTER function net.http_get(url text, params jsonb, headers jsonb, timeout_milliseconds integer) SECURITY DEFINER;
      ALTER function net.http_post(url text, body jsonb, params jsonb, headers jsonb, timeout_milliseconds integer) SECURITY DEFINER;

      ALTER function net.http_get(url text, params jsonb, headers jsonb, timeout_milliseconds integer) SET search_path = net;
      ALTER function net.http_post(url text, body jsonb, params jsonb, headers jsonb, timeout_milliseconds integer) SET search_path = net;

      REVOKE ALL ON FUNCTION net.http_get(url text, params jsonb, headers jsonb, timeout_milliseconds integer) FROM PUBLIC;
      REVOKE ALL ON FUNCTION net.http_post(url text, body jsonb, params jsonb, headers jsonb, timeout_milliseconds integer) FROM PUBLIC;

      GRANT EXECUTE ON FUNCTION net.http_get(url text, params jsonb, headers jsonb, timeout_milliseconds integer) TO supabase_functions_admin, postgres, anon, authenticated, service_role;
      GRANT EXECUTE ON FUNCTION net.http_post(url text, body jsonb, params jsonb, headers jsonb, timeout_milliseconds integer) TO supabase_functions_admin, postgres, anon, authenticated, service_role;
    END IF;
  END IF;
END;
$$;


ALTER FUNCTION extensions.grant_pg_net_access() OWNER TO supabase_admin;

--
-- Name: FUNCTION grant_pg_net_access(); Type: COMMENT; Schema: extensions; Owner: supabase_admin
--

COMMENT ON FUNCTION extensions.grant_pg_net_access() IS 'Grants access to pg_net';


--
-- Name: pgrst_ddl_watch(); Type: FUNCTION; Schema: extensions; Owner: supabase_admin
--

CREATE FUNCTION extensions.pgrst_ddl_watch() RETURNS event_trigger
    LANGUAGE plpgsql
    AS $$
DECLARE
  cmd record;
BEGIN
  FOR cmd IN SELECT * FROM pg_event_trigger_ddl_commands()
  LOOP
    IF cmd.command_tag IN (
      'CREATE SCHEMA', 'ALTER SCHEMA'
    , 'CREATE TABLE', 'CREATE TABLE AS', 'SELECT INTO', 'ALTER TABLE'
    , 'CREATE FOREIGN TABLE', 'ALTER FOREIGN TABLE'
    , 'CREATE VIEW', 'ALTER VIEW'
    , 'CREATE MATERIALIZED VIEW', 'ALTER MATERIALIZED VIEW'
    , 'CREATE FUNCTION', 'ALTER FUNCTION'
    , 'CREATE TRIGGER'
    , 'CREATE TYPE', 'ALTER TYPE'
    , 'CREATE RULE'
    , 'COMMENT'
    )
    -- don't notify in case of CREATE TEMP table or other objects created on pg_temp
    AND cmd.schema_name is distinct from 'pg_temp'
    THEN
      NOTIFY pgrst, 'reload schema';
    END IF;
  END LOOP;
END; $$;


ALTER FUNCTION extensions.pgrst_ddl_watch() OWNER TO supabase_admin;

--
-- Name: pgrst_drop_watch(); Type: FUNCTION; Schema: extensions; Owner: supabase_admin
--

CREATE FUNCTION extensions.pgrst_drop_watch() RETURNS event_trigger
    LANGUAGE plpgsql
    AS $$
DECLARE
  obj record;
BEGIN
  FOR obj IN SELECT * FROM pg_event_trigger_dropped_objects()
  LOOP
    IF obj.object_type IN (
      'schema'
    , 'table'
    , 'foreign table'
    , 'view'
    , 'materialized view'
    , 'function'
    , 'trigger'
    , 'type'
    , 'rule'
    )
    AND obj.is_temporary IS false -- no pg_temp objects
    THEN
      NOTIFY pgrst, 'reload schema';
    END IF;
  END LOOP;
END; $$;


ALTER FUNCTION extensions.pgrst_drop_watch() OWNER TO supabase_admin;

--
-- Name: set_graphql_placeholder(); Type: FUNCTION; Schema: extensions; Owner: supabase_admin
--

CREATE FUNCTION extensions.set_graphql_placeholder() RETURNS event_trigger
    LANGUAGE plpgsql
    AS $_$
    DECLARE
    graphql_is_dropped bool;
    BEGIN
    graphql_is_dropped = (
        SELECT ev.schema_name = 'graphql_public'
        FROM pg_event_trigger_dropped_objects() AS ev
        WHERE ev.schema_name = 'graphql_public'
    );

    IF graphql_is_dropped
    THEN
        create or replace function graphql_public.graphql(
            "operationName" text default null,
            query text default null,
            variables jsonb default null,
            extensions jsonb default null
        )
            returns jsonb
            language plpgsql
        as $$
            DECLARE
                server_version float;
            BEGIN
                server_version = (SELECT (SPLIT_PART((select version()), ' ', 2))::float);

                IF server_version >= 14 THEN
                    RETURN jsonb_build_object(
                        'errors', jsonb_build_array(
                            jsonb_build_object(
                                'message', 'pg_graphql extension is not enabled.'
                            )
                        )
                    );
                ELSE
                    RETURN jsonb_build_object(
                        'errors', jsonb_build_array(
                            jsonb_build_object(
                                'message', 'pg_graphql is only available on projects running Postgres 14 onwards.'
                            )
                        )
                    );
                END IF;
            END;
        $$;
    END IF;

    END;
$_$;


ALTER FUNCTION extensions.set_graphql_placeholder() OWNER TO supabase_admin;

--
-- Name: FUNCTION set_graphql_placeholder(); Type: COMMENT; Schema: extensions; Owner: supabase_admin
--

COMMENT ON FUNCTION extensions.set_graphql_placeholder() IS 'Reintroduces placeholder function for graphql_public.graphql';


--
-- Name: get_auth(text); Type: FUNCTION; Schema: pgbouncer; Owner: supabase_admin
--

CREATE FUNCTION pgbouncer.get_auth(p_usename text) RETURNS TABLE(username text, password text)
    LANGUAGE plpgsql SECURITY DEFINER
    AS $_$
begin
    raise debug 'PgBouncer auth request: %', p_usename;

    return query
    select 
        rolname::text, 
        case when rolvaliduntil < now() 
            then null 
            else rolpassword::text 
        end 
    from pg_authid 
    where rolname=$1 and rolcanlogin;
end;
$_$;


ALTER FUNCTION pgbouncer.get_auth(p_usename text) OWNER TO supabase_admin;

--
-- Name: auto_grant_creator_permission(); Type: FUNCTION; Schema: public; Owner: supabase_admin
--

CREATE FUNCTION public.auto_grant_creator_permission() RETURNS trigger
    LANGUAGE plpgsql SECURITY DEFINER
    AS $$
BEGIN
  IF auth.uid() <> new.owner_id THEN
    INSERT INTO public.permissoes (user_id, owner_id, patrimonio_id)
    VALUES (auth.uid(), new.owner_id, new.id)
    ON CONFLICT DO NOTHING;
  END IF;
  RETURN new;
END;
$$;


ALTER FUNCTION public.auto_grant_creator_permission() OWNER TO supabase_admin;

--
-- Name: handle_new_user(); Type: FUNCTION; Schema: public; Owner: supabase_admin
--

CREATE FUNCTION public.handle_new_user() RETURNS trigger
    LANGUAGE plpgsql SECURITY DEFINER
    AS $$
BEGIN
  INSERT INTO public.profiles (id, email, full_name)
  VALUES (
    new.id, 
    new.email, 
    -- AQUI ESTAVA O ERRO: Mudamos de 'full_name' para 'nome'
    -- Usamos COALESCE para tentar 'nome', se não tiver, tenta 'full_name' (por segurança)
    COALESCE(new.raw_user_meta_data->>'nome', new.raw_user_meta_data->>'full_name')
  );
  RETURN new;
END;
$$;


ALTER FUNCTION public.handle_new_user() OWNER TO supabase_admin;

--
-- Name: manage_patrimony_permissions(bigint, uuid, uuid[]); Type: FUNCTION; Schema: public; Owner: supabase_admin
--

CREATE FUNCTION public.manage_patrimony_permissions(p_patrimonio_id bigint, p_owner_id uuid, p_selected_user_ids uuid[]) RETURNS void
    LANGUAGE plpgsql
    AS $$
begin
  -- 1. LIMPEZA: Remove permissões de usuários que NÃO estão na nova lista enviada
  -- (Mas mantém a permissão se o usuário estiver na lista)
  delete from public.permissoes
  where patrimonio_id = p_patrimonio_id
  and user_id <> all (p_selected_user_ids);

  -- 2. INSERÇÃO: Adiciona apenas os usuários que AINDA NÃO têm permissão
  insert into public.permissoes (user_id, owner_id, patrimonio_id)
  select u_id, p_owner_id, p_patrimonio_id
  from unnest(p_selected_user_ids) as u_id
  where not exists (
      select 1 from public.permissoes 
      where user_id = u_id 
      and patrimonio_id = p_patrimonio_id
  );
end;
$$;


ALTER FUNCTION public.manage_patrimony_permissions(p_patrimonio_id bigint, p_owner_id uuid, p_selected_user_ids uuid[]) OWNER TO supabase_admin;

--
-- Name: apply_rls(jsonb, integer); Type: FUNCTION; Schema: realtime; Owner: supabase_admin
--

CREATE FUNCTION realtime.apply_rls(wal jsonb, max_record_bytes integer DEFAULT (1024 * 1024)) RETURNS SETOF realtime.wal_rls
    LANGUAGE plpgsql
    AS $$
declare
-- Regclass of the table e.g. public.notes
entity_ regclass = (quote_ident(wal ->> 'schema') || '.' || quote_ident(wal ->> 'table'))::regclass;

-- I, U, D, T: insert, update ...
action realtime.action = (
    case wal ->> 'action'
        when 'I' then 'INSERT'
        when 'U' then 'UPDATE'
        when 'D' then 'DELETE'
        else 'ERROR'
    end
);

-- Is row level security enabled for the table
is_rls_enabled bool = relrowsecurity from pg_class where oid = entity_;

subscriptions realtime.subscription[] = array_agg(subs)
    from
        realtime.subscription subs
    where
        subs.entity = entity_;

-- Subscription vars
roles regrole[] = array_agg(distinct us.claims_role::text)
    from
        unnest(subscriptions) us;

working_role regrole;
claimed_role regrole;
claims jsonb;

subscription_id uuid;
subscription_has_access bool;
visible_to_subscription_ids uuid[] = '{}';

-- structured info for wal's columns
columns realtime.wal_column[];
-- previous identity values for update/delete
old_columns realtime.wal_column[];

error_record_exceeds_max_size boolean = octet_length(wal::text) > max_record_bytes;

-- Primary jsonb output for record
output jsonb;

begin
perform set_config('role', null, true);

columns =
    array_agg(
        (
            x->>'name',
            x->>'type',
            x->>'typeoid',
            realtime.cast(
                (x->'value') #>> '{}',
                coalesce(
                    (x->>'typeoid')::regtype, -- null when wal2json version <= 2.4
                    (x->>'type')::regtype
                )
            ),
            (pks ->> 'name') is not null,
            true
        )::realtime.wal_column
    )
    from
        jsonb_array_elements(wal -> 'columns') x
        left join jsonb_array_elements(wal -> 'pk') pks
            on (x ->> 'name') = (pks ->> 'name');

old_columns =
    array_agg(
        (
            x->>'name',
            x->>'type',
            x->>'typeoid',
            realtime.cast(
                (x->'value') #>> '{}',
                coalesce(
                    (x->>'typeoid')::regtype, -- null when wal2json version <= 2.4
                    (x->>'type')::regtype
                )
            ),
            (pks ->> 'name') is not null,
            true
        )::realtime.wal_column
    )
    from
        jsonb_array_elements(wal -> 'identity') x
        left join jsonb_array_elements(wal -> 'pk') pks
            on (x ->> 'name') = (pks ->> 'name');

for working_role in select * from unnest(roles) loop

    -- Update `is_selectable` for columns and old_columns
    columns =
        array_agg(
            (
                c.name,
                c.type_name,
                c.type_oid,
                c.value,
                c.is_pkey,
                pg_catalog.has_column_privilege(working_role, entity_, c.name, 'SELECT')
            )::realtime.wal_column
        )
        from
            unnest(columns) c;

    old_columns =
            array_agg(
                (
                    c.name,
                    c.type_name,
                    c.type_oid,
                    c.value,
                    c.is_pkey,
                    pg_catalog.has_column_privilege(working_role, entity_, c.name, 'SELECT')
                )::realtime.wal_column
            )
            from
                unnest(old_columns) c;

    if action <> 'DELETE' and count(1) = 0 from unnest(columns) c where c.is_pkey then
        return next (
            jsonb_build_object(
                'schema', wal ->> 'schema',
                'table', wal ->> 'table',
                'type', action
            ),
            is_rls_enabled,
            -- subscriptions is already filtered by entity
            (select array_agg(s.subscription_id) from unnest(subscriptions) as s where claims_role = working_role),
            array['Error 400: Bad Request, no primary key']
        )::realtime.wal_rls;

    -- The claims role does not have SELECT permission to the primary key of entity
    elsif action <> 'DELETE' and sum(c.is_selectable::int) <> count(1) from unnest(columns) c where c.is_pkey then
        return next (
            jsonb_build_object(
                'schema', wal ->> 'schema',
                'table', wal ->> 'table',
                'type', action
            ),
            is_rls_enabled,
            (select array_agg(s.subscription_id) from unnest(subscriptions) as s where claims_role = working_role),
            array['Error 401: Unauthorized']
        )::realtime.wal_rls;

    else
        output = jsonb_build_object(
            'schema', wal ->> 'schema',
            'table', wal ->> 'table',
            'type', action,
            'commit_timestamp', to_char(
                ((wal ->> 'timestamp')::timestamptz at time zone 'utc'),
                'YYYY-MM-DD"T"HH24:MI:SS.MS"Z"'
            ),
            'columns', (
                select
                    jsonb_agg(
                        jsonb_build_object(
                            'name', pa.attname,
                            'type', pt.typname
                        )
                        order by pa.attnum asc
                    )
                from
                    pg_attribute pa
                    join pg_type pt
                        on pa.atttypid = pt.oid
                where
                    attrelid = entity_
                    and attnum > 0
                    and pg_catalog.has_column_privilege(working_role, entity_, pa.attname, 'SELECT')
            )
        )
        -- Add "record" key for insert and update
        || case
            when action in ('INSERT', 'UPDATE') then
                jsonb_build_object(
                    'record',
                    (
                        select
                            jsonb_object_agg(
                                -- if unchanged toast, get column name and value from old record
                                coalesce((c).name, (oc).name),
                                case
                                    when (c).name is null then (oc).value
                                    else (c).value
                                end
                            )
                        from
                            unnest(columns) c
                            full outer join unnest(old_columns) oc
                                on (c).name = (oc).name
                        where
                            coalesce((c).is_selectable, (oc).is_selectable)
                            and ( not error_record_exceeds_max_size or (octet_length((c).value::text) <= 64))
                    )
                )
            else '{}'::jsonb
        end
        -- Add "old_record" key for update and delete
        || case
            when action = 'UPDATE' then
                jsonb_build_object(
                        'old_record',
                        (
                            select jsonb_object_agg((c).name, (c).value)
                            from unnest(old_columns) c
                            where
                                (c).is_selectable
                                and ( not error_record_exceeds_max_size or (octet_length((c).value::text) <= 64))
                        )
                    )
            when action = 'DELETE' then
                jsonb_build_object(
                    'old_record',
                    (
                        select jsonb_object_agg((c).name, (c).value)
                        from unnest(old_columns) c
                        where
                            (c).is_selectable
                            and ( not error_record_exceeds_max_size or (octet_length((c).value::text) <= 64))
                            and ( not is_rls_enabled or (c).is_pkey ) -- if RLS enabled, we can't secure deletes so filter to pkey
                    )
                )
            else '{}'::jsonb
        end;

        -- Create the prepared statement
        if is_rls_enabled and action <> 'DELETE' then
            if (select 1 from pg_prepared_statements where name = 'walrus_rls_stmt' limit 1) > 0 then
                deallocate walrus_rls_stmt;
            end if;
            execute realtime.build_prepared_statement_sql('walrus_rls_stmt', entity_, columns);
        end if;

        visible_to_subscription_ids = '{}';

        for subscription_id, claims in (
                select
                    subs.subscription_id,
                    subs.claims
                from
                    unnest(subscriptions) subs
                where
                    subs.entity = entity_
                    and subs.claims_role = working_role
                    and (
                        realtime.is_visible_through_filters(columns, subs.filters)
                        or (
                          action = 'DELETE'
                          and realtime.is_visible_through_filters(old_columns, subs.filters)
                        )
                    )
        ) loop

            if not is_rls_enabled or action = 'DELETE' then
                visible_to_subscription_ids = visible_to_subscription_ids || subscription_id;
            else
                -- Check if RLS allows the role to see the record
                perform
                    -- Trim leading and trailing quotes from working_role because set_config
                    -- doesn't recognize the role as valid if they are included
                    set_config('role', trim(both '"' from working_role::text), true),
                    set_config('request.jwt.claims', claims::text, true);

                execute 'execute walrus_rls_stmt' into subscription_has_access;

                if subscription_has_access then
                    visible_to_subscription_ids = visible_to_subscription_ids || subscription_id;
                end if;
            end if;
        end loop;

        perform set_config('role', null, true);

        return next (
            output,
            is_rls_enabled,
            visible_to_subscription_ids,
            case
                when error_record_exceeds_max_size then array['Error 413: Payload Too Large']
                else '{}'
            end
        )::realtime.wal_rls;

    end if;
end loop;

perform set_config('role', null, true);
end;
$$;


ALTER FUNCTION realtime.apply_rls(wal jsonb, max_record_bytes integer) OWNER TO supabase_admin;

--
-- Name: broadcast_changes(text, text, text, text, text, record, record, text); Type: FUNCTION; Schema: realtime; Owner: supabase_admin
--

CREATE FUNCTION realtime.broadcast_changes(topic_name text, event_name text, operation text, table_name text, table_schema text, new record, old record, level text DEFAULT 'ROW'::text) RETURNS void
    LANGUAGE plpgsql
    AS $$
DECLARE
    -- Declare a variable to hold the JSONB representation of the row
    row_data jsonb := '{}'::jsonb;
BEGIN
    IF level = 'STATEMENT' THEN
        RAISE EXCEPTION 'function can only be triggered for each row, not for each statement';
    END IF;
    -- Check the operation type and handle accordingly
    IF operation = 'INSERT' OR operation = 'UPDATE' OR operation = 'DELETE' THEN
        row_data := jsonb_build_object('old_record', OLD, 'record', NEW, 'operation', operation, 'table', table_name, 'schema', table_schema);
        PERFORM realtime.send (row_data, event_name, topic_name);
    ELSE
        RAISE EXCEPTION 'Unexpected operation type: %', operation;
    END IF;
EXCEPTION
    WHEN OTHERS THEN
        RAISE EXCEPTION 'Failed to process the row: %', SQLERRM;
END;

$$;


ALTER FUNCTION realtime.broadcast_changes(topic_name text, event_name text, operation text, table_name text, table_schema text, new record, old record, level text) OWNER TO supabase_admin;

--
-- Name: build_prepared_statement_sql(text, regclass, realtime.wal_column[]); Type: FUNCTION; Schema: realtime; Owner: supabase_admin
--

CREATE FUNCTION realtime.build_prepared_statement_sql(prepared_statement_name text, entity regclass, columns realtime.wal_column[]) RETURNS text
    LANGUAGE sql
    AS $$
      /*
      Builds a sql string that, if executed, creates a prepared statement to
      tests retrive a row from *entity* by its primary key columns.
      Example
          select realtime.build_prepared_statement_sql('public.notes', '{"id"}'::text[], '{"bigint"}'::text[])
      */
          select
      'prepare ' || prepared_statement_name || ' as
          select
              exists(
                  select
                      1
                  from
                      ' || entity || '
                  where
                      ' || string_agg(quote_ident(pkc.name) || '=' || quote_nullable(pkc.value #>> '{}') , ' and ') || '
              )'
          from
              unnest(columns) pkc
          where
              pkc.is_pkey
          group by
              entity
      $$;


ALTER FUNCTION realtime.build_prepared_statement_sql(prepared_statement_name text, entity regclass, columns realtime.wal_column[]) OWNER TO supabase_admin;

--
-- Name: cast(text, regtype); Type: FUNCTION; Schema: realtime; Owner: supabase_admin
--

CREATE FUNCTION realtime."cast"(val text, type_ regtype) RETURNS jsonb
    LANGUAGE plpgsql IMMUTABLE
    AS $$
    declare
      res jsonb;
    begin
      execute format('select to_jsonb(%L::'|| type_::text || ')', val)  into res;
      return res;
    end
    $$;


ALTER FUNCTION realtime."cast"(val text, type_ regtype) OWNER TO supabase_admin;

--
-- Name: check_equality_op(realtime.equality_op, regtype, text, text); Type: FUNCTION; Schema: realtime; Owner: supabase_admin
--

CREATE FUNCTION realtime.check_equality_op(op realtime.equality_op, type_ regtype, val_1 text, val_2 text) RETURNS boolean
    LANGUAGE plpgsql IMMUTABLE
    AS $$
      /*
      Casts *val_1* and *val_2* as type *type_* and check the *op* condition for truthiness
      */
      declare
          op_symbol text = (
              case
                  when op = 'eq' then '='
                  when op = 'neq' then '!='
                  when op = 'lt' then '<'
                  when op = 'lte' then '<='
                  when op = 'gt' then '>'
                  when op = 'gte' then '>='
                  when op = 'in' then '= any'
                  else 'UNKNOWN OP'
              end
          );
          res boolean;
      begin
          execute format(
              'select %L::'|| type_::text || ' ' || op_symbol
              || ' ( %L::'
              || (
                  case
                      when op = 'in' then type_::text || '[]'
                      else type_::text end
              )
              || ')', val_1, val_2) into res;
          return res;
      end;
      $$;


ALTER FUNCTION realtime.check_equality_op(op realtime.equality_op, type_ regtype, val_1 text, val_2 text) OWNER TO supabase_admin;

--
-- Name: is_visible_through_filters(realtime.wal_column[], realtime.user_defined_filter[]); Type: FUNCTION; Schema: realtime; Owner: supabase_admin
--

CREATE FUNCTION realtime.is_visible_through_filters(columns realtime.wal_column[], filters realtime.user_defined_filter[]) RETURNS boolean
    LANGUAGE sql IMMUTABLE
    AS $_$
    /*
    Should the record be visible (true) or filtered out (false) after *filters* are applied
    */
        select
            -- Default to allowed when no filters present
            $2 is null -- no filters. this should not happen because subscriptions has a default
            or array_length($2, 1) is null -- array length of an empty array is null
            or bool_and(
                coalesce(
                    realtime.check_equality_op(
                        op:=f.op,
                        type_:=coalesce(
                            col.type_oid::regtype, -- null when wal2json version <= 2.4
                            col.type_name::regtype
                        ),
                        -- cast jsonb to text
                        val_1:=col.value #>> '{}',
                        val_2:=f.value
                    ),
                    false -- if null, filter does not match
                )
            )
        from
            unnest(filters) f
            join unnest(columns) col
                on f.column_name = col.name;
    $_$;


ALTER FUNCTION realtime.is_visible_through_filters(columns realtime.wal_column[], filters realtime.user_defined_filter[]) OWNER TO supabase_admin;

--
-- Name: list_changes(name, name, integer, integer); Type: FUNCTION; Schema: realtime; Owner: supabase_admin
--

CREATE FUNCTION realtime.list_changes(publication name, slot_name name, max_changes integer, max_record_bytes integer) RETURNS SETOF realtime.wal_rls
    LANGUAGE sql
    SET log_min_messages TO 'fatal'
    AS $$
      with pub as (
        select
          concat_ws(
            ',',
            case when bool_or(pubinsert) then 'insert' else null end,
            case when bool_or(pubupdate) then 'update' else null end,
            case when bool_or(pubdelete) then 'delete' else null end
          ) as w2j_actions,
          coalesce(
            string_agg(
              realtime.quote_wal2json(format('%I.%I', schemaname, tablename)::regclass),
              ','
            ) filter (where ppt.tablename is not null and ppt.tablename not like '% %'),
            ''
          ) w2j_add_tables
        from
          pg_publication pp
          left join pg_publication_tables ppt
            on pp.pubname = ppt.pubname
        where
          pp.pubname = publication
        group by
          pp.pubname
        limit 1
      ),
      w2j as (
        select
          x.*, pub.w2j_add_tables
        from
          pub,
          pg_logical_slot_get_changes(
            slot_name, null, max_changes,
            'include-pk', 'true',
            'include-transaction', 'false',
            'include-timestamp', 'true',
            'include-type-oids', 'true',
            'format-version', '2',
            'actions', pub.w2j_actions,
            'add-tables', pub.w2j_add_tables
          ) x
      )
      select
        xyz.wal,
        xyz.is_rls_enabled,
        xyz.subscription_ids,
        xyz.errors
      from
        w2j,
        realtime.apply_rls(
          wal := w2j.data::jsonb,
          max_record_bytes := max_record_bytes
        ) xyz(wal, is_rls_enabled, subscription_ids, errors)
      where
        w2j.w2j_add_tables <> ''
        and xyz.subscription_ids[1] is not null
    $$;


ALTER FUNCTION realtime.list_changes(publication name, slot_name name, max_changes integer, max_record_bytes integer) OWNER TO supabase_admin;

--
-- Name: quote_wal2json(regclass); Type: FUNCTION; Schema: realtime; Owner: supabase_admin
--

CREATE FUNCTION realtime.quote_wal2json(entity regclass) RETURNS text
    LANGUAGE sql IMMUTABLE STRICT
    AS $$
      select
        (
          select string_agg('' || ch,'')
          from unnest(string_to_array(nsp.nspname::text, null)) with ordinality x(ch, idx)
          where
            not (x.idx = 1 and x.ch = '"')
            and not (
              x.idx = array_length(string_to_array(nsp.nspname::text, null), 1)
              and x.ch = '"'
            )
        )
        || '.'
        || (
          select string_agg('' || ch,'')
          from unnest(string_to_array(pc.relname::text, null)) with ordinality x(ch, idx)
          where
            not (x.idx = 1 and x.ch = '"')
            and not (
              x.idx = array_length(string_to_array(nsp.nspname::text, null), 1)
              and x.ch = '"'
            )
          )
      from
        pg_class pc
        join pg_namespace nsp
          on pc.relnamespace = nsp.oid
      where
        pc.oid = entity
    $$;


ALTER FUNCTION realtime.quote_wal2json(entity regclass) OWNER TO supabase_admin;

--
-- Name: send(jsonb, text, text, boolean); Type: FUNCTION; Schema: realtime; Owner: supabase_admin
--

CREATE FUNCTION realtime.send(payload jsonb, event text, topic text, private boolean DEFAULT true) RETURNS void
    LANGUAGE plpgsql
    AS $$
BEGIN
  BEGIN
    -- Set the topic configuration
    EXECUTE format('SET LOCAL realtime.topic TO %L', topic);

    -- Attempt to insert the message
    INSERT INTO realtime.messages (payload, event, topic, private, extension)
    VALUES (payload, event, topic, private, 'broadcast');
  EXCEPTION
    WHEN OTHERS THEN
      -- Capture and notify the error
      RAISE WARNING 'ErrorSendingBroadcastMessage: %', SQLERRM;
  END;
END;
$$;


ALTER FUNCTION realtime.send(payload jsonb, event text, topic text, private boolean) OWNER TO supabase_admin;

--
-- Name: subscription_check_filters(); Type: FUNCTION; Schema: realtime; Owner: supabase_admin
--

CREATE FUNCTION realtime.subscription_check_filters() RETURNS trigger
    LANGUAGE plpgsql
    AS $$
    /*
    Validates that the user defined filters for a subscription:
    - refer to valid columns that the claimed role may access
    - values are coercable to the correct column type
    */
    declare
        col_names text[] = coalesce(
                array_agg(c.column_name order by c.ordinal_position),
                '{}'::text[]
            )
            from
                information_schema.columns c
            where
                format('%I.%I', c.table_schema, c.table_name)::regclass = new.entity
                and pg_catalog.has_column_privilege(
                    (new.claims ->> 'role'),
                    format('%I.%I', c.table_schema, c.table_name)::regclass,
                    c.column_name,
                    'SELECT'
                );
        filter realtime.user_defined_filter;
        col_type regtype;

        in_val jsonb;
    begin
        for filter in select * from unnest(new.filters) loop
            -- Filtered column is valid
            if not filter.column_name = any(col_names) then
                raise exception 'invalid column for filter %', filter.column_name;
            end if;

            -- Type is sanitized and safe for string interpolation
            col_type = (
                select atttypid::regtype
                from pg_catalog.pg_attribute
                where attrelid = new.entity
                      and attname = filter.column_name
            );
            if col_type is null then
                raise exception 'failed to lookup type for column %', filter.column_name;
            end if;

            -- Set maximum number of entries for in filter
            if filter.op = 'in'::realtime.equality_op then
                in_val = realtime.cast(filter.value, (col_type::text || '[]')::regtype);
                if coalesce(jsonb_array_length(in_val), 0) > 100 then
                    raise exception 'too many values for `in` filter. Maximum 100';
                end if;
            else
                -- raises an exception if value is not coercable to type
                perform realtime.cast(filter.value, col_type);
            end if;

        end loop;

        -- Apply consistent order to filters so the unique constraint on
        -- (subscription_id, entity, filters) can't be tricked by a different filter order
        new.filters = coalesce(
            array_agg(f order by f.column_name, f.op, f.value),
            '{}'
        ) from unnest(new.filters) f;

        return new;
    end;
    $$;


ALTER FUNCTION realtime.subscription_check_filters() OWNER TO supabase_admin;

--
-- Name: to_regrole(text); Type: FUNCTION; Schema: realtime; Owner: supabase_admin
--

CREATE FUNCTION realtime.to_regrole(role_name text) RETURNS regrole
    LANGUAGE sql IMMUTABLE
    AS $$ select role_name::regrole $$;


ALTER FUNCTION realtime.to_regrole(role_name text) OWNER TO supabase_admin;

--
-- Name: topic(); Type: FUNCTION; Schema: realtime; Owner: supabase_realtime_admin
--

CREATE FUNCTION realtime.topic() RETURNS text
    LANGUAGE sql STABLE
    AS $$
select nullif(current_setting('realtime.topic', true), '')::text;
$$;


ALTER FUNCTION realtime.topic() OWNER TO supabase_realtime_admin;

--
-- Name: add_prefixes(text, text); Type: FUNCTION; Schema: storage; Owner: supabase_storage_admin
--

CREATE FUNCTION storage.add_prefixes(_bucket_id text, _name text) RETURNS void
    LANGUAGE plpgsql SECURITY DEFINER
    AS $$
DECLARE
    prefixes text[];
BEGIN
    prefixes := "storage"."get_prefixes"("_name");

    IF array_length(prefixes, 1) > 0 THEN
        INSERT INTO storage.prefixes (name, bucket_id)
        SELECT UNNEST(prefixes) as name, "_bucket_id" ON CONFLICT DO NOTHING;
    END IF;
END;
$$;


ALTER FUNCTION storage.add_prefixes(_bucket_id text, _name text) OWNER TO supabase_storage_admin;

--
-- Name: can_insert_object(text, text, uuid, jsonb); Type: FUNCTION; Schema: storage; Owner: supabase_storage_admin
--

CREATE FUNCTION storage.can_insert_object(bucketid text, name text, owner uuid, metadata jsonb) RETURNS void
    LANGUAGE plpgsql
    AS $$
BEGIN
  INSERT INTO "storage"."objects" ("bucket_id", "name", "owner", "metadata") VALUES (bucketid, name, owner, metadata);
  -- hack to rollback the successful insert
  RAISE sqlstate 'PT200' using
  message = 'ROLLBACK',
  detail = 'rollback successful insert';
END
$$;


ALTER FUNCTION storage.can_insert_object(bucketid text, name text, owner uuid, metadata jsonb) OWNER TO supabase_storage_admin;

--
-- Name: delete_leaf_prefixes(text[], text[]); Type: FUNCTION; Schema: storage; Owner: supabase_storage_admin
--

CREATE FUNCTION storage.delete_leaf_prefixes(bucket_ids text[], names text[]) RETURNS void
    LANGUAGE plpgsql SECURITY DEFINER
    AS $$
DECLARE
    v_rows_deleted integer;
BEGIN
    LOOP
        WITH candidates AS (
            SELECT DISTINCT
                t.bucket_id,
                unnest(storage.get_prefixes(t.name)) AS name
            FROM unnest(bucket_ids, names) AS t(bucket_id, name)
        ),
        uniq AS (
             SELECT
                 bucket_id,
                 name,
                 storage.get_level(name) AS level
             FROM candidates
             WHERE name <> ''
             GROUP BY bucket_id, name
        ),
        leaf AS (
             SELECT
                 p.bucket_id,
                 p.name,
                 p.level
             FROM storage.prefixes AS p
                  JOIN uniq AS u
                       ON u.bucket_id = p.bucket_id
                           AND u.name = p.name
                           AND u.level = p.level
             WHERE NOT EXISTS (
                 SELECT 1
                 FROM storage.objects AS o
                 WHERE o.bucket_id = p.bucket_id
                   AND o.level = p.level + 1
                   AND o.name COLLATE "C" LIKE p.name || '/%'
             )
             AND NOT EXISTS (
                 SELECT 1
                 FROM storage.prefixes AS c
                 WHERE c.bucket_id = p.bucket_id
                   AND c.level = p.level + 1
                   AND c.name COLLATE "C" LIKE p.name || '/%'
             )
        )
        DELETE
        FROM storage.prefixes AS p
            USING leaf AS l
        WHERE p.bucket_id = l.bucket_id
          AND p.name = l.name
          AND p.level = l.level;

        GET DIAGNOSTICS v_rows_deleted = ROW_COUNT;
        EXIT WHEN v_rows_deleted = 0;
    END LOOP;
END;
$$;


ALTER FUNCTION storage.delete_leaf_prefixes(bucket_ids text[], names text[]) OWNER TO supabase_storage_admin;

--
-- Name: delete_prefix(text, text); Type: FUNCTION; Schema: storage; Owner: supabase_storage_admin
--

CREATE FUNCTION storage.delete_prefix(_bucket_id text, _name text) RETURNS boolean
    LANGUAGE plpgsql SECURITY DEFINER
    AS $$
BEGIN
    -- Check if we can delete the prefix
    IF EXISTS(
        SELECT FROM "storage"."prefixes"
        WHERE "prefixes"."bucket_id" = "_bucket_id"
          AND level = "storage"."get_level"("_name") + 1
          AND "prefixes"."name" COLLATE "C" LIKE "_name" || '/%'
        LIMIT 1
    )
    OR EXISTS(
        SELECT FROM "storage"."objects"
        WHERE "objects"."bucket_id" = "_bucket_id"
          AND "storage"."get_level"("objects"."name") = "storage"."get_level"("_name") + 1
          AND "objects"."name" COLLATE "C" LIKE "_name" || '/%'
        LIMIT 1
    ) THEN
    -- There are sub-objects, skip deletion
    RETURN false;
    ELSE
        DELETE FROM "storage"."prefixes"
        WHERE "prefixes"."bucket_id" = "_bucket_id"
          AND level = "storage"."get_level"("_name")
          AND "prefixes"."name" = "_name";
        RETURN true;
    END IF;
END;
$$;


ALTER FUNCTION storage.delete_prefix(_bucket_id text, _name text) OWNER TO supabase_storage_admin;

--
-- Name: delete_prefix_hierarchy_trigger(); Type: FUNCTION; Schema: storage; Owner: supabase_storage_admin
--

CREATE FUNCTION storage.delete_prefix_hierarchy_trigger() RETURNS trigger
    LANGUAGE plpgsql
    AS $$
DECLARE
    prefix text;
BEGIN
    prefix := "storage"."get_prefix"(OLD."name");

    IF coalesce(prefix, '') != '' THEN
        PERFORM "storage"."delete_prefix"(OLD."bucket_id", prefix);
    END IF;

    RETURN OLD;
END;
$$;


ALTER FUNCTION storage.delete_prefix_hierarchy_trigger() OWNER TO supabase_storage_admin;

--
-- Name: enforce_bucket_name_length(); Type: FUNCTION; Schema: storage; Owner: supabase_storage_admin
--

CREATE FUNCTION storage.enforce_bucket_name_length() RETURNS trigger
    LANGUAGE plpgsql
    AS $$
begin
    if length(new.name) > 100 then
        raise exception 'bucket name "%" is too long (% characters). Max is 100.', new.name, length(new.name);
    end if;
    return new;
end;
$$;


ALTER FUNCTION storage.enforce_bucket_name_length() OWNER TO supabase_storage_admin;

--
-- Name: extension(text); Type: FUNCTION; Schema: storage; Owner: supabase_storage_admin
--

CREATE FUNCTION storage.extension(name text) RETURNS text
    LANGUAGE plpgsql IMMUTABLE
    AS $$
DECLARE
    _parts text[];
    _filename text;
BEGIN
    SELECT string_to_array(name, '/') INTO _parts;
    SELECT _parts[array_length(_parts,1)] INTO _filename;
    RETURN reverse(split_part(reverse(_filename), '.', 1));
END
$$;


ALTER FUNCTION storage.extension(name text) OWNER TO supabase_storage_admin;

--
-- Name: filename(text); Type: FUNCTION; Schema: storage; Owner: supabase_storage_admin
--

CREATE FUNCTION storage.filename(name text) RETURNS text
    LANGUAGE plpgsql
    AS $$
DECLARE
_parts text[];
BEGIN
	select string_to_array(name, '/') into _parts;
	return _parts[array_length(_parts,1)];
END
$$;


ALTER FUNCTION storage.filename(name text) OWNER TO supabase_storage_admin;

--
-- Name: foldername(text); Type: FUNCTION; Schema: storage; Owner: supabase_storage_admin
--

CREATE FUNCTION storage.foldername(name text) RETURNS text[]
    LANGUAGE plpgsql IMMUTABLE
    AS $$
DECLARE
    _parts text[];
BEGIN
    -- Split on "/" to get path segments
    SELECT string_to_array(name, '/') INTO _parts;
    -- Return everything except the last segment
    RETURN _parts[1 : array_length(_parts,1) - 1];
END
$$;


ALTER FUNCTION storage.foldername(name text) OWNER TO supabase_storage_admin;

--
-- Name: get_level(text); Type: FUNCTION; Schema: storage; Owner: supabase_storage_admin
--

CREATE FUNCTION storage.get_level(name text) RETURNS integer
    LANGUAGE sql IMMUTABLE STRICT
    AS $$
SELECT array_length(string_to_array("name", '/'), 1);
$$;


ALTER FUNCTION storage.get_level(name text) OWNER TO supabase_storage_admin;

--
-- Name: get_prefix(text); Type: FUNCTION; Schema: storage; Owner: supabase_storage_admin
--

CREATE FUNCTION storage.get_prefix(name text) RETURNS text
    LANGUAGE sql IMMUTABLE STRICT
    AS $_$
SELECT
    CASE WHEN strpos("name", '/') > 0 THEN
             regexp_replace("name", '[\/]{1}[^\/]+\/?$', '')
         ELSE
             ''
        END;
$_$;


ALTER FUNCTION storage.get_prefix(name text) OWNER TO supabase_storage_admin;

--
-- Name: get_prefixes(text); Type: FUNCTION; Schema: storage; Owner: supabase_storage_admin
--

CREATE FUNCTION storage.get_prefixes(name text) RETURNS text[]
    LANGUAGE plpgsql IMMUTABLE STRICT
    AS $$
DECLARE
    parts text[];
    prefixes text[];
    prefix text;
BEGIN
    -- Split the name into parts by '/'
    parts := string_to_array("name", '/');
    prefixes := '{}';

    -- Construct the prefixes, stopping one level below the last part
    FOR i IN 1..array_length(parts, 1) - 1 LOOP
            prefix := array_to_string(parts[1:i], '/');
            prefixes := array_append(prefixes, prefix);
    END LOOP;

    RETURN prefixes;
END;
$$;


ALTER FUNCTION storage.get_prefixes(name text) OWNER TO supabase_storage_admin;

--
-- Name: get_size_by_bucket(); Type: FUNCTION; Schema: storage; Owner: supabase_storage_admin
--

CREATE FUNCTION storage.get_size_by_bucket() RETURNS TABLE(size bigint, bucket_id text)
    LANGUAGE plpgsql STABLE
    AS $$
BEGIN
    return query
        select sum((metadata->>'size')::bigint) as size, obj.bucket_id
        from "storage".objects as obj
        group by obj.bucket_id;
END
$$;


ALTER FUNCTION storage.get_size_by_bucket() OWNER TO supabase_storage_admin;

--
-- Name: list_multipart_uploads_with_delimiter(text, text, text, integer, text, text); Type: FUNCTION; Schema: storage; Owner: supabase_storage_admin
--

CREATE FUNCTION storage.list_multipart_uploads_with_delimiter(bucket_id text, prefix_param text, delimiter_param text, max_keys integer DEFAULT 100, next_key_token text DEFAULT ''::text, next_upload_token text DEFAULT ''::text) RETURNS TABLE(key text, id text, created_at timestamp with time zone)
    LANGUAGE plpgsql
    AS $_$
BEGIN
    RETURN QUERY EXECUTE
        'SELECT DISTINCT ON(key COLLATE "C") * from (
            SELECT
                CASE
                    WHEN position($2 IN substring(key from length($1) + 1)) > 0 THEN
                        substring(key from 1 for length($1) + position($2 IN substring(key from length($1) + 1)))
                    ELSE
                        key
                END AS key, id, created_at
            FROM
                storage.s3_multipart_uploads
            WHERE
                bucket_id = $5 AND
                key ILIKE $1 || ''%'' AND
                CASE
                    WHEN $4 != '''' AND $6 = '''' THEN
                        CASE
                            WHEN position($2 IN substring(key from length($1) + 1)) > 0 THEN
                                substring(key from 1 for length($1) + position($2 IN substring(key from length($1) + 1))) COLLATE "C" > $4
                            ELSE
                                key COLLATE "C" > $4
                            END
                    ELSE
                        true
                END AND
                CASE
                    WHEN $6 != '''' THEN
                        id COLLATE "C" > $6
                    ELSE
                        true
                    END
            ORDER BY
                key COLLATE "C" ASC, created_at ASC) as e order by key COLLATE "C" LIMIT $3'
        USING prefix_param, delimiter_param, max_keys, next_key_token, bucket_id, next_upload_token;
END;
$_$;


ALTER FUNCTION storage.list_multipart_uploads_with_delimiter(bucket_id text, prefix_param text, delimiter_param text, max_keys integer, next_key_token text, next_upload_token text) OWNER TO supabase_storage_admin;

--
-- Name: list_objects_with_delimiter(text, text, text, integer, text, text); Type: FUNCTION; Schema: storage; Owner: supabase_storage_admin
--

CREATE FUNCTION storage.list_objects_with_delimiter(bucket_id text, prefix_param text, delimiter_param text, max_keys integer DEFAULT 100, start_after text DEFAULT ''::text, next_token text DEFAULT ''::text) RETURNS TABLE(name text, id uuid, metadata jsonb, updated_at timestamp with time zone)
    LANGUAGE plpgsql
    AS $_$
BEGIN
    RETURN QUERY EXECUTE
        'SELECT DISTINCT ON(name COLLATE "C") * from (
            SELECT
                CASE
                    WHEN position($2 IN substring(name from length($1) + 1)) > 0 THEN
                        substring(name from 1 for length($1) + position($2 IN substring(name from length($1) + 1)))
                    ELSE
                        name
                END AS name, id, metadata, updated_at
            FROM
                storage.objects
            WHERE
                bucket_id = $5 AND
                name ILIKE $1 || ''%'' AND
                CASE
                    WHEN $6 != '''' THEN
                    name COLLATE "C" > $6
                ELSE true END
                AND CASE
                    WHEN $4 != '''' THEN
                        CASE
                            WHEN position($2 IN substring(name from length($1) + 1)) > 0 THEN
                                substring(name from 1 for length($1) + position($2 IN substring(name from length($1) + 1))) COLLATE "C" > $4
                            ELSE
                                name COLLATE "C" > $4
                            END
                    ELSE
                        true
                END
            ORDER BY
                name COLLATE "C" ASC) as e order by name COLLATE "C" LIMIT $3'
        USING prefix_param, delimiter_param, max_keys, next_token, bucket_id, start_after;
END;
$_$;


ALTER FUNCTION storage.list_objects_with_delimiter(bucket_id text, prefix_param text, delimiter_param text, max_keys integer, start_after text, next_token text) OWNER TO supabase_storage_admin;

--
-- Name: lock_top_prefixes(text[], text[]); Type: FUNCTION; Schema: storage; Owner: supabase_storage_admin
--

CREATE FUNCTION storage.lock_top_prefixes(bucket_ids text[], names text[]) RETURNS void
    LANGUAGE plpgsql SECURITY DEFINER
    AS $$
DECLARE
    v_bucket text;
    v_top text;
BEGIN
    FOR v_bucket, v_top IN
        SELECT DISTINCT t.bucket_id,
            split_part(t.name, '/', 1) AS top
        FROM unnest(bucket_ids, names) AS t(bucket_id, name)
        WHERE t.name <> ''
        ORDER BY 1, 2
        LOOP
            PERFORM pg_advisory_xact_lock(hashtextextended(v_bucket || '/' || v_top, 0));
        END LOOP;
END;
$$;


ALTER FUNCTION storage.lock_top_prefixes(bucket_ids text[], names text[]) OWNER TO supabase_storage_admin;

--
-- Name: objects_delete_cleanup(); Type: FUNCTION; Schema: storage; Owner: supabase_storage_admin
--

CREATE FUNCTION storage.objects_delete_cleanup() RETURNS trigger
    LANGUAGE plpgsql SECURITY DEFINER
    AS $$
DECLARE
    v_bucket_ids text[];
    v_names      text[];
BEGIN
    IF current_setting('storage.gc.prefixes', true) = '1' THEN
        RETURN NULL;
    END IF;

    PERFORM set_config('storage.gc.prefixes', '1', true);

    SELECT COALESCE(array_agg(d.bucket_id), '{}'),
           COALESCE(array_agg(d.name), '{}')
    INTO v_bucket_ids, v_names
    FROM deleted AS d
    WHERE d.name <> '';

    PERFORM storage.lock_top_prefixes(v_bucket_ids, v_names);
    PERFORM storage.delete_leaf_prefixes(v_bucket_ids, v_names);

    RETURN NULL;
END;
$$;


ALTER FUNCTION storage.objects_delete_cleanup() OWNER TO supabase_storage_admin;

--
-- Name: objects_insert_prefix_trigger(); Type: FUNCTION; Schema: storage; Owner: supabase_storage_admin
--

CREATE FUNCTION storage.objects_insert_prefix_trigger() RETURNS trigger
    LANGUAGE plpgsql
    AS $$
BEGIN
    PERFORM "storage"."add_prefixes"(NEW."bucket_id", NEW."name");
    NEW.level := "storage"."get_level"(NEW."name");

    RETURN NEW;
END;
$$;


ALTER FUNCTION storage.objects_insert_prefix_trigger() OWNER TO supabase_storage_admin;

--
-- Name: objects_update_cleanup(); Type: FUNCTION; Schema: storage; Owner: supabase_storage_admin
--

CREATE FUNCTION storage.objects_update_cleanup() RETURNS trigger
    LANGUAGE plpgsql SECURITY DEFINER
    AS $$
DECLARE
    -- NEW - OLD (destinations to create prefixes for)
    v_add_bucket_ids text[];
    v_add_names      text[];

    -- OLD - NEW (sources to prune)
    v_src_bucket_ids text[];
    v_src_names      text[];
BEGIN
    IF TG_OP <> 'UPDATE' THEN
        RETURN NULL;
    END IF;

    -- 1) Compute NEW−OLD (added paths) and OLD−NEW (moved-away paths)
    WITH added AS (
        SELECT n.bucket_id, n.name
        FROM new_rows n
        WHERE n.name <> '' AND position('/' in n.name) > 0
        EXCEPT
        SELECT o.bucket_id, o.name FROM old_rows o WHERE o.name <> ''
    ),
    moved AS (
         SELECT o.bucket_id, o.name
         FROM old_rows o
         WHERE o.name <> ''
         EXCEPT
         SELECT n.bucket_id, n.name FROM new_rows n WHERE n.name <> ''
    )
    SELECT
        -- arrays for ADDED (dest) in stable order
        COALESCE( (SELECT array_agg(a.bucket_id ORDER BY a.bucket_id, a.name) FROM added a), '{}' ),
        COALESCE( (SELECT array_agg(a.name      ORDER BY a.bucket_id, a.name) FROM added a), '{}' ),
        -- arrays for MOVED (src) in stable order
        COALESCE( (SELECT array_agg(m.bucket_id ORDER BY m.bucket_id, m.name) FROM moved m), '{}' ),
        COALESCE( (SELECT array_agg(m.name      ORDER BY m.bucket_id, m.name) FROM moved m), '{}' )
    INTO v_add_bucket_ids, v_add_names, v_src_bucket_ids, v_src_names;

    -- Nothing to do?
    IF (array_length(v_add_bucket_ids, 1) IS NULL) AND (array_length(v_src_bucket_ids, 1) IS NULL) THEN
        RETURN NULL;
    END IF;

    -- 2) Take per-(bucket, top) locks: ALL prefixes in consistent global order to prevent deadlocks
    DECLARE
        v_all_bucket_ids text[];
        v_all_names text[];
    BEGIN
        -- Combine source and destination arrays for consistent lock ordering
        v_all_bucket_ids := COALESCE(v_src_bucket_ids, '{}') || COALESCE(v_add_bucket_ids, '{}');
        v_all_names := COALESCE(v_src_names, '{}') || COALESCE(v_add_names, '{}');

        -- Single lock call ensures consistent global ordering across all transactions
        IF array_length(v_all_bucket_ids, 1) IS NOT NULL THEN
            PERFORM storage.lock_top_prefixes(v_all_bucket_ids, v_all_names);
        END IF;
    END;

    -- 3) Create destination prefixes (NEW−OLD) BEFORE pruning sources
    IF array_length(v_add_bucket_ids, 1) IS NOT NULL THEN
        WITH candidates AS (
            SELECT DISTINCT t.bucket_id, unnest(storage.get_prefixes(t.name)) AS name
            FROM unnest(v_add_bucket_ids, v_add_names) AS t(bucket_id, name)
            WHERE name <> ''
        )
        INSERT INTO storage.prefixes (bucket_id, name)
        SELECT c.bucket_id, c.name
        FROM candidates c
        ON CONFLICT DO NOTHING;
    END IF;

    -- 4) Prune source prefixes bottom-up for OLD−NEW
    IF array_length(v_src_bucket_ids, 1) IS NOT NULL THEN
        -- re-entrancy guard so DELETE on prefixes won't recurse
        IF current_setting('storage.gc.prefixes', true) <> '1' THEN
            PERFORM set_config('storage.gc.prefixes', '1', true);
        END IF;

        PERFORM storage.delete_leaf_prefixes(v_src_bucket_ids, v_src_names);
    END IF;

    RETURN NULL;
END;
$$;


ALTER FUNCTION storage.objects_update_cleanup() OWNER TO supabase_storage_admin;

--
-- Name: objects_update_level_trigger(); Type: FUNCTION; Schema: storage; Owner: supabase_storage_admin
--

CREATE FUNCTION storage.objects_update_level_trigger() RETURNS trigger
    LANGUAGE plpgsql
    AS $$
BEGIN
    -- Ensure this is an update operation and the name has changed
    IF TG_OP = 'UPDATE' AND (NEW."name" <> OLD."name" OR NEW."bucket_id" <> OLD."bucket_id") THEN
        -- Set the new level
        NEW."level" := "storage"."get_level"(NEW."name");
    END IF;
    RETURN NEW;
END;
$$;


ALTER FUNCTION storage.objects_update_level_trigger() OWNER TO supabase_storage_admin;

--
-- Name: objects_update_prefix_trigger(); Type: FUNCTION; Schema: storage; Owner: supabase_storage_admin
--

CREATE FUNCTION storage.objects_update_prefix_trigger() RETURNS trigger
    LANGUAGE plpgsql
    AS $$
DECLARE
    old_prefixes TEXT[];
BEGIN
    -- Ensure this is an update operation and the name has changed
    IF TG_OP = 'UPDATE' AND (NEW."name" <> OLD."name" OR NEW."bucket_id" <> OLD."bucket_id") THEN
        -- Retrieve old prefixes
        old_prefixes := "storage"."get_prefixes"(OLD."name");

        -- Remove old prefixes that are only used by this object
        WITH all_prefixes as (
            SELECT unnest(old_prefixes) as prefix
        ),
        can_delete_prefixes as (
             SELECT prefix
             FROM all_prefixes
             WHERE NOT EXISTS (
                 SELECT 1 FROM "storage"."objects"
                 WHERE "bucket_id" = OLD."bucket_id"
                   AND "name" <> OLD."name"
                   AND "name" LIKE (prefix || '%')
             )
         )
        DELETE FROM "storage"."prefixes" WHERE name IN (SELECT prefix FROM can_delete_prefixes);

        -- Add new prefixes
        PERFORM "storage"."add_prefixes"(NEW."bucket_id", NEW."name");
    END IF;
    -- Set the new level
    NEW."level" := "storage"."get_level"(NEW."name");

    RETURN NEW;
END;
$$;


ALTER FUNCTION storage.objects_update_prefix_trigger() OWNER TO supabase_storage_admin;

--
-- Name: operation(); Type: FUNCTION; Schema: storage; Owner: supabase_storage_admin
--

CREATE FUNCTION storage.operation() RETURNS text
    LANGUAGE plpgsql STABLE
    AS $$
BEGIN
    RETURN current_setting('storage.operation', true);
END;
$$;


ALTER FUNCTION storage.operation() OWNER TO supabase_storage_admin;

--
-- Name: prefixes_delete_cleanup(); Type: FUNCTION; Schema: storage; Owner: supabase_storage_admin
--

CREATE FUNCTION storage.prefixes_delete_cleanup() RETURNS trigger
    LANGUAGE plpgsql SECURITY DEFINER
    AS $$
DECLARE
    v_bucket_ids text[];
    v_names      text[];
BEGIN
    IF current_setting('storage.gc.prefixes', true) = '1' THEN
        RETURN NULL;
    END IF;

    PERFORM set_config('storage.gc.prefixes', '1', true);

    SELECT COALESCE(array_agg(d.bucket_id), '{}'),
           COALESCE(array_agg(d.name), '{}')
    INTO v_bucket_ids, v_names
    FROM deleted AS d
    WHERE d.name <> '';

    PERFORM storage.lock_top_prefixes(v_bucket_ids, v_names);
    PERFORM storage.delete_leaf_prefixes(v_bucket_ids, v_names);

    RETURN NULL;
END;
$$;


ALTER FUNCTION storage.prefixes_delete_cleanup() OWNER TO supabase_storage_admin;

--
-- Name: prefixes_insert_trigger(); Type: FUNCTION; Schema: storage; Owner: supabase_storage_admin
--

CREATE FUNCTION storage.prefixes_insert_trigger() RETURNS trigger
    LANGUAGE plpgsql
    AS $$
BEGIN
    PERFORM "storage"."add_prefixes"(NEW."bucket_id", NEW."name");
    RETURN NEW;
END;
$$;


ALTER FUNCTION storage.prefixes_insert_trigger() OWNER TO supabase_storage_admin;

--
-- Name: search(text, text, integer, integer, integer, text, text, text); Type: FUNCTION; Schema: storage; Owner: supabase_storage_admin
--

CREATE FUNCTION storage.search(prefix text, bucketname text, limits integer DEFAULT 100, levels integer DEFAULT 1, offsets integer DEFAULT 0, search text DEFAULT ''::text, sortcolumn text DEFAULT 'name'::text, sortorder text DEFAULT 'asc'::text) RETURNS TABLE(name text, id uuid, updated_at timestamp with time zone, created_at timestamp with time zone, last_accessed_at timestamp with time zone, metadata jsonb)
    LANGUAGE plpgsql
    AS $$
declare
    can_bypass_rls BOOLEAN;
begin
    SELECT rolbypassrls
    INTO can_bypass_rls
    FROM pg_roles
    WHERE rolname = coalesce(nullif(current_setting('role', true), 'none'), current_user);

    IF can_bypass_rls THEN
        RETURN QUERY SELECT * FROM storage.search_v1_optimised(prefix, bucketname, limits, levels, offsets, search, sortcolumn, sortorder);
    ELSE
        RETURN QUERY SELECT * FROM storage.search_legacy_v1(prefix, bucketname, limits, levels, offsets, search, sortcolumn, sortorder);
    END IF;
end;
$$;


ALTER FUNCTION storage.search(prefix text, bucketname text, limits integer, levels integer, offsets integer, search text, sortcolumn text, sortorder text) OWNER TO supabase_storage_admin;

--
-- Name: search_legacy_v1(text, text, integer, integer, integer, text, text, text); Type: FUNCTION; Schema: storage; Owner: supabase_storage_admin
--

CREATE FUNCTION storage.search_legacy_v1(prefix text, bucketname text, limits integer DEFAULT 100, levels integer DEFAULT 1, offsets integer DEFAULT 0, search text DEFAULT ''::text, sortcolumn text DEFAULT 'name'::text, sortorder text DEFAULT 'asc'::text) RETURNS TABLE(name text, id uuid, updated_at timestamp with time zone, created_at timestamp with time zone, last_accessed_at timestamp with time zone, metadata jsonb)
    LANGUAGE plpgsql STABLE
    AS $_$
declare
    v_order_by text;
    v_sort_order text;
begin
    case
        when sortcolumn = 'name' then
            v_order_by = 'name';
        when sortcolumn = 'updated_at' then
            v_order_by = 'updated_at';
        when sortcolumn = 'created_at' then
            v_order_by = 'created_at';
        when sortcolumn = 'last_accessed_at' then
            v_order_by = 'last_accessed_at';
        else
            v_order_by = 'name';
        end case;

    case
        when sortorder = 'asc' then
            v_sort_order = 'asc';
        when sortorder = 'desc' then
            v_sort_order = 'desc';
        else
            v_sort_order = 'asc';
        end case;

    v_order_by = v_order_by || ' ' || v_sort_order;

    return query execute
        'with folders as (
           select path_tokens[$1] as folder
           from storage.objects
             where objects.name ilike $2 || $3 || ''%''
               and bucket_id = $4
               and array_length(objects.path_tokens, 1) <> $1
           group by folder
           order by folder ' || v_sort_order || '
     )
     (select folder as "name",
            null as id,
            null as updated_at,
            null as created_at,
            null as last_accessed_at,
            null as metadata from folders)
     union all
     (select path_tokens[$1] as "name",
            id,
            updated_at,
            created_at,
            last_accessed_at,
            metadata
     from storage.objects
     where objects.name ilike $2 || $3 || ''%''
       and bucket_id = $4
       and array_length(objects.path_tokens, 1) = $1
     order by ' || v_order_by || ')
     limit $5
     offset $6' using levels, prefix, search, bucketname, limits, offsets;
end;
$_$;


ALTER FUNCTION storage.search_legacy_v1(prefix text, bucketname text, limits integer, levels integer, offsets integer, search text, sortcolumn text, sortorder text) OWNER TO supabase_storage_admin;

--
-- Name: search_v1_optimised(text, text, integer, integer, integer, text, text, text); Type: FUNCTION; Schema: storage; Owner: supabase_storage_admin
--

CREATE FUNCTION storage.search_v1_optimised(prefix text, bucketname text, limits integer DEFAULT 100, levels integer DEFAULT 1, offsets integer DEFAULT 0, search text DEFAULT ''::text, sortcolumn text DEFAULT 'name'::text, sortorder text DEFAULT 'asc'::text) RETURNS TABLE(name text, id uuid, updated_at timestamp with time zone, created_at timestamp with time zone, last_accessed_at timestamp with time zone, metadata jsonb)
    LANGUAGE plpgsql STABLE
    AS $_$
declare
    v_order_by text;
    v_sort_order text;
begin
    case
        when sortcolumn = 'name' then
            v_order_by = 'name';
        when sortcolumn = 'updated_at' then
            v_order_by = 'updated_at';
        when sortcolumn = 'created_at' then
            v_order_by = 'created_at';
        when sortcolumn = 'last_accessed_at' then
            v_order_by = 'last_accessed_at';
        else
            v_order_by = 'name';
        end case;

    case
        when sortorder = 'asc' then
            v_sort_order = 'asc';
        when sortorder = 'desc' then
            v_sort_order = 'desc';
        else
            v_sort_order = 'asc';
        end case;

    v_order_by = v_order_by || ' ' || v_sort_order;

    return query execute
        'with folders as (
           select (string_to_array(name, ''/''))[level] as name
           from storage.prefixes
             where lower(prefixes.name) like lower($2 || $3) || ''%''
               and bucket_id = $4
               and level = $1
           order by name ' || v_sort_order || '
     )
     (select name,
            null as id,
            null as updated_at,
            null as created_at,
            null as last_accessed_at,
            null as metadata from folders)
     union all
     (select path_tokens[level] as "name",
            id,
            updated_at,
            created_at,
            last_accessed_at,
            metadata
     from storage.objects
     where lower(objects.name) like lower($2 || $3) || ''%''
       and bucket_id = $4
       and level = $1
     order by ' || v_order_by || ')
     limit $5
     offset $6' using levels, prefix, search, bucketname, limits, offsets;
end;
$_$;


ALTER FUNCTION storage.search_v1_optimised(prefix text, bucketname text, limits integer, levels integer, offsets integer, search text, sortcolumn text, sortorder text) OWNER TO supabase_storage_admin;

--
-- Name: search_v2(text, text, integer, integer, text, text, text, text); Type: FUNCTION; Schema: storage; Owner: supabase_storage_admin
--

CREATE FUNCTION storage.search_v2(prefix text, bucket_name text, limits integer DEFAULT 100, levels integer DEFAULT 1, start_after text DEFAULT ''::text, sort_order text DEFAULT 'asc'::text, sort_column text DEFAULT 'name'::text, sort_column_after text DEFAULT ''::text) RETURNS TABLE(key text, name text, id uuid, updated_at timestamp with time zone, created_at timestamp with time zone, last_accessed_at timestamp with time zone, metadata jsonb)
    LANGUAGE plpgsql STABLE
    AS $_$
DECLARE
    sort_col text;
    sort_ord text;
    cursor_op text;
    cursor_expr text;
    sort_expr text;
BEGIN
    -- Validate sort_order
    sort_ord := lower(sort_order);
    IF sort_ord NOT IN ('asc', 'desc') THEN
        sort_ord := 'asc';
    END IF;

    -- Determine cursor comparison operator
    IF sort_ord = 'asc' THEN
        cursor_op := '>';
    ELSE
        cursor_op := '<';
    END IF;
    
    sort_col := lower(sort_column);
    -- Validate sort column  
    IF sort_col IN ('updated_at', 'created_at') THEN
        cursor_expr := format(
            '($5 = '''' OR ROW(date_trunc(''milliseconds'', %I), name COLLATE "C") %s ROW(COALESCE(NULLIF($6, '''')::timestamptz, ''epoch''::timestamptz), $5))',
            sort_col, cursor_op
        );
        sort_expr := format(
            'COALESCE(date_trunc(''milliseconds'', %I), ''epoch''::timestamptz) %s, name COLLATE "C" %s',
            sort_col, sort_ord, sort_ord
        );
    ELSE
        cursor_expr := format('($5 = '''' OR name COLLATE "C" %s $5)', cursor_op);
        sort_expr := format('name COLLATE "C" %s', sort_ord);
    END IF;

    RETURN QUERY EXECUTE format(
        $sql$
        SELECT * FROM (
            (
                SELECT
                    split_part(name, '/', $4) AS key,
                    name,
                    NULL::uuid AS id,
                    updated_at,
                    created_at,
                    NULL::timestamptz AS last_accessed_at,
                    NULL::jsonb AS metadata
                FROM storage.prefixes
                WHERE name COLLATE "C" LIKE $1 || '%%'
                    AND bucket_id = $2
                    AND level = $4
                    AND %s
                ORDER BY %s
                LIMIT $3
            )
            UNION ALL
            (
                SELECT
                    split_part(name, '/', $4) AS key,
                    name,
                    id,
                    updated_at,
                    created_at,
                    last_accessed_at,
                    metadata
                FROM storage.objects
                WHERE name COLLATE "C" LIKE $1 || '%%'
                    AND bucket_id = $2
                    AND level = $4
                    AND %s
                ORDER BY %s
                LIMIT $3
            )
        ) obj
        ORDER BY %s
        LIMIT $3
        $sql$,
        cursor_expr,    -- prefixes WHERE
        sort_expr,      -- prefixes ORDER BY
        cursor_expr,    -- objects WHERE
        sort_expr,      -- objects ORDER BY
        sort_expr       -- final ORDER BY
    )
    USING prefix, bucket_name, limits, levels, start_after, sort_column_after;
END;
$_$;


ALTER FUNCTION storage.search_v2(prefix text, bucket_name text, limits integer, levels integer, start_after text, sort_order text, sort_column text, sort_column_after text) OWNER TO supabase_storage_admin;

--
-- Name: update_updated_at_column(); Type: FUNCTION; Schema: storage; Owner: supabase_storage_admin
--

CREATE FUNCTION storage.update_updated_at_column() RETURNS trigger
    LANGUAGE plpgsql
    AS $$
BEGIN
    NEW.updated_at = now();
    RETURN NEW; 
END;
$$;


ALTER FUNCTION storage.update_updated_at_column() OWNER TO supabase_storage_admin;

--
-- Name: http_request(); Type: FUNCTION; Schema: supabase_functions; Owner: supabase_functions_admin
--

CREATE FUNCTION supabase_functions.http_request() RETURNS trigger
    LANGUAGE plpgsql SECURITY DEFINER
    SET search_path TO 'supabase_functions'
    AS $$
    DECLARE
      request_id bigint;
      payload jsonb;
      url text := TG_ARGV[0]::text;
      method text := TG_ARGV[1]::text;
      headers jsonb DEFAULT '{}'::jsonb;
      params jsonb DEFAULT '{}'::jsonb;
      timeout_ms integer DEFAULT 1000;
    BEGIN
      IF url IS NULL OR url = 'null' THEN
        RAISE EXCEPTION 'url argument is missing';
      END IF;

      IF method IS NULL OR method = 'null' THEN
        RAISE EXCEPTION 'method argument is missing';
      END IF;

      IF TG_ARGV[2] IS NULL OR TG_ARGV[2] = 'null' THEN
        headers = '{"Content-Type": "application/json"}'::jsonb;
      ELSE
        headers = TG_ARGV[2]::jsonb;
      END IF;

      IF TG_ARGV[3] IS NULL OR TG_ARGV[3] = 'null' THEN
        params = '{}'::jsonb;
      ELSE
        params = TG_ARGV[3]::jsonb;
      END IF;

      IF TG_ARGV[4] IS NULL OR TG_ARGV[4] = 'null' THEN
        timeout_ms = 1000;
      ELSE
        timeout_ms = TG_ARGV[4]::integer;
      END IF;

      CASE
        WHEN method = 'GET' THEN
          SELECT http_get INTO request_id FROM net.http_get(
            url,
            params,
            headers,
            timeout_ms
          );
        WHEN method = 'POST' THEN
          payload = jsonb_build_object(
            'old_record', OLD,
            'record', NEW,
            'type', TG_OP,
            'table', TG_TABLE_NAME,
            'schema', TG_TABLE_SCHEMA
          );

          SELECT http_post INTO request_id FROM net.http_post(
            url,
            payload,
            params,
            headers,
            timeout_ms
          );
        ELSE
          RAISE EXCEPTION 'method argument % is invalid', method;
      END CASE;

      INSERT INTO supabase_functions.hooks
        (hook_table_id, hook_name, request_id)
      VALUES
        (TG_RELID, TG_NAME, request_id);

      RETURN NEW;
    END
  $$;


ALTER FUNCTION supabase_functions.http_request() OWNER TO supabase_functions_admin;

SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- Name: extensions; Type: TABLE; Schema: _realtime; Owner: supabase_admin
--

CREATE TABLE _realtime.extensions (
    id uuid NOT NULL,
    type text,
    settings jsonb,
    tenant_external_id text,
    inserted_at timestamp(0) without time zone NOT NULL,
    updated_at timestamp(0) without time zone NOT NULL
);


ALTER TABLE _realtime.extensions OWNER TO supabase_admin;

--
-- Name: schema_migrations; Type: TABLE; Schema: _realtime; Owner: supabase_admin
--

CREATE TABLE _realtime.schema_migrations (
    version bigint NOT NULL,
    inserted_at timestamp(0) without time zone
);


ALTER TABLE _realtime.schema_migrations OWNER TO supabase_admin;

--
-- Name: tenants; Type: TABLE; Schema: _realtime; Owner: supabase_admin
--

CREATE TABLE _realtime.tenants (
    id uuid NOT NULL,
    name text,
    external_id text,
    jwt_secret text,
    max_concurrent_users integer DEFAULT 200 NOT NULL,
    inserted_at timestamp(0) without time zone NOT NULL,
    updated_at timestamp(0) without time zone NOT NULL,
    max_events_per_second integer DEFAULT 100 NOT NULL,
    postgres_cdc_default text DEFAULT 'postgres_cdc_rls'::text,
    max_bytes_per_second integer DEFAULT 100000 NOT NULL,
    max_channels_per_client integer DEFAULT 100 NOT NULL,
    max_joins_per_second integer DEFAULT 500 NOT NULL,
    suspend boolean DEFAULT false,
    jwt_jwks jsonb,
    notify_private_alpha boolean DEFAULT false,
    private_only boolean DEFAULT false NOT NULL,
    migrations_ran integer DEFAULT 0,
    broadcast_adapter character varying(255) DEFAULT 'gen_rpc'::character varying,
    max_presence_events_per_second integer DEFAULT 10000,
    max_payload_size_in_kb integer DEFAULT 3000
);


ALTER TABLE _realtime.tenants OWNER TO supabase_admin;

--
-- Name: audit_log_entries; Type: TABLE; Schema: auth; Owner: supabase_auth_admin
--

CREATE TABLE auth.audit_log_entries (
    instance_id uuid,
    id uuid NOT NULL,
    payload json,
    created_at timestamp with time zone,
    ip_address character varying(64) DEFAULT ''::character varying NOT NULL
);


ALTER TABLE auth.audit_log_entries OWNER TO supabase_auth_admin;

--
-- Name: TABLE audit_log_entries; Type: COMMENT; Schema: auth; Owner: supabase_auth_admin
--

COMMENT ON TABLE auth.audit_log_entries IS 'Auth: Audit trail for user actions.';


--
-- Name: flow_state; Type: TABLE; Schema: auth; Owner: supabase_auth_admin
--

CREATE TABLE auth.flow_state (
    id uuid NOT NULL,
    user_id uuid,
    auth_code text NOT NULL,
    code_challenge_method auth.code_challenge_method NOT NULL,
    code_challenge text NOT NULL,
    provider_type text NOT NULL,
    provider_access_token text,
    provider_refresh_token text,
    created_at timestamp with time zone,
    updated_at timestamp with time zone,
    authentication_method text NOT NULL,
    auth_code_issued_at timestamp with time zone
);


ALTER TABLE auth.flow_state OWNER TO supabase_auth_admin;

--
-- Name: TABLE flow_state; Type: COMMENT; Schema: auth; Owner: supabase_auth_admin
--

COMMENT ON TABLE auth.flow_state IS 'stores metadata for pkce logins';


--
-- Name: identities; Type: TABLE; Schema: auth; Owner: supabase_auth_admin
--

CREATE TABLE auth.identities (
    provider_id text NOT NULL,
    user_id uuid NOT NULL,
    identity_data jsonb NOT NULL,
    provider text NOT NULL,
    last_sign_in_at timestamp with time zone,
    created_at timestamp with time zone,
    updated_at timestamp with time zone,
    email text GENERATED ALWAYS AS (lower((identity_data ->> 'email'::text))) STORED,
    id uuid DEFAULT gen_random_uuid() NOT NULL
);


ALTER TABLE auth.identities OWNER TO supabase_auth_admin;

--
-- Name: TABLE identities; Type: COMMENT; Schema: auth; Owner: supabase_auth_admin
--

COMMENT ON TABLE auth.identities IS 'Auth: Stores identities associated to a user.';


--
-- Name: COLUMN identities.email; Type: COMMENT; Schema: auth; Owner: supabase_auth_admin
--

COMMENT ON COLUMN auth.identities.email IS 'Auth: Email is a generated column that references the optional email property in the identity_data';


--
-- Name: instances; Type: TABLE; Schema: auth; Owner: supabase_auth_admin
--

CREATE TABLE auth.instances (
    id uuid NOT NULL,
    uuid uuid,
    raw_base_config text,
    created_at timestamp with time zone,
    updated_at timestamp with time zone
);


ALTER TABLE auth.instances OWNER TO supabase_auth_admin;

--
-- Name: TABLE instances; Type: COMMENT; Schema: auth; Owner: supabase_auth_admin
--

COMMENT ON TABLE auth.instances IS 'Auth: Manages users across multiple sites.';


--
-- Name: mfa_amr_claims; Type: TABLE; Schema: auth; Owner: supabase_auth_admin
--

CREATE TABLE auth.mfa_amr_claims (
    session_id uuid NOT NULL,
    created_at timestamp with time zone NOT NULL,
    updated_at timestamp with time zone NOT NULL,
    authentication_method text NOT NULL,
    id uuid NOT NULL
);


ALTER TABLE auth.mfa_amr_claims OWNER TO supabase_auth_admin;

--
-- Name: TABLE mfa_amr_claims; Type: COMMENT; Schema: auth; Owner: supabase_auth_admin
--

COMMENT ON TABLE auth.mfa_amr_claims IS 'auth: stores authenticator method reference claims for multi factor authentication';


--
-- Name: mfa_challenges; Type: TABLE; Schema: auth; Owner: supabase_auth_admin
--

CREATE TABLE auth.mfa_challenges (
    id uuid NOT NULL,
    factor_id uuid NOT NULL,
    created_at timestamp with time zone NOT NULL,
    verified_at timestamp with time zone,
    ip_address inet NOT NULL,
    otp_code text,
    web_authn_session_data jsonb
);


ALTER TABLE auth.mfa_challenges OWNER TO supabase_auth_admin;

--
-- Name: TABLE mfa_challenges; Type: COMMENT; Schema: auth; Owner: supabase_auth_admin
--

COMMENT ON TABLE auth.mfa_challenges IS 'auth: stores metadata about challenge requests made';


--
-- Name: mfa_factors; Type: TABLE; Schema: auth; Owner: supabase_auth_admin
--

CREATE TABLE auth.mfa_factors (
    id uuid NOT NULL,
    user_id uuid NOT NULL,
    friendly_name text,
    factor_type auth.factor_type NOT NULL,
    status auth.factor_status NOT NULL,
    created_at timestamp with time zone NOT NULL,
    updated_at timestamp with time zone NOT NULL,
    secret text,
    phone text,
    last_challenged_at timestamp with time zone,
    web_authn_credential jsonb,
    web_authn_aaguid uuid
);


ALTER TABLE auth.mfa_factors OWNER TO supabase_auth_admin;

--
-- Name: TABLE mfa_factors; Type: COMMENT; Schema: auth; Owner: supabase_auth_admin
--

COMMENT ON TABLE auth.mfa_factors IS 'auth: stores metadata about factors';


--
-- Name: oauth_authorizations; Type: TABLE; Schema: auth; Owner: supabase_auth_admin
--

CREATE TABLE auth.oauth_authorizations (
    id uuid NOT NULL,
    authorization_id text NOT NULL,
    client_id uuid NOT NULL,
    user_id uuid,
    redirect_uri text NOT NULL,
    scope text NOT NULL,
    state text,
    resource text,
    code_challenge text,
    code_challenge_method auth.code_challenge_method,
    response_type auth.oauth_response_type DEFAULT 'code'::auth.oauth_response_type NOT NULL,
    status auth.oauth_authorization_status DEFAULT 'pending'::auth.oauth_authorization_status NOT NULL,
    authorization_code text,
    created_at timestamp with time zone DEFAULT now() NOT NULL,
    expires_at timestamp with time zone DEFAULT (now() + '00:03:00'::interval) NOT NULL,
    approved_at timestamp with time zone,
    CONSTRAINT oauth_authorizations_authorization_code_length CHECK ((char_length(authorization_code) <= 255)),
    CONSTRAINT oauth_authorizations_code_challenge_length CHECK ((char_length(code_challenge) <= 128)),
    CONSTRAINT oauth_authorizations_expires_at_future CHECK ((expires_at > created_at)),
    CONSTRAINT oauth_authorizations_redirect_uri_length CHECK ((char_length(redirect_uri) <= 2048)),
    CONSTRAINT oauth_authorizations_resource_length CHECK ((char_length(resource) <= 2048)),
    CONSTRAINT oauth_authorizations_scope_length CHECK ((char_length(scope) <= 4096)),
    CONSTRAINT oauth_authorizations_state_length CHECK ((char_length(state) <= 4096))
);


ALTER TABLE auth.oauth_authorizations OWNER TO supabase_auth_admin;

--
-- Name: oauth_clients; Type: TABLE; Schema: auth; Owner: supabase_auth_admin
--

CREATE TABLE auth.oauth_clients (
    id uuid NOT NULL,
    client_secret_hash text,
    registration_type auth.oauth_registration_type NOT NULL,
    redirect_uris text NOT NULL,
    grant_types text NOT NULL,
    client_name text,
    client_uri text,
    logo_uri text,
    created_at timestamp with time zone DEFAULT now() NOT NULL,
    updated_at timestamp with time zone DEFAULT now() NOT NULL,
    deleted_at timestamp with time zone,
    client_type auth.oauth_client_type DEFAULT 'confidential'::auth.oauth_client_type NOT NULL,
    CONSTRAINT oauth_clients_client_name_length CHECK ((char_length(client_name) <= 1024)),
    CONSTRAINT oauth_clients_client_uri_length CHECK ((char_length(client_uri) <= 2048)),
    CONSTRAINT oauth_clients_logo_uri_length CHECK ((char_length(logo_uri) <= 2048))
);


ALTER TABLE auth.oauth_clients OWNER TO supabase_auth_admin;

--
-- Name: oauth_consents; Type: TABLE; Schema: auth; Owner: supabase_auth_admin
--

CREATE TABLE auth.oauth_consents (
    id uuid NOT NULL,
    user_id uuid NOT NULL,
    client_id uuid NOT NULL,
    scopes text NOT NULL,
    granted_at timestamp with time zone DEFAULT now() NOT NULL,
    revoked_at timestamp with time zone,
    CONSTRAINT oauth_consents_revoked_after_granted CHECK (((revoked_at IS NULL) OR (revoked_at >= granted_at))),
    CONSTRAINT oauth_consents_scopes_length CHECK ((char_length(scopes) <= 2048)),
    CONSTRAINT oauth_consents_scopes_not_empty CHECK ((char_length(TRIM(BOTH FROM scopes)) > 0))
);


ALTER TABLE auth.oauth_consents OWNER TO supabase_auth_admin;

--
-- Name: one_time_tokens; Type: TABLE; Schema: auth; Owner: supabase_auth_admin
--

CREATE TABLE auth.one_time_tokens (
    id uuid NOT NULL,
    user_id uuid NOT NULL,
    token_type auth.one_time_token_type NOT NULL,
    token_hash text NOT NULL,
    relates_to text NOT NULL,
    created_at timestamp without time zone DEFAULT now() NOT NULL,
    updated_at timestamp without time zone DEFAULT now() NOT NULL,
    CONSTRAINT one_time_tokens_token_hash_check CHECK ((char_length(token_hash) > 0))
);


ALTER TABLE auth.one_time_tokens OWNER TO supabase_auth_admin;

--
-- Name: refresh_tokens; Type: TABLE; Schema: auth; Owner: supabase_auth_admin
--

CREATE TABLE auth.refresh_tokens (
    instance_id uuid,
    id bigint NOT NULL,
    token character varying(255),
    user_id character varying(255),
    revoked boolean,
    created_at timestamp with time zone,
    updated_at timestamp with time zone,
    parent character varying(255),
    session_id uuid
);


ALTER TABLE auth.refresh_tokens OWNER TO supabase_auth_admin;

--
-- Name: TABLE refresh_tokens; Type: COMMENT; Schema: auth; Owner: supabase_auth_admin
--

COMMENT ON TABLE auth.refresh_tokens IS 'Auth: Store of tokens used to refresh JWT tokens once they expire.';


--
-- Name: refresh_tokens_id_seq; Type: SEQUENCE; Schema: auth; Owner: supabase_auth_admin
--

CREATE SEQUENCE auth.refresh_tokens_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE auth.refresh_tokens_id_seq OWNER TO supabase_auth_admin;

--
-- Name: refresh_tokens_id_seq; Type: SEQUENCE OWNED BY; Schema: auth; Owner: supabase_auth_admin
--

ALTER SEQUENCE auth.refresh_tokens_id_seq OWNED BY auth.refresh_tokens.id;


--
-- Name: saml_providers; Type: TABLE; Schema: auth; Owner: supabase_auth_admin
--

CREATE TABLE auth.saml_providers (
    id uuid NOT NULL,
    sso_provider_id uuid NOT NULL,
    entity_id text NOT NULL,
    metadata_xml text NOT NULL,
    metadata_url text,
    attribute_mapping jsonb,
    created_at timestamp with time zone,
    updated_at timestamp with time zone,
    name_id_format text,
    CONSTRAINT "entity_id not empty" CHECK ((char_length(entity_id) > 0)),
    CONSTRAINT "metadata_url not empty" CHECK (((metadata_url = NULL::text) OR (char_length(metadata_url) > 0))),
    CONSTRAINT "metadata_xml not empty" CHECK ((char_length(metadata_xml) > 0))
);


ALTER TABLE auth.saml_providers OWNER TO supabase_auth_admin;

--
-- Name: TABLE saml_providers; Type: COMMENT; Schema: auth; Owner: supabase_auth_admin
--

COMMENT ON TABLE auth.saml_providers IS 'Auth: Manages SAML Identity Provider connections.';


--
-- Name: saml_relay_states; Type: TABLE; Schema: auth; Owner: supabase_auth_admin
--

CREATE TABLE auth.saml_relay_states (
    id uuid NOT NULL,
    sso_provider_id uuid NOT NULL,
    request_id text NOT NULL,
    for_email text,
    redirect_to text,
    created_at timestamp with time zone,
    updated_at timestamp with time zone,
    flow_state_id uuid,
    CONSTRAINT "request_id not empty" CHECK ((char_length(request_id) > 0))
);


ALTER TABLE auth.saml_relay_states OWNER TO supabase_auth_admin;

--
-- Name: TABLE saml_relay_states; Type: COMMENT; Schema: auth; Owner: supabase_auth_admin
--

COMMENT ON TABLE auth.saml_relay_states IS 'Auth: Contains SAML Relay State information for each Service Provider initiated login.';


--
-- Name: schema_migrations; Type: TABLE; Schema: auth; Owner: supabase_auth_admin
--

CREATE TABLE auth.schema_migrations (
    version character varying(255) NOT NULL
);


ALTER TABLE auth.schema_migrations OWNER TO supabase_auth_admin;

--
-- Name: TABLE schema_migrations; Type: COMMENT; Schema: auth; Owner: supabase_auth_admin
--

COMMENT ON TABLE auth.schema_migrations IS 'Auth: Manages updates to the auth system.';


--
-- Name: sessions; Type: TABLE; Schema: auth; Owner: supabase_auth_admin
--

CREATE TABLE auth.sessions (
    id uuid NOT NULL,
    user_id uuid NOT NULL,
    created_at timestamp with time zone,
    updated_at timestamp with time zone,
    factor_id uuid,
    aal auth.aal_level,
    not_after timestamp with time zone,
    refreshed_at timestamp without time zone,
    user_agent text,
    ip inet,
    tag text,
    oauth_client_id uuid
);


ALTER TABLE auth.sessions OWNER TO supabase_auth_admin;

--
-- Name: TABLE sessions; Type: COMMENT; Schema: auth; Owner: supabase_auth_admin
--

COMMENT ON TABLE auth.sessions IS 'Auth: Stores session data associated to a user.';


--
-- Name: COLUMN sessions.not_after; Type: COMMENT; Schema: auth; Owner: supabase_auth_admin
--

COMMENT ON COLUMN auth.sessions.not_after IS 'Auth: Not after is a nullable column that contains a timestamp after which the session should be regarded as expired.';


--
-- Name: sso_domains; Type: TABLE; Schema: auth; Owner: supabase_auth_admin
--

CREATE TABLE auth.sso_domains (
    id uuid NOT NULL,
    sso_provider_id uuid NOT NULL,
    domain text NOT NULL,
    created_at timestamp with time zone,
    updated_at timestamp with time zone,
    CONSTRAINT "domain not empty" CHECK ((char_length(domain) > 0))
);


ALTER TABLE auth.sso_domains OWNER TO supabase_auth_admin;

--
-- Name: TABLE sso_domains; Type: COMMENT; Schema: auth; Owner: supabase_auth_admin
--

COMMENT ON TABLE auth.sso_domains IS 'Auth: Manages SSO email address domain mapping to an SSO Identity Provider.';


--
-- Name: sso_providers; Type: TABLE; Schema: auth; Owner: supabase_auth_admin
--

CREATE TABLE auth.sso_providers (
    id uuid NOT NULL,
    resource_id text,
    created_at timestamp with time zone,
    updated_at timestamp with time zone,
    disabled boolean,
    CONSTRAINT "resource_id not empty" CHECK (((resource_id = NULL::text) OR (char_length(resource_id) > 0)))
);


ALTER TABLE auth.sso_providers OWNER TO supabase_auth_admin;

--
-- Name: TABLE sso_providers; Type: COMMENT; Schema: auth; Owner: supabase_auth_admin
--

COMMENT ON TABLE auth.sso_providers IS 'Auth: Manages SSO identity provider information; see saml_providers for SAML.';


--
-- Name: COLUMN sso_providers.resource_id; Type: COMMENT; Schema: auth; Owner: supabase_auth_admin
--

COMMENT ON COLUMN auth.sso_providers.resource_id IS 'Auth: Uniquely identifies a SSO provider according to a user-chosen resource ID (case insensitive), useful in infrastructure as code.';


--
-- Name: users; Type: TABLE; Schema: auth; Owner: supabase_auth_admin
--

CREATE TABLE auth.users (
    instance_id uuid,
    id uuid NOT NULL,
    aud character varying(255),
    role character varying(255),
    email character varying(255),
    encrypted_password character varying(255),
    email_confirmed_at timestamp with time zone,
    invited_at timestamp with time zone,
    confirmation_token character varying(255),
    confirmation_sent_at timestamp with time zone,
    recovery_token character varying(255),
    recovery_sent_at timestamp with time zone,
    email_change_token_new character varying(255),
    email_change character varying(255),
    email_change_sent_at timestamp with time zone,
    last_sign_in_at timestamp with time zone,
    raw_app_meta_data jsonb,
    raw_user_meta_data jsonb,
    is_super_admin boolean,
    created_at timestamp with time zone,
    updated_at timestamp with time zone,
    phone text DEFAULT NULL::character varying,
    phone_confirmed_at timestamp with time zone,
    phone_change text DEFAULT ''::character varying,
    phone_change_token character varying(255) DEFAULT ''::character varying,
    phone_change_sent_at timestamp with time zone,
    confirmed_at timestamp with time zone GENERATED ALWAYS AS (LEAST(email_confirmed_at, phone_confirmed_at)) STORED,
    email_change_token_current character varying(255) DEFAULT ''::character varying,
    email_change_confirm_status smallint DEFAULT 0,
    banned_until timestamp with time zone,
    reauthentication_token character varying(255) DEFAULT ''::character varying,
    reauthentication_sent_at timestamp with time zone,
    is_sso_user boolean DEFAULT false NOT NULL,
    deleted_at timestamp with time zone,
    is_anonymous boolean DEFAULT false NOT NULL,
    CONSTRAINT users_email_change_confirm_status_check CHECK (((email_change_confirm_status >= 0) AND (email_change_confirm_status <= 2)))
);


ALTER TABLE auth.users OWNER TO supabase_auth_admin;

--
-- Name: TABLE users; Type: COMMENT; Schema: auth; Owner: supabase_auth_admin
--

COMMENT ON TABLE auth.users IS 'Auth: Stores user login data within a secure schema.';


--
-- Name: COLUMN users.is_sso_user; Type: COMMENT; Schema: auth; Owner: supabase_auth_admin
--

COMMENT ON COLUMN auth.users.is_sso_user IS 'Auth: Set this column to true when the account comes from SSO. These accounts can have duplicate emails.';


--
-- Name: patrimonios; Type: TABLE; Schema: public; Owner: supabase_admin
--

CREATE TABLE public.patrimonios (
    id bigint NOT NULL,
    "patNum" text NOT NULL,
    "atmNum" text NOT NULL,
    descricao text NOT NULL,
    valor text NOT NULL,
    conservacao text NOT NULL,
    sala text NOT NULL,
    "lastEditedBy" text NOT NULL,
    "lastEditedAt" text NOT NULL,
    image jsonb,
    owner_id uuid
);


ALTER TABLE public.patrimonios OWNER TO supabase_admin;

--
-- Name: patrimonios_id_seq; Type: SEQUENCE; Schema: public; Owner: supabase_admin
--

ALTER TABLE public.patrimonios ALTER COLUMN id ADD GENERATED BY DEFAULT AS IDENTITY (
    SEQUENCE NAME public.patrimonios_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: permissoes; Type: TABLE; Schema: public; Owner: supabase_admin
--

CREATE TABLE public.permissoes (
    id bigint NOT NULL,
    user_id uuid NOT NULL,
    owner_id uuid NOT NULL,
    patrimonio_id bigint,
    created_at timestamp with time zone DEFAULT now()
);


ALTER TABLE public.permissoes OWNER TO supabase_admin;

--
-- Name: permissoes_id_seq; Type: SEQUENCE; Schema: public; Owner: supabase_admin
--

ALTER TABLE public.permissoes ALTER COLUMN id ADD GENERATED BY DEFAULT AS IDENTITY (
    SEQUENCE NAME public.permissoes_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: profiles; Type: TABLE; Schema: public; Owner: supabase_admin
--

CREATE TABLE public.profiles (
    id uuid NOT NULL,
    email text,
    full_name text,
    created_at timestamp with time zone DEFAULT now()
);


ALTER TABLE public.profiles OWNER TO supabase_admin;

--
-- Name: messages; Type: TABLE; Schema: realtime; Owner: supabase_realtime_admin
--

CREATE TABLE realtime.messages (
    topic text NOT NULL,
    extension text NOT NULL,
    payload jsonb,
    event text,
    private boolean DEFAULT false,
    updated_at timestamp without time zone DEFAULT now() NOT NULL,
    inserted_at timestamp without time zone DEFAULT now() NOT NULL,
    id uuid DEFAULT gen_random_uuid() NOT NULL
)
PARTITION BY RANGE (inserted_at);


ALTER TABLE realtime.messages OWNER TO supabase_realtime_admin;

--
-- Name: messages_2026_03_26; Type: TABLE; Schema: realtime; Owner: supabase_admin
--

CREATE TABLE realtime.messages_2026_03_26 (
    topic text NOT NULL,
    extension text NOT NULL,
    payload jsonb,
    event text,
    private boolean DEFAULT false,
    updated_at timestamp without time zone DEFAULT now() NOT NULL,
    inserted_at timestamp without time zone DEFAULT now() NOT NULL,
    id uuid DEFAULT gen_random_uuid() NOT NULL
);


ALTER TABLE realtime.messages_2026_03_26 OWNER TO supabase_admin;

--
-- Name: messages_2026_03_27; Type: TABLE; Schema: realtime; Owner: supabase_admin
--

CREATE TABLE realtime.messages_2026_03_27 (
    topic text NOT NULL,
    extension text NOT NULL,
    payload jsonb,
    event text,
    private boolean DEFAULT false,
    updated_at timestamp without time zone DEFAULT now() NOT NULL,
    inserted_at timestamp without time zone DEFAULT now() NOT NULL,
    id uuid DEFAULT gen_random_uuid() NOT NULL
);


ALTER TABLE realtime.messages_2026_03_27 OWNER TO supabase_admin;

--
-- Name: messages_2026_03_28; Type: TABLE; Schema: realtime; Owner: supabase_admin
--

CREATE TABLE realtime.messages_2026_03_28 (
    topic text NOT NULL,
    extension text NOT NULL,
    payload jsonb,
    event text,
    private boolean DEFAULT false,
    updated_at timestamp without time zone DEFAULT now() NOT NULL,
    inserted_at timestamp without time zone DEFAULT now() NOT NULL,
    id uuid DEFAULT gen_random_uuid() NOT NULL
);


ALTER TABLE realtime.messages_2026_03_28 OWNER TO supabase_admin;

--
-- Name: messages_2026_03_29; Type: TABLE; Schema: realtime; Owner: supabase_admin
--

CREATE TABLE realtime.messages_2026_03_29 (
    topic text NOT NULL,
    extension text NOT NULL,
    payload jsonb,
    event text,
    private boolean DEFAULT false,
    updated_at timestamp without time zone DEFAULT now() NOT NULL,
    inserted_at timestamp without time zone DEFAULT now() NOT NULL,
    id uuid DEFAULT gen_random_uuid() NOT NULL
);


ALTER TABLE realtime.messages_2026_03_29 OWNER TO supabase_admin;

--
-- Name: messages_2026_03_30; Type: TABLE; Schema: realtime; Owner: supabase_admin
--

CREATE TABLE realtime.messages_2026_03_30 (
    topic text NOT NULL,
    extension text NOT NULL,
    payload jsonb,
    event text,
    private boolean DEFAULT false,
    updated_at timestamp without time zone DEFAULT now() NOT NULL,
    inserted_at timestamp without time zone DEFAULT now() NOT NULL,
    id uuid DEFAULT gen_random_uuid() NOT NULL
);


ALTER TABLE realtime.messages_2026_03_30 OWNER TO supabase_admin;

--
-- Name: schema_migrations; Type: TABLE; Schema: realtime; Owner: supabase_admin
--

CREATE TABLE realtime.schema_migrations (
    version bigint NOT NULL,
    inserted_at timestamp(0) without time zone
);


ALTER TABLE realtime.schema_migrations OWNER TO supabase_admin;

--
-- Name: subscription; Type: TABLE; Schema: realtime; Owner: supabase_admin
--

CREATE TABLE realtime.subscription (
    id bigint NOT NULL,
    subscription_id uuid NOT NULL,
    entity regclass NOT NULL,
    filters realtime.user_defined_filter[] DEFAULT '{}'::realtime.user_defined_filter[] NOT NULL,
    claims jsonb NOT NULL,
    claims_role regrole GENERATED ALWAYS AS (realtime.to_regrole((claims ->> 'role'::text))) STORED NOT NULL,
    created_at timestamp without time zone DEFAULT timezone('utc'::text, now()) NOT NULL
);


ALTER TABLE realtime.subscription OWNER TO supabase_admin;

--
-- Name: subscription_id_seq; Type: SEQUENCE; Schema: realtime; Owner: supabase_admin
--

ALTER TABLE realtime.subscription ALTER COLUMN id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME realtime.subscription_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: buckets; Type: TABLE; Schema: storage; Owner: supabase_storage_admin
--

CREATE TABLE storage.buckets (
    id text NOT NULL,
    name text NOT NULL,
    owner uuid,
    created_at timestamp with time zone DEFAULT now(),
    updated_at timestamp with time zone DEFAULT now(),
    public boolean DEFAULT false,
    avif_autodetection boolean DEFAULT false,
    file_size_limit bigint,
    allowed_mime_types text[],
    owner_id text,
    type storage.buckettype DEFAULT 'STANDARD'::storage.buckettype NOT NULL
);


ALTER TABLE storage.buckets OWNER TO supabase_storage_admin;

--
-- Name: COLUMN buckets.owner; Type: COMMENT; Schema: storage; Owner: supabase_storage_admin
--

COMMENT ON COLUMN storage.buckets.owner IS 'Field is deprecated, use owner_id instead';


--
-- Name: buckets_analytics; Type: TABLE; Schema: storage; Owner: supabase_storage_admin
--

CREATE TABLE storage.buckets_analytics (
    id text NOT NULL,
    type storage.buckettype DEFAULT 'ANALYTICS'::storage.buckettype NOT NULL,
    format text DEFAULT 'ICEBERG'::text NOT NULL,
    created_at timestamp with time zone DEFAULT now() NOT NULL,
    updated_at timestamp with time zone DEFAULT now() NOT NULL
);


ALTER TABLE storage.buckets_analytics OWNER TO supabase_storage_admin;

--
-- Name: iceberg_namespaces; Type: TABLE; Schema: storage; Owner: supabase_storage_admin
--

CREATE TABLE storage.iceberg_namespaces (
    id uuid DEFAULT gen_random_uuid() NOT NULL,
    bucket_id text NOT NULL,
    name text NOT NULL COLLATE pg_catalog."C",
    created_at timestamp with time zone DEFAULT now() NOT NULL,
    updated_at timestamp with time zone DEFAULT now() NOT NULL
);


ALTER TABLE storage.iceberg_namespaces OWNER TO supabase_storage_admin;

--
-- Name: iceberg_tables; Type: TABLE; Schema: storage; Owner: supabase_storage_admin
--

CREATE TABLE storage.iceberg_tables (
    id uuid DEFAULT gen_random_uuid() NOT NULL,
    namespace_id uuid NOT NULL,
    bucket_id text NOT NULL,
    name text NOT NULL COLLATE pg_catalog."C",
    location text NOT NULL,
    created_at timestamp with time zone DEFAULT now() NOT NULL,
    updated_at timestamp with time zone DEFAULT now() NOT NULL
);


ALTER TABLE storage.iceberg_tables OWNER TO supabase_storage_admin;

--
-- Name: migrations; Type: TABLE; Schema: storage; Owner: supabase_storage_admin
--

CREATE TABLE storage.migrations (
    id integer NOT NULL,
    name character varying(100) NOT NULL,
    hash character varying(40) NOT NULL,
    executed_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP
);


ALTER TABLE storage.migrations OWNER TO supabase_storage_admin;

--
-- Name: objects; Type: TABLE; Schema: storage; Owner: supabase_storage_admin
--

CREATE TABLE storage.objects (
    id uuid DEFAULT gen_random_uuid() NOT NULL,
    bucket_id text,
    name text,
    owner uuid,
    created_at timestamp with time zone DEFAULT now(),
    updated_at timestamp with time zone DEFAULT now(),
    last_accessed_at timestamp with time zone DEFAULT now(),
    metadata jsonb,
    path_tokens text[] GENERATED ALWAYS AS (string_to_array(name, '/'::text)) STORED,
    version text,
    owner_id text,
    user_metadata jsonb,
    level integer
);


ALTER TABLE storage.objects OWNER TO supabase_storage_admin;

--
-- Name: COLUMN objects.owner; Type: COMMENT; Schema: storage; Owner: supabase_storage_admin
--

COMMENT ON COLUMN storage.objects.owner IS 'Field is deprecated, use owner_id instead';


--
-- Name: prefixes; Type: TABLE; Schema: storage; Owner: supabase_storage_admin
--

CREATE TABLE storage.prefixes (
    bucket_id text NOT NULL,
    name text NOT NULL COLLATE pg_catalog."C",
    level integer GENERATED ALWAYS AS (storage.get_level(name)) STORED NOT NULL,
    created_at timestamp with time zone DEFAULT now(),
    updated_at timestamp with time zone DEFAULT now()
);


ALTER TABLE storage.prefixes OWNER TO supabase_storage_admin;

--
-- Name: s3_multipart_uploads; Type: TABLE; Schema: storage; Owner: supabase_storage_admin
--

CREATE TABLE storage.s3_multipart_uploads (
    id text NOT NULL,
    in_progress_size bigint DEFAULT 0 NOT NULL,
    upload_signature text NOT NULL,
    bucket_id text NOT NULL,
    key text NOT NULL COLLATE pg_catalog."C",
    version text NOT NULL,
    owner_id text,
    created_at timestamp with time zone DEFAULT now() NOT NULL,
    user_metadata jsonb
);


ALTER TABLE storage.s3_multipart_uploads OWNER TO supabase_storage_admin;

--
-- Name: s3_multipart_uploads_parts; Type: TABLE; Schema: storage; Owner: supabase_storage_admin
--

CREATE TABLE storage.s3_multipart_uploads_parts (
    id uuid DEFAULT gen_random_uuid() NOT NULL,
    upload_id text NOT NULL,
    size bigint DEFAULT 0 NOT NULL,
    part_number integer NOT NULL,
    bucket_id text NOT NULL,
    key text NOT NULL COLLATE pg_catalog."C",
    etag text NOT NULL,
    owner_id text,
    version text NOT NULL,
    created_at timestamp with time zone DEFAULT now() NOT NULL
);


ALTER TABLE storage.s3_multipart_uploads_parts OWNER TO supabase_storage_admin;

--
-- Name: hooks; Type: TABLE; Schema: supabase_functions; Owner: supabase_functions_admin
--

CREATE TABLE supabase_functions.hooks (
    id bigint NOT NULL,
    hook_table_id integer NOT NULL,
    hook_name text NOT NULL,
    created_at timestamp with time zone DEFAULT now() NOT NULL,
    request_id bigint
);


ALTER TABLE supabase_functions.hooks OWNER TO supabase_functions_admin;

--
-- Name: TABLE hooks; Type: COMMENT; Schema: supabase_functions; Owner: supabase_functions_admin
--

COMMENT ON TABLE supabase_functions.hooks IS 'Supabase Functions Hooks: Audit trail for triggered hooks.';


--
-- Name: hooks_id_seq; Type: SEQUENCE; Schema: supabase_functions; Owner: supabase_functions_admin
--

CREATE SEQUENCE supabase_functions.hooks_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE supabase_functions.hooks_id_seq OWNER TO supabase_functions_admin;

--
-- Name: hooks_id_seq; Type: SEQUENCE OWNED BY; Schema: supabase_functions; Owner: supabase_functions_admin
--

ALTER SEQUENCE supabase_functions.hooks_id_seq OWNED BY supabase_functions.hooks.id;


--
-- Name: migrations; Type: TABLE; Schema: supabase_functions; Owner: supabase_functions_admin
--

CREATE TABLE supabase_functions.migrations (
    version text NOT NULL,
    inserted_at timestamp with time zone DEFAULT now() NOT NULL
);


ALTER TABLE supabase_functions.migrations OWNER TO supabase_functions_admin;

--
-- Name: messages_2026_03_26; Type: TABLE ATTACH; Schema: realtime; Owner: supabase_admin
--

ALTER TABLE ONLY realtime.messages ATTACH PARTITION realtime.messages_2026_03_26 FOR VALUES FROM ('2026-03-26 00:00:00') TO ('2026-03-27 00:00:00');


--
-- Name: messages_2026_03_27; Type: TABLE ATTACH; Schema: realtime; Owner: supabase_admin
--

ALTER TABLE ONLY realtime.messages ATTACH PARTITION realtime.messages_2026_03_27 FOR VALUES FROM ('2026-03-27 00:00:00') TO ('2026-03-28 00:00:00');


--
-- Name: messages_2026_03_28; Type: TABLE ATTACH; Schema: realtime; Owner: supabase_admin
--

ALTER TABLE ONLY realtime.messages ATTACH PARTITION realtime.messages_2026_03_28 FOR VALUES FROM ('2026-03-28 00:00:00') TO ('2026-03-29 00:00:00');


--
-- Name: messages_2026_03_29; Type: TABLE ATTACH; Schema: realtime; Owner: supabase_admin
--

ALTER TABLE ONLY realtime.messages ATTACH PARTITION realtime.messages_2026_03_29 FOR VALUES FROM ('2026-03-29 00:00:00') TO ('2026-03-30 00:00:00');


--
-- Name: messages_2026_03_30; Type: TABLE ATTACH; Schema: realtime; Owner: supabase_admin
--

ALTER TABLE ONLY realtime.messages ATTACH PARTITION realtime.messages_2026_03_30 FOR VALUES FROM ('2026-03-30 00:00:00') TO ('2026-03-31 00:00:00');


--
-- Name: refresh_tokens id; Type: DEFAULT; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE ONLY auth.refresh_tokens ALTER COLUMN id SET DEFAULT nextval('auth.refresh_tokens_id_seq'::regclass);


--
-- Name: hooks id; Type: DEFAULT; Schema: supabase_functions; Owner: supabase_functions_admin
--

ALTER TABLE ONLY supabase_functions.hooks ALTER COLUMN id SET DEFAULT nextval('supabase_functions.hooks_id_seq'::regclass);


--
-- Data for Name: extensions; Type: TABLE DATA; Schema: _realtime; Owner: supabase_admin
--

COPY _realtime.extensions (id, type, settings, tenant_external_id, inserted_at, updated_at) FROM stdin;
b7c1e7dc-5f44-491b-81ab-41773fd51574	postgres_cdc_rls	{"region": "us-east-1", "db_host": "QhixI0o7PYIABziLUL4f0A==", "db_name": "sWBpZNdjggEPTQVlI52Zfw==", "db_port": "+enMDFi1J/3IrrquHHwUmA==", "db_user": "uxbEq/zz8DXVD53TOI1zmw==", "slot_name": "supabase_realtime_replication_slot", "db_password": "eGxa2ZKVreSn7eWieRQdp74vN25K+qFgdnxmDCKe4p20+C0410WXonzXTEj9CgYx", "publication": "supabase_realtime", "ssl_enforced": false, "poll_interval_ms": 100, "poll_max_changes": 100, "poll_max_record_bytes": 1048576}	realtime-dev	2026-03-27 15:12:02	2026-03-27 15:12:02
\.


--
-- Data for Name: schema_migrations; Type: TABLE DATA; Schema: _realtime; Owner: supabase_admin
--

COPY _realtime.schema_migrations (version, inserted_at) FROM stdin;
20210706140551	2025-10-10 18:33:28
20220329161857	2025-10-10 18:33:29
20220410212326	2025-10-10 18:33:30
20220506102948	2025-10-10 18:33:31
20220527210857	2025-10-10 18:33:31
20220815211129	2025-10-10 18:33:32
20220815215024	2025-10-10 18:33:32
20220818141501	2025-10-10 18:33:32
20221018173709	2025-10-10 18:33:32
20221102172703	2025-10-10 18:33:33
20221223010058	2025-10-10 18:33:33
20230110180046	2025-10-10 18:33:33
20230810220907	2025-10-10 18:33:33
20230810220924	2025-10-10 18:33:33
20231024094642	2025-10-10 18:33:33
20240306114423	2025-10-10 18:33:34
20240418082835	2025-10-10 18:33:34
20240625211759	2025-10-10 18:33:34
20240704172020	2025-10-10 18:33:34
20240902173232	2025-10-10 18:33:34
20241106103258	2025-10-10 18:33:34
20250424203323	2025-10-10 18:33:34
20250613072131	2025-10-10 18:33:34
20250711044927	2025-10-10 18:33:34
20250811121559	2025-10-10 18:33:34
\.


--
-- Data for Name: tenants; Type: TABLE DATA; Schema: _realtime; Owner: supabase_admin
--

COPY _realtime.tenants (id, name, external_id, jwt_secret, max_concurrent_users, inserted_at, updated_at, max_events_per_second, postgres_cdc_default, max_bytes_per_second, max_channels_per_client, max_joins_per_second, suspend, jwt_jwks, notify_private_alpha, private_only, migrations_ran, broadcast_adapter, max_presence_events_per_second, max_payload_size_in_kb) FROM stdin;
29463e27-97b6-4067-b3f6-590aa229ff53	realtime-dev	realtime-dev	eGxa2ZKVreSn7eWieRQdp60i5H6KJLiST7splFU6MVHylMSAoQ2SjsTrTTQo/+bmYjQcO4hNnGTU+D1wtlXreA==	200	2026-03-27 15:12:02	2026-03-27 15:12:18	100	postgres_cdc_rls	100000	100	100	f	\N	f	f	64	gen_rpc	10000	3000
\.


--
-- Data for Name: audit_log_entries; Type: TABLE DATA; Schema: auth; Owner: supabase_auth_admin
--

COPY auth.audit_log_entries (instance_id, id, payload, created_at, ip_address) FROM stdin;
00000000-0000-0000-0000-000000000000	032c2fb4-712d-42cd-8fcd-2e942f358ab8	{"action":"user_signedup","actor_id":"00000000-0000-0000-0000-000000000000","actor_username":"service_role","actor_via_sso":false,"log_type":"team","traits":{"provider":"email","user_email":"ggb-13@ufmg.br","user_id":"2731efcc-b214-4da4-8cd2-75e5a25790be","user_phone":""}}	2025-10-15 18:11:29.495621+00	
00000000-0000-0000-0000-000000000000	82f58c14-7bed-4564-91a5-b63023d47a4b	{"action":"login","actor_id":"2731efcc-b214-4da4-8cd2-75e5a25790be","actor_username":"ggb-13@ufmg.br","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2025-10-15 18:16:56.685201+00	
00000000-0000-0000-0000-000000000000	e97b0219-d183-4fb3-a04b-4d93c330a503	{"action":"user_deleted","actor_id":"00000000-0000-0000-0000-000000000000","actor_username":"service_role","actor_via_sso":false,"log_type":"team","traits":{"user_email":"ggb-13@ufmg.br","user_id":"2731efcc-b214-4da4-8cd2-75e5a25790be","user_phone":""}}	2025-10-15 18:20:57.962742+00	
00000000-0000-0000-0000-000000000000	5b5fe8a0-48fb-4942-97aa-ddb772162343	{"action":"user_signedup","actor_id":"59852440-2efd-400c-8a61-f1f2937b1d0a","actor_username":"ggb-13@ufmg.br","actor_via_sso":false,"log_type":"team","traits":{"provider":"email"}}	2025-10-15 18:51:16.111435+00	
00000000-0000-0000-0000-000000000000	24beb3c8-4034-4f79-8f7b-1e8384a16c15	{"action":"login","actor_id":"59852440-2efd-400c-8a61-f1f2937b1d0a","actor_username":"ggb-13@ufmg.br","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2025-10-15 18:51:16.204037+00	
00000000-0000-0000-0000-000000000000	afc64db0-f0e4-4cc8-a306-4fe434cc1fe9	{"action":"login","actor_id":"59852440-2efd-400c-8a61-f1f2937b1d0a","actor_username":"ggb-13@ufmg.br","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2025-10-15 18:51:54.65896+00	
00000000-0000-0000-0000-000000000000	c83ebcf0-5540-4749-a6fc-60ebf75f5caa	{"action":"user_deleted","actor_id":"00000000-0000-0000-0000-000000000000","actor_username":"service_role","actor_via_sso":false,"log_type":"team","traits":{"user_email":"ggb-13@ufmg.br","user_id":"59852440-2efd-400c-8a61-f1f2937b1d0a","user_phone":""}}	2025-10-17 17:56:12.526266+00	
00000000-0000-0000-0000-000000000000	2303dfed-6851-4aea-8639-66bb240ddf63	{"action":"user_signedup","actor_id":"669799ca-69cf-492f-a72f-0b7853e8fc37","actor_username":"ggb-13@ufmg.br","actor_via_sso":false,"log_type":"team","traits":{"provider":"email"}}	2025-10-17 17:59:53.085919+00	
00000000-0000-0000-0000-000000000000	aab234c8-736f-4e0b-b194-cc80d08e96fd	{"action":"login","actor_id":"669799ca-69cf-492f-a72f-0b7853e8fc37","actor_username":"ggb-13@ufmg.br","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2025-10-17 17:59:53.099711+00	
00000000-0000-0000-0000-000000000000	120b067f-8599-4cc5-b7c1-79a82157ec75	{"action":"login","actor_id":"669799ca-69cf-492f-a72f-0b7853e8fc37","actor_username":"ggb-13@ufmg.br","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2025-10-17 18:09:59.237259+00	
00000000-0000-0000-0000-000000000000	ca01ce52-fc10-4473-b335-60650afe293b	{"action":"login","actor_id":"669799ca-69cf-492f-a72f-0b7853e8fc37","actor_username":"ggb-13@ufmg.br","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2025-10-17 18:10:55.707578+00	
00000000-0000-0000-0000-000000000000	ba237bdc-ccff-4053-a80d-cba2fbe4ce01	{"action":"login","actor_id":"669799ca-69cf-492f-a72f-0b7853e8fc37","actor_username":"ggb-13@ufmg.br","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2025-10-17 18:11:46.471054+00	
00000000-0000-0000-0000-000000000000	258d6c9e-48ef-4edf-b21b-a8527a8054ca	{"action":"logout","actor_id":"669799ca-69cf-492f-a72f-0b7853e8fc37","actor_username":"ggb-13@ufmg.br","actor_via_sso":false,"log_type":"account"}	2025-10-17 18:13:24.494619+00	
00000000-0000-0000-0000-000000000000	c56cdac1-d5ef-4694-a1db-66c1b562df9d	{"action":"login","actor_id":"669799ca-69cf-492f-a72f-0b7853e8fc37","actor_username":"ggb-13@ufmg.br","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2025-10-17 18:13:26.619415+00	
00000000-0000-0000-0000-000000000000	38eee508-8443-4450-b3da-7254b462e409	{"action":"logout","actor_id":"669799ca-69cf-492f-a72f-0b7853e8fc37","actor_username":"ggb-13@ufmg.br","actor_via_sso":false,"log_type":"account"}	2025-10-17 18:13:53.987747+00	
00000000-0000-0000-0000-000000000000	287aca49-0764-4e81-96d2-eaeb3f815157	{"action":"login","actor_id":"669799ca-69cf-492f-a72f-0b7853e8fc37","actor_username":"ggb-13@ufmg.br","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2025-10-17 18:46:46.759157+00	
00000000-0000-0000-0000-000000000000	986609ef-17ba-4b9c-97b6-611586ea3a47	{"action":"login","actor_id":"669799ca-69cf-492f-a72f-0b7853e8fc37","actor_username":"ggb-13@ufmg.br","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2025-10-22 17:06:10.444407+00	
00000000-0000-0000-0000-000000000000	b3e1097e-aa01-45e1-b449-47d4cbd248f0	{"action":"token_refreshed","actor_id":"669799ca-69cf-492f-a72f-0b7853e8fc37","actor_username":"ggb-13@ufmg.br","actor_via_sso":false,"log_type":"token"}	2025-10-22 18:04:24.551114+00	
00000000-0000-0000-0000-000000000000	19a1e4bb-4cb6-4e8b-ad5d-4328949e7ad9	{"action":"token_revoked","actor_id":"669799ca-69cf-492f-a72f-0b7853e8fc37","actor_username":"ggb-13@ufmg.br","actor_via_sso":false,"log_type":"token"}	2025-10-22 18:04:24.55217+00	
00000000-0000-0000-0000-000000000000	3a86a840-8a57-40e0-9804-f1ebd95f738c	{"action":"login","actor_id":"669799ca-69cf-492f-a72f-0b7853e8fc37","actor_username":"ggb-13@ufmg.br","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2025-10-24 18:09:19.05757+00	
00000000-0000-0000-0000-000000000000	485032b1-7f52-4ec2-9f44-49921763046b	{"action":"login","actor_id":"669799ca-69cf-492f-a72f-0b7853e8fc37","actor_username":"ggb-13@ufmg.br","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2025-10-24 18:10:59.347925+00	
00000000-0000-0000-0000-000000000000	2ca0740c-29bd-4c7e-a7d6-8a0225a0950b	{"action":"token_refreshed","actor_id":"669799ca-69cf-492f-a72f-0b7853e8fc37","actor_username":"ggb-13@ufmg.br","actor_via_sso":false,"log_type":"token"}	2025-10-24 19:09:02.933925+00	
00000000-0000-0000-0000-000000000000	c7e71589-e1df-4941-8a0f-1b1e43ad29ab	{"action":"token_revoked","actor_id":"669799ca-69cf-492f-a72f-0b7853e8fc37","actor_username":"ggb-13@ufmg.br","actor_via_sso":false,"log_type":"token"}	2025-10-24 19:09:02.935201+00	
00000000-0000-0000-0000-000000000000	8430a609-4c77-4ac0-bfc9-b63f8e887dc1	{"action":"login","actor_id":"669799ca-69cf-492f-a72f-0b7853e8fc37","actor_username":"ggb-13@ufmg.br","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2025-10-29 16:42:31.69976+00	
00000000-0000-0000-0000-000000000000	90964a6e-b296-4f39-b52e-6997c9f9be6d	{"action":"login","actor_id":"669799ca-69cf-492f-a72f-0b7853e8fc37","actor_username":"ggb-13@ufmg.br","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2025-10-29 17:02:10.321817+00	
00000000-0000-0000-0000-000000000000	0258b631-bfcf-4a7c-8efd-80e2f0e2de8b	{"action":"login","actor_id":"669799ca-69cf-492f-a72f-0b7853e8fc37","actor_username":"ggb-13@ufmg.br","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2025-10-29 17:14:42.093983+00	
00000000-0000-0000-0000-000000000000	52b8e3ab-6d7e-437d-b518-cfe9c3972480	{"action":"login","actor_id":"669799ca-69cf-492f-a72f-0b7853e8fc37","actor_username":"ggb-13@ufmg.br","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2025-10-29 17:22:31.47702+00	
00000000-0000-0000-0000-000000000000	b9ed382d-cc59-4c24-ba33-9a04d0e101d0	{"action":"logout","actor_id":"669799ca-69cf-492f-a72f-0b7853e8fc37","actor_username":"ggb-13@ufmg.br","actor_via_sso":false,"log_type":"account"}	2025-10-29 17:28:50.776039+00	
00000000-0000-0000-0000-000000000000	b46baf34-f411-4ee5-a7fc-ec43d6ea2d7c	{"action":"login","actor_id":"669799ca-69cf-492f-a72f-0b7853e8fc37","actor_username":"ggb-13@ufmg.br","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2025-10-29 17:28:52.910962+00	
00000000-0000-0000-0000-000000000000	99c7d3b6-ad11-43d5-9ccb-c8083c329516	{"action":"login","actor_id":"669799ca-69cf-492f-a72f-0b7853e8fc37","actor_username":"ggb-13@ufmg.br","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2025-10-29 17:33:01.847836+00	
00000000-0000-0000-0000-000000000000	dc25652d-a50d-403d-9542-6b8e47fe68f2	{"action":"login","actor_id":"669799ca-69cf-492f-a72f-0b7853e8fc37","actor_username":"ggb-13@ufmg.br","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2025-10-29 17:58:03.750333+00	
00000000-0000-0000-0000-000000000000	c0aca83d-2798-4519-949c-54294ed91c87	{"action":"login","actor_id":"669799ca-69cf-492f-a72f-0b7853e8fc37","actor_username":"ggb-13@ufmg.br","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2025-10-29 17:58:04.235507+00	
00000000-0000-0000-0000-000000000000	e973036e-5e1f-4e7b-b0b9-60218b87938a	{"action":"login","actor_id":"669799ca-69cf-492f-a72f-0b7853e8fc37","actor_username":"ggb-13@ufmg.br","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2025-10-29 18:24:03.814036+00	
00000000-0000-0000-0000-000000000000	41e9d8f2-d4b3-40f2-a58c-54d0b2bacffa	{"action":"login","actor_id":"669799ca-69cf-492f-a72f-0b7853e8fc37","actor_username":"ggb-13@ufmg.br","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2025-10-29 18:24:03.988482+00	
00000000-0000-0000-0000-000000000000	48da1daa-56c6-44e4-8bd2-be77f1324172	{"action":"login","actor_id":"669799ca-69cf-492f-a72f-0b7853e8fc37","actor_username":"ggb-13@ufmg.br","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2025-10-29 18:28:03.621143+00	
00000000-0000-0000-0000-000000000000	812b98c5-84b1-4dfc-bf2d-ac52ac7a3058	{"action":"login","actor_id":"669799ca-69cf-492f-a72f-0b7853e8fc37","actor_username":"ggb-13@ufmg.br","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2025-10-29 18:43:38.885205+00	
00000000-0000-0000-0000-000000000000	b78a6970-b4cf-4286-ab7d-45ad00401830	{"action":"login","actor_id":"669799ca-69cf-492f-a72f-0b7853e8fc37","actor_username":"ggb-13@ufmg.br","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2025-10-29 18:47:35.307826+00	
00000000-0000-0000-0000-000000000000	d4e3b0b4-966f-48c2-bca6-09c3da9fe50d	{"action":"login","actor_id":"669799ca-69cf-492f-a72f-0b7853e8fc37","actor_username":"ggb-13@ufmg.br","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2025-10-31 16:54:07.683348+00	
00000000-0000-0000-0000-000000000000	ae169b32-aedf-473c-af14-70a0eeec35a7	{"action":"login","actor_id":"669799ca-69cf-492f-a72f-0b7853e8fc37","actor_username":"ggb-13@ufmg.br","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2025-10-31 17:23:35.812044+00	
00000000-0000-0000-0000-000000000000	6ade528e-9873-4817-b066-13a9d0098ece	{"action":"login","actor_id":"669799ca-69cf-492f-a72f-0b7853e8fc37","actor_username":"ggb-13@ufmg.br","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2025-10-31 17:29:00.140854+00	
00000000-0000-0000-0000-000000000000	cf683d32-dd77-4ac6-9b58-618353e9eef9	{"action":"login","actor_id":"669799ca-69cf-492f-a72f-0b7853e8fc37","actor_username":"ggb-13@ufmg.br","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2025-10-31 17:31:38.791973+00	
00000000-0000-0000-0000-000000000000	82032e3a-59c9-40ae-8ce1-43788b3b9fa9	{"action":"login","actor_id":"669799ca-69cf-492f-a72f-0b7853e8fc37","actor_username":"ggb-13@ufmg.br","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2025-10-31 18:08:32.536454+00	
00000000-0000-0000-0000-000000000000	0d87fa58-5058-4769-a502-1dda00a31de2	{"action":"login","actor_id":"669799ca-69cf-492f-a72f-0b7853e8fc37","actor_username":"ggb-13@ufmg.br","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2025-10-31 18:55:53.066374+00	
00000000-0000-0000-0000-000000000000	71ec0923-0ca7-497d-ad8f-1f507d33c0ee	{"action":"login","actor_id":"669799ca-69cf-492f-a72f-0b7853e8fc37","actor_username":"ggb-13@ufmg.br","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2025-10-31 18:56:58.354149+00	
00000000-0000-0000-0000-000000000000	d31bd82e-3956-4955-a7b7-10e7c257e650	{"action":"login","actor_id":"669799ca-69cf-492f-a72f-0b7853e8fc37","actor_username":"ggb-13@ufmg.br","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2025-11-03 16:02:35.467529+00	
00000000-0000-0000-0000-000000000000	0e8eddc8-6699-49f7-98d2-450788c83afe	{"action":"login","actor_id":"669799ca-69cf-492f-a72f-0b7853e8fc37","actor_username":"ggb-13@ufmg.br","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2025-11-03 16:02:36.254954+00	
00000000-0000-0000-0000-000000000000	03a9f48f-15e9-477f-8b2c-f18fe4ce794f	{"action":"login","actor_id":"669799ca-69cf-492f-a72f-0b7853e8fc37","actor_username":"ggb-13@ufmg.br","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2025-11-05 16:56:12.191885+00	
00000000-0000-0000-0000-000000000000	6ad1487c-5a9c-4f97-a068-b721552d6ad7	{"action":"login","actor_id":"669799ca-69cf-492f-a72f-0b7853e8fc37","actor_username":"ggb-13@ufmg.br","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2025-11-05 17:08:25.542525+00	
00000000-0000-0000-0000-000000000000	d4d9fdc1-d684-422a-8587-7c432e327d36	{"action":"login","actor_id":"669799ca-69cf-492f-a72f-0b7853e8fc37","actor_username":"ggb-13@ufmg.br","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2025-11-05 17:12:59.044767+00	
00000000-0000-0000-0000-000000000000	8734275b-ec88-42a8-b0a1-63bd1f5aee0d	{"action":"login","actor_id":"669799ca-69cf-492f-a72f-0b7853e8fc37","actor_username":"ggb-13@ufmg.br","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2025-11-05 17:19:45.262733+00	
00000000-0000-0000-0000-000000000000	9b596b8d-d1fb-4126-8731-30cb6b7c3673	{"action":"login","actor_id":"669799ca-69cf-492f-a72f-0b7853e8fc37","actor_username":"ggb-13@ufmg.br","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2025-11-05 17:40:15.651102+00	
00000000-0000-0000-0000-000000000000	c8330b4a-fbd6-4729-b832-a90e23ddd096	{"action":"login","actor_id":"669799ca-69cf-492f-a72f-0b7853e8fc37","actor_username":"ggb-13@ufmg.br","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2025-11-05 18:00:44.703511+00	
00000000-0000-0000-0000-000000000000	43c84cf5-9ed7-4c34-8c40-5acf5833d9dd	{"action":"login","actor_id":"669799ca-69cf-492f-a72f-0b7853e8fc37","actor_username":"ggb-13@ufmg.br","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2025-11-05 18:16:16.756635+00	
00000000-0000-0000-0000-000000000000	507d96ec-547a-48f1-92ed-e18dab9c6840	{"action":"token_refreshed","actor_id":"669799ca-69cf-492f-a72f-0b7853e8fc37","actor_username":"ggb-13@ufmg.br","actor_via_sso":false,"log_type":"token"}	2025-11-05 18:25:23.436533+00	
00000000-0000-0000-0000-000000000000	3fd93f9a-99e3-4d61-981f-fcf4d5f42585	{"action":"token_revoked","actor_id":"669799ca-69cf-492f-a72f-0b7853e8fc37","actor_username":"ggb-13@ufmg.br","actor_via_sso":false,"log_type":"token"}	2025-11-05 18:25:23.437542+00	
00000000-0000-0000-0000-000000000000	3450e064-5104-4cc3-83db-9cc3b1f5023b	{"action":"login","actor_id":"669799ca-69cf-492f-a72f-0b7853e8fc37","actor_username":"ggb-13@ufmg.br","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2025-11-05 18:27:20.809299+00	
00000000-0000-0000-0000-000000000000	3b2d1fcb-01ca-4b00-aed3-7abcc4ab2890	{"action":"login","actor_id":"669799ca-69cf-492f-a72f-0b7853e8fc37","actor_username":"ggb-13@ufmg.br","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2025-11-05 19:03:13.55189+00	
00000000-0000-0000-0000-000000000000	acb18d97-ea87-44bc-9c34-628309b7a6d3	{"action":"login","actor_id":"669799ca-69cf-492f-a72f-0b7853e8fc37","actor_username":"ggb-13@ufmg.br","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2025-11-12 16:48:06.470299+00	
00000000-0000-0000-0000-000000000000	da05116f-561d-4d96-aafa-13fa1c21e4fb	{"action":"login","actor_id":"669799ca-69cf-492f-a72f-0b7853e8fc37","actor_username":"ggb-13@ufmg.br","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2025-11-12 17:02:10.79436+00	
00000000-0000-0000-0000-000000000000	ffced188-1fd1-412c-9329-e2302d631802	{"action":"logout","actor_id":"669799ca-69cf-492f-a72f-0b7853e8fc37","actor_username":"ggb-13@ufmg.br","actor_via_sso":false,"log_type":"account"}	2025-11-12 17:02:37.565576+00	
00000000-0000-0000-0000-000000000000	0e541df0-f0ec-4c47-9b84-00cad6ebe4ea	{"action":"login","actor_id":"669799ca-69cf-492f-a72f-0b7853e8fc37","actor_username":"ggb-13@ufmg.br","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2025-11-12 17:03:16.295816+00	
00000000-0000-0000-0000-000000000000	e352b8ca-e6dc-46d2-98fd-66b366f0f5e1	{"action":"logout","actor_id":"669799ca-69cf-492f-a72f-0b7853e8fc37","actor_username":"ggb-13@ufmg.br","actor_via_sso":false,"log_type":"account"}	2025-11-12 17:03:19.181744+00	
00000000-0000-0000-0000-000000000000	f3a5ee46-ed3b-4759-825b-9573a9768a47	{"action":"user_deleted","actor_id":"00000000-0000-0000-0000-000000000000","actor_username":"service_role","actor_via_sso":false,"log_type":"team","traits":{"user_email":"ggb-13@ufmg.br","user_id":"669799ca-69cf-492f-a72f-0b7853e8fc37","user_phone":""}}	2025-11-12 17:12:28.912238+00	
00000000-0000-0000-0000-000000000000	61d15d52-32ff-4f84-a007-fa01356c2556	{"action":"user_signedup","actor_id":"22ec4f28-e2cf-486e-b34f-54bdf4e8579d","actor_username":"ggb-13@ufmg.br","actor_via_sso":false,"log_type":"team","traits":{"provider":"email"}}	2025-11-12 17:12:41.850401+00	
00000000-0000-0000-0000-000000000000	7ccb6ec0-5704-4259-b37a-cf01220ccaf4	{"action":"login","actor_id":"22ec4f28-e2cf-486e-b34f-54bdf4e8579d","actor_username":"ggb-13@ufmg.br","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2025-11-12 17:12:41.87958+00	
00000000-0000-0000-0000-000000000000	ca46fb58-0aea-4f31-aba0-f4543b5003cb	{"action":"login","actor_id":"22ec4f28-e2cf-486e-b34f-54bdf4e8579d","actor_username":"ggb-13@ufmg.br","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2025-11-12 17:12:57.390865+00	
00000000-0000-0000-0000-000000000000	2ae2e3e0-4b84-4126-859a-15665c6ed736	{"action":"logout","actor_id":"22ec4f28-e2cf-486e-b34f-54bdf4e8579d","actor_username":"ggb-13@ufmg.br","actor_via_sso":false,"log_type":"account"}	2025-11-12 17:13:02.085139+00	
00000000-0000-0000-0000-000000000000	bd7ae4ee-324a-402c-8866-2fde83b98ec4	{"action":"login","actor_id":"22ec4f28-e2cf-486e-b34f-54bdf4e8579d","actor_username":"ggb-13@ufmg.br","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2025-11-12 17:21:16.982326+00	
00000000-0000-0000-0000-000000000000	14edf31b-c2a0-43c9-9947-d9bba1769926	{"action":"login","actor_id":"22ec4f28-e2cf-486e-b34f-54bdf4e8579d","actor_username":"ggb-13@ufmg.br","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2025-11-12 17:21:41.090493+00	
00000000-0000-0000-0000-000000000000	c47f4f40-d384-45c3-ba1c-9d509cfbce50	{"action":"login","actor_id":"22ec4f28-e2cf-486e-b34f-54bdf4e8579d","actor_username":"ggb-13@ufmg.br","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2025-11-12 17:38:04.826719+00	
00000000-0000-0000-0000-000000000000	b39230fd-9561-4c06-9bd8-379b57268e8e	{"action":"logout","actor_id":"22ec4f28-e2cf-486e-b34f-54bdf4e8579d","actor_username":"ggb-13@ufmg.br","actor_via_sso":false,"log_type":"account"}	2025-11-12 17:38:08.845271+00	
00000000-0000-0000-0000-000000000000	b36926f4-d886-4c3d-bb38-64deb7f96e9e	{"action":"login","actor_id":"22ec4f28-e2cf-486e-b34f-54bdf4e8579d","actor_username":"ggb-13@ufmg.br","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2025-11-12 17:47:33.664508+00	
00000000-0000-0000-0000-000000000000	828cc7b9-3455-4c5b-ab2f-dc7f77db5519	{"action":"logout","actor_id":"22ec4f28-e2cf-486e-b34f-54bdf4e8579d","actor_username":"ggb-13@ufmg.br","actor_via_sso":false,"log_type":"account"}	2025-11-12 17:47:37.406347+00	
00000000-0000-0000-0000-000000000000	e84e530e-ac24-43cf-b36e-5e9c3fbf20e3	{"action":"login","actor_id":"22ec4f28-e2cf-486e-b34f-54bdf4e8579d","actor_username":"ggb-13@ufmg.br","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2025-11-12 19:19:06.151033+00	
00000000-0000-0000-0000-000000000000	5a8f5d35-60b4-4026-9bb8-c0c6ab217d20	{"action":"login","actor_id":"22ec4f28-e2cf-486e-b34f-54bdf4e8579d","actor_username":"ggb-13@ufmg.br","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2025-11-12 19:36:01.690535+00	
00000000-0000-0000-0000-000000000000	144080f4-ec07-4d9a-98f4-8a0a9f758b3e	{"action":"logout","actor_id":"22ec4f28-e2cf-486e-b34f-54bdf4e8579d","actor_username":"ggb-13@ufmg.br","actor_via_sso":false,"log_type":"account"}	2025-11-12 19:36:17.919967+00	
00000000-0000-0000-0000-000000000000	4898b339-7d2d-4a24-b08e-0feb5276fd76	{"action":"login","actor_id":"22ec4f28-e2cf-486e-b34f-54bdf4e8579d","actor_username":"ggb-13@ufmg.br","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2025-11-12 19:41:05.519896+00	
00000000-0000-0000-0000-000000000000	6f5aa025-7cb2-4004-9cf6-ccaf79a5b3db	{"action":"logout","actor_id":"22ec4f28-e2cf-486e-b34f-54bdf4e8579d","actor_username":"ggb-13@ufmg.br","actor_via_sso":false,"log_type":"account"}	2025-11-12 19:41:09.850452+00	
00000000-0000-0000-0000-000000000000	0d1ca2aa-bbed-44be-828c-4ccf21563bbc	{"action":"login","actor_id":"22ec4f28-e2cf-486e-b34f-54bdf4e8579d","actor_username":"ggb-13@ufmg.br","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2025-11-12 19:44:52.720312+00	
00000000-0000-0000-0000-000000000000	a948efed-d386-45e7-b7ac-57d390eb6f2c	{"action":"logout","actor_id":"22ec4f28-e2cf-486e-b34f-54bdf4e8579d","actor_username":"ggb-13@ufmg.br","actor_via_sso":false,"log_type":"account"}	2025-11-12 19:44:58.296985+00	
00000000-0000-0000-0000-000000000000	233c3e19-9bda-43fc-a610-a7db4a7850db	{"action":"login","actor_id":"22ec4f28-e2cf-486e-b34f-54bdf4e8579d","actor_username":"ggb-13@ufmg.br","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2025-11-12 20:06:26.5215+00	
00000000-0000-0000-0000-000000000000	c5046393-f3c2-4185-b0a9-e6cba57fa3c9	{"action":"token_refreshed","actor_id":"22ec4f28-e2cf-486e-b34f-54bdf4e8579d","actor_username":"ggb-13@ufmg.br","actor_via_sso":false,"log_type":"token"}	2025-11-12 23:42:09.558275+00	
00000000-0000-0000-0000-000000000000	e3eb38ee-d055-4655-9d72-1297bcf28b71	{"action":"token_revoked","actor_id":"22ec4f28-e2cf-486e-b34f-54bdf4e8579d","actor_username":"ggb-13@ufmg.br","actor_via_sso":false,"log_type":"token"}	2025-11-12 23:42:09.559314+00	
00000000-0000-0000-0000-000000000000	73179669-cb18-4b51-a2bf-fb9e488ba047	{"action":"login","actor_id":"22ec4f28-e2cf-486e-b34f-54bdf4e8579d","actor_username":"ggb-13@ufmg.br","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2025-11-12 23:42:14.228449+00	
00000000-0000-0000-0000-000000000000	b5e855f8-13c9-4c1b-bdda-67cb82b06c7d	{"action":"login","actor_id":"22ec4f28-e2cf-486e-b34f-54bdf4e8579d","actor_username":"ggb-13@ufmg.br","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2025-11-25 10:41:39.215309+00	
00000000-0000-0000-0000-000000000000	b17806dc-d946-436d-9d9f-189575db36f1	{"action":"logout","actor_id":"22ec4f28-e2cf-486e-b34f-54bdf4e8579d","actor_username":"ggb-13@ufmg.br","actor_via_sso":false,"log_type":"account"}	2025-11-25 10:41:41.527727+00	
00000000-0000-0000-0000-000000000000	24bb0b81-8b10-4509-bae8-776ba90e0284	{"action":"login","actor_id":"22ec4f28-e2cf-486e-b34f-54bdf4e8579d","actor_username":"ggb-13@ufmg.br","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2025-11-25 10:42:02.345688+00	
00000000-0000-0000-0000-000000000000	cd358f13-bacc-43d3-94ab-ce187134ddbb	{"action":"login","actor_id":"22ec4f28-e2cf-486e-b34f-54bdf4e8579d","actor_username":"ggb-13@ufmg.br","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2025-11-25 10:44:49.561882+00	
00000000-0000-0000-0000-000000000000	028bb4ad-d226-4c05-939c-d492c73189e8	{"action":"logout","actor_id":"22ec4f28-e2cf-486e-b34f-54bdf4e8579d","actor_username":"ggb-13@ufmg.br","actor_via_sso":false,"log_type":"account"}	2025-11-25 10:46:48.115853+00	
00000000-0000-0000-0000-000000000000	d41f94a5-53e7-4cf2-8452-2c39f9cf8ef6	{"action":"login","actor_id":"22ec4f28-e2cf-486e-b34f-54bdf4e8579d","actor_username":"ggb-13@ufmg.br","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2025-11-25 10:47:06.600021+00	
00000000-0000-0000-0000-000000000000	3abf4478-6824-4665-8b9b-f22c9de79c14	{"action":"login","actor_id":"22ec4f28-e2cf-486e-b34f-54bdf4e8579d","actor_username":"ggb-13@ufmg.br","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2025-12-04 14:39:00.389754+00	
00000000-0000-0000-0000-000000000000	7050ab98-44c4-40f2-8ca3-8877e777edea	{"action":"login","actor_id":"22ec4f28-e2cf-486e-b34f-54bdf4e8579d","actor_username":"ggb-13@ufmg.br","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2025-12-04 14:47:17.075306+00	
00000000-0000-0000-0000-000000000000	e5db62d1-e54b-449b-a1c1-e8a15095131e	{"action":"logout","actor_id":"22ec4f28-e2cf-486e-b34f-54bdf4e8579d","actor_username":"ggb-13@ufmg.br","actor_via_sso":false,"log_type":"account"}	2025-12-04 14:47:21.342328+00	
00000000-0000-0000-0000-000000000000	f6d5a11c-4af4-4359-b9b4-dd69b7d1fa4d	{"action":"user_deleted","actor_id":"00000000-0000-0000-0000-000000000000","actor_username":"service_role","actor_via_sso":false,"log_type":"team","traits":{"user_email":"ggb-13@ufmg.br","user_id":"22ec4f28-e2cf-486e-b34f-54bdf4e8579d","user_phone":""}}	2025-12-04 15:07:04.527102+00	
00000000-0000-0000-0000-000000000000	d914d124-b204-48a8-b919-d143289427a0	{"action":"user_signedup","actor_id":"c19fa43e-6abc-45b2-8e45-6d3075649666","actor_username":"ggb-13@ufmg.br","actor_via_sso":false,"log_type":"team","traits":{"provider":"email"}}	2025-12-04 15:08:29.746323+00	
00000000-0000-0000-0000-000000000000	3f276d89-acde-4163-8e10-568a1908aa86	{"action":"login","actor_id":"c19fa43e-6abc-45b2-8e45-6d3075649666","actor_username":"ggb-13@ufmg.br","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2025-12-04 15:08:29.759439+00	
00000000-0000-0000-0000-000000000000	c192c891-d526-45a2-ac0b-95641ee57e68	{"action":"login","actor_id":"c19fa43e-6abc-45b2-8e45-6d3075649666","actor_username":"ggb-13@ufmg.br","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2025-12-04 15:08:40.892104+00	
00000000-0000-0000-0000-000000000000	110aae52-1ae6-4ec8-89e1-944415088fd2	{"action":"logout","actor_id":"c19fa43e-6abc-45b2-8e45-6d3075649666","actor_username":"ggb-13@ufmg.br","actor_via_sso":false,"log_type":"account"}	2025-12-04 15:23:57.819422+00	
00000000-0000-0000-0000-000000000000	8f7b25e0-7cdd-468a-ad0b-8bbc209e0712	{"action":"login","actor_id":"c19fa43e-6abc-45b2-8e45-6d3075649666","actor_username":"ggb-13@ufmg.br","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2025-12-04 15:24:12.951897+00	
00000000-0000-0000-0000-000000000000	599405a0-fd81-42c6-9d81-0c796d456c00	{"action":"login","actor_id":"c19fa43e-6abc-45b2-8e45-6d3075649666","actor_username":"ggb-13@ufmg.br","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2025-12-04 15:56:50.231641+00	
00000000-0000-0000-0000-000000000000	a11357f0-75b7-44e2-9587-32fb81f75868	{"action":"login","actor_id":"c19fa43e-6abc-45b2-8e45-6d3075649666","actor_username":"ggb-13@ufmg.br","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2025-12-04 17:36:59.269078+00	
00000000-0000-0000-0000-000000000000	7947b90b-99ca-49b3-8fc3-93b582e0b4d9	{"action":"login","actor_id":"c19fa43e-6abc-45b2-8e45-6d3075649666","actor_username":"ggb-13@ufmg.br","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2025-12-04 17:39:49.820793+00	
00000000-0000-0000-0000-000000000000	2727d33a-1fda-473c-a8cc-a34ce2eeabdd	{"action":"login","actor_id":"c19fa43e-6abc-45b2-8e45-6d3075649666","actor_username":"ggb-13@ufmg.br","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2025-12-04 17:44:11.568904+00	
00000000-0000-0000-0000-000000000000	a8898c2c-84ab-4f26-b33e-cf2a9f82a164	{"action":"login","actor_id":"c19fa43e-6abc-45b2-8e45-6d3075649666","actor_username":"ggb-13@ufmg.br","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2025-12-04 17:44:41.201401+00	
00000000-0000-0000-0000-000000000000	012f2430-c1a0-428b-8f27-f826ada66922	{"action":"login","actor_id":"c19fa43e-6abc-45b2-8e45-6d3075649666","actor_username":"ggb-13@ufmg.br","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2025-12-04 17:45:38.705319+00	
00000000-0000-0000-0000-000000000000	0aee01f3-bb68-402d-a9f1-ff953cfdf25a	{"action":"login","actor_id":"c19fa43e-6abc-45b2-8e45-6d3075649666","actor_username":"ggb-13@ufmg.br","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2025-12-04 18:22:12.125689+00	
00000000-0000-0000-0000-000000000000	1426561c-c222-4d77-9ee9-99caddaf1fe2	{"action":"logout","actor_id":"c19fa43e-6abc-45b2-8e45-6d3075649666","actor_username":"ggb-13@ufmg.br","actor_via_sso":false,"log_type":"account"}	2025-12-04 18:23:51.723863+00	
00000000-0000-0000-0000-000000000000	d6b08718-9439-4d78-a955-d42b59a3f84a	{"action":"login","actor_id":"c19fa43e-6abc-45b2-8e45-6d3075649666","actor_username":"ggb-13@ufmg.br","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2025-12-04 18:24:17.233614+00	
00000000-0000-0000-0000-000000000000	f80398e5-56d1-4e85-9af4-93275683381c	{"action":"login","actor_id":"c19fa43e-6abc-45b2-8e45-6d3075649666","actor_username":"ggb-13@ufmg.br","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2025-12-04 18:59:37.259198+00	
00000000-0000-0000-0000-000000000000	fef8656a-f7f0-4728-b0b2-8f9e7e5b29fe	{"action":"login","actor_id":"c19fa43e-6abc-45b2-8e45-6d3075649666","actor_username":"ggb-13@ufmg.br","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2025-12-04 19:01:40.541365+00	
00000000-0000-0000-0000-000000000000	5d41e887-d785-4b32-bf3f-b0265601c0e3	{"action":"login","actor_id":"c19fa43e-6abc-45b2-8e45-6d3075649666","actor_username":"ggb-13@ufmg.br","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2025-12-04 19:10:11.69851+00	
00000000-0000-0000-0000-000000000000	a94441f6-3432-4de4-a56d-0e68490e9cd0	{"action":"user_modified","actor_id":"c19fa43e-6abc-45b2-8e45-6d3075649666","actor_username":"ggb-13@ufmg.br","actor_via_sso":false,"log_type":"user"}	2025-12-04 19:14:17.5666+00	
00000000-0000-0000-0000-000000000000	1dd11cb2-9e50-49bb-94c5-e855f9218980	{"action":"login","actor_id":"c19fa43e-6abc-45b2-8e45-6d3075649666","actor_username":"ggb-13@ufmg.br","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2025-12-04 19:57:37.05329+00	
00000000-0000-0000-0000-000000000000	88f10e86-5f67-4142-a70c-9361cb4a8987	{"action":"login","actor_id":"c19fa43e-6abc-45b2-8e45-6d3075649666","actor_username":"ggb-13@ufmg.br","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2025-12-04 20:07:34.514577+00	
00000000-0000-0000-0000-000000000000	034dc5b9-d3a2-41d7-8be7-a6eebbdee3f4	{"action":"logout","actor_id":"c19fa43e-6abc-45b2-8e45-6d3075649666","actor_username":"ggb-13@ufmg.br","actor_via_sso":false,"log_type":"account"}	2025-12-04 20:10:29.666307+00	
00000000-0000-0000-0000-000000000000	7772edcb-e770-4ba7-9780-9aada83982c1	{"action":"login","actor_id":"c19fa43e-6abc-45b2-8e45-6d3075649666","actor_username":"ggb-13@ufmg.br","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2025-12-04 20:23:00.189892+00	
00000000-0000-0000-0000-000000000000	48df13cf-bb6b-4bba-8245-cc666b288c88	{"action":"login","actor_id":"c19fa43e-6abc-45b2-8e45-6d3075649666","actor_username":"ggb-13@ufmg.br","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2025-12-04 22:27:38.747007+00	
00000000-0000-0000-0000-000000000000	fa1a3bdc-5419-4417-9846-6d90fb5a3a04	{"action":"login","actor_id":"c19fa43e-6abc-45b2-8e45-6d3075649666","actor_username":"ggb-13@ufmg.br","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2025-12-04 22:27:59.819606+00	
00000000-0000-0000-0000-000000000000	2fe9cf50-9b77-46d0-a578-159f4e0f1470	{"action":"token_refreshed","actor_id":"c19fa43e-6abc-45b2-8e45-6d3075649666","actor_username":"ggb-13@ufmg.br","actor_via_sso":false,"log_type":"token"}	2025-12-04 22:28:59.469044+00	
00000000-0000-0000-0000-000000000000	5ccc5dbb-844a-4b23-b458-7bb1fd50af88	{"action":"token_revoked","actor_id":"c19fa43e-6abc-45b2-8e45-6d3075649666","actor_username":"ggb-13@ufmg.br","actor_via_sso":false,"log_type":"token"}	2025-12-04 22:28:59.469574+00	
00000000-0000-0000-0000-000000000000	faaca4e5-16b8-432b-8364-e8870fcec697	{"action":"login","actor_id":"c19fa43e-6abc-45b2-8e45-6d3075649666","actor_username":"ggb-13@ufmg.br","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2025-12-04 22:31:00.674294+00	
00000000-0000-0000-0000-000000000000	1bbd8c46-c846-46b7-8303-9657dd57707d	{"action":"login","actor_id":"c19fa43e-6abc-45b2-8e45-6d3075649666","actor_username":"ggb-13@ufmg.br","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2025-12-04 22:55:20.906731+00	
00000000-0000-0000-0000-000000000000	57d81aed-0ac6-4e53-9229-ab8dabe1f9ac	{"action":"login","actor_id":"c19fa43e-6abc-45b2-8e45-6d3075649666","actor_username":"ggb-13@ufmg.br","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2025-12-04 22:56:50.655681+00	
00000000-0000-0000-0000-000000000000	d8de1d6f-d477-4408-93ef-4c3f22e601ce	{"action":"login","actor_id":"c19fa43e-6abc-45b2-8e45-6d3075649666","actor_username":"ggb-13@ufmg.br","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2025-12-18 13:02:46.99566+00	
00000000-0000-0000-0000-000000000000	f0139a11-4a7a-46cf-9249-9aa7c023c09a	{"action":"logout","actor_id":"c19fa43e-6abc-45b2-8e45-6d3075649666","actor_username":"ggb-13@ufmg.br","actor_via_sso":false,"log_type":"account"}	2025-12-18 13:56:26.104927+00	
00000000-0000-0000-0000-000000000000	feaa0046-b09f-460f-be3a-62e81e528683	{"action":"login","actor_id":"c19fa43e-6abc-45b2-8e45-6d3075649666","actor_username":"ggb-13@ufmg.br","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2025-12-18 13:56:35.455967+00	
00000000-0000-0000-0000-000000000000	bb02f39a-5d53-4e98-8e47-fe9b32368e6e	{"action":"login","actor_id":"c19fa43e-6abc-45b2-8e45-6d3075649666","actor_username":"ggb-13@ufmg.br","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2025-12-18 14:34:19.630944+00	
00000000-0000-0000-0000-000000000000	e6a701e2-eb13-4868-aa95-1fc87334fdff	{"action":"token_refreshed","actor_id":"c19fa43e-6abc-45b2-8e45-6d3075649666","actor_username":"ggb-13@ufmg.br","actor_via_sso":false,"log_type":"token"}	2025-12-18 17:20:01.462365+00	
00000000-0000-0000-0000-000000000000	3a29bef6-1919-40ff-8521-63c6b5b52559	{"action":"token_revoked","actor_id":"c19fa43e-6abc-45b2-8e45-6d3075649666","actor_username":"ggb-13@ufmg.br","actor_via_sso":false,"log_type":"token"}	2025-12-18 17:20:01.463647+00	
00000000-0000-0000-0000-000000000000	3a28102f-ea55-49a1-99ab-280b7bb0bd55	{"action":"login","actor_id":"c19fa43e-6abc-45b2-8e45-6d3075649666","actor_username":"ggb-13@ufmg.br","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2025-12-18 18:22:57.981699+00	
00000000-0000-0000-0000-000000000000	22a1770e-5661-4526-ba11-2d6a8089efb3	{"action":"login","actor_id":"c19fa43e-6abc-45b2-8e45-6d3075649666","actor_username":"ggb-13@ufmg.br","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2025-12-18 18:43:03.409739+00	
00000000-0000-0000-0000-000000000000	2022c400-ad6e-421e-8a9a-1e7bbbc17157	{"action":"login","actor_id":"c19fa43e-6abc-45b2-8e45-6d3075649666","actor_username":"ggb-13@ufmg.br","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2025-12-18 19:18:58.688548+00	
00000000-0000-0000-0000-000000000000	abb86b09-cd53-4e12-8e25-5b4d154cf020	{"action":"login","actor_id":"c19fa43e-6abc-45b2-8e45-6d3075649666","actor_username":"ggb-13@ufmg.br","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2025-12-18 19:50:02.025784+00	
00000000-0000-0000-0000-000000000000	3cdf278d-5b9a-47a1-bea2-2d9a8f0e2604	{"action":"token_refreshed","actor_id":"c19fa43e-6abc-45b2-8e45-6d3075649666","actor_username":"ggb-13@ufmg.br","actor_via_sso":false,"log_type":"token"}	2026-01-08 14:35:35.293486+00	
00000000-0000-0000-0000-000000000000	8f18f655-52a4-495a-b58d-8c8ff66470cf	{"action":"token_revoked","actor_id":"c19fa43e-6abc-45b2-8e45-6d3075649666","actor_username":"ggb-13@ufmg.br","actor_via_sso":false,"log_type":"token"}	2026-01-08 14:35:35.380252+00	
00000000-0000-0000-0000-000000000000	7a88cdc9-7a45-45e0-b9f6-1518c51238b4	{"action":"login","actor_id":"c19fa43e-6abc-45b2-8e45-6d3075649666","actor_username":"ggb-13@ufmg.br","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2026-01-08 14:39:17.793564+00	
00000000-0000-0000-0000-000000000000	0d7b642e-0324-4736-aeff-23ddb247c5f6	{"action":"token_refreshed","actor_id":"c19fa43e-6abc-45b2-8e45-6d3075649666","actor_username":"ggb-13@ufmg.br","actor_via_sso":false,"log_type":"token"}	2026-01-08 16:02:03.717227+00	
00000000-0000-0000-0000-000000000000	8efeac9c-2e4a-4722-ba12-3ca3df1c3dae	{"action":"token_revoked","actor_id":"c19fa43e-6abc-45b2-8e45-6d3075649666","actor_username":"ggb-13@ufmg.br","actor_via_sso":false,"log_type":"token"}	2026-01-08 16:02:03.718548+00	
00000000-0000-0000-0000-000000000000	65399fe1-25b1-429e-b8d3-26b88cace3ab	{"action":"login","actor_id":"c19fa43e-6abc-45b2-8e45-6d3075649666","actor_username":"ggb-13@ufmg.br","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2026-01-08 16:06:38.228214+00	
00000000-0000-0000-0000-000000000000	6bc9bd6f-18dd-4051-baf5-010c7220ac7e	{"action":"login","actor_id":"c19fa43e-6abc-45b2-8e45-6d3075649666","actor_username":"ggb-13@ufmg.br","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2026-01-08 16:41:29.152432+00	
00000000-0000-0000-0000-000000000000	92b47e90-01e1-43e7-9104-3cf00c30db95	{"action":"login","actor_id":"c19fa43e-6abc-45b2-8e45-6d3075649666","actor_username":"ggb-13@ufmg.br","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2026-01-08 16:57:13.862864+00	
00000000-0000-0000-0000-000000000000	03bbd703-1a6f-4e63-81b5-3ec04a5d2e87	{"action":"login","actor_id":"c19fa43e-6abc-45b2-8e45-6d3075649666","actor_username":"ggb-13@ufmg.br","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2026-01-08 17:01:32.262725+00	
00000000-0000-0000-0000-000000000000	99377c12-dfdd-42db-b3ef-a2dcc2a008dc	{"action":"login","actor_id":"c19fa43e-6abc-45b2-8e45-6d3075649666","actor_username":"ggb-13@ufmg.br","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2026-01-08 17:25:47.453448+00	
00000000-0000-0000-0000-000000000000	33889c6c-6128-47dd-8147-30bac69531da	{"action":"token_refreshed","actor_id":"c19fa43e-6abc-45b2-8e45-6d3075649666","actor_username":"ggb-13@ufmg.br","actor_via_sso":false,"log_type":"token"}	2026-01-08 18:24:13.131179+00	
00000000-0000-0000-0000-000000000000	4e5941ae-488b-408b-8b2e-d1899f314304	{"action":"token_revoked","actor_id":"c19fa43e-6abc-45b2-8e45-6d3075649666","actor_username":"ggb-13@ufmg.br","actor_via_sso":false,"log_type":"token"}	2026-01-08 18:24:13.133191+00	
00000000-0000-0000-0000-000000000000	a04aeaab-be3b-4353-a2ad-abd2b36f0261	{"action":"login","actor_id":"c19fa43e-6abc-45b2-8e45-6d3075649666","actor_username":"ggb-13@ufmg.br","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2026-01-08 18:41:14.353979+00	
00000000-0000-0000-0000-000000000000	37826f3f-cfb4-4eeb-8bbd-49b3ea48ab43	{"action":"login","actor_id":"c19fa43e-6abc-45b2-8e45-6d3075649666","actor_username":"ggb-13@ufmg.br","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2026-01-08 18:43:17.326579+00	
00000000-0000-0000-0000-000000000000	b1598f30-21f0-403e-b776-394e2a4843a4	{"action":"login","actor_id":"c19fa43e-6abc-45b2-8e45-6d3075649666","actor_username":"ggb-13@ufmg.br","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2026-01-08 19:16:36.361861+00	
00000000-0000-0000-0000-000000000000	c9cace95-1bdd-495d-95a0-089902978faa	{"action":"token_refreshed","actor_id":"c19fa43e-6abc-45b2-8e45-6d3075649666","actor_username":"ggb-13@ufmg.br","actor_via_sso":false,"log_type":"token"}	2026-01-12 12:11:54.065771+00	
00000000-0000-0000-0000-000000000000	e105b1b0-e96d-4691-849b-865d9c19c19d	{"action":"token_revoked","actor_id":"c19fa43e-6abc-45b2-8e45-6d3075649666","actor_username":"ggb-13@ufmg.br","actor_via_sso":false,"log_type":"token"}	2026-01-12 12:11:54.067608+00	
00000000-0000-0000-0000-000000000000	2bbf73f7-ffb0-46ef-b5bd-31e079f90029	{"action":"login","actor_id":"c19fa43e-6abc-45b2-8e45-6d3075649666","actor_username":"ggb-13@ufmg.br","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2026-01-12 12:15:43.343905+00	
00000000-0000-0000-0000-000000000000	a7a02b11-8c10-45ec-88aa-d9547a039c2b	{"action":"login","actor_id":"c19fa43e-6abc-45b2-8e45-6d3075649666","actor_username":"ggb-13@ufmg.br","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2026-01-12 12:22:57.638826+00	
00000000-0000-0000-0000-000000000000	e87619c6-1278-41f1-9e94-926466e29055	{"action":"login","actor_id":"c19fa43e-6abc-45b2-8e45-6d3075649666","actor_username":"ggb-13@ufmg.br","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2026-01-12 12:33:28.91499+00	
00000000-0000-0000-0000-000000000000	e7393774-968c-4840-8c51-3d65e084bae5	{"action":"login","actor_id":"c19fa43e-6abc-45b2-8e45-6d3075649666","actor_username":"ggb-13@ufmg.br","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2026-01-12 12:34:57.592454+00	
00000000-0000-0000-0000-000000000000	b32309ca-d4ae-4075-99d3-39b33de9a8a7	{"action":"login","actor_id":"c19fa43e-6abc-45b2-8e45-6d3075649666","actor_username":"ggb-13@ufmg.br","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2026-01-12 12:37:10.49447+00	
00000000-0000-0000-0000-000000000000	623b78e6-b9c0-414c-abbc-38ecfc2fad84	{"action":"login","actor_id":"c19fa43e-6abc-45b2-8e45-6d3075649666","actor_username":"ggb-13@ufmg.br","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2026-01-12 12:38:06.791881+00	
00000000-0000-0000-0000-000000000000	08fd7be8-9227-4961-b430-ebdb8837401c	{"action":"login","actor_id":"c19fa43e-6abc-45b2-8e45-6d3075649666","actor_username":"ggb-13@ufmg.br","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2026-01-12 12:40:07.503786+00	
00000000-0000-0000-0000-000000000000	3af815dc-c22e-4ac7-b8db-7435757c6190	{"action":"login","actor_id":"c19fa43e-6abc-45b2-8e45-6d3075649666","actor_username":"ggb-13@ufmg.br","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2026-01-12 12:46:17.707788+00	
00000000-0000-0000-0000-000000000000	c0b19146-9b2e-4183-9dbe-d338ec101c1c	{"action":"token_refreshed","actor_id":"c19fa43e-6abc-45b2-8e45-6d3075649666","actor_username":"ggb-13@ufmg.br","actor_via_sso":false,"log_type":"token"}	2026-01-12 13:44:23.303048+00	
00000000-0000-0000-0000-000000000000	c2fa7612-e81e-4c0c-876c-e6421c3c1b34	{"action":"token_revoked","actor_id":"c19fa43e-6abc-45b2-8e45-6d3075649666","actor_username":"ggb-13@ufmg.br","actor_via_sso":false,"log_type":"token"}	2026-01-12 13:44:23.303937+00	
00000000-0000-0000-0000-000000000000	ee6edf55-0f14-4adb-abe2-93f0ce7aaf7d	{"action":"login","actor_id":"c19fa43e-6abc-45b2-8e45-6d3075649666","actor_username":"ggb-13@ufmg.br","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2026-01-12 13:53:59.768735+00	
00000000-0000-0000-0000-000000000000	f456679f-e642-4c25-b1ea-7adb2632f5af	{"action":"token_refreshed","actor_id":"c19fa43e-6abc-45b2-8e45-6d3075649666","actor_username":"ggb-13@ufmg.br","actor_via_sso":false,"log_type":"token"}	2026-01-12 17:25:53.62016+00	
00000000-0000-0000-0000-000000000000	6c649f84-1954-4cb2-8523-5ca7e51e4702	{"action":"token_revoked","actor_id":"c19fa43e-6abc-45b2-8e45-6d3075649666","actor_username":"ggb-13@ufmg.br","actor_via_sso":false,"log_type":"token"}	2026-01-12 17:25:53.701311+00	
00000000-0000-0000-0000-000000000000	3b69c02c-ce9d-480d-9109-e1ef23dbcd79	{"action":"login","actor_id":"c19fa43e-6abc-45b2-8e45-6d3075649666","actor_username":"ggb-13@ufmg.br","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2026-01-12 17:27:59.68099+00	
00000000-0000-0000-0000-000000000000	2c29d692-aa63-4641-b0ad-7baa3c45feba	{"action":"token_refreshed","actor_id":"c19fa43e-6abc-45b2-8e45-6d3075649666","actor_username":"ggb-13@ufmg.br","actor_via_sso":false,"log_type":"token"}	2026-01-12 18:26:27.175928+00	
00000000-0000-0000-0000-000000000000	1b4efa9b-b9cd-4d35-a016-4defcec6fa8a	{"action":"token_revoked","actor_id":"c19fa43e-6abc-45b2-8e45-6d3075649666","actor_username":"ggb-13@ufmg.br","actor_via_sso":false,"log_type":"token"}	2026-01-12 18:26:27.177233+00	
00000000-0000-0000-0000-000000000000	640a38cc-e7ff-422c-8390-77da834e79d0	{"action":"token_refreshed","actor_id":"c19fa43e-6abc-45b2-8e45-6d3075649666","actor_username":"ggb-13@ufmg.br","actor_via_sso":false,"log_type":"token"}	2026-01-12 19:24:58.536506+00	
00000000-0000-0000-0000-000000000000	231c0224-701d-45b8-a99c-e5a57555e60d	{"action":"token_revoked","actor_id":"c19fa43e-6abc-45b2-8e45-6d3075649666","actor_username":"ggb-13@ufmg.br","actor_via_sso":false,"log_type":"token"}	2026-01-12 19:24:58.537724+00	
00000000-0000-0000-0000-000000000000	066a80b0-ef80-45df-a632-56947ea83bb4	{"action":"token_refreshed","actor_id":"c19fa43e-6abc-45b2-8e45-6d3075649666","actor_username":"ggb-13@ufmg.br","actor_via_sso":false,"log_type":"token"}	2026-01-12 20:03:44.032191+00	
00000000-0000-0000-0000-000000000000	118dffdb-4aa9-4902-92f0-74ca8a44a9d9	{"action":"token_revoked","actor_id":"c19fa43e-6abc-45b2-8e45-6d3075649666","actor_username":"ggb-13@ufmg.br","actor_via_sso":false,"log_type":"token"}	2026-01-12 20:03:44.03352+00	
00000000-0000-0000-0000-000000000000	03d8fe8d-6e4d-446b-80fd-0e13423c5c2b	{"action":"login","actor_id":"c19fa43e-6abc-45b2-8e45-6d3075649666","actor_username":"ggb-13@ufmg.br","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2026-01-12 20:04:19.586512+00	
00000000-0000-0000-0000-000000000000	32b9d6e9-bd2b-480e-958d-754a001d507e	{"action":"login","actor_id":"c19fa43e-6abc-45b2-8e45-6d3075649666","actor_username":"ggb-13@ufmg.br","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2026-01-12 20:12:08.080233+00	
00000000-0000-0000-0000-000000000000	69eb86ec-4fbc-4a14-82ec-fae6339e44f4	{"action":"login","actor_id":"c19fa43e-6abc-45b2-8e45-6d3075649666","actor_username":"ggb-13@ufmg.br","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2026-01-12 20:12:11.836033+00	
00000000-0000-0000-0000-000000000000	1abcf98f-e45c-441c-aa64-276414eaf98f	{"action":"login","actor_id":"c19fa43e-6abc-45b2-8e45-6d3075649666","actor_username":"ggb-13@ufmg.br","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2026-01-12 20:14:18.280252+00	
00000000-0000-0000-0000-000000000000	22a0bf1c-d500-4715-bff5-b2d816e6a632	{"action":"login","actor_id":"c19fa43e-6abc-45b2-8e45-6d3075649666","actor_username":"ggb-13@ufmg.br","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2026-01-12 20:14:48.833131+00	
00000000-0000-0000-0000-000000000000	d09a7ea8-1761-4410-bbe9-ad23368e8161	{"action":"login","actor_id":"c19fa43e-6abc-45b2-8e45-6d3075649666","actor_username":"ggb-13@ufmg.br","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2026-01-12 20:26:18.994031+00	
00000000-0000-0000-0000-000000000000	600cf8b9-ce11-48ae-8933-a8cde3df1e41	{"action":"login","actor_id":"c19fa43e-6abc-45b2-8e45-6d3075649666","actor_username":"ggb-13@ufmg.br","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2026-01-12 20:30:54.220081+00	
00000000-0000-0000-0000-000000000000	800e49d3-9de5-43b0-8c54-8748bedceb38	{"action":"login","actor_id":"c19fa43e-6abc-45b2-8e45-6d3075649666","actor_username":"ggb-13@ufmg.br","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2026-01-12 20:51:57.527044+00	
00000000-0000-0000-0000-000000000000	1e75778f-497a-447d-95d5-c9f7d5d5ac24	{"action":"token_refreshed","actor_id":"c19fa43e-6abc-45b2-8e45-6d3075649666","actor_username":"ggb-13@ufmg.br","actor_via_sso":false,"log_type":"token"}	2026-01-13 00:24:04.990692+00	
00000000-0000-0000-0000-000000000000	3b983cb0-5d87-47d3-849b-82ad5e715d95	{"action":"token_revoked","actor_id":"c19fa43e-6abc-45b2-8e45-6d3075649666","actor_username":"ggb-13@ufmg.br","actor_via_sso":false,"log_type":"token"}	2026-01-13 00:24:04.991817+00	
00000000-0000-0000-0000-000000000000	880658b7-65ec-4cca-8a81-0f2e17e0b559	{"action":"login","actor_id":"c19fa43e-6abc-45b2-8e45-6d3075649666","actor_username":"ggb-13@ufmg.br","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2026-01-13 00:24:13.076731+00	
00000000-0000-0000-0000-000000000000	87b88eaa-2d8f-44f1-9063-6372a60a2591	{"action":"token_refreshed","actor_id":"c19fa43e-6abc-45b2-8e45-6d3075649666","actor_username":"ggb-13@ufmg.br","actor_via_sso":false,"log_type":"token"}	2026-01-14 20:12:41.741415+00	
00000000-0000-0000-0000-000000000000	f84e24aa-34a4-4d1f-ab52-427b1f8db047	{"action":"token_revoked","actor_id":"c19fa43e-6abc-45b2-8e45-6d3075649666","actor_username":"ggb-13@ufmg.br","actor_via_sso":false,"log_type":"token"}	2026-01-14 20:12:41.822257+00	
00000000-0000-0000-0000-000000000000	48735ef8-8eca-47fc-bdd0-13fac218d06c	{"action":"login","actor_id":"c19fa43e-6abc-45b2-8e45-6d3075649666","actor_username":"ggb-13@ufmg.br","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2026-01-14 20:13:24.394759+00	
00000000-0000-0000-0000-000000000000	0ac8be35-d9fc-45d7-8596-d7945b1b6dd6	{"action":"token_refreshed","actor_id":"c19fa43e-6abc-45b2-8e45-6d3075649666","actor_username":"ggb-13@ufmg.br","actor_via_sso":false,"log_type":"token"}	2026-01-26 12:22:01.500211+00	
00000000-0000-0000-0000-000000000000	67f95f90-4746-43e9-80bc-428a5ec9c505	{"action":"token_revoked","actor_id":"c19fa43e-6abc-45b2-8e45-6d3075649666","actor_username":"ggb-13@ufmg.br","actor_via_sso":false,"log_type":"token"}	2026-01-26 12:22:01.567526+00	
00000000-0000-0000-0000-000000000000	0053faa6-5631-4f17-83f3-7be6a8590947	{"action":"login","actor_id":"c19fa43e-6abc-45b2-8e45-6d3075649666","actor_username":"ggb-13@ufmg.br","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2026-01-26 12:22:29.863315+00	
00000000-0000-0000-0000-000000000000	045448a1-28e5-4f16-a982-dec925567635	{"action":"token_refreshed","actor_id":"c19fa43e-6abc-45b2-8e45-6d3075649666","actor_username":"ggb-13@ufmg.br","actor_via_sso":false,"log_type":"token"}	2026-01-26 13:20:04.968356+00	
00000000-0000-0000-0000-000000000000	8f47030a-9e8a-4aa6-9165-35bfc8013f40	{"action":"token_revoked","actor_id":"c19fa43e-6abc-45b2-8e45-6d3075649666","actor_username":"ggb-13@ufmg.br","actor_via_sso":false,"log_type":"token"}	2026-01-26 13:20:04.969349+00	
00000000-0000-0000-0000-000000000000	14701bf5-e339-438b-851f-05a9d1921b2a	{"action":"user_deleted","actor_id":"00000000-0000-0000-0000-000000000000","actor_username":"service_role","actor_via_sso":false,"log_type":"team","traits":{"user_email":"ggb-13@ufmg.br","user_id":"c19fa43e-6abc-45b2-8e45-6d3075649666","user_phone":""}}	2026-01-26 14:09:45.747413+00	
00000000-0000-0000-0000-000000000000	3c69910b-af97-4c68-8ed9-f0fd5f54912f	{"action":"user_signedup","actor_id":"5f6dfa12-8e3f-47ba-aacb-d7871627232c","actor_username":"ggb-13@ufmg.br","actor_via_sso":false,"log_type":"team","traits":{"provider":"email"}}	2026-01-26 14:45:24.877868+00	
00000000-0000-0000-0000-000000000000	2787c102-5151-4d4a-bc40-4dfa183afc94	{"action":"login","actor_id":"5f6dfa12-8e3f-47ba-aacb-d7871627232c","actor_username":"ggb-13@ufmg.br","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2026-01-26 14:45:24.895805+00	
00000000-0000-0000-0000-000000000000	decc96ac-1456-4c72-95e9-b657efa58d8d	{"action":"user_repeated_signup","actor_id":"5f6dfa12-8e3f-47ba-aacb-d7871627232c","actor_username":"ggb-13@ufmg.br","actor_via_sso":false,"log_type":"user","traits":{"provider":"email"}}	2026-01-26 14:53:10.859924+00	
00000000-0000-0000-0000-000000000000	1f000156-01ef-4684-b411-cd7c141e2d04	{"action":"user_deleted","actor_id":"00000000-0000-0000-0000-000000000000","actor_username":"service_role","actor_via_sso":false,"log_type":"team","traits":{"user_email":"ggb-13@ufmg.br","user_id":"5f6dfa12-8e3f-47ba-aacb-d7871627232c","user_phone":""}}	2026-01-26 14:53:14.176516+00	
00000000-0000-0000-0000-000000000000	0738e2d8-023f-4987-98ff-3a6e5b4a6a02	{"action":"user_signedup","actor_id":"09b793a3-8ac9-4fcb-8146-b4fee3a549cb","actor_username":"ggb-13@ufmg.br","actor_via_sso":false,"log_type":"team","traits":{"provider":"email"}}	2026-01-26 14:53:39.489683+00	
00000000-0000-0000-0000-000000000000	855aefb4-615b-4516-be5e-92cb140ed5e8	{"action":"login","actor_id":"09b793a3-8ac9-4fcb-8146-b4fee3a549cb","actor_username":"ggb-13@ufmg.br","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2026-01-26 14:53:39.503011+00	
00000000-0000-0000-0000-000000000000	f57b2462-0c9d-41c4-a036-8cfa9584a03a	{"action":"token_refreshed","actor_id":"09b793a3-8ac9-4fcb-8146-b4fee3a549cb","actor_username":"ggb-13@ufmg.br","actor_via_sso":false,"log_type":"token"}	2026-01-26 18:16:54.507014+00	
00000000-0000-0000-0000-000000000000	1ee29581-795c-4dd1-b0b0-39b52f72a53e	{"action":"token_revoked","actor_id":"09b793a3-8ac9-4fcb-8146-b4fee3a549cb","actor_username":"ggb-13@ufmg.br","actor_via_sso":false,"log_type":"token"}	2026-01-26 18:16:54.508169+00	
00000000-0000-0000-0000-000000000000	4926fac5-07c0-4b05-9be8-3552ac6689c4	{"action":"user_signedup","actor_id":"bd02dbb1-1b0a-4ae8-8f20-302c1ee36640","actor_username":"fgb80@yahoo.com.br","actor_via_sso":false,"log_type":"team","traits":{"provider":"email"}}	2026-01-26 18:19:38.125686+00	
00000000-0000-0000-0000-000000000000	5859c643-9c3e-4292-95ab-5e0a76c82e62	{"action":"login","actor_id":"bd02dbb1-1b0a-4ae8-8f20-302c1ee36640","actor_username":"fgb80@yahoo.com.br","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2026-01-26 18:19:38.179976+00	
00000000-0000-0000-0000-000000000000	60ca9778-c44e-4660-a64b-cebb7a5cea77	{"action":"login","actor_id":"09b793a3-8ac9-4fcb-8146-b4fee3a549cb","actor_username":"ggb-13@ufmg.br","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2026-01-26 18:20:00.184307+00	
00000000-0000-0000-0000-000000000000	21423310-665c-413e-a4e0-651527411472	{"action":"login","actor_id":"09b793a3-8ac9-4fcb-8146-b4fee3a549cb","actor_username":"ggb-13@ufmg.br","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2026-01-26 18:40:10.421305+00	
00000000-0000-0000-0000-000000000000	906c73af-f79f-46b1-8df9-622a84988054	{"action":"login","actor_id":"09b793a3-8ac9-4fcb-8146-b4fee3a549cb","actor_username":"ggb-13@ufmg.br","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2026-01-26 18:45:25.616112+00	
00000000-0000-0000-0000-000000000000	2f90e4db-49a8-40d5-8a01-b1610a8c0d08	{"action":"login","actor_id":"09b793a3-8ac9-4fcb-8146-b4fee3a549cb","actor_username":"ggb-13@ufmg.br","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2026-01-26 18:46:49.4065+00	
00000000-0000-0000-0000-000000000000	b06184ab-91e0-4589-b43a-b53f544dc821	{"action":"login","actor_id":"09b793a3-8ac9-4fcb-8146-b4fee3a549cb","actor_username":"ggb-13@ufmg.br","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2026-01-26 18:52:06.928281+00	
00000000-0000-0000-0000-000000000000	32a89b91-ffbf-49ea-b9aa-de861cd528ff	{"action":"login","actor_id":"09b793a3-8ac9-4fcb-8146-b4fee3a549cb","actor_username":"ggb-13@ufmg.br","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2026-01-26 19:03:42.441427+00	
00000000-0000-0000-0000-000000000000	5f767aa4-f54f-4853-9308-32c9b43ad243	{"action":"login","actor_id":"09b793a3-8ac9-4fcb-8146-b4fee3a549cb","actor_username":"ggb-13@ufmg.br","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2026-01-26 19:30:33.219408+00	
00000000-0000-0000-0000-000000000000	fdac93bc-b5f8-4b78-a673-e9dd4c1e1a53	{"action":"login","actor_id":"09b793a3-8ac9-4fcb-8146-b4fee3a549cb","actor_username":"ggb-13@ufmg.br","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2026-01-26 19:35:47.466538+00	
00000000-0000-0000-0000-000000000000	0b6e9209-bd10-45d6-8193-2bfbc8a0f1fe	{"action":"login","actor_id":"09b793a3-8ac9-4fcb-8146-b4fee3a549cb","actor_username":"ggb-13@ufmg.br","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2026-01-26 19:43:15.595578+00	
00000000-0000-0000-0000-000000000000	17dd4312-afe3-4cea-9b94-626b6b6b2fa8	{"action":"login","actor_id":"09b793a3-8ac9-4fcb-8146-b4fee3a549cb","actor_username":"ggb-13@ufmg.br","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2026-01-26 19:45:31.493257+00	
00000000-0000-0000-0000-000000000000	30825fb3-ca51-4d2d-8316-da8354a79935	{"action":"logout","actor_id":"09b793a3-8ac9-4fcb-8146-b4fee3a549cb","actor_username":"ggb-13@ufmg.br","actor_via_sso":false,"log_type":"account"}	2026-01-26 19:47:34.795215+00	
00000000-0000-0000-0000-000000000000	11c4f5f3-e990-40ce-9c6b-4e4685435b5a	{"action":"login","actor_id":"bd02dbb1-1b0a-4ae8-8f20-302c1ee36640","actor_username":"fgb80@yahoo.com.br","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2026-01-26 19:47:46.11131+00	
00000000-0000-0000-0000-000000000000	2f628cd9-e3b3-481b-ba08-96cbfd528a65	{"action":"logout","actor_id":"bd02dbb1-1b0a-4ae8-8f20-302c1ee36640","actor_username":"fgb80@yahoo.com.br","actor_via_sso":false,"log_type":"account"}	2026-01-26 19:48:11.256317+00	
00000000-0000-0000-0000-000000000000	108569f7-cea5-4fd4-bb1e-9758c713c971	{"action":"user_signedup","actor_id":"69710ccc-152e-4e51-8147-4cc6b0f36489","actor_username":"ggoesbraga@gmail","actor_via_sso":false,"log_type":"team","traits":{"provider":"email"}}	2026-01-26 19:48:34.568863+00	
00000000-0000-0000-0000-000000000000	7eaecf92-bbd5-4ec9-97ac-8d0d7745708a	{"action":"login","actor_id":"69710ccc-152e-4e51-8147-4cc6b0f36489","actor_username":"ggoesbraga@gmail","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2026-01-26 19:48:34.584537+00	
00000000-0000-0000-0000-000000000000	ed0a953f-7bfa-450a-8567-fe9e86a84356	{"action":"user_deleted","actor_id":"00000000-0000-0000-0000-000000000000","actor_username":"service_role","actor_via_sso":false,"log_type":"team","traits":{"user_email":"ggoesbraga@gmail","user_id":"69710ccc-152e-4e51-8147-4cc6b0f36489","user_phone":""}}	2026-01-26 19:49:49.968003+00	
00000000-0000-0000-0000-000000000000	c8b4184b-ff07-4857-8eb7-7c968da53f3f	{"action":"user_signedup","actor_id":"3c998c93-fee1-455f-b604-e948808aa5ad","actor_username":"ggoesbraga@gmail.com","actor_via_sso":false,"log_type":"team","traits":{"provider":"email"}}	2026-01-26 19:53:28.143359+00	
00000000-0000-0000-0000-000000000000	c4bfab51-23e8-441a-91b7-520b2283430a	{"action":"login","actor_id":"3c998c93-fee1-455f-b604-e948808aa5ad","actor_username":"ggoesbraga@gmail.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2026-01-26 19:53:28.411547+00	
00000000-0000-0000-0000-000000000000	d9a005e4-638f-44eb-8c96-af72465f24db	{"action":"login","actor_id":"3c998c93-fee1-455f-b604-e948808aa5ad","actor_username":"ggoesbraga@gmail.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2026-01-26 19:53:38.540383+00	
00000000-0000-0000-0000-000000000000	b7c58d65-1489-4464-84d7-0941b8aad492	{"action":"login","actor_id":"09b793a3-8ac9-4fcb-8146-b4fee3a549cb","actor_username":"ggb-13@ufmg.br","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2026-01-26 20:15:16.78927+00	
00000000-0000-0000-0000-000000000000	6507d62c-57fa-42a0-876c-06f482c8f0cc	{"action":"logout","actor_id":"09b793a3-8ac9-4fcb-8146-b4fee3a549cb","actor_username":"ggb-13@ufmg.br","actor_via_sso":false,"log_type":"account"}	2026-01-26 20:15:40.224213+00	
00000000-0000-0000-0000-000000000000	6fa3f6ee-20c9-45ed-b6b8-bf22f28bf98a	{"action":"login","actor_id":"bd02dbb1-1b0a-4ae8-8f20-302c1ee36640","actor_username":"fgb80@yahoo.com.br","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2026-01-26 20:15:53.500037+00	
00000000-0000-0000-0000-000000000000	46c0fc0e-0ebf-4b39-ba25-04e5c2bdbdad	{"action":"login","actor_id":"09b793a3-8ac9-4fcb-8146-b4fee3a549cb","actor_username":"ggb-13@ufmg.br","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2026-01-27 09:43:38.164652+00	
00000000-0000-0000-0000-000000000000	ad486acf-a24c-46eb-b766-360e32eb3ea8	{"action":"login","actor_id":"09b793a3-8ac9-4fcb-8146-b4fee3a549cb","actor_username":"ggb-13@ufmg.br","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2026-01-27 14:03:36.523886+00	
00000000-0000-0000-0000-000000000000	78ac5968-b2fd-4d72-8533-893b5050ab2d	{"action":"login","actor_id":"09b793a3-8ac9-4fcb-8146-b4fee3a549cb","actor_username":"ggb-13@ufmg.br","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2026-01-27 14:33:09.740186+00	
00000000-0000-0000-0000-000000000000	8ab1f51f-705a-410b-af25-7246c68ab4a2	{"action":"token_refreshed","actor_id":"09b793a3-8ac9-4fcb-8146-b4fee3a549cb","actor_username":"ggb-13@ufmg.br","actor_via_sso":false,"log_type":"token"}	2026-01-27 14:41:06.830307+00	
00000000-0000-0000-0000-000000000000	c48b6a94-2cdd-4727-a5b0-045d7468d5b0	{"action":"token_revoked","actor_id":"09b793a3-8ac9-4fcb-8146-b4fee3a549cb","actor_username":"ggb-13@ufmg.br","actor_via_sso":false,"log_type":"token"}	2026-01-27 14:41:06.831523+00	
00000000-0000-0000-0000-000000000000	f8b2ce6d-a988-4bc7-a254-ec47a2308bcf	{"action":"login","actor_id":"09b793a3-8ac9-4fcb-8146-b4fee3a549cb","actor_username":"ggb-13@ufmg.br","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2026-01-27 14:41:16.043138+00	
00000000-0000-0000-0000-000000000000	02b0cb02-4817-4f69-ae50-f9b9741a838b	{"action":"login","actor_id":"09b793a3-8ac9-4fcb-8146-b4fee3a549cb","actor_username":"ggb-13@ufmg.br","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2026-01-27 14:58:35.673106+00	
00000000-0000-0000-0000-000000000000	79cbd92f-3d42-49d2-aa40-04836835ed28	{"action":"login","actor_id":"3c998c93-fee1-455f-b604-e948808aa5ad","actor_username":"ggoesbraga@gmail.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2026-01-27 14:59:03.407641+00	
00000000-0000-0000-0000-000000000000	44dcfc85-c315-4631-9107-cccf03cc9642	{"action":"login","actor_id":"3c998c93-fee1-455f-b604-e948808aa5ad","actor_username":"ggoesbraga@gmail.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2026-01-27 14:59:05.429878+00	
00000000-0000-0000-0000-000000000000	dd5c9543-3c7e-460c-916e-8f36a3f3119b	{"action":"login","actor_id":"3c998c93-fee1-455f-b604-e948808aa5ad","actor_username":"ggoesbraga@gmail.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2026-01-27 15:01:15.712761+00	
00000000-0000-0000-0000-000000000000	a9281229-570f-479c-876c-0ec624968fc4	{"action":"token_refreshed","actor_id":"3c998c93-fee1-455f-b604-e948808aa5ad","actor_username":"ggoesbraga@gmail.com","actor_via_sso":false,"log_type":"token"}	2026-01-27 16:02:00.447768+00	
00000000-0000-0000-0000-000000000000	c35e1e25-1b7a-4d9c-8991-8a07b7c9c822	{"action":"token_revoked","actor_id":"3c998c93-fee1-455f-b604-e948808aa5ad","actor_username":"ggoesbraga@gmail.com","actor_via_sso":false,"log_type":"token"}	2026-01-27 16:02:00.448488+00	
00000000-0000-0000-0000-000000000000	6cc3f6fe-3502-403f-ab2e-0be9ee482aac	{"action":"token_refreshed","actor_id":"09b793a3-8ac9-4fcb-8146-b4fee3a549cb","actor_username":"ggb-13@ufmg.br","actor_via_sso":false,"log_type":"token"}	2026-01-27 16:57:49.736392+00	
00000000-0000-0000-0000-000000000000	1be869d9-ad4d-4b4b-bca7-b9d074b16974	{"action":"token_revoked","actor_id":"09b793a3-8ac9-4fcb-8146-b4fee3a549cb","actor_username":"ggb-13@ufmg.br","actor_via_sso":false,"log_type":"token"}	2026-01-27 16:57:49.737251+00	
00000000-0000-0000-0000-000000000000	490ecfa4-ffa5-4d8b-a319-6c5ba8fedf24	{"action":"token_refreshed","actor_id":"3c998c93-fee1-455f-b604-e948808aa5ad","actor_username":"ggoesbraga@gmail.com","actor_via_sso":false,"log_type":"token"}	2026-01-27 17:00:19.071582+00	
00000000-0000-0000-0000-000000000000	72ba7d56-12ef-446e-9113-1976a2c5cb79	{"action":"token_revoked","actor_id":"3c998c93-fee1-455f-b604-e948808aa5ad","actor_username":"ggoesbraga@gmail.com","actor_via_sso":false,"log_type":"token"}	2026-01-27 17:00:19.072568+00	
00000000-0000-0000-0000-000000000000	81da0226-8ce2-4263-ba49-822894406c95	{"action":"token_refreshed","actor_id":"3c998c93-fee1-455f-b604-e948808aa5ad","actor_username":"ggoesbraga@gmail.com","actor_via_sso":false,"log_type":"token"}	2026-01-27 17:58:25.863817+00	
00000000-0000-0000-0000-000000000000	f4d9ceb0-5c20-48fb-b0cb-370bd98c7e67	{"action":"token_revoked","actor_id":"3c998c93-fee1-455f-b604-e948808aa5ad","actor_username":"ggoesbraga@gmail.com","actor_via_sso":false,"log_type":"token"}	2026-01-27 17:58:25.864401+00	
00000000-0000-0000-0000-000000000000	7bc88f75-a15b-4d9e-9f2b-915ca785334e	{"action":"login","actor_id":"09b793a3-8ac9-4fcb-8146-b4fee3a549cb","actor_username":"ggb-13@ufmg.br","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2026-01-27 18:21:23.761439+00	
00000000-0000-0000-0000-000000000000	c9c58922-2987-48d9-a2c4-070222e6be33	{"action":"login","actor_id":"09b793a3-8ac9-4fcb-8146-b4fee3a549cb","actor_username":"ggb-13@ufmg.br","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2026-01-27 18:36:09.996485+00	
00000000-0000-0000-0000-000000000000	8f6addcf-bdb7-44bb-9bd2-e3e0bc2ee566	{"action":"login","actor_id":"09b793a3-8ac9-4fcb-8146-b4fee3a549cb","actor_username":"ggb-13@ufmg.br","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2026-01-27 18:38:36.285159+00	
00000000-0000-0000-0000-000000000000	311db43e-b705-4f96-bd07-70fc4ee156ea	{"action":"login","actor_id":"09b793a3-8ac9-4fcb-8146-b4fee3a549cb","actor_username":"ggb-13@ufmg.br","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2026-01-27 18:39:17.724473+00	
00000000-0000-0000-0000-000000000000	3af7a1ac-2396-46b2-ad7c-1fbf7079a05d	{"action":"login","actor_id":"09b793a3-8ac9-4fcb-8146-b4fee3a549cb","actor_username":"ggb-13@ufmg.br","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2026-01-27 19:01:03.498211+00	
00000000-0000-0000-0000-000000000000	dacdf05a-f03d-4f13-b942-83224e665f6c	{"action":"login","actor_id":"09b793a3-8ac9-4fcb-8146-b4fee3a549cb","actor_username":"ggb-13@ufmg.br","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2026-02-05 13:30:35.512169+00	
00000000-0000-0000-0000-000000000000	3aed6f4c-a73d-414f-b9af-b225a95a4a9d	{"action":"token_refreshed","actor_id":"09b793a3-8ac9-4fcb-8146-b4fee3a549cb","actor_username":"ggb-13@ufmg.br","actor_via_sso":false,"log_type":"token"}	2026-02-05 13:48:41.720775+00	
00000000-0000-0000-0000-000000000000	98b82d52-f816-4b76-af68-0e938a78532f	{"action":"token_revoked","actor_id":"09b793a3-8ac9-4fcb-8146-b4fee3a549cb","actor_username":"ggb-13@ufmg.br","actor_via_sso":false,"log_type":"token"}	2026-02-05 13:48:41.920091+00	
00000000-0000-0000-0000-000000000000	2c5c5304-4f2e-4ac4-8b70-9818fddc3fd3	{"action":"login","actor_id":"09b793a3-8ac9-4fcb-8146-b4fee3a549cb","actor_username":"ggb-13@ufmg.br","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2026-02-05 13:49:05.0515+00	
00000000-0000-0000-0000-000000000000	9c14aad0-cbed-4695-b181-8e052b23ab75	{"action":"login","actor_id":"09b793a3-8ac9-4fcb-8146-b4fee3a549cb","actor_username":"ggb-13@ufmg.br","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2026-02-05 13:57:01.774496+00	
00000000-0000-0000-0000-000000000000	4f54e824-8567-4ff2-8a22-b37b647ab8ac	{"action":"login","actor_id":"09b793a3-8ac9-4fcb-8146-b4fee3a549cb","actor_username":"ggb-13@ufmg.br","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2026-02-05 14:22:48.599278+00	
00000000-0000-0000-0000-000000000000	1ed6520d-5203-4c95-ba4b-defbe3286b81	{"action":"login","actor_id":"09b793a3-8ac9-4fcb-8146-b4fee3a549cb","actor_username":"ggb-13@ufmg.br","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2026-02-05 14:27:33.77743+00	
00000000-0000-0000-0000-000000000000	e633a097-804b-4120-beb9-f350ffbd5669	{"action":"login","actor_id":"09b793a3-8ac9-4fcb-8146-b4fee3a549cb","actor_username":"ggb-13@ufmg.br","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2026-02-05 14:59:47.18459+00	
00000000-0000-0000-0000-000000000000	c5347636-fc4c-4d50-8e3d-bfe95fec08d7	{"action":"login","actor_id":"09b793a3-8ac9-4fcb-8146-b4fee3a549cb","actor_username":"ggb-13@ufmg.br","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2026-02-05 15:01:39.214342+00	
00000000-0000-0000-0000-000000000000	a0d64d62-f81b-4b53-9f09-a23cdd4557c3	{"action":"token_refreshed","actor_id":"09b793a3-8ac9-4fcb-8146-b4fee3a549cb","actor_username":"ggb-13@ufmg.br","actor_via_sso":false,"log_type":"token"}	2026-02-05 16:10:17.982509+00	
00000000-0000-0000-0000-000000000000	ed88ab3e-3d8a-4663-8bbc-e28db2616fa3	{"action":"token_revoked","actor_id":"09b793a3-8ac9-4fcb-8146-b4fee3a549cb","actor_username":"ggb-13@ufmg.br","actor_via_sso":false,"log_type":"token"}	2026-02-05 16:10:17.983548+00	
00000000-0000-0000-0000-000000000000	9aed1112-0339-4fff-850c-92443d164b1a	{"action":"login","actor_id":"09b793a3-8ac9-4fcb-8146-b4fee3a549cb","actor_username":"ggb-13@ufmg.br","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2026-02-05 16:10:30.538559+00	
00000000-0000-0000-0000-000000000000	55bd113d-d96e-47c1-b520-bec2f51cfb0e	{"action":"token_refreshed","actor_id":"09b793a3-8ac9-4fcb-8146-b4fee3a549cb","actor_username":"ggb-13@ufmg.br","actor_via_sso":false,"log_type":"token"}	2026-02-05 17:08:49.513552+00	
00000000-0000-0000-0000-000000000000	4dc94c1a-3c9b-4f8f-b0d7-19ca2a3023f8	{"action":"token_revoked","actor_id":"09b793a3-8ac9-4fcb-8146-b4fee3a549cb","actor_username":"ggb-13@ufmg.br","actor_via_sso":false,"log_type":"token"}	2026-02-05 17:08:49.514159+00	
00000000-0000-0000-0000-000000000000	ee2cd84d-e88c-4827-a24b-efa486f48fb0	{"action":"login","actor_id":"09b793a3-8ac9-4fcb-8146-b4fee3a549cb","actor_username":"ggb-13@ufmg.br","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2026-02-05 17:17:58.137435+00	
00000000-0000-0000-0000-000000000000	30d88667-5479-48a7-b43d-3bfb7dfa8ab2	{"action":"login","actor_id":"09b793a3-8ac9-4fcb-8146-b4fee3a549cb","actor_username":"ggb-13@ufmg.br","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2026-02-05 17:28:06.814726+00	
00000000-0000-0000-0000-000000000000	38228bb7-973c-4aaf-9ee2-de0561502f62	{"action":"login","actor_id":"09b793a3-8ac9-4fcb-8146-b4fee3a549cb","actor_username":"ggb-13@ufmg.br","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2026-02-05 18:22:25.342741+00	
00000000-0000-0000-0000-000000000000	2ef60769-8c75-492e-8c4f-a772236555e1	{"action":"token_refreshed","actor_id":"09b793a3-8ac9-4fcb-8146-b4fee3a549cb","actor_username":"ggb-13@ufmg.br","actor_via_sso":false,"log_type":"token"}	2026-02-05 20:02:04.195324+00	
00000000-0000-0000-0000-000000000000	f885e32f-9923-47c5-a8df-d5c44b93ee31	{"action":"token_revoked","actor_id":"09b793a3-8ac9-4fcb-8146-b4fee3a549cb","actor_username":"ggb-13@ufmg.br","actor_via_sso":false,"log_type":"token"}	2026-02-05 20:02:04.196412+00	
00000000-0000-0000-0000-000000000000	f68eb380-3f65-4fb9-a4d1-4db430d3a2a3	{"action":"login","actor_id":"09b793a3-8ac9-4fcb-8146-b4fee3a549cb","actor_username":"ggb-13@ufmg.br","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2026-02-05 20:02:47.52729+00	
00000000-0000-0000-0000-000000000000	b658a621-d849-49ab-a9e0-61a7bc0ee02e	{"action":"login","actor_id":"09b793a3-8ac9-4fcb-8146-b4fee3a549cb","actor_username":"ggb-13@ufmg.br","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2026-02-05 20:06:33.778181+00	
00000000-0000-0000-0000-000000000000	0ba9e8c5-68a5-400a-bf49-17df0ad11b7c	{"action":"token_refreshed","actor_id":"09b793a3-8ac9-4fcb-8146-b4fee3a549cb","actor_username":"ggb-13@ufmg.br","actor_via_sso":false,"log_type":"token"}	2026-02-09 11:53:23.08298+00	
00000000-0000-0000-0000-000000000000	2d92d57f-e338-422b-9c30-483977f5d797	{"action":"token_revoked","actor_id":"09b793a3-8ac9-4fcb-8146-b4fee3a549cb","actor_username":"ggb-13@ufmg.br","actor_via_sso":false,"log_type":"token"}	2026-02-09 11:53:23.162177+00	
00000000-0000-0000-0000-000000000000	9e4986a6-7935-49db-a9ee-f0a5d9b93dd6	{"action":"login","actor_id":"09b793a3-8ac9-4fcb-8146-b4fee3a549cb","actor_username":"ggb-13@ufmg.br","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2026-02-09 11:53:45.390015+00	
00000000-0000-0000-0000-000000000000	f3f4ea6b-9cc8-4857-82ea-09430137a55f	{"action":"login","actor_id":"09b793a3-8ac9-4fcb-8146-b4fee3a549cb","actor_username":"ggb-13@ufmg.br","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2026-02-09 11:54:35.106644+00	
00000000-0000-0000-0000-000000000000	345cd96e-c66d-4fca-a2aa-cca5edc0d115	{"action":"login","actor_id":"09b793a3-8ac9-4fcb-8146-b4fee3a549cb","actor_username":"ggb-13@ufmg.br","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2026-02-09 11:54:55.145475+00	
00000000-0000-0000-0000-000000000000	68271e26-8173-4a1d-8ace-94f4a7f52c4a	{"action":"token_refreshed","actor_id":"09b793a3-8ac9-4fcb-8146-b4fee3a549cb","actor_username":"ggb-13@ufmg.br","actor_via_sso":false,"log_type":"token"}	2026-02-09 11:55:52.338613+00	
00000000-0000-0000-0000-000000000000	d330041d-032b-405a-a5a3-c0998c3c194d	{"action":"token_revoked","actor_id":"09b793a3-8ac9-4fcb-8146-b4fee3a549cb","actor_username":"ggb-13@ufmg.br","actor_via_sso":false,"log_type":"token"}	2026-02-09 11:55:52.339631+00	
00000000-0000-0000-0000-000000000000	bd7dfac8-80dc-45fa-8530-74453e0868db	{"action":"login","actor_id":"09b793a3-8ac9-4fcb-8146-b4fee3a549cb","actor_username":"ggb-13@ufmg.br","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2026-02-09 11:58:32.277456+00	
00000000-0000-0000-0000-000000000000	873f72dc-caa6-484e-b9ed-f11622086e65	{"action":"login","actor_id":"09b793a3-8ac9-4fcb-8146-b4fee3a549cb","actor_username":"ggb-13@ufmg.br","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2026-02-09 12:47:29.353254+00	
00000000-0000-0000-0000-000000000000	2d1e2c76-38f2-472c-91d4-0a86d7173e1d	{"action":"login","actor_id":"09b793a3-8ac9-4fcb-8146-b4fee3a549cb","actor_username":"ggb-13@ufmg.br","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2026-02-09 12:49:43.150081+00	
00000000-0000-0000-0000-000000000000	62e88801-8445-48db-b83a-cac41d913b4b	{"action":"login","actor_id":"09b793a3-8ac9-4fcb-8146-b4fee3a549cb","actor_username":"ggb-13@ufmg.br","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2026-02-09 12:51:33.738295+00	
00000000-0000-0000-0000-000000000000	65b33e99-150a-4194-84de-a6c1afbc5681	{"action":"login","actor_id":"09b793a3-8ac9-4fcb-8146-b4fee3a549cb","actor_username":"ggb-13@ufmg.br","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2026-02-09 12:52:19.393104+00	
00000000-0000-0000-0000-000000000000	b1f5a215-d685-4df2-903f-281576c09bca	{"action":"token_refreshed","actor_id":"09b793a3-8ac9-4fcb-8146-b4fee3a549cb","actor_username":"ggb-13@ufmg.br","actor_via_sso":false,"log_type":"token"}	2026-02-09 13:09:42.757004+00	
00000000-0000-0000-0000-000000000000	93ae2a1f-c3eb-4ee1-ae8b-1be7257d5084	{"action":"token_revoked","actor_id":"09b793a3-8ac9-4fcb-8146-b4fee3a549cb","actor_username":"ggb-13@ufmg.br","actor_via_sso":false,"log_type":"token"}	2026-02-09 13:09:42.75817+00	
00000000-0000-0000-0000-000000000000	cb972937-d03c-4a5a-89fb-063035947f73	{"action":"login","actor_id":"09b793a3-8ac9-4fcb-8146-b4fee3a549cb","actor_username":"ggb-13@ufmg.br","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2026-02-09 13:13:03.703746+00	
00000000-0000-0000-0000-000000000000	c09a257a-2dae-4f5e-8d92-64f1ec1aef6f	{"action":"logout","actor_id":"09b793a3-8ac9-4fcb-8146-b4fee3a549cb","actor_username":"ggb-13@ufmg.br","actor_via_sso":false,"log_type":"account"}	2026-02-09 13:39:51.283842+00	
00000000-0000-0000-0000-000000000000	aa75b32f-4195-4a1f-8585-7f71d0d0d934	{"action":"login","actor_id":"09b793a3-8ac9-4fcb-8146-b4fee3a549cb","actor_username":"ggb-13@ufmg.br","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2026-02-09 13:40:04.843064+00	
00000000-0000-0000-0000-000000000000	a952d987-e94a-4151-a8b1-1bf92c2dc7db	{"action":"logout","actor_id":"09b793a3-8ac9-4fcb-8146-b4fee3a549cb","actor_username":"ggb-13@ufmg.br","actor_via_sso":false,"log_type":"account"}	2026-02-09 13:54:22.358591+00	
00000000-0000-0000-0000-000000000000	9b050f65-8a90-4653-b07e-d9567b7a1991	{"action":"login","actor_id":"09b793a3-8ac9-4fcb-8146-b4fee3a549cb","actor_username":"ggb-13@ufmg.br","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2026-02-09 13:54:47.160221+00	
00000000-0000-0000-0000-000000000000	a65da845-7f87-4981-b892-2164dc18c3c6	{"action":"login","actor_id":"09b793a3-8ac9-4fcb-8146-b4fee3a549cb","actor_username":"ggb-13@ufmg.br","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2026-02-09 14:06:40.189963+00	
00000000-0000-0000-0000-000000000000	1ab6dca7-26ac-4e85-9da8-9316f4c18f66	{"action":"logout","actor_id":"09b793a3-8ac9-4fcb-8146-b4fee3a549cb","actor_username":"ggb-13@ufmg.br","actor_via_sso":false,"log_type":"account"}	2026-02-09 14:06:58.204737+00	
00000000-0000-0000-0000-000000000000	4cf5ea7d-f4a7-4c39-be29-9752a83a4a4d	{"action":"login","actor_id":"09b793a3-8ac9-4fcb-8146-b4fee3a549cb","actor_username":"ggb-13@ufmg.br","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2026-02-09 14:07:05.699514+00	
00000000-0000-0000-0000-000000000000	caaca5e9-3d1a-4486-892e-599a9a05bf86	{"action":"logout","actor_id":"09b793a3-8ac9-4fcb-8146-b4fee3a549cb","actor_username":"ggb-13@ufmg.br","actor_via_sso":false,"log_type":"account"}	2026-02-09 14:23:53.330385+00	
00000000-0000-0000-0000-000000000000	9ba0588a-e06d-4b4d-b187-2482f7cecbff	{"action":"login","actor_id":"09b793a3-8ac9-4fcb-8146-b4fee3a549cb","actor_username":"ggb-13@ufmg.br","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2026-02-09 14:24:06.718374+00	
00000000-0000-0000-0000-000000000000	97d6b200-b552-4de7-a4c7-cada21ab83b9	{"action":"logout","actor_id":"09b793a3-8ac9-4fcb-8146-b4fee3a549cb","actor_username":"ggb-13@ufmg.br","actor_via_sso":false,"log_type":"account"}	2026-02-09 14:24:26.469194+00	
00000000-0000-0000-0000-000000000000	4d44a455-0968-43ee-9d7f-5515d2734439	{"action":"login","actor_id":"3c998c93-fee1-455f-b604-e948808aa5ad","actor_username":"ggoesbraga@gmail.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2026-02-09 14:28:12.732338+00	
00000000-0000-0000-0000-000000000000	135623da-2718-4d35-a74b-abd2e87384da	{"action":"logout","actor_id":"3c998c93-fee1-455f-b604-e948808aa5ad","actor_username":"ggoesbraga@gmail.com","actor_via_sso":false,"log_type":"account"}	2026-02-09 14:28:49.628312+00	
00000000-0000-0000-0000-000000000000	435051ff-0745-4f9c-8e2d-f4f685dabfe5	{"action":"login","actor_id":"3c998c93-fee1-455f-b604-e948808aa5ad","actor_username":"ggoesbraga@gmail.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2026-02-09 14:29:04.111429+00	
00000000-0000-0000-0000-000000000000	4ddf5f18-b423-468d-8b06-5f28272a2a05	{"action":"login","actor_id":"09b793a3-8ac9-4fcb-8146-b4fee3a549cb","actor_username":"ggb-13@ufmg.br","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2026-02-09 14:34:32.456683+00	
00000000-0000-0000-0000-000000000000	bdbdc934-8ac4-4603-9817-25b1f6ff627e	{"action":"logout","actor_id":"3c998c93-fee1-455f-b604-e948808aa5ad","actor_username":"ggoesbraga@gmail.com","actor_via_sso":false,"log_type":"account"}	2026-02-09 14:48:02.146665+00	
00000000-0000-0000-0000-000000000000	dbb97486-2448-4b20-9087-d66e52e82f5c	{"action":"login","actor_id":"09b793a3-8ac9-4fcb-8146-b4fee3a549cb","actor_username":"ggb-13@ufmg.br","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2026-02-09 14:48:09.988898+00	
00000000-0000-0000-0000-000000000000	b5d25b82-12a2-4bc1-ae2f-35787502ba49	{"action":"logout","actor_id":"09b793a3-8ac9-4fcb-8146-b4fee3a549cb","actor_username":"ggb-13@ufmg.br","actor_via_sso":false,"log_type":"account"}	2026-02-09 14:49:23.236722+00	
00000000-0000-0000-0000-000000000000	0bd8a67b-e707-4322-be94-b4635fb77564	{"action":"login","actor_id":"3c998c93-fee1-455f-b604-e948808aa5ad","actor_username":"ggoesbraga@gmail.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2026-02-09 14:49:32.332601+00	
00000000-0000-0000-0000-000000000000	45984272-b570-4596-91df-8e0795705478	{"action":"token_refreshed","actor_id":"3c998c93-fee1-455f-b604-e948808aa5ad","actor_username":"ggoesbraga@gmail.com","actor_via_sso":false,"log_type":"token"}	2026-02-09 16:19:52.126681+00	
00000000-0000-0000-0000-000000000000	c632dc6e-43ef-434a-b04f-a70dd7d00606	{"action":"token_revoked","actor_id":"3c998c93-fee1-455f-b604-e948808aa5ad","actor_username":"ggoesbraga@gmail.com","actor_via_sso":false,"log_type":"token"}	2026-02-09 16:19:52.12766+00	
00000000-0000-0000-0000-000000000000	7ec6ad86-2fc6-4174-ad7a-0dfc44ab9519	{"action":"login","actor_id":"09b793a3-8ac9-4fcb-8146-b4fee3a549cb","actor_username":"ggb-13@ufmg.br","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2026-02-09 17:13:01.115889+00	
00000000-0000-0000-0000-000000000000	57d5d3b3-9b1e-40f1-b0a7-e5727d26be72	{"action":"token_refreshed","actor_id":"09b793a3-8ac9-4fcb-8146-b4fee3a549cb","actor_username":"ggb-13@ufmg.br","actor_via_sso":false,"log_type":"token"}	2026-02-09 18:11:20.518746+00	
00000000-0000-0000-0000-000000000000	0371f403-f258-48c2-9360-9d762d347f94	{"action":"token_revoked","actor_id":"09b793a3-8ac9-4fcb-8146-b4fee3a549cb","actor_username":"ggb-13@ufmg.br","actor_via_sso":false,"log_type":"token"}	2026-02-09 18:11:20.519736+00	
00000000-0000-0000-0000-000000000000	a34cc45c-0caa-4244-99ae-5aecb6458a9d	{"action":"login","actor_id":"09b793a3-8ac9-4fcb-8146-b4fee3a549cb","actor_username":"ggb-13@ufmg.br","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2026-02-09 18:32:31.286452+00	
00000000-0000-0000-0000-000000000000	6e591e78-0982-4f3b-844a-477e7014e6cf	{"action":"token_refreshed","actor_id":"09b793a3-8ac9-4fcb-8146-b4fee3a549cb","actor_username":"ggb-13@ufmg.br","actor_via_sso":false,"log_type":"token"}	2026-02-09 19:30:49.548654+00	
00000000-0000-0000-0000-000000000000	46301d34-cd8c-4f71-aecb-842ba23d36ff	{"action":"token_revoked","actor_id":"09b793a3-8ac9-4fcb-8146-b4fee3a549cb","actor_username":"ggb-13@ufmg.br","actor_via_sso":false,"log_type":"token"}	2026-02-09 19:30:49.549607+00	
00000000-0000-0000-0000-000000000000	28695c7b-7231-4568-8b89-73f62bc2bebb	{"action":"login","actor_id":"3c998c93-fee1-455f-b604-e948808aa5ad","actor_username":"ggoesbraga@gmail.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2026-02-23 23:20:39.294664+00	
00000000-0000-0000-0000-000000000000	2261b8e4-4721-4592-9780-f0c116a765b9	{"action":"token_refreshed","actor_id":"3c998c93-fee1-455f-b604-e948808aa5ad","actor_username":"ggoesbraga@gmail.com","actor_via_sso":false,"log_type":"token"}	2026-03-27 12:00:10.081262+00	
00000000-0000-0000-0000-000000000000	97104b30-5203-4457-ae09-8b6fb8c91581	{"action":"token_revoked","actor_id":"3c998c93-fee1-455f-b604-e948808aa5ad","actor_username":"ggoesbraga@gmail.com","actor_via_sso":false,"log_type":"token"}	2026-03-27 12:00:10.430441+00	
00000000-0000-0000-0000-000000000000	09b1b9ae-2c3d-446a-bd3b-10cc19e6769c	{"action":"logout","actor_id":"3c998c93-fee1-455f-b604-e948808aa5ad","actor_username":"ggoesbraga@gmail.com","actor_via_sso":false,"log_type":"account"}	2026-03-27 12:11:21.751452+00	
00000000-0000-0000-0000-000000000000	36671e97-ae32-45fd-8492-5fafaa109567	{"action":"login","actor_id":"09b793a3-8ac9-4fcb-8146-b4fee3a549cb","actor_username":"ggb-13@ufmg.br","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2026-03-27 12:11:56.356663+00	
00000000-0000-0000-0000-000000000000	d82f8170-0ae2-49a7-8739-3fca32afcb5b	{"action":"token_refreshed","actor_id":"09b793a3-8ac9-4fcb-8146-b4fee3a549cb","actor_username":"ggb-13@ufmg.br","actor_via_sso":false,"log_type":"token"}	2026-03-27 12:20:07.235656+00	
00000000-0000-0000-0000-000000000000	c143dc03-c6bb-4115-b69f-770c8f3cf48a	{"action":"token_revoked","actor_id":"09b793a3-8ac9-4fcb-8146-b4fee3a549cb","actor_username":"ggb-13@ufmg.br","actor_via_sso":false,"log_type":"token"}	2026-03-27 12:20:07.23679+00	
00000000-0000-0000-0000-000000000000	88c43dbc-5762-4ad7-ac9a-e073ffde73d1	{"action":"logout","actor_id":"09b793a3-8ac9-4fcb-8146-b4fee3a549cb","actor_username":"ggb-13@ufmg.br","actor_via_sso":false,"log_type":"account"}	2026-03-27 12:39:01.124985+00	
00000000-0000-0000-0000-000000000000	86f02d92-6a8d-44bf-97d5-961df26a42b0	{"action":"login","actor_id":"09b793a3-8ac9-4fcb-8146-b4fee3a549cb","actor_username":"ggb-13@ufmg.br","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2026-03-27 12:41:35.547042+00	
00000000-0000-0000-0000-000000000000	2f9edc5f-a6b8-4d3a-bc53-5ada8101a996	{"action":"login","actor_id":"09b793a3-8ac9-4fcb-8146-b4fee3a549cb","actor_username":"ggb-13@ufmg.br","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2026-03-27 12:49:27.493693+00	
00000000-0000-0000-0000-000000000000	e0aa7bb4-7c03-4816-9bed-82163b3398f0	{"action":"login","actor_id":"09b793a3-8ac9-4fcb-8146-b4fee3a549cb","actor_username":"ggb-13@ufmg.br","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2026-03-27 12:51:10.360411+00	
00000000-0000-0000-0000-000000000000	40681f0d-8526-4a01-9c63-8fb450db83fe	{"action":"login","actor_id":"09b793a3-8ac9-4fcb-8146-b4fee3a549cb","actor_username":"ggb-13@ufmg.br","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2026-03-27 13:00:47.912677+00	
00000000-0000-0000-0000-000000000000	bdfea203-cd79-425c-a398-1bcbef46b5c0	{"action":"token_refreshed","actor_id":"09b793a3-8ac9-4fcb-8146-b4fee3a549cb","actor_username":"ggb-13@ufmg.br","actor_via_sso":false,"log_type":"token"}	2026-03-27 16:41:46.345094+00	
00000000-0000-0000-0000-000000000000	04fea422-00e6-4a96-a327-b490e29b82ea	{"action":"token_revoked","actor_id":"09b793a3-8ac9-4fcb-8146-b4fee3a549cb","actor_username":"ggb-13@ufmg.br","actor_via_sso":false,"log_type":"token"}	2026-03-27 16:41:46.450826+00	
00000000-0000-0000-0000-000000000000	9a354447-c49a-4d30-a097-faffd0639a25	{"action":"token_refreshed","actor_id":"09b793a3-8ac9-4fcb-8146-b4fee3a549cb","actor_username":"ggb-13@ufmg.br","actor_via_sso":false,"log_type":"token"}	2026-03-27 17:51:40.522848+00	
00000000-0000-0000-0000-000000000000	3e1481fd-da00-40bb-8ad7-2bb524721774	{"action":"token_revoked","actor_id":"09b793a3-8ac9-4fcb-8146-b4fee3a549cb","actor_username":"ggb-13@ufmg.br","actor_via_sso":false,"log_type":"token"}	2026-03-27 17:51:40.524031+00	
\.


--
-- Data for Name: flow_state; Type: TABLE DATA; Schema: auth; Owner: supabase_auth_admin
--

COPY auth.flow_state (id, user_id, auth_code, code_challenge_method, code_challenge, provider_type, provider_access_token, provider_refresh_token, created_at, updated_at, authentication_method, auth_code_issued_at) FROM stdin;
\.


--
-- Data for Name: identities; Type: TABLE DATA; Schema: auth; Owner: supabase_auth_admin
--

COPY auth.identities (provider_id, user_id, identity_data, provider, last_sign_in_at, created_at, updated_at, id) FROM stdin;
09b793a3-8ac9-4fcb-8146-b4fee3a549cb	09b793a3-8ac9-4fcb-8146-b4fee3a549cb	{"sub": "09b793a3-8ac9-4fcb-8146-b4fee3a549cb", "nome": "Gabriel Braga ", "email": "ggb-13@ufmg.br", "email_verified": false, "phone_verified": false}	email	2026-01-26 14:53:39.487633+00	2026-01-26 14:53:39.48768+00	2026-01-26 14:53:39.48768+00	a9f5b4c1-e62d-4544-b4b0-d6b0c1caf943
bd02dbb1-1b0a-4ae8-8f20-302c1ee36640	bd02dbb1-1b0a-4ae8-8f20-302c1ee36640	{"sub": "bd02dbb1-1b0a-4ae8-8f20-302c1ee36640", "nome": "Fernando Braga", "email": "fgb80@yahoo.com.br", "email_verified": false, "phone_verified": false}	email	2026-01-26 18:19:38.121658+00	2026-01-26 18:19:38.121757+00	2026-01-26 18:19:38.121757+00	982f5dac-1aea-4593-a7df-11eb4d93ed99
3c998c93-fee1-455f-b604-e948808aa5ad	3c998c93-fee1-455f-b604-e948808aa5ad	{"sub": "3c998c93-fee1-455f-b604-e948808aa5ad", "nome": "Artur", "email": "ggoesbraga@gmail.com", "email_verified": false, "phone_verified": false}	email	2026-01-26 19:53:28.141577+00	2026-01-26 19:53:28.141626+00	2026-01-26 19:53:28.141626+00	cc01bbd1-ef24-47db-bc5c-e39e2ed6bbd8
\.


--
-- Data for Name: instances; Type: TABLE DATA; Schema: auth; Owner: supabase_auth_admin
--

COPY auth.instances (id, uuid, raw_base_config, created_at, updated_at) FROM stdin;
\.


--
-- Data for Name: mfa_amr_claims; Type: TABLE DATA; Schema: auth; Owner: supabase_auth_admin
--

COPY auth.mfa_amr_claims (session_id, created_at, updated_at, authentication_method, id) FROM stdin;
4e6c8e11-5dd3-4a58-9375-200c0b93c4e4	2026-01-26 20:15:53.502664+00	2026-01-26 20:15:53.502664+00	password	6838626a-6f2b-4a9f-ab03-bd406c2e58a6
03c88a0d-8336-448d-b7ca-d66c2ab3ea1e	2026-03-27 12:41:35.55132+00	2026-03-27 12:41:35.55132+00	password	af674168-84e9-4783-a31e-c1f4234a3bcc
e2a9f518-01e0-4e42-8d77-788952c121e5	2026-03-27 12:49:27.498968+00	2026-03-27 12:49:27.498968+00	password	6e27374b-68e2-4810-a748-c8247d081bbc
c6f60f19-22ce-43b0-ab43-3eeec2a99da1	2026-03-27 12:51:10.3643+00	2026-03-27 12:51:10.3643+00	password	95c9c26f-9259-40e2-9e23-7a039eda3978
feaca6f5-5536-40b7-8815-ce5518792cd2	2026-03-27 13:00:47.915033+00	2026-03-27 13:00:47.915033+00	password	3eb95654-04fa-40ee-82d9-1fe292bb20e0
\.


--
-- Data for Name: mfa_challenges; Type: TABLE DATA; Schema: auth; Owner: supabase_auth_admin
--

COPY auth.mfa_challenges (id, factor_id, created_at, verified_at, ip_address, otp_code, web_authn_session_data) FROM stdin;
\.


--
-- Data for Name: mfa_factors; Type: TABLE DATA; Schema: auth; Owner: supabase_auth_admin
--

COPY auth.mfa_factors (id, user_id, friendly_name, factor_type, status, created_at, updated_at, secret, phone, last_challenged_at, web_authn_credential, web_authn_aaguid) FROM stdin;
\.


--
-- Data for Name: oauth_authorizations; Type: TABLE DATA; Schema: auth; Owner: supabase_auth_admin
--

COPY auth.oauth_authorizations (id, authorization_id, client_id, user_id, redirect_uri, scope, state, resource, code_challenge, code_challenge_method, response_type, status, authorization_code, created_at, expires_at, approved_at) FROM stdin;
\.


--
-- Data for Name: oauth_clients; Type: TABLE DATA; Schema: auth; Owner: supabase_auth_admin
--

COPY auth.oauth_clients (id, client_secret_hash, registration_type, redirect_uris, grant_types, client_name, client_uri, logo_uri, created_at, updated_at, deleted_at, client_type) FROM stdin;
\.


--
-- Data for Name: oauth_consents; Type: TABLE DATA; Schema: auth; Owner: supabase_auth_admin
--

COPY auth.oauth_consents (id, user_id, client_id, scopes, granted_at, revoked_at) FROM stdin;
\.


--
-- Data for Name: one_time_tokens; Type: TABLE DATA; Schema: auth; Owner: supabase_auth_admin
--

COPY auth.one_time_tokens (id, user_id, token_type, token_hash, relates_to, created_at, updated_at) FROM stdin;
\.


--
-- Data for Name: refresh_tokens; Type: TABLE DATA; Schema: auth; Owner: supabase_auth_admin
--

COPY auth.refresh_tokens (instance_id, id, token, user_id, revoked, created_at, updated_at, parent, session_id) FROM stdin;
00000000-0000-0000-0000-000000000000	163	oqzanestve34	bd02dbb1-1b0a-4ae8-8f20-302c1ee36640	f	2026-01-26 20:15:53.501661+00	2026-01-26 20:15:53.501661+00	\N	4e6c8e11-5dd3-4a58-9375-200c0b93c4e4
00000000-0000-0000-0000-000000000000	230	ztnch633uqmd	09b793a3-8ac9-4fcb-8146-b4fee3a549cb	f	2026-03-27 12:41:35.549148+00	2026-03-27 12:41:35.549148+00	\N	03c88a0d-8336-448d-b7ca-d66c2ab3ea1e
00000000-0000-0000-0000-000000000000	232	5gwx5wyculse	09b793a3-8ac9-4fcb-8146-b4fee3a549cb	f	2026-03-27 12:51:10.362404+00	2026-03-27 12:51:10.362404+00	\N	c6f60f19-22ce-43b0-ab43-3eeec2a99da1
00000000-0000-0000-0000-000000000000	233	akcp6k7e7f5z	09b793a3-8ac9-4fcb-8146-b4fee3a549cb	f	2026-03-27 13:00:47.914172+00	2026-03-27 13:00:47.914172+00	\N	feaca6f5-5536-40b7-8815-ce5518792cd2
00000000-0000-0000-0000-000000000000	231	7sextdfrj5ea	09b793a3-8ac9-4fcb-8146-b4fee3a549cb	t	2026-03-27 12:49:27.496557+00	2026-03-27 16:41:46.452215+00	\N	e2a9f518-01e0-4e42-8d77-788952c121e5
00000000-0000-0000-0000-000000000000	234	d5rzgo3w5dzj	09b793a3-8ac9-4fcb-8146-b4fee3a549cb	t	2026-03-27 16:41:46.453644+00	2026-03-27 17:51:40.52495+00	7sextdfrj5ea	e2a9f518-01e0-4e42-8d77-788952c121e5
00000000-0000-0000-0000-000000000000	235	7fdp33brvmvd	09b793a3-8ac9-4fcb-8146-b4fee3a549cb	f	2026-03-27 17:51:40.525537+00	2026-03-27 17:51:40.525537+00	d5rzgo3w5dzj	e2a9f518-01e0-4e42-8d77-788952c121e5
\.


--
-- Data for Name: saml_providers; Type: TABLE DATA; Schema: auth; Owner: supabase_auth_admin
--

COPY auth.saml_providers (id, sso_provider_id, entity_id, metadata_xml, metadata_url, attribute_mapping, created_at, updated_at, name_id_format) FROM stdin;
\.


--
-- Data for Name: saml_relay_states; Type: TABLE DATA; Schema: auth; Owner: supabase_auth_admin
--

COPY auth.saml_relay_states (id, sso_provider_id, request_id, for_email, redirect_to, created_at, updated_at, flow_state_id) FROM stdin;
\.


--
-- Data for Name: schema_migrations; Type: TABLE DATA; Schema: auth; Owner: supabase_auth_admin
--

COPY auth.schema_migrations (version) FROM stdin;
20171026211738
20171026211808
20171026211834
20180103212743
20180108183307
20180119214651
20180125194653
00
20210710035447
20210722035447
20210730183235
20210909172000
20210927181326
20211122151130
20211124214934
20211202183645
20220114185221
20220114185340
20220224000811
20220323170000
20220429102000
20220531120530
20220614074223
20220811173540
20221003041349
20221003041400
20221011041400
20221020193600
20221021073300
20221021082433
20221027105023
20221114143122
20221114143410
20221125140132
20221208132122
20221215195500
20221215195800
20221215195900
20230116124310
20230116124412
20230131181311
20230322519590
20230402418590
20230411005111
20230508135423
20230523124323
20230818113222
20230914180801
20231027141322
20231114161723
20231117164230
20240115144230
20240214120130
20240306115329
20240314092811
20240427152123
20240612123726
20240729123726
20240802193726
20240806073726
20241009103726
20250717082212
20250731150234
20250804100000
20250901200500
20250903112500
20250904133000
\.


--
-- Data for Name: sessions; Type: TABLE DATA; Schema: auth; Owner: supabase_auth_admin
--

COPY auth.sessions (id, user_id, created_at, updated_at, factor_id, aal, not_after, refreshed_at, user_agent, ip, tag, oauth_client_id) FROM stdin;
4e6c8e11-5dd3-4a58-9375-200c0b93c4e4	bd02dbb1-1b0a-4ae8-8f20-302c1ee36640	2026-01-26 20:15:53.500987+00	2026-01-26 20:15:53.500987+00	\N	aal1	\N	\N	okhttp/4.12.0	150.164.236.120	\N	\N
03c88a0d-8336-448d-b7ca-d66c2ab3ea1e	09b793a3-8ac9-4fcb-8146-b4fee3a549cb	2026-03-27 12:41:35.548084+00	2026-03-27 12:41:35.548084+00	\N	aal1	\N	\N	okhttp/4.12.0	150.164.234.48	\N	\N
c6f60f19-22ce-43b0-ab43-3eeec2a99da1	09b793a3-8ac9-4fcb-8146-b4fee3a549cb	2026-03-27 12:51:10.361227+00	2026-03-27 12:51:10.361227+00	\N	aal1	\N	\N	okhttp/4.12.0	150.164.234.48	\N	\N
feaca6f5-5536-40b7-8815-ce5518792cd2	09b793a3-8ac9-4fcb-8146-b4fee3a549cb	2026-03-27 13:00:47.913538+00	2026-03-27 13:00:47.913538+00	\N	aal1	\N	\N	okhttp/4.12.0	150.164.234.48	\N	\N
e2a9f518-01e0-4e42-8d77-788952c121e5	09b793a3-8ac9-4fcb-8146-b4fee3a549cb	2026-03-27 12:49:27.495093+00	2026-03-27 17:51:40.528892+00	\N	aal1	\N	2026-03-27 17:51:40.528757	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/146.0.0.0 Safari/537.36	200.238.220.197	\N	\N
\.


--
-- Data for Name: sso_domains; Type: TABLE DATA; Schema: auth; Owner: supabase_auth_admin
--

COPY auth.sso_domains (id, sso_provider_id, domain, created_at, updated_at) FROM stdin;
\.


--
-- Data for Name: sso_providers; Type: TABLE DATA; Schema: auth; Owner: supabase_auth_admin
--

COPY auth.sso_providers (id, resource_id, created_at, updated_at, disabled) FROM stdin;
\.


--
-- Data for Name: users; Type: TABLE DATA; Schema: auth; Owner: supabase_auth_admin
--

COPY auth.users (instance_id, id, aud, role, email, encrypted_password, email_confirmed_at, invited_at, confirmation_token, confirmation_sent_at, recovery_token, recovery_sent_at, email_change_token_new, email_change, email_change_sent_at, last_sign_in_at, raw_app_meta_data, raw_user_meta_data, is_super_admin, created_at, updated_at, phone, phone_confirmed_at, phone_change, phone_change_token, phone_change_sent_at, email_change_token_current, email_change_confirm_status, banned_until, reauthentication_token, reauthentication_sent_at, is_sso_user, deleted_at, is_anonymous) FROM stdin;
00000000-0000-0000-0000-000000000000	bd02dbb1-1b0a-4ae8-8f20-302c1ee36640	authenticated	authenticated	fgb80@yahoo.com.br	$2a$10$TnuoGiVvYIDeIP9r2YSf5uNxCoEKS40xroVlFZ7d9gTGxXGSYXwVu	2026-01-26 18:19:38.126474+00	\N		\N		\N			\N	2026-01-26 20:15:53.50089+00	{"provider": "email", "providers": ["email"]}	{"sub": "bd02dbb1-1b0a-4ae8-8f20-302c1ee36640", "nome": "Fernando Braga", "email": "fgb80@yahoo.com.br", "email_verified": true, "phone_verified": false}	\N	2026-01-26 18:19:38.097747+00	2026-01-26 20:15:53.502382+00	\N	\N			\N		0	\N		\N	f	\N	f
00000000-0000-0000-0000-000000000000	09b793a3-8ac9-4fcb-8146-b4fee3a549cb	authenticated	authenticated	ggb-13@ufmg.br	$2a$10$OvMxkKpS88D5WsjsOA4H2OQ9EA9PXh7JmuZEB3VCbO2uW0aLcGqem	2026-01-26 14:53:39.490246+00	\N		\N		\N			\N	2026-03-27 13:00:47.913451+00	{"provider": "email", "providers": ["email"]}	{"sub": "09b793a3-8ac9-4fcb-8146-b4fee3a549cb", "nome": "Gabriel Braga ", "email": "ggb-13@ufmg.br", "email_verified": true, "phone_verified": false}	\N	2026-01-26 14:53:39.484802+00	2026-03-27 17:51:40.527156+00	\N	\N			\N		0	\N		\N	f	\N	f
00000000-0000-0000-0000-000000000000	3c998c93-fee1-455f-b604-e948808aa5ad	authenticated	authenticated	ggoesbraga@gmail.com	$2a$10$ABJdr..DN3wNKjsrbd45E.TZBcotdn1kzTdwYvbwcRSDMHJa2shMC	2026-01-26 19:53:28.143855+00	\N		\N		\N			\N	2026-02-23 23:20:39.381511+00	{"provider": "email", "providers": ["email"]}	{"sub": "3c998c93-fee1-455f-b604-e948808aa5ad", "nome": "Artur", "email": "ggoesbraga@gmail.com", "email_verified": true, "phone_verified": false}	\N	2026-01-26 19:53:28.138183+00	2026-03-27 12:00:10.676588+00	\N	\N			\N		0	\N		\N	f	\N	f
\.


--
-- Data for Name: patrimonios; Type: TABLE DATA; Schema: public; Owner: supabase_admin
--

COPY public.patrimonios (id, "patNum", "atmNum", descricao, valor, conservacao, sala, "lastEditedBy", "lastEditedAt", image, owner_id) FROM stdin;
16	012345678-9		Computador	Lorem Ipsum	Ocioso	Lorem Ipsum	ggb-13@ufmg.br	2026-01-27T17:03:23.483Z	{"width": 300, "height": 210, "fileName": "patPhotos/1769533402169.jpg"}	09b793a3-8ac9-4fcb-8146-b4fee3a549cb
18	000199923-1		Computador	10	Bom	2311	ggoesbraga@gmail.com	2026-03-27T12:10:40.429Z	{"width": 168.8235294117647, "height": 300, "fileName": "patPhotos/1774613439287.jpg"}	09b793a3-8ac9-4fcb-8146-b4fee3a549cb
\.


--
-- Data for Name: permissoes; Type: TABLE DATA; Schema: public; Owner: supabase_admin
--

COPY public.permissoes (id, user_id, owner_id, patrimonio_id, created_at) FROM stdin;
3	bd02dbb1-1b0a-4ae8-8f20-302c1ee36640	09b793a3-8ac9-4fcb-8146-b4fee3a549cb	16	2026-02-05 20:08:36.700097+00
4	3c998c93-fee1-455f-b604-e948808aa5ad	09b793a3-8ac9-4fcb-8146-b4fee3a549cb	18	2026-03-27 12:10:40.577274+00
\.


--
-- Data for Name: profiles; Type: TABLE DATA; Schema: public; Owner: supabase_admin
--

COPY public.profiles (id, email, full_name, created_at) FROM stdin;
09b793a3-8ac9-4fcb-8146-b4fee3a549cb	ggb-13@ufmg.br	Gabriel Braga 	2026-01-26 14:53:39.484453+00
\.


--
-- Data for Name: messages_2026_03_26; Type: TABLE DATA; Schema: realtime; Owner: supabase_admin
--

COPY realtime.messages_2026_03_26 (topic, extension, payload, event, private, updated_at, inserted_at, id) FROM stdin;
\.


--
-- Data for Name: messages_2026_03_27; Type: TABLE DATA; Schema: realtime; Owner: supabase_admin
--

COPY realtime.messages_2026_03_27 (topic, extension, payload, event, private, updated_at, inserted_at, id) FROM stdin;
\.


--
-- Data for Name: messages_2026_03_28; Type: TABLE DATA; Schema: realtime; Owner: supabase_admin
--

COPY realtime.messages_2026_03_28 (topic, extension, payload, event, private, updated_at, inserted_at, id) FROM stdin;
\.


--
-- Data for Name: messages_2026_03_29; Type: TABLE DATA; Schema: realtime; Owner: supabase_admin
--

COPY realtime.messages_2026_03_29 (topic, extension, payload, event, private, updated_at, inserted_at, id) FROM stdin;
\.


--
-- Data for Name: messages_2026_03_30; Type: TABLE DATA; Schema: realtime; Owner: supabase_admin
--

COPY realtime.messages_2026_03_30 (topic, extension, payload, event, private, updated_at, inserted_at, id) FROM stdin;
\.


--
-- Data for Name: schema_migrations; Type: TABLE DATA; Schema: realtime; Owner: supabase_admin
--

COPY realtime.schema_migrations (version, inserted_at) FROM stdin;
20211116024918	2025-10-10 18:33:44
20211116045059	2025-10-10 18:33:44
20211116050929	2025-10-10 18:33:44
20211116051442	2025-10-10 18:33:44
20211116212300	2025-10-10 18:33:44
20211116213355	2025-10-10 18:33:45
20211116213934	2025-10-10 18:33:45
20211116214523	2025-10-10 18:33:45
20211122062447	2025-10-10 18:33:45
20211124070109	2025-10-10 18:33:45
20211202204204	2025-10-10 18:33:45
20211202204605	2025-10-10 18:33:45
20211210212804	2025-10-10 18:33:46
20211228014915	2025-10-10 18:33:46
20220107221237	2025-10-10 18:33:46
20220228202821	2025-10-10 18:33:46
20220312004840	2025-10-10 18:33:46
20220603231003	2025-10-10 18:33:46
20220603232444	2025-10-10 18:33:47
20220615214548	2025-10-10 18:33:47
20220712093339	2025-10-10 18:33:47
20220908172859	2025-10-10 18:33:47
20220916233421	2025-10-10 18:33:47
20230119133233	2025-10-10 18:33:47
20230128025114	2025-10-10 18:33:47
20230128025212	2025-10-10 18:33:47
20230227211149	2025-10-10 18:33:47
20230228184745	2025-10-10 18:33:47
20230308225145	2025-10-10 18:33:47
20230328144023	2025-10-10 18:33:47
20231018144023	2025-10-10 18:33:48
20231204144023	2025-10-10 18:33:48
20231204144024	2025-10-10 18:33:48
20231204144025	2025-10-10 18:33:48
20240108234812	2025-10-10 18:33:48
20240109165339	2025-10-10 18:33:48
20240227174441	2025-10-10 18:33:48
20240311171622	2025-10-10 18:33:48
20240321100241	2025-10-10 18:33:49
20240401105812	2025-10-10 18:33:49
20240418121054	2025-10-10 18:33:49
20240523004032	2025-10-10 18:33:50
20240618124746	2025-10-10 18:33:50
20240801235015	2025-10-10 18:33:50
20240805133720	2025-10-10 18:33:50
20240827160934	2025-10-10 18:33:50
20240919163303	2025-10-10 18:33:50
20240919163305	2025-10-10 18:33:50
20241019105805	2025-10-10 18:33:50
20241030150047	2025-10-10 18:33:50
20241108114728	2025-10-10 18:33:50
20241121104152	2025-10-10 18:33:50
20241130184212	2025-10-10 18:33:50
20241220035512	2025-10-10 18:33:50
20241220123912	2025-10-10 18:33:50
20241224161212	2025-10-10 18:33:51
20250107150512	2025-10-10 18:33:51
20250110162412	2025-10-10 18:33:51
20250123174212	2025-10-10 18:33:51
20250128220012	2025-10-10 18:33:51
20250506224012	2025-10-10 18:33:52
20250523164012	2025-10-10 18:33:52
20250714121412	2025-10-10 18:33:52
20250905041441	2025-10-10 18:33:52
\.


--
-- Data for Name: subscription; Type: TABLE DATA; Schema: realtime; Owner: supabase_admin
--

COPY realtime.subscription (id, subscription_id, entity, filters, claims, created_at) FROM stdin;
\.


--
-- Data for Name: buckets; Type: TABLE DATA; Schema: storage; Owner: supabase_storage_admin
--

COPY storage.buckets (id, name, owner, created_at, updated_at, public, avif_autodetection, file_size_limit, allowed_mime_types, owner_id, type) FROM stdin;
images	images	\N	2025-11-05 17:44:43.576602+00	2025-11-05 17:44:43.576602+00	t	f	\N	\N	\N	STANDARD
\.


--
-- Data for Name: buckets_analytics; Type: TABLE DATA; Schema: storage; Owner: supabase_storage_admin
--

COPY storage.buckets_analytics (id, type, format, created_at, updated_at) FROM stdin;
\.


--
-- Data for Name: iceberg_namespaces; Type: TABLE DATA; Schema: storage; Owner: supabase_storage_admin
--

COPY storage.iceberg_namespaces (id, bucket_id, name, created_at, updated_at) FROM stdin;
\.


--
-- Data for Name: iceberg_tables; Type: TABLE DATA; Schema: storage; Owner: supabase_storage_admin
--

COPY storage.iceberg_tables (id, namespace_id, bucket_id, name, location, created_at, updated_at) FROM stdin;
\.


--
-- Data for Name: migrations; Type: TABLE DATA; Schema: storage; Owner: supabase_storage_admin
--

COPY storage.migrations (id, name, hash, executed_at) FROM stdin;
0	create-migrations-table	e18db593bcde2aca2a408c4d1100f6abba2195df	2025-10-10 18:33:19.578274
1	initialmigration	6ab16121fbaa08bbd11b712d05f358f9b555d777	2025-10-10 18:33:19.718503
2	storage-schema	5c7968fd083fcea04050c1b7f6253c9771b99011	2025-10-10 18:33:19.932901
3	pathtoken-column	2cb1b0004b817b29d5b0a971af16bafeede4b70d	2025-10-10 18:33:20.218615
4	add-migrations-rls	427c5b63fe1c5937495d9c635c263ee7a5905058	2025-10-10 18:33:22.156435
5	add-size-functions	79e081a1455b63666c1294a440f8ad4b1e6a7f84	2025-10-10 18:33:22.502245
6	change-column-name-in-get-size	f93f62afdf6613ee5e7e815b30d02dc990201044	2025-10-10 18:33:22.769041
7	add-rls-to-buckets	e7e7f86adbc51049f341dfe8d30256c1abca17aa	2025-10-10 18:33:23.019296
8	add-public-to-buckets	fd670db39ed65f9d08b01db09d6202503ca2bab3	2025-10-10 18:33:23.316738
9	fix-search-function	3a0af29f42e35a4d101c259ed955b67e1bee6825	2025-10-10 18:33:23.649898
10	search-files-search-function	68dc14822daad0ffac3746a502234f486182ef6e	2025-10-10 18:33:23.950072
11	add-trigger-to-auto-update-updated_at-column	7425bdb14366d1739fa8a18c83100636d74dcaa2	2025-10-10 18:33:24.236325
12	add-automatic-avif-detection-flag	8e92e1266eb29518b6a4c5313ab8f29dd0d08df9	2025-10-10 18:33:24.407832
13	add-bucket-custom-limits	cce962054138135cd9a8c4bcd531598684b25e7d	2025-10-10 18:33:24.549772
14	use-bytes-for-max-size	941c41b346f9802b411f06f30e972ad4744dad27	2025-10-10 18:33:24.740733
15	add-can-insert-object-function	934146bc38ead475f4ef4b555c524ee5d66799e5	2025-10-10 18:33:25.840745
16	add-version	76debf38d3fd07dcfc747ca49096457d95b1221b	2025-10-10 18:33:26.064774
17	drop-owner-foreign-key	f1cbb288f1b7a4c1eb8c38504b80ae2a0153d101	2025-10-10 18:33:26.198072
18	add_owner_id_column_deprecate_owner	e7a511b379110b08e2f214be852c35414749fe66	2025-10-10 18:33:26.419859
19	alter-default-value-objects-id	02e5e22a78626187e00d173dc45f58fa66a4f043	2025-10-10 18:33:26.599077
20	list-objects-with-delimiter	cd694ae708e51ba82bf012bba00caf4f3b6393b7	2025-10-10 18:33:26.79089
21	s3-multipart-uploads	8c804d4a566c40cd1e4cc5b3725a664a9303657f	2025-10-10 18:33:27.300292
22	s3-multipart-uploads-big-ints	9737dc258d2397953c9953d9b86920b8be0cdb73	2025-10-10 18:33:29.11524
23	optimize-search-function	9d7e604cddc4b56a5422dc68c9313f4a1b6f132c	2025-10-10 18:33:31.54744
24	operation-function	8312e37c2bf9e76bbe841aa5fda889206d2bf8aa	2025-10-10 18:33:31.779949
25	custom-metadata	d974c6057c3db1c1f847afa0e291e6165693b990	2025-10-10 18:33:32.311958
26	objects-prefixes	ef3f7871121cdc47a65308e6702519e853422ae2	2025-10-10 18:33:32.664839
27	search-v2	33b8f2a7ae53105f028e13e9fcda9dc4f356b4a2	2025-10-10 18:33:33.361773
28	object-bucket-name-sorting	ba85ec41b62c6a30a3f136788227ee47f311c436	2025-10-10 18:33:50.041916
29	create-prefixes	a7b1a22c0dc3ab630e3055bfec7ce7d2045c5b7b	2025-10-10 18:33:50.082811
30	update-object-levels	6c6f6cc9430d570f26284a24cf7b210599032db7	2025-10-10 18:33:50.099124
31	objects-level-index	33f1fef7ec7fea08bb892222f4f0f5d79bab5eb8	2025-10-10 18:33:50.294536
32	backward-compatible-index-on-objects	2d51eeb437a96868b36fcdfb1ddefdf13bef1647	2025-10-10 18:33:50.528477
33	backward-compatible-index-on-prefixes	fe473390e1b8c407434c0e470655945b110507bf	2025-10-10 18:33:50.894849
34	optimize-search-function-v1	82b0e469a00e8ebce495e29bfa70a0797f7ebd2c	2025-10-10 18:33:51.002979
35	add-insert-trigger-prefixes	63bb9fd05deb3dc5e9fa66c83e82b152f0caf589	2025-10-10 18:33:51.623885
36	optimise-existing-functions	81cf92eb0c36612865a18016a38496c530443899	2025-10-10 18:33:51.719504
37	add-bucket-name-length-trigger	3944135b4e3e8b22d6d4cbb568fe3b0b51df15c1	2025-10-10 18:33:51.802746
38	iceberg-catalog-flag-on-buckets	19a8bd89d5dfa69af7f222a46c726b7c41e462c5	2025-10-10 18:33:51.886161
39	add-search-v2-sort-support	39cf7d1e6bf515f4b02e41237aba845a7b492853	2025-10-10 18:33:52.866596
40	fix-prefix-race-conditions-optimized	fd02297e1c67df25a9fc110bf8c8a9af7fb06d1f	2025-10-10 18:33:52.94216
41	add-object-level-update-trigger	44c22478bf01744b2129efc480cd2edc9a7d60e9	2025-10-10 18:33:53.020007
42	rollback-prefix-triggers	f2ab4f526ab7f979541082992593938c05ee4b47	2025-10-10 18:33:53.128508
43	fix-object-level	ab837ad8f1c7d00cc0b7310e989a23388ff29fc6	2025-10-10 18:33:53.217091
\.


--
-- Data for Name: objects; Type: TABLE DATA; Schema: storage; Owner: supabase_storage_admin
--

COPY storage.objects (id, bucket_id, name, owner, created_at, updated_at, last_accessed_at, metadata, version, owner_id, user_metadata, level) FROM stdin;
7dbe2f34-e561-43bc-a674-3baf5f5c5fce	images	patPhotos/1762369489505.jpg	669799ca-69cf-492f-a72f-0b7853e8fc37	2025-11-05 19:04:50.074419+00	2025-11-05 19:04:50.074419+00	2025-11-05 19:04:50.074419+00	{"eTag": "\\"f4389c60de76ee40159c3c3f1319bea2\\"", "size": 41273, "mimetype": "image/jpeg", "cacheControl": "max-age=3600", "lastModified": "2025-11-05T19:04:50.070Z", "contentLength": 41273, "httpStatusCode": 200}	14cab7f2-94ed-484e-bacb-395bbaec7ce6	669799ca-69cf-492f-a72f-0b7853e8fc37	{}	2
c0e5a69c-8068-4c73-a22f-bcdead66746b	images	patPhotos/1764067664996.jpg	22ec4f28-e2cf-486e-b34f-54bdf4e8579d	2025-11-25 10:47:44.939901+00	2025-11-25 10:47:44.939901+00	2025-11-25 10:47:44.939901+00	{"eTag": "\\"107f2245d3d0c9980617ec2df268691d\\"", "size": 83376, "mimetype": "image/jpeg", "cacheControl": "max-age=3600", "lastModified": "2025-11-25T10:47:44.926Z", "contentLength": 83376, "httpStatusCode": 200}	0cbb0c29-eb56-40f2-b0a3-c7e51d2d08fc	22ec4f28-e2cf-486e-b34f-54bdf4e8579d	{}	2
bcfd3921-7aa8-4f7e-b70f-cce7919e5a87	images	patPhotos/1769451717672.jpg	09b793a3-8ac9-4fcb-8146-b4fee3a549cb	2026-01-26 18:22:00.538222+00	2026-01-26 18:22:00.538222+00	2026-01-26 18:22:00.538222+00	{"eTag": "\\"529bd308c84f02163dad206acf365efc\\"", "size": 127672, "mimetype": "image/jpeg", "cacheControl": "max-age=3600", "lastModified": "2026-01-26T18:22:00.337Z", "contentLength": 127672, "httpStatusCode": 200}	96dd2fe7-8da8-4941-a499-77a96ab36429	09b793a3-8ac9-4fcb-8146-b4fee3a549cb	{}	2
bdb07bc6-1a3c-40c3-821b-f71fac68dd05	images	patPhotos/1769453254575.jpg	09b793a3-8ac9-4fcb-8146-b4fee3a549cb	2026-01-26 18:47:35.15375+00	2026-01-26 18:47:35.15375+00	2026-01-26 18:47:35.15375+00	{"eTag": "\\"e2db91ffb888bffb2bade7a486aa857f\\"", "size": 33560, "mimetype": "image/jpeg", "cacheControl": "max-age=3600", "lastModified": "2026-01-26T18:47:35.145Z", "contentLength": 33560, "httpStatusCode": 200}	a11998da-c8dc-405e-ae7b-e3051749817a	09b793a3-8ac9-4fcb-8146-b4fee3a549cb	{}	2
724a98c7-d1cb-4118-b4a9-f717651298b2	images	patPhotos/1769533402169.jpg	09b793a3-8ac9-4fcb-8146-b4fee3a549cb	2026-01-27 17:03:23.081852+00	2026-01-27 17:03:23.081852+00	2026-01-27 17:03:23.081852+00	{"eTag": "\\"eefe408c66486d6bba453a9d4ea5bae9\\"", "size": 115275, "mimetype": "image/jpeg", "cacheControl": "max-age=3600", "lastModified": "2026-01-27T17:03:23.065Z", "contentLength": 115275, "httpStatusCode": 200}	1482ee3f-5147-4ffd-a058-afda90d818df	09b793a3-8ac9-4fcb-8146-b4fee3a549cb	{}	2
bed7f07f-591a-47f4-a671-f7066b93d960	images	patPhotos/1770647853028.jpg	09b793a3-8ac9-4fcb-8146-b4fee3a549cb	2026-02-09 14:37:33.594121+00	2026-02-09 14:37:33.594121+00	2026-02-09 14:37:33.594121+00	{"eTag": "\\"871a83b5af497b032f731345f6fd07a7\\"", "size": 41050, "mimetype": "image/jpeg", "cacheControl": "max-age=3600", "lastModified": "2026-02-09T14:37:33.580Z", "contentLength": 41050, "httpStatusCode": 200}	dc63ce05-54e7-497a-b473-bcc7959cba47	09b793a3-8ac9-4fcb-8146-b4fee3a549cb	{}	2
0d72eee6-7cc7-4ad8-8aa7-db4419fe1614	images	patPhotos/1774613409112.jpg	3c998c93-fee1-455f-b604-e948808aa5ad	2026-03-27 12:10:11.009663+00	2026-03-27 12:10:11.009663+00	2026-03-27 12:10:11.009663+00	{"eTag": "\\"716b8be90711c2b340c2cf8c26787249\\"", "size": 94016, "mimetype": "image/jpeg", "cacheControl": "max-age=3600", "lastModified": "2026-03-27T12:10:10.988Z", "contentLength": 94016, "httpStatusCode": 200}	00365428-30fe-471a-9295-9c9d416332a6	3c998c93-fee1-455f-b604-e948808aa5ad	{}	2
0652dd5c-059b-4aee-ac1d-a4fcbd35d7e7	images	patPhotos/1774613439287.jpg	3c998c93-fee1-455f-b604-e948808aa5ad	2026-03-27 12:10:39.904163+00	2026-03-27 12:10:39.904163+00	2026-03-27 12:10:39.904163+00	{"eTag": "\\"716b8be90711c2b340c2cf8c26787249\\"", "size": 94016, "mimetype": "image/jpeg", "cacheControl": "max-age=3600", "lastModified": "2026-03-27T12:10:39.896Z", "contentLength": 94016, "httpStatusCode": 200}	a6b56fd9-afc4-43a6-ba86-00ff97568599	3c998c93-fee1-455f-b604-e948808aa5ad	{}	2
\.


--
-- Data for Name: prefixes; Type: TABLE DATA; Schema: storage; Owner: supabase_storage_admin
--

COPY storage.prefixes (bucket_id, name, created_at, updated_at) FROM stdin;
images	patPhotos	2025-11-05 19:04:50.074419+00	2025-11-05 19:04:50.074419+00
\.


--
-- Data for Name: s3_multipart_uploads; Type: TABLE DATA; Schema: storage; Owner: supabase_storage_admin
--

COPY storage.s3_multipart_uploads (id, in_progress_size, upload_signature, bucket_id, key, version, owner_id, created_at, user_metadata) FROM stdin;
\.


--
-- Data for Name: s3_multipart_uploads_parts; Type: TABLE DATA; Schema: storage; Owner: supabase_storage_admin
--

COPY storage.s3_multipart_uploads_parts (id, upload_id, size, part_number, bucket_id, key, etag, owner_id, version, created_at) FROM stdin;
\.


--
-- Data for Name: hooks; Type: TABLE DATA; Schema: supabase_functions; Owner: supabase_functions_admin
--

COPY supabase_functions.hooks (id, hook_table_id, hook_name, created_at, request_id) FROM stdin;
\.


--
-- Data for Name: migrations; Type: TABLE DATA; Schema: supabase_functions; Owner: supabase_functions_admin
--

COPY supabase_functions.migrations (version, inserted_at) FROM stdin;
initial	2025-10-10 18:31:52.713561+00
20210809183423_update_grants	2025-10-10 18:31:52.713561+00
\.


--
-- Data for Name: secrets; Type: TABLE DATA; Schema: vault; Owner: supabase_admin
--

COPY vault.secrets (id, name, description, secret, key_id, nonce, created_at, updated_at) FROM stdin;
\.


--
-- Name: refresh_tokens_id_seq; Type: SEQUENCE SET; Schema: auth; Owner: supabase_auth_admin
--

SELECT pg_catalog.setval('auth.refresh_tokens_id_seq', 235, true);


--
-- Name: patrimonios_id_seq; Type: SEQUENCE SET; Schema: public; Owner: supabase_admin
--

SELECT pg_catalog.setval('public.patrimonios_id_seq', 18, true);


--
-- Name: permissoes_id_seq; Type: SEQUENCE SET; Schema: public; Owner: supabase_admin
--

SELECT pg_catalog.setval('public.permissoes_id_seq', 4, true);


--
-- Name: subscription_id_seq; Type: SEQUENCE SET; Schema: realtime; Owner: supabase_admin
--

SELECT pg_catalog.setval('realtime.subscription_id_seq', 1, false);


--
-- Name: hooks_id_seq; Type: SEQUENCE SET; Schema: supabase_functions; Owner: supabase_functions_admin
--

SELECT pg_catalog.setval('supabase_functions.hooks_id_seq', 1, false);


--
-- Name: extensions extensions_pkey; Type: CONSTRAINT; Schema: _realtime; Owner: supabase_admin
--

ALTER TABLE ONLY _realtime.extensions
    ADD CONSTRAINT extensions_pkey PRIMARY KEY (id);


--
-- Name: schema_migrations schema_migrations_pkey; Type: CONSTRAINT; Schema: _realtime; Owner: supabase_admin
--

ALTER TABLE ONLY _realtime.schema_migrations
    ADD CONSTRAINT schema_migrations_pkey PRIMARY KEY (version);


--
-- Name: tenants tenants_pkey; Type: CONSTRAINT; Schema: _realtime; Owner: supabase_admin
--

ALTER TABLE ONLY _realtime.tenants
    ADD CONSTRAINT tenants_pkey PRIMARY KEY (id);


--
-- Name: mfa_amr_claims amr_id_pk; Type: CONSTRAINT; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE ONLY auth.mfa_amr_claims
    ADD CONSTRAINT amr_id_pk PRIMARY KEY (id);


--
-- Name: audit_log_entries audit_log_entries_pkey; Type: CONSTRAINT; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE ONLY auth.audit_log_entries
    ADD CONSTRAINT audit_log_entries_pkey PRIMARY KEY (id);


--
-- Name: flow_state flow_state_pkey; Type: CONSTRAINT; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE ONLY auth.flow_state
    ADD CONSTRAINT flow_state_pkey PRIMARY KEY (id);


--
-- Name: identities identities_pkey; Type: CONSTRAINT; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE ONLY auth.identities
    ADD CONSTRAINT identities_pkey PRIMARY KEY (id);


--
-- Name: identities identities_provider_id_provider_unique; Type: CONSTRAINT; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE ONLY auth.identities
    ADD CONSTRAINT identities_provider_id_provider_unique UNIQUE (provider_id, provider);


--
-- Name: instances instances_pkey; Type: CONSTRAINT; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE ONLY auth.instances
    ADD CONSTRAINT instances_pkey PRIMARY KEY (id);


--
-- Name: mfa_amr_claims mfa_amr_claims_session_id_authentication_method_pkey; Type: CONSTRAINT; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE ONLY auth.mfa_amr_claims
    ADD CONSTRAINT mfa_amr_claims_session_id_authentication_method_pkey UNIQUE (session_id, authentication_method);


--
-- Name: mfa_challenges mfa_challenges_pkey; Type: CONSTRAINT; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE ONLY auth.mfa_challenges
    ADD CONSTRAINT mfa_challenges_pkey PRIMARY KEY (id);


--
-- Name: mfa_factors mfa_factors_last_challenged_at_key; Type: CONSTRAINT; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE ONLY auth.mfa_factors
    ADD CONSTRAINT mfa_factors_last_challenged_at_key UNIQUE (last_challenged_at);


--
-- Name: mfa_factors mfa_factors_pkey; Type: CONSTRAINT; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE ONLY auth.mfa_factors
    ADD CONSTRAINT mfa_factors_pkey PRIMARY KEY (id);


--
-- Name: oauth_authorizations oauth_authorizations_authorization_code_key; Type: CONSTRAINT; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE ONLY auth.oauth_authorizations
    ADD CONSTRAINT oauth_authorizations_authorization_code_key UNIQUE (authorization_code);


--
-- Name: oauth_authorizations oauth_authorizations_authorization_id_key; Type: CONSTRAINT; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE ONLY auth.oauth_authorizations
    ADD CONSTRAINT oauth_authorizations_authorization_id_key UNIQUE (authorization_id);


--
-- Name: oauth_authorizations oauth_authorizations_pkey; Type: CONSTRAINT; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE ONLY auth.oauth_authorizations
    ADD CONSTRAINT oauth_authorizations_pkey PRIMARY KEY (id);


--
-- Name: oauth_clients oauth_clients_pkey; Type: CONSTRAINT; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE ONLY auth.oauth_clients
    ADD CONSTRAINT oauth_clients_pkey PRIMARY KEY (id);


--
-- Name: oauth_consents oauth_consents_pkey; Type: CONSTRAINT; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE ONLY auth.oauth_consents
    ADD CONSTRAINT oauth_consents_pkey PRIMARY KEY (id);


--
-- Name: oauth_consents oauth_consents_user_client_unique; Type: CONSTRAINT; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE ONLY auth.oauth_consents
    ADD CONSTRAINT oauth_consents_user_client_unique UNIQUE (user_id, client_id);


--
-- Name: one_time_tokens one_time_tokens_pkey; Type: CONSTRAINT; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE ONLY auth.one_time_tokens
    ADD CONSTRAINT one_time_tokens_pkey PRIMARY KEY (id);


--
-- Name: refresh_tokens refresh_tokens_pkey; Type: CONSTRAINT; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE ONLY auth.refresh_tokens
    ADD CONSTRAINT refresh_tokens_pkey PRIMARY KEY (id);


--
-- Name: refresh_tokens refresh_tokens_token_unique; Type: CONSTRAINT; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE ONLY auth.refresh_tokens
    ADD CONSTRAINT refresh_tokens_token_unique UNIQUE (token);


--
-- Name: saml_providers saml_providers_entity_id_key; Type: CONSTRAINT; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE ONLY auth.saml_providers
    ADD CONSTRAINT saml_providers_entity_id_key UNIQUE (entity_id);


--
-- Name: saml_providers saml_providers_pkey; Type: CONSTRAINT; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE ONLY auth.saml_providers
    ADD CONSTRAINT saml_providers_pkey PRIMARY KEY (id);


--
-- Name: saml_relay_states saml_relay_states_pkey; Type: CONSTRAINT; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE ONLY auth.saml_relay_states
    ADD CONSTRAINT saml_relay_states_pkey PRIMARY KEY (id);


--
-- Name: schema_migrations schema_migrations_pkey; Type: CONSTRAINT; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE ONLY auth.schema_migrations
    ADD CONSTRAINT schema_migrations_pkey PRIMARY KEY (version);


--
-- Name: sessions sessions_pkey; Type: CONSTRAINT; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE ONLY auth.sessions
    ADD CONSTRAINT sessions_pkey PRIMARY KEY (id);


--
-- Name: sso_domains sso_domains_pkey; Type: CONSTRAINT; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE ONLY auth.sso_domains
    ADD CONSTRAINT sso_domains_pkey PRIMARY KEY (id);


--
-- Name: sso_providers sso_providers_pkey; Type: CONSTRAINT; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE ONLY auth.sso_providers
    ADD CONSTRAINT sso_providers_pkey PRIMARY KEY (id);


--
-- Name: users users_phone_key; Type: CONSTRAINT; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE ONLY auth.users
    ADD CONSTRAINT users_phone_key UNIQUE (phone);


--
-- Name: users users_pkey; Type: CONSTRAINT; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE ONLY auth.users
    ADD CONSTRAINT users_pkey PRIMARY KEY (id);


--
-- Name: patrimonios patrimonios_pkey; Type: CONSTRAINT; Schema: public; Owner: supabase_admin
--

ALTER TABLE ONLY public.patrimonios
    ADD CONSTRAINT patrimonios_pkey PRIMARY KEY (id);


--
-- Name: permissoes permissoes_pkey; Type: CONSTRAINT; Schema: public; Owner: supabase_admin
--

ALTER TABLE ONLY public.permissoes
    ADD CONSTRAINT permissoes_pkey PRIMARY KEY (id);


--
-- Name: profiles profiles_pkey; Type: CONSTRAINT; Schema: public; Owner: supabase_admin
--

ALTER TABLE ONLY public.profiles
    ADD CONSTRAINT profiles_pkey PRIMARY KEY (id);


--
-- Name: permissoes unique_permissao; Type: CONSTRAINT; Schema: public; Owner: supabase_admin
--

ALTER TABLE ONLY public.permissoes
    ADD CONSTRAINT unique_permissao UNIQUE (user_id, owner_id, patrimonio_id);


--
-- Name: messages messages_pkey; Type: CONSTRAINT; Schema: realtime; Owner: supabase_realtime_admin
--

ALTER TABLE ONLY realtime.messages
    ADD CONSTRAINT messages_pkey PRIMARY KEY (id, inserted_at);


--
-- Name: messages_2026_03_26 messages_2026_03_26_pkey; Type: CONSTRAINT; Schema: realtime; Owner: supabase_admin
--

ALTER TABLE ONLY realtime.messages_2026_03_26
    ADD CONSTRAINT messages_2026_03_26_pkey PRIMARY KEY (id, inserted_at);


--
-- Name: messages_2026_03_27 messages_2026_03_27_pkey; Type: CONSTRAINT; Schema: realtime; Owner: supabase_admin
--

ALTER TABLE ONLY realtime.messages_2026_03_27
    ADD CONSTRAINT messages_2026_03_27_pkey PRIMARY KEY (id, inserted_at);


--
-- Name: messages_2026_03_28 messages_2026_03_28_pkey; Type: CONSTRAINT; Schema: realtime; Owner: supabase_admin
--

ALTER TABLE ONLY realtime.messages_2026_03_28
    ADD CONSTRAINT messages_2026_03_28_pkey PRIMARY KEY (id, inserted_at);


--
-- Name: messages_2026_03_29 messages_2026_03_29_pkey; Type: CONSTRAINT; Schema: realtime; Owner: supabase_admin
--

ALTER TABLE ONLY realtime.messages_2026_03_29
    ADD CONSTRAINT messages_2026_03_29_pkey PRIMARY KEY (id, inserted_at);


--
-- Name: messages_2026_03_30 messages_2026_03_30_pkey; Type: CONSTRAINT; Schema: realtime; Owner: supabase_admin
--

ALTER TABLE ONLY realtime.messages_2026_03_30
    ADD CONSTRAINT messages_2026_03_30_pkey PRIMARY KEY (id, inserted_at);


--
-- Name: subscription pk_subscription; Type: CONSTRAINT; Schema: realtime; Owner: supabase_admin
--

ALTER TABLE ONLY realtime.subscription
    ADD CONSTRAINT pk_subscription PRIMARY KEY (id);


--
-- Name: schema_migrations schema_migrations_pkey; Type: CONSTRAINT; Schema: realtime; Owner: supabase_admin
--

ALTER TABLE ONLY realtime.schema_migrations
    ADD CONSTRAINT schema_migrations_pkey PRIMARY KEY (version);


--
-- Name: buckets_analytics buckets_analytics_pkey; Type: CONSTRAINT; Schema: storage; Owner: supabase_storage_admin
--

ALTER TABLE ONLY storage.buckets_analytics
    ADD CONSTRAINT buckets_analytics_pkey PRIMARY KEY (id);


--
-- Name: buckets buckets_pkey; Type: CONSTRAINT; Schema: storage; Owner: supabase_storage_admin
--

ALTER TABLE ONLY storage.buckets
    ADD CONSTRAINT buckets_pkey PRIMARY KEY (id);


--
-- Name: iceberg_namespaces iceberg_namespaces_pkey; Type: CONSTRAINT; Schema: storage; Owner: supabase_storage_admin
--

ALTER TABLE ONLY storage.iceberg_namespaces
    ADD CONSTRAINT iceberg_namespaces_pkey PRIMARY KEY (id);


--
-- Name: iceberg_tables iceberg_tables_pkey; Type: CONSTRAINT; Schema: storage; Owner: supabase_storage_admin
--

ALTER TABLE ONLY storage.iceberg_tables
    ADD CONSTRAINT iceberg_tables_pkey PRIMARY KEY (id);


--
-- Name: migrations migrations_name_key; Type: CONSTRAINT; Schema: storage; Owner: supabase_storage_admin
--

ALTER TABLE ONLY storage.migrations
    ADD CONSTRAINT migrations_name_key UNIQUE (name);


--
-- Name: migrations migrations_pkey; Type: CONSTRAINT; Schema: storage; Owner: supabase_storage_admin
--

ALTER TABLE ONLY storage.migrations
    ADD CONSTRAINT migrations_pkey PRIMARY KEY (id);


--
-- Name: objects objects_pkey; Type: CONSTRAINT; Schema: storage; Owner: supabase_storage_admin
--

ALTER TABLE ONLY storage.objects
    ADD CONSTRAINT objects_pkey PRIMARY KEY (id);


--
-- Name: prefixes prefixes_pkey; Type: CONSTRAINT; Schema: storage; Owner: supabase_storage_admin
--

ALTER TABLE ONLY storage.prefixes
    ADD CONSTRAINT prefixes_pkey PRIMARY KEY (bucket_id, level, name);


--
-- Name: s3_multipart_uploads_parts s3_multipart_uploads_parts_pkey; Type: CONSTRAINT; Schema: storage; Owner: supabase_storage_admin
--

ALTER TABLE ONLY storage.s3_multipart_uploads_parts
    ADD CONSTRAINT s3_multipart_uploads_parts_pkey PRIMARY KEY (id);


--
-- Name: s3_multipart_uploads s3_multipart_uploads_pkey; Type: CONSTRAINT; Schema: storage; Owner: supabase_storage_admin
--

ALTER TABLE ONLY storage.s3_multipart_uploads
    ADD CONSTRAINT s3_multipart_uploads_pkey PRIMARY KEY (id);


--
-- Name: hooks hooks_pkey; Type: CONSTRAINT; Schema: supabase_functions; Owner: supabase_functions_admin
--

ALTER TABLE ONLY supabase_functions.hooks
    ADD CONSTRAINT hooks_pkey PRIMARY KEY (id);


--
-- Name: migrations migrations_pkey; Type: CONSTRAINT; Schema: supabase_functions; Owner: supabase_functions_admin
--

ALTER TABLE ONLY supabase_functions.migrations
    ADD CONSTRAINT migrations_pkey PRIMARY KEY (version);


--
-- Name: extensions_tenant_external_id_index; Type: INDEX; Schema: _realtime; Owner: supabase_admin
--

CREATE INDEX extensions_tenant_external_id_index ON _realtime.extensions USING btree (tenant_external_id);


--
-- Name: extensions_tenant_external_id_type_index; Type: INDEX; Schema: _realtime; Owner: supabase_admin
--

CREATE UNIQUE INDEX extensions_tenant_external_id_type_index ON _realtime.extensions USING btree (tenant_external_id, type);


--
-- Name: tenants_external_id_index; Type: INDEX; Schema: _realtime; Owner: supabase_admin
--

CREATE UNIQUE INDEX tenants_external_id_index ON _realtime.tenants USING btree (external_id);


--
-- Name: audit_logs_instance_id_idx; Type: INDEX; Schema: auth; Owner: supabase_auth_admin
--

CREATE INDEX audit_logs_instance_id_idx ON auth.audit_log_entries USING btree (instance_id);


--
-- Name: confirmation_token_idx; Type: INDEX; Schema: auth; Owner: supabase_auth_admin
--

CREATE UNIQUE INDEX confirmation_token_idx ON auth.users USING btree (confirmation_token) WHERE ((confirmation_token)::text !~ '^[0-9 ]*$'::text);


--
-- Name: email_change_token_current_idx; Type: INDEX; Schema: auth; Owner: supabase_auth_admin
--

CREATE UNIQUE INDEX email_change_token_current_idx ON auth.users USING btree (email_change_token_current) WHERE ((email_change_token_current)::text !~ '^[0-9 ]*$'::text);


--
-- Name: email_change_token_new_idx; Type: INDEX; Schema: auth; Owner: supabase_auth_admin
--

CREATE UNIQUE INDEX email_change_token_new_idx ON auth.users USING btree (email_change_token_new) WHERE ((email_change_token_new)::text !~ '^[0-9 ]*$'::text);


--
-- Name: factor_id_created_at_idx; Type: INDEX; Schema: auth; Owner: supabase_auth_admin
--

CREATE INDEX factor_id_created_at_idx ON auth.mfa_factors USING btree (user_id, created_at);


--
-- Name: flow_state_created_at_idx; Type: INDEX; Schema: auth; Owner: supabase_auth_admin
--

CREATE INDEX flow_state_created_at_idx ON auth.flow_state USING btree (created_at DESC);


--
-- Name: identities_email_idx; Type: INDEX; Schema: auth; Owner: supabase_auth_admin
--

CREATE INDEX identities_email_idx ON auth.identities USING btree (email text_pattern_ops);


--
-- Name: INDEX identities_email_idx; Type: COMMENT; Schema: auth; Owner: supabase_auth_admin
--

COMMENT ON INDEX auth.identities_email_idx IS 'Auth: Ensures indexed queries on the email column';


--
-- Name: identities_user_id_idx; Type: INDEX; Schema: auth; Owner: supabase_auth_admin
--

CREATE INDEX identities_user_id_idx ON auth.identities USING btree (user_id);


--
-- Name: idx_auth_code; Type: INDEX; Schema: auth; Owner: supabase_auth_admin
--

CREATE INDEX idx_auth_code ON auth.flow_state USING btree (auth_code);


--
-- Name: idx_user_id_auth_method; Type: INDEX; Schema: auth; Owner: supabase_auth_admin
--

CREATE INDEX idx_user_id_auth_method ON auth.flow_state USING btree (user_id, authentication_method);


--
-- Name: mfa_challenge_created_at_idx; Type: INDEX; Schema: auth; Owner: supabase_auth_admin
--

CREATE INDEX mfa_challenge_created_at_idx ON auth.mfa_challenges USING btree (created_at DESC);


--
-- Name: mfa_factors_user_friendly_name_unique; Type: INDEX; Schema: auth; Owner: supabase_auth_admin
--

CREATE UNIQUE INDEX mfa_factors_user_friendly_name_unique ON auth.mfa_factors USING btree (friendly_name, user_id) WHERE (TRIM(BOTH FROM friendly_name) <> ''::text);


--
-- Name: mfa_factors_user_id_idx; Type: INDEX; Schema: auth; Owner: supabase_auth_admin
--

CREATE INDEX mfa_factors_user_id_idx ON auth.mfa_factors USING btree (user_id);


--
-- Name: oauth_auth_pending_exp_idx; Type: INDEX; Schema: auth; Owner: supabase_auth_admin
--

CREATE INDEX oauth_auth_pending_exp_idx ON auth.oauth_authorizations USING btree (expires_at) WHERE (status = 'pending'::auth.oauth_authorization_status);


--
-- Name: oauth_clients_deleted_at_idx; Type: INDEX; Schema: auth; Owner: supabase_auth_admin
--

CREATE INDEX oauth_clients_deleted_at_idx ON auth.oauth_clients USING btree (deleted_at);


--
-- Name: oauth_consents_active_client_idx; Type: INDEX; Schema: auth; Owner: supabase_auth_admin
--

CREATE INDEX oauth_consents_active_client_idx ON auth.oauth_consents USING btree (client_id) WHERE (revoked_at IS NULL);


--
-- Name: oauth_consents_active_user_client_idx; Type: INDEX; Schema: auth; Owner: supabase_auth_admin
--

CREATE INDEX oauth_consents_active_user_client_idx ON auth.oauth_consents USING btree (user_id, client_id) WHERE (revoked_at IS NULL);


--
-- Name: oauth_consents_user_order_idx; Type: INDEX; Schema: auth; Owner: supabase_auth_admin
--

CREATE INDEX oauth_consents_user_order_idx ON auth.oauth_consents USING btree (user_id, granted_at DESC);


--
-- Name: one_time_tokens_relates_to_hash_idx; Type: INDEX; Schema: auth; Owner: supabase_auth_admin
--

CREATE INDEX one_time_tokens_relates_to_hash_idx ON auth.one_time_tokens USING hash (relates_to);


--
-- Name: one_time_tokens_token_hash_hash_idx; Type: INDEX; Schema: auth; Owner: supabase_auth_admin
--

CREATE INDEX one_time_tokens_token_hash_hash_idx ON auth.one_time_tokens USING hash (token_hash);


--
-- Name: one_time_tokens_user_id_token_type_key; Type: INDEX; Schema: auth; Owner: supabase_auth_admin
--

CREATE UNIQUE INDEX one_time_tokens_user_id_token_type_key ON auth.one_time_tokens USING btree (user_id, token_type);


--
-- Name: reauthentication_token_idx; Type: INDEX; Schema: auth; Owner: supabase_auth_admin
--

CREATE UNIQUE INDEX reauthentication_token_idx ON auth.users USING btree (reauthentication_token) WHERE ((reauthentication_token)::text !~ '^[0-9 ]*$'::text);


--
-- Name: recovery_token_idx; Type: INDEX; Schema: auth; Owner: supabase_auth_admin
--

CREATE UNIQUE INDEX recovery_token_idx ON auth.users USING btree (recovery_token) WHERE ((recovery_token)::text !~ '^[0-9 ]*$'::text);


--
-- Name: refresh_tokens_instance_id_idx; Type: INDEX; Schema: auth; Owner: supabase_auth_admin
--

CREATE INDEX refresh_tokens_instance_id_idx ON auth.refresh_tokens USING btree (instance_id);


--
-- Name: refresh_tokens_instance_id_user_id_idx; Type: INDEX; Schema: auth; Owner: supabase_auth_admin
--

CREATE INDEX refresh_tokens_instance_id_user_id_idx ON auth.refresh_tokens USING btree (instance_id, user_id);


--
-- Name: refresh_tokens_parent_idx; Type: INDEX; Schema: auth; Owner: supabase_auth_admin
--

CREATE INDEX refresh_tokens_parent_idx ON auth.refresh_tokens USING btree (parent);


--
-- Name: refresh_tokens_session_id_revoked_idx; Type: INDEX; Schema: auth; Owner: supabase_auth_admin
--

CREATE INDEX refresh_tokens_session_id_revoked_idx ON auth.refresh_tokens USING btree (session_id, revoked);


--
-- Name: refresh_tokens_updated_at_idx; Type: INDEX; Schema: auth; Owner: supabase_auth_admin
--

CREATE INDEX refresh_tokens_updated_at_idx ON auth.refresh_tokens USING btree (updated_at DESC);


--
-- Name: saml_providers_sso_provider_id_idx; Type: INDEX; Schema: auth; Owner: supabase_auth_admin
--

CREATE INDEX saml_providers_sso_provider_id_idx ON auth.saml_providers USING btree (sso_provider_id);


--
-- Name: saml_relay_states_created_at_idx; Type: INDEX; Schema: auth; Owner: supabase_auth_admin
--

CREATE INDEX saml_relay_states_created_at_idx ON auth.saml_relay_states USING btree (created_at DESC);


--
-- Name: saml_relay_states_for_email_idx; Type: INDEX; Schema: auth; Owner: supabase_auth_admin
--

CREATE INDEX saml_relay_states_for_email_idx ON auth.saml_relay_states USING btree (for_email);


--
-- Name: saml_relay_states_sso_provider_id_idx; Type: INDEX; Schema: auth; Owner: supabase_auth_admin
--

CREATE INDEX saml_relay_states_sso_provider_id_idx ON auth.saml_relay_states USING btree (sso_provider_id);


--
-- Name: sessions_not_after_idx; Type: INDEX; Schema: auth; Owner: supabase_auth_admin
--

CREATE INDEX sessions_not_after_idx ON auth.sessions USING btree (not_after DESC);


--
-- Name: sessions_oauth_client_id_idx; Type: INDEX; Schema: auth; Owner: supabase_auth_admin
--

CREATE INDEX sessions_oauth_client_id_idx ON auth.sessions USING btree (oauth_client_id);


--
-- Name: sessions_user_id_idx; Type: INDEX; Schema: auth; Owner: supabase_auth_admin
--

CREATE INDEX sessions_user_id_idx ON auth.sessions USING btree (user_id);


--
-- Name: sso_domains_domain_idx; Type: INDEX; Schema: auth; Owner: supabase_auth_admin
--

CREATE UNIQUE INDEX sso_domains_domain_idx ON auth.sso_domains USING btree (lower(domain));


--
-- Name: sso_domains_sso_provider_id_idx; Type: INDEX; Schema: auth; Owner: supabase_auth_admin
--

CREATE INDEX sso_domains_sso_provider_id_idx ON auth.sso_domains USING btree (sso_provider_id);


--
-- Name: sso_providers_resource_id_idx; Type: INDEX; Schema: auth; Owner: supabase_auth_admin
--

CREATE UNIQUE INDEX sso_providers_resource_id_idx ON auth.sso_providers USING btree (lower(resource_id));


--
-- Name: sso_providers_resource_id_pattern_idx; Type: INDEX; Schema: auth; Owner: supabase_auth_admin
--

CREATE INDEX sso_providers_resource_id_pattern_idx ON auth.sso_providers USING btree (resource_id text_pattern_ops);


--
-- Name: unique_phone_factor_per_user; Type: INDEX; Schema: auth; Owner: supabase_auth_admin
--

CREATE UNIQUE INDEX unique_phone_factor_per_user ON auth.mfa_factors USING btree (user_id, phone);


--
-- Name: user_id_created_at_idx; Type: INDEX; Schema: auth; Owner: supabase_auth_admin
--

CREATE INDEX user_id_created_at_idx ON auth.sessions USING btree (user_id, created_at);


--
-- Name: users_email_partial_key; Type: INDEX; Schema: auth; Owner: supabase_auth_admin
--

CREATE UNIQUE INDEX users_email_partial_key ON auth.users USING btree (email) WHERE (is_sso_user = false);


--
-- Name: INDEX users_email_partial_key; Type: COMMENT; Schema: auth; Owner: supabase_auth_admin
--

COMMENT ON INDEX auth.users_email_partial_key IS 'Auth: A partial unique index that applies only when is_sso_user is false';


--
-- Name: users_instance_id_email_idx; Type: INDEX; Schema: auth; Owner: supabase_auth_admin
--

CREATE INDEX users_instance_id_email_idx ON auth.users USING btree (instance_id, lower((email)::text));


--
-- Name: users_instance_id_idx; Type: INDEX; Schema: auth; Owner: supabase_auth_admin
--

CREATE INDEX users_instance_id_idx ON auth.users USING btree (instance_id);


--
-- Name: users_is_anonymous_idx; Type: INDEX; Schema: auth; Owner: supabase_auth_admin
--

CREATE INDEX users_is_anonymous_idx ON auth.users USING btree (is_anonymous);


--
-- Name: ix_realtime_subscription_entity; Type: INDEX; Schema: realtime; Owner: supabase_admin
--

CREATE INDEX ix_realtime_subscription_entity ON realtime.subscription USING btree (entity);


--
-- Name: messages_inserted_at_topic_index; Type: INDEX; Schema: realtime; Owner: supabase_realtime_admin
--

CREATE INDEX messages_inserted_at_topic_index ON ONLY realtime.messages USING btree (inserted_at DESC, topic) WHERE ((extension = 'broadcast'::text) AND (private IS TRUE));


--
-- Name: messages_2026_03_26_inserted_at_topic_idx; Type: INDEX; Schema: realtime; Owner: supabase_admin
--

CREATE INDEX messages_2026_03_26_inserted_at_topic_idx ON realtime.messages_2026_03_26 USING btree (inserted_at DESC, topic) WHERE ((extension = 'broadcast'::text) AND (private IS TRUE));


--
-- Name: messages_2026_03_27_inserted_at_topic_idx; Type: INDEX; Schema: realtime; Owner: supabase_admin
--

CREATE INDEX messages_2026_03_27_inserted_at_topic_idx ON realtime.messages_2026_03_27 USING btree (inserted_at DESC, topic) WHERE ((extension = 'broadcast'::text) AND (private IS TRUE));


--
-- Name: messages_2026_03_28_inserted_at_topic_idx; Type: INDEX; Schema: realtime; Owner: supabase_admin
--

CREATE INDEX messages_2026_03_28_inserted_at_topic_idx ON realtime.messages_2026_03_28 USING btree (inserted_at DESC, topic) WHERE ((extension = 'broadcast'::text) AND (private IS TRUE));


--
-- Name: messages_2026_03_29_inserted_at_topic_idx; Type: INDEX; Schema: realtime; Owner: supabase_admin
--

CREATE INDEX messages_2026_03_29_inserted_at_topic_idx ON realtime.messages_2026_03_29 USING btree (inserted_at DESC, topic) WHERE ((extension = 'broadcast'::text) AND (private IS TRUE));


--
-- Name: messages_2026_03_30_inserted_at_topic_idx; Type: INDEX; Schema: realtime; Owner: supabase_admin
--

CREATE INDEX messages_2026_03_30_inserted_at_topic_idx ON realtime.messages_2026_03_30 USING btree (inserted_at DESC, topic) WHERE ((extension = 'broadcast'::text) AND (private IS TRUE));


--
-- Name: subscription_subscription_id_entity_filters_key; Type: INDEX; Schema: realtime; Owner: supabase_admin
--

CREATE UNIQUE INDEX subscription_subscription_id_entity_filters_key ON realtime.subscription USING btree (subscription_id, entity, filters);


--
-- Name: bname; Type: INDEX; Schema: storage; Owner: supabase_storage_admin
--

CREATE UNIQUE INDEX bname ON storage.buckets USING btree (name);


--
-- Name: bucketid_objname; Type: INDEX; Schema: storage; Owner: supabase_storage_admin
--

CREATE UNIQUE INDEX bucketid_objname ON storage.objects USING btree (bucket_id, name);


--
-- Name: idx_iceberg_namespaces_bucket_id; Type: INDEX; Schema: storage; Owner: supabase_storage_admin
--

CREATE UNIQUE INDEX idx_iceberg_namespaces_bucket_id ON storage.iceberg_namespaces USING btree (bucket_id, name);


--
-- Name: idx_iceberg_tables_namespace_id; Type: INDEX; Schema: storage; Owner: supabase_storage_admin
--

CREATE UNIQUE INDEX idx_iceberg_tables_namespace_id ON storage.iceberg_tables USING btree (namespace_id, name);


--
-- Name: idx_multipart_uploads_list; Type: INDEX; Schema: storage; Owner: supabase_storage_admin
--

CREATE INDEX idx_multipart_uploads_list ON storage.s3_multipart_uploads USING btree (bucket_id, key, created_at);


--
-- Name: idx_name_bucket_level_unique; Type: INDEX; Schema: storage; Owner: supabase_storage_admin
--

CREATE UNIQUE INDEX idx_name_bucket_level_unique ON storage.objects USING btree (name COLLATE "C", bucket_id, level);


--
-- Name: idx_objects_bucket_id_name; Type: INDEX; Schema: storage; Owner: supabase_storage_admin
--

CREATE INDEX idx_objects_bucket_id_name ON storage.objects USING btree (bucket_id, name COLLATE "C");


--
-- Name: idx_objects_lower_name; Type: INDEX; Schema: storage; Owner: supabase_storage_admin
--

CREATE INDEX idx_objects_lower_name ON storage.objects USING btree ((path_tokens[level]), lower(name) text_pattern_ops, bucket_id, level);


--
-- Name: idx_prefixes_lower_name; Type: INDEX; Schema: storage; Owner: supabase_storage_admin
--

CREATE INDEX idx_prefixes_lower_name ON storage.prefixes USING btree (bucket_id, level, ((string_to_array(name, '/'::text))[level]), lower(name) text_pattern_ops);


--
-- Name: name_prefix_search; Type: INDEX; Schema: storage; Owner: supabase_storage_admin
--

CREATE INDEX name_prefix_search ON storage.objects USING btree (name text_pattern_ops);


--
-- Name: objects_bucket_id_level_idx; Type: INDEX; Schema: storage; Owner: supabase_storage_admin
--

CREATE UNIQUE INDEX objects_bucket_id_level_idx ON storage.objects USING btree (bucket_id, level, name COLLATE "C");


--
-- Name: supabase_functions_hooks_h_table_id_h_name_idx; Type: INDEX; Schema: supabase_functions; Owner: supabase_functions_admin
--

CREATE INDEX supabase_functions_hooks_h_table_id_h_name_idx ON supabase_functions.hooks USING btree (hook_table_id, hook_name);


--
-- Name: supabase_functions_hooks_request_id_idx; Type: INDEX; Schema: supabase_functions; Owner: supabase_functions_admin
--

CREATE INDEX supabase_functions_hooks_request_id_idx ON supabase_functions.hooks USING btree (request_id);


--
-- Name: messages_2026_03_26_inserted_at_topic_idx; Type: INDEX ATTACH; Schema: realtime; Owner: supabase_realtime_admin
--

ALTER INDEX realtime.messages_inserted_at_topic_index ATTACH PARTITION realtime.messages_2026_03_26_inserted_at_topic_idx;


--
-- Name: messages_2026_03_26_pkey; Type: INDEX ATTACH; Schema: realtime; Owner: supabase_realtime_admin
--

ALTER INDEX realtime.messages_pkey ATTACH PARTITION realtime.messages_2026_03_26_pkey;


--
-- Name: messages_2026_03_27_inserted_at_topic_idx; Type: INDEX ATTACH; Schema: realtime; Owner: supabase_realtime_admin
--

ALTER INDEX realtime.messages_inserted_at_topic_index ATTACH PARTITION realtime.messages_2026_03_27_inserted_at_topic_idx;


--
-- Name: messages_2026_03_27_pkey; Type: INDEX ATTACH; Schema: realtime; Owner: supabase_realtime_admin
--

ALTER INDEX realtime.messages_pkey ATTACH PARTITION realtime.messages_2026_03_27_pkey;


--
-- Name: messages_2026_03_28_inserted_at_topic_idx; Type: INDEX ATTACH; Schema: realtime; Owner: supabase_realtime_admin
--

ALTER INDEX realtime.messages_inserted_at_topic_index ATTACH PARTITION realtime.messages_2026_03_28_inserted_at_topic_idx;


--
-- Name: messages_2026_03_28_pkey; Type: INDEX ATTACH; Schema: realtime; Owner: supabase_realtime_admin
--

ALTER INDEX realtime.messages_pkey ATTACH PARTITION realtime.messages_2026_03_28_pkey;


--
-- Name: messages_2026_03_29_inserted_at_topic_idx; Type: INDEX ATTACH; Schema: realtime; Owner: supabase_realtime_admin
--

ALTER INDEX realtime.messages_inserted_at_topic_index ATTACH PARTITION realtime.messages_2026_03_29_inserted_at_topic_idx;


--
-- Name: messages_2026_03_29_pkey; Type: INDEX ATTACH; Schema: realtime; Owner: supabase_realtime_admin
--

ALTER INDEX realtime.messages_pkey ATTACH PARTITION realtime.messages_2026_03_29_pkey;


--
-- Name: messages_2026_03_30_inserted_at_topic_idx; Type: INDEX ATTACH; Schema: realtime; Owner: supabase_realtime_admin
--

ALTER INDEX realtime.messages_inserted_at_topic_index ATTACH PARTITION realtime.messages_2026_03_30_inserted_at_topic_idx;


--
-- Name: messages_2026_03_30_pkey; Type: INDEX ATTACH; Schema: realtime; Owner: supabase_realtime_admin
--

ALTER INDEX realtime.messages_pkey ATTACH PARTITION realtime.messages_2026_03_30_pkey;


--
-- Name: users on_auth_user_created; Type: TRIGGER; Schema: auth; Owner: supabase_auth_admin
--

CREATE TRIGGER on_auth_user_created AFTER INSERT ON auth.users FOR EACH ROW EXECUTE FUNCTION public.handle_new_user();


--
-- Name: patrimonios on_patrimonio_created; Type: TRIGGER; Schema: public; Owner: supabase_admin
--

CREATE TRIGGER on_patrimonio_created AFTER INSERT ON public.patrimonios FOR EACH ROW EXECUTE FUNCTION public.auto_grant_creator_permission();


--
-- Name: subscription tr_check_filters; Type: TRIGGER; Schema: realtime; Owner: supabase_admin
--

CREATE TRIGGER tr_check_filters BEFORE INSERT OR UPDATE ON realtime.subscription FOR EACH ROW EXECUTE FUNCTION realtime.subscription_check_filters();


--
-- Name: buckets enforce_bucket_name_length_trigger; Type: TRIGGER; Schema: storage; Owner: supabase_storage_admin
--

CREATE TRIGGER enforce_bucket_name_length_trigger BEFORE INSERT OR UPDATE OF name ON storage.buckets FOR EACH ROW EXECUTE FUNCTION storage.enforce_bucket_name_length();


--
-- Name: objects objects_delete_delete_prefix; Type: TRIGGER; Schema: storage; Owner: supabase_storage_admin
--

CREATE TRIGGER objects_delete_delete_prefix AFTER DELETE ON storage.objects FOR EACH ROW EXECUTE FUNCTION storage.delete_prefix_hierarchy_trigger();


--
-- Name: objects objects_insert_create_prefix; Type: TRIGGER; Schema: storage; Owner: supabase_storage_admin
--

CREATE TRIGGER objects_insert_create_prefix BEFORE INSERT ON storage.objects FOR EACH ROW EXECUTE FUNCTION storage.objects_insert_prefix_trigger();


--
-- Name: objects objects_update_create_prefix; Type: TRIGGER; Schema: storage; Owner: supabase_storage_admin
--

CREATE TRIGGER objects_update_create_prefix BEFORE UPDATE ON storage.objects FOR EACH ROW WHEN (((new.name <> old.name) OR (new.bucket_id <> old.bucket_id))) EXECUTE FUNCTION storage.objects_update_prefix_trigger();


--
-- Name: prefixes prefixes_create_hierarchy; Type: TRIGGER; Schema: storage; Owner: supabase_storage_admin
--

CREATE TRIGGER prefixes_create_hierarchy BEFORE INSERT ON storage.prefixes FOR EACH ROW WHEN ((pg_trigger_depth() < 1)) EXECUTE FUNCTION storage.prefixes_insert_trigger();


--
-- Name: prefixes prefixes_delete_hierarchy; Type: TRIGGER; Schema: storage; Owner: supabase_storage_admin
--

CREATE TRIGGER prefixes_delete_hierarchy AFTER DELETE ON storage.prefixes FOR EACH ROW EXECUTE FUNCTION storage.delete_prefix_hierarchy_trigger();


--
-- Name: objects update_objects_updated_at; Type: TRIGGER; Schema: storage; Owner: supabase_storage_admin
--

CREATE TRIGGER update_objects_updated_at BEFORE UPDATE ON storage.objects FOR EACH ROW EXECUTE FUNCTION storage.update_updated_at_column();


--
-- Name: extensions extensions_tenant_external_id_fkey; Type: FK CONSTRAINT; Schema: _realtime; Owner: supabase_admin
--

ALTER TABLE ONLY _realtime.extensions
    ADD CONSTRAINT extensions_tenant_external_id_fkey FOREIGN KEY (tenant_external_id) REFERENCES _realtime.tenants(external_id) ON DELETE CASCADE;


--
-- Name: identities identities_user_id_fkey; Type: FK CONSTRAINT; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE ONLY auth.identities
    ADD CONSTRAINT identities_user_id_fkey FOREIGN KEY (user_id) REFERENCES auth.users(id) ON DELETE CASCADE;


--
-- Name: mfa_amr_claims mfa_amr_claims_session_id_fkey; Type: FK CONSTRAINT; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE ONLY auth.mfa_amr_claims
    ADD CONSTRAINT mfa_amr_claims_session_id_fkey FOREIGN KEY (session_id) REFERENCES auth.sessions(id) ON DELETE CASCADE;


--
-- Name: mfa_challenges mfa_challenges_auth_factor_id_fkey; Type: FK CONSTRAINT; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE ONLY auth.mfa_challenges
    ADD CONSTRAINT mfa_challenges_auth_factor_id_fkey FOREIGN KEY (factor_id) REFERENCES auth.mfa_factors(id) ON DELETE CASCADE;


--
-- Name: mfa_factors mfa_factors_user_id_fkey; Type: FK CONSTRAINT; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE ONLY auth.mfa_factors
    ADD CONSTRAINT mfa_factors_user_id_fkey FOREIGN KEY (user_id) REFERENCES auth.users(id) ON DELETE CASCADE;


--
-- Name: oauth_authorizations oauth_authorizations_client_id_fkey; Type: FK CONSTRAINT; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE ONLY auth.oauth_authorizations
    ADD CONSTRAINT oauth_authorizations_client_id_fkey FOREIGN KEY (client_id) REFERENCES auth.oauth_clients(id) ON DELETE CASCADE;


--
-- Name: oauth_authorizations oauth_authorizations_user_id_fkey; Type: FK CONSTRAINT; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE ONLY auth.oauth_authorizations
    ADD CONSTRAINT oauth_authorizations_user_id_fkey FOREIGN KEY (user_id) REFERENCES auth.users(id) ON DELETE CASCADE;


--
-- Name: oauth_consents oauth_consents_client_id_fkey; Type: FK CONSTRAINT; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE ONLY auth.oauth_consents
    ADD CONSTRAINT oauth_consents_client_id_fkey FOREIGN KEY (client_id) REFERENCES auth.oauth_clients(id) ON DELETE CASCADE;


--
-- Name: oauth_consents oauth_consents_user_id_fkey; Type: FK CONSTRAINT; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE ONLY auth.oauth_consents
    ADD CONSTRAINT oauth_consents_user_id_fkey FOREIGN KEY (user_id) REFERENCES auth.users(id) ON DELETE CASCADE;


--
-- Name: one_time_tokens one_time_tokens_user_id_fkey; Type: FK CONSTRAINT; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE ONLY auth.one_time_tokens
    ADD CONSTRAINT one_time_tokens_user_id_fkey FOREIGN KEY (user_id) REFERENCES auth.users(id) ON DELETE CASCADE;


--
-- Name: refresh_tokens refresh_tokens_session_id_fkey; Type: FK CONSTRAINT; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE ONLY auth.refresh_tokens
    ADD CONSTRAINT refresh_tokens_session_id_fkey FOREIGN KEY (session_id) REFERENCES auth.sessions(id) ON DELETE CASCADE;


--
-- Name: saml_providers saml_providers_sso_provider_id_fkey; Type: FK CONSTRAINT; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE ONLY auth.saml_providers
    ADD CONSTRAINT saml_providers_sso_provider_id_fkey FOREIGN KEY (sso_provider_id) REFERENCES auth.sso_providers(id) ON DELETE CASCADE;


--
-- Name: saml_relay_states saml_relay_states_flow_state_id_fkey; Type: FK CONSTRAINT; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE ONLY auth.saml_relay_states
    ADD CONSTRAINT saml_relay_states_flow_state_id_fkey FOREIGN KEY (flow_state_id) REFERENCES auth.flow_state(id) ON DELETE CASCADE;


--
-- Name: saml_relay_states saml_relay_states_sso_provider_id_fkey; Type: FK CONSTRAINT; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE ONLY auth.saml_relay_states
    ADD CONSTRAINT saml_relay_states_sso_provider_id_fkey FOREIGN KEY (sso_provider_id) REFERENCES auth.sso_providers(id) ON DELETE CASCADE;


--
-- Name: sessions sessions_oauth_client_id_fkey; Type: FK CONSTRAINT; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE ONLY auth.sessions
    ADD CONSTRAINT sessions_oauth_client_id_fkey FOREIGN KEY (oauth_client_id) REFERENCES auth.oauth_clients(id) ON DELETE CASCADE;


--
-- Name: sessions sessions_user_id_fkey; Type: FK CONSTRAINT; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE ONLY auth.sessions
    ADD CONSTRAINT sessions_user_id_fkey FOREIGN KEY (user_id) REFERENCES auth.users(id) ON DELETE CASCADE;


--
-- Name: sso_domains sso_domains_sso_provider_id_fkey; Type: FK CONSTRAINT; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE ONLY auth.sso_domains
    ADD CONSTRAINT sso_domains_sso_provider_id_fkey FOREIGN KEY (sso_provider_id) REFERENCES auth.sso_providers(id) ON DELETE CASCADE;


--
-- Name: patrimonios patrimonios_owner_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: supabase_admin
--

ALTER TABLE ONLY public.patrimonios
    ADD CONSTRAINT patrimonios_owner_id_fkey FOREIGN KEY (owner_id) REFERENCES public.profiles(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: permissoes permissoes_owner_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: supabase_admin
--

ALTER TABLE ONLY public.permissoes
    ADD CONSTRAINT permissoes_owner_id_fkey FOREIGN KEY (owner_id) REFERENCES public.profiles(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: permissoes permissoes_patrimonio_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: supabase_admin
--

ALTER TABLE ONLY public.permissoes
    ADD CONSTRAINT permissoes_patrimonio_id_fkey FOREIGN KEY (patrimonio_id) REFERENCES public.patrimonios(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: permissoes permissoes_user_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: supabase_admin
--

ALTER TABLE ONLY public.permissoes
    ADD CONSTRAINT permissoes_user_id_fkey FOREIGN KEY (user_id) REFERENCES auth.users(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: profiles profiles_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: supabase_admin
--

ALTER TABLE ONLY public.profiles
    ADD CONSTRAINT profiles_id_fkey FOREIGN KEY (id) REFERENCES auth.users(id) ON DELETE CASCADE;


--
-- Name: iceberg_namespaces iceberg_namespaces_bucket_id_fkey; Type: FK CONSTRAINT; Schema: storage; Owner: supabase_storage_admin
--

ALTER TABLE ONLY storage.iceberg_namespaces
    ADD CONSTRAINT iceberg_namespaces_bucket_id_fkey FOREIGN KEY (bucket_id) REFERENCES storage.buckets_analytics(id) ON DELETE CASCADE;


--
-- Name: iceberg_tables iceberg_tables_bucket_id_fkey; Type: FK CONSTRAINT; Schema: storage; Owner: supabase_storage_admin
--

ALTER TABLE ONLY storage.iceberg_tables
    ADD CONSTRAINT iceberg_tables_bucket_id_fkey FOREIGN KEY (bucket_id) REFERENCES storage.buckets_analytics(id) ON DELETE CASCADE;


--
-- Name: iceberg_tables iceberg_tables_namespace_id_fkey; Type: FK CONSTRAINT; Schema: storage; Owner: supabase_storage_admin
--

ALTER TABLE ONLY storage.iceberg_tables
    ADD CONSTRAINT iceberg_tables_namespace_id_fkey FOREIGN KEY (namespace_id) REFERENCES storage.iceberg_namespaces(id) ON DELETE CASCADE;


--
-- Name: objects objects_bucketId_fkey; Type: FK CONSTRAINT; Schema: storage; Owner: supabase_storage_admin
--

ALTER TABLE ONLY storage.objects
    ADD CONSTRAINT "objects_bucketId_fkey" FOREIGN KEY (bucket_id) REFERENCES storage.buckets(id);


--
-- Name: prefixes prefixes_bucketId_fkey; Type: FK CONSTRAINT; Schema: storage; Owner: supabase_storage_admin
--

ALTER TABLE ONLY storage.prefixes
    ADD CONSTRAINT "prefixes_bucketId_fkey" FOREIGN KEY (bucket_id) REFERENCES storage.buckets(id);


--
-- Name: s3_multipart_uploads s3_multipart_uploads_bucket_id_fkey; Type: FK CONSTRAINT; Schema: storage; Owner: supabase_storage_admin
--

ALTER TABLE ONLY storage.s3_multipart_uploads
    ADD CONSTRAINT s3_multipart_uploads_bucket_id_fkey FOREIGN KEY (bucket_id) REFERENCES storage.buckets(id);


--
-- Name: s3_multipart_uploads_parts s3_multipart_uploads_parts_bucket_id_fkey; Type: FK CONSTRAINT; Schema: storage; Owner: supabase_storage_admin
--

ALTER TABLE ONLY storage.s3_multipart_uploads_parts
    ADD CONSTRAINT s3_multipart_uploads_parts_bucket_id_fkey FOREIGN KEY (bucket_id) REFERENCES storage.buckets(id);


--
-- Name: s3_multipart_uploads_parts s3_multipart_uploads_parts_upload_id_fkey; Type: FK CONSTRAINT; Schema: storage; Owner: supabase_storage_admin
--

ALTER TABLE ONLY storage.s3_multipart_uploads_parts
    ADD CONSTRAINT s3_multipart_uploads_parts_upload_id_fkey FOREIGN KEY (upload_id) REFERENCES storage.s3_multipart_uploads(id) ON DELETE CASCADE;


--
-- Name: audit_log_entries; Type: ROW SECURITY; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE auth.audit_log_entries ENABLE ROW LEVEL SECURITY;

--
-- Name: flow_state; Type: ROW SECURITY; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE auth.flow_state ENABLE ROW LEVEL SECURITY;

--
-- Name: identities; Type: ROW SECURITY; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE auth.identities ENABLE ROW LEVEL SECURITY;

--
-- Name: instances; Type: ROW SECURITY; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE auth.instances ENABLE ROW LEVEL SECURITY;

--
-- Name: mfa_amr_claims; Type: ROW SECURITY; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE auth.mfa_amr_claims ENABLE ROW LEVEL SECURITY;

--
-- Name: mfa_challenges; Type: ROW SECURITY; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE auth.mfa_challenges ENABLE ROW LEVEL SECURITY;

--
-- Name: mfa_factors; Type: ROW SECURITY; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE auth.mfa_factors ENABLE ROW LEVEL SECURITY;

--
-- Name: one_time_tokens; Type: ROW SECURITY; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE auth.one_time_tokens ENABLE ROW LEVEL SECURITY;

--
-- Name: refresh_tokens; Type: ROW SECURITY; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE auth.refresh_tokens ENABLE ROW LEVEL SECURITY;

--
-- Name: saml_providers; Type: ROW SECURITY; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE auth.saml_providers ENABLE ROW LEVEL SECURITY;

--
-- Name: saml_relay_states; Type: ROW SECURITY; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE auth.saml_relay_states ENABLE ROW LEVEL SECURITY;

--
-- Name: schema_migrations; Type: ROW SECURITY; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE auth.schema_migrations ENABLE ROW LEVEL SECURITY;

--
-- Name: sessions; Type: ROW SECURITY; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE auth.sessions ENABLE ROW LEVEL SECURITY;

--
-- Name: sso_domains; Type: ROW SECURITY; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE auth.sso_domains ENABLE ROW LEVEL SECURITY;

--
-- Name: sso_providers; Type: ROW SECURITY; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE auth.sso_providers ENABLE ROW LEVEL SECURITY;

--
-- Name: users; Type: ROW SECURITY; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE auth.users ENABLE ROW LEVEL SECURITY;

--
-- Name: patrimonios Deleção Híbrida; Type: POLICY; Schema: public; Owner: supabase_admin
--

CREATE POLICY "Deleção Híbrida" ON public.patrimonios FOR DELETE USING (((auth.uid() = owner_id) OR (EXISTS ( SELECT 1
   FROM public.permissoes
  WHERE ((permissoes.user_id = auth.uid()) AND (permissoes.owner_id = patrimonios.owner_id) AND ((permissoes.patrimonio_id = patrimonios.id) OR (permissoes.patrimonio_id IS NULL)))))));


--
-- Name: permissoes Dono gerencia suas permissões; Type: POLICY; Schema: public; Owner: supabase_admin
--

CREATE POLICY "Dono gerencia suas permissões" ON public.permissoes USING ((auth.uid() = owner_id));


--
-- Name: patrimonios Edição Híbrida; Type: POLICY; Schema: public; Owner: supabase_admin
--

CREATE POLICY "Edição Híbrida" ON public.patrimonios FOR UPDATE USING (((auth.uid() = owner_id) OR (EXISTS ( SELECT 1
   FROM public.permissoes
  WHERE ((permissoes.user_id = auth.uid()) AND (permissoes.owner_id = patrimonios.owner_id) AND ((permissoes.patrimonio_id = patrimonios.id) OR (permissoes.patrimonio_id IS NULL)))))));


--
-- Name: patrimonios Gives autenticated user full access; Type: POLICY; Schema: public; Owner: supabase_admin
--

CREATE POLICY "Gives autenticated user full access" ON public.patrimonios TO authenticated USING (true) WITH CHECK (true);


--
-- Name: profiles Leitura Pública de Perfis; Type: POLICY; Schema: public; Owner: supabase_admin
--

CREATE POLICY "Leitura Pública de Perfis" ON public.profiles FOR SELECT USING (true);


--
-- Name: profiles Usuário edita próprio perfil; Type: POLICY; Schema: public; Owner: supabase_admin
--

CREATE POLICY "Usuário edita próprio perfil" ON public.profiles FOR UPDATE USING ((auth.uid() = id));


--
-- Name: permissoes Usuário vê suas permissões; Type: POLICY; Schema: public; Owner: supabase_admin
--

CREATE POLICY "Usuário vê suas permissões" ON public.permissoes FOR SELECT USING ((auth.uid() = user_id));


--
-- Name: patrimonios; Type: ROW SECURITY; Schema: public; Owner: supabase_admin
--

ALTER TABLE public.patrimonios ENABLE ROW LEVEL SECURITY;

--
-- Name: permissoes; Type: ROW SECURITY; Schema: public; Owner: supabase_admin
--

ALTER TABLE public.permissoes ENABLE ROW LEVEL SECURITY;

--
-- Name: profiles; Type: ROW SECURITY; Schema: public; Owner: supabase_admin
--

ALTER TABLE public.profiles ENABLE ROW LEVEL SECURITY;

--
-- Name: messages; Type: ROW SECURITY; Schema: realtime; Owner: supabase_realtime_admin
--

ALTER TABLE realtime.messages ENABLE ROW LEVEL SECURITY;

--
-- Name: objects User Full access 1ffg0oo_0; Type: POLICY; Schema: storage; Owner: supabase_storage_admin
--

CREATE POLICY "User Full access 1ffg0oo_0" ON storage.objects FOR SELECT TO authenticated USING (((bucket_id = 'images'::text) AND (auth.role() = 'authenticated'::text)));


--
-- Name: objects User Full access 1ffg0oo_1; Type: POLICY; Schema: storage; Owner: supabase_storage_admin
--

CREATE POLICY "User Full access 1ffg0oo_1" ON storage.objects FOR INSERT TO authenticated WITH CHECK (((bucket_id = 'images'::text) AND (auth.role() = 'authenticated'::text)));


--
-- Name: objects User Full access 1ffg0oo_2; Type: POLICY; Schema: storage; Owner: supabase_storage_admin
--

CREATE POLICY "User Full access 1ffg0oo_2" ON storage.objects FOR DELETE TO authenticated USING (((bucket_id = 'images'::text) AND (auth.role() = 'authenticated'::text)));


--
-- Name: objects User Full access 1ffg0oo_3; Type: POLICY; Schema: storage; Owner: supabase_storage_admin
--

CREATE POLICY "User Full access 1ffg0oo_3" ON storage.objects FOR UPDATE TO authenticated USING (((bucket_id = 'images'::text) AND (auth.role() = 'authenticated'::text)));


--
-- Name: buckets; Type: ROW SECURITY; Schema: storage; Owner: supabase_storage_admin
--

ALTER TABLE storage.buckets ENABLE ROW LEVEL SECURITY;

--
-- Name: buckets_analytics; Type: ROW SECURITY; Schema: storage; Owner: supabase_storage_admin
--

ALTER TABLE storage.buckets_analytics ENABLE ROW LEVEL SECURITY;

--
-- Name: iceberg_namespaces; Type: ROW SECURITY; Schema: storage; Owner: supabase_storage_admin
--

ALTER TABLE storage.iceberg_namespaces ENABLE ROW LEVEL SECURITY;

--
-- Name: iceberg_tables; Type: ROW SECURITY; Schema: storage; Owner: supabase_storage_admin
--

ALTER TABLE storage.iceberg_tables ENABLE ROW LEVEL SECURITY;

--
-- Name: migrations; Type: ROW SECURITY; Schema: storage; Owner: supabase_storage_admin
--

ALTER TABLE storage.migrations ENABLE ROW LEVEL SECURITY;

--
-- Name: objects; Type: ROW SECURITY; Schema: storage; Owner: supabase_storage_admin
--

ALTER TABLE storage.objects ENABLE ROW LEVEL SECURITY;

--
-- Name: prefixes; Type: ROW SECURITY; Schema: storage; Owner: supabase_storage_admin
--

ALTER TABLE storage.prefixes ENABLE ROW LEVEL SECURITY;

--
-- Name: s3_multipart_uploads; Type: ROW SECURITY; Schema: storage; Owner: supabase_storage_admin
--

ALTER TABLE storage.s3_multipart_uploads ENABLE ROW LEVEL SECURITY;

--
-- Name: s3_multipart_uploads_parts; Type: ROW SECURITY; Schema: storage; Owner: supabase_storage_admin
--

ALTER TABLE storage.s3_multipart_uploads_parts ENABLE ROW LEVEL SECURITY;

--
-- Name: supabase_realtime; Type: PUBLICATION; Schema: -; Owner: postgres
--

CREATE PUBLICATION supabase_realtime WITH (publish = 'insert, update, delete, truncate');


ALTER PUBLICATION supabase_realtime OWNER TO postgres;

--
-- Name: supabase_realtime patrimonios; Type: PUBLICATION TABLE; Schema: public; Owner: postgres
--

ALTER PUBLICATION supabase_realtime ADD TABLE ONLY public.patrimonios;


--
-- Name: SCHEMA auth; Type: ACL; Schema: -; Owner: supabase_admin
--

GRANT USAGE ON SCHEMA auth TO anon;
GRANT USAGE ON SCHEMA auth TO authenticated;
GRANT USAGE ON SCHEMA auth TO service_role;
GRANT ALL ON SCHEMA auth TO supabase_auth_admin;
GRANT ALL ON SCHEMA auth TO dashboard_user;
GRANT USAGE ON SCHEMA auth TO postgres;


--
-- Name: SCHEMA extensions; Type: ACL; Schema: -; Owner: postgres
--

GRANT USAGE ON SCHEMA extensions TO anon;
GRANT USAGE ON SCHEMA extensions TO authenticated;
GRANT USAGE ON SCHEMA extensions TO service_role;
GRANT ALL ON SCHEMA extensions TO dashboard_user;


--
-- Name: SCHEMA net; Type: ACL; Schema: -; Owner: supabase_admin
--

GRANT USAGE ON SCHEMA net TO supabase_functions_admin;
GRANT USAGE ON SCHEMA net TO postgres;
GRANT USAGE ON SCHEMA net TO anon;
GRANT USAGE ON SCHEMA net TO authenticated;
GRANT USAGE ON SCHEMA net TO service_role;


--
-- Name: SCHEMA public; Type: ACL; Schema: -; Owner: pg_database_owner
--

GRANT USAGE ON SCHEMA public TO postgres;
GRANT USAGE ON SCHEMA public TO anon;
GRANT USAGE ON SCHEMA public TO authenticated;
GRANT USAGE ON SCHEMA public TO service_role;


--
-- Name: SCHEMA realtime; Type: ACL; Schema: -; Owner: supabase_admin
--

GRANT USAGE ON SCHEMA realtime TO postgres;
GRANT USAGE ON SCHEMA realtime TO anon;
GRANT USAGE ON SCHEMA realtime TO authenticated;
GRANT USAGE ON SCHEMA realtime TO service_role;
GRANT ALL ON SCHEMA realtime TO supabase_realtime_admin;


--
-- Name: SCHEMA storage; Type: ACL; Schema: -; Owner: supabase_admin
--

GRANT USAGE ON SCHEMA storage TO postgres;
GRANT USAGE ON SCHEMA storage TO anon;
GRANT USAGE ON SCHEMA storage TO authenticated;
GRANT USAGE ON SCHEMA storage TO service_role;
GRANT ALL ON SCHEMA storage TO supabase_storage_admin;
GRANT ALL ON SCHEMA storage TO dashboard_user;


--
-- Name: SCHEMA supabase_functions; Type: ACL; Schema: -; Owner: supabase_admin
--

GRANT USAGE ON SCHEMA supabase_functions TO postgres;
GRANT USAGE ON SCHEMA supabase_functions TO anon;
GRANT USAGE ON SCHEMA supabase_functions TO authenticated;
GRANT USAGE ON SCHEMA supabase_functions TO service_role;
GRANT ALL ON SCHEMA supabase_functions TO supabase_functions_admin;


--
-- Name: SCHEMA vault; Type: ACL; Schema: -; Owner: supabase_admin
--

GRANT USAGE ON SCHEMA vault TO postgres WITH GRANT OPTION;
GRANT USAGE ON SCHEMA vault TO service_role;


--
-- Name: FUNCTION email(); Type: ACL; Schema: auth; Owner: supabase_auth_admin
--

GRANT ALL ON FUNCTION auth.email() TO dashboard_user;


--
-- Name: FUNCTION jwt(); Type: ACL; Schema: auth; Owner: supabase_auth_admin
--

GRANT ALL ON FUNCTION auth.jwt() TO postgres;
GRANT ALL ON FUNCTION auth.jwt() TO dashboard_user;


--
-- Name: FUNCTION role(); Type: ACL; Schema: auth; Owner: supabase_auth_admin
--

GRANT ALL ON FUNCTION auth.role() TO dashboard_user;


--
-- Name: FUNCTION uid(); Type: ACL; Schema: auth; Owner: supabase_auth_admin
--

GRANT ALL ON FUNCTION auth.uid() TO dashboard_user;


--
-- Name: FUNCTION algorithm_sign(signables text, secret text, algorithm text); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.algorithm_sign(signables text, secret text, algorithm text) TO dashboard_user;
GRANT ALL ON FUNCTION extensions.algorithm_sign(signables text, secret text, algorithm text) TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION armor(bytea); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.armor(bytea) TO dashboard_user;
GRANT ALL ON FUNCTION extensions.armor(bytea) TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION armor(bytea, text[], text[]); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.armor(bytea, text[], text[]) TO dashboard_user;
GRANT ALL ON FUNCTION extensions.armor(bytea, text[], text[]) TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION crypt(text, text); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.crypt(text, text) TO dashboard_user;
GRANT ALL ON FUNCTION extensions.crypt(text, text) TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION dearmor(text); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.dearmor(text) TO dashboard_user;
GRANT ALL ON FUNCTION extensions.dearmor(text) TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION decrypt(bytea, bytea, text); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.decrypt(bytea, bytea, text) TO dashboard_user;
GRANT ALL ON FUNCTION extensions.decrypt(bytea, bytea, text) TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION decrypt_iv(bytea, bytea, bytea, text); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.decrypt_iv(bytea, bytea, bytea, text) TO dashboard_user;
GRANT ALL ON FUNCTION extensions.decrypt_iv(bytea, bytea, bytea, text) TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION digest(bytea, text); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.digest(bytea, text) TO dashboard_user;
GRANT ALL ON FUNCTION extensions.digest(bytea, text) TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION digest(text, text); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.digest(text, text) TO dashboard_user;
GRANT ALL ON FUNCTION extensions.digest(text, text) TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION encrypt(bytea, bytea, text); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.encrypt(bytea, bytea, text) TO dashboard_user;
GRANT ALL ON FUNCTION extensions.encrypt(bytea, bytea, text) TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION encrypt_iv(bytea, bytea, bytea, text); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.encrypt_iv(bytea, bytea, bytea, text) TO dashboard_user;
GRANT ALL ON FUNCTION extensions.encrypt_iv(bytea, bytea, bytea, text) TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION gen_random_bytes(integer); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.gen_random_bytes(integer) TO dashboard_user;
GRANT ALL ON FUNCTION extensions.gen_random_bytes(integer) TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION gen_random_uuid(); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.gen_random_uuid() TO dashboard_user;
GRANT ALL ON FUNCTION extensions.gen_random_uuid() TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION gen_salt(text); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.gen_salt(text) TO dashboard_user;
GRANT ALL ON FUNCTION extensions.gen_salt(text) TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION gen_salt(text, integer); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.gen_salt(text, integer) TO dashboard_user;
GRANT ALL ON FUNCTION extensions.gen_salt(text, integer) TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION grant_pg_cron_access(); Type: ACL; Schema: extensions; Owner: supabase_admin
--

REVOKE ALL ON FUNCTION extensions.grant_pg_cron_access() FROM supabase_admin;
GRANT ALL ON FUNCTION extensions.grant_pg_cron_access() TO supabase_admin WITH GRANT OPTION;
GRANT ALL ON FUNCTION extensions.grant_pg_cron_access() TO dashboard_user;


--
-- Name: FUNCTION grant_pg_graphql_access(); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.grant_pg_graphql_access() TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION grant_pg_net_access(); Type: ACL; Schema: extensions; Owner: supabase_admin
--

REVOKE ALL ON FUNCTION extensions.grant_pg_net_access() FROM supabase_admin;
GRANT ALL ON FUNCTION extensions.grant_pg_net_access() TO supabase_admin WITH GRANT OPTION;
GRANT ALL ON FUNCTION extensions.grant_pg_net_access() TO dashboard_user;


--
-- Name: FUNCTION hmac(bytea, bytea, text); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.hmac(bytea, bytea, text) TO dashboard_user;
GRANT ALL ON FUNCTION extensions.hmac(bytea, bytea, text) TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION hmac(text, text, text); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.hmac(text, text, text) TO dashboard_user;
GRANT ALL ON FUNCTION extensions.hmac(text, text, text) TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION pg_stat_statements(showtext boolean, OUT userid oid, OUT dbid oid, OUT toplevel boolean, OUT queryid bigint, OUT query text, OUT plans bigint, OUT total_plan_time double precision, OUT min_plan_time double precision, OUT max_plan_time double precision, OUT mean_plan_time double precision, OUT stddev_plan_time double precision, OUT calls bigint, OUT total_exec_time double precision, OUT min_exec_time double precision, OUT max_exec_time double precision, OUT mean_exec_time double precision, OUT stddev_exec_time double precision, OUT rows bigint, OUT shared_blks_hit bigint, OUT shared_blks_read bigint, OUT shared_blks_dirtied bigint, OUT shared_blks_written bigint, OUT local_blks_hit bigint, OUT local_blks_read bigint, OUT local_blks_dirtied bigint, OUT local_blks_written bigint, OUT temp_blks_read bigint, OUT temp_blks_written bigint, OUT blk_read_time double precision, OUT blk_write_time double precision, OUT temp_blk_read_time double precision, OUT temp_blk_write_time double precision, OUT wal_records bigint, OUT wal_fpi bigint, OUT wal_bytes numeric, OUT jit_functions bigint, OUT jit_generation_time double precision, OUT jit_inlining_count bigint, OUT jit_inlining_time double precision, OUT jit_optimization_count bigint, OUT jit_optimization_time double precision, OUT jit_emission_count bigint, OUT jit_emission_time double precision); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.pg_stat_statements(showtext boolean, OUT userid oid, OUT dbid oid, OUT toplevel boolean, OUT queryid bigint, OUT query text, OUT plans bigint, OUT total_plan_time double precision, OUT min_plan_time double precision, OUT max_plan_time double precision, OUT mean_plan_time double precision, OUT stddev_plan_time double precision, OUT calls bigint, OUT total_exec_time double precision, OUT min_exec_time double precision, OUT max_exec_time double precision, OUT mean_exec_time double precision, OUT stddev_exec_time double precision, OUT rows bigint, OUT shared_blks_hit bigint, OUT shared_blks_read bigint, OUT shared_blks_dirtied bigint, OUT shared_blks_written bigint, OUT local_blks_hit bigint, OUT local_blks_read bigint, OUT local_blks_dirtied bigint, OUT local_blks_written bigint, OUT temp_blks_read bigint, OUT temp_blks_written bigint, OUT blk_read_time double precision, OUT blk_write_time double precision, OUT temp_blk_read_time double precision, OUT temp_blk_write_time double precision, OUT wal_records bigint, OUT wal_fpi bigint, OUT wal_bytes numeric, OUT jit_functions bigint, OUT jit_generation_time double precision, OUT jit_inlining_count bigint, OUT jit_inlining_time double precision, OUT jit_optimization_count bigint, OUT jit_optimization_time double precision, OUT jit_emission_count bigint, OUT jit_emission_time double precision) TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION pg_stat_statements_info(OUT dealloc bigint, OUT stats_reset timestamp with time zone); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.pg_stat_statements_info(OUT dealloc bigint, OUT stats_reset timestamp with time zone) TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION pg_stat_statements_reset(userid oid, dbid oid, queryid bigint); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.pg_stat_statements_reset(userid oid, dbid oid, queryid bigint) TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION pgp_armor_headers(text, OUT key text, OUT value text); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.pgp_armor_headers(text, OUT key text, OUT value text) TO dashboard_user;
GRANT ALL ON FUNCTION extensions.pgp_armor_headers(text, OUT key text, OUT value text) TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION pgp_key_id(bytea); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.pgp_key_id(bytea) TO dashboard_user;
GRANT ALL ON FUNCTION extensions.pgp_key_id(bytea) TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION pgp_pub_decrypt(bytea, bytea); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.pgp_pub_decrypt(bytea, bytea) TO dashboard_user;
GRANT ALL ON FUNCTION extensions.pgp_pub_decrypt(bytea, bytea) TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION pgp_pub_decrypt(bytea, bytea, text); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.pgp_pub_decrypt(bytea, bytea, text) TO dashboard_user;
GRANT ALL ON FUNCTION extensions.pgp_pub_decrypt(bytea, bytea, text) TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION pgp_pub_decrypt(bytea, bytea, text, text); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.pgp_pub_decrypt(bytea, bytea, text, text) TO dashboard_user;
GRANT ALL ON FUNCTION extensions.pgp_pub_decrypt(bytea, bytea, text, text) TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION pgp_pub_decrypt_bytea(bytea, bytea); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.pgp_pub_decrypt_bytea(bytea, bytea) TO dashboard_user;
GRANT ALL ON FUNCTION extensions.pgp_pub_decrypt_bytea(bytea, bytea) TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION pgp_pub_decrypt_bytea(bytea, bytea, text); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.pgp_pub_decrypt_bytea(bytea, bytea, text) TO dashboard_user;
GRANT ALL ON FUNCTION extensions.pgp_pub_decrypt_bytea(bytea, bytea, text) TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION pgp_pub_decrypt_bytea(bytea, bytea, text, text); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.pgp_pub_decrypt_bytea(bytea, bytea, text, text) TO dashboard_user;
GRANT ALL ON FUNCTION extensions.pgp_pub_decrypt_bytea(bytea, bytea, text, text) TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION pgp_pub_encrypt(text, bytea); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.pgp_pub_encrypt(text, bytea) TO dashboard_user;
GRANT ALL ON FUNCTION extensions.pgp_pub_encrypt(text, bytea) TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION pgp_pub_encrypt(text, bytea, text); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.pgp_pub_encrypt(text, bytea, text) TO dashboard_user;
GRANT ALL ON FUNCTION extensions.pgp_pub_encrypt(text, bytea, text) TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION pgp_pub_encrypt_bytea(bytea, bytea); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.pgp_pub_encrypt_bytea(bytea, bytea) TO dashboard_user;
GRANT ALL ON FUNCTION extensions.pgp_pub_encrypt_bytea(bytea, bytea) TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION pgp_pub_encrypt_bytea(bytea, bytea, text); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.pgp_pub_encrypt_bytea(bytea, bytea, text) TO dashboard_user;
GRANT ALL ON FUNCTION extensions.pgp_pub_encrypt_bytea(bytea, bytea, text) TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION pgp_sym_decrypt(bytea, text); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.pgp_sym_decrypt(bytea, text) TO dashboard_user;
GRANT ALL ON FUNCTION extensions.pgp_sym_decrypt(bytea, text) TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION pgp_sym_decrypt(bytea, text, text); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.pgp_sym_decrypt(bytea, text, text) TO dashboard_user;
GRANT ALL ON FUNCTION extensions.pgp_sym_decrypt(bytea, text, text) TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION pgp_sym_decrypt_bytea(bytea, text); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.pgp_sym_decrypt_bytea(bytea, text) TO dashboard_user;
GRANT ALL ON FUNCTION extensions.pgp_sym_decrypt_bytea(bytea, text) TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION pgp_sym_decrypt_bytea(bytea, text, text); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.pgp_sym_decrypt_bytea(bytea, text, text) TO dashboard_user;
GRANT ALL ON FUNCTION extensions.pgp_sym_decrypt_bytea(bytea, text, text) TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION pgp_sym_encrypt(text, text); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.pgp_sym_encrypt(text, text) TO dashboard_user;
GRANT ALL ON FUNCTION extensions.pgp_sym_encrypt(text, text) TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION pgp_sym_encrypt(text, text, text); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.pgp_sym_encrypt(text, text, text) TO dashboard_user;
GRANT ALL ON FUNCTION extensions.pgp_sym_encrypt(text, text, text) TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION pgp_sym_encrypt_bytea(bytea, text); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.pgp_sym_encrypt_bytea(bytea, text) TO dashboard_user;
GRANT ALL ON FUNCTION extensions.pgp_sym_encrypt_bytea(bytea, text) TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION pgp_sym_encrypt_bytea(bytea, text, text); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.pgp_sym_encrypt_bytea(bytea, text, text) TO dashboard_user;
GRANT ALL ON FUNCTION extensions.pgp_sym_encrypt_bytea(bytea, text, text) TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION pgrst_ddl_watch(); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.pgrst_ddl_watch() TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION pgrst_drop_watch(); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.pgrst_drop_watch() TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION set_graphql_placeholder(); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.set_graphql_placeholder() TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION sign(payload json, secret text, algorithm text); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.sign(payload json, secret text, algorithm text) TO dashboard_user;
GRANT ALL ON FUNCTION extensions.sign(payload json, secret text, algorithm text) TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION try_cast_double(inp text); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.try_cast_double(inp text) TO dashboard_user;
GRANT ALL ON FUNCTION extensions.try_cast_double(inp text) TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION url_decode(data text); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.url_decode(data text) TO dashboard_user;
GRANT ALL ON FUNCTION extensions.url_decode(data text) TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION url_encode(data bytea); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.url_encode(data bytea) TO dashboard_user;
GRANT ALL ON FUNCTION extensions.url_encode(data bytea) TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION uuid_generate_v1(); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.uuid_generate_v1() TO dashboard_user;
GRANT ALL ON FUNCTION extensions.uuid_generate_v1() TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION uuid_generate_v1mc(); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.uuid_generate_v1mc() TO dashboard_user;
GRANT ALL ON FUNCTION extensions.uuid_generate_v1mc() TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION uuid_generate_v3(namespace uuid, name text); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.uuid_generate_v3(namespace uuid, name text) TO dashboard_user;
GRANT ALL ON FUNCTION extensions.uuid_generate_v3(namespace uuid, name text) TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION uuid_generate_v4(); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.uuid_generate_v4() TO dashboard_user;
GRANT ALL ON FUNCTION extensions.uuid_generate_v4() TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION uuid_generate_v5(namespace uuid, name text); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.uuid_generate_v5(namespace uuid, name text) TO dashboard_user;
GRANT ALL ON FUNCTION extensions.uuid_generate_v5(namespace uuid, name text) TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION uuid_nil(); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.uuid_nil() TO dashboard_user;
GRANT ALL ON FUNCTION extensions.uuid_nil() TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION uuid_ns_dns(); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.uuid_ns_dns() TO dashboard_user;
GRANT ALL ON FUNCTION extensions.uuid_ns_dns() TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION uuid_ns_oid(); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.uuid_ns_oid() TO dashboard_user;
GRANT ALL ON FUNCTION extensions.uuid_ns_oid() TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION uuid_ns_url(); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.uuid_ns_url() TO dashboard_user;
GRANT ALL ON FUNCTION extensions.uuid_ns_url() TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION uuid_ns_x500(); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.uuid_ns_x500() TO dashboard_user;
GRANT ALL ON FUNCTION extensions.uuid_ns_x500() TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION verify(token text, secret text, algorithm text); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.verify(token text, secret text, algorithm text) TO dashboard_user;
GRANT ALL ON FUNCTION extensions.verify(token text, secret text, algorithm text) TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION graphql("operationName" text, query text, variables jsonb, extensions jsonb); Type: ACL; Schema: graphql_public; Owner: supabase_admin
--

GRANT ALL ON FUNCTION graphql_public.graphql("operationName" text, query text, variables jsonb, extensions jsonb) TO postgres;
GRANT ALL ON FUNCTION graphql_public.graphql("operationName" text, query text, variables jsonb, extensions jsonb) TO anon;
GRANT ALL ON FUNCTION graphql_public.graphql("operationName" text, query text, variables jsonb, extensions jsonb) TO authenticated;
GRANT ALL ON FUNCTION graphql_public.graphql("operationName" text, query text, variables jsonb, extensions jsonb) TO service_role;


--
-- Name: FUNCTION get_auth(p_usename text); Type: ACL; Schema: pgbouncer; Owner: supabase_admin
--

REVOKE ALL ON FUNCTION pgbouncer.get_auth(p_usename text) FROM PUBLIC;
GRANT ALL ON FUNCTION pgbouncer.get_auth(p_usename text) TO pgbouncer;
GRANT ALL ON FUNCTION pgbouncer.get_auth(p_usename text) TO postgres;


--
-- Name: FUNCTION auto_grant_creator_permission(); Type: ACL; Schema: public; Owner: supabase_admin
--

GRANT ALL ON FUNCTION public.auto_grant_creator_permission() TO postgres;
GRANT ALL ON FUNCTION public.auto_grant_creator_permission() TO anon;
GRANT ALL ON FUNCTION public.auto_grant_creator_permission() TO authenticated;
GRANT ALL ON FUNCTION public.auto_grant_creator_permission() TO service_role;


--
-- Name: FUNCTION handle_new_user(); Type: ACL; Schema: public; Owner: supabase_admin
--

GRANT ALL ON FUNCTION public.handle_new_user() TO postgres;
GRANT ALL ON FUNCTION public.handle_new_user() TO anon;
GRANT ALL ON FUNCTION public.handle_new_user() TO authenticated;
GRANT ALL ON FUNCTION public.handle_new_user() TO service_role;


--
-- Name: FUNCTION manage_patrimony_permissions(p_patrimonio_id bigint, p_owner_id uuid, p_selected_user_ids uuid[]); Type: ACL; Schema: public; Owner: supabase_admin
--

GRANT ALL ON FUNCTION public.manage_patrimony_permissions(p_patrimonio_id bigint, p_owner_id uuid, p_selected_user_ids uuid[]) TO postgres;
GRANT ALL ON FUNCTION public.manage_patrimony_permissions(p_patrimonio_id bigint, p_owner_id uuid, p_selected_user_ids uuid[]) TO anon;
GRANT ALL ON FUNCTION public.manage_patrimony_permissions(p_patrimonio_id bigint, p_owner_id uuid, p_selected_user_ids uuid[]) TO authenticated;
GRANT ALL ON FUNCTION public.manage_patrimony_permissions(p_patrimonio_id bigint, p_owner_id uuid, p_selected_user_ids uuid[]) TO service_role;


--
-- Name: FUNCTION apply_rls(wal jsonb, max_record_bytes integer); Type: ACL; Schema: realtime; Owner: supabase_admin
--

GRANT ALL ON FUNCTION realtime.apply_rls(wal jsonb, max_record_bytes integer) TO postgres;
GRANT ALL ON FUNCTION realtime.apply_rls(wal jsonb, max_record_bytes integer) TO dashboard_user;
GRANT ALL ON FUNCTION realtime.apply_rls(wal jsonb, max_record_bytes integer) TO anon;
GRANT ALL ON FUNCTION realtime.apply_rls(wal jsonb, max_record_bytes integer) TO authenticated;
GRANT ALL ON FUNCTION realtime.apply_rls(wal jsonb, max_record_bytes integer) TO service_role;
GRANT ALL ON FUNCTION realtime.apply_rls(wal jsonb, max_record_bytes integer) TO supabase_realtime_admin;


--
-- Name: FUNCTION broadcast_changes(topic_name text, event_name text, operation text, table_name text, table_schema text, new record, old record, level text); Type: ACL; Schema: realtime; Owner: supabase_admin
--

GRANT ALL ON FUNCTION realtime.broadcast_changes(topic_name text, event_name text, operation text, table_name text, table_schema text, new record, old record, level text) TO postgres;
GRANT ALL ON FUNCTION realtime.broadcast_changes(topic_name text, event_name text, operation text, table_name text, table_schema text, new record, old record, level text) TO dashboard_user;


--
-- Name: FUNCTION build_prepared_statement_sql(prepared_statement_name text, entity regclass, columns realtime.wal_column[]); Type: ACL; Schema: realtime; Owner: supabase_admin
--

GRANT ALL ON FUNCTION realtime.build_prepared_statement_sql(prepared_statement_name text, entity regclass, columns realtime.wal_column[]) TO postgres;
GRANT ALL ON FUNCTION realtime.build_prepared_statement_sql(prepared_statement_name text, entity regclass, columns realtime.wal_column[]) TO dashboard_user;
GRANT ALL ON FUNCTION realtime.build_prepared_statement_sql(prepared_statement_name text, entity regclass, columns realtime.wal_column[]) TO anon;
GRANT ALL ON FUNCTION realtime.build_prepared_statement_sql(prepared_statement_name text, entity regclass, columns realtime.wal_column[]) TO authenticated;
GRANT ALL ON FUNCTION realtime.build_prepared_statement_sql(prepared_statement_name text, entity regclass, columns realtime.wal_column[]) TO service_role;
GRANT ALL ON FUNCTION realtime.build_prepared_statement_sql(prepared_statement_name text, entity regclass, columns realtime.wal_column[]) TO supabase_realtime_admin;


--
-- Name: FUNCTION "cast"(val text, type_ regtype); Type: ACL; Schema: realtime; Owner: supabase_admin
--

GRANT ALL ON FUNCTION realtime."cast"(val text, type_ regtype) TO postgres;
GRANT ALL ON FUNCTION realtime."cast"(val text, type_ regtype) TO dashboard_user;
GRANT ALL ON FUNCTION realtime."cast"(val text, type_ regtype) TO anon;
GRANT ALL ON FUNCTION realtime."cast"(val text, type_ regtype) TO authenticated;
GRANT ALL ON FUNCTION realtime."cast"(val text, type_ regtype) TO service_role;
GRANT ALL ON FUNCTION realtime."cast"(val text, type_ regtype) TO supabase_realtime_admin;


--
-- Name: FUNCTION check_equality_op(op realtime.equality_op, type_ regtype, val_1 text, val_2 text); Type: ACL; Schema: realtime; Owner: supabase_admin
--

GRANT ALL ON FUNCTION realtime.check_equality_op(op realtime.equality_op, type_ regtype, val_1 text, val_2 text) TO postgres;
GRANT ALL ON FUNCTION realtime.check_equality_op(op realtime.equality_op, type_ regtype, val_1 text, val_2 text) TO dashboard_user;
GRANT ALL ON FUNCTION realtime.check_equality_op(op realtime.equality_op, type_ regtype, val_1 text, val_2 text) TO anon;
GRANT ALL ON FUNCTION realtime.check_equality_op(op realtime.equality_op, type_ regtype, val_1 text, val_2 text) TO authenticated;
GRANT ALL ON FUNCTION realtime.check_equality_op(op realtime.equality_op, type_ regtype, val_1 text, val_2 text) TO service_role;
GRANT ALL ON FUNCTION realtime.check_equality_op(op realtime.equality_op, type_ regtype, val_1 text, val_2 text) TO supabase_realtime_admin;


--
-- Name: FUNCTION is_visible_through_filters(columns realtime.wal_column[], filters realtime.user_defined_filter[]); Type: ACL; Schema: realtime; Owner: supabase_admin
--

GRANT ALL ON FUNCTION realtime.is_visible_through_filters(columns realtime.wal_column[], filters realtime.user_defined_filter[]) TO postgres;
GRANT ALL ON FUNCTION realtime.is_visible_through_filters(columns realtime.wal_column[], filters realtime.user_defined_filter[]) TO dashboard_user;
GRANT ALL ON FUNCTION realtime.is_visible_through_filters(columns realtime.wal_column[], filters realtime.user_defined_filter[]) TO anon;
GRANT ALL ON FUNCTION realtime.is_visible_through_filters(columns realtime.wal_column[], filters realtime.user_defined_filter[]) TO authenticated;
GRANT ALL ON FUNCTION realtime.is_visible_through_filters(columns realtime.wal_column[], filters realtime.user_defined_filter[]) TO service_role;
GRANT ALL ON FUNCTION realtime.is_visible_through_filters(columns realtime.wal_column[], filters realtime.user_defined_filter[]) TO supabase_realtime_admin;


--
-- Name: FUNCTION list_changes(publication name, slot_name name, max_changes integer, max_record_bytes integer); Type: ACL; Schema: realtime; Owner: supabase_admin
--

GRANT ALL ON FUNCTION realtime.list_changes(publication name, slot_name name, max_changes integer, max_record_bytes integer) TO postgres;
GRANT ALL ON FUNCTION realtime.list_changes(publication name, slot_name name, max_changes integer, max_record_bytes integer) TO dashboard_user;
GRANT ALL ON FUNCTION realtime.list_changes(publication name, slot_name name, max_changes integer, max_record_bytes integer) TO anon;
GRANT ALL ON FUNCTION realtime.list_changes(publication name, slot_name name, max_changes integer, max_record_bytes integer) TO authenticated;
GRANT ALL ON FUNCTION realtime.list_changes(publication name, slot_name name, max_changes integer, max_record_bytes integer) TO service_role;
GRANT ALL ON FUNCTION realtime.list_changes(publication name, slot_name name, max_changes integer, max_record_bytes integer) TO supabase_realtime_admin;


--
-- Name: FUNCTION quote_wal2json(entity regclass); Type: ACL; Schema: realtime; Owner: supabase_admin
--

GRANT ALL ON FUNCTION realtime.quote_wal2json(entity regclass) TO postgres;
GRANT ALL ON FUNCTION realtime.quote_wal2json(entity regclass) TO dashboard_user;
GRANT ALL ON FUNCTION realtime.quote_wal2json(entity regclass) TO anon;
GRANT ALL ON FUNCTION realtime.quote_wal2json(entity regclass) TO authenticated;
GRANT ALL ON FUNCTION realtime.quote_wal2json(entity regclass) TO service_role;
GRANT ALL ON FUNCTION realtime.quote_wal2json(entity regclass) TO supabase_realtime_admin;


--
-- Name: FUNCTION send(payload jsonb, event text, topic text, private boolean); Type: ACL; Schema: realtime; Owner: supabase_admin
--

GRANT ALL ON FUNCTION realtime.send(payload jsonb, event text, topic text, private boolean) TO postgres;
GRANT ALL ON FUNCTION realtime.send(payload jsonb, event text, topic text, private boolean) TO dashboard_user;


--
-- Name: FUNCTION subscription_check_filters(); Type: ACL; Schema: realtime; Owner: supabase_admin
--

GRANT ALL ON FUNCTION realtime.subscription_check_filters() TO postgres;
GRANT ALL ON FUNCTION realtime.subscription_check_filters() TO dashboard_user;
GRANT ALL ON FUNCTION realtime.subscription_check_filters() TO anon;
GRANT ALL ON FUNCTION realtime.subscription_check_filters() TO authenticated;
GRANT ALL ON FUNCTION realtime.subscription_check_filters() TO service_role;
GRANT ALL ON FUNCTION realtime.subscription_check_filters() TO supabase_realtime_admin;


--
-- Name: FUNCTION to_regrole(role_name text); Type: ACL; Schema: realtime; Owner: supabase_admin
--

GRANT ALL ON FUNCTION realtime.to_regrole(role_name text) TO postgres;
GRANT ALL ON FUNCTION realtime.to_regrole(role_name text) TO dashboard_user;
GRANT ALL ON FUNCTION realtime.to_regrole(role_name text) TO anon;
GRANT ALL ON FUNCTION realtime.to_regrole(role_name text) TO authenticated;
GRANT ALL ON FUNCTION realtime.to_regrole(role_name text) TO service_role;
GRANT ALL ON FUNCTION realtime.to_regrole(role_name text) TO supabase_realtime_admin;


--
-- Name: FUNCTION topic(); Type: ACL; Schema: realtime; Owner: supabase_realtime_admin
--

GRANT ALL ON FUNCTION realtime.topic() TO postgres;
GRANT ALL ON FUNCTION realtime.topic() TO dashboard_user;


--
-- Name: FUNCTION http_request(); Type: ACL; Schema: supabase_functions; Owner: supabase_functions_admin
--

REVOKE ALL ON FUNCTION supabase_functions.http_request() FROM PUBLIC;
GRANT ALL ON FUNCTION supabase_functions.http_request() TO anon;
GRANT ALL ON FUNCTION supabase_functions.http_request() TO authenticated;
GRANT ALL ON FUNCTION supabase_functions.http_request() TO service_role;
GRANT ALL ON FUNCTION supabase_functions.http_request() TO postgres;


--
-- Name: FUNCTION _crypto_aead_det_decrypt(message bytea, additional bytea, key_id bigint, context bytea, nonce bytea); Type: ACL; Schema: vault; Owner: supabase_admin
--

GRANT ALL ON FUNCTION vault._crypto_aead_det_decrypt(message bytea, additional bytea, key_id bigint, context bytea, nonce bytea) TO postgres WITH GRANT OPTION;
GRANT ALL ON FUNCTION vault._crypto_aead_det_decrypt(message bytea, additional bytea, key_id bigint, context bytea, nonce bytea) TO service_role;


--
-- Name: FUNCTION create_secret(new_secret text, new_name text, new_description text, new_key_id uuid); Type: ACL; Schema: vault; Owner: supabase_admin
--

GRANT ALL ON FUNCTION vault.create_secret(new_secret text, new_name text, new_description text, new_key_id uuid) TO postgres WITH GRANT OPTION;
GRANT ALL ON FUNCTION vault.create_secret(new_secret text, new_name text, new_description text, new_key_id uuid) TO service_role;


--
-- Name: FUNCTION update_secret(secret_id uuid, new_secret text, new_name text, new_description text, new_key_id uuid); Type: ACL; Schema: vault; Owner: supabase_admin
--

GRANT ALL ON FUNCTION vault.update_secret(secret_id uuid, new_secret text, new_name text, new_description text, new_key_id uuid) TO postgres WITH GRANT OPTION;
GRANT ALL ON FUNCTION vault.update_secret(secret_id uuid, new_secret text, new_name text, new_description text, new_key_id uuid) TO service_role;


--
-- Name: TABLE audit_log_entries; Type: ACL; Schema: auth; Owner: supabase_auth_admin
--

GRANT ALL ON TABLE auth.audit_log_entries TO dashboard_user;
GRANT INSERT,REFERENCES,DELETE,TRIGGER,TRUNCATE,UPDATE ON TABLE auth.audit_log_entries TO postgres;
GRANT SELECT ON TABLE auth.audit_log_entries TO postgres WITH GRANT OPTION;


--
-- Name: TABLE flow_state; Type: ACL; Schema: auth; Owner: supabase_auth_admin
--

GRANT INSERT,REFERENCES,DELETE,TRIGGER,TRUNCATE,UPDATE ON TABLE auth.flow_state TO postgres;
GRANT SELECT ON TABLE auth.flow_state TO postgres WITH GRANT OPTION;
GRANT ALL ON TABLE auth.flow_state TO dashboard_user;


--
-- Name: TABLE identities; Type: ACL; Schema: auth; Owner: supabase_auth_admin
--

GRANT INSERT,REFERENCES,DELETE,TRIGGER,TRUNCATE,UPDATE ON TABLE auth.identities TO postgres;
GRANT SELECT ON TABLE auth.identities TO postgres WITH GRANT OPTION;
GRANT ALL ON TABLE auth.identities TO dashboard_user;


--
-- Name: TABLE instances; Type: ACL; Schema: auth; Owner: supabase_auth_admin
--

GRANT ALL ON TABLE auth.instances TO dashboard_user;
GRANT INSERT,REFERENCES,DELETE,TRIGGER,TRUNCATE,UPDATE ON TABLE auth.instances TO postgres;
GRANT SELECT ON TABLE auth.instances TO postgres WITH GRANT OPTION;


--
-- Name: TABLE mfa_amr_claims; Type: ACL; Schema: auth; Owner: supabase_auth_admin
--

GRANT INSERT,REFERENCES,DELETE,TRIGGER,TRUNCATE,UPDATE ON TABLE auth.mfa_amr_claims TO postgres;
GRANT SELECT ON TABLE auth.mfa_amr_claims TO postgres WITH GRANT OPTION;
GRANT ALL ON TABLE auth.mfa_amr_claims TO dashboard_user;


--
-- Name: TABLE mfa_challenges; Type: ACL; Schema: auth; Owner: supabase_auth_admin
--

GRANT INSERT,REFERENCES,DELETE,TRIGGER,TRUNCATE,UPDATE ON TABLE auth.mfa_challenges TO postgres;
GRANT SELECT ON TABLE auth.mfa_challenges TO postgres WITH GRANT OPTION;
GRANT ALL ON TABLE auth.mfa_challenges TO dashboard_user;


--
-- Name: TABLE mfa_factors; Type: ACL; Schema: auth; Owner: supabase_auth_admin
--

GRANT INSERT,REFERENCES,DELETE,TRIGGER,TRUNCATE,UPDATE ON TABLE auth.mfa_factors TO postgres;
GRANT SELECT ON TABLE auth.mfa_factors TO postgres WITH GRANT OPTION;
GRANT ALL ON TABLE auth.mfa_factors TO dashboard_user;


--
-- Name: TABLE oauth_authorizations; Type: ACL; Schema: auth; Owner: supabase_auth_admin
--

GRANT ALL ON TABLE auth.oauth_authorizations TO postgres;
GRANT ALL ON TABLE auth.oauth_authorizations TO dashboard_user;


--
-- Name: TABLE oauth_clients; Type: ACL; Schema: auth; Owner: supabase_auth_admin
--

GRANT ALL ON TABLE auth.oauth_clients TO postgres;
GRANT ALL ON TABLE auth.oauth_clients TO dashboard_user;


--
-- Name: TABLE oauth_consents; Type: ACL; Schema: auth; Owner: supabase_auth_admin
--

GRANT ALL ON TABLE auth.oauth_consents TO postgres;
GRANT ALL ON TABLE auth.oauth_consents TO dashboard_user;


--
-- Name: TABLE one_time_tokens; Type: ACL; Schema: auth; Owner: supabase_auth_admin
--

GRANT INSERT,REFERENCES,DELETE,TRIGGER,TRUNCATE,UPDATE ON TABLE auth.one_time_tokens TO postgres;
GRANT SELECT ON TABLE auth.one_time_tokens TO postgres WITH GRANT OPTION;
GRANT ALL ON TABLE auth.one_time_tokens TO dashboard_user;


--
-- Name: TABLE refresh_tokens; Type: ACL; Schema: auth; Owner: supabase_auth_admin
--

GRANT ALL ON TABLE auth.refresh_tokens TO dashboard_user;
GRANT INSERT,REFERENCES,DELETE,TRIGGER,TRUNCATE,UPDATE ON TABLE auth.refresh_tokens TO postgres;
GRANT SELECT ON TABLE auth.refresh_tokens TO postgres WITH GRANT OPTION;


--
-- Name: SEQUENCE refresh_tokens_id_seq; Type: ACL; Schema: auth; Owner: supabase_auth_admin
--

GRANT ALL ON SEQUENCE auth.refresh_tokens_id_seq TO dashboard_user;
GRANT ALL ON SEQUENCE auth.refresh_tokens_id_seq TO postgres;


--
-- Name: TABLE saml_providers; Type: ACL; Schema: auth; Owner: supabase_auth_admin
--

GRANT INSERT,REFERENCES,DELETE,TRIGGER,TRUNCATE,UPDATE ON TABLE auth.saml_providers TO postgres;
GRANT SELECT ON TABLE auth.saml_providers TO postgres WITH GRANT OPTION;
GRANT ALL ON TABLE auth.saml_providers TO dashboard_user;


--
-- Name: TABLE saml_relay_states; Type: ACL; Schema: auth; Owner: supabase_auth_admin
--

GRANT INSERT,REFERENCES,DELETE,TRIGGER,TRUNCATE,UPDATE ON TABLE auth.saml_relay_states TO postgres;
GRANT SELECT ON TABLE auth.saml_relay_states TO postgres WITH GRANT OPTION;
GRANT ALL ON TABLE auth.saml_relay_states TO dashboard_user;


--
-- Name: TABLE schema_migrations; Type: ACL; Schema: auth; Owner: supabase_auth_admin
--

GRANT SELECT ON TABLE auth.schema_migrations TO postgres WITH GRANT OPTION;


--
-- Name: TABLE sessions; Type: ACL; Schema: auth; Owner: supabase_auth_admin
--

GRANT INSERT,REFERENCES,DELETE,TRIGGER,TRUNCATE,UPDATE ON TABLE auth.sessions TO postgres;
GRANT SELECT ON TABLE auth.sessions TO postgres WITH GRANT OPTION;
GRANT ALL ON TABLE auth.sessions TO dashboard_user;


--
-- Name: TABLE sso_domains; Type: ACL; Schema: auth; Owner: supabase_auth_admin
--

GRANT INSERT,REFERENCES,DELETE,TRIGGER,TRUNCATE,UPDATE ON TABLE auth.sso_domains TO postgres;
GRANT SELECT ON TABLE auth.sso_domains TO postgres WITH GRANT OPTION;
GRANT ALL ON TABLE auth.sso_domains TO dashboard_user;


--
-- Name: TABLE sso_providers; Type: ACL; Schema: auth; Owner: supabase_auth_admin
--

GRANT INSERT,REFERENCES,DELETE,TRIGGER,TRUNCATE,UPDATE ON TABLE auth.sso_providers TO postgres;
GRANT SELECT ON TABLE auth.sso_providers TO postgres WITH GRANT OPTION;
GRANT ALL ON TABLE auth.sso_providers TO dashboard_user;


--
-- Name: TABLE users; Type: ACL; Schema: auth; Owner: supabase_auth_admin
--

GRANT ALL ON TABLE auth.users TO dashboard_user;
GRANT INSERT,REFERENCES,DELETE,TRIGGER,TRUNCATE,UPDATE ON TABLE auth.users TO postgres;
GRANT SELECT ON TABLE auth.users TO postgres WITH GRANT OPTION;


--
-- Name: TABLE pg_stat_statements; Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON TABLE extensions.pg_stat_statements TO postgres WITH GRANT OPTION;


--
-- Name: TABLE pg_stat_statements_info; Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON TABLE extensions.pg_stat_statements_info TO postgres WITH GRANT OPTION;


--
-- Name: TABLE patrimonios; Type: ACL; Schema: public; Owner: supabase_admin
--

GRANT ALL ON TABLE public.patrimonios TO postgres;
GRANT ALL ON TABLE public.patrimonios TO anon;
GRANT ALL ON TABLE public.patrimonios TO authenticated;
GRANT ALL ON TABLE public.patrimonios TO service_role;


--
-- Name: SEQUENCE patrimonios_id_seq; Type: ACL; Schema: public; Owner: supabase_admin
--

GRANT ALL ON SEQUENCE public.patrimonios_id_seq TO postgres;
GRANT ALL ON SEQUENCE public.patrimonios_id_seq TO anon;
GRANT ALL ON SEQUENCE public.patrimonios_id_seq TO authenticated;
GRANT ALL ON SEQUENCE public.patrimonios_id_seq TO service_role;


--
-- Name: TABLE permissoes; Type: ACL; Schema: public; Owner: supabase_admin
--

GRANT ALL ON TABLE public.permissoes TO postgres;
GRANT ALL ON TABLE public.permissoes TO anon;
GRANT ALL ON TABLE public.permissoes TO authenticated;
GRANT ALL ON TABLE public.permissoes TO service_role;


--
-- Name: SEQUENCE permissoes_id_seq; Type: ACL; Schema: public; Owner: supabase_admin
--

GRANT ALL ON SEQUENCE public.permissoes_id_seq TO postgres;
GRANT ALL ON SEQUENCE public.permissoes_id_seq TO anon;
GRANT ALL ON SEQUENCE public.permissoes_id_seq TO authenticated;
GRANT ALL ON SEQUENCE public.permissoes_id_seq TO service_role;


--
-- Name: TABLE profiles; Type: ACL; Schema: public; Owner: supabase_admin
--

GRANT ALL ON TABLE public.profiles TO postgres;
GRANT ALL ON TABLE public.profiles TO anon;
GRANT ALL ON TABLE public.profiles TO authenticated;
GRANT ALL ON TABLE public.profiles TO service_role;


--
-- Name: TABLE messages; Type: ACL; Schema: realtime; Owner: supabase_realtime_admin
--

GRANT ALL ON TABLE realtime.messages TO postgres;
GRANT ALL ON TABLE realtime.messages TO dashboard_user;
GRANT SELECT,INSERT,UPDATE ON TABLE realtime.messages TO anon;
GRANT SELECT,INSERT,UPDATE ON TABLE realtime.messages TO authenticated;
GRANT SELECT,INSERT,UPDATE ON TABLE realtime.messages TO service_role;


--
-- Name: TABLE messages_2026_03_26; Type: ACL; Schema: realtime; Owner: supabase_admin
--

GRANT ALL ON TABLE realtime.messages_2026_03_26 TO postgres;
GRANT ALL ON TABLE realtime.messages_2026_03_26 TO dashboard_user;


--
-- Name: TABLE messages_2026_03_27; Type: ACL; Schema: realtime; Owner: supabase_admin
--

GRANT ALL ON TABLE realtime.messages_2026_03_27 TO postgres;
GRANT ALL ON TABLE realtime.messages_2026_03_27 TO dashboard_user;


--
-- Name: TABLE messages_2026_03_28; Type: ACL; Schema: realtime; Owner: supabase_admin
--

GRANT ALL ON TABLE realtime.messages_2026_03_28 TO postgres;
GRANT ALL ON TABLE realtime.messages_2026_03_28 TO dashboard_user;


--
-- Name: TABLE messages_2026_03_29; Type: ACL; Schema: realtime; Owner: supabase_admin
--

GRANT ALL ON TABLE realtime.messages_2026_03_29 TO postgres;
GRANT ALL ON TABLE realtime.messages_2026_03_29 TO dashboard_user;


--
-- Name: TABLE messages_2026_03_30; Type: ACL; Schema: realtime; Owner: supabase_admin
--

GRANT ALL ON TABLE realtime.messages_2026_03_30 TO postgres;
GRANT ALL ON TABLE realtime.messages_2026_03_30 TO dashboard_user;


--
-- Name: TABLE schema_migrations; Type: ACL; Schema: realtime; Owner: supabase_admin
--

GRANT ALL ON TABLE realtime.schema_migrations TO postgres;
GRANT ALL ON TABLE realtime.schema_migrations TO dashboard_user;
GRANT SELECT ON TABLE realtime.schema_migrations TO anon;
GRANT SELECT ON TABLE realtime.schema_migrations TO authenticated;
GRANT SELECT ON TABLE realtime.schema_migrations TO service_role;
GRANT ALL ON TABLE realtime.schema_migrations TO supabase_realtime_admin;


--
-- Name: TABLE subscription; Type: ACL; Schema: realtime; Owner: supabase_admin
--

GRANT ALL ON TABLE realtime.subscription TO postgres;
GRANT ALL ON TABLE realtime.subscription TO dashboard_user;
GRANT SELECT ON TABLE realtime.subscription TO anon;
GRANT SELECT ON TABLE realtime.subscription TO authenticated;
GRANT SELECT ON TABLE realtime.subscription TO service_role;
GRANT ALL ON TABLE realtime.subscription TO supabase_realtime_admin;


--
-- Name: SEQUENCE subscription_id_seq; Type: ACL; Schema: realtime; Owner: supabase_admin
--

GRANT ALL ON SEQUENCE realtime.subscription_id_seq TO postgres;
GRANT ALL ON SEQUENCE realtime.subscription_id_seq TO dashboard_user;
GRANT USAGE ON SEQUENCE realtime.subscription_id_seq TO anon;
GRANT USAGE ON SEQUENCE realtime.subscription_id_seq TO authenticated;
GRANT USAGE ON SEQUENCE realtime.subscription_id_seq TO service_role;
GRANT ALL ON SEQUENCE realtime.subscription_id_seq TO supabase_realtime_admin;


--
-- Name: TABLE buckets; Type: ACL; Schema: storage; Owner: supabase_storage_admin
--

GRANT ALL ON TABLE storage.buckets TO anon;
GRANT ALL ON TABLE storage.buckets TO authenticated;
GRANT ALL ON TABLE storage.buckets TO service_role;
GRANT ALL ON TABLE storage.buckets TO postgres;


--
-- Name: TABLE buckets_analytics; Type: ACL; Schema: storage; Owner: supabase_storage_admin
--

GRANT ALL ON TABLE storage.buckets_analytics TO service_role;
GRANT ALL ON TABLE storage.buckets_analytics TO authenticated;
GRANT ALL ON TABLE storage.buckets_analytics TO anon;


--
-- Name: TABLE iceberg_namespaces; Type: ACL; Schema: storage; Owner: supabase_storage_admin
--

GRANT ALL ON TABLE storage.iceberg_namespaces TO service_role;
GRANT SELECT ON TABLE storage.iceberg_namespaces TO authenticated;
GRANT SELECT ON TABLE storage.iceberg_namespaces TO anon;


--
-- Name: TABLE iceberg_tables; Type: ACL; Schema: storage; Owner: supabase_storage_admin
--

GRANT ALL ON TABLE storage.iceberg_tables TO service_role;
GRANT SELECT ON TABLE storage.iceberg_tables TO authenticated;
GRANT SELECT ON TABLE storage.iceberg_tables TO anon;


--
-- Name: TABLE objects; Type: ACL; Schema: storage; Owner: supabase_storage_admin
--

GRANT ALL ON TABLE storage.objects TO anon;
GRANT ALL ON TABLE storage.objects TO authenticated;
GRANT ALL ON TABLE storage.objects TO service_role;
GRANT ALL ON TABLE storage.objects TO postgres;


--
-- Name: TABLE prefixes; Type: ACL; Schema: storage; Owner: supabase_storage_admin
--

GRANT ALL ON TABLE storage.prefixes TO service_role;
GRANT ALL ON TABLE storage.prefixes TO authenticated;
GRANT ALL ON TABLE storage.prefixes TO anon;


--
-- Name: TABLE s3_multipart_uploads; Type: ACL; Schema: storage; Owner: supabase_storage_admin
--

GRANT ALL ON TABLE storage.s3_multipart_uploads TO service_role;
GRANT SELECT ON TABLE storage.s3_multipart_uploads TO authenticated;
GRANT SELECT ON TABLE storage.s3_multipart_uploads TO anon;


--
-- Name: TABLE s3_multipart_uploads_parts; Type: ACL; Schema: storage; Owner: supabase_storage_admin
--

GRANT ALL ON TABLE storage.s3_multipart_uploads_parts TO service_role;
GRANT SELECT ON TABLE storage.s3_multipart_uploads_parts TO authenticated;
GRANT SELECT ON TABLE storage.s3_multipart_uploads_parts TO anon;


--
-- Name: TABLE hooks; Type: ACL; Schema: supabase_functions; Owner: supabase_functions_admin
--

GRANT ALL ON TABLE supabase_functions.hooks TO anon;
GRANT ALL ON TABLE supabase_functions.hooks TO authenticated;
GRANT ALL ON TABLE supabase_functions.hooks TO service_role;


--
-- Name: SEQUENCE hooks_id_seq; Type: ACL; Schema: supabase_functions; Owner: supabase_functions_admin
--

GRANT ALL ON SEQUENCE supabase_functions.hooks_id_seq TO anon;
GRANT ALL ON SEQUENCE supabase_functions.hooks_id_seq TO authenticated;
GRANT ALL ON SEQUENCE supabase_functions.hooks_id_seq TO service_role;


--
-- Name: TABLE migrations; Type: ACL; Schema: supabase_functions; Owner: supabase_functions_admin
--

GRANT ALL ON TABLE supabase_functions.migrations TO anon;
GRANT ALL ON TABLE supabase_functions.migrations TO authenticated;
GRANT ALL ON TABLE supabase_functions.migrations TO service_role;


--
-- Name: TABLE secrets; Type: ACL; Schema: vault; Owner: supabase_admin
--

GRANT SELECT,REFERENCES,DELETE,TRUNCATE ON TABLE vault.secrets TO postgres WITH GRANT OPTION;
GRANT SELECT,DELETE ON TABLE vault.secrets TO service_role;


--
-- Name: TABLE decrypted_secrets; Type: ACL; Schema: vault; Owner: supabase_admin
--

GRANT SELECT,REFERENCES,DELETE,TRUNCATE ON TABLE vault.decrypted_secrets TO postgres WITH GRANT OPTION;
GRANT SELECT,DELETE ON TABLE vault.decrypted_secrets TO service_role;


--
-- Name: DEFAULT PRIVILEGES FOR SEQUENCES; Type: DEFAULT ACL; Schema: auth; Owner: supabase_auth_admin
--

ALTER DEFAULT PRIVILEGES FOR ROLE supabase_auth_admin IN SCHEMA auth GRANT ALL ON SEQUENCES  TO postgres;
ALTER DEFAULT PRIVILEGES FOR ROLE supabase_auth_admin IN SCHEMA auth GRANT ALL ON SEQUENCES  TO dashboard_user;


--
-- Name: DEFAULT PRIVILEGES FOR FUNCTIONS; Type: DEFAULT ACL; Schema: auth; Owner: supabase_auth_admin
--

ALTER DEFAULT PRIVILEGES FOR ROLE supabase_auth_admin IN SCHEMA auth GRANT ALL ON FUNCTIONS  TO postgres;
ALTER DEFAULT PRIVILEGES FOR ROLE supabase_auth_admin IN SCHEMA auth GRANT ALL ON FUNCTIONS  TO dashboard_user;


--
-- Name: DEFAULT PRIVILEGES FOR TABLES; Type: DEFAULT ACL; Schema: auth; Owner: supabase_auth_admin
--

ALTER DEFAULT PRIVILEGES FOR ROLE supabase_auth_admin IN SCHEMA auth GRANT ALL ON TABLES  TO postgres;
ALTER DEFAULT PRIVILEGES FOR ROLE supabase_auth_admin IN SCHEMA auth GRANT ALL ON TABLES  TO dashboard_user;


--
-- Name: DEFAULT PRIVILEGES FOR SEQUENCES; Type: DEFAULT ACL; Schema: extensions; Owner: supabase_admin
--

ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA extensions GRANT ALL ON SEQUENCES  TO postgres WITH GRANT OPTION;


--
-- Name: DEFAULT PRIVILEGES FOR FUNCTIONS; Type: DEFAULT ACL; Schema: extensions; Owner: supabase_admin
--

ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA extensions GRANT ALL ON FUNCTIONS  TO postgres WITH GRANT OPTION;


--
-- Name: DEFAULT PRIVILEGES FOR TABLES; Type: DEFAULT ACL; Schema: extensions; Owner: supabase_admin
--

ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA extensions GRANT ALL ON TABLES  TO postgres WITH GRANT OPTION;


--
-- Name: DEFAULT PRIVILEGES FOR SEQUENCES; Type: DEFAULT ACL; Schema: graphql; Owner: supabase_admin
--

ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA graphql GRANT ALL ON SEQUENCES  TO postgres;
ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA graphql GRANT ALL ON SEQUENCES  TO anon;
ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA graphql GRANT ALL ON SEQUENCES  TO authenticated;
ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA graphql GRANT ALL ON SEQUENCES  TO service_role;


--
-- Name: DEFAULT PRIVILEGES FOR FUNCTIONS; Type: DEFAULT ACL; Schema: graphql; Owner: supabase_admin
--

ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA graphql GRANT ALL ON FUNCTIONS  TO postgres;
ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA graphql GRANT ALL ON FUNCTIONS  TO anon;
ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA graphql GRANT ALL ON FUNCTIONS  TO authenticated;
ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA graphql GRANT ALL ON FUNCTIONS  TO service_role;


--
-- Name: DEFAULT PRIVILEGES FOR TABLES; Type: DEFAULT ACL; Schema: graphql; Owner: supabase_admin
--

ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA graphql GRANT ALL ON TABLES  TO postgres;
ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA graphql GRANT ALL ON TABLES  TO anon;
ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA graphql GRANT ALL ON TABLES  TO authenticated;
ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA graphql GRANT ALL ON TABLES  TO service_role;


--
-- Name: DEFAULT PRIVILEGES FOR SEQUENCES; Type: DEFAULT ACL; Schema: graphql_public; Owner: supabase_admin
--

ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA graphql_public GRANT ALL ON SEQUENCES  TO postgres;
ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA graphql_public GRANT ALL ON SEQUENCES  TO anon;
ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA graphql_public GRANT ALL ON SEQUENCES  TO authenticated;
ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA graphql_public GRANT ALL ON SEQUENCES  TO service_role;


--
-- Name: DEFAULT PRIVILEGES FOR FUNCTIONS; Type: DEFAULT ACL; Schema: graphql_public; Owner: supabase_admin
--

ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA graphql_public GRANT ALL ON FUNCTIONS  TO postgres;
ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA graphql_public GRANT ALL ON FUNCTIONS  TO anon;
ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA graphql_public GRANT ALL ON FUNCTIONS  TO authenticated;
ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA graphql_public GRANT ALL ON FUNCTIONS  TO service_role;


--
-- Name: DEFAULT PRIVILEGES FOR TABLES; Type: DEFAULT ACL; Schema: graphql_public; Owner: supabase_admin
--

ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA graphql_public GRANT ALL ON TABLES  TO postgres;
ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA graphql_public GRANT ALL ON TABLES  TO anon;
ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA graphql_public GRANT ALL ON TABLES  TO authenticated;
ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA graphql_public GRANT ALL ON TABLES  TO service_role;


--
-- Name: DEFAULT PRIVILEGES FOR SEQUENCES; Type: DEFAULT ACL; Schema: public; Owner: postgres
--

ALTER DEFAULT PRIVILEGES FOR ROLE postgres IN SCHEMA public GRANT ALL ON SEQUENCES  TO postgres;
ALTER DEFAULT PRIVILEGES FOR ROLE postgres IN SCHEMA public GRANT ALL ON SEQUENCES  TO anon;
ALTER DEFAULT PRIVILEGES FOR ROLE postgres IN SCHEMA public GRANT ALL ON SEQUENCES  TO authenticated;
ALTER DEFAULT PRIVILEGES FOR ROLE postgres IN SCHEMA public GRANT ALL ON SEQUENCES  TO service_role;


--
-- Name: DEFAULT PRIVILEGES FOR SEQUENCES; Type: DEFAULT ACL; Schema: public; Owner: supabase_admin
--

ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA public GRANT ALL ON SEQUENCES  TO postgres;
ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA public GRANT ALL ON SEQUENCES  TO anon;
ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA public GRANT ALL ON SEQUENCES  TO authenticated;
ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA public GRANT ALL ON SEQUENCES  TO service_role;


--
-- Name: DEFAULT PRIVILEGES FOR FUNCTIONS; Type: DEFAULT ACL; Schema: public; Owner: postgres
--

ALTER DEFAULT PRIVILEGES FOR ROLE postgres IN SCHEMA public GRANT ALL ON FUNCTIONS  TO postgres;
ALTER DEFAULT PRIVILEGES FOR ROLE postgres IN SCHEMA public GRANT ALL ON FUNCTIONS  TO anon;
ALTER DEFAULT PRIVILEGES FOR ROLE postgres IN SCHEMA public GRANT ALL ON FUNCTIONS  TO authenticated;
ALTER DEFAULT PRIVILEGES FOR ROLE postgres IN SCHEMA public GRANT ALL ON FUNCTIONS  TO service_role;


--
-- Name: DEFAULT PRIVILEGES FOR FUNCTIONS; Type: DEFAULT ACL; Schema: public; Owner: supabase_admin
--

ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA public GRANT ALL ON FUNCTIONS  TO postgres;
ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA public GRANT ALL ON FUNCTIONS  TO anon;
ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA public GRANT ALL ON FUNCTIONS  TO authenticated;
ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA public GRANT ALL ON FUNCTIONS  TO service_role;


--
-- Name: DEFAULT PRIVILEGES FOR TABLES; Type: DEFAULT ACL; Schema: public; Owner: postgres
--

ALTER DEFAULT PRIVILEGES FOR ROLE postgres IN SCHEMA public GRANT ALL ON TABLES  TO postgres;
ALTER DEFAULT PRIVILEGES FOR ROLE postgres IN SCHEMA public GRANT ALL ON TABLES  TO anon;
ALTER DEFAULT PRIVILEGES FOR ROLE postgres IN SCHEMA public GRANT ALL ON TABLES  TO authenticated;
ALTER DEFAULT PRIVILEGES FOR ROLE postgres IN SCHEMA public GRANT ALL ON TABLES  TO service_role;


--
-- Name: DEFAULT PRIVILEGES FOR TABLES; Type: DEFAULT ACL; Schema: public; Owner: supabase_admin
--

ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA public GRANT ALL ON TABLES  TO postgres;
ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA public GRANT ALL ON TABLES  TO anon;
ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA public GRANT ALL ON TABLES  TO authenticated;
ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA public GRANT ALL ON TABLES  TO service_role;


--
-- Name: DEFAULT PRIVILEGES FOR SEQUENCES; Type: DEFAULT ACL; Schema: realtime; Owner: supabase_admin
--

ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA realtime GRANT ALL ON SEQUENCES  TO postgres;
ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA realtime GRANT ALL ON SEQUENCES  TO dashboard_user;


--
-- Name: DEFAULT PRIVILEGES FOR FUNCTIONS; Type: DEFAULT ACL; Schema: realtime; Owner: supabase_admin
--

ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA realtime GRANT ALL ON FUNCTIONS  TO postgres;
ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA realtime GRANT ALL ON FUNCTIONS  TO dashboard_user;


--
-- Name: DEFAULT PRIVILEGES FOR TABLES; Type: DEFAULT ACL; Schema: realtime; Owner: supabase_admin
--

ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA realtime GRANT ALL ON TABLES  TO postgres;
ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA realtime GRANT ALL ON TABLES  TO dashboard_user;


--
-- Name: DEFAULT PRIVILEGES FOR SEQUENCES; Type: DEFAULT ACL; Schema: storage; Owner: postgres
--

ALTER DEFAULT PRIVILEGES FOR ROLE postgres IN SCHEMA storage GRANT ALL ON SEQUENCES  TO postgres;
ALTER DEFAULT PRIVILEGES FOR ROLE postgres IN SCHEMA storage GRANT ALL ON SEQUENCES  TO anon;
ALTER DEFAULT PRIVILEGES FOR ROLE postgres IN SCHEMA storage GRANT ALL ON SEQUENCES  TO authenticated;
ALTER DEFAULT PRIVILEGES FOR ROLE postgres IN SCHEMA storage GRANT ALL ON SEQUENCES  TO service_role;


--
-- Name: DEFAULT PRIVILEGES FOR FUNCTIONS; Type: DEFAULT ACL; Schema: storage; Owner: postgres
--

ALTER DEFAULT PRIVILEGES FOR ROLE postgres IN SCHEMA storage GRANT ALL ON FUNCTIONS  TO postgres;
ALTER DEFAULT PRIVILEGES FOR ROLE postgres IN SCHEMA storage GRANT ALL ON FUNCTIONS  TO anon;
ALTER DEFAULT PRIVILEGES FOR ROLE postgres IN SCHEMA storage GRANT ALL ON FUNCTIONS  TO authenticated;
ALTER DEFAULT PRIVILEGES FOR ROLE postgres IN SCHEMA storage GRANT ALL ON FUNCTIONS  TO service_role;


--
-- Name: DEFAULT PRIVILEGES FOR TABLES; Type: DEFAULT ACL; Schema: storage; Owner: postgres
--

ALTER DEFAULT PRIVILEGES FOR ROLE postgres IN SCHEMA storage GRANT ALL ON TABLES  TO postgres;
ALTER DEFAULT PRIVILEGES FOR ROLE postgres IN SCHEMA storage GRANT ALL ON TABLES  TO anon;
ALTER DEFAULT PRIVILEGES FOR ROLE postgres IN SCHEMA storage GRANT ALL ON TABLES  TO authenticated;
ALTER DEFAULT PRIVILEGES FOR ROLE postgres IN SCHEMA storage GRANT ALL ON TABLES  TO service_role;


--
-- Name: DEFAULT PRIVILEGES FOR SEQUENCES; Type: DEFAULT ACL; Schema: supabase_functions; Owner: postgres
--

ALTER DEFAULT PRIVILEGES FOR ROLE postgres IN SCHEMA supabase_functions GRANT ALL ON SEQUENCES  TO postgres;
ALTER DEFAULT PRIVILEGES FOR ROLE postgres IN SCHEMA supabase_functions GRANT ALL ON SEQUENCES  TO anon;
ALTER DEFAULT PRIVILEGES FOR ROLE postgres IN SCHEMA supabase_functions GRANT ALL ON SEQUENCES  TO authenticated;
ALTER DEFAULT PRIVILEGES FOR ROLE postgres IN SCHEMA supabase_functions GRANT ALL ON SEQUENCES  TO service_role;


--
-- Name: DEFAULT PRIVILEGES FOR FUNCTIONS; Type: DEFAULT ACL; Schema: supabase_functions; Owner: postgres
--

ALTER DEFAULT PRIVILEGES FOR ROLE postgres IN SCHEMA supabase_functions GRANT ALL ON FUNCTIONS  TO postgres;
ALTER DEFAULT PRIVILEGES FOR ROLE postgres IN SCHEMA supabase_functions GRANT ALL ON FUNCTIONS  TO anon;
ALTER DEFAULT PRIVILEGES FOR ROLE postgres IN SCHEMA supabase_functions GRANT ALL ON FUNCTIONS  TO authenticated;
ALTER DEFAULT PRIVILEGES FOR ROLE postgres IN SCHEMA supabase_functions GRANT ALL ON FUNCTIONS  TO service_role;


--
-- Name: DEFAULT PRIVILEGES FOR TABLES; Type: DEFAULT ACL; Schema: supabase_functions; Owner: postgres
--

ALTER DEFAULT PRIVILEGES FOR ROLE postgres IN SCHEMA supabase_functions GRANT ALL ON TABLES  TO postgres;
ALTER DEFAULT PRIVILEGES FOR ROLE postgres IN SCHEMA supabase_functions GRANT ALL ON TABLES  TO anon;
ALTER DEFAULT PRIVILEGES FOR ROLE postgres IN SCHEMA supabase_functions GRANT ALL ON TABLES  TO authenticated;
ALTER DEFAULT PRIVILEGES FOR ROLE postgres IN SCHEMA supabase_functions GRANT ALL ON TABLES  TO service_role;


--
-- Name: issue_graphql_placeholder; Type: EVENT TRIGGER; Schema: -; Owner: supabase_admin
--

CREATE EVENT TRIGGER issue_graphql_placeholder ON sql_drop
         WHEN TAG IN ('DROP EXTENSION')
   EXECUTE FUNCTION extensions.set_graphql_placeholder();


ALTER EVENT TRIGGER issue_graphql_placeholder OWNER TO supabase_admin;

--
-- Name: issue_pg_cron_access; Type: EVENT TRIGGER; Schema: -; Owner: supabase_admin
--

CREATE EVENT TRIGGER issue_pg_cron_access ON ddl_command_end
         WHEN TAG IN ('CREATE EXTENSION')
   EXECUTE FUNCTION extensions.grant_pg_cron_access();


ALTER EVENT TRIGGER issue_pg_cron_access OWNER TO supabase_admin;

--
-- Name: issue_pg_graphql_access; Type: EVENT TRIGGER; Schema: -; Owner: supabase_admin
--

CREATE EVENT TRIGGER issue_pg_graphql_access ON ddl_command_end
         WHEN TAG IN ('CREATE FUNCTION')
   EXECUTE FUNCTION extensions.grant_pg_graphql_access();


ALTER EVENT TRIGGER issue_pg_graphql_access OWNER TO supabase_admin;

--
-- Name: issue_pg_net_access; Type: EVENT TRIGGER; Schema: -; Owner: supabase_admin
--

CREATE EVENT TRIGGER issue_pg_net_access ON ddl_command_end
         WHEN TAG IN ('CREATE EXTENSION')
   EXECUTE FUNCTION extensions.grant_pg_net_access();


ALTER EVENT TRIGGER issue_pg_net_access OWNER TO supabase_admin;

--
-- Name: pgrst_ddl_watch; Type: EVENT TRIGGER; Schema: -; Owner: supabase_admin
--

CREATE EVENT TRIGGER pgrst_ddl_watch ON ddl_command_end
   EXECUTE FUNCTION extensions.pgrst_ddl_watch();


ALTER EVENT TRIGGER pgrst_ddl_watch OWNER TO supabase_admin;

--
-- Name: pgrst_drop_watch; Type: EVENT TRIGGER; Schema: -; Owner: supabase_admin
--

CREATE EVENT TRIGGER pgrst_drop_watch ON sql_drop
   EXECUTE FUNCTION extensions.pgrst_drop_watch();


ALTER EVENT TRIGGER pgrst_drop_watch OWNER TO supabase_admin;

--
-- PostgreSQL database dump complete
--

