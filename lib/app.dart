import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'document/document.dart';

class App extends StatelessWidget {
  const App(
      {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  MultiBlocProvider(
          providers: [
            BlocProvider<DocumentBloc>(
                create: (context) => DocumentBloc()),
          ],
          child: AppView(),
        );
  }
}

class AppView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: DocumentScreen()
    );
  }
}

