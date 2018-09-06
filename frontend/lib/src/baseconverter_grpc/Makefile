.PHONY: generate

generate:
	cd ../../../.. && protoc -I api api/baseconverter.proto \
			--plugin='pub run protoc_plugin:protoc_plugin.dart' \
			--dart_out=grpc:frontend/lib/src/baseconverter_grpc
