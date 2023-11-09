FROM fukamachi/roswell

COPY . .
RUN git clone https://github.com/garlic0x1/hiccl
RUN mv hiccl ~/.roswell/lisp/quicklisp/local-projects/
RUN ros build hack-me.ros

ENTRYPOINT ["./hack-me"]
