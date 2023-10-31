# Copy the source image to the destination repository and push all of its tags.

### First Download and install skopeo

For a detailed description how to install or build [skopeo](https://github.com/containers/skopeo), see [install.md](https://github.com/containers/skopeo/blob/main/install.md).

Then login the docker hub on skopeo
```
skopeo login docker.io
```

Then Enter the Docker hub Username & Password 

This will copy the latest tag of the source image to the destination repository and push it.

**Note:** If you want to push all of the tags of the source image to the destination repository, you can use the following bash script:

Bash

```
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
for TAG in $IMAGE_TAGS; do
  skopeo push docker://afaqnasir/sl-bit:$TAG docker://afaqnasir/sl-bit:$TAG
done
```


To use this script, save it as a file with a .sh extension, such as `push_all_images.sh`, and make it executable by running the following command:

Bash

```
chmod +x push_all_images.sh
```


Then, you can run the script by passing the source and destination image repositories as arguments:

Bash

```
./push_all_images.sh docker://SOURCE_REPOSITORY docker://DESTINATION_REPOSITORY
```


This it will copy all of the tags of the source image to the destination repository and push them.
