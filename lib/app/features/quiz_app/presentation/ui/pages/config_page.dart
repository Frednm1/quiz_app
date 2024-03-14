import 'package:flutter/material.dart';

class ConfigPage extends StatefulWidget {
  const ConfigPage({super.key});

  @override
  State<ConfigPage> createState() => _ConfigPageState();
}

class _ConfigPageState extends State<ConfigPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Config'),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        reverse: true,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 30),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const SizedBox(
                height: 20,
              ),
              const Text(
                'Before we proceed, let\'s customize your quiz',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 20,
                  height: 1.2,
                  fontWeight: FontWeight.w600,
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Image.asset(
                'assets/images/technical-support.png',
                height: 275,
              ),
              const SizedBox(
                height: 20,
              ),
              Form(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text('How many questions do you want to answer?'),
                    TextFormField(
                      autocorrect: true,
                      onTapOutside: (value) {
                        FocusScope.of(context).unfocus();
                      },
                      keyboardType: TextInputType.number,
                      decoration: const InputDecoration(
                        constraints: BoxConstraints(
                          maxHeight: 50,
                        ),
                        border: OutlineInputBorder(),
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    const Text('Select the difficult you whant.'),
                    DropdownButtonFormField(
                        style: const TextStyle(
                          fontSize: 14,
                          height: 1,
                        ),
                        value: 'random',
                        decoration: const InputDecoration(
                          border: OutlineInputBorder(),
                          constraints: BoxConstraints(maxHeight: 60),
                          contentPadding: EdgeInsets.symmetric(horizontal: 20),
                        ),
                        items: const [
                          DropdownMenuItem(
                            value: 'random',
                            child: Text('Random'),
                          ),
                          DropdownMenuItem(
                            value: 'easy',
                            child: Text('Easy'),
                          ),
                          DropdownMenuItem(
                            value: 'medium',
                            child: Text('Medium'),
                          ),
                          DropdownMenuItem(
                            value: 'hard',
                            child: Text('Hard'),
                          ),
                        ],
                        onChanged: (value) {}),
                    const SizedBox(
                      height: 20,
                    ),
                    const Text('Select the category.'),
                    DropdownButtonFormField(
                        style: const TextStyle(
                          fontSize: 14,
                          height: 1,
                        ),
                        value: null,
                        decoration: const InputDecoration(
                          border: OutlineInputBorder(),
                          constraints: BoxConstraints(maxHeight: 60),
                          contentPadding: EdgeInsets.symmetric(horizontal: 20),
                        ),
                        items: const [
                          DropdownMenuItem(
                            value: null,
                            child: Text('Any category'),
                          ),
                          DropdownMenuItem(
                            value: 9,
                            child: Text('General Knowledge'),
                          ),
                          DropdownMenuItem(
                            value: 10,
                            child: Text('Entertainment Books'),
                          ),
                          DropdownMenuItem(
                            value: 11,
                            child: Text('Entertainment Film'),
                          ),
                          DropdownMenuItem(
                            value: 12,
                            child: Text('Entertainment Music'),
                          ),
                          DropdownMenuItem(
                            value: 13,
                            child: Text('Entertainment Musicals and Theatres'),
                          ),
                          DropdownMenuItem(
                            value: 14,
                            child: Text('Entertainment Television'),
                          ),
                          DropdownMenuItem(
                            value: 15,
                            child: Text('Entertainment Video Games'),
                          ),
                          DropdownMenuItem(
                            value: 16,
                            child: Text('Entertainment Board Games'),
                          ),
                          DropdownMenuItem(
                            value: 17,
                            child: Text('Science and Nature'),
                          ),
                          DropdownMenuItem(
                            value: 18,
                            child: Text('Science: Computers'),
                          ),
                          DropdownMenuItem(
                            value: 19,
                            child: Text('Science: Mathematics'),
                          ),
                          DropdownMenuItem(
                            value: 20,
                            child: Text('Mythology'),
                          ),
                          DropdownMenuItem(
                            value: 21,
                            child: Text('Sports'),
                          ),
                          DropdownMenuItem(
                            value: 22,
                            child: Text('Geography'),
                          ),
                          DropdownMenuItem(
                            value: 22,
                            child: Text('Geography'),
                          ),
                          DropdownMenuItem(
                            value: 23,
                            child: Text('History'),
                          ),
                          DropdownMenuItem(
                            value: 24,
                            child: Text('Politics'),
                          ),
                          DropdownMenuItem(
                            value: 25,
                            child: Text('Art'),
                          ),
                          DropdownMenuItem(
                            value: 26,
                            child: Text('Celebrities'),
                          ),
                          DropdownMenuItem(
                            value: 27,
                            child: Text('Animals'),
                          ),
                        ],
                        onChanged: (value) {}),
                    const SizedBox(
                      height: 20,
                    ),
                    ToggleButtons(
                        fillColor: Theme.of(context).primaryColorLight,
                        children: [
                          Text('True or False'),
                          Text('Multiple choise')
                        ],
                        isSelected: [
                          false,
                          false
                        ]),
                    const SizedBox(
                      height: 80,
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
