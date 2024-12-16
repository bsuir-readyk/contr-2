name = "solve"


default: bnr;


build:
	fpc ${name}$$N.dpr -o${name}$$N

run:
	./${name}$$N
	
bnr:
	@echo "\n\n---===---\nbuilding... \n---===---\n\n"
	make build
	@echo "\n\n---===---\nbuild done \ntrying to run:\n---===---\n\n"
	make run

