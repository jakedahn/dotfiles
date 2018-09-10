FROM kalilinux/kali-linux-docker

RUN echo "deb http://http.kali.org/kali kali-rolling main contrib non-free" > /etc/apt/sources.list && \
    echo "deb-src http://http.kali.org/kali kali-rolling main contrib non-free" >> /etc/apt/sources.list
ENV DEBIAN_FRONTEND noninteractive
RUN set -x \
    && apt-get -yqq update

RUN apt-get install -y \
    binwalk \
    cewl \
    dnsenum \
    dnsmap \
    exploitdb \
    gobuster \
    hashcat \
    hping3 \
    hydra \
    joomscan \
    metasploit-framework \
    mitmproxy \
    nikto \
    openvas \
    recon-ng \
    seclists \
    sqlmap \
    sublist3r \
    volatility \
    webshells \
    wordlists \
    wpscan

RUN set -x \
    && apt-get -yqq dist-upgrade \
    && apt-get clean

RUN service postgresql start && msfdb init
COPY metasploit.sh /metasploit

CMD ["bash"]
