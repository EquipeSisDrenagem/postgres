CREATE TYPE drain_type AS ENUM (
  'Caixa Ralo',
  'PV',
  'PV Boca Ralo',
  'Mata Burro',
  'Outros'
);

CREATE TYPE cover_type AS ENUM (
  'Grelha Concreto',
  'Grelha Ferro',
  'Grelha Plástico',
  'Tampão Concreto Cego',
  'Tampão Concreto Furado',
  'Tampão Concreto Duplo',
  'Tampão Redondo'
);

CREATE TYPE network_type as ENUM (
  'Concreto',
  'PEAD',
  'PVC',
  'Aço'
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
  'Bom',
  'Danificado',
  'Irregular'
);

CREATE TYPE drain_fullness AS ENUM (
  'Baixo',
  'Médio',
  'Crítico'
);

CREATE TYPE io_type AS ENUM (
  'input',
  'output'
);

CREATE TYPE user_role AS ENUM (
  'admin',
  'field',
  'office'
);
