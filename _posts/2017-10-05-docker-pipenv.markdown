---
layout: "single"
title:  "Using Pipenv in conjunction with Docker"
categories: python docker
date: 2017-10-05
---

I published a [small repository on Github](https://github.com/dfederschmidt/docker-pipenv-sample) illustrating how to use Pipenv with Docker to manage Python dependencies.

<!--more-->

[Pipenv](https://github.com/kennethreitz/pipenv) is the new Python packaging tool developed by [Kenneth Reitz](https://www.kennethreitz.org/) and
combines the capabilities of virtual python environments and pip to form a convenient tool for developing and Python software. Since some people (me included) are [curious](https://github.com/kennethreitz/pipenv/issues/63) how that changes other parts of publishing and software
such as "dockerizing" your application developed with Pipenv for deployment I made a minimal working example how to use both tools together.

Pipenv automatically spawns a new virtual environment if `pipenv install` is run and no virtual python environment exists for this project already to install the packages in `Pipfile` into. In a Docker container, this is not necessary because you don't need isolated environments since Docker containers should generally be [single-purpose](https://docs.docker.com/engine/admin/multi-service_container/).

Instead, you run
```
RUN pipenv install --system
```

which installs all packages into the systems python environment which is exactly what we want to do if the application is installed inside a Docker container. Look, even [Pipenv's Dockerfile is doing it this way!](https://github.com/kennethreitz/pipenv/blob/master/Dockerfile)
