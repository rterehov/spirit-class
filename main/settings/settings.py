# coding: utf-8

import os
import sys

from spirit.settings import *

# from django.conf import global_settings
# from django.core.urlresolvers import reverse_lazy
# from django.utils.translation import ugettext_lazy as _


PROJECT_ROOT = os.path.abspath(os.path.dirname(os.path.dirname(__file__)))
ENV_ROOT = os.path.dirname(PROJECT_ROOT)

sys.path.insert(0, os.path.join(ENV_ROOT, 'apps'))
sys.path.insert(1, os.path.join(ENV_ROOT, 'compat'))
sys.path.insert(2, os.path.join(ENV_ROOT))


# SECURITY WARNING: keep the secret key used in production secret!
SECRET_KEY = 'n6hd$-f8dn8@-!dg2tvldl+snhela+u#+a4rjwea(r&gtr7r9r:settings'

# SECURITY WARNING: don't run with debug turned on in production!
DEBUG = False
TEMPLATE_DEBUG = False

ALLOWED_HOSTS = []


# Application definition
MIDDLEWARE_CLASSES = (
    'django.contrib.sessions.middleware.SessionMiddleware',
    'django.middleware.common.CommonMiddleware',
    'django.middleware.csrf.CsrfViewMiddleware',
    'django.contrib.auth.middleware.AuthenticationMiddleware',
    'django.contrib.messages.middleware.MessageMiddleware',
    'django.middleware.clickjacking.XFrameOptionsMiddleware',
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
    'south',
    'post_office',
)
    


# Internationalization
# https://docs.djangoproject.com/en/1.6/topics/i18n/
# LANGUAGE_CODE = 'en-us'
LANGUAGE_CODE = 'ru-RU'

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