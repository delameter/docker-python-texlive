## docker-python-texlive   ## Docker image with LaTeX environment for PDF build with Sphinx
## (c) 2023                ## A. Shavykin <0.delameter@gmail.com>
##-------------------------##--------------------------------------------------------------
.ONESHELL:
.PHONY: help

DOTENV_LOCAL = .env
DOTENV_DIST = .env.dist

include ${DOTENV_DIST}
-include ${DOTENV_LOCAL}
export
VERSION ?= 0.0.0

NOW    := $(shell LC_TIME=en_US.UTF-8 date --rfc-3339=seconds)
BOLD   := $(shell tput -Txterm bold)
GREEN  := $(shell tput -Txterm setaf 2)
YELLOW := $(shell tput -Txterm setaf 3)
BLUE   := $(shell tput -Txterm setaf 4)
CYAN   := $(shell tput -Txterm setaf 6)
GRAY   := $(shell tput -Txterm setaf 7)
DIM    := $(shell tput -Txterm dim)
RESET  := $(shell printf '\e[m')
                                # tput -Txterm sgr0 returns SGR-0 with
                                # nF code switching esq, which displaces the columns
help:   ## Show this help
	@fgrep -h "##" $(MAKEFILE_LIST) | fgrep -v @fgrep | sed -Ee 's/^(##)\s?(\s*#?[^#]+)#*\s*(.*)/\1${YELLOW}\2${RESET}#\3/; s/(.+):(#|\s)+(.+)/##   ${GREEN}\1${RESET}#\3/; s/\*(\w+)\*/${BOLD}\1${RESET}/g; 2~1s/<([ )*<@>.A-Za-z0-9_(-]+)>/${DIM}\1${RESET}/gi' -e 's/(\x1b\[)33m#/\136m/' | column -ts# | sed -Ee 's/ {3}>/ >/'

help-verbose:   ## Show actual commands
	@if ! sh -c "command -v envsubst" >/dev/null ; then cat $(MAKEFILE_LIST) && exit ; fi
	@export FILENAME=${FILENAME} && sed -Ee '/^\S+:\s*#/!d;n' < $(MAKEFILE_LIST) | envsubst | {
		if sh -c "command -v bat" >/dev/null ; then bat -l make --decorations=never --theme TwoDark ; else cat ; fi
	}
	@echo

_cp_env = ([ ! -s $2 ] && { sed -E < $1 > $2  -e "1i\# This file has a higher priority than $1\n" -e "/^(\#|$$)/d" && echo "File created: $2" ; } || echo "Skipping: $2 already exists" ; )

prepare:  ## make local configuration file for image building
	@$(call _cp_env,$(DOTENV_DIST),$(DOTENV_LOCAL))

build:  ## Build docker image
	docker build . \
    	--build-arg IMAGE_VERSION="${VERSION}" \
    	--build-arg IMAGE_BUILD_DATE="${NOW}" \
    	--tag ${DOCKER_TAG}

publish:  ## Tag current image as latest and push
	docker push ${DOCKER_TAG}
	docker tag ${DOCKER_TAG} ${DOCKER_IMAGE}:latest
	docker push ${DOCKER_IMAGE}:latest
