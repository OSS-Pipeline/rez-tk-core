name = "tk_core"

version = "0.18.169"

authors = [
    "Autodesk"
]

description = \
    """
    The Shotgun Pipeline Toolkit Core API.
    """

requires = [
    "cmake-3+",
    "pip-19+",
    "python-2.7+<3"
]

variants = [
    ["platform-linux"]
]

build_system = "cmake"

with scope("config") as config:
    config.build_thread_count = "logical_cores"

uuid = "tk_core-{version}".format(version=str(version))

def commands():
    env.PYTHONPATH.prepend("{root}")
