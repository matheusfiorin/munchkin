ifeq (run,$(firstword $(MAKECMDGOALS)))
  RUN_ARGS := $(wordlist 2,$(words $(MAKECMDGOALS)),$(MAKECMDGOALS))
  $(eval $(RUN_ARGS):;@:)
endif

.PHONY=help

help:  ## This help
	@awk 'BEGIN {FS = ":.*?## "} /^[a-zA-Z_-]+:.*?## / {printf "\033[36m%-20s\033[0m %s\n", $$1, $$2}' $(MAKEFILE_LIST) | sort

###
# Run section
###
clean: ## Clean our project build tmp files
	flutter clean
run: ## Run any app with flavor name. e.g. make run base
	flutter run --flavor $(RUN_ARGS) -t lib/main-$(RUN_ARGS).dart

###
# Dependencies section
###
dependencies: ## Install all dependencies
	cd local_packages/core && flutter pub get
	cd local_packages/presentation && flutter pub get
	flutter pub get
install-custom-flavors: ## Run the base command for flutter_flavorizr. Be careful: IT WILL OVERRIDE SOME FILES
	flutter pub run flutter_flavorizr -p assets:download,assets:extract,android:androidManifest,android:buildGradle,android:dummyAssets,flutter:flavors,ios:xcconfig,ios:buildTargets,ios:schema,ios:dummyAssets,ios:plist,ios:launchScreen,assets:clean,ide:config
	sed -i.bak '/class F {/,$d' lib/flavors.dart
	rm lib/flavors.dart.bak


###
# Tests section
###
test: ## Run all tests
	flutter test