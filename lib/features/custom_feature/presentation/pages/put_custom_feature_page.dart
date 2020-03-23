import 'package:base_code/core/injection/injection.dart';
import 'package:base_code/core/presentacion/style/style_values.dart';
import 'package:base_code/core/presentacion/widgets/my_drawer.dart';
import 'package:base_code/features/custom_feature/domain/usecases/custom_feature_use_cases.dart';
import 'package:base_code/features/custom_feature/presentation/viewmodels/put_custom_feature_viewmodel.dart';
import 'package:flutter/material.dart';
import 'package:states_rebuilder/states_rebuilder.dart';

class PutCustomFeaturePage extends StatelessWidget {
  
  const PutCustomFeaturePage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: MyDrawer(),
      appBar: AppBar(title: const Text("Agregar nuevo camion"),),
      floatingActionButton: FloatingActionButton(
        onPressed: ()=>"",
        child: const Icon(Icons.save),
      ),
      body: Injector(
        builder: (BuildContext context) {return buildPage();},
        inject: [
          Inject<PutCustomFeatureViewModel>(()=> PutCustomFeatureViewModel(useCases: dependencyInjection<CustomFeatureUseCases>()))
        ],
      ),
    );
  }

  Widget buildPage(){
    return Container(
      color: Colors.black12,
      child: Column(
        mainAxisSize: MainAxisSize.max,
        //mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          //Expanded(child: Container(color: Colors.red, child: Text('Holas'),),),
          buildForm(),
          ],
      ),
    );
  }

  Widget buildForm(){
    return Container(
      margin: const EdgeInsets.all(StyleValues.paddingValue),
      child: Card(
        child: Container(
          padding: const EdgeInsets.all(StyleValues.paddingValue),
          child: Form(
            child: Column(
              children: <Widget>[
                buildTextField(),
                SizedBox(height: StyleValues.paddingValue,),
                RaisedButton(
                  padding: EdgeInsets.all(StyleValues.paddingValue), 
                  onPressed: () {
                    var reactiveVM = Injector.getAsReactive<PutCustomFeatureViewModel>();
                    reactiveVM.setState((vm){ return vm.send();});
                  }, 
                  child: Text('Enviar'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget buildTextField(){
      var reactiveVM = Injector.getAsReactive<PutCustomFeatureViewModel>();
      var customFeature = reactiveVM.state.customFeature;
      return TextField(
        controller: TextEditingController(text: customFeature.customProperty),
        onChanged: (value)=> customFeature.customProperty = value,
        keyboardType: TextInputType.number,
        decoration: InputDecoration(labelText: "Numero de camion", ),
      );
  }

}