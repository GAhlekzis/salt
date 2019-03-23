_qvm-run() {
    local app_vms
    app_vms=( $(qvm-ls --raw-list|grep -v "^dom0$") )

    local exc=
    if (( words[(I)--all] )); then
        exc="*--exclude=[When --all is used: exclude this VM name (may be repeated)]:QubesVMs:($app_vms)"
    fi

    _arguments -S '(-a --auto)'{-a,--auto}'[Auto start the VM if not running]'\
        '(1)--all[ Run command on all currently running VMs (or all paused, in case of --unpause)]'\
        '(--no-color-output --color-output)--color-output[Force marking VM output with given ANSI style (use 31 for red)]'\
        '(--no-color-output --color-output)--no-color-output[Disable marking VM output with red color]'\
        '(--no-filter-escape-chars --filter-escape-charas)--filter-escape-charas[Filter terminal escape sequences (default if output is terminal)]'\
        '(--no-filter-escape-chars --filter-escape-charas)--no-filter-escape-chars[Do not filter terminal escape sequences - overrides --filter-escape-chars, DANGEROUS when output is terminal]'\
        '--force[Force operation, even if may damage other VMs (eg shutdown of NetVM)]'\
        '(- *)'{-h,--help}'[show help message and exit]'\
        '--localcmd=[With --pass-io, pass stdin/stdout/stderr to the given program]:cmd:_command_names' \
        '--nogui[Run command without gui]'\
        '(--pause --unpause)--pause[Do xl pause for the VM(s) (can be combined this with --all and --wait)]'\
        '(--pause --unpause)--unpause[Do xl unpause for the VM(s) (can be combined this with --all and --wait)]'\
        '(-p --pass-io)'{-p,--pass-io}'[Pass stdin/stdout/stderr from remote program (implies quiet -q)]'\
        '(-q --quiet)'{-q,--quiet}'[]'\
        '--shutdown[(deprecated) Do xl shutdown for the VM(s) (can be combined this with --all and --wait)]'\
        '--tray[Use tray notifications instead of stdout]'\
        '(-u --user)'{-u,--user}'[Run command in a VM as a specified user]:user:_users'\
        '--wait+[Wait for the VM(s) to shutdown]:'\
        $exc \
        "1:QubesVMs:($app_vms)"\
        '2:Commands:_command_names';

}

_qvm-ls(){
    local app_vms
    app_vms=( $(qvm-ls --raw-list) )
    _arguments -S '(- *)'{-h,--help}'[show help message and exit]'\
        '(-n --network)'{-n,--network}'[Show network addresses assigned to VMs]'\
        '(-c --cpu)'{-c,--cpu}'[Show CPU load]'\
        '(-m --mem)'{-m,--mem}'[Show memory usage]'\
        '(-d --disk)'{-d,--disk}'[Show VM disk utilization statistics]'\
        '(-k --kernel)'{-k,--kernel}'[Show VM kernel options]'\
        '(-i --ids)'{-i,--ids}'[Show Qubes and Xen id#s]'\
        '(-b --last-backup)'{-b,--last-backup}'[Show date of last VM backup]'\
        '(- *)--raw-list[List only VM names on per line]' \
        "*:QubesVMs:($app_vms)";
}

_qvm-shutdown() {
    local app_vms
    app_vms=( $(qvm-ls --raw-data |grep 'Running'|cut -d'|' -f 1|tr -d " {}[]<>=") )

    local exc=
    if (( words[(I)--all] )); then
        exc="*--exclude=[When --all is used: exclude this VM name (may be repeated)]:QubesVMs:($app_vms)"
    fi
    _arguments -S '(- *)'{-h,--help}'[show help message and exit]'\
        '(1)--all[Shutdown all running VMs)]'\
        '--force[Force operation, even if may damage other VMs (eg shutdown of NetVM)]'\
        '--wait[Wait for the VM(s) to shutdown]'\
        '(-q --quiet)'{-q,--quiet}'[]'\
        $exc \
        "1:QubesVMs:($app_vms)";

}

_qvm-create() {
    local colors templates
    templates=( $(qvm-ls|grep 'Tpl |'|cut -d'|' -f1|tr -d " =<>[]{}") )
    colors=(red green black yellow orange gray blue purple)
    _arguments -S '(- *)'{-h,--help}'[show help message and exit]'\
        '(-H --hvm -p --proxy -n --net --hvm-template)'{-p,--proxy}'[Create ProxyVM]'\
        '(-H --hvm -p --proxy -n --net --hvm-template)'{-H,--hvm}'[Create HVM (standalone unless --template option used)]'\
        '(-H --hvm -p --proxy -n --net --hvm-template)--hvm-template[Create HVM template]'\
        '(-H --hvm -p --proxy -n --net --hvm-template)'{-n,--net}'[Create NetVM]'\
        '(-r --root-copy-from= -R --root-move-from=)'{-R,--root-move-from=}"[Use provided root.img instead of default/empty one (file will be MOVED)]:files:_files -g '*.(#i)img(.)'"\
        '(-r --root-copy-from= -R --root-move-from=)'{-r,--root-copy-from=}"[Use provided root.img instead of default/empty one (file will be COPIED)]:files:_files -g '*.(#i)img(.)'"\
        '(-s --standalone)'{-s,--standalone}'[Create standalone VM - independent of template]'\
        '(-m --mem)'{-m,--mem}'[Initial memory size (in MB)]'\
        '(-c --vcpus)'{-c,--vcpus}'[VCPUs count]'\
        '(-i --internal)'{-i,--internal}'[Create VM for internal use only (hidden in qubes-manager, no appmenus)]'\
        '--force-root[Force to run, even with root privileges]'\
        '(-q --quiet)'{-q,--quiet}'[]'\
        '(-l --label=)'{-l,--label=}"[Specify the label color]:Colors:($colors)"\
        '(-t --template=)'{-t,--template=}"[Specify the TemplateVM to use]:TemplateVMs:($templates)"\
        '*:vm-name::'
    ;
}

_qubes-hcl-report(){
    local app_vms
    app_vms=( $(qvm-ls --raw-list) )
    _arguments -S '(- *)'{-h,--help}'[show help message and exit]'\
        "1:QubesVMs:($app_vms)";
}

_qvm-backup(){
    local app_vms enc_algo
    app_vms=( $(qvm-ls --raw-list) )
    enc_algo=( $(openssl list-cipher-algorithms|grep -v "=>") )
    hmac_algo=( $(openssl list-message-digest-algorithms|grep -v "=>") )
    _arguments : '(- *)'{-h,--help}'[show help message and exit]'\
        '--force-root[Force to run, even with root privileges]'\
        '(-d --dest-vm= 1)'{-d,--dest-vm=}"[AppVM to send backups to (implies -e)]:QubesVM:($app_vms)"\
        '(-e --encrypt)'{-e,--encrypt}'[Encrypts backup]' '--no-encrypt[Skip encrypt even if sending the backup to VM]'\
        '(-E --enc-algo=)'{-E,--enc-algo=}"[Specify non-default encryption algorithm]:list-cipher-algorithms:($enc_algo)"\
        '(-H --hmac-algo=)'{-H,--hmac-algo=}"[Specify non-default hmac algorithm]:list-message-digest-algorithms:($hmac_algo)"\
        '(-z --compress)'{-z,--compress}"[Compress backup]"\
        \*{-x,--exclude}"[Exclude the specified VM from backup (may be repeated)]:QubesVM:($app_vms)" && return 0

}

_qvm-clone(){
    local app_vms
    app_vms=( $(qvm-ls |grep 'Halted |'|cut -d'|' -f 1|tr -d " {}[]<>=") )
    _arguments : '(- *)'{-h,--help}'[show help message and exit]'\
        '--force-root[Force to run, even with root privileges]'\
        '(-q --quiet)'{-q,--quiet}'[]'\
        '(-p --path=)'{-p,--path=}'[Specify path to the template directory]:dirs:_directories'\
        "1:Halted VMs:($app_vms)";
        ;

}


_qvm-prefs(){
    local app_vms properties values state expl colors foo
    colors=(red green black yellow orange gray blue purple)
    app_vms=( $(qvm-ls --raw-list) )

    properties=( autostart debug default_user include_in_backups internal kernel kernelopts label mac maxmem memory name netvm pcidevs qrexec_timeout template vcpus )

    #echo "${app_vms[(I)$words[2]]}"
    if (( app_vms[(I)$words[2]] )); then
        values="(-l)-s[Set property]:Property:($properties):value:->set";
    else
        values="(-l)-s[Set property]:QubesVM:($app_vms):Property:($properties):value:->set";
    fi
    _arguments '(- *)'{-h,--help}'[show help message and exit]'\
        "(-s)-l[List properties]"\
        $values \
        '--force-root[Force to run, even with root privileges]'\
        "1:QubesVM2:($app_vms)"\
        && return 0

    if [[ $state == set ]]; then
        foo=$words[CURRENT-1]
        case "$foo" in
            autostart|debug|include_in_backups|internal)
                _describe -t colors "Boolean" "(True False)" && return
                ;;
            dir)
                _wanted directory expl 'Directory' _directories && return;
                ;;
            label)
                _describe -t colors "Colors" colors && return
                ;;
            netvm)
                netvm=( $(qvm-ls |grep 'netvm |'|grep -v updbl|cut -d'|' -f 1|tr -d " {}[]<>=") )
                _describe -t netvm "NetVM" netvm && return
                ;;
            template)
                templates=( $(qvm-ls|grep 'Tpl |'|cut -d'|' -f1|tr -d " =<>[]{}") )
                _describe -t templates "Template" templates && return
                ;;
            kernel)
                values=( 'default:Default Choice' 'none:Use kernel subdir in VM' )
                values+=( $(qvm-prefs java -s kernel 2>&1|grep ' \- '|tr -d ' \-') )
                _describe -t kernel "Kernel" values && return
                ;;


        esac

    fi


}



compdef _qvm-run qvm-run
compdef _qvm-ls qvm-ls
compdef _qvm-shutdown qvm-shutdown
compdef _qvm-create qvm-create
compdef _qubes-hcl-report qubes-hcl-report
compdef _qvm-backup qvm-backup
compdef _qvm-clone qvm-clone
compdef _qvm-prefs qvm-prefs
