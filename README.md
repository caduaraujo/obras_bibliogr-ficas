# README

* Ruby: 2.7.2
* Rails: 6.0.3.4
* Postgres

## Configuração
Clone o projeto: https://github.com/caduaraujo/obras_bibliogr-ficas

### Usando docker:

Estando na pasta do projeto, tendo o docker configurado em sua máquina, executar no terminal:
docker-compose build

Executar para criar o banco de dados e a migração:
docker-compose web rails db:create db:migrate

Subir a aplicação local:

```docker-compose up```

#### Rodando os testes
``` docker-compose web rspec```

### Direto na sua máquina:
 - Instale as gems:
  ```bundle install```

 - Configure o banco de dados:
 ```rails db:create```
 ```rails db:migrate```

- Subir a aplicação local
```rails s```

#### Rodando os testes
``` rspec```

### Endpoint
Esse ednpoint que salva no banco os autores já consultados e sempre devolve um nome formatado:
 - typo: Content type application/json
 - rota: v1/authors/:.

Testando localmente via curl:
*Post*

```curl --data "author=Machado de Assis" POST http://localhost:3000/v1/authors/```

Sample 

```{ author: 'Machado de Assis' }```
