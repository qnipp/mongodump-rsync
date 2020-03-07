FROM mongo:4.2

RUN apt-get update && \
  apt-get install -y rsync ssh bzip2 && \
  apt-get clean && \
  rm -rf /var/lib/apt/lists/*

RUN useradd -d /home/rsync-backup -m -u 9999 rsync-backup

COPY start.sh /start.sh

ENV MONGO_URL mongodb://localhost:27017
ENV MONGO_DUMP_OPTIONS ""
ENV DUMP_PATH /tmp/mongodump
ENV TARBZ2_PATH /tmp
ENV SSH_DIR /ssh
ENV RSYNC_TARGET backup:/var/lib/backup

USER rsync-backup

VOLUME [ "/ssh" ]

ENTRYPOINT [ "/start.sh" ]
CMD [""]