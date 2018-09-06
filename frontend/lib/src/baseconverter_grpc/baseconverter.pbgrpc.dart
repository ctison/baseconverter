///
//  Generated code. Do not modify.
///
// ignore_for_file: non_constant_identifier_names,library_prefixes

import 'dart:async';

import 'package:grpc/grpc.dart';

import 'baseconverter.pb.dart';
export 'baseconverter.pb.dart';

class BaseConverterServiceClient extends Client {
  static final _$convert =
      new ClientMethod<BaseConverterRequest, BaseConverterReply>(
          '/baseconverter_grpc.BaseConverterService/Convert',
          (BaseConverterRequest value) => value.writeToBuffer(),
          (List<int> value) => new BaseConverterReply.fromBuffer(value));

  BaseConverterServiceClient(ClientChannel channel, {CallOptions options})
      : super(channel, options: options);

  ResponseFuture<BaseConverterReply> convert(BaseConverterRequest request,
      {CallOptions options}) {
    final call = $createCall(_$convert, new Stream.fromIterable([request]),
        options: options);
    return new ResponseFuture(call);
  }
}

abstract class BaseConverterServiceBase extends Service {
  String get $name => 'baseconverter_grpc.BaseConverterService';

  BaseConverterServiceBase() {
    $addMethod(new ServiceMethod<BaseConverterRequest, BaseConverterReply>(
        'Convert',
        convert_Pre,
        false,
        false,
        (List<int> value) => new BaseConverterRequest.fromBuffer(value),
        (BaseConverterReply value) => value.writeToBuffer()));
  }

  Future<BaseConverterReply> convert_Pre(
      ServiceCall call, Future request) async {
    return convert(call, await request);
  }

  Future<BaseConverterReply> convert(
      ServiceCall call, BaseConverterRequest request);
}
