import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class EmailAuth extends ChangeNotifier {
  User? currentUser() {
    return FirebaseAuth.instance.currentUser;
    // 현재 유저(로그인 되지 않은 경우 null 반환)
  }

  void signUp({
    required String email, // 이메일
    required String password, // 비밀번호
    required Function onSuccess, // 가입 성공시 호출되는 함수
    required Function(String error) onError, // 에러 발생시 호출되는 함수
  }) async {
    // 회원가입
    if (email.isEmpty) {
      onError("이메일을 입력해주세요");
      return;
    } else if (password.isEmpty) {
      onError("비밀번호를 입력해주세요");
      return;
    }

    try {
      await FirebaseAuth.instance
          .createUserWithEmailAndPassword(email: email, password: password);

      onSuccess();
    } on FirebaseAuthException catch (error) {
      if (error.code == 'weak-password') {
        onError('비밀번호를 6자리 이상 입력해주세요');
      } else if (error.code == 'email-already-use') {
        onError('이미 가입된 이메일입니다');
      } else if (error.code == 'invalid-email') {
        onError('이메일 형식을 확인해주세요');
      } else if (error.code == 'user-not-found') {
        onError('일치하는 이메일이 없습니다');
      } else if (error.code == 'wrong-password') {
        onError('비밀번호가 일치하지 않습니다');
      } else {
        onError(error.message!);
      }
    } catch (error) {
      onError(error.toString());
    }

    notifyListeners();
  }

  void signIn({
    required String email, // 이메일
    required String password, // 비밀번호
    required Function onSuccess, // 로그인 성공시 호출되는 함수
    required Function(String error) onError, // 에러 발생시 호출되는 함수
  }) async {
    // 로그인
    if (email.isEmpty) {
      onError("이메일을 입력해주세요");
      return;
    } else if (password.isEmpty) {
      onError("비밀번호를 입력해주세요");
      return;
    }

    try {
      await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: email, password: password);
      onSuccess();
      notifyListeners();
    } on FirebaseAuthException catch (error) {
      if (error.code == 'invalid-email') {
        onError('이메일 형식을 확인해주세요');
      } else if (error.code == 'user-not-found') {
        onError('일치하는 이메일이 없습니다');
      } else if (error.code == 'wrong-password') {
        onError('비밀번호가 일치하지 않습니다');
      } else {
        onError(error.message!);
      }
    } catch (error) {
      onError(error.toString());
    }
  }

  void signOut() async {
    // 로그아웃
    await FirebaseAuth.instance.signOut();
    notifyListeners();
  }
}
