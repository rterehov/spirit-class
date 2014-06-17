# coding: utf-8

from .settings import *

DATABASE_NAME = 'class_st'
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


SECRET_KEY = 'n6hn$-28zn8@-!rn2tvldl+yn3ela+u#+d4rbwe@(r&gtr7r9r:stage'