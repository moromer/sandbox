use strict;
use warnings;
use Test::More qw/no_plan/;
use Data::Dumper;
use lib '../';
use Model::TeamMember;

my $teamMember;

subtest 'create new Instance' => sub {
  $teamMember = new Model::TeamMember(
    'firstName' => 'Mario',
    'lastName'  => 'Romer',
    'role'      => 'Software Developer',
    'shortName' => 'marm'
  );
  
  is($teamMember->get_firstName(), 'Mario',              'get correct firstName');
  is($teamMember->get_lastName(),  'Romer',              'get correct lastName');
  is($teamMember->get_role(),      'Software Developer', 'get correct role');
  is($teamMember->get_shortName(), 'marm',               'get correct shortName');
};

subtest 'change role' => sub {
  $teamMember->set_role("System Analyst Development");
  
  is($teamMember->get_role(),      'System Analyst Development', 'get correct role');
  
};

