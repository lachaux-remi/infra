# Docker-compose collections

Collection for self-hosted services running on Docker Compose, Traefik and using free SSL/TLS certificates provided by Let's Encrypt.

## Installation

Make sure you have [Docker](https://docs.docker.com/install/) installed on your machine.

To get started, clone the repository to your local machine using the following command:

```bash
git clone https://github.com/lachaux-remi/infra.git /opt/infra
```

Before running the Docker services, create a Docker network using the following command:

```bash
 docker network create --driver=bridge --subnet=172.19.0.0/24 traefik_lan
```

## Usage

### 1. `make start`

Starts the specified Docker service defined in the `docker-compose.yml` file.

Usage:

```bash
make start service=<service_name>
```

Note: The `<service_name>` corresponds to the name of the folder that contains the service's `docker-compose.yml` file.

### 2. `make stop`

Stops the specified Docker service.

Usage:

```bash
make stop service=<service_name>
```

Note: The `<service_name>` corresponds to the name of the folder that contains the service's `docker-compose.yml` file.

### 3. `make restart`

Restarts the specified Docker service. This involves stopping the service first and then starting it again.

Usage:

```bash
make restart service=<service_name>
```

Note: The `<service_name>` corresponds to the name of the folder that contains the service's `docker-compose.yml` file.

### 4. `make update`

Updates the Docker images and restarts the service.

Usage:

```bash
make update service=<service_name>
```

Note: The `<service_name>` corresponds to the name of the folder that contains the service's `docker-compose.yml` file.

## Authors

- [@lachaux-remi](https://www.github.com/lachaux-remi)
