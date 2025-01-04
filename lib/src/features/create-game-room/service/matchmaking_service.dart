import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:tic_tac_toe_multiplayer/src/services/local/local_storage_service.dart';

class MatchmakingService {
  final LocalStorageService storageService = LocalStorageService();
  final matchmakingcollection =
      FirebaseFirestore.instance.collection("matchMaking");
  String currentRoomId = "";

  //Create game rooom
  Future<bool> createGameRoom() async {
    try {
      String? userId = await storageService.getToken();
      DocumentReference ref = await matchmakingcollection.add({
        "createdPlayerId": userId,
        "isEmpty": false,
        "joinedPlayerId": "",
      });
      if (ref.id.isNotEmpty) {
        currentRoomId = ref.id;
        return true;
      } else {
        return false;
      }
    } catch (e) {
      throw Exception("Something went wrong, error: $e");
    }
  }

  // join existed room
  Future<bool> joinExistedRoom() async {
  try {
    var userId = await storageService.getToken();

    final querySnapshot = await matchmakingcollection.get();
    for (var doc in querySnapshot.docs) {
      final data = doc.data();
      if (data["isEmpty"] == false && data["createdPlayerId"] != userId) {
        await matchmakingcollection.doc(doc.id).update({
          'isEmpty': true,
          'joinedPlayerId': userId,
        });
        currentRoomId = doc.id;
        return true;
      }
    }
    return false;
  } catch (e) {
    throw Exception("something went wrong, error: $e");
  }
}


  // Delete Created Room
  Future<void> deleteCreatedRoom() async {
    final DocumentReference docRef = matchmakingcollection.doc(currentRoomId);
    docRef.delete();
  }

  // Create A Play Board
  Future<void> createPlayBoard(
    String roomId,
    String createdPlayerId,
    String joinedPlayerId,
  ) async {}
}
