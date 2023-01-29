FROM openjdk:17
ADD target/k8s-demo.jar k8s-demo.jar
ENTRYPOINT ["java","-jar","/k8s-demo.jar"]