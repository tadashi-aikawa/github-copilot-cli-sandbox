FROM node:24-bookworm-slim

# less: ページャー用, procps: ps等のプロセス確認用
RUN apt-get update && apt-get install -y --no-install-recommends \
    git \
    bash \
    ca-certificates \
    ripgrep \
    fd-find \
    less \
    procps \
  && rm -rf /var/lib/apt/lists/*

RUN npm install -g --no-fund @github/copilot@1.0.14

RUN [ ! -e /usr/local/bin/fd ] && ln -s /usr/bin/fdfind /usr/local/bin/fd

# node ユーザーが /work を読み書きできるよう権限付与
RUN mkdir -p /work && chown node:node /work

USER node

WORKDIR /work

CMD ["copilot"]
