FROM nginx:latest
RUN apt-get update && apt-get upgrade -y
RUN apt-get install wget unzip -y
WORKDIR /usr/share/nginx/html
COPY default.conf /etc/nginx/sites-enabled/
ADD https://bootstrapmade.com/content/templatefiles/eBusiness/eBusiness.zip .
RUN unzip eBusiness.zip
RUN mv eBusiness/* .
RUN rm -rf eBusiness eBusiness.zip
EXPOSE 80
CMD ["nginx", "-g", "daemon off;"]
