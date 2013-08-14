package Model::Teams;

use strict;
use warnings;
use Data::Dumper;
use Moose;


has 'teamName' => (
  'is' => 'ro',
  'reader' => 'get_teamName',
  'writer' => undef,
  'default' => undef
);

has 'memberList' => (
  'is' => 'ro',
  'isa' => 'HashRef',
  'reader' => 'get_memberList',
  'writer' => undef,
  'default' => undef
);

1;