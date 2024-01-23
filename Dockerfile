FROM python:2
ENV DockerHOME=/home/app/webapp
ENV DB_ENGINE=django.db.backends.postgresql_psycopg2  
RUN mkdir -p $DockerHOME  
WORKDIR $DockerHOME  
COPY . $DockerHOME  
RUN pip install -r requirements.txt  
RUN pip install psycopg2
CMD notejam/manage.py syncdb --noinput && notejam/manage.py migrate && notejam/manage.py runserver 0.0.0.0:8000