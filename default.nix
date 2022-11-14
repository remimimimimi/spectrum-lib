{ config }:

{
  vmLib = import ./vm.nix { inherit config; };
  hostLib = import ./host.nix { inherit config; };
}
