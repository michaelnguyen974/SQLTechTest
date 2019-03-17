# SQLTechTest - Exceedra

Create a process which solves parts A and B below; and then answer part C. Document your work using either a flowchart, pseudo-code, a written sequence of steps, or a programming language you are familiar with. The table below is example data, but your solution should be generic and hence applicable to any data supplied in this format.

A. Identify which pairs of rows have identical Products, Customers and Measures, and overlapping date ranges; e.g., as per rows 1 and 2.

B. Of the rows identified in part A, update the rows to make the date ranges not overlap.

C. Document any assumptions or decisions you needed to make for your solution.

## Answers

### Part A

The below rows contain dates which overlap, as well as identical Products, Customers & Measures:

| row id | 2nd row id |
| -- | -- |
1|2
2|3
4|5
5|6

### Part B



## Process & Approach

In order to actually play with the data I created the table in question using Atom.

![Imgur](https://i.imgur.com/EWHBp9V.png)

I then entered this SQL into an online editor [Jdoodle](https://www.jdoodle.com/execute-sql-online) which enabled me to run the query.

Reading the question, it informs me that my solution must be generic. Looking at the data in the table I can see that while the value column isn't necessarily utilised here, it certainly could be for any calculations which this query may end up performing. Similarly, in this table, all of the products are identical - this may not be the case for a generic solution, therefore this column cannot be ignored.

To me, it made sense to split the data table into 4 distinct sub-tables to get an idea as to what should be paired together once the query is run:

Tesco Gross Sales Price

| Row ID | Valid From | Valid To |
| -- | -- | -- |
| 1 | 2013-01-01 | 2013-04-01 |
| 2 | 2013-03-01 | 2013-12-31 |
| 3 | 2013-04-01 | 2015-01-01 |

Tesco Distribution Cost

| Row ID | Valid From | Valid To |
| -- | -- | -- |
| 4 | 2013-01-01 | 2013-04-01 |
| 5 | 2013-03-01 | 2014-04-01 |
| 6 | 2013-12-31 | 2015-01-01 |

Asda Gross Sales Price

| Row ID | Valid From | Valid To |
| -- | -- | -- |
| 7 | 0000-00-00 | 9999-99-99 |
| 8 | 2013-12-31 | 2015-01-01 |

Asda Distribution Cost

| Row ID | Valid From | Valid To |
| -- | -- | -- |
| 9 | 2013-03-01 | 2013-12-31 |
| 10 | 2014-04-01 | 2015-01-01 |

I have assumed that the dates in row 7 are incorrect, I will therefore refer to them as NULL.

### Part A

Here we have a set list of criteria which need to be met.

Output desired:

* "Pairs of rows"

Rules to reach this output (generic row x & row y used here):

* Product(x) == Product(y) &&
* Customer(x) == Customer(y) &&
* Measure(x) == Measure(y) &&
* max(Startdate(x), StartDate(y)) < min(Enddate(x), Enddate(y))

 *The logic I have used here to interpret the dates overlapping is that for the dates to overlap, one of the rows MUST contain an end date which is less than the start date of the other row. The start date of row x cannot be greater than the end date of row x*

Knowing that I had to then output a pair of rows I looked up the GROUP BY function and attempted to utilise this. Having no luck with this, I took a break from the problem to think.

From prior experience with SQL I remembered Inner Joins, this would enable me to see records in the table with matching values in specified areas:

![Image](https://www.w3schools.com/sql/img_innerjoin.gif)

The below is what I got initially - great! However there is a lot of repetition here. For example, there are pairings for row 1 & 2, as well as for rows 2 & 1. Logically these are the same to me. Also, there's instances of all rows with non-null dates being paired with themselves, for example row 1 & row 1, row 2 & row 2 etc.

![Imgur](https://i.imgur.com/o7ViREV.png)

Adding the below line ensured the removal of duplicates by only allowing the id of the row from our 1st table to be less than the id of the row from our second table. This also explicitly removes the ability for two rows with the same id to be returned:

```
AND t1.rowid  < t2.rowid
```

This results in:

![Imgur](https://i.imgur.com/g0jfuXp.png)

This means that none of the Asda pairings work, this isn't a surprise. Looking at the dates for the Asda Gross Sales price options, one of the dates is null, therefore it cannot overlap. The dates for the Asda Distribution costs do not overlap, they therefore aren't returned.

### Part B

Of the rows identified in part A, update the rows to make the date ranges not overlap.

From my answer to part A, I know I can ignore rows 7, 8, 9 & 10. These did not meet the criteria for part A.


## Resources used

https://www.w3schools.com/sql/sql_join_inner.asp - Inner joins


## Acknowledgements

* Thank you to Exceedra for allowing me to attempt this problem!
* Makers Academy
