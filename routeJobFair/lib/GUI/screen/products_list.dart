import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:route_job_fair_flutter/Bloc/product_bloc.dart';
import 'package:route_job_fair_flutter/GUI/widgets/loader.dart';
import 'package:route_job_fair_flutter/GUI/widgets/my_colors.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:route_job_fair_flutter/GUI/widgets/number_format.dart';

class ProductsList extends StatefulWidget {
  const ProductsList({super.key});

  @override
  State<ProductsList> createState() => _ProductsListState();
}

class _ProductsListState extends State<ProductsList> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProductBloc, ProductState>(
      builder: (context, state) {
        if (state is LoadedState) {
          return Column(
            children: [
              Expanded(
                child: Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 16,
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Expanded(
                              child: TextFormField(
                                autofocus: false,
                                decoration: InputDecoration(
                                  contentPadding: const EdgeInsets.symmetric(
                                      vertical: 8, horizontal: 18),
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(50),
                                    borderSide: const BorderSide(
                                      color: MyColors.appColor,
                                      width: 1,
                                    ),
                                  ),
                                  hintText: 'What do you search for?',
                                  hintStyle: TextStyle(
                                    fontSize: 14,
                                    color: Colors.grey.shade400,
                                  ),
                                  prefixIcon: const Icon(
                                    CupertinoIcons.search,
                                    color: MyColors.appColor,
                                  ),
                                  focusedBorder: const OutlineInputBorder(
                                      borderSide: BorderSide(
                                        color: MyColors.appColor,
                                        width: 1,
                                      ),
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(50))),
                                ),
                              ),
                            ),
                            const InkWell(
                              child: Padding(
                                padding: EdgeInsets.all(8.0),
                                child: Icon(
                                  CupertinoIcons.shopping_cart,
                                  color: MyColors.appColor,
                                  size: 34,
                                ),
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 14),
                        Expanded(
                            child: GridView.builder(
                          gridDelegate:
                              const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2,
                            mainAxisExtent: 260,
                          ),
                          itemCount: state.product.length,
                          itemBuilder: (context, index) {
                        double relPrice =    ((state.product[index].price / (100- double.parse(state.product[index].discountPercentage)))*100);

                            return Padding(
                              padding: EdgeInsets.only(
                                  bottom: 16,
                                  left: index.isEven ? 0 : 8,
                                  right: index.isEven ? 8 : 0),
                              child: Container(
                                clipBehavior: Clip.hardEdge,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(16),
                                  border: Border.all(
                                      color: MyColors.lightBlue,
                                      width: 2,
                                      strokeAlign:
                                          BorderSide.strokeAlignInside),
                                ),
                                child: Column(
                                  children: [
                                    Expanded(
                                      child: Column(
                                        children: [
                                          Expanded(
                                            child: Container(
                                              decoration: BoxDecoration(
                                                  color: MyColors.lightBlue
                                                      .withOpacity(0.5),
                                                  image: DecorationImage(image: NetworkImage(state.product[index].thumbnail))
                                              ),
                                              padding: const EdgeInsets.all(12),
                                              alignment: Alignment.topRight,
                                              child: Container(
                                                width: 30,
                                                height: 30,
                                                decoration: BoxDecoration(
                                                  color: Colors.white,
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                    50,
                                                  ),
                                                ),
                                                alignment: Alignment.center,
                                                child: const Icon(
                                                  CupertinoIcons.heart,
                                                  size: 26,
                                                  color: MyColors.appColor,
                                                ),
                                              ),
                                            ),
                                          )
                                        ],
                                      ),
                                    ),
                                    Expanded(
                                      child: Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Text(
                                              state.product[index].title,
                                              style: const TextStyle(
                                                fontSize: 14,
                                                fontWeight: FontWeight.w500,
                                                color: MyColors.appColor,
                                              ),
                                              maxLines: 1,
                                              overflow: TextOverflow.ellipsis,
                                            ),
                                            Text(
                                              state.product[index].description,
                                              style: const TextStyle(
                                                fontSize: 14,
                                                fontWeight: FontWeight.w500,
                                                color: MyColors.appColor,
                                              ),
                                              maxLines: 1,
                                              overflow: TextOverflow.ellipsis,
                                            ),
                                            const SizedBox(height: 6),
                                            Row(
                                              children: [
                                                Text(
                                                  'EGP ${currencyFormat(double.parse(doubleFixedStringDecimal(state.product[index].price.toString(), 2))) }',
                                                  style: const TextStyle(
                                                    fontSize: 12,
                                                    fontWeight: FontWeight.w500,
                                                    color: MyColors.appColor,
                                                  ),
                                                  maxLines: 2,
                                                  overflow:
                                                      TextOverflow.ellipsis,
                                                ),
                                                const SizedBox(width: 8),
                                                Text(
                                                  '${  currencyFormat(double.parse(doubleFixedStringDecimal(relPrice.toString(), 2)))  } EGP',
                                                  style: const TextStyle(
                                                      fontSize: 10,
                                                      fontWeight:
                                                          FontWeight.w500,
                                                      color: MyColors.lightBlue,
                                                      decoration: TextDecoration
                                                          .lineThrough),
                                                  maxLines: 2,
                                                  overflow:
                                                      TextOverflow.ellipsis,
                                                ),
                                              ],
                                            ),
                                            const SizedBox(height: 8),
                                            Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                Row(
                                                  children: [
                                                    Text(
                                                      'Review (${state.product[index].rating})',
                                                      style: const TextStyle(
                                                        fontSize: 14,
                                                        fontWeight:
                                                            FontWeight.w400,
                                                        color:
                                                            MyColors.appColor,
                                                      ),
                                                      maxLines: 2,
                                                      overflow:
                                                          TextOverflow.ellipsis,
                                                    ),
                                                    const SizedBox(width: 4),
                                                    const Icon(
                                                      Icons.star,
                                                      color: Colors.yellow,
                                                      size: 20,
                                                    )
                                                  ],
                                                ),
                                                const Icon(
                                                  Icons.add_circle,
                                                  color: MyColors.appColor,
                                                  size: 28,
                                                )
                                              ],
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            );
                          },
                        ))
                      ],
                    )),
              ),
            ],
          );
        } else if (state is ErrorState) {
          return Text(state.mas);
        } else {
          return const LoaderWidget();
        }
      },
    );
  }
}
