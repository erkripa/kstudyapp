import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';

//storage rf
Reference get firebaseStorageRef => FirebaseStorage.instance.ref();

final fireStore = FirebaseFirestore.instance;
final questionPapersCollectionRF = fireStore.collection("questionPapers");
final usersRF = fireStore.collection("users");

//method that returns questions collection RF
CollectionReference questionsCollectionReF({required String paperId}) =>
    questionPapersCollectionRF.doc(paperId).collection("questions");

//method that returns answers collection RF
CollectionReference answersCollectionReF({
  required CollectionReference questionsPaperCollectionRF,
  required String questionId,
}) =>
    questionsPaperCollectionRF.doc(questionId).collection("answers");

// DocumentReference questionRef(
//         {required String paperId, required String questionId}) =>
//     questionPaperRF.doc(paperId).collection("questions").doc(questionId);