import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:graduation_project/domain/di/di.dart';
import 'package:graduation_project/ui/screens/main/tabs/home/place_details/place_details_view_model.dart';
import 'package:graduation_project/ui/screens/main/tabs/home/place_details/widgets/head_line_text_widget.dart';
import 'package:graduation_project/ui/screens/payment/cash_payment/cash_payment_screen.dart';
import 'package:graduation_project/ui/screens/payment/payment_details/payment_details_screen.dart';
import 'package:graduation_project/ui/utils/base_request_states.dart';
import 'package:graduation_project/ui/utils/constants.dart';
import 'package:graduation_project/ui/widgets/error_view.dart';

class PlaceDetails extends StatefulWidget {
  String idOfPlace;
  static const String routeName = "PlaceDetails";
  final String name;
  final String category;
  final String description;
  final String owner;
  final int discount;
  final String imageUrl;
  final double rating;

  PlaceDetails({
    required this.name,
    required this.category,
    required this.description,
    required this.owner,
    required this.imageUrl,
    required this.discount,
    required this.rating,
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
    viewModel.getSpecificPlace(widget.idOfPlace);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final Color fixedColor = const Color.fromRGBO(227, 163, 22, 1);

    return BlocBuilder(
      bloc: viewModel.useCase,
      builder: (context, state) {
        if(state is BaseRequestSuccessState){
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
            body: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Stack(
                    children: [
                      Column(
                        children: [
                          header(fixedColor),
                          discountBanner(fixedColor),
                        ],
                      ),
                      Positioned(
                        left: 15,
                        top: 15,
                        child: CircleAvatar(
                          backgroundImage: NetworkImage(widget.imageUrl),
                          radius: 75,
                        ),
                      ),
                    ],
                  ),
                  describtion(fixedColor),
                  reviewsSection(fixedColor),
                  ratingSection(fixedColor),
                  reviewsCommentList(fixedColor),
                  locationSection(fixedColor),
                  ownerSection(fixedColor),
                  applyDiscountButton(),
                ],
              ),
            ),
          );
        }else if (state is BaseRequestErrorState){
          return  ErrorView(message:state.message ?? Constants.defaultErrorMessage);
        }
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
          body: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Stack(
                  children: [
                    Column(
                      children: [
                        header(fixedColor),
                        discountBanner(fixedColor),
                      ],
                    ),
                    Positioned(
                      left: 15,
                      top: 15,
                      child: CircleAvatar(
                        backgroundImage: NetworkImage(widget.imageUrl),
                        radius: 75,
                      ),
                    ),
                  ],
                ),
                describtion(fixedColor),
                reviewsSection(fixedColor),
                ratingSection(fixedColor),
                reviewsCommentList(fixedColor),
                locationSection(fixedColor),
                ownerSection(fixedColor),
                applyDiscountButton(),
              ],
            ),
          ),
        );
      },
    );
  }



  Widget header(Color fixedColor) {
    return Container(
      padding: const EdgeInsets.only(left: 180, right: 5, bottom: 5),
      color: Colors.black,
      height: 80,
      child: Align(
        alignment: Alignment.bottomLeft,
        child: Text(
          widget.name,
          style: TextStyle(
            color: fixedColor,
            fontSize: 24,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }

  Widget discountBanner(Color fixedColor) {
    return Container(
      height: 40,
      margin: const EdgeInsets.only(bottom: 60),
      padding: const EdgeInsets.only(right: 15),
      color: fixedColor,
      child: Align(
        alignment: Alignment.centerRight,
        child: Text(
          '${widget.discount}% Discount',
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

  Widget describtion(Color fixedColor) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          HeadlineTextWidget(
            text: widget.category,
          ),
          Container(
            margin: const EdgeInsets.only(left: 10),
            child: _buildDescription(),
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

  Widget ratingSection(Color fixedColor) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Text(
          '4.5',
          style: TextStyle(
            fontSize: 40,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(width: 20),
        Column(
          children: [
            RatingBar.builder(
              initialRating: widget.rating,
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

  Widget reviewsCommentList(Color fixedColor) {
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
          Align(
            alignment: Alignment.centerRight,
            child: TextButton(
              onPressed: () {},
              child: Text(
                'Read More →',
                style: TextStyle(color: fixedColor),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildReviewItem() {
    return const Align(
      alignment: Alignment.centerLeft,
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: 8.0),
        child: Row(
          children: [
            CircleAvatar(
              backgroundImage: NetworkImage(
                  'https://qph.cf2.quoracdn.net/main-qimg-31cce1e286ed4fbbf03e40b8993f294a-lq'), // Replace with actual user image
              radius: 25,
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
    );
  }

  Widget locationSection(Color fixedColor) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child:  Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          HeadlineTextWidget(
            text: 'Location',
          ),
          SizedBox(height: 120),
        ],
      ),
    );
  }

  Widget ownerSection(Color fixedColor) {
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
              capitalizeFirstLetters(widget.owner),
              style: const TextStyle(fontSize: 16),
            ),
          ),
        ],
      ),
    );
  }

  Widget applyDiscountButton() {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 40, vertical: 10),
      child: ElevatedButton(
        onPressed: () {
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
                              builder: (context) => PaymentDetails(),
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
                    ElevatedButton.icon(
                      onPressed: () {
                        Navigator.of(context).pop();
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => CashPaymentPage(),
                          ),
                        );
                      },
                      icon: const Icon(
                        Icons.attach_money,
                        color: Color.fromRGBO(227, 163, 22, 1),
                      ), // Cash icon
                      label: const Text('Cash Payment',
                          style: TextStyle(
                              color: Color.fromRGBO(227, 163, 22, 1))),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color.fromARGB(
                            255, 0, 0, 0), // Background color
                      ),
                    ),
                  ],
                ),
              );
            },
          );
        },
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.black,
        ),
        child: const Text(
          'Apply Discount',
          style: TextStyle(color: Colors.white),
        ),
      ),
    );
  }

  Widget _buildDescription() {
    final description = widget.description;
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
