FROM alpine
RUN touch NEWFILE
CMD ["echo", "Hello", "World"]
