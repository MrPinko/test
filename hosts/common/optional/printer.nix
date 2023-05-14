{ pkgs, ...}:{
    services = {
        printing = {                            # Printing and drivers for hp
            enable = true;
            drivers = [ pkgs.hplip ];
        };
    };
}