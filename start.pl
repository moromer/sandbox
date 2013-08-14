#!/usr/bin/perl

use strict;
use warnings;

use lib ".";
use Model::TeamMember;
use Model::Team;
use Data::Dumper;
use Switch;

my $team;

printf("%10s", "=================\n");
printf("%10s", "| Team Overview |\n");
printf("%10s", "=================\n");

print "possible actions:\n";
print "1. show team\n";
print "2. create team\n";
print "3. remove teamMember\n";
print "4. add teamMember\n";
print "5. exit\n";

my $action = '';
while($action ne '5') {
  print "what to do?\n";
  $action = <STDIN>; 
  $action =~ s/\n//g;
  
  switch($action) {
    case 1 {
      show_team();
    }
    case 2 {
      create_team();
    }
    case 3 {
      remove_teamMember();
    }
    case 4 {
      add_teamMember();
    }
  }
  
  
}

sub show_team {
  print "name of the team: " . $team->get_teamName() . "\n";
  if(defined $team->get_memberList() && keys %{$team->get_memberList()} > 0) {
    
    my $teamMemberList = $team->get_memberList();
    print "team members:\n";
    foreach my $key (keys (%$teamMemberList) ) {
      printf("%s %s (%s) as role: %s\n", 
              $teamMemberList->{$key}->get_firstName(), 
              $teamMemberList->{$key}->get_lastName(), 
              $teamMemberList->{$key}->get_shortName(),
              $teamMemberList->{$key}->get_role()
      );
    }
  } else {
    print "no member exist yet\n";
  }
  
  
}

sub create_team {
  print "name of the team:\n";
  my $name = <STDIN>;
  
  $name =~s/\n//g;
  $team = new Model::Team(
    'teamName'   => $name,
    'memberList' => {}
  );

}

sub remove_teamMember {
  
  print "which team member should be removed (put the shortName)\n";
  my $shortName = <STDIN>;
  $shortName =~s/\n//g;
  
  $team->remove_member($shortName);
}

sub add_teamMember {
  print "FirstName:\n";
  my $firstname = <STDIN>;
  $firstname =~ s/\n//g;
  
  print "LastName:\n";
  my $lastname = <STDIN>;
  $lastname =~ s/\n//g;
  
  print "shortName:\n";
  my $shortname = <STDIN>;
  $shortname =~ s/\n//g;
  
  print "role:\n";
  my $role = <STDIN>;
  $role =~ s/\n//g;
  
  
  my $member = new Model::TeamMember(
    'firstName' => $firstname,
    'lastName'  => $lastname,
    'role'      => $role,
    'shortName' => $shortname
  );
  
  $team->add_member($member);
}


print "close program ...\n";