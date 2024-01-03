FROM node:18 as build



# Create and set the working directory in the container
WORKDIR /app

COPY app.js ./
COPY package.json ./
COPY package-lock.json ./
COPY yarn.lock ./
COPY bin ./bin
COPY public ./public
COPY routes ./routes
COPY views ./views

RUN yarn install

EXPOSE 3000

CMD ["yarn", "start"]


