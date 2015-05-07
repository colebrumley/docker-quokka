FROM ubuntu:latest
RUN apt-get update && apt-get install -y git python-pip python-dev
RUN git clone https://github.com/quokkaproject/quokka
WORKDIR quokka
RUN pip install -r requirements.txt
COPY entrypoint.sh /entrypoint.sh
EXPOSE 8000
ENTRYPOINT ["/entrypoint.sh"]