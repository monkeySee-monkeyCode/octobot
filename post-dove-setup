

echo "installing aptitude package manager -=SUDO=-"
sudo apt-get install aptitude
suod apt-get install git

echo "installing postfix/dovecot mail stack -=SUDO=-"

sudo aptitude mail-delivery-stack
sudo aptitude install python-software-properties
sudo add-apt-repository ppa:malte.swart/dovecot-2.2
sudo aptitude update
sudo aptitude upgrade


ehco "installing spamassassin mail filter -=SUDO=-"

aptitude install spamass-milter pyzor razor libmail-dkim-perl spamassassin sa-compile spamd
adduser --shell /bin/false --home /var/lib/spamassassin --disabled-password --disabled-login --gecos "" spamd
usermod -a -G spamd spamass-milter
mkdir /var/spool/postfix/spamassassin
chown spamd:root /var/spool/postfix/spamassassin/
sa-update
chown -R spamd:spamd /var/lib/spamassassin
mkdir /var/lib/spamassassin/.spamassassin
chown spamd:spamd /var/lib/spamassassin/.spamassassin
usermod -a -G spamd spamass-milter
mkdir /var/lib/spamassassin/.razor
mkdir /var/lib/spamassassin/.pyzor
mkdir /var/lib/spamassassin/.spamassassin
pyzor --homedir /var/lib/spamassassin/.pyzor discover
razor-admin -home=/var/lib/spamassassin/.razor -register
razor-admin -home=/var/lib/spamassassin/.razor -create
razor-admin -home=/var/lib/spamassassin/.razor -discover
chown -R spamd:spamd /var/lib/spamassassin
mkdir /var/mail/vmail/sieve-before
mkdir /var/mail/vmail/sieve-after
chown -R vmail:vmail /var/mail/vmail/sieve-before
chown -R vmail:vmail /var/mail/vmail/sieve-after



echo "installing OpenDKIM"

sudo aptitude install opendkim opendkim-tools
sudo mkdir /etc/opendkim
sudo chown opendkim:opendkim /etc/opendkim
cd /etc/opendkim
echo "generating DKIM"
opendkim-genkey -r -h sha256 -d mail.yourdomain.com -s mail
sudo mv mail.private mail
sudo touch KeyTable
sudo touch SigningTable
sudo touch TrustedHosts
sudo chown -R opendkim:opendkim /etc/opendkim
sudo mkdir /var/spool/postfix/opendkim
sudo chown opendkim:root /var/spool/postfix/opendkim
sudo usermod -G opendkim postfix

cd ~
sudo mkdir octobotics
cd octobotics





