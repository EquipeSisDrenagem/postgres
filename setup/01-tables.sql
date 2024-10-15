CREATE TABLE states (
  id                           uuid           DEFAULT gen_random_uuid() PRIMARY KEY,
  name                         VARCHAR (128)  NOT NULL,
  abbreviation                 VARCHAR (2)    NOT NULL
);

CREATE TABLE municipalities ( 
  id                           uuid           DEFAULT gen_random_uuid() PRIMARY KEY,
  name                         VARCHAR (128)  NOT NULL,
  state_id                     uuid           REFERENCES states (id)
);

CREATE TABLE districts (
  id                           uuid           DEFAULT gen_random_uuid() PRIMARY KEY,
  name                         VARCHAR (128)  NOT NULL,
  municipality_id              uuid           REFERENCES municipalities (id)
);

CREATE TABLE users (
  id                           uuid           DEFAULT gen_random_uuid() PRIMARY KEY,
  cpf                          VARCHAR (11)   NOT NULL UNIQUE,
  email                        VARCHAR        NOT NULL UNIQUE,
  name                         VARCHAR        NOT NULL,
  phone                        VARCHAR        NOT NULL,
  password                     VARCHAR        NOT NULL,
  role                         user_role      NOT NULL,
  active                       boolean        DEFAULT TRUE
);

-- created_on                   TIMESTAMP      WITH TIME ZONE NOT NULL

CREATE TABLE drains (
  id                           uuid           DEFAULT gen_random_uuid() PRIMARY KEY,
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
  district_id                  uuid           REFERENCES districts (id)
);

--  created_by                   uuid           REFERENCES users (user_id),
--  last_updated_by              uuid           REFERENCES users (user_id),
--  created_on                   TIMESTAMP      WITH TIME ZONE NOT NULL,
--  last_updated_on              TIMESTAMP      WITH TIME ZONE DEFAULT CURRENT_TIMESTAMP NOT NULL

CREATE TABLE io (
  id                           uuid           DEFAULT gen_random_uuid() PRIMARY KEY,
  type                         io_type        NOT NULL,
  primary_drain_id             uuid           REFERENCES drains (id),
  secondary_drain_id           uuid           REFERENCES drains (id),
  diameter                     REAL,
  depth                        REAL,
  angle                        REAL
);

CREATE TABLE media (
  id                           uuid           DEFAULT gen_random_uuid() PRIMARY KEY,
  data                         BYTEA          NOT NULL,
  format                       VARCHAR(32)    NOT NULL,
  drain_id                     uuid           REFERENCES drains (id)
);

