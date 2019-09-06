Compute dependencies between tables of the FamixNGSQL model provided as parameter according to their foreign keys.

A table T is dependent of another table T' if T has at least one foreign key referencing a column of T'.

The results of the analysis is stored in #dependencies instance variable and consists in an collection of Associations T -> T' (i.e. table dependent -> table depending on).

Tables that depends on no other tables get an association with nil as value.