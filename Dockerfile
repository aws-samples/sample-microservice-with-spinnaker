FROM python:2

# We copy just the requirements.txt first to leverage Docker cache
COPY requirements.txt /app/requirements.txt

WORKDIR /app

RUN pip install -r requirements.txt

COPY app.py /app

ENTRYPOINT [ "python" ]

CMD [ "app.py" ]
