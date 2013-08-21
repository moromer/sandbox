use strict;
use warnings;
use Test::More qw/no_plan/;
use Data::Dumper;
use lib '../';
use Model::Team;
use Model::Task;

my $task;

subtest 'create new Instance' => sub {
  
  $task = new Model::Task(
    'BLI'         => 'BLI1234',
    'description' => 'this is only a template',
    'size'        => '5'
  );
  
  is($task->get_BLI(),         "BLI1234",                 "get correct BLI");
  is($task->get_description(), "this is only a template", "get correct description");
  is($task->get_size(),        "5",                       "get correct size");
  
};

subtest 'change the task' => sub {
  
  subtest 'change size' => sub {
    $task->set_size(7);
    is($task->get_size(), "7", "get correct size");
  };
  
  subtest 'change size' => sub {
    $task->set_description("this is a NEW description template");
    is($task->get_description(), "this is a NEW description template", "get correct description");
  };
  
};