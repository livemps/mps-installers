FROM debian

RUN mkdir  -p /opt/mps
COPY ./bootstrap.debian.bash /opt/mps/bootstrap.debian.bash
RUN /opt/mps/bootstrap.debian.bash -u odem -p odem
RUN git clone htpps://github.com/livemps/mps-installers /opt/mps/mps-installers
RUN cd /opt/mps/mps-installers && git pull


