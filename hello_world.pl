#!/usr/bin/perl -w

use strict;
use warnings;
use Data::Dumper;

my $ausgabe = "hello world!";

print "i have now added a row and so on!";

print "$ausgabe\n"; 

my @array = qw(eins zwei drei vier);

warn Dumper(@array);

my $hostname = "localhost";

warn $hostname;


