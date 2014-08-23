# coding: utf-8

import os
import sys

# from django.conf import global_settings
# from django.core.urlresolvers import reverse_lazy
# from django.utils.translation import ugettext_lazy as _


SITE_ID = 1
PROJECT_ROOT = os.path.abspath(os.path.dirname(os.path.dirname(__file__)))
ENV_ROOT = os.path.dirname(PROJECT_ROOT)

sys.path.insert(0, os.path.join(ENV_ROOT, 'compat/spirit'))
sys.path.insert(1, os.path.join(ENV_ROOT, 'apps'))
sys.path.insert(2, os.path.join(ENV_ROOT, 'compat'))
sys.path.insert(3, os.path.join(ENV_ROOT))

from spirit.settings import *
ST_PRIVATE_FORUM = True
ST_APPROVE_NEW_USERS = True
ST_COMMENTS_PER_PAGE = 30

# SECURITY WARNING: keep the secret key used in production secret!
SECRET_KEY = 'n6hd$-f8dn8@-!dg2tvldl+snhela+u#+a4rjwea(r&gtr7r9r:settings'

DEBUG = False
TEMPLATE_DEBUG = DEBUG

ALLOWED_HOSTS = ['188.226.152.105']


# Application definition
if len(MIDDLEWARE_CLASSES):
    MIDDLEWARE_CLASSES = [
        __class \
        for __class in MIDDLEWARE_CLASSES \
        if __class != 'django.middleware.locale.LocaleMiddleware'
    ]
    MIDDLEWARE_CLASSES = tuple(MIDDLEWARE_CLASSES)
MIDDLEWARE_CLASSES += (
)

ROOT_URLCONF = 'main.urls'

WSGI_APPLICATION = 'main.wsgi.application'

# Database
DATABASE_ENGINE = 'django.db.backends.postgresql_psycopg2'

DATABASE_NAME = 'class'
DATABASE_USER = 'class'
DATABASE_PASSWORD = ''
DATABASE_HOST = 'localhost'
DATABASE_PORT = '5432'
DATABASES = {
    'default': {
        'ENGINE': DATABASE_ENGINE,
        'NAME': DATABASE_NAME,
        'USER': DATABASE_USER,
        'PASSWORD': DATABASE_PASSWORD,
        'HOST': DATABASE_HOST,
        'PORT': DATABASE_PORT,
    }
}

INSTALLED_APPS += (
    'django.contrib.auth',
    'django.contrib.contenttypes',
    'django.contrib.sessions',
    'django.contrib.sites',
    'django.contrib.messages',
    # 'django.contrib.staticfiles',
    'django.contrib.admin',
    'django.contrib.admindocs',
    'django.contrib.formtools',
    
    'south',
    'spirit',
    'post_office',
)
    

DEFAULT_FROM_EMAIL = 'noreply@class.com'
SERVER_EMAIL = DEFAULT_FROM_EMAIL    
EMAIL_BACKEND = 'post_office.EmailBackend'


# Internationalization
# https://docs.djangoproject.com/en/1.6/topics/i18n/
LANGUAGE_CODE = 'ru'

TIME_ZONE = 'UTC'
USE_I18N = True
USE_L10N = True
USE_TZ = True


# Static files (CSS, JavaScript, Images)
# https://docs.djangoproject.com/en/1.6/howto/static-files/

STATIC_ROOT = os.path.join(ENV_ROOT, 'static')
STATIC_URL = '/static/'

MEDIA_ROOT = os.path.join(ENV_ROOT, 'media')
MEDIA_URL = '/media/'

STATICFILES_DIRS = (
    os.path.join(PROJECT_ROOT, 'static'),
)
