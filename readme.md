# Projeto Ezoom-CRUD

Este é o README detalhado do Projeto Ezoom-CRUD. Este projeto é uma aplicação móvel que utiliza o framework Laravel para o backend, Flutter para o frontend móvel e MySQL como banco de dados.

## Pré-requisitos

Certifique-se de ter os seguintes requisitos instalados em sua máquina antes de prosseguir:

- [Laravel](https://laravel.com/docs/8.x/installation)
- [Flutter](https://flutter.dev/docs/get-started/install)
- [MySQL](https://dev.mysql.com/doc/mysql-installation-excerpt/8.0/en/)

## Configuração do Ambiente

### 1. Clonando o Repositório

```bash
git clone git@github.com:joaoygo/ezoom-crud.git
cd ezoom-crud
```

### 2. Configurando o Banco de Dados MySQL
1. Acesse o MySQL e crie um banco de dados para o projeto.
```bash
mysql -u seu_usuario -p

CREATE DATABASE nome_do_banco_de_dados;

CREATE USER 'seu_usuario'@'localhost' IDENTIFIED BY 'senha';

GRANT ALL PRIVILEGES ON nome_do_banco_de_dados.* TO 'seu_usuario'@'localhost';

FLUSH PRIVILEGES;

exit
```

### 3. Configurando o Backend Laravel
1. Instale as dependências do Laravel:

```bash
cd ezoom
composer install
```

2. Copie o arquivo .env.example para .env e configure as variáveis de ambiente, incluindo as credenciais do banco de dados MySQL.

```bash
cp .env.example .env
```

3. Execute a migration

```bash
php artisan migrate:fresh --seed
```

### 4. Configurando o Frontend Flutter
1. Navegue até o diretório do frontend Flutter:
```bash
cd ..
cd ezoom_front
```
2. Instale as dependências do Flutter:
```
flutter pub get
```

## 5. Executando o Projeto
1. Manualmente
- Se preferir, você pode iniciar manualmente os serviços necessários:

- Para iniciar o servidor backend Laravel, execute:

    1. Abra seu prompt de comando e digite o seguinte comando para descobrir seu ip local, ele será necessario para o proximo passo. (deve se parecer com 111.222.333.444)
        - Windows
        ```
        ipconfig
        ```
        - Mac
        ```
        ifconfig
        ```
        - Linux
        ```
        ifconfig
        ```
- Iniciando o servidor utilizando o seu ip local

```bash
cd ezoom
php artisan serve --host=111.222.333.444 --port=8000
```


- Para iniciar o aplicativo Flutter, execute:

1. Inicie um novo terminal
```bash
cd ezoom_front
```

2. Copie o arquivo .env.example para .env e configure as variáveis de ambiente, adicionando seu IP local adquirido nos passos anteriores.

```bash
cp .env.example .env
```

```bash
flutter run
```

Certifique-se de que o serviço do MySQL esteja em execução.
