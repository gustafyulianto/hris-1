import 'package:flutter_bloc/flutter_bloc.dart';

enum HomePage {
  Overview,
  Knowledge,
  Employees,
  Account,
}

class ChangeHomeProvider {
  HomePage _homePage;

  // ChangeHomeProvider({this.homePage});
  ChangeHomeProvider({HomePage homePage}) : _homePage = homePage;

  HomePage getHomePage() {
    return _homePage;
  }
}

class RepositoryHome {
  ChangeHomeProvider _changeHomeProvider;
  RepositoryHome({ChangeHomeProvider changeHomeProvider}) : _changeHomeProvider = changeHomeProvider;

  int changeHomePage(HomePage homePage) {
    _changeHomeProvider._homePage = homePage;

    switch (_changeHomeProvider._homePage) {
      case HomePage.Overview:
        return 0;
        break;

      case HomePage.Knowledge:
        return 1;
        break;

      case HomePage.Employees:
        return 2;
        break;

      case HomePage.Account:
        return 3;
        break;

      default:
        return 0;
    }
  }
}

class ChangeHome extends Bloc<HomePage, int> {
  RepositoryHome _repositoryHome;

  ChangeHome({RepositoryHome repositoryHome}) : _repositoryHome = repositoryHome, super(0);

  Stream<int> mapEventToState(HomePage event) async* {
    yield _repositoryHome.changeHomePage(event);
  }

  // @override
  // // TODO: implement initialState
  // int get initialState => (0);
}
