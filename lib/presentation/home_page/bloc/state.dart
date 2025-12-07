
import 'package:breadpolitech/domain/models/home.dart';
import 'package:equatable/equatable.dart';
import 'package:breadpolitech/domain/models/card.dart';

class HomeState extends Equatable {
  final HomeData? data;
  final bool isLoading;
  final bool isPaginationLoading;
  final String? nextPos;
  final String currentQuery;
  final String? error;

  const HomeState({
    this.data,
    this.isLoading = false,
    this.isPaginationLoading = false,
    this.nextPos,
    this.currentQuery = 'funny',
    this.error
  });

  HomeState copyWith({
    HomeData? data,
    bool? isLoading,
    bool? isPaginationLoading,
    String? nextPos,
    String? currentQuery,
    String? error
  }) {
    return HomeState(
      data: data ?? this.data,
      isLoading: isLoading ?? this.isLoading,
      isPaginationLoading: isPaginationLoading ?? this.isPaginationLoading,
      nextPos: nextPos ?? this.nextPos,
      currentQuery: currentQuery ?? this.currentQuery,
      error: error ?? this.error
    );
  }

  @override
  List<Object?> get props => [data, isLoading, isPaginationLoading, nextPos, currentQuery, error];
}