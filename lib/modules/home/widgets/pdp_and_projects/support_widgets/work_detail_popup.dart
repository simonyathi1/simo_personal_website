import 'package:flutter/material.dart';

class WorkDetailPopup {
  static void showWorkDetailPopup(BuildContext context, String title, String detail) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return Center(
          child: Container(
            width: MediaQuery.of(context).size.width * 0.5,
            constraints: BoxConstraints(
              maxHeight: MediaQuery.of(context).size.height * 0.8,
            ),
            child: Material(
              borderRadius: BorderRadius.circular(10),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Text(
                      title,
                         style: const TextStyle(fontSize: 23, fontWeight: FontWeight.w600, fontFamily: 'Montserrat'),
                    ),
                  ),
                  Expanded(
                    child: SingleChildScrollView(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 16.0),
                        child: Text(
                          detail,
                          style: const TextStyle(fontSize: 14, fontWeight: FontWeight.w500, fontFamily: 'Montserrat'),
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: ElevatedButton(
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                      child: Text('Dismiss', style: const TextStyle(fontSize: 14, fontWeight: FontWeight.w600, fontFamily: 'Montserrat'),),
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}