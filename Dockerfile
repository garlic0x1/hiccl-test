FROM fukamachi/roswell

COPY . .
RUN ros build hack-me.ros

ENTRYPOINT ["./hack-me"]
