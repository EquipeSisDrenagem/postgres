CREATE TYPE drain_type AS ENUM (
  'caixa_ralo',
  'pv',
  'pv_boca_ralo',
  'mata_burro'
);

CREATE TYPE cover_type AS ENUM (
  'grelha_concreto',
  'grelha_ferro',
  'grelha_plastico',
  'tampao_concreto_cego',
  'tampao_concreto_furado',
  'tampao_concreto_duplo',
  'tampao_redondo'
);

CREATE TYPE network_type as ENUM (
  'concreto',
  'pead',
  'pvc',
  'aco'
);

CREATE TYPE diameter AS ENUM (
  '100',
  '200',
  '300',
  '400',
  '500',
  '600',
  '700',
  '800',
  '900',
  '1000',
  '1100',
  '1200'
);

CREATE TYPE drain_status AS ENUM (
  'ok',
  'damaged'
);

CREATE TYPE drain_fullness AS ENUM (
  'ok',
  'critical',
  'full' 
);

CREATE TYPE drain_io AS (
  diameter                     REAL           NOT NULL,
  depth                        REAL           NOT NULL,
  angle                        REAL           NOT NULL
);

CREATE TABLE users (
  user_id                      uuid           DEFAULT gen_random_uuid() PRIMARY KEY,
  email                        VARCHAR        NOT NULL UNIQUE,
  cpf                          VARCHAR (11)   NOT NULL UNIQUE,
  full_name                    VARCHAR        NOT NULL,
  phone                        VARCHAR        NOT NULL,
  password                     VARCHAR        NOT NULL,
  created_on                   TIMESTAMP      WITH TIME ZONE NOT NULL
);

CREATE TABLE drains (
  drain_id                     uuid           DEFAULT gen_random_uuid() PRIMARY KEY,
  drain_type                   drain_type     NOT NULL,
  cover_type                   cover_type     NOT NULL,
  network_type                 network_type   NOT NULL,
  status                       drain_status   NOT NULL,
  fullness                     drain_fullness NOT NULL,
  length                       REAL           NOT NULL,
  width                        REAL           NOT NULL,
  depth                        REAL           NOT NULL,
  volume                       REAL           GENERATED ALWAYS AS (length * width * depth) STORED,
  coordinates                  POINT          NOT NULL,
  notes                        VARCHAR (512),
  address                      VARCHAR (64),
  number                       VARCHAR (16),
  district_id                  uuid           REFERENCES districts (district_id),
  io_id                        uuid           REFERENCES drain_io (io_id),
  media_id                     uuid           REFERENCES image_media (media_id),
  created_by                   uuid           REFERENCES user (user_id),
  last_updated_by              uuid           REFERENCES user (user_id),
  created_on                   TIMESTAMP      WITH TIME ZONE NOT NULL,
  last_updated_on              TIMESTAMP      WITH TIME ZONE DEFAULT CURRENT_TIMESTAMP NOT NULL,
);

CREATE TABLE districts (
  district_id                  uuid           DEFAULT gen_random_uuid() PRIMARY KEY,
  district_name                VARCHAR (128)  NOT NULL,
  municipality_id              uuid           REFERENCES municipalities (municipality_id)
);

CREATE TABLE municipalities (
  municipality_id             uuid           DEFAULT gen_random_uuid() PRIMARY KEY,
  municipality_name           VARCHAR (128)  NOT NULL,
  state_id                    uuid           REFERENCES states (state_id)
);

CREATE TABLE states (
  state_id                    uuid           DEFAULT gen_random_uuid() PRIMARY KEY,
  state_name                  VARCHAR (128)  NOT NULL,
  state_abbreviation          VARCHAR (2)    NOT NULL
);

CREATE TABLE drain_io (
  io_id                        uuid           DEFAULT gen_random_uuid() PRIMARY KEY,
  inputs                       drain_io[],
  outputs                      drain_io[]     NOT NULL
);

CREATE TABLE image_media (
  media_id                     uuid           DEFAULT gen_random_uuid() PRIMARY KEY,
  images                       bytea[],
  video                        bytea
);

CREATE TRIGGER created_by
	BEFORE INSERT ON drains
	FOR EACH ROW
	EXECUTE PROCEDURE insert_username (username);

CREATE TRIGGER created_on
	BEFORE INSERT ON drains
	FOR EACH ROW
	EXECUTE PROCEDURE moddatetime (moddate);

CREATE TRIGGER created_on
	BEFORE INSERT ON users
	FOR EACH ROW
	EXECUTE PROCEDURE moddatetime (moddate);

CREATE TRIGGER updated_by
	BEFORE UPDATE ON drains
	FOR EACH ROW
	EXECUTE PROCEDURE insert_username (username);

CREATE TRIGGER updated_on
	BEFORE UPDATE ON drains
	FOR EACH ROW
	EXECUTE PROCEDURE moddatetime (datetime);
