import 'dart:io';

import 'package:fitness_app/src/fitness_module/add_data_controller/add_data_controller.dart';
import 'package:fitness_app/utills/AppColors.dart';
import 'package:fitness_app/utills/commonWidget.dart';
import 'package:fitness_app/utills/snackBar.dart';
import 'package:fitness_app/utills/textStyles.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

class DashBoardScreeen extends StatelessWidget {
  final ImagePicker _picker = ImagePicker();
  RxString imgPath = ''.obs;
  TextEditingController title = TextEditingController();

  RxBool isEdit = false.obs;
  RxInt selectedIndex = 0.obs;

  DashBoardScreeen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: const Text('FIT YOUR BODY'), backgroundColor: colorPrimary),
      body: Padding(
        padding: const EdgeInsets.only(top: 12.0, right: 12.0, left: 12.0),
        child: Column(
          children: [
            Row(
              children: [
                Expanded(
                  child: CommonButton(context, onPressed: () async {
                    imgPath.value = '';
                    title.clear();
                    isEdit.value = false;
                    commonPopUp(
                      context,
                      child: await createProgram(context),
                    );
                  }, name: 'Create Program'),
                ),
                const SizedBox(
                  width: 12,
                ),
                Expanded(
                  child: CommonButton(context, onPressed: () async {
                    imgPath.value = '';
                    title.clear();
                    isEdit.value = false;
                    commonPopUp(
                      context,
                      child: await createExercise(context),
                    );
                  }, name: 'Create Exercise'),
                )
              ],
            ),
            SizedBox(
              height: 10,
            ),
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Program List', style: color0E163s26w500),
                    SizedBox(
                      height: 10,
                    ),
                    StreamBuilder(
                        stream: AddDataController.to.programList.stream,
                        builder: (context, snapshot) {
                          return AddDataController.to.programList.isEmpty
                              ? const Padding(
                                  padding: EdgeInsets.symmetric(vertical: 20),
                                  child: Align(
                                    alignment: Alignment.center,
                                    child: Text('No Program List',
                                        style: color0E163s26w500),
                                  ),
                                )
                              : Column(
                                  children: List.generate(
                                    AddDataController.to.programList.length,
                                    (index) => Padding(
                                      padding: const EdgeInsets.symmetric(
                                          vertical: 10),
                                      child: Row(
                                        children: [
                                          Container(
                                            height: 100,
                                            width: 150,
                                            decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(10),
                                              image: DecorationImage(
                                                  image: FileImage(
                                                    File(
                                                      AddDataController
                                                              .to.programList[
                                                          index]['imgPath'],
                                                    ),
                                                  ),
                                                  fit: BoxFit.cover),
                                            ),
                                          ),
                                          SizedBox(
                                            width: 10,
                                          ),
                                          Expanded(
                                            child: Text(
                                              AddDataController.to
                                                  .programList[index]['name'],
                                              style: color000000s20w500,
                                            ),
                                          ),
                                          IconButton(
                                            onPressed: () async {
                                              selectedIndex.value = index;
                                              isEdit.value = true;
                                              imgPath.value = AddDataController
                                                      .to.programList[index]
                                                  ['imgPath'];
                                              title.text = AddDataController.to
                                                  .programList[index]['name'];

                                              commonPopUp(
                                                context,
                                                child: await createProgram(
                                                    context),
                                              );
                                            },
                                            icon: Icon(
                                              Icons.edit,
                                              color: colorPrimary,
                                            ),
                                          ),
                                          IconButton(
                                            onPressed: () {
                                              AddDataController.to.programList
                                                  .removeAt(index);
                                              showSnackBar(
                                                  title: 'SUCESS',
                                                  message:
                                                      'Deleted SuccessFully');
                                            },
                                            icon: Icon(
                                              Icons.delete,
                                              color: colorPrimary,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                );
                        }),
                    Divider(
                      color: colorPrimary,
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text('Exercise List', style: color0E163s26w500),
                    SizedBox(
                      height: 10,
                    ),
                    StreamBuilder(
                        stream: AddDataController.to.exerciseList.stream,
                        builder: (context, snapshot) {
                          return AddDataController.to.exerciseList.isEmpty
                              ? const Padding(
                                  padding: EdgeInsets.symmetric(vertical: 20),
                                  child: Align(
                                    alignment: Alignment.center,
                                    child: Text('No Exercise List',
                                        style: color0E163s26w500),
                                  ),
                                )
                              : Column(
                                  children: List.generate(
                                    AddDataController.to.exerciseList.length,
                                    (index) => Padding(
                                      padding: const EdgeInsets.symmetric(
                                          vertical: 10),
                                      child: Row(
                                        children: [
                                          Container(
                                            height: 100,
                                            width: 150,
                                            decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(10),
                                              image: DecorationImage(
                                                  image: FileImage(
                                                    File(
                                                      AddDataController
                                                              .to.exerciseList[
                                                          index]['imgPath'],
                                                    ),
                                                  ),
                                                  fit: BoxFit.cover),
                                            ),
                                          ),
                                          SizedBox(
                                            width: 10,
                                          ),
                                          Expanded(
                                            child: Text(
                                              AddDataController.to
                                                  .exerciseList[index]['name'],
                                              style: color000000s20w500,
                                            ),
                                          ),
                                          IconButton(
                                            onPressed: () async {
                                              selectedIndex.value = index;
                                              isEdit.value = true;
                                              imgPath.value = AddDataController
                                                      .to.exerciseList[index]
                                                  ['imgPath'];
                                              title.text = AddDataController.to
                                                  .exerciseList[index]['name'];

                                              commonPopUp(
                                                context,
                                                child: await createExercise(
                                                    context),
                                              );
                                            },
                                            icon: Icon(
                                              Icons.edit,
                                              color: colorPrimary,
                                            ),
                                          ),
                                          IconButton(
                                              onPressed: () {
                                                AddDataController
                                                    .to.exerciseList
                                                    .removeAt(index);
                                                showSnackBar(
                                                    title: 'SUCESS',
                                                    message:
                                                        'Deleted SuccessFully');
                                              },
                                              icon: Icon(
                                                Icons.delete,
                                                color: colorPrimary,
                                              )),
                                        ],
                                      ),
                                    ),
                                  ),
                                );
                        }),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  Future<Container> createExercise(BuildContext context) async {
    return Container(
      width: Get.width,
      decoration: BoxDecoration(
        color: colorffffff,
        borderRadius: BorderRadius.circular(10),
      ),
      padding: const EdgeInsets.all(10),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Opacity(
                opacity: 0,
                child: IconButton(
                  onPressed: () {},
                  icon: const Icon(
                    Icons.close,
                  ),
                ),
              ),
              const Text(
                'Create Exercise',
                style: color0E163s26w500,
              ),
              IconButton(
                onPressed: () {
                  Get.back();
                },
                icon: const Icon(
                  Icons.close,
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 10,
          ),
          InkWell(
            onTap: () async {
              try {
                final XFile? pickedFile = await _picker.pickImage(
                  source: ImageSource.gallery,
                );

                imgPath.value = pickedFile!.path;
              } catch (e) {
                showSnackBar(
                  title: 'ERROR',
                  message: e.toString(),
                );
              }
            },
            child: Obx(() {
              return Container(
                width: Get.width,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(color: color000000.withOpacity(0.5)),
                  image: imgPath.value != ''
                      ? DecorationImage(
                          image: FileImage(
                            File(imgPath.value),
                          ),
                          fit: BoxFit.cover)
                      : null,
                ),
                padding: const EdgeInsets.symmetric(vertical: 50),
                child: imgPath.value == ''
                    ? Center(
                        child: Text(
                          'Upload Image',
                          style: color0E163s26w500.copyWith(
                            color: color000000.withOpacity(0.5),
                          ),
                        ),
                      )
                    : null,
              );
            }),
          ),
          Obx(() {
            return imgPath.value != ''
                ? SizedBox()
                : Text(
                    'Please Select Image',
                    style: colorffffffs18w500.copyWith(
                        fontSize: 16, color: Colors.red),
                  );
          }),
          const SizedBox(
            height: 10,
          ),
          CommonTextFeild(hintText: 'Exercise Name', controller: title),
          Row(
            children: [
              Expanded(
                child: CommonButton(
                  context,
                  onPressed: () {
                    Get.back();
                  },
                  name: 'Cancel',
                  color: colorPrimary.withOpacity(0.5),
                ),
              ),
              SizedBox(
                width: 8,
              ),
              Expanded(
                child: CommonButton(
                  context,
                  onPressed: () {
                    if (imgPath.value != '' && title.text.isNotEmpty) {
                      Get.back();

                      if (isEdit.value) {
                        AddDataController.to.exerciseList[selectedIndex.value]
                            ['imgPath'] = imgPath.value;
                        AddDataController.to.exerciseList[selectedIndex.value]
                            ['name'] = title.text;
                      } else {
                        AddDataController.to.exerciseList.add(
                            {'imgPath': imgPath.value, 'name': title.text});
                      }
                      AddDataController.to.exerciseList.refresh();
                      imgPath.value = '';
                      title.clear();
                    } else {
                      showSnackBar(title: 'ERROR', message: 'Fill Form');
                    }
                  },
                  name: 'Save',
                ),
              ),
            ],
          )
        ],
      ),
    );
  }

  Future<Container> createProgram(BuildContext context) async {
    return Container(
      width: Get.width,
      decoration: BoxDecoration(
        color: colorffffff,
        borderRadius: BorderRadius.circular(10),
      ),
      padding: const EdgeInsets.all(10),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Opacity(
                opacity: 0,
                child: IconButton(
                  onPressed: () {},
                  icon: const Icon(
                    Icons.close,
                  ),
                ),
              ),
              const Text(
                'Create Program',
                style: color0E163s26w500,
              ),
              IconButton(
                onPressed: () {
                  Get.back();
                },
                icon: const Icon(
                  Icons.close,
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 10,
          ),
          InkWell(
            onTap: () async {
              try {
                final XFile? pickedFile = await _picker.pickImage(
                  source: ImageSource.gallery,
                );

                imgPath.value = pickedFile!.path;
              } catch (e) {
                showSnackBar(
                  title: 'ERROR',
                  message: e.toString(),
                );
              }
            },
            child: Obx(() {
              return Container(
                width: Get.width,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(color: color000000.withOpacity(0.5)),
                  image: imgPath.value != ''
                      ? DecorationImage(
                          image: FileImage(
                            File(imgPath.value),
                          ),
                          fit: BoxFit.cover)
                      : null,
                ),
                padding: const EdgeInsets.symmetric(vertical: 50),
                child: imgPath.value == ''
                    ? Center(
                        child: Text(
                          'Upload Image',
                          style: color0E163s26w500.copyWith(
                            color: color000000.withOpacity(0.5),
                          ),
                        ),
                      )
                    : null,
              );
            }),
          ),
          Obx(() {
            return imgPath.value != ''
                ? SizedBox()
                : Text(
                    'Please Select Image',
                    style: colorffffffs18w500.copyWith(
                        fontSize: 16, color: Colors.red),
                  );
          }),
          const SizedBox(
            height: 10,
          ),
          CommonTextFeild(hintText: 'Program Name', controller: title),
          Row(
            children: [
              Expanded(
                child: CommonButton(
                  context,
                  onPressed: () {
                    Get.back();
                  },
                  name: 'Cancel',
                  color: colorPrimary.withOpacity(0.5),
                ),
              ),
              SizedBox(
                width: 8,
              ),
              Expanded(
                child: CommonButton(
                  context,
                  onPressed: () {
                    if (imgPath.value != '' && title.text.isNotEmpty) {
                      Get.back();
                      if (isEdit.value) {
                        AddDataController.to.programList[selectedIndex.value]
                            ['imgPath'] = imgPath.value;
                        AddDataController.to.programList[selectedIndex.value]
                            ['name'] = title.text;
                      } else {
                        AddDataController.to.programList.add(
                            {'imgPath': imgPath.value, 'name': title.text});
                      }
                      AddDataController.to.programList.refresh();
                      imgPath.value = '';
                      title.clear();
                    } else {
                      showSnackBar(title: 'ERROR', message: 'Fill Form');
                    }
                  },
                  name: 'Save',
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
