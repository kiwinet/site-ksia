##	gluon site.mk makefile example
	
# 	mesh-vpn-fastd \
# 	mesh-babel ???

GLUON_FEATURES := \
	autoupdater \
	ebtables-filter-multicast \
	ebtables-filter-ra-dhcp \
	mesh-batman-adv-15 \
	mesh-vpn-tunneldigger \
	respondd \
	status-page \
	web-advanced \
	web-wizard


##	GLUON_SITE_PACKAGES
#		specify gluon/openwrt packages to include here
#		The gluon-mesh-batman-adv-* package must come first because of the dependency resolution

# 	gluon-authorized-keys
# 	gluon-web-private-wifi \
# 	gluon-web-mesh-vpn-fastd \

GLUON_SITE_PACKAGES := \
	haveged \
	iwinfo \
	respondd-module-airtime \
	kiwi-node-tuning \
	kiwi-additional-wifi-json-info \
	gluon-banner \
	gluon-config-mode-wan-mac \
	gluon-txpowerfix \
	gluon-ssid-changer \
	gluon-status-page-mesh-batman-adv \
	gluon-alfred \
	gluon-web-logging \
	gluon-web-admin \
	gluon-web-node-role \
	gluon-wan-dnsmasq \
	gluon-node-info \
	gluon-neighbour-info \
	gluon-config-mode-theme \
	gluon-config-mode-geo-location-osm \
	gluon-radv-filterd



# GLUON_SITE_PACKAGES := \
# 	gluon-ebtables-segment-mld \
# 	kiwi-respondd-module-airtime \
# 	gluon-config-mode-site-select \
# 	gluon-status-page-my \


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
GLUON_PRIORITY ?= 0.5

# Region code required for some images; supported values: us eu
GLUON_REGION ?= eu

# Languages to include
GLUON_LANGS ?= lt en

# meshing standard used on ath10k devices (ibss/11s)
GLUON_ATH10K_MESH ?= 11s

GLUON_DEPRECATED ?= full
