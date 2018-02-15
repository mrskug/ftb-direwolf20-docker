FROM dlord/minecraft:java8
MAINTAINER Christoffer Holmberg skug+gitmc@skug.fi

ENV FTB_DW20_URL https://media.forgecdn.net/files/2524/140/FTBPresentsDirewolf20112Server.zip
ENV LAUNCHWRAPPER net/minecraft/launchwrapper/1.12/launchwrapper-1.12.jar

RUN curl -SL $FTB_DW20_URL -o /tmp/dw20.zip && \
    unzip /tmp/dw20.zip -d /opt/minecraft && \
    mkdir -p /opt/minecraft/$(dirname libraries/${LAUNCHWRAPPER}) && \
    curl -S https://libraries.minecraft.net/$LAUNCHWRAPPER -o /opt/minecraft/libraries/$LAUNCHWRAPPER && \
    find /opt/minecraft -name "*.log" -exec rm -f {} \; && \
    rm -rf /opt/minecraft/ops.* /opt/minecraft/whitelist.* /opt/minecraft/logs/* /tmp/*

ENV MINECRAFT_VERSION 1.12.2
ENV MINECRAFT_OPTS -server -Xms8192m -Xmx9216m -XX:MaxPermSize=768m -XX:+UseParNewGC -XX:+UseConcMarkSweepGC
ENV MINECRAFT_STARTUP_JAR FTBserver-1.12.2-14.23.1.2601-universal.jar
