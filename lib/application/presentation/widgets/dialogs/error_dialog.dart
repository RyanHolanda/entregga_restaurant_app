import 'package:entreggue_restaurant/application/bloc/bloc/app_bloc.dart';
import 'package:flutter/material.dart';

class ErrorDialog {
  ErrorDialog({required this.context});
  BuildContext context;
  showErrorDialog() {
    showDialog(
      barrierDismissible: true,
      context: context,
      builder: (context) => Center(
        child: Container(
          padding: const EdgeInsets.all(20),
          decoration: BoxDecoration(
              color: Colors.white, borderRadius: BorderRadius.circular(15)),
          height: 200,
          width: 200,
          child: Center(
            child: Column(
              children: [
                Text(
                  authError!,
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                      fontSize: 18,
                      color: Colors.red,
                      decoration: TextDecoration.none,
                      fontWeight: FontWeight.bold),
                ),
                const Spacer(),
                Text(
                  authErrorDescription!,
                  textAlign: TextAlign.center,
                  style: Theme.of(context).textTheme.bodyMedium,
                ),
                const Spacer(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
