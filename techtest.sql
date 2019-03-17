CREATE TABLE techtest(rowid int, Product TEXT, Customer TEXT, Measure TEXT, Value FLOAT, Validfrom DATE, Validto DATE);

INSERT into techtest VALUES(1, "Widgets", "Tesco", "Gross Sales Price", 1, 20130101, 20130401);
INSERT into techtest VALUES(2, "Widgets", "Tesco", "Gross Sales Price", 1.5, 20130301, 20131231);
INSERT into techtest VALUES(3, "Widgets", "Tesco", "Gross Sales Price", 2, 20130401, 20150101);
INSERT into techtest VALUES(4, "Widgets", "Tesco", "Distribution Cost", 5, 20130101, 20130401);
INSERT into techtest VALUES(5, "Widgets", "Tesco", "Distribution Cost", 6, 20130301, 20140401);
INSERT into techtest VALUES(6, "Widgets", "Tesco", "Distribution Cost", 7, 20131231, 20150101);
INSERT into techtest VALUES(7, "Widgets", "Asda", "Gross Sales Price", 100, 00000000, 99999999);
INSERT into techtest VALUES(8, "Widgets", "Asda", "Gross Sales Price", 200, 20131231, 20150101);
INSERT into techtest VALUES(9, "Widgets", "Asda", "Distribution Cost", 2, 20130301, 20131231);
INSERT into techtest VALUES(10, "Widgets", "Asda", "Distribution Cost", 3, 20140401, 20150101);


SELECT t1.rowid, t2.rowid
FROM techtest t1
INNER JOIN techtest t2
    ON  t1.Product = t2.Product
    AND t1.Customer = t2.Customer
    AND t1.Measure = t2.Measure
    AND MAX(t1.Validfrom, t2.Validfrom) < MIN (t1.Validto, t2.Validto)
    AND t1.rowid  < t2.rowid;
