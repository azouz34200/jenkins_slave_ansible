ARG JENKINS_SLAVE_VERSION=3.10-2
FROM jenkinsci/slave:${JENKINS_SLAVE_VERSION}
ARG ANSIBLE_VERSION=2.1.2.0
LABEL Description="${ANSIBLE_VERSION}"
USER root
RUN apt-get update -y && apt-get install -y python-yaml python-jinja2 python-pip
RUN mkdir /etc/ansible/
RUN echo -e '[local]\nlocalhost' > /etc/ansible/hosts

USER jenkins
RUN pip install ansible=="${ANSIBLE_VERSION}"