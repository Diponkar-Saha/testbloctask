import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../model/product_response.dart';
import '../../resource/api_repository.dart';

part 'product_event.dart';
part 'product_state.dart';


class ProductBloc extends Bloc<ProductEvent, ProductState> {
  ProductBloc() : super(ProductInitial()) {
    final ApiRepository _apiRepository = ApiRepository();

        on<GetProductList>((event, emit) async {
          try {
            emit(ProductLoading());
            final mList = await _apiRepository.fetchProduct(event.slug);


            emit(ProductLoaded(mList));

          } on NetworkError {
            emit(ProductError("Failed to fetch data. is your device online?"));
          }
        });

  }
}
