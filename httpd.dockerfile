FROM httpd:2.4
COPY ./httpd/httpd.conf /usr/local/apache2/conf/httpd.conf
ADD ./httpd/default.conf /usr/local/apache2/conf.d/default.conf
RUN ln -sf /usr/share/zoneinfo/Asia/Manila /etc/localtime
RUN apt-get update && apt-get install -y libxml2-dev git