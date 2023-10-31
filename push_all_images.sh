#!/bin/bash

# Set the source and destination image repositories
SOURCE_REPOSITORY=$1
DESTINATION_REPOSITORY=$2

# Get all the tags of the source image
IMAGE_TAGS=$(skopeo inspect $SOURCE_REPOSITORY | jq -r '.RepoTags[]')

# Copy all the tags of the source image to the destination repository
for TAG in $IMAGE_TAGS; do
  skopeo copy $SOURCE_REPOSITORY:$TAG $DESTINATION_REPOSITORY:$TAG
done


