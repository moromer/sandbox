use strict;
use warnings;
use Test::More qw/no_plan/;
use Data::Dumper;
use lib '../';
use Model::Team;
use Model::TeamMember;

my $team;
my $memberList = {
    'marm' => new Model::TeamMember(
      'firstName' => 'Mario',
      'lastName'  => 'Romer',
      'role'      => 'Software Developer',
      'shortName' => 'marm'
    ),
    'hawu' => new Model::TeamMember(
      'firstName' => 'Hans',
      'lastName'  => 'Wurst',
      'role'      => 'Test Engineer',
      'shortName' => 'hawu'
    ),
    'pekl' => new Model::TeamMember(
      'firstName' => 'Peter',
      'lastName'  => 'Klein',
      'role'      => 'Scrum Master',
      'shortName' => 'pekl'
    )
  }; 

subtest 'create new Instance' => sub {
  $team = new Model::Team(
    'teamName' => 'AwsumTeam',
    'memberList' => $memberList
  );
  
  is($team->get_teamName(),          'AwsumTeam', 'got correct teamName');
  is_deeply($team->get_memberList(), $memberList, 'got correct memberList');
};

subtest 'add a new teamMember' => sub {
  
  subtest 'add wrong teamMember' => sub {
    ok(!$team->add_member("abc"), 'can not add  teamMember in wrng format'); 
    is($team->get_memberList()->{'abc'}, undef, 'no entry for abc exist'); 
  };
  
  subtest 'add correct teamMember' => sub {
    my $new_member = new Model::TeamMember(
      'firstName' => 'Franz',
      'lastName'  => 'Dietrich',
      'role'      => 'Software Developer',
      'shortName' => 'frdi'
    );
    
    ok($team->add_member($new_member));
    
    is($team->get_memberList()->{'frdi'}, $new_member, 'got correct teamMember');
    
  };
};

subtest 'delete a member' => sub {
  
  subtest 'delete non existing member' => sub {
    ok (!$team->remove_member('klm'), 'can not delete non existing member');
    is_deeply($team->get_memberList(), $memberList, 'got correct memberList');
      
  };
  
  subtest 'delete existing member' => sub {
    ok ($team->remove_member('frdi'), 'can delete existing member');
    is($team->get_memberList()->{'frdi'}, undef, 'frdi does not exist anymore');
  };
  
};



