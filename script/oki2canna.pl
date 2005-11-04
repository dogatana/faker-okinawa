#!/usr/bin/perl
#
# oki2canna.pl - ���켭��Υե������Canna�˻��äƹԤ�����Υ�����ץ�
#							�����ä
#		$Id: oki2canna.pl,v 1.1.1.1 2005/11/04 00:14:15 ga2 Exp $
# ������:
#    $ nkf -e *.dic | ./oki2canna.pl | sort -u > okinawa.txt
#    $ mkbindic okinawa.txt
require 5.6.0;
use strict;
our $phonate;
our $word;
our $class;

while (<>) {
	s/#.*$//;		# `#'�ʹߤ�����
	next if (/^\s*$/);	# ���η�̶��Ԥˤʤä��Ԥ��ɤ����Ф���
	if (/(\S+)\s+(\S+)\s+(\S+)/) {
		$phonate  = $1;	# �ɤ�
		$word = $2;	# ñ��
		$class = $3;	# �ʻ�
		&check_phonate;
		&check_word;
		&convert_class;
	}
	else {
		print STDERR "Error: $.: too few field number `$_'\n";
		print  "$_";
	}
}
&version;
exit 0;


sub check_phonate
{
	if (length($phonate) > 40) {
		print STDERR "Warning: $.: too long phonate `$phonate'\n";
	}
	if ($phonate =~ /[^�����������������������������������ĤƤȤʤˤ̤ͤΤϤҤդؤۤޤߤ�����������������������������¤ŤǤɤФӤ֤٤ܤ����������ä����ѤԤפڤݤ���������]/) {
		print STDERR "Warning: $.: ilegal character in `$phonate'\n";
	}
}


sub check_word
{
	if (length($word) > 64) {
		print STDERR "Warning: $.: too long word `$word'\n";
	}
	if ($word =~ /[ \t",#]/) {
		print STDERR "Warning: $.: ilegal character in `$word'\n";
	}
}


sub convert_class {
	if ($class eq "����̾��") {
		print "$phonate #T35 $word\n";
	}
	elsif ($class eq "����̾��") {
		print "$phonate #T30 $word\n";
	}
	elsif ($class eq "��ư̾��") {
		print "$phonate #T05 $word\n";
	}
	elsif ($class eq "��") {
		print "$phonate #JNS $word\n";
	}
	elsif ($class eq "̾") {
		print "$phonate #JNM $word\n";
	}
	elsif ($class eq "����¾�ο�̾") {
		print "$phonate #JN $word\n";
	}
	elsif ($class eq "ñ����̾") {
		print "$phonate #CN $word\n";
	}
	elsif ($class eq "�������դ���̾") {
		print "$phonate #CN $word\n";
	}
	elsif ($class eq "�ȿ�̾") {
		print "$phonate #KK $word\n";
	}
	elsif ($class eq "����¾��ͭ̾��") {
		print "$phonate #T35 $word\n";		# !!! #CK?  #KK?
	}
	elsif ($class eq "����") {
		print "$phonate #F04 $word\n";
	}
	elsif ($class eq "��³��") {
		print "$phonate #F04 $word\n";
	}
	elsif ($class eq "��ư��") {
		print "$phonate #CJ $word\n";
	}
	elsif ($class eq "���ƻ�") {
		print "$phonate #T35 $word\n";		# !!!
	}
	elsif ($class eq "����ư��") {
		print "$phonate #T05 $word\n";
	}
	elsif ($class eq "��Ƭ��") {
		print "$phonate #PRE $word\n";
	}
	elsif ($class eq "��������Ƭ��") {
		print "$phonate #PRE $word\n";
	}
	elsif ($class eq "������") {
		print "$phonate #T35 $word\n";		# !!!
	}
	elsif ($class eq "��̾������") {
		print "$phonate #T35 $word\n";		# !!!
	}
	elsif ($class eq "��̾������") {
		print "$phonate #T35 $word\n";		# !!!
	}
	elsif ($class eq "�ȿ�̾������") {
		print "$phonate #T35 $word\n";		# !!!
	}
	elsif ($class eq "������������") {
		print "$phonate #T35 $word\n";		# !!!
	}
	elsif ($class eq "����") {
		print "$phonate #T35 $word\n";		# !!!
	}
	elsif ($class eq "̵�ʻ�") {
		print "$phonate #KJ $word\n";
	}
	else {
		print STDERR "Error: $.: unknown class `$class': $phonate\t$word\n";
		print "$phonate �� $word\n";
	}
}

sub version {
	my $sec;
	my $min;
	my $hour;
	my $mday;
	my $mon;
	my $year;

	($sec, $min, $hour, $mday, $mon, $year) = localtime(time());
	$year += 1900;
	$mon++;
	print "�����ʤ露����ΤҤŤ� #T35 $year/$mon/$mday(���켭������դ�)\n";	# !!!
}
