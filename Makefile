.PHONY: all test clean

build:
	docker build -t gilded_rose .

lint:
	docker run -it -v $(shell pwd):/app gilded_rose rubocop gilded_rose.rb 

run:
	docker run -it -v $(shell pwd):/app gilded_rose bash

test:
	docker run -it -v $(shell pwd):/app gilded_rose rspec gilded_rose_spec.rb 
