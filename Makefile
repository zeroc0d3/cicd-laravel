# -----------------------------------------------------------------------------
#  MAKEFILE RUNNING COMMAND
# -----------------------------------------------------------------------------
#  Author     : Dwi Fahni Denni (@zeroc0d3)
#  License    : Apache version 2
# -----------------------------------------------------------------------------
# Notes:
# use [TAB] instead [SPACE]

export PATH_WORKSPACE="src"
export PATH_DOCKER="docker"
export PATH_SCRIPTS="scripts"
export PATH_SCRIPT_INSTALLER="scripts/installer"
export PROJECT_NAME="Laravel-Auth"
export SSH_PRIVATE_KEY=${CONFIG_SSH_PRIVATE_KEY}
export KNOWN_HOSTS=${CONFIG_KNOWN_HOSTS}
export GIT_SYNC_URL=${CONFIG_GIT_SYNC_URL}
export GIT_SYNC_BRANCH=${CONFIG_GIT_SYNC_BRANCH}
export GIT_SYNC_TARGET_URL=${CONFIG_GIT_SYNC_TARGET_URL}

run-docker:
	@echo "============================================"
	@echo " Task      : Docker Container "
	@echo " Date/Time : `date`"
	@echo "============================================"
	@cd ${PATH_DOCKER} && ./run-docker.sh
	@echo "- DONE -"

stop-docker:
	@echo "============================================"
	@echo " Task      : Stopping Docker Container "
	@echo " Date/Time : `date`"
	@echo "============================================"
	@cd ${PATH_DOCKER} && docker-compose -f ./compose/app-compose.yml stop
	@echo "- DONE -"

remove-docker:
	@echo "============================================"
	@echo " Task      : Remove Docker Container "
	@echo " Date/Time : `date`"
	@echo "============================================"
	@cd ${PATH_DOCKER} && docker-compose -f ./compose/app-compose.yml down
	@echo "- DONE -"

composer-install:
	@echo "============================================"
	@echo " Task      : Composer Install "
	@echo " Date/Time : `date`"
	@echo "============================================"
	@cd ${PATH_WORKSPACE} && composer install
	@echo "- DONE -"

composer-install-cicd:
	@echo "============================================"
	@echo " Task      : Composer Install CI/CD"
	@echo " Date/Time : `date`"
	@echo "============================================"
	@cd ${PATH_WORKSPACE} && composer install --prefer-dist --no-ansi --no-interaction --no-progress --no-scripts --no-suggest
	@echo "- DONE -"

composer-update:
	@echo "============================================"
	@echo " Task      : Composer Update "
	@echo " Date/Time : `date`"
	@echo "============================================"
	@cd ${PATH_WORKSPACE} && composer update
	@echo "- DONE -"

composer-update-cicd:
	@echo "============================================"
	@echo " Task      : Composer Update CI/CD"
	@echo " Date/Time : `date`"
	@echo "============================================"
	@cd ${PATH_WORKSPACE} && composer update --no-interaction --no-progress  --prefer-dist --optimize-autoloader --ignore-platform-reqs
	@echo "- DONE -"

composer-dumpautoload:
	@echo "============================================"
	@echo " Task      : Composer Dump Autoload "
	@echo " Date/Time : `date`"
	@echo "============================================"
	@cd ${PATH_WORKSPACE} && composer dumpautoload -o
	@echo "- DONE -"

composer-selfupdate:
	@echo "============================================"
	@echo " Task      : Composer Update "
	@echo " Date/Time : `date`"
	@echo "============================================"
	@cd ${PATH_WORKSPACE} && composer self-update
	@echo "- DONE -"

key-generate:
	@echo "============================================"
	@echo " Task      : Generate Key "
	@echo " Date/Time : `date`"
	@echo "============================================"
	@cd ${PATH_WORKSPACE} && php artisan key:generate
	@echo "- DONE -"

clear-view:
	@echo "============================================"
	@echo " Task      : Clear Compiled Views "
	@echo " Date/Time : `date`"
	@echo "============================================"
	@cd ${PATH_WORKSPACE} && php artisan view:clear
	@echo "- DONE -"

clear-cache:
	@echo "============================================"
	@echo " Task      : Clear Application Cache "
	@echo " Date/Time : `date`"
	@echo "============================================"
	@cd ${PATH_WORKSPACE} && php artisan cache:clear
	@echo "- DONE -"

clear-config:
	@echo "============================================"
	@echo " Task      : Clear Configuration Cache "
	@echo " Date/Time : `date`"
	@echo "============================================"
	@cd ${PATH_WORKSPACE} && php artisan config:clear
	@echo "- DONE -"

clear-event:
	@echo "============================================"
	@echo " Task      : Clear Cached Event "
	@echo " Date/Time : `date`"
	@echo "============================================"
	@cd ${PATH_WORKSPACE} && php artisan event:clear
	@echo "- DONE -"

clear-debug:
	@echo "============================================"
	@echo " Task      : Clear Debugbar Storage "
	@echo " Date/Time : `date`"
	@echo "============================================"
	@cd ${PATH_WORKSPACE} && php artisan debug:clear
	@echo "- DONE -"

clear-all:
	@echo "============================================"
	@echo " Task      : Clear All Cache "
	@echo " Date/Time : `date`"
	@echo "============================================"
	@cd ${PATH_WORKSPACE} && php artisan view:clear
	@cd ${PATH_WORKSPACE} && php artisan cache:clear
	@cd ${PATH_WORKSPACE} && php artisan config:clear
	@cd ${PATH_WORKSPACE} && php artisan debug:clear
	@echo "- DONE -"

fixing-cache:
	@echo "============================================"
	@echo " Task      : Fixing Cache Path"
	@echo " Date/Time : `date`"
	@echo "============================================"
	@cd ${PATH_WORKSPACE} && for i in {"sessions","views","cache"}; do mkdir -p storage/framework/$i; done
	@echo "- DONE -"

fixing-chmod:
	@echo "============================================"
	@echo " Task      : Fixing Chmod Folders"
	@echo " Date/Time : `date`"
	@echo "============================================"
	@cd ${PATH_WORKSPACE} && chmod -R ug+rwx storage bootstrap/cache
	@echo "- DONE -"

storage-symlink:
	@echo "============================================"
	@echo " Task      : Storage Symlink"
	@echo " Date/Time : `date`"
	@echo "============================================"
	@cd ${PATH_WORKSPACE} && chmod -R ug+rwx storage bootstrap/cache
	@echo "- DONE -"

run-migrate:
	@echo "============================================"
	@echo " Task      : Running Artisan Migrate "
	@echo " Date/Time : `date`"
	@echo "============================================"
	@cd ${PATH_WORKSPACE} && php artisan migrate
	@echo "- DONE -"

run-seed:
	@echo "============================================"
	@echo " Task      : Running Artisan Seed "
	@echo " Date/Time : `date`"
	@echo "============================================"
	@cd ${PATH_WORKSPACE} && php artisan db:seed
	@echo "- DONE -"

run-migrate-all:
	@echo "============================================"
	@echo " Task      : Running Artisan Migrate & Seed "
	@echo " Date/Time : `date`"
	@echo "============================================"
	@cd ${PATH_WORKSPACE} && php artisan migrate:install && php artisan migrate --seed
	@echo "- DONE -"

run-npm:
	@echo "============================================"
	@echo " Task      : Running NPM Install "
	@echo " Date/Time : `date`"
	@echo "============================================"
	@cd ${PATH_WORKSPACE} && npm install
	@echo "- DONE -"

run-yarn:
	@echo "============================================"
	@echo " Task      : Running YARN Install "
	@echo " Date/Time : `date`"
	@echo "============================================"
	@cd ${PATH_WORKSPACE} && yarn install
	@echo "- DONE -"

run-mix-dev:
	@echo "============================================"
	@echo " Task      : Running Mix Develop "
	@echo " Date/Time : `date`"
	@echo "============================================"
	@cd ${PATH_WORKSPACE} && npm run dev
	@echo "- DONE -"

run-mix-prod:
	@echo "============================================"
	@echo " Task      : Running Mix Production "
	@echo " Date/Time : `date`"
	@echo "============================================"
	@cd ${PATH_WORKSPACE} && npm run production
	@echo "- DONE -"

run-mix-watch:
	@echo "============================================"
	@echo " Task      : Running Mix Watch "
	@echo " Date/Time : `date`"
	@echo "============================================"
	@cd ${PATH_WORKSPACE} && npm run watch
	@echo "- DONE -"

run-project:
	@echo "============================================"
	@echo " Task      : Running Project "
	@echo " Date/Time : `date`"
	@echo "============================================"
	@cd ${PATH_WORKSPACE} && php artisan serve --port=8080
	@echo "- DONE -"

prepare-ci-bitbucket:
	@chmod +x ${PATH_SCRIPTS}/*.sh
	@cp ${PATH_SCRIPTS}/*.sh /tmp
	@./tmp/ci-bitbucket-preparation.sh $(SSH_PRIVATE_KEY) $(KNOWN_HOSTS)

prepare-ci-gitlab:
	@chmod +x ${PATH_SCRIPTS}/*.sh
	@cp ${PATH_SCRIPTS}/*.sh /tmp
	@./tmp/ci-gitlab-preparation.sh $(SSH_PRIVATE_KEY) $(KNOWN_HOSTS)

deploy-staging:
	@echo "============================================"
	@echo " Task      : Deploy ${PROJECT_NAME} Staging "
	@echo " Date/Time : `date`"
	@echo "============================================"
	@cap staging deploy
	@echo "- DONE -"

deploy-production:
	@echo "============================================"
	@echo " Task      : Deploy ${PROJECT_NAME} Production "
	@echo " Date/Time : `date`"
	@echo "============================================"
	@cap production deploy
	@echo "- DONE -"

deploy-all:
	@echo "--------------------------------------------"
	@echo " Deploy ${PROJECT_NAME} All Projects "
	@echo " Start At  : `date`"
	@echo "--------------------------------------------"
	@echo ""
	@echo "============================================"
	@echo " Task      : Deploy ${PROJECT_NAME} Staging "
	@echo " Date/Time : `date`"
	@echo "============================================"
	@cap staging deploy
	@echo "- DONE -"
	@echo ""
	@echo "============================================"
	@echo " Task      : Deploy ${PROJECT_NAME} Production "
	@echo " Date/Time : `date`"
	@echo "============================================"
	@cap production deploy
	@echo "- DONE -"
	@echo ""
	@echo "--------------------------------------------"
	@echo " Finish At : `date`"
	@echo "--------------------------------------------"
	@echo "--- SUCCESS ALL DONE --- "

synchronize-staging:
	@echo "============================================"
	@echo " Task      : Synchronize Repo ${PROJECT_NAME} "
	@echo " Date/Time : `date`"
	@echo "============================================"
	@./${PATH_SCRIPTS}/ci-synchronize-repository.sh $(GIT_SYNC_URL) dev-staging $(GIT_SYNC_TARGET_URL)

synchronize-production:
	@echo "============================================"
	@echo " Task      : Synchronize Repo ${PROJECT_NAME} "
	@echo " Date/Time : `date`"
	@echo "============================================"
	@./${PATH_SCRIPTS}/ci-synchronize-repository.sh $(GIT_SYNC_URL) dev-master $(GIT_SYNC_TARGET_URL)
