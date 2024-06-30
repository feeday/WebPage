#!/bin/bash
 
# 检查并安装所需包
install_packages() {
    if [ -f /etc/redhat-release ]; then
        sudo yum update -y
        sudo yum install -y iptables nmap
    elif [ -f /etc/lsb-release ]; then
        sudo apt update
        sudo apt install -y iptables nmap
    else
        echo "Unsupported OS. Please use CentOS or Ubuntu."
        exit 1
    fi
}
 
# 清除重复规则
clear_existing_rules() {
    sudo iptables -F
    sudo iptables -X
    sudo iptables -Z
}
 
# 配置所有端口的默认规则
configure_default_rules() {
    sudo iptables -P INPUT DROP
    sudo iptables -P FORWARD DROP
    sudo iptables -P OUTPUT ACCEPT
    
    sudo iptables -A INPUT -m state --state ESTABLISHED,RELATED -j ACCEPT
    
    save_rules
}
 
# 查看所有开放端口
view_open_ports() {
    echo "Currently open ports for INPUT:"
    sudo iptables -L INPUT -v -n | grep dpt
 
    echo "Currently open ports for OUTPUT:"
    sudo iptables -L OUTPUT -v -n | grep dpt
 
}
 
# 管理端口
manage_port() {
    local port=$1
    local action=$2
 
    if [ "$action" -eq 1 ]; then
        sudo iptables -A INPUT -p tcp --dport "$port" -j ACCEPT
        echo "Port $port opened."
    elif [ "$action" -eq 0 ]; then
        sudo iptables -D INPUT -p tcp --dport "$port" -j ACCEPT
        echo "Port $port closed."
    else
        echo "Invalid action. Use '0' to close or '1' to open."
    fi
}
 
# 保存 iptables 规则
save_rules() {
    if [ -f /etc/redhat-release ]; then
        sudo service iptables save
    elif [ -f /etc/lsb-release ]; then
        sudo iptables-save | sudo tee /etc/iptables/rules.v4 > /dev/null
    else
        echo "Unsupported OS. Please use CentOS or Ubuntu."
        exit 1
    fi
    echo "iptables rules updated and saved."
}
 
# 主菜单
main_menu() {
    echo "Select an option:"
    echo "1. View all open ports"
    echo "2. Manage existing port (open/close)"
    echo "3. Add a new port (open/close)"
    read -p "Enter your choice (1/2/3): " choice
 
    case $choice in
        1)
            view_open_ports
            ;;
        2)
            read -p "Enter the port number to manage: " port
            read -p "Enter '0' to close the port or '1' to open the port: " action
            manage_port $port $action
            save_rules
            ;;
        3)
            read -p "Enter the new port number to manage: " new_port
            read -p "Enter '0' to close the port or '1' to open the port: " new_action
            manage_port $new_port $new_action
            save_rules
            ;;
        *)
            echo "Invalid choice. Please select 1, 2, or 3."
            ;;
    esac
}
 
# 检查是否需要安装包
if ! command -v iptables &> /dev/null || ! command -v nmap &> /dev/null; then
    install_packages
fi
 
# 配置默认规则
configure_default_rules
 
# 显示主菜单
main_menu
