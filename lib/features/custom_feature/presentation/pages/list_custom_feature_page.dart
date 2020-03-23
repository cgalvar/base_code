import 'dart:developer';
import 'package:auto_route/auto_route.dart';
import 'package:base_code/core/injection/injection.dart';
import 'package:base_code/core/presentacion/style/style_values.dart';
import 'package:base_code/core/presentacion/widgets/my_drawer.dart';
import 'package:base_code/core/routes/router.gr.dart';
import 'package:base_code/features/custom_feature/domain/usecases/custom_feature_use_cases.dart';
import 'package:base_code/features/custom_feature/presentation/viewmodels/list_camiones_viewmodel.dart';
import 'package:flutter/material.dart';
import 'package:states_rebuilder/states_rebuilder.dart';

class ListCustomFeaturePage extends StatelessWidget {
  const ListCustomFeaturePage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: MyDrawer(),
      appBar: AppBar(title: const Text("Lista"),),
      floatingActionButton: FloatingActionButton(
        onPressed: ()=> ExtendedNavigator.of(context).pushPutCustomFeaturePage(),
        child: const Icon(Icons.add),
      ),
      body: 
        Injector(
          inject: [
            Inject<ListCustomFeatureViewModel>(()=> ListCustomFeatureViewModel(useCases: dependencyInjection<CustomFeatureUseCases>()))
          ],
          builder: (BuildContext context) {return buildPage();},
        ),
      
      
    );
  }

  buildPage(){
    return Container(
      padding: EdgeInsets.all(StyleValues.paddingValue),
      child: 
        StateBuilder(
          models: [Injector.getAsReactive<ListCustomFeatureViewModel>()],
          initState: (_, ReactiveModel<ListCustomFeatureViewModel> rm) async {
            //var reactiveModel = Injector.getAsReactive<ListCamionesViewModel>();
            //await rm.state.getCamiones();
            rm.setState((vm) async => await vm.list());
          },
          builder: (_, reactiveModel){
            return reactiveModel.whenConnectionState(
              onIdle: null, 
              onWaiting: ()=> buildLoading(), 
              onData: (vm)=> onData(vm), 
              onError: null
            );
          },
        ),
      
    );
  }

  onData(ListCustomFeatureViewModel vm){
    return Row(
      children: generateAvatars(vm),
    );
  }

  List<Widget> generateAvatars(ListCustomFeatureViewModel vm){
    //var reactiveModel = Injector.getAsReactive<ListCamionesViewModel>();
    //var vm = reactiveModel.state;
    
    List<Widget> listWidgets = [];

    log(vm.listCustomFeature.toString());

    if (vm.listCustomFeature != null && vm.listCustomFeature.length > 0) {
      for (var customFeatures in vm.listCustomFeature) {
        var property = customFeatures.customProperty.toString();
        var avatar = FloatingActionButton(onPressed: goToMovimientos(property), child: Text(property),);
        listWidgets.add(avatar);
        listWidgets.add(SizedBox(width: StyleValues.paddingValue,));
      }
      return listWidgets;
    }else{
      return [Container(child: Text("No tienes camiones registrados, intenta registrar uno"),)];
    }

  }

  goToMovimientos(String argument){
    // TODO: go to another page
  }

    Widget buildLoading() {
    return Center(
      child: CircularProgressIndicator(),
    );
  }
  
}