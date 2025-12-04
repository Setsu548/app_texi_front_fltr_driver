// "status": "pending|in_comming|start_travel|end_travel",
import 'package:cloud_firestore/cloud_firestore.dart';

enum TravelStatus {
  pending('pending'),
  inComming('in_comming'),
  startTravel('start_travel'),
  endTravel('end_travel');

  const TravelStatus(this.value);
  final String value;
}

class TravelService {
  final db = FirebaseFirestore.instance;

  Future<void> changeStatus(TravelStatus newStatus,String issueId) async {
    await db.collection('drive').doc(issueId).update({
      'status': newStatus.value,
    });
  }

  Future<void> deleteTravel(String issueId) async {
    await db.collection('drive').doc(issueId).delete();
  }
}
