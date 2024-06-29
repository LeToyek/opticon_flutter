import 'package:freezed_annotation/freezed_annotation.dart';

part 'predict_response.freezed.dart';
part 'predict_response.g.dart';

@freezed
class PredictResponse with _$PredictResponse {
  factory PredictResponse({
    @JsonKey(name: 'input_data') List<int>? inputData,
    @JsonKey(name: 'predictions') List<double>? predicitons,
  }) = _PredictResponse;

  factory PredictResponse.fromJson(Map<String, dynamic> json) =>
      _$PredictResponseFromJson(json);
}
