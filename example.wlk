
class plagas {
  var poblacion = 0
  var transmiteEnfermedad
  method atacar(elemento){
    poblacion += poblacion / 10
    elemento.efectoDelAtaque(plagas)
  }
  method nivelDaño() {}
  method transmite() {
    return if(poblacion >= 10) {
      transmiteEnfermedad == true
    } else {
      transmiteEnfermedad == false
    }
  }
}
class cucarachas inherits plagas {
  var pesoPromedio = 0
  override method nivelDaño() {
    return poblacion / 2
  }
  override method transmite() {
    return if(pesoPromedio >= 10) {
      super()
    }
  }
  override method atacar(elemento) {
    super()
    pesoPromedio += 2
  }
}
class pulgas inherits plagas {
  override method nivelDaño() {
    return poblacion * 2
  }
}
class garrapatas inherits pulgas {
  override method atacar(elemento) {
    poblacion += poblacion / 20
  }
}
class mosquitos inherits plagas {
  override method nivelDaño() {
    return poblacion
  }
  override method transmite() {
    return if(poblacion % 3 == 0) {
      super()
    }
  }
}
class barrios {
  var elementos = []
  method cantidadSonBuenos() {
    return elementos.count({e => e.esBueno()})
  }
  method cantidadNoSonBuenos() {
    return elementos.count({e => e.noEsBueno()})
  }
  method copado() {
    return self.cantidadSonBuenos() > self.cantidadNoSonBuenos()
  }
}
class elementos {
  var esBueno
  method esBueno() {
    return esBueno == true
  }
  method noEsBueno() {
    return esBueno == false
  }
  method efectoDelAtaque(plaga){}
}
class hogar inherits elementos {
  var nivelMugre = 0
  var confortOfrece = 0
  override method esBueno() {
    return if(nivelMugre <= (confortOfrece / 2)) {
      super()
    } else {
      self.noEsBueno()
    }
  }
  override method efectoDelAtaque(plaga) {
    nivelMugre += plaga.nivelDaño()
  }
}
class huerta inherits elementos {
  var nivel
  var capacidadProduccion = 0
  override method esBueno() {
    return if(capacidadProduccion > nivel){
      super()
    } else {
      self.noEsBueno()
    }
  }
  override method efectoDelAtaque(plaga) {
    capacidadProduccion -= plaga.nivelDaño() / 10
    if(plaga.transmite()) {
      capacidadProduccion -= 10
    }
  }
}
class mascota inherits elementos {
  var nivelSalud = 0
  override method esBueno() {
    return if(nivelSalud > 250){
      super()
    } else {
      self.noEsBueno()
    }
  }
  override method efectoDelAtaque(plaga) {
    if(plaga.transmite()) {
      nivelSalud == plaga.nivelDaño()
    }
  }
}