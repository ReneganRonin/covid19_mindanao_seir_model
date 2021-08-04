#!/bin/bash

: ${RUN_ONCE=no}
: ${RUN_DURATION_MINUTES=2880}
: ${DOWNLOAD_DATASET=no}
while true; do
	echo "`date`: Starting the project... "
	julia --project=. -e "using Pkg; Pkg.instantiate();\
		using MindanaoCOVID; download_datasets(); create_plot(cleaner(DAILY_PH_COVID); sf=DAILY_PH_COVID)"
	if [[ "$RUN_ONCE" == "yes" ]]; then
		break
	fi
	break
done
