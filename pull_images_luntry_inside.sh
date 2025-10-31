CHART_IMAGES_FILE="luntry-v4-v4.4.0/release-4.4.0-images.txt"
for image in $(cat $CHART_IMAGES_FILE | tail -n +2 | sed 's/registry.luntry.com/nexus-external:6014/g')
do
image_nexus_int=$(echo $image | sed 's/nexus-external:6014/nexus-internal:6001/g')
docker pull $image
docker tag $image $image_nexus_int
docker push $image_nexus_int
done
