##########
tunfish-ca
##########

Tunfish certificate authority.

.. image:: https://img.shields.io/badge/built%20with-Cookiecutter%20Django-ff69b4.svg
     :target: https://github.com/pydanny/cookiecutter-django/
     :alt: Built with Cookiecutter Django
.. image:: https://img.shields.io/badge/code%20style-black-000000.svg
     :target: https://github.com/ambv/black
     :alt: Black code style


:License: AGPLv3


*****
About
*****
- Django 3.0 application made with `Cookiecutter Django`_.
- Added Django application `django-ca`_.


.. _Cookiecutter Django: https://github.com/pydanny/cookiecutter-django
.. _django-ca: https://django-ca.readthedocs.io/


*****
Setup
*****
See also `Install django-ca as Django app`_.
::

    virtualenv .venv --python=python3.8
    source .venv/bin/activate
    pip install -r requirements/local.txt

    export USE_DOCKER=no
    export DATABASE_URL=sqlite:///tunfish-ca.db

    mkdir -p var/lib/ca
    export CA_DIR=$(pwd)/var/lib/ca

    python manage.py migrate
    python manage.py collectstatic

.. _Install django-ca as Django app: https://django-ca.readthedocs.io/en/latest/install.html#as-django-app-in-your-existing-django-project


*************
Run webserver
*************
::

    python manage.py createsuperuser --username admin --email admin@example.org
    python manage.py runserver


**********
Operations
**********
::

    # Create the root certificate for your CA
    python manage.py init_ca RootCA CN=ca.example.org

    # Request root certificate in DER format
    http http://localhost:8000/issuer/55067C65E99A75A70F1277DC52FEF134727BA36E.der
