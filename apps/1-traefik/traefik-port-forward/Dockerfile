FROM hypriot/rpi-node

EXPOSE 80

RUN npm install -g mapport

CMD mapport $REMOTE_PORT 127.0.0.1:$K8S_PORT
