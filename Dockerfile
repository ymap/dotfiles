FROM ubuntu:latest

ENV EDITOR=nvim
ENV LC_CTYPE=ja_JP.UTF-8
ENV MAKEFLAGS=-j2
ENV WWW_HOME=https://google.com

RUN apt-get update && apt-get install -y \
  bear \
  bison \
  bzip2 \
  clang \
  curl \
  fuse \
  gh \
  git \
  groff \
  jq \
  language-pack-ja \
  lldb \
  llvm \
  make \
  sudo \
  unzip \
  w3m

RUN groupadd -g 1001 ymap && \
  useradd -m -s /bin/bash -u 1001 -g 1001 ymap && \
  echo "ymap    ALL=(ALL) NOPASSWD:ALL" > /etc/sudoers.d/ymap

USER ymap
WORKDIR /home/ymap/

RUN curl -fsSL https://raw.githubusercontent.com/ymap/dotfiles/master/etc/install | sh

RUN curl -fsSL https://get.docker.com | sh

RUN curl -fsSL https://nodejs.org/download/release/v22.14.0/node-v22.14.0-linux-arm64.tar.gz | \
  sudo tar -xz --strip-components=1 -C /usr/local

RUN curl -fsSL https://deno.land/install.sh | sh -s -- -y

RUN curl "https://awscli.amazonaws.com/awscli-exe-linux-aarch64.zip" -o "awscliv2.zip" && \
  unzip awscliv2.zip && \
  sudo aws/install && \
  rm -rf aws awscliv2.zip

RUN curl --proto '=https' --tlsv1.2 -sSf -L https://install.determinate.systems/nix | \
  sh -s -- install --no-confirm

RUN curl -fsSLO https://github.com/neovim/neovim/releases/download/stable/nvim-linux-arm64.appimage && \
  chmod +x nvim-linux-arm64.appimage && \
  sudo mv nvim-linux-arm64.appimage /usr/local/bin/nvim

RUN sudo apt install -y clangd && \
  mkdir -p ~/.local/share/nvim/mason/bin && \
  ln -s /usr/bin/clangd ~/.local/share/nvim/mason/bin/clangd && \
  mkdir -p ~/.local/share/nvim/mason/packages/clangd

RUN curl -fsSL https://astral.sh/uv/install.sh | sh

RUN npm install -g @openai/codex

COPY docker-entrypoint.sh /docker-entrypoint.sh
RUN sudo chmod +x /docker-entrypoint.sh

ENTRYPOINT ["/docker-entrypoint.sh"]
CMD ["tail", "-f", "/dev/null"]
