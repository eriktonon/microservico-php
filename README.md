# Erik DevOps
## Image content
### Maintainer eriktonon@gmail.com {github.com/eriktonon}
* PHP Version 7.3.10
* Apache Version 2.4
* Driver Postgres  
* SOAP
* Composer
* Virtualhost /var/www/public
* Xdebug
* Ghostscript
* TimeZone Brasil - SP
 
## Installation

```shell 
$ docker pull eriktonon/microservicophp:latest
$ docker run -d --name webservice -p 80:80 -v ${PWD}:/var/www/public eriktonon/microservicophp:latest
```
