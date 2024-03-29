# Projeto XYZ

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

### 2. Configurando o Backend Laravel
1. Instale as dependências do Laravel:

```bash
cd ezoom
composer install
```

2. Copie o arquivo .env.example para .env e configure as variáveis de ambiente, incluindo as credenciais do banco de dados MySQL.

```bash
cp .env.example .env
```

### 3. Configurando o Frontend Flutter
1. Navegue até o diretório do frontend Flutter:
```bash
cd ../frontend
```
2. Instale as dependências do Flutter:
```
flutter pub get
```

### 4. Configurando o Banco de Dados MySQL
1. Acesse o MySQL e crie um banco de dados para o projeto.
```bash
mysql -u seu_usuario -p
CREATE DATABASE nome_do_banco_de_dados;
```

## Executando o Projeto
1. Manualmente
- Se preferir, você pode iniciar manualmente os serviços necessários:

- Para iniciar o servidor backend Laravel, execute:
```bash
cd ezoom
php artisan serve
```
- Para iniciar o aplicativo Flutter, execute:
```bash
cd ezoom_front
flutter run
```

Certifique-se de que o serviço do MySQL esteja em execução.
