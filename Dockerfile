FROM python:2.7-alpine
ENV PYTHONUNBUFFERED 1

ENV C_FORCE_ROOT true

RUN apk update
RUN apk add --no-cache --virtual=build-deps gcc build-base python2-dev musl-dev gettext openssl-dev
RUN apk add --no-cache libffi-dev jpeg-dev zlib-dev mariadb-dev

WORKDIR /code
COPY . .
RUN pip install -r requirements.pip

EXPOSE 8000
CMD python manage.py migrate; python manage.py runserver 0.0.0.0:8000
RUN apk del build-deps