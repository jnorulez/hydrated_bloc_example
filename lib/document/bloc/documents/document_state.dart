import 'package:equatable/equatable.dart';
import 'package:hydrated_bloc_example/document/models/models.dart';

class DocumentState extends Equatable {
  final List<Document>? documents;

  final Document? currentDocument;

  DocumentState({this.documents, this.currentDocument});

  @override
  List<Object?> get props => [documents, currentDocument];

  @override
  bool get stringify => true;

  DocumentState.fromJson(Map<String, dynamic> json)
      : documents = json['documents'],
        currentDocument = json['currentDocument'];

  Map<String, dynamic> toJson() => {
        'documents': this.documents.toString(),
        'currentDocument': this.currentDocument.toString()
      };
}

class DocumentEmpty extends DocumentState {
  DocumentEmpty() : super(documents: null, currentDocument: null);
}

class DocumentsLoading extends DocumentState {
  DocumentsLoading.fromOldDocumentState(DocumentState oldState)
      : super(
            documents: oldState.documents,
            currentDocument: oldState.currentDocument);
}

class DocumentsLoaded extends DocumentState {
  DocumentsLoaded.fromOldDocumentState(DocumentState oldState,
      {List<Document>? documents, Document? currentDocument})
      : super(
            documents: documents ?? oldState.documents,
            currentDocument: currentDocument ?? oldState.currentDocument);
}

class DocumentsError extends DocumentState {
  DocumentsError() : super();
}

class DiscardedDocument extends DocumentState {
  DiscardedDocument.fromOldDocumentState(DocumentState oldState,
      {List<Document>? documents, Document? currentDocument})
      : super(
            documents: documents ?? oldState.documents,
            currentDocument: currentDocument ?? oldState.currentDocument);
}
