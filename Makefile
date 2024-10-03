.PHONY: test
test:
	@echo "test"

# Makefile for deploying Flutter web app to GitHub Pages

BASE_HREF = /
GITHUB_REPO = https://github.com/badrafyf77/pmf-deploy.git
CUSTOM_DOMAIN = website.pesmoroccanfamily.com

deploy-web:
	@echo "Clean existing repository..."
	flutter clean

	@echo "Getting packages..."
	flutter pub get

	@echo "Building for web..."
	flutter build web --base-href $(BASE_HREF) --release

	@echo "Creating CNAME file..."
	echo "$(CUSTOM_DOMAIN)" > build/web/CNAME

	@echo "Deploying to git"
	cd build/web
	@echo "git 1"
	git init
	@echo "git 2"
	git add .
	@echo "git 3"
	git commit -m "commit"
	@echo "git 4"
	git remote add origin $(GITHUB_REPO)
	@echo "git 5"
	git push --set-upstream --force origin master
	@echo "git 6"

	cd ../..
	@echo "🟢 Finished Deploy"

.PHONY: deploy-web