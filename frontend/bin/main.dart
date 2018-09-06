import 'dart:async';
import 'dart:io';

import 'package:grpc/grpc.dart';

import 'package:baseconverter/src/baseconverter_grpc/baseconverter.pb.dart';
import 'package:baseconverter/src/baseconverter_grpc/baseconverter.pbgrpc.dart';

Future<Null> main(List<String> args) async {

  if (args.length != 4) {
	  print('Usage: bc address number inBase toBase');
	  exit(1);
  }

  final channel = new ClientChannel(args[0],
      port: 51966,
      options: const ChannelOptions(
          credentials: const ChannelCredentials.insecure()));
  final stub = new BaseConverterServiceClient(channel);

  final request = BaseConverterRequest()
  					..number = args[1]
  					..inBase = args[2]
  					..toBase = args[3];

  try {
    final response = await stub.convert(request);
	if (response.errorInBase != null && response.errorInBase.isNotEmpty) {
		print('Error in base: ${response.errorInBase}');
	}
	if (response.errorToBase != null && response.errorToBase.isNotEmpty) {
		print('Error to base: ${response.errorToBase}');
	}
	print('Result: ${response.result}');
  } catch (e) {
    print('Caught error: $e');
  }
  await channel.shutdown();
}
