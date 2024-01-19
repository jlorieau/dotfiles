from pathlib import Path
import os
import atexit
import readline

# Change python_history file the XDG cache path
history = Path(os.getenv("XDG_CACHE_HOME", Path.home() / ".cache")) / "python_history"
try:
    readline.read_history_file(history)
except OSError:
    pass

def write_history():
    try:
        readline.write_history_file(history)
    except OSError:
        pass

atexit.register(write_history)