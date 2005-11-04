#!/usr/bin/perl
#
# wcount.pl - ���켭���ñ�����ե����뤴�Ȥ˽���
#
#		$Id: wcount.pl,v 1.1.1.1 2005/11/04 00:14:15 ga2 Exp $
#
#     # foreach i (*.dic)
#		nkf -e $i | ./wcount.pl | wc -l
#		echo $i
#     end
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
		print "$phonate\t$word\tclass\n";
	}
	elsif ($class eq "����̾��") {
		print "$phonate\t$word\tclass\n";
	}
	elsif ($class eq "��ư̾��") {
		print "$phonate\t$word\tclass\n";
	}
	elsif ($class eq "��") {
		print "$phonate\t$word\tclass\n";
	}
	elsif ($class eq "̾") {
		print "$phonate\t$word\tclass\n";
	}
	elsif ($class eq "����¾�ο�̾") {
		print "$phonate\t$word\tclass\n";
	}
	elsif ($class eq "ñ����̾") {
		print "$phonate\t$word\tclass\n";
	}
	elsif ($class eq "�������դ���̾") {
		print "$phonate\t$word\tclass\n";
	}
	elsif ($class eq "�ȿ�̾") {
		print "$phonate\t$word\tclass\n";
	}
	elsif ($class eq "����¾��ͭ̾��") {
		print "$phonate\t$word\tclass\n";
	}
	elsif ($class eq "����") {
		print "$phonate\t$word\tclass\n";
	}
	elsif ($class eq "��³��") {
		print "$phonate\t$word\tclass\n";
	}
	elsif ($class eq "��ư��") {
		print "$phonate\t$word\tclass\n";
	}
	elsif ($class eq "���ƻ�") {
		print "$phonate\t$word\tclass\n";
	}
	elsif ($class eq "����ư��") {
		print "$phonate\t$word\tclass\n";
	}
	elsif ($class eq "��Ƭ��") {
		print "$phonate\t$word\tclass\n";
	}
	elsif ($class eq "��������Ƭ��") {
		print "$phonate\t$word\tclass\n";
	}
	elsif ($class eq "������") {
		print "$phonate\t$word\tclass\n";
	}
	elsif ($class eq "��̾������") {
		print "$phonate\t$word\tclass\n";
	}
	elsif ($class eq "��̾������") {
		print "$phonate\t$word\tclass\n";
	}
	elsif ($class eq "�ȿ�̾������") {
		print "$phonate\t$word\tclass\n";
	}
	elsif ($class eq "������������") {
		print "$phonate\t$word\tclass\n";
	}
	elsif ($class eq "����") {
		print "$phonate\t$word\tclass\n";
	}
	elsif ($class eq "̵�ʻ�") {
		print "$phonate\t$word\tclass\n";
	}
	else {
		print STDERR "Error: $.: unknown class `$class': $phonate\t$word\n";
		print "$phonate\t$word\tclass\n";
	}
}
