import os
import sysconfig
from importlib import resources
from typing import Optional

SUPPORTED_PLATFORMS = {
    "linux-x86_64": {"exe_suffix": ""},
    "win-amd64": {"exe_suffix": ".exe"},
}


def get_vendored_lrslib_path(prog: str) -> Optional[str]:
    platform_name: str = sysconfig.get_platform()

    if platform_name not in SUPPORTED_PLATFORMS:
        return None
    info = SUPPORTED_PLATFORMS[platform_name]
    exe_suffix = info["exe_suffix"]
    with resources.path("monodromy.vendor.lrslib.bin", f"{platform_name}") as p:
        if os.path.exists(p):
            return str(f"{p}/bin/{prog}{exe_suffix}")
    return None
