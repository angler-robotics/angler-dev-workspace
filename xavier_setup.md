Flash SD card from [here](https://developer.nvidia.com/jetson-nx-developer-kit-sd-card-image)  
(need an account)

Account settings:  
Name: Aquadrone  
Computer Name: aquadrone-xavier  
username: aquadrone  
password: aquadrone  
log in automatically  
APP Partition Size: maximum  
Nvpmodel mode: 15W 6 core  

Set up boot from ssd based on [this video](https://www.youtube.com/watch?v=ZK5FYhoJqIg&feature=emb_logo&ab_channel=JetsonHacks)  
You can delete the rootOnNVMe on the SSD after restarting. The files on the SD card are still availible under /media/aquadrone and should be left along.

Install python 3.8 and set as default based on [this](https://ubuntuhandbook.org/index.php/2020/07/python-3-8-4-released-install-ubuntu-18-04-16-04/)

sudo apt install python3-pip
