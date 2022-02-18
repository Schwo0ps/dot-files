num=$1
if [[ -z $num ]]; then
  echo No number
  exit 1
fi
subnet='10.129.0.'
let "compute = $num * 16 + 10"
let "router = $num * 16 + 1"


sudo ip a add "${subnet}${compute}/28" dev eno2
sudo ip route add default via "${subnet}${router}"
echo 'nameserver 1.1.1.1' | sudo tee -a /etc/resolv.conf
ping google.com
