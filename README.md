# Born2BeRoot Project - Server Setup and Monitoring Script

## Project Description
This project involves setting up a server as part of the 42 cursus Born2BeRoot project. The server configuration includes essential steps such as LVM setup, SSH configuration, firewall settings, sudo, and a password policy.

Additionally, this repository includes the "monitoring.sh" script, a key component of the project designed for system monitoring.

## Monitoring Script
### Usage
Ensure execution permissions for the script:
```bash
chmod u+x monitoring.sh
```

### Execution Frequency
The script is configured to run every 10 minutes using a system cron job. You can set up the cron job as follows:

```bash
*/10 * * * * /path/to/monitoring.sh
```

This will execute the script every 10 minutes.

### Features
The script provides the following system information:
- The architecture of your operating system and its kernel version.
- The number of physical processors.
- The number of virtual processors.
- The current available RAM on your server and its utilization rate as a percentage.
- The current available memory on your server and its utilization rate as a percentage.
- The current utilization rate of your processors as a percentage.
- The date and time of the last reboot.
- Whether LVM is active or not.
- The number of active connections.
- The number of users using the server.
- The IPv4 address of your server and its MAC (Media Access Control) address.
- The number of commands executed with the sudo program.

## Acknowledgments
This script was developed as part of the 42 cursus Born2beRoot project.
