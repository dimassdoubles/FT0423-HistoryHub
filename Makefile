format:
	@echo "╠ Formatting the project..."
	@dart format .
	@echo "╠ Project has been formatted"

clean: 
	@echo "╠ Cleaning the project..."
	@flutter clean

brun:
	@echo "╠ Running the build runner on the project..."
	@dart run build_runner build --delete-conflicting-outputs
	@echo "╠ Build runner successed!"

init:
	@echo "╠ Initialize the project..."
	make clean
	@flutter pub get
	make build_runner
	@echo "╠ Initialize successed!"

release:
	make init
	@flutter pub run flutter_launcher_icons
	@flutter build appbundle

dev:
	@flutter run lib/main.dart

build_apk:
	@flutter build apk

# create new feature
feature:
	@mason make create_feature -o lib/src/features
	make build_runner

# create new page
# ex: make create_page on=home
page:
	@mason make create_page -o lib/src/features/$(on)/presentation/pages
	make build_runner

to_webp:
	@echo "╠ Converting images to webp..."
	@for file in $$(find assets/images -name '*.png'); do \
		echo "Converting $$file"; \
		cwebp $$file -o $${file%.png}.webp; \
		rm $$file; \
	done
	@echo "╠ Convert successed!"

# generate app colors based on
# mason_configs/create_app_colors.json
app_colors:
	@mason make create_app_colors -c mason_configs/create_app_colors.json --on-conflict overwrite
	

.PHONY: format clean build_runner init dev build_apk