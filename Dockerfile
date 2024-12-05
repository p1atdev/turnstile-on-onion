FROM debian:trixie-slim

# Setting up Tor
RUN apt update
RUN apt install -y tor
COPY ./tor/torrc /etc/tor/torrc
COPY ./tor/hidden_service /app/tor/hidden_service

RUN chmod 700 /app/tor/hidden_service

CMD tor