import 'package:hive_flutter/hive_flutter.dart';

class HiveService {
  // Make this a singleton class for easier access.
  static final HiveService _instance = HiveService._internal();

  factory HiveService() {
    return _instance;
  }

  HiveService._internal();

  // Initialize Hive and register adapters (if any).  This MUST be called before
  // using any Hive functionality.
  Future<void> init() async {
    await Hive.initFlutter();

    // Example of registering an adapter.  Replace `YourTypeAdapter()`
    // with your actual adapter.
    //
    // if (!Hive.isAdapterRegistered(YourTypeAdapter().typeId)) {
    //   Hive.registerAdapter(YourTypeAdapter());
    // }
  }

  // Open a box.  You should open boxes only once and reuse them.
  Future<Box<T>> openBox<T>(String boxName) async {
    if (Hive.isBoxOpen(boxName)) {
      // Box is already open, just return it.
      return Hive.box(boxName);
    } else {
      // Box needs to be opened.
      return await Hive.openBox<T>(boxName);
    }
  }

  // Add or update a value in a box.
  Future<void> put<T>(String boxName, dynamic key, T value) async {
    final box = await openBox<T>(boxName);
    await box.put(key, value);
    await box.close();
  }

  // Add a value in a box if the key doesn't already exist.
  Future<void> putIfAbsent<T>(String boxName, dynamic key, T value) async {
    final box = await openBox<T>(boxName);
    if (!box.containsKey(key)) {
      await box.put(key, value);
    }
    await box.close();
  }

  // Get a value from a box.
  Future<T?> get<T>(String boxName, dynamic key, {T? defaultValue}) async {
    final box = await openBox<T>(boxName);
    var data = box.get(key, defaultValue: defaultValue);
    await box.close();
    return data;
  }

  // Get all values from a box.
  Future<List<T>> getAll<T>(String boxName) async {
    final box = await openBox<T>(boxName);
    var data = box.values.toList();
    await box.close();
    return data;
  }

  // Delete a value from a box.
  Future<void> delete<T>(String boxName, dynamic key) async {
    final box = await openBox<T>(boxName);
    await box.delete(key);
    await box.close();
  }

  // Check if a box contains a key.
  Future<bool> containsKey<T>(String boxName, dynamic key) async {
    final box = await openBox<T>(boxName);
    var contains = box.containsKey(key);
    await box.close();
    return contains;
  }

  // Get the number of items in a box.
  Future<int> getLength<T>(String boxName) async {
    final box = await openBox<T>(boxName);
    var length = box.length;
    await box.close();
    return length;
  }

  // Clear all data from a box.
  Future<void> clear<T>(String boxName) async {
    final box = await openBox<T>(boxName);
    await box.clear();
    await box.close();
  }

  // Close a box.  It's generally not necessary to close boxes explicitly
  // unless you're done with them and want to free up resources.  Hive
  // handles closing boxes on app exit.
  Future<void> closeBox<T>(String boxName) async {
    if (Hive.isBoxOpen(boxName)) {
      final box = await openBox<T>(
        boxName,
      ); //ensure that we return the correct Type.
      await box.close();
    }
  }

  // Delete a box from disk.  This is different from `clear()`.  `deleteBox()`
  // removes the box entirely, while `clear()` just empties it.
  Future<void> deleteBox(String boxName) async {
    if (Hive.isBoxOpen(boxName)) {
      //ensure the box is open before trying to delete it
      await Hive.box(boxName).close();
    }
    await Hive.deleteBoxFromDisk(boxName); // Delete from disk
  }

  // Close all open boxes.
  Future<void> closeAllBoxes() async {
    await Hive.close();
  }

  // Delete all boxes from disk. Use this with caution!
  Future<void> deleteAllBoxes() async {
    //ensure all boxes are closed before trying to delete all the boxes
    await Hive.close();
    await Hive.deleteFromDisk();
  }
}
