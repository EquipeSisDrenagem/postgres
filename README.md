# sisdrenagem-db

Esse repositório contém os arquivos necessários para fazer a configuração
inicial do banco de dados do projeto Sisdrenagem.

A imagem Docker gerada se baseia na [imagem oficial do
Postgres](https://hub.docker.com/_/postgres/), contendo apenas o código
necessário para mover os arquivos `.sql` contidos no diretório `setup` para
dentro da imagem. Esses arquivos são executados automaticamente quando a imagem
é executada. Para garantir a ordem de execução, é necessário utilizar os
numerais no início dos nomes dos arquivos.

O diretório `migrations` contém quaisquer arquivos necessários para fazer
eventuais migrações no banco de dados.
