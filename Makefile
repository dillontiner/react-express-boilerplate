docker-image = react-express-boilerplate

.PHONY: docker zip run
docker: Dockerfile
	make zip
	docker build --rm -t $(docker-image) .
zip:
	zip -r react-express.zip client/build server package.json Dockerfile Dockerrun.aws.json
run:
	docker run -p 5000:5000 -it $(docker-image)