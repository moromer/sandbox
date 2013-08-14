use strict;
use warnings;
use Test::More qw/no_plan/;
use Data::Dumper;
use lib '../';
use Model::Teams;
use Model::TeamMember;

my $team;
my $memberList = {
    'marm' => new Model::TeamMember(
      'firstName' => 'Mario',
      'lastName'  => 'Romer',
      'role'      => 'Software Developer'
    ),
    'hawu' => new Model::TeamMember(
      'firstName' => 'Hans',
      'lastName'  => 'Wurst',
      'role'      => 'Test Engineer'
    ),
    'pekl' => new Model::TeamMember(
      'firstName' => 'Peter',
      'lastName'  => 'Klein',
      'role'      => 'Scrum Master'
    )
  }; 

subtest 'create new Instance' => sub {
  $team = new Model::Teams(
    'teamName' => 'AwsumTeam',
    'memberList' => $memberList
  );
  
  is($team->get_teamName(),          'AwsumTeam', 'got correct teamName');
  is_deeply($team->get_memberList(), $memberList, 'got correct memberList');
};
