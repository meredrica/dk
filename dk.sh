#!/bin/sh


case $1 in
	help | h | --help | -h)
		echo 'arguments n[uke], l[og], b[ackground], f[ollow], r[ebuild]'
		;;
	background | b)
		shift 1
		docker-compose up -d $@
		;;
	rebuild | r)
		shift 1
		docker-compose up -d --build $@
		docker-compose logs -f $@
		;;
	follow | f )
		shift 1
		docker-compose up -d $@
		docker-compose logs -f $@
		;;
	edit | e)
		$EDITOR docker-compose.yml
		;;
	nuke | n)
		shift 1
		docker-compose down --volumes --remove-orphans --rmi local $@
		;;
	log | l)
		shift 1
		docker-compose logs -f $@
		;;
	*)
		docker-compose $@
		;;
esac
