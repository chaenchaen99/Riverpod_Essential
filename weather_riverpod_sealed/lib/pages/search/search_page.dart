import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({super.key});

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  //폼의 상태 추적 - 폼의 유효성검사를 위해 사용된다.
  final _formKey = GlobalKey<FormState>();
  //사용자가 입력한 도시이름을 저장하는 변수
  String? _city;
  //폼의 유효성 검사를 자동으로 수행할지를 결정-disabled이므로 수동으로 폼을 제출하기 전까지 유효성 검사가 실행되지 않는다.
  AutovalidateMode autoValidateMode = AutovalidateMode.disabled;

  void _submit() {
    setState(() {
      //모든 입력 필드에 대해 유효성 검사가 즉시 실행되게 한다.
      autoValidateMode = AutovalidateMode.always;
    });
    final form = _formKey.currentState;
    if (form != null && form.validate()) {
      //form.validate()->모든 필드가 유효하면 true반환
      form.save(); //폼 필드의 현재 값 저장
      Navigator.of(context).pop(_city!.trim());
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Search'),
      ),
      body: Form(
        key: _formKey,
        autovalidateMode: autoValidateMode,
        child: Column(
          children: [
            const SizedBox(height: 60.0),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30.0),
              child: TextFormField(
                autofocus: true,
                style: const TextStyle(fontSize: 18.0),
                decoration: const InputDecoration(
                  labelText: 'CityName',
                  hintText: 'more than 2 characters',
                  prefix: Icon(Icons.search),
                  border: OutlineInputBorder(),
                ),
                validator: (String? input) {
                  //입력된 값의 유효성을 검사한다.
                  if (input == null || input.trim().length < 2) {
                    return 'City name mush be at least 2 characters long';
                  }
                  return null;
                },
                onSaved: (String? input) {
                  //압력이 유효할 때 폼이 저장되면 호출된다.
                  _city = input;
                },
              ),
            ),
            const SizedBox(
              height: 20.0,
            ),
            ElevatedButton(
              onPressed: _submit,
              child: const Text(
                "How's weather",
                style: TextStyle(fontSize: 20.0),
              ),
            )
          ],
        ),
      ),
    );
  }
}
