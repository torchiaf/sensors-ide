FROM node:22.13.0

# Install required tools to build the application
RUN apt-get update && apt-get install -y libxkbfile-dev libsecret-1-dev python3

# Install Golang
RUN wget -c https://golang.org/dl/go1.23.4.linux-amd64.tar.gz && \
    tar -C /usr/local -xzf go1.23.4.linux-amd64.tar.gz && \
    echo "export PATH=$PATH:/usr/local/go/bin" >> ~/.profile && \
    echo "export GOPATH=~/.go" >> ~/.profile

WORKDIR /home/theia

# Copy repository files
COPY . .

RUN yarn install && \
    yarn build:browser && \
    rm -rf .git electron-app

EXPOSE 3000

CMD ["yarn", "start-docker:browser"]