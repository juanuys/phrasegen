.PHONY: run dist

dist:
	rm -rf docs/
	mkdir -p docs
	touch docs/_config.yml
	npm run dist
	./cachebust.sh

run:
	npm run start
