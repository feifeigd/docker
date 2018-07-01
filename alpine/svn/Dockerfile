FROM alpine

RUN apk --no-cache add subversion

EXPOSE 3690

VOLUME ["/var/svn"]

CMD ["svnserve", "--daemon", "--foreground", "--root", "/var/svn"]
