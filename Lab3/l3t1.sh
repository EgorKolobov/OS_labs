#!/bin/bash

time=$(date '+%d.%m.%y_%H:%M:%S')

mkdir $HOME/test &&
{
    echo "catalog test was created successfully" > $HOME/report ; touch $HOME/test/$time ;
}

host="www.net_nikogo.ru"

ping -c1 $host ||
{
    echo "${time} Ошибка: Не удается получить доступ к сайту ${host}" >> ~/report ;
}
