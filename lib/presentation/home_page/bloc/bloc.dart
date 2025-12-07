import 'package:breadpolitech/data/repository/gif_repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:breadpolitech/presentation/home_page/bloc/events.dart';
import 'package:breadpolitech/presentation/home_page/bloc/state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  final GifRepository repo;

  HomeBloc(this.repo) : super(const HomeState()) {
    on<HomeLoadDataEvent>(_onLoadData);
  }

  Future<void> _onLoadData(HomeLoadDataEvent event, Emitter<HomeState> emit) async {
    if (event.nextPos == null){
      emit(state.copyWith(isLoading: true));
    } else{
      emit(state.copyWith(isPaginationLoading: true));
    }
    String? error;
    final data = await repo.loadData(q: event.search, pos: event.nextPos, onError: (e) => error = e);
    if (event.nextPos != null) {
      data?.data?.insertAll(0, state.data?.data ?? []);
    }
    emit(state.copyWith(
      isLoading: false,
      isPaginationLoading: false,
      data: data,
      error: error,
    ));
  }
}