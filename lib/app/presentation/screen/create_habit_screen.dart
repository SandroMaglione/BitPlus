import 'package:bitplus/app/presentation/bloc/bloc.dart';
import 'package:bitplus/app/presentation/widgets/text_input_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CreateHabitScreen extends StatefulWidget {
  @override
  _CreateHabitScreenState createState() => _CreateHabitScreenState();
}

class _CreateHabitScreenState extends State<CreateHabitScreen> {
  TextEditingController _nameController = TextEditingController();
  List<bool> _valueSelected = List<bool>.generate(5, (index) => index == 0);
  bool _isPositive = true;
  int _valueSelectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Create habit'),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            TextInputField(
              label: 'Name',
              controller: _nameController,
            ),
            ToggleButtons(
              children: [
                Text('1'),
                Text('2'),
                Text('3'),
                Text('4'),
                Text('5'),
              ],
              isSelected: _valueSelected,
              onPressed: (index) {
                setState(() {
                  _valueSelected[_valueSelectedIndex] = false;
                  _valueSelected[index] = true;
                  _valueSelectedIndex = index;
                });
              },
            ),
            Checkbox(
              value: _isPositive,
              onChanged: (value) => setState(() => _isPositive = value),
            ),
            Column(
              children: List<int>.generate(12, (index) => index)
                  .map(
                    (index) => SelectAreaValue(
                      index: index + 1,
                    ),
                  )
                  .toList(),
            )
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => _saveHabit(context),
        child: Icon(Icons.store),
      ),
    );
  }

  void _saveHabit(BuildContext context) {
    String name = _nameController.text;

    // TODO: Add value and areas to send to the CreateHabitEvent
    BlocProvider.of<HabitBloc>(context).add(
      CreateHabitEvent(
        name: name,
        isPositive: _isPositive,
        value: null,
        areas: null,
      ),
    );
  }
}

class SelectAreaValue extends StatelessWidget {
  final int index;

  const SelectAreaValue({
    Key key,
    this.index,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text('Area $index'),
                Checkbox(
                  value: false,
                  onChanged: (index) {},
                ),
              ],
            ),
            ToggleButtons(
              children: [
                Text('1'),
                Text('2'),
                Text('3'),
                Text('4'),
                Text('5'),
                Text('6'),
              ],
              isSelected: List<bool>.filled(6, false),
            )
          ],
        ),
      ),
    );
  }
}
