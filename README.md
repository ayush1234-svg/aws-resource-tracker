# AWS Resource Usage Tracker

## Description
A bash script that monitors and reports AWS resource usage by listing all active AWS resources across multiple services.

**Author:** Ayush Dabhade  
**Version:** v1  
**Date:** 15-06-2026

---

## What It Does
The script tracks the following AWS resources:
- ✅ **S3 Buckets** - Lists all S3 storage buckets
- ✅ **EC2 Instances** - Lists all EC2 instance IDs
- ✅ **Lambda Functions** - Lists all Lambda functions
- ✅ **IAM Users** - Lists all IAM users

---

## Prerequisites
- AWS CLI installed and configured
- AWS credentials configured (`~/.aws/credentials` or environment variables)
- `jq` installed (for JSON parsing)
- Bash 4.0+

### Install Dependencies
```bash
# Ubuntu/Debian
sudo apt-get install awscli jq

# macOS
brew install awscli jq
```

### Configure AWS CLI
```bash
aws configure
# Enter: Access Key ID, Secret Access Key, Region, Output format (json)
```

---

## Installation

1. **Download/Create script:**
```bash
touch ~/aws_resource_usage.sh
chmod +x ~/aws_resource_usage.sh
```

2. **Add the script content** (copy the bash code into the file)

3. **Test it:**
```bash
./aws_resource_usage.sh
```

---

## Usage

### Run Manually
```bash
./aws_resource_usage.sh
```

### Output
```
Print List of S3 Buckets
my-bucket-1
my-bucket-2

Print List of EC2 Instances ID
i-0123456789abcdef0
i-0987654321fedcba0

Print List of Lambda Functions
[lambda function details in JSON]

Print List of IAM Users
[IAM user details in JSON]
```

---

## Automated Scheduling (Crontab)

### Setup Cron Job
```bash
crontab -e
```

### Add This Line (runs every 5 minutes)
```bash
*/5 * * * * /home/ubuntu/aws_resource_usage.sh >> /home/ubuntu/cron.log 2>&1
```

### Or Run Once Weekly at 5 AM
```bash
0 5 * * 1 /home/ubuntu/aws_resource_usage.sh >> /home/ubuntu/cron.log 2>&1
```

---

## Logs

Output is saved to: `/home/ubuntu/cron.log`

### View Logs
```bash
tail -f /home/ubuntu/cron.log
cat /home/ubuntu/cron.log
```

### Log Format
```
+ echo 'Print List of S3 Buckets'
Print List of S3 Buckets
[output...]
```

---

## Script Flags Explained

- `set -x` - Debug mode (prints each command executed)
- `set -e` - Exit if any command fails
- `set -o pipefail` - Exit if any command in pipeline fails

---

## Troubleshooting

| Issue | Solution |
|-------|----------|
| "command not found: aws" | Install AWS CLI: `pip install awscli` |
| "command not found: jq" | Install jq: `sudo apt-get install jq` |
| "Unable to locate credentials" | Run `aws configure` |
| Script not running from cron | Check cron logs: `journalctl -u cron` |
| Permission denied | Make executable: `chmod +x script.sh` |

---

## Next Steps (DevOps)
- Store results in S3 or database for historical tracking
- Add email alerts for resource threshold breaches
- Integrate with CloudWatch for monitoring
- Deploy on EC2 with automated scheduling
- Add cost estimation based on resources

---

## License
Private - Ayush Dabhade
