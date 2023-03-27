import 'package:get/get.dart';
import 'package:marvel/app/home/view/search_page.dart';
import 'package:marvel/core/exports.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    var list = [
      "assets/dummy-banner01@2x.jpg",
      "assets/dummy-banner02@2x.jpg",
      "assets/dummy-banner03@2x.jpg",
      "assets/dummy-banner04@2x.jpg",
    ];
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).primaryColor,
        elevation: 0,
        automaticallyImplyLeading: false,
        title: Text(
          Strings.appName,
          style: Theme.of(context).textTheme.displayLarge,
        ),
        centerTitle: true,
      ),
      body: Column(
        children: [
          InkWell(
            onTap: () => Get.to(SearchPage()),
            child: Container(
              width: 100.w,
              padding: EdgeInsets.symmetric(horizontal: 4.w, vertical: 3.w),
              decoration: BoxDecoration(
                color: Theme.of(context).primaryColor,
              ),
              child: Container(
                width: 100.w,
                height: 6.h,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(2),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SvgPicture.asset(
                      "assets/icon/search.svg",
                      width: 24,
                      height: 24,
                    ),
                    SizedBox(width: 8.sp),
                    Text(
                      "Search for product or shop name",
                      style: Theme.of(context).textTheme.labelMedium!.copyWith(color: Theme.of(context).hintColor),
                    ),
                  ],
                ),
              ),
            ),
          ),
          Expanded(
            child: ListView.separated(
              padding: EdgeInsets.all(4.w),
              itemCount: list.length,
              itemBuilder: (context, index) => Image.asset(list[index]),
              separatorBuilder: (context, index) => SizedBox(height: 10.sp),
            ),
          )
        ],
      ),
    );
  }
}
