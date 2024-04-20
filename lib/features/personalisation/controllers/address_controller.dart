import 'package:flutter/material.dart';
import 'package:food/common/widgets/icons/t_circular_icon.dart';
import 'package:food/common/widgets/loaders/circular_loader.dart';
import 'package:food/data/repositories/address/address_repo.dart';
import 'package:food/features/authentication/controllers/signup/network_manager.dart';
import 'package:food/features/personalisation/screens/address/widgets/addressmodel.dart';
import 'package:food/utils/constants/image_strings.dart';
import 'package:food/utils/popups/full_screen_loader.dart';
import 'package:food/utils/popups/loaders.dart';
import 'package:get/get.dart';

class AddressController extends GetxController {
  static AddressController get instance => Get.find();

  final name = TextEditingController();
  final phoneNumber = TextEditingController();
  final street = TextEditingController();
  final postalCode = TextEditingController();
  final city = TextEditingController();
  final state = TextEditingController();
  final country = TextEditingController();
  GlobalKey<FormState> addressFormKey = GlobalKey<FormState>();

RxBool refreshData = true.obs;
  final Rx<AddressModel> selectedAddress = AddressModel.empty().obs;
final addressRepository = Get.put(AddressRepository());
  // Fetch all user specific address
  Future<List<AddressModel>> getallUserAddress() async {
    try {
      final addresses = await addressRepository.fetchUserAddresses();
      selectedAddress.value = addresses.firstWhere(
          (element) => element.selectedAddress,
          orElse: () => AddressModel.empty());
      return addresses;
    } catch (e) {
      TLoaders.errorSnackBar(title: 'Address not found', message: e.toString());
      return [];
    }
  }

  Future selectAddress(AddressModel newSelectedAddress) async {
    try {
      Get.defaultDialog(
        title: '',
        onWillPop: () async {return false;},
        barrierDismissible: false,
        backgroundColor: Colors.transparent,
        content: const TCircularLoader(),
      );
      // Clear the selected field
      if (selectedAddress.value.id.isNotEmpty) {
        await addressRepository.updateSelectedField(
            selectedAddress.value.id, false);
      }

      // Assign selected field
      newSelectedAddress.selectedAddress = true;
      selectedAddress.value = newSelectedAddress;

      // Set the selected field to true for the newly selected address
      await addressRepository.updateSelectedField(
          selectedAddress.value.id, true);

          Get.back();
    } catch (e) {
      TLoaders.errorSnackBar(
          title: 'Error in selection', message: e.toString());
    }
  }


  //Add new address
  Future addNewAddresses() async{
    try{
      //start loading
      TFullScreenLoader.openLoadingDialog('Storing Address', TImages.daceranimation);

      //netwrok
      final isConnected = await NetworkManager.instance.isConnected();
      if(!isConnected){
        TFullScreenLoader.stopLoading();
        return;
      }

      //Form Validation
      if(!addressFormKey.currentState!.validate()){
        TFullScreenLoader.stopLoading();
        return;
      }
//save address
         final address = AddressModel(
          id: '',
          name: name.text.trim(),
           phonenumber: phoneNumber.text.trim(),
            street: street.text.trim(), 
            city: city.text.trim(),
             state: state.text.trim(), 
             postalCode: postalCode.text.trim(),
              country: country.text.trim(),
              selectedAddress: true, 
              );
      final id = await addressRepository.addAddress(address);

      //Update
      address.id = id;
      await selectedAddress(address);

      //Remove
      TFullScreenLoader.stopLoading();

      //success message
      TLoaders.successSnackBar(title: 'Congratulations',message: 'Your address has been saved successfully.');

      //Refresh Addresses
      refreshData.toggle();

      //Reset
      reserFormFields();

      //Redirect
      Navigator.of(Get.context!).pop();
      }catch(e){
        //Remove
        TFullScreenLoader.stopLoading();
        TLoaders.errorSnackBar(title: 'Address not found',message: e.toString());
      }
    }

    //Reset form fields
    void reserFormFields(){
      name.clear();
      phoneNumber.clear();
      street.clear();
      postalCode.clear();
      city.clear();
      state.clear();
      country.clear();
      addressFormKey.currentState?.reset();
    }
  }

