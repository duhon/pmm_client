FROM percona/pmm-server

RUN yum -y install initscripts && yum clean all	

COPY pmm_client.ini /etc/supervisord.d/pmm_client.ini
COPY pmm.yml /usr/local/percona/pmm-client/pmm.yml
