if [[ -d ${COMP_DIR} ]] ; then
    for completion in ${COMP_DIR}/*.bash ; do
	    source $completion
    done
    unset -v completion
fi

