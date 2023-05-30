import 'package:bookly_app/features/home/data/repos/home_repo_imp.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'newest_state.dart';

class FeatureNewestCubit extends Cubit<FeatureNewstStates> {
  FeatureNewestCubit(this.homeRepo) : super(FeatureNewstIntialStates());

  FeatureNewestCubit get(context) => BlocProvider.of(context);

  final HomeRepoImplement homeRepo;

  Future<void> fetchFeatureNewestBooks() async {
    emit(FeatureNewstLoadingState());
    var result = await homeRepo.fetchNewestBooks();
    result.fold((failure) {
      emit(FeatureNewstErrorState(failure.message));
    }, (books) {

      emit(FeatureNewstSucessState(books));
    });
  }
}
