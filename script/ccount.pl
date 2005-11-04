#!/usr/bin/perl
#
# ccount.pl - ���켭����ʻ�°������ऴ�Ȥ˽���
#
#		$Id: ccount.pl,v 1.1.1.1 2005/11/04 00:14:15 ga2 Exp $
#
#     $ nkf -e *.dic | ./ccount.pl | sort | uniq -c
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
		&check_class;
	}
	else {
		print STDERR "Error: $.: too few field number `$_'\n";
		print  "$_";
	}
}
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


sub check_class {
	if ($class eq "����̾��") {
		print "$class\n";
	}
	elsif ($class eq "����̾��") {
		print "$class\n";
	}
	elsif ($class eq "��ư̾��") {
		print "$class\n";
	}
	elsif ($class eq "��") {
		print "$class\n";
	}
	elsif ($class eq "̾") {
		print "$class\n";
	}
	elsif ($class eq "����¾�ο�̾") {
		print "$class\n";
	}
	elsif ($class eq "ñ����̾") {
		print "$class\n";
	}
	elsif ($class eq "�������դ���̾") {
		print "$class\n";
	}
	elsif ($class eq "�ȿ�̾") {
		print "$class\n";
	}
	elsif ($class eq "����¾��ͭ̾��") {
		print "$class\n";
	}
	elsif ($class eq "����") {
		print "$class\n";
	}
	elsif ($class eq "��³��") {
		print "$class\n";
	}
	elsif ($class eq "��ư��") {
		print "$class\n";
	}
	elsif ($class eq "���ƻ�") {
		print "$class\n";
	}
	elsif ($class eq "����ư��") {
		print "$class\n";
	}
	elsif ($class eq "��Ƭ��") {
		print "$class\n";
	}
	elsif ($class eq "��������Ƭ��") {
		print "$class\n";
	}
	elsif ($class eq "������") {
		print "$class\n";
	}
	elsif ($class eq "��̾������") {
		print "$class\n";
	}
	elsif ($class eq "��̾������") {
		print "$class\n";
	}
	elsif ($class eq "�ȿ�̾������") {
		print "$class\n";
	}
	elsif ($class eq "������������") {
		print "$class\n";
	}
	elsif ($class eq "����") {
		print "$class\n";
	}
	elsif ($class eq "̵�ʻ�") {
		print "$class\n";
	}
	else {
		print STDERR "Error: $.: unknown class `$class': $phonate\t$word\n";
		print "$class\n";
	}
}
