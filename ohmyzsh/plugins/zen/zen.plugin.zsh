function zen_of_python() {
    python -c 'import this' | tail -n+3 | sort -r | head -n 1
}
