{
  lib,
  rustPlatform,
  fetchFromGitHub,
}:
rustPlatform.buildRustPackage rec {
  pname = "radix-clis";
  version = "1.3.0";

  src = fetchFromGitHub {
    owner = "radixdlt";
    repo = "radixdlt-scrypto";
    rev = "v${version}";
    hash = "sha256-vGnBItolSWknRWLc7HEaBDXHTG7zZ+o41aFPe+AZ0eI=";
  };

  cargoHash = "sha256-Ct5eKeb3xBrGPTp/lZtZy8lo90QP75J1f1W7pnG5B6M=";

  nativeBuildInputs = [ rustPlatform.bindgenHook ];
  cargoBuildFlags = "-p radix-clis";
  doCheck = false;

  meta = with lib; {
    description = "A collection of CLIs for developing, building and testing Scrypto code, from the Radix DLT project.";
    homepage = "https://www.radixdlt.com/";
    license = {
      fullName = "Radix Software EULA";
      url = "https://uploads-ssl.webflow.com/6053f7fca5bf627283b582c2/6511ce11128097a7e9690cc2_radixdlt.com_genericEULA.pdf";
    };
    maintainers = [ maintainers.neur-o-blast ];
    platforms = platforms.linux ++ platforms.darwin;
  };
}
