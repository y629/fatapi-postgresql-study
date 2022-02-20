FROM python:3.8-slim

ENV PROJECT_DIR sqlalchemy-study
WORKDIR /${PROJECT_DIR}
ADD requirements.txt /${PROJECT_DIR}/
RUN apt-get -y update && \
    apt-get -y install \
    apt-utils \
    gcc && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/* && \
    pip install --no-cache-dir -r requirements.txt

COPY notebooks/ /${PROJECT_DIR}/notebooks/
COPY app.py /${PROJECT_DIR}/app.py
COPY db.py /${PROJECT_DIR}/db.py
COPY configurations.py /${PROJECT_DIR}/configurations.py

COPY run.sh /${PROJECT_DIR}/run.sh
RUN chmod +x /${PROJECT_DIR}/run.sh
CMD ["./run.sh"]