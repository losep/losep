#!/usr/bin/perl -w
print STDERR "Loading common setting\n";
use Data::Dumper;

our $loot_cmd;
our $loot_all_cmd;
our $loot_all;
our @loot_what;

sub lootx {
	my($ob,$ev) = @_;
	return unless($ob);
	$ob = lc($ob);
	if($loot_include) {
		return unless($ob =~ $loot_include);
	}
	if($loot_exclude) {
		return unless($ob !~ $loot_exclude);
	}
	if(defined $ev && $ev) {
		$world->send("$loot_cmd $ob $ev");
	}
	else {
		$world->send("$loot_cmd $ob");
	}
}

sub loot {
	return unless(@loot_what);
	my $str = shift;
	if($str) {
		$str =~ s/^\s*//;
		$str=" $str";
	}
	else {
		$str="";
	}
	$loot_cmd = "get" unless($loot_cmd);
	$loot_all_cmd = "$loot_cmd all" unless($loot_all_cmd);
	&send_brief("loot$str",
		$loot_all ? 
		"$loot_all_cmd" . "$str" : 
		map("$loot_cmd $_$str",@loot_what)
	);
}

sub prefix {
	my ($str,@p) = @_;
	return map("$str $_",@p);
}

sub prefix_send {
	$world->send(prefix(@_));
}

sub prefix_cmd {
	return join("%;",prefix(@_));
}

sub suffix {
	my ($str,@p) = @_;
	return map("$_ $str",@p);
}

sub suffix_send {
	$world->send(prefix(@_));
}

sub suffix_cmd {
	return join("%;",prefix(@_));
}

sub send_alias {
	&send_brief(@_);
}

sub send_brief {
	my($a,@cmd) = @_;
	dprint("send_brief:$a->(" . join(",",@cmd) . ")");
	$world->sendnoecho(@cmd);
}

sub qs {
	foreach(@_) {
		$world->send(split(/\s*;\s*/,$_));
	}
}

sub dump_var {
	my ($var,$name) = @_;
	return undef unless($var);
	$name = "VAR" unless($name);
	$world->echo(Data::Dumper->Dump([$var],[$name]),"\n");
}

sub random_int {
	my($min,$max)=@_;
	return int(rand($max - $min + 1)) + $min;
}

sub random_send {
	my $pick = $_[random_int(0,scalar(@_)-1)];
	if($pick) {
		&dprint("random_send (@_) = $pick");
		$world->send($pick);
	}
	else {
		&dprint("random_send get @_,produce nothing!");
	}
}
sub test_in_list {
	my $target=shift;
	my @list=@_;
	foreach(@list) {
		if($target eq $_) {
			return 1;
		}
	}
	return undef;
}

sub random_exit {
	my $str = shift;
	my $exclude = shift;
	$exclude = '^\s*$' unless($exclude);
	$str =~ s/[^a-zA-Z]/ /g;
	my @exits = grep(!/$exclude/,split(/\s+/,$str));
	my $result = $exits[random_int(0,@exits-1)];
	print STDERR "Random_Exit:($str)->!/$exclude/->" . join(" ",@exits) . "->$result\n";
	return $result;
}

sub to_arg {
    my @args;
    foreach(@_) {
        push @args,split(/\s*,\s*/,$_);
    }
    return @args;
}

sub dprint {
	$world->echo(colorize("&W^B&="));
	$world->echo("[Common] ",@_);
#	$world->echo("[MyPlace::KildClient::Common] ",@_);
	$world->echo(colorize("&0"));
	$world->echo("\n");
}
sub delay {
	my $secs = shift;
	unless(@_ and $secs =~ /^[0-9]+$/) {
		dprint("Invalid usage of delay.");
		return undef;
	}
	dprint("Will run @_ in $secs (second)");
	$world->timer({
		'interval'=>$secs,
		'count'=>1,
		'temporary'=>1,
		'enabled'=>1,
		'action'=>join(" ",@_),
	});
}
sub action {
	my $cmd = shift;
	return unless($cmd);
	$world->timer({
		'interval'=>1,
		'count'=>1,
		'temporary'=>1,
		'enabled'=>1,
		'action'=>$cmd,
	});
}
sub repeat {
	my $times = shift;
	return undef unless($times);
	$world->echo("#" . $times . " " . join(" ",@_),"\n");
	while($times >0) {
		$times--;
		$world->sendnoecho(@_);
	}
}
sub check_idle {
	my $min = shift;
	my @action = @_;
	return unless(@action);
	return unless($min and $min =~ /^[0-9]+/);
	my $idle = $world->getidletime();
	if($idle >= $min) {
		dprint("seconds of idle exceeded $min");
		return delay(3,@action);
	}
	return undef;
}

sub world_modify {
    return unless $world;
    my($action,$name,$flag,@args) = @_;
    return unless $name;
    $flag = "rt" unless($flag);
    $flag = lc($flag);
    my $func;
    if($flag =~ /r/) {
        $func = $action . "trigger";
        $world->$func($name,@args);
    }
    if($flag =~ /t/) {
        $func = $action . "timer";
        $world->$func($name,@args);
    }
    if($flag =~ /m/) {
        $func = $action . "macro";
        $world->$func($name,@args);
    }
    if($flag =~ /a/) {
        $func = $action . "alias";
        $world->$func($name,@args);
    }
}

sub enable {
    return world_modify("ena",@_);
}

sub disable {
    return world_modify("dis",@_);
}
sub delete {
    return world_modify("del",@_);
}
sub list {
    return world_modify("list",@_);
}
if($world) {
	sub _func {
		my ($func,$key,$action,%attr) = @_;
		$attr{name} = $key unless($attr{name});
		$attr{name} =~ s/[\<\>\*\.\+\\\/#\(\)\^]//g;
		$attr{name} = "Common::" . $attr{name};
		dprint("$func:[$attr{name}]$key -> $action");
		my $delfunc = "del$func";
		$world->$delfunc($attr{name});
		return $world->$func($key,$action,\%attr);
	}
	sub _m {
		return _func("macro",@_);
	}
	sub _t {
		return _func("trigger",@_);
	}
	sub _a {
		return _func("alias",@_);
	}
	sub _timer {
		my %attr = @_;
		if($attr{name}) {
			$world->deltimer($attr{name});
		}
		dprint("Add timer:" . join(" ",values %attr));
		$world->timer(\%attr);
	}
	_m('<MOD2>KP_1','southwest');
	_m('<MOD2>KP_2','south');
	_m('<MOD2>KP_3','southeast');
	_m('<MOD2>KP_4','west');
	_m('<MOD2>KP_5','look');
	_m('<MOD2>KP_6','east');
	_m('<MOD2>KP_7','northwest');
	_m('<MOD2>KP_8','north');
	_m('<MOD2>KP_9','northeast');
	_a('^#(\d+)\s+(.*)','/repeat $1,"$2"','name','repeat');
	_a('^#qs\s+(.+)$','/qs "$1"','name','quicksend');
	_timer(
		'name'=>'check_idle',
		'action'=>'/check_idle 60,"idle_action"',
		'interval'=>60,
		'count'=>-1,
		'enabled'=>1,
	);
	_a(
		'^loot(\s*|\s+[^\s]+\s*)$',
		'/loot("$1")',
		'name'=>'loot'
	);
        _a(
            '^\+\s*(.*)$',
            '/enable(to_arg("$1"))',
            'name'=>'enable'
        );
        _a(
            '^\-\s*(.*)$',
            '/disable(to_arg("$1"))',
            'name'=>'disable'
        );
}
1;
