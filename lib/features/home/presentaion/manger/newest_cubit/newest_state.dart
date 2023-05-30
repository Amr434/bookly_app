import 'package:bookly_app/features/home/data/models/book_model/book_model.dart';
import 'package:equatable/equatable.dart';

abstract class FeatureNewstStates extends Equatable {
  @override
  List<Object?> get props => [];
}

class FeatureNewstIntialStates extends FeatureNewstStates {}

class FeatureNewstLoadingState extends FeatureNewstStates {}

class FeatureNewstSucessState extends FeatureNewstStates {
  final List<BookModel> bookModel;
  FeatureNewstSucessState(this.bookModel);
}

class FeatureNewstErrorState extends FeatureNewstStates {
  final String error;
  FeatureNewstErrorState(this.error);
}
