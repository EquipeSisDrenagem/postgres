INSERT INTO states (state_name, state_abbreviation)
VALUES ('Rio de Janeiro', 'RJ');

INSERT INTO municipalities (municipality_name, state_id)
VALUES ('Niterói', (SELECT state_id FROM states WHERE state_name = 'Rio de Janeiro'));

WITH city (municipality_id) AS (
  SELECT municipality_id
  FROM municipalities
  WHERE municipality_name = 'Niterói'
)
INSERT INTO districts (district_name, municipality_id)
VALUES (
  ('Badu', city.municipality_id),
  ('Bairro de Fátima', city.municipality_id),
  ('Baldeador', city.municipality_id),
  ('Barreto', city.municipality_id),
  ('Boa Viagem', city.municipality_id),
  ('Cachoeiras', city.municipality_id),
  ('Cafubá', city.municipality_id),
  ('Camboinhas', city.municipality_id),
  ('Cantagalo', city.municipality_id),
  ('Caramujo', city.municipality_id),
  ('Centro', city.municipality_id),
  ('Charitas', city.municipality_id),
  ('Cubango', city.municipality_id),
  ('Engenho do Mato', city.municipality_id),
  ('Engenhoca', city.municipality_id),
  ('Fonseca', city.municipality_id),
  ('Gragoatá', city.municipality_id),
  ('Icaraí', city.municipality_id),
  ('Ilha da Conceição', city.municipality_id),
  ('Ingá', city.municipality_id),
  ('Itacoatiara', city.municipality_id),
  ('Itaipu', city.municipality_id),
  ('Ititioca', city.municipality_id),
  ('Jacaré', city.municipality_id),
  ('Jardim Imbuí', city.municipality_id),
  ('Jurujuba', city.municipality_id),
  ('Largo da Batalha', city.municipality_id),
  ('Maceió', city.municipality_id),
  ('Maravista', city.municipality_id),
  ('Maria Paula', city.municipality_id),
  ('Matapaca', city.municipality_id),
  ('Morro do Estado', city.municipality_id),
  ('Muriqui', city.municipality_id),
  ('Piratininga', city.municipality_id),
  ('Ponta d''Areia', city.municipality_id),
  ('Pé Pequeno', city.municipality_id),
  ('Rio do Ouro', city.municipality_id),
  ('Santa Bárbara', city.municipality_id),
  ('Santa Rosa', city.municipality_id),
  ('Santana', city.municipality_id),
  ('Santo Antônio', city.municipality_id),
  ('Sapê', city.municipality_id),
  ('Serra Grande', city.municipality_id),
  ('São Domingos', city.municipality_id),
  ('São Francisco', city.municipality_id),
  ('São Lourenço', city.municipality_id),
  ('Tenente Jardim', city.municipality_id),
  ('Vila Progresso', city.municipality_id),
  ('Viradouro', city.municipality_id),
  ('Vital Brazil', city.municipality_id),
  ('Viçoso Jardim', city.municipality_id),
  ('Várzea das Moças', city.municipality_id)
);
