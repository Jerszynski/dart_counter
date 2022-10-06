import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:meta/meta.dart';
import 'package:flutter/material.dart';

part 'scores_state.dart';

class ScoresCubit extends Cubit<ScoresState> {
  ScoresCubit()
      : super(
          const ScoresState(
            documents: [],
            errorMessage: '',
            isLoading: false,
          ),
        );

  StreamSubscription? _streamSubscription;

  Future<void> start() async {
    emit(
      const ScoresState(
        documents: [],
        errorMessage: '',
        isLoading: false,
      ),
    );

    _streamSubscription = FirebaseFirestore.instance
        .collection('scores')
        .orderBy('Date', descending: true)
        .snapshots()
        .listen(
      (data) {
        emit(
          ScoresState(
            documents: data.docs,
            isLoading: false,
            errorMessage: '',
          ),
        );
      },
    )..onError(
        (error) {
          ScoresState(
            documents: const [],
            isLoading: false,
            errorMessage: error.toString(),
          );
        },
      );
  }

  @override
  Future<void> close() {
    _streamSubscription?.cancel();
    return super.close();
  }
}
