{ writeTextFile }:

writeTextFile {
  name = "wch.rules";
  destination = "/lib/udev/rules.d/50-wch.rules";
  text = builtins.readFile ./50-wch.rules;
}
