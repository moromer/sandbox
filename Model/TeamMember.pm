package Model::TeamMember;

use strict;
use warnings;
use Data::Dumper;
use Moose;

has 'firstName' => (
  'is'     => 'ro',
  'reader' => 'get_firstName',
  'writer' => undef,
  'default' => undef
);

has 'lastName' => (
  'is'  => 'ro',
  'reader' => 'get_lastName',
  'writer' => undef,
  'default' => undef
);

has 'role' => (
  'is'      => 'rw',
  'reader'  => 'get_role',
  'writer'  => 'set_role',
  'default' => undef
);

has 'shortName' => (
  'is'       => 'ro',
  'isa'      => 'Str',
  'required' => 1,
  'reader'   => 'get_shortName',
  'writer'   => undef,
  'default'  => undef
);


1;