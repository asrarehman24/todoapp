import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class FirebaseService {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  // Get current user
  User? get currentUser => _auth.currentUser;

  // Stream of auth state changes
  Stream<User?> get authStateChanges => _auth.authStateChanges();

  // Sign up with email and password
  Future<UserCredential> signUp(String email, String password) async {
    try {
      return await _auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
    } catch (e) {
      throw Exception('Sign up failed: $e');
    }
  }

  // Sign in with email and password
  Future<UserCredential> signIn(String email, String password) async {
    try {
      return await _auth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
    } catch (e) {
      throw Exception('Sign in failed: $e');
    }
  }

  // Sign out
  Future<void> signOut() async {
    try {
      await _auth.signOut();
    } catch (e) {
      throw Exception('Sign out failed: $e');
    }
  }

  // Save user profile to Firestore
  Future<void> saveUserProfile(String uid, String name, String email) async {
    try {
      await _firestore.collection('users').doc(uid).set({
        'name': name,
        'email': email,
        'createdAt': FieldValue.serverTimestamp(),
        'updatedAt': FieldValue.serverTimestamp(),
      }, SetOptions(merge: true)); // Merge with existing data
      print('Profile saved for user: $uid'); // Debug log
    } catch (e) {
      print('Error saving profile: $e'); // Debug log
      throw Exception('Failed to save user profile: $e');
    }
  }

  // Get user profile from Firestore
  Future<Map<String, dynamic>?> getUserProfile(String uid) async {
    try {
      DocumentSnapshot doc = await _firestore
          .collection('users')
          .doc(uid)
          .get();
      if (doc.exists) {
        return doc.data() as Map<String, dynamic>;
      }
      return null;
    } catch (e) {
      if (e.toString().contains('permission-denied')) {
        throw Exception(
          'Access denied. Please check Firestore security rules.',
        );
      } else if (e.toString().contains('unavailable')) {
        throw Exception('Firestore service is temporarily unavailable.');
      } else {
        throw Exception('Failed to get user profile: $e');
      }
    }
  }

  // Create or update user profile
  Future<void> createOrUpdateProfile(
    String uid,
    Map<String, dynamic> profileData,
  ) async {
    try {
      await _firestore.collection('users').doc(uid).set({
        ...profileData,
        'updatedAt': FieldValue.serverTimestamp(),
      }, SetOptions(merge: true));
      print('Profile created/updated for user: $uid'); // Debug log
    } catch (e) {
      print('Error creating/updating profile: $e'); // Debug log
      throw Exception('Failed to create/update user profile: $e');
    }
  }
}
