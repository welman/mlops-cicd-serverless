setup:
	python3.8 -m venv ./.venv
	. .venv/bin/activate
	python3.8 --version

install:
		python3.8 -m pip install --upgrade pip &&\
		python3.8 -m pip --version &&\
		python3.8 -m pip install -r requirements.txt

test:
	python -m pytest -vv test_invoke.py

format:
	black *.py


lint:
	pylint --disable=R,C invoke.py

all: install lint test