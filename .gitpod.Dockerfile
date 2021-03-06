FROM gitpod/workspace-full-vnc

ENV ANDROID_HOME=/workspace/android-sdk \
    FLUTTER_ROOT=/workspace/flutter \
    FLUTTER_HOME=/workspace/flutter

USER root


# Install Xvfb, JavaFX-helpers and Openbox window manager
RUN apt-get update \
    && apt-get install -yq xvfb x11vnc xterm openjfx libopenjfx-java openbox \
    && apt-get clean && rm -rf /var/lib/apt/lists/* /tmp/*

# overwrite this env variable to use a different window manager
ENV WINDOW_MANAGER="openbox"


# essential
RUN apt-get update && \
    apt-get -y install build-essential libkrb5-dev gcc make gradle openjdk-8-jdk && \
    apt-get clean && \
    apt-get -y autoremove

# chrome
RUN apt-get install -y xdg-utils libgbm1 libappindicator3-1 fonts-liberation
RUN wget https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb
RUN dpkg -i google-chrome-stable_current_amd64.deb

