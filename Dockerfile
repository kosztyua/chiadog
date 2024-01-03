FROM python:3.10-slim
LABEL org.opencontainers.image.source="https://github.com/kosztyua/chiadog"
WORKDIR /chiadog
COPY . /chiadog
RUN apt update && apt upgrade && \
adduser -D chiadog && 
python3 -m venv venv && \
&& . ./venv/bin/activate \
&& pip3 install -r requirements.txt
USER chiadog
ENTRYPOINT ["/chiadog/entrypoint.sh"]
