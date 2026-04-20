# qfc-manta

Una instancia de QFieldCloud

1. Tener lista una base de datos Postgres, denominada `qfcloudb`, propiedad de `qfcloudb_owner`

2. Clonar el repositorio incluyendo el submódulo

```
git clone --recurse-submodules https://github.com/darf-manta/qfcloud-manta
```

3. Copiar los archivos environment y compose a `QFieldcloud/`

```
cd qfcloud-manta
cp my.env QFieldCloud/.env
cp my-docker-compose.yml QFieldCloud/
cp my-docker-compose.override.standalone.yml QFieldCloud/
```

4. Añadir `server blocks` extra a la configuración de `nginx`

```
cat extra.conf.template >> QFieldCloud/docker-nginx/templates/default.conf.template
```

5. Colocar certificados TLS válidos en `QFieldcloud/conf/nginx/certs/`

6. Editar las variables con `"change_me"` en el environment

```
cd QFieldCloud
nano .env
```

7. Construir las imágenes e inicializar los contenedores

```
docker compose build
docker compose up -d
```

8. Ejecutar los comandos post-inicialización descritos en la documentación, véase
https://github.com/opengisch/QFieldCloud#deployment

```
docker compose exec app python manage.py migrate
docker compose exec app python manage.py collectstatic
```

9. Instalar el cliente de MinIO `mc` en otro servidor para respaldos, véase
https://www.min.io/download/aistor-client

10. Añadir el siguiente bloque a `~/.mc/config.json`

```
"minio": {
	"url": "change_me",
	"accessKey": "dev",
	"secretKey": "change_me",
	"api": "s3v4",
	"path": "auto"
},
```

11. Editar los `"change_me"` en `backup.sh` y ejecutarlo para realizar respaldos
