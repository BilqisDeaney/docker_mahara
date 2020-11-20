# docker_mahara
A mahara developent environment.

## Usage and install
clone this repo
```
git clone git@github.com:ScottVerbeek/docker_mahara.git
```

clone your mahara repo into siteroot
```
git clone git@github.com:MaharaProject/mahara.git siteroot
```

copy config to htdocs
```
cp mahara-config siteroot/htdocs/config.php
```

then start containers
```
docker-compose up 
```