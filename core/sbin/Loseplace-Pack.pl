#!/usr/bin/perl -w
use strict;

my $path=shift;

die("Usage: $0 <Path> [Version] [Strip Level]\n") unless($path);

die("Fatal, Path not accessible: $path\n") unless(-e $path);

my $version=shift;
my $cut=shift;
$cut = '1' unless($cut);

$path =~ s/\/+$//;
$path =~ s/\/{2,}/\//g;
my $name;
if($path =~ m/\/([^\/]+)$/) {
	$name = $1;
}
else {
	die("Invalid path.\n");
}

if($version) {
	$name = $name . "_" . $version;
}
$name = $name . ".tar.bz2";

my @paths = split(/\//,$path);
my $parent;
while($cut >= 0) {
	my $cur = shift @paths;
	$cur = '/' unless($cur);
	$parent = $parent ? $parent . '/' . $cur : $cur;
	$cut--;
}

$parent =~ s/\/{2,}/\//g;
$path = join('/',@paths);
$path =~ s/\/{2,}/\//g;

exec(qw/tar -cvjf/,$name,'-C',$parent,$path);

