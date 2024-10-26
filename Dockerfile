FROM maven AS buildstage
RUN mkdir /opt/mindcircuit14
WORKDIR /opt/mindcircuit14
COPY . .
RUN mvn clean install    ## artifact -- .war 

## tomcat deploy stage 
FROM tomcat 
WORKDIR webapps 
COPY --from=buildstage /opt/mindcircuit14/target/*.war .
RUN rm -rf ROOT && mv *.war ROOT.war
EXPOSE 8080
