#!/usr/bin/perl -w

use strict;
use XML::Twig;
use XML::Parser;
use XML::SemanticDiff;
use Data::Dumper;

#my $twig = new XML::Twig(twig_handlers =>
#                           {player => \&player});

my $t= XML::Twig->new( 
       # the twig will include just the root and selected titles 
           twig_roots   => { 'References/Party/PartyName' => \&print_n_purge
           }
                      );
  $t->parsefile( 'KY.xml');

  sub print_n_purge 
    { 
      my( $t, $elt)= @_;
      
      my $type = $elt->att('type');
      print "$type"."\n"; 
      my $id = $elt->att('id');
      print "$id"."\n";   
      my $kind = $elt->att('kind');
      print "$kind"."\n";
      
      #print $elt->text;     print the text (including sub-element texts)
      
#      foreach my $primary ( $elt -> first_child ( 'PartyName' ) -> first_child ('Property') -> children() )
#    {
#        my $kind = $primary -> att ( 'kind' );
#        print $kind;
         ### here you have the information you need to do the rest of your processing. 
#    }
    
      $t->purge;           # frees the memory
    }
#my $root = $twig->root;
#$root->print;
#my %players = $root->children;
#print Dumper %players;

#foreach my $key (keys \%players)
  {
    #print "$key->{pcdata}";
  }
#sub player
#  {
#    my ($twig, $player) = @_;
#    print Dumper $twig;
#  } 