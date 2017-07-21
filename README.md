# dockerWebCenterSites
Dockerfile for creating a WebCenter Sites 12.2.1.2 container


docker build -f Dockerfile -t sshamilt/webcenter-sites-12.2.1.2:0.0.1 -t sshamilt/webcenter-sites-12.2.1.2:latest .


docker run -it -v //C/Users/Steve/docker/u01/data/mysql:/u01/data/mysql --rm --name sitestest sshamilt/webcenter-sites-12.2.1.2:latest

C:\Users\Steve\docker\u01\data\mysql