include makefile-docker/docker.mk

DOCKER_IMAGE_NAME    := chtison/baseconverter
DOCKER_IMAGE_TAGS    := latest 1 1.0.0

DOCKER_BUILD_DEPS    :=
TMP_DIR              :=

DOCKER_BUILD_OPTIONS += -f build/docker/Dockerfile
build := cd ../.. && $(strip $(build))
