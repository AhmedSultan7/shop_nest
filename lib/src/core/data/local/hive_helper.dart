import 'package:cards_app/src/core/utils/logger.dart';
import 'package:hive/hive.dart';

class HiveHelper {
  // Box openBox({required String boxName}) {
  //   final hive = Hive.openBox(boxName);
  //   return hive;
  // }

  Future<Box> openBox({required String boxName}) async =>
      await Hive.openBox(boxName);

  Future<void> setData(String boxName, {required dynamic data}) async {
    if (Hive.isBoxOpen(boxName)) {
      await Hive.box(boxName).add(data);
    } else {
      await openBox(boxName: boxName).then((box) => box.add(data));
      Log.w(' get ===================$boxName');
    }
  }

  Future<void> putData(String boxName,
      {required dynamic key, required dynamic data}) async {
    if (Hive.isBoxOpen(boxName)) {
      await Hive.box(boxName).put(key, data);
    } else {
      await openBox(boxName: boxName).then((box) => box.put(key, data));
      Log.w('Put===================$boxName');
    }
  }

  Future<Map<dynamic, dynamic>> getData({required String boxName}) async {
    Map<dynamic, dynamic> data = {};

    if (Hive.isBoxOpen(boxName)) {
      data = Hive.box(boxName).toMap();

      Log.f(' Get =============== ${data}');
    } else {
      final box = await openBox(boxName: boxName);

      data = box.toMap();
      Log.f(' Get =============== ${data}');
    }
    return data;
  }

  Future<void> delete(String boxName, {required int index}) async {
    if (Hive.isBoxOpen(boxName)) {
      await Hive.box(boxName).deleteAt(index);
    } else {
      await Hive.openBox(boxName).then((box) => box.deleteAt(index));
    }
  }

  Future<void> clearAllData() async {
    await Hive.deleteFromDisk();
  }

  Future<void> clear(String boxName) async {
    await Hive.box(boxName).clear();
  }
}
