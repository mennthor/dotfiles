# Configuration file for ipython.

#------------------------------------------------------------------------------
# InteractiveShellApp(Configurable) configuration
#------------------------------------------------------------------------------

## lines of code to run at IPython startup.
c.InteractiveShellApp.exec_lines = [
    "from __future__ import print_function, division",
    "import numpy as np",
    "import matplotlib.pyplot as plt",
    "import scipy.stats as scs"
]
