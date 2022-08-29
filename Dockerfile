FROM alpine:3.16

COPY thirdparty/balena/entry.sh /usr/bin/entry.sh
ENV UDEV=on
ENTRYPOINT ["/usr/bin/entry.sh"]

RUN apk add --no-cache \
bash udev dbus \
sane-saned sane-udev sane-utils \
sane-backend-hpljm1005 \
sane-backend-canon_dr \
sane-backend-epjitsu \
sane-backend-kvs40xx \
sane-backend-mustek_usb \
sane-backend-rts8891 \
sane-backend-hp5590 \
sane-backend-escl \
sane-backend-umax1220u \
sane-backend-cardscan \
sane-backend-u12 \
sane-backend-sm3600 \
sane-backend-hp3900 \
sane-backend-pixma \
sane-backend-hp4200 \
sane-backend-ma1509 \
sane-backend-epson2 \
sane-backend-avision \
sane-backend-coolscan2 \
sane-backend-magicolor \
sane-backend-hp5400 \
sane-backend-epsonds \
sane-backend-kvs20xx \
sane-backend-gt68xx \
sane-backend-canon_lide70 \
sane-backend-epson \
sane-backend-mustek_usb2 \
sane-backend-canon630u \
sane-backend-niash \
sane-backend-hp \
sane-backend-xerox_mfp \
sane-backend-snapscan \
sane-backend-kodakaio \
sane-backend-stv680 \
sane-backend-artec_eplus48u \
sane-backend-ricoh2 \
sane-backend-hp3500 \
sane-backend-lexmark \
sane-backend-kvs1025 \
sane-backend-sm3840 \
sane-backend-pieusb \
sane-backend-fujitsu \
sane-backend-dell1600n_net \
sane-backend-genesys \
sane-backend-plustek

ENV SANED_ARGS="-l -d 128"
COPY saned.conf /etc/sane.d/
CMD ["bash", "-c",  "saned ${SANED_ARGS}"]

EXPOSE 6566/tcp
EXPOSE 10000-10010/tcp
