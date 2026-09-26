#
# syshealthchecking

LOG_DIR="/var/log/sys_health"
sudo mkdir -p "$LOG_DIR"
LOG_FILE="$LOG_DIR/audit_$(date +'%Y-%m-%d').log"

echo "=== STARTING SYSTEM AUDIT: $(date) ===" >> "$LOG_FILE"

# 1. Disk Usage Check
echo "[INFO] Checking Disk Space..." >> "$LOG_FILE"
df -h / | awk 'NR==2 {print "Root Partition Usage: "$5}' >> "$LOG_FILE"

# 2. Memory Check
echo "[INFO] Checking Memory Consumption..." >> "$LOG_FILE"
free -m | awk 'NR==2 {print "Free Memory: "$4" MB out of "$2" MB"}' >> "$LOG_FILE"

echo "=== AUDIT COMPLETE ===" >> "$LOG_FILE"
echo "" >> "$LOG_FILE"
