FROM nginx:latest

COPY index.html /usr/share/nginx/html/index.html
COPY DockerFileEx.jpg /usr/share/nginx/html/DockerFileEx.jpg
RUN echo "Asia/Ho_Chi_Minh" > /etc/localtime
EXPOSE 80

