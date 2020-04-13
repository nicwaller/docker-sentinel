.PHONY: build
build: Dockerfile
	docker-compose build sentinel

.PHONY: push
push: build
	docker push nicwaller/sentinel

.PHONY: test
test: build
	docker-compose run sentinel-test

.PHONY: shell
shell: build
	docker run --rm -it --entrypoint /bin/bash nicwaller/sentinel