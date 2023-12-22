import 'package:ex02/pages/components/my_button.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final appBarTextStyle = theme.textTheme.headlineSmall!
        .copyWith(color: theme.colorScheme.onPrimary);
    final questionTextStyle = theme.textTheme.titleLarge!
        .copyWith(color: theme.colorScheme.secondary);
    final answerTextStyle = theme.textTheme.headlineLarge!;

    final List<String> buttons = [
      '7',
      '8',
      '9',
      'C',
      'AC',
      '4',
      '5',
      '6',
      '+',
      '-',
      '1',
      '2',
      '3',
      'x',
      '/',
      '0',
      '.',
      '00',
      '='
    ];

    bool checkIsOperator(String op) {
      if (op == '+' || op == 'x' || op == '-' || op == '/' || op == '=') {
        return true;
      }
      return false;
    }

    return Scaffold(
        backgroundColor: theme.colorScheme.secondaryContainer,
        appBar: AppBar(
            title: Text(
              'Calculator',
              style: appBarTextStyle,
            ),
            backgroundColor: theme.colorScheme.primary),
        body: Column(
          children: [
            Expanded(
              child: Column(
                children: [
                  Container(
                      padding: const EdgeInsets.all(20),
                      alignment: Alignment.topRight,
                      child: Text(
                        '0',
                        style: questionTextStyle,
                      )),
                  Container(
                      padding: const EdgeInsets.all(20),
                      alignment: Alignment.topRight,
                      child: Text(
                        '0',
                        style: answerTextStyle,
                      ))
                ],
              ),
            ),
            Expanded(
              // color: theme.colorScheme.primary,
              child: Center(
                child: GridView.builder(
                    itemCount: buttons.length,
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 5),
                    itemBuilder: (BuildContext context, index) {
                      if (index == 3) {
                        return MyButton(
                          buttonText: buttons[index],
                          color: theme.colorScheme.tertiary,
                          textColor: theme.colorScheme.onTertiary,
                        );
                      } else if (index == 4) {
                        return MyButton(
                          buttonText: buttons[index],
                          color: theme.colorScheme.error,
                          textColor: theme.colorScheme.onPrimary,
                        );
                      } else if (index == buttons.length - 1) {
                        return MyButton(
                          buttonText: buttons[index],
                          color: Colors.green,
                          textColor: theme.colorScheme.onPrimary,
                        );
                      } else {
                        var isOperator = checkIsOperator(buttons[index]);
                        return MyButton(
                          buttonText: buttons[index],
                          color: isOperator
                              ? theme.colorScheme.primary
                              : theme.colorScheme.background,
                          textColor: isOperator
                              ? theme.colorScheme.onPrimary
                              : theme.colorScheme.onSecondaryContainer,
                        );
                      }
                    }),
              ),
            ),
          ],
        ));
  }
}
