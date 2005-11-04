#!/usr/bin/perl
#
# oki2atk.pl - ���켭��Υե������ATOK13�������Ѵ����롣
#
#                                                         yonesu@syon.co.jp
#
# ���Υ�����ץȤ�Ȥäơ��ʲ��Τ褦�ˡ�okinawa.txt�פ��������Ƥ����ơ�
#     $ nkf -e *.dic | ./oki2atk.pl | sort -u | nkf -s > okinawa.txt
#  ATOK13�μ���桼�ƥ���ƥ���ư����
# �ְ�����]-��ñ��������פΡ�ñ��ե�����(T)�פ�
#  okinawa.txt����ꤷ������Ͽ�פ򲡲����Ƥ���������
#
#############################################################################
#                          ATOK13�Ǥ��ʻ��η�                               #
#1  ̾��	2  ��ͭ����	3  ��ͭ��̾	4  ��ͭ��¾	5  ��ͭ��̾ #
#6  ��ͭ�ȿ�	7  ��ͭ����	8  ��ͭ����	9  ̾�쥵��	10 ̾�쥶�� #
#11 ̾���ư	12 ̾����ư	13 ����		14 ����		15 Ϣ�λ�   #
#16 ��³��	17 ��ư��	18 ��Ω��	19 ��Ƭ��	20 ������   #
#21 ������	22 ������	23 ���Ը���	24 ���Ը���	25 ���Ը��� #
#26 ���Ը���	27 �ʹԸ���	28 �йԸ���	29 �޹Ը���	30 ��Ը��� #
#31 ��Ը���	32 �ϹԻ���	33 ����ư��	34 ����ư��	35 ����ư�� #
#36 ����ư��	37 ���ƻ�	38 ���ƻ쥦	39 ����ư��	40 ��ư���� #
#41 ñ����                                                                  #
#############################################################################
#
#require 5.6.0;
#use strict;
#our $phonate;
#our $word;
#our $class;

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
	if ($phonate =~ /[^�����������������������������������ĤƤȤʤˤ̤ͤΤϤҤդؤۤޤ�
������������������������������¤ŤǤɤФӤ֤٤ܤ����������ä����ѤԤפڤݤ��
��������]/) {
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
		print "$phonate\t$word\t 1 \n";
	}
	elsif ($class eq "����̾��") {
		print "$phonate\t$word\t 9 \n";
	}
	elsif ($class eq "��ư̾��") {
		print "$phonate\t$word\t 11 \n";
	}
	elsif ($class eq "��") {
		print "$phonate\t$word\t 2 \n";
	}
	elsif ($class eq "̾") {
		print "$phonate\t$word\t 3 \n";
	}
	elsif ($class eq "����¾�ο�̾") {
		print "$phonate\t$word\t 4 \n";
	}
	elsif ($class eq "ñ����̾") {
		print "$phonate\t$word\t 5 \n";
	}
	elsif ($class eq "�������դ���̾") {
		print "$phonate\t$word\t 5 \n";
	}
	elsif ($class eq "�ȿ�̾") {
		print "$phonate\t$word\t 6 \n";
	}
	elsif ($class eq "����¾��ͭ̾��") {
		print "$phonate\t$word\t 7 \n";
	}
	elsif ($class eq "����") {
		print "$phonate\t$word\t 14 \n";
	}
	elsif ($class eq "��³��") {
		print "$phonate\t$word\t 16 \n";
	}
	elsif ($class eq "��ư��") {
		print "$phonate\t$word\t 17 \n";
	}
	elsif ($class eq "���ƻ�") {
		print "$phonate\t$word\t 37 \n";
	}
	elsif ($class eq "����ư��") {
		print "$phonate\t$word\t 39 \n";
	}
	elsif ($class eq "��Ƭ��") {
		print "$phonate\t$word\t 19 \n";
	}
	elsif ($class eq "��������Ƭ��") {
		print "$phonate\t$word\t 20 \n";
	}
	elsif ($class eq "������") {
		print "$phonate\t$word\t 21 \n";
	}
	elsif ($class eq "��̾������") {
		print "$phonate\t$word\t 21 \n";
	}
	elsif ($class eq "��̾������") {
		print "$phonate\t$word\t 21 \n";
	}
	elsif ($class eq "�ȿ�̾������") {
		print "$phonate\t$word\t 21 \n";
	}
	elsif ($class eq "������������") {
		print "$phonate\t$word\t 13 \n";
	}
	elsif ($class eq "����") {
		print "$phonate\t$word\t 1 \n";
	}
	elsif ($class eq "̵�ʻ�") {
		print "$phonate\t$word\t 41 \n";
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

sub header {
	print "!!DICUT16\n";
}

