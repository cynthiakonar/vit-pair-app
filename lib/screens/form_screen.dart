import 'package:flutter/material.dart';
import 'package:vitpair/widgets/text_input_field.dart';
import 'package:vitpair/utils/colors.dart';

class InterestForm extends StatefulWidget {
  const InterestForm({super.key});

  @override
  State<InterestForm> createState() => _InterestFormState();
}

class _InterestFormState extends State<InterestForm> {
  bool selected = false;

  List<String> text = [];
  TextEditingController _controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(),
        body: Padding(
          padding: EdgeInsets.all(10),
          child: Container(
            decoration: BoxDecoration(color: Colors.white12),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                TextInputField(
                  icon: Icons.interests_outlined,
                  labelText: "Areas of Interest",
                  controller: _controller,
                ),
                TextButton(
                  onPressed: () {
                    setState(() {
                      if (_controller.text.length > 0) {
                        text.add(_controller.text);
                        _controller.clear();
                      } else {
                        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                          content: Text("Text is empty"),
                        ));
                      }
                    });
                  },
                  child: Text("add"),
                ),
                Wrap(
                  children: text.map((tag) {
                    return Container(
                      margin: const EdgeInsets.only(right: 8, top: 10),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5),
                          color: backgroundpurple),
                      child: Text(
                        tag,
                        style: TextStyle(
                          fontSize: 16,
                          color: Colors.grey[600],
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    );
                  }).toList(),
                ),
              ],
            ),
          ),
        ));
  }
}
