import 'package:opticon_flutter/domain/model/heart_beat_model.dart';
import 'package:opticon_flutter/domain/repositories/prediction_repositories.dart';

class PredicitonService {
  final PredicitonRepository _predictionRepository;

  PredicitonService(this._predictionRepository);
  Future<List<HeartBeatModel>> heartBeatPredict() async {
    // Call the model to get the prediction
    return _predictionRepository.heartBeatPredict();
  }
}
