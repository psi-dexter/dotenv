<?xml version="1.0" encoding="UTF-8"?>
<!DOCTYPE plist PUBLIC "-//Apple//DTD PLIST 1.0//EN" "http://www.apple.com/DTDs/PropertyList-1.0.dtd">
<plist version="1.0">
  <dict>
    <key>KeepAlive</key>
    <dict>
      <key>SuccessfulExit</key>
      <false/>
    </dict>
    <key>Label</key>
    <string>homebrew.mxcl.consul-template</string>
    <key>ProgramArguments</key>
    <array>
      <string>/usr/local/opt/consul-template/bin/consul-template</string>
      <string>agent</string>
      <string>-config-dir</string>
      <string>${config_dir}</string>
    </array>
    <key>RunAtLoad</key>
    <true/>
    <key>WorkingDirectory</key>
    <string>/usr/local/var</string>
    <key>StandardErrorPath</key>
    <string>/usr/local/var/log/consul-template.log</string>
    <key>StandardOutPath</key>
    <string>/usr/local/var/log/consul-template.log</string>
  </dict>
</plist>%