setup:
	python3 -m venv ./.venv
	. .venv/bin/activate

install:
	pip install --upgrade pip &&\
		pip install -r requirements.txt

test:
	python -m pytest -vv test_invoke.py

format:
	black *.py


lint:
	pylint --disable=R,C invoke.py

all: install lint test