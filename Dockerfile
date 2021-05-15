FROM node:14

WORKDIR /app

COPY package.json /app

RUN npm install

RUN npm install -g http-server

COPY . /app

CMD npm run minify && npm test | sed 's/$/\<br \/\>/' > /app/test/index.html && npm run bdd-test | sed 's/$/\<br \/\>/' >> /app/test/index.html && http-server /app/test/ -p 8081

EXPOSE 8081