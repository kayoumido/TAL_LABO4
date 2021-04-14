FROM continuumio/miniconda3

RUN mkdir /home/user
RUN chown 1000:1000 /home/user
RUN echo $PATH
ENV HOME=/home/user
ENV PATH=/home/user/.local/bin:/opt/conda/bin:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin
#RUN mkdir /.local
#RUN chown 1000:1000 /.local
#RUN mkdir /.cache
#RUN chown 1000:1000 /.cache
RUN chown -R 1000:1000 /opt/conda
RUN mkdir /opt/notebooks
WORKDIR /opt/notebooks
USER 1000:1000
#COPY requirements.txt /tmp/requirements.txt
#RUN pip install -r /tmp/requirements.txt
RUN /opt/conda/bin/conda install jupyter -y --quiet 
RUN /opt/conda/bin/conda install openjdk -y --quiet 
RUN pip install matplotlib
RUN pip install nltk

EXPOSE 8888

ENTRYPOINT [ "/opt/conda/bin/jupyter", "notebook", "--notebook-dir=/opt/notebooks", "--ip='*'", "--port=8888", "--no-browser"]
#ENTRYPOINT [ "/opt/conda/bin/jupyter", "notebook", "--notebook-dir=/opt/notebooks", "--ip='*'", "--port=8888", "--no-browser", "--allow-root"]

#  /opt/conda/bin/jupyter notebook 
#    --notebook-dir=/opt/notebooks 
#    --ip='*' 
#    --port=8888 
#    --no-browser
