INSERT INTO states (name, abbreviation)
VALUES ('Rio de Janeiro', 'RJ');

INSERT INTO municipalities (name, state_id)
VALUES ('Niterói', (SELECT id FROM states WHERE name = 'Rio de Janeiro'));

WITH city AS (
  SELECT id
  FROM municipalities
  WHERE name = 'Niteroi'
)
INSERT INTO districts (name, municipality_id)
SELECT name, city.id
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
  ) AS districts (name)
CROSS JOIN city;
