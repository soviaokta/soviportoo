# nov/13/2025 09:31:31 by RouterOS 6.49.17
# software id = 4PFQ-VHYT
#
# model = RouterBOARD 952Ui-5ac2nD
# serial number = 92490812EFAF
/interface bridge
add name=bridge1
/interface wireless
set [ find default-name=wlan2 ] ssid=MikroTik
/interface wireless security-profiles
set [ find default=yes ] supplicant-identity=MikroTik
add authentication-types=wpa-psk,wpa2-psk mode=dynamic-keys name=profile1 \
    supplicant-identity="" wpa-pre-shared-key=tkjoye2025 wpa2-pre-shared-key=\
    tkjoye2025
/interface wireless
set [ find default-name=wlan1 ] disabled=no frequency=2437 security-profile=\
    profile1 ssid="AP 22 Sovia Oktaviantika NS 2"
/ip hotspot profile
set [ find default=yes ] html-directory=hotspot
/ip pool
add name=dhcp_pool0 ranges=0.0.0.2-255.255.255.254
add name=dhcp_pool1 ranges=192.168.10.2-192.168.10.254
add name=dhcp_pool2 ranges=192.168.78.1-192.168.78.253
/ip dhcp-server
add address-pool=dhcp_pool2 disabled=no interface=bridge1 name=dhcp1
/interface bridge port
add bridge=bridge1 interface=ether2
add bridge=bridge1 interface=wlan1
/ip address
add address=192.168.78.254/24 interface=bridge1 network=192.168.78.0
/ip dhcp-client
add disabled=no interface=ether1
/ip dhcp-server lease
add address=192.168.78.253 client-id=1:70:19:88:a2:5:22 mac-address=\
    70:19:88:A2:05:22 server=dhcp1
add address=192.168.78.252 client-id=\
    ff:27:79:bf:88:0:1:0:1:30:a7:e2:f9:8:0:27:79:bf:88 mac-address=\
    08:00:27:79:BF:88 server=dhcp1
/ip dhcp-server network
add gateway=0.0.0.1
add address=192.168.10.0/24 gateway=192.168.10.1
add address=192.168.78.0/24 gateway=192.168.78.254
/ip firewall filter
add action=accept chain=input dst-port=222,81 protocol=tcp
add action=accept chain=input dst-port=8291,22,80 protocol=tcp src-address=\
    192.168.78.253 src-address-list=""
add action=accept chain=input in-interface=ether1 protocol=tcp src-address=\
    192.168.10.38 src-port=22
add action=drop chain=input protocol=tcp src-address=192.168.10.38 src-port=\
    80,8291
# inactive time
add action=drop chain=input in-interface=ether1 time=\
    17h-5h,sun,mon,tue,wed,thu,fri,sat
/ip firewall nat
add action=masquerade chain=srcnat out-interface=bridge1
add action=masquerade chain=srcnat out-interface=ether1
/system clock
set time-zone-name=Asia/Jakarta
/system identity
set name=22_Sovia_XITKJ2
