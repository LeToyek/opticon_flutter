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
}
