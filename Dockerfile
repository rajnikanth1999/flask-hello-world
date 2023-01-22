FROM python:3.9.15-slim
RUN apt update && apt install git -y
RUN git clone https://github.com/Sysnove/flask-hello-world.git
WORKDIR ./flask-hello-world
RUN mv hello.py app.py
RUN pip3 install flask && pip install flask_sqlalchemy 
EXPOSE 5000
CMD ["flask","run","-h","0.0.0.0"]