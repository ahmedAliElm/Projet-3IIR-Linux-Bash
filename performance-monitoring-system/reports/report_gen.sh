source config/config.sh

# Define text formatting
bold=$(tput bold)
normal=$(tput sgr0)
underline=$(tput smul)

# Define text colors
red=$(tput setaf 1)
green=$(tput setaf 2)
yellow=$(tput setaf 3)
blue=$(tput setaf 4)
magenta=$(tput setaf 5)
cyan=$(tput setaf 6)
white=$(tput setaf 7)




generate_cpu_report(){
    timestamp=$(date +"%Y-%m-%d %H:%M:%S")
    cpu_usage=$(top -bn1| grep "Cpu(s)" | sed "s/.*, *\([0-9.]*\)%* id.*/\1/" | awk '{print 100 - $1}')     
    echo -e "${timestamp}\t${cpu_usage}"
    echo -e "${timestamp}\t${cpu_usage} " >> data/cpu_data.log
}






generate_memory_report(){
    timestamp=$(date +"%Y-%m-%d %H:%M:%S")
    memory_usage=$(free | awk '/Mem/{print $3/$2*100}')
    echo -e "${timestamp}\t${memory_usage}"
    echo -e "${timestamp}\t${memory_usage} " >> data/memory_data.log
}





generate_network_report(){
    timestamp=$(date +"%Y-%m-%d %H:%M:%S")
    network_interface=$(ip addr | awk '/state UP/{print $2}' | head -n 1 | cut -d':' -f1)
    network_usage=$(sar -n DEV 1 1 | grep Average | grep -vE 'IFACE|lo' | awk '{print $5+$6}')
    echo -e "${timestamp}\t${network_usage}"
    echo -e "${timestamp}\t${network_usage} " >> data/network_data.log
}





generate_disk_report(){
    timestamp=$(date +"%Y-%m-%d %H:%M:%S")
    disk_usage=$(df | grep '/dev' | awk '{print $5}' | tr -d '%' | sort -rn | head -1)
    echo -e "${timestamp}\t${disk_usage}"
    echo -e "${timestamp}\t${disk_usage} " >> data/disk_data.log
}





generate_gpu_report(){
    timestamp=$(date +"%Y-%m-%d %H:%M:%S")
    gpu_usage=$(nvidia-smi --query-gpu=utilization.gpu --format=csv,noheader,nounits | awk '{sum += $1} END { if (NR > 0) print sum / NR;}')
    echo -e "${timestamp}\t${gpu_usage}"
    echo -e "${timestamp}\t${gpu_usage} " >> data/gpu_data.log
}




generate_report(){
    count=0
    echo -e "${bold}${blue}CPU Report:${normal}"
    echo "${bold} ${yellow}-----------"
    echo "${red}Timestamp      CPU USAGE (%)"
    echo "----------------------------${white} ${normal}"
    while [ $count -lt $CPU_count ]; do
        generate_cpu_report
        sleep $CPU_INTERVAL
        ((count++))
    done
    echo -e "${yellow}************************************************${normal}"
    echo -e "${bold}${blue}MEMORY Report:${normal}"
    echo "${bold} ${yellow}-----------"
    echo "${red}Timestamp      MEMORY USAGE (MB)"
    echo "----------------------------${white} ${normal}"
    count=0
    while [ $count -lt $MEMORY_count ]; do
        generate_memory_report
        sleep $MEMORY_INTERVAL
        ((count++))
    done
    echo -e "${yellow}************************************************${normal}"
    echo -e "${bold}${blue}DISK Report:${normal}"
    echo "${bold} ${yellow}-----------"
    echo "${red}Timestamp      DISK USAGE (%)"
    echo "---------------------------- ${white} ${normal}"
    count=0
    while [ $count -lt $DISK_count ]; do
        generate_disk_report
        sleep $DISK_INTERVAL
        ((count++))
    done
    echo -e "${yellow}************************************************${normal}"
    echo -e "${bold}${blue}NETWORK Report:${normal}"
    echo "${bold} ${yellow}-----------"
    echo "${red}Timestamp      NETWORK USAGE (Kb/s)"
    echo "---------------------------- ${white} ${normal}"
    count=0
    while [ $count -lt $NETWORK_count ]; do
        generate_network_report
        sleep $NETWORK_INTERVAL
        ((count++))
    done
    echo -e "${yellow}************************************************${normal}"
    echo -e "${bold}${blue}GPU Report:${normal}"
    echo "${bold} ${yellow}-----------"
    echo "${red}Timestamp      GPU USAGE (%)"
    echo "----------------------------${white} ${normal}"
    count=0
    while [ $count -lt $GPU_count ]; do
        generate_gpu_report
        sleep $GPU_INTERVAL
        ((count++))
    done
    echo -e "${yellow}************************************************${normal}"
}

