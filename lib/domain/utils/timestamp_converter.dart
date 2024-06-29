import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:json_annotation/json_annotation.dart';

class TimestampConverter implements JsonConverter<Timestamp, Object> {
  const TimestampConverter();

  @override
  Timestamp fromJson(Object json) {
    if (json is Map<String, dynamic>) {
      return Timestamp(
        json['seconds'] as int,
        json['nanoseconds'] as int,
      );
    } else if (json is Timestamp) {
      return json;
    }
    throw Exception('Invalid timestamp data');
  }

  @override
  Object toJson(Timestamp object) {
    return {
      'seconds': object.seconds,
      'nanoseconds': object.nanoseconds,
    };
  }
}
