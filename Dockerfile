FROM ubuntu:14.04

# Install Node.js and npm
RUN apt-get update
RUN apt-get install -y nodejs npm git git-core mysql-server curl wget

# Bundle app source
COPY . /home/privy

# Install app dependencies
RUN cd /home/privy/bundle; npm install
RUN npm install -g n
RUN n stable

EXPOSE 3000

CMD /home/privy/bundle/installer.sh
