USBIP를 실행하는 데 필요한 커널 모듈(usbip-core.ko, usbip-host.ko)가 포함되어 있습니다.
Hardkernel 제조사에서 제공하는 Ubuntu Mate 이미지에 포함된 커널에는 USB/IP 모듈이 비활성화되어 있습니다.
모듈을 활성화하려면 Hardkernel 제조사에서 제공하는 Odroid N2+ 공식 커널을 내려받아 해당 모듈을 활성화한 후 직접 빌드합니다. 빌드 후 생성된 모듈 파일(.ko)을 insmod, modinfo, depmod, modprobe 등의 명령어를 이용해 로드합니다.
APT에서 Linux 4.9.337을 위한 usbip/usbipd를 제공하지 않을 수 있습니다.
이러한 경우에도 Linux 4.9.337 커널을 내려받아 usbip를 직접 빌드하여 설치하면 됩니다.
LD_PATH에 관련한 오류가 발생하는 경우, 원래 공유 오브젝트가 있어야 할 디렉터리에 실제 공유 오브젝트가 존재하는 경로로 심볼릭 링크하여 사용하십시오.
