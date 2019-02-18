
## Bulk of this file based on cardcorp/r-java dockerfile
## Start with the tidyverse rocker image
FROM rocker/tidyverse

MAINTAINER Matt Mulvahill <matt.mulvahill@gmail.com

# Install java and rJava
RUN apt-get -y update && apt-get install -y \
   default-jdk \
   r-cran-rjava \
   && apt-get clean \
   && rm -rf /var/lib/apt/lists/

# Install ODBC stuff
RUN apt-get -y update && apt-get install -y --install-suggests \
   unixodbc unixodbc-dev \
   && apt-get clean \
   && rm -rf /var/lib/apt/lists/

# Install further R packages
RUN install2.r --error --deps TRUE \
   RJDBC \
   DBI \
   odbc \
   && rm -rf /tmp/downloaded_packages/ /tmp/*.rds
