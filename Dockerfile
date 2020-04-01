# Container image that runs your code
FROM asciidoctor/docker-asciidoctor

LABEL "version"="1.0"


# Copies your code file from your action repository to the filesystem path `/` of the container

COPY entrypoint.sh /entrypoint.sh

# Code file to execute when the docker container starts up (`entrypoint.sh`)
ENTRYPOINT ["/entrypoint.sh"]
