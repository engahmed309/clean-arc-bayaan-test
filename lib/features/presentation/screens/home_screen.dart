import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter_cache_manager/flutter_cache_manager.dart';

import '/features/presentation/controller/cubit/courses_cubit.dart';
import '/features/presentation/widgets/courses_list_view.dart';

// class HomeScreen extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(body: BlocBuilder<CoursesCubit, CourseStates>(
//       builder: (context, state) {
//         if (state is IsLoadingState) {
//           return const Center(
//             child: CircularProgressIndicator(color: Colors.black),
//           );
//         } else if (state is IsLoadedState) {
//           return ListView.builder(
//             itemCount: state.courseList.length,
//             itemBuilder: (context, index) {
//               return Padding(
//                 padding: const EdgeInsets.only(
//                     top: 10, left: 16, right: 16, bottom: 5),
//                 child: Card(
//                   color: Colors.white,
//                   elevation: 6,
//                   child: Column(
//                     crossAxisAlignment: CrossAxisAlignment.end,
//                     children: [
//                       Stack(
//                         children: [
//                           ClipRRect(
//                             borderRadius: BorderRadius.circular(20),
//                             child: Image.network(state.courseList[index].image!),
//                           ),
//                           Container(
//                             margin: const EdgeInsets.all(10),
//                             padding: const EdgeInsets.all(6),
//                             decoration: BoxDecoration(
//                                 borderRadius: BorderRadius.circular(50),
//                                 color: Colors.black.withOpacity(.5)),
//                             child: Text(
//                               "${state.courseList[index].price.toString()}  ر.س",
//                               style: const TextStyle(
//                                   color: Colors.white,
//                                   fontWeight: FontWeight.bold,
//                                   fontSize: 20),
//                             ),
//                           )
//                         ],
//                       ),
//                       SizedBox(
//                         height: 20,
//                       ),
//                       Text(
//                         state.courseList[index].title!,
//                         style: const TextStyle(
//                           fontSize: 25,
//                           fontWeight: FontWeight.bold,
//                         ),
//                       ),
//                     ],
//                   ),
//                 ),
//               );
//             },
//           );
//         }
//         return Text("fdfd");
//       },
//     ));
//   }
// }
class CoursesHomeScreen extends StatelessWidget {
  const CoursesHomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        centerTitle: true,
        title: const Text(
          "BAYAAN",
          style: TextStyle(
            color: Colors.black,
          ),
        ),
      ),
      body: Center(child: BlocBuilder<CoursesCubit, CoursesState>(
        builder: (context, state) {
          if (state is CoursesSucces) {
            return Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                children: [
                  // CachedNetworkImage(
                  //   imageUrl: "http://via.placeholder.com/350x150",
                  //   cacheManager: CacheManager(
                  //     Config(
                  //       "customCacheKey",
                  //       stalePeriod: const Duration(days: 7),
                  //     ),
                  //   ),
                  //   errorWidget: (context, url, error) => Icon(Icons.error),
                  // ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Text(
                        "الدورات التدريبية",
                        style: TextStyle(
                            color: Colors.cyan[900],
                            fontWeight: FontWeight.bold,
                            fontSize: 16),
                      ),
                      const SizedBox(
                        width: 5,
                      ),
                      Icon(Icons.circle, size: 16, color: Colors.cyan[900]),
                      SizedBox(
                        height: 20,
                      ),
                    ],
                  ),
                  Expanded(child: CoursesListView()),
                ],
              ),
            );
          } else if (state is Courseserror) {
            return Center(
              child: Text(state.messege),
            );
          } else {
            return Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: const [
                  CircularProgressIndicator(),
                  SizedBox(
                    height: 16,
                  ),
                  Text(
                    "..جاري تحميل الدورات",
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            );
          }
        },
      )),
    );
  }
}
