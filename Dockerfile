# Setyp python env. from existing dockerimage found at dockerhub
FROM python:3.5

# Update and clean
#RUN apt-get update
#RUN apt-get clean

# Copy and install reqirements.txt
COPY requirements.txt /script/
RUN pip3 install -r /script/requirements.txt

# Copy current dir into dockerimage /script
COPY . /script/

# Open ports (make sure these are setup w. sacred + mongodb)
EXPOSE 8000
CMD -p 8000

# Substitute "test.py" with your script
CMD [ "python", "/scripts/test.py" ]  
