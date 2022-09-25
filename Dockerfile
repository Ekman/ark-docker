FROM cm2network/steamcmd:root

LABEL org.opencontainers.image.source="https://github.com/Ekman/ark-docker"
LABEL org.opencontainers.image.authors="Niklas Ekman <nikl.ekman@gmail.com>"

ENV GAME_DIR="$HOMEDIR/game" \
    CONFIG_DIR="$GAME_DIR/ShooterGame/Saved/Config/LinuxServer" \
    GAME_ID="376030" \
    DEBIAN_FRONTEND="noninteractive" \
    MAP="TheIsland"

EXPOSE 27015/udp
EXPOSE 7777-7778/udp

RUN apt-get update \
    && apt-get install --yes --no-install-recommends --no-install-suggests tini gosu \
    && apt-get autoremove --yes --purge \
    && apt-get clean \
    && apt-get autoclean \
    && mkdir -p "$GAME_DIR" "$CONFIG_DIR" \
    && chown -R "$USER":"$USER" "$GAME_DIR" "$CONFIG_DIR"
     
ADD --chown="$USER":"$USER" scripts/docker-entrypoint.sh /

VOLUME [ "$GAME_DIR", "$CONFIG_DIR", "$HOMEDIR/steamcmd" ]

# See: https://github.com/docker-library/official-images#init
ENTRYPOINT [ "tini", "-ve", "143", "--", "bash", "/docker-entrypoint.sh" ]
