MEMORY {
    BOOT2 : ORIGIN = 0x10000000, LENGTH = 0x100
    /* Reserve 16K at the very end of Flash for VIAL storage */
    FLASH : ORIGIN = 0x10000100, LENGTH = 2048K - 0x100 - 16K
    RAM   : ORIGIN = 0x20000000, LENGTH = 256K
    STORAGE : ORIGIN = ORIGIN(FLASH) + LENGTH(FLASH), LENGTH = 16K
}

EXTERN(BOOT2_FIRMWARE)

SECTIONS {
    /* ### Boot loader */
    .boot2 ORIGIN(BOOT2) :
    {
        KEEP(*(.boot2));
    } > BOOT2
} INSERT BEFORE .text;