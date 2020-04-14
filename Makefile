export SENTINEL_VERSION=0.15.2

.PHONY: build
build: Dockerfile
	export SENTINEL_VERSION=$(SENTINEL_VERSION)
	docker-compose build sentinel
	docker tag sentinel:compose-latest nicwaller/sentinel:$(SENTINEL_VERSION)

.PHONY: push
push: build
	docker push nicwaller/sentinel:$(SENTINEL_VERSION)

.PHONY: test
test: build
	docker-compose run sentinel-test

.PHONY: shell
shell: build
	docker run --rm -it --entrypoint /bin/bash nicwaller/sentinel