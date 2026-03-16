CHART_URL="https://registry.luntry.com/chartrepo/luntry/"
IMAGE_URL="registry.luntry.com"
VERSION="4.5.0"

helm repo update
helm repo add luntry --username ${CHART_USERNAME} --password ${CHART_PASSWORD} ${CHART_URL}
helm pull luntry/luntry-v4 --version ${VERSION}

CHART_FILE=$(ls -t | grep '.tgz' | head -1)
CHART_DIR=$(tar -xvf $CHART_FILE 2>/dev/null 1>&2 && ls -t | head -1 | awk -F '/' '{print $1}')
mv ${CHART_DIR} ${CHART_FILE%.tgz}
cd ${CHART_FILE%.tgz}
CHART_IMAGES=$(cat values.yaml | sed 's/enabled: false/enabled: true/g' | helm template . | grep 'image: ' | sed 's/^[[:space:]]*//' | sort -u | awk -F'"' '{print $2}')

podman login ${IMAGE_URL} -u ${CHART_USERNAME} -p ${CHART_PASSWORD}
podman pull $CHART_IMAGES

echo "Образы релиза $VERSION" > release-$VERSION-images.txt
echo "${CHART_IMAGES}" | tr ' ' '\n' >> release-$VERSION-images.txt
