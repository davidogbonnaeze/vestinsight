import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:vestinsight/core/services/database_service.dart';
import 'package:vestinsight/core/services/storage_service.dart';
import 'package:vestinsight/features/home/domain/entities/user.dart';
import '../../../../../injection_container.dart';
import './bloc.dart';

class EditProfileBloc extends Bloc<EditProfileEvent, EditProfileState> {
  DataBaseService dataBaseService = sl<DataBaseService>();
  StorageService storageService = sl<StorageService>();
  @override
  EditProfileState get initialState => InitialEditProfileState();

  @override
  Stream<EditProfileState> mapEventToState(
    EditProfileEvent event,
  ) async* {
    if (event is EditProfileButtonPressed) {
      try {
        yield EditProfileLoadingState();
        User user = await processImageUpload(event);
        yield EditProfileSuccessState(user: user);
        print('success state yielded');
      } catch (e) {
        yield EditProfileFailureState(message: e.toString());
      }
    }
  }

  Future<User> processImageUpload(EditProfileButtonPressed event) async {
    String _profileImageUrl = '';

    if (event.profilePicture == null) {
      _profileImageUrl = event.user.profileImageUrl;
    } else {
      _profileImageUrl = await storageService.uploadUserProfileImage(
          event.user.profileImageUrl, event.profilePicture);
    }

    User user = User(
      id: event.user.id,
      email: event.user.email,
      profileImageUrl: _profileImageUrl,
      firstName: event.newFirstName,
      lastName: event.newLastName,
    );

    dataBaseService.updateUser(user);
    return user;
  }
}
