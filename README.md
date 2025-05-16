# qfc-manta
Una instancia de QFieldCloud

1. Clonar el repositorio incluyendo el submódulo

`git clone --recurse-submodules https://github.com/darf-manta/qfc-manta`

2. Copiar los archivos compose y environment a `QFieldcloud/`

```
cp my-docker-compose.yml QFieldCloud/
cp my-docker-compose.override.standalone.yml QFieldCloud/
cp my.env QFieldCloud/.env
```

3. Editar las variables con `change_me` en `QFieldCloud/.env`

`nano QFieldCloud/.env`

4. Construir las imágenes y ejecutar los contenedores

```
cd QFieldCloud
docker compose build
docker compose up -d
```
