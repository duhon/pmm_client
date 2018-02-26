FROM percona/pmm-server

RUN yum -y install initscripts pmm-client && yum clean all	

COPY pmm_client.ini /etc/supervisord.d/pmm_client.ini
COPY pmm.yml /usr/local/percona/pmm-client/pmm.yml
