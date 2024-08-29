INSERT INTO states (state_name, state_abbreviation)
VALUES ('Rio de Janeiro', 'RJ');

INSERT INTO municipalities (municipality_name, state_id)
VALUES ('Niteroi', (SELECT state_id FROM states WHERE state_name = 'Rio de Janeiro'));

WITH city AS (
  SELECT municipality_id
  FROM municipalities
  WHERE municipality_name = 'Niteroi'
)
INSERT INTO districts (district_name, municipality_id)
SELECT district_name, city.municipality_id
FROM (
  VALUES
    ('Badu'),
    ('Bairro de Fátima'),
    ('Baldeador'),
    ('Barreto'),
    ('Boa Viagem'),
    ('Cachoeiras'),
    ('Cafubá'),
    ('Camboinhas'),
    ('Cantagalo'),
    ('Caramujo'),
    ('Centro'),
    ('Charitas'),
    ('Cubango'),
    ('Engenho do Mato'),
    ('Engenhoca'),
    ('Fonseca'),
    ('Gragoatá'),
    ('Icaraí'),
    ('Ilha da Conceição'),
    ('Ingá'),
    ('Itacoatiara'),
    ('Itaipu'),
    ('Ititioca'),
    ('Jacaré'),
    ('Jardim Imbuí'),
    ('Jurujuba'),
    ('Largo da Batalha'),
    ('Maceió'),
    ('Maravista'),
    ('Maria Paula'),
    ('Matapaca'),
    ('Morro do Estado'),
    ('Muriqui'),
    ('Piratininga'),
    ('Ponta d''Areia'),
    ('Pé Pequeno'),
    ('Rio do Ouro'),
    ('Santa Bárbara'),
    ('Santa Rosa'),
    ('Santana'),
    ('Santo Antônio'),
    ('Sapê'),
    ('Serra Grande'),
    ('São Domingos'),
    ('São Francisco'),
    ('São Lourenço'),
    ('Tenente Jardim'),
    ('Vila Progresso'),
    ('Viradouro'),
    ('Vital Brazil'),
    ('Viçoso Jardim'),
    ('Várzea das Moças')
  ) AS districts (district_name)
CROSS JOIN city;
