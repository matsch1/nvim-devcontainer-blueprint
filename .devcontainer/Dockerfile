FROM ubuntu:22.04
# FROM ghcr.io/cirruslabs/android-sdk:34

ENV UID=1000
ENV GID=1000
ENV USER="dev"


# install all dependencies
ENV DEBIAN_FRONTEND="noninteractive"
RUN apt-get update && \
  apt-get install -y --no-install-recommends \
  sudo \
  curl \
  unzip \
  sed \
  git \
  xz-utils \
  ssh \
  clang && \
  apt-get clean && \
  rm -rf /var/lib/apt/lists/* /var/cache/* /var/log/*

# create user
RUN groupadd --gid $GID $USER \
  && useradd -s /bin/bash --uid $UID --gid $GID -m $USER \
  && echo $USER ALL=\(root\) NOPASSWD:ALL > /etc/sudoers.d/$USER \
  && chmod 0440 /etc/sudoers.d/$USER

USER $USER
WORKDIR /home/$USER

COPY entrypoint.sh /usr/local/bin/
COPY chown.sh /usr/local/bin/
ENTRYPOINT [ "/usr/local/bin/entrypoint.sh" ]
