# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).

{ config, pkgs, ... }:

{
  imports =
    [ # Include the results of the hardware scan.
      ./hardware-configuration.nix
    ];

  # Use the systemd-boot EFI boot loader.
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

   networking.hostName = "NAMOW"; # Define your hostname.
  # Pick only one of the below networking options.
  #  networking.wireless.enable = true;  # Enables wireless support via wpa_supplicant.
   networking.networkmanager.enable = true;  # Easiest to use and most distros use this by default.

  # Set your time zone.
   time.timeZone = "Asia/Shanghai";

	###   Mirror  nix-command 
  nix.settings = {
	auto-optimise-store = true;
	substituters = [
	  	"https://mirror.sjtu.edu.cn/nix-channels/store"
#		"https://mirrors.tuna.tsinghua.edu.cn/nix-channels/store"
#		"https://mirrors.ustc.edu.cn/nix-channels/store"
			];


  	trusted-users = [ "@wheel" ];
	###  new features  
#	experimental-features = [
#		"nix-command"
#		"flakes"
#				];
		};
  nixpkgs.config = {
	allowUnfree = true;
	};	






  # Configure network proxy if necessary
  # networking.proxy.default = "http://user:password@proxy:port/";
  # networking.proxy.noProxy = "127.0.0.1,localhost,internal.domain";

  # Select internationalisation properties.

#   i18n.defaultLocale = "en_US.UTF-8";
   i18n.defaultLocale = "zh_CN.UTF-8";
#   i18n.defaultLocale = "zh_CN.GBK";

  # console = {
  #   font = "Lat2-Terminus16";
  #   keyMap = "us";
  #   useXkbConfig = true; # use xkbOptions in tty.
  # };
	fonts = {
	  fontDir.enable = true;
	  fonts = with  pkgs; [
		noto-fonts
		noto-fonts-cjk-sans
		noto-fonts-cjk-serif
		source-code-pro	
		sarasa-gothic
		wqy_zenhei
		wqy_microhei
		jetbrains-mono
			];
		};
	

  # Enable the X11 windowing system.
  services.xserver.enable = true;

########  pantheon  万神殿
##	services.xserver.displayManager.lightdm.enable = true;
##	services.xserver.displayManager.lightdm.greeters.pantheon.enable = true;
#	services.xserver.desktopManager.pantheon.enable = true;
#	  services.pantheon.contractor.enable = true;
#	  services.pantheon.apps.enable = true;
#		programs.pantheon-tweaks.enable = true;
##	




##########  Resolutions 分辨率
#	programs.screen.screenrc = "";
#	services.xserver.virtualScreen = {x = 1440; y = 900;};

	services.xserver.resolutions = [ ];
#		{
#		  x = 1440;
#		  y = 900 ; 
#		}
#  为空时，系统自动配置分辨率
#		{
#		  x =1280;
#		  y = 800;
#		}
#				];	
##########   XFCE
	services.xserver.displayManager.defaultSession = "xfce";
	services.xserver.desktopManager.xfce.enable = true;
##		services.picom = {
##			enable = true;
##			fade = true;
##			inactiveOpacity = 0.9;
##			shadow = true;
##			fadeDelta = 4;
##				};
##		services.xserver.disktopManager.xfce.thunarPlugins


##########    Lumina   Gnome.Flashback
#	services.xserver.displayManager.lightdm.enable = true;
#	services.xserver.desktopManager.lumina.enable = true;
#	services.xserver.desktopManager.gnome.flashback.enableMetacity = true;

#########    KDE plasma5   sway
#	programs.sway.enable = true;
#	xdg.portal.wlr.enable = true;
#	services.xserver.displayManager.sddm.enable = true;
#	services.xserver.desktopManager.plasma5.enable = true;
#		qt5.enable = true;
#		qt5.platformTheme = "gtk2";
#		qt5.style = "gtk2";		

	i18n.inputMethod = {
		enabled = "fcitx5";
		fcitx5.enableRimeData = true;
		fcitx5.addons = with pkgs; [ fcitx5-rime fcitx5-chinese-addons ];
				};

#	  services.udev.packages = with pkgs; [	gnome.gnome-settings.daemon ];

#		i18n.extraLocaleSettings = {
#		  LC_CTYPE = "zh_CN.UTF-8";
#		  LC_COLLATE = "zh_CN.UTF-8";
#		  LC_MESSAGES = "zh_CN.UTF-8";
#		  LC_NAME = "zh_CN.UTF-8";
#		  LC_ADDRESS = "zh_CN.UTF-8";
#					};
	
#	i18n.inputMethod = {
#		enabled = "ibus";
#		ibus.engines = with pkgs.ibus-engines; [
#			libpinyin
#			rime
#						];
#				};
 #

 

  # Configure keymap in X11
  # services.xserver.layout = "us";
  # services.xserver.xkbOptions = {
  #   "eurosign:e";
  #   "caps:escape" # map caps to escape.
  # };

  # Enable CUPS to print documents.
  # services.printing.enable = true;

  # Enable sound.
   sound.enable = true;
   hardware.pulseaudio.enable = true;

  # Enable touchpad support (enabled default in most desktopManager).
  # services.xserver.libinput.enable = true;

  # Define a user account. Don't forget to set a password with ‘passwd’.
   users.users.eafw = {
     isNormalUser = true;
     extraGroups = [ "wheel" "networkmanager" ]; # Enable ‘sudo’ for the user.
     packages = with pkgs; [
	deadbeef	
  #     firefox
  #     thunderbird
     ];
   };









  # List packages installed in system profile. To search, run:
  # $ nix search wget
   environment.systemPackages = with pkgs; [
  #   vim # Do not forget to add an editor to edit configuration.nix! The Nano editor is also installed by default.
	papirus-icon-theme
#	luna-icons
#	papirus-maia-icon-theme
	iftop
	fish
	nano
	firefox
#	libreoffice
	gparted
	emacs
	marktext
	wget
   ];

  # Some programs need SUID wrappers, can be configured further or are
  # started in user sessions.
  # programs.mtr.enable = true;
  # programs.gnupg.agent = {
  #   enable = true;
  #   enableSSHSupport = true;
  # };

  # List services that you want to enable:

  # Enable the OpenSSH daemon.
  # services.openssh.enable = true;

  # Open ports in the firewall.
  # networking.firewall.allowedTCPPorts = [ ... ];
  # networking.firewall.allowedUDPPorts = [ ... ];
  # Or disable the firewall altogether.
  # networking.firewall.enable = false;

  # Copy the NixOS configuration file and link it from the resulting system
  # (/run/current-system/configuration.nix). This is useful in case you
  # accidentally delete configuration.nix.
  # system.copySystemConfiguration = true;

  # This value determines the NixOS release from which the default
  # settings for stateful data, like file locations and database versions
  # on your system were taken. It‘s perfectly fine and recommended to leave
  # this value at the release version of the first install of this system.
  # Before changing this value read the documentation for this option
  # (e.g. man configuration.nix or on https://nixos.org/nixos/options.html).
  system.stateVersion = "22.05"; # Did you read the comment?





}

