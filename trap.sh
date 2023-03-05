#!/bin/bash


CONFIG_FILE=config.txt


# Check if config file exists
if [ -s "$CONFIG_FILE" ]; then
  # Read FOLDER and LOGFILE paths from config file
  FOLDER=$(head -n 1 "$CONFIG_FILE")
  LOGFILE=$(tail -n 1 "$CONFIG_FILE")
else
    # Prompt user to select folder and create config file
    echo "Please select a folder to monitor:"
    FOLDER=$(zenity --file-selection --directory)
    echo "$FOLDER" > $CONFIG_FILE
    echo "Please select a logfile:"
    LOGFILE=$(zenity --file-selection --save --confirm-overwrite)
    echo "$LOGFILE" >> $CONFIG_FILE
fi


# Make sure the user selected a folder
if [[ -z "$FOLDER" ]]; then
    echo "No folder selected, exiting..."
        # Prompt user to select folder and create config file
    echo "Please select a folder to monitor:"
    FOLDER=$(zenity --file-selection --directory)
    echo "$FOLDER" > $CONFIG_FILE
    echo "Please select a logfile:"
    LOGFILE=$(zenity --file-selection --save --confirm-overwrite)
    echo "$LOGFILE" >> $CONFIG_FILE
fi



# Check logfile exists
touch $LOGFILE


while true; do
  inotifywait -e open "$FOLDER" | while read -r directory events filename; do
    echo "Folder $directory was opened by $(whoami) at $(date)"

    # Get the terminal that the user is logged in from
    TTY=$(who am i | awk '{print $2}')

    # Get the IP address of the terminal
    IP=$(who | grep "$TTY" | awk '{print $5}')
    
    # Get the PID of the process that opened the folder
    PID=$(lsof -t "$directory")



    # Log the event
    echo "Folder $directory was opened by $(whoami) at $(date) from IP address $IP with PID $PID" >> "$LOGFILE"




  # Display the wornig messagein a dialog box
  MESSAGE="This Folder should not be opened, this is a trap!. all of your information will be sent to the FBI"
  zenity --info --title="wornig!!!!!" --text="$MESSAGE" --timeout=10
  done
  
  
done 