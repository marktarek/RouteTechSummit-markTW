import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';
import 'package:equatable/equatable.dart';
import 'package:route_job_fair_flutter/DataAccessLayer/http_helper.dart';
import 'package:route_job_fair_flutter/DataAccessLayer/model/get_view_product_list_model.dart';

part 'product_event.dart';
part 'product_state.dart';

class ProductBloc extends Bloc<ProductEvent, ProductState> {
  final context;

  ProductBloc(this.context) : super(LoadingState()) {
    on<ProductEvent>((event, emit) async {
      if (event is GetAllProducts) {
        emit(LoadingState());
        try{
          final product = await HttpHelper().getProducts(context);
          emit(LoadedState(product));
        }catch(e){
          emit(const ErrorState('Something Went Wrong, Please Try Again Later'));

        }
      }
    });
  }
}
