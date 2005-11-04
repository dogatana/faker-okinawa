#!/usr/bin/perl
#
# oki2msime.pl - ���켭��Υե������MS-IME�Ǽ������ƥ����ȷ������Ѵ����륹����ץ�
#							GANAHA Makoto ga@ganaha.org
#		$Id: oki2msime.pl,v 1.1.1.1 2005/11/04 00:14:15 ga2 Exp $
# ������:
#    �ʲ����ͤˡ�okinawa.txt�פ������
#    $ nkf -e *.dic | ./oki2msime.pl | sort -u | nkf -s > okinawa.txt
#    �桼��������˼�������
#     ��Microsoft IME ����ġ��� 2000�פ�ư���֥ġ���(T)��->�֥ƥ����� �ե����뤫�����Ͽ(T)�פ����okinawa.txt�פ������ǲ�������
#    �����ƥ༭������������
#     ��Microsoft IME ����ġ��� 2000�פ�ư���֥ե�����(F)��->�ֿ�������(N)�פ����ߡ��Υ桼���������������ޤ���
#     �֥ġ���(T)��->�֥ƥ����� �ե����뤫�����Ͽ(T)�פ����okinawa.txt�פ������ǲ�������
#     �֥ġ���(T)��->�֥����ƥ༭��κ���(S)�פ��饷���ƥ༭���������ޤ���
#     ���ߡ��Υ桼��������Ϥ���ޤ���ΤǺ�����Ƥ���������
#
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
		print "$phonate\t$word\t̾��\n";
	}
	elsif ($class eq "����̾��") {
		print "$phonate\t$word\t����̾��\n";
	}
	elsif ($class eq "��ư̾��") {
		print "$phonate\t$word\t��ư̾��\n";
	}
	elsif ($class eq "��") {
		print "$phonate\t$word\t��\n";
	}
	elsif ($class eq "̾") {
		print "$phonate\t$word\t̾\n";
	}
	elsif ($class eq "����¾�ο�̾") {
		print "$phonate\t$word\t��̾\n";
	}
	elsif ($class eq "ñ����̾") {
		print "$phonate\t$word\t��̾����¾\n";
	}
	elsif ($class eq "�������դ���̾") {
		print "$phonate\t$word\t��̾������\n";
	}
	elsif ($class eq "�ȿ�̾") {
		print "$phonate\t$word\t��ͭ̾��\n";
	}
	elsif ($class eq "����¾��ͭ̾��") {
		print "$phonate\t$word\t��ͭ̾��\n";
	}
	elsif ($class eq "����") {
		print "$phonate\t$word\t����\n";
	}
	elsif ($class eq "��³��") {
		print "$phonate\t$word\t��³��\n";
	}
	elsif ($class eq "��ư��") {
		print "$phonate\t$word\t��ư��\n";
	}
	elsif ($class eq "���ƻ�") {
		print "$phonate\t$word\t���ƻ�\n";
	}
	elsif ($class eq "����ư��") {
		print "$phonate\t$word\t����ư��\n";
	}
	elsif ($class eq "��Ƭ��") {
		print "$phonate\t$word\t��Ƭ��\n";
	}
	elsif ($class eq "��������Ƭ��") {
		print "$phonate\t$word\t��Ƭ��\n";
	}
	elsif ($class eq "������") {
		print "$phonate\t$word\t������\n";
	}
	elsif ($class eq "��̾������") {
		print "$phonate\t$word\t��̾������\n";
	}
	elsif ($class eq "��̾������") {
		print "$phonate\t$word\t��̾������\n";
	}
	elsif ($class eq "�ȿ�̾������") {
		print "$phonate\t$word\t������\n";
	}
	elsif ($class eq "������������") {
		print "$phonate\t$word\t������\n";
	}
	elsif ($class eq "����") {
		print "$phonate\t$word\t̾��\n";
	}
	elsif ($class eq "̵�ʻ�") {
		print "$phonate\t$word\t̾��\n";
	}
	else {
		print STDERR "Error: $.: unknown class `$class': $phonate\t$word\n";
		print "$phonate\t$word\t��\n";
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
	print "�����ʤ露����ΤҤŤ�\t$year/$mon/$mday(���켭������դ�)\t̾��\n";	# !!!
}
