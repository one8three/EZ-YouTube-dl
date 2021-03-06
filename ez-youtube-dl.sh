#!/bin/bash
clear

# Get the video URL:
echo "Paste the video URL here: "
read URL

function download_mp4() {
	# download video with highest available quality, save as mp4
	clear
	echo "Downloading video as MP4..."
	echo
	youtube-dl -f best "$URL"
	clear
	echo
	echo "Video downloaded."
	echo
	echo "Exiting..."
	echo
	echo
	exit
}

function download_mp3() {
	# download video with highest available audio quality, extract the audio, save as mp3
	clear
	echo "Downloading video as MP3..."
	echo
	youtube-dl -f bestaudio --extract-audio --audio-format mp3 --audio-quality 0 "$URL"
	clear
	echo
	echo "Audio downloaded."
	echo
	echo "Exiting..."
	echo
	echo
	exit
}

menu(){
	echo -ne "
	Download as MP4 or MP3?
	
	1) MP4 (video)
	2) MP3 (audio only)
	3) Exit 

	"
	read answer
	case $answer in
		1) download_mp4 ; menu ;;
		2) download_mp3 ; menu ;;
		3) exit 0 ;;
		*) echo -e "There is no option for $answer. Try again."
    esac
	}

menu
