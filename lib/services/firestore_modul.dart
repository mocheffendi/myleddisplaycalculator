import 'package:cloud_firestore/cloud_firestore.dart';

class FireStoreService {
  //get collection of notes
  final CollectionReference tasks =
      FirebaseFirestore.instance.collection('taskLedDisplayCalculator');

  // CREATE: add new notes
  Future<void> addTaskLedDisplayCalculator(
    String taskName,
    String taskDesc,
    String pitch,
    String column,
    String row,
    String widthmodul,
    String heightmodul,
    String widthmodulcount,
    String heightmodulcount,
    String widthpixels,
    String heightpixels,
    String totalwidthpixels,
    String totalheightpixels,
    String totalwidthmeter,
    String totalheightmeter,
    String stdratiowidth,
    String stdratioheight,
    String modulcount,
    String totalpowers,
    String averagepowers,
    String averagepowers2,
    String arus,
    String luaspenampangkabellistrik,
    String tarikankabellanbulat,
    String msd600count,
    String msd300count,
  ) {
    return tasks.add({
      'timestamp': Timestamp.now(),
      'taskName': taskName,
      'taskDesc': taskDesc,
      'pitch': pitch,
      'column': column,
      'row': row,
      'widthmodul': widthmodul,
      'heightmodul': heightmodul,
      'widthmodulcount': widthmodulcount,
      'heightmodulcount': heightmodulcount,
      'widthpixels': widthpixels,
      'heightpixels': heightpixels,
      'totalwidthpixels': totalwidthpixels,
      'totalheightpixels': totalheightpixels,
      'totalwidthmeter': totalwidthmeter,
      'totalheightmeter': totalheightmeter,
      'stdratiowidth': stdratiowidth,
      'stdratioheight': stdratioheight,
      'modulcount': modulcount,
      'totalpowers': totalpowers,
      'averagepowers': averagepowers,
      'averagepowers2': averagepowers2,
      'arus': arus,
      'luaspenampangkabellistrik': luaspenampangkabellistrik,
      'tarikankabellanbulat': tarikankabellanbulat,
      'msd600count': msd600count,
      'msd300count': msd300count,
    });
  }

  Future<List<Object?>> getFirestoreData() async {
    QuerySnapshot querySnapshot = await tasks.get();
    return querySnapshot.docs.map((doc) => doc.data()).toList();
  }

  // READ: get notes from database
  Stream<QuerySnapshot> getNotesStream() {
    final tasksStream =
        tasks.orderBy('timestamp', descending: true).snapshots();

    return tasksStream;
  }

  // Stream<List<Map<String, dynamic>>> getNotesStream() {
  //   final tasksStream =
  //       tasks.orderBy('timestamp', descending: true).snapshots();

  //   return tasksStream.map((QuerySnapshot querySnapshot) {
  //     return querySnapshot.docs.map((doc) {
  //       return (doc).data() as Map<String, dynamic>;
  //     }).toList();
  //   });
  // }

  // UPDATE: update notes given a doc id
  Future<void> updateNote(String docID, String newNote) {
    return tasks.doc(docID).update({
      'note': newNote,
      'timestamp': Timestamp.now(),
    });
  }

  // DELETE: delete notes given a doc id
  Future<void> deleteNote(String docID) {
    return tasks.doc(docID).delete();
  }

  // void addData() {
  //   notes.add({
  //     'name': 'New Item',
  //     'timestamp': FieldValue.serverTimestamp(),
  //   }).then((value) {
  //     print('Document Added with ID: ${value.id}');
  //   }).catchError((error) {
  //     print('Error adding document: $error');
  //   });
  // }

  // void updateData(String oldText, String newData) {
  //   notes.where('name', isEqualTo: oldText).get().then((querySnapshot) {
  //     if (querySnapshot.docs.isNotEmpty) {
  //       var documentId = querySnapshot.docs.first.id;
  //       notes.doc(documentId).update({
  //         'name': newData,
  //         'timestamp': FieldValue.serverTimestamp(),
  //       }).then((value) {
  //         print('Document Updated');
  //       }).catchError((error) {
  //         print('Error updating document: $error');
  //       });
  //     }
  //   });
  // }

  // void deleteData(String documentId) {
  //   notes.doc(documentId).delete().then((value) {
  //     print('Document Deleted');
  //   }).catchError((error) {
  //     print('Error deleting document: $error');
  //   });
  // }
}
