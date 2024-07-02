import 'package:freezed_annotation/freezed_annotation.dart';

part 'predict_response.freezed.dart';
part 'predict_response.g.dart';

@freezed
class PredictResponse with _$PredictResponse {
  factory PredictResponse({
    // @JsonKey(name: 'input_data') List<int>? inputData,
    @JsonKey(name: 'predictions') List<int>? predicitons,
    @JsonKey(name: 'predictions_bpm') List<int>? predicitonsBpm,
    @JsonKey(name: 'predictions_blink_duration') List<int>? predicitonsBd,
    @JsonKey(name: 'accuracy_blink_count') double? accuracyBlinkCount,
    @JsonKey(name: 'accuracy_highest_blink_duration')
    double? accuracyHighestBlinkDuration,
    @JsonKey(name: 'accuracy_bpm') double? accuracyBpm,
    @JsonKey(name: 'mse') double? mse,
    @JsonKey(name: 'mae') double? mae,
  }) = _PredictResponse;

  factory PredictResponse.fromJson(Map<String, dynamic> json) =>
      _$PredictResponseFromJson(json);
}
