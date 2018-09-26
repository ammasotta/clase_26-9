class Monstruo
{
	var vida = 100
	var potencialDefensivo
	var danioAtaque
	
	constructor(_potencialDefensivo,_danioAtaque)
	{
		potencialDefensivo=_potencialDefensivo
		danioAtaque=_danioAtaque
	}
	
	method vida()=vida
	
	method potencialDefensivo() = potencialDefensivo
	
	method danioAtaque(_danioAtaque)
	{
		danioAtaque=_danioAtaque
	}
	
	method recibirDanio(danio)
	{
		vida= 0.max(vida-(0.max((danio-potencialDefensivo))))
	}
	
	method disminuirPotencialDefensivo(cantidadDisminuida)
	{
		potencialDefensivo = 0.max(potencialDefensivo-cantidadDisminuida)
	}
	
	method atacar(enemigo)
	{
		enemigo.recibirDanio(danioAtaque)
	}
}

