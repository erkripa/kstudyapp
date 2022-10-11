import 'package:cloud_firestore/cloud_firestore.dart';

final fireStore = FirebaseFirestore.instance;
final questionPapersCollectionRF = fireStore.collection("questionPapers");

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