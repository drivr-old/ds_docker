#Python dockerfile for Data Science deployments and testing

### Table of Contents  
[Recording data from experiments](#Recording data from experiments)   
[Running MongoDB to record experiments](##Running MongoDB to record experiments)  
[How to use this image](#How to use this image)  
[Good practices for dockerfiles](#Good practices for dockerfiles)


<a name="Recording data from experiments"/>
### Recording data from experiments
We use [Sacred](https://pypi.python.org/pypi/sacred) to record experiments and models and store the results in MongoDB.
Using Sacred is done through decorators:

```
from sacred import Experiment
from sacred.observers import MongoObserver #To be able to record and store the experiment

ex = Experiment('my_experiment') 

@ex.config #To capture configs
def my_config():
    foo = 42
    bar = 'baz'

@ex.capture #To capture functions
def some_function(a, foo, bar=10):
    print(a, foo, bar)

@ex.automain #To capture the run
def my_main():
    some_function(1, 2, 3)     
```

Running the script:  
`my_experiment.py -m HOST:PORT:MY_DB`  
To save the recording to the database.

Also, read the [documentation](http://sacred.readthedocs.io/en/latest/)

<a name="Running MongoDB to record experiments"/>
#### Running MongoDB to record experiments
First ensure that Mongo is running:  
`cat var/log/mongodb/mongod.log`  
If not, then start it with:  
`sudo service mongod start`  
By default, mongo runs localhost and on port 27017.  
For info on the mongo shell, refer to the [documentation](https://docs.mongodb.com/manual/mongo/)  

<a name="How to use this image"/>
### How to use this image:
You can get the image in two ways;
The first being the easist is to run the command:  
`docker pull drivr/ds_docker`  
This will download and build the latest version from Dockerhub that is synced with the github master version.
Tags will be added later, but follows the same logic there tag will correspond to the branch.  
`docker pull drivr/ds_docker:<TAG>`  

The second option:
- Git clone this repo
- Navigate into the folder containing the Dockerfile
- Add any scripts and needed files
- If you want to run another script by default change the option in the Dockerfile
- Build image:   
`docker build -t <name for image> .`  
- Run image:  
`docker run <name for image> python /scripts/your-script.py`  

<a name="Good pract for dockerf">
###Good practices for dockerfiles:
- Run only one process per container
- Avoid unnecessary packages
- See https://docs.docker.com/engine/userguide/eng-image/dockerfile_best-practice
