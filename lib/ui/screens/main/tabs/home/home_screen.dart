import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:graduation_project/data/model/responses/places_response/places_response.dart';
import 'package:graduation_project/domain/di/di.dart';
import 'package:graduation_project/ui/screens/main/tabs/home/place_details/place_detales_screen.dart';
import 'package:graduation_project/ui/utils/base_request_states.dart';
import 'package:graduation_project/ui/utils/constants.dart';
import 'package:graduation_project/ui/widgets/error_view.dart';
import 'package:graduation_project/ui/widgets/loading_widget.dart';

import 'home_view_model.dart';

class HomeScreen extends StatefulWidget {
  static const String routeName = "HomeRoute";
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  HomeViewModel viewModel = getIt();

  @override
  void initState() {
    viewModel.getUser();
   viewModel.getPlaces();
    super.initState();
  }



  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        PreferredSize(
          preferredSize: const Size.fromHeight(100),
          child: AppBar(
            backgroundColor: Colors.black,
            elevation: 0,
            leading: BlocBuilder(
              bloc:viewModel,
              builder:(context, state) {
                if(state is BaseRequestUserState){
                  return Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(80),
                        image: DecorationImage(
                            image: NetworkImage(state.data!.data!.cloudImage!.url??"https://upload.wikimedia.org/wikipedia/commons/thumb/b/bc/Unknown_person.jpg/813px-Unknown_person.jpg"), fit: BoxFit.cover)),
                    margin: const EdgeInsets.only(left: 20 ,bottom: 10,top: 10),
                  );
                }else{
                  return Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(80),
                        image: const DecorationImage(
                            image: AssetImage("assets/images/me.JPG"), fit: BoxFit.cover)),
                    margin: const EdgeInsets.only(left: 20 ,bottom: 10,top: 10),
                  );
                }
              },
            ),
            title: const Row(
              children: [
                Text(
                  " KARTAK",
                  style: TextStyle(
                      fontSize: 18,
                      color: Colors.white,
                      fontWeight: FontWeight.bold),
                ),
                Text(
                  " Card",
                  style: TextStyle(
                      fontSize: 14,
                      color: Color.fromRGBO(178, 133, 28, 1.0)),
                ),
              ],
            ),
            actions: [
              IconButton(
                padding: const EdgeInsets.only(right: 15),
                icon: const Icon(Icons.menu, color: Colors.white),
                onPressed: () {
                  viewModel.logout(context);
                },
              ),
            ],
          ),
        ),
        Expanded(
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                BlocBuilder(
                  bloc: viewModel.getPlacesUseCase,
                  builder:(context, state) {
                    if(state is BaseRequestSuccessState){
                    return buildListOfPlaces(context,state.data);
                    }else if (state is BaseRequestErrorState){
                    return  Center(child: ErrorView(message:state.message ?? Constants.defaultErrorMessage));
                }else{
                      if(viewModel.allPlacesCached.data == null){
                        return Center(child: LoadingWidget());
                      }else{
                        return buildListOfPlaces(context,viewModel.allPlacesCached.data!);
                      }

                    }
                  }
                )
              ],
            ),
          ),
        ),
      ],
    );
  }

  Widget buildListOfPlaces(BuildContext context , List<PlacesDM> places) => ListView.separated(
    shrinkWrap: true,
    physics: const NeverScrollableScrollPhysics(),
    itemBuilder: (context, index) => buildItemOfList( places[index]),
    separatorBuilder: (context, index) => const SizedBox(height: 20),
    itemCount: places.length,
  );

  Widget buildItemOfList(PlacesDM place) => GestureDetector(
    onTap: (){
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) =>  PlaceDetails(idOfPlace: place.id!)),
      );
    },
    child: Row(
      children: [
        Container(
          margin: const EdgeInsets.only(right: 20, left: 30),
          height: MediaQuery.of(context).size.height * .15,
          width: MediaQuery.of(context).size.width * .3,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
            image:  DecorationImage(
              image: NetworkImage(place.cloudImage!.url!),
              fit: BoxFit.cover,
            ),
          ),
        ),
        Expanded(
          child: SizedBox(
            height: MediaQuery.of(context).size.height * .15,
            width: MediaQuery.of(context).size.width * .3,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                 place.slug??"",
                 style:const TextStyle(
                   color: Color.fromARGB(255, 0, 0, 0),
                   fontWeight: FontWeight.bold,
                   fontSize: 18,
                 ),
                  ),
                const SizedBox(height: 2,),
                Text(
                  place.categore??"",
                  style: TextStyle(
                    color: Color.fromARGB(255, 114, 114, 114),
                    fontSize: 12,
                  ),
                ),
                const SizedBox(height: 5,),
                Expanded(
                  child: Text(
                    place.description??"",
                    maxLines: 2,
                    style: TextStyle(
                      color: Color.fromARGB(255, 114, 114, 114),
                      fontSize: 16,
                    ),
                  ),
                ),
                IconButton(
                  padding: const EdgeInsets.only(right: 25),
                  icon: const Icon(Icons.favorite_outline, color: Colors.black ,size: 20,),
                  onPressed: () {},
                ),
              ],
            ),
          ),
        ),
      ],
    ),
  );
}
