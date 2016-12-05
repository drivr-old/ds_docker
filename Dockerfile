# Setyp python env. from existing dockerimage found at dockerhub
FROM python3.5

# Update and clean
RUN apt-get update
RUN apt-get clean

# Copy current dir into dockerimage /src
COPY . /src

# Install python packages from requirements.txt
RUN pip3 install -r requirements.txt

# Open ports (make sure these are setup w. sacred + mongodb)
EXPOSE 8000
CMD -p 8000
