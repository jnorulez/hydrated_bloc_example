import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hydrated_bloc_example/document/bloc/documents/document_bloc.dart';
import 'package:hydrated_bloc_example/document/bloc/documents/document_event.dart';
import 'package:hydrated_bloc_example/document/bloc/documents/document_state.dart';

class DocumentScreen extends StatefulWidget {
  const DocumentScreen({Key? key}) : super(key: key);

  @override
  _DocumentScreenState createState() => new _DocumentScreenState();
}

class _DocumentScreenState extends State<DocumentScreen> {
  late DocumentBloc documentBloc;

  @override
  void initState() {
    super.initState();
    documentBloc = BlocProvider.of<DocumentBloc>(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Hydrated Bloc Demo'),
      ),
      body: Column(
        children: [
          Center(
            child: BlocBuilder<DocumentBloc, DocumentState>(
              builder: (context, state) {
                if (state is DocumentEmpty) {
                  return Text('Documents were discarded');
                }

                if (state is DocumentsLoading) {
                  return CircularProgressIndicator();
                }

                // Check if the uuid is not initial (set to initial_uuid as default in document_bloc)
                if (state.currentDocument!.uuid != 'initial_uuid') {
                  return Text(
                      'currentDocument: ' + state.currentDocument!.uuid);
                }

                return Text('No documents loaded yet.');
              },
            ),
          ),
          ElevatedButton(
              onPressed: () {
                documentBloc.add(FetchDocuments());
              },
              child: Text('Fetch Documents')),
          ElevatedButton(
              onPressed: () {
                documentBloc.add(DocumentDiscarded());
              },
              child: Text('Discard Documents')),
        ],
      ),
    );
  }
}
