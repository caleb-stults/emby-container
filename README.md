# Emby Media Server

Hosted via Docker Compose on Ubuntu 22.04.

## Repository Structure

emby-docker/
├── .env.example       
├── .env               
├── .gitignore         
├── docker-compose.yml 
├── scripts/
│   └── backup.sh

## Backups
The backup script creates a compressed archive of the Emby config to your NAS and retains 30 days of history.
* Manual Run: `./scripts/backup.sh`
* Automation: Configured via crontab to run every Sunday at 03:00 AM (MDT).
	* `0 9 * * 0 /home/youruser/reponame/scripts/backup.sh > /home/youruser/logs/emby-backup.log 2>&1`
* Logs: Available at `~/logs/emby-backup.log`
