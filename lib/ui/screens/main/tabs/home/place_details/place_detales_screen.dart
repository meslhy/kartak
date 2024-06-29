import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:graduation_project/data/model/responses/places_response/placeDetailsResponse.dart';
import 'package:graduation_project/data/model/responses/places_response/places_response.dart';
import 'package:graduation_project/domain/di/di.dart';
import 'package:graduation_project/ui/screens/auth/login/login_screen.dart';
import 'package:graduation_project/ui/screens/main/tabs/home/place_details/place_details_view_model.dart';
import 'package:graduation_project/ui/screens/main/tabs/home/place_details/widgets/head_line_text_widget.dart';
import 'package:graduation_project/ui/screens/payment/cash_payment/cash_payment_screen.dart';
import 'package:graduation_project/ui/screens/payment/payment_details/payment_details_screen.dart';
import 'package:graduation_project/ui/utils/app_colors.dart';
import 'package:graduation_project/ui/utils/base_request_states.dart';
import 'package:graduation_project/ui/utils/constants.dart';
import 'package:graduation_project/ui/utils/dialog_utils.dart';
import 'package:graduation_project/ui/widgets/error_view.dart';
import 'package:graduation_project/ui/widgets/loading_widget.dart';

class PlaceDetails extends StatefulWidget {
  String idOfPlace;
  static const String routeName = "PlaceDetails";


  PlaceDetails({
    super.key,
    required this.idOfPlace
  });

  @override
  _PlaceDetailsState createState() => _PlaceDetailsState();
}

class _PlaceDetailsState extends State<PlaceDetails> {

  PlaceDetailsViewModel viewModel = getIt();
  void _toggleExpand() {
    setState(() {
      viewModel.isExpanded = !viewModel.isExpanded;
    });
  }

  @override
  void initState() {
    print("PlaceeeeeeeeeeeeeeeeScreennnnnnnnnn");
    viewModel.getSpecificPlace(widget.idOfPlace);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final Color fixedColor = const Color.fromRGBO(227, 163, 22, 1);

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: fixedColor),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: BlocBuilder(
        bloc: viewModel.getSpecificPlacesUseCase,
        builder: (context, state) {
          print(state);
          if(state is BaseRequestSuccessState){
            PlaceDetailsData place = state.data;
            print(state.data.name);
            return SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Stack(
                      children: [
                        Column(
                          children: [
                            header(fixedColor , place.name??""),
                            discountBanner(fixedColor , place.owner??""),
                          ],
                        ),
                        Positioned(
                          left: 15,
                          top: 15,
                          child: CircleAvatar(
                            backgroundImage: NetworkImage(
                                place.cloudImage!.url??
                                    "https://media.istockphoto.com/id/1409329028/vector/no-picture-available-placeholder-thumbnail-icon-illustration-design.jpg?s=2048x2048&w=is&k=20&c=ohMtddTt7BppCvEUNGqJ9FRDyJqAdkzonVQ7KmWbTrg="
                            ),
                            radius: 75,
                          ),
                        ),
                      ],
                    ),
                    describtion(fixedColor , place.description ??""),
                    reviewsSection(fixedColor),
                    ratingSection(fixedColor,place.ratingQuantity??0),
                    reviewsCommentList(fixedColor,context),
                    locationSection(fixedColor),
                    ownerSection(fixedColor,place.owner??""),
                    applyDiscountButton(place.owner??""),
                  ],
                ),
              );
          }
          else if (state is BaseRequestErrorState){
            if(state.message =="jwt expired"){
              Navigator.pushNamed(context, LoginScreen.routeName);
            }
            return  ErrorView(message:state.message ?? Constants.defaultErrorMessage);
          }else{
            return Center(child: LoadingWidget(),);
          }

        },
      ),
    );
  }



  Widget header(Color fixedColor , String name) {
    return Container(
      padding: const EdgeInsets.only(left: 180, right: 5, bottom: 5),
      color: Colors.black,
      height: 80,
      child: Align(
        alignment: Alignment.bottomLeft,
        child: Text(
          name,
          style: TextStyle(
            color: fixedColor,
            fontSize: 24,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }

  Widget discountBanner(Color fixedColor , String discount) {
    return Container(
      height: 40,
      margin: const EdgeInsets.only(bottom: 60),
      padding: const EdgeInsets.only(right: 15),
      color: fixedColor,
      child: Align(
        alignment: Alignment.centerRight,
        child: Text(
          '$discount% Discount',
          textAlign: TextAlign.right,
          style: const TextStyle(
            color: Colors.red,
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }

  Widget describtion(Color fixedColor , String category) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          HeadlineTextWidget(
            text: category,
          ),
          Container(
            margin: const EdgeInsets.only(left: 10),
            child: _buildDescription(category),
          ),
        ],
      ),
    );
  }

  Widget reviewsSection(Color fixedColor) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: const Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          HeadlineTextWidget(
            text: 'Rating and reviews',
          ),
        ],
      ),
    );
  }

  Widget ratingSection(Color fixedColor , int rating) {

    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
         Text(
          "$rating"??"",
          style: const TextStyle(
            fontSize: 40,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(width: 20),
        Column(
          children: [
            RatingBar.builder(
              initialRating: rating.toDouble(),
              minRating: 1,
              direction: Axis.horizontal,
              allowHalfRating: true,
              itemCount: 5,
              itemSize: 35,
              itemPadding: const EdgeInsets.symmetric(horizontal: 4.0),
              itemBuilder: (context, _) => Icon(
                Icons.star,
                color: fixedColor,
              ),
              onRatingUpdate: (rating) {},
            ),
            const Text(
              'Total Rates: 34,931',
              style: TextStyle(fontSize: 10),
            ),
          ],
        ),
      ],
    );
  }

  Widget reviewsCommentList(Color fixedColor , BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: fixedColor.withOpacity(0.03),
        borderRadius: BorderRadius.circular(10),
      ),
      padding: const EdgeInsets.all(10),
      margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 15),
      child: Column(
        children: [
          _buildReviewItem(),
          _buildReviewItem(),
          InkWell(
            onTap: (){
             showModalBottomSheet(
                 context: context,
                 isScrollControlled: true,
                 builder:(context) {
                  return SizedBox(
                    width: double.infinity,
                    height: MediaQuery.of(context).size.height * 0.6,
                    child: Padding(
                      padding:  EdgeInsets.only(top: 10.0 , bottom: MediaQuery.of(context).viewInsets.bottom),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Expanded(
                            child: ListView.builder(
                                itemBuilder:(context, index) => _buildReviewItem(),
                              itemCount: 5,
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left:  14.0,right: 14,bottom: 20,top: 10),
                            child: BlocConsumer(
                              bloc: viewModel.createCommentAndRateUseCase,
                              listener: (context, state) {
                                if(state is BaseRequestLoadingState)
                                {
                                  showLoading(context);
                                }else if (state is BaseRequestSuccessState){
                                  print("donnnnnnnne");
                                }else if (state is BaseRequestErrorState){
                                  Navigator.pop(context);
                                  showErrorDialog(context, state.message);
                                }
                              },
                              builder: (context, state){
                                return Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Expanded(
                                      child: SizedBox(
                                        height: 50,
                                        child: TextFormField(
                                          scrollPadding: const EdgeInsets.only(bottom: 50),
                                          controller: viewModel.commentController,
                                          decoration: InputDecoration(
                                            border: OutlineInputBorder(
                                              borderRadius: BorderRadius.circular(14)
                                            ),
                                            hintText: "Comment"
                                          ),
                                        ),
                                      ),
                                    ),
                                    SizedBox(
                                      width:50,
                                      height: 50,
                                      child: TextFormField(
                                        scrollPadding: const EdgeInsets.only(bottom: 50),
                                        controller: viewModel.rateController,
                                        decoration: InputDecoration(
                                          border: OutlineInputBorder(
                                            borderRadius: BorderRadius.circular(14)
                                          ),
                                          hintText: "1:5"
                                        ),
                                      ),
                                    ),
                                    IconButton(
                                        onPressed: (){
                                          viewModel.createCommentAndRate(widget.idOfPlace);
                                          viewModel.commentController.clear();
                                          viewModel.rateController.clear();
                                          Navigator.pop(context);
                                          setState(() {});
                                        },
                                        icon: const Icon(Icons.add),
                                    ),
                                  ],
                                );
                              }
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
            child: Container(
              width: 150,
              height: 45,
              alignment: AlignmentDirectional.center,
              decoration: BoxDecoration(
                color: AppColors.black,
                borderRadius:  BorderRadius.circular(14),
              ),
              child: const Text("Comment",style: TextStyle(color: AppColors.white,fontWeight: FontWeight.bold,fontSize: 22),),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildReviewItem() {
    return  Align(
      alignment: Alignment.centerLeft,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 8.0),
        child: Container(
          margin: const EdgeInsets.symmetric(horizontal: 14),
         padding: const EdgeInsets.all(5),
          decoration: BoxDecoration(
              color: Colors.grey[100],
            borderRadius: BorderRadius.circular(14)
          ),
          child: const Row(
            children: [
              CircleAvatar(
                backgroundImage: NetworkImage(
                    'https://qph.cf2.quoracdn.net/main-qimg-31cce1e286ed4fbbf03e40b8993f294a-lq'), // Rep// lace with actual user image
                radius: 22,
              ),
              SizedBox(width: 10),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Yasin Badr',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                      ),
                    ),
                    Text(
                      'Wonderful place, I had a great time there',
                      style: TextStyle(fontSize: 12),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget locationSection(Color fixedColor) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child:    const Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          HeadlineTextWidget(
            text: 'Location',
          ),


        ],
      ),
    );
  }

  Widget ownerSection(Color fixedColor , String owner) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          const HeadlineTextWidget(
            text: 'Owned by',
          ),
          Container(
            margin: const EdgeInsets.only(left: 100),
            child: Text(
              capitalizeFirstLetters(owner),
              style: const TextStyle(fontSize: 16),
            ),
          ),
        ],
      ),
    );
  }


  Widget applyDiscountButton(String owner) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 40, vertical: 10),
      child: InkWell(
        onTap: () {
          // Show payment method selection dialog
          showDialog(
            context: context,
            builder: (BuildContext context) {
              return AlertDialog(
                title: const Text(
                  'Choose Payment Method',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
                ),
                content: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(bottom: 20.0),
                      child: ElevatedButton.icon(
                        onPressed: () {
                          Navigator.of(context).pop();
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const PaymentDetails(),
                            ),
                          );
                        },
                        icon: const Icon(
                          Icons.credit_card,
                          color: Color.fromRGBO(227, 163, 22, 1),
                        ), // Card icon
                        label: const Text('Card Payment',
                            style: TextStyle(
                                color: Color.fromRGBO(227, 163, 22, 1))),
                        style: ElevatedButton.styleFrom(
                          backgroundColor: const Color.fromARGB(
                              255, 0, 0, 0), // Background color
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(bottom: 20.0),
                      child: ElevatedButton.icon(
                        onPressed: () {
                          Navigator.of(context).pop();
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) =>  CashPaymentPage(owner:owner ),
                            ),
                          );
                        },
                        icon: const Icon(
                          Icons.attach_money,
                          color: Color.fromRGBO(227, 163, 22, 1),
                        ), // Card icon
                        label: const Text('Cash Payment',
                            style: TextStyle(
                                color: Color.fromRGBO(227, 163, 22, 1))),
                        style: ElevatedButton.styleFrom(
                          backgroundColor: const Color.fromARGB(
                              255, 0, 0, 0), // Background color
                        ),
                      ),
                    ),
                  ],
                ),
              );
            },
          );
        },
        child: Container(
          width: 200,
          height: 45,
          alignment: AlignmentDirectional.center,
          decoration: BoxDecoration(
            color: AppColors.black,
            borderRadius: BorderRadius.circular(14),
          ),
          child: const Text(
            'Apply Discount',
            style: TextStyle(color: Colors.white,fontSize: 22,fontWeight: FontWeight.bold),
          ),
        ),
      ),
    );
  }

  Widget _buildDescription(String description) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          description,
          style: const TextStyle(fontSize: 14),
          maxLines: viewModel.isExpanded ? null : 3,
          overflow: viewModel.isExpanded ? TextOverflow.visible : TextOverflow.ellipsis,
        ),
        Row(
          children: [
            GestureDetector(
              onTap: _toggleExpand,
              child: Text(
                viewModel.isExpanded ? "less" : "more",
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

  String capitalizeFirstLetters(String value) {
    if (value.isEmpty) return value;
    return value
        .split(' ')
        .map((word) => word.isNotEmpty
        ? '${word[0].toUpperCase()}${word.substring(1)}'
        : word)
        .join(' ');
  }
}
