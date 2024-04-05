#!/usr/bin/env bash

# USB 3.1 Only
# for port in $(lspci | grep xHCI | cut -d' ' -f1); do
#     echo -n "0000:${port}"| sudo tee /sys/bus/pci/drivers/xhci_hcd/unbind;
#     sleep 5;
#     echo -n "0000:${port}" | sudo tee /sys/bus/pci/drivers/xhci_hcd/bind;
#     sleep 5;
# done

# All USB
for port in $(lspci | grep USB | cut -d' ' -f1); do
	echo "Resetting All USB.."
    echo -n "0000:${port}"| sudo tee /sys/bus/pci/drivers/xhci_hcd/unbind;
    sleep 5;
    echo -n "0000:${port}" | sudo tee /sys/bus/pci/drivers/xhci_hcd/bind;
    sleep 5;
done
