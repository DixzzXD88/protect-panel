#!/bin/bash

echo "========================================="
echo "  Running all protect scripts..."
echo "========================================="

for i in {1..13}; do
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
