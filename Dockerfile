ARG R_BIOC_VERSION=3.17
ARG R_BIOC_DOCKER=RELEASE_3_17

# Template from Dockerhub
FROM bioconductor/bioconductor_docker:${R_BIOC_DOCKER}

# Create directory passed to .libPaths() and set the Bioc version
RUN mkdir /r_user_lib/ && chown -c rstudio /r_user_lib/
ENV R_LIBS_USER=/r_user_lib/
ENV R_BIOC_VERSION=${R_BIOC_VERSION}

# Copy files to set RStudio appearance and timeout defaults
COPY rserver.conf /etc/rstudio/rserver.conf
COPY rprofile.R /home/rstudio/.Rprofile
COPY setup.R /r_user_lib/setup.R
COPY rstudio-prefs.json /home/rstudio/.config/rstudio/
RUN chown -c rstudio /r_user_lib/setup.R && \
    chown -c rstudio /home/rstudio/.Rprofile

# Install some boilerplate packages
USER rstudio
RUN Rscript --vanilla /r_user_lib/setup.R

USER root