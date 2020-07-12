import 'package:coffee_shop_challenge/app/shared/models/product_model.dart';
import 'package:coffee_shop_challenge/app/shared/repository/products_json_repository.dart';
import 'package:mobx/mobx.dart';
part 'home_controller.g.dart';

class HomeController = _HomeControllerBase with _$HomeController;

abstract class _HomeControllerBase with Store {
  final _productsRepository = ProductsJsonRepository();

  _HomeControllerBase() {
    getListFromRepository();
  }

  @observable
  ProductsList productsList;

  @action
  void getListFromRepository() =>
      productsList = _productsRepository.productsResult();

  filterListStates(String state) {
    switch (state) {
      case "title":
        return filterByTitle();
      case "price":
        return filterByPrice();
      case "type":
        return filterByType();
      default:
        return getListFromRepository();
    }
  }

  @action
  filterByPrice() {
    var sortedList = _productsRepository.productsResult();
    sortedList.product.sort((a, b) {
      return Comparable.compare(a.price, b.price);
    });

    productsList = sortedList;
  }

  @action
  filterByTitle() {
    var sortedList = _productsRepository.productsResult();
    sortedList.product.sort((a, b) {
      return Comparable.compare(a.title, b.title);
    });

    productsList = sortedList;
  }

  @action
  filterByType() {
    var sortedList = _productsRepository.productsResult();
    sortedList.product.sort((a, b) {
      return Comparable.compare(a.type, b.type);
    });

    productsList = sortedList;
  }
}
