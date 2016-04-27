# Rankum
A tool to compare search ranks using flexible quality rank metrics.
It helps to evaluate how good your search results are ranked when compared to a perfect (ideal) rank.

## Rank Metrics

##### FCP (Fraction Concordant pairs)

## Install

```ruby
gem install rankum
```

## Usage

##### Command-line mode

```shell
$ rankum -m FCP -r RankFileReader -p perfect_rank.txt -a my_rank.txt
```
