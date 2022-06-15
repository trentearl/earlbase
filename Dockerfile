FROM alpine:3.15

RUN apk add bash
RUN apk add vim
RUN apk add tmux
RUN apk add curl
RUN apk add git
RUN apk add ctags
RUN apk add ncurses-terminfo
RUN apk add postgresql14-client
RUN apk add nodejs


RUN addgroup -S earl && adduser --system  -S earl -G earl

USER earl

WORKDIR /home/earl

COPY tmux.conf .tmux.conf
COPY inputrc .inputrc
COPY vimrc .vimrc

RUN curl -fLo ~/.vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
RUN vim +'PlugInstall --sync' +qa


ENTRYPOINT ["tail", "-f", "/dev/null"]

