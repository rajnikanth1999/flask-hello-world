FROM python:3.9.15-slim
RUN apt update && apt install git -y
RUN git clone https://github.com/rajnikanth1999/flask-hello-world.git
WORKDIR ./flask-hello-world
RUN sonar-scanner  -Dsonar.projectKey=flask  -Dsonar.sources=.  -Dsonar.host.url=http://44.203.73.66:9000  -Dsonar.login=sqp_f62552db7aff114d324875e779d47acfa1d8fc91
RUN cp hello.py app.py
RUN pip3 install flask && pip install flask_sqlalchemy 
RUN export FLASK_APP=hello.py && export FLASK_ENV=development
EXPOSE 5000
CMD ["flask","run","-h","0.0.0.0"]