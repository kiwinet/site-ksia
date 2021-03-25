##	gluon site.mk makefile example

##	GLUON_FEATURES
#		Specify Gluon features/packages to enable;
#		Gluon will automatically enable a set of packages
#		depending on the combination of features listed

GLUON_FEATURES := \
	autoupdater \
	ebtables-filter-multicast \
	ebtables-filter-ra-dhcp \
	ebtables-limit-arp \
	mesh-batman-adv-15 \
	mesh-vpn-fastd \
	respondd \
	status-page \
	web-advanced \
	web-wizard \
	config-mode-domain-select

##	GLUON_SITE_PACKAGES
#		Specify additional Gluon/OpenWrt packages to include here;
#		A minus sign may be prepended to remove a packages from the
#		selection that would be enabled by default or due to the
#		chosen feature flags


#	gluon-ebtables-segment-mld \
#			gluon-announce-kiwi \
#				gluon-airtime \
#					gluon-status-page \
#					gluon-mesh-vpn-fastd \
#					gluon-luci-mesh-vpn-fastd \
#						gluon-config-mode-mesh-vpn \

GLUON_SITE_PACKAGES := \
	gluon-ebtables-source-filter \
	gluon-web-private-wifi \
	gluon-web-network \
	iptables \
	kiwi-node-tuning \
	kiwi-additional-wifi-json-info \
	gluon-banner \
	gluon-config-mode-site-select \
	gluon-config-mode-tunneldigger \
	gluon-config-mode-wan-mac \
	gluon-ssid-changer \
	gluon-txpowerfix \
	iwinfo

# GLUON_TLWR842_SITE_PACKAGES := kmod-usb-core \
#     kmod-usb2 \
#     kmod-usb-printer \
#     kmod-ledtrig-usbdev \
#     p910nd \
#     gluon-p910nd-update \
#     usbutils

# GLUON_TLWR1043_SITE_PACKAGES := kmod-usb-core \
#     kmod-usb2 \
#     kmod-usb-printer \
#     kmod-ledtrig-usbdev \
#     p910nd \
#     gluon-p910nd-update \
#     usbutils

##
## kmod-leds-wndr3700-usb
##

##	DEFAULT_GLUON_RELEASE
#		version string to use for images
#		gluon relies on
#			opkg compare-versions "$1" '>>' "$2"
#		to decide if a version is newer or not.

DEFAULT_GLUON_RELEASE := 0.9+exp$(shell date '+%Y%m%d')

# Variables set with ?= can be overwritten from the command line

##	GLUON_RELEASE
#		call make with custom GLUON_RELEASE flag, to use your own release version scheme.
#		e.g.:
#			$ make images GLUON_RELEASE=23.42+5
#		would generate images named like this:
#			gluon-ff%site_code%-23.42+5-%router_model%.bin

GLUON_RELEASE ?= $(DEFAULT_GLUON_RELEASE)

# Default priority for updates.
GLUON_PRIORITY ?= 0

# Region code required for some images; supported values: us eu
GLUON_REGION ?= eu

# Languages to include
GLUON_LANGS ?= lt en de

# Do not build images for deprecated devices
GLUON_DEPRECATED ?= 0

# meshing standard used on ath10k devices (ibss/11s)
#GLUON_ATH10K_MESH ?= ibss

GLUON_MULTIDOMAIN = 0
