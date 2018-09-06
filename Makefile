.PHONY: version

VERSION := 1.0.0
MAJOR   := $(shell echo $(VERSION) | cut -d. -f1)

version:
	sed -Ei 's/^(DOCKER_IMAGE_TAGS[[:space:]]+:= latest).+$$/\1 $(MAJOR) $(VERSION)/' build/docker/Makefile
	sed -Ei 's#^([[:space:]]+image: chtison/baseconverter:)[[:digit:]]+$$#\1$(MAJOR)#' build/k8s/baseconverter.yaml
	sed -Ei 's/^(appVersion:) .+$$/\1 $(VERSION)/' build/helm/baseconverter/Chart.yaml
	sed -Ei 's/^([[:space:]]{4}tag:) [[:digit:]]+$$/\1 $(MAJOR)/' build/helm/baseconverter/values.yaml

version-test: version
	[ '$(VERSION)' = "`grep '^DOCKER_IMAGE_TAG' build/docker/Makefile | rev | cut -d' ' -f1 | rev`" ]
	[ '$(MAJOR)' = "`grep -E '^[[:space:]]+image: chtison/baseconverter' build/k8s/baseconverter.yaml | cut -d: -f3)`" ]
	[ '$(VERSION)' = "`grep '^appVersion:' build/helm/baseconverter/Chart.yaml | cut -d: -f2 | tr -d ' '`" ]
	[ '$(MAJOR)' = "`grep -E '^[[:space:]]+tag:' build/helm/baseconverter/values.yaml | cut -d: -f2 | tr -d ' '`" ]
