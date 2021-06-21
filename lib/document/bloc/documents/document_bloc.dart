import 'dart:async';

import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:hydrated_bloc_example/document/models/models.dart';
import 'package:uuid/uuid.dart';

import 'document_event.dart';
import 'document_state.dart';

class DocumentBloc extends HydratedBloc<DocumentEvent, DocumentState> {
  DocumentBloc() : super(DocumentEmpty());

  @override
  DocumentState fromJson(Map<String, dynamic> json) {
    List<dynamic> documents = json['documents'] ?? List.empty();
    List<Document> parsedDocuments = documents.isNotEmpty
        ? documents.map((element) => Document.fromJson(element)).toList()
        : [];
    Document currentDocument = json['currentDocument'] != null &&
            json['currentDocument']['uuid'].toString().length > 0
        ? Document.fromJson(json['currentDocument'])
        : new Document('initial_uuid', 'initial_uuid', DateTime.now(), []);
    // The state will always be persisted as DocumentState in this example (not as DocumentLoading etc.)
    return DocumentState.fromJson(
        {'documents': parsedDocuments, 'currentDocument': currentDocument});
  }

  @override
  Map<String, dynamic> toJson(DocumentState state) {
    return {
      'documents': state.documents,
      'currentDocument': state.currentDocument
    };
  }

  @override
  Stream<DocumentState> mapEventToState(DocumentEvent event) async* {
    if (event is FetchDocuments) {
      yield DocumentsLoading.fromOldDocumentState(state);
      try {
        // In a real scenario, the updatedDocuments would be fetched from a Documents Repository
        await Future.delayed(Duration(seconds: 2));

        List<Document> updatedDocuments = [
          new Document(Uuid().v4(), Uuid().v4(), DateTime.now(),
              [new Page('fileName', Uuid().v4())])
        ];

        yield DocumentsLoaded.fromOldDocumentState(state,
            currentDocument: updatedDocuments.first,
            documents: updatedDocuments);
      } catch (error) {
        yield DocumentsError();
      }
    }

    if (event is DocumentDiscarded) {
      yield DocumentEmpty();
    }
  }
}
