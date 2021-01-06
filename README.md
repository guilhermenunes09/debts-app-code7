# LEIA-ME

Para utilizar esta aplicação é necessário Rails v5+

Instale todas as gemas e dependências necessárias para rodar no servidor.

Primeiro clone o projeto no terminal

$ git clone git@github.com:guilhermenunes09/debts-app-code7.git
$ cd debts-app-code7

$ bundle install

## Instalando MongoDB

Siga as orientações, de acordo com seus sistema e configuração:
https://docs.mongodb.com/guides/server/install/

Gerar as configurações padrões do MongoDB
$ bin/rails g mongoid:config

Para mais detalhes em como instalar MongoDB e conectar ao Rails acesse:
https://docs.mongodb.com/mongoid/current/tutorials/getting-started-rails/

Inicie o servidor
$ rails server

## API
O endereço da API se resume a
/api/debts
/api/debts/{id_do_cliente}
Detalhes:
https://documenter.getpostman.com/view/5837874/TVzNHejF

## Interface do Usuário

Para a Interface do usuário, siga as orientações em:
https://github.com/guilhermenunes09/debts-app-code7-react


guilhermewn09@gmail.com
