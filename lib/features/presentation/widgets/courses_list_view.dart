import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:task1/features/presentation/controller/cubit/courses_cubit.dart';

import '../../../core/utils/constants.dart';

class CoursesListView extends StatelessWidget {
  const CoursesListView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CoursesCubit, CoursesState>(
      builder: (context, state) {
        if (state is CoursesSucces) {
          return ListView.builder(
            shrinkWrap: true,
            itemCount: state.courses.length,
            itemBuilder: (context, index) {
              return Padding(
                padding: const EdgeInsets.only(bottom: 15),
                child: SizedBox(
                  height: MediaQuery.of(context).size.height * 0.51,
                  child: Container(
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(16)),
                    child: Padding(
                      padding: const EdgeInsets.all(17.0),
                      child: Column(
                        children: [
                          ClipRRect(
                            borderRadius: BorderRadius.circular(16),
                            child: Stack(
                              children: [
                                AspectRatio(
                                  aspectRatio: 6 / 4,
                                  child: Image.network(
                                    state.courses[index].image!,
                                  ),
                                ),
                                Container(
                                  padding: const EdgeInsets.all(8),
                                  margin: const EdgeInsets.all(12),
                                  decoration: BoxDecoration(
                                      color: Colors.grey,
                                      borderRadius: BorderRadius.circular(20)),
                                  child: Text(
                                    'ر.س ${state.courses[index].price}',
                                    style: const TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.w600),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          const SizedBox(height: 10),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              Text(
                                '${state.courses[index].price}',
                                style: TextStyle(
                                    fontSize: 20,
                                    color: kMainColor.withOpacity(0.5)),
                              ),
                              Icon(Icons.person,
                                  size: 35, color: kMainColor.withOpacity(0.5)),
                            ],
                          ),
                          const SizedBox(height: 15),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Icon(
                                Icons.add_shopping_cart_rounded,
                                size: 25,
                                color: kMainColor.withOpacity(0.5),
                              ),
                              Text(
                                state.courses[index].title!,
                                style: TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.w600,
                                    color: kMainColor.withOpacity(0.6)),
                              ),
                            ],
                          ),
                          Divider(
                            height: 20,
                            color: kMainColor.withOpacity(0.5),
                            thickness: 1,
                          ),
                          const SizedBox(height: 10),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                children: [
                                  Text(
                                    '${state.courses[index].id} دقيقة',
                                    style: TextStyle(
                                        color: kMainColor.withOpacity(0.5),
                                        fontSize: 18),
                                  ),
                                  const SizedBox(
                                    width: 5,
                                  ),
                                  Icon(
                                    Icons.access_time_rounded,
                                    color: kMainColor.withOpacity(0.5),
                                  ),
                                ],
                              ),
                              Row(
                                children: [
                                  Text(
                                    '${state.courses[index].id} دروس',
                                    style: TextStyle(
                                        color: kMainColor.withOpacity(0.5),
                                        fontSize: 18),
                                  ),
                                  const SizedBox(
                                    width: 5,
                                  ),
                                  Icon(
                                    Icons.play_circle_outline_rounded,
                                    color: kMainColor.withOpacity(0.5),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              );
              ;
            },
          );
        } else {
          return Container(
            width: 50,
            height: 50,
            color: Colors.red,
          );
        }
      },
    );
  }
}
