class GkQuestion {
  final int id;
  final String text;
  final List<GkOption> options;
  bool isLocked;
  GkOption? selectedWiidgetOption;
  GkOption? correctAnswer;

  GkQuestion({
    required this.text,
    required this.options,
    this.isLocked = false,
    this.selectedWiidgetOption,
    required this.id,
    required this.correctAnswer,
  });

  GkQuestion copyWith() {
    return GkQuestion(
      id: id,
      text: text,
      options: options
          .map((option) =>
              GkOption(text: option.text, isCorrect: option.isCorrect))
          .toList(),
      isLocked: isLocked,
      selectedWiidgetOption: selectedWiidgetOption,
      correctAnswer: correctAnswer,
    );
  }
}

class GkOption {
  final String text;
  final bool isCorrect;

  const GkOption ({
    required this.text,
    required this.isCorrect,
  });
}

final navigateQuestionsList = [
 GkQuestion(
    text:
        "I am a widget that manages a stack of child widgets and allows for navigating between them. What am I?",
    options: [
      const GkOption(text: "Route", isCorrect: false),
      const GkOption(text: "Scaffold", isCorrect: false),
      const GkOption(text: "Navigator", isCorrect: true),
      const GkOption(text: "PageView", isCorrect: false),
    ],
    id: 0,
    correctAnswer: const GkOption(text: "Navigator", isCorrect: true),
  ),
  GkQuestion(
    text:
        " I am a method that removes the current route from the stack and returns to the previous route. What am I?",
    options: [
      const GkOption(text: "Navigator.push()", isCorrect: false),
      const GkOption(text: "Navigator.pop()", isCorrect: true),
      const GkOption(
          text: "Navigator.removeRoute()", isCorrect: false),
      const GkOption(text: " Route.dispose()", isCorrect: false),
    ],
    id: 1,
    correctAnswer:
        const GkOption(text: "Navigator.pop()", isCorrect: true),
  ),
  GkQuestion(
    text:
        "I am a widget property that must be passed to navigation methods like Navigator.push() to specify the next screen. What am I?",
    options: [
      const GkOption(text: "context", isCorrect: true),
      const GkOption(text: "Scaffold", isCorrect: false),
      const GkOption(text: "State", isCorrect: false),
      const GkOption(text: "Build", isCorrect: false),
    ],
    id: 2,
    correctAnswer: const GkOption(text: "context", isCorrect: true),
  ),

  GkQuestion(
    text:
        " I am the method that closes all routes in the history stack to pop to the first route. What am I?",
    options: [
      const GkOption(text: "Navigator.popUntil()", isCorrect: true),
      const GkOption(text: " Navigator.reset()", isCorrect: false),
      const GkOption(text: " Navigator.exitAll()", isCorrect: false),
      const GkOption(text: "Navigator.clear()", isCorrect: false),
    ],
    id: 3,
    correctAnswer:
        const GkOption(text: "Navigator.popUntil()", isCorrect: true),
  ),
 GkQuestion(
    text:
        " I am a method that adds a named route to the top of the navigator stack. Who am I?",
    options: [
      const GkOption(text: "Navigator.navigate()", isCorrect: false),
      const GkOption(text: " Navigator.openRoute()", isCorrect: false),
      const GkOption(text: " Navigator.routeTo()", isCorrect: false),
      const GkOption(text: " Navigator.pushNamed()", isCorrect: true),
    ],
    id: 4,
    correctAnswer: const GkOption(
      text: " Navigator.pushNamed()",
      isCorrect: true,
    ),
  ),
  GkQuestion(
    text:
        " I am a method that replaces the entire route stack with a single route. Who am I?",
    options: [
      const GkOption(
          text: " Navigator.pushReplacement()", isCorrect: true),
      const GkOption(text: "Navigator.reset()", isCorrect: false),
      const GkOption(
          text: " Navigator.replaceAll()", isCorrect: false),
      const GkOption(
          text: "  Navigator.clearPush()", isCorrect: false),
    ],
    id: 5,
    correctAnswer: const GkOption(
        text: "Navigator.pushReplacement()", isCorrect: true),
  ),

  GkQuestion(
    text:
        "I am a method that closes routes until a condition is met. Who am I?",
    options: [
      const GkOption(text: "Navigator.exitUntil()", isCorrect: false),
      const GkOption(
          text: "Navigator.closeAllUntil(),", isCorrect: false),
      const GkOption(text: "Navigator.popWhile()", isCorrect: false),
      const GkOption(text: " Navigator.popUntil()", isCorrect: true),
    ],
    id: 6,
    correctAnswer:
        const GkOption(text: " Navigator.popUntil()", isCorrect: true),
  ),
];
