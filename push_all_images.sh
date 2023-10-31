#!/bin/bash

# Set the source and destination image repositories
SOURCE_REPOSITORY="docker://"
DESTINATION_REPOSITORY="docker://afaqnasir/"

# Get all the tags of the source image
IMAGE_TAGS=$(skopeo inspect docker://sl | jq -r '.RepoTags[]')

# Copy all the tags of the source image to the destination repository
for TAG in $IMAGE_TAGS; do
  skopeo copy docker://sl:$TAG docker://afaqnasir/sl-bit:$TAG
done

# Push all the copied images to the destination repository
#for TAG in $IMAGE_TAGS; do
#  skopeo push docker://afaqnasir/sl-bit:$TAG docker://afaqnasir/sl-bit:$TAG
#done

