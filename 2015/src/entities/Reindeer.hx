package entities;

class Reindeer {
	private var _speed:Int;
	private var _flightTime:Int;
	private var _restTime:Int;
	private var _distance:Int;
	private var _go:Bool;
	private var _travelTime:Int;

	public var points:Int;

	public function new(speed:Int, flightTime:Int, restTime:Int) {
		_speed = speed;
		_flightTime = flightTime;
		_restTime = restTime;
		_distance = 0;
		_go = true;
		_travelTime = 0;

		points = 0;
	}

	public function tick():Void {
		if (_go) {
			_distance += _speed;
		}

		_travelTime++;

		var inititive = _travelTime % (_flightTime + _restTime);

		_go = (inititive < _flightTime);
	}

	public function getDistance():Int {
		return _distance;
	}
}
