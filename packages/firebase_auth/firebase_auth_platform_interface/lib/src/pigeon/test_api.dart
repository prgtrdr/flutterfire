// Autogenerated from Pigeon (v3.2.0), do not edit directly.
// See also: https://pub.dev/packages/pigeon
// ignore_for_file: public_member_api_docs, non_constant_identifier_names, avoid_as, unused_import, unnecessary_parenthesis
// ignore_for_file: avoid_relative_lib_imports
// @dart = 2.12
import 'dart:async';
import 'dart:typed_data' show Uint8List, Int32List, Int64List, Float64List;
import 'package:flutter/foundation.dart' show WriteBuffer, ReadBuffer;
import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';

import 'messages.pigeon.dart';

class _TestMultiFactorUserHostApiCodec extends StandardMessageCodec {
  const _TestMultiFactorUserHostApiCodec();
  @override
  void writeValue(WriteBuffer buffer, Object? value) {
    if (value is PigeonMultiFactorAssertion) {
      buffer.putUint8(128);
      writeValue(buffer, value.encode());
    } else 
    if (value is PigeonMultiFactorSession) {
      buffer.putUint8(129);
      writeValue(buffer, value.encode());
    } else 
{
      super.writeValue(buffer, value);
    }
  }
  @override
  Object? readValueOfType(int type, ReadBuffer buffer) {
    switch (type) {
      case 128:       
        return PigeonMultiFactorAssertion.decode(readValue(buffer)!);
      
      case 129:       
        return PigeonMultiFactorSession.decode(readValue(buffer)!);
      
      default:      
        return super.readValueOfType(type, buffer);
      
    }
  }
}
abstract class TestMultiFactorUserHostApi {
  static const MessageCodec<Object?> codec = _TestMultiFactorUserHostApiCodec();

  void enroll(String appName, PigeonMultiFactorAssertion assertion, String? displayName);
  Future<PigeonMultiFactorSession> getSession(String appName);
  static void setup(TestMultiFactorUserHostApi? api, {BinaryMessenger? binaryMessenger}) {
    {
      final BasicMessageChannel<Object?> channel = BasicMessageChannel<Object?>(
          'dev.flutter.pigeon.MultiFactorUserHostApi.enroll', codec, binaryMessenger: binaryMessenger);
      if (api == null) {
        channel.setMockMessageHandler(null);
      } else {
        channel.setMockMessageHandler((Object? message) async {
          assert(message != null, 'Argument for dev.flutter.pigeon.MultiFactorUserHostApi.enroll was null.');
          final List<Object?> args = (message as List<Object?>?)!;
          final String? arg_appName = (args[0] as String?);
          assert(arg_appName != null, 'Argument for dev.flutter.pigeon.MultiFactorUserHostApi.enroll was null, expected non-null String.');
          final PigeonMultiFactorAssertion? arg_assertion = (args[1] as PigeonMultiFactorAssertion?);
          assert(arg_assertion != null, 'Argument for dev.flutter.pigeon.MultiFactorUserHostApi.enroll was null, expected non-null PigeonMultiFactorAssertion.');
          final String? arg_displayName = (args[2] as String?);
          api.enroll(arg_appName!, arg_assertion!, arg_displayName);
          return <Object?, Object?>{};
        });
      }
    }
    {
      final BasicMessageChannel<Object?> channel = BasicMessageChannel<Object?>(
          'dev.flutter.pigeon.MultiFactorUserHostApi.getSession', codec, binaryMessenger: binaryMessenger);
      if (api == null) {
        channel.setMockMessageHandler(null);
      } else {
        channel.setMockMessageHandler((Object? message) async {
          assert(message != null, 'Argument for dev.flutter.pigeon.MultiFactorUserHostApi.getSession was null.');
          final List<Object?> args = (message as List<Object?>?)!;
          final String? arg_appName = (args[0] as String?);
          assert(arg_appName != null, 'Argument for dev.flutter.pigeon.MultiFactorUserHostApi.getSession was null, expected non-null String.');
          final PigeonMultiFactorSession output = await api.getSession(arg_appName!);
          return <Object?, Object?>{'result': output};
        });
      }
    }
  }
}
