1. `./download.sh` source code will download into `/root/compile_opencv/`
2. `cd /root/compile_opencv/opencv-3.3.1/modules/core/include/opencv2/core/cuda/functional.hpp` and delete `#include "device_functions.h"`
3. `./cmake.sh`
4. `./make.sh`
5. `cp link.sh /root/compile_opencv/install/lib;cd /root/compile_opencv/install/lib;./link.sh`
6. edit tspkg.yaml and `./mk_tspkg.sh`
7. now you can publish it in `/root/compile_opencv/install`

Detailed build log please see build.log
