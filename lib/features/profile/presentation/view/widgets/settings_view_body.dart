import 'package:book_app/core/utils/app_style.dart';
import 'package:book_app/core/utils/constants.dart';
import 'package:book_app/core/utils/assets.dart';
import 'package:book_app/core/utils/profile_model.dart';
import 'package:book_app/features/profile/presentation/manager/cubit/profile_cubit.dart';
import 'package:book_app/features/profile/presentation/view/widgets/custom_profile_list_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProfileViewBody extends StatelessWidget {
  const ProfileViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(height: MediaQuery.of(context).size.height * .01),
        Visibility(
          visible: false,
          child: Text(
            'please login  to have unlimited access',
            style: AppStyle.f16UrbanistMeduim,
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: Row(
            children: [
              CircleAvatar(
                radius: 30,
                backgroundColor: Theme.of(context).colorScheme.surface,
                child: CircleAvatar(
                  radius: 28,
                  backgroundColor: Theme.of(context).cardColor,
                  backgroundImage: const NetworkImage(
                    'https://img.freepik.com/free-photo/young-bearded-man-with-striped-shirt_273609-5677.jpg?w=900&t=st=1697276951~exp=1697277551~hmac=5aea6edd8bd852ee6b8efb094c18894341ee58e4641b80f0e3e1d982289dabf9',
                  ),
                ),
              ),
              SizedBox(width: MediaQuery.of(context).size.width * .05),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Ahmed Adel', style: AppStyle.f20UrbanistSemibold),

                  Text('ahmed@gmail.com', style: AppStyle.f16UrbanistMeduim),
                ],
              ),
            ],
          ),
        ),
        SizedBox(height: MediaQuery.of(context).size.height * .03),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 13),
          child: Text('General', style: AppStyle.f20UrbanistBold),
        ),
        SizedBox(height: MediaQuery.of(context).size.height * .01),
        SizedBox(
          height: MediaQuery.of(context).size.height * .32,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25),
            child: ListView.builder(
              physics: const NeverScrollableScrollPhysics(),
              itemCount: Constant.items.length,
              itemBuilder: (context, index) => CustomProfileListViewItem(
                profileModel: Constant.items[index],
                onPressed: () {},
              ),
            ),
          ),
        ),
        const Padding(
          padding: EdgeInsets.symmetric(horizontal: 13),
          child: Divider(thickness: .5, color: Colors.grey),
        ),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 13),
          child: Text('Settings', style: AppStyle.f20UrbanistBold),
        ),

        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15),
          child: BlocBuilder<ProfileCubit, ProfileState>(
            builder: (context, state) {
              var cubit = BlocProvider.of<ProfileCubit>(context);
              return SwitchListTile(
                value: cubit.darktheme,
                title: Row(
                  children: [
                    const CircleAvatar(
                      radius: 16,
                      backgroundImage: AssetImage(Assets.imagesProfileTheme),
                    ),
                    SizedBox(width: MediaQuery.of(context).size.width * .05),
                    Text(
                      cubit.darktheme ? 'Dark mode' : 'Light mode',
                      style: const TextStyle(fontWeight: FontWeight.w900),
                    ),
                  ],
                ),
                onChanged: (bool value) {
                  cubit.setThem(value);
                },
              );
            },
          ),
        ),
        const Padding(
          padding: EdgeInsets.symmetric(horizontal: 13),
          child: Divider(thickness: .5, color: Colors.grey),
        ),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 13),
          child: Text('Others', style: AppStyle.f20UrbanistBold),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 30),
          child: CustomProfileListViewItem(
            profileModel: ProfileModel(
              image: Assets.imagesProfilePrivacy,
              title: 'Privacy & Policy',
            ),
          ),
        ),
      ],
    );
  }
}
