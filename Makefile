# Path for caching docker layers
LAYERS_PATH=/home/circleci/docker-caches
# File where docker images layer ids are stored
LAYERS_LIST_FILE=all_layers.txt

# Configuration
copy-config:
	cp config/database.example.yml config/database.yml
