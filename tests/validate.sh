#checkingSS

echo "Running syntax validation..."
for script in scripts/*.sh; do
    # bash -n checks syntax without executing the script
    bash -n "$script"
    if [ $? -eq 0 ]; then
        echo "[PASS] $script syntax is valid."
    else
        echo "[FAIL] $script syntax error found!"
        exit 1
    fi
done
