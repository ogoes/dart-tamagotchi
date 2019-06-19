abstract class State {

  String name;
  String icon;

  State({this.name, this.icon});
  State update();
  String nome();
}

class Vivo implements State {
  

  Vivo({this.name, this.icon});

  @override
  State update() {
    return Morto(name: name, icon: icon);
  }

  @override
  String icon;

  @override
  String name;

  @override
  String nome() {
    return this.name;
  }

}

class Morto implements State {


  Morto({this.name, this.icon});

  @override
  State update() {
    return Vivo(name: name, icon: icon);
  }

  @override
  String nome () {
    return this.name;
  }

  @override
  String icon;

  @override
  String name;
}

void main() {
  State aaa = Morto(name: "asd");

  print(aaa);
  print(aaa.nome());  
  aaa = aaa.update();
  aaa.name = "asdasd";
  print(aaa);
  print(aaa.nome());  


}
