setup:
	python3.8 -m venv ./.venv
	. .venv/bin/activate

install:
		python3.8 -m pip install --upgrade pip &&\
		python3.8 -m pip --version &&\
		python3.8 -m pip install -r requirements.txt

package: download-model
	docker build -t ml-example-app .
	docker tag ml-example-app:latest 316650359375.dkr.ecr.ap-southeast-2.amazonaws.com/ml-example-app:latest

publish: container-repo-login
	docker push 316650359375.dkr.ecr.ap-southeast-2.amazonaws.com/ml-example-app:latest

container-repo-login:
	aws ecr get-login-password --region ap-southeast-2 | docker login --username AWS --password-stdin 316650359375.dkr.ecr.ap-southeast-2.amazonaws.com

download-model:
	aws s3 cp s3://welms-models/roberta/roberta-sequence-classification-9.onnx .

test:
	python -m pytest -vv test_invoke.py

format:
	black *.py


lint:
	pylint --disable=R,C invoke.py

all: install lint test


STACK_NAME=ml-example-app-stack

deploy-app-runner:
	echo $(STACK_NAME)
	aws cloudformation create-stack \
		--stack-name $(STACK_NAME) \
		--template-body file://infrastructure/app-runner.yaml \
		--capabilities CAPABILITY_NAMED_IAM \
		--parameters ParameterKey=AppStackName,ParameterValue=$(STACK_NAME)