FROM jetbrains/teamcity-base:latest 
#reverted back to orginal image as I don't have that folder content. I could copy it from image but decided not to do it for now.
#FROM alex2357/teamcity-base:latest
MAINTAINER AK <akubenko@gmail.com>


ENV TEAMCITY_DATA_PATH=/data/teamcity_server/datadir \
    TEAMCITY_DIST=/opt/teamcity \
    TEAMCITY_LOGS=/opt/teamcity/logs
RUN mkdir /opt/teamcity

COPY install-teamcity.sh /install-teamcity.sh 
RUN chmod +x /install-teamcity.sh 

#the less manual steps the better.
RUN /install-teamcity.sh


EXPOSE 8111
LABEL dockerImage.teamcity.version="latest" \
      dockerImage.teamcity.buildNumber="latest"

COPY run-services.sh /run-services.sh
RUN chmod +x /run-services.sh


VOLUME $TEAMCITY_DATA_PATH \
       $TEAMCITY_LOGS


CMD ["/run-services.sh"]
