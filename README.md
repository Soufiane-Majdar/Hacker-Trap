<h1>Hacker Trap</h1>

<p>Hacker Trap is a script that monitors a folder for unauthorized access. When the folder is opened, it logs the event and displays a warning message to the user.</p>

<h2>Getting Started</h2>

<p>These instructions will guide you through the process of setting up and running the Hacker Trap script on your Linux machine.</p>

<h3>Prerequisites</h3>

<ul>
  <li>Bash shell</li>
  <li>Inotifywait</li>
  <li>Lsof</li>
  <li>Zenity</li>
</ul>

<h3>Installing</h3>
<ol>
  <li>Clone the repository or download the <code>trap.sh</code> script.</li>
  <li>Make the script executable: <code>chmod +x trap.sh</code>.</li>
  <li>Install required dependencies:
    <ul>
    <li>Ubuntu/Debian: <code>sudo apt-get install inotify-tools lsof zenity</code></li>
    <li>Red Hat/CentOS: <code>sudo yum install inotify-tools lsof zenity</code></li>
    </ul>
  </li>
  
 </ol>
 
 <h2>Usage</h2><ol><li>Clone the repository to your machine.</li><li>Open a terminal window in the cloned directory.</li><li>Run the following command to make the <code>trap.sh</code> file executable: <code>chmod +x trap.sh</code>.</li><li>Run the <code>trap.sh</code> file with <code>sudo ./trap.sh</code>. You may need to enter your password to run with sudo privileges.</li><li>The script will prompt you to select a folder to monitor and a logfile to write to. After you have made your selections, the script will begin monitoring the selected folder.</li><li>If the selected folder is opened, a warning message will be displayed on the screen and information about the access attempt will be logged to the selected logfile.</li></ol>
 
 <h3>Configuration</h3>
 
 <p>The <code>trap.sh</code> script reads the paths to the monitored folder and the log file from a configuration file called <code>config.txt</code>. If <code>config.txt</code> exists and is not empty, the script will use the paths specified in the file. If <code>config.txt</code> does not exist or is empty, the script will prompt the user to select a folder to monitor and a log file to use, and create <code>config.txt</code> with the selected paths.</p>
 
 <h2>Autostart on boot</h2>
 
 <p>To run the <code>trap.sh</code> script on boot, you can use <code>sudo crontab -e</code> to create a new cron job that runs the script at startup. Follow these steps:</p><ol><li><p>Open a terminal and run <code>sudo crontab -e</code> to open the root crontab file for editing.</p></li><li><p>Add the following line to the end of the file:</p><pre><div class="bg-black mb-4 rounded-md"><div class="flex items-center relative text-gray-200 bg-gray-800 px-4 py-2 text-xs font-sans"><span class="">python</span><button class="flex ml-auto gap-2"><svg stroke="currentColor" fill="none" stroke-width="2" viewBox="0 0 24 24" stroke-linecap="round" stroke-linejoin="round" class="h-4 w-4" height="1em" width="1em" xmlns="http://www.w3.org/2000/svg"><path d="M16 4h2a2 2 0 0 1 2 2v14a2 2 0 0 1-2 2H6a2 2 0 0 1-2-2V6a2 2 0 0 1 2-2h2"></path><rect x="8" y="2" width="8" height="4" rx="1" ry="1"></rect></svg>Copy code</button></div><div class="p-4 overflow-y-auto"><code class="!whitespace-pre hljs language-python"><span class="hljs-meta">@reboot /path/to/trap.sh &amp;</span>
</code></div></div></pre><p>Replace <code>/path/to/trap.sh</code> with the absolute path to the <code>trap.sh</code> script on your machine.</p></li><li><p>Save and exit the crontab file.</p></li></ol><p>Now the <code>trap.sh</code> script will run automatically at startup.</p><p>Note: The above steps will create a new cron job that runs the <code>trap.sh</code> script as root. If you want to run the script as a different user, you will need to create the cron job for that user instead of using <code>sudo crontab -e</code>.</p>
