# SQLTechTest - Exceedra

Create a process which solves parts A and B below; and then answer part C. Document your work using either a flowchart, pseudo-code, a written sequence of steps, or a programming language you are familiar with. The table below is example data, but your solution should be generic and hence applicable to any data supplied in this format.

A. Identify which pairs of rows have identical Products, Customers and Measures, and overlapping date ranges; e.g., as per rows 1 and 2.

B. Of the rows identified in part A, update the rows to make the date ranges not overlap.

C. Document any assumptions or decisions you needed to make for your solution.

## Answers



## Process & Approach

In order to actually play with the data I created the table in question using Atom.

![Imgur](https://i.imgur.com/EWHBp9V.png)

I then entered this SQL into an online editor (Jdoodle)[https://www.jdoodle.com/execute-sql-online] which enabled me to run the query.

Reading the question, it informs me that my solution must be generic. Looking at the data in the table I can see that while the value column isn't necessarily utilised here, it certainly could be for any calculations which this query may end up performing. Similarly, in this table, all of the products are identical - this may not be the case for a generic solution, therefore this column cannot be ignored.

### Part A

Here we have a set list of criteria which need to be met.

Output desired:

* "Pairs of rows"

Rules to reach this output (generic row x & row y used here):

* Product(x) == Product(y) &&
* Customer(x) == Customer(y) &&
* Measure(x) == Measure(y) &&
* max(Startdate(x), StartDate(y)) < min(Enddate(x), Enddate(y)) - The logic I have used here to interpret the dates overlapping is that for the dates to overlap, one of the rows MUST contain an end date which is less than the start date of the other row.



## Acknowledgement

* Thank you to Exceedra for allowing me to attempt this problem!
