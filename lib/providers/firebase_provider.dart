import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

// Provider for the Firebase Auth instance.
final Provider<FirebaseAuth> firebaseProvider =
    Provider<FirebaseAuth>((ProviderRef<FirebaseAuth> ref) {
  return FirebaseAuth.instance;
});
