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

CREATE TABLE inputs (
  inputs_id                    uuid           DEFAULT gen_random_uuid() PRIMARY KEY,
  inputs                       io_t[]
);

CREATE TABLE outputs (
  outputs_id                   uuid           DEFAULT gen_random_uuid() PRIMARY KEY,
  outputs                      io_t[]         NOT NULL
);

CREATE TABLE images (
  image_id                     uuid           DEFAULT gen_random_uuid() PRIMARY KEY,
  images                       bytea[]
);

CREATE TABLE video (
  video_id                     uuid           DEFAULT gen_random_uuid() PRIMARY KEY,
  video                        bytea
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

CREATE TABLE standard (
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
  inputs_id                    uuid           REFERENCES inputs (inputs_id),
  outputs_id                   uuid           REFERENCES outputs (outputs_id),
  image_id                     uuid           REFERENCES images (image_id),
  video_id                     uuid           REFERENCES video (video_id),
  created_by                   uuid           REFERENCES users (user_id),
  last_updated_by              uuid           REFERENCES users (user_id),
  created_on                   TIMESTAMP      WITH TIME ZONE NOT NULL,
  last_updated_on              TIMESTAMP      WITH TIME ZONE DEFAULT CURRENT_TIMESTAMP NOT NULL
);

CREATE TABLE nonstandard (
  drain_id                     uuid           DEFAULT gen_random_uuid() PRIMARY KEY,
  coordinates                  POINT          NOT NULL,
  notes                        VARCHAR (512),
  address                      VARCHAR (64),
  number                       VARCHAR (16),
  district_id                  uuid           REFERENCES districts (district_id),
  image_id                     uuid           REFERENCES images (image_id),
  video_id                     uuid           REFERENCES video (video_id),
  created_by                   uuid           REFERENCES users (user_id),
  last_updated_by              uuid           REFERENCES users (user_id),
  created_on                   TIMESTAMP      WITH TIME ZONE NOT NULL,
  last_updated_on              TIMESTAMP      WITH TIME ZONE DEFAULT CURRENT_TIMESTAMP NOT NULL
);
