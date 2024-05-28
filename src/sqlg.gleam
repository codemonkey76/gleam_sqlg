import commands
import glint

import argv

pub fn main() {
  glint.new()
  |> glint.with_name("sqlg")
  |> glint.pretty_help(glint.default_pretty_help())
  |> glint.add(at: ["init"], do: commands.init())
  |> glint.add(at: ["generate"], do: commands.generate())
  |> glint.run(argv.load().arguments)
}
