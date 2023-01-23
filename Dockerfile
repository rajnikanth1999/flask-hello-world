FROM python:3.9.15-slim
RUN apt update && apt install git -y
RUN git clone https://github.com/rajnikanth1999/flask-hello-world.git
WORKDIR ./flask-hello-world
RUN pip3 install flask && pip install flask_sqlalchemy && export FLASK_APP=hello.py && export FLASK_ENV=development
EXPOSE 5000
CMD ["flask","run","-h","0.0.0.0"]