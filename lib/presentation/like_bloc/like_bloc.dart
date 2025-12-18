import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:breadpolitech/presentation/like_bloc/like_event.dart';
import 'package:breadpolitech/presentation/like_bloc/like_state.dart';
import 'package:hive_flutter/hive_flutter.dart';

const String _boxName = 'liked_gifs';
const String _likedKey = 'ids'; // Можно хранить весь список под одним ключом

class LikeBloc extends Bloc<LikeEvent, LikeState> {
  late final Box _box;

  LikeBloc() : super(const LikeState(likedIds: [])) {
    // Открываем (или получаем уже открытый) box
    _box = Hive.box(_boxName);

    on<LoadLikesEvent>(_onLoadLikes);
    on<ChangeLikeEvent>(_onChangeLike);

    // Автоматически загружаем при создании BLoC
    add(const LoadLikesEvent());
  }

  Future<void> _onLoadLikes(LoadLikesEvent event, Emitter<LikeState> emit) async {
    final List<dynamic>? rawList = _box.get(_likedKey);
    final List<String> likedIds = rawList?.cast<String>() ?? <String>[];

    emit(state.copyWith(likedIds: likedIds));
  }

  Future<void> _onChangeLike(
      ChangeLikeEvent event,
      Emitter<LikeState> emit,
      ) async {
    final updatedList = List<String>.from(state.likedIds as Iterable);

    if (updatedList.contains(event.id)) {
      updatedList.remove(event.id);
    } else {
      updatedList.add(event.id);
    }

    await _box.put(_likedKey, updatedList);
    emit(state.copyWith(likedIds: updatedList));
  }


  @override
  Future<void> close() {

    return super.close();
  }
}