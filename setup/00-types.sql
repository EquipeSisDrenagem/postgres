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
  'danificado',
  'irregular'
);

CREATE TYPE drain_fullness AS ENUM (
  'baixo',
  'medio',
  'critico'
);

CREATE TYPE io_t AS (
  diameter                     REAL,
  depth                        REAL,
  angle                        REAL
);

