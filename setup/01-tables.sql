CREATE TABLE states (
  state_id                    uuid           DEFAULT gen_random_uuid() PRIMARY KEY,
  state_name                  VARCHAR (128)  NOT NULL,
  state_abbreviation          VARCHAR (2)    NOT NULL
);

CREATE TABLE municipalities (
  municipality_id             uuid           DEFAULT gen_random_uuid() PRIMARY KEY,
  municipality_name           VARCHAR (128)  NOT NULL,
  state_id                    uuid           REFERENCES states (state_id)
);

CREATE TABLE districts (
  district_id                  uuid           DEFAULT gen_random_uuid() PRIMARY KEY,
  district_name                VARCHAR (128)  NOT NULL,
  municipality_id              uuid           REFERENCES municipalities (municipality_id)
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

CREATE TABLE drain (
  drain_id                     uuid           DEFAULT gen_random_uuid() PRIMARY KEY,
  drain_type                   drain_type,
  cover_type                   cover_type,
  network_type                 network_type,
  status                       drain_status,
  fullness                     drain_fullness,
  length                       REAL,
  width                        REAL,
  depth                        REAL,
  volume                       REAL           GENERATED ALWAYS AS (length * width * depth) STORED,
  coordinates                  POINT          NOT NULL,
  notes                        VARCHAR (512),
  address                      VARCHAR (64),
  number                       VARCHAR (16),
  district_id                  uuid           REFERENCES districts (district_id)
);

--  created_by                   uuid           REFERENCES users (user_id),
--  last_updated_by              uuid           REFERENCES users (user_id),
--  created_on                   TIMESTAMP      WITH TIME ZONE NOT NULL,
--  last_updated_on              TIMESTAMP      WITH TIME ZONE DEFAULT CURRENT_TIMESTAMP NOT NULL

CREATE TABLE io (
  io_id                        uuid           DEFAULT gen_random_uuid() PRIMARY KEY,
  io_type                      io_type        NOT NULL,
  diameter                     REAL,
  depth                        REAL,
  angle                        REAL,
  drain_id                     uuid           REFERENCES drain (drain_id)
);

CREATE TABLE media (
  media_id                     uuid           DEFAULT gen_random_uuid() PRIMARY KEY,
  media_data                   BYTEA          NOT NULL,
  media_format                 VARCHAR(32)    NOT NULL,
  drain_id                     uuid           REFERENCES drain (drain_id)
);

