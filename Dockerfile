FROM python:3.8

RUN pip3 -V && pip3 install --upgrade pip

COPY ./requirements.txt /webapp/requirements.txt

WORKDIR /webapp

RUN pip3 -V && pip3 install -r requirements.txt

COPY webapp/* /webapp

COPY roberta-sequence-classification-9.onnx /webapp

ENTRYPOINT [ "python" ]

CMD [ "app.py" ]

