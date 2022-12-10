package entities;

class Bot {
	var name:String = null;
	var lowChip:Int = -1;
	var highChip:Int = -1;
	
	public function new(name:String, chip:String) {
		this.name = name;
		this.highChip = Std.parseInt(chip);
	}
	
	public function receiveChip(chip:String) {
		var chipValue = Std.parseInt(chip);
		if(chipValue >= highChip) {
			lowChip = highChip;
			highChip = chipValue;
		} else {
			lowChip = chipValue;
		}
	}
	
	public function giveHigh() {
		var chip = highChip;
		highChip = -1;
		return Std.string(chip);
	}
	
	public function giveLow() {
		var chip = lowChip;
		lowChip = -1;
		return Std.string(chip);
	}
	
	public function getHigh():Int {
		return highChip;
	}

	public function getLow():Int {
		return lowChip;
	}
	
	public function getName():String {
		return name;
	}
	
	public function canProcess():Bool {
		return (lowChip > 0 && highChip > 0);
	}
	
	public function foundChips():Bool {
		if(lowChip == 17 && highChip == 61) {
			return true;
		}
		
		return false;
	}

	public function toString() {
		return this.name + ", " + this.lowChip + ", " + this.highChip;
	}

}
