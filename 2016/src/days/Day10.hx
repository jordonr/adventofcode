package days;

import haxe.display.Display.Package;
import entities.Bot;
import utils.ReadData;

using haxe.Int64;

class Day10 {
	var outputBin:Array<Array<String>> = [[]];
	var _bots:Map<String, Bot> = [];
	var _outputs:Map<String, String> = [];
	
	public function new(path:String) {
		var data:Array<String> = ReadData.getLines(path);

		Sys.println("Part 1: " + runBots(data.copy(), true));
		Sys.println("Part 2: " + runBots(data.copy(), false));
	}

	private function runBots(data:Array<String>, findChips:Bool):String {
		var r = ~/^(bot \d+) gives low to (bot|output) (\d+) and high to (bot|output) (\d+)/;
		var count = 0;
		var leftovers = [];
		
		populateBots(data);
		
		while(data.length > 0) {
			var l = data.shift();
			if(r.match(l)) {
				var botGiving = r.matched(1); // bot giving
				var getLow = r.matched(2) + " " + r.matched(3); // bot|output getting low
				var getHigh = r.matched(4) + " " + r.matched(5); // bot|output getting high
				
				if(_bots[botGiving].canProcess()) {

					if(_bots[botGiving].foundChips() && findChips) {
						return botGiving;
					}

					if(getLow.indexOf("output") == -1) {
						_bots[getLow].receiveChip(_bots[botGiving].giveLow());
					} else {
						_outputs.set(getLow, _bots[botGiving].giveLow());
					}
					
					if(getHigh.indexOf("output") == -1) {
						_bots[getHigh].receiveChip(_bots[botGiving].giveHigh());
					} else {
						_outputs.set(getHigh, _bots[botGiving].giveHigh());
					}
				} else {
					data.push(l);
				}
			}
		}

		var output = Std.parseInt(_outputs["output 0"]) * Std.parseInt(_outputs["output 1"]) * Std.parseInt(_outputs["output 2"]);
		return Std.string(output);
	}

	private function part2(input:String):Int64 {
		var uncompressedLength:Int64 = 0;

		return uncompressedLength;
	}
	
	private function populateBots(data:Array<String>):Void {
		var regValue = ~/^value (\d+) goes to (bot \d+)/;
		var regBot = ~/^(bot \d+)/;
		
		for(l in data) {
			if(regValue.match(l)) {			
				if(_bots.exists(regValue.matched(2))) {
					_bots[regValue.matched(2)].receiveChip(regValue.matched(1));
				} else {
					var bot:Bot = new Bot(regValue.matched(2), regValue.matched(1));
					_bots.set(bot.getName(), bot);
				}
			} else if(regBot.match(l)) {
				if(!_bots.exists(regBot.matched(1))) {
					var bot:Bot = new Bot(regBot.matched(1), "-1");
					_bots.set(bot.getName(), bot);
				}
			}
		}
	}
}
