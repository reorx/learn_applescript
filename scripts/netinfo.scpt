# copy from: https://apple.stackexchange.com/a/238722/74719

function netinfo -d "get network information"

  # Get public ip address
  set public (dig +short myip.opendns.com @resolver1.opendns.com)

  if test -z "$public" # No Internet connection
    set public "No Internet connection available"
  end

  echo " "
  echo -n "    Public IP: "; set_color -i; echo $public; set_color normal
  echo -n "     Hostname: "; set_color -i; echo (uname -n); set_color normal
  echo " "

  # Get all available hardware ports
  set ports (ifconfig -uv | grep '^[a-z0-9]' | awk -F : '{print $1}')

  # Get for all available hardware ports their status
  for val in $ports
    set activated (ifconfig -uv $val | grep 'status: ' | awk '{print $2}')

    # We want information about active network ports...
    if test $activated = 'active' ^/dev/null
      set ipaddress (ifconfig -uv $val | grep 'inet ' | awk '{print $2}')

      # and of these, the ones with an IP-address assigned to it
      if test -n "$ipaddress" ^/dev/null

        # Do we have an IP address?
        # Then give us the information
        set label (ifconfig -uv $val | grep 'type' | awk '{print $2}')
        set macaddress (ifconfig -uv $val | grep 'ether ' | awk '{print $2}')
        set quality (ifconfig -uv $val | grep 'link quality:' | awk '{print $3, $4}')
        set netmask (ipconfig getpacket $val | grep 'subnet_mask (ip):' | awk '{print $3}')
        set router (ipconfig getpacket $val | grep 'router (ip_mult):' | sed 's/.*router (ip_mult): {\([^}]*\)}.*/\1/')
        set dnsserver (ipconfig getpacket $val | grep 'domain_name_server (ip_mult):' | sed 's/.*domain_name_server (ip_mult): {\([^}]*\)}.*/\1/')

        # Header for the network interfaces
