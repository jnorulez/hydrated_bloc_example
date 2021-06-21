import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

@immutable
abstract class DocumentEvent extends Equatable {
  @override
  List<Object> get props => [];

  @override
  bool get stringify => true;
}

class FetchDocuments extends DocumentEvent {
  FetchDocuments() : super();
}

class DocumentDiscarded extends DocumentEvent {
  DocumentDiscarded() : super();
}

