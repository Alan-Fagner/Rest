# Projeto Rest

Este projeto foi criado para apresentar as habilidades no desenvolvimento uma aplicação datasnap. Utilizando Clean Code, POO, Padrões de Projeto, Programação Funcional, Threads, Controle de transações, e integração com a API ViaCEP. 

## Descrição

O Objetivo do projeto é fazer um cadastro simplificado de pessoas e endereços, após o cadastro será realizada uma consulta ao número do cep para complementar os dados do cadastro.

Para isto foram desenvolvidas 2 aplicações, 
Servidor: responsável por disponibilizar os serviços no formato de API rest

Cliente: responsável por consumir os serviços oferecidos pela API


## Começando

Após o download dos arquivos é preciso movê-los para a pasta no seguinte caminho:
C:\Rest

Onde haveram duas pastas, Servidor e Cliente, com seus respectivos arquivos, executáveis, fontes, dll's, entre outros.

Certifique-se que o banco de dados está em funcionamento.
Execute primeiro o Servidor, clique em Start para entrar em funcionamento. E em seguida execute o Cliente.

Na aplicação cliente é possivel adicionar uma nova pessoa preenchendo os dados, como também é possível enviar um arquivo para cadastramento em lote.
Na pasta C:\Rest\Cliente\Arquivos de teste, existem arquivos que podem ser utilizados para testes e também como modelo para criação de novos arquivos.

## Aviso

Segundo o próprio ViaCep:"Ao constatar o uso de scripts de acesso massivo seu IP será automaticamente bloqueado por tempo indeterminado." 

Após realizar o cadastramento de lote de uma grande quantidade pessoas, pode ser que API faça o boqueio do IP por algum tempo, e por isso, logo após o cadastramento não será retornado os dados do endereço, e pode haver a demora de alguns segundos no cadastramento, pois o sistema fica tentando consultar o CEP.

## Construído com
Delphi 10.3.3

Banco de dados: postgresql
