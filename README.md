# p910nd-snap

  A small printer daemon intended for diskless platforms that does not spool
  to disk but passes the job directly to the printer. Normally a lpr daemon on
  a spooling host connects to it with a TCP connection on port 910n
  (where n=0, 1, or 2 for lp0, 1 and 2 respectively).
  
  p910nd is particularly useful for diskless platforms.
  Common Unix Printing System (CUPS) supports this protocol, it's called the
  AppSocket protocol and has the scheme
  
      socket://remotehost:PORT
  
  Windows and Mac Os X (via CUPS) also supports this protocol.

## Snap specific requirements

  :warning: You need to allow p910nd access to the usb printer by connecting the raw-usb
  snap interface
  
      snap connect p910nd:raw-usb
  
  ... **else the daemon will not start.**

## Optional snap configuration

  optionally you can configure the following settings though snap set commands:
  
      snap set p910nd device="/dev/usb/lp0"
      snap set p910nd bindaddr="192.168.1.5"
  
  additionally enabling/disabling bidirectional communication can be done with:
  
      snap set p910nd bidirectional=true
  
  :warning: Note: some printers tend to automatically suspend the USB bus, to prevent
  /dev/usb/lp* from going away after a while, set usbcore.autosuspend=0 on your
  kernel cmdline.

## Building

  Just clone this tree and call
  
      snapcraft
      
  In the top-level of the cloned directory
