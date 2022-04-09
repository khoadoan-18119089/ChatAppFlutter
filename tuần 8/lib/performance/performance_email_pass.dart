import 'package:messenger/constants/constants.dart';

class PerFormance_Email_Pass {
  static void validateEmail(String Email) {
    if (Email.isEmpty) {
      true_falseEmail = True_False.Null;
    }
    if (!regex.hasMatch(Email)) {
      true_falseEmail = True_False.False;
    } else {
      true_falseEmail = True_False.True;
    }
  }

  static void length_Pass(String Pass) {
    Pass.length >= 6 ? true_falsePass = True_False.True : True_False.False;
  }

  static String? get Err_text_Pass {
    if (passController.value.text.isEmpty) {
      return 'Password entry required';
    }
    if (passController.value.text.length>0 &&
        passController.value.text.length < 6) {
      return 'Account password can contain at least 6 characters.';
    }
    // return null if the text is valid
    return null;
  }

  static String? get Err_text_Phone {
    if (PhoneController.value.text.isEmpty) {
      return 'Phone number entry required';
    }
    if (PhoneController.value.text.isNotEmpty &&
        PhoneController.value.text.length < 9) {
      return 'Wrong phone number';
    }
    return null;
    print('d');
  }

  static String? get Err_text_Email {
    if (true_falseEmail == True_False.Null) {
      return 'Email entry required';
    }
    if (true_falseEmail == True_False.False) {
      return 'Wrong email address';
    } else {
      return null;
    }
  }
}
