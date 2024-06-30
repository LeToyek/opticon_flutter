import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'predict_model.freezed.dart';
part 'predict_model.g.dart';

@freezed
class PredictModel with _$PredictModel {
  factory PredictModel({
    @JsonKey(name: 'input_data') required List<int> inputData,
    @JsonKey(name: 'predictions') required List<double> predictions,
  }) = _PredictModel;

  factory PredictModel.fromJson(Map<String, dynamic> json) =>
      _$PredictModelFromJson(json);
}

class PredictFinalModel {
  final int predictValue;
  final Timestamp predictTime;

  PredictFinalModel({required this.predictValue, required this.predictTime});
}
