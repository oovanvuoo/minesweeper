#!/bin/bash
printf "====================================================\n"
printf "   Synchronization with rsync $(date +'%T')\n"
printf "====================================================\n"

# sh dev.deploy.sh

key='pwd'
ip_live="Heroku server IP"
DOMAIN_NAME="mines.board.com"

options='sshpass -p $key rsync -avzhe ssh -e "ssh -o StrictHostKeyChecking=no" --progress --timeout=5'

eval $options "${PWD}"/app/ ruby@$ip_live:/home/ruby/$DOMAIN_NAME/app/ --delete
eval $options "${PWD}"/db/ ruby@$ip_live:/home/ruby/$DOMAIN_NAME/db/ --delete
eval $options "${PWD}"/bin/ ruby@$ip_live:/home/ruby/$DOMAIN_NAME/bin/ --delete
eval $options "${PWD}"/lib/ ruby@$ip_live:/home/ruby/$DOMAIN_NAME/lib/ --delete
eval $options "${PWD}"/.bundle/ ruby@$ip_live:/home/ruby/$DOMAIN_NAME/.bundle/ --delete
eval $options "${PWD}"/public/ ruby@$ip_live:/home/ruby/$DOMAIN_NAME/public/ --delete
eval $options "${PWD}"/config.ru ruby@$ip_live:/home/ruby/$DOMAIN_NAME/config.ru --delete
eval $options "${PWD}"/Rakefile ruby@$ip_live:/home/ruby/$DOMAIN_NAME/Rakefile --delete
eval $options "${PWD}"/README.md ruby@$ip_live:/home/ruby/$DOMAIN_NAME/README.md --delete
eval $options "${PWD}"/config/ ruby@$ip_live:/home/ruby/$DOMAIN_NAME/config/  --delete
eval $options "${PWD}"/Gemfile ruby@$ip_live:/home/ruby/$DOMAIN_NAME/Gemfile --delete

eval $options --exclude 'environments/*' --exclude 'database.yml' "${PWD}"/config/ ruby@$ip_live:/home/ruby/$DOMAIN_NAME/config/ --delete

if [ $# -eq 1 ]
  then
    options='sshpass -p $key ssh ruby@$ip_live "cd /home/ruby/$DOMAIN_NAME && bundle install && rails restart"'
    eval $options
    echo "bundle done"
fi

printf "====================================================\n"
printf "     Done with rsync $(date +'%T')\n"
printf "====================================================\n"
