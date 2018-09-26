class Alquimista{
	var vida = 100
	const itemsDeCombate = []
	const itemsDeRecoleccion = []
	
	method itemsDeCombate() = itemsDeCombate
	method itemsDeRecoleccion() = itemsDeRecoleccion
	method items() = itemsDeCombate + itemsDeRecoleccion
	
	method vida()=vida
	
	method tieneCriterio(){
		return self.obtenerItemsEfectivos().size() >= self.cantidadDeItemsDeCombate() / 2
	}
	
	method cantidadDeItemsDeCombate(){
		return self.itemsDeCombate().size()
	}
	
	method cantidadDeItems(){
		return self.items().size()
	}	
	
	method obtenerItemsEfectivos() {
		return self.itemsDeCombate().filter({item => item.esEfectivo()})
	}
	
	method esBuenExplorador(){
		return itemsDeRecoleccion.asSet().size() >= 3
	}
	
	method capacidadOfensiva(){
		return self.itemsDeCombate().sum({item => item.capacidad()})
	}
	
	method esProfesional(){
		return self.promedioCalidad() > 50 && self.todosLosItemsSonEfectivos() && self.esBuenExplorador()
	}
	
	method promedioCalidad(){
		return self.items().sum({item => item.calidad()}) / self.cantidadDeItems()
	}
	
	method todosLosItemsSonEfectivos(){
		return self.itemsDeCombate().all({item => item.esEfectivo()})
	}
	
	method atacar(enemigo)
	{
		var item = self.elegirItemDeCombate()
		item.usar(self,enemigo)
		self.itemsDeCombate().remove(item)
	}
	method recibirDanio(danio)
	{
		vida= 0.max(vida-danio)
	}
	method curarVida(curacion)
	{
		vida+=curacion
	}
	method elegirItemDeCombate()= self.itemsDeCombate().first()
	
	method agregarItemDeCombate(item)
	{
		itemsDeCombate.add(item)
	}
	
	method agregarItemDeRecoleccion(item)
	{
		itemsDeRecoleccion.add(item)
	}
}
