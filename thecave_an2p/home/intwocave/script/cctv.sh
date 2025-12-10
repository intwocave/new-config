#!/bin/bash

cleanup() {
	echo ""
	echo "서비스 종료 중.."

	if [ -n "$PID_MTX" ]; then
		echo "Killing MediaMTX (PID: $PID_MTX)"
		kill "$PID_MTX"
	fi

	if [ -n "$PID_FFMPEG" ]; then
		echo "Killing FFmpeg (PID: $PID_FFMPEG)"
		sudo kill "$PID_FFMPEG"
	fi

if [ "$isMotion" == "y" ] || [ "$isMotion" == "y" ]; then
	echo "Stopping motion service.."
	sudo systemctl stop motion
fi

	exit 0
}

trap cleanup SIGINT SIGTERM

read -p "motion 서비스를 시작합니까? (y/n): " isMotion

# Start media server via MediaMTX
echo "Starting MediaMTX media server.."
/home/intwocave/MediaMTX/mediamtx /home/intwocave/MediaMTX/mediamtx.yml > /dev/null &
PID_MTX=$!

# Standby for starting MediaMTX server..
sleep 2

# Start streaming
echo "Starting FFmpeg streaming.."
sudo ffmpeg -f v4l2 -i /dev/video0 -f alsa -i hw:2,0 -c:v libx264 -preset ultrafast -tune zerolatency -c:a aac -b:a 128k -f rtsp rtsp://localhost:8554/cctv > /dev/null 2>&1 &
PID_FFMPEG=$!

# Start motion service
if [ "$isMotion" == "y" ] || [ "$isMotion" == "y" ]; then
	echo "Starting motion service.."
	sudo systemctl start motion
fi

echo "모든 서비스가 실행 중.. (Ctrl-C로 종료)"

wait
