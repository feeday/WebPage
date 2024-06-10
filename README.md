## [Bash Host](https://feeday.cn) ：
  
- 服务器部署脚本

```
curl https://feeday.cn/sh/puck.sh -O
curl.exe -o NUL http://speedtest.tele2.net/10GB.zip
curl -s -o ~/x https://raw.githubusercontent.com/olegos2/mobox/main/install && . ~/x
```

## <a href="https://feeday.cn/page" target="_blank">Host Page</a>：
  
- 常用网址分类和收藏

- 在线围棋魔方小游戏

- 收益利率实时计算器
  
- 视频按帧提取图片预览
  
- 文本正则查找替换等功能
  
-  编码互转视频、音频和图像
  
## <a href="https://desktop.github.com" target="_blank">Host Page</a>：

- GitHub Pages 不支持服务器端语言，例如 PHP、Ruby 或 Python。

- GitHub Pages 源存储库的建议限制为 1 GB。

- 发布的 GitHub Pages 站点不得超过 1 GB。

- 如果花费的时间超过 10 分钟，GitHub Pages 部署将超时。

- GitHub Pages 站点的软带宽限制为每月 100 GB。

- GitHub Pages 站点的软限制为每小时 10 次生成。 用自定义 GitHub Actions 工作流则此限制不适用。

## HTML TOOLS CODE

- 在终端输入以上命令获取链接
- 警告： 请勿将代码粘贴到你不理解或尚未审阅自己的 DevTools 控制台。
- 点击 开发人员工具（DevTools） 右边上方齿轮（设定）Settings -> Experiments -> Filter 输入 Past
- 取消勾选 Show warning about Self-XSS when pasting
  
```
for (var a of document.getElementsByTagName('a')) { console.log(a.href) }
```
## <a href="https://code.visualstudio.com/Download" target="_blank">Visual Studio Code Python</a>：

- <a href="https://marketplace.visualstudio.com/items?itemName=MS-CEINTL.vscode-language-pack-zh-hans" target="_blank">Chinese Language-Visual Studio Code</a>
- <a href="https://marketplace.visualstudio.com/items?itemName=FittenTech.Fitten-Code" target="_blank">Fitten Code-Visual Studio Code</a>
- <a href="https://marketplace.visualstudio.com/items?itemName=donjayamanne.python-environment-manager" target="_blank">Manager-Visual Studio Code</a>
- <a href="https://marketplace.visualstudio.com/items?itemName=ms-python.python" target="_blank">Python-Visual Studio Code</a>
- <a href="https://www.anaconda.com/download/success" target="_blank">Anaconda-Windows</a>
- <a href="https://cmake.org/download/" target="_blank">CMake-Windows</a>

### 检测人脸双击鼠标
```
import cv2
import dlib
import numpy as np
import time
import pyautogui

detector = dlib.get_frontal_face_detector()

def face_detected(img):
    # 在图像中检测人脸
    gray = cv2.cvtColor(img, cv2.COLOR_BGR2GRAY)
    faces = detector(gray)

    # 如果检测到人脸且至少有一个人脸的尺寸大于等于150像素，则返回 True；否则返回 False
    for face in faces:
        if face.width() >= 190 and face.height() >= 170:
            return True

    return False

def countdown(t):
    while t >= 0:
        mins, secs = divmod(t, 60)
        time.sleep(1)
        t -= 10

# 记录人脸检测的起始时间
start_time = time.time()

while True:
    countdown(10)  # 10秒倒计时

    # 获取屏幕截图并进行人脸检测
    img = np.array(pyautogui.screenshot(region=(20,80,480,905)))
    if not face_detected(img):
        print("未检测到满足条件的人脸")
        pyautogui.click(button='left')  # 模拟鼠标左键点击
        # 重置人脸检测的起始时间
        start_time = time.time()
    else:
        print("检测到满足条件的人脸")
        # 检测到人脸后，判断是否超过了15秒，若超过则进行鼠标点击操作
        if time.time() - start_time > 15:
            pyautogui.click(button='left')  # 模拟鼠标左键点击
            # 重置人脸检测的起始时间
            start_time = time.time()

    time.sleep(0)  # 设置延时为0秒
```
### 文件数量分类

```
import os
import shutil
from tqdm import tqdm

# 源文件夹路径
source_folder = r'd:\1'
# 目标根文件夹路径
target_root_folder = r'd:\2'

# 确保目标根文件夹存在
if not os.path.exists(target_root_folder):
    os.makedirs(target_root_folder)

# 文件计数器和文件夹索引
file_counter = 0
folder_index = 0

# 获取源文件夹中所有文件的列表
files = [f for f in os.listdir(source_folder) if os.path.isfile(os.path.join(source_folder, f))]

# 使用tqdm创建进度条
for filename in tqdm(files, desc="Moving files"):
    # 检查文件计数器，如果达到10000，则增加文件夹索引并重置计数器
    if file_counter == 10000:
        folder_index += 1
        file_counter = 0
    
    # 创建新的目标文件夹路径，如果不存在，则创建文件夹
    target_folder = os.path.join(target_root_folder, str(folder_index))
    if not os.path.exists(target_folder):
        os.makedirs(target_folder)
    
    # 构建源文件路径和目标文件路径
    source_file = os.path.join(source_folder, filename)
    target_file = os.path.join(target_folder, filename)
    
    # 移动文件
    shutil.move(source_file, target_file)
    
    # 更新文件计数器
    file_counter += 1

print("文件分类完成")
```
