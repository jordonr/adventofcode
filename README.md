# Advent of Code 2018 - Solutions in {$language}!

This is my repo for going through the 2018 Advent of Code.

## Status

| Day           | Stars   | Language | File            |
|:-------------:|:-------:|:--------:|:---------------:|
| Day 01        | 2 Stars | Python & Haxe | 01-Solution.py & Day-01 |
| Day 02        | 2 Stars | Python   | 02-Solution.py  |
| Day 03        | 2 Stars | PHP      | 03-Solution.php |
| Day 04        | 2 Stars | PHP      | 04-Solution.php |
| Day 05        | 2 Stars | Haxe     | Day-05          |
| Day 06        | 0 Stars |||
| Day 07        | 0 Stars |||
| Day 08        | 0 Stars |||
| Day 09        | 0 Stars |||
| Day 10        | 0 Stars |||
| Day 11        | 0 Stars |||
| Day 12        | 0 Stars |||
| Day 13        | 0 Stars |||
| Day 14        | 0 Stars |||
| Day 15        | 0 Stars |||
| Day 16        | 0 Stars |||
| Day 17        | 0 Stars |||
| Day 18        | 0 Stars |||
| Day 19        | 0 Stars |||
| Day 20        | 0 Stars |||
| Day 21        | 0 Stars |||
| Day 22        | 0 Stars |||
| Day 23        | 0 Stars |||
| Day 24        | 0 Stars |||
| Day 25        | 0 Stars |||

## Notes

| Day           | Notes   |
|:------------- |:------- |
| Day 01        | Took 140 loops through the given input to find the answer.  Python took 2m13.898s, so while that was going, I thought I'd try Haxe using the same logic.  Haxe complied to cpp target took 0m8.356s to execute. |
| Day 05        | Haxe target Neko: , cpp: |

### Running Haxe  
* Interpeter: `haxe -main Day05 --interpet`
* Neko: `haxe -main Day05 -neko day05.n`
* CPP Linux/Mac: `haxe -main Day05 -cpp bin`
* CPP Windows: 1) `haxelib install minimingw` 2)`haxe -main Day05 -cpp bin -lib minimingw`