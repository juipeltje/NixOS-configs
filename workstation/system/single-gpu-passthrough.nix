# NixOS workstation single gpu passthrough configuration

{ config, pkgs, ... }:

# qemu hook script for single gpu passthrough gaming vm.
let
  gaming_vm_hook = pkgs.writers.writeBash "gaming-vm-hook" ''
    # Variables
    GUEST_NAME="$1"
    OPERATION="$2"
    SUB_OPERATION="$3"

    # Run commands when the vm is started/stopped.
    if [ "$GUEST_NAME" == "win10-gaming" ] then
      if [ "$OPERATION" == "start" ] then
        # Stop display manager
        systemctl stop greetd

        # Avoid race condition
        sleep 4
        
        # Detach GPU devices from host.
        virsh nodedev-detach pci_0000_0b_00_0
        virsh nodedev-detach pci_0000_0b_00_1
        virsh nodedev-detach pci_0000_0b_00_2
        virsh nodedev-detach pci_0000_0b_00_3

        # Unload AMD kernel module.
        modprobe -r amdgpu

        # Load vfio module.
        modprobe vfio-pci
      fi

      if [ "$OPERATION" == "stopped" ] then
        # Attach GPU devices to host.
        virsh nodedev-reattach pci_0000_0b_00_0
        virsh nodedev-reattach pci_0000_0b_00_1
        virsh nodedev-reattach pci_0000_0b_00_2
        virsh nodedev-reattach pci_0000_0b_00_3

        # Unload vfio module.
        modprobe -r vfio-pci

        # Load AMD kernel module.
        modprobe amdgpu

        # Start display manager.
        systemctl start greetd
      fi
    fi
  '';
in

{

  virtualisation.libvirtd.hooks.qemu = {
    gaming_vm_hook = "${gaming_vm_hook}";
  };
}  
   
