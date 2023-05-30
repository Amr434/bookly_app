import 'package:bookly_app/features/home/data/models/book_model/book_model.dart';
import 'package:equatable/equatable.dart';

abstract class FeatureStates extends Equatable {
  @override
  List<Object?> get props => [];
}

class FeatureInitialState extends FeatureStates {}

class FeatureLoadingState extends FeatureStates {}

class FeatureSucessState extends FeatureStates {
  final List<BookModel> bookModel;
  FeatureSucessState(this.bookModel);
}

class FeatureErrorState extends FeatureStates {
  final String error;
  FeatureErrorState(this.error);
}
