#!/bin/bash

# Alt menüleri ve paket isimlerini tanımlayın
declare -A System=(
    ["kali-linux-core"]="        Base Kali Linux System – core items that are always included"
    ["kali-linux-headless"]="    Default install that doesn’t require GUI"
    ["kali-linux-default"]="     Default desktop (amd64/i386) images include these tools"
    ["kali-linux-arm"]="         All tools suitable for ARM devices"
    ["kali-linux-nethunter"]="   Tools used as part of Kali NetHunter"
)

declare -A Desktop=(
    ["kali-desktop-core"]="      Any key tools required for a GUI image"
    ["kali-desktop-e17"]="       Enlightenment (WM)"
    ["kali-desktop-gnome"]="     GNOME (DE)"
    ["kali-desktop-i3"]="        i3 (WM)"
    ["kali-desktop-kde"]="       KDE (DE)"
    ["kali-desktop-lxde"]="      LXDE (WM)"
    ["kali-desktop-mate"]="      MATE (DE)"
    ["kali-desktop-xfce"]="      Xfce (WM)"
)

declare -A Tools=(
	["kali-tools-gpu"]="              Tools which benefit from having access to GPU hardware"
	["kali-tools-hardware"]="          Hardware hacking tools"
	["kali-tools-crypto-stego"]="      Tools based around Cryptography & Steganography"
	["kali-tools-fuzzing"]="           For fuzzing protocols"
	["kali-tools-802-11"]="            802.11 (Commonly known as “Wi-Fi”)"
	["kali-tools-bluetooth"]="        For targeting Bluetooth devices"
	["kali-tools-rfid"]="              Radio-Frequency IDentification tools"
	["kali-tools-sdr"]="               Software-Defined Radio tools"
	["kali-tools-voip"]="              Voice over IP tools"
	["kali-tools-windows-resources"]=" Any resources which can be executed on a Windows hosts"
	["kali-linux-labs"]="              Environments for learning and practising on"
)

declare -A Menu=(
	["kali-tools-information-gathering"]=" Used for Open Source Intelligence (OSINT) & information gathering"
	["kali-tools-vulnerability"]="         Vulnerability assessments tools"
	["kali-tools-web"]="                  Designed doing web applications attacks"
	["kali-tools-database"]="              Based around any database attacks"
	["kali-tools-passwords"]="             Helpful for password cracking attacks – Online & offline"
	["kali-tools-wireless"]="             All tools based around Wireless protocols – 802.11, Bluetooth, RFID & SDR"
	["kali-tools-reverse-engineering"]="   For reverse engineering binaries"
	["kali-tools-exploitation"]="          Commonly used for doing exploitation"
	["kali-tools-social-engineering"]="   Aimed for doing social engineering techniques"
	["kali-tools-sniffing-spoofing"]="    Any tools meant for sniffing & spoofing"
	["kali-tools-post-exploitation"]="     Techniques for post exploitation stage"
	["kali-tools-forensics"]="             Forensic tools – Live & Offline"
	["kali-tools-reporting"]="             Reporting tools"
)

declare -A Others=(
	["kali-linux-large"]="				 Our previous default tools for amd64/i386 images"
	["kali-linux-everything"]="          Every metapackage and tool listed here"
	["kali-desktop-live"]="              Used during a live session when booted from the image"
)


# Ana menüyü oluştur
clear
PS3="$(tput setaf 4)Please select a category: $(tput sgr0)"
echo ""
echo ""
echo -e "       \e[34m _  __     _ _                 \e[0m"
echo -e "       \e[34m| |/ /__ _| (_)_ __  _ __ ___  \e[0m"
echo -e "       \e[34m| ' // _\` | | | '_ \| '_ \` _ \ \e[0m"
echo -e "       \e[34m| . \\ (_| | | | |_) | | | | | |\e[0m"
echo -e "       \e[34m|_|\_\\__,_|_|_| .__/|_| |_| |_|\e[0m"
echo -e "       \e[34m              |_|\e[0m"
echo "  Enter the Menu you are interested in"

options=("System" "Desktop" "Tools" "Menu" "Others" "Quit" "Update")
select opt in "${options[@]}"
do
    case $opt in
        "System")
			clear
			echo ""
            echo "	You have selected the System category."
            echo " "
            counter=1
            for key in "${!System[@]}"; do
              echo "$counter) $key: ${System[$key]}"
              let counter++
            done
			read -p "$(tput setaf 4)Please make a choice: $(tput sgr0)" choice
			pkg=$(echo "${!System[@]}" | cut -d ' ' -f $choice)

			if [[ -z $pkg ]]; then
				clear
			    echo "$(tput setaf 1)$(tput bold)Invalid choice. Please try again.$(tput sgr0)"
			else
			    sudo apt-get install -y ${pkg}
			fi
				clear
	            PS3=$(tput setaf 3)$(tput bold)"Press enter to select category: "$(tput sgr0)
	            clear
	            ;;

        "Desktop")
			clear
			echo ""
            echo "	You have selected the Desktop category."
            echo ""
            counter=1
            for key in "${!Desktop[@]}"; do
              echo "$counter) $key: ${Desktop[$key]}"
              let counter++
            done
			read -p "$(tput setaf 4)Please make a choice: $(tput sgr0)" choice
			pkg=$(echo "${!Desktop[@]}" | cut -d ' ' -f $choice)

			if [[ -z $pkg ]]; then
			    echo "$(tput setaf 1)$(tput bold)Invalid choice. Please try again.$(tput sgr0)"
			else
			    sudo apt-get install -y ${pkg}
			fi
				clear
	            PS3=$(tput setaf 3)$(tput bold)"Press enter to select category: "$(tput sgr0)
	            ;;

        "Tools")
			clear
			echo " "
            echo "	You have selected the Tools category."
            echo ""
            counter=1
            for key in "${!Tools[@]}"; do
              echo "$counter) $key: ${Tools[$key]}"
              let counter++
            done
  			read -p "$(tput setaf 4)Please make a choice: $(tput sgr0)" choice
			pkg=$(echo "${!Tools[@]}" | cut -d ' ' -f $choice)

			if [[ -z $pkg ]]; then
			    echo "$(tput setaf 1)$(tput bold)Invalid choice. Please try again.$(tput sgr0)"
			else
			    sudo apt-get install -y ${pkg}
			fi
				clear
	            PS3=$(tput setaf 3)$(tput bold)"Press enter to select category: "$(tput sgr0)
	            ;;

        "Menu")
			clear
			echo " "
            echo " You have selected the menu category."
            echo " "
            counter=1
            for key in "${!Menu[@]}"; do
              echo "$counter) $key: ${Menu[$key]}"
              let counter++
            done
			read -p "$(tput setaf 4)Please make a choice: $(tput sgr0)" choice
			pkg=$(echo "${!Menu[@]}" | cut -d ' ' -f $choice)

			if [[ -z $pkg ]]; then
			    echo "$(tput setaf 1)$(tput bold)Invalid choice. Please try again.$(tput sgr0)"
			else
			    sudo apt-get install -y ${pkg}
			fi
				clear
	            PS3=$(tput setaf 3)$(tput bold)"Press enter to select category: "$(tput sgr0)
	            ;;

        "Others")
			clear
			echo ""
            echo " You have selected the Others category."
            echo ""
            counter=1
            for key in "${!Others[@]}"; do
              echo "$counter) $key: ${Others[$key]}"
              let counter++
            done
			read -p "$(tput setaf 4)Please make a choice: $(tput sgr0)" choice
			pkg=$(echo "${!Others[@]}" | cut -d ' ' -f $choice)

			if [[ -z $pkg ]]; then
			    echo "$(tput setaf 1)$(tput bold)Invalid choice. Please try again.$(tput sgr0)"
			else
			    sudo apt-get install -y ${pkg}
			fi
				clear
	            PS3=$(tput setaf 3)$(tput bold)"Press enter to select category: "$(tput sgr0)
	            ;;
        "Update")
			clear
			echo -e "\e[1;34mUpdate Process started\e[0m"
			sudo apt-get clean
			sudo apt-get update -y
			sudo apt-get upgrade -y
			sudo apt-get full-upgrade -y
			PS3=$(tput setaf 3)$(tput bold)"Press enter to select category: "$(tput sgr0)
			;;
        "Quit")
            break
            ;;
        *) echo "$(tput setaf 1)$(tput bold)Invalid option $REPLY$(tput sgr0)";;
    esac
done





