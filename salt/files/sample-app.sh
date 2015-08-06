#!/bin/bash

/usr/bin/python manage.py migrate
/usr/bin/python manage.py runserver 0.0.0.0:8080
