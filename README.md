# site-ksia

# Dependencies

To build Gluon, several packages need to be installed on the system. On a freshly installed Debian Wheezy system the following packages are required:

    git (to get Gluon and other dependencies)
    subversion
    python (Python 3 doesn’t work)
    build-essential
    gawk
    unzip
    libncurses-dev (actually libncurses5-dev)
    libz-dev (actually zlib1g-dev)
    libssl-dev


# Building the images

To build Gluon, after checking out the repository change to the source root directory
to  perform the following commands:

    git clone git://github.com/freifunk-gluon/site-ffhl.git site # Get the Freifunk Lübeck site repository - or use your own!
    make update                                                  # Get other repositories used by Gluon
    make GLUON_TARGET=ar71xx-generic                             # Build Gluon

When calling make, the OpenWrt build environment is prepared/updated. In case of errors read the messages carefully and try to fix the stated issues (e.g. install tools not available yet).

ar71xx-generic is the most common target and will generate images for most of the supported hardware. To see a complete list of supported targets, call make without setting GLUON_TARGET.

You should reserve about 10GB of disk space for each GLUON_TARGET.

The built images can be found in the directory output/images. Of these, the factory images are to be used when flashing from the original firmware a device came with, and sysupgrade is to upgrade from other versions of Gluon or any other OpenWrt-based system.

Note: The images for some models are identical; to save disk space, symlinks are generated instead of multiple copies of the same image. If your webserver’s configuration prohibits following symlinks, you can use the following command to resolve these links while copying the images:

cp -rL output/images /var/www


# Cleaning the build tree


There are two levels of `make clean`:

    make clean GLUON_TARGET=ar71xx-generic

will ensure all packages are rebuilt; this is what you normally want to do after an update.

    make dirclean

will clean the entire tree, so the toolchain will be rebuilt as well, which is
not necessary in most cases, and will take a while.



So all in all, to update and rebuild a Gluon build tree, the following commands should be used:

    git pull
    (cd site && git pull)
    make update
    make clean GLUON_TARGET=ar71xx-generic
    make GLUON_TARGET=ar71xx-generic


