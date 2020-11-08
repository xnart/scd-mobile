import 'package:flutter/material.dart';
import 'package:get/get.dart';

class GreetingPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 35),
      height: double.infinity,
      child: Wrap(
        runSpacing: 25,
        children: [
          greeting(),
          Divider(color: Colors.white),
          Center(
            child: Text(
              "I just had...",
              textScaleFactor: 1.5,
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
          ),
          buttonCard(Icons.wc, "bowel movement", color: Colors.deepOrange),
          buttonCard(Icons.set_meal, "meal", color: Colors.blue, onTap: () => Get.toNamed("/addMeal")),
          buttonCard(Icons.error_outline, "symptom", color: Colors.red)
        ],
      ),
    );
  }

  Widget greeting() {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Hi!",
          style: TextStyle(fontWeight: FontWeight.w600, fontSize: 25),
        ),
        SizedBox(height: 5),
        Text(
          "How are you?",
          style: TextStyle(fontWeight: FontWeight.w400, fontSize: 23),
        ),
      ],
    );
  }

  Widget buttonCard(IconData icon, String text, {Color color: Colors.black, onTap}) {
    return Container(
      width: double.infinity,
      height: 100,
      child: Card(
        elevation: 10,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        child: InkWell(
          borderRadius: BorderRadius.circular(10),
          onTap: onTap,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Center(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Expanded(child: Icon(icon, size: 30, color: color)),
                  Expanded(
                    flex: 3,
                    child: Text(text, textScaleFactor: 1.5, style: TextStyle(color: color)),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
