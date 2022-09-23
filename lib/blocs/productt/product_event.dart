part of 'product_bloc.dart';

abstract class ProductEvent extends Equatable {
  const ProductEvent();
  @override
  List<Object> get props => [];
}
class GetProductList extends ProductEvent {
  final String slug;
  const GetProductList({required this.slug
  });
  @override
  List<Object> get props => [slug];
}
