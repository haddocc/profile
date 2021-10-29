function vagrant () { # comes in handy when you want to vagrant up from a shared folder from another system
    case $* in
            up* ) shift 1; echo $UID > $PWD/.vagrant/machines/$(vmname=$(grep "^name:" Homestead.yaml 2> /dev/null | awk '{print $2}'); [[ -z "$vmname" ]] && echo 'default' || echo $vmname;)/virtualbox/creator_uid; command vagrant up "$@";;
    phpr )
            php=$(vagrant ssh -- -t "sudo nginx -T | grep -Eo 'php[0-9].+' | sed -E 's/.sock;//g'" | tail -1 | tr -d '\r')
            command vagrant ssh -- -t "sudo systemctl restart $php";;
    hup ) command vagrant halt && vagrant up;; # shortcut halt and up in the same command
    * ) command vagrant "$@";; # passthrough all other commands as fallback to proceed as normal
    esac
}
