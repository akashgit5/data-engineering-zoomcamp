# base Docker image that we will build on

# base image: Python slim
FROM ubuntu:24.04

# install OpenJDK 17, Python3 and pip via apt
RUN apt-get update \
	 && DEBIAN_FRONTEND=noninteractive apt-get install -y --no-install-recommends \
		 openjdk-17-jdk python3 python3-pip python3-venv ca-certificates wget \
	 && rm -rf /var/lib/apt/lists/*

# set JAVA_HOME for tools
ENV JAVA_HOME=/usr/lib/jvm/java-17-openjdk-amd64
ENV PATH="$JAVA_HOME/bin:$PATH"

# set up our Python dependencies
RUN python3 -m venv /opt/venv \
	&& /opt/venv/bin/pip install --upgrade pip setuptools wheel \
	&& /opt/venv/bin/pip install --no-cache-dir pandas pyarrow pyspark

# use virtualenv python as default
ENV PATH="/opt/venv/bin:$PATH"

# set up the working directory inside the container
WORKDIR /app
# copy the script to the container. 1st name is source file, 2nd is destination
COPY pipeline.py pipeline.py

# define what to do first when the container runs
ENTRYPOINT ["python3", "pipeline.py"]