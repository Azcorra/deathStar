# API - deathStar

API Rest desarrollado con Laravel.

## ¿Que puedes hacer con la API?

-   Puedes listar los usuarios
-   Registrar nuevos usuarios
-   Actualizar los datos de los usuarios
-   Eliminar usuarios

## Dependencias

-   [PHP v8.0^](https://getcomposer.org/download/)
-   [Composer v2.4.1^](https://getcomposer.org/download/)
-   [Laravel v9.x](https://laravel.com/docs/9.x)

## Requerimientos

Necesitas tener instalado lo siguiente:

-   [PHP v8.0^](https://getcomposer.org/download/)
-   [Composer v2.4.1^](https://getcomposer.org/download/)
-   [Laragon](https://laragon.org/download/index.html)
-   [Git](https://git-scm.com/downloads)

## Pasos de instalación

### Clone el repositorio de GitHub

1. Abrir CMD en el directorio donde desea instalar el proyecto
2. Escriba el siguiente comando

```bash
git clone https://github.com/Azcorra/deathStar.git
```

3. Acceda al directorio clonado usando el siguiente comando

```bash
cd deathStar
```

### Instalar todas las dependencias de Composer

1. Use el siguiente comando para instalar todas las dependencias

```bash
composer install
```

### Crear el archivo .env

1. Duplicar el archivo _.env.example_ por _.env_
2. Configure las credenciales para la conexión a la Base de Datos
    > Nota: Se recomienda PostgreSQL

```bash
DB_CONNECTION=pgsql
DB_HOST=127.0.0.1
DB_PORT=5432
DB_DATABASE=Palace_Resorts
DB_USERNAME=NombreUsuario
DB_PASSWORD=Contraseña
```

### Crear clave de la aplicación

1. Puede generar una clave con el siguiente comando

```bash
php artisan key:generate
```

### Crear base de datos

1. Crear base de datos "Palace_Resorts" a traves del gestor de base de datos proporcionado por su servidor web
    > Nota: El nombre de la base de datos debe coincidir con el configurado en el archivo _.env_

### Estructura de la base de datos

> Crear la base de datos y ejecutar archivo SQL con nombre Palace_Resorts.

### Ejecutar proyecto

1. Inicie el proyecto ejecutando el comando `serve` de Laravel's Artisan CLI

```bash
php artisan serve --port=8000
```

### Endpoints

-   http://127.0.0.1:8000/api/v1/Jedis/usuarios
-   http://127.0.0.1:8000/api/v1/Jedis/usuarios/crear
-   http://127.0.0.1:8000/api/v1/Jedis/usuarios/actualizar
-   http://127.0.0.1:8000/api/v1/Jedis/usuarios/eliminar/6
