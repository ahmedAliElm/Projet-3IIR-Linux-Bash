#!/bin/bash
center_text() {
    local text="$1"
    local width=$(tput cols)
    local padding=$(( ($width - ${#text}) / 2 ))
    printf "%*s%s%*s\n" $padding "" "$text" $padding ""
}

# Source configuration files
source config/config.sh
source reports/report_gen.sh

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





display_menu(){
    clear
    center_text "${bold}${cyan}  ___________________ _______   ____ ___ ${normal}"
center_text "${bold}${cyan} /  _____/\_   _____/ \\      \\ |    |   \\ ${normal}"
center_text "${bold}${cyan}/   \\  ___ |    __)_  /   |   \\|    |   / ${normal}"
center_text "${bold}${cyan}\\    \\_\\  \\|        \\/    |    \\    |  / ${normal}"
center_text "${bold}${cyan} \\______  /_______  /\\____|__  /______/ ${normal}"
center_text "${bold}${cyan}        \\/        \\/         \\/          ${normal}"
    center_text "${bold}${blue}Performance System Menu${normal}"
    center_text ""
    center_text "${bold}${cyan}1.${yellow} Configure data collection parameters"
    center_text "${bold}${cyan}2.${yellow} Generate reports"
    center_text "${bold}${cyan}3.${yellow} Generate one report"
    center_text "${bold}${cyan}4.${yellow} Log mail"
    center_text "${bold}${cyan}5.${yellow} Exit"
}





configure_parameters(){

        clear
            echo -e "${bold}${cyan}  ___________________ _______   ____ ___ ${normal}"
    echo -e "${bold}${cyan} /  _____/\_   _____/ \\      \\ |    |   \\ ${normal}"
    echo -e "${bold}${cyan}/   \\  ___ |    __)_  /   |   \\|    |   / ${normal}"
    echo -e "${bold}${cyan}\\    \\_\\  \\|        \\/    |    \\    |  / ${normal}"
    echo -e "${bold}${cyan} \\______  /_______  /\\____|__  /______/ ${normal}"
    echo -e "${bold}${cyan}        \\/        \\/         \\/          ${normal}"
        echo "${cyan}Data Collection Parameters"
        echo "${bold}${cyan}1.${yellow} CPU interval (current: $CPU_INTERVAL seconds)"
        echo "${bold}${cyan}2.${yellow} Memory interval (current: $MEMORY_INTERVAL seconds)"
        echo "${bold}${cyan}3.${yellow} Disk interval (current: $DISK_INTERVAL seconds)"
        echo "${bold}${cyan}4.${yellow} Network interval (current: $NETWORK_INTERVAL seconds)"
        echo "${bold}${cyan}5.${yellow} GPU interval (current: $GPU_INTERVAL seconds)"
        echo "${bold}${cyan}6.${yellow} CPU Count (current: $CPU_count)"
        echo "${bold}${cyan}7.${yellow} Memory Count (current: $MEMORY_count)"
        echo "${bold}${cyan}8.${yellow} Disk Count (current: $DISK_count)"
        echo "${bold}${cyan}9.${yellow} Network Count (current: $NETWORK_count)"
        echo "${bold}${cyan}10.${yellow} GPU Count(current: $GPU_count )"
        read -p "${bold}${cyan}Enter your choice (1-10) to modify or any other key to go back:${normal} " choice
        case $choice in
               1)
               while true; do
                    read -p "${bold}${cyan}Enter CPU interval in seconds:${normal} " CPU_INTERVAL
                    if [[ $CPU_INTERVAL =~ ^[0-9]+$ ]]; then
                        break
                    else
                        echo "${red}Please enter a valid numeric value.${normal}"
                    fi
                done
                    ;;
               2)
                    while true; do
                    read -p "${bold}${cyan}Enter MEMORY interval in seconds:${normal} " MEMORY_INTERVAL
                    if [[ $MEMORY_INTERVAL =~ ^[0-9]+$ ]]; then
                        break
                    else
                        echo "${red}Please enter a valid numeric value.${normal}"
                    fi
                done
                    ;;
               3)   
                    while true; do
                    read -p "${bold}${cyan}Enter DISK interval in seconds:${normal} " DISK_INTERVAL
                    if [[ $DISK_INTERVAL =~ ^[0-9]+$ ]]; then
                        break
                    else
                        echo "${red}Please enter a valid numeric value.${normal}"
                    fi
                done
                    ;;
               4)
                     while true; do                 
                     read -p "${bold}${cyan}Enter NETWORK interval in seconds:${normal} " NETWORK_INTERVAL
                     if [[ $NETWORK_INTERVAL =~ ^[0-9]+$ ]]; then
                        break
                    else
                        echo "${red}Please enter a valid numeric value.${normal}"
                    fi
                done
                     ;;
               5)
                     while true; do                 
                     read -p "${bold}${cyan}Enter GPU interval in seconds:${normal} " GPU_INTERVAL
                     if [[ $GPU_INTERVAL =~ ^[0-9]+$ ]]; then
                        break
                    else
                        echo "${red}Please enter a valid numeric value.${normal}"
                    fi
                done
                     ;;
                6)
                                    while true; do
                    read -p "${bold}${cyan}Enter CPU count:${normal} " CPU_count
                    if [[ $CPU_count =~ ^[0-9]+$ ]]; then
                        break
                    else
                        echo "${red}Please enter a valid numeric value.${normal}"
                    fi
                    done
                     ;;
                7)
                                    while true; do
                    read -p "${bold}${cyan}Enter CPU interval in seconds:${normal} " MEMORY_count 
                    if [[ $MEMORY_count =~ ^[0-9]+$ ]]; then
                        break
                    else
                        echo "${red}Please enter a valid numeric value.${normal}"
                    fi
                    done
                     ;;
                8)
                                    while true; do
                    read -p "${bold}${cyan}Enter CPU interval in seconds:${normal} " DISK_count 
                    if [[ $DISK_count =~ ^[0-9]+$ ]]; then
                        break
                    else
                        echo "${red}Please enter a valid numeric value.${normal}"
                    fi
                    done
                     ;;
                9)
                                    while true; do
                    read -p "${bold}${cyan}Enter CPU interval in seconds:${normal} " NETWORK_cout
                    if [[ $NETWORK_count =~ ^[0-9]+$ ]]; then
                        break
                    else
                        echo "${red}Please enter a valid numeric value.${normal}"
                    fi
                    done
                     ;;
                10)
                                    while true; do
                    read -p "${bold}${cyan}Enter CPU interval in seconds:${normal} " GPU_count
                    if [[ $GPU_count =~ ^[0-9]+$ ]]; then
                        break
                    else
                        echo "${red}Please enter a valid numeric value.${normal}"
                    fi
                done
                     ;;
               *)
                     return
                     ;;
        esac
        echo "CPU_INTERVAL=$CPU_INTERVAL" > config/config.sh
        echo "MEMORY_INTERVAL=$MEMORY_INTERVAL" >> config/config.sh
        echo "DISK_INTERVAL=$DISK_INTERVAL" >> config/config.sh
        echo "NETWORK_INTERVAL=$NETWORK_INTERVAL" >> config/config.sh
        echo "GPU_INTERVAL=$GPU_INTERVAL" >> config/config.sh
        echo "CPU_count=$CPU_count" >> config/config.sh
        echo "MEMORY_count=$MEMORY_count" >> config/config.sh
        echo "DISK_count=$DISK_count" >> config/config.sh
        echo "NETWORK_count=$NETWORK_count" >> config/config.sh
        echo "GPU_count=$GPU_count" >> config/config.sh
        echo "${yellow}Parameters updated successfully."  
}





generate_reports(){
      clear
      center_text "${bold}${cyan}  ___________________ _______   ____ ___ ${normal}"
center_text "${bold}${cyan} /  _____/\_   _____/ \\      \\ |    |   \\ ${normal}"
center_text "${bold}${cyan}/   \\  ___ |    __)_  /   |   \\|    |   / ${normal}"
center_text "${bold}${cyan}\\    \\_\\  \\|        \\/    |    \\    |  / ${normal}"
center_text "${bold}${cyan} \\______  /_______  /\\____|__  /______/ ${normal}"
center_text "${bold}${cyan}        \\/        \\/         \\/          ${normal}"
      echo "${green}Generating Reports..."
      generate_report
      echo "${green}Reports generated successfully."
}






generate_one_report(){
    printf "\033c"
    echo -e "${bold}${cyan}  ___________________ _______   ____ ___ ${normal}"
    echo -e "${bold}${cyan} /  _____/\_   _____/ \\      \\ |    |   \\ ${normal}"
    echo -e "${bold}${cyan}/   \\  ___ |    __)_  /   |   \\|    |   / ${normal}"
    echo -e "${bold}${cyan}\\    \\_\\  \\|        \\/    |    \\    |  / ${normal}"
    echo -e "${bold}${cyan} \\______  /_______  /\\____|__  /______/ ${normal}"
    echo -e "${bold}${cyan}        \\/        \\/         \\/          ${normal}"
    echo "${magenta}Choose which report to generate:"
    echo "  ${bold}${cyan}1.${yellow} CPU Report"
    echo "  ${bold}${cyan}2.${yellow} Memory Report"
    echo "  ${bold}${cyan}3.${yellow} Network Report"
    echo "  ${bold}${cyan}4.${yellow} Disk Report"
    echo "  ${bold}${cyan}5.${yellow} GPU Report"
    echo "  ${bold}${cyan}6.${yellow} Cancel"
    read -p "${bold}${cyan}Enter your choice (1-6):${normal} " choice
    case $choice in
        1)
            printf "\033c"
            echo -e "${bold}${cyan}  ___________________ _______   ____ ___ ${normal}"
            echo -e "${bold}${cyan} /  _____/\_   _____/ \\      \\ |    |   \\ ${normal}"
            echo -e "${bold}${cyan}/   \\  ___ |    __)_  /   |   \\|    |   / ${normal}"
            echo -e "${bold}${cyan}\\    \\_\\  \\|        \\/    |    \\    |  / ${normal}"
            echo -e "${bold}${cyan} \\______  /_______  /\\____|__  /______/ ${normal}"
            echo -e "${bold}${cyan}        \\/        \\/         \\/          ${normal}"
            echo -e "${bold}CPU Report:${normal}"
            echo "${red}-----------"
            echo "Timestamp      CPU USAGE (%)"
            echo "----------------------------${white}"
            generate_cpu_report
            ;;
        2)
            printf "\033c"
            echo -e "${bold}${cyan}  ___________________ _______   ____ ___ ${normal}"
            echo -e "${bold}${cyan} /  _____/\_   _____/ \\      \\ |    |   \\ ${normal}"
            echo -e "${bold}${cyan}/   \\  ___ |    __)_  /   |   \\|    |   / ${normal}"
            echo -e "${bold}${cyan}\\    \\_\\  \\|        \\/    |    \\    |  / ${normal}"
            echo -e "${bold}${cyan} \\______  /_______  /\\____|__  /______/ ${normal}"
            echo -e "${bold}${cyan}        \\/        \\/         \\/          ${normal}"
            echo -e "${bold}MEMORY Report:${normal}"
            echo "${red}-----------"
            echo "Timestamp      MEMORY USAGE (MB)"
            echo "----------------------------${white}"
            generate_memory_report
            ;;
        3)
            printf "\033c"
            echo -e "${bold}${cyan}  ___________________ _______   ____ ___ ${normal}"
            echo -e "${bold}${cyan} /  _____/\_   _____/ \\      \\ |    |   \\ ${normal}"
            echo -e "${bold}${cyan}/   \\  ___ |    __)_  /   |   \\|    |   / ${normal}"
            echo -e "${bold}${cyan}\\    \\_\\  \\|        \\/    |    \\    |  / ${normal}"
            echo -e "${bold}${cyan} \\______  /_______  /\\____|__  /______/ ${normal}"
            echo -e "${bold}${cyan}        \\/        \\/         \\/          ${normal}"
            echo -e "${bold}NETWORK Report:${normal}"
            echo "${red}-----------"
            echo "Timestamp      NETWORK USAGE (Kb/s)"
            echo "----------------------------${white}"
            generate_network_report
            ;;
        4)
            printf "\033c"
            echo -e "${bold}${cyan}  ___________________ _______   ____ ___ ${normal}"
            echo -e "${bold}${cyan} /  _____/\_   _____/ \\      \\ |    |   \\ ${normal}"
            echo -e "${bold}${cyan}/   \\  ___ |    __)_  /   |   \\|    |   / ${normal}"
            echo -e "${bold}${cyan}\\    \\_\\  \\|        \\/    |    \\    |  / ${normal}"
            echo -e "${bold}${cyan} \\______  /_______  /\\____|__  /______/ ${normal}"
            echo -e "${bold}${cyan}        \\/        \\/         \\/          ${normal}"
            echo -e "${bold}DISK Report:${normal}"
            echo "${red}-----------"
            echo "Timestamp      DISK USAGE (%)"
            echo "----------------------------${white}"
            generate_disk_report
            ;;
        5)
            printf "\033c"
            echo -e "${bold}${cyan}  ___________________ _______   ____ ___ ${normal}"
            echo -e "${bold}${cyan} /  _____/\_   _____/ \\      \\ |    |   \\ ${normal}"
            echo -e "${bold}${cyan}/   \\  ___ |    __)_  /   |   \\|    |   / ${normal}"
            echo -e "${bold}${cyan}\\    \\_\\  \\|        \\/    |    \\    |  / ${normal}"
            echo -e "${bold}${cyan} \\______  /_______  /\\____|__  /______/ ${normal}"
            echo -e "${bold}${cyan}        \\/        \\/         \\/          ${normal}"
            echo -e "${bold}GPU Report:${normal}"
            echo "${red}-----------"
            echo "Timestamp      GPU USAGE (%)"
            echo "----------------------------${white}"
            generate_gpu_report
            ;;
        6)
            printf "\033c"
            echo -e "${bold}${cyan}  ___________________ _______   ____ ___ ${normal}"
            echo -e "${bold}${cyan} /  _____/\_   _____/ \\      \\ |    |   \\ ${normal}"
            echo -e "${bold}${cyan}/   \\  ___ |    __)_  /   |   \\|    |   / ${normal}"
            echo -e "${bold}${cyan}\\    \\_\\  \\|        \\/    |    \\    |  / ${normal}"
            echo -e "${bold}${cyan} \\______  /_______  /\\____|__  /______/ ${normal}"
            echo -e "${bold}${cyan}        \\/        \\/         \\/          ${normal}"
            echo "${red}Cancelled."
            ;;
        *)
            echo "${red}Invalid choice. Please enter a number between 1 and 6.${normal}"
            ;;
    esac
}






send_logs_by_email() {
    read -p "Enter recipient's email address: " recipient
    subject="Performance Monitoring Logs"
    body="Attached is the zipped performance monitoring logs folder."
    log_directory="/home/vboxuser/Desktop/performance-monitoring-system/data"
    zip_file="/home/vboxuser/Desktop/performance-monitoring-system/logs.zip"

    # Check if log directory exists
    if [ ! -d "$log_directory" ]; then
        echo "Log directory $log_directory does not exist."
        return 1
    fi

    # Zip the log directory
    (cd "$(dirname "$log_directory")" && zip -r "$zip_file" "$(basename "$log_directory")")

    # Check if zip was created successfully
    if [ $? -ne 0 ]; then
        echo "Failed to create zip file."
        return 1
    fi

    # Check if zip file exists
    if [ ! -f "$zip_file" ]; then
        echo "Zip file $zip_file does not exist."
        return 1
    fi

    # Send the email with zip file as standard input
    {
        echo "$body"
        uuencode "$zip_file" "logs.zip"
    } | mail -s "$subject" -- "$recipient"

    # Check if email was sent successfully
    if [ $? -eq 0 ]; then
        echo "Logs sent successfully to $recipient."
    else
        echo "Failed to send logs."
    fi
    rm -r logs.zip
}










main() {
    while true; do
        display_menu
        echo -n "${cyan}Enter your choice: ${normal}"
        read choice
        case $choice in
            1)
                configure_parameters
                ;;
            2)
                generate_reports
                ;;
            3)
                generate_one_report
                ;;
            4)
                send_logs_by_email
                
                ;;
           5)
                exit
                ;;
            *)
                echo "${red}Invalid choice. Please enter a valid option.${normal}"
                ;;
        esac
        echo -n "${cyan}Press Enter to continue...${normal}"
        read
    done
}

main

