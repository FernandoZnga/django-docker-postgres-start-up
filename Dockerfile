FROM python:3
ENV PYTHONUNBUFFERED 1
RUN mkdir /code
WORKDIR /code
COPY requirements-dev.txt /code/
COPY requirements.txt /code/
RUN pip install -r requirements-dev.txt
COPY . /code/