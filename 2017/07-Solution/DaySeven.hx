import sys.io.File;
using StringTools;

class DaySeven {
    //private static inline var inputPath:String = "../inputs/day7.txt";
    private static inline var inputPath:String = "../inputs/temp.txt";
    private static var input:String = "";

    static function main() {
        input = sys.io.File.getContent(inputPath).trim();
        var r = ~/\n/g;
        var lines:Array<String> = r.split(input);

        for(line in lines) {
            Sys.println(line);
        }
    }
}