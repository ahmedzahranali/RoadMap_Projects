
RoadMap_Projects

A repo for the roadmap.sh projects for the devops roadmap

For the first project the server stat bash script all you have to do is to just run the command ./server_stat.sh and the code should run perfectly.

URL for the server stat project: https://roadmap.sh/projects/server-stats

For the second project the log archive tool all you have to do is run the command ./;og_archive_tool.sh <log_directory> and the script should run perfectly.

URL for the log archive project: https://roadmap.sh/projects/log-archive-tool

For the third project the nginx log analyser tool all you have to do is run the command ./nginx_log_analyser <log_file> and the script should run perfectly.

URL for the log archive project: https://roadmap.sh/projects/nginx-log-analyser

For the fourth project github pages deployment I created the deploy for github actions and now my personal github page website is CI/CD'ed once i push any changes.

url for the github pages deployment project: https://roadmap.sh/projects/github-actions-deployment-workflow

For the fifth project SSH remote server i intialized an EC2 instance setup multi key configuration by creating the key on my local machine and then appending it in the remote file on the server, Had to restrict local private key permissions to prevent rejection, also gave the server i wanted to ssh intoa nickname, I also setup fail2ban to protect my server from attacks, configured a new jail.local file enabled sshd jail to monitor /var/log/auth.log.

url for the SSh remote server project: https://roadmap.sh/projects/ssh-remote-server-setup

For the sixth project i created an EC2 instance and configured nginx on it created a simple website and used rsync to update this server and implemented a bash script that uses rsync to the website to the server.

url for the static siteserver project https://roadmap.sh/projects/static-site-server

For the seventh project i added a cname to my already purchased domain name from aws routed the trafic to my github page registered the new name in github pages and acquired the certificates.

url for the basic dns setup project: https://roadmap.sh/projects/basic-dns

For the eightth project i installed netdata on my laptop (linux mint) configured the metrics accessed it through port 19999 on my browser added a chart for my portfolio website metrics setup an alarm for my cpu usage created the three scripts one for setup one for stress testing ad the last one for cleanup 

url for the simple monitoring project: https://roadmap.sh/projects/simple-monitoring-dashboard 

For the ninth project i created a dummy service that just printed out that it's running and that was by putting the script in my usr/local/bin/directory and then i put the .service fle for this service in the /etc/systemd/system directory and then reloaded the daemon and voila the service was running smoothly.

url for the dummy systemd service: https://roadmap.sh/projects/dummy-systemd-service

For the tenth project i created a basic dockerfile that takes a parameter from the user and spits it out the docker file for it is at the root of my repo.

url for the basic dockerfile project: https://roadmap.sh/projects/basic-dockerfile

For the elventh project i launched an ec2 instance setup nginx on it and made it servce a static website and i can also setup so that me pipeline can deploy any changes in my code once i push it if a remove the if:false line from my deploy.yml file. 

url for the ec instance poject:https://roadmap.sh/projects/ec2-instance

For the twelfth project i created the pomodoro tracker application using react and made sure to meet the required parameters the whole project is included in the pomodoro timer directory all it needs is to be deployed.

url for the pomodoro timer project:https://roadmap.sh/projects/pomodoro-timer

For the thirtenth project i created an ansible playbook with the base nginx app and ssh structure and enables it to pull up my pomodoro app from my repo and serve it using nginx i tested on a multipass machine and was able to serve the timer on my local host.

url for the configuraton management project: https://roadmap.sh/projects/configuration-management
