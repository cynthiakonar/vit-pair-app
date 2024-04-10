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
        appBar: AppBar(
          title: const Text(
            textAlign: TextAlign.left,
            "VIT Pair",
            style: TextStyle(
                color: Colors.black, fontWeight: FontWeight.bold, fontSize: 27),
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.all(10),
          child: Column(
            children: [
              const Text(
                "What are your Areas of Interest?",
                style: TextStyle(fontWeight: FontWeight.w700, fontSize: 20),
              ),
              const SizedBox(
                height: 10,
              ),
              const Text(
                "For example: Web Development, travel, gym",
                style: TextStyle(fontWeight: FontWeight.w400),
              ),
              const SizedBox(
                height: 10,
              ),
              Container(
                decoration: BoxDecoration(color: Colors.white12),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[
                    TextInputField(
                      icon: Icons.interests_outlined,
                      labelText: "Areas of Interest",
                      controller: _controller,
                    ),
                    IconButton(
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
                      icon: Icon(Icons.add),
                    ),
                    Wrap(
                      children: text.map((tag) {
                        return Container(
                          margin: const EdgeInsets.only(right: 8, top: 10),
                          padding:
                              EdgeInsets.symmetric(vertical: 4, horizontal: 6),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(5),
                              color: backgroundpurple),
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Text(
                                tag,
                                style: TextStyle(
                                  fontSize: 16,
                                  color: Colors.grey[600],
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              SizedBox(width: 5),
                              GestureDetector(
                                onTap: () {
                                  setState(() {
                                    text.remove(tag);
                                  });
                                },
                                child: const Icon(Icons.close),
                              ),
                            ],
                          ),
                        );
                      }).toList(),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ));
  }
}
