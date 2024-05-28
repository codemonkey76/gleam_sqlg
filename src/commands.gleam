import constants
import gleam/io
import glint

pub fn init() -> glint.Command(Nil) {
  use <- glint.command_help("Create an empty sqlg.yaml settings file")
  use file <- glint.flag(file_flag())
  use _, _, flags <- glint.command()

  let assert Ok(file) = file(flags)
  io.println("Initialize: " <> file)
}

pub fn generate() -> glint.Command(Nil) {
  use <- glint.command_help("Generate source code from SQL")
  use file <- glint.flag(file_flag())
  use _, _, flags <- glint.command()

  let assert Ok(file) = file(flags)
  io.println("Generate: " <> file)
}

pub fn file_flag() -> glint.Flag(String) {
  glint.string_flag(constants.file)
  |> glint.flag_default("sqlg.yaml")
  |> glint.flag_help("Specify an alternate config file (default: sqlg.yaml)")
}
