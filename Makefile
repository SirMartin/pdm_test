build:
	docker build -t pip-assembler-demo .

run: build
	docker run pip-assembler-demo

shell: build
	docker run -it pip-assembler-demo bash