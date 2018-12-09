package ;

using StringTools;

class Day01 {
  private static inline var inputPath:String = "../inputs/Day1.txt";
  //private static inline var inputPath:String = "../inputs/Day1-Test.txt";
  private static var input:String = "";

  static public function main() {
    input = sys.io.File.getContent(inputPath).trim();
    var regex = ~/\n/g;
    var removePlus = ~/\+/g;
    var lines:Array<String> = regex.split(input);
    var frequency:Int = 0;
    var frequencyList:Array<Int> = [];
    var frequencyTracking:Array<Int> = [0];
    var frequencyFound:Bool = false; 

    for(line in lines) {
        var tmpLine = Std.parseInt(removePlus.replace(line, ''));
        frequency += tmpLine;
        frequencyList.push(tmpLine);
        frequencyTracking.push(frequency);
    }

    Sys.println('Final frequency: ' + frequency);

    var f:Int = 0;
    var r:Int = 0;
    while(!frequencyFound) {
        frequency += frequencyList[f];
        if(frequencyTracking.indexOf(frequency) > -1) {
            Sys.println('First reaches ' + frequency + ' twice.');
            frequencyFound = true;
        }

        frequencyTracking.push(frequency);
        f++;
        if(f >= frequencyList.length) {
            f = 0;
            r++;
            Sys.println('Restart Input: ' + r);
        }
    }
  }
}