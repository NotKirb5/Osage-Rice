printf "%.0f\n" $(df --output=pcent /mnt/meow | tail -n1 | tr -dc '0-9')
