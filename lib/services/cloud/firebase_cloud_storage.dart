import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:mynotes/services/cloud/cloud_storage_constant.dart';
import 'package:mynotes/services/cloud/cloud_storage_exceptions.dart';
import 'package:mynotes/services/cloud/clould_note.dart';

class FirebaseCloudStorage {
  // Properties

  final notes = FirebaseFirestore.instance.collection('notes');

  // Singleton

  static final FirebaseCloudStorage _shared =
      FirebaseCloudStorage._sharedInstance();

  factory FirebaseCloudStorage() => _shared;

  FirebaseCloudStorage._sharedInstance();

  // Functions

  Future<void> deleteNote({required String documentId}) async {
    try {
      notes.doc(documentId).delete();
    } catch (e) {
      throw CouldNotDeleteNoteException();
    }
  }

  Future<void> updateNote({
    required String documentId,
    required String text,
  }) async {
    try {
      await notes.doc(documentId).update({textFieldName: text});
    } catch (e) {
      throw CouldNotUpdateNoteException();
    }
  }

  Stream<Iterable<CloudNote>> allNotes({required String ownerUserId}) =>
      notes.snapshots().map(
            (event) => event.docs.map(CloudNote.fromSnapshot).where(
                  (note) => note.ownerUserId == ownerUserId,
                ),
          );

  Future<Iterable<CloudNote>> getNotes({required String ownerUserId}) async {
    try {
      return await notes
          .where(
            ownerUserIdFieldName,
            isEqualTo: ownerUserId,
          )
          .get()
          .then(
            (value) => value.docs.map(
              (doc) {
                return CloudNote(
                  documentId: doc.id,
                  ownerUserId: doc.data()[ownerUserIdFieldName] as String,
                  text: doc.data()[textFieldName] as String,
                );
              },
            ),
          );
    } catch (e) {
      throw CouldNotGetAllNotesException();
    }
  }

  Future<void> createNewNote({required String ownerUserId}) async {
    await notes.add({
      ownerUserIdFieldName: ownerUserId,
      textFieldName: '',
    });
  }
}