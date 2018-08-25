#!/usr/bin/perl
# parse cnky vars and eval @expression@ in text part

use strict;
use Safe;
my $pack = new Safe();
sub replace{
    my ($a,$body,$c) =@_;
    $body =~ s/@(.*?)@/$pack->reval($1)/gse;
    return $a.$body.$c;
};
my $config = join('',<>);
if($config =~ m/conky\.config\s*=\s*\{(.+?)\}/s){
    my $vars = "$1,";
    while($vars =~ m/\s*([a-z0-9_]+)\s*=\s*(.+?)\s*,/gs){
	${$pack->varglob($1)} = $2;
    };
   };
$config =~ s/(conky\.text\s*=\s*\[\[)(.*?)(\]\])/replace($1,$2,$3)/se;
print $config;
