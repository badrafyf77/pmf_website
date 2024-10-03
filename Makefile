.PHONY: test
test:
	@echo "test"

# Makefile for deploying Flutter web app to GitHub Pages

BASE_HREF = '/'
GITHUB_REPO = https://github.com/badrafyf77/pmf-deploy.git
BUILD_VERSION := $(shell grep 'version:' pubspec.yaml | awk '{print $$2}')
CUSTOM_DOMAIN = website.pesmoroccanfamily.com

deploy-web:
	# @echo "Clean existing repository..."
	# flutter clean

	# @echo "Getting packages..."
	# flutter pub get

	# @echo "Building for web..."
	# flutter build web --base-href $(BASE_HREF) --release

	# @echo "Creating CNAME file..."
	# echo "$(CUSTOM_DOMAIN)" > build/web/CNAME

	@echo "Deploying to git repository"
	cd build/web
	git init
	git add .
	git commit -m "Deploy Version $(BUILD_VERSION)"
	git branch -M main
	git remote add origin $(GITHUB_REPO)
	git push --set-upstream --force origin master

	cd ../..
	@echo "🟢 Finished Deploy"

.PHONY: deploy-web