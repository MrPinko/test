{...}: {
  services.greetd = {
    enable = true;
    settings = rec {
      initial_session = {
        command = "Hyprland";
        user = "fede";
      };
      default_session = initial_session;
    };
  };
}
