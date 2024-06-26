import 'package:flutter/material.dart';
import 'package:quiz_app/pages/result_screen.dart';

class QuizScreen extends StatefulWidget {
  final String name;
  final String topicType;
  final List<dynamic> questionlenght;

  const QuizScreen(
      {super.key,
      required this.name,
      required this.questionlenght,
      required this.topicType});

  @override
  State<QuizScreen> createState() => _QuizScreenState();
}

class _QuizScreenState extends State<QuizScreen> {
  int _questionNumber = 1;
  PageController _controller = PageController();
  int score = 0;
  bool isLocked = false;
  List optionsLetters = ["A.", "B.", "C.", "D."];

  void navigateToNewScreen() {
    if (_questionNumber < widget.questionlenght.length) {
      _controller.nextPage(
        duration: const Duration(milliseconds: 600),
        curve: Curves.easeInOut,
      );
      setState(() {
        _questionNumber++;
        isLocked = false;
      });
      _resetQuestionLocks();
    } else {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => ResultsScreen(
            score: score,
            totalQuestions: widget.questionlenght.length,
            whichTopic: widget.topicType,
          ),
        ),
      );
    }
  }

  @override
  void initState() {
    super.initState();
    _controller = PageController(initialPage: 0);
    _resetQuestionLocks();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(" Hi, ${widget.name}"),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.only(left: 10, right: 10),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                padding: const EdgeInsets.only(top: 12, left: 10, right: 10),
                width: MediaQuery.of(context).size.width * 0.90,
                height: MediaQuery.of(context).size.height * 0.75,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: Colors.white,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.24),
                      blurRadius: 20.0,
                      offset: const Offset(0.0, 10.0),
                      spreadRadius: 10,
                    )
                  ],
                ),
                child: Padding(
                  padding: const EdgeInsets.all(4.0),
                  child: Center(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Question $_questionNumber/${widget.questionlenght.length}",
                          style: TextStyle(
                              fontSize: 16, color: Colors.grey.shade500),
                        ),
                        Expanded(
                          child: PageView.builder(
                            controller: _controller,
                            physics: const NeverScrollableScrollPhysics(),
                            itemCount: widget.questionlenght.length,
                            onPageChanged: (value) {
                              setState(() {
                                _questionNumber = value + 1;
                                isLocked = false;
                                _resetQuestionLocks();
                              });
                            },
                            itemBuilder: (context, index) {
                              final myquestions = widget.questionlenght[index];

                              return Column(
                                children: [
                                  Text(
                                    myquestions.text,
                                    style: Theme.of(context)
                                        .textTheme
                                        .bodyLarge!
                                        .copyWith(
                                          fontSize: 18,
                                        ),
                                  ),
                                  const SizedBox(
                                    height: 25,
                                  ),
                                  Expanded(
                                    child: ListView.builder(
                                      itemCount: myquestions.options.length,
                                      itemBuilder: (context, index) {
                                        var color = Colors.grey.shade200;

                                        var questionOption =
                                            myquestions.options[index];
                                        final letters = optionsLetters[index];

                                        if (myquestions.isLocked) {
                                          if (questionOption ==
                                              myquestions
                                                  .selectedWiidgetOption) {
                                            color = questionOption.isCorrect
                                                ? Colors.green
                                                : Colors.red;
                                          } else if (questionOption.isCorrect) {
                                            color = Colors.green;
                                          }
                                        }
                                        return InkWell(
                                          onTap: () {
                                            if (!myquestions.isLocked) {
                                              setState(() {
                                                myquestions.isLocked = true;
                                                myquestions
                                                        .selectedWiidgetOption =
                                                    questionOption;
                                              });

                                              isLocked = myquestions.isLocked;
                                              if (myquestions
                                                  .selectedWiidgetOption
                                                  .isCorrect) {
                                                score++;
                                              }
                                            }
                                          },
                                          child: Container(
                                            height: 45,
                                            padding: const EdgeInsets.all(10),
                                            margin: const EdgeInsets.symmetric(
                                                vertical: 8),
                                            decoration: BoxDecoration(
                                              border: Border.all(color: color),
                                              color: Colors.grey.shade100,
                                              borderRadius:
                                                  const BorderRadius.all(
                                                      Radius.circular(10)),
                                            ),
                                            child: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                Text(
                                                  "$letters ${questionOption.text}",
                                                  style: const TextStyle(
                                                      fontSize: 16),
                                                ),
                                                isLocked == true
                                                    ? questionOption.isCorrect
                                                        ? const Icon(
                                                            Icons.check_circle,
                                                            color: Colors.green,
                                                          )
                                                        : const Icon(
                                                            Icons.cancel,
                                                            color: Colors.red,
                                                          )
                                                    : const SizedBox.shrink()
                                              ],
                                            ),
                                          ),
                                        );
                                      },
                                    ),
                                  ),
                                ],
                              );
                            },
                          ),
                        ),
                        isLocked
                            ? buildElevatedButton()
                            : const SizedBox.shrink(),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _resetQuestionLocks() {
    for (var question in widget.questionlenght) {
      question.isLocked = false;
    }
  }

  ElevatedButton buildElevatedButton() {
    return ElevatedButton(
      style: ButtonStyle(
        backgroundColor: WidgetStateProperty.all(Colors.amber),
        fixedSize: WidgetStateProperty.all(
          Size(MediaQuery.sizeOf(context).width * 0.80, 40),
        ),
        elevation: WidgetStateProperty.all(4),
      ),
      onPressed: () {
        if (_questionNumber < widget.questionlenght.length) {
          _controller.nextPage(
            duration: const Duration(milliseconds: 800),
            curve: Curves.easeInOut,
          );
          setState(() {
            _questionNumber++;
            isLocked = false;
          });
          _resetQuestionLocks();
        } else {
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(
              builder: (context) => ResultsScreen(
                score: score,
                totalQuestions: widget.questionlenght.length,
                whichTopic: widget.topicType,
              ),
            ),
          );
        }
      },
      child: Text(
        _questionNumber < widget.questionlenght.length
            ? 'Next Question'
            : 'Result',
        style: Theme.of(context).textTheme.bodySmall!.copyWith(
              color: Colors.white,
              fontSize: 16,
              fontWeight: FontWeight.w500,
            ),
      ),
    );
  }
}
