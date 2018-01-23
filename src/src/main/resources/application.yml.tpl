server:
  port: _MICROSERVICE_PORT_
spring:
  application:
    name: _MICROSERVICE_
eureka:
  client:
    serviceUrl:
      defaultZone: http://_EUREKA_VHOST_:_EUREKA_PORT_/eureka/
zuul:
  prefix: /api
  routes:
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
