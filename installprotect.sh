#!/bin/bash

echo "========================================="
echo "  Running all protect scripts..."
echo "========================================="

# Loop dari 1 sampai 12
for i in {1..12}; do
    if [ -f "protect$i.sh" ]; then
        echo "▶️  Running protect$i.sh..."
        bash protect$i.sh
        echo "✅ protect$i.sh done"
        echo "-----------------------------------------"
    else
        echo "⚠️  protect$i.sh not found, skipping..."
    fi
done

echo "========================================="
echo "  All scripts completed!"
echo "========================================="