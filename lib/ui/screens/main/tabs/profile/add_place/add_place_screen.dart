
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:graduation_project/domain/di/di.dart';
import 'package:graduation_project/ui/screens/main/tabs/profile/add_place/add_place_view_model.dart';
import 'package:graduation_project/ui/screens/payment/widgets/TFF_payment.dart';
import 'package:graduation_project/ui/utils/app_assets.dart';
import 'package:graduation_project/ui/utils/app_colors.dart';

class AddPlaceScreen extends StatefulWidget {
  static const routeName = "AddPlaceScreen";
  const AddPlaceScreen({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _AddPlaceScreenState createState() => _AddPlaceScreenState();
}

class _AddPlaceScreenState extends State<AddPlaceScreen> {
  AddPlaceViewModel viewModel = getIt();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: const EdgeInsets.symmetric(vertical: 60, horizontal: 30),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            BlocBuilder(
              bloc: viewModel,
              builder: (context, state) {
                if(viewModel.isImageSelected) {
                  return Stack(
                    alignment: AlignmentDirectional.center,
                    children: [
                      Container(
                        width: 200,
                        height: 200,
                        decoration: BoxDecoration(
                            image:DecorationImage(
                                image:FileImage(viewModel.placeImage!)
                            ),
                            borderRadius: const BorderRadius.all(Radius.circular(22))
                        ),
                      ),
                      FloatingActionButton(
                        backgroundColor: AppColors.black,
                        onPressed: (){
                          viewModel.getImage();

                        },
                        child: const Icon(Icons.camera_alt_outlined),
                      ),
                    ],
                  );
                }else{
                  return Stack(
                    alignment: AlignmentDirectional.center,
                    children: [
                        Container(
                          width: 200,
                          height: 200,
                        decoration: const BoxDecoration(
                          image:DecorationImage(
                              image: AssetImage(AppAssets.unknown)
                          ),
                          borderRadius: BorderRadius.all(Radius.circular(22))
                        ),
                      ),
                      FloatingActionButton(
                        backgroundColor: AppColors.black,
                        onPressed: (){
                          viewModel.getImage();

                        },
                        child: const Icon(Icons.camera_alt_outlined),
                      ),
                    ],
                  );
                }
              },
            ),
            const SizedBox(height: 10,),
            buildTextField(
              labelText: 'Place Name',
              controller: viewModel.nameController,
              fun: (text){}
            ),
            buildTextField(
              labelText: 'Description',
              controller:viewModel.descriptionController ,
              fun: (text){}
            ),
            buildTextField(
              labelText: 'Discount',
               controller: viewModel.discountController,
              fun: (text){}
            ),
            buildTextField(
              labelText: 'Category',
               controller: viewModel.categoryController,
              fun: (text){}
            ),
            buildTextField(
              labelText: 'Owner',
               controller: viewModel.ownerController,
              fun: (text){}
            ),
            buildTextField(
              labelText: 'Code',
               controller: viewModel.codeController,
              fun: (text){}
            ),
            Container(
              margin: const EdgeInsets.all(40),
              child: ElevatedButton(
                onPressed: () {
                  viewModel.addPlace();
                },
                style: ElevatedButton.styleFrom(
                  padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 70),
                  backgroundColor: Colors.black,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                ),
                child: const Text(
                  'Add Place',
                  style: TextStyle(
                    color: Color.fromRGBO(227, 163, 22, 1),
                    fontSize: 16,
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
