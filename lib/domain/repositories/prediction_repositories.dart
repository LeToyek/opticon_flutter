import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:opticon_flutter/domain/model/heart_beat_model.dart';

class PredicitonRepository {
  final FirebaseFirestore _firestore;

  PredicitonRepository(this._firestore);
  Future<List<HeartBeatModel>> heartBeatPredict() async {
    final currentTime = DateTime.now();
    var lastTime = currentTime.add(const Duration(minutes: 10));

    List<HeartBeatModel> heartBeatsMinutes = [];

    final randomBPM = [80, 90, 85, 88, 92, 95, 100, 88, 90, 85];

    for (int i = 0; i < 10; i++) {
      lastTime = lastTime.add(const Duration(minutes: 10));
      heartBeatsMinutes.add(
        HeartBeatModel(
            bpmValue: randomBPM[i],
            createdAt: lastTime.toString(),
            isPrediction: 'true'),
      );
    }

    return Future.value(heartBeatsMinutes);
  }
}
