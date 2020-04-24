# build environment
# inspiration: https://mherman.org/blog/dockerizing-a-react-app/

FROM node:12.2.0-alpine as build
WORKDIR /app
ENV PATH /app/node_modules/.bin:$PATH
COPY package.json /app/package.json
ARG REACT_APP_APIHOST
ARG REACT_APP_STOPPEDVMIMG
ARG REACT_APP_STARTEDVMIMG
RUN npm install --silent
RUN npm install react-scripts@3.0.1 -g --silent
COPY . /app
RUN npm run build

# production environment
FROM nginx:1.16.0-alpine
COPY --from=build /app/build /usr/share/nginx/html
COPY dockerfiles/nginx.config /etc/nginx/conf.d/default.conf
EXPOSE 8080
CMD ["nginx", "-g", "daemon off;"]



#docker build --pull --rm -f "Dockerfile" -t labciawsgui:latest --build-arg REACT_APP_APIHOST=https://cloudrun-api-gssmt3brqq-ew.a.run.app/ "."
#docker run -p 8050:8080 -d --name aws labciawsgui:latest
#