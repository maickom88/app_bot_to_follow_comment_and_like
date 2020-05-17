// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$GetInstaController on _GetInstaControllerBase, Store {
  final _$prefsAtom = Atom(name: '_GetInstaControllerBase.prefs');

  @override
  SharedPreferences get prefs {
    _$prefsAtom.context.enforceReadPolicy(_$prefsAtom);
    _$prefsAtom.reportObserved();
    return super.prefs;
  }

  @override
  set prefs(SharedPreferences value) {
    _$prefsAtom.context.conditionallyRunInAction(() {
      super.prefs = value;
      _$prefsAtom.reportChanged();
    }, _$prefsAtom, name: '${_$prefsAtom.name}_set');
  }

  final _$usernameGetInstaAtom =
      Atom(name: '_GetInstaControllerBase.usernameGetInsta');

  @override
  String get usernameGetInsta {
    _$usernameGetInstaAtom.context.enforceReadPolicy(_$usernameGetInstaAtom);
    _$usernameGetInstaAtom.reportObserved();
    return super.usernameGetInsta;
  }

  @override
  set usernameGetInsta(String value) {
    _$usernameGetInstaAtom.context.conditionallyRunInAction(() {
      super.usernameGetInsta = value;
      _$usernameGetInstaAtom.reportChanged();
    }, _$usernameGetInstaAtom, name: '${_$usernameGetInstaAtom.name}_set');
  }

  final _$passwordGetInstaAtom =
      Atom(name: '_GetInstaControllerBase.passwordGetInsta');

  @override
  String get passwordGetInsta {
    _$passwordGetInstaAtom.context.enforceReadPolicy(_$passwordGetInstaAtom);
    _$passwordGetInstaAtom.reportObserved();
    return super.passwordGetInsta;
  }

  @override
  set passwordGetInsta(String value) {
    _$passwordGetInstaAtom.context.conditionallyRunInAction(() {
      super.passwordGetInsta = value;
      _$passwordGetInstaAtom.reportChanged();
    }, _$passwordGetInstaAtom, name: '${_$passwordGetInstaAtom.name}_set');
  }

  final _$responseAtom = Atom(name: '_GetInstaControllerBase.response');

  @override
  String get response {
    _$responseAtom.context.enforceReadPolicy(_$responseAtom);
    _$responseAtom.reportObserved();
    return super.response;
  }

  @override
  set response(String value) {
    _$responseAtom.context.conditionallyRunInAction(() {
      super.response = value;
      _$responseAtom.reportChanged();
    }, _$responseAtom, name: '${_$responseAtom.name}_set');
  }

  final _$ifProcessAtom = Atom(name: '_GetInstaControllerBase.ifProcess');

  @override
  String get ifProcess {
    _$ifProcessAtom.context.enforceReadPolicy(_$ifProcessAtom);
    _$ifProcessAtom.reportObserved();
    return super.ifProcess;
  }

  @override
  set ifProcess(String value) {
    _$ifProcessAtom.context.conditionallyRunInAction(() {
      super.ifProcess = value;
      _$ifProcessAtom.reportChanged();
    }, _$ifProcessAtom, name: '${_$ifProcessAtom.name}_set');
  }

  final _$limitAtom = Atom(name: '_GetInstaControllerBase.limit');

  @override
  String get limit {
    _$limitAtom.context.enforceReadPolicy(_$limitAtom);
    _$limitAtom.reportObserved();
    return super.limit;
  }

  @override
  set limit(String value) {
    _$limitAtom.context.conditionallyRunInAction(() {
      super.limit = value;
      _$limitAtom.reportChanged();
    }, _$limitAtom, name: '${_$limitAtom.name}_set');
  }

  final _$buttonCheckedLikeAtom =
      Atom(name: '_GetInstaControllerBase.buttonCheckedLike');

  @override
  bool get buttonCheckedLike {
    _$buttonCheckedLikeAtom.context.enforceReadPolicy(_$buttonCheckedLikeAtom);
    _$buttonCheckedLikeAtom.reportObserved();
    return super.buttonCheckedLike;
  }

  @override
  set buttonCheckedLike(bool value) {
    _$buttonCheckedLikeAtom.context.conditionallyRunInAction(() {
      super.buttonCheckedLike = value;
      _$buttonCheckedLikeAtom.reportChanged();
    }, _$buttonCheckedLikeAtom, name: '${_$buttonCheckedLikeAtom.name}_set');
  }

  final _$getFollowAsyncAction = AsyncAction('getFollow');

  @override
  Future<String> getFollow(String username, String password, String getInsta,
      {String setProccess}) {
    return _$getFollowAsyncAction.run(() => super
        .getFollow(username, password, getInsta, setProccess: setProccess));
  }

  final _$getLikeCommentAsyncAction = AsyncAction('getLikeComment');

  @override
  Future<String> getLikeComment(String username, String password,
      String getInsta, String commentary, String limit,
      {String setProccess}) {
    return _$getLikeCommentAsyncAction.run(() => super.getLikeComment(
        username, password, getInsta, commentary, limit,
        setProccess: setProccess));
  }

  final _$_GetInstaControllerBaseActionController =
      ActionController(name: '_GetInstaControllerBase');

  @override
  String ifpass(String password) {
    final _$actionInfo =
        _$_GetInstaControllerBaseActionController.startAction();
    try {
      return super.ifpass(password);
    } finally {
      _$_GetInstaControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  bool buttonCheckMode(bool ifChecked) {
    final _$actionInfo =
        _$_GetInstaControllerBaseActionController.startAction();
    try {
      return super.buttonCheckMode(ifChecked);
    } finally {
      _$_GetInstaControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String setIfProccess(String process) {
    final _$actionInfo =
        _$_GetInstaControllerBaseActionController.startAction();
    try {
      return super.setIfProccess(process);
    } finally {
      _$_GetInstaControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    final string =
        'prefs: ${prefs.toString()},usernameGetInsta: ${usernameGetInsta.toString()},passwordGetInsta: ${passwordGetInsta.toString()},response: ${response.toString()},ifProcess: ${ifProcess.toString()},limit: ${limit.toString()},buttonCheckedLike: ${buttonCheckedLike.toString()}';
    return '{$string}';
  }
}
