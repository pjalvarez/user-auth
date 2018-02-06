server:
  port: _MICROSERVICE_PORT_
spring:
  application:
    name: _MICROSERVICE_
eureka:
  instance:
    leaseRenewalIntervalInSeconds: 10
    leaseExpirationDurationInSeconds: 11
    ip-address: _MICROSERVICE_ACCESS_IP_
    prefer-ip-address: true
  client:
    serviceUrl:
      defaultZone: http://_EUREKA_VHOST_:_EUREKA_PORT_/eureka/
zuul:
  prefix: /api
  routes:
    gis:
      path: /wfs/**
      serviceId: _GIS_SERVICE_
      strip-prefix: false
    users-manager-service:
      path: /users/**
      serviceId: _USER_MANAGEMENT_SERVICE_
      strip-prefix: false
    data-visualization-service:
      path: /data-visualization/**
      serviceId: _DATA_VISUALIZATION_SERVICE_
      strip-prefix: false
hystrix:
  command:
    default:
      execution:
        isolation:
          thread:
            timeoutInMilliseconds: 60000
logging:
  file: logs/${spring.application.name}.log
  level:
    org.springframework.cloud: DEBUG
