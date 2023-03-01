ARG BASE_TAG=latest

FROM busybox as config
RUN touch ecs_sd_targets.yaml

FROM amazon/aws-otel-collector:${BASE_TAG}
COPY --from=config ecs_sd_targets.yaml /etc
