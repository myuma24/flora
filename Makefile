.PHONY: help build-web dev

help:
	@echo "Usage: make [target]"
	@echo ""
	@echo "Available targets:"
	@echo "  build-web   Build the Flutter web application with WASM support"
	@echo "  dev         Run the Flutter application locally in Chrome"

build-web:
	flutter build web --wasm --base-href "/flora/"

dev:
	flutter run -d chrome

