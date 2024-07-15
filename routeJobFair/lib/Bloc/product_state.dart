part of 'product_bloc.dart';


abstract class ProductState extends Equatable {
  const ProductState();

  @override
  List<Object> get props => [];
}

final class LoadingState extends ProductState {}

class LoadedState extends ProductState {
   final List<ProductsListModel> product;

   const LoadedState(this.product);

  @override
  List<Object> get props => [product];

}

class ErrorState extends ProductState{
   final String mas;

  const ErrorState(this.mas);

  @override
  List<Object> get props => [mas];
}