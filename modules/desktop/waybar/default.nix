{
  flake.modules.homeManager.desktop =
    { pkgs, lib, ... }:
    {
      programs.waybar = {
        enable = true;
        systemd.enable = true;
        settings = [
          {
            layer = "top";
            position = "top";
            exclusive = true;
            margin-top = 10;
            margin-left = 10;
            margin-right = 10;

            modules-left = [
              "niri/workspaces"
            ];

            modules-center = [
              "clock"
              "idle_inhibitor"
            ];

            modules-right = [
              "niri/language"
              "network"
              "pulseaudio"
              "bluetooth"
              "battery"
              "custom/lock"
              "custom/quit"
            ];

            "cpu" = {
              interval = 5;
              format = " {usage:2}%";
              tooltip = true;
            };

            "memory" = {
              interval = 5;
              format = " {}%";
              tooltip = true;
            };

            "clock" = {
              format = "{:L%H:%M}";
              format-alt = "{:%Y-%m-%d}";
              tooltip = true;
              tooltip-format = "{calendar}";
            };

            "idle_inhibitor" = {
              format = "{icon}";
              format-icons = {
                activated = "";
                deactivated = "";
              };
            };

            "network" = {
              format-icons = [
                "󰤯"
                "󰤟"
                "󰤢"
                "󰤥"
                "󰤨"
              ];
              format-ethernet = "󰈀";
              format-wifi = "{icon}";
              format-disconnected = "";
              tooltip = true;
              tooltip-format-wifi = "{essid} ({signalStrength}%)";
              tooltip-format-ethernet = "{ifname}";
              tooltip-format-disconnected = "Disconnected";
            };

            "bluetooth" = {
              format-on = "󰂯";
              format-off = "󰂲";
              format-connected = "󰂱";
              tooltip = true;
              tooltip-format-on = "{controller_address}";
              tooltip-format-off = "{status}";
              tooltip-format-connected = "{device_enumerate}";
              tooltip-format-enumerate-connected = "{device_alias}\t{device_address}";
              on-click = "${pkgs.bluez}/bin/bluetoothctl power on";
              on-click-right = "${pkgs.bluez}/bin/bluetoothctl power off";
            };

            "pulseaudio" = {
              format = "{icon} {format_source}";
              format-bluetooth = "󰂰";
              format-bluetooth-muted = "󰂲";
              format-muted = "󰝟 {format_source}";
              format-source = "";
              format-source-muted = "";
              format-icons = {
                headphone = "";
                hands-free = "";
                headset = "";
                phone = "";
                phone-muted = "";
                portable = "";
                car = "";
                default = [
                  ""
                  ""
                  ""
                ];
              };
              on-click = "${pkgs.wireplumber}/bin/wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle";
              on-click-right = "${pkgs.wireplumber}/bin/wpctl set-mute @DEFAULT_AUDIO_SOURCE@ toggle";
            };

            "battery" = {
              states = {
                warning = 30;
                critical = 15;
              };
              format = "{icon}";
              format-charging = "󰂄";
              format-plugged = "󱘖";
              format-icons = [
                "󰁺"
                "󰁻"
                "󰁼"
                "󰁽"
                "󰁾"
                "󰁿"
                "󰂀"
                "󰂁"
                "󰂂"
                "󰁹"
              ];
              on-click = "";
              tooltip = true;
            };

            "niri/language" = {
              format = "{short} {variant}";
            };

            "niri/workspaces" = {
              format = "{icon}";
              format-icons = {
                active = "";
                default = "";
              };
            };

            "custom/lock" = {
              format = "";
              on-click = "${pkgs.swaylock-effects}/bin/swaylock -f";
              tooltip = false;
            };

            "custom/quit" = {
              format = "";
              on-click = "niri msg action quit";
              tooltip = false;
            };
          }
        ];

        style = builtins.readFile ./style.css;
      };

      catppuccin.waybar.mode = "createLink";

      systemd.user.services.waybar.Unit.ConditionEnvironment = lib.mkForce [
        "WAYLAND_DISPLAY"
        "!XDG_CURRENT_DESKTOP=GNOME"
      ];
    };
}
