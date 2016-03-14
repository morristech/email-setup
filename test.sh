#!/bin/bash

#cd /etc/dovecot

cp /etc/dovecot/conf.d/10-mail.conf /etc/dovecot/conf.d/10-mail.conf.BAK

cp /etc/dovecot/conf.d/10-master.conf /etc/dovecot/conf.d/10-master.conf.BAK

cp /etc/dovecot/conf.d/10-auth.conf /etc/dovecot/conf.d/10-auth.conf.BAK

sed -i -e '/mail_location =/cmail_location = maildir:~/Maildir' /etc/dovecot/conf.d/10-mail.conf

sed -i -e '/unix_listener auth-userdb {/cunix_listener /var/spool/postfix/private/auth {'
sed -i -e '/#mode/cmode = 0660' /etc/dovecot/conf.d/10-master.conf
sed -i -e '/#user/cuser = postfix' /etc/dovecot/conf.d/10-master.conf
sed -i -e '/#group/cgroup = postfix' /etc/dovecot/conf.d/10-master.conf

sed -i -e '/disable_plaintext_auth =/cdisable_plaintext_auth= no' /etc/dovecot/conf.d/10-auth.conf
sed -i -e '/auth_mechanisms =/cauth_mechanisms = plain login' /etc/dovecot/conf.d/10-auth.conf
