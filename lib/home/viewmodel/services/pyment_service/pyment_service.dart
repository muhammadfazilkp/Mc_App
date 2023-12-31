import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:razorpay_flutter/razorpay_flutter.dart';

class RozzerPayResponse {
 
  Razorpay razorpay = Razorpay();

  void handlePaymentSuccess(PaymentSuccessResponse response) {
    Fluttertoast.showToast(
      msg: 'Success Payment: ${response.paymentId}',
      backgroundColor: Colors.green,
      timeInSecForIosWeb: 4,
    );

   
  }

  void _handlePaymentError(PaymentFailureResponse response) {
    Fluttertoast.showToast(
      msg: 'Error ${response.code}- ${response.message}',
      timeInSecForIosWeb: 4,
    );
  }

  void _handleExternalWallet(ExternalWalletResponse response) {
    Fluttertoast.showToast(
      msg: 'Wallet ${response.walletName}',
      timeInSecForIosWeb: 4,
    );
  }

  makePayment() async {
    var options = {
      'key': 'rzp_test_Djkb2wONIbXz3v',
      'amount': 50000,
      'name': 'Mc MillanThec',
      'description': 'Users',
      'prefill': {
        'contact': '+919074957353',
        'email': 'contact@protocoderpoint.cpm',
      },
    };

    try {
      razorpay.open(options);
      razorpay.on(Razorpay.EVENT_PAYMENT_SUCCESS, handlePaymentSuccess);
      razorpay.on(Razorpay.EVENT_PAYMENT_ERROR, _handlePaymentError);

      razorpay.on(Razorpay.EVENT_EXTERNAL_WALLET, _handleExternalWallet);
    } catch (e) {
      debugPrint(e.toString());
    }
  }
}