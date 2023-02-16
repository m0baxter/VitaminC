
FROM python:3.10

WORKDIR /app/

COPY requirements.txt setup.py /app/

RUN pip install --no-cache-dir -r requirements.txt
COPY preprocessing/ /app/preprocessing/
COPY vitaminc /app/vitaminc/

RUN python setup.py install

COPY scripts/ /app/scripts/

CMD sh scripts/run_fact_verification.sh

