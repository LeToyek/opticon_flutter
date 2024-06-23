class BluetoothDataModel {
  // make a model that can recieved a data from the bluetooth as a hex string
  String? battery;
  String? blinkDuration;
  String? blinkCount;
  String? ppgValue;

  BluetoothDataModel({
    this.battery,
    this.blinkDuration,
    this.blinkCount,
    this.ppgValue,
  });

  //make copy with

  BluetoothDataModel copyWith({
    String? battery,
    String? blinkDuration,
    String? blinkCount,
    String? ppgValue,
  }) {
    return BluetoothDataModel(
      battery: battery ?? this.battery,
      blinkDuration: blinkDuration ?? this.blinkDuration,
      blinkCount: blinkCount ?? this.blinkCount,
      ppgValue: ppgValue ?? this.ppgValue,
    );
  }
}
