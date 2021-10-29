import 'package:english_card/values/app_assets.dart';
import 'package:english_card/values/app_colors.dart';
import 'package:english_card/values/app_styles.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _curentIndex = 0;
  late PageController _pageController;

  @override
  void initState() {
    _pageController = PageController(viewportFraction: 0.5);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: AppColor.secondColor,
      appBar: AppBar(
        backgroundColor: AppColor.secondColor,
        elevation: 0,
        title: Text(
          'English today',
          style: AppStyles.h3.copyWith(color: AppColor.textColor, fontSize: 36),
        ),
        leading: InkWell(
          onTap: () {},
          child: Image.asset(AppAssets.menu),
        ),
      ),
      body: Container(
        width: double.infinity,
        margin: const EdgeInsets.symmetric(horizontal: 24),
        child: Column(
          children: <Widget>[
            Container(
              height: size.height * 1 / 10,
              alignment: Alignment.centerLeft,
              child: Text(
                'It is amazing how complete is the delusion that beauty is godness.',
                style: AppStyles.h5
                    .copyWith(color: AppColor.greyText, fontSize: 12),
              ),
            ),
            Container(
              height: size.height * 2 / 3,
              child: PageView.builder(
                  controller: _pageController,
                  onPageChanged: (index) {
                    setState(() {
                      _curentIndex = index;
                    });
                  },
                  itemCount: 5,
                  itemBuilder: (context, index) {
                    return Container(
                      margin: const EdgeInsets.symmetric(horizontal: 16),
                      decoration: const BoxDecoration(
                          color: AppColor.primaryColor,
                          borderRadius:
                              BorderRadius.all(Radius.circular((24)))),
                      child: Column(
                        // crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Container(
                            alignment: Alignment.centerRight,
                            child: Container(
                                margin: const EdgeInsets.symmetric(
                                    horizontal: 10, vertical: 10),
                                child: Image.asset(AppAssets.heart)),
                          ),
                          RichText(
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            text: const TextSpan(
                                text: 'B',
                                style: TextStyle(
                                    fontFamily: FontFamily.sen,
                                    fontSize: 89,
                                    fontWeight: FontWeight.bold,
                                    shadows: [
                                      BoxShadow(
                                          color: Colors.black38,
                                          offset: Offset(3, 6),
                                          blurRadius: 6)
                                    ]),
                                children: [
                                  TextSpan(
                                      text: 'eautiful',
                                      style: TextStyle(
                                          fontFamily: FontFamily.sen,
                                          fontSize: 56,
                                          fontWeight: FontWeight.bold,
                                          shadows: [
                                            BoxShadow(
                                                color: Colors.black38,
                                                offset: Offset(3, 6),
                                                blurRadius: 6)
                                          ]))
                                ]),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 24, vertical: 10),
                            child: Text(
                              '"Think of all the beauty still left around you and be happy."',
                              style: AppStyles.h4.copyWith(letterSpacing: 1),
                            ),
                          ),
                        ],
                      ),
                    );
                  }),
            ),
            Container(
              height: 12,
              alignment: Alignment.center,
              margin: const EdgeInsets.symmetric(vertical: 12),
              child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: 5,
                  physics: const NeverScrollableScrollPhysics(),
                  itemBuilder: (context, index) {
                    return buildIndicator(index == _curentIndex, size);
                  }),
            )
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: AppColor.primaryColor,
        onPressed: () {},
        child: Image.asset(AppAssets.exchange),
      ),
    );
  }

  Widget buildIndicator(bool isActive, Size size) {
    return Container(
      height: 8,
      margin: const EdgeInsets.symmetric(horizontal: 16),
      width: isActive ? size.width * 1 / 5 : 24,
      decoration: BoxDecoration(
          color: isActive ? AppColor.lightBlue : AppColor.lightGrey,
          borderRadius: const BorderRadius.all(Radius.circular(12)),
          boxShadow: const [
            BoxShadow(color: Colors.black38, offset: Offset(2, 3))
          ]),
    );
  }
}
