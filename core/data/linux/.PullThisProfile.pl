#!/usr/bin/perl -w
use strict;
use warnings;


my $source_directory;
my $target_directory;

use Cwd;
use File::Glob qw/bsd_glob/;

sub usage {
	return <<EOF
------------------------------------------------------------------
| Usage:
|	$0
|	$0 {target_directory}
|	$0 {source_directory} {target_directory}
------------------------------------------------------------------
EOF
}

foreach(@ARGV) {
	if($_ eq '-h' or $_ eq '--help') {
		die(&usage(),"\n");
	}
}

if(!@ARGV) {
	$source_directory=$0;
	$source_directory=~ s/^\.\///;
	$source_directory=~ s/\/[^\/]*$//;
	if(!$source_directory) {
		die(&usage,"\n");
	}
	else {
		$target_directory=getcwd();
	}
}
elsif(@ARGV > 1) {
	($source_directory,$target_directory)=@ARGV;
}
else {
	$source_directory=$0;
	$source_directory=~ s/^\.\///;
	$source_directory=~ s/\/[^\/]*$//;
	if(!$source_directory) {
		$source_directory = ".";
	}
	$target_directory=shift(@ARGV);
	
}

print STDERR "Source directory:  $source_directory\n";
print STDERR "Target directory:  $target_directory\n";
if(not (-d $source_directory and -d $target_directory)) {
	print STDERR "Directory not exist.\n";
	die(&usage,"\n");
}
my @files_err;


sub system_exec {
    #return system('echo',@_)==0;
    #print STDERR join(" ",@_),"\n";
    if(system(@_)==0) {
        foreach (@_) {
            my $arg =$_;
            $arg =~ s/^.*\///;
            print STDERR $arg," ";
        }
        print STDERR "[OK]\n";
        return 1;
    }
    else {
        return undef;
    }
}



sub pushing {
    my($source_directory,$target_directory,$prefix) = @_;
    foreach my $filename (bsd_glob("$source_directory/*"),bsd_glob("$source_directory/.*")) {
        if($filename =~ /\/\./) {
            print STDERR "\"$filename\" \t[Ignored]\n";
            next;
        }
        elsif($filename =~ /\/(config|local)$/) {
            unless(-d "$target_directory/$prefix$1") {
                system_exec(qw/mkdir/,"$target_directory/$prefix$1")
                    or push @files_err, "[mkdir] $prefix$1";
            }
            &pushing("$filename","$target_directory/$prefix$1","");
        }
        elsif($filename =~ /\/local\/(share)$/) {
            unless(-d "$target_directory/$prefix$1") {
                system_exec(qw/mkdir/,"$target_directory/$prefix$1")
                    or push @files_err, "[mkdir] $prefix$1";
            }
            &pushing("$filename","$target_directory/$prefix$1","");
        }
        else {
            my $basename = $filename;
            $basename =~ s/^.*\///;
            if($basename =~ m/^#(.+)$/) {
                $basename = $1;
                if(-l $filename) {
                    system_exec(qw/cp -aT/,$filename,"$target_directory/$basename")
                        or push @files_err,"[cp] $filename ->$basename";
                }
                else {
                    system_exec(qw/ln -sfT/,$filename,"$target_directory/$basename")
                        or push @files_err,"[ln] $filename ->$basename";
                }
            }
            else {
                system_exec(qw/ln -sfT/,$filename,"$target_directory/$prefix$basename")
                    or push @files_err,"[ln] $filename ->$basename";
            }
        }
    }
}

&pushing($source_directory,$target_directory,".");

if(@files_err) {
    print STDERR "Error occurred while processing files:\n";
    print STDERR join("\n",@files_err);
    exit 1;
}
exit 0;



 
