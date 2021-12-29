# Path for caching docker layers
LAYERS_PATH=/home/circleci/docker-caches
# File where docker images layer ids are stored
LAYERS_LIST_FILE=all_layers.txt
VPS_USER?=deploy
VPS_HOST?=ayenda-staging-webserver
RELEASE_FOLDER?=/var/www/ayenda

# Configuration
copy-config:
	cp config/database.example.yml config/database.yml
