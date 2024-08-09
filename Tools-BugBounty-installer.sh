#!/bin/bash
# Author: drak3hft7
# Date: 08/09/2021

# Check if the script is executed with root privileges
if [ "${UID}" -eq 0 ]
then
    echo ""; echo -e "\e[32m\e[1mOK. The script will install the tools.\e[0m\e[39m"; echo "";
else
    echo ""; echo -e "\e[91m\e[1mRoot privileges are required\e[0m\e[39m"; echo "";
    exit
fi

#---------Update & upgrade full
echo -e "\e[93m\e[1m----> Updating all Packages";
apt-get -y update && apt-get -y upgrade
echo -e "\e[32mDone!";
sleep 1.5
clear;


#---------Generic OS
#Python, ruby and some packages
echo -e "\e[93m\e[1m----> Installing Python,Ruby and some packages";
apt-get install -y python python-pip python3 python3-pip python-dnspython python-dev python-setuptools virtualenv unzip make gcc libpcap-dev curl build-essential libcurl4-openssl-dev libldns-dev libssl-dev libffi-dev libxml2 jq libxml2-dev libxslt1-dev build-essential ruby-dev ruby-full libgmp-dev zlib1g-dev
echo -e "\e[32mDone!";
sleep 1.5


#---------Create a Tools folder in Home ~/
echo -e "\e[93m\e[1m----> Create a Tools folder";
mkdir ~/tools
cd ~/tools/
echo -e "\e[32mDone!"; echo "";
sleep 1.5

#---------Install Network scanner
#Nmap
echo -e "\e[93m\e[1m----> Installing nmap";
sudo apt install -y nmap;
echo -e "\e[32mDone! Nmap installed.";
sleep 1.5
#Masscan
echo -e "\e[93m\e[1m----> Installing Masscan";
git clone https://github.com/robertdavidgraham/masscan > && cd masscan && make > && make install > && mv bin/masscan /usr/local/bin/;
echo -e "\e[32mDone! Masscan installed."; echo "";
sleep 1.5
#Naabu
echo -e "\e[93m\e[1m----> Installing Naabu";
go install -v github.com/projectdiscovery/naabu/v2/cmd/naabu@latest > && ln -s ~/go/bin/naabu /usr/local/bin/;
echo -e "\e[32mDone! Naabu installed."; echo "";
sleep 1.5

#---------Install subdomain enumeration and DNS Resolver
#dnsutils
sudo apt install -y dnsutils ;
sleep 1.5
#Massdns
echo -e "\e[93m\e[1m----> Installing massdns";
git clone https://github.com/blechschmidt/massdns.git ;
cd ~/tools/massdns
make > ;
cd ~/tools/
echo -e "\e[32mDone! Massdns installed."; echo "";
sleep 1.5
#Subfinder
echo -e "\e[93m\e[1m----> Installing Subfinder";
go install -v github.com/projectdiscovery/subfinder/v2/cmd/subfinder@latest > && ln -s ~/go/bin/subfinder /usr/local/bin/;
echo -e "\e[32mDone! Subfinder installed."; echo "";
sleep 1.5
#Knock
echo -e "\e[93m\e[1m----> Installing Knock";
git clone https://github.com/guelfoweb/knock.git ;
echo -e "\e[32mDone! Knock installed."; echo "";
sleep 1.5
#Lazyrecon
echo -e "\e[93m\e[1m----> Installing LazyRecon";
git clone https://github.com/nahamsec/lazyrecon.git ;
echo -e "\e[32mDone! LazyRecon installed."; echo "";
sleep 1.5
#Github-subdomains
echo -e "\e[93m\e[1m----> Installing Github-subdomains";
go install github.com/gwen001/github-subdomains@latest > && ln -s ~/go/bin/github-subdomains /usr/local/bin/;
echo -e "\e[32mDone! Github-subdomains installed."; echo "";
sleep 1.5
#Sublist3r
echo -e "\e[93m\e[1m----> Installing Sublist3r";
git clone https://github.com/aboul3la/Sublist3r.git > ;
cd Sublist3r*
pip install -r requirements.txt
cd ~/tools/
echo -e "\e[32mDone! Sublist3r installed."; echo "";
sleep 1.5
#Crtndstry
echo -e "\e[93m\e[1m----> Installing Crtndstry";
git clone https://github.com/nahamsec/crtndstry.git > ;
echo -e "\e[32mDone! Crtndstry installed."; echo "";
sleep 1.5
#Assetfinder
echo -e "\e[93m\e[1m----> Installing Assentfinder";
go install github.com/tomnomnom/assetfinder@latest > && ln -s ~/go/bin/assetfinder /usr/local/bin/;
echo -e "\e[32mDone! Assetfinder installed."; echo "";
sleep 1.5
#dnsx
echo -e "\e[93m\e[1m----> Installing Dnsx";
go install -v github.com/projectdiscovery/dnsx/cmd/dnsx@latest > && ln -s ~/go/bin/dnsx /usr/bin/;
echo -e "\e[32mDone! Dnsx installed."; echo "";
sleep 1.5
#dnsgen
echo -e "\e[93m\e[1m----> Installing Dnsgen";
pip3 install dnsgen ;
echo -e "\e[32mDone! Dnsgen installed."; echo "";
sleep 1.5

#---------Install subdomain takeovers
#SubOver
echo -e "\e[93m\e[1m----> Installing SubOver";
go install -v github.com/Ice3man543/SubOver@latest > && ln -s ~/go/bin/subover /usr/bin/;
echo -e "\e[32mDone! SubOver installed."; echo "";
sleep 1.5

#---------Install Fuzzing Tools
#Dirsearch
echo -e "\e[93m\e[1m----> Installing dirsearch";
git clone https://github.com/maurosoria/dirsearch.git > ;
cd dirsearch*
pip3 install -r requirements.txt
cd ~/tools/
echo -e "\e[32mDone! Dirsearch installed.";
sleep 1.5
#ffuf
echo -e "\e[93m\e[1m----> Installing ffuf";
go install -u github.com/ffuf/ffuf@latest > && ln -s ~/go/bin/ffuf /usr/local/bin/;
echo -e "\e[32mDone! Ffuf installed.";
sleep 1.5

#---------Wordlists
echo -e "\e[93m\e[1m----> Downloading Seclists";
cd ~/tools/
git clone https://github.com/danielmiessler/SecLists.git > ;
cd ~/tools/SecLists/Discovery/DNS/
#This file must be cleaned, as it breaks massdns
cat dns-Jhaddix.txt | head -n -14 > clean-jhaddix-dns.txt
rm dns-Jhaddix.txt
cd ~/tools/
echo -e "\e[32mDone! Seclists downloaded."; echo "";
sleep 1.5

#---------Scanner CMS
#WPScan
echo -e "\e[93m\e[1m----> Installing wpscan";
gem install wpscan > ;
echo -e "\e[32mDone! wpscan installed."; echo "";
sleep 1.5
#Droopescan
echo -e "\e[93m\e[1m----> Installing Droopescan";
pip install droopescan > ;
echo -e "\e[32mDone! Droopescan installed."; echo "";
sleep 1.5

#---------Vuln SQL
#SQLmap
echo -e "\e[93m\e[1m----> Installing sqlmap";
sudo apt install -y sqlmap > ;
echo -e "\e[32mDone! Sqlmap installed."; echo "";
sleep 1.5
#NoSQLMap
echo -e ${BLUE}"[VULNERABILITY - SQL Injection]" ${RED}"NoSQLMap installation in progress ...";
git clone https://github.com/codingo/NoSQLMap.git > ;
cd NoSQLMap
python setup.py install > ;
cd ~/tools/
echo -e "\e[32mDone! NoSqlmap installed."; echo "";
sleep 1.5
#Jeeves
echo -e "\e[93m\e[1m----> Installing Jeeves";
go install -u github.com/ferreiraklet/Jeeves@latest > && ln -s ~/go/bin/jeeves /usr/local/bin/;
cd ~/tools/
echo -e "\e[32mDone! Jeeves installed."; echo "";
sleep 1.5


#---------Enumeration JavaScript
#LinkFinder
echo -e "\e[93m\e[1m----> Installing LinkFinder";
git clone https://github.com/GerbenJavado/LinkFinder.git > ;
cd LinkFinder
pip3 install -r requirements.txt > && python3 setup.py install > ;
cd ~/tools/
echo -e "\e[32mDone! LinkFinder installed."; echo "";
sleep 1.5
#SecretFinder
echo -e "\e[93m\e[1m----> Installing SecretFinder";
git clone https://github.com/m4ll0k/SecretFinder.git > ;
cd SecretFinder
pip3 install -r requirements.txt > ;
cd ~/tools/
echo -e "\e[32mDone! SecretFinder installed."; echo "";
sleep 1.5
#JSParser
echo -e "\e[93m\e[1m----> Installing JSParser";
git clone https://github.com/nahamsec/JSParser.git > ;
cd JSParser*
sudo python setup.py install
cd ~/tools/
echo -e "\e[32mDone! JSParser installed."; echo "";
sleep 1.5

#---------Visual Recon
#aquatone
echo -e "\e[93m\e[1m----> Installing Aquatone";
cd /tmp && wget https://github.com/michenriksen/aquatone/releases/download/v1.7.0/aquatone_linux_arm64_1.7.0.zip > && unzip aquatone_linux_arm64_1.7.0.zip > ;
mv aquatone /usr/local/bin/;
cd ~/tools/
echo -e "\e[32mDone! Aquatone installed."; echo "";
sleep 1.5

#---------Crawling Web
#Gospider
echo -e "\e[93m\e[1m----> Installing Gospider";
go install github.com/jaeles-project/gospider@latest > && ln -s ~/go/bin/gospider /usr/local/bin/;
cd ~/tools/
echo -e "\e[32mDone! Gospider installed."; echo "";
sleep 1.5
#Hakrawler
echo -e "\e[93m\e[1m----> Installing Hakrawler";
go install github.com/hakluke/hakrawler@latest > && ln -s ~/go/bin/hakrawler /usr/local/bin/;
cd ~/tools/
echo -e "\e[32mDone! Hakrawler installed."; echo "";
sleep 1.5
#Katana
echo -e "\e[93m\e[1m----> Installing Katana";
go install github.com/projectdiscovery/katana/cmd/katana@latest > && ln -s ~/go/bin/katana /usr/local/bin/;
cd ~/tools/
echo -e "\e[32mDone! Katana installed."; echo "";
sleep 1.5

#---------Vuln XSS
#XSStrike
echo -e "\e[93m\e[1m----> Installing XSStrike";
git clone https://github.com/s0md3v/XSStrike > && cd XSStrike && pip3 install -r requirements.txt > ;
cd ~/tools/
echo -e "\e[32mDone! XSStrike installed."; echo "";
sleep 1.5
#XSS-Loader
echo -e "\e[93m\e[1m----> Installing XSS-Loader";
git clone https://github.com/capture0x/XSS-LOADER/ > && cd XSS-LOADER && pip3 install -r requirements.txt > ;
cd ~/tools/
echo -e "\e[32mDone! XSS-Loader installed."; echo "";
sleep 1.5
#Freq
echo -e "\e[93m\e[1m----> Installing Freq";
go install github.com/takshal/freq@latest > && ln -s ~/go/bin/freq /usr/local/bin/;
cd ~/tools/
echo -e "\e[32mDone! Freq installed."; echo "";
sleep 1.5
#Gxss
echo -e "\e[93m\e[1m----> Installing Gxss";
go install github.com/KathanP19/Gxss@latest > && ln -s ~/go/bin/Gxss /usr/local/bin/;
cd ~/tools/
echo -e "\e[32mDone! Gxss installed."; echo "";
sleep 1.5
#Dalfox
echo -e "\e[93m\e[1m----> Installing Dalfox";
go install github.com/hahwul/dalfox/v2@latest > && ln -s ~/go/bin/dalfox /usr/local/bin/;
cd ~/tools/
echo -e "\e[32mDone! Dalfox installed."; echo "";
sleep 1.5

#---------Vuln SSRF
#SSRFmap
echo -e "\e[93m\e[1m----> Installing SSRFmap";
git clone https://github.com/swisskyrepo/SSRFmap > && cd SSRFmap && pip3 install -r requirements.txt > ;
cd ~/tools/
echo -e "\e[32mDone! SSRFmap installed."; echo "";
sleep 1.5
#Gopherus
echo -e "\e[93m\e[1m----> Installing Gopherus";
git clone https://github.com/tarunkant/Gopherus.git > && cd Gopherus && chmod +x install.sh && ./install.sh > ;
cd ~/tools/
echo -e "\e[32mDone! Gopherus installed."; echo "";
sleep 1.5

#---------Vuln Scan
#Nuclei
echo -e "\e[93m\e[1m----> Installing Nuclei";
go install -v github.com/projectdiscovery/nuclei/v2/cmd/nuclei@latest > && ln -s ~/go/bin/nuclei /usr/local/bin/;
cd ~/tools/
echo -e "\e[32mDone! Nuclei installed."; echo "";
sleep 1.5

#---------Virtual Host Discovery
#VirtualHostDiscovery
echo -e "\e[93m\e[1m----> Installing VirtualHostDiscovery";
git clone https://github.com/jobertabma/virtual-host-discovery.git  > ;
cd ~/tools/
echo -e "\e[32mDone! VirtualHostDiscovery installed."; echo "";
sleep 1.5

#---------Useful Tools
#anew
echo -e "\e[93m\e[1m----> Installing Anew";
go install -v github.com/tomnomnom/anew@latest > && ln -s ~/go/bin/anew /usr/local/bin/;
echo -e "\e[32mDone! Dnsgen installed."; echo "";
sleep 1.5
#unew
echo -e "\e[93m\e[1m----> Installing Unew";
go install -u github.com/dwisiswant0/unew@latest > && ln -s ~/go/bin/unew /usr/local/bin/;
echo -e "\e[32mDone! Dnsgen installed."; echo "";
sleep 1.5
#gf
echo -e "\e[93m\e[1m----> Installing gf";
go install -u github.com/tomnomnom/gf@latest > && ln -s ~/go/bin/gf /usr/local/bin/;
echo -e "\e[32mDone! Gf installed."; echo "";
sleep 1.5
#Http Probe
echo -e "\e[93m\e[1m----> Installing httprobe";
go install github.com/tomnomnom/httprobe > && ln -s ~/go/bin/httprobe /usr/local/bin/;
cd ~/tools/
echo -e "\e[32mDone! Httprobe installed."; echo "";
sleep 1.5
#httpx
echo -e "\e[93m\e[1m----> Installing httpx";
go install -v github.com/projectdiscovery/httpx/cmd/httpx@latest > && ln -s ~/go/bin/httpx /usr/local/bin/;
cd ~/tools/
echo -e "\e[32mDone! Httpx installed."; echo "";
sleep 1.5
#waybackurls
echo -e "\e[93m\e[1m----> Installing waybackurls";
go install github.com/tomnomnom/waybackurls@latest > && ln -s ~/go/bin/waybackurls /usr/local/bin/;
cd ~/tools/
echo -e "\e[32mDone! Waybackurls installed."; echo "";
sleep 1.5
#Arjun
echo -e "\e[93m\e[1m----> Installing arjun";
pip3 install arjun > ;
echo -e "\e[32mDone! Arjun installed."; echo "";
sleep 1.5
#Gau
echo -e "\e[93m\e[1m----> Installing gau";
go install github.com/lc/gau/v2/cmd/gau@latest > && ln -s ~/go/bin/gau /usr/local/bin/;
cd ~/tools/
echo -e "\e[32mDone! Gau installed."; echo "";
sleep 1.5
#Gauplus
echo -e "\e[93m\e[1m----> Installing gauplus";
go install github.com/bp0lr/gauplus@latest  > && ln -s ~/go/bin/gauplus /usr/local/bin/;
cd ~/tools/
echo -e "\e[32mDone! Gauplus installed."; echo "";
sleep 1.5
#Uro
echo -e "\e[93m\e[1m----> Installing uro";
pip3 install uro > ;
cd ~/tools/
echo -e "\e[32mDone! Uro installed."; echo "";
sleep 1.5
#QSreplace
echo -e "\e[93m\e[1m----> Installing qsreplace";
go install -v github.com/tomnomnom/qsreplace@latest > && ln -s ~/go/bin/qsreplace /usr/local/bin/;
cd ~/tools/
echo -e "\e[32mDone! Qsreplace installed."; echo "";
sleep 1.5
sleep 1.5
#SocialHunter
echo -e "\e[93m\e[1m----> Installing Socialhunter";
go install github.com/utkusen/socialhunter@latest > && ln -s ~/go/bin/socialhunter /usr/local/bin/;
cd ~/tools/
echo -e "\e[32mDone! Socialhunter installed."; echo "";
sleep 1.5

echo -e "\e[92mDone! Operazione Completata\e[0m\e[39m"; echo "";
