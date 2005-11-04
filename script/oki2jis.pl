#!/usr/bin/perl
#
# oki2jis.pl - ���켭��Υե������ JIS X 4062 �η����Υƥ����Ȥ��Ѵ�����
#
#		$Id: oki2jis.pl,v 1.1.1.1 2005/11/04 00:14:15 ga2 Exp $
#
# ���Υ�����ץȤ�Ȥäơ��ʲ��Τ褦�ˡ�okinawa.txt�פ��������Ƥ���������
#     $ nkf -e *.dic | ./oki2vje.pl | sort -u | nkf -s > okinawa.txt
# ��Ⱦ��nkf�Υ��ץ������������Թ�˹�碌���ѹ����Ƥ���������
require 5.6.0;
use strict;
our $phonate;
our $word;
our $class;

&header;
while (<>) {
	s/#.*$//;		# `#'�ܹԤ�����
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
		print "$phonate,$word,$class\n";	# !!!
	}
	elsif ($class eq "����̾��") {
		print "$phonate,$word,$class\n";
	}
	elsif ($class eq "��ư̾��") {
		print "$phonate,$word,$class\n";
	}
	elsif ($class eq "��") {
		print "$phonate,$word,$class\n";
	}
	elsif ($class eq "̾") {
		print "$phonate,$word,$class\n";
	}
	elsif ($class eq "����¾�ο�̾") {
		print "$phonate,$word,$class\n";
	}
	elsif ($class eq "ñ����̾") {
		print "$phonate,$word,$class\n";
	}
	elsif ($class eq "�������դ���̾") {
		print "$phonate,$word,$class\n";
	}
	elsif ($class eq "�ȿ�̾") {
		print "$phonate,$word,$class\n";	# !!!
	}
	elsif ($class eq "����¾��ͭ̾��") {
		print "$phonate,$word,����¾�θ�ͭ̾��\n";
	}
	elsif ($class eq "����") {
		print "$phonate,$word,$class\n";
	}
	elsif ($class eq "��³��") {
		print "$phonate,$word,$class\n";
	}
	elsif ($class eq "��ư��") {
		print "$phonate,$word,$class\n";
	}
	elsif ($class eq "���ƻ�") {
		print "$phonate,$word,$class\n";
	}
	elsif ($class eq "����ư��") {
		print "$phonate,$word,$class\n";
	}
	elsif ($class eq "��Ƭ��") {			# !!!
		print "$phonate,$word,$class\n";
	}
	elsif ($class eq "��������Ƭ��") {
		print "$phonate,$word,$class\n";
	}
	elsif ($class eq "������") {
		print "$phonate,$word,$class\n";
	}
	elsif ($class eq "��̾������") {
		print "$phonate,$word,$class\n";
	}
	elsif ($class eq "��̾������") {
		print "$phonate,$word,$class\n";
	}
	elsif ($class eq "�ȿ�̾������") {
		print "$phonate,$word,$class\n";
	}
	elsif ($class eq "������������") {
		print "$phonate,$word,$class\n";
	}
	elsif ($class eq "����") {
		print "$phonate,$word,$class\n";	# !!!
	}
	elsif ($class eq "̵�ʻ�") {
		print "$phonate,$word,$class\n";
	}
	else {
		print STDERR "Error: $.: unknown class `$class': $phonate\t$word\n";
		print "$phonate,$word,$class\n";
	}
}


sub header {
	my($year, $mon, $mday);
	my($hour, $min, $sec);

	($sec, $min, $hour, $mday, $mon, $year) = localtime(time());
	$year += 1900;
	$mon++;
	print ",,\"Ŭ�絬��=JIS X 4062:1998\"\n";
	print ",,\"ɽ��=���켭��\"\n";
	print ",,\"ʬ��=ΰ�塢����\"\n";
	print ",,\"��=��$year/$mon/$mday��\"\n";
	print ",,\"�Լ�=���켭��ץ�������\"\n";
	print ",,\"������=$year-$mon-$mday\"\n";
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
	print "�����ʤ露����ΤҤŤ�,$year/$mon/$mday(���켭������դ�),̵�ʻ�\n";
}
