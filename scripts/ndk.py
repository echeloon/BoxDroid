"""Locate the Android NDK and its host tools on macOS and Linux hosts.

Resolution order: ANDROID_NDK_HOME, ANDROID_NDK_ROOT, then the ndk/ directory
of ANDROID_HOME, ANDROID_SDK_ROOT or the platform's default SDK location. In an
SDK ndk/ directory the version pinned by the Android build is preferred, since
the vcpkg dependencies are built with it; otherwise the newest is used.
"""

import os
from pathlib import Path
import platform
import re

PINNED_VERSION = '30.0.16248370'


class NdkNotFoundError(RuntimeError):
    pass


def get_host_tag():
    system = platform.system()
    if system == 'Darwin':
        # NDK macOS prebuilts are universal binaries despite the x86_64 tag.
        return 'darwin-x86_64'
    if system == 'Linux':
        if platform.machine() not in ('x86_64', 'AMD64'):
            raise NdkNotFoundError(
                f'unsupported Linux host architecture {platform.machine()}: '
                'the Android NDK requires x86_64')
        return 'linux-x86_64'
    raise NdkNotFoundError(f'unsupported host OS {system}: use macOS or Linux')


def _sdk_candidates():
    for name in ('ANDROID_HOME', 'ANDROID_SDK_ROOT'):
        if os.environ.get(name):
            yield Path(os.environ[name])
    if platform.system() == 'Darwin':
        yield Path.home() / 'Library/Android/sdk'
    else:
        yield Path.home() / 'Android/Sdk'


def _version_key(path):
    return tuple(int(part) for part in re.findall(r'\d+', path.name))


def get_ndk_path():
    for name in ('ANDROID_NDK_HOME', 'ANDROID_NDK_ROOT'):
        if os.environ.get(name):
            ndk = Path(os.environ[name])
            if not ndk.is_dir():
                raise NdkNotFoundError(f'{name}={ndk} is not a directory')
            return ndk
    for sdk in _sdk_candidates():
        root = sdk / 'ndk'
        if (root / PINNED_VERSION).is_dir():
            return root / PINNED_VERSION
        installed = sorted((path for path in root.glob('*') if path.is_dir()),
                           key=_version_key) if root.is_dir() else []
        if installed:
            return installed[-1]
    raise NdkNotFoundError(
        'Android NDK not found: set ANDROID_NDK_HOME or install one under '
        '$ANDROID_HOME/ndk')


def get_llvm_bin(ndk=None):
    return (ndk or get_ndk_path()) / 'toolchains/llvm/prebuilt' / get_host_tag() / 'bin'


def get_tool(tool_name, ndk=None):
    """Return an NDK LLVM tool, e.g. 'llvm-nm' or 'aarch64-linux-android33-clang'."""
    tool = get_llvm_bin(ndk) / tool_name
    if not tool.exists():
        raise NdkNotFoundError(f'{tool_name} not found in {tool.parent}')
    return tool


def get_simpleperf(ndk=None):
    """Return the host simpleperf binary shipped with the NDK."""
    system = {'darwin-x86_64': 'darwin', 'linux-x86_64': 'linux'}[get_host_tag()]
    return (ndk or get_ndk_path()) / 'simpleperf/bin' / system / 'x86_64/simpleperf'
