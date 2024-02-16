import 'package:flutter/foundation.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:remote_control/model/remote_model.dart';
import 'package:remote_control/model/saved_remote_model.dart';

class Storage {
  Future<bool> saveRemote(SavedRemoteModel remoteObj) async {
    try {
      Hive.box<SavedRemoteModel>("savedRemotes")
          .put(remoteObj.id, remoteObj);
      return true;
    } catch (e) {
      return false;
    }
  }

  Future<bool> updateRemote(SavedRemoteModel remoteObj) async {
    try {
      Hive.box<SavedRemoteModel>("savedRemotes")
          .put(remoteObj.id, remoteObj);
      return true;
    } catch (e) {
      return false;
    }
  }

  Future<bool> deleteRemove(String id) async {
    try {
      Hive.box<SavedRemoteModel>("savedRemotes").delete(id);
      return true;
    } catch (e) {
      return false;
    }
  }
}
