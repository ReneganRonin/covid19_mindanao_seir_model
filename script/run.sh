#!/bin/bash

: ${RUN_ONCE=no}
: ${RUN_DURATION_MINUTES=2880}

while true; do
	echo "`date`: Starting the project... "
	julia --project=. -e "using Pkg; Pkg.instantiate(); using MindanaoCOVID; download_datasets(); plotter()"
	if [[ "$RUN_ONCE" == "yes" ]]; then
		break
	fi
	break
done
