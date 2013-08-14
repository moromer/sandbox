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


sub add_member {
  my $self = shift;
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



1;