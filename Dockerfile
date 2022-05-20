FROM archlinux

COPY /.dotbrick /root/.dotbrick

ARG __config_name=ide.base
ENV TERM=screen-256color

RUN chmod +x /root/.dotbrick/_scripts/bootstrap.sh
RUN /root/.dotbrick/_scripts/bootstrap.sh $__config_name

RUN mkdir -p /root/workspace

WORKDIR /root/workspace

ENTRYPOINT tmux
