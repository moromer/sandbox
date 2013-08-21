package Model::Task;

use strict;
use warnings;
use Data::Dumper;
use Moose;

has 'BLI' => (
  'is' => 'ro',
  'reader' => 'get_BLI',
  'writer' => undef,
  'default' => undef
);

has 'description' => (
  'is' => 'rw',
  'reader' => 'get_description',
  'writer' => "set_description",
  'default' => undef
);

has 'size' => (
  'is' => 'rw',
  'reader' => 'get_size',
  'writer' => "set_size",
  'default' => undef
);

1;