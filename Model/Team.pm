package Model::Team;

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

has 'taskList' => (
  'is' => 'ro',
  'reader' => 'get_taskList',
  'writer' => undef,
  'default' => sub {
    return {}
  }
);


sub add_member {
  my $self   = shift;
  my $member = shift;

  if(ref $member ne 'Model::TeamMember' || defined $self->get_memberList->{$member->get_shortName()}) {
    warn "can not add teamMember";
    return 0;
  } else {
    $self->get_memberList->{$member->get_shortName()} = $member;
    return 1;
  }
  
  return 0;
}

sub remove_member {
  my $self      = shift;
  my $shortName = shift;
  
  if(defined $self->get_memberList->{$shortName}) {
    delete($self->get_memberList->{$shortName});
    return 1;
  } else {
    warn "no entry exist for shortName $shortName";
    return 0;
  }
  
  return 0;
}

sub add_task {
  my $self = shift;
  my $task = shift;
  
  if(ref $task ne 'Model::Task' || defined $self->get_taskList->{$task->get_BLI()}) {
    warn "Task already added";
    return 0;
  } else {
    $self->get_taskList->{$task->get_BLI()} = $task;
    return 1;
  }
}

1;