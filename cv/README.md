1. `./download.sh` source code will download into `/root/compile_opencv/`
2. `./cmake.sh`
3. `./make.sh`
4. `cp link.sh /root/compile_opencv/install/lib;cd /root/compile_opencv/install/lib;./link.sh`
5. edit tspkg.yaml and `./mk_tspkg.sh`
6. now you can publish it in `/root/compile_opencv/install`

Detailed build log please see build.log
