package days;

import haxe.macro.Compiler.IncludePosition;

using Math;
using StringTools;

import haxe.Json;
import utils.ReadData;

typedef Point = {x:Int, y:Int};

/****
	Part 1 -
	Part 2 -
***/
class Day04 {
	private var balls:Array<Int>;
	private var cardDeck:Array<Map<String, {point:Point, value:Int, found:Bool}>>;
	private var cardIndex:Array<Map<Int, Point>>;
	private var sideLength:Int;
	private var winningCards:Array<Map<String, {point:Point, value:Int, found:Bool}>>;
	private var winningTotals:Array<Int>;

	public function new(path:String) {
		var lines:Array<String> = ReadData.getLines(path);
		balls = lines.shift().split(",").map(Std.parseInt);
		sideLength = lines[3].trim().replace("  ", " ").split(" ").length;
		winningCards = [];
		winningTotals = [];

		populateCards(lines.join("\n"));
		playBingo(lines);

		Sys.println('Part 1: ' + winningTotals[0]);
		Sys.println('Part 2: ' + winningTotals[winningTotals.length - 1]);
	}

	private function playBingo(lines:Array<String>):Void {
		for (b in balls) {
			for (c in 0...cardIndex.length) {
				if (cardIndex[c].exists(b)) {
					var temp = cardIndex[c].get(b);
					var json:String = Json.stringify(temp);
					cardDeck[c].set(json, {point: temp, value: b, found: true});
				}
			}

			solve(b);
		}
	}

	private function populateCards(cardData:String):Void {
		var deck:Array<Map<String, {point:Point, value:Int, found:Bool}>> = [];
		var index:Array<Map<Int, Point>> = [];
		var cards:Array<String> = cardData.trim().split("\n\n");

		for (card in cards) {
			var cardMap:Map<String, {point:Point, value:Int, found:Bool}> = new Map();
			var indexMap:Map<Int, Point> = new Map();
			var yIndex:Int = 0;
			var rows:Array<String> = card.split("\n");

			for (r in rows) {
				var xIndex:Int = 0;
				var cardNumbers:Array<Int> = r.trim().replace("  ", " ").split(" ").map(Std.parseInt);

				for (num in cardNumbers) {
					var tp:Point = {x: xIndex, y: yIndex};
					var json:String = Json.stringify(tp);
					cardMap.set(json, {point: tp, value: num, found: false});
					indexMap.set(num, tp);
					xIndex++;
				}

				yIndex++;
			}

			deck.push(cardMap);
			index.push(indexMap);
		}

		cardDeck = deck;
		cardIndex = index;
	}

	private function solve(ball:Int):Void {
		for (c in 0...cardDeck.length) {
			for (y in 0...sideLength) {
				var xPoints:Array<Bool> = [];
				var yPoints:Array<Bool> = [];
				for (x in 0...sideLength) {
					var tx:Point = {x: x, y: y};
					var ty:Point = {x: y, y: x};
					var xInfo = cardDeck[c].get(Json.stringify(tx));
					var yInfo = cardDeck[c].get(Json.stringify(ty));

					xPoints.push(xInfo.found);
					yPoints.push(yInfo.found);
				}

				if (((xPoints[0] && xPoints[1] && xPoints[2] && xPoints[3] && xPoints[4])
					|| (yPoints[0] && yPoints[1] && yPoints[2] && yPoints[3] && yPoints[4]))
					&& !winningCards.contains(cardDeck[c])) {
					winningCards.push(cardDeck[c]);
					winningTotals.push(sumNotFound(cardDeck[c]) * ball);
				}
			}
		}
	}

	private function sumNotFound(cardMap:Map<String, {point:Point, value:Int, found:Bool}>):Int {
		var total:Int = 0;
		for (c in cardMap) {
			if (!c.found) {
				total += c.value;
			}
		}

		return total;
	}
}
