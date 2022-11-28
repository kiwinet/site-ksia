##	gluon site.mk makefile example

##	GLUON_SITE_PACKAGES
#		specify gluon/openwrt packages to include here
#		The gluon-mesh-batman-adv-* package must come first because of the dependency resolution
#	gluon-ebtables-segment-mld \
#			gluon-announce-kiwi \
#				gluon-airtime \
#					gluon-status-page \
#					gluon-mesh-vpn-fastd \
#					gluon-luci-mesh-vpn-fastd \
#						gluon-config-mode-mesh-vpn \

GLUON_SITE_PACKAGES := \
	gluon-mesh-batman-adv-15 \
	gluon-alfred \
	gluon-respondd \
	gluon-autoupdater \
	gluon-config-mode-autoupdater \
	gluon-config-mode-contact-info \
	gluon-config-mode-core \
	gluon-config-mode-geo-location \
	gluon-config-mode-hostname \
	gluon-ebtables-filter-multicast \
	gluon-ebtables-filter-ra-dhcp \
	gluon-ebtables-segment-mld \
	gluon-luci-admin \
	gluon-luci-autoupdater \
	gluon-luci-portconfig \
	gluon-luci-wifi-config \
	gluon-luci-private-wifi \
	gluon-luci-node-role \
	gluon-next-node \
	gluon-setup-mode \
	haveged \
	iptables \
	iwinfo \
	kiwi-node-tuning \
	kiwi-additional-wifi-json-info \
	kiwi-respondd-module-airtime \
	gluon-banner \
	gluon-config-mode-site-select \
	gluon-config-mode-tunneldigger \
	gluon-config-mode-wan-mac \
	gluon-mesh-vpn-tunneldigger \
	gluon-ssid-changer \
	gluon-status-page-my \
	gluon-tunneldigger-watchdog \
	gluon-txpowerfix \
	tunneldigger

GLUON_TLWR842_SITE_PACKAGES := kmod-usb-core \
    kmod-usb2 \
    kmod-usb-printer \
    kmod-ledtrig-usbdev \
    p910nd \
    gluon-p910nd-update \
    usbutils

GLUON_TLWR1043_SITE_PACKAGES := kmod-usb-core \
    kmod-usb2 \
    kmod-usb-printer \
    kmod-ledtrig-usbdev \
    p910nd \
    gluon-p910nd-update \
    usbutils

##
## kmod-leds-wndr3700-usb
##

##	DEFAULT_GLUON_RELEASE
#		version string to use for images
#		gluon relies on
#			opkg compare-versions "$1" '>>' "$2"
#		to decide if a version is newer or not.

DEFAULT_GLUON_RELEASE := 0.9+exp$(shell date '+%Y%m%d')


##	GLUON_RELEASE
#		call make with custom GLUON_RELEASE flag, to use your own release version scheme.
#		e.g.:
#			$ make images GLUON_RELEASE=23.42+5
#		would generate images named like this:
#			gluon-ff%site_code%-23.42+5-%router_model%.bin

# Allow overriding the release number from the command line
GLUON_RELEASE ?= $(DEFAULT_GLUON_RELEASE)

# Default priority for updates.
GLUON_PRIORITY ?= 0

# Region code required for some images; supported values: us eu
GLUON_REGION ?= eu

# Languages to include
GLUON_LANGS ?= lt en

# meshing standard used on ath10k devices (ibss/11s)
GLUON_ATH10K_MESH ?= ibss 11s

GLUON_DEPRECATED ?= full
