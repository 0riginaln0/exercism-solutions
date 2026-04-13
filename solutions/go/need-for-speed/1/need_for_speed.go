package speed

type Car struct {
	speed        int
	battery      int
	batteryDrain int
	distance     int
}

func NewCar(speed, batteryDrain int) Car {
	return Car{
		speed:        speed,
		battery:      100,
		batteryDrain: batteryDrain,
		distance:     0,
	}
}

type Track struct {
	distance int
}

func NewTrack(distance int) Track {
	return Track{distance: distance}
}

func Drive(car Car) Car {
	if car.battery < car.batteryDrain {
		return car
	}
	car.distance += car.speed
	car.battery -= car.batteryDrain
	return car
}

func CanFinish(car Car, track Track) bool {
	return track.distance <= (car.battery/car.batteryDrain)*car.speed
}
