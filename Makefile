setup:
	python3.11 -m venv ./.venv
	. .venv/bin/activate
	python3.11 --version
	pip

install:
		pip3 install --upgrade pip &&\
		pip3 --version &&\
		pip3 install -r requirements.txt

test:
	python -m pytest -vv test_invoke.py

format:
	black *.py


lint:
	pylint --disable=R,C invoke.py

all: install lint test