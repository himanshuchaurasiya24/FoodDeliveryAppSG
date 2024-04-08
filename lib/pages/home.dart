import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:food_delivery_app_sg/models/food_details.dart';
import 'package:food_delivery_app_sg/pages/details.dart';
import 'package:food_delivery_app_sg/utils/constants.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final List<String> foodCatList = [
    'assets/ice-cream.png',
    'assets/pizza.png',
    'assets/salad.png',
    'assets/burger.png',
  ];
  final List<FoodDetails> foodDetails = [
    FoodDetails(
      assets: 'assets/salad2.png',
      food: 'Veggie Toco Hash',
      desc: 'Fresh and Healthy',
      price: 25,
    ),
    FoodDetails(
      assets: 'assets/salad3.png',
      food: 'Mix Veg Salad',
      desc: 'Spicey with Onion',
      price: 28,
    ),
  ];
  int currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Hello Himanshu,',
        ),
        foregroundColor: Colors.transparent,
        forceMaterialTransparency: true,
        centerTitle: true,
        actions: [
          IconButton(
            onPressed: () {},
            icon: Container(
              padding: const EdgeInsets.all(5),
              decoration: BoxDecoration(
                color: Colors.black,
                borderRadius: BorderRadius.circular(
                  5,
                ),
              ),
              child: const Icon(
                Icons.shopping_cart_checkout_outlined,
                color: Colors.white,
              ),
            ),
          )
        ],
      ),
      body: Padding(
        padding: EdgeInsets.all(defaultGap),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                'Delicious Food',
                style: Theme.of(context).textTheme.titleLarge,
              ),
              SizedBox(
                height: defaultGap,
              ),
              Text(
                'Discover and get Great Food',
                style: Theme.of(context).textTheme.displayMedium,
              ),
              SizedBox(
                height: defaultGap,
              ),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: List.generate(
                    foodCatList.length,
                    (index) => Padding(
                      padding: const EdgeInsets.only(
                        right: 30,
                      ),
                      child: CustomFoodTypeWidget(
                        imagePath: foodCatList[index],
                        color:
                            currentIndex == index ? Colors.black : Colors.white,
                        imageColor:
                            currentIndex == index ? Colors.white : Colors.black,
                        onTap: () {
                          setState(() {
                            currentIndex = index;
                          });
                        },
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: defaultGap * 2,
              ),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: List.generate(
                    foodDetails.length,
                    (index) => Padding(
                      padding: EdgeInsets.only(
                        right: defaultGap,
                      ),
                      child: CustomFoodContainer(
                        foodDetails: foodDetails[index],
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) {
                                return const Details();
                              },
                            ),
                          );
                        },
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: defaultGap * 2,
              ),
              Material(
                elevation: 10,
                borderRadius: BorderRadius.circular(
                  defaultGap * 2,
                ),
                child: Padding(
                  padding: EdgeInsets.all(
                    defaultGap,
                  ),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      CircleAvatar(
                        radius: 80,
                        backgroundColor: Colors.black,
                        foregroundImage: Image.asset(
                          'assets/salad3.png',
                        ).image,
                      ),
                      SizedBox(
                        width: defaultGap * 2,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Mediterranean Chickpea Salad',
                            style: Theme.of(context)
                                .textTheme
                                .titleMedium!
                                .copyWith(
                                  fontSize: 35,
                                ),
                          ),
                          SizedBox(
                            height: defaultGap / 2,
                          ),
                          Text(
                            'Honey goot chees',
                            style: Theme.of(context)
                                .textTheme
                                .displayMedium!
                                .copyWith(
                                  fontSize: 30,
                                ),
                          ),
                          SizedBox(
                            height: defaultGap / 2,
                          ),
                          Text(
                            '\$28',
                            style: Theme.of(context)
                                .textTheme
                                .titleMedium!
                                .copyWith(
                                  fontSize: 30,
                                ),
                          ),
                        ],
                      )
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

class CustomFoodContainer extends StatelessWidget {
  const CustomFoodContainer({
    super.key,
    required this.foodDetails,
    required this.onTap,
  });
  final FoodDetails foodDetails;
  final VoidCallback onTap;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Material(
        elevation: 10,
        borderRadius: BorderRadius.circular(
          defaultGap * 2,
        ),
        child: Container(
          padding: EdgeInsets.all(defaultGap),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CircleAvatar(
                radius: 100,
                backgroundColor: Colors.black,
                foregroundImage: Image.asset(
                  foodDetails.assets,
                ).image,
              ),
              SizedBox(
                height: defaultGap,
              ),
              Text(
                foodDetails.food,
                style: Theme.of(context).textTheme.titleMedium,
              ),
              Text(
                foodDetails.desc,
                style: Theme.of(context).textTheme.displayMedium,
              ),
              Text(
                '\$${foodDetails.price}',
                style: Theme.of(context).textTheme.titleMedium,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class CustomFoodTypeWidget extends StatelessWidget {
  const CustomFoodTypeWidget({
    super.key,
    required this.imagePath,
    required this.onTap,
    required this.color,
    required this.imageColor,
  });
  final String imagePath;
  final VoidCallback onTap;
  final Color color;
  final Color imageColor;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Material(
        elevation: 5,
        borderRadius: BorderRadius.circular(
          defaultGap * 1.5,
        ),
        color: color,
        child: Container(
          padding: EdgeInsets.all(
            defaultGap,
          ),
          child: Image.asset(
            imagePath,
            height: 50,
            width: 50,
            fit: BoxFit.fill,
            color: imageColor,
          ),
        ),
      ),
    );
  }
}
