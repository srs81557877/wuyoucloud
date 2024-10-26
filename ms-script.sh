#!/bin/bash
 
read -p "此脚本仅供个人研究使用，作者不对任何法律责任承担责任，是否继续？ (y/n): " confirm
if [[ "$confirm" != "y" ]]; then
    echo "操作已取消"
    exit 1
fi
 
# 显示菜单
show_menu() {
    echo "请选择一个选项:"
    echo "1) 安装 XrayR"
    echo "2) 重启 XrayR"
    echo "3) 安装 x-ui"
    echo "4) 重启 x-ui"
    echo "5) 流媒体测试脚本"
    echo "6) WARP 管理菜单"
    echo "7) 服务器测速信息"
    echo "8) V2BX 一键安装"
    echo "0) 退出"
    echo ""
}
 
# 处理选项
handle_option() {
    case $1 in
        1)
            echo "正在安装 XrayR..."
            apk add wget
            wget -O /usr/bin/xrayr https://raw.githubusercontent.com/mingge9527/New-XrayR-Alpine/main/xrayr.sh
            chmod 777 /usr/bin/xrayr
            echo "XrayR 安装成功！使用 'xrayr' 命令来启动。"
            ;;
        2)
            echo "正在重启 XrayR..."
            xrayr
            ;;
        3)
            echo "正在安装 x-ui..."
            apk add curl && apk add bash && bash <(curl -Ls https://raw.githubusercontent.com/Lynn-Becky/Alpine-x-ui/main/alpine-xui.sh)
            ;;
        4)
            echo "正在重启 x-ui..."
            /etc/init.d/x-ui restart
            ;;
        5)
            echo "正在运行流媒体测试脚本..."
            bash <(curl -L -s media.ispvps.com)
            ;;
        6)
            echo "正在启动 WARP 管理菜单..."
            wget -N https://gitlab.com/fscarmen/warp/-/raw/main/menu.sh && bash menu.sh
            ;;
        7)
            echo "正在获取服务器测速信息..."
            wget -qO- bench.sh | bash
            ;;
        8)
            echo "正在下载并运行 V2BX 一键安装脚本..."
            wget https://raw.githubusercontent.com/yuwan027/AlpineV2bX/master/AlpineV2bX.sh && bash AlpineV2bX.sh
            ;;
        0)
            echo "退出程序..."
            exit 0
            ;;
        *)
            echo "无效选项，请重试。"
            ;;
    esac
}
 
# 主程序
while true; do
    show_menu
    read -p "输入选项: " option
    handle_option $option
    echo ""
done
