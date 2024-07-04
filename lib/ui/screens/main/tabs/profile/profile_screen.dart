import 'package:barcode_widget/barcode_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:graduation_project/data/model/responses/auth_response/AuthResponse.dart';
import 'package:graduation_project/data/model/responses/places_response/places_response.dart';
import 'package:graduation_project/data/model/responses/users/AllUsersResponse.dart';
import 'package:graduation_project/domain/di/di.dart';
import 'package:graduation_project/ui/screens/auth/login/login_screen.dart';
import 'package:graduation_project/ui/screens/main/tabs/profile/add_place/add_place_screen.dart';
import 'package:graduation_project/ui/screens/main/tabs/profile/profile_view_model.dart';
import 'package:graduation_project/ui/screens/main/tabs/profile/update_picture/update_picture_screen.dart';
import 'package:graduation_project/ui/screens/main/tabs/profile/widgets/placecard.dart';
import 'package:graduation_project/ui/screens/main/tabs/profile/widgets/usercard.dart';
import 'package:graduation_project/ui/utils/app_colors.dart';
import 'package:graduation_project/ui/utils/base_request_states.dart';
import 'package:graduation_project/ui/widgets/loading_widget.dart';

import 'change_password/change_pass_screen.dart';


class ProfileScreen extends StatefulWidget {
  static const routeName = "ProfileScreen";


  const ProfileScreen({super.key});




  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {

  ProfileViewModel viewModel = getIt();
  bool showPlaces = true;
  int itemsToShow = 2;
  List<int> items = List.generate(20, (index) => index + 1);
  bool _isExpanded = false;
  late AuthData data;
  String role = "";
  int? countOfUsers ;
  late int countOfPlaces ;



  @override
  void initState(){
    viewModel.getAllPlaces();
    viewModel.getAllUsers();
    viewModel.getProfileInf();
    viewModel.getUser();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder(
       bloc:viewModel.getProfileUseCase ,
        builder: (context, state) {
         print(state );
          if(state is BaseRequestSuccessState){
             data = state.data;
             role =data.role??"user";
            return SingleChildScrollView(
                child: Container(
                  color: Colors.white,
                  padding: const EdgeInsets.all(20),
                  child: Column(
                    children: [
                      GestureDetector(
                        onTap: (){
                          Navigator.popAndPushNamed(context, UpdatePictureScreen.routeName);
                        },
                        child: Container(
                          margin: const EdgeInsets.only(top: 80, bottom: 15),
                          child: CircleAvatar(
                            radius: 70,
                            backgroundImage: NetworkImage(data.cloudImage!.url!),
                          ),

                        ),
                      ),
                      _buildProfileInfo(),
                      if(role != "user")  const SizedBox(height: 5,),
                      if(role != "user") InkWell(
                        onTap: (){
                          showDialog(
                            context: context,
                            builder: (context) {
                              return AlertDialog(
                                content: Container(
                                  color: AppColors.white,
                                  child: BarcodeWidget(
                                    barcode: Barcode.qrCode(),
                                    data: data.id??"",
                                    height: MediaQuery.of(context).size.width *0.4,
                                    width: MediaQuery.of(context).size.width *0.4,
                                  ),
                                ),

                              );
                            },
                          );
                        },
                        child: Container(
                          width: 30,
                          height: 30,
                          color: const Color.fromRGBO(243, 230, 209, 0.7),
                          padding: const EdgeInsets.only(bottom: 10),

                          child: const Icon(
                              Icons.qr_code
                          ),
                        ),
                      ),
                      if (role == "admin") _buildAdminArea(data),
                      if (role == "owner") _buildOwnerArea(data),
                      if (role == "user") _buildUserArea(data),
                      Container(
                        margin: const EdgeInsets.only(top: 20),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            IconButton(
                              icon: const Icon(
                                FontAwesomeIcons.facebook,
                              ),
                              onPressed: () {},
                            ),
                            IconButton(
                              icon: const Icon(
                                FontAwesomeIcons.twitter,
                              ),
                              onPressed: () {},
                            ),
                            IconButton(
                              icon: const Icon(
                                FontAwesomeIcons.linkedin,
                              ),
                              onPressed: () {},
                            ),
                            IconButton(
                              icon: const Icon(
                                FontAwesomeIcons.instagram,
                              ),
                              onPressed: () {},
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              );

          }else if(state is BaseRequestErrorState){
            if(state.message =="jwt expired"){
              Navigator.pushNamed(context, LoginScreen.routeName);
            }
            return Center(child: Text(state.message),);
          }else{
            return BlocBuilder(
                bloc: viewModel,
                builder: (context, state){
                  if(state is BaseRequestSuccessState){
                    data = state.data.data;
                    role = data.role??"user";
                    return SingleChildScrollView(
                      child: Container(
                        color: Colors.white,
                        padding: const EdgeInsets.all(20),
                        child: Column(
                          children: [
                            GestureDetector(
                              onTap: (){
                                Navigator.popAndPushNamed(context, UpdatePictureScreen.routeName);
                              },
                              child: Container(
                                margin: const EdgeInsets.only(top: 80, bottom: 15),
                                child: CircleAvatar(
                                  radius: 70,
                                  backgroundImage: NetworkImage(data.cloudImage!.url!),
                                ),

                              ),
                            ),
                            _buildProfileInfo(),
                            if(role != "user")  const SizedBox(height: 5,),
                            if(role != "user") InkWell(
                              onTap: (){
                                showDialog(
                                  context: context,
                                  builder: (context) {
                                    return AlertDialog(
                                      content: Container(
                                        color: AppColors.white,
                                        child: BarcodeWidget(
                                          barcode: Barcode.qrCode(),
                                          data: data.id??"",
                                          height: MediaQuery.of(context).size.width *0.4,
                                          width: MediaQuery.of(context).size.width *0.4,
                                        ),
                                      ),

                                    );
                                  },
                                );
                              },
                              child: Container(
                                width: 30,
                                height: 30,
                                color: const Color.fromRGBO(243, 230, 209, 0.7),
                                padding: const EdgeInsets.only(bottom: 10),

                                child: const Icon(
                                    Icons.qr_code
                                ),
                              ),
                            ),
                            if (role == "admin") _buildAdminArea(data),
                            if (role == "owner") _buildOwnerArea(data),
                            if (role == "user") _buildUserArea(data),
                            Container(
                              margin: const EdgeInsets.only(top: 20),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  IconButton(
                                    icon: const Icon(
                                      FontAwesomeIcons.facebook,
                                    ),
                                    onPressed: () {},
                                  ),
                                  IconButton(
                                    icon: const Icon(
                                      FontAwesomeIcons.twitter,
                                    ),
                                    onPressed: () {},
                                  ),
                                  IconButton(
                                    icon: const Icon(
                                      FontAwesomeIcons.linkedin,
                                    ),
                                    onPressed: () {},
                                  ),
                                  IconButton(
                                    icon: const Icon(
                                      FontAwesomeIcons.instagram,
                                    ),
                                    onPressed: () {},
                                  ),
                                ],
                              ),
                            )
                          ],
                        ),
                      ),
                    );
                  }else{
                    return LoadingWidget();
                  }

                }
            );
          }
        },
      ),
    );
  }

  void _loadMoreItemsOfUsers() {
    setState(() {
      itemsToShow += 2;
      if (itemsToShow > countOfUsers!) {
        itemsToShow = countOfUsers!;
      }
    });
  }

  void _loadMoreItemsOfPlaces() {
    setState(() {
      itemsToShow += 2;
      if (itemsToShow > countOfPlaces) {
        itemsToShow = countOfPlaces;
      }
    });
  }
  void _toggleExpand() {
    setState(() {
      _isExpanded = !_isExpanded;
    });
  }

  Widget _buildProfileInfo() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const SizedBox(
              width: 20,
            ),
             Text(
              data.name??"",
              style: const TextStyle(
                fontSize: 20,
                decoration: TextDecoration.none,
                color: Colors.black,
                fontWeight: FontWeight.bold,
              ),
            ),
            IconButton(
              icon: const Icon(
                Icons.settings,
              ),
              onPressed: () {
                showModalBottomSheet(
                    context: context,
                    isScrollControlled: true,
                    builder:(context) {
                      return SizedBox(
                        width: double.infinity,
                        height: MediaQuery.of(context).size.height * 0.2,
                        child: Padding(
                          padding:  EdgeInsets.only(top: 10.0 , bottom: MediaQuery.of(context).viewInsets.bottom),
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                width: double.infinity,
                                height: 50,
                                margin: const EdgeInsets.symmetric(horizontal: 24),
                                decoration: BoxDecoration(
                                  color: AppColors.black,
                                  borderRadius: BorderRadius.circular(10)
                                ),
                                child: InkWell(
                                  onTap: (){
                                    Navigator.pushNamed(context, ChangePassScreen.routeName);
                                  },
                                  child: const Row(
                                    children: [
                                      SizedBox(width: 10,),
                                      Icon(Icons.password,color: AppColors.white),
                                      SizedBox(width: 10,),
                                      Text(
                                        "Change Password",
                                        style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 14,
                                          color: AppColors.white
                                        ),
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
                    backgroundColor: AppColors.white
                );
              },
            ),
          ],
        ),
         Text(
            data.email??"",
            style: const TextStyle(
                fontSize: 12,
                decoration: TextDecoration.none,
                color: Colors.black)),
         Text(
             data.phone??"",
            style: const TextStyle(
                fontSize: 12,
                decoration: TextDecoration.none,
                color: Colors.black)),
      ],
    );
  }




  Widget _buildAdminArea(AuthData user) {
    return Container(
      padding: const EdgeInsets.only(bottom: 10),
      margin: const EdgeInsets.only(top: 25, bottom: 10),
      decoration: BoxDecoration(
        color: const Color.fromRGBO(243, 230, 209, 0.7),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          _buildToggleButtons(),
          IconButton(
            icon: const Icon(
              Icons.add_circle,
              color: Color.fromRGBO(227, 163, 22, 0.7),
              size: 30,
            ),
            onPressed: () {
              showPlaces ? Navigator.pushNamed(context, AddPlaceScreen.routeName) :null;
            },
          ),
          showPlaces ? _buildPlacesListView() : _buildUsersListView(),
        ],
      ),
    );
  }
  Widget _buildOwnerArea(AuthData user) {
    return Container(
        margin: const EdgeInsets.only(top: 25),
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: const Color.fromRGBO(243, 230, 209, 0.7),
          borderRadius: BorderRadius.circular(10),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  height: 150,
                  width: 150,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    image: const DecorationImage(
                      image: NetworkImage(
                          'https://i.pinimg.com/564x/15/1e/21/151e212952323aeb23f3606e2a32df5f.jpg'),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 20),
                    backgroundColor: Colors.black,
                    // Button color
                  ),
                  child: const Text(
                    'Go To Place',
                    style: TextStyle(color: Colors.white,fontSize: 18),
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 20,
            ),
            const Text(
              'Café & Restaurants',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Color.fromRGBO(227, 163, 22, 1),
              ),
            ),
            Container(
              margin: const EdgeInsets.only(left: 10, bottom: 25),
              child: _buildDescription(),
            ),
          ],
        ));
  }
  Widget _buildUserArea(AuthData user) {
    return Container(
        margin: const EdgeInsets.only(top: 25),
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: const Color.fromRGBO(243, 230, 209, 0.7),
          borderRadius: BorderRadius.circular(10),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            BarcodeWidget(
            barcode: Barcode.qrCode(),
              data: user.id??"",
              height: MediaQuery.of(context).size.width *0.4,
              width: MediaQuery.of(context).size.width *0.4,
    )
          ],
        ));
  }



  Widget _buildToggleButtons() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        _toggleButton('Places', showPlaces),
        _toggleButton('Users', !showPlaces),
      ],
    );
  }

  Widget _toggleButton(String title, bool isActive) {
    return GestureDetector(
      onTap: () {
        itemsToShow = 2;
        setState(() {
          showPlaces = (title == 'Places');
        });
      },
      child: Container(
        margin: const EdgeInsets.only(top: 20, bottom: 10),
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        decoration: BoxDecoration(
          color:
          isActive ? const Color.fromARGB(255, 58, 58, 58) : Colors.transparent,
          borderRadius: BorderRadius.circular(15),
        ),
        child: Text(
          title,
          style: TextStyle(
            fontSize: 18,
            color: isActive ? const Color.fromRGBO(227, 163, 22, 1) : Colors.black,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }

  Widget _buildPlacesListView() {
    return BlocBuilder(
      bloc:viewModel.getAllPlacesUseCase ,
      builder: (context, state) {
        if(state is BaseRequestSuccessState){
          List<PlacesDM> places = state.data;
          countOfPlaces = places.length;
          return ListView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: itemsToShow < places.length ? itemsToShow + 1 : itemsToShow,
            itemBuilder: (context, index) {
              if (index < itemsToShow && index < places.length) {
                return  PlaceCard(
                  imageUrl:  places[index].cloudImage!.url??"",
                  title: places[index].name??"",
                  subtitle: places[index].description??"",
                  owner: places[index].owner??"",
                );
              } else if (index == itemsToShow && itemsToShow < places.length) {
                return _loadMoreButton(_loadMoreItemsOfPlaces);
              }
              return null;

            },
          );
        }else if(state is BaseRequestErrorState){
          return Center(child: Text(state.message),);
        }else{
          return Center(child: LoadingWidget(),);
        }
      },
    );
  }

  Widget _loadMoreButton(fun) {
    return  Center(
      child: TextButton(
        onPressed: fun,
        child: const Text('Load More',
            style: TextStyle(color: Color.fromRGBO(227, 163, 22, 1))),
      ),
    );
  }



  Widget _buildDescription() {
    final description = "widget.description";
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          description,
          style: const TextStyle(fontSize: 14),
          maxLines: _isExpanded ? null : 3,
          overflow: _isExpanded ? TextOverflow.visible : TextOverflow.ellipsis,
        ),
        Row(
          children: [
            GestureDetector(
              onTap: _toggleExpand,
              child: Text(
                _isExpanded ? "less" : "more",
                style: const TextStyle(
                  fontSize: 14,
                  color: Color.fromRGBO(227, 163, 22, 1),
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildUsersListView() {
    return BlocBuilder(
      bloc: viewModel.getUsersUseCase,
      builder: (context, state) {
        if(state is BaseRequestSuccessState){
          List<UsersData> users = state.data;
          countOfUsers = users.length;
          return ListView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: users.length < itemsToShow ? users.length : itemsToShow,
            itemBuilder: (context, index) {
              if (index < itemsToShow && index < users.length) {
                return  UserCard(
                  imageUrl:
                  users[index].cloudImage!.url??"",
                  name: users[index].name??"",
                  role: users[index].role ??"",
                );
              } else if (index == itemsToShow && itemsToShow < users.length) {
                return _loadMoreButton(_loadMoreItemsOfUsers);
              }
              return null;
            },
          );
        }else if(state is BaseRequestErrorState){
          return Center(child: Text(state.message),);
        }else{
          return Center(child: LoadingWidget(),);
        }
      },
    );
  }


}




