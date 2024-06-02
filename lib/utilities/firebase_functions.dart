import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';

Future<bool> createUserWithEmailAndPassword(
    String emailA, String Password) async {
  FirebaseAuth _auth = FirebaseAuth.instance;

  FirebaseFirestore _firestore = FirebaseFirestore.instance;

  try {
    final credential =
        await FirebaseAuth.instance.createUserWithEmailAndPassword(
      email: emailA,
      password: Password,
    );
    User? user = credential.user;

    await _firestore.collection('users').doc(_auth.currentUser!.uid).set({
      "email": emailA,
      "status": "Unavalible",
      "uid": _auth.currentUser!.uid,
    });

    if (user != null) {
      return true;
    }
  } on FirebaseAuthException catch (e) {
    if (e.code == 'weak-password') {
      print('The password provided is too weak.');
      return false;
    } else if (e.code == 'email-already-in-use') {
      print('The account already exists for that email.');
      return false;
    }
  } catch (e) {
    print(e);
  }
  return false;
}

Future<bool> signInWithEmailAndPassword(String email, String Pass) async {
  FirebaseFirestore _firestore = FirebaseFirestore.instance;
  FirebaseAuth _auth = FirebaseAuth.instance;

  try {
    final credential = await FirebaseAuth.instance
        .signInWithEmailAndPassword(email: email, password: Pass);
    User? user = credential.user;

    _firestore
        .collection('users')
        .doc(_auth.currentUser!.uid)
        .get()
        .then((value) =>
        credential.user!.updateDisplayName(value['email']));

    if (user != null) {
      return true;
    }
  } on FirebaseAuthException catch (e) {
    if (e.code == 'user-not-found') {
      print('No user found for that email.');
      return false;
    } else if (e.code == 'wrong-password') {
      print('Wrong password provided for that user.');
      return false;
    }
  }
  return false;
}

Future<bool> logOut(BuildContext context) async {
  FirebaseAuth _auth = FirebaseAuth.instance;

  try {
    await _auth.signOut().then((value) async{
      await _auth.signOut().then((value) {
        // Navigator.push(context, MaterialPageRoute(builder: (_) => ()));
      });
    });
  } catch (e) {
    print("error");
  }
  return false;
}
