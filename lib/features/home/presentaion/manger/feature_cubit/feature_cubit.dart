import 'package:bookly_app/core/errors/failure.dart';
import 'package:bookly_app/features/home/data/repos/home_repo_imp.dart';
import 'package:bookly_app/features/home/presentaion/manger/feature_cubit/feature_states.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class FeatureCubit extends Cubit<FeatureStates> {
  FeatureCubit(this.homeRepoImplement) : super(FeatureInitialState());

  FeatureCubit get(context) => BlocProvider.of(context);

  final HomeRepoImplement homeRepoImplement;

  Future<void> fetchFeatureBooks() async {
    emit(FeatureLoadingState());
    var result = await homeRepoImplement.fetchFeatureBooks();

    result.fold((failure) {
      print(failure.message);
      emit(FeatureErrorState(failure.message));
    }, (books) {

      emit(FeatureSucessState(books));
    });
  }
}
