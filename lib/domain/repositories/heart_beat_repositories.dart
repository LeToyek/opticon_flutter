import 'package:opticon_flutter/datasources/iot_api_client.dart';
import 'package:opticon_flutter/domain/model/heart_beat_model.dart';

class HeartBeatRepository {
  final IotApiClient _iotApiClient;

  HeartBeatRepository(this._iotApiClient);

  Future<List<HeartBeatModel>> getHearBeats(json) async {
    return [HeartBeatModel.fromJson(json)];
  }
}
