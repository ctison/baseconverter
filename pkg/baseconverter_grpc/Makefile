PROTO_FILE := ../../api/baseconverter.proto

generate:
	protoc -I $(dir $(PROTO_FILE)) $(PROTO_FILE) --go_out=plugins=grpc:.
