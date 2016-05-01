# Rankum
A tool to compare search ranks using flexible quality rank metrics.
It helps to evaluate how good your search results are ranked when compared to a perfect (ideal) rank.

## Rank Metrics
To help you out, Rankum extract some metrics to "measure" search rank relevancy.

##### FCP (Fraction Concordant pairs)
Basically, this metric counts how many pairs occuring on perfect rank are also on actual search rank.
Supposing search results are A, B, C, D and E items. For this pefect rank, we have 10 pair combinations (AB, AC, AD, AE, BC, BD, BE, CD, CE, DE).
**FCP measures the fraction (percentage) of these pairs on actual ranks.**

## Install

```ruby
gem install rankum
```

## Usage

##### Command-line mode

Options:
```shell
-m, --metric metric                             Metric used to compare search ranks
-a, --actual_rank actual_rank_file_path         Actual Rank file (only for RankFileReader strategy)
-p, --perfect_rank perfect_rank_file_path       Perfect Rank file (only for RankFileReader strategy)
-r, --rank_reader rank_reader                   Strategy to to read your ranks
```

```shell
$ rankum -m FCP -r RankFileReader -p perfect_rank.txt -a my_rank.txt
```
![Rankum output](http://thecodeknight.herokuapp.com/img/rankum_output.png)
