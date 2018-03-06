
# Docker Compose Rails con Mysql
Esta configuración básica de Docker Compose, permite crear una aplicación RAILS con BD Mysql, ejecutarla en segundo plano y poder comenzar a trabajar directamente sobre el Framework.

**Nota:** Asegurarse que los archivos .sh que están en /config, tienen permisos de ejecución `chmod 755`.

#### Ejecución de una aplicación existente, con una BD nueva por cada ejecución
Para ejecutar una aplicación Rails existente, es necesario referenciar en  **docker-compose.yml**, en el apartado `services -> app -> volumes` la dirección de tu aplicación, por ejemplo:
```yml
  app:
    ...
    volumes:
      - /Users/myuser/myrailsapp/:/myrailsapp
```
Descomentar en el docker-compose.yml la línea del `existapp_newdb.sh`  y comentar toda las demás del apartado `services -> app -> command`
```yml
  app:
    ...
    command: 
      - /config/existapp_newdb.sh
      #...
```
Para levantar la aplicación:
```sh
docker-compose up -d
```

#### Creación de una Aplicación Rails Nueva
Para crear una aplicación Rails desde cero, se debe descomentar en el docker-compose.yml la línea del `newrailapp_newdb`  y comentar todas las demás del apartado  `services -> app -> command`
```yml
  app:
    ...
    command: 
      - /config/newrailapp_newdb.sh
      #...
```
Para levantar la aplicación:
```sh
docker-compose up -d
```



```
docker-compose run app rails new . --force --database=mysql --skip-bundle
docker-compose run test bundle exec "rails db:setup && xvfb-run rails spec"
```

##### Referencias:
- [docker-rails-mysq](#https://github.com/nooptr/docker-rails-mysql)
- [docker-compose.yml](#https://github.com/markoshust/docker-magento/blob/master/compose/magento-2/docker-compose.yml#L14)