FROM alpine
RUN apk update && apk add curl jq coreutils && rm -rf /var/cache/apk/*

ADD crontab.txt /crontab.txt
ADD findFailedJobs.sh /findFailedJobs.sh
ADD notify.sh /notify.sh
COPY entry.sh /entry.sh
RUN chmod 755 /findFailedJobs.sh /notify.sh /entry.sh
RUN touch /yarnErrors.log
RUN /usr/bin/crontab /crontab.txt

CMD ["/entry.sh"]
