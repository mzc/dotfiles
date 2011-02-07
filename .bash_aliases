# ~/.bash_aliases: executed by ~/.bashrc

alias rm='rm -i'
alias ls='ls --color'
alias ll='ls -l'
alias l.='ls -d'
alias ec='emacsclient -c -a ""'

# libvirt stuff

alias lshm1='virsh -c qemu+ssh://ubuntu@hm1/system list --all'
alias lshp1='virsh -c qemu+ssh://ubuntu@hp1/system list --all'
alias lshg2='virsh -c qemu+ssh://ubuntu@hg2/system list --all'
alias lssga='virsh -c qemu+ssh://ubuntu@120.146.205.173:22212/system list --all'

alias ghm1='virsh -c qemu+ssh://ubuntu@hm1/system'
alias ghp1='virsh -c qemu+ssh://ubuntu@hp1/system'
alias ghg2='virsh -c qemu+ssh://ubuntu@hg2/system'
alias gsga='virsh -c qemu+ssh://ubuntu@120.146.205.173:22212/system'

alias vvbzr='virt-viewer -c qemu+ssh://ubuntu@hm1/system hm1-2-vbzr'
alias vvqa='virt-viewer -c qemu+ssh://ubuntu@hm1/system hm1-3-vqa'
alias vvdeb='virt-viewer -c qemu+ssh://ubuntu@hm1/system hm1-7-vdeb'
alias vvldap='virt-viewer -c qemu+ssh://ubuntu@hm1/system hm1-8-vldap'

alias vvsbr='virt-viewer -c qemu+ssh://ubuntu@hp1/system hp1-1-vsbr'
alias vvpymdem='virt-viewer -c qemu+ssh://ubuntu@hp1/system hp1-2-vpymdem'
alias vv10070='virt-viewer -c qemu+ssh://ubuntu@hp1/system hp1-3-v10070'
alias vv10063b='virt-viewer -c qemu+ssh://ubuntu@hp1/system hp1-5-v10063b'
alias vv10023b='virt-viewer -c qemu+ssh://ubuntu@hp1/system hp1-6-v10023b'

alias vboss='virt-viewer -c qemu+ssh://ubuntu@hg2/system hg2-1-v10101'
alias vvmatrix='virt-viewer -c qemu+ssh://ubuntu@hg2/system hg2-5-vmatrix'

alias vv10102='virt-viewer -c qemu+ssh://ubuntu@120.146.205.173:22212/system muli10102-1-v10102'

# host

alias uhp1='ssh -X ubuntu@hp1'
alias uhm1='ssh -X ubuntu@hm1'
alias uhg2='ssh -X ubuntu@hg2'
alias umuli10102='ssh -X -p 22212 ubuntu@120.146.205.173'

# muli10102

alias uv10102='ssh -X -p 22208 ubuntu@120.146.205.173'
alias mv10102='ssh -X -p 22208 mulisu@120.146.205.173'

# hm1

alias uvbzr='ssh -X ubuntu@vbzr'
alias mvbzr='ssh -X mulisu@vbzr'

alias uvqa='ssh -X ubuntu@vqa'
alias mvqa='ssh -X mulisu@vqa'

alias uv10000='ssh -X ubuntu@v10000'
alias mv10000='ssh -X mulisu@v10000'

alias uvdeb='ssh -X ubuntu@vdeb'
alias mvdeb='ssh -X mulisu@vdeb'

alias uvldap='ssh -X ubuntu@vldap'
alias mvldap='ssh -X mulisu@vldap'

# pymble firewall
alias rpym='ssh root@202.5.96.131'

# hp1

alias uvsbr='ssh -X ubuntu@vsbr'

alias uvpymdem='ssh -X ubuntu@vpymdem'
alias mvpymdem='ssh -X mulisu@vpymdem'

alias uv10070='ssh -X ubuntu@v10070'
alias mv10070='ssh -X mulisu@v10070'

alias uv10063b='ssh -X ubuntu@v10063b'
alias mv10063b='ssh -X mulisu@v10063b'

alias uv10023b='ssh -X ubuntu@v10023b'
alias mv10023b='ssh -X mulisu@v10023b'

# hg2

alias uboss='ssh -X ubuntu@boss'
alias mboss='ssh -X mulisu@boss'

alias uvdemo='ssh -X ubuntu@vdemo'
alias mvdemo='ssh -X mulisu@vdemo'

alias uvwww='ssh -X muliadmin@vwww'

alias uvmatrix='ssh -X ubuntu@vmatrix'
alias mvmatrix='ssh -X mulisu@vmatrix'

alias uvflash='ssh -X ubuntu@vflash'

# workstation

alias ubq='ssh -X ubuntu@bq'
alias mbq='ssh -X mulisu@bq'

alias ualc='ssh -X muliadmin@alc'
alias malc='ssh -X mulisu@alc'

alias ucjb='ssh -X ubuntu@cjb'
alias mcjb='ssh -X mulisu@cjb'

alias um5714='ssh -X ubuntu@m5714'
alias mm5714='ssh -X mulisu@m5714'

alias ulms='ssh -X ubuntu@lms'
alias mlms='ssh -X mulisu@lms'

