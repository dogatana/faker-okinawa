#!/usr/bin/perl
#
# oki2vje.pl - ���켭��Υե������VJE-Delta�˻��äƹԤ��ƥ����Ȥ��Ѵ�����
#
#		$Id: oki2vje.pl,v 1.1.1.1 2005/11/04 00:14:15 ga2 Exp $
#
# ���Υ�����ץȤ�Ȥäơ��ʲ��Τ褦�ˡ�okinawa.txt�פ��������Ƥ����ơ�
#     $ nkf -e *.dic | ./oki2vje.pl | sort -u | nkf -s > okinawa.txt
#  VJE-Delta�μ���桼�ƥ���ƥ���ư����
# ���餫����֥ե������-�ֿ��������פ��äƤ���
# �֥ե�����]-�֥ƥ����Ȥ���Ͽ/����פ�okinawa.txt�򿩤碌�Ƥ���������
require 5.6.0;
use strict;
our $phonate;
our $word;
our $class;

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
		print "$phonate\t$word\t��̾���\n";
	}
	elsif ($class eq "����̾��") {
		print "$phonate\t$word\t��̾����\n";
	}
	elsif ($class eq "��ư̾��") {
		print "$phonate\t$word\t��̾����\n";
	}
	elsif ($class eq "��") {
		print "$phonate\t$word\t�ο�����\n";
	}
	elsif ($class eq "̾") {
		print "$phonate\t$word\t�ο�̾��\n";
	}
	elsif ($class eq "����¾�ο�̾") {
		print "$phonate\t$word\t�ο�̾��\n";
	}
	elsif ($class eq "ñ����̾") {
		print "$phonate\t$word\t����̾��\n";
	}
	elsif ($class eq "�������դ���̾") {
		print "$phonate\t$word\t����̾������ʬ��\n";
	}
	elsif ($class eq "�ȿ�̾") {
		print "$phonate\t$word\t���ȿ���\n";
	}
	elsif ($class eq "����¾��ͭ̾��") {
		print "$phonate\t$word\t�θ�̾��\n";
	}
	elsif ($class eq "����") {
		print "$phonate\t$word\t�������\n";
	}
	elsif ($class eq "��³��") {
		print "$phonate\t$word\t����³��\n";
	}
	elsif ($class eq "��ư��") {
		print "$phonate\t$word\t�δ�ư��\n";
	}
	elsif ($class eq "���ƻ�") {
		print "$phonate\t$word\t�η��ơ�\n";
	}
	elsif ($class eq "����ư��") {
		print "$phonate\t$word\t�η�ư��\n";
	}
	elsif ($class eq "��Ƭ��") {
		print "$phonate\t$word\t����Ƭ��\n";
	}
	elsif ($class eq "��������Ƭ��") {
		print "$phonate\t$word\t�δ�����\n";
	}
	elsif ($class eq "������") {
		print "$phonate\t$word\t��������\n";
	}
	elsif ($class eq "��̾������") {
		print "$phonate\t$word\t��������̾��\n";
	}
	elsif ($class eq "��̾������") {
		print "$phonate\t$word\t��������̾��\n";
	}
	elsif ($class eq "�ȿ�̾������") {
		print "$phonate\t$word\t��������\n";
	}
	elsif ($class eq "������������") {
		print "$phonate\t$word\t�ν�����\n";
	}
	elsif ($class eq "����") {
		print "$phonate\t$word\t��̾���\n";
	}
	elsif ($class eq "̵�ʻ�") {
		print "$phonate\t$word\t��ñ����\n";
	}
	else {
		print STDERR "Error: $.: unknown class `$class': $phonate\t$word\n";
		print "$phonate\t$word\t�΢���\n";
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
	print "�����ʤ露����ΤҤŤ�\t$year/$mon/$mday(���켭������դ�)\t��̾���\n";
}
