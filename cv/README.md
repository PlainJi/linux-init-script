1. `download_opencv.sh`
2. delete `#include "device_functions.h"` in `./modules/core/include/opencv2/core/cuda/functional.hpp`
3. `cmake_opencv.sh`
4. `make_opencv.sh`
5. cp link.sh to opencv/lib and execute it
6. done

Detailed build log please see build.log
