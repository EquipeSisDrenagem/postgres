WITH
  state AS (
    INSERT INTO states (state_name, state_abbreviation)
    VALUES ('Rio de Janeiro', 'RJ')
    RETURNING state_id
  ),
  municipality AS (
    INSERT INTO municipalities (municipality_name, state_id)
    VALUES ('Niterói', state.state_id)
    RETURNING municipality_id
  )
INSERT INTO districts (district_name, municipality_id)
VALUES (
  ('Badu', municipality.municipality_id),
  ('Bairro de Fátima', municipality.municipality_id),
  ('Baldeador', municipality.municipality_id),
  ('Barreto', municipality.municipality_id),
  ('Boa Viagem', municipality.municipality_id),
  ('Cachoeiras', municipality.municipality_id),
  ('Cafubá', municipality.municipality_id),
  ('Camboinhas', municipality.municipality_id),
  ('Cantagalo', municipality.municipality_id),
  ('Caramujo', municipality.municipality_id),
  ('Centro', municipality.municipality_id),
  ('Charitas', municipality.municipality_id),
  ('Cubango', municipality.municipality_id),
  ('Engenho do Mato', municipality.municipality_id),
  ('Engenhoca', municipality.municipality_id),
  ('Fonseca', municipality.municipality_id),
  ('Gragoatá', municipality.municipality_id),
  ('Icaraí', municipality.municipality_id),
  ('Ilha da Conceição', municipality.municipality_id),
  ('Ingá', municipality.municipality_id),
  ('Itacoatiara', municipality.municipality_id),
  ('Itaipu', municipality.municipality_id),
  ('Ititioca', municipality.municipality_id),
  ('Jacaré', municipality.municipality_id),
  ('Jardim Imbuí', municipality.municipality_id),
  ('Jurujuba', municipality.municipality_id),
  ('Largo da Batalha', municipality.municipality_id),
  ('Maceió', municipality.municipality_id),
  ('Maravista', municipality.municipality_id),
  ('Maria Paula', municipality.municipality_id),
  ('Matapaca', municipality.municipality_id),
  ('Morro do Estado', municipality.municipality_id),
  ('Muriqui', municipality.municipality_id),
  ('Piratininga', municipality.municipality_id),
  ("Ponta d'Areia", municipality.municipality_id),
  ('Pé Pequeno', municipality.municipality_id),
  ('Rio do Ouro', municipality.municipality_id),
  ('Santa Bárbara', municipality.municipality_id),
  ('Santa Rosa', municipality.municipality_id),
  ('Santana', municipality.municipality_id),
  ('Santo Antônio', municipality.municipality_id),
  ('Sapê', municipality.municipality_id),
  ('Serra Grande', municipality.municipality_id),
  ('São Domingos', municipality.municipality_id),
  ('São Francisco', municipality.municipality_id),
  ('São Lourenço', municipality.municipality_id),
  ('Tenente Jardim', municipality.municipality_id),
  ('Vila Progresso', municipality.municipality_id),
  ('Viradouro', municipality.municipality_id),
  ('Vital Brazil', municipality.municipality_id),
  ('Viçoso Jardim', municipality.municipality_id),
  ('Várzea das Moças', municipality.municipality_id)
);
