#Python dockerfile for Data Science deployments and testing

###How to use:
- Navigate into the folder containing the Dockerfile
- Add any scripts and needed files
- If you want to run another script by default change the option in the Dockerfile
- Build image: 
`docker build -t <name for image> .`
- Run image:
`docker run <name for image> python /scripts/your-script.py`

###Good practices for dockerfiles:
- Run only one process per container
- Avoid unnecessary packages
- See https://docs.docker.com/engine/userguide/eng-image/dockerfile_best-practices

