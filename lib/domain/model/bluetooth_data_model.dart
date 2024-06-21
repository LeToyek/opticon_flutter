import 'dart:typed_data';

class BluetoothDataModel {
  // make a model that can recieved a data from the bluetooth as a hex string

  const BluetoothDataModel({
    String? battery,
    String? blinkDuration,
    String? blinkCount,
    String? ppgValue,
  });
  factory BluetoothDataModel.fromHexData(Uint8List data) {
    String hexData = String.fromCharCodes(data);
    List<String> dataList =
        hexData.split('\n').where((element) => element.isNotEmpty).toList();

    List<String> receivedData = [];
    if (dataList.length >= 4) {
      receivedData =
          dataList.map((e) => int.parse(e, radix: 16).toString()).toList();

      return BluetoothDataModel(
        battery: receivedData[0],
        blinkDuration: receivedData[1],
        blinkCount: receivedData[2],
        ppgValue: receivedData[3],
      );
    }
    return const BluetoothDataModel();
  }
}
