# coding: utf-8

# Локальный конфиг для сервера разработки

from .settings import *

DEBUG = True

# Database
DATABASE_NAME = 'class_dev'
from database import *

SECRET_KEY = 'y6hn$-28yn8@-!rnutvldl+yn3elh+u#+d4rbke@(a&gtr7r9r:dev'

INTERNAL_IPS = (
    '127.0.0.1',
)