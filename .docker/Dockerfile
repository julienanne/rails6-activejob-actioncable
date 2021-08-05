FROM ruby

RUN apt update && apt install -y \
  inotify-tools nodejs npm \
  && rm -rf /var/lib/apt/lists/*

RUN npm install -g npm stable

RUN npm install -g yarn


WORKDIR /usr/src/my_app

EXPOSE 3000

COPY ./entrypoint.sh /usr/src

CMD ["../entrypoint.sh"]
