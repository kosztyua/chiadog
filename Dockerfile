FROM python:3-slim

ENV VIRTUAL_ENV=/opt/venv
RUN python3 -m venv $VIRTUAL_ENV
ENV PATH="$VIRTUAL_ENV/bin:$PATH"

WORKDIR /chiadog
COPY . /chiadog
RUN apt update \ 
&& apt upgrade \
&& groupadd -g 10001 chiadog \
&& useradd -m -u 10000 -g chiadog chiadog \
&& pip3 install -r requirements.txt \
&& chown -R chiadog:chiadog /chiadog
USER chiadog

CMD ["sh", "-c", "python3 /chiadog/main.py --config $CHIADOG_CONFIG_DIR"]
