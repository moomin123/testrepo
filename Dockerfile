FROM alpine
RUN touch NEWFILE
CMD ["echo", "UPDATED"]
