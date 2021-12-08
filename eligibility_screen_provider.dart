import 'package:flutter/cupertino.dart';

class EligibilityProvider extends ChangeNotifier {
  String _message = 'You haven\'t any Input';
  bool _isEligable = false;
  String get message => _message;
  bool get isEligable => _isEligable;
  void checkeligibility(int age) {
    if (age >= 18) {
      // eligable
      eligable();
    } else {
      // not eligable
      notEligable();
    }
  }

  void eligable() {
    _isEligable = true;
    _message = 'Congrats!! You are Eligable for this!! :D';
    notifyListeners();
  }

  void notEligable() {
    _isEligable = false;
    _message = 'Opps!! You are not Eligable for this!! :( ';
    notifyListeners();
  }
}
