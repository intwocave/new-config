#!/bin/bash

# 명령어 절대 경로 지정
IFCONFIG="/sbin/ifconfig"

# 그냥 1분 대기
sleep 2

# awdl 종료
$IFCONFIG awdl0 down
