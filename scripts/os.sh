#!/bin/bash

if [[ $OSTYPE =~ darwin12.* ]]; then
		echo "10.8.x"
fi

if [[ $OSTYPE =~ darwin13.* ]]; then
		echo "10.9.x"
fi
