# Rankum
A tool to compare search ranks using flexible quality rank metrics.
It helps to evaluate how good your search results are ranked when compared to a perfect (ideal) rank.

## Rank Metrics
To help you out, Rankum extract some metrics to "measure" search rank relevancy.

##### FCP (Fraction Concordant pairs)
Basically, this metric measures the quantity of pairs occuring on perfect rank that also occur on actual rank.
Suppose search result A, B, C, D and E items. For this pefect rank, we have 10 pairs (AB, AC, AD, AE, BC, BD, BE, CD, CE, DE). **FCP measures the fraction (percentage) of perfect rank pairs that also ocurr on actual ranks.**

## Install

```ruby
gem install rankum
```

## Usage

##### Command-line mode

```shell
$ rankum -m FCP -r RankFileReader -p perfect_rank.txt -a my_rank.txt
```
