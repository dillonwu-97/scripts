#!/bin/bash

df -k | awk '{
	sum+=$4
}END{
	mb=sum/1024
	gb=mb/1024
	printf "%f mb left, %f gb left\n", mb, gb
}'


