import 'package:opticon_flutter/domain/model/heart_beat_model.dart';
import 'package:opticon_flutter/ui/controller/heart_beat_controller/heart_beat_state.dart';
import 'package:opticon_flutter/utils/convert_string.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'heart_beat_controller.g.dart';

@riverpod
class HeartBeatController extends _$HeartBeatController {
  @override
  HeartBeatState build() {
    return InitialHeartBeatState(heartBeatsInitial: [
      const HeartBeatModel(bpmValue: 0, createdAt: '00'),
      const HeartBeatModel(bpmValue: 0, createdAt: '01'),
      const HeartBeatModel(bpmValue: 0, createdAt: '02'),
      const HeartBeatModel(bpmValue: 0, createdAt: '03'),
      const HeartBeatModel(bpmValue: 0, createdAt: '04'),
      const HeartBeatModel(bpmValue: 0, createdAt: '05'),
      const HeartBeatModel(bpmValue: 0, createdAt: '06'),
      const HeartBeatModel(bpmValue: 0, createdAt: '07'),
      const HeartBeatModel(bpmValue: 0, createdAt: '08'),
      const HeartBeatModel(bpmValue: 0, createdAt: '09'),
      const HeartBeatModel(bpmValue: 0, createdAt: '10'),
    ]);
  }

  void getHeartBeatData(String bpmValue) {
    final convertedBpmValue = int.parse(bpmValue);
    final heartBeats = state.heartBeats;
    // state = LoadingHeartBeatState(heartBeats: [...heartBeats]);
    heartBeats.removeAt(0);
    heartBeats.add(HeartBeatModel(
        bpmValue: convertedBpmValue,
        createdAt: extractSecond(DateTime.now().toString())));
    state = LoadedHeartBeatState(heartBeats: [...heartBeats]);
  }
}
