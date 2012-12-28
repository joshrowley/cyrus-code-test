# Cyrus Code Test #

This is my implementation of [Cyrus Innovation's Ruby Code Test](http://www.cyrusinnovation.com/code-test-ruby)

Things I thought were cool:
* The three data classes (which parse the files) inherit their abstract behavior from AbstractData, with different implementations of the same behavior contained in their private methods.
* The three data classes are also ducktyped, so the RecordFactory doesn't care what type of data object it receives, just that it knows how to parse parameters for a record object.
* The record class has a dynamic comparison and reader methods to help with ease of maintenance if a record's attributes change.