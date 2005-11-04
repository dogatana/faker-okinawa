#!/usr/bin/perl
#
# oki2kotoeri.pl - ���켭��Υե�����򤳤Ȥ���3.1���ɤ߹��������Υƥ����Ȥ��Ѵ�
#
#		$Id: oki2kotoeri.pl,v 1.1.1.1 2005/11/04 00:14:15 ga2 Exp $
#
# ���Υ�����ץȤ�Ȥäơ��ʲ��Τ褦�ˡ�okinawa.txt�פ��������Ƥ���������
#     $ nkf -e *.dic | ./oki2kotoeri.pl | sort -u | nkf -s > okinawa.txt
# �ɤߤ�20ʸ�����⡢ñ���32ʸ������Ǥ���
# 
# ��˥塼�С��α�ɮ��˥塼�����ñ����Ͽ/�����Խ�...�פ����ӡ�
# �֤��Ȥ���ñ����Ͽ�ץ���������Ф���
# ��˥塼�С��Ρּ���ץ�˥塼�Ρֿ����桼��������κ���...�פ�����
# ��̾����¸��ˡ�okinawa.dic�פȵ��������ΤȤ��ˡ־��פ���Dictionaries�פ�
# �ʤäƤ��뤳�Ȥ��ǧ���ơ�����¸�ץܥ���򲡤���
# �֤��Ȥ���ñ����Ͽ�ץ������������Ρּ���פΤȤ���ǡ�okinawa.dic�פ����֡�
# ��˥塼�С��Ρּ���ץ�˥塼�Ρ֥ƥ����Ȥ伭�񤫤������...�פ����ӡ�
# ��������ۤ��������Ƥ�������okinawa.txt�פ���ꡣ(����ǡֳ����פ򲡤�)
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
	if ($class eq "����̾��") {			# OK
		print "$phonate,$word,$class\n";
	}
	elsif ($class eq "����̾��") {			# OK
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
		print "$phonate,$word,$class\n";
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
	elsif ($class eq "���ƻ�") {			# OK
		print "$phonate,$word,$class\n";
	}
	elsif ($class eq "����ư��") {			# OK
		print "$phonate,$word,$class\n";
	}
	elsif ($class eq "��Ƭ��") {			# *
		print "$phonate,$word,����̾��\n";
	}
	elsif ($class eq "��������Ƭ��") {		# OK
		print "$phonate,$word,$class\n";
	}
	elsif ($class eq "������") {			# *
		print "$phonate,$word,����̾��\n";
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
		print "$phonate,$word,$class\n";
	}
	elsif ($class eq "̵�ʻ�") {			# OK
		print "$phonate,$word,$class\n";
	}
	else {
		print STDERR "Error: $.: unknown class `$class': $phonate\t$word\n";
		print "$phonate,$word,$class\n";
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
	print "�����ʤ露����ΤҤŤ�,$yearǯ$mon��$mday��(���켭������դ�),̵�ʻ�\n";
}
