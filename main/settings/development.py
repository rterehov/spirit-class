# coding: utf-8

from .settings import *

DATABASE_NAME = 'class_dev'
DATABASES = {
    'default': {
        'ENGINE': 'django.db.backends.postgresql_psycopg2',
        'NAME': DATABASE_NAME,
        'USER': DATABASE_USER,
        'PASSWORD': DATABASE_PASSWORD,
        'HOST': DATABASE_HOST,
        'PORT': DATABASE_PORT,
    }
}

SECRET_KEY = 'y6hn$-28yn8@-!rnutvldl+yn3elh+u#+d4rbke@(a&gtr7r9r:dev'
DEBUG = True

INTERNAL_IPS = (
    '127.0.0.1',
)