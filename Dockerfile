FROM alpine

LABEL MAINTAINER="Mykola Pugach lokinroll@gmail.com"
ARG GITHUB_SSH_KEY
RUN apk --no-cache add --virtual gcc git openssh


RUN mkdir ~/.ssh/
RUN echo "${GITHUB_SSH_KEY}" > ~/.ssh/id_ed25519
RUN chmod 600 ~/.ssh/id_ed25519
RUN ssh-keyscan github.com >> ~/.ssh/known_hosts
# Print SSH_PRIVATE_KEY (for test)
RUN echo "${GITHUB_SSH_KEY}"

# RUN ssh -vT git@github.com

RUN mkdir /app/git -p

COPY runner.sh /app

RUN chmod +x /app/runner.sh

VOLUME /app/git

WORKDIR /app/git



ENTRYPOINT ["/app/runner.sh"]
