FROM eddelbuettel/r2u:22.04

RUN mkdir -p /home/ubuntu/model
RUN mkdir -p /home/ubuntu/model/data
RUN mkdir -p /home/ubuntu/model/R
RUN mkdir -p /home/ubuntu/model/output

WORKDIR /home/ubuntu/model

COPY packages.R ./packages.R

RUN Rscript packages.R


COPY R/* R/
COPY data/ data/
COPY main.R main.R

ARG test_arg=TRUE
ENV test=$test_arg

CMD [ "Rscript","main.R" ]