{ pkgs, ... }:
{
  home.packages =
    with pkgs;
    lib.optionals pkgs.stdenv.isLinux [
      hyprpolkitagent
      libnotify
    ];

  wayland.windowManager.hyprland = {
    enable = pkgs.stdenv.isLinux;

    settings = {
      "$terminal" = "${pkgs.ghostty}/bin/ghostty";
      "$browser" = "${pkgs.google-chrome}/bin/google-chrome-stable";
      "$fileManager" = "${pkgs.nautilus}/bin/nautilus";
      "$menu" = "${pkgs.walker}/bin/walker";
      "$mod" = "SUPER";
      "$editor" = "emacsclient -c";

      env = [
        "XDG_SESSION_DESKTOP, Hyprland"
        "XDG_CURRENT_SESSION, Hyprland"
        "XDG_DESKTOP_DIR, $HOME/Desktop"
        "XDG_DOWNLOAD_DIR, $HOME/Downloads"
        "XDG_DOCUMENTS_DIR, $HOME/Documents"
        "XDG_PICTURES_DIR, $HOME/Pictures"
        "HYPRSHOT_DIR, $HOME/Pictures/Screenshots"
      ];

      exec-once = [
        "${pkgs.waybar}/bin/waybar"
        "${pkgs.hyprpaper}/bin/hyprpaper"
        "${pkgs.hypridle}/bin/hypridle"
        "${pkgs.dunst}/bin/dunst"
        "${pkgs.gnome-keyring}/bin/gnome-keyring-daemon --start --components=secrets"
        "systemctl --user start hyprpolkitagent"
      ];

      monitor = [
        "eDP-1, preferred, auto, 1"
        "DP-3, preferred, auto, 2"
      ];

      general = {
        "$mod" = "SUPER";
        layout = "dwindle";
        gaps_in = 5;
        gaps_out = 10;
        border_size = 3;
        resize_on_border = true;
      };

      decoration = {
        rounding = 10;
        rounding_power = 2;
        active_opacity = 1.0;
        inactive_opacity = 0.90;

        shadow = {
          enabled = true;
          range = 4;
          render_power = 3;
        };

        blur = {
          enabled = true;
          size = 3;
          passes = 3;
          vibrancy = 0.1696;
        };
      };

      animations = {
        enabled = true;
        bezier = "easeOutQuint, 0.23, 1, 0.32, 1";
        animation = "global, 1, 10, default";
      };

      dwindle = {
        pseudotile = true;
        preserve_split = true;
      };

      input = {
        kb_layout = "us";
        kb_variant = "";
        follow_mouse = 1;
      };

      gestures = {
        workspace_swipe = true;
      };

      bind = [
        "$mod, Return, exec, $terminal"
        "$mod, L, exec, hyprlock"
        "$mod, Space, exec, $menu"
        "$mod, Q, killactive,"
        "$mod, X, exit,"
        "$mod, W, exec, $browser"
        "$mod, E, exec, $editor"
        "$mod, F, exec, $fileManager"
        "$mod, PRINT, exec, hyprshot -m window"
        "$mod SHIFT, PRINT, exec, hyprshot -m region"
        ", PRINT, exec, hyprshot -m output"
        "$mod, 1, workspace, 1"
        "$mod, 2, workspace, 2"
        "$mod, 3, workspace, 3"
        "$mod, 4, workspace, 4"
        "$mod, 5, workspace, 5"
        "$mod SHIFT, 1, movetoworkspace, 1"
        "$mod SHIFT, 2, movetoworkspace, 2"
        "$mod SHIFT, 3, movetoworkspace, 3"
        "$mod SHIFT, 4, movetoworkspace, 4"
        "$mod SHIFT, 5, movetoworkspace, 5"
      ];

      bindm = [
        "$mod, mouse:272, movewindow"
        "$mod, mouse:273, resizewindow"
      ];
    };
  };

  programs.hyprlock.enable = pkgs.stdenv.isLinux;

  services.hypridle.enable = pkgs.stdenv.isLinux;

  services.hyprpaper = {
    enable = pkgs.stdenv.isLinux;
    settings = {
      preload = "~/Pictures/Wallpapers/wallhaven-vg2r85.jpg";
      wallpaper = ", ~/Pictures/Wallpapers/wallhaven-vg2r85.jpg";
    };
  };
}
