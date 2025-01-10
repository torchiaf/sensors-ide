FROM node:22.13.0

# Install required tools to build the application
RUN apt-get update && apt-get install -y libxkbfile-dev libsecret-1-dev python3

WORKDIR /home/theia

# Copy repository files
COPY . .

RUN yarn install && \
    yarn build:browser && \
    rm -rf .git electron-app

EXPOSE 3000

CMD ["yarn", "start-docker:browser"]