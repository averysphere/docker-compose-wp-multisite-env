FROM nginx:stable
ADD ./nginx/default.conf /etc/nginx/conf.d/default.conf
RUN apt-get update && apt-get install -y libxml2-dev git