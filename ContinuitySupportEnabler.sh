 #!/bin/sh

clear

osascript -e "tell application \"Terminal\" to set the font size of window 1 to 12"
osascript -e "tell application \"Terminal\" to set background color of window 1 to {1028, 12850, 65535}"
osascript -e "tell application \"Terminal\" to set normal text color of window 1 to {65535, 65535, 65535}"

clear && printf '\e[3J'

loc=`locale | grep LANG | sed -e 's/.*LANG="\(.*\)_.*/\1/'`

            if [ ! $loc = "ru" ]; then
printf '\n\n*****   Патч plist сценария разрешения Continuity Support для    ******\n'
printf '*****     мак моделей без нативной поддержки Continuity             ******\n'
                else
printf '\n\n*****   Патч plist сценария разрешения Continuity Support для    ******\n'
printf '*****     мак моделей без нативной поддержки Continuity             ******\n'
            fi

sleep 0.5

            if [ ! $loc = "ru" ]; then 
printf '\n    !!!   Ваша система '
                else
printf '\n    !!!   Ваша система '
            fi
printf "`sw_vers -productName`"
printf ': '; printf "`sw_vers -productVersion`" 
printf '('
printf "`sw_vers -buildVersion`"
printf ') '
printf '  !!!\n'


board=`ioreg -lp IOService | grep board-id | awk -F"<" '{print $2}' | cut -c 2- | rev | cut -c 3- | rev`

scontinuity=`defaults read /System/Library/Frameworks/IOBluetooth.framework/Versions/A/Resources/SystemParameters.plist | grep -A 1 "$board" | grep ContinuitySupport`

continuity=`echo ${scontinuity//[^0-1]/}`

            if [ ! $loc = "ru" ]; then 
printf '\n    !!!   board-id этого макинтоша = '
                    else
printf '\n    !!!   board-id этого макинтоша = '
            fi
printf "$board"
printf '   !!!\n'


case "$board" in

"Mac-4BC72D62AD45599E" ) legal=1;;
"Mac-742912EFDBEE19B3" ) legal=1;;
"Mac-7BA5B2794B2CDB12" ) legal=1;;
"Mac-8ED6AF5B48C039E1" ) legal=1;;
"Mac-942452F5819B1C1B" ) legal=1;;
"Mac-942459F5819B171B" ) legal=1;;
"Mac-94245A3940C91C80" ) legal=1;;
"Mac-94245B3640C91C81" ) legal=1;;
"Mac-942B59F58194171B" ) legal=1;;
"Mac-942B5BF58194151B" ) legal=1;;
"Mac-942C5DF58193131B" ) legal=1;;
"Mac-C08A6BB70A942AC2" ) legal=1;;
"Mac-F2208EC8" ) legal=1;;
"Mac-F2218EA9" ) legal=1;;
"Mac-F2218EC8" ) legal=1;;
"Mac-F2218FA9" ) legal=1;;
"Mac-F2218FC8" ) legal=1;;
"Mac-F221BEC8" ) legal=1;;
"Mac-F221DCC8" ) legal=1;;
"Mac-F222BEC8" ) legal=1;;
"Mac-F2238AC8" ) legal=1;;
"Mac-F2238BAE" ) legal=1;;
"Mac-F22586C8" ) legal=1;;
"Mac-F22587A1" ) legal=1;;
"Mac-F22587C8" ) legal=1;;
"Mac-F22589C8" ) legal=1;;
"Mac-F2268AC8" ) legal=1;;
"Mac-F2268CC8" ) legal=1;;
"Mac-F2268DAE" ) legal=1;;
"Mac-F2268DC8" ) legal=1;;
"Mac-F2268EC8" ) legal=1;;
"Mac-F226BEC8" ) legal=1;;
"Mac-F22788AA" ) legal=1;;
"Mac-F227BEC8" ) legal=1;;
"Mac-F22C86C8" ) legal=1;;
"Mac-F22C89C8" ) legal=1;;
"Mac-F22C8AC8" ) legal=1;;
"Mac-F42C86C8" ) legal=1;;
"Mac-F42C89C8" ) legal=1;;
"Mac-F42C8CC8" ) legal=1;;
"Mac-F42D86A9" ) legal=1;;
"Mac-F42D86C8" ) legal=1;;
"Mac-F42D88C8" ) legal=1;;
"Mac-F42D89A9" ) legal=1;;
"Mac-F42D89C8" ) legal=1;;

esac


if [[ $legal = 0 ]] 
	then 
            if [ ! $loc = "ru" ]; then		
		printf '\n    !!!   board-id этого макинтоша = '
		printf "$board"
		printf '   !!!\n\n'
		echo "Для этой модели мака патч невозможен или не требуется" 
		          else
        printf '\n    !!!   board-id этого макинтоша = '
		printf "$board"
		printf '   !!!\n\n'
		echo "Для этой модели мака патч невозможен или не требуется"
            fi 

            if [ ! $loc = "ru" ]; then
        read -p "Press any key to close this window " -n 1 -r
                else
        read -p "Для выхода нажмите любую клавишу" -n 1 -r
            fi
        clear
        osascript -e 'tell application "Terminal" to close first window' & exit
		exit 
fi
 
printf '\e[3J'
            if [ ! $loc = "ru" ]; then
printf '\nПолучаем информацию о системе ...\n\n'
printf 'Состояние разрешения сценария Bluetooth для '
                else
printf '\nПолучаем информацию о системе ...\n\n'
printf 'Состояние разрешения сценария Bluetooth для '
            fi
printf "$board"
printf ' \n'


if [ $continuity == 1 ]
	then
            if [ ! $loc = "ru" ]; then            
        echo "    !!!         Для этой системы патч  не требуется"
		printf '    !!!         Сценарий Continuity уже разрешен         !!!\n'
		echo "    !!!         Завершение работы программы.Выход"
                else
        echo "    !!!         Для этой системы патч  не требуется"
		printf '    !!!         Сценарий Continuity уже разрешен         !!!\n'
		echo "    !!!         Завершение работы программы.Выход"
            fi

            if [ ! $loc = "ru" ]; then
        read -p "Press any key to close this window " -n 1 -r
                else
        read -p "Для выхода нажмите любую клавишу" -n 1 -r
            fi
        clear
        osascript -e 'tell application "Terminal" to close first window' & exit
		exit 
fi

sleep 1
            if [ ! $loc = "ru" ]; then 		
printf '\n    !!! Сценарий Continuity запрещен, необходим патч !!!\n\n'


echo "Для продолжения нажмите англ. литеру Y"
echo "Для завершения любую другую клавишу"
printf '\n'

read -p "Желаете продолжить установку? (y/N) " -n 1 -r
            else
printf '\n    !!! Сценарий Continuity запрещен, необходим патч !!!\n\n'


echo "Для продолжения нажмите англ. литеру Y"
echo "Для завершения любую другую клавишу"
printf '\n'
              
read -p "Желаете продолжить установку? (y/N) " -n 1 -r
            fi

if [[ ! $REPLY =~ ^[yY]$ ]]

then
    
            if [ ! $loc = "ru" ]; then
        printf '\n\nМудрый выбор. Завершение  программы. Выход ... !\n'
                else
       printf '\n\nМудрый выбор. Завершение  программы. Выход ... !\n'
            fi
        clear
        osascript -e 'tell application "Terminal" to close first window' & exit
		exit 
fi

sleep 0.3
            if [ ! $loc = "ru" ]; then
printf '\n\n\n*****  Вы точно знаете что делаете!  *****\n\n'
printf '\nДля продолжения введите ваш пароль\n\n'
                else
printf '\n\n\n*****  Вы точно знаете что делаете!  *****\n\n'
printf '\nДля продолжения введите ваш пароль\n\n'
            fi

sudo printf '\n\n'

function ProgressBar {

let _progress=(${1}*100/${2}*100)/100
let _done=(${_progress}*4)/10
let _left=40-$_done

_fill=$(printf "%${_done}s")
_empty=$(printf "%${_left}s")

            if [ ! $loc = "ru" ]; then
printf "\rВыполняется: ${_fill// /.}${_empty// / } ${_progress}%%"
                else
printf "\rВыполняется: ${_fill// /.}${_empty// / } ${_progress}%%"
            fi

}

cd $(dirname $0)

cp /System/Library/Frameworks/IOBluetooth.framework/Versions/A/Resources/SystemParameters.plist .

plutil -replace  $board.ContinuitySupport  -bool YES SystemParameters.plist

sudo cp SystemParameters.plist /System/Library/Frameworks/IOBluetooth.framework/Versions/A/Resources/SystemParameters.plist

rm -f SystemParameters.plist

            if [ ! $loc = "ru" ]; then
echo "    !!!    Патч сценария Bluetooth для Continuity сделан"
printf '\n\nОбновляем кэш системных сценариев. Это занимает несколько минут\n'
sleep 1

printf '\nВыполняется: '
                else
echo "    !!!    Патч сценария Bluetooth для Continuity сделан"
printf '\n\nОбновляем кэш системных сценариев. Это занимает несколько минут\n'
sleep 1

printf '\nВыполняется: '
            fi

while :;do printf '.';sleep 3;done &
trap "kill $!" EXIT 
sudo update_dyld_shared_cache -debug -force -root / 2>/dev/null
kill $!
wait $! 2>/dev/null
trap " " EXIT

            if [ ! $loc = "ru" ]; then
printf '\n\nКэш системных сценариев обновлен\n\n'
printf '\nВсе операции завершены\n'
sleep 1
printf '\nНеобходимый таймаут перед перезагрузкой операционной системы\n'
printf '\nНажмте CTRL + C для прерывания если не хотите перезагружать сейчас\n\n'
                else
printf '\n\nКэш системных сценариев обновлен\n\n'
printf '\nВсе операции завершены\n'
sleep 1
printf '\nНеобходимый таймаут перед перезагрузкой операционной системы\n'
printf '\nНажмте CTRL + C для прерывания если не хотите перезагружать сейчас\n\n'
            fi

_start=1

_end=100


for number in $(seq ${_start} ${_end})
do
sleep 0.3
ProgressBar ${number} ${_end}
done


sleep 1


            if [ ! $loc = "ru" ]; then
printf '\n\nПрограмма завершена. Инициирована перезагрузка. На HDD может занять пару минут.\n\n'
                else
printf '\n\nПрограмма завершена. Инициирована перезагрузка. На HDD может занять пару минут.\n\n'
            fi

sudo reboot now

exit 1


