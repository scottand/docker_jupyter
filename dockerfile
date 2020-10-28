# Use the latest miniconda image from DockerHub
# Miniconda is contains Python and Conda
FROM continuumio/miniconda3

# Setting metadata for reference
LABEL maintainer = "scottand" \
      description = "Used to create a standardized notebook container with pandas pre-installed"

# Set the working directory within the container
WORKDIR /app

# Copy the current directory (local) contents into the following container location
COPY . /app

# Installing libraries
RUN conda install jupyter -y && \
    conda install pandas

# Making port 8888 accessible outside of container
EXPOSE 8888

# Creating mountpoint so container can copy locally stored data
VOLUME [ "/app" ]

# Run jupyter on container startup
CMD [ "jupyter", "notebook", "--ip='*'", "--port=8888", "--no-browser", "--allow-root" ]
