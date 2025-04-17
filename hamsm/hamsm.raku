sub simple-build 
{
  my $asm-file = first *.extension eq 'asm', dir();
  my $cpp-file = first *.extension eq 'cpp', dir();

  unless $asm-file && $cpp-file {
    die "--!> Error: Missing .asm or .cpp file in current directory $*CWD." 
  }

  my $base-name = $asm-file.basename.subst(/\.asm$/, '');

  # assemble 
  say "--- Assembling {$asm-file.basename} ...";
  run <ml64 /nologo /c /Zi /Cp>, $asm-file;

  # compile & link
  say "--- Compiling & linking {$cpp-file.basename} ...";
  run <cl /nologo /O2 /Zi /utf-8 /EHa>, "/Fe$base-name.exe", $cpp-file, "$base-name.obj";

  say "--) Build succeeded: $base-name.exe"; # todo assert base-name.exe is here
}

 # hamsm -s, --simple    (no other option for now)
sub MAIN(Bool :s(:$simple) = False) 
{
  if $simple {
    simple-build();
    return;
  }

  say "--!> Unknown option!";
}