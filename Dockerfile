FROM ubuntu:14.04
ENV NVM_VERSION v0.31.1
ENV NODE_VERSION v6.2.0
ENV NVM_DIR /home/app/nvm
ENV NODE_PATH $NVM_DIR/v$NODE_VERSION/lib/node_modules
ENV PATH      $NVM_DIR/v$NODE_VERSION/bin:$PATH
ENV APP_HOME /home/app

RUN useradd -c "App User" -d $APP_HOME -m app
RUN apt-get update; apt-get install -y curl
USER app

# Install nvm with node and npm
RUN touch $HOME/.bashrc; curl https://raw.githubusercontent.com/creationix/nvm/${NVM_VERSION}/install.sh | bash \
    && /bin/bash -c 'source $NVM_DIR/nvm.sh; nvm install $NODE_VERSION' 

ENV NODE_PATH $NVM_DIR/versions/node/$NODE_VERSION/lib/node_modules
ENV PATH      $NVM_DIR/versions/node/$NODE_VERSION/bin:$PATH

# Create app directory
WORKDIR /home/app
COPY . /home/app

# Install app dependencies
RUN npm install

EXPOSE 8080
CMD [ "npm", "start" ]
