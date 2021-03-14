# =============
# Configuration
# =============

$(eval venv        := .venv)
$(eval pip         := $(venv)/bin/pip)
$(eval python      := $(venv)/bin/python)

# https://stackoverflow.com/questions/18136918/how-to-get-current-relative-directory-of-your-makefile/18137056#18137056
mkfile_path := $(abspath $(lastword $(MAKEFILE_LIST)))
pwd := $(notdir $(patsubst %/,%,$(dir $(mkfile_path))))

$(eval environment := USE_DOCKER=no DATABASE_URL=sqlite:///tunfish-ca.db CA_DIR=$(pwd)/var/lib/ca)


# =====
# Setup
# =====

# Setup Python virtualenv
setup-virtualenv:
	@test -e $(python) || python3 -m venv $(venv)

# Setup django-ca
init: setup-virtualenv
	$(pip) install --requirement requirements/local.txt
	mkdir -p var/lib/ca
	$(environment) $(python) manage.py migrate
	$(environment) $(python) manage.py init_ca RootCA CN=ca.example.org || true


# ===
# Run
# ===

run:
	$(environment) $(python) manage.py runserver 3333
