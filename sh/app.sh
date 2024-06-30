#!/usr/bin/env bash
 
# 退出任何现有的虚拟环境
if [[ "$VIRTUAL_ENV" != "" ]]; then
    deactivate
fi
 
# 定义项目目录为当前目录
PROJECT_DIR=$(pwd)
 
# 更新包索引并安装 Python3、pip 和 venv
echo "Updating package index and installing python3, pip and venv..."
sudo apt update
sudo apt install -y python3 python3-pip python3-venv
 
# 提示用户输入虚拟环境的文件名
read -p "Enter the name for the virtual environment: " VENV_NAME
 
# 创建虚拟环境
echo "Creating virtual environment with name $VENV_NAME in $PROJECT_DIR..."
python3 -m venv $PROJECT_DIR/$VENV_NAME
 
# 激活虚拟环境
echo "Activating virtual environment..."
source $PROJECT_DIR/$VENV_NAME/bin/activate
 
# 安装 Flask
echo "Installing Flask..."
pip install Flask
 
# 创建一个简单的 Flask 应用
echo "Creating Flask application..."
cat > app.py <<EOF
from flask import Flask
app = Flask(__name__)
@app.route('/')
def hello_world():
    return 'Hello, World!'
if __name__ == '__main__':
    app.run(debug=True, host='0.0.0.0')
EOF
 
# 启动 Flask 应用
echo "Starting Flask application..."
python app.py
