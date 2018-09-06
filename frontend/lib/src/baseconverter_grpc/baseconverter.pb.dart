///
//  Generated code. Do not modify.
///
// ignore_for_file: non_constant_identifier_names,library_prefixes

// ignore: UNUSED_SHOWN_NAME
import 'dart:core' show int, bool, double, String, List, override;

import 'package:protobuf/protobuf.dart' as $pb;

class BaseConverterRequest extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = new $pb.BuilderInfo('BaseConverterRequest')
    ..aOS(1, 'number')
    ..aOS(2, 'inBase')
    ..aOS(3, 'toBase')
    ..hasRequiredFields = false
  ;

  BaseConverterRequest() : super();
  BaseConverterRequest.fromBuffer(List<int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) : super.fromBuffer(i, r);
  BaseConverterRequest.fromJson(String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) : super.fromJson(i, r);
  BaseConverterRequest clone() => new BaseConverterRequest()..mergeFromMessage(this);
  $pb.BuilderInfo get info_ => _i;
  static BaseConverterRequest create() => new BaseConverterRequest();
  static $pb.PbList<BaseConverterRequest> createRepeated() => new $pb.PbList<BaseConverterRequest>();
  static BaseConverterRequest getDefault() {
    if (_defaultInstance == null) _defaultInstance = new _ReadonlyBaseConverterRequest();
    return _defaultInstance;
  }
  static BaseConverterRequest _defaultInstance;
  static void $checkItem(BaseConverterRequest v) {
    if (v is! BaseConverterRequest) $pb.checkItemFailed(v, 'BaseConverterRequest');
  }

  String get number => $_getS(0, '');
  set number(String v) { $_setString(0, v); }
  bool hasNumber() => $_has(0);
  void clearNumber() => clearField(1);

  String get inBase => $_getS(1, '');
  set inBase(String v) { $_setString(1, v); }
  bool hasInBase() => $_has(1);
  void clearInBase() => clearField(2);

  String get toBase => $_getS(2, '');
  set toBase(String v) { $_setString(2, v); }
  bool hasToBase() => $_has(2);
  void clearToBase() => clearField(3);
}

class _ReadonlyBaseConverterRequest extends BaseConverterRequest with $pb.ReadonlyMessageMixin {}

class BaseConverterReply extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = new $pb.BuilderInfo('BaseConverterReply')
    ..aOS(1, 'result')
    ..aOS(2, 'errorInBase')
    ..aOS(3, 'errorToBase')
    ..hasRequiredFields = false
  ;

  BaseConverterReply() : super();
  BaseConverterReply.fromBuffer(List<int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) : super.fromBuffer(i, r);
  BaseConverterReply.fromJson(String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) : super.fromJson(i, r);
  BaseConverterReply clone() => new BaseConverterReply()..mergeFromMessage(this);
  $pb.BuilderInfo get info_ => _i;
  static BaseConverterReply create() => new BaseConverterReply();
  static $pb.PbList<BaseConverterReply> createRepeated() => new $pb.PbList<BaseConverterReply>();
  static BaseConverterReply getDefault() {
    if (_defaultInstance == null) _defaultInstance = new _ReadonlyBaseConverterReply();
    return _defaultInstance;
  }
  static BaseConverterReply _defaultInstance;
  static void $checkItem(BaseConverterReply v) {
    if (v is! BaseConverterReply) $pb.checkItemFailed(v, 'BaseConverterReply');
  }

  String get result => $_getS(0, '');
  set result(String v) { $_setString(0, v); }
  bool hasResult() => $_has(0);
  void clearResult() => clearField(1);

  String get errorInBase => $_getS(1, '');
  set errorInBase(String v) { $_setString(1, v); }
  bool hasErrorInBase() => $_has(1);
  void clearErrorInBase() => clearField(2);

  String get errorToBase => $_getS(2, '');
  set errorToBase(String v) { $_setString(2, v); }
  bool hasErrorToBase() => $_has(2);
  void clearErrorToBase() => clearField(3);
}

class _ReadonlyBaseConverterReply extends BaseConverterReply with $pb.ReadonlyMessageMixin {}

