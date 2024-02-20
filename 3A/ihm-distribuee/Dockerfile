FROM ubuntu:20.04

ARG DEBIAN_FRONTEND=noninteractive

# URLs of the Ingescape and Whiteboard applications
ARG INGESCAPE_INSTALL_URL="https://repository.ingescape.com/circle/linux64/installer/latest"
ARG WHITEBOARD_INSTALL_URL="https://ingescape.com/upssitech/whiteboard-1.0.0_0-amd64.deb"


# Install dependencies

RUN apt update && apt install -y \
        build-essential qt5-default xdg-utils curl \
        terminator tmux


# Install Ingescape & Whiteboard application

RUN cd /tmp && \
        curl -kL -o install-ingescape.run $INGESCAPE_INSTALL_URL && \
        chmod +x install-ingescape.run && \
        ./install-ingescape.run install --default-answer --accept-licenses --confirm-command && \
        rm -f install-ingescape.run

RUN cd /tmp && \
        curl -o whiteboard.deb $WHITEBOARD_INSTALL_URL && \
        apt install -y ./whiteboard.deb && \
        rm -f whiteboard.deb


# Add aliases to the bashrc

RUN echo "alias ingescape='/opt/Ingescape-Circle/Ingescape-Circle.sh'" >> ~/.bashrc
RUN echo "alias whiteboard='/opt/Whiteboard/Whiteboard.sh'" >> ~/.bashrc