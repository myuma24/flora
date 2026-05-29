.PHONY: build-web dev

build-web:
	flutter build web --wasm --base-href "/flora/"

dev:
	flutter run -d chrome
