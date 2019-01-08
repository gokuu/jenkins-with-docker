# Pull latest image
docker pull jenkins/jenkins:lts

# Get the version from the container
VERSION=$(docker run --rm jenkins/jenkins:lts sh -c 'echo $JENKINS_VERSION')

echo "Building image for Jenkins v${VERSION}"

# Build the image
docker build . \
  --tag pedromr/jenkins-with-docker:lts \
  --tag pedromr/jenkins-with-docker:latest \
  --tag pedromr/jenkins-with-docker:${VERSION}

docker push pedromr/jenkins-with-docker:lts
docker push pedromr/jenkins-with-docker:latest
docker push pedromr/jenkins-with-docker:${VERSION}
