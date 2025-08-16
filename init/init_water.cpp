#include <stdlib.h>
#include <string.h>
#include <unistd.h>
#include <android-base/properties.h>

#define _REALLY_INCLUDE_SYS__SYSTEM_PROPERTIES_H_
#include <sys/_system_properties.h>

using android::base::GetProperty;
using std::string;

void property_override(string prop, string value)
{
    auto pi = (prop_info *)__system_property_find(prop.c_str());

    if (pi != nullptr)
        __system_property_update(pi, value.c_str(), value.size());
    else
        __system_property_add(prop.c_str(), prop.size(), value.c_str(), value.size());
}

void vendor_load_properties()
{
    string partitions[] = {"", "vendor.", "odm."};
    for (const string &part : partitions)
    {
        property_override("ro.product." + part + "brand", "Xiaomi");
        property_override("ro.product." + part + "manufacturer", "Xiaomi");
        property_override("ro.product." + part + "device", "water");
        property_override("ro.product." + part + "name", "water");
        property_override("ro.product." + part + "model", "Redmi A2");
        property_override("ro.product." + part + "marketname", "Redmi A2");
    }

    // Fingerprint (matches BoardConfig + twrp_water.mk)
    property_override("ro.build.fingerprint",
        "Redmi/water_global/water:12/SP1A.210812.016/V14.0.11.0.TGOMIXM:user/release-keys");
    property_override("ro.bootimage.build.date.utc", "1676018595");
    property_override("ro.build.date.utc", "1676018595");
}
