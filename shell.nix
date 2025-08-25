let
    pkgs = import <nixpkgs> {};
in
    pkgs.mkShell {
        nativeBuildInputs = with pkgs; [
            glfw
            glfw3
            wayland
            odin
        ];

        LD_LIBRARY_PATH = with pkgs; lib.makeLibraryPath [
            libGL
            xorg.libXrandr
            xorg.libXinerama
            xorg.libXcursor
            xorg.libXi
            xorg.libX11
        ];
        LIBCLANG_PATH = "${pkgs.libclang.lib}/lib";
    }
