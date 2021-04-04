const uint8_t UBX_CLASS_UPD = 0x09;	 //Firmware Update Messages: Memory/Flash erase/write, Reboot, Flash identification, etc.
uint8_t diffCorr : 1; // 1 = differential corrections available

newcv.updown *= theta_diff>0?-1:1 // Go down when theta_diff > 0

UBX_NAV_HPPOSECEF_t *packetUBXNAVHPPOSECEF = NULL; // Pointer to struct. RAM will be allocated for this if/when necessary

if ((incomingUBX->counter - 4) >= startingSpot)

if (((incomingUBX->counter - 4) - startingSpot) < (uint16_t)maximum_payload_size) //If counter = 208, starting spot = 200, we're good to record.

uint8_t diffSoln : 1; // 1 = DGPS used

DiffGPS* tip2target = GetDiff(tip, target);

float r_diff = 0;

float theta_diff = 0; // theta: the angle between Z-axis and vector. -90~90

float phi_diff = 0; // phi: the angle in XY-plane. -180~180.

newcv.extret *= r_diff>0?1:-1 // Should we extend or retract?