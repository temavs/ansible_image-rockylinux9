FROM rockylinux:9
LABEL maintainer="tema.vs"
ENV container=docker


# Install requirements.
RUN yum -y install rpm dnf-plugins-core \
 && yum -y update \
 && yum -y install \
      sudo \
      which \
      hostname \
      libyaml \
      python3 \
      python3-pip \
      python3-pyyaml \
 && yum clean all

# Upgrade pip to latest version.
RUN pip3 install --upgrade pip

# Install Ansible via Pip.
RUN pip3 install ansible

# Install Ansible inventory file.
RUN mkdir -p /etc/ansible
RUN echo -e '[local]\nlocalhost ansible_connection=local' > /etc/ansible/hosts

VOLUME ["/sys/fs/cgroup"]
CMD ["/bin/bash"]
