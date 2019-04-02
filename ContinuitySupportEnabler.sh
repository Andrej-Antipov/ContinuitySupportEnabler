 #!/bin/sh

clear && printf '\e[3J' 

printf '\n\n*****   Патч plist сценария разрешения Continuity Support для    ******\n'
printf '*****  мак моделей без нативной поддержки Continuity             ******\n'

sleep 0.5

printf '\n    !!!   Ваша система '
printf "`sw_vers -productName`"
printf ': '; printf "`sw_vers -productVersion`" 
printf '('
printf "`sw_vers -buildVersion`"
printf ') '
printf '  !!!\n'


board=`ioreg -lp IOService | grep board-id | awk -F"<" '{print $2}' | cut -c 2- | rev | cut -c 3- | rev`

scontinuity=`defaults read /System/Library/Frameworks/IOBluetooth.framework/Versions/A/Resources/SystemParameters.plist | grep -A 1 "$board" | grep ContinuitySupport`

continuity=`echo ${scontinuity//[^0-1]/}`


printf '\n    !!!   board-id этого макинтоша = '
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
		sleep 3
		clear && printf '\e[3J'
		printf '\n    !!!   board-id этого макинтоша = '
		printf "$board"
		printf '   !!!\n\n'
		echo "Для этой модели мака патч невозможен или не требуется" 
		echo "Завершение программы. Выход"
		echo
		echo
		sleep 1
		exit 1
fi
 
printf '\e[3J'

printf '\nПолучаем информацию о системе ...\n\n'
printf 'Состояние разрешения сценария Bluetooth для '
printf "$board"
printf ' \n'


if [ $continuity == 1 ]
	then
        sleep 3
		clear && printf '\e[3J'
        echo "    !!!         Для этой системы патч  не требуется"
		printf '    !!!         Сценарий Continuity уже разрешен         !!!\n'
		echo "    !!!         Завершение работы программы.Выход"
		printf '\n\n\n\n'
		exit 1
fi
sleep 1
		
printf '\n    !!! Сценарий Continuity запрещен, необходим патч !!!\n\n'


echo "Для продолжения нажмите англ. литеру Y"
echo "Для завершения любую другую клавишу"
printf '\n'
               

read -p "Желаете продолжить установку? (y/N) " -n 1 -r

if [[ ! $REPLY =~ ^[yY]$ ]]

then
    
    printf '\n\nМудрый выбор. Завершение  программы. Выход ... !\n'
    sleep 2
   
    exit 1

fi

sleep 0.3

printf '\n\n\n*****  Вы точно знаете что делаете!  *****\n\n'
printf '\nДля продолжения введите ваш пароль\n\n'



sudo printf '\n\n'

function ProgressBar {

let _progress=(${1}*100/${2}*100)/100
let _done=(${_progress}*4)/10
let _left=40-$_done

_fill=$(printf "%${_done}s")
_empty=$(printf "%${_left}s")

printf "\rВыполняется: ${_fill// /.}${_empty// / } ${_progress}%%"

}

cd $(dirname $0)

cp /System/Library/Frameworks/IOBluetooth.framework/Versions/A/Resources/SystemParameters.plist .

plutil -replace  $board.ContinuitySupport  -bool YES SystemParameters.plist

sudo cp SystemParameters.plist /System/Library/Frameworks/IOBluetooth.framework/Versions/A/Resources/SystemParameters.plist

rm -f SystemParameters.plist

echo "    !!!    Патч сценария Bluetooth для Continuity сделан"

printf '\n\nОбновляем кэш системных сценариев. Это занимает несколько минут\n'
sleep 1



printf '\nВыполняется: '
while :;do printf '.';sleep 3;done &
trap "kill $!" EXIT 
sudo update_dyld_shared_cache -debug -force -root / 2>/dev/null
kill $!
wait $! 2>/dev/null
trap " " EXIT

printf '\n\nКэш системных сценариев обновлен\n\n'



printf '\nВсе операции завершены\n'
sleep 1

printf '\nНеобходимый таймаут перед перезагрузкой операционной системы\n'

printf '\nНажмте CTRL + C для прерывания если не хотите перезагружать сейчас\n\n'
sleep 5


_start=1

_end=100


for number in $(seq ${_start} ${_end})
do
sleep 0.3
ProgressBar ${number} ${_end}
done


sleep 1



printf '\n\nПрограмма завершена. Инициирована перезагрузка. На HDD может занять пару минут.\n\n'


sudo reboot now

exit 1


